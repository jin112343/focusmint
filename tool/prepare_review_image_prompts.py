#!/usr/bin/env python3
"""Prepare the second, user-directed content review. Makes no API requests."""
import argparse
import json
from collections import Counter
from pathlib import Path
from prepare_training_image_prompts import PEOPLE
from generate_training_images import EXPECTED, validate_jobs

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--output', type=Path, default=Path('StoreAssets/image-review/round2'))
ROOT = parser.parse_args().output
BASE = ('Photorealistic natural editorial photograph for a small square visual attention exercise tile. '
        'One clear subject or action fills 75 to 85 percent of the square; make it immediately recognizable at 150 pixels. '
        'Natural color and ordinary believable details, clean simple background, sharp relevant subject. '
        'No collage, frame, caption, logo, watermark, readable packaging, extreme wide shot or glamour advertising. ')
CHILDREN = [
    'Japanese girl aged 6', 'Japanese boy aged 7', 'East Asian girl aged 10',
    'East Asian boy aged 11', 'South Asian girl aged 8', 'South Asian boy aged 9',
    'Black girl aged 7', 'Black boy aged 10', 'European girl aged 9',
    'European boy aged 6', 'Latina girl aged 11', 'Latino boy aged 8',
]
COLORS = ['muted teal', 'plain gray', 'muted blue', 'soft beige']
JOBS = []
OPERATIONS = []


def add(group, index, scene, *, replace=False, tag=''):
    name = f'{group}_{index:02d}_v2.webp'
    prompt = BASE + scene
    master_name = 'sad_25_adult_v2.webp' if group == 'sad' and index == 25 else name
    job = {**EXPECTED, 'id': f'{group}_{index:02d}', 'group': group,
           'out': master_name, 'prompt': prompt}
    JOBS.append(job)
    OPERATIONS.append({'filename': name, 'action': 'replace' if replace else 'add',
                       'group': group, 'topic': tag, 'scene': scene, 'masterFilename': master_name})


# Add children on both emotional sides so age is not a shortcut for the answer.
for i, child in enumerate(CHILDREN):
    gesture = [
        'laughing with an open joyful smile, eyes crinkling and cheeks raised',
        'beaming with a natural delighted grin while giving one small celebratory fist pump',
        'giggling with a broad happy smile and one relaxed hand near the chest',
    ][i % 3]
    add('smile', 31+i,
        f'A fictional {child} in an ordinary {COLORS[i % 4]} T-shirt, {gesture}. '
        'Tight head-and-shoulders photo, entire head and both eyes visible, face fills 60 percent. '
        'Neutral warm-gray wall, soft natural light, ordinary fully clothed child, no distress, no posed fashion.',
        tag='child-joy')

expressions = [
    ('anger', 24, 6,
     ['visibly very angry: eyebrows deeply pulled down, narrowed eyes, open mouth in a frustrated shout, one clenched fist near their own shoulder',
      'visibly furious: deeply furrowed brow, tense jaw and bared clenched teeth, face turned slightly, one hand gripping their own sleeve',
      'strongly angry and exasperated: brows drawn together, mouth open in protest, both palms raised beside shoulders']),
    ('crying', 24, 0,
     ['openly sobbing with clear tears running down both cheeks, wet eyelashes, downturned open mouth, one tissue near the cheek',
      'crying intensely with visible tears and trembling downturned lips, one hand wiping a tear without covering either eye',
      'tearful and visibly upset, tears on the cheeks and a sobbing expression, brows raised toward the center and mouth corners pulled down']),
    ('rumination', 16, 8,
     ['deeply troubled and overthinking: tightly knitted brow, lowered gaze and one hand pressing their own temple, tense unsmiling mouth',
      'visibly anxious and lost in worried thoughts, hands gently clasped under the chin, furrowed eyebrows and compressed lips',
      'brooding with frustration, head resting on one hand, visibly furrowed brow and deeply downturned mouth']),
    ('spaced-out', 8, 4,
     ['staring blankly past the camera with an unfocused gaze, slack unsmiling mouth and cheek resting heavily in one palm',
      'visibly bored and mentally disengaged, chin on a hand, distant half-lidded eyes and loose downturned mouth']),
]
index = 1
for tag, count, child_count, poses in expressions:
    for i in range(count):
        is_child = i < child_count
        person = CHILDREN[(index-1) % 12] if is_child else PEOPLE[(index-1) % len(PEOPLE)]
        scene = (f'A fictional {person} wearing an ordinary {COLORS[index % 4]} top, '
                 f'{poses[i % len(poses)]}. Tight head-and-shoulders portrait, entire head visible with an 8 percent margin. '
                 'The face and expressive hands dominate the image; both eyes and mouth unobstructed. '
                 'Neutral warm-gray background and soft daylight. Candid acted expression, realistic facial anatomy. '
                 'No other person, threat, violence, injury, bruises, abuse, disaster, self-harm or tragic backstory. '
                 'A fictional everyday emotional expression only; no illness diagnosis.')
        add('sad', index, scene, replace=True, tag=('child-' if is_child else 'adult-')+tag)
        index += 1

