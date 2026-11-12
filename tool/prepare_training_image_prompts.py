#!/usr/bin/env python3
"""Write one distinct generation job per existing training-image slot (no API calls)."""
import argparse
import json
from pathlib import Path

PEOPLE = [
    'Japanese woman aged 28, straight black shoulder-length hair',
    'Japanese man aged 36, short black hair',
    'Korean woman aged 44, short dark bob',
    'Chinese man aged 55, short salt-and-pepper hair',
    'South Asian woman aged 32, wavy dark hair',
    'South Asian man aged 48, short dark hair and neatly trimmed beard',
    'Black woman aged 38, natural short curls',
    'Black man aged 27, close-cropped hair',
    'White woman aged 52, auburn shoulder-length hair',
    'White man aged 41, short brown hair',
    'Latina woman aged 34, curly dark hair',
    'Latino man aged 59, short grey hair',
    'Southeast Asian woman aged 46, dark hair tied back',
    'Southeast Asian man aged 30, short dark hair',
    'Middle Eastern woman aged 29, wavy brown hair',
    'Middle Eastern man aged 51, short dark hair with grey temples',
    'White woman aged 67, short silver hair',
    'Black man aged 64, short grey hair',
]
COLORS = ['muted teal', 'soft blue', 'warm grey', 'dusty rose', 'olive', 'sand']
BACKDROPS = ['warm grey', 'pale beige', 'soft grey-green', 'light stone']
BASE = (
    'Use case: photorealistic-natural. Asset: one square mobile visual-search training photograph. '
    'Create a single coherent realistic photograph, never a collage or a contact sheet. '
    'Use soft even daylight, balanced midtone exposure, natural colors, realistic proportions and a clean unobtrusive background. '
    'Keep the main subject centered with generous safe margins on every edge; it must read clearly as a small square thumbnail. '
    'No text, letters, numbers, logos, labels, recognizable brands, frames, watermarks or graphic symbols. '
)
ACTIVITIES = [
    'walking briskly along a leafy park path',
    'stretching both arms gently beside a park bench',
    'jogging at an easy pace on a wide park trail',
    'riding a city bicycle slowly on an empty cycle path, wearing a helmet',
    'walking at an easy pace in a sunny green park',
    'practicing a simple standing yoga tree pose on a mat',
    'watering small plants in a home garden with a watering can',
    'doing a gentle standing calf stretch beside a tree',
    'taking a relaxed walk by a calm lake',
    'doing a gentle standing side stretch in a bright room',
    'taking a day hike on a gentle woodland path with a small backpack',
    'practicing a slow tai chi stance in a quiet park',
    'walking up a short gentle outdoor staircase with a handrail',
    'standing on one leg during a simple balance exercise beside a chair',
    'doing a shallow bodyweight squat on a mat',
    'walking a small dog on a leash along a green path',
    'performing a gentle wall push-up in a bright room',
    'raking a small patch of fallen leaves in a garden',
    'doing a seated hamstring stretch on a park bench',
    'playing casual badminton on an empty outdoor court, holding one racket',
    'taking a relaxed beach walk on firm sand',
    'practicing a gentle standing shoulder stretch in a garden',
    'walking along a quiet riverside path',
    'doing a simple seated yoga twist on a mat',
    'walking through a tree-lined neighborhood carrying a small reusable bag',
    'making a gentle overhead stretch on a lawn',
    'doing a light resistance-band row while standing upright',
    'walking on a flat forest boardwalk',
    'doing a gentle standing ankle mobility exercise beside a chair',
    'sweeping a garden path with a plain broom',
    'doing a simple seated forward stretch with knees softly bent on a mat',
    'walking beside a flower garden',
    'performing a gentle standing torso rotation in a bright room',
    'throwing a plain frisbee across an empty lawn',
    'doing a light standing biceps curl with small plain dumbbells',
    'walking on a gentle coastal path',
    'practicing a comfortable yoga warrior stance on a mat',
    'tending raised-bed garden plants while standing',
    'doing gentle marching steps on the spot in a bright room',
    'taking a leisurely walk along a shaded park trail',
    'stretching the chest gently with hands resting behind the back on a lawn',
]
STRAIN = [
    'slumped slightly at a desk after a long workday, looking tired',
    'rubbing one temple beside an open plain laptop, looking mildly stressed',
    'leaning on a kitchen counter with tired shoulders after a busy day',
    'sitting on a sofa with a phone resting in the lap, looking mentally tired',
    'pausing beside a pile of ordinary blank paperwork with a weary expression',
    'sitting at a desk with one hand resting on the forehead in mild frustration',
    'looking at a blank phone screen with tense shoulders',
    'standing beside a laundry basket looking mildly overwhelmed',
    'resting both elbows on a desk with a tired expression',
    'sitting at a dining table with a plain laptop, pausing with a worried brow',
    'looking mildly frustrated while searching a plain tote bag for keys',
    'sitting on a sofa after work with slumped shoulders and a weary gaze',
    'standing beside an untidy desk and looking uncertain about a task',
    'pausing while holding a stack of plain folders with a mildly burdened expression',
    'sitting at a desk while gently rubbing tired eyes with one hand',
    'taking a weary pause beside a plain laptop at a kitchen table',
    'looking mildly disappointed at a small pile of unsorted papers',
    'resting the chin in one hand beside a plain notebook, looking stuck',
    'standing at a home office doorway with a slightly worried expression',
    'sitting with rounded shoulders at a desk after an ordinary busy day',
    'looking weary while waiting beside a plain laundry basket',
    'looking mildly frustrated at tangled unbranded charging cables on a desk',
    'sitting at a table with an unfinished blank notebook and a tired brow',
    'gazing away from a plain laptop with a distracted, weary expression',
    'sitting on a sofa while holding a plain phone, brow mildly furrowed',
    'pausing with hands resting on a desk beside several blank folders',
    'standing beside a kitchen sink with lowered shoulders, looking tired',
    'sitting at a home office desk with one hand on the back of the neck',
    'looking mildly overwhelmed by a basket of unfolded clean clothes',
    'looking at a plain closed laptop with a disappointed expression',
    'resting the forehead briefly in one hand while seated at a table',
    'standing next to a small stack of plain cardboard boxes, looking weary',
    'sitting at a desk with a blank calendar page and a worried brow',
    'pausing with a tired expression beside a home office chair',
    'looking mildly frustrated at a plain printer with a single blank sheet',
    'sitting at a desk and looking away from a blank phone screen',
    'looking tired while sorting ordinary household papers at a table',
    'sitting on a sofa with hands loosely in the lap and a weary expression',
    'standing beside a cluttered entryway shelf looking mildly stressed',
    'looking worried about a task while holding a plain notebook',
    'resting both hands on a kitchen table with slightly slumped shoulders',
    'sitting beside a plain laptop and gently massaging one shoulder',
    'pausing at a desk with a softly furrowed brow and closed unbranded folders',
]
VEGETABLES = [
    'fresh broccoli florets arranged in a plain ceramic bowl',
    'sliced red tomatoes and cucumber on a plain white plate',
    'a colorful bowl of leafy green salad, red radish and cucumber, vegetables only',
    'steamed green asparagus on a plain ceramic plate',
    'fresh whole carrots with green tops on a clean wooden board',
    'sliced red and yellow bell peppers in a plain bowl',
    'steamed green beans on a plain white plate',
    'fresh spinach leaves loosely arranged in a plain bowl',
    'roasted orange pumpkin wedges on a plain ceramic plate',
    'sliced purple cabbage and green lettuce in a plain bowl',
    'fresh cherry tomatoes and sliced cucumber in a simple salad bowl',
    'steamed cauliflower florets on a plain plate',
    'a clear mixed vegetable bowl of broccoli, carrot and bell pepper',
    'fresh green peas and sliced zucchini in a plain bowl',
    'grilled eggplant and zucchini slices on a plain ceramic plate',
    'fresh lettuce, radish and yellow pepper in a simple vegetable salad',
]
FOODS = [
    'a slice of chocolate layer cake', 'two glazed ring doughnuts',
    'a bowl of golden potato chips', 'a plain cheeseburger', 'a portion of French fries',
    'three chocolate chip cookies', 'a slice of pepperoni pizza',
    'a bowl of vanilla ice cream with caramel sauce', 'a stack of frosted brownies',
    'a cinnamon roll with white icing', 'a hot dog with mustard in a bun',
    'a small bowl of colorful sugar candies', 'a strawberry cream cupcake',
    'a waffle topped with whipped cream and chocolate sauce', 'three fried chicken pieces',
    'a plate of cheesy nachos', 'a slice of strawberry cheesecake',
    'a chocolate croissant on a small plate', 'a bowl of caramel popcorn',
    'a sausage roll cut in half', 'a chocolate-coated ice cream bar on a plate',
    'a slice of apple pie with a scoop of ice cream', 'a sugar-dusted jam doughnut',
    'a bowl of cheese-flavored puff snacks', 'a cream-filled eclair',
    'a stack of pancakes with butter and syrup', 'a handful of wrapped-free chocolate truffles',
    'a fried chicken sandwich in a plain bun', 'a portion of onion rings',
    'two scoops of chocolate ice cream in a bowl', 'a slice of red velvet cake',
    'a raspberry-filled sweet pastry', 'a pretzel covered in cheese sauce',
    'a plate of crispy mozzarella sticks', 'a small pile of plain gummy candies',
    'a slice of caramel tart', 'a cream-filled profiterole trio',
    'a plain milkshake in a clear glass without a straw', 'a slice of margherita pizza',
    'a plain bacon cheeseburger', 'a bowl of sweet cereal loops without packaging',
    'a plate of chocolate-covered biscuits', 'a custard cream bun',
    'a strawberry ice cream cone resting in a plain holder', 'a plate of fried potato wedges',
    'a lemon meringue pie slice', 'a round chocolate-frosted doughnut',
    'a bowl of jelly beans', 'a plate of plain churros with chocolate dip',
    'a custard tart on a small plate', 'a stack of sandwich cream cookies',
    'a slice of deep-dish cheese pizza', 'a bowl of salted tortilla chips',
    'a plate of breaded fried shrimp', 'a sweet cream-filled crepe folded on a plate',
    'a small stack of caramel fudge squares', 'a slice of tiramisu',
    'a plain sausage in a soft white bun', 'a plate of battered fried fish pieces',
    'a slice of rich chocolate fudge cake', 'a bowl of marshmallows',
    'a chocolate-covered waffle on a plate', 'a scoop of cookies-and-cream ice cream',
    'a small plate of fried cheese balls', 'a vanilla-frosted cupcake with plain sprinkles',
    'a slice of banana cream pie', 'a bowl of salted corn puff snacks',
    'a sugar-coated twisted doughnut', 'a plate of fried chicken nuggets',
    'several pieces of unbranded milk chocolate on a plain plate',
    'a slice of caramel cheesecake', 'a plate of butter cookies',
    'a bowl of chocolate pudding with whipped cream', 'a plain double cheese pizza slice',
    'a plate of sweet glazed pastries', 'a scoop of salted caramel ice cream in a bowl',
    'a portion of loaded fries with cheese sauce', 'a plate of small cream puffs',
    'a slice of coconut cream cake', 'a bowl of brittle toffee pieces',
    'a cinnamon sugar soft pretzel', 'a plate of plain fried dumplings',
    'a sweet chocolate-filled bread roll', 'a small bowl of candy-coated chocolates without lettering',
    'a slice of baked custard pie', 'a plate of chocolate sandwich biscuits',
    'a slice of buttery pound cake with icing', 'a scoop of strawberry ice cream in a bowl',
    'a bowl of sweet caramel-coated cereal clusters',
]


