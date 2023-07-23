#bridge-file-version: #8
 
 
 
event entity @a[scores={tridente=0}] trident_cooldown_event_off
event entity @a[scores={tridente=1}] trident_cooldown_event_on
event entity @a[scores={tridente=19..}] trident_cooldown_event_off
 
 
 
 
execute @a[tag=tridente,scores={tridente=0..6},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_0
execute @a[tag=tridente,scores={tridente=7},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_1
execute @a[tag=tridente,scores={tridente=10},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_2
execute @a[tag=tridente,scores={tridente=13},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_3
execute @a[tag=tridente,scores={tridente=15},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_4
execute @a[tag=tridente,scores={tridente=16},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_5
execute @a[tag=tridente,scores={tridente=17},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_6
execute @a[tag=tridente,scores={tridente=18},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_7
execute @a[tag=tridente,scores={tridente=18},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_8
execute @a[tag=tridente,scores={tridente=19},hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ tag @s add v_9
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
titleraw @a[tag=tridente,scores={tridente=1..2}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=3}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=4}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=5}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=6..7}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=8}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=9}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=10}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=11..12}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=13}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=14}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=15}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=16}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=17}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=18}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}
titleraw @a[tag=tridente,scores={tridente=19}] actionbar {"rawtext": [{ "text": "\n\n\n\n\n\n\n\n\n\n\n"}]}