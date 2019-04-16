
	.SEGMENT "ANJIRO"


	.FUNCT	MURA-HOUSE-EXIT:ANY:0:2,RARG,STRICT?
	EQUAL?	RARG,M-ENTER \?CCL3
	RETURN	MURA-HOUSE
?CCL3:	FSET?	BOOTS,WEARBIT \?CCL5
	ICALL2	CTHE-PRINT,ONNA
	PRINTI	" runs up to you, very agitated.As politely as she can, she points to your boots, bowing and shaking her head."
	CRLF	
	RFALSE	
?CCL5:	RETURN	MURA-HOUSE


	.FUNCT	GARDEN-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	EQUAL?	SCENE,S-ANJIRO \TRUE
	ICALL	QUEUE,I-SEBASTIO,-1
	IN?	ONNA,MURA-HOUSE \TRUE
	MOVE	ONNA,GARDEN
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?LISTEN \?CCL12
	EQUAL?	PRSO,FALSE-VALUE,NOISE \?CCL12
	PRINT	STR?371
	PRINTR	"You can't be sure, but one seems to be speaking Portuguese!"
?CCL12:	EQUAL?	PRSA,V?EXAMINE \?CCL16
	EQUAL?	PRSO,NOISE \?CCL16
	PRINTR	"You'll have to go out to do that."
?CCL16:	EQUAL?	PRSA,V?LISTEN \?CCL20
	EQUAL?	PRSO,PORTUGUESE \?CCL20
	PRINTR	"It definitely sounds like Portuguese, but you're too far away to be sure."
?CCL20:	EQUAL?	SCENE,S-ANJIRO \FALSE
	EQUAL?	PRSA,V?WALK,V?WALK-TO \FALSE
	CALL1	HENCHMEN-RESTRAIN
	ZERO?	STACK \TRUE
	RFALSE	


	.FUNCT	HIGH-WALL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The wall is made of small stones mortared together with great precision.It is at first completely a wall and at then suggests a high mountain cliff with the garden plants growing up to the base."
?CCL3:	EQUAL?	PRSA,V?CLIMB-UP,V?CLIMB-FOO \FALSE
	PRINTR	"You're too weak to climb the wall."


	.FUNCT	WATERFALL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"A fall of sweet, clear water drops from one level of the garden to the other.The gentle tinkling sound is very soothing."
?CCL3:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL5
	PRINTR	"The little pool at the base of waterfall is filled with carp."
?CCL5:	EQUAL?	PRSA,V?DRINK \FALSE
	PRINTR	"The water is cool and tasty."


	.FUNCT	PATHS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The paths lead in neat, seemingly chance-laid loops throughout the garden."
?CCL3:	EQUAL?	PRSA,V?FOLLOW \FALSE
	PRINTR	"You walk about for a while, following the paths.The garden is so neat, so orderly.Just walking in it is calming.You haven't seen a living plant during all your long voyage, and here there are so many."


	.FUNCT	SMALL-BRIDGE-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's a small, decorative footbridge that crosses the little stream."
?CCL3:	EQUAL?	PRSA,V?CROSS \FALSE
	PRINTR	"You cross the little bridge, standing in the center looking at the slowly flowing stream for a while.The garden is very peaceful.You cross back."


	.FUNCT	STREAM-F:ANY:0:0
	EQUAL?	PRSA,V?BOARD,V?STEP-ON,V?CLIMB-DOWN \FALSE
	PRINTR	"You content yourself with splashing a little water on your face."


	.FUNCT	PLANTS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The garden is planted with flowers, shrubs, and odd small trees.It looks like a small patch of orderly wilderness."
?CCL3:	EQUAL?	PRSA,V?TAKE \?CCL5
	PRINTR	"You think better of disturbing the harmony of the garden."
?CCL5:	EQUAL?	PRSA,V?SMELL \FALSE
	PRINTR	"The flowers smell very nice.Your nose has had little to smell of comparable fragrance for years."

	.SEGMENT "RODRIGUES"


	.FUNCT	ANJIRO-WATERFRONT-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL2	DRESS-BLACKTHORNE,TRUE-VALUE
	ICALL	NEW-SDESC,HIRO-MATSU,STR?373
	FCLEAR	HIRO-MATSU,NOABIT
	FCLEAR	HIRO-MATSU,NOTHEBIT
	FSET	HIRO-MATSU,AN
	ICALL	NEW-SDESC,OMI,OMI-NAME
	ICALL2	MOVE-CREW,PIT
	REMOVE	HENCHMAN-BODY
	REMOVE	HENCHMAN-HEAD
	MOVE	SECRET-RUTTER,GENERIC-OBJECTS
	MOVE	RUTTER,GENERIC-OBJECTS
	MOVE	SEA-CHEST,PILOTS-CABIN
	FSET	SEA-CHEST,OPENBIT
	MOVE	SMALL-BOAT,ANJIRO-WATERFRONT
	MOVE	BOAT-OAR,SMALL-BOAT
	MOVE	SLAVER,ANJIRO-WATERFRONT
	MOVE	MURA,ANJIRO-WATERFRONT
	MOVE	OMI,ANJIRO-WATERFRONT
	MOVE	YABU,ANJIRO-WATERFRONT
	MOVE	HIRO-MATSU,ANJIRO-WATERFRONT
	MOVE	TORANAGA,GENERIC-OBJECTS
	MOVE	ARCHERS,ANJIRO-WATERFRONT
	FCLEAR	ARCHERS,INVISIBLE
	CALL	QUEUE,I-MEET-RODRIGUES,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"This is the waterfront of the village.The ground is cobbled and a stone launching ramp goes from the shore into the sea.There are men and women cleaning fish.Small islands are visible to the east and south.At anchor, to the east, is the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	"."
?CCL5:	EQUAL?	RARG,M-ENTER \?CCL7
	EQUAL?	SCENE,S-ANJIRO \TRUE
	IN?	WINNER,SMALL-BOAT \?CCL12
	PRINTI	"You row the boat up onto the beach."
	CRLF	
	CRLF	
	RTRUE	
?CCL12:	FSET?	RUTTER,RMUNGBIT /TRUE
	ICALL	QUEUE,I-RUTTER-CLUE,1
	RTRUE	
?CCL7:	EQUAL?	RARG,M-BEG \?CCL15
	EQUAL?	SCENE,S-RODRIGUES \?CCL18
	EQUAL?	PRSA,V?POINT,V?EXAMINE \?PRD22
	EQUAL?	PRSO,LG-ERASMUS /?CTR17
?PRD22:	EQUAL?	PRSA,V?SHOW \?CCL18
	EQUAL?	PRSO,LG-ERASMUS \?CCL18
	EQUAL?	PRSI,RODRIGUES \?CCL18
?CTR17:	PRINTI	"You look out at the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	", and "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTI	" watches you."
	FSET?	LIZARD,SCOREBIT /?CND28
	ICALL2	THIS-IS-IT,LG-ERASMUS
	SET	'QCONTEXT,RODRIGUES
	PRINTR	"She's moored a hundred yards away.""Tell me about her, Ingeles,"" asks the Portuguese.""She looks like a pisscutter!"""
?CND28:	CRLF	
	RTRUE	
?CCL18:	EQUAL?	SCENE,S-RODRIGUES \?CCL31
	EQUAL?	PRSA,V?WALK,V?WALK-TO \?CCL31
	EQUAL?	PRSO,P?WEST,P?NORTH,P?SOUTH \?CCL31
	PRINTR	"Mura restrains you with iron gentleness."
?CCL31:	EQUAL?	SCENE,S-ANJIRO \?CCL36
	EQUAL?	PRSA,V?WALK,V?WALK-TO \?CCL36
	CALL1	HENCHMEN-RESTRAIN
	ZERO?	STACK \TRUE
?CCL36:	EQUAL?	PRSA,V?SWIM /?PRD43
	EQUAL?	PRSA,V?THROUGH \?PRD46
	EQUAL?	PRSO,LG-SEA,LG-BAY /?PRD43
?PRD46:	EQUAL?	PRSA,V?WALK \?PRD49
	EQUAL?	P-WALK-DIR,P?EAST,P?OUT /?PRD43
?PRD49:	EQUAL?	PRSA,V?WALK-TO \?CCL41
	EQUAL?	PRSO,LG-ERASMUS \?CCL41
?PRD43:	IN?	WINNER,SMALL-BOAT /?CCL41
	PRINTR	"You wade into the water, striding deeper and deeper, until you realize that you haven't regained enough strength to swim.You return to the beach."
?CCL41:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?NORTH,P?SOUTH \FALSE
	FCLEAR	OMI,RMUNGBIT
	PRINTR	"You wander through the village, but the villagers are apparently unwilling to let you go too far, and you are gently guided back to the pebbled beach of the waterfront."
?CCL15:	EQUAL?	RARG,M-END \FALSE
	CALL1	VILLAGERS-STARE
	RSTACK	


	.FUNCT	VILLAGERS-STARE:ANY:0:0
	EQUAL?	SCENE,S-ANJIRO \FALSE
	FSET?	CLOTHES,WEARBIT /FALSE
	ZERO?	STATIONARY? /?CCL3
	RANDOM	100
	LESS?	33,STACK /FALSE
?CCL3:	CRLF	
	PRINT	STR?374
	CRLF	
	RTRUE	


	.FUNCT	ARCHERS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL8
	FSET?	ARCHERS,RMUNGBIT \?CCL11
	PRINTR	"One of the archers has drawn out an arrow, and is putting it in his bow."
?CCL11:	PRINTI	"These are archers from the galley, all dressed in the same uniform as "
	ICALL2	THE-PRINT,HIRO-MATSU
	PRINTR	"."
?CCL8:	EQUAL?	PRSA,V?WARN,V?TELL-ABOUT \?PRD15
	EQUAL?	PRSO,RODRIGUES \?PRD15
	EQUAL?	PRSI,ARCHERS /?CTR12
?PRD15:	EQUAL?	PRSA,V?POINT \?CCL13
	EQUAL?	PRSO,ARCHERS \?CCL13
?CTR12:	IN?	WINNER,SMALL-BOAT \FALSE
	PRINTI	"Rodrigues stops rowing immediately, and turns toward shore"
	FSET?	ARCHERS,RMUNGBIT \?CCL26
	PRINTI	", waving and babbling in pidgin Japanese, reassuring the captain samurai, who says something to the man with the arrow.Now the man puts it away."
	CRLF	
	FCLEAR	ARCHERS,RMUNGBIT
	CALL2	SCORE-OBJECT,ARCHERS
	RSTACK	
?CCL26:	PRINTR	", where nothing is happening.""No games, Ingeles,"" he warns."
?CCL13:	EQUAL?	PRSA,V?TELL \FALSE
	PRINTI	"They aren't allowed to talk to you."
	CRLF	
	ICALL1	END-QUOTE
	RETURN	M-FATAL

	.ENDSEG

	.SEGMENT "ANJIRO"


	.FUNCT	I-RUTTER-CLUE:ANY:0:0
	FSET?	RUTTER,RMUNGBIT /FALSE
	FSET	RUTTER,RMUNGBIT
	CRLF	
	PRINTI	"It comes suddenly to mind that since you awoke, you haven't seen your rutters or the rest of the crew."
	EQUAL?	HERE,ON-DECK \?CCL6
	PRINTI	"Could they be aboard"
	JUMP	?CND4
?CCL6:	PRINTI	"Can they still be on the "
	ICALL2	PRINTUNDER,STR?7
?CND4:	PRINTR	", you wonder?"

	.SEGMENT "RODRIGUES"


	.FUNCT	SMALL-BOAT-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?LAUNCH \?CCL6
	ICALL2	DO-WALK,P?EAST
	RTRUE	
?CCL6:	EQUAL?	PRSA,V?WALK-TO,V?WALK \?CCL8
	EQUAL?	PRSA,V?WALK \?PRD13
	EQUAL?	P-WALK-DIR,P?OUT /?CTR10
?PRD13:	EQUAL?	PRSA,V?WALK \?CCL11
	EQUAL?	P-WALK-DIR,P?UP \?CCL11
	EQUAL?	HERE,AT-ERASMUS \?CCL11
?CTR10:	ICALL2	PERFORM,V?DISEMBARK
	RTRUE	
?CCL11:	CALL2	HELD?,BOAT-OAR
	ZERO?	STACK \?CCL20
	PRINTR	"You need an oar to row."
?CCL20:	EQUAL?	PRSA,V?WALK-TO \?PRD24
	EQUAL?	PRSO,LG-ERASMUS /?CTR21
?PRD24:	EQUAL?	PRSA,V?WALK \?CCL22
	EQUAL?	P-WALK-DIR,P?EAST,P?OUT \?CCL22
?CTR21:	EQUAL?	HERE,ANJIRO-WATERFRONT \?CCL31
	PRINTI	"You launch the boat and row out into the harbor towards the "
	ICALL2	PRINTUNDER,STR?7
	PRINTC	46
	CRLF	
	CRLF	
	CALL2	GOTO,ANJIRO-HARBOR
	RSTACK	
?CCL31:	EQUAL?	HERE,ANJIRO-HARBOR \FALSE
	PRINTI	"You row up to the side of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	".The samurai aboard eye you curiously."
	CRLF	
	CRLF	
	CALL2	GOTO,AT-ERASMUS
	RSTACK	
?CCL22:	EQUAL?	PRSA,V?WALK-TO \?CCL35
	EQUAL?	PRSO,LG-LAND \?CCL35
	CALL2	DO-WALK,P?WEST
	RSTACK	
?CCL35:	EQUAL?	PRSA,V?WALK \?CCL39
	EQUAL?	P-WALK-DIR,P?WEST \?CCL39
	EQUAL?	HERE,ANJIRO-WATERFRONT \FALSE
	PRINTR	"You can't row the boat over land!"
?CCL39:	EQUAL?	PRSO,P?UP,P?DOWN \?CCL46
	PRINTR	"If you can row a boat that way, you're a better seaman than Drake himself!"
?CCL46:	PRINTR	"You row that way for a while, but there is nothing interesting in that direction."
?CCL8:	EQUAL?	PRSA,V?SWIM,V?SWIM-TO \?CCL48
	PRINTR	"Why swim when you're in a nice dry boat?"
?CCL48:	EQUAL?	PRSA,V?BOARD,V?THROUGH \?CCL50
	EQUAL?	PRSO,LG-ERASMUS \?CCL50
	ICALL2	PERFORM,V?DISEMBARK
	RTRUE	
?CCL50:	EQUAL?	PRSA,V?DISEMBARK \?CCL54
	EQUAL?	HERE,AT-ERASMUS \?CCL57
	PRINTI	"You clamber up the gangway onto the deck.One samurai, more elaborately dressed than the others, comes over to you and bows."
	CRLF	
	CRLF	
	MOVE	WINNER,HERE
	CALL2	GOTO,ON-DECK
	RSTACK	
?CCL57:	EQUAL?	HERE,ANJIRO-HARBOR \?CCL59
	ICALL	PERFORM,V?LEAP,LG-SEA
	RTRUE	
?CCL59:	EQUAL?	HERE,ANJIRO-WATERFRONT \FALSE
	MOVE	WINNER,HERE
	PRINTR	"You disembark from the boat."
?CCL54:	EQUAL?	PRSA,V?ENTER,V?BOARD,V?THROUGH \FALSE
	EQUAL?	PRSO,LG-SEA \FALSE
	EQUAL?	HERE,ANJIRO-HARBOR,AT-ERASMUS \?CCL68
	IN?	RODRIGUES,SMALL-BOAT \?CCL71
	PRINTR	"Rodrigues grabs you.""Not so fast, Ingeles!"""
?CCL71:	CALL	JIGS-UP?,J-PLUNGE,STR?375
	ZERO?	STACK /TRUE
	MOVE	WINNER,HERE
	CALL2	JIGS-UP,STR?376
	RSTACK	
?CCL68:	EQUAL?	HERE,ANJIRO-WATERFRONT \FALSE
	PRINTR	"The boat is on dry land here."
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL80
	PRINTI	"It's just a small wooden rowboat."
	FSET?	RUTTER,RMUNGBIT /?CND81
	FSET	RUTTER,RMUNGBIT
	PRINTI	"It reminds you that you haven't seen your rutters anywhere, and you glance out at the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	"."
?CND81:	CRLF	
	RTRUE	
?CCL80:	EQUAL?	PRSA,V?BOARD \?CCL84
	EQUAL?	SCENE,S-ANJIRO \?CCL87
	CALL1	HENCHMEN-RESTRAIN
	RSTACK	
?CCL87:	EQUAL?	SCENE,S-RODRIGUES \FALSE
	IN?	RODRIGUES,SMALL-BOAT /FALSE
	IN?	RODRIGUES,HERE \?CCL95
	FSET?	LIZARD,SCOREBIT \?CCL98
	PRINTI	"""I'm not done with you yet"
	JUMP	?CND96
?CCL98:	PRINTI	"""Me first"
?CND96:	PRINTI	", Ingeles!"" says "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTR	"."
?CCL95:	PRINTR	"Mura stops you and points to the galley.""No, Anjin-san.So sorry, go there."""
?CCL84:	EQUAL?	PRSA,V?LAUNCH \FALSE
	EQUAL?	SCENE,S-ANJIRO \?CCL103
	CALL1	HENCHMEN-RESTRAIN
	ZERO?	STACK \TRUE
	MOVE	WINNER,PRSO
	PRINTI	"You launch the boat, pushing it into the water, and although you are still weak, you manage to haul yourself into it."
	CRLF	
	CRLF	
	ICALL2	DO-WALK,P?EAST
	RTRUE	
?CCL103:	EQUAL?	SCENE,S-RODRIGUES \FALSE
	ICALL	PERFORM,V?BOARD,SMALL-BOAT
	RTRUE	


	.FUNCT	LG-SMALL-BOAT-F:ANY:0:0
	EQUAL?	SCENE,S-ANJIRO \?CTR2
	IN?	SMALL-BOAT,AT-ERASMUS /?CCL3
?CTR2:	PRINTI	"There's no "
	ICALL2	DPRINT,SMALL-BOAT
	PRINTR	" to be found here."
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	PRINTR	"You sneak a quick glance over the side.Yes, the boat's still there, bobbing in the light waves."
?CCL7:	EQUAL?	PRSA,V?BOARD \FALSE
	CALL2	DO-WALK,P?DOWN
	RSTACK	

	.ENDSEG

	.SEGMENT "ANJIRO"


	.FUNCT	HENCHMEN-RESTRAIN:ANY:0:0
	FSET?	SEBASTIO-HENCHMEN,RMUNGBIT /FALSE
	IN?	OMI,HERE \?CCL5
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTI	" points to you, saying something in Japanese to "
	ICALL2	THE-PRINT,OMI
	PRINTR	", who nods.The priest's companions restrain you."
