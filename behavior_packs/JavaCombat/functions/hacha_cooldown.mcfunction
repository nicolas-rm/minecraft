#bridge-file-version: #60
event entity @a[scores={hacha=0}] axe_cooldown_event_off
event entity @a[scores={hacha=1}] axe_cooldown_event_on
event entity @a[scores={hacha=20..}] axe_cooldown_event_off
 
execute @a[tag=hacha,scores={hacha=0..6}] ~ ~ ~ tag @s remove v_1
execute @a[tag=hacha,scores={hacha=0..6}] ~ ~ ~ tag @s add v_0
 
tag @a[tag=hacha,scores={hacha=0..6}] add v_0
tag @a[tag=hacha,scores={hacha=10}] add v_1
tag @a[tag=hacha,scores={hacha=11}] add v_2
tag @a[tag=hacha,scores={hacha=12}] add v_3
tag @a[tag=hacha,scores={hacha=14}] add v_4
tag @a[tag=hacha,scores={hacha=15}] add v_5
tag @a[tag=hacha,scores={hacha=16}] add v_6
tag @a[tag=hacha,scores={hacha=17}] add v_7
tag @a[tag=hacha,scores={hacha=18}] add v_8
tag @a[tag=hacha,scores={hacha=20}] add v_9
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
titleraw @a[tag=hacha,scores={hacha=0..2}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=3}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=4}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=5}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=6..7}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=8}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=9}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=10}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=11..12}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=13}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=14}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=15}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=16..17}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=18}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=19}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=hacha,scores={hacha=20}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
 