#bridge-file-version: #4
 
scoreboard objectives add critical_hit dummy
 
 
scoreboard players add @a[tag=critical_hit] critical_hit 1
 
execute @a[scores={critical_hit=1}] ~ ~ ~ tag @s add critical_hit
execute @a[scores={critical_hit=10..}] ~ ~ ~ tag @s remove critical_hit
execute @a[scores={critical_hit=10..}] ~ ~ ~ scoreboard players reset @s critical_hit
 