?CCL5:	IN?	SEBASTIO,HERE \FALSE
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" motions to his companions, who restrain you."

	.SEGMENT "RODRIGUES"


	.FUNCT	ANJIRO-HARBOR-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is the middle of the harbor.The "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" is to the east, the waterfront to the west.Small islands lie distantly toward the eastern and southern horizons."
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?EAST,P?OUT \FALSE
	IN?	WINNER,SMALL-BOAT /FALSE
	PRINTR	"You are too weak to swim that far."


	.FUNCT	AT-ERASMUS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"The "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" rides at anchor here, held by three bow cables."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	EQUAL?	OHERE,ON-DECK \FALSE
	EQUAL?	SCENE,S-ANJIRO \FALSE
	PRINTI	"As you climb down the gangway you can still feel the sweat trickling down your spine.You hate everything about the Japans and wish yourself and your crew back aboard, armed, and out to sea."
	CRLF	
	MOVE	BLACKTHORNE,HERE
	ICALL1	NEXT-SCENE
	RETURN	M-FATAL

	.ENDSEG

	.SEGMENT "ANJIRO"


	.FUNCT	ANJIRO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"The village is set around a crescent harbor that faces east, perhaps two hundred houses unlike any you've ever seen nestling at the beginning of the mountain which spills down to the shore.Above are terraced fields to the west and dirt roads that lead north and south.Below to the east is the waterfront.In the harbor you can see the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" riding at anchor."
?CCL3:	EQUAL?	RARG,M-BEG \?CCL5
	EQUAL?	SCENE,S-ANJIRO \?CCL8
	EQUAL?	PRSA,V?WALK,V?WALK-TO \?CCL8
	CALL1	HENCHMEN-RESTRAIN
	ZERO?	STACK \TRUE
?CCL8:	EQUAL?	PRSA,V?WALK \?CCL13
	EQUAL?	P-WALK-DIR,P?NORTH,P?SOUTH \?CCL13
	FCLEAR	OMI,RMUNGBIT
	PRINTR	"You follow the dirt road through the village, conscious of many people watching you.When they see you have noticed them, they bow to you.They pass to and fro, like so many multicolored butterflies.After a while you find you've returned to the house you left."
?CCL13:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?UP \FALSE
	FCLEAR	OMI,RMUNGBIT
	PRINTR	"You walk up the dirt path that leads to the fields, watched by curious eyes every second.In the terraced fields are farmers up to the their knees in water, planting and weeding.How can anything grow in such wetness, you wonder, and how can the fields have been built on such steep hillsides?Confused, you walk back to the house you left."
?CCL5:	EQUAL?	RARG,M-END \?CCL21
	CALL1	VILLAGERS-STARE
	RSTACK	
?CCL21:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?FIND \FALSE
	GRTR?	SCENE,S-ERASMUS \?CCL29
	PRINTR	"Anjiro is a small fishing village in the province of Izu."
?CCL29:	PRINTR	"You've never heard of any place called Anjiro."

	.SEGMENT "RODRIGUES"

	.SEGMENT "YABU"


	.FUNCT	VILLAGERS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	PRINTI	"They don't understand you."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL8
	EQUAL?	HERE,VILLAGE-SQUARE \?CCL11
	PRINTR	"They are watching everything that's going on with great interest."
?CCL11:	PRINTR	"They go about their daily activities, pretending not to be interested in you."
?CCL8:	EQUAL?	PRSA,V?BOW \FALSE
	PRINTR	"They return your bow with amusement.You are obviously a new and amazing sight for them."

	.ENDSEG

	.SEGMENT "ANJIRO"


	.FUNCT	SEBASTIO-HENCHMEN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" interrupts.""None of these men understand Portuguese, heretic."""
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	PRINTI	"There are ten of them, all natives, black-haired and black-eyed, one dressed like "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTR	" except that he has thong slippers.The rest are in varicolored robes, loose trousers, or loincloths."
?CCL7:	CALL1	HOSTILE-VERB?
	ZERO?	STACK \?CCL9
	EQUAL?	PRSA,V?PARRY,V?STOP /?CCL9
	EQUAL?	PRSA,V?HELP \FALSE
	EQUAL?	PRSO,ME \FALSE
?CCL9:	IN?	OMI,HERE \?CCL17
	ICALL2	CTHE-PRINT,OMI
	PRINTR	" barks an order, and they quickly and efficiently pin you in place.You are so weak you can hardly struggle."
?CCL17:	FSET?	SEBASTIO-HENCHMEN,SCOREBIT \?CCL19
	PRINTI	"You are outnumbered and weak, but you manage to smash the nose of one.The noise of his scream slows the rest down a little."
	CRLF	
	CALL2	SCORE-OBJECT,SEBASTIO-HENCHMEN
	RSTACK	
?CCL19:	PRINTR	"You try your best to fend them off."


	.FUNCT	HENCHMAN-BODY-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTR	"He looks like a typical villager, but he's quite dead."
?CCL5:	IN?	OMI,HERE \FALSE
	EQUAL?	PRSA,V?TAKE /?CCL7
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL7:	PRINT	STR?377
	ICALL2	PRINTUNDER,STR?378
	PRINTR	"!"" he repeats."


	.FUNCT	HENCHMAN-HEAD-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTR	"Its expression is frozen in a grimace of death."
?CCL5:	EQUAL?	PRSA,V?GIVE \?CCL7
	EQUAL?	PRSO,HENCHMAN-HEAD \?CCL7
	FSET?	PRSI,PERSON \?CCL7
	FSET?	PRSI,DEAD /?CCL7
	ICALL1	CTHE-PRINT-PRSI
	PRINTR	" doesn't seem interested."
?CCL7:	EQUAL?	PRSA,V?TAKE /?PRD15
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?PRD15:	IN?	OMI,HERE \FALSE
	PRINT	STR?377
	EQUAL?	PRSA,V?KICK \?CCL20
	ICALL2	PRINTUNDER,STR?379
	PRINTR	""" he exclaims."
?CCL20:	ICALL2	PRINTUNDER,STR?380
	PRINTR	""" he repeats."


	.FUNCT	I-SEBASTIO:ANY:0:0
	INC	'DELAY-CNT
	ZERO?	SEBASTIO-CNT \?CCL5
	EQUAL?	HERE,ANJIRO,ANJIRO-WATERFRONT /?CND3
	GRTR?	DELAY-CNT,5 \?CCL9
	CRLF	
	PRINTI	"Your curiosity gets the better of you and you go out into the street."
	CRLF	
	CRLF	
	ICALL2	GOTO,ANJIRO
	JUMP	?CND3
?CCL9:	GRTR?	DELAY-CNT,2 \FALSE
	EQUAL?	HERE,MURA-HOUSE,GARDEN \FALSE
	CRLF	
	PRINTR	"You hear a commotion outside."
?CCL5:	EQUAL?	SEBASTIO-CNT,4 \?CND3
	FSET?	SEBASTIO-HENCHMEN,SCOREBIT \?CND3
	EQUAL?	DELAY-CNT,1 \?CCL19
	CRLF	
	PRINTR	"You can feel the life being choked out of you!"
?CCL19:	CRLF	
	ICALL2	JIGS-UP,STR?381
	RETURN	M-FATAL
?CND3:	SET	'DELAY-CNT,0
	INC	'SEBASTIO-CNT
	EQUAL?	SEBASTIO-CNT,1 \?CCL22
	MOVE	SEBASTIO,HERE
	SET	'QCONTEXT,SEBASTIO
	ICALL2	THIS-IS-IT,SEBASTIO
	ICALL2	THIS-IS-IT,SEBASTIO-HENCHMEN
	MOVE	SEBASTIO-HENCHMEN,HERE
	CRLF	
	PRINTR	"You see a tonsured man approaching and fear sweeps sickeningly from your testicles into your stomach.He is obviously a Portuguese or Spanish priest, and though his flowing robe is orange, there is no mistaking the crucifix and rosary at his belt, or the cold hostility on his face.Priests here!A world away in Europe, England and Holland are fighting for their freedom from the priests.Is there no place not infested by these idolators and their Inquisition?Your fear begins to give way to rage.

Behind him are several Japanese."
?CCL22:	EQUAL?	SEBASTIO-CNT,2 \?CCL24
	CRLF	
	PRINTI	"""Who are you?"" the priest says in Portuguese."
	FSET?	CLOTHES,WEARBIT /?CND25
	PRINTI	"""You're as naked as a savage!You have no shame, just like the pagans here!Put on some clothes and hide your shame!"""
?CND25:	PRINTR	"He points to the harbor.""That's a Netherlander privateer.You're a heretic Dutchman.You're pirates.You're an enemy of the church!"""
?CCL24:	EQUAL?	SEBASTIO-CNT,3 \?CCL28
	CRLF	
	PRINTI	"""They crucify criminals here.You're going to die.The "
	ICALL2	PRINTUNDER,STR?268
	PRINTR	" coming with his samurai.God have mercy on you!"""
?CCL28:	EQUAL?	SEBASTIO-CNT,4 \?CCL30
	ICALL2	THIS-IS-IT,SEBASTIO-HENCHMEN
	SET	'OPPONENT,SEBASTIO-HENCHMEN
	CRLF	
	PRINTR	"The priest lifts his crucifix and holds it between you as a shield.""Oh, God, protect us from this evil!May God have mercy on your soul.""

He snaps something in Japanese and the men surge toward you, grabbing and pinioning your arms.You feel yourself choking!"
?CCL30:	EQUAL?	SEBASTIO-CNT,5 \FALSE
	ICALL	QUEUE,I-OMI,-1
	CALL2	DEQUEUE,I-SEBASTIO
	RSTACK	


	.FUNCT	I-OMI:ANY:0:0,TMP
	INC	'DELAY-CNT
	EQUAL?	OMI-CNT,2 \?CCL5
	ZERO?	OMI-QUESTION /?CND3
	GRTR?	DELAY-CNT,2 \?CND8
	ICALL1	OMI-KILLS-YOU
	RETURN	M-FATAL
?CND8:	ICALL2	SETUP-ANSWER,STR?254
	ICALL2	TELL-ANSWER-OR-DIE,STR?382
	RTRUE	
?CCL5:	EQUAL?	OMI-CNT,3 \?CCL11
	ZERO?	OMI-QUESTION /?CND3
	GRTR?	DELAY-CNT,2 \?CND14
	ICALL1	OMI-KILLS-YOU
	RETURN	M-FATAL
?CND14:	ICALL2	SETUP-ANSWER,STR?383
	ICALL2	TELL-ANSWER-OR-DIE,STR?384
	RTRUE	
?CCL11:	EQUAL?	OMI-CNT,4 \?CND3
	ZERO?	OMI-QUESTION /?CND3
	GRTR?	DELAY-CNT,2 \?CND19
	ICALL1	OMI-KILLS-YOU
	RETURN	M-FATAL
?CND19:	ICALL2	SETUP-ANSWER,STR?254
	ICALL2	TELL-ANSWER-OR-DIE,STR?385
	RTRUE	
?CND3:	SET	'DELAY-CNT,0
	INC	'OMI-CNT
	EQUAL?	OMI-CNT,1 \?CCL23
	SET	'OPPONENT,FALSE-VALUE
	MOVE	OMI,HERE
	ICALL2	THIS-IS-IT,OMI
	CRLF	
	PRINTI	"Suddenly the attack ceases.A young man is ten paces away.He wears two scabbarded swords in his belt.His right hand is casually on the hilt of the longer one."""
	ICALL2	PRINTUNDER,STR?386
	PRINTI	""" he asks harshly."""
	ICALL2	PRINTUNDER,STR?387
	PRINTR	""" The Japanese fall to their knees."
?CCL23:	EQUAL?	OMI-CNT,2 \?CCL25
	SET	'QCONTEXT,SEBASTIO
	SET	'OMI-QUESTION,1
	ICALL2	SETUP-ANSWER,STR?254
	CRLF	
	ICALL2	CTHE-PRINT,OMI
	PRINTI	" says, """
	ICALL2	PRINTUNDER,STR?388
	PRINTR	""" The priest translates, ""Kasigi Omi-san says, 'What's your nationality?'"""
?CCL25:	EQUAL?	OMI-CNT,3 \?CCL27
	SET	'QCONTEXT,SEBASTIO
	SET	'OMI-QUESTION,2
	ICALL	NEW-SDESC,OMI,STR?253
	ICALL2	SETUP-ANSWER,STR?383
	CRLF	
	ICALL2	CTHE-PRINT,OMI
	PRINTI	" says, """
	ICALL2	PRINTUNDER,STR?389
	PRINTR	"""The priest says nervously, ""Kasigi Omi-san says, 'Where did you sail from?'"""
?CCL27:	EQUAL?	OMI-CNT,4 \?CCL29
	SET	'QCONTEXT,SEBASTIO
	SET	'OMI-QUESTION,3
	ICALL2	SETUP-ANSWER,STR?254
	CRLF	
	PRINTR	"Another flurry of words from Omi.""Omi-san asks if you're the leader.The headman says there are only a few of you heretics alive and most are sick."""
?CCL29:	EQUAL?	OMI-CNT,5 \?CCL31
	SET	'QCONTEXT,OMI
	CRLF	
	PRINTR	"Another spate of words from the samurai.""Omi-san says because you are the leader you will be allowed to walk around the village freely, until his master comes."""
?CCL31:	EQUAL?	OMI-CNT,6 \?CCL33
	FSET	SEBASTIO-HENCHMEN,RMUNGBIT
	MOVE	HENCHMAN-BODY,HERE
	MOVE	HENCHMAN-HEAD,HERE
	CRLF	
	PRINTI	"Omi speaks contemptuously to the priest and his men, then waves them away.They all bow low, except for one man who rises deliberately, without bowing.With blinding speed Omi's killing sword hisses in a silver arc and the man's head topples off his shoulders.No one else moves a muscle."""
	ICALL2	PRINTUNDER,STR?380
	PRINTR	""" he says, motioning everyone away."
?CCL33:	EQUAL?	OMI-CNT,7 \?CCL35
	IN?	SEBASTIO,HERE \FALSE
	CRLF	
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTI	" gravely makes the sign of the cross over the body.""In nomine Patris et Filii et Spiritus Sancti.""He stares at the samurai, who again says """
	ICALL2	PRINTUNDER,STR?380
	PRINTR	""""
?CCL35:	EQUAL?	OMI-CNT,8 \?CCL40
	LOC	SEBASTIO >TMP
	REMOVE	SEBASTIO
	REMOVE	SEBASTIO-HENCHMEN
	FSET	OMI,RMUNGBIT
	EQUAL?	TMP,HERE \FALSE
	CRLF	
	PRINTR	"The priest turns and walks away.His remaining supporters follow."
?CCL40:	EQUAL?	OMI-CNT,9 \FALSE
	SET	'QCONTEXT,FALSE-VALUE
	IN?	OMI,HERE \?CTR47
	FSET?	OMI,RMUNGBIT /?CCL48
?CTR47:	MOVE	OMI,GENERIC-OBJECTS
	ICALL2	DEQUEUE,I-OMI
	CRLF	
	PRINTR	"In the distance, you can hear Omi laughing uproariously."
?CCL48:	CRLF	
	CALL2	JIGS-UP,STR?390
	RSTACK	


	.FUNCT	TELL-ANSWER-OR-DIE:ANY:1:1,STR
	CRLF	
	ICALL2	CTHE-PRINT,OMI
	PRINTI	" scowls, fingering the sword in his scabbard.The priest looks nervously at him and then at you."""
	PRINT	STR
	PRINTR	"?Answer!"" rasps the priest.""Answer or die, heretic!"""


	.FUNCT	OMI-KILLS-YOU:ANY:0:0
	CRLF	
	ICALL2	CTHE-PRINT,OMI
	PRINTI	" barks a few impatient words to "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTI	", who nods eagerly.Moments later, "
	ICALL2	THE-PRINT,OMI
	PRINTI	"'s sword separates your head from your body."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	MURA-HOUSE-F:ANY:1:1,RARG,H
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	FCLEAR	ON-DECK,TOUCHBIT
	MOVE	BLACKTHORNE,QUILT
	ICALL1	B-SIT
	REMOVE	BOOTS
	FCLEAR	BOOTS,WEARBIT
	REMOVE	CLOTHES
	FCLEAR	CLOTHES,WEARBIT
	PUTP	BLACKTHORNE,P?HEALTH,1
	MOVE	SMALL-BOAT,ANJIRO-WATERFRONT
	MOVE	BOAT-OAR,SMALL-BOAT
	FCLEAR	PASSAGE-DOOR,OPENBIT
	FCLEAR	FOCSLE-DOOR,OPENBIT
	ICALL2	MOVE-CREW,FALSE-VALUE
	MOVE	SAMURAI-GUARDS,ON-DECK
	REMOVE	ERASMUS-ANCHOR
	MOVE	RIBBON,ON-DECK
	SET	'COLLAPSE-CNT,0
	CALL	QUEUE,I-COLLAPSE,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	GETP	WINNER,P?HEALTH >H
	EQUAL?	PRSA,V?LOOK-OUT \?CCL8
	EQUAL?	PRSO,ROOMS \?CCL8
	FSET?	MURA-DOOR,OPENBIT \?CCL8
	PRINTR	"You see a beautiful, neat garden."
?CCL8:	EQUAL?	PRSA,V?SLEEP \?CCL13
	PRINTR	"You have just awakened.Don't be a sleepy-head."
?CCL13:	EQUAL?	PRSA,V?LISTEN \?CCL15
	EQUAL?	PRSO,FALSE-VALUE,NOISE \?CCL15
	PRINT	STR?371
	PRINTR	"One of them is speaking Portuguese!"
?CCL15:	EQUAL?	PRSA,V?DRESS \?CCL19
	IN?	CLOTHES,HERE \?CCL19
	ICALL	PERFORM,V?WEAR,CLOTHES
	RTRUE	
?CCL19:	EQUAL?	PRSA,V?STAND \?CCL23
	FSET?	BLACKTHORNE,SITTING \?CCL23
	LESS?	H,3 \?CCL28
	SET	'COLLAPSE-CNT,4
	ICALL	QUEUE,I-COLLAPSE,-1
	PRINTR	"You try to stand but you're still too weak."
?CCL28:	ICALL1	B-STAND
	PRINTR	"You stand shakily."
?CCL23:	EQUAL?	PRSA,V?DANCE \?CCL30
	PRINTR	"You don't have the strength."
?CCL30:	EQUAL?	PRSA,V?MAKE \FALSE
	EQUAL?	PRSO,SIGN-OF-CROSS \FALSE
	IN?	ONNA,HERE \FALSE
	PRINTR	"She smiles at you and nods."


	.FUNCT	I-COLLAPSE:ANY:0:0,H
	GETP	BLACKTHORNE,P?HEALTH >H
	EQUAL?	H,3 \?PRG4
	CALL2	DEQUEUE,I-COLLAPSE
	RSTACK	
?PRG4:	INC	'COLLAPSE-CNT
	EQUAL?	COLLAPSE-CNT,4 /TRUE
	EQUAL?	COLLAPSE-CNT,5 \?CCL9
	EQUAL?	H,1 \?CCL12
	CRLF	
	PRINTR	"You are still extremely weak and hungry."
?CCL12:	EQUAL?	H,2 \FALSE
	CRLF	
	PRINTR	"You are feeling better, but still on the verge of collapse."
?CCL9:	EQUAL?	COLLAPSE-CNT,8 /TRUE
	EQUAL?	COLLAPSE-CNT,9 \?CCL17
	EQUAL?	H,1,2 \FALSE
	CRLF	
	PRINTR	"You are on the verge of collapsing from weakness and hunger."
?CCL17:	EQUAL?	COLLAPSE-CNT,10 \FALSE
	EQUAL?	H,1,2 \FALSE
	CRLF	
	CALL2	JIGS-UP,STR?393
	RSTACK	


	.FUNCT	MURA-DOOR-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET?	MURA-DOOR,RMUNGBIT \?CCL6
	PRINTR	"The door has been broken by your clumsiness."