foods = [
    ('fish', 'a cooked salmon fillet with visible pink flakes and broccoli on a plain plate'),
    ('fish', 'a grilled mackerel fillet with silver skin and lemon on a plain plate'),
    ('fish', 'three small cooked sardines with a side of sliced tomato on a plain plate'),
    ('fish', 'a steamed white fish fillet with green vegetables on a plain plate'),
    ('fish', 'a grilled trout fillet beside leafy greens on a small plate'),
    ('fish', 'a plain bowl of salmon, brown rice and steamed greens, fish clearly dominant'),
    ('fish', 'a grilled tuna steak cut into thick slices beside fresh vegetables'),
    ('fish', 'a portion of cooked cod with peas and carrots, no batter or creamy sauce'),
    ('nuts', 'a small ceramic bowl of raw unsalted almonds, distinctive almond shapes visible'),
    ('nuts', 'a small bowl of unsalted walnut halves with deeply textured shapes visible'),
    ('nuts', 'a small bowl of uncoated cashews with curved crescent shapes'),
    ('nuts', 'a small bowl of pistachios in open beige shells, green nuts visible'),
    ('nuts', 'a small bowl of unsalted mixed almonds, walnuts and cashews, no candy or coating'),
    ('nuts', 'a small bowl of plain hazelnuts, some split to show the white interior'),
    ('nuts', 'a small bowl of plain pecan halves, no sugar glaze'),
    ('nuts', 'a plain bowl with pumpkin seeds and sunflower kernels, no coating'),
    ('fruit', 'fresh apple wedges with red skin on a small plain plate'),
    ('fruit', 'a peeled orange broken into bright recognizable segments'),
    ('fruit', 'fresh blueberries and raspberries in a small white bowl, no cream'),
    ('fruit', 'two sliced kiwi fruits showing the green centers and black seeds'),
    ('fruit', 'fresh strawberries with green leaves in a small bowl, no sugar or cream'),
    ('fruit', 'a small bunch of purple grapes with a few green leaves'),
    ('fruit', 'a ripe banana partly peeled beside two fresh whole bananas'),
    ('fruit', 'fresh watermelon wedges showing red flesh and green rind'),
    ('fruit', 'fresh mango cubes beside one clearly visible mango half'),
    ('fruit', 'a small fruit bowl containing plain orange, apple, kiwi and berries'),
    ('whole-food', 'a bowl of cooked edamame pods, some opened to show the beans'),
    ('whole-food', 'plain tofu cubes beside steamed spinach and mushrooms on a small plate'),
    ('whole-food', 'a bowl of lentils with visible tomato and spinach, no cream'),
    ('whole-food', 'a plain bowl of oatmeal with fresh blueberries and a few walnut halves, no syrup'),
    ('whole-food', 'a bowl of chickpeas with cucumber and tomato, no fried coating'),
    ('whole-food', 'a balanced small plate of brown rice, grilled fish and steamed mixed vegetables'),
]
for i, (tag, food) in enumerate(foods, 17):
    add('vegetables', i, f'Close food photograph of {food}. '
        'Three-quarter top-down view, the food fills 80 percent of the frame, simple light table. '
        'Recognizable natural ingredients, no supplement, health slogan, nutritional promise, raw meat or garnish clutter.', tag=tag)

