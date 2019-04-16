

; STRINGS ARE DEFINED HERE

STRBEG::

	.SEGMENT "0"

	.GSTR STR?1,": "
	.GSTR STR?2,"No inside"
P-NO-INSIDE=STR?2
	.GSTR STR?3,"No surface"
P-NO-SURFACE=STR?3
	.GSTR STR?4,"Nothing"
P-NOTHING=STR?4
	.GSTR STR?5,":
"
	.GSTR STR?6,"You may choose to: "
	.GSTR STR?16,"Escape"
	.GSTR STR?25,"Epilogue"
	.GSTR STR?44,".
"
	.GSTR STR?45,"I don't think that "
	.GSTR STR?46,"It looks like "
	.GSTR STR?47,"It's already "
	.GSTR STR?48,"It's too dark to see!
"
	.GSTR STR?49,"Nothing happens.
"
	.GSTR STR?50,"That would be a good trick.
"
	.GSTR STR?51,"That would be a waste of time.
"
	.GSTR STR?52,"There is nothing "
	.GSTR STR?53,"There's no room."
	.GSTR STR?54,"There's nothing to "
	.GSTR STR?55,"You already are"
	.GSTR STR?56,"You already have "
	.GSTR STR?57,"You are now "
	.GSTR STR?58,"You can't "
	.GSTR STR?59,"You find nothing"
	.GSTR STR?60,"You'll have to "
	.GSTR STR?61,"You aren't "
	.GSTR STR?62,"open"
	.GSTR STR?63,"closed"
	.GSTR STR?64,"do"
	.GSTR STR?65,"expect a response from a dead person!"
	.GSTR STR?66,"reach"
	.GSTR STR?67," descriptions"
	.GSTR STR?68,"suffering from scurvy, weak, and exhausted.You are on your last reserves of strength"
	.GSTR STR?69,"suffering from a mild case of scurvy, and very tired.You are near the end of your strength"
	.GSTR STR?70,"feeling better from having eaten, but still exhausted.You are near the end of your strength"
	.GSTR STR?71,"recovering from scurvy, but still weak"
	.GSTR STR?72,"still very weak"
	.GSTR STR?73,"in excellent health"
	.GSTR STR?74,"Do you wish to "
	.GSTR STR?76,"Okay.
"
	.GSTR STR?77,"Failed.
"
	.GSTR STR?78,"What now?"
	.GSTR STR?79,"barbarian"
	.GSTR STR?80,"peasant"
	.GSTR STR?81,"samurai"
	.GSTR STR?82,"daimyo"
	.GSTR STR?83,"hatamoto"
	.GSTR STR?84,"Regent"
	.GSTR STR?85,"Kwampaku"
	.GSTR STR?86,"Taiko"
	.GSTR STR?87,"Shogun"
	.GSTR STR?88,"SHOGUN"
SHOGUN-NAME=STR?88
	.GSTR STR?89,"Debugging"
	.GSTR STR?90,"Apple IIe"
	.GSTR STR?91,"Macintosh"
	.GSTR STR?92,"Amiga"
	.GSTR STR?93,"Atari ST"
	.GSTR STR?94,"IBM"
	.GSTR STR?95,"Commodore 128"
	.GSTR STR?96,"Commodore 64"
	.GSTR STR?97,"Apple IIc"
	.GSTR STR?98,"Apple IIgs"
	.GSTR STR?99,"A Story of Japan"
	.GSTR STR?100,"Adapted by Dave Lebling"
	.GSTR STR?101,"Original Illustrations by Donald Langosy"
	.GSTR STR?102,"Translated by Tanya Allan"
	.GSTR STR?103,"Translated by Donna Dennison"
	.GSTR STR?104,"Interpreters by Tim Anderson, Duncan Blanchard,"
	.GSTR STR?105,"J. D. Arnold, and Scott Fray"
	.GSTR STR?106,"English Parser by Stu Galley and Tim Anderson"
	.GSTR STR?107,"Quality control by Patti Pizer, Shaun Kelly,"
	.GSTR STR?108,"Steve Watkins, Adam Levesque, Christian Anthony,"
	.GSTR STR?109,"Liz Jones, Adam Glass, and many others"
	.GSTR STR?110,"attack"
	.GSTR STR?111,"hit"
	.GSTR STR?112,"Biting"
	.GSTR STR?113," on "
	.GSTR STR?114," in "
	.GSTR STR?115,"close"
	.GSTR STR?116,"cross"
	.GSTR STR?117,"It's not in anything."
	.GSTR STR?118,"drink"
	.GSTR STR?119,"hanging from anything."
	.GSTR STR?120,"It's closed.
"
	.GSTR STR?121,"You see nothing special about "
	.GSTR STR?122,"get it"
	.GSTR STR?123,"In this country, people who say "
	.GSTR STR?124," doesn't appear to "
	.GSTR STR?125,"be more specific about "
	.GSTR STR?126,"under"
	.GSTR STR?127,"Only a motherless coward would attack a woman!"
	.GSTR STR?128,"kill"
	.GSTR STR?129,"stand up"
	.GSTR STR?130,"lock"
	.GSTR STR?131,"It already is."
	.GSTR STR?132,"You need a key to do that."
	.GSTR STR?133,"There's nothing "
	.GSTR STR?134,"look inside"
	.GSTR STR?135,"lower"
	.GSTR STR?136,"Lowering"
	.GSTR STR?137,"move"
	.GSTR STR?138,"Trying to break"
	.GSTR STR?139,"pick"
	.GSTR STR?140,"pour"
	.GSTR STR?141,"Pushing"
	.GSTR STR?142,"put anything under"
	.GSTR STR?143,"Lifting"
	.GSTR STR?144,"You feel something "
	.GSTR STR?145,"Touching"
	.GSTR STR?146,"person"
	.GSTR STR?147,"what you want to say"
	.GSTR STR?148," doesn't seem to want to go."
	.GSTR STR?149,"Why would you want to shoot a friend?"
	.GSTR STR?150,"You hear a scream from the others.""The Anjin-san has gone mad!"" they yell.You are quickly overcome and dispatched, as a mad dog would be."
	.GSTR STR?151,"smells"
	.GSTR STR?152,"talk to"
	.GSTR STR?153,"Domo."
	.GSTR STR?154,"take them off"
	.GSTR STR?155,"throw anything off"
	.GSTR STR?156,"unlock"
	.GSTR STR?157,"The tiny metal balls on the floor have needle spikes.You step on one in your hurry, and find that they are poisoned!The fiery pain shoots up your leg, and in no time you fall to the floor in agony."
	.GSTR STR?158,"specify a direction."
	.GSTR STR?159,"Waving"
	.GSTR STR?160,"wear"
	.GSTR STR?161,"take off "
	.GSTR STR?162,"Karma, neh?"
	.GSTR STR?163,"Not likely!"
	.GSTR STR?164,"That would never work!"
	.GSTR STR?165,"You can't be serious."
	.GSTR STR?166,"plug in"
	.GSTR STR?167,"unplug"
	.GSTR STR?168,"down"
	.GSTR STR?169,"up"
	.GSTR STR?170,"out"
	.GSTR STR?171,"write on"
	.GSTR STR?172,"ring"
	.GSTR STR?173,"noh"
	.GSTR STR?174,"tear"
	.GSTR STR?175,"ship"
	.GSTR STR?176,"You have removed"
	.GSTR STR?177,"supply a direction, instead."
	.GSTR STR?178,"You can't reach "
	.GSTR STR?179,"teki"
	.GSTR STR?180,"Holding up"
	.GSTR STR?181,"You already are."
	.GSTR STR?182,"You kneel abjectly."
	.GSTR STR?183,"text"
	.GSTR STR?184,"background"
	.GSTR STR?185,"Pick a color:"
	.GSTR STR?186,"no change"
	.GSTR STR?187,"the default color"
	.GSTR STR?188,"black"
	.GSTR STR?189,"red"
	.GSTR STR?190,"green"
	.GSTR STR?191,"yellow"
	.GSTR STR?192,"blue"
	.GSTR STR?193,"magenta"
	.GSTR STR?194,"cyan"
	.GSTR STR?195,"white"
	.GSTR STR?196,"light gray"
	.GSTR STR?197,"gray"
	.GSTR STR?198,"dark gray"
	.GSTR STR?199,"You are making little sense."
	.GSTR STR?200,"It's not clear what you are getting at."
	.GSTR STR?201,"warn"
	.GSTR STR?202,"pull"
	.GSTR STR?203,"word"
	.GSTR STR?204,"letter"
	.GSTR STR?205,"verb"
	.GSTR STR?206,"It's not easy to tell "
WHO-KNOWS-STRING=STR?206
	.GSTR STR?207,"F"
	.GSTR STR?208,""
	.GSTR STR?209,"There's no number "
	.GSTR STR?210,"There aren't any "
	.GSTR STR?211,"There is no response."
	.GSTR STR?212,"man"
	.GSTR STR?213,"men"
	.GSTR STR?214,"You'll have to address an individual to get a response."
	.GSTR STR?215,"woman"
	.GSTR STR?216,"women"
	.GSTR STR?217,"You are beginning to give way to madness, I see."
	.GSTR STR?218,"eta"
	.GSTR STR?219,"It would be a good trick, and somewhat amusing, to get into a boat while it's still on deck, but not a good idea."
	.GSTR STR?220,"You hit your head on a piling as you attempt this feat."
	.GSTR STR?221,"one"
	.GSTR STR?222,"two"
	.GSTR STR?223,"three"
	.GSTR STR?224,"four"
	.GSTR STR?225,"five"
	.GSTR STR?226,"six"
	.GSTR STR?227,"seven"
	.GSTR STR?228,"eight"
	.GSTR STR?229,"nine"
	.GSTR STR?230,"ten"
	.GSTR STR?231,"eleven"
	.GSTR STR?232,"twelve"
	.GSTR STR?233,"thirteen"
	.GSTR STR?234,"fourteen"
	.GSTR STR?235,"fifteen"
	.GSTR STR?236,"sixteen"
	.GSTR STR?237,"seventeen"
	.GSTR STR?238,"eighteen"
	.GSTR STR?239,"nineteen"
	.GSTR STR?240,"twenty"
	.GSTR STR?241,"Wakarimasen, Anjin-san"
	.GSTR STR?242,"Domo, genki desu"
	.GSTR STR?243,"Wakarimasen, Anjin-san."
	.GSTR STR?244,"get closer to her"
	.GSTR STR?245,"Sitting at the bottom of the steps are your boots."
	.GSTR STR?246,"take off your boots"
	.GSTR STR?247,"priest"
	.GSTR STR?248,"Father Sebastio"
	.GSTR STR?249," He owns this whole province."""
	.GSTR STR?250,"""I'm not here to answer your questions, pirate!"""
	.GSTR STR?251,"Que va!"
	.GSTR STR?252,"young man"
	.GSTR STR?253,"Omi"