?CCL6:	PRINTR	"The door is made of square wood laths and covered with paper.It looks translucent, shadows from the outside mottling the light and flimsy structure."
?CCL3:	EQUAL?	PRSA,V?OPEN,V?MUNG,V?TEAR /?CTR7
	EQUAL?	PRSA,V?RUB \?CCL8
?CTR7:	FSET?	MURA-DOOR,RMUNGBIT \?CCL13
	EQUAL?	PRSA,V?OPEN \?CCL16
	FSET?	PRSO,OPENBIT /?CCL19
	FSET	MURA-DOOR,OPENBIT
	PRINTR	"You gingerly slide open the broken door."
?CCL19:	CALL2	ITS-ALREADY-X,STR?62
	RSTACK	
?CCL16:	PRINTR	"You've already broken it."
?CCL13:	EQUAL?	HERE,MURA-HOUSE \FALSE
	FSET?	MURA-DOOR,RMUNGBIT /FALSE
	FSET?	BLACKTHORNE,SITTING \?CCL26
	PRINT	YOU-HAVE-TO
	PRINTR	"stand up to reach the door."
?CCL26:	EQUAL?	PRSA,V?MUNG,V?TEAR \?CND24
	PRINTR	"That wouldn't be very nice, even if the door is flimsy-looking."
?CND24:	FSET	MURA-DOOR,OPENBIT
	FSET	MURA-DOOR,RMUNGBIT
	MOVE	ONNA,HERE
	ICALL2	MARGINAL-PIC,P-GARDEN
	PRINTI	"You reach to open the door, reeling slightly as you are still very weak, and put out a hand to steady yourself but the light, square wood laths can't bear your weight and they shatter, paper ripping apart."
	IN?	FOOD,WINNER \?CND28
	MOVE	FOOD,HERE
	PRINTI	"You drop the food."
?CND28:	IN?	CHOPSTICKS,WINNER \?CND30
	MOVE	CHOPSTICKS,HERE
	PRINTI	"You drop the sticks."
?CND30:	IN?	TRAY,WINNER \?CND32
	MOVE	TRAY,HERE
	ICALL	MOVE-ALL,TRAY,HERE
	PRINTI	"You drop the tray."
?CND32:	PRINTI	" You marvel at how flimsy it is, not at all like the sturdy wooden doors of England.Are there no thieves here?

You right yourself and manage to open the door."
	CALL2	QUEUED?,I-ONNA-RETURNS
	ZERO?	STACK /?CCL36
	MOVE	FOOD,TRAY
	MOVE	TRAY,HERE
	MOVE	CLOTHES,HERE
	MOVE	BOOTS,GARDEN
	ICALL2	DEQUEUE,I-ONNA-RETURNS
	PRINTI	"Behind the door, carrying a tray of food and a bundle of your clothes, is a shocked "
	ICALL2	DPRINT,ONNA
	PRINTR	".She places the tray on the floor and retreats with as much calm as she can muster."
?CCL36:	PRINTR	"The shocked woman in the corridor is staring at you."
?CCL8:	EQUAL?	PRSA,V?REPAIR \FALSE
	FSET?	PRSO,RMUNGBIT \FALSE
	PRINTR	"You try to fix the door, but it's futile."


	.FUNCT	QUILT-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"It's a thick padded cotton quilt."
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	CALL1	MOTION-VERB?
	ZERO?	STACK /FALSE
	GETP	WINNER,P?HEALTH
	LESS?	STACK,3 \?CCL14
	PRINTR	"You're still too weak."
?CCL14:	MOVE	WINNER,HERE
	RFALSE	


	.FUNCT	MURA-CRUCIFIX-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"This is the sort of crucifix you would expect to find in a Catholic country.You cannot help but look at it with anger and dread, as Spain and Portugal, the Catholic powers, have been at war with England for decades.

All your life you have heard rumors of Portugal's secret empire in the East, how they had by now converted the heathens to Catholicism and so held them in bondage.Can these rumors have been true?If so, what about the other rumors, that gold here is as cheap as pig iron, and emeralds and diamonds are as plentiful as pebbles on the beach?"
?CCL3:	EQUAL?	PRSA,V?TAKE,V?MOVE,V?LOWER \?CCL5
	PRINTR	"It's fixed to the wall."
?CCL5:	EQUAL?	PRSA,V?MUNG \FALSE
	PRINTR	"Much as you might like to break it, idolatrous symbol of the hated enemy that it is, you can't get to it."


	.FUNCT	CHOPSTICKS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"These are two short sticks of polished wood, slightly pointed at one end.You have no idea what they are for."
?CCL3:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL5
	EQUAL?	PRSI,CHOPSTICKS \?CCL5
	PRINTR	"A pair of chopsticks makes a poor substitute for a weapon."
?CCL5:	EQUAL?	PRSA,V?EAT \?PRD11
	EQUAL?	PRSO,FOOD /?CCL9
?PRD11:	EQUAL?	PRSA,V?USE \?PRD14
	EQUAL?	PRSO,CHOPSTICKS /?CCL9
?PRD14:	EQUAL?	PRSA,V?PICK-UP \FALSE
	EQUAL?	PRSO,FOOD \FALSE
?CCL9:	IN?	FOOD,TRAY /?CTR20
	CALL2	HELD?,FOOD
	ZERO?	STACK /?CCL21
?CTR20:	PRINTR	"You try to scoop the food with the sticks, but it doesn't work.Why there is no knife or spoon here, you cannot understand."
?CCL21:	PRINTR	"You can't understand how to use the sticks."


	.FUNCT	FOOD-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The food consists of cold cooked vegetables, fish soup, and a thick porridge of wheat or barley."
?CCL3:	EQUAL?	PRSA,V?WAIT-FOR \?CCL5
	CALL2	QUEUED?,I-ONNA-RETURNS
	ZERO?	STACK /FALSE
	PRINTR	"Your stomach rumbles as you wait for more food; perhaps there'll be grog or a good roast capon this time!"
?CCL5:	EQUAL?	PRSA,V?SMELL \?CCL10
	PRINTR	"It smells very strange.Oh for a loaf of fresh crunchy bread, or a roast with gravy!Nonetheless, it's all you've got."
?CCL10:	EQUAL?	PRSA,V?EAT \FALSE
	EQUAL?	PRSO,FOOD \FALSE
	EQUAL?	PRSI,FALSE-VALUE,FINGERS,HANDS /?CCL12
	EQUAL?	PRSI,MOUTH \FALSE
?CCL12:	REMOVE	FOOD
	GETP	BLACKTHORNE,P?HEALTH
	LESS?	STACK,2 \?CCL20
	ICALL	QUEUE,I-REMEMBER,1
	ICALL	QUEUE,I-ONNA,2
	PRINTI	"You wolf down the vegetables, which have a piquant taste.You drain the bowl of soup.You eat the porridge with your fingers, as there appear to be no utensils, just some sticks of wood.

You are still ravenously hungry."
	CRLF	
	PUTP	BLACKTHORNE,P?HEALTH,2
	RTRUE	
?CCL20:	PUTP	BLACKTHORNE,P?HEALTH,3
	PRINTI	"This tray of food is the same as the first.There is no meat and no grog or brandy.You can eat more slowly now, and you try to savor the unfamiliar fare, but you can't convince yourself it's more than just filling.Your stomach is pleasantly full when you finish, though."
	CRLF	
	CALL2	SCORE-OBJECT,FOOD
	RSTACK	


	.FUNCT	I-REMEMBER:ANY:0:0
	CRLF	
	PRINTR	"With an effort you try to collect yourself.You remember getting the anchor out.With Vinck.At least you think it was Vinck.There were lights ashore.Then there were lights and strange voices.One of the natives talked a little Portuguese.They must have carried you ashore and put you here."


	.FUNCT	I-ONNA:ANY:0:0
	MOVE	ONNA,MURA-HOUSE
	FSET	MURA-DOOR,OPENBIT
	ICALL2	THIS-IS-IT,ONNA
	SET	'QCONTEXT,ONNA
	CRLF	
	PRINTI	"A panel in the wall slides open.A middle-aged, heavy-set, round-faced woman drops to her knees beside the door and bows and smiles at you."""
	ICALL2	PRINTUNDER,STR?395
	PRINTR	""" she asks."

	.SEGMENT "PIT"


	.FUNCT	ONNA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?BE? \?PRD10
	EQUAL?	PRSO,THIS \?PRD10
	EQUAL?	PRSI,JAPAN /?CTR7
?PRD10:	EQUAL?	PRSA,V?FIND \?CCL8
	EQUAL?	PRSO,ME \?CCL8
?CTR7:	PRINT	STR?397
	PRINTR	"."
?CCL8:	EQUAL?	PRSA,V?WHO \?CCL17
	ICALL	NEW-SDESC,ONNA,STR?256
	PRINTR	"She doesn't understand you, so you point to yourself and say ""Blackthorne"" several times, very deliberately.She frowns, and then with a flood of understanding points at herself and says, ""Onna!Onna!"""
?CCL17:	EQUAL?	PRSA,V?SORRY /?PRD21
	EQUAL?	PRSA,V?BE \?CCL19
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL19
	EQUAL?	PRSI,INTADJ \?CCL19
	GET	PARSE-RESULT,11
	EQUAL?	STACK,W?SORRY \?CCL19
?PRD21:	FSET?	MURA-DOOR,RMUNGBIT \?CCL19
	PRINTR	"""I'm sorry,"" you say, gesturing toward the broken door.The woman finally understands, and smiles as if to indicate that she forgives you."
?CCL19:	PRINT	STR?397
	PRINTR	" and says something you cannot understand."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL29
	PRINTR	"She is a middle-aged, heavy-set, round-faced woman."
?CCL29:	EQUAL?	PRSA,V?FIND,V?WHERE \?CCL31
	IN?	MURA,HERE \FALSE
	SET	'WINNER,MURA
	ICALL	PERFORM,V?FIND,PRSO
	SET	'WINNER,BLACKTHORNE
	RTRUE	
?CCL31:	EQUAL?	PRSA,V?ASK-FOR \?CCL36
	EQUAL?	PRSO,ONNA \?CCL36
	PRINTR	"She doesn't understand you."
?CCL36:	EQUAL?	PRSA,V?RUB \?CCL40
	EQUAL?	PRSO,STOMACH,TRAY \?CCL40
	ICALL	PERFORM,V?SHOW,PRSO,ONNA
	RTRUE	
?CCL40:	EQUAL?	PRSA,V?SHOW,V?GIVE \?CCL44
	EQUAL?	PRSI,ONNA \?CCL44
	EQUAL?	PRSO,ME \?CCL49
	SET	'WINNER,ONNA
	ICALL2	PERFORM,V?WHO
	SET	'WINNER,PLAYER
	RTRUE	
?CCL49:	EQUAL?	PRSO,HENCHMAN-HEAD /?CTR50
	LOC	HENCHMAN-HEAD
	EQUAL?	PRSO,STACK \?CCL51
?CTR50:	PRINTR	"She screams and crosses herself."
?CCL51:	EQUAL?	HERE,MURA-HOUSE,GARDEN \FALSE
	EQUAL?	PRSA,V?SHOW \?CCL58
	PRINTI	"You point to "
	JUMP	?CND56
?CCL58:	FSET?	PRSO,TAKEBIT \?CND59
	FCLEAR	PRSO,WEARBIT
	MOVE	PRSO,ONNA
?CND59:	PRINTI	"You give her "
?CND56:	EQUAL?	PRSO,GLOBAL-FOOD \?CCL63
	IN?	TRAY,HERE \?CCL63
	PRINTI	"the empty tray"
	JUMP	?CND61
?CCL63:	ICALL1	THE-PRINT-PRSO
?CND61:	PRINTI	", and the woman looks at "
	ICALL2	PRINT-HIM/HER,PRSO
	PRINTI	" and "
	EQUAL?	PRSO,MURA-CRUCIFIX \?CCL68
	PRINTR	"makes the sign of the cross."
?CCL68:	EQUAL?	PRSO,TRAY,FOOD,MOUTH /?PRD72
	EQUAL?	PRSO,STOMACH,GLOBAL-FOOD \?CCL70
?PRD72:	LOC	CLOTHES
	ZERO?	STACK \?CCL70
	MOVE	ONNA,GARDEN
	FSET?	MURA-DOOR,RMUNGBIT /?CND75
	FCLEAR	MURA-DOOR,OPENBIT
?CND75:	MOVE	TRAY,ONNA
	ICALL	QUEUE,I-ONNA-RETURNS,2
	PRINTI	"nods.She smiles, politely takes the tray, and "
	FSET?	MURA-DOOR,RMUNGBIT \?CCL79
	PRINTR	"then glances ruefully at the door."
?CCL79:	PRINTR	"slides the door shut."
?CCL70:	PRINTR	"says something incomprehensible."
?CCL44:	EQUAL?	PRSA,V?RUB,V?RAISE,V?FUCK \FALSE
	ICALL2	CTHE-PRINT,ONNA
	PRINTR	" seems surprised, but not unwilling."

	.ENDSEG

	.SEGMENT "ANJIRO"


	.FUNCT	I-ONNA-RETURNS:ANY:0:0
	MOVE	FOOD,TRAY
	MOVE	CLOTHES,HERE
	MOVE	TRAY,HERE
	MOVE	BOOTS,GARDEN
	CRLF	
	PRINTI	"The "
	EQUAL?	HERE,MURA-HOUSE \?CND1
	PRINTI	"door slides open again, and the "
?CND1:	PRINTR	"small woman reappears with more food, and your clothes which she places in a neat pile.She bows again and departs."

	.SEGMENT "RODRIGUES"


	.FUNCT	RIBBON-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The wide band of red silk is pasted across the doorway.It is covered with queer, squiggly writing."
?CCL3:	EQUAL?	PRSA,V?READ \?CCL5
	PRINTR	"The ribbon is covered with queer, squiggled writing.You can't read it, though."
?CCL5:	EQUAL?	PRSA,V?POINT \?CCL7
	PRINTI	"The leader says, politely, """
	ICALL2	PRINTUNDER,STR?399
	PRINTI	""" "
	ZERO?	RIBBON-CNT \?CCL10
	PRINTR	"He smiles politely."
?CCL10:	PRINTR	"His expression is very serious."
?CCL7:	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	PRINTC	34
	ICALL2	PRINTUNDER,STR?400
	PRINTI	"""The samurai on guard shakes his head to make the point clear."
	EQUAL?	SCENE,S-ANJIRO \?CCL15
	PRINTI	"He is no longer smiling.

You try again."""
	ICALL2	PRINTUNDER,STR?401
	PRINTI	""" the guards say emphatically.

When you still don't seem to be listening, the guard yells, """
	ICALL2	PRINTUNDER,STR?402
	PRINTI	""" You are jerked around to face the samurai.Their swords are half out of the scabbards.They wait for you to make up your mind.

You realize they are not going to let you retrieve your rutters, and begin to retreat.You remember to bow and at once all hostility vanishes, but the guards are still watchful."
	CRLF	
	ICALL2	SCORE-OBJECT,SAMURAI-GUARDS
	CRLF	
	CALL2	GOTO,AT-ERASMUS
	RSTACK	
?CCL15:	IN?	RODRIGUES,HERE \?CCL18
	CRLF	
	PRINTR	"""Leave this to me, Ingeles!"" blusters Rodrigues."
?CCL18:	CRLF	
	RTRUE	


	.FUNCT	I-RIBBON:ANY:0:0
	EQUAL?	HERE,ON-DECK,BRIDGE-OF-ERASMUS \FALSE
	FSET?	SAMURAI-GUARDS,RMUNGBIT /FALSE
	INC	'RIBBON-CNT
	LESS?	RIBBON-CNT,3 /?CCL8
	CRLF	
	CALL2	JIGS-UP,STR?403
	RSTACK	
?CCL8:	ICALL	QUEUE,I-RIBBON,4
	CRLF	
	PRINTR	"The samurai leader makes a long speech part of which emphatically seems to indicate you are expected to leave immediately. But what of your rutters?How can you retrieve them?"


	.FUNCT	SAMURAI-GUARDS-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Several samurai are at posts on the main deck.They "
	ZERO?	RIBBON-CNT /?CCL8
	PRINTI	"watch you warily."
	RTRUE	
?CCL8:	FSET?	SAMURAI-GUARDS,RMUNGBIT \?CCL10
	PRINTI	"seem relaxed."
	RTRUE	
?CCL10:	PRINTI	"seem a little nervous."
	RTRUE	


	.FUNCT	SAMURAI-GUARDS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTR	"None of the guards appear to understand you."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	EQUAL?	SCENE,S-ESCAPE \?CCL10
	PRINTR	"They are at attention, alert, and rigidly correct in their bearing."
?CCL10:	EQUAL?	HERE,ON-DECK,AT-ERASMUS,BRIDGE-OF-ERASMUS \?CCL12
	PRINTR	"These men are all samurai.Some have steel breastplates but most wear simple kimonos, and the two swords.All wear their hair the same way: the top of the head shaved and the hair at the back and sides gathered into a queue, oiled, then doubled over the crown and tied neatly."
?CCL12:	PRINTI	"You can't see the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" well enough from here to tell much about who's crewing it."
?CCL7:	EQUAL?	PRSA,V?WHO \?CCL14
	EQUAL?	SCENE,S-ANJIRO \?CCL17
	PRINTI	"They are all dressed alike, so perhaps they are soldiers put here by the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	"."
?CCL17:	EQUAL?	SCENE,S-RODRIGUES \FALSE
	PRINTI	"They are samurai of Kasigi Yabu, the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	" of this province."
?CCL14:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL21
	EQUAL?	HERE,ON-DECK /?CTR23
	EQUAL?	SCENE,S-ESCAPE \?CCL24
?CTR23:	CALL2	JIGS-UP?,J-GUARDS
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?404
	RSTACK	
?CCL24:	PRINTR	"Luckily for you, you aren't close enough to attack the guards."
?CCL21:	EQUAL?	HERE,ANJIRO-WATERFRONT \?CCL31
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \?CCL31
	PRINTI	"The crewmen on the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" aren't here."
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL31:	EQUAL?	PRSA,V?GIVE,V?SHOW \?CCL38
	EQUAL?	PRSO,HENCHMAN-HEAD \?CCL41
	PRINTR	"They discuss it among themselves.They don't seem upset or disgusted by it."
?CCL41:	PRINTR	"They don't seem interested."
?CCL38:	EQUAL?	PRSA,V?BOW \?CCL43
	EQUAL?	SCENE,S-ESCAPE \?CCL46
	PRINTR	"They return your bow with perfect military correctness."
?CCL46:	FSET?	PRSO,RMUNGBIT /?CCL48
	FSET	PRSO,RMUNGBIT
	EQUAL?	RIBBON-CNT,3 \?CCL51
	PRINTR	"You bow politely.At once all the hostility vanishes and they all bow and smile again."
?CCL51:	PRINTR	"All the guards relax slightly and begin to smile."
?CCL48:	PRINTI	"The leader returns your bow."
	ZERO?	RIBBON-CNT /?CND52
	PRINTR	"The guards seem more relaxed now."
?CND52:	CRLF	
	RTRUE	
