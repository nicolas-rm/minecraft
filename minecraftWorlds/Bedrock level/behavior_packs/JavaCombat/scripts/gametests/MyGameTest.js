import {
  EntityEquipmentInventoryComponent,
  EquipmentSlot,
  system,
  world
} from "@minecraft/server";

let oldScore;
const scoreboard = world.scoreboard;

system.runInterval(() => {
  for (const player of world.getAllPlayers()) {
    const equipment = player.getComponent(EntityEquipmentInventoryComponent.componentId);
    if (!equipment) return;
    const itemInMainhand = equipment.getEquipment(EquipmentSlot.mainhand);
    const itemInOffhand = equipment.getEquipment(EquipmentSlot.offhand);

    if (itemInMainhand?.typeId?.endsWith('shield')) {
      const scoreboardObjective = scoreboard.getObjective("shield_durability");

      if (oldScore !== scoreboardObjective.getScore(player)) {
        oldScore = scoreboardObjective.getScore(player);
        const durability = itemInMainhand.getComponent("minecraft:durability");
        
        if (!durability) return;
        durability.damage++;
        equipment.setEquipment(EquipmentSlot.mainhand, itemInMainhand);

        if (durability.damage >= durability.maxDurability) {
          player.playSound("random.break");
          equipment.setEquipment(EquipmentSlot.mainhand);
        }
      }
    } else if (itemInOffhand?.typeId?.endsWith('shield')) {
      const scoreboardObjective = scoreboard.getObjective("shield_durability");

      if (oldScore !== scoreboardObjective.getScore(player)) {
        oldScore = scoreboardObjective.getScore(player);
        const durability = itemInOffhand.getComponent("minecraft:durability");
        if (!durability) return;

        durability.damage++;
        equipment.setEquipment(EquipmentSlot.offhand, itemInOffhand);

        if (durability.damage >= durability.maxDurability) {
          player.playSound("random.break");
          equipment.setEquipment(EquipmentSlot.offhand);
        }
      }
    }
  };
}, 4);