#bridge-file-version: #87
 
 
 
 
event entity @a[scores={espada=0}] sword_cooldown_event_off
event entity @a[scores={espada=1}] sword_cooldown_event_on
event entity @a[scores={espada=12..}] sword_cooldown_event_off
 
 
 
 
 
execute @a[tag=espada,scores={espada=0..6}] ~ ~ ~ tag @s remove v_1
execute @a[tag=espada,scores={espada=0..6}] ~ ~ ~ tag @s add v_0
 
execute @a[tag=espada,scores={espada=7}] ~ ~ ~ tag @s add v_1
execute @a[tag=espada,scores={espada=8}] ~ ~ ~ tag @s add v_2
execute @a[tag=espada,scores={espada=9}] ~ ~ ~ tag @s add v_3
execute @a[tag=espada,scores={espada=9}] ~ ~ ~ tag @s add v_4
execute @a[tag=espada,scores={espada=9}] ~ ~ ~ tag @s add v_5
execute @a[tag=espada,scores={espada=10}] ~ ~ ~ tag @s add v_6
execute @a[tag=espada,scores={espada=11}] ~ ~ ~ tag @s add v_7
execute @a[tag=espada,scores={espada=11}] ~ ~ ~ tag @s add v_8
execute @a[tag=espada,scores={espada=12..}] ~ ~ ~ tag @s add v_9
 
 
 
 
titleraw @a[tag=espada,scores={espada=1}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=1}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=1}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=2}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=2}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=3}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=3}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=4}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=5}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=6}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=7}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=8}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=9}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=10}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=11}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=espada,scores={espada=12}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
 
execute @a[tag=sprinting] ~ ~ ~ tag @s remove sweeping_edge
execute @a[tag=kb_sprint] ~ ~ ~ tag @s remove sweeping_edge
 
execute @a[tag=!kb_sprint,tag=!sprinting,tag=espada,scores={espada=12..}] ~ ~ ~ tag @s add sweeping_edge
execute @a[tag=espada,scores={espada=!12..}] ~ ~ ~ tag @s remove sweeping_edge
execute @a[tag=!espada] ~ ~ ~ tag @s remove sweeping_edge
 
execute @a[tag=sprinting] ~ ~ ~ tag @s remove sweeping_edge
execute @a[tag=kb_sprint] ~ ~ ~ tag @s remove sweeping_edge
 
 
 