?CCL43:	EQUAL?	PRSA,V?TELL-ABOUT \FALSE
	PRINTR	"They don't appear to understand you."

	.ENDSEG

	.SEGMENT "YABU"


	.FUNCT	VILLAGE-SQUARE-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	EQUAL?	SCENE,S-YABU \FALSE
	ICALL2	DRESS-BLACKTHORNE,TRUE-VALUE
	ICALL1	B-KNEEL
	ICALL	MOVE-CREW,HERE,TRUE-VALUE
	MOVE	MURA,HERE
	MOVE	SEBASTIO,HERE
	ICALL	NEW-SDESC,SEBASTIO,STR?248
	MOVE	OMI,HERE
	ICALL	NEW-SDESC,OMI,STR?253
	MOVE	YABU,HERE
	SET	'YABU-CNT,0
	CALL	QUEUE,I-YABU-AUDIENCE,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL8
	PRINTI	"This is the village square of Anjiro.The day is clear and warm."
	EQUAL?	SCENE,S-YABU \?CND9
	PRINTI	"You are "
	CALL1	B-KNEELING?
	ZERO?	STACK /?CCL13
	PRINTI	"kneeling"
	JUMP	?CND11
?CCL13:	PRINTI	"standing"
?CND11:	PRINTI	" in front of the platform."
?CND9:	ZERO?	BATH-FLAG /?CND14
	PRINTR	"A narrow path leads north between two wooden fences."
?CND14:	CRLF	
	RTRUE	
?CCL8:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	SCENE,S-YABU,S-PIT \?CCL20
	EQUAL?	PRSA,V?BOW \?CCL20
	EQUAL?	PRSO,FALSE-VALUE,OMI,YABU \?CCL20
	ZERO?	PRSO \?CND24
	SET	'PRSO,YABU
?CND24:	PRINTI	"You bow"
	FSET?	BLACKTHORNE,SITTING \?CND26
	PRINTI	", bending forward from your "
	CALL1	B-KNEELING?
	ZERO?	STACK /?CCL30
	PRINTI	"kneeling"
	JUMP	?CND28
?CCL30:	PRINTI	"sitting"
?CND28:	PRINTI	" position"
?CND26:	PRINTI	"."
	CALL2	QUEUED?,I-BOW?
	ZERO?	STACK /?CCL33
	ICALL2	DEQUEUE,I-BOW?
	EQUAL?	SCENE,S-YABU \?CCL36
	ICALL2	DEQUEUE,I-YABU-AUDIENCE
	PRINTI	"Yabu motions the guards forward, giving them curt orders.""You have insulted the Lord Yabu with your bad manners and incredible impertinence,"" explains Father Sebastio smugly.Yabu turns to confer with Omi."
	CRLF	
	FSET?	SEBASTIO-CRUCIFIX,SCOREBIT \?CCL39
	CRLF	
	PRINTI	"""You are to be put to death for being a pirate and a heretic,"" says Sebastio, but for some reason you think he is lying.Yabu looks pleased and Omi unhappy about the outcome.Why, you wonder?As the guards lead you away, you can't help believing you were close to convincing them to let you live."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL39:	CRLF	
	PRINTI	"After a while, Yabu and Omi finish their polite discussion.Yabu speaks to the guards again, and Father Sebastio explodes with indignation.""They are sparing you and your crew precisely because you are heretics who hate the true Church!Surely this land is in the power of Satan!""

Yabu smiles happily at you and your crewmen, then points to you and barks an additional order to Omi, who bows.You shudder, wondering what fate could be in store for you, and afraid you are about to find out."
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	
?CCL36:	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" returns your bow, and relaxes."
?CCL33:	EQUAL?	SCENE,S-YABU \?CCL41
	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" returns your bow.He seems at once astonished and amused by your behavior, but it's clear he has no love for the priest."
?CCL41:	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" seems pleased by this display of manners."
?CCL20:	EQUAL?	SCENE,S-YABU \?CCL43
	EQUAL?	PRSA,V?STAND \?CCL46
	FSET?	BLACKTHORNE,SITTING \?CCL46
	PRINTR	"You stand up.The Japanese seem surprised by your audacity."
?CCL46:	CALL1	ACT-CRAZY?
	ZERO?	STACK /?CCL50
	PRINTR	"Yabu stares at you in surprise.You must be insane!"
?CCL50:	EQUAL?	PRSA,V?TELL,V?SEND \FALSE
	EQUAL?	PRSO,YABU,SEBASTIO /FALSE
	ICALL1	SPEAK-ONLY-TO-YABU
	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL43:	EQUAL?	SCENE,S-PIT \FALSE
	EQUAL?	PRSA,V?THROUGH \?CCL62
	EQUAL?	PRSO,PIT \?CCL62
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?CCL62:	EQUAL?	PRSA,V?WALK \?CCL66
	EQUAL?	P-WALK-DIR,P?DOWN \?CCL66
	IN?	LADDER,HERE \?CCL66
	ICALL	PERFORM,V?CLIMB-DOWN,LADDER
	RTRUE	
?CCL66:	EQUAL?	PRSA,V?LIE-DOWN,V?BOARD,V?LOWER \FALSE
	ZERO?	ANSWER-HAI? /FALSE
	FSET?	CROOCQ,SCOREBIT \FALSE
	CALL1	B-LYING?
	ZERO?	STACK \FALSE
	ICALL1	B-LIE-DOWN
	PRINTI	"You do as you were ordered."
	CRLF	
	CALL2	SCORE-OBJECT,CROOCQ
	RSTACK	


	.FUNCT	YABU-TALK-TO-YABU:ANY:0:0
	EQUAL?	PRSA,V?BE \?CCL3
	EQUAL?	PRSO,BLACKTHORNE,ME \?CCL3
	EQUAL?	YABU-QUESTION,1 \?CCL3
	EQUAL?	PRSI,BLACKTHORNE,ME /?CCL9
	PRINTR	"""This is no time for foolishness, heretic!"" roars the priest."
?CCL9:	CALL	NOUN-USED?,PRSI,W?BLACKTHORNE
	ZERO?	STACK /?CCL11
	CALL	ADJ-USED?,PRSI,W?JOHN
	ZERO?	STACK /?CCL11
	CALL1	P-NEGATIVE?
	ZERO?	STACK \?CCL11
	SET	'QCONTEXT,FALSE-VALUE
	SET	'YABU-QUESTION,0
	PRINT	STR?406
	PRINTR	"He seems very deferential to Yabu, and very sweaty."
?CCL11:	PRINTI	"""No, no!What is your "
	CALL	NOUN-USED?,PRSI,W?BLACKTHORNE
	ZERO?	STACK \?CCL16
	CALL	ADJ-USED?,PRSI,W?JOHN
	ZERO?	STACK /?CND15
?CCL16:	PRINTI	"full "
?CND15:	PRINTR	"name, pirate?"" storms the priest, annoyed in spite of himself."
?CCL3:	EQUAL?	YABU-QUESTION,2 \?CCL20
	EQUAL?	PRSA,V?BE \?PRD25
	EQUAL?	PRSO,BLACKTHORNE,ME \?PRD25
	EQUAL?	PRSI,INTPP \?PRD25
	CALL	PP?,W?FROM,HOLLAND
	ZERO?	STACK \?PRD23
?PRD25:	EQUAL?	PRSA,V?COME-FROM \?CCL20
	EQUAL?	PRSO,HOLLAND \?CCL20
?PRD23:	CALL1	P-NEGATIVE?
	ZERO?	STACK \?CCL20
	SET	'QCONTEXT,FALSE-VALUE
	SET	'YABU-QUESTION,0
	PRINT	STR?406
	PRINTR	"Yabu is showing irritation and impatience.Perhaps the Jesuit's Japanese isn't fluent?"
?CCL20:	EQUAL?	YABU-QUESTION,3 \?CCL33
	EQUAL?	PRSA,V?BE \?CCL33
	EQUAL?	PRSO,BLACKTHORNE,ME \?CCL33
	EQUAL?	PRSI,BLACKTHORNE,RODRIGUES,LEADER \?CCL33
	CALL	NOUN-USED?,PRSI,W?PILOT
	ZERO?	STACK \?PRD39
	CALL	NOUN-USED?,PRSI,W?PILOT-MAJOR
	ZERO?	STACK /?CCL33
?PRD39:	CALL1	P-NEGATIVE?
	ZERO?	STACK \?CCL33
	SET	'QCONTEXT,YABU
	SET	'YABU-QUESTION,4
	PRINTR	"Father Sebastio doesn't translate what you said.Instead he asks, ""Why is an Englishman the pilot of a Dutch ship?Answer!""Yabu looks annoyed at the priest.Perhaps they aren't allies after all."
?CCL33:	EQUAL?	YABU-QUESTION,4 \?CCL43
	EQUAL?	PRSS,ME,BLACKTHORNE \?CCL43
	EQUAL?	PRSA,V?WALK,V?WALK-TO,V?WALK-AROUND /?PRD47
	EQUAL?	PRSA,V?COME-FROM,V?COME-TO-FROM \?CCL43
?PRD47:	EQUAL?	PRSO,FALSE-VALUE,ENGLAND,STRAIT-OF-MAGELLAN /?PRD50
	EQUAL?	PRSO,JAPAN,PACIFIC,GLOBAL-HERE /?PRD50
	EQUAL?	PRSO,LG-SEA,LG-ERASMUS,BLACK-SHIP /?PRD50
	EQUAL?	PRSO,NOT-HERE-OBJECT \?CCL43
?PRD50:	EQUAL?	PRSI,FALSE-VALUE,ENGLAND,STRAIT-OF-MAGELLAN /?PRD55
	EQUAL?	PRSI,PACIFIC,LG-SEA,LG-ERASMUS /?PRD55
	EQUAL?	PRSI,BLACK-SHIP \?CCL43
?PRD55:	CALL1	PAST-TENSE?
	ZERO?	STACK /?CCL43
	CALL1	P-NEGATIVE?
	ZERO?	STACK \?CCL43
	EQUAL?	PRSO,NOT-HERE-OBJECT \?CCL62
	PRINTI	"""Liar! You came around Africa and India!"""
	PRINT	STR?407
	CRLF	
	RTRUE	
?CCL62:	EQUAL?	PRSO,FALSE-VALUE,LG-SEA,LG-ERASMUS /?PRD66
	EQUAL?	PRSO,BLACK-SHIP \?CCL64
?PRD66:	EQUAL?	PRSI,FALSE-VALUE,LG-SEA,LG-ERASMUS /?CTR63
	EQUAL?	PRSI,BLACK-SHIP \?CCL64
?CTR63:	PRINTI	"""Of course you did!You didn't fly!"""
	PRINT	STR?407
	CRLF	
	RTRUE	
?CCL64:	SET	'YABU-QUESTION,0
	SET	'QCONTEXT,FALSE-VALUE
	PRINTI	"You describe your voyage.""We came through Magellan's Pass.This is the one hundred and thirty-sixth day from there.""

""You're lying!Magellan's Pass is secret.You came via Africa and India.You'll have to tell the truth eventually.They use torture here."""
	CRLF	
	CALL2	SCORE-OBJECT,STRAIT-OF-MAGELLAN
	RSTACK	
?CCL43:	EQUAL?	PRSA,V?BE \?CCL72
	EQUAL?	PRSO,BLACKTHORNE,ME \?CCL72
	CALL1	P-NEGATIVE?
	ZERO?	STACK /?CCL72
	EQUAL?	PRSI,CHURCH \?CCL78
	PRINTI	"""I've already told the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	" that you're a heretic!"""
?CCL78:	EQUAL?	PRSI,PORTUGUESE \?CCL80
	PRINTR	"""That's right, heretic, dig your own grave!Only we Portuguese and the damnable Spanish are allowed to trade here!"""
?CCL80:	EQUAL?	PRSI,PIRATE \?CCL82
	EQUAL?	YABU-QUESTION,4 \?CCL82
	SET	'QCONTEXT,FALSE-VALUE
	SET	'YABU-QUESTION,0
	PRINTR	"""You liar!You filthy heretics are all pirates!""The priest speaks haltingly to Yabu, who answers brusquely.He is apparently losing interest in the interrogation, and looks out into the harbor, toward the ship."
?CCL82:	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" translates what you have said.Yabu doesn't seem terribly interested, but only annoyed at the priest's poor Japanese."
?CCL72:	ZERO?	YABU-QUESTION /?CCL86
	EQUAL?	PRSA,V?SAY,V?REPLY \?CCL86
	EQUAL?	YABU-QUESTION,1,3 \?CCL91
	ICALL	PERFORM,V?BE,ME,PRSO
	RTRUE	
?CCL91:	ICALL2	PERFORM,V?COME-FROM
	RTRUE	
?CCL86:	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" haltingly translates what you have said.Yabu appears increasingly impatient."


	.FUNCT	SPEAK-ONLY-TO-YABU:ANY:0:0
	PRINTR	"Yabu says something sharply, and the priest warns, ""Speak only to the Lord Yabu!You are endangering your miserable life, heretic!"""


	.FUNCT	SEBASTIO-CRUCIFIX-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"It's wooden, beautifully carved"
	IN?	PRSO,SEBASTIO \?CCL6
	PRINTR	", and hangs on a long chain from the priest's belt."
?CCL6:	PRINTR	"."
?CCL3:	EQUAL?	PRSA,V?MUNG,V?THROW \?CCL8
	ZERO?	PRSI /?CCL11
	FSET?	PRSI,PERSON \?CCL11
	EQUAL?	PRSI,SEBASTIO \FALSE
?CCL11:	IN?	PRSO,PLAYER \?CCL16
	IN?	OMI,HERE \?CND17
	IN?	YABU,HERE \?CND17
	ICALL	QUEUE,I-BOW?,2
?CND17:	ICALL	QUEUE,I-SEBASTIO-PRAYS,1
	MOVE	SEBASTIO-CRUCIFIX,HERE
	EQUAL?	PRSA,V?MUNG \?CCL23
	PRINTI	"You break the crucifix in two, and hurl the pieces "
	JUMP	?CND21
?CCL23:	PRINTI	"You throw the crucifix "
?CND21:	EQUAL?	PRSI,SEBASTIO \?CCL26
	PRINTI	"at "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTC	46
	JUMP	?CND24
?CCL26:	PRINTI	"on the ground."
?CND24:	IN?	OMI,HERE \?CND27
	IN?	YABU,HERE \?CND27
	PRINTI	"The samurai watch.Omi, in particular, seems interested and excited."
?CND27:	CRLF	
	CALL2	SCORE-OBJECT,SEBASTIO-CRUCIFIX
	RSTACK	
?CCL16:	PRINTR	"You don't have it."
?CCL8:	EQUAL?	PRSA,V?PISS \?CCL32
	PRINTR	"You are so nervous that you can't."
?CCL32:	EQUAL?	PRSA,V?SPIT \?CCL34
	PRINTR	"Your mouth is so dry from tension and fear that you can't muster any spit."
?CCL34:	EQUAL?	PRSA,V?GIVE \?CCL36
	EQUAL?	PRSO,SEBASTIO-CRUCIFIX \?CCL36
	EQUAL?	PRSI,SEBASTIO \?CCL41
	MOVE	SEBASTIO-CRUCIFIX,SEBASTIO
	PRINTR	"He snatches it back, snarling."
?CCL41:	EQUAL?	PRSI,YABU,OMI \FALSE
	PRINTR	"He refuses, looking rather surprised."
?CCL36:	EQUAL?	PRSA,V?TAKE \FALSE
	FSET?	PRSO,SCOREBIT /?CCL48
	PRINTR	"You pick up the broken pieces of the crucifix.Sebastio watches you with contempt and hatred."
?CCL48:	IN?	PRSO,SEBASTIO \FALSE
	FSET?	SEBASTIO-CRUCIFIX,RMUNGBIT \?CCL52
	ICALL	QUEUE,I-BOW?,2
	FCLEAR	PRSO,DONT-ALL
	MOVE	PRSO,PLAYER
	FSET	PRSO,TOUCHBIT
	PRINTI	"You snatch the crucifix from "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTR	"'s hand.He stares at you, shocked and astonished.Yabu watches your incredible behavior with disgust, Omi with increasing interest.You can almost see his curiosity: what will the barbarian do next?"
?CCL52:	PRINTI	"You grab for the crucifix, but Sebastio snatches it away, holding it up as if to ward you off.""Demon!Heretic!"" he screams.""You'd love to defile this holy cross to prove to these pagans you're also a satan worshipper and an enemy of the church!You'll die first!"""
	CRLF	
	CALL1	JAPANESE-INTERESTED?
	RSTACK	


	.FUNCT	JAPANESE-INTERESTED?:ANY:0:0
	IN?	OMI,HERE \TRUE
	IN?	YABU,HERE \?CCL5
	CRLF	
	PRINTR	"Yabu appears a little less bored, and Omi somewhat interested by your behavior."
?CCL5:	CRLF	
	ICALL2	CTHE-PRINT,OMI
	PRINTR	" watches this exchange with interest.He seems very excited by your apparent hatred of the priest."


	.FUNCT	I-SEBASTIO-PRAYS:ANY:0:0
	CRLF	
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" kneels, staring fixedly at the pieces of the cross.He picks up the violated wood.He turns to you, and says quietly, ""I will pray for you, heretic."""


	.FUNCT	I-BOW?:ANY:0:0
	CRLF	
	PRINTI	"Yabu seems to have taken your treatment of the priest as a personal insult.Amazed by your lack of manners, he orders you put to death."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL


	.FUNCT	I-YABU-AUDIENCE:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	YABU-CNT,1 \?CCL5
	EQUAL?	YABU-QUESTION,1 \?CND3
	ICALL2	THIS-IS-IT,SEBASTIO
	GRTR?	DELAY-CNT,3 \?CCL10
	ICALL2	YABU-SAYS,STR?408
	RETURN	M-FATAL
?CCL10:	ICALL2	SETUP-ANSWER,STR?254
	CRLF	
	PRINTI	"""Answer the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	", heretic!Who are you?"""
?CCL5:	EQUAL?	YABU-CNT,2 \?CCL12
	EQUAL?	YABU-QUESTION,2 \?CND3
	ICALL2	THIS-IS-IT,SEBASTIO
	GRTR?	DELAY-CNT,3 \?CCL17
	ICALL2	YABU-SAYS,STR?409
	RETURN	M-FATAL
?CCL17:	ICALL2	SETUP-ANSWER,STR?383
	CRLF	
	PRINTI	"""Answer the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	", heretic!Where did your pirate ship sail from?"""
?CCL12:	EQUAL?	YABU-CNT,3 \?CCL19
	EQUAL?	YABU-QUESTION,3 \?CND3
	ICALL2	THIS-IS-IT,SEBASTIO
	GRTR?	DELAY-CNT,3 \?CCL24
	CRLF	
	ICALL2	YABU-SAYS,STR?410
	RETURN	M-FATAL
?CCL24:	ICALL2	SETUP-ANSWER,STR?254
	CRLF	
	PRINTI	"""Answer the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	", heretic!What are you?You're obviously an officer!"""
?CCL19:	EQUAL?	YABU-CNT,4 \?CND3
	EQUAL?	YABU-QUESTION,4 \?CND3
	ICALL2	THIS-IS-IT,SEBASTIO
	GRTR?	DELAY-CNT,2 \?CCL30
	SET	'YABU-QUESTION,0
	CRLF	
	PRINT	STR?411
	PRINTI	"it is unimportant.We will find out these facts in due time."""
	CRLF	
	RETURN	M-FATAL