def face(group, index):
    person = PEOPLE[index % len(PEOPLE)]
    shirt = COLORS[(index // len(PEOPLE) + index) % len(COLORS)]
    backdrop = BACKDROPS[(index // len(PEOPLE) + index) % len(BACKDROPS)]
    expression = (
        ['a clear warm relaxed smile with gently raised cheeks and friendly eyes',
         'a clear natural joyful smile showing a little teeth, eyes warmly engaged',
         'a clear friendly closed-mouth smile with visibly lifted mouth corners'][index % 3]
        if group == 'smile' else
        ['a clearly disappointed expression, downturned mouth and softly raised inner eyebrows',
         'a clearly worried expression, gently furrowed brow and closed unsmiling mouth',
         'a clearly frustrated expression, lightly knitted brows and pressed unsmiling lips',
         'a clearly sad expression, downturned mouth corners and slightly lowered gaze'][index % 4]
    )
    return (f'A fictional {person}, wearing a plain {shirt} top, against a {backdrop} studio backdrop. '
            f'The subject has {expression}. Eye-level head-and-shoulders portrait, face front-facing or very slightly turned. '
            'The entire head including hair and chin is visible with an 8 percent margin, both eyes clear, hands outside the frame. '
            'Natural facial anatomy and skin texture, ordinary appearance. No sunglasses, hats, crying, tears, screaming, aggression or children.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, default=Path('StoreAssets/image-review/replacement-jobs.jsonl'))
    args = parser.parse_args()
    assert [len(ACTIVITIES), len(STRAIN), len(VEGETABLES), len(FOODS)] == [41, 43, 16, 89]
    jobs = []
    for group, count in [('smile', 30), ('sad', 72), ('health', 41), ('bad', 43), ('vegetables', 16), ('badfood', 89)]:
        for index in range(count):
            if group in ('smile', 'sad'):
                scene = face(group, index)
            elif group in ('health', 'bad'):
                person = PEOPLE[index % len(PEOPLE)]
                activity = (ACTIVITIES if group == 'health' else STRAIN)[index]
                framing = ('Entire body, head, hands and feet comfortably inside the frame with at least 8 percent safe margins. '
                           'Wear plain modest casual exercise clothes appropriate to the activity. '
                           'Comfortable ordinary movement, no body-shape emphasis or extreme exercise.' if group == 'health' else
                           'Waist-up environmental portrait, entire head and visible hands inside the frame with safe margins. '
                           'Mild ordinary daily stress only, no danger, injury, restraints, medicines, alcohol or smoking. '
                           'Any screens and paper are blank, no icons or writing.')
                scene = f'A fictional {person} {activity}. {framing}'
            else:
                subject = (VEGETABLES if group == 'vegetables' else FOODS)[index]
                surface = ['light neutral tabletop', 'pale wooden table', 'matte warm grey tabletop'][index % 3]
                scene = (f'Food-only photograph of {subject} on a {surface}. '
                         'Single serving, three-quarter overhead view, entire food and dish visible with at least 10 percent safe margins. '
                         'Food occupies around two thirds of the square. No people, hands, faces or packaging. ')
                if group == 'vegetables':
                    scene += 'Vegetables only, no fish, meat, eggs, bread or sweets. '
            jobs.append({
                'id': f'{group}_{index + 1:02}', 'group': group,
                'out': f'{group}_{index + 1:02}_v2.webp',
                'prompt': BASE + scene,
                'model': 'gpt-image-2', 'n': 1, 'size': '1024x1024',
                'quality': 'medium', 'output_format': 'webp', 'output_compression': 95,
            })
    assert len(jobs) == len({j['out'] for j in jobs}) == len({j['prompt'] for j in jobs}) == 291
    assert all(j['prompt'].isascii() and len(j['prompt']) <= 4096 for j in jobs)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(''.join(json.dumps(job, ensure_ascii=False) + '\n' for job in jobs))
    print(f'Prepared {len(jobs)} distinct image jobs at {args.out}; no API requests made.')


if __name__ == '__main__':
    main()