OMI-NAME=STR?253
	.GSTR STR?254,"i am"
	.GSTR STR?255,"Haku"
	.GSTR STR?256,"Onna"
	.GSTR STR?257,"Yaemon"
	.GSTR STR?258,"karma"
	.GSTR STR?259,"seppuku"
	.GSTR STR?260,"""Perhaps you were mistaken.We're safe now."""
	.GSTR STR?261,"""Yabu has betrayed us, then.When this is over, Lord Toranaga must be told!"""
	.GSTR STR?262,"""But do you still think he plans to betray us?"""
	.GSTR STR?263,"You have never seen anyone so petite.You feel you could pick her up with one hand"
	.GSTR STR?264,"You reconsider.You would both die if you interrupted the ceremony."
	.GSTR STR?265,"You stop, realizing you were about to shoot the woman you love."
	.GSTR STR?266,"You fire the pistol, killing Mariko instantly.The ninja are enraged.It seems clear they were ordered to take Mariko alive at any cost.The leader stares at you, seems to hesitate, and then comes to a decision.You die moments later."
	.GSTR STR?267,"  The witnesses stare at you in shock, at your incredible barbarian rudeness in interrupting the ceremony.Yabu seems particularly incensed.His sword is ready in no time..."
	.GSTR STR?268,"daimyo's"
	.GSTR STR?269,"You've seen his speed with the killing sword.You aren't sure you could shoot him before he kills you."
	.GSTR STR?270,"Before you can finish aiming it at Yabu, his sword slashes through the air like an arc of silver and removes your head."
	.GSTR STR?271,"Yabu is too far away."
	.GSTR STR?272,"I am no longer a barbarian!"
	.GSTR STR?273,"Neh?"
	.GSTR STR?274,"He is dressed in the Gray uniform."
	.GSTR STR?275,"Ishido looks intensely pleased at your foolishness, and with a prideful bow to all around you, hews off your head.""Thus I deal with barbarian dogs!"" he shouts."
	.GSTR STR?276,"Toranaga doesn't reply."
	.GSTR STR?277,"Such disrespect could be fatal."
	.GSTR STR?278,"Your disrespect costs you your life."
	.GSTR STR?279,"Hiro-matsu"
	.GSTR STR?280,"Mariko translates for you, then "
	.GSTR STR?281,"Mariko translates for you, then asks "
	.GSTR STR?282,"seaman"
	.GSTR STR?283,"You think again.Will this Portuguese tolerate wrong answers?This is no time for foolishness."
	.GSTR STR?284,"Did you sleep well?"
	.GSTR STR?285,"Thank you, from an inferior to a superior."
	.GSTR STR?286,"What's your nationality?"
	.GSTR STR?287,"Quite well."
	.GSTR STR?288,"So sorry."
	.GSTR STR?289,"How are you?"
	.GSTR STR?290,"Good day."
	.GSTR STR?291,"Where are you from?"
	.GSTR STR?292,"There's nothing that can be done."
	.GSTR STR?293,"Do you have an interpreter?"
	.GSTR STR?294,"Do you understand?"
	.GSTR STR?295,"porter"
	.GSTR STR?296,"pilot"
	.GSTR STR?297,"very much"
	.GSTR STR?298,"ten thousand years"
	.GSTR STR?299,"Way of the Warrior"
	.GSTR STR?300,"tea"
	.GSTR STR?301,"tea ceremony"
	.GSTR STR?302,"Lord"
	.GSTR STR?303,"thank you"
	.GSTR STR?304,"please"
	.GSTR STR?305,"outcast"
	.GSTR STR?306,"yes"
	.GSTR STR?307,"hurry"
	.GSTR STR?308,"no"
	.GSTR STR?309,"question"
	.GSTR STR?310,"litter"
	.GSTR STR?311,"evil spirit"
	.GSTR STR?312,"forbidden"
	.GSTR STR?313,"good day"
	.GSTR STR?314,"good evening"
	.GSTR STR?315,"water"
	.GSTR STR?316,"eh?"
	.GSTR STR?317,"Japan"
	.GSTR STR?318,"masterless samurai"
	.GSTR STR?319,"suicide"
	.GSTR STR?320,"screen"
	.GSTR STR?321,"mat"
	.GSTR STR?322,"enemy"
	.GSTR STR?323,"friend"
	.GSTR STR?324,"grulla (Spanish), grue (French), crane (English)"
	.GSTR STR?325,"translator"
	.ENDSEG

	.SEGMENT "AFTERMATH"

	.GSTR STR?664,"Toranaga is checking the girths of his saddle.Deftly he knees the horse in the belly, her stomach muscles relax, and he tightens the strap another two notches.Rotten animal, he thinks, despising horses for their constant trickeries and treacheries and ill-tempered dangerousness.He waits a moment and knees the horse hard again.The horse grunts and rattles her bridle and he tightens the straps completely.

""Good, Sire!Very good,"" the Hunt Master says with admiration.""Many would have been satisfied the first time."""
	.GSTR STR?665,"This is the stable area of the camp at Anjiro."
	.GSTR STR?666,"Toranaga looks annoyed.""Please answer the question, Anjin-san."""
	.GSTR STR?667,"""What did the message say, Anjin-san?"""
	.GSTR STR?668,"neh"
	.GSTR STR?669,"Neh"
	.GSTR STR?670,"The Lady"
	.GSTR STR?671,"sealed scroll"
	.GSTR STR?672,"Build another."
	.GSTR STR?673,"break the seal"
	.GSTR STR?674,"scroll"
	.SEGMENT "NINJA"

	.GSTR STR?625,"ninja"
	.ENDSEG

	.SEGMENT "YOKOHAMA"

	.GSTR STR?660,"You recuperate for a few days, and then, to your surprise, your guards are gone.You are taken down to the dock, where you are met by the Captain-General of the Black Ship, Ferriera, and dell'Aqua, the Father-Visitor of the Jesuits.

Dell'Aqua says, ""Pilot, I'm taking you to your galley.Are you all right?""

""You're really letting me go?Why?""

""Because the Lady Mariko asked us to protect you.""

""But that's no reason!You wouldn't do that just because she asked you.""

""I agree,"" Ferriera says.""Eminence, why not tell him the whole truth?""

""It doesn't make sense.You know I'm going to destroy you.I'll take your Black Ship.""

Ferriera laughs scornfully.""With what, Ingeles?You have no ship!"""
	.GSTR STR?661,"tai-fun"
	.GSTR STR?662,"You take another look at Vinck's mad eyes, and think better of it."
	.GSTR STR?663,"Shigata ga nai, neh?"
	.ENDSEG

	.SEGMENT "NINJA"

	.GSTR STR?608,"You continue loading the pistol.Next"
	.GSTR STR?609,"You're supposed to be following him, not talking to him!"
	.GSTR STR?610,"kinjiru"
	.GSTR STR?611,"It is early in the morning of the day after Mariko's confrontation, two or three hours before dawn.After she woke, you and Mariko had an hour alone together.""I still cannot believe that Ishido gave in,"" she said.""I knew it was my karma to bring the hostages out of Osaka.Only I could do that for Lord Toranaga.And now it's done.But at what a cost, neh?Madonna forgive me.""

Now you, Mariko, Kiri, Lady Etsu, and Achiko, the granddaughter of Kiyama, are together in Mariko's quarters.You are still suspicious enough of Ishido's intentions to be carrying your pistol."
	.GSTR STR?612,"This is a smaller room, part of Mariko's quarters.The Lady Etsu has been staying here."
	.GSTR STR?613,"This is a small room in which you are quartered."
	.GSTR STR?614,"You open the first bolt."
	.GSTR STR?615,"You open the second bolt."
	.GSTR STR?616,"You open the third bolt."
	.GSTR STR?617,"You close the first bolt."
	.GSTR STR?618,"You close the second bolt."
	.GSTR STR?619,"You close the third bolt."
	.GSTR STR?620,"The iron-bound door lies shattered in a corner."
	.GSTR STR?621,"This is a small balcony surrounded by a low battlement.The night air is cool and sweet here after the smoke and confusion inside.The only exit is back into the redoubt.This is as far as you can retreat."
	.GSTR STR?622,"You plunge to your death."
	.GSTR STR?623,"This is a waiting room outside Mariko's quarters.There are shoji screens all around.One opens north to the private rooms, and one south to the inner corridor."
	.GSTR STR?624,"One of the ninja notices you lurking in the dark, and quickly and quietly you are surrounded, overpowered, and killed."
	.GSTR STR?626,"This is the main staircase leading from the tower to the cellars of Toranaga's keep at Osaka."
	.GSTR STR?627,"This is a crowded, narrow room full of servants.Many of them are asleep.Others are kneeling, head to flagstones.A stairway leads down to the cellars from here."
	.GSTR STR?628," are surprised by a force of attacking ninja!They are equally surprised, but react more quickly."
	.GSTR STR?629,"If you were to emerge from hiding, you would be seen."
	.GSTR STR?630,"This inner corridor is between the Audience Chamber to the west, and the inner apartments of the keep to the north.A sturdy iron-barred door separates the Audience Chamber and the corridor."
	.GSTR STR?631,"You realize you're getting too close to Yabu, so you wait instead of walking."
	.GSTR STR?632,"This is a secret room south of the Audience Chamber. A dark and narrow stairway leads down as well."
	.GSTR STR?633,"You suddenly realize that the ninja have probably left a rear guard, and decide not to follow."
	.GSTR STR?634,"You walk right into the ninja rear guard, which is lurking in the darkness."
	.GSTR STR?635," stop you from closing the door."
	.GSTR STR?636,"You can't see "
	.GSTR STR?637,"You can't open "
	.GSTR STR?638,"You can't close "
	.GSTR STR?639," you from barring the door."
	.GSTR STR?640," are surprised by a force of attacking ninja!They are equally surprised, but react quickly."
	.GSTR STR?641,"The sounds of "
	.GSTR STR?644,"The guards, assuming this is some sort of betrayal, respond to your attack by killing you."
	.GSTR STR?645," following the ninja, trying to keep up with them as they take Mariko."
	.GSTR STR?646,"Your pistol shatters the quiet of the cellars.Yabu turns, shocked, and realizes you have been following him.He charges, sword drawn, and dispatches you before you can escape."
	.GSTR STR?647,"The ninja overpower Mariko"
	.GSTR STR?648," and quickly begin forcing her back towards the exit."
	.GSTR STR?649,"You hear the sounds of a struggle"
	.GSTR STR?650,"struggle continue."
	.GSTR STR?651,"Satisfying themselves as to your abilities, they close in and moments later, you are knocked out by a blow you didn't even see."
	.GSTR STR?652,"At the last second, you remember that ninja are famous for using poison."
	.GSTR STR?653,"Unlike caltrops in Europe, these are poisoned!Almost immediately you feel a searing pain in your hand.Within moments you are writhing on the floor."
	.GSTR STR?654,"dragging a struggling Mariko with them."
	.GSTR STR?655,"pulling Mariko along."
	.GSTR STR?656,"several manhandling Mariko into step with them."
	.GSTR STR?657,"Mariko being pushed along ahead of them."
	.GSTR STR?658,"The explosion blows you aside as the door wrenches loose from its hinges and blasts into the room"
	.GSTR STR?659," The explosion blows you aside as the door wrenches loose from its hinges and blasts into the room"
	.SEGMENT "AUDIENCE"

	.GSTR STR?483,"tsuyaku"
	.ENDSEG

	.SEGMENT "NINJA"

	.SEGMENT "PRISON"

	.GSTR STR?643,"You attack the captain.Surprised, and assuming you are part of some scheme of betrayal, he fights back, and you are dispatched quickly."
	.GSTR STR?642,"The other guards turn and immediately assume this is a betrayal.They cut you down in short order."
	.ENDSEG

	.SEGMENT "NINJA"

	.SEGMENT "AUDIENCE"

	.GSTR STR?487,"You would have to walk right through the ninja!"
	.GSTR STR?486,"You think, and decide that a show of pride is one thing, a show of contempt another."
	.GSTR STR?484,"You remember Rodrigues' advice, and decide not to test the local sense of humor."
	.GSTR STR?482,"You can't break through the encircling ninja!"
	.GSTR STR?481,"You take your leave of Rodrigues, and then you are on deck, your mind whirling from the impact of Osaka, its immensity, the teeming anthills of people, and the enormous castle that dominates the city.From within the castle's vastness comes the soaring beauty of the donjon, seven or eight stories high, pointed gables with curved roofs at each level, the tiles all gilded and the walls blue.

The next day you are brought by Hiro-matsu to Toranaga's keep within the castle."
	.GSTR STR?485,"Toranaga speaks angrily to Hiro-matsu.Alvito translates.""This is no time for jokes.You have made one joke too many, Englishman!"""
	.ENDSEG

	.SEGMENT "SEPPUKU"

	.GSTR STR?605,"untie it"
	.GSTR STR?606,"You don't have it."
	.GSTR STR?607,"cha-no-yu"
	.SEGMENT "ESCAPE"

	.GSTR STR?535,"Just after dusk Kiri waddled nervously down the steps.She headed for her curtained litter that stood near the little tea house just inside the garden.You are leaning against the wall near the fortified gate.You are wearing a belted kimono of the Browns and tabi socks and military thongs."
	.GSTR STR?602,"In a sudden hush, Mariko's maid Chimmoko comes out of the small gates to the garden and walks over to you and bows.""Anjin-san, please excuse me, my Mistress wishes to see you.I will escort you.""

You get up, still deep in your reverie and your overpowering sense of doom.The shadows are long now.

Chimmoko goes over to Sumiyori.""Please excuse me, Captain, but my Lady asks you to please prepare everything.""

""Where does she want it done?""

The maid points to the space in front of the arch.""There, Sire.""

Sumiyori is startled.""It's to be in public?She's doing it for all to see?But, well ... what about her second?""

""She believes Lord Kiyama will honor her.""

""And if he doesn't?""

""I don't know, Captain.She hasn't told me.""Chimmoko bows and then goes back to the gates and beckons you.The Grays begin to follow but Chimmoko shakes her head and says her mistress had not bidden them.They allow you to leave and you follow the servant into the garden."
	.SEGMENT "DEPARTURE"

	.GSTR STR?538,"Mariko walks up the crowded sunlit avenue toward the gates in the cul-de-sac.Behind her is a bodyguard of Browns.Unlike the Grays lining the avenue and watching from the battlements, none have armor or carry bows.Swords are their only weapons.