?CCL30:	ICALL2	SETUP-ANSWER,STR?412
	CRLF	
	PRINTI	"""Answer the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	"!How did you get here?"""
?CND3:	SET	'DELAY-CNT,0
	INC	'YABU-CNT
	EQUAL?	YABU-CNT,1 \?CCL33
	ICALL2	SETUP-ANSWER,STR?254
	ICALL2	THIS-IS-IT,SEBASTIO
	SET	'QCONTEXT,YABU
	SET	'YABU-QUESTION,1
	CRLF	
	PRINTI	"Father Sebastio comes forward.""I will translate for you,"" he says.""The "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	", Kasigi Yabu, Lord of Izu, wants to know who you are, where you come from, how you got here, and what acts of piracy you have committed."""
?CCL33:	EQUAL?	YABU-CNT,2 \?CCL35
	ICALL2	SETUP-ANSWER,STR?383
	ICALL2	THIS-IS-IT,SEBASTIO
	SET	'QCONTEXT,YABU
	SET	'YABU-QUESTION,2
	CRLF	
	PRINTR	"Father Sebastio asks, ""Where did you sail from?"""
?CCL35:	EQUAL?	YABU-CNT,3 \?CCL37
	SET	'YABU-QUESTION,3
	ICALL2	THIS-IS-IT,SEBASTIO
	SET	'QCONTEXT,YABU
	ICALL2	SETUP-ANSWER,STR?254
	CRLF	
	PRINTR	"The Jesuit asks, ""What are you?You're not the Captain!"""
?CCL37:	EQUAL?	YABU-CNT,4 \?CCL39
	SET	'YABU-QUESTION,4
	ICALL2	THIS-IS-IT,SEBASTIO
	SET	'QCONTEXT,YABU
	ICALL2	SETUP-ANSWER,STR?412
	CRLF	
	PRINTR	"Father Sebastio asks, trying to control his anger, ""How did you get here?"""
?CCL39:	EQUAL?	YABU-CNT,5 \?CCL41
	SET	'YABU-QUESTION,0
	ICALL2	THIS-IS-IT,SEBASTIO
	SET	'QCONTEXT,FALSE-VALUE
	ICALL2	SETUP-ANSWER,FALSE-VALUE
	FSET	SEBASTIO-CRUCIFIX,RMUNGBIT
	ICALL2	THIS-IS-IT,SEBASTIO-CRUCIFIX
	CRLF	
	PRINTI	"Now, "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTR	" is barely listening to you.""You're a lying heretic pirate!"" screams the priest, spittle flying from his mouth as he whirls toward you, shaking his fist.His crucifix on its long chain waves mockingly near your face."
?CCL41:	EQUAL?	YABU-CNT,6 \?CCL43
	ICALL2	THIS-IS-IT,YABU
	CRLF	
	PRINTC	34
	ICALL2	PRINTUNDER,STR?413
	PRINTI	""" the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	" snaps impatiently."
?CCL43:	EQUAL?	YABU-CNT,8 \?CCL45
	ICALL2	THIS-IS-IT,YABU
	CRLF	
	PRINTR	"Yabu is becoming bored and impatient.He turns his back to the priest, obvious detestation all over his face."
?CCL45:	EQUAL?	YABU-CNT,11 \FALSE
	CRLF	
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTI	" translates Yabu's sentence. ""This ship, alien, non-Portuguese, and pirate, is confiscated with all it contains.All pirates are sentenced to immediate crucifixion."""
	CRLF	
	ICALL2	DEQUEUE,I-YABU-AUDIENCE
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	YABU-SAYS:ANY:1:1,STR
	CRLF	
	PRINT	STR?411
	PRINTI	"you are a "
	PRINT	STR
	PRINTI	", and you are condemned to death."""
	CALL1	JIGS-UP
	RSTACK	

	.ENDSEG

	.SEGMENT "PIT"


	.FUNCT	PIT-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL2	DRESS-BLACKTHORNE,TRUE-VALUE
	PUTP	VILLAGE-SQUARE,P?FDESC,FALSE-VALUE
	ICALL	NEW-SDESC,ONNA,STR?256
	ICALL	NEW-SDESC,SEBASTIO,STR?248
	REMOVE	SEBASTIO-CRUCIFIX
	ICALL	NEW-SDESC,OMI,STR?253
	MOVE	CAULDRON,VILLAGE-SQUARE
	ICALL2	MOVE-CREW,PIT
	REMOVE	CREWMEN
	MOVE	ROPER,HERE
	MOVE	SONK,HERE
	CALL	QUEUE,I-PIT,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"You are crammed into a deep cellar, one of the many that the fishermen use to store sun-dried fish.The cellar is five paces long and five wide and four deep, with an earthen floor and walls."
	IN?	OFFAL,HERE \?CND6
	PRINTI	"The floor is awash with rotting fish offal and seawater."
?CND6:	CALL1	TELL-CEILING
	RSTACK	
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?DISEMBARK \?CCL12
	EQUAL?	PRSO,ROOMS \?CCL12
	CALL2	DO-WALK,P?UP
	RSTACK	
?CCL12:	EQUAL?	PRSA,V?BOARD \?CCL16
	EQUAL?	PRSO,GLOBAL-HERE \?CCL16
	PRINT	STR?181
	CRLF	
	RTRUE	
?CCL16:	EQUAL?	PRSA,V?PICK \?CCL20
	FSET?	PRSO,PERSON \?CCL20
	ZERO?	MUST-CHOOSE? /?CCL20
	PRINTR	"""The only fair thing is to draw straws!"" says Vinck."
?CCL20:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL25
	EQUAL?	PRSO,OMI,MURA,SEBASTIO \?CCL25
	PRINT	STR?178
	PRINTR	"him."
?CCL25:	EQUAL?	PRSA,V?PISS \?CCL29
	ZERO?	PRSO /?CCL29
	FSET?	PRSO,PERSON \?CCL29
	PRINTI	"The crewmen are appalled at your behavior."
	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" squirms away, trying to clean himself off."
?CCL29:	EQUAL?	PRSA,V?SIT \?CCL34
	EQUAL?	PRSO,ROOMS,GROUND \?CCL34
	FSET?	BLACKTHORNE,SITTING /?CCL34
	IN?	OFFAL,HERE \?CCL34
	ICALL1	B-SIT
	PRINTR	"You find a relatively dry spot and sit down.The others complain but they finally rearrange themselves and quiet down."
?CCL34:	EQUAL?	PRSA,V?LIE-DOWN \?CCL40
	IN?	OFFAL,HERE \?CCL40
	PRINTR	"You want to lie down in old fish heads?You must be a barbarian!"
?CCL40:	EQUAL?	PRSA,V?YELL,V?YELL-AT \?CCL44
	FSET?	TRAPDOOR,OPENBIT /?CCL47
	PRINTR	"You begin yelling, and everyone else joins in.""Water!And food, by God!Let us out of here!"""
?CCL47:	PRINTR	"The Japanese look at you with contempt."
?CCL44:	EQUAL?	PRSA,V?LOOK-UP \?CCL49
	CALL1	TELL-CEILING
	RSTACK	
?CCL49:	EQUAL?	PRSA,V?WALK \?CCL51
	EQUAL?	P-WALK-DIR,P?UP,P?OUT \?CCL51
	IN?	LADDER,HERE \?CCL56
	ICALL	PERFORM,V?CLIMB-FOO,LADDER
	RTRUE	
?CCL56:	PRINTR	"You can't climb out without a ladder.The pit is too deep."
?CCL51:	EQUAL?	PRSA,V?PARRY,V?STOP \?CCL58
	EQUAL?	PRSO,FALSE-VALUE \?CCL58
	IN?	OMI-SAMURAI,LADDER /?CCL63
	IN?	OMI-SAMURAI,PIT \FALSE
?CCL63:	ICALL	PERFORM,V?ATTACK,OMI-SAMURAI
	RTRUE	
?CCL58:	EQUAL?	PRSA,V?HELP,V?TAKE,V?STOP /?PRD71
	EQUAL?	PRSA,V?PUSH-DOWN,V?SIT \?PRD69
?PRD71:	EQUAL?	PRSO,VINCK,PIETERZOON /?CTR66
?PRD69:	EQUAL?	PRSA,V?HELP,V?STOP \?CCL67
	EQUAL?	PRSO,ME \?CCL67
?CTR66:	EQUAL?	PRSO,VINCK,ME \?CCL78
	ICALL	PERFORM,V?STOP,LADDER
	RTRUE	
?CCL78:	EQUAL?	PRSO,PIETERZOON \FALSE
	IN?	PIETERZOON,CAULDRON \FALSE
	PRINTC	34
	ZERO?	VINCK-PICKED? /?CCL85
	PRINTI	"Vinck"
	JUMP	?CND83
?CCL85:	PRINTI	"The Pilot"
?CND83:	PRINTR	" should have gone.He was the lamb of God.And now his soul's forfeit, he'll burn for all eternity."""
?CCL67:	EQUAL?	PRSA,V?LISTEN \FALSE
	EQUAL?	PRSO,FALSE-VALUE,PIETERZOON,VINCK \FALSE
	IN?	PIETERZOON,CAULDRON /?CCL87
	IN?	VINCK,CAULDRON \FALSE
?CCL87:	PRINTR	"There is no longer any sound.The silence, you fear, is that of death."


	.FUNCT	TELL-CEILING:ANY:0:0
	PRINTI	"The ceiling is made of planks with a foot of earth above and a single "
	FSET?	TRAPDOOR,OPENBIT \?CCL3
	PRINTI	"open "
	JUMP	?CND1
?CCL3:	PRINTI	"closed "
?CND1:	ICALL2	DPRINT,TRAPDOOR
	PRINTR	" set into it."


	.FUNCT	SEAWATER-F:ANY:0:0
	EQUAL?	PRSA,V?DRINK \FALSE
	PRINTR	"You'll go mad from drinking seawater!"


	.FUNCT	OFFAL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's rotting fish heads and entrails."
?CCL3:	EQUAL?	PRSA,V?SMELL \?CCL5
	PRINTR	"It smells offal."
?CCL5:	EQUAL?	PRSA,V?EAT \FALSE
	PRINTR	"You'd be crazy to eat that!"


	.FUNCT	I-PIT:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	PIT-CNT,4 \?CND3
	IN?	SHORT-STRAW,BLACKTHORNE /?CND3
	IN?	LONG-STRAW,BLACKTHORNE /?CND3
	GRTR?	DELAY-CNT,5 \?CCL11
	CRLF	
	PRINTI	"One of the men hits you over the head, you fight back, and in no time it's a melee.You are knocked unconscious, and drown, unnoticed as the rest of the crew squabbles."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL11:	CRLF	
	PRINTI	"""Pick, curse you!"" yells Maetsukker.""Yes, pick!"" the other crewmen take up the cry."
	CRLF	
	EQUAL?	DELAY-CNT,5 \TRUE
	CRLF	
	PRINTR	"You realize you'd better pick now, or you'll be forced to."
?CND3:	SET	'DELAY-CNT,0
	INC	'PIT-CNT
	EQUAL?	PIT-CNT,1 \?CCL16
	CRLF	
	PRINTI	"Captain-General Spillbergen, half-awake and querulous, says ""Pass the water."""
	CRLF	
	CRLF	
	PRINTI	"""There isn't any, Paulus"" Van Nekk answers gloomily, ""We haven't even got a pot to piss in!"""
	CRLF	
	CRLF	
	PRINTI	"Spillbergen points at Vinck.""Ask for water!"" he orders."
	CRLF	
	CRLF	
	PRINTI	"Vinck stands under the opening and shouts, ""Hey!You up there!Give us God-cursed water!We want food and water!"""
	CRLF	
	CRLF	
	PRINTR	"There is no answer."
?CCL16:	EQUAL?	PIT-CNT,2 \?CCL18
	FSET	TRAPDOOR,OPENBIT
	MOVE	OMI,TRAPDOOR
	MOVE	SEBASTIO,TRAPDOOR
	MOVE	MURA,TRAPDOOR
	ICALL2	MARGINAL-PIC,P-PIT
	CRLF	
	PRINTI	"The trapdoor opens.Omi looks down at you.Beside him are Mura and the priest."
	EQUAL?	PRSA,V?YELL,V?YELL-AT \?CCL21
	PRINTI	"Everyone but you begins yelling.""Water!And food, by God!Let us out of here!"""
	JUMP	?CND19
?CCL21:	PRINTI	"Everyone is still yelling."
?CND19:	MOVE	OFFAL,PIT
	MOVE	SEAWATER,PIT
	PRINTI	"Omi motions to Mura, who nods and leaves."
	CRLF	
	CRLF	
	PRINTR	"Mura returns with another fisherman, carrying a large barrel.They empty the contents, rotting fish offal and seawater, onto your heads."
?CCL18:	EQUAL?	PIT-CNT,3 \?CCL23
	SET	'MUST-CHOOSE?,TRUE-VALUE
	FCLEAR	TRAPDOOR,OPENBIT
	MOVE	SEBASTIO,VILLAGE-SQUARE
	MOVE	MURA,VILLAGE-SQUARE
	MOVE	OMI,VILLAGE-SQUARE
	CRLF	
	PRINTI	"Omi begins talking.When he finishes, the priest nervously translates.""These are Kasigi Omi's orders: You will begin to act like decent human beings.You will make no more noise.When you have learned to behave, you will be allowed up into the world of men.Lord Yabu has spared all your lives, providing you serve him loyally.All except one.One of you is to die.At dusk.You are to choose who it will be."""
	CRLF	
	CRLF	
	PRINTR	"The trapdoor slams into place."
?CCL23:	EQUAL?	PIT-CNT,4 \?CCL25
	MOVE	VINCKS-STRAW,HERE
	SET	'VINCK-PICKED?,FALSE-VALUE
	RANDOM	100
	LESS?	50,STACK /?CND26
	SET	'VINCK-PICKED?,TRUE-VALUE
?CND26:	MOVE	STRAW,SPILLBERGEN
	CRLF	
	PRINTI	"It's now very near dusk."
	CRLF	
	CRLF	
	PRINTR	"Spillbergen collects a bundle of rice straw stalks from the litter in the pit.Slowly, reluctantly, the crewmen draw straws.Sonk first, then Pieterzoon, then Jan Roper, Salomon, and Croocq.Then Ginsel is safe.Five left.Maetsukker, weeping openly, pushes Vinck aside and takes a straw.He can't believe it's not the one.Van Nekk picks and the straw is not short!

Vinck watches his fingers select a straw and it falls to the ground but everyone sees it's the shortest straw yet.

Now it's your turn.Spillbergen holds out his trembling hand toward you.There are only two straws left; one for you and one for the Captain."
?CCL25:	EQUAL?	PIT-CNT,5 \FALSE
	CRLF	
	PRINTI	"Spillbergen, last to pick, unclenches his hand and you see that his straw is long.Everyone stares at "
	SET	'PIT-CNT,0
	SET	'MUST-CHOOSE?,FALSE-VALUE
	ICALL2	DEQUEUE,I-PIT
	ZERO?	VINCK-PICKED? /?CCL32
	ICALL	QUEUE,I-TAKE-VINCK,-1
	PRINTR	"Vinck.""I'm dead!"" he laughs, unnerving you all."
?CCL32:	ICALL	QUEUE,I-TAKE-YOU,-1
	PRINTR	"you.The men ease away from you."


	.FUNCT	TRAPDOOR-OPENS:ANY:0:0
	CRLF	
	PRINTI	"The trapdoor opens.Omi stands etched against the sky, his kimono blooded by the dying sun.The ladder is lowered, and Omi motions for the one man to come up."""
	ICALL2	PRINTUNDER,STR?415
	PRINTI	"!"" he barks.Hurry up."
	RTRUE	


	.FUNCT	I-TAKE-VINCK:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	PIT-CNT,3 \?CCL5
	FSET?	LADDER,RMUNGBIT \?CCL8
	LESS?	DELAY-CNT,2 \?CCL8
	FCLEAR	LADDER,RMUNGBIT
	RFALSE	
?CCL8:	IN?	LOSING-SAMURAI,PIT \?CND3
	FSET?	LOSING-SAMURAI,SCOREBIT \?CND3
	LESS?	DELAY-CNT,5 \?CND3
	RFALSE	
?CCL5:	EQUAL?	PIT-CNT,4 \?CND3
	FSET?	LADDER,RMUNGBIT \?CCL18
	FCLEAR	LADDER,RMUNGBIT
	RFALSE	
?CCL18:	IN?	LOSING-SAMURAI,PIT \?CND3
	FSET?	LOSING-SAMURAI,SCOREBIT \?CND3
	LESS?	DELAY-CNT,5 /FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'PIT-CNT
	EQUAL?	PIT-CNT,1 \?CCL25
	FSET	TRAPDOOR,OPENBIT
	MOVE	OMI,TRAPDOOR
	MOVE	LADDER,HERE
	ICALL1	TRAPDOOR-OPENS
	PRINTR	"Vinck tries to stand, but his legs fail him.Pieterzoon bends down to help him to his feet."
?CCL25:	EQUAL?	PIT-CNT,2 \?CCL27
	FSET?	VINCK,RMUNGBIT /?CCL30
	CALL2	THEY-TAKE-VICTIM,VINCK
	RSTACK	
?CCL30:	FSET?	LADDER,SCOREBIT \?CCL32
	CRLF	
	PRINTR	"""Get away from the ladder, Pilot!You're ordered away!""Spillbergen shakily keeps to his corner, as far from the ladder as possible."
?CCL32:	CRLF	
	PRINTR	"Vinck comes out of his cataleptic state and throws himself at one of the samurai, berserk.He intercepts a blow that would have sliced your wrist off."
?CCL27:	EQUAL?	PIT-CNT,3 \?CCL34
	FSET?	LADDER,SCOREBIT \?CCL37
	CRLF	
	PRINTR	"Vinck begins to climb the ladder, almost in a trance."
?CCL37:	FSET?	OMI-SAMURAI,RMUNGBIT \?CCL39
	FCLEAR	OMI-SAMURAI,RMUNGBIT
	RFALSE	
?CCL39:	CALL1	OMI-BARKS
	RSTACK	
?CCL34:	EQUAL?	PIT-CNT,4 \?CCL41
	FSET?	LADDER,SCOREBIT \?CCL44
	FCLEAR	LADDER,SCOREBIT
	CRLF	
	PRINT	STR?416
	CRLF	
	RTRUE	
?CCL44:	CALL2	THEY-TAKE-VICTIM,PIETERZOON
	RSTACK	
?CCL41:	EQUAL?	PIT-CNT,5 \FALSE
	FSET?	LADDER,SCOREBIT /FALSE
	CALL2	THEY-TAKE-VICTIM,PIETERZOON
	RSTACK	


	.FUNCT	OMI-BARKS:ANY:0:0
	CRLF	
	PRINTI	"Omi barks an order, and several "
	IN?	OMI-SAMURAI,LADDER \?CCL3
	PRINTI	"more "
	JUMP	?CND1
?CCL3:	FSET	OMI-SAMURAI,RMUNGBIT
	MOVE	OMI-SAMURAI,LADDER
?CND1:	ICALL2	THIS-IS-IT,OMI-SAMURAI
	PRINTI	"samurai start to descend the ladder."
	CRLF	
	ICALL2	SCORE-OBJECT,LADDER
	RTRUE	


	.FUNCT	I-TAKE-YOU:ANY:0:0
	IN?	BLACKTHORNE,VILLAGE-SQUARE \?PRG3
	ICALL2	DEQUEUE,I-TAKE-YOU
	CRLF	
	ICALL2	JIGS-UP,STR?417
	RETURN	M-FATAL
?PRG3:	INC	'DELAY-CNT
	EQUAL?	PIT-CNT,3 \?CND5
	IN?	LOSING-SAMURAI,PIT \?CCL9
	FSET?	LOSING-SAMURAI,SCOREBIT /FALSE
?CCL9:	FSET?	LADDER,SCOREBIT \?CND5
	GRTR?	DELAY-CNT,4 \FALSE
	FCLEAR	LADDER,SCOREBIT
	RFALSE	
?CND5:	SET	'DELAY-CNT,0
	INC	'PIT-CNT
	EQUAL?	PIT-CNT,1 \?CCL17
	FSET	TRAPDOOR,OPENBIT
	MOVE	OMI,TRAPDOOR
	MOVE	LADDER,HERE
	ICALL1	TRAPDOOR-OPENS
	PRINTR	"Roper says, ""Don't be afraid, Pilot.You're the anointed of God.You're in God's hands."""
