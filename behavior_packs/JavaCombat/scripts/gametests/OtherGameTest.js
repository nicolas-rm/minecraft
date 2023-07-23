import { world,system,Player, Entity ,} from "@minecraft/server";

world.afterEvents.entityHitEntity.subscribe(({ damagingEntity}) => {

  damagingEntity.runCommandAsync(`execute @s[tag=critical_hit] ~~~ event entity @s critical_hit`);

  }
);



let sneak = system.runInterval(() => {
  let players = world.getAllPlayers()
  players.forEach(async (player) => {
      if (player.isSneaking) {
       player.runCommandAsync(`tag @s add sneaking`);
      }
      if (!player.isSneaking) {
        player.runCommandAsync(`tag @s remove sneaking`);
       }
  })
}, 4);