Mariko gets into her palanquin and sits.""Yoshinaka-san!Please begin."""
	.GSTR STR?539,"You'd never get away!It's a fight to the finish."
	.ENDSEG

	.SEGMENT "ESCAPE"

	.SEGMENT "SEPPUKU"

	.GSTR STR?604,"The tea house is small, simple, and immaculate.The doorway is small so that all will be humble, equal, the host and guest, the most high Lord and the merest samurai."
	.GSTR STR?603,"It is like a different world within the garden gates, verdant and serene, the sun on the treetops, birds chattering and insects foraging, the brook falling sweetly into the lily pond.A tiny thatch-roofed tea house is beside the garden gate.The courtyard of the keep, a world away, is to the east."
	.SEGMENT "DEPARTURE"

	.GSTR STR?540,"Your opponent, who until now has shown reluctance to do you real harm, sees you attempting to flee, and charges you.He attacks viciously, overwhelming your inexpert defense.In moments, you are cut down."
	.ENDSEG

	.SEGMENT "DEPARTURE"

	.GSTR STR?592,"""You will not pass without papers!"""
	.GSTR STR?593,"The Captain leaps forward, his sword a whirling arc directed at your head!"
	.GSTR STR?594,"The Captain swings his sword, chopping viciously at your knees."
	.GSTR STR?595,"The Captain charges at you, his sword pointed straight at your belly."
	.GSTR STR?596,"The Captain screams ""Yaemon!"" and begins an overhand blow toward your head."
	.GSTR STR?597,"You swing, wishing for luck, for good karma, for a pistol, by God!He parries, but the force of your blow is strong, and the tip manages to carve into his wrist."
	.GSTR STR?598,"You hold the blade before you, stabbing almost wildly with it, wondering why his attack is so formal.You see an opening and plunge madly forward, wounding him in the chest."
	.GSTR STR?599,"You interpose your blade, and there is a ringing, almost bell-like crash as they meet.You slide your blade around and manage to wound him.He seems almost surprised."
	.GSTR STR?600,"Leaping and yelling, you charge him, and in an astonishing flurry he fights back, executing a daring turn and riposte, but he's off balance and you slice the back of his calf."
	.GSTR STR?601,"The Captain, having decided you are a barbarian without honor, removes your head."
	.ENDSEG

	.SEGMENT "OCHIBA"

	.GSTR STR?588,"Your feet take you under the final portcullis and your escorts lead you up to the huge door.Here they leave you alone.Desperate for any distraction from the ordeal to come, you admire the camellia blossom Mariko took from a vase in your quarters and gave to you.The flower is reassuring.Not everyone here in Osaka is an enemy.

You stand rigid for a moment, petrified with nervousness.What if you disgrace yourself?What if you slip or your swords fall or your limited Japanese fails you.You take a deep breath and walk forward into the flare-lit maw."
	.GSTR STR?589,"It is an immense, high-raftered room with a golden ornamented ceiling.Gold-paneled columns support the rafters, which are made of rare and polished woods.Five hundred samurai and their ladies are here, wearing all the colors of the rainbow.To one side is a line of guests who wait to bow before the raised platform at the far end."
	.GSTR STR?590,"barbarians"
	.GSTR STR?591,"today"
	.SEGMENT "YOKOSE"

	.GSTR STR?587,"neh?"
	.ENDSEG

	.SEGMENT "YOKOSE"

	.GSTR STR?575,"Toranaga tells everyone he will head up the east road toward Atami and Odawara, thence over the mountains to Yedo.Mariko is given permission to go to Osaka.""But first you'll go directly from here to Mishima, then continue on to Yedo with the Anjin-san.You're responsible for him until you arrive.""

Buntaro turns to Mariko.""Sayonara -- until I see you at Osaka.When we meet there or when you return from there, then we begin again.""

""Sayonara, my Lord.""Mariko bows.He swings into his saddle and is off toward the head of the column.

""Go with God,"" she says, and you watch her eyes following Buntaro.

The journey to Mishima takes nine days, and every night, for part of the night, you are together.Secretly.Your escort, Captain Akira Yoshinaka, unwittingly makes it easier by placing you in adjoining rooms.

Tonight the group arrives at Yokose Spa, road-weary and dirty from the journey.Everyone is anxious for a bath and a night's sleep -- or other relaxation."
	.GSTR STR?576,"This is the bath house outside the inn at Yokose.The first floor of the inn is to the west."
	.GSTR STR?577,"get in the tub"
	.GSTR STR?578,"This is your room at the spa at Yokose.The corridor is outside, and Mariko's room is next to yours, but accessible only from the corridor."
	.GSTR STR?579,"This is a room at the spa at Yokose.The corridor is outside."
	.GSTR STR?580,"This is the corridor outside the rooms.It continues north and there are rooms to the east and west."
	.GSTR STR?581,"catch a fleeting glimpse of Yoshinaka.Heart pounding, you slip the shoji closed."
	.GSTR STR?582,"seeing no one, slip out.Suddenly, Yoshinaka appears out of nowhere.Mariko screams, and Yoshinaka looks almost regretful as he takes your head."
	.GSTR STR?583,"This is the corridor outside the rooms.It continues north and south and there are rooms to the east and west."
	.GSTR STR?584,"This is the corridor outside the rooms.It continues south and there are rooms to the east and west.A stair leads down."
	.GSTR STR?585,"This is the first floor of the spa at Yokose.A stair leads up to the private rooms.To the east is the bath house."
	.GSTR STR?586,"There is a moment of silence outside the door.Then, with a burst, the shoji is thrown aside!Yoshinaka charges into the room, sword drawn.Mariko screams, knowing your fate is sealed.Caught!If only the two of you had been less love-besotted, more careful!But it was a love doomed from the start, as Mariko always knew."
	.SEGMENT "PIT"

	.GSTR STR?427,"There wouldn't be room for so many!"
	.GSTR STR?434," outside the tub and out of reach."
	.ENDSEG

	.SEGMENT "YOKOSE"

	.SEGMENT "QUAKE"

	.GSTR STR?572,"Karma"
	.ENDSEG

	.SEGMENT "YOKOSE"

	.SEGMENT "PIT"

	.GSTR STR?431,"get out of the tub"
	.GSTR STR?436,"It's much too heavy!"
	.GSTR STR?432,"You'd get it wet!"
	.GSTR STR?428," smiles at your invitation, but shakes "
	.GSTR STR?439,"You try to drink the scalding bathwater, but it's far too hot."
	.GSTR STR?438,"You climb gingerly up and over the side of the tub, and ease yourself in.The water is scalding!"
	.GSTR STR?437,"And waste all that nice hot water?"
	.GSTR STR?433,"You would drown."
	.GSTR STR?435,"The tub is wooden, large enough for several people, and deep enough that they could sit in it with only their heads above water."
	.GSTR STR?429," would probably be worse for the experience."
	.ENDSEG

	.SEGMENT "QUAKE"

	.GSTR STR?566,"You sit cross-legged in front of Toranaga, swords in his sash.Mariko is explaining something to you.""War is coming,"" she says.""When?"" you ask.""Very soon, so you are to leave at once with me.I'm going to Osaka, you are to accompany me part of the way, but you're going on to Yedo to prepare your ship for war."""
	.GSTR STR?567,"You reach out for Toranaga as he begins to fall, and you grab his sash, but you've lost your precarious balance on the ledge.Both of you tumble into the pit."
	.GSTR STR?568,"Dozo"
	.GSTR STR?569,"Tomo, neh?"
	.GSTR STR?570,"The fissure swallows you like a snake eating a bird."
	.GSTR STR?571,"You lay full length on the ground and look up at the sky.A moment ago you were all "
	.GSTR STR?573,"There are no longer any footholds or ledges."
	.GSTR STR?574," wall, standing precariously on a narrow ledge."
	.SEGMENT "MAZE"

	.GSTR STR?565,"ronin"
	.ENDSEG

	.SEGMENT "QUAKE"

	.SEGMENT "PRISON"

	.GSTR STR?509,"Domo"
	.ENDSEG

	.SEGMENT "ANJIRO"

	.GSTR STR?370,"This is a small garden surrounded by a high wall.It is unlike anything you have ever seen: a little waterfall and stream and a small bridge and manicured pebbled paths and rocks and flowers and shrubs.It's so clean, so neat.The house is to the west, the village to the east."
	.GSTR STR?371,"It sounds like a group of people."
	.GSTR STR?377,"Omi prevents you, threatening with his still-bloody sword."""
	.GSTR STR?378,"Ikinasai"
	.GSTR STR?379,"What sizzle!"
	.GSTR STR?380,"Ikinasai!"
	.GSTR STR?381,"One of the priest's henchmen gives you a chop on the windpipe, crushing it.You fall to the ground, choking and gasping, and then you die."
	.GSTR STR?382,"What's your nationality"
	.GSTR STR?384,"Where did you sail from"
	.GSTR STR?385,"Are you the leader"
	.GSTR STR?386,"Nanigoto da?"
	.GSTR STR?387,"NANIGOTO DA?"
	.GSTR STR?388,"Doko no kuni no monoda?"
	.GSTR STR?389,"Onushi ittai doko kara kitanoda?"
	.GSTR STR?390,"Omi scowls at you, then begins to laugh uproariously.In one swift stroke he removes your head."
	.GSTR STR?391,"You awaken suddenly.For a moment you think you are dreaming, because you are ashore and in a small, clean room whose floor is covered with soft mats.You are lying on a thick quilt.

You realize that you aren't dreaming because you are terribly hungry."
	.GSTR STR?392,"The room is filled with muted light shining through the opaque paper that fills squares of cedar lath.The ceiling is polished cedar."
	.GSTR STR?393,"You collapse from accumulated weakness and hunger."
	.GSTR STR?394,"Hanging on the wall is a crucifix."
	.GSTR STR?395,"Goshujinsama, gokibun wa ikaga desu ka?"
	.SEGMENT "RODRIGUES"

	.GSTR STR?399,"Kasigi Yabu-sama!Kinjiru!"
	.GSTR STR?400,"Hotte oke!"
	.GSTR STR?401,"Kinjiru!"
	.ENDSEG

	.SEGMENT "ANJIRO"

	.SEGMENT "PIT"

	.GSTR STR?396,"middle-aged woman"
	.ENDSEG

	.SEGMENT "ANJIRO"

	.SEGMENT "RODRIGUES"

	.GSTR STR?403,"In a flash, the samurai indicate that you have wasted too much of their time and patience.You cannot benefit from this decision, as an instant later you are dead."
	.GSTR STR?402,"KINJIRU!"
	.GSTR STR?373,"old man"
	.GSTR STR?376,"You plunge into the water.All too soon, you realize you were more tired than you originally thought.You struggle to return to the boat, but you aren't strong enough to pull yourself aboard."
	.GSTR STR?375,"You reconsider.You are very tired, and might not be able to stay afloat."
	.SEGMENT "ERASMUS"

	.GSTR STR?344,"You would fall overboard."
	.ENDSEG

	.SEGMENT "RODRIGUES"

	.SEGMENT "ANJIRO"

	.GSTR STR?374,"The villagers stare at you, and the little children laugh and point.They've never seen a naked barbarian before."
	.GSTR STR?372,"The next day you walk down the hill, four samurai flanking you.Ahead the street curves with the contour of the hillside, slides down toward the harbor."
	.SEGMENT "ERASMUS"

	.GSTR STR?346,"The gangways are fore and aft.Down is ambiguous."
	.ENDSEG

	.SEGMENT "ANJIRO"

	.SEGMENT "PIT"

	.GSTR STR?397,"She stares at you uncomprehendingly"
	.ENDSEG

	.SEGMENT "ANJIRO"

	.SEGMENT "YABU"

	.GSTR STR?383,"i sailed from"
	.ENDSEG

	.SEGMENT "ANJIRO"

	.SEGMENT "RODRIGUES"

	.GSTR STR?404,"They efficiently fill their function as guards."
	.GSTR STR?398,"Stretched across each doorway is a red silk ribbon."
	.ENDSEG

	.SEGMENT "YABU"

	.GSTR STR?405,"The next day, you and your crewmen are brought before the daimyo.Samurai slam all of you on your knees and push your heads into the dust."
	.GSTR STR?406,"Father Sebastio translates your answer."
	.GSTR STR?407," screams the priest."
	.GSTR STR?408,"filthy barbarian pirate"
	.GSTR STR?409,"mannerless freak"
	.GSTR STR?410,"barbarian ape"
	.GSTR STR?411,"The priest confers with Yabu.""Yabu says "
	.GSTR STR?412,"i sailed"
	.GSTR STR?413,"Ano mono wa nani o moshite oru?"
	.SEGMENT "ERASMUS"

	.SEGMENT "PIT"

	.GSTR STR?367," Almost exactly one year ago the fleet reached Tierra del Fuego, the winds favorable for the stab into the unknown of Magellan's Pass.But the Captain-General had ordered a landing to search for gold and treasure.The fleet had been forced to winter in the harsh southern wastes, and it was four months before they could sail.By then, one hundred and fifty six men had died of starvation and cold."
	.GSTR STR?368," responds with little enthusiasm."
	.GSTR STR?369,"The only responses are muttered curses in Dutch."
	.ENDSEG

	.SEGMENT "PIT"

	.GSTR STR?414,"At Yabu's order, the samurai herd you and your crew across the square, down a ladder, and underground.A trap door locks above you."
	.GSTR STR?415,"Isogi"
	.GSTR STR?416,"The samurai are hampered by the confined space, but a kick from one of them catches Vinck in the face and he reels away."
	.GSTR STR?417,"Almost immediately, the samurai surround you, truss you up, and dump you in the huge iron cauldron.The fire beneath it is lit, the water begins to heat up.