# Keep clearly recognizable existing activities; refresh repetitive distant shots.
KEEP_HEALTH = {4, 6, 7, 10, 12, 13, 15, 16, 19, 20, 24, 27, 31, 37}
activities = [
    'Close-up of a fully clothed adult performing a dumbbell biceps curl at the raised phase, bent elbow, forearm and one black dumbbell fill the image, safe gym background',
    'Close side view of an adult lifting one dumbbell for a shoulder press, forearm and weight raised above shoulder, fitted ordinary T-shirt visible, realistic hands',
    'Close-up of an adult doing a two-handed kettlebell deadlift from the floor, knees bent and hands securely gripping the handle, functional gym clothes',
    'Close-up side view of a resistance band being pulled apart by a fully clothed adult, hands and stretched band at chest height dominate',
    'Close view of an adult seated on a rowing exercise machine pulling the handle toward the torso, bent elbows and taut cable clearly visible',
    'Close side view of an adult pushing up from the floor in a push-up, straight aligned upper body, hands and bent elbows clearly visible',
    'Close side view of an adult doing a bodyweight squat, hips lowered and knees bent, hands forward, simple uncluttered exercise space',
    'Close view of an adult stepping up onto a sturdy low exercise platform, raised bent knee and planted shoe clearly visible',
    'Close view of an adult pulling a cable machine handle downward toward the upper chest, bent elbows and handle dominate, realistic safe posture',
    'Close view of an adult doing an alternating forward lunge, bent front knee and balanced torso, plain exercise studio',
    'An adult skipping rope mid-jump, rope arc and shoes lifted clearly visible, torso and legs fill the image',
    'Side view of an adult jogging, bent elbows and one knee driving forward, cropped close enough to see the running action',
    'Close side view of an adult power-walking briskly, one foot forward and arms swinging, person fills the frame',
    'Close-up of an adult cyclist actively pedaling a bicycle, hands on handlebars, bent leg and crank visible, helmet included if head visible',
    'Close view of a fully clothed adult pulling on a rowing-boat oar on calm water, bent arms and oar grip dominate, life jacket visible',
    'Close view of an adult paddling a kayak on calm water, paddle raised across the frame, adult wearing a life jacket',
    'An adult swimmer doing a freestyle stroke in a pool, goggles and extended arm cutting through the water, close athletic crop, no sexualized framing',
    'Close view of an adult hitting a tennis ball with a racket, bent elbow and forward swing clearly visible, racket within frame',
    'Close view of an adult swinging a badminton racket toward a shuttlecock, arm and racket dominate, ordinary sports clothes',
    'An adult taking a basketball shot, raised arms and ball above the forehead, upper body and ball fill the frame',
    'Close view of an adult passing a volleyball with joined forearms, knees slightly bent, ball just above hands',
    'Close view of an adult kicking a football on grass, planted leg, swinging foot and ball dominate, action clear',
    'Close view of an adult practicing a dance step with one arm raised and one foot stepping sideways, ordinary workout clothes',
    'An adult doing a side stretch with one arm arcing overhead, close waist-up view and clearly curved torso',
    'Close view of an adult doing a standing calf raise on a low sturdy step, heels lifted, lower legs and shoes dominate',
    'Close view of an adult practicing tai chi, both hands extended in a slow balanced posture, relaxed engaged face visible',
    'Two adult friends giving a clear cheerful high-five after a walk, hands meeting near the center, candid chest-up view',
    'Two adult friends smiling warmly while talking face-to-face over a park bench, visible engaged eye contact and natural conversational hand gestures',
    'An adult and an older adult smiling while walking together, cropped waist-up with arms swinging, clear social engagement',
    'Three fully clothed adult friends laughing together on a daytime park walk, shoulders and faces fill the image, no drinks or phones',
    'Two adults doing a partner stretch with extended arms and friendly focused faces, clear shared activity and safe posture',
    'Two adult friends playing table tennis, near player making a clear paddle stroke, paddle and ball visible in foreground',
    'An adult helping a friend plant seedlings in a raised garden bed, hands and seedlings dominate, warm interaction visible',
    'Two adults volunteering to collect litter in a sunny park, close view of gloved hands placing a wrapper into a reusable sack, engaged friendly faces',
    'An adult walking a dog briskly, leash hand, moving legs and dog in stride dominate, simple park path',
    'Close view of a fully clothed adult reaching for a climbing hold on a low indoor bouldering wall, one bent arm and grip clear, padded floor and no dangerous height',
    'Two adult friends playing a cooperative board puzzle and smiling in a bright room, hands assembling colorful geometric pieces, no money, cards, dice or gambling',
    'An adult tossing a flying disc to a friend in a sunny park, arm extended and disc in foreground, joyful movement',
    'Two adults sharing a warm hug in a daylight living room, chest-up composition with both faces partly visible and naturally smiling',
    'An adult doing a light hiking step onto a rock on a safe trail, close view of bent knee, walking pole and sturdy hiking shoe, no cliff',
]
health_indices = [i for i in range(1,42) if i not in KEEP_HEALTH] + list(range(42,55))
assert len(activities) == len(health_indices) == 40
for i, scene in zip(health_indices, activities):
    add('health', i, scene + '. Clearly active movement, relevant body part and object large in frame. '
        'Fictional adults of varied ages and backgrounds, everyday clothing or modest sportswear, ordinary realistic bodies, no muscle glamour, no text.',
        replace=i<=41, tag='movement-or-social')

