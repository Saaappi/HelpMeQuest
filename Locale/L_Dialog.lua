local addonName, addonTable = ...
local locale = GAME_LOCALE or GetLocale()
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local isLocaleSupported = false
local supportedLocales = {
	"enGB",
	"enUS",
	"deDE",
	"esMX",
	"ptBR",
	"esES",
	"frFR",
	"itIT",
	"ruRU",
	"koKR",
	"zhTW",
	"zhCN",
}
local L_DIALOG = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })

for i=1,#supportedLocales do
	if (supportedLocales[i] == locale) then
		isLocaleSupported = true
	end
end

if (isLocaleSupported == false) then
	if HelpMePlayOptionsDB.Logging then
		print(L_GLOBALSTRINGS["Red WARNING"] .. L_GLOBALSTRINGS["Locale Not Supported"] .. " @" .. L_GLOBALSTRINGS["Discord"])
	end
end

if (isLocaleSupported) then
	-- Dialog
	L_DIALOG["Are you enjoying yourself?"]													= "Are you enjoying yourself?"
	L_DIALOG["Go hunt somewhere else!"]														= "Go hunt somewhere else!"
	L_DIALOG["There is no time left. Run!"]													= "There is no time left. Run!"
	L_DIALOG["Bolvar requests your current report."]										= "Bolvar requests your current report."
	L_DIALOG["Let's go."]																	= "Let's go."
	L_DIALOG["Let's go!"]																	= "Let's go!"
	L_DIALOG["I'm ready."]																	= "I'm ready."
	L_DIALOG["Let's duel."]																	= "Let's duel."
	L_DIALOG["Let's begin."]																= "Let's begin."
	L_DIALOG["I am."]																		= "I am."
	L_DIALOG["I'm ready."]																	= "I'm ready."
	L_DIALOG["I am ready."]																	= "I am ready."
	L_DIALOG["I am ready to go."]															= "I am ready to go."
	L_DIALOG["Leave the Darkpens."]															= "Leave the Darkpens."
	L_DIALOG["Take us back to Boralus."]													= "Take us back to Boralus."
	L_DIALOG["Take us back to Zuldazar."]													= "Take us back to Zuldazar."
	L_DIALOG["<Reach inside and pull something out.>"] 										= "<Reach inside and pull something out.>"
	L_DIALOG["<Reach inside and pull out something that feels more like a building.>"] 		= "<Reach inside and pull out something that feels more like a building.>"
	L_DIALOG["Is there any way I can help?"]												= "Is there any way I can help?"
	L_DIALOG["O.K."]																		= "O.K."
	L_DIALOG["Is there anything you need?"]													= "Is there anything you need?"
	L_DIALOG["Very well. Let us fight."]													= "Very well. Let us fight."
	L_DIALOG["Au'narim claims you owe her anima."]											= "Au'narim claims you owe her anima."
	L_DIALOG["The Lady of the Falls wanted to make sure you were safe."]					= "The Lady of the Falls wanted to make sure you were safe."
	L_DIALOG["<Request tithe>"]																= "<Request tithe>"
	L_DIALOG["<Present Lajos's invitation>"]												= "<Present Lajos's invitation>"
	L_DIALOG["I know my way around the Sanctum."]											= "I know my way around the Sanctum."
	L_DIALOG["Are you sure?"]																= "Are you sure?"
	L_DIALOG["What can you tell me about Cartel So?"]										= "What can you tell me about Cartel So?"
	L_DIALOG["Let's do it!"]																= "Let's do it!"
	L_DIALOG["You're going down!"]															= "You're going down!"
	L_DIALOG["I am ready to fight!"]														= "I am ready to fight!"
	L_DIALOG["It is not safe here."]														= "It is not safe here."
	L_DIALOG["Prepare yourself!"]															= "Prepare yourself!"
	L_DIALOG["Let's do this!"]																= "Let's do this!"
	L_DIALOG["Yes, I will help."]															= "Yes, I will help."
	L_DIALOG["I will free you."]															= "I will free you."
	L_DIALOG["I will assist you."]															= "I will assist you."
	L_DIALOG["Let's ride."]																	= "Let's ride."
	L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."]							= "The forces of Mueh'zala have invaded Ardenweald."
	L_DIALOG["Evacuate, now!"]																= "Evacuate, now!"
	L_DIALOG["Yes."]																		= "Yes."
	L_DIALOG["Yes!"]																		= "Yes!"
	L_DIALOG["Quest"]																		= "Quest"
	L_DIALOG["Very well. Let us fight."]													= "Very well. Let us fight."
	L_DIALOG["Leave the Blooming Foundry."]													= "Leave the Blooming Foundry."
	L_DIALOG["I have heard this tale before."]												= "I have heard this tale before."
	L_DIALOG["I've heard this tale before..."]												= "I've heard this tale before..."
	L_DIALOG["I'm ready to set sail!"]														= "I'm ready to set sail!"
	L_DIALOG["I would like you to have the supplies."]										= "I would like you to have the supplies."
	L_DIALOG["I need a ride."]																= "I need a ride."
	L_DIALOG["D'kaan is coming with help."]													= "D'kaan is coming with help."
	L_DIALOG["I need to restore these remnants."]											= "I need to restore these remnants."
	L_DIALOG["The bells tell us to go to the town hall to be safe."]						= "The bells tell us to go to the town hall to be safe."
	L_DIALOG["The magistrate has ordered our retreat."]										= "The magistrate has ordered our retreat."
	L_DIALOG["The magistrate ordered our retreat."]											= "The magistrate ordered our retreat."
	L_DIALOG["The Scourge are incoming."]													= "The Scourge are incoming."
	L_DIALOG["Everything will be okay."]													= "Everything will be okay."
	L_DIALOG["We must get to the town hall."]												= "We must get to the town hall."
	L_DIALOG["Don't be a hero."]															= "Don't be a hero."
	L_DIALOG["We're all going to go hide in the town hall."]								= "We're all going to go hide in the town hall."
	L_DIALOG["We will survive this."]														= "We will survive this."
	L_DIALOG["Get to the town hall."]														= "Get to the town hall."
	L_DIALOG["The Scourge are coming!"]														= "The Scourge are coming!"
	L_DIALOG["Let us soulbind."]															= "Let us soulbind."
	L_DIALOG["Your presence is requested immediately at Provis Terra."]						= "Your presence is requested immediately at Provis Terra."
	L_DIALOG["I'll fight the harpies that come."]											= "I'll fight the harpies that come."
	L_DIALOG["I'm in."]																		= "I'm in."
	L_DIALOG["Got it."]																		= "Got it."
	L_DIALOG["Examine the Automa."]															= "Examine the Automa."
	L_DIALOG["Daelya Twilightsbane 1"]														= "What does the Light wish of me?"
	L_DIALOG["Daelya Twilightsbane 2"]														= "I will do my best to serve the Light. I swear to it."
	L_DIALOG["Meredy Huntswell 1"]															= "I'm ready, transform me into an ogre and I'll sneak into their citadel."
	L_DIALOG["Herbert Gloomburst 1"]														= "Herbert, do you have an ice mote I can use?"
	L_DIALOG["Captain Garrick 1"]															= "Let's get out of the citadel and figure out how to get back home."
	L_DIALOG["We need your assistance."]													= "We need your assistance."
	L_DIALOG["Will you bring your forces to fight with us?"]								= "Will you bring your forces to fight with us?"
	L_DIALOG["D'kaan is coming with help."]													= "D'kaan is coming with help."
	L_DIALOG["Tell me what happened."]														= "Tell me what happened."
	L_DIALOG["<Deliver Prince Renathal's invitation.>"]										= "<Deliver Prince Renathal's invitation.>"
	L_DIALOG["<Present the Offer of Employment.>"]											= "<Present the Offer of Employment.>"
	L_DIALOG["Warlord Breka Grimaxe 1"]														= "I know my way around Orgrimmar."
	L_DIALOG["Lindie Springstock 1"]														= "Let's head to the Old Town stables."
	L_DIALOG["Archmage Khadgar 1"]															= "FOR AZEROTH!"
	L_DIALOG["Archmage Khadgar 2"]															= "You are about to embark on a dangerous mission, and you may not be able to return immediately."
	L_DIALOG["Johnny Awesome 1"] 															= "Well, we are having some problems at the Sludge Fields, located northeast of here. Warden Stillwater could use your help."
	L_DIALOG["Johnny Awesome 2"]															= "That's all."
	L_DIALOG["Johnny Awesome 3"]															= "THAT'S ALL, JOHNNY AWESOME. TAKE IT OR LEAVE IT!"
	L_DIALOG["Kingslayer Orkus 1"] 															= "Um... Apparently there is some trouble at Southshore. Something about worgen insurgents. Maybe you could help with them?"
	L_DIALOG["Kingslayer Orkus 2"]															= "None."
	L_DIALOG["Kingslayer Orkus 3"]															= "Right, thanks. Just go ahead and head southeast. More south than east. Probably off the coast."
	L_DIALOG["Kingslayer Orkus 4"]															= "Your feet are touching the ground, Orkus."
	L_DIALOG["Dumass 1"] 																	= "Maybe you should go take a nap or something."
	L_DIALOG["Dumass 2"] 																	= "Wait a minute. It looks like something just came up."
	L_DIALOG["Bat Handler Maggotbreath 1"]													= "I need to take a bat to the Dawning Isles."
	L_DIALOG["Ambermill Dimensional Portal 1"]												= "<Use the Ambermill Dimensional Portal.>"
	L_DIALOG["Vanguard Battlemage 1"]														= "I must help Khadgar. Send me to the Blasted Lands!"
	L_DIALOG["Thaelin Darkanvil 1"]															= "Yes. I need you to help me operate that enormous tank."
	L_DIALOG["Zidormi 1"]																	= "Can you show me what Tirisfal Glades was like before the Battle for Lordaeron?"
	L_DIALOG["Zidormi 2"]																	= "Can you show me what Darkshore was like before the battle?"
	L_DIALOG["Zidormi 3"]																	= "Can you return me to the present time?"
	L_DIALOG["Zidormi 4"]																	= "Show me the Blasted Lands before the invasion."
	L_DIALOG["Zidormi 5"]																	= "Take me back to the present."
	L_DIALOG["Zidormi 6"]																	= "Can you show me what Silithus was like before the Wound in the World?"
	L_DIALOG["Nathanos Blightcaller 1"]														= "I have heard this story before."
	L_DIALOG["Kirin Tor Emissary 1"]														= "Send me to Dalaran!"
	L_DIALOG["Chromie 1"]																	= "Select a timeline."
	L_DIALOG["Chromie 2"]																	= "Select a different timeline."
	L_DIALOG["Baros Alexston 1"]															= "We have everything we need. It's time to build the garrison."
	L_DIALOG["Assistant Brightstone 1"]														= "Time to get back to work."
	L_DIALOG["Shelly Hamby 1"]																= "Gather Shelly's report."
	L_DIALOG["Skaggit 1"]																	= "Get the peons back to work."
	L_DIALOG["Senior Peon II 1"]															= "Gazlowe needs you."
	L_DIALOG["Sergeant Grimjaw 1"]															= "Prepare to battle the Gorens."
	L_DIALOG["Spiritwalker Ebonhorn 1"]														= "Tell me the Story of Huln."
	L_DIALOG["Spiritwalker Ebonhorn 2"]														= "Tell me more of Huln Highmountain."
	L_DIALOG["Spiritwalker Ebonhorn 3"]														= "I'm investigating unusual magical activity in the area."
	L_DIALOG["Spiritwalker Ebonhorn 4"]														= "Let's go meet Magni."
	L_DIALOG["Snazzle Shinyfinder 1"]														= "Go find shiny!"
	L_DIALOG["Snazzle Shinyfinder 2"]														= "You keep one. I keep rest."
	L_DIALOG["Trytooth Hardchisel 1"]														= "You kill basilisk!"
	L_DIALOG["Trytooth Hardchisel 2"]														= "Best kill job me seen!"
	L_DIALOG["Trytooth Hardchisel 3"]														= "Give Trytooth the boot."
	L_DIALOG["Kindle Candlecrafter 1"]														= "Make big candle! Lots of wax!"
	L_DIALOG["Kindle Candlecrafter 2"]														= "Me think me have just the right touch..."
	L_DIALOG["Dug Digger 1"]																= "Dig rocks, find pretties!"
	L_DIALOG["Windmaster Julan 1"]															= "Take the Windmaster's Totem."
	L_DIALOG["Navarrogg 1"]																	= "Let's get out of here!"
	L_DIALOG["Addie Fizzlebog 1"]															= "Let's go hunting!"
	L_DIALOG["Penelope Heathrow 1"]															= "It's safe now."
	L_DIALOG["Sirius Ebonwing 1"]															= "Excuse me..."
	L_DIALOG["Asha Ravensong 1"]															= "Arduen sent me. You're free."
	L_DIALOG["Asha Ravensong 2"]															= "Asha, you're free."
	L_DIALOG["Cassiel Nightthorn 1"]														= "Be at peace."
	L_DIALOG["Cassiel Nightthorn 2"]														= "Rest in peace, old friend."
	L_DIALOG["Tyrande Whisperwind 1"]														= "By my honor you will come to no harm, priestess."
	L_DIALOG["Tyrande Whisperwind 2"]														= "Yes, Tyrande."
	L_DIALOG["Keeper Remulos 1"]															= "Free Remulos from captivity."
	L_DIALOG["Hobart Grapplehammer 1"]														= "Your friends were all tortured and killed by witches."
	L_DIALOG["Hobart Grapplehammer 2"]														= "Sure."
	L_DIALOG["Huelo 1"]																		= "Pull the harpoon free."
	L_DIALOG["Shadow Hunter Ty'jin 1"]														= "I'm ready to parley, Ty'jin."
	L_DIALOG["Boatswain Taryn 1"]															= "Got some new orders from the captain for you, boatswain."
	L_DIALOG["Quartermaster Killian 1"]														= "We're saying no to the Ashvane."
	L_DIALOG["Navigator Swink 1"]															= "Orders from the captain, sir."
	L_DIALOG["Princess Talanji 1"]															= "Take me to King Rastakhan."
	L_DIALOG["Cyrus Crestfall 1"]															= "<Shake his hand.>"
	L_DIALOG["7th Legion Magus 1"]															= "The local authority has given us permission to open portals here."
	L_DIALOG["Halford Wyrmbane 1"]															= "What's your plan, High Commander?"
	L_DIALOG["Captured Zandalari Troll 1"]													= "Tell us everything, Zandalari."
	L_DIALOG["Private James 1"]																= "Is there anything in your pockets?"
	L_DIALOG["Dungar Longdrink 1"]															= "Take me to Stormshield in Ashran."
	L_DIALOG["Highlord Darion Mograine 1"]													= "Make it talk."
	L_DIALOG["Lady Jaina Proudmoore 1"]														= "Tell me about this place."
	L_DIALOG["Lady Jaina Proudmoore 2"]														= "Tell me more of the Jailer."
	L_DIALOG["Lady Jaina Proudmoore 3"]														= "What about the others who were taken?"
	L_DIALOG["Lady Jaina Proudmoore 4"]														= "<Lie low and observe.>"
	L_DIALOG["Lady Jaina Proudmoore 5"]														= "Jaina, can you show us the area around the palace?"
	L_DIALOG["Shandris Feathermoon 1"]														= "We should be able to find Tyrande if we follow the trail of corpses."
	L_DIALOG["Shandris Feathermoon 2"]														= "I can bring you and these souls to Ardenweald."
	L_DIALOG["Tal-Inara 1"]																	= "Show me how I can help the Shadowlands."
	L_DIALOG["Tal-Inara 2"]																	= "I have been to Zereth Mortis before and met Pocopoc."
	L_DIALOG["Tal-Inara 3"]																	= "May I visit with the Arbiter?"
	L_DIALOG["Highlord Bolvar Fordragon 1"]													= "Skip ahead to finish the Torghast chapter and have Torghast, Ve'nari, and the Runecarver unlocked."
	L_DIALOG["Highlord Bolvar Fordragon 2"]													= "Skip ahead to Korthia."
	L_DIALOG["Highlord Bolvar Fordragon 3"]													= "What's the plan?"
	L_DIALOG["Highlord Bolvar Fordragon 4"]													= "<Tell Bolvar about Saezurah and her plans to forge a new Arbiter.>"
	L_DIALOG["Highlord Bolvar Fordragon 5"]													= "What's next?"
	L_DIALOG["Runecarver 1"]																= "Who are you?"
	L_DIALOG["Runecarver 2"]																= "Let's get you free!"
	L_DIALOG["Wayfinder 1"]																	= "Wayfinder"
	L_DIALOG["Polemarch Adrestes 1"]														= "<Ask Adrestes what happened in Elysian Hold.>"
	L_DIALOG["Kalisthene 1"]																= "Let's see it, then."
	L_DIALOG["Voitha 1"]																	= "I will retrieve the scrolls."
	L_DIALOG["Nemea 1"]																		= "I choose the larion."
	L_DIALOG["Nemea 2"]																		= "You will not be able to change your decision on this character."
	L_DIALOG["Kleia 1"]																		= "Are you okay?"
	L_DIALOG["Kleia 2"]																		= "Your time has come, Kleia."
	L_DIALOG["Kleia 3"]																		= "We jump."
	L_DIALOG["Kleia 4"]																		= "Let's fly to the waystone."
	L_DIALOG["Eridia 1"]																	= "We need our Watchers' aid in battle."
	L_DIALOG["Apolon 1"]																	= "We need the Bearers at the Temple of Loyalty."
	L_DIALOG["Sika 1"]																		= "We need our Centurions in battle."
	L_DIALOG["Arios Riftbearer 1"]															= "We need the Collectors for the battle ahead."
	L_DIALOG["Ben Howell 1"]																= "We must see your final moments."
	L_DIALOG["Pelodis 1"]																	= "Everything is in place for the repair."
	L_DIALOG["Mikanikos 1"]																	= "I will take Phaestus."
	L_DIALOG["Helpful Steward 1"]															= "Can you help with this problem?"
	L_DIALOG["Helpful Steward 2"]															= "Can you help me with something?"
	L_DIALOG["Ysera 1"]																		= "Let us hear Thiernax's plan."
	L_DIALOG["Aspirant Leda 1"]																= "Do you have \"Worlds Beyond Counting\"?"
	L_DIALOG["Aspirant Ikaran 1"]															= "Do you have \"The Infinite Treatises\"?"
	L_DIALOG["Trapped Caretaker 1"]															= "I've cleared a path for you. You should leave."
	L_DIALOG["Rencissa the Dynamo 1"]														= "biggest rock"
	L_DIALOG["Scrapper Minoire 1"]															= "Here are the enhancers you wanted."
	L_DIALOG["Grimshadow 1"]																= "<Ride Grimshadow.>"
	L_DIALOG["Marcel Mullby 1"]																= "I have some bloodtusk skulls for you."
	L_DIALOG["Khaliiq 1"]																	= "Hide me in the shadows, Khaliiq."
	L_DIALOG["Specialist Entra 1"]															= "What should I do?"
	L_DIALOG["Ta'eran 1"]																	= "Tell me about this opportunity."
	L_DIALOG["Attendant Sparkledew 1"]														= "Take me to the Queen's audience chamber, please."
	L_DIALOG["Master Sha'lor 1"]															= "I need a flute."
	L_DIALOG["Attendant Shimmerwing 1"]														= "I would like to leave the Queen's audience chamber, please."
	L_DIALOG["Silkstrider Caretaker 1"]														= "You're safe now."
	L_DIALOG["Lady Moonberry 1"]															= "Lead on."
	L_DIALOG["Lady Moonberry 2"]															= "Keep us hidden while we search for our friends."
	L_DIALOG["Lady Moonberry 3"]															= "Do you know anything about curses?"
	L_DIALOG["Lady Moonberry 4"]															= "Let's get out of here."
	L_DIALOG["Ara'lon 1"]																	= "I am looking for Kivarr."
	L_DIALOG["Vesperbloom 1"]																= "<Explain why Lady Moonberry sent you to get a Secret Never Spoken.>"
	L_DIALOG["Vesperbloom 2"]																= "I was able to recover your book."
	L_DIALOG["Dapperdew 1"]																	= "If you insist. The show must go on!"
	L_DIALOG["Cortinarius 1"]																= "Then let us face them."
	L_DIALOG["Chancellor Codrin 1"]															= "You stand accused of conspiring to overthrow The Countess."
	L_DIALOG["The Countess 1"]																= "House Darkvein"
	L_DIALOG["The Curator 1"]																= "What happened to the Medallion of Avarice?"
	L_DIALOG["The Curator 2"]																= "We are looking for the Seal of Contrition."
	L_DIALOG["The Curator 3"]																= "We have retrieved the seal and are returning to Bastion."
	L_DIALOG["The Accuser 1"]																= "I'm ready. Begin the ritual."
	L_DIALOG["The Accuser 2"]																= "Begin your inquisition."
	L_DIALOG["The Accuser 3"]																= "Begin the ritual of extraction."
	L_DIALOG["Sinfall Executor 1"]															= "Release Kael'thas Sunstrider."
	L_DIALOG["Guard Captain Elizabeta 1"]													= "The Curator sent me. I'm looking for Watcher Emil."
	L_DIALOG["Where does the Taskmaster keep the sinstones?"]								= "Where does the Taskmaster keep the sinstones?"
	L_DIALOG["What are you all doing?"]														= "What are you all doing?"
	L_DIALOG["Why are the ones with scribbles interesting?"]								= "Why are the ones with scribbles interesting?"
	L_DIALOG["Courier Araak 1"]																= "Dimwiddle sent me."
	L_DIALOG["Courier Araak 2"]																= "We are ready. Please tell the Taskmaster the Maw Walker is here."
	L_DIALOG["Avowed Ritualist 1"]															= "I have a soul for you."
	L_DIALOG["Partially-Infused Soul Remnant 1"]											= "Free the Soul Remnant."
	L_DIALOG["Project Lead Allen 1"]														= "I will assist you."
	L_DIALOG["Fatescribe Roh-Tahl 1"]														= "I am ready to choose my fate in the Shadowlands."
	L_DIALOG["Sparring Aspirant 1"]															= "Will you spar with me?"
	L_DIALOG["Sparring Aspirant 2"]															= "I would like to challenge both of you to a spar."
	L_DIALOG["Lord Herne 1"]																= "I will join the hunt, Lord Herne."
	L_DIALOG["Lord Herne 2"]																= "<Explain what happened in the Gardens of Night and the spriggan's curse.>"
	L_DIALOG["Lord Herne 3"]																= "Is there such a tracker among the Wild Hunt?"
	L_DIALOG["Lord Herne 4"]																= "Yes, I am here for an audience with the Winter Queen."
	L_DIALOG["Lady Moonberry's Soap 1"]														= "Add green petals to the bottle."
	L_DIALOG["Bwonsamdi 1"]																	= "Return me to Ardenweald."
	L_DIALOG["Bwonsamdi 2"]																	= "I'm ready to begin the ritual to find out what Mueh'zala was hiding."
	L_DIALOG["Spirit of Vol'jin 1"]															= "Let's head to the Maw and find these missing spirits."
	L_DIALOG["Spirit of Vol'jin 2"]															= "I'm ready to receive your anima to protect myself from the death barrier."
	L_DIALOG["Ashamane 1"]																	= "I will slay the monsters that have been torturing you."
	L_DIALOG["Ashamane 2"]																	= "I can take you back to Ardenweald if you go inside the soulkeeper crystal."
	L_DIALOG["Winter Queen 1"]																= "I am here on behalf of Bwonsamdi. He needs our help."
	L_DIALOG["Winter Queen 2"]																= "Winter Queen, I bring missing spirits to return to Ardenweald."
	L_DIALOG["Winter Queen 3"]																= "Ara'lon has fallen. The Drust march on the Grove of Awakening."
	L_DIALOG["Winter Queen 4"]																= "What are your orders?"
	L_DIALOG["Baroness Vashj 1"]															= "What is your plan?"
	L_DIALOG["Whisperer Vyn 1"]																= "What's the plan?"
	L_DIALOG["Navigator Xennir 1"]															= "Will you offer your aid?"
	L_DIALOG["Navigator Xennir 2"]															= "Let's sneak together."
	L_DIALOG["Mask of Bwonsamdi 1"]															= "What will you do about Mueh'zala?"
	L_DIALOG["Zayhad, The Builder 1"]														= "I'll take this acorn and recover memories within Heartwood Grove."
	L_DIALOG["Zayhad, The Builder 2"]														= "Here are the joyful memories I collected from Heartwood Grove."
	L_DIALOG["Taloned Flayedwing 1"]														= "<Ride the flayedwing back to the Wrangler Pit.>"
	L_DIALOG["Treasure Guardian 1"]															= "How can I prove to you that I'm in House Grinchin?"
	L_DIALOG["Treasure Guardian 2"]															= "<Show the House Grinchin Ring.>"
	L_DIALOG["Orator Kloe 1"]																= "I will find the missing Vulpin."
	L_DIALOG["Gubbins 1"]																	= "I will take a parasol."
	L_DIALOG["Xandria 1"]																	= "Let's fly, Xandria."
	L_DIALOG["Xandria 2"]																	= "Alexandros feels that Bastion shares his values."
	L_DIALOG["Kynthia 1"]																	= "Could you fly me to the western gate?"
	L_DIALOG["Kel'Thuzad 1"]																= "<Walk with Kel'Thuzad.>"
	L_DIALOG["Sarah Howell 1"]																= "Take the children inside, now!"
	L_DIALOG["Baroness Draka 1"]															= "Begin the attack."
	L_DIALOG["General Draven 1"]															= "Take me to Kel'Thuzad."
	L_DIALOG["Prince Renathal 1"]															= "How can I help the assault, Prince Renathal?"
	L_DIALOG["Thiernax 1"]																	= "<Explain the situation and request help.>"
	L_DIALOG["Thiernax 2"]																	= "I do hear something..."
	L_DIALOG["Aspirant Thetes 1"]															= "I will accompany you."
	L_DIALOG["Alexstrasza, the Life-Binder 1"]												= "<Explain the situation to Alexstrasza and request a Token of Lost Love.>"
	L_DIALOG["Pebble 1"]																	= "Come little guy, let's get out of here."
	L_DIALOG["Anduin Wrynn 1"]																= "This cannot wait."
	L_DIALOG["Plagued Critters 1"]															= "Extermination Time!"
	L_DIALOG["Door Control Console 1"]														= "<Pull Random Levers>"
	L_DIALOG["Torben Zapblast 1"]															= "Send me to the surface, Torben."
	L_DIALOG["Mountaineer Dunstan 1"]														= "Captain Tharran wants you to deploy your remote observation bots and withdraw to Kharanos."
	L_DIALOG["Mountaineer Lewin 1"]															= "Captain Tharran wants you to deploy your remote observation bots and withdraw to Kharanos."
	L_DIALOG["Mountaineer Valgrum 1"]														= "Captain Tharran wants you to deploy your remote observation bots and withdraw to Kharanos."
	L_DIALOG["Gryth Thurden 1"]																= "Mountaineer Barleybrew said you could help me get to Loch Modan."
	L_DIALOG["Leafbeard the Storied 1"]														= "Show me their story."
	L_DIALOG["Elder Kreth 1"]																= "We have arrived from Oribos in pursuit of the Jailer."
	L_DIALOG["Elder Kreth 2"]																= "You are no longer safe here."
	L_DIALOG["Elder Kreth 3"]																= "Pelagos speaks the truth."
	L_DIALOG["Varoun 1"]																	= "The portal to Oribos is open."
	L_DIALOG["Avna 1"]																		= "Your Cartel Al friends miss you."
	L_DIALOG["Custodian Kalir 1"]															= "Don't you know that you're in danger here?"
	L_DIALOG["Tamra 1"]																		= "<Give the flowers to Tamra.>"
	L_DIALOG["Firim 1"]																		= "<Tell Firim about the oracle.>"
	L_DIALOG["Firim 2"]																		= "What is happening?"
	L_DIALOG["Firim 3"]																		= "Can we get additional aid from the Enlightened?"
	L_DIALOG["Firim 4"]																		= "The chamber is safe, we can proceed with the ritual."
	L_DIALOG["Pocopoc 1"]																	= "What are you doing?"
	L_DIALOG["Pocopoc 2"]																	= "Why are the devourers attacking us?"
	L_DIALOG["Pocopoc 3"]																	= "Where are you going?"
	L_DIALOG["Pocopoc 4"]																	= "What is the vessel?"
	L_DIALOG["Pocopoc 5"]																	= "Transfer your energy into the oracle."
	L_DIALOG["Ancient Translocator 1"]														= "Travel to the Sepulcher of the First Ones"
	L_DIALOG["Repository Console 1"]														= "Insert the Protoform Catalyst."
	L_DIALOG["Feroz 1"]																		= "Bottoms up."
	L_DIALOG["Sylvanas Windrunner 1"]														= "Show us."
	L_DIALOG["Saezurah 1"]																	= "How do we help Zereth Mortis create a new Arbiter?"
	L_DIALOG["Saezurah 2"]																	= "Let's begin the ritual."
	L_DIALOG["Vessel 1"]																	= "Examine the Vessel."
	L_DIALOG["Nadjia the Mistblade 1"]														= "I need your assistance."
	L_DIALOG["Pelagos 1"]																	= "What do you mean?"
	L_DIALOG["Pelagos 2"]																	= "We must assist in the ceremony."
	L_DIALOG["Pelagos 3"]																	= "Let's hear what the queen has to say."
	L_DIALOG["Clora 1"]																		= "Your time has come, Clora."
	L_DIALOG["Forgelite Sophone 1"]															= "Your time has come, Sophone."
	L_DIALOG["Olem 1"]																		= "The devourer threat has been pushed back and the Wellspring has been restored."
	L_DIALOG["Sequence Generator 1"]														= "<Start the sequence.>"
	L_DIALOG["Maiden of Ashwood Lake 1"]													= "Glad to help, my lady."
end

addonTable.L_DIALOG = L_DIALOG