At first the heat is almost pleasant, but then it begins to sear into your exhausted flesh, and you struggle vainly to break your bonds.You begin to scream.

Just as you lose consciousness, you see the samurai bringing up Vinck, and you can't help but wonder what would have happened had you resisted."
	.GSTR STR?418,"samurai guards"
	.GSTR STR?419,"Kinjiru"
	.GSTR STR?420,"!"" you say, remembering the word from the ship.""None of my crew is walking to death without a fight!""

""It's all right, Pilot,"" Vinck whispers.""We did agree and it was fair.It's God's will.I'm going."""
	.GSTR STR?421,"Two of the samurai prevent you, and although you struggle, they hold you easily."
	.GSTR STR?422,"Omi snarls orders to his men.At once a samurai, followed by two others, starts down the steps, swords unsheathed."
	.GSTR STR?423,"He appears to be unconscious."
	.GSTR STR?425,"attacking samurai"
	.GSTR STR?426,"hai"
	.GSTR STR?430,"Dozo, Anjin, gomen nasai."
	.GSTR STR?440,"cha"
	.SEGMENT "PRISON"

	.GSTR STR?424,"He doesn't respond."
	.ENDSEG

	.SEGMENT "RODRIGUES"

	.GSTR STR?441,"The watching Japanese don't know what's gone wrong, but assume you're trying to escape.A flight of arrows ends your life."
	.GSTR STR?443,"Kinjiru, neh?"
	.GSTR STR?444,"i trained at"
	.GSTR STR?445,"the latitude is"
	.GSTR STR?446,"ichi ban"
	.GSTR STR?447,"Wakarimasu ka?"
	.GSTR STR?448,"Erasmus."
	.GSTR STR?449,"One of the archers fires an arrow with incredible accuracy.It takes Rodrigues in the back, and he falls.The second arrow takes you."
	.GSTR STR?451,"Kinjiru,"
	.GSTR STR?452,"WAKARIMASU KA?"
	.GSTR STR?453,"""You're a stubborn bastard, Ingeles!""Rodrigues says a few words of gutter Japanese to the samurai, and you are bound and hustled off to a cramped cabin below decks on the galley.

You spend an awful night below, and the next day when the storm catches the galley, you wish you were on deck, helping.When the sea pours in and the galley sinks, you wish so even more strongly."
	.GSTR STR?454,"Kinjiru, gomen nasai,"
	.SEGMENT "VOYAGE"

	.GSTR STR?442,"Isogi!"
	.ENDSEG

	.SEGMENT "RODRIGUES"

	.SEGMENT "ERASMUS"

	.GSTR STR?347,"The Captain's cabin is aft of here.Your cabin is to port, and the Mates' cabin to starboard.The main deck is forward of here."
	.ENDSEG

	.SEGMENT "RODRIGUES"

	.SEGMENT "MARIKO"

	.GSTR STR?450,"Konnichi wa"
	.ENDSEG

	.SEGMENT "VOYAGE"

	.GSTR STR?456,"You are in the raging sea between the galley and the rocky, wave-tormented shore."
	.GSTR STR?457,"It is near noon and you are standing on the quarterdeck of the galley under an overcast sky.During the first night the galley had sped southward down the east coast of the Izu peninsula.When it came abreast of the southmost cape, Cape Ito, Rodrigues had set the course West South West and had left the safety of the coast for the open sea, heading for a landfall at Cape Shinto two hundred miles away.

""What do you think, Ingeles?"" asks Rodrigues.
""I think there'll be a storm,"" you reply.
""When?""
""Before sunset"" you answer.

The storm comes before sunset and catches you out to sea.Land is ten miles away."
	.GSTR STR?458,"untie your safety line first"
	.GSTR STR?459,"You would surely drown."
	.GSTR STR?460,"cojones"
	.GSTR STR?463,"daimyos"
	.GSTR STR?464,"""Filthy heretic pig!You're no pilot, you're the son of a motherless sow!""Rodrigues smashes you in the head for your cowardice."
	.GSTR STR?465,"The galley is smashed against the rocks of the headland."
	.GSTR STR?466," Rodrigues yells at you, ""Ingeles, "
	.GSTR STR?467,"The ship smashes onto the rocks!If only you'd dropped anchor in time, she might have survived.How humiliating."
	.GSTR STR?468,"The galley is now full in the jaws of the storm.The waves toss the galley about, and one huge comber crashes over the port gunwale, and she's sinking!"
	.GSTR STR?469,"A wooden life ring hangs nearby."
	.GSTR STR?470,"You can't see Rodrigues anywhere nearby."
	.GSTR STR?471,"The beach here consists of small, rounded pebbles.To the south the cliff rises behind a field of larger rocks.Riding at anchor in the bay is Toranaga's galley."
	.GSTR STR?472,"There is no sign of Rodrigues."
	.GSTR STR?473,"Inland from the shore the pebbles become sea-smoothed rocks.To the south is a path leading along the cliffs and around the headland.To the north is the bay where the galley rides at anchor."
	.GSTR STR?474,"Above you the cliff soars two hundred feet.The white-frothed sea is fifty feet below.All around are mountains, not a house or hut in the whole bay area.The path dips and rises along the cliff face, very unsafe, the surface loose."
	.GSTR STR?475,"Iye"
	.GSTR STR?476,"Bansaiiii!"
	.GSTR STR?477,"You search the foreshore, every crevice and cleft and gulley.The spume wind is gusting, tearing tears from your eyes."
SEARCH-FORESHORE=STR?477
	.GSTR STR?478,"This side of the headland is in the lee of the wind, for which you are very grateful.Half a mile away a small fishing village nestles on the white-frothed shore."
	.GSTR STR?479,"kimono"
	.GSTR STR?480,"rope"
	.SEGMENT "ESCAPE"

	.GSTR STR?461,"There's nothing of interest below decks."
	.GSTR STR?462,"This is the oar deck of the galley, forward of the quarterdeck."
	.ENDSEG

	.SEGMENT "VOYAGE"

	.SEGMENT "PRISON"

	.GSTR STR?455,"Iye!"
	.ENDSEG

	.SEGMENT "VOYAGE"

	.SEGMENT "ERASMUS"

	.GSTR STR?364,"You must specify a direction!"
	.ENDSEG

	.SEGMENT "AUDIENCE"

	.GSTR STR?488,"tonsured priest"
	.GSTR STR?489,"Father Alvito"
	.GSTR STR?490,"""My name is Martin Alvito of the Society of Jesus, Captain-Pilot.Lord Toranaga has asked me to interpret for him."""
	.GSTR STR?491,"""My name is Martin Alvito of the Society of Jesus, Captain-Pilot.Lord Toranaga has asked me to interpret for him.We can speak Portuguese, Spanish, or, of course, Latin -- whichever you prefer,"" Alvito offers smoothly."
	.ENDSEG

	.SEGMENT "PRISON"

	.GSTR STR?492,"Toranaga's guards take you to the prison, strip you, and force you through the door of one of the cell blocks.

At dawn it is feeding time and the guards pass out cups of gruel and water through a small opening.The lining up for food and water is unusually calm -- without discipline no one would eat.You take your ration and pick your way over the bodies toward a corner."
	.GSTR STR?493,"This murky and suffocating room is fifty paces long and ten wide and packed with naked, sweating Japanese.Scarcely any light filters through the boards and beams that make up the walls and low ceiling.A heavy iron door seals the prisoners in."
	.GSTR STR?494,"You butt your head into the man's face."
	.GSTR STR?495,"You kick him in the shins and he skips aside."
	.GSTR STR?496,"You feign momentary helplessness, then kick him viciously."
	.GSTR STR?497,"The man leaps at you, trying to knock you down with a vicious attack."
	.GSTR STR?498,"The prisoner tries to bite you."
	.GSTR STR?499,"The thug kicks out, trying to trip you."
	.GSTR STR?500,"old priest"
	.GSTR STR?501,"Friar Domingo"
	.GSTR STR?503,"""The Japanese truly have but one punishment -- death.They have almost no other punishment.Imprisonment is not one of their punishments, my son.To them, prison is just a temporary place to keep the man until they decide his sentence.Only the guilty come here."""
	.GSTR STR?504,"""Jesuits put me here, my son.Jesuits and their filthy lies."""
	.GSTR STR?505,"""Thy ship was Spanish out of where?I'm so glad!The senor is from Spanish Flanders?Or the Duchy of Brandenburg?Some part of our Dominions in Germania?"""
	.GSTR STR?506,"""Oh, it's so good to talk the blessed mother tongue again."""
	.GSTR STR?507,"""These men are my flock, senor.They are all my sons in the Blessed Lord Jesus.I've converted so many here!"""
	.GSTR STR?508,"""I was put here in September -- it was in the year of our Lord fifteen hundred ninety eight.""You realize with a shock that this was almost two years ago!Two years in this filthy hole!"
	.GSTR STR?510,"arigato"
	.GSTR STR?511,"domo arigato"
	.GSTR STR?512,"Konnichi wa."
	.GSTR STR?513,"domo"
	.GSTR STR?515,"mizu"
	.GSTR STR?516,"Gomen nasai"
	.GSTR STR?517,"Nihon go ga hanase-masen"
	.GSTR STR?518,"gomen nasai"
	.GSTR STR?519,"shunjin"
	.GSTR STR?521," have you surrounded."
	.GSTR STR?522,"No one will let you leave the party."
	.SEGMENT "ESCAPE"

	.GSTR STR?514,"dozo"
	.GSTR STR?502,"kami"
	.SEGMENT "MAZE"

	.GSTR STR?520,"You are already sitting down."
	.ENDSEG

	.SEGMENT "MARIKO"

	.GSTR STR?523,"And at last, Toranaga summons you."
	.GSTR STR?524,"young boy"
	.GSTR STR?525,"You have never seen anyone so petite.You could pick her up with one hand"
	.GSTR STR?526,"Konnichi wa, Toranaga-sama."
	.GSTR STR?527,"Gomen nasai, Toranaga-sama, nihon go ga hanase-masen.Tsuyaku go imasu ka?"
	.GSTR STR?528,"i learned from"
	.ENDSEG

	.SEGMENT "ESCAPE"

	.GSTR STR?529,"You stop partway, realizing you might be disrupting something you know nothing about."
	.GSTR STR?530,"Guards!"
	.GSTR STR?531,"veiled figure"
	.GSTR STR?532,"You reconsider your options.If the Japanese want to hide in tea houses, what concern is it of yours?"
	.GSTR STR?533,", revealing Toranaga!You are stunned, and back off, amazed, but it is too late.The commotion has attracted others, and Toranaga has drawn his sword from beneath the incongruously feminine kimono.His sword is as sharp as it needs to be, though."
	.GSTR STR?534,"You recall how your countrymen would react to someone snatching a lady's clothing, and refrain."
	.GSTR STR?536,"He sees the veiled figure, who immediately draws a sword and surprisingly attacks you rather than Yabu."
	.GSTR STR?537,"He sees Kiritsubo, and emits a yelp of surprise.In moments, others are drawn by the commotion, and as soon as the situation becomes clear, a battle erupts."
	.GSTR STR?541,"The moment for such an action has passed.Now it would be fatal."
	.GSTR STR?542,"Ishido is stunned by your ferocity, shocked by your madness, and amazed by your insolence.His sword, unsurprisingly, is as sharp as it looks, and he uses it well."
	.GSTR STR?543,"Ishido takes a few paces toward the retreating litter."
	.GSTR STR?544,"Toranaga, encumbered by his disguise, is unable even to defend himself.It is only seconds before both he and Ishido are cut down, and not long after, an arrow finds your heart."
	.GSTR STR?545,"Ishido takes a few paces toward the retreating litter, then stops."
	.GSTR STR?546,"This is the last bridge.It leads south over the moat from the last checkpoint."
	.GSTR STR?547,"You plunge into the moat and drown."
	.GSTR STR?548,"This is the last portcullis.To the north is the bridge over the moat.Guards watch you curiously."
	.GSTR STR?549,"This is a wooded area totally out of sight of the castle.To the east is the city proper."
	.GSTR STR?550,"Ishido aims the bow and lets fly.It's a perfect shot.As you die, Ishido says, ""Thus I deal with mad dogs ... and barbarians."""
	.GSTR STR?551,"To take the parchment now would cost you your life!"
	.GSTR STR?552,"You snatch the roll of parchment from Ishido's grasp.He turns, maddened by your insolence.His sword is out of its sheath in no time, and swings toward you..."
	.GSTR STR?553,"The city by night is a fairyland.The rich houses have many colored lanterns, oil-lit and candle-lit, hanging over their gateways and in their gardens, the shoji screens giving off a delightful translucence.Even the poor houses are mellowed by the shojis.Lanterns light the way of pedestrians and kagas, and of samurai on horseback.