habits = []
for scene in [
    'a glass ashtray crowded with cigarette butts and gray ash, close-up on an ordinary table',
    'an adult hand holding a lit cigarette close to an ashtray, a thin smoke trail clearly visible',
    'a tired adult in an ordinary shirt exhaling cigarette smoke indoors, cigarette and mouth clearly visible, chest-up crop',
    'a crushed plain cigarette packet beside many cigarette butts and a used lighter, no lettering',
    'a close view of an adult hand stubbing a cigarette into a crowded ashtray',
    'a smoldering cigarette resting on the rim of a dirty ashtray with used filters, close object photo',
    'a close side view of a fully clothed adult holding a cigarette near the mouth, tired expression and visible smoke',
    'an adult hand holding a plain electronic cigarette, adult visible from chest upward with an unfocused tired expression',
    'a crowded ashtray beside an adult elbow on a table, cigarette butts occupy most of the image',
    'a close view of several used cigarette filters scattered beside gray ash and a plain lighter',
]: habits.append(('tobacco',scene))
for scene in [
    'three empty unbranded beer bottles and one half-full glass on a cluttered late-night table',
    'a close view of an adult hand pouring amber liquor into a glass beside two empty plain bottles',
    'a tired adult slumped at a table beside several empty beer cans, face and cans visible in close view',
    'a close view of a near-empty wine bottle and two stained glasses on an untidy night-time table',
    'an adult hand tightly holding a glass of amber liquor, other empty glasses in the foreground',
    'several empty plain beer cans lying beside a half-full glass, no party or celebration',
    'a tired fully clothed adult rubbing a temple beside a bottle and several empty glasses, close crop',
    'a close-up of a glass of liquor being refilled beside already empty bottles on a dim ordinary table',
    'an adult sitting alone at a kitchen counter with many empty cans and a glass, visibly exhausted, no glamorous bar',
    'a close object photograph of multiple empty wine and beer bottles crowded together beside a tipped empty glass',
]: habits.append(('alcohol',scene))
for scene in [
    'an adult hand pushing a large stack of chips onto a roulette table, money and tense clenched other hand visible',
    'a close-up of poker chips and playing cards beside an adult hand gripping crumpled banknotes',
    'an adult leaning tensely toward a slot machine, close side crop of hand repeatedly pressing a button, no readable screen',
    'an adult hand placing chips onto a crowded casino betting layout, spent chips and folded cash dominate',
    'a close view of an adult hand reaching into an almost-empty wallet beside gambling chips and playing cards',
    'an adult seated tensely at a pachinko machine, hand gripping the control and shoulders hunched, no text or celebratory lights',
    'a roulette wheel and adult hand holding cash just above a gaming table, close view, subdued ordinary lighting',
    'an adult with an exhausted worried face holding playing cards beside a dwindling stack of chips, chest-up crop',
    'a close view of adult hands counting remaining banknotes next to scattered casino chips and face-down playing cards',
    'a tense adult staring at a slot machine in profile, hand on the control, no jackpot, no winning celebration, no readable display',
]: habits.append(('gambling',scene))
for i in range(16):
    person = PEOPLE[i % len(PEOPLE)]
    scene = [
        'lying awake in bed at night scrolling a smartphone held close to the face, cool screen light, visibly tired eyes and dark room',
        'hunched over a glowing smartphone in a dark room, close view of tired face, bent neck and both hands on the phone',
        'sitting at a cluttered desk late at night intensely staring at a glowing computer while holding a game controller, empty energy drink cans nearby, visibly exhausted',
        'ignoring an untouched meal while compulsively scrolling a phone at a dim table, close view of phone grip, tired face and cold plate',
        'rubbing a tired eye while still gripping a bright phone in bed, close face-and-hands composition, no readable screen',
        'slumped on a sofa under closed curtains during daytime, face lit by phone, hunched shoulders and tired unfocused gaze',
        'sitting too close to a bright laptop late at night with rounded shoulders, empty cups and dark window, exhausted expression',
        'holding a phone with both hands while a plain clock beside the bed shows late night without readable numerals, weary eyes and wrinkled bedding',
    ][i % 8]
    habits.append(('excessive-screen',f'a fictional {person}, fully clothed, {scene}'))
