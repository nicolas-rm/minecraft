

//Respawn Anchor

Bridge.register(class Command {
    static command_name = 'teleToHome'
    onApply() {

        let setupCommands = new Array();

        for (let i = 0; i <= 9000; i++) {
            let addPlayerTag = "execute @s[c=1,scores={uuid=" + i + "}] ~ ~ ~ tp @s @e[type=ed:anchoring,c=1,scores={uuid=" + i + "}]";
            setupCommands[1 + i] = addPlayerTag;

        }
        return setupCommands;
    }
    onPropose() { }
})

//End 