The harbor is to the east."
	.GSTR STR?554,"You can't return to the castle now."
	.GSTR STR?555,"You are in a narrow and deserted back street near the dock.The shadows of a nearby warehouse shield the party from the view of anyone on the wharf to the east."
	.GSTR STR?556,"There's no time for that now."
	.GSTR STR?557,"You're already using it."
	.GSTR STR?558,"Mizu, mizu!Hai!Wakarimas?"
	.GSTR STR?559,"Don't waste your effort; he's already dead."
	.GSTR STR?560,"He's too far away to stab."
	.GSTR STR?561,"They're too far away to stab."
	.ENDSEG

	.SEGMENT "MAZE"

	.GSTR STR?562,"This is a dark, deserted street in the middle of Osaka."
	.GSTR STR?563," maze of back streets and alleys."
	.GSTR STR?564,"You make your way through the deserted streets."
	.ENDSEG

	.SEGMENT "ERASMUS"

	.GSTR STR?326,"There's a break in the reef ahead and to starboard!"
	.GSTR STR?327,"That would be suicide in this storm."
	.GSTR STR?328,"get to it"
	.GSTR STR?329,"You struggle to stay afloat in the raging sea, but you are too weak to fight the waves for long, and are dashed against the rocks."
	.GSTR STR?330," wheel spins out of your hands!"
	.GSTR STR?331,"Out of control, the ship spins broadside, and holes against the rocks."
	.GSTR STR?332,"The crewmen whine and groan and pretend you are referring to someone else.You'll have to order specific crewmen to get any results."
	.GSTR STR?333,"Dutch"
	.GSTR STR?334,"crewman"
	.GSTR STR?335,"crewmen"
	.GSTR STR?336,"elsewhere on deck"
	.GSTR STR?337,"on the bridge"
	.GSTR STR?338,"There aren't any crewmen here."
	.GSTR STR?339,"Japanese"
	.GSTR STR?340,"wake him"
	.GSTR STR?341,"Hendrik is muttering to himself.Only a few curses are audible."
	.GSTR STR?342,"Gottbewonden"
	.GSTR STR?343,"The gale tears at you, biting deep within, and you know that if you don't make landfall soon you'll all be dead.You are John Blackthorne, Pilot-Major of a dead fleet: one ship left out of five, eight and twenty men out of one hundred and seven, and only ten of those can walk.Little food, almost no water, and that brackish and foul."
	.GSTR STR?345,"get out of the sea chair"
	.GSTR STR?348,"A rat scurries in the shadows cast by a hanging oil lamp."
	.GSTR STR?349,"Timbers creak pleasantly."
	.GSTR STR?350,"Cockroaches swarm on the floor."
	.GSTR STR?351,"This is the great cabin, the Captain-General's quarters and magazine.The passageway leading to the other officers' cabins is forward."
	.GSTR STR?352,"The Captain's ornate desk fills one wall of the cabin."
	.GSTR STR?353,"There's no rutter here."
	.GSTR STR?354,"You are in uncharted territory now, and the rutter is no help."
	.GSTR STR?355,"You could never destroy such a valuable object."
	.GSTR STR?356,"write"
	.GSTR STR?357,"close it"
	.GSTR STR?358,"You don't have the key."
	.GSTR STR?359,"The long narrow bunk with its straw palliasse looks inviting."
	.GSTR STR?360,"Your tired brain tells you that if you lie down, you will sleep, and if you sleep, the ship will be lost, so you push yourself away."
	.GSTR STR?361,"rat"
	.GSTR STR?362,"cockroaches"
	.GSTR STR?363,"get it under control"
	.GSTR STR?365,".It is now broadside to the waves, which spill torrents of water onto the deck, and below.Soon she is foundering, the entire ocean seeming to want to fill her holds."
	.GSTR STR?366,"Your exhausted body, pushed beyond its last reserves of strength, fails you.You collapse, every fiber aching with months of deprivation.It is not long after that the ship is driven against the rocks."
	.ENDSEG

	.SEGMENT "SOFT-KEYS"

	.GSTR STR?26," UP"
	.GSTR STR?27," DN"
	.GSTR STR?28," LF"
	.GSTR STR?29," RT"
	.GSTR STR?30," F1"
	.GSTR STR?31," F2"
	.GSTR STR?32," F3"
	.GSTR STR?33," F4"
	.GSTR STR?34," F5"
	.GSTR STR?35," F6"
	.GSTR STR?36," F7"
	.GSTR STR?37," F8"
	.GSTR STR?38," F9"
	.GSTR STR?39,"F10"
	.GSTR STR?40,"Save Definition File"
	.GSTR STR?41,"Restore Definition File"
	.GSTR STR?42,"Reset Defaults"
	.GSTR STR?43,"Exit"
	.ENDSEG

	.SEGMENT "HINTS"

	.GSTR STR?675,"Return for hints."
RETURN-SEE-HINT=STR?675
	.GSTR STR?676,"Return for a hint."
RETURN-SEE-NEW-HINT=STR?676
	.GSTR STR?677,"M for main menu."
M-MAIN-HINT-MENU=STR?677
	.GSTR STR?678,"M for hint menu."
M-SEE-HINT-MENU=STR?678
	.GSTR STR?679,"P for previous item."
PREVIOUS-HINT=STR?679
	.GSTR STR?680,"N for next item."
NEXT-HINT=STR?680
	.GSTR STR?681,"Q to resume story."
Q-RESUME-STORY=STR?681
	.GSTR STR?682,"(Or use mouse.)"
H-OR-USE-MOUSE=STR?682
	.GSTR STR?683,"[No more hints.]"
