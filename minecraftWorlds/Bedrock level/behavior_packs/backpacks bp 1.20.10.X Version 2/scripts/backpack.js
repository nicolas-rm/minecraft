import { system, ItemTypes, world, ItemStack, EntityTypes, DynamicPropertiesDefinition, MinecraftEntityTypes, MinecraftBlockTypes } from '@minecraft/server'; 

const forbiddenItems = ["bps","shulker_box"];

    export default class backpack {
        static main(){           
            /*
            * HANDLE SAVING BACKPACK ITEMS
            */
            system.runInterval(()=>{
                let bpTempQuery = {type:"bps:container_entity_temp",tags:["close"]}
                let bpTempEntities = world.getDimension("overworld").getEntities(bpTempQuery)
                let itemListLore = []    
                for(let bpTempEntity of bpTempEntities){                    
                    let backpackID = bpTempEntity.getTags()[0]
                    let mainBackpackQuery = {type:"bps:container_entity_new",tags:[backpackID]}
                    let mainBackpackEntity = world.getDimension("overworld").getEntities(mainBackpackQuery)[0]
                    let mainInventory = mainBackpackEntity.getComponent("inventory").container
                    let tempInventory = bpTempEntity.getComponent("inventory").container
                    for(let index=0; tempInventory.size>index; index++){             
                        let tempItem = tempInventory.getItem(index)
                        if(!tempItem){
                            mainInventory.setItem(index,undefined)
                            continue
                        }
                        if(forbiddenItems.filter(forbiddenItem=>tempItem.typeId.includes(forbiddenItem)).length){
                            bpTempEntity.dimension.spawnItem(tempItem,bpTempEntity.location);
                            tempInventory.setItem(index,undefined);
                            continue;
                        }
                        let tempItemNameArr = tempItem.typeId.split(":")[1].split("_")
                        let itemItemName = ""
                        for(let name of tempItemNameArr){
                            let nameArr = Array.from(name)
                            nameArr[0] = nameArr[0].toUpperCase()
                            itemItemName += nameArr.join('') + " "
                        }
                        itemListLore.push(`§7${itemItemName}x${tempItem.amount}`)
                        mainInventory.setItem(index,tempItem)
                    }
                    let backpackOwnerQuery = {type:"minecraft:player",name:bpTempEntity.getTags()[2]}
                    let backpackOwnerEntity = bpTempEntity.dimension.getEntities(backpackOwnerQuery)
                    if(backpackOwnerEntity.length>0){          
                        let backOwnerEntityInventory = backpackOwnerEntity[0].getComponent("inventory").container            
                        if(backpackOwnerEntity[0].getDynamicProperty("backpackSlot") != undefined){                                    
                        let backpackItem = backOwnerEntityInventory.getItem(backpackOwnerEntity[0].getDynamicProperty("backpackSlot"))
                        let newItemListLore       
                            if(itemListLore.length>5){                                              
                                if(backpackItem){
                                    newItemListLore = itemListLore.splice(0,5)
                                    newItemListLore.push(`§7and ${itemListLore.length} more...`)
                                    newItemListLore.unshift(`bps_id:${backpackID.split(":")[1]}`)                       
                                    backpackItem.setLore(newItemListLore)
                                }
                            }else{
                                newItemListLore = itemListLore
                                newItemListLore.unshift(`bps_id:${backpackID.split(":")[1]}`)                       
                                backpackItem.setLore(newItemListLore)
                            }                
                            for(let index=0; backOwnerEntityInventory.size>index; index++){
                                let item = backOwnerEntityInventory.getItem(index)
                                if(!item) continue
                                if(item.typeId.includes("bps:")){
                                    if(item.getLore()[0].split(":")[1] == backpackID.split(":")[1]){
                                        backOwnerEntityInventory.setItem(index,backpackItem)
                                        break
                                    }
                                }
                            }              
                        }
                    }        
                    if(bpTempEntity.hasTag("despawn")){          
                        bpTempEntity.triggerEvent("despawn2")
                    }else{
                        bpTempEntity.removeTag("close")
                    }
                }
            },2)

            /*
            * HANDLES BACKPACK DESPAWNING WHEN NO PLAYER NEARBY
            */
            system.runInterval(()=>{     
                let bpTemp = {type:"bps:container_entity_temp"}
                let bpTempEntities = world.getDimension("overworld").getEntities(bpTemp)
                for(let bpTempEntity of bpTempEntities){
                    let bpOwnerQuery = {type:"minecraft:player",dimension:bpTempEntity.dimension,location:bpTempEntity.location,maxDistance:4}
                    let bpOwnerEntities = bpTempEntity.dimension.getEntities(bpOwnerQuery)
                    if(bpOwnerEntities.length<=0){                 
                        bpTempEntity.triggerEvent("despawn2")
                    }
                }
            },10)

            system.runInterval(()=>{ 
                let players = world.getPlayers()
                let backpackInformation
                for(let player of players){
                    let inventory = player.getComponent("inventory").container;
                    let item = inventory.getItem(player.selectedSlot)        

                    /*
                    * FIRST TIME SETUP
                    */
                    let mainCentralQuery = {type:'bps:bp_central'}
                    let centralEntity = world.getDimension("overworld").getEntities(mainCentralQuery)
                    if(centralEntity.length==0){
                        if(player.dimension.id != "minecraft:overworld"){
                            world.sendMessage("[Backpack+] §cMust be in overworld to complete setup.")
                            continue
                        }
                        const centralLocation = {x:player.location.x,y:-64,z:player.location.z};
                        let bpCentralEntity = world.getDimension('overworld').spawnEntity(`bps:bp_central`,centralLocation);
                        bpCentralEntity.nameTag = "BP CENTRAL";
                        world.sendMessage("[Backpack+] §eInitial Setup Complete.")
                    }        

                    /*
                    * CHECK IF PLAYER CHANGED TO EMPTY SLOT OR DROPPED BACKPACK
                    */
                    if(!item){
                        let propertyID = player.getDynamicProperty("backpackID")
                        let propertySlot = player.getDynamicProperty("backpackSlot")            
                        if(propertyID != undefined && propertySlot != undefined){
                            let backpackTempQuery = {tags:[`bps_id:${propertyID}`]}
                            let backpackTempEntity = player.dimension.getEntities(backpackTempQuery)[0]    
                            if(propertySlot != player.selectedSlot){
                                //player.sendMessage("Empty: Changed Slot")
                                player.removeDynamicProperty("backpackSlot")
                                player.removeDynamicProperty("backpackID")   
                                backpackTempEntity.removeTag("x")
                                backpackTempEntity.removeTag(`${player.name}`)                 
                                backpackTempEntity.addTag(`despawn`)
                                backpackTempEntity.addTag(`${player.name}`)
                                backpackTempEntity.addTag(`close`)
                            }else if(propertySlot == player.selectedSlot){
                                //player.sendMessage("Dropped: Changed Slot")
                                player.removeDynamicProperty("backpackSlot")
                                player.removeDynamicProperty("backpackID")      
                                backpackTempEntity.removeTag("x")
                                backpackTempEntity.removeTag(`${player.name}`)              
                                backpackTempEntity.addTag(`despawn`)
                                backpackTempEntity.addTag(`${player.name}`)
                                backpackTempEntity.addTag(`close`)
                            }                
                        }
                        continue
                    }

                    /*
                    * CHECK THE TYPE OF BACKPACK THE PLAYER HAS
                    */
                    switch(item.typeId){
                        case "bps:backpack":
                            backpackInformation = {player:player,item:item,name:"Small Backpack"}
                            mainBackpack(backpackInformation)
                        break
                            
                        case "bps:backpack_medium":
                            backpackInformation = {player:player,item:item,name:"Small Backpack"}
                            mainBackpack(backpackInformation)
                        break

                        case "bps:backpack_big":
                            backpackInformation = {player:player,item:item,name:"Small Backpack"}
                            mainBackpack(backpackInformation)
                        break

                        case "bps:backpack_xl":
                            backpackInformation = {player:player,item:item,name:"Small Backpack"}
                            mainBackpack(backpackInformation)
                        break

                        default:
                            let propertyID = player.getDynamicProperty("backpackID")
                            let propertySlot = player.getDynamicProperty("backpackSlot")
                            if(propertyID != undefined && propertySlot != undefined){                   
                                let backpackTempQuery = {type:"bps:container_entity_temp",tags:[`bps_id:${propertyID}`]}
                                let backpackTempEntity = player.dimension.getEntities(backpackTempQuery)[0]
                                player.removeDynamicProperty("backpackSlot")
                                player.removeDynamicProperty("backpackID")   
                                backpackTempEntity.removeTag("x")
                                backpackTempEntity.removeTag(`${player.name}`)               
                                backpackTempEntity.addTag(`despawn`)
                                backpackTempEntity.addTag(`${player.name}`)     
                                backpackTempEntity.addTag(`close`)
                                //player.sendMessage("Changed To Non-Backpack")
                            }
                    }           
                }
            },1)

            function mainBackpack(backpackInformation){
                let backpackItem = backpackInformation.item
                let backpackName = backpackInformation.name
                let backpackOwner = backpackInformation.player
                let backpackOwnerLocation = backpackInformation.player.location
                backpackOwnerLocation.y = backpackOwnerLocation.y+1.3
                let inventory = backpackOwner.getComponent("inventory").container
                if(backpackItem.getLore().length==0){
                    //BACKPACK SETUP
                    let newBackpackItem = backpackItem;
                    let mainCentralQuery = {type:'bps:bp_central'}
                    let centralEntity = world.getDimension("overworld").getEntities(mainCentralQuery)[0]
                    let centralLocation = centralEntity.location
                    let newID = `${Math.floor(Math.random()* 10000)}`
                    newBackpackItem.setLore([`bps_id:${newID}`])
                    inventory.setItem(backpackOwner.selectedSlot,newBackpackItem)
                    let backpackMain = world.getDimension(`overworld`).spawnEntity(`bps:container_entity_new`,centralLocation)       
                    backpackMain.nameTag = backpackName       
                    backpackMain.addTag(`bps_id:${newID}`)
                    backpackMain.triggerEvent(backpackSize(backpackMain))             
                    //backpackOwner.sendMessage(`Added Backpack ID ${newID}`)
                }else{
                    //DETECT CHANGE SLOT
                    //SETUP BACKPACK TEMPORARY
                    //BACKPACK Temporary TELEPORT TO OWNER        
                    let backpackID = backpackItem.getLore()[0].split(":")[1]
                    let propertyID = backpackOwner.getDynamicProperty("backpackID")
                    let propertySlot = backpackOwner.getDynamicProperty("backpackSlot")
                    if(propertyID != undefined && propertySlot != undefined){
                        if(propertySlot != backpackOwner.selectedSlot){
                            let backpackTemp = backpackOwner.dimension.spawnEntity(`bps:container_entity_temp`,backpackOwnerLocation)
                            backpackTemp.nameTag = backpackName
                            backpackTemp.addTag(`bps_id:${backpackID}`)
                            backpackTemp.triggerEvent(backpackSize(backpackTemp))
                            let oldBackpackTempQuery = {type:'bps:container_entity_temp',tags:[`bps_id:${propertyID}`]}
                            let oldBackpackTempEntity = backpackOwner.dimension.getEntities(oldBackpackTempQuery)[0]   
                            oldBackpackTempEntity.removeTag("x")
                            oldBackpackTempEntity.removeTag(`${backpackOwner.name}`)
                            oldBackpackTempEntity.addTag(`despawn`)
                            oldBackpackTempEntity.addTag(`${backpackOwner.name}`)  
                            oldBackpackTempEntity.addTag("close")   
                            //backpackOwner.sendMessage("Changed Slot")                
                            setupTempBackpack(backpackTemp)
                        }
                    }else if(propertyID == undefined && propertySlot == undefined){
                        let backpackTemp = backpackOwner.dimension.spawnEntity(`bps:container_entity_temp`,backpackOwnerLocation)
                        backpackTemp.nameTag = backpackName
                        backpackTemp.addTag(`bps_id:${backpackID}`)
                        backpackTemp.addTag(`x`)
                        backpackTemp.addTag(`${backpackOwner.name}`)
                        backpackTemp.triggerEvent(backpackSize(backpackTemp))
                        //backpackOwner.sendMessage("Empty to backpack")
                        setupTempBackpack(backpackTemp)
                    }        
                    backpackOwner.setDynamicProperty("backpackID",backpackID)
                    backpackOwner.setDynamicProperty("backpackSlot",backpackOwner.selectedSlot)
                    let backpackTempQuery = {type:'bps:container_entity_temp',tags:[`bps_id:${backpackID}`]}
                    let backpackTempEntity = backpackOwner.dimension.getEntities(backpackTempQuery)[0]
                    try{
                        backpackTempEntity.teleport(backpackOwnerLocation,{dimension:backpackOwner.dimension})
                    }catch(e){
                        //backpackOwner.sendMessage("[Backpack+] §cCan't Find Temporary Backpack Entity")
                    }
                }
            }

            function setupTempBackpack(backpackTemp){
                let backpackID = backpackTemp.getTags()[0]
                let mainBackpackQuery = {type:"bps:container_entity_new",tags:[backpackID]}
                let mainBackpackEntity = world.getDimension("overworld").getEntities(mainBackpackQuery)[0]
                let mainInventory = mainBackpackEntity.getComponent("inventory").container
                let tempInventory = backpackTemp.getComponent("inventory").container
                if(mainInventory.emptySlotsCount == mainInventory.size) return
                for(let index=0; mainInventory.size>index; index++){
                    let mainItem = mainInventory.getItem(index)
                    if(!mainItem) continue
                    tempInventory.setItem(index,mainItem)
                }
            }

            function backpackSize(backpackEntity){
                let backpackName = backpackEntity.nameTag.toLowerCase().split(" ")[0]
                switch(backpackName){ 
                    case "small":
                        return "small"
                    break
                }
            }

            /*
            * DESPAWN TEMP BACKPACKS WHEN PLAYER LEAVE
            */
            world.afterEvents.playerLeave.subscribe((eventData)=>{
                let playerName = eventData.playerName
                let bpTempQuery = {type:"bps:container_entity_temp",tags:[playerName]}
                let bpTempEntity = world.getDimension("overworld").getEntities(bpTempQuery)
                if(bpTempEntity.length>0){
                    for(let bpEntity of bpTempEntity){
                        bpEntity.triggerEvent("despawn2")
                    }
                }
            })

            /*
            * syntax: reset bp
            * syntax: bp clean <all/temps/backpack>
            * syntax: bp drop <backpack id: number>
            * syntax: bp view <backpack id: number>
            * syntax: bp list
            */
            world.afterEvents.chatSend.subscribe((eventData)=>{
                let commandArr = eventData.message.trim().split(' ');
                let command = commandArr[0] + ' ' + commandArr[1];
                switch(command){		
                    case "bp clean":
                        if(commandArr[2] == "all"){
                        eventData.sender.runCommandAsync(`function reset`);
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eSuccesfully reset the addon. Restart you world or server to begin setup again."}]}`);
                        }else if(commandArr[2] == "temps"){
                        eventData.sender.runCommandAsync(`event entity @e[type=bps:container_entity_temp] despawn2`);
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eRemoved all temporary backpack entities."}]}`);	
                        }else if(commandArr[2] == "backpack"){
                        eventData.sender.runCommandAsync(`event entity @e[type=bps:container_entity_new] despawn2`);	
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eRemoved all backpack entities."}]}`);
                        }else{
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §a>>bp clean syntaxes<<\n-bp clean all\n-bp clean temps\n-bp clean backpack"}]}`);	
                        }
                        eventData.cancel = true;
                    break;
                    
                    case "bp reset":			
                        eventData.cancel = true;	
                        let item = eventData.sender.getComponent(`inventory`).container.getItem(eventData.sender.selectedSlot);
                        if(!item){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be a backpack."}]}`);
                            return;
                        }
                        if(!item.typeId.includes('bps')){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be a backpack."}]}`);
                            return;
                        }
                        let bpId = item.getLore()[0];
                        try{
                        eventData.sender.getComponent(`inventory`).container.setItem(eventData.sender.selectedSlot, null);
                        }catch(e){
                            eventData.sender.runCommandAsync(`say ${e}`);
                        }
                        eventData.sender.runCommandAsync(`give @s ${item.typeId}`);
                        try{
                        eventData.sender.runCommandAsync(`event entity @e[tag="${bpId}"] despawn2`);
                        }catch(e){}
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eSuccesfully reset backpack."}]}`);
                    break;
                    
                    case "bp central":
                        eventData.cancel = true;
                        if(eventData.sender.getTags().filter(tag=>tag == 'op').length<=0){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be an OP to use this command."}]}`);
                            return;
                        }
                        let eQuery = {type:`bps:bp_central`}
                        let bpCentral = world.getDimension(`overworld`).getEntities(eQuery);
                        if(bpCentral.length>0){
                            let bpl = bpCentral[0].location;
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eBackpack Central Location: ${Math.floor(bpl.x)},${Math.floor(bpl.y)},${Math.floor(bpl.z)}"}]}`);
                        }else{
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cBackpack Central Location: Not Found`);
                        }
                    break;
                    
                    case "bp move":
                        eventData.cancel = true;
                        if(eventData.sender.getTags().filter(tag=>tag == 'op').length<=0){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be an OP to use this command."}]}`);
                            return;
                        }
                        if(!eventData.sender.dimension.id.includes('overworld')){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cThis command can only be used in the overworld."}]}`);
                            return;
                        }
                        let pl = eventData.sender.location;
                        let nl = {x:pl.x,y:-64,z:pl.z};
                        eventData.sender.runCommandAsync(`tp @e[type=bps:bp_central] ${nl.x} ${nl.y} ${nl.z}`);
                        eventData.sender.runCommandAsync(`tp @e[type=bps:container_entity_new] ${nl.x} ${nl.y} ${nl.z}`);
                        let eQuery2 = {type:`bps:bp_central`}
                        let bpCentral2 = Array.from(world.getDimension(`overworld`).getEntities(eQuery2));
                        if(bpCentral2.length>0){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eBackpack New Central Location: ${Math.floor(nl.x)},${Math.floor(nl.y)},${Math.floor(nl.z)}"}]}`);
                        }
                    break;
                    
                    case "bp drop":
                        eventData.cancel = true;
                        if(!eventData.sender.dimension.id.includes('overworld')){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cThis command can only be used in the overworld."}]}`);
                            return;
                        }
                        if(eventData.sender.getTags().filter(tag=>tag == 'op').length>0){
                        let bpID = eventData.message.trim().split(` `)[2];
                        if(!bpID){
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cPut a backpack id."}]}`);
                            return;
                        }
                        let eQuery = {tags:[`bps_id:${bpID}`],type:`bps:container_entity_new`,excludeFamilies:[`player`]}
                        let bp = eventData.sender.dimension.getEntities(eQuery);
                        if(bp.length>0) {
                            bp[0].runCommandAsync(`tp @s "${eventData.sender.name}"`);
                            bp[0].runCommandAsync(`event entity @s drop`);
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §eSuccesfully dropped backpack contents."}]}`);
                        }else{
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cNo backpacks with that ID found."}]}`);
                        }
                    }else{
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be an OP to use this command."}]}`);
                    }
                    break;
                    
                    case "bp view":
                        eventData.cancel = true;
                        if(eventData.sender.getTags().filter(tag=>tag == 'op').length>0){
                            if(!commandArr[2]){
                                eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cPut a backpack id."}]}`);
                                return;
                            }
                            let eQuery = {type:'bps:container_entity_new',tags:[`bps_id:${commandArr[2]}`]}
                            let bp = eventData.sender.dimension.getEntities(eQuery);
                            if(bp.length>0) {
                                let itemList = "§eBackpack Items: ";
                                let bpInv = bp[0].getComponent('inventory').container;
                                for(let slot=0; bpInv.size>slot; slot++){
                                    let item = bpInv.getItem(slot);
                                    if(!item) continue;
                                    
                                    let itemName = item.typeId;
                                    let newName = '';
                                    let charArr;
                                    let itemNameArray;
                                    try{
                                    itemName = itemName.split(':')[1];
                                    itemNameArray = itemName.split('_');
                                    }catch(e){
                                        continue;
                                    }
                                    for(let word of itemNameArray){
                                        charArr = Array.from(word);
                                        charArr[0] = charArr[0].toUpperCase();		
                                        newName += charArr.join("") + " ";
                                    }										
                                    itemList = itemList + `${newName}` + " x" + `${item.amount}` + ",";
                                }
                                eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] ${itemList}"}]}`);
                            }else{
                                eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cNo backpacks with that ID found."}]}`);
                            }
                        }else{
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be an OP to use this command."}]}`);
                        }
                    break;
                    
                    case "bp list":
                        eventData.cancel = true;
                        if(eventData.sender.getTags().filter(tag=>tag == 'op').length>0){
                            let eQuery = {type:'bps:container_entity_new'}
                            let bp = eventData.sender.dimension.getEntities(eQuery);
                            let bpList = "Backpack IDs: §e";
                            for(let bag of bp){
                                let id = bag.getTags()[0].split(':')[1];
                                bpList = bpList + `${id}` + ', ';
                            }
                        eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] ${bpList}"}]}`);
                        }else{
                            eventData.sender.runCommandAsync(`tellraw @s {"rawtext":[{"text":"[Backpack+] §cMust be an OP to use this command."}]}`);
                        }
                    break;
                }	
            });
        }
    }