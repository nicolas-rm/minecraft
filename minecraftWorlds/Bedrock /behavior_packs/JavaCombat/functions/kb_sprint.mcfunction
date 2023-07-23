#bridge-file-version: #5
#Kb Sprint
 
execute @a[tag=hacha,scores={hacha=16..}] ~ ~ ~ tag @s[tag=sprinting] add kb_sprint
execute @a[tag=azada,scores={azada=8..}] ~ ~ ~ tag @s[tag=sprinting] add kb_sprint
execute @a[tag=pala,scores={pala=16..}] ~ ~ ~ tag @s[tag=sprinting] add kb_sprint
execute @a[tag=pico,scores={pico=16..}] ~ ~ ~ tag @s[tag=sprinting] add kb_sprint
execute @a[tag=espada,scores={espada=10..}] ~ ~ ~ tag @s[tag=sprinting] add kb_sprint
 
execute @a[tag=hacha,scores={hacha=!16..}] ~ ~ ~ tag @s remove kb_sprint
execute @a[tag=azada,scores={azada=!8..}] ~ ~ ~ tag @s remove kb_sprint
execute @a[tag=pala,scores={pala=!16..}] ~ ~ ~ tag @s remove kb_sprint
execute @a[tag=pico,scores={pico=!16..}] ~ ~ ~ tag @s remove kb_sprint
execute @a[tag=espada,scores={espzada=!10..}] ~ ~ ~ tag @s remove kb_sprint
 
 
 
 