NO-MORE-HINTS=STR?683
	.GSTR STR?684,"What must I do to survive?"
	.GSTR STR?685,"You have to do everything you can to keep your ship from sinking before you get to Japan."
	.GSTR STR?686,"You should try to find something to eat as soon as possible."
	.GSTR STR?687,"You should help the sick men as best you can."
	.GSTR STR?688,"It would be a good idea to keep updating the record of your voyage in your rutter."
	.GSTR STR?689,"You must keep your demoralized crew in order and continue to assert your authority."
	.GSTR STR?690,"You must pilot the ship into a safe harbor in Japan."
	.GSTR STR?691,"How do I steer the ship?"
	.GSTR STR?692,"To change direction, turn the wheel to PORT (left) or STARBOARD (right)."
	.GSTR STR?693,"Compass directions won't work, you're in the middle of a storm!"
	.GSTR STR?694,"If you turn the wheel to PORT or STARBOARD, the ship will continue turning in that direction and you will flounder."
	.GSTR STR?695,"STRAIGHTEN THE WHEEL once the ship has turned, to maintain course and to avoid capsizing."
	.GSTR STR?696,"I'm tired!"
	.GSTR STR?697,"You're tired and hungry."
	.GSTR STR?698,"Better not lay down on your bunk, though.You'll fall asleep."
	.GSTR STR?699,"Maybe you could find something to eat."
	.GSTR STR?700,"I'm hungry!"
	.GSTR STR?701,"An experienced seaman like yourself would probably keep a secret stash of  emergency food somewhere."
	.GSTR STR?702,"Perhaps in your cabin?"
	.GSTR STR?703,"Check your desk."
	.GSTR STR?704,"That's right, they're gone. Someone must have taken them!"
	.GSTR STR?705,"Didn't you just see Jan Roper come out of your cabin?"
	.GSTR STR?706,"Roper took your apples! Why don't you go into the Mate's Cabin and get them?"
	.GSTR STR?707,"How can I get the crew on watch?"
	.GSTR STR?708,"Go to the crew's quarters, Below Decks."
	.GSTR STR?709,"LOOK AT THE CREWMEN to decide who's fit to take a watch."
	.GSTR STR?710,"Send those men out on watch."
	.GSTR STR?711,"Vinck, Ginsel and Maetsukker are strong enough to go out."
	.GSTR STR?712,"Show some authority if any of them balk!"
	.GSTR STR?713,"What about my rutters?"
	.GSTR STR?714,"They're valuable, so you keep them in your sea chest."
	.GSTR STR?715,"You'll need a key to unlock it. Have you seen one around?"
	.GSTR STR?716,"The key is in your desk, which also holds the quill pen you'll need to write in it."
	.GSTR STR?717,"How can I help Spillbergen?"
	.GSTR STR?718,"He keeps asking for water, doesn't he?"
	.GSTR STR?719,"Try looking for water."
	.GSTR STR?720,"There's a flagon of water hidden in the cabin."
	.GSTR STR?721,"Did you search his desk?"
	.GSTR STR?722,"There's a secret compartment in the desk. The flagon is inside."
	.GSTR STR?723,"What about my pet rat?"
	.GSTR STR?724,"Oh, do you mean Gerald?"
	.GSTR STR?725,"You don't have a pet rat named Gerald!"
	.GSTR STR?726,"It's a joke! Now, stop reading the hints and play the game!"
	.GSTR STR?727,"How do I get through the reef?"
	.GSTR STR?728,"Sail due west after straightening the wheel."
	.GSTR STR?729,"When the reef is sighted, turn to Port to avoid hitting it."
	.GSTR STR?730,"Soon after, you will see a gap to Starboard, so turn towards it."
	.GSTR STR?731,"You'll be aimed very close to the gap, but you've lost some speed, so turn to port to get a boost from the wind."
	.GSTR STR?732,"Once you've done that, turn to Starboard to enter the gap."
	.GSTR STR?733,"We've lost our foresails!"
	.GSTR STR?734,"Is the crew on deck?"
	.GSTR STR?735,"If not, get them!This is an emergency!"
	.GSTR STR?736,"Try ringing the bell.That ought to wake them up."
	.GSTR STR?737,"Now that they're on deck, order them to repair the foresails."
	.GSTR STR?738,"I can't hold onto the wheel!"
	.GSTR STR?739,"You're too weak to fight the waves and current."
	.GSTR STR?740,"Maybe you could use some help."
	.GSTR STR?741,"Is anyone nearby?"
	.GSTR STR?742,"Vinck should be nearby. Ask him to help you."
	.GSTR STR?743,"You won't live very long without getting something to eat."
	.GSTR STR?744,"So eat the food that's on the tray!"
	.GSTR STR?745,"After you do that, a woman will come in."
	.GSTR STR?746,"Indicate to her that you're still hungry."
	.GSTR STR?747,"POINT TO THE TRAY or POINT TO MY STOMACH will suffice."
	.GSTR STR?748,"She'll bring you more food and your clothes!"
	.GSTR STR?749,"Eat the second tray of food and you'll survive!"
	.GSTR STR?750,"I was clumsy and I'm sorry!"
	.GSTR STR?751,"Tell the woman that.She'll appreciate it."
	.GSTR STR?752,"Just do your best to apologize."
	.GSTR STR?753,"How can I fight off these henchmen?"
	.GSTR STR?754,"You can't beat them, but don't worry, you won't be killed."
	.GSTR STR?755,"At least not if you fight back."
	.GSTR STR?756,"How can I avoid being killed by Omi?"
	.GSTR STR?757,"Be polite."
	.GSTR STR?758,"Answer his questions!"
	.GSTR STR?759,"Address your answers to the priest.He's translating."
	.GSTR STR?760,"You should know the answers already."
	.GSTR STR?761,"Question 1: I AM ENGLISH"
	.GSTR STR?762,"Question 2: I AM FROM HOLLAND"
	.GSTR STR?763,"Question 3: I'M THE LEADER"
	.GSTR STR?764,"Once you've answered the questions and Omi kills the henchman, get out of there!"
	.GSTR STR?765,"Where are my rutters?"
	.GSTR STR?766,"Have you looked on your ship?"
	.GSTR STR?767,"It's at anchor in the harbor!"
	.GSTR STR?768,"There's a rowboat at the waterfront."
	.GSTR STR?769,"Just row out and climb aboard."
	.GSTR STR?770,"You're the pilot.Just go aft towards your quarters."
	.GSTR STR?771,"Nope, the samurai guards won't let you in.Maybe some other time."
	.GSTR STR?772,"What do I say to Yabu?"
	.GSTR STR?773,"Answer the questions he asks.Some are the same as Omi's."
	.GSTR STR?774,"It's also very important to notice how Yabu and Father Sebastio are getting along with each other."
	.GSTR STR?775,"Question 1: I'M JOHN BLACKTHORNE."
	.GSTR STR?776,"Question 2: I SAILED FROM HOLLAND."
	.GSTR STR?777,"Question 3: I'M THE PILOT."
	.GSTR STR?778,"Question 4: I SAILED THROUGH THE STRAIT OF MAGELLAN."
	.GSTR STR?779,"Yabu orders me killed!"
	.GSTR STR?780,"You need to show him there is a reason to keep you alive."
	.GSTR STR?781,"You can't tell him anything, because you don't speak Japanese and Sebastio would lie about anything really useful."
	.GSTR STR?782,"Demonstrate that you are not the same sort of 'barbarian' as Sebastio."
	.GSTR STR?783,"Sebastio is a Catholic, you are a Protestant.In the year 1600, this is significant."
	.GSTR STR?784,"In the year 1600, crosses would be an abomination to a good English Protestant."
	.GSTR STR?785,"When Sebastio's crucifix dangles near you, grab it..."
	.GSTR STR?786,"Then break it or throw it on the ground."
	.GSTR STR?787,"Then remember that courtesy is very important in this culture."
	.GSTR STR?788,"Better bow to Yabu to show you didn't mean him any insult by that action."
	.GSTR STR?789,"How can I get out of the pit?"
	.GSTR STR?790,"You might try yelling."
	.GSTR STR?791,"Oh, well, I guess that didn't work."
	.GSTR STR?792,"Help, I've been picked!"
	.GSTR STR?793,"Relax, there was only a fifty percent chance you'd be picked."
	.GSTR STR?794,"Better to resist than be boiled, eh?"
	.GSTR STR?795,"Now they've taken poor Pieterzoon?"
	.GSTR STR?796,"There's nothing you can do -- someone is going to die.Pragmatism argues it ought not be you."
	.GSTR STR?797,"Help, Vinck's been picked!"
	.GSTR STR?798,"Relax, there was only a fifty percent chance he'd be picked."
	.GSTR STR?799,"On the other hand, you're the other fifty percent."
	.GSTR STR?800,"Prevent him from going."
	.GSTR STR?801,"Stop him or shake the ladder."
	.GSTR STR?802,"Fight the attacking samurai who descend!"
	.GSTR STR?803,"There's nothing you can do -- someone is going to die."
	.GSTR STR?804,"Now Omi wants me to come up!"
	.GSTR STR?805,"You could fight, or refuse."
	.GSTR STR?806,"... but the right thing to do is come up."
	.GSTR STR?807,"Should I agree?"
	.GSTR STR?808,"If you refuse, you will die."
	.GSTR STR?809,"If you agree, the results will be unpleasant."
	.GSTR STR?810,"... but you will survive."
	.GSTR STR?811,"'Better to be a live dog than a dead lion.'"
	.GSTR STR?812,"How can I get Rodrigues' help?"
	.GSTR STR?813,"He asks you specific questions any English Pilot would know the answers to."
	.GSTR STR?814,"If you study the map that came in your game package, you will find the answers."
	.GSTR STR?815,"If you don't have a map, perhaps you really ARE a pirate!"
	.GSTR STR?816,"What can Rodrigues do for me?"
	.GSTR STR?817,"He's obviously a respected person, maybe he has privileges you don't."
	.GSTR STR?818,"Perhaps he can get you into your ship to search for your rutters."
	.GSTR STR?819,"First, you should engage his interest.Talk to him about your ship."
	.GSTR STR?820,"Then just follow his lead!"
	.GSTR STR?821,"What about the archers?"
	.GSTR STR?822,"If you don't watch out, they'll think you're trying to escape, and shoot you!"
	.GSTR STR?823,"You could explain yourself...if you could speak Japanese."
	.GSTR STR?824,"Rodrigues could explain, but he can't watch the archers while he's rowing."
	.GSTR STR?825,"That's why he asked you to!"
	.GSTR STR?826,"Watch the archers, and when they act hostile, tell Rodrigues!"
	.GSTR STR?827,"We're back on the Erasmus."
	.GSTR STR?828,"This may be your ship, but the samurai are in charge now."
	.GSTR STR?829,"This is Rodrigues' show. Just follow his lead, and let him do the talking."
	.GSTR STR?830,"How do I defeat the attacking guards?"
	.GSTR STR?831,"Find your pistol."
	.GSTR STR?832,"Then find your powder horn."
	.GSTR STR?833,"...and blow them away!"
	.GSTR STR?834,"Of course, they aren't attacking, there is no pistol, and no powder horn."
	.GSTR STR?835,"Hint-browsing is considered barbaric in Japan."
	.GSTR STR?836,"I'm tied down!"
	.GSTR STR?837,"Just untie your safety line."
	.GSTR STR?838,"It's dangerous but necessary."
	.GSTR STR?839,"Now I'm getting washed overboard!"
	.GSTR STR?840,"Grab something!"
	.GSTR STR?841,"What's near at hand?"
	.GSTR STR?842,"Grab the gunwale!"
	.GSTR STR?843,"The oarsmen are confused!"
	.GSTR STR?844,"Help them, or tell them to ship their oars.Be useful!"
	.GSTR STR?845,"Once they're settled down and awaiting orders, tell them to row!"
	.GSTR STR?846,"I can't make it to the bay!"
	.GSTR STR?847,"Steer towards it."
	.GSTR STR?848,"Rodrigues will tell you to stop, but ignore him."
	.GSTR STR?849,"You'll die if you steer out to sea."
	.GSTR STR?850,"Rodrigues went overboard!"
	.GSTR STR?851,"He can't swim!"
	.GSTR STR?852,"He needs something to cling to!"
	.GSTR STR?853,"There's a life ring nearby."
	.GSTR STR?854,"Throw it to him."
	.GSTR STR?855,"Damn!Maybe there's something else..."
	.GSTR STR?856,"Throw the oar to him."
	.GSTR STR?857,"Maybe he has a chance, and maybe not.You've done all you can."
	.GSTR STR?858,"How can I secure the galley?"
	.GSTR STR?859,"Are you in the bay yet?"
	.GSTR STR?860,"It's being washed around by the current."
	.GSTR STR?861,"Dropping the anchor would help!"
	.GSTR STR?862,"Poor Rodrigues.What can I do?"
	.GSTR STR?863,"You can at least try to recover his body."
	.GSTR STR?864,"You might be in for a surprise!"
	.GSTR STR?865,"They won't let me ashore!"
	.GSTR STR?866,"Lower the skiff, they'll permit that."
	.GSTR STR?867,"Get in it."
	.GSTR STR?868,"Keep trying!Insist!You'll get your way eventually."
	.GSTR STR?869,"I can't find Rodrigues' body!"
	.GSTR STR?870,"If you didn't see him clinging to the oar, you can't find him."
	.GSTR STR?871,"Be persistent.Keep searching."
	.GSTR STR?872,"Keep heading south from the beach."
	.GSTR STR?873,"You can go all the way around the headland, but then you can't go any further."
	.GSTR STR?874,"Keep searching on the way back."
	.GSTR STR?875,"He's in the rocks below the Cliff Path."
	.GSTR STR?876,"How can I get to him?"
	.GSTR STR?877,"Try climbing down the cliff."
	.GSTR STR?878,"You can't get to him..."
	.GSTR STR?879,"But Yabu can!"
	.GSTR STR?880,"So get Yabu to climb down."
	.GSTR STR?881,"How can I save Yabu?"
	.GSTR STR?882,"Are you sure you want to save that sadistic monster?"
	.GSTR STR?883,"Yes, you should -- besides, he has Rodrigues."
	.GSTR STR?884,"You need a rope."
	.GSTR STR?885,"You need a long rope!"
	.GSTR STR?886,"Where can I find a rope?"
	.GSTR STR?887,"There's rope back at the galley."
	.GSTR STR?888,"But there's no time to get it."
	.GSTR STR?889,"Kimonos might make a good rope."
	.GSTR STR?890,"They need to be torn up and tied together."
	.GSTR STR?891,"They're still too short!"
	.GSTR STR?892,"Look at the remaining members of the search party."
	.GSTR STR?893,"How about using their loincloths!"
	.GSTR STR?894,"Yabu won't pay attention!"
	.GSTR STR?895,"Everyone seems to think the situation is hopeless."
	.GSTR STR?896,"If only there were some way of getting Yabu and Rodrigues to higher ground!"
	.GSTR STR?897,"A ledge, perhaps?"
	.GSTR STR?898,"Try searching the cliff. There's a ledge just beyond Yabu's reach."
	.GSTR STR?899,"Point it out to the samurai. They'll get his attention."
	.GSTR STR?900,"Don't forget to keep the rope lowered!"
	.GSTR STR?901,"Why does Toranaga have me killed?"
	.GSTR STR?902,"Courtesy, respect, politeness.You are lacking in these."
	.GSTR STR?903,"You could emulate Hiro-matsu, and kneel as he did."
	.GSTR STR?904,"Or you could show some courage.Bow and then sit as an equal would!"
	.GSTR STR?905,"You can look at Toranaga, which is disrespectful: ""A cat can look at a king.""Beyond that, you are in grave danger."
	.GSTR STR?906,"What should I do with Alvito?"
	.GSTR STR?907,"Choose a language in which to speak to Alvito."
	.GSTR STR?908,"Tell Toranaga that Alvito is your enemy."
	.GSTR STR?909,"And remember that while he is your enemy, he is also not a fool."
	.GSTR STR?910,"Why should I obey Alvito?"
	.GSTR STR?911,"Because you were asked to."
	.GSTR STR?912,"Because you are in the way if a fight starts!"
	.GSTR STR?913,"Toranaga and Ishido hate each other, so you don't want to be between them."
	.GSTR STR?914,"How do I prevent Ishido from killing Toranaga?"
	.GSTR STR?915,"You could try punching him out."
	.GSTR STR?916,"Or kicking him."
	.GSTR STR?917,"Or do nothing, since he isn't going to kill Toranaga."
	.GSTR STR?918,"Not now, at any rate."
	.GSTR STR?919,"That guy stole my food!"
	.GSTR STR?920,"Take it back."
	.GSTR STR?921,"I'm afraid you'll have to fight him."
	.GSTR STR?922,"... but don't attack him first.If you do, he'll win."
	.GSTR STR?923,"Why won't the old friar talk to me?"
	.GSTR STR?924,"He's Spanish.All the Europeans you've met so far are Portuguese."
	.GSTR STR?925,"He's a Dominican friar.All the priests you've met so far are Portuguese Jesuits."
	.GSTR STR?926,"The Portuguese Jesuits threw him in prison.He hates the Portuguese."
	.GSTR STR?927,"So speak Spanish to him."
	.GSTR STR?928,"What use is Domingo?"
	.GSTR STR?929,"He's been here a long time and he speaks Japanese."
	.GSTR STR?930,"Ask him about things."
	.GSTR STR?931,"For example, ask him about Toranaga or Japan or the Jesuits."
	.GSTR STR?932,"Ask him to teach you Japanese.He knows a lot."
	.GSTR STR?933,"He can't do much in a few days, but it's a start!"
	.GSTR STR?934,"I'm being attacked!"
	.GSTR STR?935,"You are unarmed, and cannot defend yourself."
	.GSTR STR?936,"Duck, you fool!"
	.GSTR STR?937,"Yabu wants me to go with him."
	.GSTR STR?938,"He's one of Toranaga's men."
	.GSTR STR?939,"It's either him or Ishido."
	.GSTR STR?940,"'Better the devil you know...'"
	.GSTR STR?941,"GET IN LITTER."
	.GSTR STR?942,"What do I do in this scene?"
	.GSTR STR?943,"Bow to Toranaga or greet Mariko."
	.GSTR STR?944,"Ask Mariko about the prophecy."
	.GSTR STR?945,"Try to amuse Yaemon.Smile or wink or act silly."
	.GSTR STR?946,"What's going on in this scene?"
	.GSTR STR?947,"Kiritsubo is preparing to leave Osaka."
	.GSTR STR?948,"There is also a rather rancorous argument going on."
	.GSTR STR?949,"But maybe something else as well..."
	.GSTR STR?950,"Watch closely what happens as the cortege is preparing to move out."
	.GSTR STR?951,"What about Ishido?"
	.GSTR STR?952,"Ignore him, he's just being a pest."
	.GSTR STR?953,"Hiro-matsu, Buntaro and Yabu will take care of him."
	.GSTR STR?954,"You might try wandering around as much as they'll let you."
	.GSTR STR?955,"The garden is particularly pretty this time of year..."
	.GSTR STR?956,"What happened to Sazuko?"
	.GSTR STR?957,"She seemed to fall and possibly endanger herself and her baby."
	.GSTR STR?958,"But then she seemed to be all right again."
	.GSTR STR?959,"But was that all that was going on?"
	.GSTR STR?960,"What's in the garden?"
	.GSTR STR?961,"A little cha-no-yu (tea house)."
	.GSTR STR?962,"There's someone inside."
	.GSTR STR?963,"A veiled figure: a woman?"
	.GSTR STR?964,"No, it's Toranaga!"
	.GSTR STR?965,"What did Kiri do?"
	.GSTR STR?966,"She yelled something, probably a warning about Sazuko."
	.GSTR STR?967,"And then she ran into the garden, and out again..."
	.GSTR STR?968,"...and when she came out she was Toranaga!"
	.GSTR STR?969,"Here's Ishido again!"
	.GSTR STR?970,"He only wants to give Kiri a parchment."
	.GSTR STR?971,"But if he does, he'll discover that Kiri is really Toranaga in disguise!"
	.GSTR STR?972,"Ishido will kill you all!"
	.GSTR STR?973,"If you want to live, you'd better stop him!"
	.GSTR STR?974,"How can I stop Ishido?"
	.GSTR STR?975,"Well, he wants to give Kiri the parchment."
	.GSTR STR?976,"If he didn't have it he couldn't give it to her."
	.GSTR STR?977,"Of course, he won't like it if you just take it."
	.GSTR STR?978,"The time must be right."
	.GSTR STR?979,"And you'd better come up with some way of mollifying him afterward."
	.GSTR STR?980,"You could apologize."
	.GSTR STR?981,"You could bow, since your Japanese is still rather weak."
	.GSTR STR?982,"Or you could try to convince him you've gone crazy."
	.GSTR STR?983,"How crazy am I?"
	.GSTR STR?984,"You could babble."
	.GSTR STR?985,"Of course, your speech sounds like babbling to the Japanese already."
	.GSTR STR?986,"You could sing; that would worry them."
	.GSTR STR?987,"You could dance around."
	.GSTR STR?988,"You could just act crazy."
	.GSTR STR?989,"How do I get out of here?"
	.GSTR STR?990,"Just walk south across the bridge."
	.GSTR STR?991,"Of course, you better let Ishido know you're under control."
	.GSTR STR?992,"He has strong views about madness."
	.GSTR STR?993,"Do exactly what Mariko tells you to!"
	.GSTR STR?994,"I can't move!"
	.GSTR STR?995,"You're pretty tired."
	.GSTR STR?996,"Maybe you should follow Mariko's advice."
	.GSTR STR?997,"Get in Mariko's litter."
	.GSTR STR?998,"Escape (Part I)"
	.GSTR STR?999,"Now I'm really lost!"
	.GSTR STR?1000,"You have to find your way out of the maze of city streets."
	.GSTR STR?1001,"You start at the castle, and are headed for the docks."
	.GSTR STR?1002,"Use your mouse, arrow keys, or function keys to move the glyph representing the party."
	.GSTR STR?1003,"Or you can just type directions, but that's more tedious."
	.GSTR STR?1004,"The dock is at the right edge of the display of mazelike city streets."
	.GSTR STR?1005,"We're under attack!"
	.GSTR STR?1006,"You can't fight, you have no weapons."
	.GSTR STR?1007,"You can't see the archers anyways."
	.GSTR STR?1008,"Better get out of the way."
	.GSTR STR?1009,"There's a litter to hide behind."
	.GSTR STR?1010,"Mariko's dead!"
	.GSTR STR?1011,"You should try to save her."
	.GSTR STR?1012,"When the attack starts, try to get her behind the litter, too."
	.GSTR STR?1013,"We're at the dock, now what?"
	.GSTR STR?1014,"Agree to Toranaga's plan."
	.GSTR STR?1015,"Follow Mariko when she runs for the galley."
	.GSTR STR?1016,"You ought to board the galley."
	.GSTR STR?1017,"You have any better ideas?"
	.GSTR STR?1018,"Mariko seems to be in trouble!"
	.GSTR STR?1019,"You should help her."
	.GSTR STR?1020,"She seems to have fainted."
	.GSTR STR?1021,"Maybe she needs water..."
	.GSTR STR?1022,"... or 'mizu' as they say here."
	.GSTR STR?1023,"Now I'm under attack."
	.GSTR STR?1024,"You have two knives."
	.GSTR STR?1025,"Fight back!"
	.GSTR STR?1026,"Of course, their swords are a lot longer than your knives..."
	.GSTR STR?1027,"...so you can't fight at close quarters."
	.GSTR STR?1028,"Throw your knives at them!"
	.GSTR STR?1029,"Don't forget Mariko- she'll need your help!"
	.GSTR STR?1030,"Just get out of the way of those flashing swords."
	.GSTR STR?1031,"...and keep those knives flying."
	.GSTR STR?1032,"Escape (Part II)"
	.GSTR STR?1033,"Can I save myself?"
	.GSTR STR?1034,"Just get out of the way of the fissure as it approaches."
	.GSTR STR?1035,"MOVE or ROLL, for example."
	.GSTR STR?1036,"Can I save Toranaga?"
	.GSTR STR?1037,"He's close by."
	.GSTR STR?1038,"Try grabbing him."
	.GSTR STR?1039,"Can I save Mariko?"
	.GSTR STR?1040,"She's close by."
	.GSTR STR?1041,"Try grabbing her."
	.GSTR STR?1042,"You didn't really think that would work twice, did you?"
	.GSTR STR?1043,"You'll have to climb down into the fissure."
	.GSTR STR?1044,"...and then lift her out to Toranaga."
	.GSTR STR?1045,"...and then climb out yourself."
	.GSTR STR?1046,"...and you should hurry!"
	.GSTR STR?1047,"What should I do then?"
	.GSTR STR?1048,"Well, you could emulate Toranaga."
	.GSTR STR?1049,"He has sort of a coarse sense of humor, doesn't he?"
	.GSTR STR?1050,"He's also lost something he values highly."
	.GSTR STR?1051,"You have something almost as good."
	.GSTR STR?1052,"Give Toranaga your swords!"
	.GSTR STR?1053,"What an embarrassing situation!"
	.GSTR STR?1054,"When in Rome..."
	.GSTR STR?1055,"There is little taboo against nakedness here."
	.GSTR STR?1056,"...and everyone around is a friend."
	.GSTR STR?1057,"...so go with the situation."
	.GSTR STR?1058,"Undress, and then get in the tub."
	.GSTR STR?1059,"Have some fun, ask Mariko to help bathe you."
	.GSTR STR?1060,"How do I avoid the thief?"
	.GSTR STR?1061,"Hide under the bed until he comes in."
	.GSTR STR?1062,"What bed? What thief?"
	.GSTR STR?1063,"Read your dictionary, not the fake hint questions!"
	.GSTR STR?1064,"What can I do in the nighttime?"
	.GSTR STR?1065,"You could sleep."
	.GSTR STR?1066,"But it isn't very helpful."
	.GSTR STR?1067,"You could read your dictionary."
	.GSTR STR?1068,"You can try to visit Mariko."
	.GSTR STR?1069,"Watch out, though. If Yoshi catches you with her, he'll kill you."
	.GSTR STR?1070,"How can I avoid getting caught?"
	.GSTR STR?1071,"You need to avoid being seen going into Mariko's room."
	.GSTR STR?1072,"Watch for and listen to Yoshinaka as he makes his rounds."
	.GSTR STR?1073,"Then time your excursion to avoid him."
	.GSTR STR?1074,"And do the same on the way back."
	.GSTR STR?1075,"What can I do with Mariko?"
	.GSTR STR?1076,"Doesn't your imagination suggest something?"
	.GSTR STR?1077,"You are in love, after all."
	.GSTR STR?1078,"And no one is here to bother you."
	.GSTR STR?1079,"Well, this is a family hint question."
	.GSTR STR?1080,"You figure it out."
	.GSTR STR?1081,"But don't take too long! Remember, Yoshi is still out there."
	.GSTR STR?1082,"How do I avoid embarrassment?"
	.GSTR STR?1083,"What were you worrying about mere seconds ago?"
	.GSTR STR?1084,"Check your swords!"
	.GSTR STR?1085,"How do I avoid offending?"
	.GSTR STR?1086,"Ochiba is a very important person, so bow to her!"
	.GSTR STR?1087,"Then greet her."
	.GSTR STR?1088,"How can I make her like me?"
	.GSTR STR?1089,"It's her birthday."
	.GSTR STR?1090,"What do people expect on their birthday?"
	.GSTR STR?1091,"A gift!Have you anything to give her?"
	.GSTR STR?1092,"Give her the camellia blossom."
	.GSTR STR?1093,"It's not the custom here, but she will understand and appreciate it."
	.GSTR STR?1094,"Ishido is certainly being nasty."
	.GSTR STR?1095,"You, therefore, should be polite."
	.GSTR STR?1096,"Correct his mistake."
	.GSTR STR?1097,"You are no longer a barbarian, you are a samurai!"
	.GSTR STR?1098,"Tell him so!"
	.GSTR STR?1099,"It will expose his rudeness, and put him in an embarrassing position."
	.GSTR STR?1100,"What can I do to help Mariko?"
	.GSTR STR?1101,"When she directs you to fight, do so."
	.GSTR STR?1102,"Kill the Captain of the Grays."
	.GSTR STR?1103,"Just keep attacking him."
	.GSTR STR?1104,"You will realize he doesn't want to kill you, although the Grays will kill everyone else in Mariko's escort."
	.GSTR STR?1105,"Now Mariko is fighting!"
	.GSTR STR?1106,"She is samurai; it is her right."
	.GSTR STR?1107,"Don't try to help her, or you'll bring great shame upon her."
	.GSTR STR?1108,"What do I do in the garden?"
	.GSTR STR?1109,"Do what Chimmoko asks."
	.GSTR STR?1110,"Go in the cha-no-yu house and see Mariko."
	.GSTR STR?1111,"Kiss her, if you wish."
	.GSTR STR?1112,"How can I help Mariko?"
	.GSTR STR?1113,"First, realize you can't stop her without shaming her even more than Ishido has shamed her."
	.GSTR STR?1114,"Then realize you must just wait until Ishido gives in."
	.GSTR STR?1115,"Then, when she has won, you can carry her away."
	.GSTR STR?1116,"What should I do about Yabu?"
	.GSTR STR?1117,"First, notice that he's nervous."
	.GSTR STR?1118,"Ask him about the 'plan.'"
	.GSTR STR?1119,"Maybe he's up to something!"
	.GSTR STR?1120,"Perhaps you should follow him and find out."
	.GSTR STR?1121,"Discretion, discretion!Don't follow too close."
	.GSTR STR?1122,"How can I survive the ninja attack?"
	.GSTR STR?1123,"You could try fighting them off."
	.GSTR STR?1124,"Well, first you will need some weapons."
	.GSTR STR?1125,"Your swords and powder horn are in your quarters."
	.GSTR STR?1126,"The ninja haven't much experience with firearms, so your pistol will help a lot."
	.GSTR STR?1127,"They will slow down, confused and scared, each time you fire the pistol."
	.GSTR STR?1128,"But your pistol takes time to reload, so you're going to have to retreat and hope for help."
	.GSTR STR?1129,"And each time you use it, they get less scared of it."
	.GSTR STR?1130,"They've taken Mariko!"
	.GSTR STR?1131,"You can usually avoid this by telling Mariko to follow you."
	.GSTR STR?1132,"If they have her, firing the pistol will give her a chance to escape."
	.GSTR STR?1133,"I can't get away from the ninja!"
	.GSTR STR?1134,"You'll have to block them and slow them down."
	.GSTR STR?1135,"Firing the pistol at them slows them down."
	.GSTR STR?1136,"Closing and barring doors in their way slows them down."
	.GSTR STR?1137,"The iron-bound door between the Audience Chamber and the Inner Corridor can be closed and barred."
	.GSTR STR?1138,"You can also slow them down by shooting at them through the crack they make in that door."
	.GSTR STR?1139,"But you'll be better off finding a safer place to retreat to."
	.GSTR STR?1140,"Have you been back to the Private Quarters?"
	.GSTR STR?1141,"When you go back, Kiritsubo will show you the way into a secret room."
	.GSTR STR?1142,"Once you're in there with the women, you should close the bolts!"
	.GSTR STR?1143,"How can I escape the explosion?"
	.GSTR STR?1144,"You can go out onto the balcony."
	.GSTR STR?1145,"First you have to open the catches on the balcony door."
	.GSTR STR?1146,"They're rusty, so hit them with something."
	.GSTR STR?1147,"...the pistol, for example."
	.GSTR STR?1148,"How can I prevent Mariko's death?"
	.GSTR STR?1149,"Get her into the Secret Redoubt."
	.GSTR STR?1150,"Then convince her to go onto the Balcony."
	.GSTR STR?1151,"But she won't go, will she?"
	.GSTR STR?1152,"She thinks her death is inevitable."
	.GSTR STR?1153,"So force her!"
	.GSTR STR?1154,"But if you do that the ninja will capture her."
	.GSTR STR?1155,"She's right.Your love is doomed, and if she's captured by Ishido, the hostages will never be freed."
	.GSTR STR?1156,"It's tragic, but there is no way out for her."
	.GSTR STR?1157,"Honor her faith, and bless her after she dies."
	.GSTR STR?1158,"Vinck certainly is acting weird!"
	.GSTR STR?1159,"Humor him."
	.GSTR STR?1160,"Don't get him too upset."
	.GSTR STR?1161,"...as he's armed and dangerous."
	.GSTR STR?1162,"Wait for him to die."
	.GSTR STR?1163,"...and then carry him away."
	.GSTR STR?1164,"What can I do about the Erasmus?"
	.GSTR STR?1165,"You can look at it."
	.GSTR STR?1166,"...and that's about it."
	.GSTR STR?1167,"What's the scroll good for?"
	.GSTR STR?1168,"It gives you something to read."
	.GSTR STR?1169,"It also reminds you that you can get a new ship."
	.GSTR STR?1170,"You should tell Toranaga that."
	.GSTR STR?1171,"What does Toranaga want?"
	.GSTR STR?1172,"He wants you to tell him what you know."
	.GSTR STR?1173,"What did you find out during the attack on the castle?"
	.GSTR STR?1174,"What did Yabu do before the attack?"
	.GSTR STR?1175,"Did you try to follow him?"
	.GSTR STR?1176,"You ought to try that!"
	.GSTR STR?1177,"Tell Toranaga that Yabu betrayed him."
	.GSTR STR?1178,">TORANAGA, YABU BETRAYED YOU"
	.GSTR STR?1179,"Tell Toranaga how Yabu betrayed him."
	.GSTR STR?1180,">TORANAGA, YABU LET IN THE NINJA"
	.GSTR STR?1181,"Tell Toranaga what Yabu said to the ninja."
	.GSTR STR?1182,">TORANAGA, I AM KASIGI YABU"
	.GSTR STR?1183,"Read me first."
	.GSTR STR?1184,"This section tells you how the points in each scene are scored.You get five points for each correct action listed.It is possible to finish some scenes without getting all the points.