?CCL17:	EQUAL?	PIT-CNT,2 \?CCL19
	FSET?	OMI-SAMURAI,RMUNGBIT \?CCL22
	FCLEAR	OMI-SAMURAI,RMUNGBIT
	RFALSE	
?CCL22:	ICALL1	OMI-BARKS
	RTRUE	
?CCL19:	EQUAL?	PIT-CNT,3 \?CCL24
	CRLF	
	PRINT	STR?416
	CRLF	
	RTRUE	
?CCL24:	EQUAL?	PIT-CNT,4 \?CCL26
	FSET?	LADDER,SCOREBIT /FALSE
	CALL2	THEY-TAKE-VICTIM,PIETERZOON
	RSTACK	
?CCL26:	EQUAL?	PIT-CNT,5 \FALSE
	ICALL2	DEQUEUE,I-TAKE-YOU
	RFALSE	


	.FUNCT	GENERIC-STRAW-F:ANY:2:2,R,F
	LOC	LONG-STRAW
	ZERO?	STACK /?CCL3
	LOC	SHORT-STRAW
	ZERO?	STACK \FALSE
?CCL3:	RETURN	STRAW


	.FUNCT	STRAW-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"There are two straws in Spillbergen's hand.You stare at them intently, but you can discern no difference between them."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?PICK,V?DRAW \FALSE
	REMOVE	STRAW
	ZERO?	VINCK-PICKED? /?CCL8
	LOC	VINCKS-STRAW
	MOVE	SHORT-STRAW,STACK
	REMOVE	VINCKS-STRAW
	PUTP	SHORT-STRAW,P?OWNER,VINCK
	MOVE	LONG-STRAW,BLACKTHORNE
	PRINTR	"You pick a straw, drawing your life out of Spillbergen's hand.It's long!"
?CCL8:	LOC	VINCKS-STRAW
	MOVE	LONG-STRAW,STACK
	REMOVE	VINCKS-STRAW
	PUTP	LONG-STRAW,P?OWNER,VINCK
	MOVE	SHORT-STRAW,BLACKTHORNE
	PRINTR	"You take a straw, and as you see it emerge, you realize that it's short, very short!Shorter than Vinck's.Vinck laughs a short, barking laugh, then is quiet."


	.FUNCT	VINCKS-STRAW-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's the shortest drawn yet."
?CCL3:	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTR	"""No, Pilot, draw your own straw!"""


	.FUNCT	SHORT-STRAW-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's very short."
?CCL3:	EQUAL?	PRSA,V?TRADE,V?GIVE \?CCL5
	PRINTR	"No one wants the short straw."
?CCL5:	EQUAL?	PRSA,V?ASK-FOR \FALSE
	EQUAL?	PRSO,VINCK \FALSE
	EQUAL?	PRSI,SHORT-STRAW \FALSE
	ICALL	PERFORM,V?TRADE,LONG-STRAW,VINCK
	RTRUE	


	.FUNCT	LONG-STRAW-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's blessedly long."
?CCL3:	EQUAL?	PRSA,V?ASK-FOR \?CCL5
	ICALL	PERFORM,V?TRADE,SHORT-STRAW
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?TRADE,V?GIVE \FALSE
	EQUAL?	PRSO,LONG-STRAW \FALSE
	EQUAL?	PRSI,FALSE-VALUE,VINCK,SHORT-STRAW \FALSE
	CALL2	HELD?,LONG-STRAW
	ZERO?	STACK /FALSE
	REMOVE	LONG-STRAW
	ICALL2	DEQUEUE,I-TAKE-VINCK
	ICALL	QUEUE,I-TAKE-YOU,-1
	PRINTI	"""Bless you, Pilot!"" babbles Vinck"
	IN?	SHORT-STRAW,VINCK \?CCL14
	MOVE	SHORT-STRAW,PLAYER
	PRINTR	", thrusting the death straw into your hands."
?CCL14:	PRINTR	"."


	.FUNCT	THEY-TAKE-VICTIM:ANY:1:1,WHO
	MOVE	OMI,VILLAGE-SQUARE
	MOVE	OMI-SAMURAI,VILLAGE-SQUARE
	ICALL	NEW-SDESC,OMI-SAMURAI,STR?418,TRUE-VALUE
	FSET	OMI-SAMURAI,NOABIT
	MOVE	BLACKTHORNE,HERE
	REMOVE	LADDER
	MOVE	WHO,CAULDRON
	FCLEAR	TRAPDOOR,OPENBIT
	FCLEAR	LADDER,SCOREBIT
	EQUAL?	WHO,VINCK \?CCL3
	CRLF	
	PRINTI	"Vinck, in an almost cataleptic state, climbs onto the ladder, pulling himself painfully upward.Van Nekk and Jan Roper are praying silently, their eyes closed.Pieterzoon cannot watch.You stare ashamedly at Vinck, hating yourself for letting him go."
	CRLF	
	CRLF	
	PRINTI	"As he reaches the top of the ladder, three samurai grab him.The ladder is quickly pulled up and the trapdoor slams shut like the sound of doom."
	CRLF	
	ICALL1	FAILED-SCENE
	RTRUE	
?CCL3:	EQUAL?	WHO,PIETERZOON \?CND1
	MOVE	VINCK,HERE
	CRLF	
	PRINTI	"Three more samurai, carrying knives and wearing only loincloths, leap nimbly into the cellar.The first two crash into you, carrying you helpless to the floor."
	IN?	DAGGER,BLACKTHORNE \?CND5
	MOVE	DAGGER,HERE
	PRINTI	"The dagger falls from your grip."
?CND5:	PRINTI	"They attack viciously, and the crewmen retreat."
	IN?	DAGGER,HERE \?CND7
	REMOVE	DAGGER
	PRINTI	"One samurai retrieves the dagger."
?CND7:	PRINTI	"

Omi comes arrogantly into the pit and grabs the nearest man, who is Pieterzoon.He jerks him toward the ladder.""Christ help me, it's not me that's to go -- ""Pieterzoon is being driven up the ladder."
	CRLF	
	CRLF	
	PRINTI	"Omi follows without hurrying.The samurai retreat"
	IN?	LOSING-SAMURAI,HERE \?CCL11
	FSET?	LOSING-SAMURAI,SCOREBIT \?CCL14
	REMOVE	LOSING-SAMURAI
	PRINTI	", including the one you knocked off of the ladder, though he appears wary and even embarrassed."
	JUMP	?CND9
?CCL14:	PRINTI	" stepping contemptuously over the prostrate body of their unconscious comrade."
	JUMP	?CND9
?CCL11:	PRINTC	46
?CND9:	PRINTI	"The ladder is jerked aloft.Air and sky and light vanish.Bolts crash into place."
	CRLF	
?CND1:	ICALL2	DEQUEUE,I-TAKE-VINCK
	ICALL2	DEQUEUE,I-TAKE-YOU
	SET	'PIT-CNT,0
	ICALL	QUEUE,I-TAKE-CROOCQ,-1
	RTRUE	


	.FUNCT	TRAPDOOR-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	FSET?	OBJ,OPENBIT /TRUE
	RETURN	M-FATAL
?CCL3:	PRINTI	"Through the open trapdoor you can see Omi"
	IN?	MURA,TRAPDOOR \?CND7
	PRINTI	", Father Sebastio and Mura"
?CND7:	PRINTI	" silhouetted against the sky."
	RTRUE	


	.FUNCT	TRAPDOOR-F:ANY:0:1,RARG
	ZERO?	RARG \FALSE
	EQUAL?	PRSA,V?OPEN,V?CLOSE \?CCL5
	IN?	WINNER,LADDER \?CCL8
	PRINTR	"The weapons of the samurai prevent you from climbing high enough."
?CCL8:	PRINT	STR?178
	PRINTR	"it."
?CCL5:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL10
	FSET?	TRAPDOOR,OPENBIT /?CCL13
	PRINTR	"It's closed."
?CCL13:	IN?	OMI,TRAPDOOR \FALSE
	ICALL	TRAPDOOR-DESC,M-OBJDESC,TRAPDOOR
	CRLF	
	RTRUE	
?CCL10:	EQUAL?	PRSA,V?KNOCK \FALSE
	PRINT	STR?178
	PRINTR	"it."


	.FUNCT	LADDER-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"A ladder leads "
	EQUAL?	HERE,PIT \?CCL6
	PRINTI	"up through the open trap door."
	RTRUE	
?CCL6:	PRINTI	"down into the pit."
	RTRUE	


	.FUNCT	LADDER-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL6
	IN?	OMI-SAMURAI,LADDER \?CCL9
	PRINTR	"There are samurai on the ladder."
?CCL9:	PRINTR	"It's a rickety wooden ladder."
?CCL6:	EQUAL?	PRSA,V?STOP,V?KINJIRU \?CCL11
	IN?	OMI-SAMURAI,LADDER \?CCL14
	PRINTR	"Swords swinging, the samurai continue down the ladder."
?CCL14:	IN?	OMI-SAMURAI,PIT \?CCL16
	PRINTR	"There's nothing to block or stop."
?CCL16:	IN?	LADDER,HERE /?CCL18
	FSET?	LADDER,SCOREBIT \?CCL21
	PRINTI	"You hold "
	ZERO?	VINCK-PICKED? /?CND22
	PRINTI	"him "
?CND22:	PRINTR	"back.The others grumble, but Roper says ""Aye, no need to go until they come for you."""
?CCL21:	ZERO?	VINCK-PICKED? /?CCL25
	PRINTR	"You grab Vinck, but he pulls away."
?CCL25:	PRINTR	"You hold back."
?CCL18:	ZERO?	VINCK-PICKED? /?CCL27
	FSET?	VINCK,RMUNGBIT /?CCL27
	FSET	VINCK,RMUNGBIT
	PRINTI	"You move between Vinck and the ladder."""
	ICALL2	PRINTUNDER,STR?419
	PRINT	STR?420
	PRINTR	"  He steps to the foot of the ladder."
?CCL27:	FSET?	LADDER,SCOREBIT \FALSE
	PRINTI	"You stand implacably "
	ZERO?	VINCK-PICKED? /?CCL34
	PRINTI	"in the way."
	JUMP	?CND32
?CCL34:	PRINTI	"at the foot of the ladder.The watchers can see no one is coming up."
?CND32:	CALL1	SAMURAI-ON-LADDER
	RSTACK	
?CCL11:	EQUAL?	PRSA,V?TAKE,V?SHAKE,V?MOVE /?CTR35
	EQUAL?	PRSA,V?LOWER,V?KICK /?CTR35
	EQUAL?	PRSA,V?PUSH-DOWN \?CCL36
	EQUAL?	PRSO,FALSE-VALUE \?CCL36
	EQUAL?	PRSI,LADDER \?CCL36
?CTR35:	EQUAL?	HERE,VILLAGE-SQUARE \?CCL45
	PRINT	STR?421
	CRLF	
	RTRUE	
?CCL45:	PRINTI	"You shake the ladder."
	FSET	LADDER,RMUNGBIT
	CALL2	QUEUED?,I-TAKE-CROOCQ
	ZERO?	STACK /?CCL48
	PRINTR	"There is no reaction from those above.They wait patiently."
?CCL48:	IN?	OMI-SAMURAI,LADDER \?CCL50
	PRINTI	"The samurai hold tightly onto the ladder, but one swings a sword at you!"
	CRLF	
	CALL2	SCORE-OBJECT,LADDER
	RSTACK	
?CCL50:	PRINTI	"A gasp goes through the cellar."
	ICALL1	SAMURAI-ON-LADDER
	RTRUE	
?CCL36:	EQUAL?	PRSA,V?CLIMB-FOO,V?CLIMB-ON,V?CLIMB-UP /?CCL52
	EQUAL?	PRSA,V?CLIMB-DOWN,V?BOARD \FALSE
?CCL52:	EQUAL?	HERE,VILLAGE-SQUARE \?CCL57
	PRINT	STR?421
	CRLF	
	RTRUE	
?CCL57:	CALL2	QUEUED?,I-TAKE-CROOCQ
	ZERO?	STACK \?CTR58
	CALL2	QUEUED?,I-TAKE-YOU
	ZERO?	STACK /?CCL59
?CTR58:	MOVE	LADDER,VILLAGE-SQUARE
	MOVE	OMI-SAMURAI,VILLAGE-SQUARE
	ICALL	NEW-SDESC,OMI-SAMURAI,STR?418,TRUE-VALUE
	FSET	OMI-SAMURAI,NOABIT
	MOVE	SEBASTIO,VILLAGE-SQUARE
	MOVE	OMI,VILLAGE-SQUARE
	PRINTI	"You climb up the ladder into the sunlight, blinking in the brightness."
	CALL2	HELD?,DAGGER
	ZERO?	STACK /?CND62
	REMOVE	DAGGER
	PRINTI	"As you reach the top of the ladder, strong hands grab you and force you to drop the dagger."
?CND62:	CRLF	
	CRLF	
	CALL2	GOTO,VILLAGE-SQUARE
	RSTACK	
?CCL59:	MOVE	PLAYER,LADDER
	IN?	OMI,TRAPDOOR \?CCL66
	FSET	OMI-SAMURAI,RMUNGBIT
	MOVE	OMI-SAMURAI,LADDER
	ICALL2	THIS-IS-IT,OMI-SAMURAI
	PRINTI	"You begin to climb onto the ladder, but Omi orders two samurai forward, and they climb down, swords unsheathed."
	CRLF	
	CALL2	SCORE-OBJECT,LADDER
	RSTACK	
?CCL66:	IN?	OMI-SAMURAI,LADDER \?CCL68
	PRINTR	"Swords swinging, the samurai block your progress and then continue down the ladder."
?CCL68:	ZERO?	VINCK-PICKED? /?CCL70
	FSET?	VINCK,RMUNGBIT /?CCL70
	FSET	VINCK,RMUNGBIT
	PRINTI	"You block Vinck from the ladder."""
	ICALL2	PRINTUNDER,STR?419
	PRINT	STR?420
	PRINTR	"  He continues toward the ladder."
?CCL70:	FSET?	LADDER,SCOREBIT \FALSE
	PRINTI	"You climb onto the lower rungs of the ladder, "
	ZERO?	VINCK-PICKED? /?CCL77
	PRINTI	"blocking it."
	JUMP	?CND75
?CCL77:	PRINTI	"then stop.The watchers can see you are coming no higher."
?CND75:	CALL1	SAMURAI-ON-LADDER
	RSTACK	


	.FUNCT	SAMURAI-ON-LADDER:ANY:0:0
	FSET	OMI-SAMURAI,RMUNGBIT
	MOVE	OMI-SAMURAI,LADDER
	ICALL2	THIS-IS-IT,OMI-SAMURAI
	PRINT	STR?422
	CRLF	
	CALL2	SCORE-OBJECT,LADDER
	RSTACK	


	.FUNCT	LOSING-SAMURAI-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-CONTAINER \?CCL5
	CALL1	PASSIVE-VERB?
	ZERO?	STACK \?CCL5
	ICALL	PERFORM,V?ATTACK,LOSING-SAMURAI
	RTRUE	
?CCL5:	EQUAL?	RARG,M-WINNER \?CCL9
	FSET?	LOSING-SAMURAI,SCOREBIT /?CCL12
	PRINT	STR?423
	CRLF	
	RTRUE	
?CCL12:	PRINT	STR?424
	CRLF	
	RTRUE	
?CCL9:	EQUAL?	PRSA,V?EXAMINE \?CCL14
	FSET?	LOSING-SAMURAI,SCOREBIT /?CCL17
	PRINT	STR?423
	CRLF	
	RTRUE	
?CCL17:	PRINTR	"He's fighting, kicking and punching, trying to get away."
?CCL14:	EQUAL?	PRSA,V?WAKE \?CCL19
	FSET?	LOSING-SAMURAI,SCOREBIT /FALSE
	PRINTR	"He's alive, but he doesn't wake up."
?CCL19:	EQUAL?	PRSA,V?SEARCH \?CCL24
	FSET?	LOSING-SAMURAI,SCOREBIT /FALSE
	PRINTR	"You don't find anything of interest."
?CCL24:	EQUAL?	PRSA,V?TAKE,V?MOVE /?CCL29
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL29:	FSET?	LOSING-SAMURAI,SCOREBIT \?CCL34
	CALL1	DROPS-DAGGER
	RSTACK	
?CCL34:	EQUAL?	PRSA,V?KILL \?CCL36
	FSET?	LOSING-SAMURAI,DEAD \?CCL39
	PRINTR	"He's already dead."
?CCL39:	EQUAL?	PRSI,DAGGER \?CCL41
	FSET	LOSING-SAMURAI,DEAD
	PRINTR	"You stab him in the heart.He's dead."
?CCL41:	FSET	LOSING-SAMURAI,DEAD
	PRINTR	"You hold his face under the water until he stops breathing.He's dead."
?CCL36:	EQUAL?	PRSA,V?TAKE,V?MOVE \?CCL43
	PRINTR	"You move him up against the wall where he won't drown.The others are saying ""Kill him, Pilot!"" or ""Use him as a hostage!"""
?CCL43:	PRINTR	"He's already unconscious."


	.FUNCT	OMI-SAMURAI-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	IN?	OMI-SAMURAI,LADDER /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Advancing down the ladder are "
	IN?	LOSING-SAMURAI,PIT \?CCL11
	PRINTI	"two"
	JUMP	?CND9
?CCL11:	PRINTI	"three"
?CND9:	PRINTI	" samurai."
	RTRUE	


	.FUNCT	OMI-SAMURAI-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTI	"They seem uninterested in conversing with barbarians."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?TAKE,V?MOVE,V?PARRY /?CCL7
	EQUAL?	PRSA,V?STOP /?CCL7
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL7:	EQUAL?	HERE,VILLAGE-SQUARE \?CCL13
	PRINTR	"You are easily subdued by Omi's guards."
?CCL13:	IN?	OMI-SAMURAI,LADDER \?CCL15
	SET	'OPPONENT,OMI-SAMURAI
	IN?	LOSING-SAMURAI,HERE /?CCL18
	MOVE	LOSING-SAMURAI,HERE
	SET	'OPPONENT,LOSING-SAMURAI
	ICALL2	THIS-IS-IT,LOSING-SAMURAI
	ICALL	QUEUE,I-LOSING-SAMURAI,-1
	PRINTR	"You grapple with one of the samurai, who kicks viciously.The entire crew hurls themselves at the ladder.The man manages to throw his sword out of the pit, but tumbles heavily into the mud."
