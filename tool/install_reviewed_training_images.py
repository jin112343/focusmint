#!/usr/bin/env python3
"""Stage and install only reviewed image masters, keeping stable preference IDs."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
from collections import Counter
from PIL import Image
from optimize_training_images import optimize


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--masters',type=Path,required=True)
    parser.add_argument('--approval',type=Path,required=True)
    parser.add_argument('--stage',type=Path,required=True)
    parser.add_argument('--report',type=Path,required=True)
    args=parser.parse_args()
    root=Path('assets/images')
    plan=json.loads(Path('StoreAssets/image-review/round2/plan.json').read_text())
    approval=json.loads(args.approval.read_text())
    if approval.get('visuallyReviewed') is not True:
        raise ValueError('Explicit visual review is required before installation.')
    if args.stage.exists() and any(args.stage.iterdir()):
        raise ValueError('Staging folder must be empty.')
    args.stage.mkdir(parents=True,exist_ok=True)
    for p in root.glob('*.webp'):
        shutil.copyfile(p,args.stage/p.name)
    replaced=[]
    for op in plan['operations']:
        target=op['filename']
        source_name=approval.get('overrides',{}).get(target,op.get('masterFilename',target))
        if Path(source_name).name!=source_name:
            raise ValueError('Master filenames must not traverse directories.')
        source=args.masters/source_name
        if approval['approvedMasters'].get(source_name)!=sha(source):
            raise ValueError('Unreviewed or changed master: '+source_name)
        optimize(source,args.stage/target,512,88)
        replaced.append({'filename':target,'master':source_name,'action':op['action'],
                         'topic':op['topic'],'sourceSha256':sha(source)})
    counts=Counter(p.name.split('_')[0] for p in args.stage.glob('*.webp'))
    if dict(counts)!=plan['finalGroupCounts']:
        raise ValueError('Final catalog differs from the reviewed plan: '+str(counts))
    rows=[]
    for p in sorted(args.stage.glob('*.webp')):
        with Image.open(p) as im:
            im.load()
            if im.size!=(512,512) or im.format!='WEBP':
                raise ValueError('Invalid image format or dimensions: '+p.name)
        rows.append({'filename':p.name,'bytes':p.stat().st_size,'sha256':sha(p)})
    if len({r['sha256'] for r in rows})!=len(rows):
        raise ValueError('Exact duplicate images in the final catalog.')
    for p in args.stage.glob('*.webp'):
        shutil.copyfile(p,root/p.name)
    # Keep all existing file identities; hidden-image settings still point to the
    # same names even when the source photograph has been revised.
    catalog=Path('lib/constants/placeholder_images.dart')
    text=catalog.read_text()
    for field,groups in [('positiveImages',['smile','health','vegetables']),
                         ('negativeImages',['sad','badfood','bad'])]:
        import re
        names=[f'{g}_{i:02d}_v2.webp' for g in groups
               for i in range(1,plan['finalGroupCounts'][g]+1)]
        block='static const List<String> '+field+' = [\n'+''.join("    '"+n+"',\n" for n in names)+'  ];'
        text,n=re.subn(r'static const List<String> '+field+r' = \[.*?\n  \];',block,text,flags=re.S)
        if n!=1:raise ValueError('Catalog declaration missing: '+field)
    text=text.replace('ポジティブな画像（笑顔、健康、野菜）','ポジティブな画像（笑顔、運動・交流、栄養のある食事）')
    catalog.write_text(text)
    report={'count':len(rows),'bytes':sum(r['bytes'] for r in rows),'groups':dict(counts),
            'replacements':replaced,'images':rows,'visuallyReviewed':True,
            'format':'512x512 sRGB WebP quality 88'}
    args.report.parent.mkdir(parents=True,exist_ok=True)
    args.report.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k not in ('replacements','images')},ensure_ascii=False))


if __name__=='__main__':main()
