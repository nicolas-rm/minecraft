#bridge-file-version: #3
 
 
scoreboard objectives add sweeping_edge_cooldown dummy
 
scoreboard players add @a[tag=sweeping_edge_cooldown] sweeping_edge_cooldown 1
execute @a[scores={sweeping_edge_cooldown=5..}] ~~~ function sweep
execute @a[scores={sweeping_edge_cooldown=5..}] ~~~ tag @s remove sweeping_edge_cooldown
execute @a[scores={sweeping_edge_cooldown=5..}] ~~~ scoreboard players reset @s sweeping_edge_cooldown
 
event entity @a[tag=shield] shield_sensor
event entity @a[tag=!shield] normal_sensor
 
 
scoreboard objectives add espada_test dummy
scoreboard objectives add espada dummy
scoreboard objectives add shield_durability dummy
execute @a[hasitem={item=iron_sword,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s espada_test 0
execute @a[hasitem={item=diamond_sword,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s espada_test 0
execute @a[hasitem={item=netherite_sword,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s espada_test 0
execute @a[hasitem={item=golden_sword,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s espada_test 0
execute @a[hasitem={item=stone_sword,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s espada_test 0
execute @a[hasitem={item=wooden_sword,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s espada_test 0
 
 
 
execute @a[scores={espada_test=5..}] ~ ~ ~ tag @s remove espada
execute @a[scores={espada_test=5..}] ~ ~ ~ scoreboard players set @s espada 0
execute @a[scores={espada_test=0..2}] ~ ~ ~ tag @s add espada
 
 
 
 
 
 
 
 
scoreboard players add @a espada_test 1
scoreboard players add @a[tag=espada] espada 1
 
 
scoreboard objectives add hacha_test dummy
scoreboard objectives add hacha dummy
 
execute @a[hasitem={item=raiyon:iron_axe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s hacha_test 0
execute @a[hasitem={item=raiyon:diamond_axe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s hacha_test 0
execute @a[hasitem={item=raiyon:netherite_axe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s hacha_test 0
execute @a[hasitem={item=raiyon:golden_axe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s hacha_test 0
execute @a[hasitem={item=raiyon:stone_axe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s hacha_test 0
execute @a[hasitem={item=raiyon:wooden_axe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s hacha_test 0
 
execute @a[scores={hacha_test=5..}] ~ ~ ~ tag @s remove hacha
execute @a[scores={hacha_test=5..}] ~ ~ ~ scoreboard players set @s hacha 0
execute @a[scores={hacha_test=0..2}] ~ ~ ~ tag @s add hacha
 
 
 
 
 
scoreboard players add @a hacha_test 1
scoreboard players add @a[tag=hacha] hacha 1
 
 
 
 
scoreboard objectives add pico_test dummy
scoreboard objectives add pico dummy
 
execute @a[hasitem={item=iron_pickaxe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pico_test 0
execute @a[hasitem={item=diamond_pickaxe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pico_test 0
execute @a[hasitem={item=netherite_pickaxe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pico_test 0
execute @a[hasitem={item=golden_pickaxe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pico_test 0
execute @a[hasitem={item=stone_pickaxe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pico_test 0
execute @a[hasitem={item=wooden_pickaxe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pico_test 0
 
execute @a[scores={pico_test=5..}] ~ ~ ~ tag @s remove pico
execute @a[scores={pico_test=5..}] ~ ~ ~ scoreboard players set @s pico 0
execute @a[scores={pico_test=0..2}] ~ ~ ~ tag @s add pico
scoreboard players add @a pico_test 1
scoreboard players add @a[tag=pico] pico 1
 
 
 
 
 
 
 
scoreboard objectives add pala_test dummy
scoreboard objectives add pala dummy
 
execute @a[hasitem={item=iron_shovel,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pala_test 0
execute @a[hasitem={item=diamond_shovel,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pala_test 0
execute @a[hasitem={item=netherite_shovel,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pala_test 0
execute @a[hasitem={item=golden_shovel,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pala_test 0
execute @a[hasitem={item=stone_shovel,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pala_test 0
execute @a[hasitem={item=wooden_shovel,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s pala_test 0
 
execute @a[scores={pala_test=5..}] ~ ~ ~ tag @s remove pala
execute @a[scores={pala_test=5..}] ~ ~ ~ scoreboard players set @s pala 0
execute @a[scores={pala_test=0..2}] ~ ~ ~ tag @s add pala
scoreboard players add @a pala_test 1
scoreboard players add @a[tag=pala] pala 1
 
 
scoreboard objectives add azada_test dummy
scoreboard objectives add azada dummy
 
 
 
execute @a[hasitem={item=iron_hoe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s azada_test 0
execute @a[hasitem={item=diamond_hoe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s azada_test 0
execute @a[hasitem={item=netherite_hoe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s azada_test 0
execute @a[hasitem={item=golden_hoe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s azada_test 0
execute @a[hasitem={item=stone_hoe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s azada_test 0
execute @a[hasitem={item=wooden_hoe,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s azada_test 0
 
execute @a[scores={azada_test=5..}] ~ ~ ~ tag @s remove azada
execute @a[scores={azada_test=5..}] ~ ~ ~ scoreboard players set @s azada 0
execute @a[scores={azada_test=0..2}] ~ ~ ~ tag @s add azada
scoreboard players add @a azada_test 1
scoreboard players add @a[tag=azada] azada 1
 
scoreboard objectives add tridente dummy
scoreboard objectives add tridente_test dummy
 
execute @a[hasitem={item=trident,location=slot.weapon.mainhand}] ~ ~ ~ scoreboard players set @s tridente_test 0
 
 
execute @a[scores={tridente_test=5..}] ~ ~ ~ tag @s remove tridente
execute @a[scores={tridente_test=5..}] ~ ~ ~ scoreboard players set @s tridente 0
execute @a[scores={tridente_test=0..2}] ~ ~ ~ tag @s add tridente
scoreboard players add @a tridente_test 1
scoreboard players add @a[tag=tridente] tridente 1
 
 
 
 
 
 
 
 
 
 
 
 
tag @a[tag=!tridente,tag=!hacha,tag=!espada,tag=!pala,tag=!pico,tag=!azada] add nada
tag @a[tag=espada] remove nada
tag @a[tag=hacha] remove nada
tag @a[tag=pala] remove nada
tag @a[tag=pico] remove nada
tag @a[tag=azada] remove nada
tag @a[tag=tridente] remove nada
scoreboard players set @a[tag=tridente] nada 0
scoreboard players set @a[tag=espada] nada 0
scoreboard players set @a[tag=hacha] nada 0
scoreboard players set @a[tag=pico] nada 0
scoreboard players set @a[tag=pala] nada 0
scoreboard players set @a[tag=azada] nada 0
 
scoreboard objectives add nada dummy
scoreboard players add @a[tag=nada] nada 1
 
 
 
execute @a[hasitem={item=iron_axe,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 0 raiyon:iron_axe
execute @a[hasitem={item=diamond_axe,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 0 raiyon:diamond_axe
execute @a[hasitem={item=netherite_axe,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 0 raiyon:netherite_axe
execute @a[hasitem={item=wooden_axe,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 0 raiyon:wooden_axe
execute @a[hasitem={item=golden_axe,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 0 raiyon:golden_axe
execute @a[hasitem={item=stone_axe,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 0 raiyon:stone_axe
 
scoreboard objectives add kb_resistance dummy
 
scoreboard players add @a[tag=kb_resistance] kb_resistance 1
 
execute @a[scores={kb_resistance=1..19}] ~ ~ ~ event entity @s kb_resistance
execute @a[scores={kb_resistance=20..}] ~ ~ ~ event entity @s kb_normal
execute @a[scores={kb_resistance=20..}] ~ ~ ~ tag @s remove kb_resistance
execute @a[scores={kb_resistance=20..}] ~ ~ ~ scoreboard players reset @s kb_resistance
 
execute @a[hasitem={item=shield,location=slot.weapon.mainhand}] ~ ~ ~ replaceitem entity @s slot.weapon.mainhand 1 raiyon:shield 1
execute @a[hasitem={item=shield,location=slot.weapon.offhand}] ~ ~ ~ replaceitem entity @s slot.weapon.offhand 1 raiyon:shield 1
 
scoreboard objectives add cooldown_damage dummy
 
scoreboard players add @e[tag=cooldown_damage] cooldown_damage 1
execute @e[scores={cooldown_damage=0..10}] ~ ~ ~ event entity @s kb_resistance_damage_cooldown
 
execute @e[scores={cooldown_damage=10..}] ~ ~ ~ tag @s remove cooldown_damage
execute @e[scores={cooldown_damage=10..}] ~ ~ ~ scoreboard players reset @s cooldown_damage
 
 