for scene in [
    'a tired adult sitting in a dark closed-curtain room during daytime, hunched over a smartphone with unused walking shoes near the chair',
    'a fully clothed adult slumped at a desk facing a bright monitor, several empty energy drink cans and an untouched meal dominate the close foreground',
    'a tired adult lying on a sofa in daytime watching a screen, hand holding a remote and snack wrappers nearby, curtains closed',
    'a close view of a hand reaching for a glowing phone under a blanket in a dark bedroom, tired adult face visible at the edge',
    'a tired adult sitting motionless with rounded shoulders in a dark room, phone held close to the eyes, bright daylight visible only through a thin curtain gap',
    'an adult hunched over a game controller on a sofa late at night, tired eyes, multiple empty drink cans and a dark window, no branded game',
    'a tired adult at a cluttered computer desk during daylight with curtains kept closed, untouched food and glowing screen close to face',
    'a fully clothed adult resting a head on one hand beside a phone and several empty caffeine drink cans at a late-night desk, visibly sleep-deprived',
]: habits.append(('sleep-and-inactivity',scene))
assert len(habits) == 54
for i,(tag,scene) in enumerate(habits,1):
    add('bad',i,'Close editorial photo of '+scene+'. '
        'Show the observable behavior or objects clearly, with the main cue filling the square. '
        'Only adults aged 25 or older if people are visible. No child, brand, readable text, glamor, promotional style, nudity, violence, illness label or diagnosis. '
        'No claim that solitude or a person is bad; the subject is excessive consumption, sleep loss or a repeated burdening habit.',
        replace=i<=43,tag=tag)