Think twice before reading further!Don't spoil the game for yourself!"
	.GSTR STR?1185,"Erasmus (11 actions)"
	.GSTR STR?1186,"Straightening the wheel."
	.GSTR STR?1187,"Getting your apple back from Roper."
	.GSTR STR?1188,"Eating the apple."
	.GSTR STR?1189,"Finding the key to the sea chest."
	.GSTR STR?1190,"Writing in your rutter."
	.GSTR STR?1191,"Finding the flagon in the Captain's desk."
	.GSTR STR?1192,"Giving the Captain water."
	.GSTR STR?1193,"Sending Vinck, Ginsel, and Maetsukker out on watch."
	.GSTR STR?1194,"Ringing the bell to get the crew on deck."
	.GSTR STR?1195,"Fixing the foresails."
	.GSTR STR?1196,"Getting through the reef into the harbor."
	.GSTR STR?1197,"Anjiro (4 actions)"
	.GSTR STR?1198,"Eating both trays of food."
	.GSTR STR?1199,"Fighting back against Sebastio's henchmen."
	.GSTR STR?1200,"Getting through Omi's interrogation."
	.GSTR STR?1201,"Trying to get your rutters back."
	.GSTR STR?1202,"Yabu (2 actions)"
	.GSTR STR?1203,"Breaking Sebastio's crucifix."
	.GSTR STR?1204,"Telling Yabu about your voyage."
	.GSTR STR?1205,"Pit (5 actions)"
	.GSTR STR?1206,"Saving Vinck if he's the one picked to die, or saving yourself if you are picked."
	.GSTR STR?1207,"Fighting the samurai, taking one as a hostage."
	.GSTR STR?1208,"Agreeing to behave."
	.GSTR STR?1209,"Lying down."
	.GSTR STR?1210,"Taking a bath."
	.GSTR STR?1211,"Rodrigues (4 actions)"
	.GSTR STR?1212,"Answering Rodrigues about where you trained."
	.GSTR STR?1213,"Answering Rodrigues about the Lizard."
	.GSTR STR?1214,"Telling Rodrigues about the Erasmus."
	.GSTR STR?1215,"Warning Rodrigues about the archers."
	.GSTR STR?1216,"Voyage to Osaka (11 actions)"
	.GSTR STR?1217,"Grabbing the gunwale."
	.GSTR STR?1218,"Restoring order on the oar deck."
	.GSTR STR?1219,"Getting the oarsmen to row again."
	.GSTR STR?1220,"Throwing oar to Rodrigues."
	.GSTR STR?1221,"Dropping anchor once in the bay."
	.GSTR STR?1222,"Getting into the skiff."
	.GSTR STR?1223,"Finding Rodrigues."
	.GSTR STR?1224,"Making a rope of kimonos."
	.GSTR STR?1225,"Adding loincloths to rope."
	.GSTR STR?1226,"Finding the ledge."
	.GSTR STR?1227,"Getting Yabu's attention."
	.GSTR STR?1228,"Toranaga (3 actions)"
	.GSTR STR?1229,"Defying convention by bowing but not kneeling."
	.GSTR STR?1230,"Moving to the dais when Ishido arrives."
	.GSTR STR?1231,"Telling Toranaga Alvito is your enemy."
	.GSTR STR?1232,"Prison (6 actions)"
	.GSTR STR?1233,"Defeating the thug."
	.GSTR STR?1234,"Speaking Spanish to Domingo."
	.GSTR STR?1235,"Asking Domingo to teach you Japanese."
	.GSTR STR?1236,"Joining the line of prisoners."
	.GSTR STR?1237,"Avoiding the bandit's attack."
	.GSTR STR?1238,"Getting in Yabu's palanquin."
	.GSTR STR?1239,"Mariko (3 actions)"
	.GSTR STR?1240,"Greeting or bowing to Mariko or Toranaga."
	.GSTR STR?1241,"Smiling or winking at Yaemon."
	.GSTR STR?1242,"Asking Mariko about the prophecy."
	.GSTR STR?1243,"As a Last Resort (Part I)"
	.GSTR STR?1244,"Escape (13 actions)"
	.GSTR STR?1245,"Seeing Toranaga in the hut."
	.GSTR STR?1246,"Seeing Toranaga and Kiritsubo switch."
	.GSTR STR?1247,"Grabbing the parchment from Ishido."
	.GSTR STR?1248,"Giving the parchment to 'Kiri.'"
	.GSTR STR?1249,"Distracting Ishido by acting nuts."
	.GSTR STR?1250,"Reaching the woods successfully."
	.GSTR STR?1251,"Saving Mariko during ambush."
	.GSTR STR?1252,"Finding the ronin."
	.GSTR STR?1253,"Slowing down the messenger so Buntaro can kill him."
	.GSTR STR?1254,"Helping Mariko when she 'faints.'"
	.GSTR STR?1255,"Remembering the word for 'water.'"
	.GSTR STR?1256,"Killing the Gray leader."
	.GSTR STR?1257,"Killing the second Gray."
	.GSTR STR?1258,"Earthquake (4 actions)"
	.GSTR STR?1259,"Saving Toranaga."
	.GSTR STR?1260,"Saving Mariko."
	.GSTR STR?1261,"Pissing in the fissure."
	.GSTR STR?1262,"Giving swords to Toranaga after his are lost."
	.GSTR STR?1263,"Journey to Yedo (3 actions)"
	.GSTR STR?1264,"Bathing with Mariko."
	.GSTR STR?1265,"Making love to Mariko."
	.GSTR STR?1266,"Getting back to your room safely."
	.GSTR STR?1267,"Ochiba (3 actions)"
	.GSTR STR?1268,"Checking your swords."
	.GSTR STR?1269,"Giving the camellia to Ochiba."
	.GSTR STR?1270,"Telling Ishido you are not a barbarian."
	.GSTR STR?1271,"Departure (1 action)"
	.GSTR STR?1272,"Killing Yamazaki."
	.GSTR STR?1273,"Seppuku (1 action)"
	.GSTR STR?1274,"Carrying Mariko away."
	.GSTR STR?1275,"Ninja (6 actions)"
	.GSTR STR?1276,"Asking Yabu about the plan."
	.GSTR STR?1277,"Hiding from the ninja in the cellars."
	.GSTR STR?1278,"Seeing Yabu in the cellars let in the ninja."
	.GSTR STR?1279,"Shooting the ninja leader."
	.GSTR STR?1280,"Telling Mariko to follow you."
	.GSTR STR?1281,"Blessing Mariko."
	.GSTR STR?1282,"Yokohama (1 action)"
	.GSTR STR?1283,"Picking up Vinck."
	.GSTR STR?1284,"Aftermath (3 actions)"
	.GSTR STR?1285,"Reading the sealed scroll."
	.GSTR STR?1286,"Reporting that you saw Yabu."
	.GSTR STR?1287,"Reporting the password."
	.GSTR STR?1288,"As a Last Resort (Part II)"
	.GSTR STR?1289,"Amusing things to try..."
	.GSTR STR?1290,">HUG VINCK (or any other of your crew)"
	.GSTR STR?1291,">BOW TO VINCK (or any other Dutchman)"
	.GSTR STR?1292,"Wandering around Anjiro naked."
	.GSTR STR?1293,">KICK HEAD (of Sebastio's disrespectful henchman)"
	.GSTR STR?1294,">WHAT ARE COJONES (since Rodrigues wonders if you have any)"
	.GSTR STR?1295,">DRAW THE WORLD (for Yaemon)"
	.GSTR STR?1296,">SING (other than during the escape)"
	.GSTR STR?1297,"Find out the name of your sword (after the Earthquake scene)."
	.GSTR STR?1298,">LOOK UP ""TSURU"" IN DICTIONARY"
	.GSTR STR?1299,"To find out who worked on the game."
	.GSTR STR?1300,"Type 'CREDITS' at any time in the story."
	.GSTR STR?1301,"Have you tried?"
	.GSTR STR?1302," InvisiClues (tm)"
