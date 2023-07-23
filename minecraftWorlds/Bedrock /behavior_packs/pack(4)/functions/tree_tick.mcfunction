#bridge-file-version: #38
execute @a ~ ~ ~ fill ~10 ~10 ~10 ~-10 ~-8 ~-10 air 0 replace structure_void
execute @e[type=item,name="Oak Log"] ~ ~~ tag @s add tree
execute @e[type=item,name="Spruce Log"] ~ ~~ tag @s add tree
execute @e[type=item,name="Birch Log"] ~ ~~ tag @s add tree
execute @e[type=item,name="Jungle Log"] ~ ~~ tag @s add tree
execute @e[type=item,name="Acacia Log"] ~ ~~ tag @s add tree
execute @e[type=item,name="Dark Oak Log"] ~ ~~ tag @s add tree
execute @e[type=item,name="Crimson Stem"] ~ ~~ tag @s add tree
execute @e[type=item,name="Warped Stem"] ~ ~~ tag @s add tree
execute @e[type=item,name="Cherry Log"] ~ ~~ tag @s add tree
 
execute @e[type=item,name="Tronco de cerezo"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tronco de roble"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tronco de abeto"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tronco de abedul"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tronco de la jungla"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tronco de acacia"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tronco de roble oscuro"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tallo escarlata"] ~ ~~ tag @s add tree
execute @e[type=item,name="Tallo deformado"] ~ ~~ tag @s add tree
 
 
 
 
 
 
scoreboard objectives add sneaking dummy
 
scoreboard players add @a[tag=sneaking] sneaking 1
execute @a[scores={sneaking=1}] ~ ~~ execute @e[tag=!no_tree,tag=tree,r=5] ~ ~ ~ function tree_capitator
execute @a[scores={sneaking=2..}] ~ ~~ execute @e[c=1,tag=!no_tree,tag=tree,r=5] ~ ~ ~ summon ray:clear
execute @a[scores={sneaking=2..}] ~ ~~ tag @s remove sneaking
execute @a[scores={sneaking=2..}] ~ ~~  scoreboard players reset @s sneaking
 
 
 
 
 
 
scoreboard objectives add tree dummy
scoreboard players add @e[tag=tree] tree 1
 
execute @e[scores={tree=6}] ~ ~ ~ tag @s add no_tree
 
 
scoreboard objectives add clear dummy
 
scoreboard players add @e[type=ray:clear] clear 1
 
 
execute @e[scores={clear=1}] ~ ~ ~ gamerule randomtickspeed 4096
execute @e[scores={clear=3}] ~ ~ ~ gamerule randomtickspeed 1
execute @e[scores={clear=3..}] ~ ~ ~ event entity @s despawn
 
 