junk = [
    'a large plain takeaway cup overflowing with bright orange soda, fizzy bubbles and a straw beside a plain fast-food wrapper',
    'an opened unbranded foil snack bag spilling intensely orange cheese puffs onto a plain table',
    'a bowl of brightly colored hard candies and gummy sweets, clearly manufactured candy shapes',
    'a plain packet opened to reveal brightly colored sugar-coated breakfast cereal, no milk or fruit',
    'a large double cheeseburger with thick cheese sauce, bacon and a mound of fries in a plain takeaway tray',
    'a plain takeaway box full of fried chicken nuggets and a tub of bright cheese dip',
    'a tall ice-cream sundae with thick chocolate sauce, candy pieces and whipped cream, no fresh fruit',
    'several cream-filled chocolate sandwich biscuits beside an opened plain plastic wrapper',
    'an oversized donut with vivid pink icing and thick colorful sugar sprinkles',
    'a portion of loaded fries covered in cheese sauce and chopped processed sausage in a takeaway tray',
    'an opened plain instant noodle cup with recognizable curled instant noodles and powder seasoning packets nearby',
    'three plain unbranded energy drink cans beside a glass of bright fizzy liquid, no health or sports styling',
    'a deep-fried corn dog covered in sauce beside french fries in a plain paper tray',
    'a thick slice of heavily iced chocolate cake with chocolate candy chunks on top',
    'an open plain package containing several chocolate-covered wafer bars, one snapped to reveal crisp layers',
    'a mound of bright red and blue gummy candy strips coated in sugar in a small bowl',
    'an unbranded packet of potato crisps spilling onto a table beside a large fizzy cola in a plain cup',
    'a plain takeaway pizza box showing a thick pepperoni-and-extra-cheese slice, no branding',
    'a white paper tub filled with caramel popcorn and candy-coated pieces',
    'a packaged cream-filled sweet bun broken open to show thick artificial-looking pink frosting filling, plain packaging',
    'a bowl of bright multicolored jelly beans beside a plain crinkled candy bag',
    'a large plain takeaway cup of cola beside a cheeseburger and fries, all subjects large and recognizable',
]
replace_junk = [15,20,26,28,32,50,54,55,58,59,64,66,82,87]
junk_indices = replace_junk + list(range(90,98))
assert len(junk) == len(junk_indices) == 22
for i,scene in zip(junk_indices,junk):
    add('badfood',i,'Close food photograph of '+scene+'. '
        'Food fills 80 percent of the frame on a simple light table. Clearly recognizable snack or fast food. '
        'Do not invent an ingredient list, additive quantity, health diagnosis or readable label. No people, logos, chemicals, supplements or poisoning imagery.',
        replace=i<=89,tag='junk-snack-or-drink')

# Representative sample first: enough to assess all six classes before the full run.
sample_names = ['smile_31_v2.webp','sad_01_v2.webp','sad_25_adult_v2.webp','sad_49_v2.webp',
                'vegetables_17_v2.webp','vegetables_25_v2.webp','vegetables_33_v2.webp',
                'health_01_v2.webp','health_33_v2.webp','bad_01_v2.webp','bad_11_v2.webp','badfood_15_v2.webp']
by_name={j['out']:j for j in JOBS}
ordered=[by_name[n] for n in sample_names]+[j for j in JOBS if j['out'] not in sample_names]
validate_jobs(ordered)
assert len(ordered)==232
ROOT.mkdir(parents=True,exist_ok=True)
(ROOT/'jobs.jsonl').write_text(''.join(json.dumps(j)+'\n' for j in ordered))
plan={'originalImages':291,'newGeneratedImages':len(ordered),
      'actions':dict(Counter(o['action'] for o in OPERATIONS)),
      'finalGroupCounts':{'smile':42,'sad':72,'vegetables':48,'badfood':97,'health':54,'bad':54},
      'keepHealthIndices':sorted(KEEP_HEALTH),'operations':OPERATIONS,
      'reference':'Mood Mint: positive selection among four photos; reference structure and readability, original photographs generated separately.',
      'referenceURL':'https://www.iculture.nl/apps/mood-mint-app-review-stemming/',
      'notes':['Children appear on both emotional sides.','Neutral/background cues are not the answer.','Ingredients and addiction cannot be diagnosed from a photo.','Main subject/action must remain clear in a small tile.']}
(ROOT/'plan.json').write_text(json.dumps(plan,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:v for k,v in plan.items() if k not in ('operations','notes')},ensure_ascii=False))