INVISICLUES=STR?1302
	.SEGMENT "0"

	.GSTR STR?19,"Ochiba"
	.GSTR STR?22,"Ninja"
	.GSTR STR?24,"Aftermath"
	.GSTR STR?20,"Departure"
	.GSTR STR?21,"Seppuku"
	.SEGMENT "MARIKO"

	.GSTR STR?15,"Mariko"
	.ENDSEG

	.SEGMENT "0"

	.SEGMENT "HINTS"

	.GSTR STR?17,"Earthquake"
	.GSTR STR?8,"Anjiro"
	.GSTR STR?23,"Yokohama"
	.GSTR STR?14,"Prison"
	.SEGMENT "AFTERMATH"

	.SEGMENT "ANJIRO"

	.SEGMENT "ERASMUS"

	.SEGMENT "ESCAPE"

	.SEGMENT "RODRIGUES"

	.SEGMENT "VOYAGE"

	.SEGMENT "YOKOHAMA"

	.SEGMENT "YOKOSE"

	.GSTR STR?7,"Erasmus"
	.ENDSEG

	.SEGMENT "0"

	.SEGMENT "HINTS"

	.GSTR STR?18,"Journey to Yedo"
	.GSTR STR?12,"Voyage to Osaka"
	.GSTR STR?9,"Yabu"
	.SEGMENT "VOYAGE"

	.GSTR STR?11,"Rodrigues"
	.ENDSEG

	.SEGMENT "0"

	.SEGMENT "HINTS"

	.GSTR STR?13,"Toranaga"
	.GSTR STR?10,"Pit"
	.ENDSEG


	.ENDI
