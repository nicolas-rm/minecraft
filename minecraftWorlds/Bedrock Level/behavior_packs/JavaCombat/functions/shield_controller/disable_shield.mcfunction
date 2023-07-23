#bridge-file-version: #10
scoreboard objectives add disable_shield dummy
 
scoreboard players add @a[tag=disable_shield] disable_shield 1
 
execute @a[scores={disable_shield=1}] ~ ~ ~ playsound random.break @a[r=3]
execute @a[scores={disable_shield=100..}] ~ ~ ~ event entity @s enable_shield
execute @a[scores={disable_shield=100..}] ~ ~ ~ playsound item.shield.block @s ~ ~ ~ 1 1.5
execute @a[scores={disable_shield=100..}] ~ ~ ~ tag @s remove disable_shield
execute @a[scores={disable_shield=100..}] ~ ~ ~ scoreboard players reset @s disable_shield
 
tag @a[tag=disable_shield] remove shield
 