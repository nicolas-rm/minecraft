scoreboard objectives add uuid dummy
scoreboard players add @p uuid 0
summon ed:anchoring ~ ~ ~ dumb Core
event entity @e[type=ed:anchoring, r=1] ed:create
scoreboard players add @e[type=ed:anchoring,r=1,c=1] uuid 0
tickingarea add circle 0 0 0 2 claimcore
summon ed:claimcore 0 1 0
scoreboard players add @e[type=ed:claimcore] uuid 0
execute at @e[type=ed:claimcore,scores={uuid=!0}] run kill @e[type=ed:claimcore,scores={uuid=0}]
scoreboard players add @e[c=1,type=ed:claimcore] uuid 1
execute at @e[type=ed:claimcore] run scoreboard players operation @e[type=ed:anchoring,scores={uuid=0}] uuid += @s[type=ed:claimcore,scores={uuid=!0}] uuid