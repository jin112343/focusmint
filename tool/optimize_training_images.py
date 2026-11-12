#!/usr/bin/env python3
"""Create square, bounded WebP assets without overwriting the source library."""
import argparse
import hashlib
import io
import json
from pathlib import Path

from PIL import Image, ImageCms, ImageOps


def optimize(source, destination, max_side, quality):
    with Image.open(source) as image:
        original_size = image.size
        image = ImageOps.exif_transpose(image)
        profile = image.info.get('icc_profile')
        if profile:
            image = ImageCms.profileToProfile(
                image, ImageCms.ImageCmsProfile(io.BytesIO(profile)),
                ImageCms.createProfile('sRGB'), outputMode='RGB')
        else:
            image = image.convert('RGBA' if 'A' in image.getbands() else 'RGB')
        side = min(max_side, *image.size)
        # Same centered square crop as the app's BoxFit.cover, without stretching.
        image = ImageOps.fit(image, (side, side), method=Image.Resampling.LANCZOS)
        image.save(destination, 'WEBP', quality=quality, method=6)
        with Image.open(destination) as checked:
            checked.load()
            assert checked.size == (side, side) and checked.format == 'WEBP'
    return original_size, side


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--replacements', type=Path)
    parser.add_argument('--report', type=Path, required=True)
    parser.add_argument('--max-side', type=int, default=512)
    parser.add_argument('--quality', type=int, default=88)
    args = parser.parse_args()
    if args.source.resolve() == args.output.resolve():
        parser.error('Use a separate output folder; keep the original files.')
    if args.output.exists() and any(args.output.iterdir()):
        parser.error('Output folder must be empty.')
    args.output.mkdir(parents=True, exist_ok=True)
    replacements = json.loads(args.replacements.read_text()) if args.replacements else {}
    rows = []
    for original in sorted(args.source.iterdir()):
        if original.suffix.lower() not in ('.jpg', '.jpeg', '.png', '.webp'):
            continue
        if original.stem == 'app_icon':
            continue
        replacement = replacements.get(original.name)
        source = Path(replacement['source']) if replacement else original
        filename = replacement['filename'] if replacement else original.stem + '.webp'
        destination = args.output / filename
        if destination.exists():
            raise ValueError('Duplicate output filename: ' + filename)
        original_size, side = optimize(source, destination, args.max_side, args.quality)
        with Image.open(original) as image:
            legacy_size = image.size
        rows.append({
            'original': original.name, 'filename': filename,
            'originalBytes': original.stat().st_size, 'bytes': destination.stat().st_size,
            'originalSize': legacy_size, 'inputSize': original_size, 'size': [side, side],
            'replaced': replacement is not None,
            'sha256': hashlib.sha256(destination.read_bytes()).hexdigest(),
        })
    report = {
        'maxSide': args.max_side, 'quality': args.quality, 'count': len(rows),
        'originalBytes': sum(row['originalBytes'] for row in rows),
        'bytes': sum(row['bytes'] for row in rows),
        'originalDecodedRgbaBytes': sum(row['originalSize'][0] * row['originalSize'][1] * 4 for row in rows),
        'decodedRgbaBytes': sum(row['size'][0] * row['size'][1] * 4 for row in rows),
        'images': rows,
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({k: v for k, v in report.items() if k != 'images'}, indent=2))


if __name__ == '__main__':
    main()