?CCL18:	PRINTR	"The remaining samurai are more wary this time.Oddly, they make no effort to rescue their comrade."
?CCL15:	FSET?	LOSING-SAMURAI,SCOREBIT \FALSE
	CALL1	DROPS-DAGGER
	RSTACK	


	.FUNCT	I-LOSING-SAMURAI:ANY:0:0
	EQUAL?	HERE,PIT \?CCL3
	IN?	LOSING-SAMURAI,HERE \?CCL3
	FSET?	LOSING-SAMURAI,SCOREBIT \?CCL3
	ICALL2	THIS-IS-IT,LOSING-SAMURAI
	FSET?	LOSING-SAMURAI,RMUNGBIT /?CCL9
	FSET	LOSING-SAMURAI,RMUNGBIT
	CRLF	
	PRINTR	"The samurai you knocked off of the ladder gropes his way to his feet.The fall obviously hurt him."
?CCL9:	FSET?	LOSING-SAMURAI,SURFACEBIT /?CCL11
	FSET	LOSING-SAMURAI,SURFACEBIT
	CRLF	
	PRINTR	"The muddy samurai draws a dagger and slashes at you.He is like a cornered rat."
?CCL11:	CRLF	
	PRINTI	"The samurai charges, and almost as much by blind ferocity as skill, he shoves his dagger into your chest, ending your life."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL3:	ICALL2	DEQUEUE,I-LOSING-SAMURAI
	RFALSE	


	.FUNCT	DROPS-DAGGER:ANY:0:0
	MOVE	DAGGER,HERE
	PRINTI	"You attempt to subdue the samurai, and Vinck helps, pounding again and again.""Don't kill him -- we can use him as a hostage!"" you warn.Finally, Vinck kicks him in the back of the neck and he goes limp, dropping his dagger."
	CRLF	
	CALL2	SCORE-OBJECT,LOSING-SAMURAI
	RSTACK	


	.FUNCT	CAULDRON-F:ANY:0:1,RARG
	EQUAL?	PRSA,V?THROUGH,V?BOARD \?CCL3
	EQUAL?	PRSO,CAULDRON \?CCL3
	PRINTR	"They'll put you in soon enough!"
?CCL3:	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	PRINTR	"The guards prevent you from getting close to the cauldron."


	.FUNCT	CAULDRON-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"A huge black-iron cauldron stands in the square."
	IN?	CROOCQ,CAULDRON /?CCL7
	RETURN	M-FATAL
?CCL7:	PRINTI	"The boy Croocq, trussed like a chicken, is inside."
	RETURN	M-FATAL


	.FUNCT	I-TAKE-CROOCQ:ANY:0:0,TMP
	INC	'DELAY-CNT
	EQUAL?	PIT-CNT,2 \?CCL5
	IN?	BLACKTHORNE,PIT \?CND3
	GRTR?	DELAY-CNT,2 \?CCL10
	MOVE	OMI,VILLAGE-SQUARE
	MOVE	SEBASTIO,VILLAGE-SQUARE
	CRLF	
	PRINTI	"A samurai points at you and beckons you up.Another samurai shoves a long barbed staff into the cellar and hooks you out."
	CRLF	
	CRLF	
	ICALL2	GOTO,VILLAGE-SQUARE
	RTRUE	
?CCL10:	CRLF	
	PRINTR	"""I don't know what they want,"" Father Sebastio says gravely.""But you must come up at once."""
?CCL5:	EQUAL?	PIT-CNT,3 \?CND3
	ZERO?	ANSWER-HAI? \?CCL14
	CALL1	CROOCQ-IN-CAULDRON
	EQUAL?	STACK,TRUE-VALUE /?CCL16
	RETURN	M-FATAL
?CCL16:	EQUAL?	DELAY-CNT,1,2 /?CCL18
	RETURN	M-FATAL
?CCL18:	ICALL1	OMI-SAYS-LIE-DOWN
	RETURN	M-FATAL
?CCL14:	CALL1	B-LYING?
	ZERO?	STACK \?CND3
	EQUAL?	DELAY-CNT,1 \?CCL22
	CRLF	
	PRINTR	"Omi watches you with great curiousity."
?CCL22:	CALL1	CROOCQ-IN-CAULDRON
	EQUAL?	STACK,TRUE-VALUE \?CND3
	EQUAL?	DELAY-CNT,2,3 \?CCL26
	ICALL1	OMI-SAYS-LIE-DOWN
	RTRUE	
?CCL26:	CRLF	
	PRINTI	"""Omi-san says, to make an agreement and then not keep it is stupid.""Omi then removes your head."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CND3:	SET	'DELAY-CNT,0
	INC	'PIT-CNT
	EQUAL?	PIT-CNT,1 \?CCL29
	FIRST?	CAULDRON >TMP \?CND30
	FSET	TMP,DEAD
?CND30:	CRLF	
	PRINTR	"The screams begin when the moon is high, and cease just before first light."
?CCL29:	EQUAL?	PIT-CNT,2 \?CCL33
	REMOVE	SHORT-STRAW
	REMOVE	LONG-STRAW
	MOVE	OMI,TRAPDOOR
	MOVE	SEBASTIO,TRAPDOOR
	FSET	TRAPDOOR,OPENBIT
	MOVE	LADDER,PIT
	CRLF	
	PRINTR	"Finally, it is high noon.Everyone is nervous, tired and scared from listening to the screams.

There are footsteps above.The trapdoor opens and the ladder is lowered again.The priest stands there flanked by samurai.

""Pilot.You are to come up.You are to come up alone,"" he says."
?CCL33:	EQUAL?	PIT-CNT,3 \?CCL35
	SET	'ANSWER-HAI?,FALSE-VALUE
	FSET	CROOCQ,SCOREBIT
	SET	'QCONTEXT,OMI
	CRLF	
	PRINTI	"The priest says, ""Omi-san says that you will be given a bath.And food and drink.If you behave, you will not be put back into the pit.Your men will stay below.If you do not behave, another of your men will be taken up.There is plenty of firewood.""He pauses while Omi speaks to him at length.""Omi-san says you must obey.Do what you are told.Eat dung if need be.The Japanese for 'yes' is '"
	ICALL2	PRINTUNDER,STR?426
	PRINTR	".'  If you agree, say it directly to him."""
?CCL35:	EQUAL?	PIT-CNT,4 \?CCL37
	SET	'QCONTEXT,OMI
	CRLF	
	PRINTI	"""Omi-san says that "
	ZERO?	PISS-FLAG /?CCL40
	PRINTI	"he did not insult you personally, neither was there any cause for you to insult him.B"
	JUMP	?CND38
?CCL40:	PRINTC	98
?CND38:	PRINTI	"ecause you are a barbarian and know no better yet, you will not be killed.But you will be taught manners.""You see Omi hitch up his kimono.He pisses on your back."
	ZERO?	PISS-FLAG /?CND41
	PRINTI	"""Omi-san says, it is very bad manners to say you will piss on anyone.It is bad manners and very stupid to say you will piss on anyone when you are unarmed.It is very bad manners and even more stupid to say you will piss on anyone when you are unarmed, powerless, and not prepared to allow your friends or family or whomever to perish first."""
?CND41:	ICALL	REPLACE-SYNONYM,BLACKTHORNE,W?PILOT,W?ANJIN
	ICALL	REPLACE-SYNONYM,BLACKTHORNE,W?PILOT-MAJOR,W?ANJIN-SAN
	CRLF	
	CRLF	
	IN?	CROOCQ,CAULDRON \?CND43
	MOVE	CROOCQ,HERE
	PRINTI	"You watch the samurai remove the unconscious boy from the cauldron."
?CND43:	PRINTR	"By the Lord God, you swear, I will remember this day and somehow, somewhere, Omi will pay.

Omi adjusts his kimono and continues to speak in a casual way.The priest translates, ""Omi-san says that because no one can say the barbarous sounds of your name, you are to be called Anjin -- Pilot.He asks me to impress upon you that this is not intended as an insult.If you continue to behave, you will be called Anjin-san -- Mr. Pilot -- when you merit it."""
?CCL37:	EQUAL?	PIT-CNT,5 \FALSE
	SET	'QCONTEXT,OMI
	SET	'BATH-FLAG,TRUE-VALUE
	CRLF	
	PRINTI	"The priest translates.""Omi-san suggests that you take a bath.""He smirks contemptuously.""A barbarous custom.Once when you're born and once when you're laid out is good enough for us, but here they bathe constantly.Mura says there is a bath house over there.""He points to the north."
	CRLF	
	CALL2	DEQUEUE,I-TAKE-CROOCQ
	RSTACK	


	.FUNCT	CROOCQ-IN-CAULDRON:ANY:0:0
	INC	'CROOCQ-CNT
	EQUAL?	CROOCQ-CNT,1 \?CCL3
	MOVE	CROOCQ,CAULDRON
	CRLF	
	PRINTR	"Omi gives a quiet order.Instantly two samurai go down into the pit and bring out Croocq, the boy.They drag him over to the cauldron, truss him while others bring firewood and water.They put the petrified boy into the brimming cauldron and ignite the wood."
?CCL3:	EQUAL?	CROOCQ-CNT,2 \?CCL5
	CRLF	
	PRINTR	"The fire is beginning to warm the water, and a nauseating groan breaks from Croocq's mouth."
?CCL5:	EQUAL?	CROOCQ-CNT,3 \?CCL7
	CRLF	
	PRINTR	"Flames from the wooden fire set in the bricks below the grate lick the metal of the cauldron.More wood is put on."
?CCL7:	EQUAL?	CROOCQ-CNT,4 \?CCL9
	CRLF	
	PRINTR	"Croocq screams a thin, wailing scream, and then faints.A man with a pole pokes him until he revives."
?CCL9:	EQUAL?	CROOCQ-CNT,5 \?CCL11
	CRLF	
	PRINTR	"The boy begins begging, shouting, ""Pilot, don't let them boil me alive, Pilot!"""
?CCL11:	CRLF	
	PRINTI	"""Omi-san says he will train someone else,"" a nauseated-looking Sebastio tells you.You have only a moment to ruminate on that before he removes your head."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL


	.FUNCT	OMI-SAYS-LIE-DOWN:ANY:0:0
	ICALL2	THIS-IS-IT,ORDERS
	CRLF	
	PRINTI	"""Omi-san says, "
	ZERO?	ANSWER-HAI? /?CCL3
	PRINTR	"lie down immediately!"""
?CCL3:	PRINTR	"you agree to behave?"""


	.FUNCT	CURSE-OMI:ANY:0:0
	ZERO?	PISS-FLAG \?CCL3
	SET	'PISS-FLAG,TRUE-VALUE
	PRINTR	"You lose your composure.""Tell him to go to hell.Tell him I piss on him and his whole country.Tell him exactly what I said!Exactly, by God!"" you yell at the priest.Omi listens, then the knuckles on his sword hand whiten.You can see he is trying not to give way to his emotions."
?CCL3:	PRINTR	"You continue to scream abuse at Omi."


	.FUNCT	BATH-HOUSE-F:ANY:0:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"The bath house is dominated by a huge wooden tub, steaming with scalding water.You are reminded of the torture you have just seen, and shiver with fear."
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL5
	IN?	MURA,BATH-HOUSE /TRUE
	MOVE	CROWD,BATH-HOUSE
	MOVE	ONNA,BATH-HOUSE
	MOVE	MURA,BATH-HOUSE
	ICALL	QUEUE,I-BATH,-1
	PRINTI	"You enter the bath house, followed by Mura, who keeps a close eye on you."
	CRLF	
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \?CCL9
	EQUAL?	PRSA,V?WALK \?PRD16
	EQUAL?	P-WALK-DIR,P?SOUTH /?PRD14
?PRD16:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL12
?PRD14:	IN?	BLACKTHORNE,BATHTUB /?CCL12
	PRINTR	"Mura moves to stop you, and you are thinking, ""How can this little man stop me?"", when, like a flash he seems to pull you toward him and over his shoulder in one fluid movement and you are sprawled gasping on the floor, out of breath.""So sorry, Captain-san,"" he says, in very bad Portuguese."
?CCL12:	IN?	PLAYER,HERE \?CCL20
	CALL1	TAKE-A-BATH?
	ZERO?	STACK /?CCL20
	ICALL	PERFORM,V?BOARD,BATHTUB
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?BATHE \?CCL24
	ZERO?	PRSO /?CCL24
	FSET?	PRSO,PERSON \?CCL29
	FSET?	PRSO,PLURAL \?CCL32
	PRINT	STR?427
	CRLF	
	RTRUE	
?CCL32:	ICALL1	CTHE-PRINT-PRSO
	PRINT	STR?428
	ICALL2	PRINT-HIS/HER,PRSO
	PRINTR	" head."
?CCL29:	ICALL1	CTHE-PRINT-PRSO
	PRINT	STR?429
	CRLF	
	RTRUE	
?CCL24:	EQUAL?	PRSA,V?STRIP \?CCL34
	SET	'DELAY-CNT,0
	FSET?	BOOTS,WEARBIT /?CTR36
	FSET?	CLOTHES,WEARBIT \?CCL37
?CTR36:	FSET?	BOOTS,WEARBIT \?CND40
	ICALL	PERFORM,V?TAKE-OFF,BOOTS
	FSET?	CLOTHES,WEARBIT \?CND40
	CRLF	
?CND40:	FSET?	CLOTHES,WEARBIT \TRUE
	ICALL	PERFORM,V?TAKE-OFF,CLOTHES
	RTRUE	
?CCL37:	PRINTR	"You're naked."
?CCL34:	EQUAL?	PRSA,V?TAKE-OFF \?CCL47
	EQUAL?	PRSO,BOOTS \?CCL47
	FSET?	BOOTS,WEARBIT \?CCL47
	SET	'DELAY-CNT,0
	MOVE	BOOTS,WINNER
	FCLEAR	BOOTS,WEARBIT
	PRINTR	"You remove your boots.The old women watching cackle and nudge each other in the ribs."
?CCL47:	EQUAL?	PRSA,V?TAKE-OFF \?CCL52
	EQUAL?	PRSO,CLOTHES \?CCL52
	SET	'DELAY-CNT,0
	FSET?	BOOTS,WEARBIT \?CCL57
	PRINT	YOU-HAVE-TO
	PRINT	STR?161
	PRINTR	"your boots first.Your pants won't go over the boots."
?CCL57:	MOVE	CLOTHES,WINNER
	FCLEAR	CLOTHES,WEARBIT
	PRINTR	"You slowly remove your clothes, embarrassed by the audience.They don't even have the courtesy of looking the other way.The old women laugh and joke with each other.Finally, you are naked, covering yourself as best you can.One old crone claps her hands, and Mura says to you, with enormous gravity, ""Captain-san, Mother-san thank you, best she's ever seen, now die happy!"""
?CCL52:	EQUAL?	PRSA,V?BATHE \FALSE
	EQUAL?	PRSO,BOOTS,CLOTHES \FALSE
	PRINTR	"You should leave that to your hosts."
?CCL9:	EQUAL?	RARG,M-END \FALSE
	FSET?	BATHTUB,SCOREBIT /FALSE
	FSET	PIT,INVISIBLE
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	I-BATH:ANY:0:0
	INC	'DELAY-CNT
	ZERO?	BATH-CNT \?CND3
	FSET?	BOOTS,WEARBIT /?CTR6
	FSET?	CLOTHES,WEARBIT \?CCL7
?CTR6:	GRTR?	DELAY-CNT,5 \?CCL12
	SET	'DELAY-CNT,0
	FCLEAR	CLOTHES,WEARBIT
	FCLEAR	BOOTS,WEARBIT
	MOVE	CLOTHES,MURA
	MOVE	BOOTS,MURA
	CRLF	
	PRINTR	"Mura signals to some of the onlookers, and you are surrounded, overpowered, and stripped before you can even react.""So sorry, Anjin,"" says Mura."
?CCL12:	CRLF	
	PRINTI	"Mura pantomimes removing your clothes, saying """
	ICALL2	PRINTUNDER,STR?430
	PRINTR	""""
?CCL7:	CALL2	HELD?,CLOTHES
	ZERO?	STACK \?CTR13
	CALL2	HELD?,BOOTS
	ZERO?	STACK /?CCL14
?CTR13:	CRLF	
	PRINTI	"Mura points to your "
	CALL2	HELD?,CLOTHES
	ZERO?	STACK /?CCL19
	PRINTR	"clothes."
?CCL19:	PRINTR	"boots."
?CCL14:	IN?	BLACKTHORNE,BATHTUB /?CND3
	GRTR?	DELAY-CNT,3 \?CCL23
	CRLF	
	PRINTI	"Mura looks extremely annoyed.""Bath, please.Stinku.Bad.Like all Portuguese.""He chops you in the forearm, then calmly touches a nerve in your neck.There is blinding pain.""Please excuse me, Anjin,"" he says, bowing very low.""Bath very good.""Then they lower you into the scalding water."
	CRLF	
	ICALL1	NEXT-SCENE
	RTRUE	
?CCL23:	CRLF	
	PRINTR	"Mura points to the bathtub.""Please go there,"" he says in halting Portuguese."
?CND3:	SET	'DELAY-CNT,0
	INC	'BATH-CNT
	EQUAL?	BATH-CNT,1 \FALSE
	ICALL2	DEQUEUE,I-BATH
	RFALSE	


	.FUNCT	CROWD-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \FALSE
	PRINTI	"They just giggle."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	


	.FUNCT	CROWD-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"A crowd of villagers, old women and men, are sitting and standing around the tub.They seem intensely interested in the proceedings."
	RTRUE	


	.FUNCT	BATHTUB-F:ANY:0:1,RARG,RUIN
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?WALK \?CCL6
	CALL2	YOULL-HAVE-TO,STR?431
	RSTACK	
?CCL6:	EQUAL?	PRSA,V?WEAR \?CCL8
	IN?	PRSO,BATHTUB /?CCL8
	PRINT	STR?432
	CRLF	
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?LIE-DOWN,V?KNEEL \?CCL12
	PRINT	STR?433
	CRLF	
	RTRUE	
?CCL12:	EQUAL?	PRSA,V?LEAP,V?DIVE /?CTR13
	CALL1	TAKE-A-BATH?
	ZERO?	STACK /?CCL14
?CTR13:	PRINTI	"You splash some of the scalding water half-heartedly over yourself.The water is soapy and scented, and it washes away the filth.Three times you make them scour your back with the roughest stone and with pumice.You begin to feel cleaner, but your back still burns with shame.

Before long, even your hatred of Omi becomes a banked fire as the heat of the bath burns into you, relaxing every muscle and dissolving your fatigue."
	CRLF	
	CALL2	SCORE-OBJECT,BATHTUB
	RSTACK	
?CCL14:	EQUAL?	PRSA,V?EXIT \?CCL18
	EQUAL?	PRSO,GLOBAL-HERE \?CCL18
	ICALL2	PERFORM,V?DISEMBARK
	RTRUE	
?CCL18:	CALL2	OUTSIDE-TUB?,BATHTUB
	ZERO?	STACK /FALSE
	ICALL1	CTHE-PRINT-PRSO
	ICALL2	PRINT-IS/ARE,PRSO
	PRINT	STR?434
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL27
	CALL	NOUN-USED?,PRSO,W?WATER
	ZERO?	STACK /?CCL30
	PRINTR	"It's very hot, and very clean."
?CCL30:	PRINT	STR?435
	CRLF	
	RTRUE	
?CCL27:	EQUAL?	PRSA,V?TAKE,V?MOVE \?CCL32
	EQUAL?	PRSO,BATHTUB \?CCL32
	EQUAL?	P-PRSA-WORD,W?TAKE \?CCL37
	CALL	NOUN-USED?,PRSO,W?BATH
	ZERO?	STACK /?CCL37
	ICALL	PERFORM,V?BATHE,ME
	RTRUE	
?CCL37:	PRINT	STR?436
	CRLF	
	RTRUE	
?CCL32:	EQUAL?	PRSA,V?POUR \?CCL41
	PRINT	STR?437
	CRLF	
	RTRUE	
?CCL41:	EQUAL?	PRSA,V?CLIMB-FOO,V?BOARD,V?ENTER \?CCL43
	CALL2	RUINABLE?,WINNER >RUIN
	ZERO?	RUIN /?CCL46
	ICALL2	MURA-STOPS-YOU,RUIN
	FSET?	RUIN,WEARBIT \?CCL49
	PRINTR	"He pantomimes removing them, and the old women giggle and make loud remarks to him."
?CCL49:	CRLF	
	RTRUE	
?CCL46:	MOVE	WINNER,BATHTUB
	PRINT	STR?438
	CRLF	
	RTRUE	
?CCL43:	EQUAL?	PRSA,V?PUT,V?THROW \?CCL51
	EQUAL?	PRSI,BATHTUB \?CCL51
	CALL2	HELD?,PRSO
	ZERO?	STACK /?CCL51
	FSET?	PRSO,WEARABLE \?CCL51
	ICALL2	MURA-STOPS-YOU,PRSO
	CRLF	
	RTRUE	
?CCL51:	EQUAL?	PRSA,V?DRINK,V?TASTE \FALSE
	PRINT	STR?439
	CRLF	
	RTRUE	


	.FUNCT	TAKE-A-BATH?:ANY:0:0
	EQUAL?	PRSA,V?BATHE \?PRD3
	EQUAL?	PRSO,FALSE-VALUE,ME /TRUE
?PRD3:	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	PRSO,BATHTUB,YOKOSE-BATHTUB \FALSE
	CALL	NOUN-USED?,PRSO,W?BATH
	RSTACK	


	.FUNCT	RUINABLE?:ANY:1:1,WHO,WEAR
	IN?	BOOTS,WHO \?CCL3
	FSET?	BOOTS,WEARBIT \?CCL3
	RETURN	BOOTS
?CCL3:	IN?	CLOTHES,WHO \?CCL7
	FSET?	CLOTHES,WEARBIT \?CCL7
	RETURN	CLOTHES
?CCL7:	FIRST?	WHO >WEAR /?PRG11
?PRG11:	ZERO?	WEAR /FALSE
	EQUAL?	WEAR,LONG-STRAW,SHORT-STRAW /?CCL17
	RETURN	WEAR
?CCL17:	NEXT?	WEAR >WEAR /?PRG11
	JUMP	?PRG11


	.FUNCT	MURA-STOPS-YOU:ANY:1:1,OBJ
	PRINTD	MURA
	ICALL2	THIS-IS-IT,MURA
	FSET?	OBJ,WEARBIT /?CCL3
	PRINTI	" offers to take "
	JUMP	?CND1
?CCL3:	PRINTI	", whose grip is surprisingly strong, stops you before you ruin "
?CND1:	ICALL2	DPRINT,OBJ
	PRINTC	46
	RTRUE	


	.FUNCT	PIT-AFTER-F:ANY:0:0
	PRINTI	"Yabu and Omi are sitting sipping "
	ICALL2	PRINTUNDER,STR?440
	PRINTR	" -- tea -- with all the ceremony Omi's mother can command.""Where did you learn so much about the barbarian mind?"" he asks Omi.

""When I was fourteen I had a teacher who had been a Christian priest.He said that Christians were vulnerable because they were taught that all people should 'love' one another, and that life was sacred.These new barbarians are just a different sect.I thought we could control the leader by taking the life or threatening to take the life of one of his men.""Omi avoids mentioning the torture death, the befouled death, reining in his disgust.

""Is the barbarian broken for good?"" asks Yabu.""Is it temporary or permanent?""

""Temporary,"" Omi answers hesitantly.""Only temporary, Lord."""

	.ENDSEG

	.SEGMENT "RODRIGUES"


	.FUNCT	SLAVER-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"A sixty-oared galley is anchored off of one of the jetties."
	RTRUE	


	.FUNCT	SLAVER-F:ANY:0:1,RARG
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"This is a sixty-oared galley, thirty oars a side, neat and trim, the oars stacked with care, ready for instant departure."
?CCL3:	EQUAL?	PRSA,V?BOARD,V?WALK-TO \FALSE
	IN?	RODRIGUES,HERE \?CCL8
	PRINTR	"""No need, Ingeles, the galley isn't ready to leave.There's time.""You are startled.Minutes ago they were herding you aboard.What does this man want from you?"
?CCL8:	PRINTR	"You move to board the galley, but you can't give yourself up to slavery.What of the promise they made, that if you behaved they would treat you well?Are they betraying it now?"


	.FUNCT	I-MEET-RODRIGUES:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	MEET-CNT,4 \?CCL5
	EQUAL?	RODRIGUES-QUESTION,1 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL10
	ICALL1	DIE-IN-STORM
	RETURN	M-FATAL
?CCL10:	CRLF	
	PRINTR	"""Well, are you the pilot or no?I'm trying to help you, you fool!"""
?CCL5:	EQUAL?	MEET-CNT,5 \?CCL12
	EQUAL?	RODRIGUES-QUESTION,2 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL17
	ICALL1	DIE-IN-STORM
	RETURN	M-FATAL
?CCL17:	CRLF	
	PRINTR	"""All you Ingeles pilots come out of the same nest of pirates!If you're really one, you'll know, so tell!Where did you train?"""
?CCL12:	EQUAL?	MEET-CNT,6 \?CCL19
	EQUAL?	RODRIGUES-QUESTION,3 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL24
	ICALL1	DIE-IN-STORM
	RETURN	M-FATAL
?CCL24:	CRLF	
	PRINTR	"""Well, are you a pilot or no?I'm trying to help you, you fool!What's the latitude of The Lizard?"""
?CCL19:	EQUAL?	MEET-CNT,7 \?CCL26
	FSET?	LG-ERASMUS,SCOREBIT \?CND3
	GRTR?	DELAY-CNT,3 \FALSE
	CRLF	
	ICALL2	LETS-GO-ABOARD,FALSE-VALUE
	FCLEAR	LG-ERASMUS,SCOREBIT
	RTRUE	
?CCL26:	EQUAL?	MEET-CNT,8 \?CCL33
	IN?	BLACKTHORNE,SMALL-BOAT /?CND3
	GRTR?	DELAY-CNT,3 \?CCL38
	ICALL1	DIE-IN-STORM
	RTRUE	
?CCL38:	CRLF	
	PRINTI	"""Hurry, hurry!Get in the boat!Hurry up!"""
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTR	" continues his dominating abuse of the astonished samurai."
?CCL33:	EQUAL?	MEET-CNT,13 \?CCL40
	EQUAL?	HERE,ON-DECK /?CND3
	GRTR?	DELAY-CNT,3 \?CCL45
	ICALL2	JIGS-UP,STR?441
	RETURN	M-FATAL
?CCL45:	IN?	PLAYER,SMALL-BOAT \?CCL47
	CRLF	
	PRINTI	"""Come on, Ingeles!Hurry!"""
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTR	" continues his half-obsequious, half-insulting banter with the suspicious samurai.""I can't keep this up, we can't give them time to think!"""
?CCL47:	CRLF	
	PRINTI	"The last you hear from "
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTR	" is a volley of blistering curses."
?CCL40:	EQUAL?	MEET-CNT,14 \?CCL49
	EQUAL?	HERE,PASSAGEWAY /?CND3
	GRTR?	DELAY-CNT,3 \?CCL54
	ICALL1	DIE-IN-STORM
	RETURN	M-FATAL
?CCL54:	EQUAL?	HERE,ON-DECK,CAPTAINS-CABIN,MATES-CABIN \?CCL56
	CRLF	
	PRINTR	"Rodrigues yells back to you, ""If you value your life, Ingeles, follow me!"""
?CCL56:	ICALL1	HEAR-RODRIGUES
	RTRUE	
?CCL49:	EQUAL?	MEET-CNT,15 \?CND3
	EQUAL?	HERE,PILOTS-CABIN /?CND3
	GRTR?	DELAY-CNT,3 \?CCL62
	ICALL1	DIE-IN-STORM
	RETURN	M-FATAL
?CCL62:	EQUAL?	HERE,PASSAGEWAY,MATES-CABIN,CAPTAINS-CABIN \?CCL64
	ICALL1	DONT-BE-STUPID
	RTRUE	
?CCL64:	ICALL1	HEAR-RODRIGUES
	RTRUE	
?CND3:	SET	'DELAY-CNT,0
	INC	'MEET-CNT
	EQUAL?	MEET-CNT,1 \?CCL67
	FCLEAR	BRIDGE-OF-ERASMUS,TOUCHBIT
	FCLEAR	ON-DECK,TOUCHBIT
	FCLEAR	PASSAGEWAY,TOUCHBIT
	FCLEAR	PILOTS-CABIN,TOUCHBIT
	CRLF	
	PRINTR	"You can see that even Omi and Yabu are deferring to the old man.He has evidently come from the slave galley.

You shiver involuntarily.The last time you saw a slave galley was two years ago when the fleet was outward bound off the Gold Coast.You've always had a mortal fear of being taken alive and made a galley slave -- not an unusual fate for a captured seaman."
?CCL67:	EQUAL?	MEET-CNT,2 \?CCL69
	SET	'QCONTEXT,MURA
	SET	'OPPONENT,MURA
	CRLF	
	PRINTR	"Omi kneels before the old man, and you do the same, bowing exactly as low as Omi.Now there is a discussion among Omi, the old man and Yabu.Yabu speaks to Mura.

Mura points at the galley.""Anjin-san.Please go there."""
?CCL69:	EQUAL?	MEET-CNT,3 \?CCL71
	SET	'QCONTEXT,OMI
	MOVE	MURA-ROPE,MURA
	ICALL2	THIS-IS-IT,ARCHERS
	CRLF	
	PRINTC	34
	ICALL2	PRINTUNDER,STR?442
	PRINTR	""" Omi commands, waving you toward the galley.

When you still don't move, there is an immediate order from Omi and four samurai fall on you and pinion your arms.Mura produces a rope and begins to bind your hands."
?CCL71:	EQUAL?	MEET-CNT,4 \?CCL73
	MOVE	RODRIGUES,ANJIRO-WATERFRONT
	SET	'QCONTEXT,RODRIGUES
	SET	'RODRIGUES-QUESTION,1
	CRLF	
	PRINTI	"""Madonna!Leave him alone!Hey, let that bastard alone!"
	ICALL2	PRINTUNDER,STR?443
	PRINTR	"  Is he the pilot?The Anjin?""

You can scarcely believe your ears.The boisterous abuse in Portuguese comes from the deck of the galley.Then you see a man start down the gangway, a Portuguese seaman!

""Are you the pilot?The pilot of the Dutchman?"""
?CCL73:	EQUAL?	MEET-CNT,5 \?CCL75
	SET	'RODRIGUES-QUESTION,2
	SET	'QCONTEXT,RODRIGUES
	ICALL2	SETUP-ANSWER,STR?444
	CRLF	
	PRINTR	"""Now tell me where you trained as a pilot?"""
?CCL75:	EQUAL?	MEET-CNT,6 \?CCL77
	SET	'RODRIGUES-QUESTION,3
	SET	'QCONTEXT,RODRIGUES
	ICALL2	SETUP-ANSWER,STR?445
	CRLF	
	PRINTR	"""Maybe you are a pilot!Now, what's the latitude of The Lizard?"""
?CCL77:	EQUAL?	MEET-CNT,7 \?CCL79
	CRLF	
	PRINTI	"""All right, Ingeles!"""
	ICALL2	THE-PRINT,RODRIGUES
	PRINTR	" looks out into the harbor.""She's got good lines, your ship.Madonna, she'd be fast, very fast.Very rough to deal with."""
?CCL79:	EQUAL?	MEET-CNT,8 \?CCL81
	CRLF	
	PRINTI	"Rodrigues yells to the surprised samurai, ""You don't have to worry about him, Captain-san, I'm responsible.Me, Rodrigu-san, "
	ICALL2	PRINTUNDER,STR?446
	PRINTI	" Anjin-san, by the Virgin!"
	ICALL2	PRINTUNDER,STR?447
	PRINTR	""""
?CCL81:	EQUAL?	MEET-CNT,9 \?CCL83
	MOVE	BOAT-OAR,RODRIGUES
	SET	'OPPONENT,ARCHERS
	CRLF	
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" grabs the oars and shoves off with great skill.The captain samurai calls out, unmistakably beckoning you to come back."
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" points to the "
	ICALL2	PRINTUNDER,STR?448
	PRINTI	"  ""Just go there,"" he shouts.""Tell me if the archers put arrows in their bows, Ingeles!"""
	CRLF	
	CRLF	
	CALL2	GOTO,ANJIRO-HARBOR
	RSTACK	
?CCL83:	EQUAL?	MEET-CNT,10 \?CCL85
	FSET	ARCHERS,RMUNGBIT
	CRLF	
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" rows toward the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	", pushing against the oars in Japanese fashion while standing amidships."
?CCL85:	EQUAL?	MEET-CNT,11 \?CCL87
	CRLF	
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" continues to row toward the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	"."
?CCL87:	EQUAL?	MEET-CNT,12 \?CCL89
	FSET?	ARCHERS,SCOREBIT \?CCL92
	CRLF	
	ICALL2	JIGS-UP,STR?449
	RETURN	M-FATAL
?CCL92:	CRLF	
	PRINTI	"You are at the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	"."
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" ships the oars under the watchful eyes of the samurai on board."
	CRLF	
	CRLF	
	CALL2	GOTO,AT-ERASMUS
	RSTACK	
?CCL89:	EQUAL?	MEET-CNT,13 \?CCL94
	MOVE	BOAT-OAR,SMALL-BOAT
	MOVE	RODRIGUES,ON-DECK
	CRLF	
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" vaults onto the deck."""
	ICALL2	PRINTUNDER,STR?450
	PRINTI	" to all sod-eating samas!"" he bellows, bowing like a courtier."
	EQUAL?	HERE,ON-DECK \?CCL97
	PRINTC	11
	CALL1	SEALED-PASSAGE
	RSTACK	
?CCL97:	CRLF	
	RTRUE	
?CCL94:	EQUAL?	MEET-CNT,14 \?CCL99
	MOVE	RODRIGUES,PASSAGEWAY
	EQUAL?	HERE,ON-DECK,PASSAGEWAY \FALSE
	FSET	PASSAGE-DOOR,OPENBIT
	ICALL	NEW-SDESC,HIRO-MATSU,STR?279
	FCLEAR	HIRO-MATSU,AN
	CRLF	
	PRINTC	34
	ICALL2	PRINTUNDER,STR?451
	PRINTI	" eh?"" Rodrigues says, unimpressed.""I'm from Toda Hiro-matsu-sama, who's a bigger king than your bugger and Toady-sama's from Toranaga-sama, who's the biggest bugger-sama in this whole world."
	ICALL2	PRINTUNDER,STR?273
	PRINTI	"""He rips the seal off the door, and drops a hand to one of his pistols.

""Toranaga-sama!"" he yells."""
	ICALL2	PRINTUNDER,STR?447
	PRINTI	"""The samurai hesitate, swords ready."
	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTI	" crashes his foot against the door, the latch snaps, and the door bursts open."""
	ICALL2	PRINTUNDER,STR?452
	PRINTI	"""

""Wakarimasu, Anjin-san."" The samurai quickly put their swords away, and "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTR	" says hoarsely, ""That's better,"" and leads the way aft."
?CCL99:	EQUAL?	MEET-CNT,15 \?CCL104
	MOVE	RODRIGUES,PILOTS-CABIN
	FSET	PILOTS-CABIN-DOOR,OPENBIT
	EQUAL?	HERE,PILOTS-CABIN \?CCL107
	CRLF	
	PRINTR	"""This must be your cabin, eh?"" says Rodrigues and follows you inside."
?CCL107:	EQUAL?	HERE,PASSAGEWAY \?CCL109
	CRLF	
	PRINTI	"""Which is your cabin?"" asks "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTR	", and when you point it out he enters.The door was unlocked."
?CCL109:	EQUAL?	HERE,ON-DECK,MATES-CABIN,CAPTAINS-CABIN /?CCL111
	EQUAL?	HERE,BELOW-DECKS \FALSE
?CCL111:	CALL1	DONT-BE-STUPID
	RSTACK	
?CCL104:	EQUAL?	MEET-CNT,16 \FALSE
	SET	'QCONTEXT,RODRIGUES
	CRLF	
	PRINTI	"""Where are they?"" "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTI	" asks.""Your rutters.Where are your rutters?No pilot would worry about clothes, you came for the rutters, didn't you?Why do you think I came aboard?I was here two or three hours ago, and searched for them, but found nothing!The Portuguese rutter -- it had to be Portuguese!Where is it?""

""Stolen.They're stolen!""It's all you can say."
	CRLF	
	CRLF	
	SET	'QCONTEXT,FALSE-VALUE
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	LETS-GO-ABOARD:ANY:1:1,YOU?
	PRINTI	"""Ah, Ingeles, let's go aboard.I'd like see what she's like.Come on, get in the boat."""
	CRLF	
	ZERO?	YOU? \?CND1
	CRLF	
	PRINTI	"""Good idea. I'd like to retrieve my clothes,"" you say, trying to not mention your rutters."
	CRLF	
?CND1:	MOVE	RODRIGUES,SMALL-BOAT
	CRLF	
	PRINTR	"He points to a small boat pulled up on the beach, and jumps in."


	.FUNCT	HEAR-RODRIGUES:ANY:0:0
	CRLF	
	PRINTR	"You hear Rodrigues calling for you, scorching the air with invective."


	.FUNCT	DIE-IN-STORM:ANY:0:0
	CRLF	
	ICALL2	JIGS-UP,STR?453
	RETURN	M-FATAL


	.FUNCT	SEALED-PASSAGE:ANY:0:0
	PRINTI	"Rodrigues heads immediately for the sealed passage."""
	ICALL2	PRINTUNDER,STR?454
	PRINTR	""" says one of the samurai."


	.FUNCT	DONT-BE-STUPID:ANY:0:0
	CRLF	
	PRINTR	"""Get in here, we haven't much time!These buggers are going to start wondering what we're doing!"" says Rodrigues."


	.FUNCT	LEAVE-ANJIRO-AFTER-F:ANY:0:0
	PRINTR	"Omi and the others waited on the jetty until the galley rounded the headland and vanished.He then returned to the pit, summoning the priest.

""Priest, tell the barbarians they are to come up, one by one.Lord Yabu has said they may live again in the world of men.But the smallest breaking of a rule, and two will be put back into the pit.They are to behave and obey all orders."""

	.ENDSEG

	.ENDI
