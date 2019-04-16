
	.SEGMENT "ERASMUS"


	.FUNCT	COMPASS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	PRINTI	"The compass points north.From it you can see that the course is "
	ICALL2	TELL-DIRECTION,SHIP-DIRECTION
	PRINTR	" and that the wind is out of the east, perhaps a point or two south of east."


	.FUNCT	DECK-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	CALL	NOUN-USED?,PRSO,W?WATCH
	ZERO?	STACK /FALSE
	FSET?	MAETSUKKER,SCOREBIT \?CCL9
	PRINTR	"The men on watch are tired."
?CCL9:	PRINTR	"The watch is as fresh as can be expected."
?CCL3:	EQUAL?	PRSA,V?TAKE \?CCL11
	CALL	NOUN-USED?,PRSO,W?WATCH
	ZERO?	STACK /?CCL14
	PRINTR	"You are too tired to take the watch yourself."
?CCL14:	PRINTR	"You can't take that."
?CCL11:	EQUAL?	PRSA,V?RELEASE \?CCL16
	EQUAL?	HERE,BELOW-DECKS \?CCL19
	PRINTR	"You should probably send some of these men out to relieve the watch."
?CCL19:	PRINT	YOU-HAVE-TO
	PRINTR	"send some fresh crewmen out to do that."
?CCL16:	EQUAL?	PRSA,V?WALK-UNDER \?CCL21
	CALL2	DO-WALK,P?FORE
	RSTACK	
?CCL21:	EQUAL?	PRSA,V?STEP-ON,V?BOARD \FALSE
	CALL2	DO-WALK,P?OUT
	RSTACK	


	.FUNCT	REEF-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	EQUAL?	SCENE,S-ANJIRO,S-RODRIGUES \?CCL6
	PRINTR	"The reefs are over the horizon, invisible."
?CCL6:	ZERO?	REEF-FLAG \?CCL8
	PRINTR	"You've been avoiding reefs for days.Right now the visibility is terrible; only a few hundred yards.You couldn't see a reef unless you were almost on top of it.A horrible thought!"
?CCL8:	EQUAL?	SHIP-X,8 \?CCL10
	EQUAL?	SHIP-Y,2 \?CCL10
	PRINT	STR?326
	CRLF	
	RTRUE	
?CCL10:	EQUAL?	SHIP-X,6 \?CCL14
	EQUAL?	SHIP-Y,2 \?CCL14
	PRINTR	"The gap in the reef is to port."
?CCL14:	EQUAL?	SHIP-Y,1 \?CCL18
	EQUAL?	SHIP-X,5 \?CCL18
	PRINTR	"The neck of the pass is right here, right to starboard, a maelstrom of foaming sea and crashing combers."
?CCL18:	EQUAL?	SHIP-Y,1 \?CCL22
	GRTR?	SHIP-X,0 \?CCL22
	LESS?	SHIP-Y,5 \?CCL22
	PRINTR	"The reef surrounds you on both sides, a terrifyingly narrow channel hemmed in by rocks and smashed by waves."
?CCL22:	EQUAL?	REEF-X,REEF-Y \?CCL27
	PRINTI	"The reef is barely two hundred yards "
	ICALL1	TELL-REEF-DIR
	PRINTI	", great black claws of rocks pounded by the hungry sea.A foaming line of surf looms "
	ICALL1	TELL-REEF-DIR
	PRINTI	", broken intermittently "
	EQUAL?	SHIP-DIRECTION,P?WEST,P?NW \?CCL30
	PRINTI	"to port"
	JUMP	?CND28
?CCL30:	EQUAL?	SHIP-DIRECTION,P?SW \?CCL32
	PRINTI	"to starboard"
	JUMP	?CND28
?CCL32:	PRINTI	"by too-narrow channels"
?CND28:	PRINTR	"."
?CCL27:	PRINTR	"The reef is off to the west, veiled in storm but revealed by breakers."
?CCL3:	EQUAL?	PRSA,V?TURN-AROUND \?CCL34
	PRINT	YOU-HAVE-TO
	PRINT	STR?158
	CRLF	
	RTRUE	
?CCL34:	EQUAL?	PRSA,V?TURN-TOWARD,V?TURN-AWAY,V?AVOID \FALSE
	ZERO?	REEF-FLAG /FALSE
	EQUAL?	PRSA,V?TURN-TOWARD \?CCL42
	SET	'P-DIRECTION,P?STARBOARD
	JUMP	?CND40
?CCL42:	SET	'P-DIRECTION,P?PORT
?CND40:	ICALL	PERFORM,V?TURN,WHEEL,INTDIR
	RTRUE	


	.FUNCT	TELL-REEF-DIR:ANY:0:0
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL3
	PRINTI	"ahead"
	RTRUE	
?CCL3:	EQUAL?	SHIP-DIRECTION,P?SW \?CCL5
	PRINTI	"to starboard"
	RTRUE	
?CCL5:	EQUAL?	SHIP-DIRECTION,P?NW \?CCL7
	PRINTI	"to port"
	RTRUE	
?CCL7:	PRINTI	"away"
	RTRUE	


	.FUNCT	FORESAILS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET?	FORESAILS,TRYTAKEBIT \?CCL6
	PRINTR	"The foremast has snapped.You may be able to survive without it for a while, though."
?CCL6:	PRINTI	"In this storm, only the barest storm sails are necessary, but you can't get by with none.The foresails "
	FSET?	PRSO,RMUNGBIT \?CCL9
	PRINTR	"have been torn away!"
?CCL9:	PRINTR	"are barely hanging together."
?CCL3:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL11
	EQUAL?	PRSI,FORESAILS \?CCL11
	ICALL1	DPRINT-PRSO
	PRINTR	" replies, ""Foresails only in a storm like this, by God!Anything more and we'd lose the mast!"""
?CCL11:	EQUAL?	PRSA,V?LOWER \?CCL15
	FSET?	FORESAILS,RMUNGBIT /?CTR17
	FSET?	FORESAILS,TRYTAKEBIT \?CCL18
?CTR17:	PRINTR	"No need for that!"
?CCL18:	PRINTR	"Without foresails, there would be no control, and the ship would be doomed.You wisely reconsider."
?CCL15:	EQUAL?	PRSA,V?RAISE,V?REPAIR \FALSE
	FSET?	FORESAILS,TRYTAKEBIT \?CCL25
	PRINTR	"The mast itself has snapped, there's no way to repair the sails!"
?CCL25:	FSET?	FORESAILS,RMUNGBIT /?CCL27
	FSET?	FORESAILS,SCOREBIT \?CCL30
	PRINTR	"The foresails are still holding on, the maximum sail that the ship can tolerate in this terrific gale."
?CCL30:	PRINTR	"The new foresails have already been raised."
?CCL27:	ZERO?	CREW-ON-DECK? /?CCL32
	FCLEAR	FORESAILS,RMUNGBIT
	PRINTI	"You yell to the crewmen, ""Fores'ls ho!""Foot by foot they haul themselves into the shrouds of the foremast rigging, dragging new sails aloft as others below lean on the ropes to give them a hand.They curse the sail out of its ropes.It falls open, cracking like a cannonade as the wind fills it, and the ship lurches.Now you have some control!"
	CRLF	
	CALL2	SCORE-OBJECT,FORESAILS
	RSTACK	
?CCL32:	IN?	HENDRIK,ON-DECK /?CTR33
	IN?	GINSEL,ON-DECK /?CTR33
	IN?	VINCK,ON-DECK /?CTR33
	IN?	MAETSUKKER,ON-DECK \?CCL34
?CTR33:	ICALL	QUEUE,I-HANDS,2
	PRINTR	"The crewmen on deck try to obey, but there are too few of them!You need more crew on deck!They ring the bell.""All hands on deck!"" someone screams."
?CCL34:	PRINTR	"There's no one here to carry out your order!"


	.FUNCT	LG-ERASMUS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	PRSA,V?TELL,V?ASK-ABOUT \?CCL5
	EQUAL?	PRSO,LG-ERASMUS \?CCL5
	PRINTR	"You have been at sea too long!"
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL9
	EQUAL?	SCENE,S-ANJIRO \?CCL12
	EQUAL?	HERE,ANJIRO,ANJIRO-WATERFRONT,ANJIRO-HARBOR /?CTR14
	EQUAL?	HERE,AT-ERASMUS \?CCL15
?CTR14:	PRINTI	"The "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" is anchored neatly, fifty yards from shore, in good water, with three bow cables.You can see native men aboard."
	CRLF	
	FSET?	RUTTER,RMUNGBIT /TRUE
	FSET	RUTTER,RMUNGBIT
	CRLF	
	PRINTR	"With a start you realize you don't know where your rutters are!Can they still be on the ship?They are your most precious possessions, and the stolen Portuguese one is a death sentence in any Catholic country!"
?CCL15:	PRINTR	"You are surprised at how neat the ship is.The tattered sails are down and tied in place.But the lashings are different from any you've ever seen.You presume the Japaners have made the vessel secure."
?CCL12:	FSET?	FORESAILS,TRYTAKEBIT \?CCL21
	PRINTR	"The ship is without a foremast!"
?CCL21:	FSET?	FORESAILS,RMUNGBIT \?CCL23
	PRINTI	"Right now, the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" is missing her foresails."
?CCL23:	PRINTI	"The "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" is a pisscutter of a ship, lean and taut as a greyhound.If she can make it to port, God willing, all will be well.Otherwise, you're a dead man."
?CCL9:	EQUAL?	PRSA,V?DROP \?CCL25
	EQUAL?	P-PRSA-WORD,W?ABANDON \?CCL25
	EQUAL?	SCENE,S-ERASMUS \?CCL25
	PRINT	STR?327
	CRLF	
	RTRUE	
?CCL25:	EQUAL?	PRSA,V?WALK-TO \?CCL30
	EQUAL?	SCENE,S-ANJIRO,S-RODRIGUES \FALSE
	IN?	PLAYER,SMALL-BOAT /FALSE
	PRINT	YOU-HAVE-TO
	PRINTR	"use a boat to do that."
?CCL30:	EQUAL?	PRSA,V?LEAP,V?DIVE \?CCL37
	EQUAL?	HERE,ON-DECK,BRIDGE-OF-ERASMUS \?CCL40
	EQUAL?	SCENE,S-ERASMUS \?CCL43
	PRINT	STR?327
	CRLF	
	RTRUE	
?CCL43:	PRINTI	"You hurry over the side and down the gangway!"
	CRLF	
	CRLF	
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?CCL40:	PRINTR	"You can hardly jump overboard from here!"
?CCL37:	EQUAL?	PRSA,V?DISEMBARK,V?EXIT \?CCL45
	EQUAL?	SCENE,S-ANJIRO,S-RODRIGUES \?CCL45
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?CCL45:	EQUAL?	PRSA,V?POINT \?CCL49
	EQUAL?	OMI-QUESTION,1,2 \?CCL52
	PRINTR	"""That's no answer, heretic!"""
?CCL52:	IN?	SEBASTIO,HERE \FALSE
	PRINTR	"""Your ship has been well cared for, pirate!"""
?CCL49:	EQUAL?	PRSA,V?BOARD,V?CLIMB-ON,V?THROUGH /?CTR55
	EQUAL?	PRSA,V?CLIMB-UP \?CCL56
?CTR55:	EQUAL?	HERE,AT-ERASMUS \?CCL61
	CALL2	DO-WALK,P?UP
	RSTACK	
?CCL61:	EQUAL?	HERE,ON-DECK,BRIDGE-OF-ERASMUS,PASSAGEWAY /?CTR62
	EQUAL?	HERE,PILOTS-CABIN,MATES-CABIN,CAPTAINS-CABIN \?CCL63
?CTR62:	PRINTR	"You already are!"
?CCL63:	CALL2	YOULL-HAVE-TO,STR?328
	RSTACK	
?CCL56:	EQUAL?	PRSA,V?TURN \?CCL67
	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL70
	ICALL	PERFORM,V?TURN,WHEEL,PRSI
	RTRUE	
?CCL70:	EQUAL?	SCENE,S-ERASMUS \FALSE
	ICALL1	ARENT-WHERE-PRSO-IS
	FSET?	HENDRIK,DEAD \?CCL75
	PUSH	VINCK
	JUMP	?CND73
?CCL75:	PUSH	HENDRIK
?CND73:	CALL2	FRUSTRATED,STACK
	RSTACK	
?CCL67:	EQUAL?	PRSA,V?REPAIR \?CCL77
	CALL1	MORE-SPECIFIC
	RSTACK	
?CCL77:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	PRINTR	"What an infantile idea."


	.FUNCT	ARENT-WHERE-PRSO-IS:ANY:0:0
	PRINTI	"You aren't on the bridge, where "
	ICALL1	THE-PRINT-PRSO
	PRINTI	" is."
	RTRUE	


	.FUNCT	GANGWAY-F:ANY:0:0
	EQUAL?	PRSA,V?CLIMB-UP \?CCL3
	CALL2	DO-WALK,P?UP
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?CLIMB-DOWN \?CCL5
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?CLIMB-FOO,V?CLIMB-ON \FALSE
	EQUAL?	HERE,AT-ERASMUS,WHARF \?CCL10
	CALL2	DO-WALK,P?UP
	RSTACK	
?CCL10:	EQUAL?	HERE,ON-DECK,MAIN-DECK \FALSE
	CALL2	DO-WALK,P?DOWN
	RSTACK	


	.FUNCT	QUEUE-STORM:ANY:0:0,S,DONE?
	GET	SCENE-LOCS,SCENE
	GETPT	STACK,P?SCORE >S
	GETB	S,0 >S
	CALL1	DONE-BELOW? >DONE?
	LESS?	STORM-DELAY?,0 \?CCL3
	INC	'STORM-DELAY?
	CALL	QUEUE,I-STORM,30
	RSTACK	
?CCL3:	ZERO?	STORM-DELAY? /?CCL5
	FSET?	BELL,SCOREBIT \?CCL5
	GRTR?	S,STORM-DELAY? \?CCL5
	ZERO?	DONE? \?CCL5
	SET	'STORM-DELAY?,S
	ICALL	QUEUE,I-STORM,10
	RFALSE	
?CCL5:	FSET?	HERE,OUTSIDE /?CTR10
	ZERO?	DONE? /?CCL11
?CTR10:	SET	'STORM-DELAY?,S
	ZERO?	REEF-FLAG \?CTR15
	EQUAL?	S,7 \?CCL16
?CTR15:	PUSH	4
	JUMP	?CND14
?CCL16:	FSET?	HERE,OUTSIDE \?CCL20
	ZERO?	DONE? /?CCL20
	PUSH	3
	JUMP	?CND14
?CCL20:	PUSH	9
?CND14:	CALL	QUEUE,I-STORM,STACK
	RSTACK	
?CCL11:	EQUAL?	SHIP-COURSE,P?PORT,P?STARBOARD \?CCL24
	FSET?	WHEEL,RMUNGBIT /?CCL24
	FSET?	HENDRIK,TRYTAKEBIT /?CCL24
	CALL	QUEUE,I-STORM,2
	RSTACK	
?CCL24:	SET	'STORM-DELAY?,S
	ZERO?	REEF-FLAG /?CCL30
	PUSH	7
	JUMP	?CND28
?CCL30:	PUSH	15
?CND28:	CALL	QUEUE,I-STORM,STACK
	RSTACK	


	.FUNCT	I-STORM:ANY:0:0
	CALL1	QUEUE-STORM
	ZERO?	STACK /FALSE
	EQUAL?	SHIP-COURSE,P?FORE /?CND3
	EQUAL?	SHIP-COURSE,P?PORT \?CCL6
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL9
	SET	'SHIP-DIRECTION,P?SW
	JUMP	?CND3
?CCL9:	EQUAL?	SHIP-DIRECTION,P?SW \?CCL11
	SET	'SHIP-DIRECTION,P?SOUTH
	JUMP	?CND3
?CCL11:	EQUAL?	SHIP-DIRECTION,P?NW \?CCL13
	SET	'SHIP-DIRECTION,P?WEST
	JUMP	?CND3
?CCL13:	EQUAL?	SHIP-DIRECTION,P?NORTH \?CND3
	SET	'SHIP-DIRECTION,P?NW
	JUMP	?CND3
?CCL6:	EQUAL?	SHIP-COURSE,P?STARBOARD \?CND3
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL18
	SET	'SHIP-DIRECTION,P?NW
	JUMP	?CND3
?CCL18:	EQUAL?	SHIP-DIRECTION,P?SW \?CCL20
	SET	'SHIP-DIRECTION,P?WEST
	JUMP	?CND3
?CCL20:	EQUAL?	SHIP-DIRECTION,P?NW \?CCL22
	SET	'SHIP-DIRECTION,P?NORTH
	JUMP	?CND3
?CCL22:	EQUAL?	SHIP-DIRECTION,P?SOUTH \?CND3
	SET	'SHIP-DIRECTION,P?SW
?CND3:	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL26
	FSET?	FORESAILS,RMUNGBIT /?CTR28
	EQUAL?	SHIP-Y,1 \?CCL29
	GRTR?	SHIP-X,7 /?CCL29
?CTR28:	DEC	'SHIP-X
	JUMP	?CND24
?CCL29:	SUB	SHIP-X,2 >SHIP-X
	JUMP	?CND24
?CCL26:	EQUAL?	SHIP-DIRECTION,P?SW \?CCL35
	DEC	'SHIP-X
	DEC	'SHIP-Y
	JUMP	?CND24
?CCL35:	EQUAL?	SHIP-DIRECTION,P?NW \?CCL37
	DEC	'SHIP-X
	INC	'SHIP-Y
	JUMP	?CND24
?CCL37:	EQUAL?	SHIP-DIRECTION,P?NORTH,P?SOUTH \?CND24
	ICALL1	SHIP-BROADSIDE
?CND24:	CALL1	REEF-DISTANCE
	ZERO?	STACK \?CND39
	GRTR?	SHIP-X,6 \?CCL43
	CRLF	
	PRINTI	"The waiting spines of the reef tear into the ship!"
	FSET?	HERE,OUTSIDE \?CND44
	PRINTI	"The gap is tantalizingly close, but you missed it."
?CND44:	PRINTI	"Two years out from England, and it ends here in a watery grave."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL43:	EQUAL?	SHIP-X,6 \?CCL47
	CRLF	
	PRINTI	"The ship smashes into the "
	FSET?	HERE,OUTSIDE \?CND48
	PRINTI	"side of the gap in the "
?CND48:	PRINTI	"reef, tearing a huge rent in the hull.Water pours in, and the stern crashes against the rocks"
	FSET?	HERE,OUTSIDE \?CND50
	PRINTI	", throwing you to the deck.Suddenly the mainmast gives way.It's crashing down upon you"
?CND50:	PRINTC	33
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL47:	CRLF	
	FSET?	HERE,OUTSIDE \?CCL54
	PRINTI	"You steer"
	JUMP	?CND52
?CCL54:	PRINTI	"The ship steers"
?CND52:	PRINTI	" directly into the waiting rocks!"
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CND39:	LESS?	SHIP-X,19 \?CND55
	GETP	BLACKTHORNE,P?HEALTH
	ZERO?	STACK \?CND55
	ICALL	QUEUE,I-TIRED-WARNING,5,TRUE-VALUE
	ICALL	QUEUE,I-TIRED,10,TRUE-VALUE
?CND55:	ZERO?	REEF-FLAG \?CND59
	CALL1	REEF-SIGHTED?
	ZERO?	STACK /?CND59
	SET	'REEF-FLAG,TRUE-VALUE
	CRLF	
	FSET?	HERE,OUTSIDE \?CCL64
	IN?	GINSEL,BELOW-DECKS \?CCL67
	PRINTI	"The bow lookout"
	JUMP	?CND65
?CCL67:	PRINTI	"Ginsel, the bow lookout,"
?CND65:	PRINTI	" yells ""Rotz vooruit!""Reef ahead!A foaming line of surf stretches ahead of you, broken intermittently to port!"
	CRLF	
	EQUAL?	HERE,BRIDGE-OF-ERASMUS \TRUE
	FSET?	HENDRIK,RMUNGBIT \TRUE
	FCLEAR	HENDRIK,RMUNGBIT
	CRLF	
	PRINTR	"The yelling wakes Hendrik."
?CCL64:	FCLEAR	HENDRIK,RMUNGBIT
	PRINTI	"Faintly, over the roar of the storm, you hear the terrified cry ""Rotz vooruit!""Reef ahead!"
	EQUAL?	HERE,BELOW-DECKS \?CCL74
	PRINTI	"The crewmen pull themselves painfully from their bunks.""We're dead men!"" screams one."
	IN?	VINCK,HERE \?CCL77
	MOVE	VINCK,ON-DECK
	PRINTR	"""We'd better go above, Pilot,"" urges Vinck as he shuffles toward the door."
?CCL77:	CRLF	
	RTRUE	
?CCL74:	EQUAL?	HERE,CAPTAINS-CABIN \?CCL79
	PRINTR	"""Get out there, Pilot!"" Spillbergen orders you.""We'll all die thanks to you!Out!"""
?CCL79:	PRINTI	"You sense from the terror in the voice that the reefs are close."
	IN?	GINSEL,BELOW-DECKS \?CND80
	PRINTR	"Has the watch been asleep?All too likely!"
?CND80:	CRLF	
	RTRUE	
?CND59:	EQUAL?	SHIP-Y,9 \?CCL84
	EQUAL?	SHIP-X,19 \?CCL84
	ICALL	QUEUE,I-HENDRIK,-1
	FCLEAR	WHEEL,ONBIT
	CRLF	
	PRINTI	"The ship heels in a sudden squall, throwing you "
	FSET?	WHEEL,RMUNGBIT \?CCL89
	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL92
	PRINTR	"from your post at the wheel."
?CCL92:	PRINTR	"to the deck."
?CCL89:	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL95
	PRINTI	"from your post at the wheel, which"
	JUMP	?CND93
?CCL95:	PRINTI	"to the deck.The wheel"
?CND93:	SET	'SHIP-COURSE,P?PORT
	SET	'SHIP-DIRECTION,P?SW
	ICALL	QUEUE,I-BROADSIDE,4
	ICALL	QUEUE,I-SHIP-BROADSIDE,8
	PRINTR	", uncontrolled, begins to turn to port."
?CCL84:	EQUAL?	SHIP-X,18 /?CTR96
	EQUAL?	SHIP-Y,9 \?CCL97
	EQUAL?	SHIP-X,17 \?CCL97
?CTR96:	CRLF	
	PRINTR	"The wind freshens even more, and the ship lurches."
?CCL97:	EQUAL?	SHIP-Y,8 \?CCL103
	EQUAL?	SHIP-X,14 \?CCL103
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"A forepeak halliard snaps, and the highest top gallant spar is carried away into the sea, "
	EQUAL?	SHIP-DIRECTION,P?SW \?CCL111
	PRINTR	"but the ship is now making way parallel to the reef."
?CCL111:	PRINTR	"and the ship continues to approach the waiting reef."
?CCL103:	EQUAL?	SHIP-Y,7 \?CCL113
	EQUAL?	SHIP-X,13 \?CCL113
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	EQUAL?	SHIP-DIRECTION,P?SW \?CCL121
	PRINTR	"The ship runs parallel to the reef, barely staying away from it, and a huge following wave towers over the ship!"
?CCL121:	PRINTR	"The ship is being carried still closer to the reef, and a huge wave is approaching from the starboard side!"
?CCL113:	EQUAL?	SHIP-Y,6 \?CCL123
	EQUAL?	SHIP-X,12 \?CCL123
	EQUAL?	SHIP-DIRECTION,P?SW /?CND126
	FSET	LG-ERASMUS,RMUNGBIT
?CND126:	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"Another halliard gives, block and tackle swinging wildly.The wave breaks over the ship!"
	EQUAL?	SHIP-DIRECTION,P?SW \?CCL133
	PRINTR	"It looks for a moment like you're going to founder, but she shakes it off."
?CCL133:	PRINTR	"The force of the wave drives the ship onto the reef, the sharp rocks tearing into the wooden hull!In what seems like an instant, she's sinking!"
?CCL123:	EQUAL?	SHIP-Y,5 \?CCL135
	EQUAL?	SHIP-X,11 \?CCL135
	FSET	FORESAILS,RMUNGBIT
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	EQUAL?	SHIP-DIRECTION,P?SW \?CCL143
	PRINTR	"Another following sea towers above the ship.The ship is wallowing, and the foresails are torn away by the tempest."
?CCL143:	ICALL2	JIGS-UP,STR?329
	RETURN	M-FATAL
?CCL135:	EQUAL?	SHIP-Y,4 \?CCL145
	EQUAL?	SHIP-X,10 \?CCL145
	FSET	HENDRIK,DEAD
	MOVE	HENDRIK,GENERIC-OBJECTS
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"This wave comes in stronger than the last.Hendrik is caught and lifted, gasping and struggling, into the sea."
	CRLF	
	CRLF	
	PRINTR	"A giant comber throws Hendrik high above the ship, then takes him away and pulps him against a rock spine."
?CCL145:	EQUAL?	SHIP-Y,2 \?CCL152
	EQUAL?	SHIP-X,8 \?CCL152
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINT	STR?326
	CRLF	
	RTRUE	
?CCL152:	EQUAL?	SHIP-Y,2 \?CCL159
	EQUAL?	SHIP-X,6 \?CCL159
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"The gulch through the reef is three points to windward, and you aren't gaining way!You search desperately for another channel but know there is none.The "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" is heading for the rocks starboard of the gap!"
?CCL159:	EQUAL?	SHIP-Y,1 \?CCL166
	EQUAL?	SHIP-X,7 \?CCL166
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTR	"The ship is being swept past the gap in the reef!"
?CCL166:	EQUAL?	SHIP-Y,1 \?CCL173
	EQUAL?	SHIP-X,5 \?CCL173
	EQUAL?	HERE,BRIDGE-OF-ERASMUS,ON-DECK \?CCL178
	MOVE	VINCK,HERE
	JUMP	?CND176
?CCL178:	MOVE	VINCK,BRIDGE-OF-ERASMUS
?CND176:	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"The ship is gaining way, helped by the fall off from the wind.You are holding course parallel to the reef and approaching a narrow gap which heads to starboard."
	CRLF	
	CRLF	
	PRINTR	"You see Vinck making his way up the companionway to the bridge."
?CCL173:	EQUAL?	SHIP-Y,1 \?CCL183
	EQUAL?	SHIP-X,4 \?CCL183
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL183
	CRLF	
	PRINTI	"There is a wailing, tormented shudder as the keel scrapes the razor spines of the reef below!"
	FSET?	WHEEL,RMUNGBIT /FALSE
	SET	'WHEEL-SPINNING?,TRUE-VALUE
	ICALL2	DEQUEUE,I-BROADSIDE
	FSET?	WHEEL,ONBIT \?CCL192
	FCLEAR	WHEEL,ONBIT
	FSET?	HERE,OUTSIDE \FALSE
	PRINTI	"The"
	PRINT	STR?330
	CRLF	
	RTRUE	
?CCL192:	PRINTR	"The wheel begins spinning wildly!"
?CCL183:	EQUAL?	SHIP-Y,1 \?CCL197
	EQUAL?	SHIP-X,3 \?CCL197
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL197
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"The ship is sucked into a narrow vortex between the rocks."
	FSET?	WHEEL,ONBIT /?CND204
	FSET?	WHEEL,RMUNGBIT /?CND204
	PRINTI	"The wheel spins from side to side, out of control!"
?CND204:	FSET	FORESAILS,TRYTAKEBIT
	PRINTR	"The bowsprit catches a rock and is torn loose!The foremast snaps!The men on deck fall on the rigging with axes and cut it adrift as the ship founders down the channel."
?CCL197:	EQUAL?	SHIP-Y,1 \?CCL209
	EQUAL?	SHIP-X,2 \?CCL209
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL209
	FSET?	WHEEL,ONBIT /?CCL215
	FSET?	WHEEL,RMUNGBIT /?CCL215
	CRLF	
	ICALL2	JIGS-UP,STR?331
	RETURN	M-FATAL
?CCL215:	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTR	"The ship is pulled by the waves deeper into the strait, and then pushed back by the return, but she's making some progress."
?CCL209:	EQUAL?	SHIP-Y,1 \?CCL221
	EQUAL?	SHIP-X,1 \?CCL221
	EQUAL?	SHIP-DIRECTION,P?WEST \?CCL221
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTR	"For an instant, the strait broadens.Ahead, it narrows ominously and turns to port."
?CCL221:	ZERO?	SHIP-Y \FALSE
	ZERO?	SHIP-X \FALSE
	EQUAL?	SHIP-DIRECTION,P?SW \FALSE
	ICALL2	DEQUEUE,I-STORM
	FSET?	HERE,OUTSIDE \FALSE
	CRLF	
	PRINTI	"The sea race quickens.The ship is in the neck and dead, but then the keel scrapes a mud shoal, and the shock turns her head.The rudder bites into the sea, the wind and sea join to help, and before the wind she speeds through the pass to safety.Into the bay beyond."
	CRLF	
	IN?	COMPASS,BLACKTHORNE \?CND236
	REMOVE	COMPASS
?CND236:	IN?	QUILL,BLACKTHORNE \?CND238
	REMOVE	QUILL
?CND238:	REMOVE	APPLE
	ICALL2	SCORE-OBJECT,REEF
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	REEF-SIGHTED?:ANY:0:0
	ZERO?	REEF-FLAG \FALSE
	GRTR?	REEF-X,2 \TRUE
	GRTR?	REEF-Y,2 /FALSE
	RTRUE	


	.FUNCT	REEF-DISTANCE:ANY:0:0,?TMP1
	SET	'REEF-X,0
	SET	'REEF-Y,0
	ZERO?	SHIP-X \?CCL3
	ZERO?	SHIP-Y \FALSE
	SET	'REEF-X,1000
	SET	'REEF-Y,1000
	JUMP	?CND1
?CCL3:	ZERO?	SHIP-Y \?CCL8
	GRTR?	SHIP-X,0 \?CCL8
	LESS?	SHIP-X,7 /FALSE
?CCL8:	EQUAL?	SHIP-Y,1 \?CCL13
	EQUAL?	SHIP-X,6 /FALSE
?CCL13:	EQUAL?	SHIP-Y,0,1 \?CCL17
	EQUAL?	SHIP-X,7 \?CCL17
	SET	'REEF-X,1
	SUB	3,SHIP-Y >REEF-Y
	JUMP	?CND1
?CCL17:	EQUAL?	SHIP-Y,1 \?CCL21
	GRTR?	SHIP-X,5 /?CCL21
	SET	'REEF-X,SHIP-X
	SET	'REEF-Y,1
	JUMP	?CND1
?CCL21:	GRTR?	SHIP-Y,1 /?CCL25
	LESS?	SHIP-X,7 /FALSE
	SUB	SHIP-X,6 >REEF-X
	SUB	0,SHIP-Y >?TMP1
	SUB	SHIP-X,4
	ADD	?TMP1,STACK >REEF-Y
	JUMP	?CND1
?CCL25:	LESS?	SHIP-Y,11 /?CCL30
	SUB	SHIP-X,15 >REEF-X
	GRTR?	SHIP-X,15 \?CCL33
	SET	'REEF-Y,1000
	JUMP	?CND1
?CCL33:	SET	'REEF-Y,0
	JUMP	?CND1
?CCL30:	EQUAL?	SHIP-Y,2 \?CCL35
	EQUAL?	SHIP-X,6,7 \?CCL35
	SUB	SHIP-X,5 >REEF-X
	SET	'REEF-Y,1
	JUMP	?CND1
?CCL35:	LESS?	SHIP-Y,2 /?CND1
	SUB	SHIP-X,6 >?TMP1
	SUB	SHIP-Y,2
	SUB	?TMP1,STACK >REEF-X
	SUB	SHIP-X,4
	SUB	STACK,SHIP-Y >REEF-Y
?CND1:	GRTR?	REEF-X,0 \?CTR40
	GRTR?	REEF-Y,0 /TRUE
?CTR40:	SET	'REEF-X,0
	SET	'REEF-Y,0
	RFALSE	


	.FUNCT	CREWMEN-DESC:ANY:0:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	HERE,BELOW-DECKS,VILLAGE-SQUARE /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	EQUAL?	HERE,BELOW-DECKS \?CCL11
	ZERO?	CREW-ON-DECK? /?CCL14
	PRINTI	"A few of the worst-off crewmen are still here."
	RTRUE	
?CCL14:	ZERO?	REEF-FLAG /?CCL16
	PRINTI	"Most of the surviving crewmen are preparing to go on deck."
	RTRUE	
?CCL16:	PRINTI	"Most of the survivors of the crew are here in bunks and hammocks, some sleeping, some awake."
	RTRUE	
?CCL11:	EQUAL?	HERE,VILLAGE-SQUARE \FALSE
	PRINTI	"The rabble of the ship's crew kneel behind you, guards watching them."
	RTRUE	


	.FUNCT	LG-CREWMEN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	SCENE,S-ERASMUS,S-YABU \?CCL5
	EQUAL?	RARG,M-WINNER \?CCL8
	EQUAL?	HERE,PILOTS-CABIN,CAPTAINS-CABIN,PASSAGEWAY /?CTR10
	EQUAL?	HERE,BELOW-DECKS \?CCL11
	ZERO?	CREW-ON-DECK? /?CCL11
?CTR10:	PRINTR	"There are no crewmen here."
?CCL11:	EQUAL?	PRSA,V?WHO \?CCL17
	EQUAL?	PRSO,YOU \?CCL17
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?WHO,CREWMEN
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL17:	EQUAL?	HERE,BELOW-DECKS,MATES-CABIN \?CCL21
	PRINT	STR?332
	CRLF	
	RTRUE	
?CCL21:	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER /?PRD25
	EQUAL?	PRSA,V?REPLACE \?CCL23
?PRD25:	EQUAL?	PRSO,FORESAILS /FALSE
?CCL23:	IN?	VINCK,HERE \?CCL29
	EQUAL?	PRSA,V?HELP \?CCL29
	EQUAL?	PRSA,V?TAKE \?CCL29
	EQUAL?	PRSO,WHEEL \?CCL29
	SET	'WINNER,VINCK
	ICALL	PERFORM,PRSA,PRSO,PRSI
	RTRUE	
?CCL29:	EQUAL?	HERE,BELOW-DECKS \?CCL35
	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL35
	PRINTR	"The crewmen mutter among themselves, but no one moves."
?CCL35:	CALL2	CURSES-IN,STR?333
	RSTACK	
?CCL8:	EQUAL?	PRSA,V?EXAMINE,V?WHO \?CCL39
	ICALL	LIST-PEOPLE,CREWMAN?,STR?334,STR?335
	EQUAL?	HERE,BELOW-DECKS \?CCL42
	IN?	VINCK,BELOW-DECKS \?CCL45
	IN?	GINSEL,BELOW-DECKS \?CCL48
	IN?	MAETSUKKER,BELOW-DECKS \?CCL51
	PRINTI	"Vinck, Ginsel, and Maetsukker are"
	JUMP	?CND43
?CCL51:	PRINTI	"Vinck and Ginsel are"
	JUMP	?CND43
?CCL48:	IN?	MAETSUKKER,BELOW-DECKS \?CCL53
	PRINTI	"Vinck and Maetsukker are"
	JUMP	?CND43
?CCL53:	PRINTI	"Vinck is"
	JUMP	?CND43
?CCL45:	IN?	GINSEL,BELOW-DECKS \?CCL55
	IN?	MAETSUKKER,BELOW-DECKS \?CCL58
	PRINTI	"Ginsel and Maetsukker are"
	JUMP	?CND43
?CCL58:	PRINTI	"Ginsel is"
	JUMP	?CND43
?CCL55:	IN?	MAETSUKKER,BELOW-DECKS \?CCL60
	PRINTI	"Maetsukker is"
?CND43:	PRINTR	" in the best condition, although everyone is badly off."
?CCL60:	CRLF	
	RTRUE	
?CCL42:	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL62
	PRINTC	11
	ICALL	LIST-PEOPLE,CREWMAN?,STR?334,STR?335,ON-DECK,STR?336
	JUMP	?CND40
?CCL62:	EQUAL?	HERE,ON-DECK \?CND40
	PRINTC	11
	ICALL	LIST-PEOPLE,CREWMAN?,STR?334,STR?335,BRIDGE-OF-ERASMUS,STR?337
?CND40:	CRLF	
	RTRUE	
?CCL39:	EQUAL?	PRSA,V?TELL \?CCL65
	ZERO?	CREW-ON-DECK? /?CCL65
	EQUAL?	HERE,BRIDGE-OF-ERASMUS,ON-DECK /FALSE
?CCL65:	CALL1	CREW-HERE?
	ZERO?	STACK \?CCL70
	PRINT	STR?338
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL70:	EQUAL?	HERE,BELOW-DECKS \?CCL75
	EQUAL?	PRSA,V?SEND \?CCL75
	PRINT	STR?332
	CRLF	
	RTRUE	
?CCL75:	EQUAL?	PRSA,V?WAKE \FALSE
	EQUAL?	HERE,BELOW-DECKS \FALSE
	PRINTR	"You cuff a few of the sleepers into wakefulness, but most are too far gone to do more than curse feebly."
?CCL5:	EQUAL?	SCENE,S-PIT \?CCL83
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"They look scared."
?CCL83:	EQUAL?	SCENE,S-RODRIGUES \?CCL88
	PRINTR	"There are no longer any crewmen aboard."
?CCL88:	EQUAL?	SCENE,S-VOYAGE \?CCL90
	EQUAL?	RARG,M-WINNER \FALSE
	EQUAL?	PRSA,V?DROP,V?THROW,V?PUT /?PRD98
	EQUAL?	PRSA,V?LOWER \?CCL96
?PRD98:	EQUAL?	PRSO,ANCHOR /FALSE
?CCL96:	CALL2	CURSES-IN,STR?339
	RSTACK	
?CCL90:	EQUAL?	SCENE,S-MARIKO \FALSE
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \FALSE
	ICALL2	CTHE-PRINT,LG-CREWMEN
	PRINTI	" aren't here."
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL


	.FUNCT	CURSES-IN:ANY:1:1,L
	PRINTI	"The only responses are muttered curses in "
	PRINT	L
	PRINTR	"."


	.FUNCT	CREW-HERE?:ANY:0:0,F
	FIRST?	HERE >F /?PRG2
?PRG2:	ZERO?	F /FALSE
	EQUAL?	F,CREWMEN /?CND4
	FSET?	F,DUTCHBIT /TRUE
?CND4:	NEXT?	F >F /?PRG2
	JUMP	?PRG2


	.FUNCT	HENDRIK-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	FSET?	HENDRIK,RMUNGBIT /TRUE
	FSET?	HENDRIK,TRYTAKEBIT /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Hendrik Specz "
	FSET?	HENDRIK,RMUNGBIT \?CCL13
	PRINTI	"is asleep at"
	JUMP	?CND11
?CCL13:	PRINTI	"has"
?CND11:	PRINTI	" the wheel."
	RTRUE	


	.FUNCT	HENDRIK-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?FOLLOW,V?WALK,V?WALK-TO /?CTR7
	EQUAL?	PRSA,V?WALK-UNDER \?CCL8
?CTR7:	FSET?	WHEEL,ONBIT \?CCL13
	PRINTR	"""Pilot, it's my watch.Let me take the wheel.You must rest."""
?CCL13:	PRINTR	"""One of us must stay and hold the God-cursed wheel, or we all die!"""
?CCL8:	EQUAL?	PRSA,V?TAKE-OVER \?PRD17
	EQUAL?	PRSO,FALSE-VALUE,WHEEL,DECK /?CTR14
?PRD17:	EQUAL?	PRSA,V?TAKE,V?TURN \?CCL15
	EQUAL?	PRSO,WHEEL,DECK \?CCL15
?CTR14:	FSET	HENDRIK,TRYTAKEBIT
	ICALL1	HENDRIK-TAKES-WHEEL
	PRINTR	"""Aye, Pilot, I take the wheel."""
?CCL15:	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER \?CCL23
	EQUAL?	PRSO,FORESAILS /FALSE
?CCL23:	EQUAL?	PRSO,WHEEL \?CCL27
	PRINTR	"""If you want the wheel, take it,"" snarls Hendrik."
?CCL27:	EQUAL?	PRSA,V?SHUT-UP \?PRD31
	EQUAL?	PRSO,ROOMS /?CTR28
?PRD31:	EQUAL?	PRSA,V?BE \?CCL29
	EQUAL?	PRSO,INTADJ \?CCL29
	GET	PARSE-RESULT,11
	EQUAL?	STACK,W?QUIET \?CCL29
?CTR28:	PRINTR	"""We'll all be quiet soon enough!"""
?CCL29:	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CCL38
	EQUAL?	PRSO,JAPAN \?CCL41
	PRINTR	"""You're the one who said it's here.Between latitudes thirty and forty north, you said.Well, I don't see it."""
?CCL41:	EQUAL?	PRSO,SPILLBERGEN \?CCL43
	PRINTR	"""He's a maggot-eaten fool and we'll all be dead because of him."""
?CCL43:	PRINTR	"He doesn't answer."
?CCL38:	CALL1	I-DONT-KNOW?
	ZERO?	STACK /?CCL45
	PRINTR	"""You don't know?You're the God-cursed Pilot, you'd better know!"""
?CCL45:	PRINTR	"Hendrik's reply is a mixture of whining and curses."
?CCL5:	EQUAL?	PRSA,V?TELL \?CCL47
	FSET?	HENDRIK,RMUNGBIT \FALSE
	PRINTI	"Hendrik is asleep."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL47:	EQUAL?	PRSA,V?EXAMINE \?CCL52
	PRINTR	"Hendrik, like all the crew members, is suffering from scurvy.His face is gray, his eyes are sunken, and his skin is blotched and sallow.He is dying."
?CCL52:	EQUAL?	PRSA,V?GIVE \?CCL54
	FSET?	HENDRIK,RMUNGBIT \?CCL57
	CALL2	YOULL-HAVE-TO,STR?340
	RSTACK	
?CCL57:	EQUAL?	PRSO,WHEEL \FALSE
	SET	'WINNER,HENDRIK
	ICALL	PERFORM,V?TAKE,WHEEL
	SET	'WINNER,PLAYER
	RTRUE	
?CCL54:	EQUAL?	PRSA,V?SOOTHE \?CCL61
	PRINTR	"He remains skeptical, muttering quietly to himself."
?CCL61:	CALL1	HOSTILE-VERB?
	ZERO?	STACK \?CCL63
	EQUAL?	PRSA,V?WAKE \FALSE
	FSET?	PRSO,RMUNGBIT \FALSE
?CCL63:	FSET?	PRSO,RMUNGBIT \?CCL70
	FCLEAR	PRSO,RMUNGBIT
	PRINTI	"You awaken Hendrik."
	ZERO?	REEF-FLAG /?CCL73
	PRINTR	"""We're lost,"" he screams.""Oh, Lord Jesus help us!"""
?CCL73:	PRINTR	"""I wasn't asleep,"" he says, sheepishly."
?CCL70:	PRINTR	"You realize it's only your fatigue making you want to hurt him, and refrain."


	.FUNCT	I-HENDRIK:ANY:0:0
	INC	'HENDRIK-CNT
	EQUAL?	HENDRIK-CNT,1 \?CCL5
	MOVE	HENDRIK,HERE
	CRLF	
	PRINTI	"Hendrik Specz, the third mate, appears on deck, pulling himself painfully up the gangway."
	ICALL2	THIS-IS-IT,HENDRIK
	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL8
	PRINTR	"He joins you on the bridge.""Go below, Pilot.I take this watch if it pleases you.""Gray with fatigue, he leans heavily against the binnacle and retches.""Blessed Lord Jesus help me!"""
?CCL8:	PRINTR	"""God curse you, Pilot!Have you gone mad at last!No one is at the wheel!We'll head onto the reef, God rot your bones!"""
?CCL5:	EQUAL?	HENDRIK-CNT,2 \?CCL10
	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL13
	MOVE	HENDRIK,HERE
	SET	'QCONTEXT,HENDRIK
	CRLF	
	PRINTR	"""Where's the landfall you promised us?Where's the Japans?Where is it, I ask?"""
?CCL13:	EQUAL?	HERE,ON-DECK \FALSE
	FSET?	WHEEL,RMUNGBIT /?CCL18
	FSET?	WHEEL,ONBIT /?CCL18
	FSET?	HENDRIK,TRYTAKEBIT /?CCL18
	CRLF	
	PRINTI	"""You'll drown us all, you crazy Englishman!"" Hendrik screams"
	IN?	HENDRIK,BRIDGE-OF-ERASMUS /?CCL24
	MOVE	HENDRIK,BRIDGE-OF-ERASMUS
	PRINTR	" as he rushes to the bridge."
?CCL24:	PRINTR	"."
?CCL18:	CRLF	
	PRINT	STR?341
	CRLF	
	RTRUE	
?CCL10:	EQUAL?	HENDRIK-CNT,3 \?CCL26
	SET	'QCONTEXT,FALSE-VALUE
	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL29
	MOVE	HENDRIK,HERE
	CRLF	
	PRINTI	"""Perhaps there is no Japans,"" Hendrik mutters scornfully.""It's just a "
	ICALL2	PRINTUNDER,STR?342
	PRINTR	" legend."""
?CCL29:	EQUAL?	HERE,ON-DECK \FALSE
	CRLF	
	PRINT	STR?341
	CRLF	
	RTRUE	
?CCL26:	EQUAL?	HENDRIK-CNT,4 \FALSE
	ICALL2	DEQUEUE,I-HENDRIK
	MOVE	HENDRIK,BRIDGE-OF-ERASMUS
	FSET?	WHEEL,RMUNGBIT /?CND34
	FSET?	WHEEL,ONBIT /?CND34
	FSET?	HENDRIK,TRYTAKEBIT /?CND34
	ICALL1	HENDRIK-SAVES-THE-DAY
?CND34:	FSET?	HERE,OUTSIDE \?CND39
	EQUAL?	HERE,ON-DECK /?CND39
	ICALL	QUEUE,I-TIRED-WARNING,4,TRUE-VALUE
	ICALL	QUEUE,I-TIRED,8,TRUE-VALUE
?CND39:	CRLF	
	PRINTI	"You are tired, deathly tired, and near starving."
	IN?	VINCK,BELOW-DECKS /?CCL44
	IN?	GINSEL,BELOW-DECKS /?CCL44
	IN?	MAETSUKKER,BELOW-DECKS \?CND43
?CCL44:	IN?	VINCK,BELOW-DECKS \?CCL50
	IN?	GINSEL,BELOW-DECKS \?CCL50
	IN?	MAETSUKKER,BELOW-DECKS \?CCL50
	PRINTI	"With a start, you realize it's time to "
	FSET?	HERE,OUTSIDE \?CND54
	PRINTI	"go below and "
?CND54:	PRINTI	"send out replacements for the men on watch, by now freezing and windburned."
	JUMP	?CND43
?CCL50:	PRINTI	"You know more men are needed on watch."
?CND43:	GETP	BLACKTHORNE,P?HEALTH
	ZERO?	STACK \?CND56
	PRINTI	"It's past time to eat some of your meager cache of food; a few shrivelled apples."
?CND56:	FSET?	FLAGON,SCOREBIT \?CND58
	PRINTI	"Time, too, for the unpleasant task of visiting Captain Spillbergen, still in nominal command but deathly sick, confined to his cabin."
?CND58:	FSET?	RUTTER,SCOREBIT \?CND60
	PRINTR	"It's also time to write in your rutter, though God knows there is nothing new since yesterday; nothing, that is, but death."
?CND60:	CRLF	
	RTRUE	


	.FUNCT	HENDRIK-TAKES-WHEEL:ANY:0:0
	FSET	HENDRIK,TRYTAKEBIT
	SET	'SHIP-COURSE,P?FORE
	SET	'SHIP-DIRECTION,P?WEST
	ICALL2	DEQUEUE,I-BROADSIDE
	CALL2	DEQUEUE,I-SHIP-BROADSIDE
	RSTACK	


	.FUNCT	HENDRIK-SAVES-THE-DAY:ANY:0:0
	FCLEAR	WHEEL,SCOREBIT
	ICALL1	HENDRIK-TAKES-WHEEL
	EQUAL?	HERE,ON-DECK,BRIDGE-OF-ERASMUS \FALSE
	CRLF	
	PRINTR	"Hendrik grabs the wheel, muttering vile curses on you and your kin."


	.FUNCT	MAETSUKKER-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER \?CCL8
	EQUAL?	PRSO,FORESAILS /FALSE
?CCL8:	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL12
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,MAETSUKKER,ROOMS
	RTRUE	
?CCL12:	PRINTR	"Maetsukker makes an almost inaudible remark about your mother."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL14
	PRINTR	"Maetsukker is a small, sharp-featured man.He is in better shape than most of the crew members."
?CCL14:	EQUAL?	PRSA,V?SEND \?CCL16
	EQUAL?	PRSO,MAETSUKKER \?CCL16
	EQUAL?	SCENE,S-ERASMUS \?CCL16
	EQUAL?	HERE,BELOW-DECKS /?CCL22
	PRINTR	"""I'm already on watch, Pilot!"" he snarls."
?CCL22:	FSET?	MAETSUKKER,RMUNGBIT /?CCL24
	FSET	MAETSUKKER,RMUNGBIT
	PRINTR	"""I'm near death,"" the small, sharp-featured man says, and cringes away from you.""I'm sick.Look, the scurvy's taken all my teeth.Take someone else!""Other members of the crew take up the refrain.They are all sick, all scurvied, all tired unto death."
?CCL24:	PRINTR	"""I'm a merchant, not a seaman!I'm not part of the crew!Take someone else!""Other crewmen nod in agreement.None of them want to go on deck if they can avoid it."
?CCL16:	EQUAL?	PRSA,V?TAKE /?CCL26
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL26:	EQUAL?	HERE,BELOW-DECKS /?CCL31
	PRINTR	"The two of you begin fighting, but before you can do any damage, the other crewmen pull you apart."
?CCL31:	FSET?	MAETSUKKER,RMUNGBIT \?CCL33
	MOVE	MAETSUKKER,ON-DECK
	PRINTI	"Maetsukker screams as you "
	EQUAL?	PRSA,V?KICK \?CCL36
	PRINTI	"kick him like a dog and then "
	JUMP	?CND34
?CCL36:	EQUAL?	PRSA,V?HIT,V?SWING \?CCL38
	PRINTI	"punch him in the stomach and then "
	JUMP	?CND34
?CCL38:	EQUAL?	PRSA,V?BITE \?CND34
	PRINTI	"growl, baring your teeth, and then "
?CND34:	PRINTI	"jerk him to his feet.Blood flecks his mouth as he pulls the door open and flees in agony.The other crewmen grumble, but seem to accept this assertion of your authority."
	CRLF	
	IN?	GINSEL,ON-DECK \TRUE
	IN?	VINCK,ON-DECK \TRUE
	ICALL1	RESTART-STORM?
	ICALL2	SCORE-OBJECT,MAETSUKKER
	RTRUE	
?CCL33:	PRINTR	"You have no reason to attack Maetsukker."


	.FUNCT	GINSEL-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER \?CCL8
	EQUAL?	PRSO,FORESAILS /FALSE
?CCL8:	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL12
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,GINSEL,ROOMS
	RTRUE	
?CCL12:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL14
	PRINTR	"He looks at you as though you are crazy."
?CCL14:	PRINTR	"Ginsel nods weakly."
?CCL5:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL19
	PRINTR	"Ginsel is a tall, good-looking youth with short arms and very bowed legs.He has lost all his teeth to scurvy and looks very weak."
?CCL19:	EQUAL?	PRSA,V?SEND \FALSE
	EQUAL?	PRSO,GINSEL \FALSE
	MOVE	GINSEL,ON-DECK
	PRINTI	"""Ginsel, you're bow lookout,"" you say quietly.
""Yes, sir.""Ginsel pulls himself upright and stumbles out."
	CRLF	
	IN?	MAETSUKKER,ON-DECK \TRUE
	IN?	VINCK,ON-DECK \TRUE
	ICALL1	RESTART-STORM?
	ICALL2	SCORE-OBJECT,MAETSUKKER
	RTRUE	


	.FUNCT	BRIDGE-OF-ERASMUS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL2	DRESS-BLACKTHORNE,TRUE-VALUE
	MOVE	COMPASS,BLACKTHORNE
	PUTP	BLACKTHORNE,P?HEALTH,0
	SET	'SHIP-COURSE,P?FORE
	SET	'SHIP-DIRECTION,P?WEST
	ICALL	QUEUE,I-BROADSIDE,4
	ICALL	QUEUE,I-SHIP-BROADSIDE,8
	SET	'STORM-DELAY?,-2
	CALL	QUEUE,I-STORM,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"This is the bridge of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	", a Dutch merchant and privateer.The "
	FSET?	WHEEL,RMUNGBIT \?CCL8
	PRINTI	"securely lashed"
	JUMP	?CND6
?CCL8:	PRINTI	"unlashed"
?CND6:	PRINTI	" wheel is directly forward of you, a sea chair is lashed to the deck aft of the wheel, and the ship's bell is hanging here."
	CALL2	QUEUED?,I-STORM
	ZERO?	STACK /?CND9
	PRINTR	"Spray blows past in an angry torrent."
?CND9:	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-ENTER \?CCL12
	EQUAL?	SCENE,S-ERASMUS \TRUE
	FSET?	HENDRIK,RMUNGBIT /TRUE
	FSET?	BELL,SCOREBIT \TRUE
	FSET?	PASSAGEWAY,TOUCHBIT /?CCL14
	FSET?	BELOW-DECKS,TOUCHBIT \TRUE
?CCL14:	FSET	HENDRIK,RMUNGBIT
	FSET	WHEEL,RMUNGBIT
	PRINTI	"As you climb onto the bridge, you see that Hendrik has fallen asleep at his post.At least the wheel is lashed in place."
	CRLF	
	CRLF	
	RTRUE	
?CCL12:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?LISTEN \?CCL25
	EQUAL?	PRSO,FALSE-VALUE \?CCL25
	ICALL	PERFORM,V?LISTEN,WIND
	RTRUE	
?CCL25:	EQUAL?	PRSA,V?WALK \?CCL29
	EQUAL?	P-WALK-DIR,P?DOWN,P?FORE \?CCL29
	FSET?	WHEEL,RMUNGBIT /?CCL29
	FSET?	WHEEL,ONBIT /?CCL29
	IN?	HENDRIK,BRIDGE-OF-ERASMUS \?CTR28
	FSET?	HENDRIK,TRYTAKEBIT /?CCL29
?CTR28:	IN?	HENDRIK,BRIDGE-OF-ERASMUS \?CCL39
	FSET?	HENDRIK,TRYTAKEBIT /?CCL39
	PRINTI	"Hendrik grabs for the wheel as you leave.""Curse you, Pilot!Someone has to hold the course!"""
	JUMP	?CND37
?CCL39:	PRINTI	"As you climb down to the deck, you see the wheel spinning uncontrolled."
?CND37:	CRLF	
	CRLF	
	RFALSE	
?CCL29:	EQUAL?	PRSA,V?TURN \?CCL43
	EQUAL?	PRSO,INTDIR \?CCL43
	ICALL	PERFORM,V?TURN,WHEEL,INTDIR
	RTRUE	
?CCL43:	EQUAL?	PRSA,V?TAKE-OVER \?CCL47
	EQUAL?	PRSO,FALSE-VALUE \?CCL47
	ICALL	PERFORM,V?TAKE-OVER,WHEEL
	RTRUE	
?CCL47:	EQUAL?	PRSA,V?SHRUG \?CCL51
	IN?	HENDRIK,HERE \?CCL51
	PRINTR	"Hendrik's reaction is unprintable."
?CCL51:	EQUAL?	PRSA,V?LOOK-UP \FALSE
	EQUAL?	PRSO,ROOMS \FALSE
	ICALL	PERFORM,V?EXAMINE,FORESAILS
	RTRUE	


	.FUNCT	DONE-BELOW?:ANY:0:0
	FSET?	ROPER,SCOREBIT /FALSE
	FSET?	APPLE,SCOREBIT /FALSE
	FSET?	KEY,SCOREBIT /FALSE
	FSET?	RUTTER,SCOREBIT /FALSE
	FSET?	CAPTAINS-DESK,SCOREBIT /FALSE
	FSET?	FLAGON,SCOREBIT /FALSE
	FSET?	MAETSUKKER,SCOREBIT \TRUE
	RFALSE	


	.FUNCT	RESTART-STORM?:ANY:0:0
	CALL1	DONE-BELOW?
	ZERO?	STACK /FALSE
	SET	'STORM-DELAY?,0
	ICALL	QUEUE,I-STORM,2
	RTRUE	


	.FUNCT	BELL-F:ANY:0:0
	EQUAL?	PRSA,V?RING \FALSE
	PRINTI	"You ring the bell.""All hands on deck!"" you yell."
	EQUAL?	SCENE,S-ERASMUS \?CCL6
	ICALL	QUEUE,I-HANDS,2
	IN?	HENDRIK,BRIDGE-OF-ERASMUS \?CND7
	FSET?	HENDRIK,RMUNGBIT \?CND7
	FCLEAR	HENDRIK,RMUNGBIT
	PRINTI	"The noise wakes Hendrik.""We're lost,"" he screams.""Oh, Lord Jesus help us!"""
?CND7:	CRLF	
	ZERO?	REEF-FLAG /TRUE
	FSET?	BELL,SCOREBIT \TRUE
	ICALL2	SCORE-OBJECT,BELL
	RTRUE	
?CCL6:	CRLF	
	RTRUE	


	.FUNCT	MOVE-CREW:ANY:1:2,RM,NDESC?
	ZERO?	RM \?CCL3
	REMOVE	CREWMEN
	REMOVE	HENDRIK
	REMOVE	VINCK
	REMOVE	MAETSUKKER
	REMOVE	GINSEL
	REMOVE	SPILLBERGEN
	REMOVE	VAN-NEKK
	REMOVE	CROOCQ
	REMOVE	SONK
	REMOVE	ROPER
	REMOVE	PIETERZOON
	REMOVE	SALAMON
	RTRUE	
?CCL3:	SET	'CREW-ON-DECK?,TRUE-VALUE
	EQUAL?	RM,VILLAGE-SQUARE,PIT \?CND4
	MOVE	PIETERZOON,RM
	ZERO?	NDESC? /?CCL8
	FSET	PIETERZOON,NDESCBIT
	JUMP	?CND6
?CCL8:	FCLEAR	PIETERZOON,NDESCBIT
?CND6:	MOVE	ROPER,RM
	ZERO?	NDESC? /?CCL11
	FSET	ROPER,NDESCBIT
	JUMP	?CND9
?CCL11:	FCLEAR	ROPER,NDESCBIT
?CND9:	MOVE	SONK,RM
	ZERO?	NDESC? /?CCL14
	FSET	SONK,NDESCBIT
	JUMP	?CND12
?CCL14:	FCLEAR	SONK,NDESCBIT
?CND12:	MOVE	SALAMON,RM
	ZERO?	NDESC? /?CCL17
	FSET	SALAMON,NDESCBIT
	JUMP	?CND4
?CCL17:	FCLEAR	SALAMON,NDESCBIT
?CND4:	MOVE	VINCK,RM
	ZERO?	NDESC? /?CCL20
	FSET	VINCK,NDESCBIT
	JUMP	?CND18
?CCL20:	FCLEAR	VINCK,NDESCBIT
?CND18:	MOVE	CROOCQ,RM
	ZERO?	NDESC? /?CCL23
	FSET	CROOCQ,NDESCBIT
	JUMP	?CND21
?CCL23:	FCLEAR	CROOCQ,NDESCBIT
?CND21:	MOVE	GINSEL,RM
	ZERO?	NDESC? /?CCL26
	FSET	GINSEL,NDESCBIT
	JUMP	?CND24
?CCL26:	FCLEAR	GINSEL,NDESCBIT
?CND24:	MOVE	MAETSUKKER,RM
	ZERO?	NDESC? /?CCL29
	FSET	MAETSUKKER,NDESCBIT
	JUMP	?CND27
?CCL29:	FCLEAR	MAETSUKKER,NDESCBIT
?CND27:	MOVE	VAN-NEKK,RM
	ZERO?	NDESC? /?CCL32
	FSET	VAN-NEKK,NDESCBIT
	JUMP	?CND30
?CCL32:	FCLEAR	VAN-NEKK,NDESCBIT
?CND30:	EQUAL?	RM,VILLAGE-SQUARE,PIT \?CND33
	MOVE	SPILLBERGEN,RM
?CND33:	MOVE	CREWMEN,RM
	RTRUE	


	.FUNCT	I-HANDS:ANY:0:0
	ZERO?	CREW-ON-DECK? \FALSE
	CRLF	
	PRINTI	"The noise of the bell and your yelling have aroused the crew and they pull themselves out onto the deck."
	ZERO?	REEF-FLAG /?CCL6
	ICALL2	MOVE-CREW,ON-DECK
	PRINTR	"They are terrified when they see the encroaching reef, most are panicked and don't know what to do next, but a few with their last reserves of strength try ineffectually to get the ship under control."
?CCL6:	PRINTR	"They sullenly look around, see that there is no danger, and muttering curses, return below, oblivious to your entreaties."


	.FUNCT	SEA-CHAIR-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?WALK \?CCL6
	CALL2	YOULL-HAVE-TO,STR?345
	RSTACK	
?CCL6:	EQUAL?	PRSA,V?STAND \FALSE
	ICALL1	B-STAND
	MOVE	WINNER,HERE
	PRINTR	"You rise to your feet."
?CCL3:	EQUAL?	PRSA,V?BOARD,V?SIT \FALSE
	IN?	WINNER,SEA-CHAIR /FALSE
	MOVE	WINNER,SEA-CHAIR
	ICALL1	B-SIT
	PRINTR	"You are now sitting in the sea chair."


	.FUNCT	FOCSLE-DOOR-F:ANY:0:0
	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	EQUAL?	SCENE,S-ANJIRO \FALSE
	ICALL	PERFORM,V?RUB,RIBBON
	RTRUE	


	.FUNCT	BELOW-DECKS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"The crew's quarters of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	".A companionway leads up to the deck.It's dim, warm and close here, and the stench is abominable."
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL5
	EQUAL?	SCENE,S-ERASMUS \TRUE
	EQUAL?	OHERE,ON-DECK \TRUE
	ZERO?	CREW-ON-DECK? \TRUE
	CALL2	DEQUEUE,I-TIRED >TIRED-TIME
	FCLEAR	FOCSLE-DOOR,OPENBIT
	ICALL2	THIS-IS-IT,CREWMEN
	ZERO?	REEF-FLAG /?CCL13
	PRINTI	"As you enter, you see the men resignedly preparing to go on deck."
	CRLF	
	CRLF	
	RTRUE	
?CCL13:	PRINTI	"As you enter, a volley of feeble curses greets you.You close the door and they subside.No one moves."
	CRLF	
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?SMELL \?CCL18
	PRINTR	"The stench here is terrible.Rotten food, rotten flesh, offal, and worse."
?CCL18:	EQUAL?	PRSA,V?TAKE \?CCL20
	EQUAL?	PRSI,LG-BUNK \?CCL20
	FSET?	PRSO,PERSON \?CCL20
	ICALL	PERFORM,V?MOVE,PRSO
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?YELL-AT \?CCL25
	EQUAL?	PRSO,FALSE-VALUE,CREWMEN \?CCL25
	PRINTR	"They just yell right back at you."
?CCL25:	EQUAL?	PRSA,V?ATTACK,V?HIT \FALSE
	EQUAL?	PRSO,CREWMEN \FALSE
	PRINTR	"They back off, intimidated."

	.SEGMENT "RODRIGUES"

	.SEGMENT "ANJIRO"


	.FUNCT	ON-DECK-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is the main deck of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	".A companionway leads up to the bridge, and another one forward leads below decks to the crew quarters.A stairway aft leads to the officers' cabins."
?CCL3:	EQUAL?	RARG,M-BEG \?CCL5
	EQUAL?	SCENE,S-ANJIRO,S-RODRIGUES \?CCL8
	EQUAL?	PRSA,V?LISTEN \?CCL11
	EQUAL?	PRSO,FALSE-VALUE \?CCL11
	ICALL	PERFORM,V?LISTEN,WIND
	RTRUE	
?CCL11:	EQUAL?	PRSA,V?WALK \?CCL15
	EQUAL?	P-WALK-DIR,P?UP,P?FORE,P?AFT \?CCL15
	IN?	RODRIGUES,PASSAGEWAY /FALSE
	ICALL	PERFORM,V?RUB,RIBBON
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?WALK \?CCL22
	EQUAL?	P-WALK-DIR,P?DOWN,P?PORT,P?WEST \?CCL22
	FSET?	SAMURAI-GUARDS,RMUNGBIT \?CCL27
	PRINTI	"You climb down the gangway into the "
	IN?	SMALL-BOAT,AT-ERASMUS \?CCL30
	MOVE	WINNER,SMALL-BOAT
	ICALL2	DPRINT,SMALL-BOAT
	JUMP	?CND28
?CCL30:	PRINTI	"water"
?CND28:	PRINTC	46
	CRLF	
	CRLF	
	CALL2	GOTO,AT-ERASMUS
	RSTACK	
?CCL27:	EQUAL?	RIBBON-CNT,3 \?CCL32
	PRINTR	"You start down the gangway, and stop.You feel your cold sweat and see the samurai staring at you malevolently."
?CCL32:	PRINTR	"You start to climb down the gangway, but you can't force yourself to leave without trying to regain your rutters."
?CCL22:	EQUAL?	PRSA,V?BOW \FALSE
	EQUAL?	PRSO,FALSE-VALUE \FALSE
	ICALL	PERFORM,V?BOW,SAMURAI-GUARDS
	RTRUE	
?CCL8:	EQUAL?	SCENE,S-ERASMUS \FALSE
	EQUAL?	PRSA,V?LOOK-UP \FALSE
	EQUAL?	PRSO,ROOMS \FALSE
	ICALL	PERFORM,V?EXAMINE,FORESAILS
	RTRUE	
?CCL5:	EQUAL?	RARG,M-ENTER \FALSE
	EQUAL?	SCENE,S-ERASMUS \?CCL48
	ZERO?	TIRED-TIME /?CND49
	EQUAL?	OHERE,BELOW-DECKS,PASSAGEWAY \?CND49
	ICALL	QUEUE,I-TIRED,TIRED-TIME
?CND49:	CALL1	SCORE-HAVE
	EQUAL?	STACK,7 /?CCL54
	EQUAL?	OHERE,PASSAGEWAY \?PRD57
	FSET?	APPLE,SCOREBIT /?CCL54
?PRD57:	EQUAL?	OHERE,BELOW-DECKS \TRUE
	FSET?	MAETSUKKER,SCOREBIT \TRUE
?CCL54:	SET	'STORM-DELAY?,FALSE-VALUE
	ICALL1	QUEUE-STORM
	RTRUE	
?CCL48:	EQUAL?	SCENE,S-ANJIRO \?CCL63
	EQUAL?	OHERE,AT-ERASMUS \TRUE
	ICALL	QUEUE,I-RIBBON,3
	RTRUE	
?CCL63:	EQUAL?	SCENE,S-RODRIGUES \TRUE
	EQUAL?	OHERE,AT-ERASMUS \TRUE
	IN?	RODRIGUES,HERE \TRUE
	PRINTI	"As you climb aboard, "
	ICALL1	SEALED-PASSAGE
	CRLF	
	RTRUE	

	.ENDSEG

	.SEGMENT "ERASMUS"


	.FUNCT	ERASMUS-ANCHOR-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-ERASMUS /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"The anchor hangs over the side, ready to be dropped if ever, by the grace of God and your good piloting, the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" reaches port."
	RTRUE	


	.FUNCT	ERASMUS-ANCHOR-F:ANY:0:0
	EQUAL?	PRSA,V?RAISE \?CCL3
	ICALL	PERFORM,V?TAKE,PRSO
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?DROP,V?THROW,V?PUT /?CCL5
	EQUAL?	PRSA,V?LOWER \FALSE
?CCL5:	PRINT	STR?327
	CRLF	
	RTRUE	

	.SEGMENT "RODRIGUES"


	.FUNCT	PASSAGEWAY-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	EQUAL?	SCENE,S-ERASMUS \TRUE
	CALL2	DEQUEUE,I-TIRED >TIRED-TIME
	ICALL	QUEUE,I-BELOW-DECKS,-1,TRUE-VALUE
	IN?	ROPER,PASSAGEWAY \TRUE
	MOVE	ROPER,MATES-CABIN
	MOVE	APPLE,ROPER
	PRINTI	"As you enter the relative quiet of the aft passageway, you notice Jan Roper heading across the passage from your cabin to the Mates' cabin."
	CRLF	
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?OPEN,V?CLOSE \FALSE
	EQUAL?	PRSO,PILOTS-CABIN \?CCL15
	ICALL	PERFORM,PRSA,PILOTS-CABIN-DOOR
	RTRUE	
?CCL15:	EQUAL?	PRSO,MATES-CABIN \?CCL17
	ICALL	PERFORM,PRSA,MATES-CABIN-DOOR
	RTRUE	
?CCL17:	EQUAL?	PRSO,CAPTAINS-CABIN \FALSE
	ICALL	PERFORM,PRSA,CAPTAINS-CABIN-DOOR
	RTRUE	

	.ENDSEG

	.SEGMENT "ERASMUS"


	.FUNCT	I-BELOW-DECKS:ANY:0:0
	FSET?	HERE,OUTSIDE \?CCL3
	ICALL2	DEQUEUE,I-BELOW-DECKS
	RFALSE	
?CCL3:	RANDOM	100
	LESS?	25,STACK /FALSE
	CRLF	
	CALL2	PICK-ONE,BELOW-DECKS-BACKGROUND
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	CAPTAINS-CABIN-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?FIND \FALSE
	EQUAL?	PRSO,GLOBAL-WATER \FALSE
	ICALL	PERFORM,V?OPEN,CAPTAINS-DESK
	RTRUE	
?CCL3:	EQUAL?	RARG,M-LEAVE \?CCL10
	EQUAL?	SCENE,S-ERASMUS \FALSE
	ICALL2	DEQUEUE,I-WHINE
	CRLF	
	PRINTI	"You close your ears to the whines and leave, hating Spillbergen anew."
	CRLF	
	CRLF	
	RTRUE	
?CCL10:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SCENE,S-ERASMUS \FALSE
	CALL2	QUEUED?,I-WHINE
	ZERO?	STACK \FALSE
	CALL2	I-WHINE,TRUE-VALUE
	RSTACK	


	.FUNCT	I-WHINE:ANY:0:1,END
	ICALL	QUEUE,I-WHINE,3
	ICALL2	THIS-IS-IT,SPILLBERGEN
	CRLF	
	PRINTI	"Spillbergen whines weakly.""I'm "
	FSET?	FLAGON,SCOREBIT \?CCL3
	PRINTI	"thirsty"
	JUMP	?CND1
?CCL3:	PRINTI	"hungry"
?CND1:	PRINTI	","" he rasps."
	ZERO?	END /?CND4
	PRINTR	"You've set some water aside for him, out of pity."
?CND4:	CRLF	
	RTRUE	


	.FUNCT	FLAGON-F:ANY:0:0,W
	CALL	NOUN-USED?,PRSO,W?WATER >W
	EQUAL?	PRSA,V?LEAP,V?DIVE \?CCL3
	ZERO?	W /?CCL3
	ICALL	PERFORM,PRSA,LG-SEA
	RTRUE	
?CCL3:	ZERO?	W /?CCL7
	FSET?	FLAGON,RMUNGBIT \?CCL7
	PRINTR	"There's no longer any water in the flagon."
?CCL7:	EQUAL?	PRSA,V?EXAMINE \?CCL11
	PRINTI	"This is a flagon "
	FSET?	FLAGON,RMUNGBIT \?CCL14
	PRINTI	"which contained"
	JUMP	?CND12
?CCL14:	PRINTI	"containing"
?CND12:	PRINTR	" a secret cache of water you've set aside for the Captain-General.The water doesn't look too palatable."
?CCL11:	EQUAL?	PRSA,V?PUT-AWAY \?CCL16
	MOVE	FLAGON,CAPTAINS-DESK
	PRINTR	"You put the flagon back into the desk."
?CCL16:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL18
	FSET?	FLAGON,OPENBIT /?CCL21
	ICALL2	CTHE-PRINT,FLAGON
	PRINTR	" isn't open."
?CCL21:	FSET?	FLAGON,RMUNGBIT \?CCL23
	ICALL2	CTHE-PRINT,FLAGON
	PRINTR	" is now empty."
?CCL23:	PRINTR	"There is some water in the flagon."
?CCL18:	EQUAL?	PRSA,V?POUR \?CCL25
	FSET?	FLAGON,OPENBIT /?CCL28
	ICALL2	CTHE-PRINT,FLAGON
	PRINTR	" isn't open."
?CCL28:	FSET?	FLAGON,RMUNGBIT \?CCL30
	ICALL2	CTHE-PRINT,FLAGON
	PRINTR	" is empty."
?CCL30:	FSET	FLAGON,RMUNGBIT
	PRINTI	"You pour the water"
	EQUAL?	HERE,CAPTAINS-CABIN \?CCL33
	EQUAL?	PRSI,FALSE-VALUE,SPILLBERGEN \?CCL33
	PRINTR	" on the Captain, who whines pitifully at your cruelty."
?CCL33:	PRINTR	"."
?CCL25:	EQUAL?	PRSA,V?DRINK,V?TASTE \?CCL37
	FSET?	FLAGON,OPENBIT /?CCL40
	ICALL2	CTHE-PRINT,FLAGON
	PRINTR	" isn't open."
?CCL40:	FSET?	FLAGON,RMUNGBIT \?CCL42
	PRINTR	"There's no more water."
?CCL42:	PRINTI	"You sip a little"
	FSET?	FLAGON,SCOREBIT \?CND43
	PRINTI	", reserving the rest for Spillbergen"
?CND43:	PRINTR	".The water tastes terrible, but at least it's not salt water.It's well known that if you descend to drinking salt water, you go mad."
?CCL37:	EQUAL?	PRSA,V?GIVE \?CCL46
	FSET?	FLAGON,RMUNGBIT /?CCL46
	FSET?	PRSI,PERSON \?CCL46
	FSET?	PRSI,PLURAL \?CCL52
	PRINTR	"You can't share that little bit of water among so many."
?CCL52:	MOVE	FLAGON,PRSI
	FSET	FLAGON,OPENBIT
	ICALL1	CTHE-PRINT-PRSI
	PRINTR	" drinks it greedily."
?CCL46:	EQUAL?	PRSA,V?TAKE \FALSE
	CALL	NOUN-USED?,PRSO,W?WATER
	ZERO?	STACK /FALSE
	CALL2	HELD?,FLAGON
	ZERO?	STACK /FALSE
	FSET?	FLAGON,RMUNGBIT \?CCL62
	PRINTR	"The flagon held the last of the good water, tarry but drinkable."
?CCL62:	PRINTR	"You already have a flagon full of water."


	.FUNCT	SECRET-DRAWER-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE,V?OPEN,V?CLOSE \?CCL3
	ICALL	PERFORM,PRSA,CAPTAINS-DESK
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?PUSH,V?MOVE \FALSE
	ICALL	PERFORM,V?OPEN,CAPTAINS-DESK
	RTRUE	


	.FUNCT	CAPTAINS-DESK-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"This desk is much like your own, but the captain hasn't used it in weeks.He is too sick to leave his bunk."
	FSET?	CAPTAINS-DESK,RMUNGBIT /?CND4
	PRINTC	11
	ICALL	PERFORM,V?OPEN,CAPTAINS-DESK
	RTRUE	
?CND4:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?OPEN,V?LOOK-INSIDE,V?SEARCH /?CCL7
	EQUAL?	PRSA,V?LOOK-ON \FALSE
?CCL7:	FSET?	CAPTAINS-DESK,RMUNGBIT /?CCL12
	FSET	CAPTAINS-DESK,RMUNGBIT
	FCLEAR	SECRET-DRAWER,INVISIBLE
	PRINTR	"You look through the desk, knowing you left a flagon of water in it.In your tiredness you fumble around, unsure where you put it, and then remember the secret drawer.Where's that catch?Ah, there it is, a small piece of ornamentation."
?CCL12:	FSET?	CAPTAINS-DESK,OPENBIT /FALSE
	FSET	CAPTAINS-DESK,OPENBIT
	FSET	SECRET-DRAWER,OPENBIT
	PRINTI	"You open the secret drawer to the desk, revealing "
	ICALL2	DESCRIBE-REST,CAPTAINS-DESK
	PRINTC	46
	CRLF	
	ICALL1	RESTART-STORM?
	CALL2	SCORE-OBJECT,CAPTAINS-DESK
	RSTACK	

	.SEGMENT "RODRIGUES"


	.FUNCT	PILOTS-CABIN-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is your cabin, sparsely furnished and small but nonetheless the second best on the ship.The only exit is out to the passageway."
	EQUAL?	SCENE,S-ERASMUS \?CCL6
	FSET?	HERE,TOUCHBIT /?CCL6
	PRINTR	"There's something wrong here.Your cabin has been disturbed.As you look around, trying to see what's wrong, your eyes stray to the sea chest which contains your rutters.You do it almost in a panic, for a pilot's rutters are his life."
?CCL6:	EQUAL?	SCENE,S-RODRIGUES \?CND4
	PRINTR	"The room looks as though it has been tidied up and then thoroughly turned over again."
?CND4:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL11
	EQUAL?	SCENE,S-ERASMUS \TRUE
	ICALL	QUEUE,I-BUNK,4
	RTRUE	
?CCL11:	EQUAL?	RARG,M-LEAVE \?CCL15
	EQUAL?	SCENE,S-ERASMUS \FALSE
	CALL2	DEQUEUE,I-BUNK
	RSTACK	
?CCL15:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL23
	EQUAL?	P-WALK-DIR,P?OUT,P?STARBOARD \?CCL23
	CALL2	HELD?,RUTTER
	ZERO?	STACK \?CCL28
	CALL2	HELD?,SECRET-RUTTER
	ZERO?	STACK /FALSE
?CCL28:	PRINTR	"As you start to leave, you remember you are carrying one of your precious rutters out into the storm or into the inquisitive eyes of your crew.You think better of it."
?CCL23:	EQUAL?	PRSA,V?SLEEP,V?LIE-DOWN \FALSE
	ICALL	PERFORM,V?BOARD,BUNK
	RTRUE	

	.ENDSEG

	.SEGMENT "ERASMUS"


	.FUNCT	SECRET-RUTTER-F:ANY:0:0
	EQUAL?	PRSA,V?FIND /?CTR2
	EQUAL?	PRSA,V?BE \?CCL3
	EQUAL?	PRSI,INTPP \?CCL3
	CALL	PP?,W?ON,LG-ERASMUS
	ZERO?	STACK /?CCL3
?CTR2:	EQUAL?	SCENE,S-ANJIRO \FALSE
	ICALL	PERFORM,PRSA,RUTTER,PRSI
	RTRUE	
?CCL3:	IN?	RUTTER,GENERIC-OBJECTS \?CCL13
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \FALSE
	PRINT	STR?353
	CRLF	
	RTRUE	
?CCL13:	EQUAL?	PRSA,V?PUT-AWAY \?CCL18
	EQUAL?	PRSO,SECRET-RUTTER \?CCL18
	EQUAL?	PRSI,ROOMS \?CCL18
	ICALL	PERFORM,PRSA,PRSO,SEA-CHEST
	RTRUE	
?CCL18:	EQUAL?	PRSA,V?EXAMINE,V?READ,V?OPEN \?CCL23
	FSET	PRSO,OPENBIT
	PRINTR	"This rutter explains the sea route through Magellan's Pass into the Pacific and up the west coast of Spanish America.It is a treasure beyond price."
?CCL23:	EQUAL?	PRSA,V?WRITE \?CCL25
	PRINTR	"You haven't written in this rutter since you fled the Spanish into the Pacific.It deals with Magellan's Pass, and goes no further than Chile."
?CCL25:	EQUAL?	PRSA,V?FOLLOW,V?STEER-BY \?CCL27
	PRINT	STR?354
	CRLF	
	RTRUE	
?CCL27:	EQUAL?	PRSA,V?SHOW \?CCL29
	EQUAL?	PRSI,VINCK,HENDRIK \?CCL29
	ICALL1	CTHE-PRINT-PRSI
	PRINTR	" appears interested, probably wondering why you are revealing your secret now.Perhaps you expect to die..."
?CCL29:	EQUAL?	PRSA,V?MUNG,V?TEAR \?CCL33
	PRINT	STR?355
	CRLF	
	RTRUE	
?CCL33:	EQUAL?	PRSA,V?PUT,V?DROP \FALSE
	FCLEAR	PRSO,OPENBIT
	RFALSE	


	.FUNCT	RUTTER-F:ANY:0:0
	EQUAL?	PRSA,V?FIND /?CTR2
	EQUAL?	PRSA,V?BE \?CCL3
	EQUAL?	PRSI,INTPP \?CCL3
	CALL	PP?,W?ON,LG-ERASMUS
	ZERO?	STACK /?CCL3
?CTR2:	EQUAL?	SCENE,S-ANJIRO \FALSE
	FSET	RUTTER,RMUNGBIT
	PRINTI	"You haven't seen your rutters.Could they still be on the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	"?Or worse, could they have been taken?They are your most precious possessions, and the secret one could cost you your life in any Catholic nation!"
?CCL3:	EQUAL?	PRSA,V?WHAT \?CCL13
	PRINTR	"A rutter is a small book containing the detailed observation of a pilot who has been there before.It records magnetic compass courses between ports and capes, headlands and channels.It sets down how we got there and how we got back.Rutters that reveal the mysteries of the Pass of Magellan into the Pacific -- a Portuguese discovery -- and thence the seaways to Asia are guarded as national treasures by the Spanish and Portuguese."
?CCL13:	IN?	RUTTER,GENERIC-OBJECTS \?CCL15
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \FALSE
	PRINT	STR?353
	CRLF	
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?PUT-AWAY \?CCL20
	EQUAL?	PRSO,RUTTER \?CCL20
	EQUAL?	PRSI,ROOMS \?CCL20
	ICALL	PERFORM,PRSA,PRSO,SEA-CHEST
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?FOLLOW,V?STEER-BY \?CCL25
	PRINT	STR?354
	CRLF	
	RTRUE	
?CCL25:	EQUAL?	PRSA,V?EXAMINE,V?READ,V?OPEN \?CCL27
	FSET	RUTTER,OPENBIT
	PRINTR	"This rutter is the record of your voyage from Rotterdam in the Netherlands south through the Atlantic, through the Pass of Magellan, up the west coast of South America, and into the unknown Pacific."
?CCL27:	EQUAL?	PRSA,V?WRITE \?CCL29
	EQUAL?	PRSI,FALSE-VALUE,QUILL /?CCL32
	CALL2	CANT-X-WITH-PRSI,STR?356
	RSTACK	
?CCL32:	FSET?	RUTTER,SCOREBIT \?CCL34
	PRINTI	"You"
	CALL2	HELD?,QUILL
	ZERO?	STACK \?CND35
	SET	'PRSO,QUILL
	CALL2	ITAKE,FALSE-VALUE
	ZERO?	STACK \?CCL39
	PRINTR	"'ll have a devil of a time writing without a quill."
?CCL39:	PRINTI	" take the quill and"
	SET	'PRSO,RUTTER
?CND35:	FSET	RUTTER,OPENBIT
	PRINTI	" write: ""April 21 1600.Fifth hour.Dusk.133d day from Santa Maria Island, Chile, on the 32 degree North line of latitude.Sea still high and wind strong.We are running before the wind along a course of 270 degrees, making way briskly.Large reefs were sighted at half the hour bearing North East by North half a league distant.Three men died in the night of the scurvy.Today Bosun Rijckloff died.I estimate we are still on course and that landfall in the Japans should be soon.""

But how soon, you wonder?"
	CRLF	
	ICALL1	RESTART-STORM?
	CALL2	SCORE-OBJECT,RUTTER
	RSTACK	
?CCL34:	PRINTR	"You've already written in the rutter today.Perhaps you need some rest."
?CCL29:	EQUAL?	PRSA,V?MUNG,V?TEAR \?CCL41
	PRINT	STR?355
	CRLF	
	RTRUE	
?CCL41:	EQUAL?	PRSA,V?PUT,V?DROP \FALSE
	FCLEAR	RUTTER,OPENBIT
	RFALSE	


	.FUNCT	SEA-CHEST-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET?	PRSO,OPENBIT /FALSE
	FSET?	PRSO,LOCKED \FALSE
	FSET	SEA-CHEST,RMUNGBIT
	PRINTR	"It's locked and appears undisturbed."
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL10
	EQUAL?	PRSI,KEY \?CCL13
	ICALL	PERFORM,V?UNLOCK,SEA-CHEST,KEY
	RTRUE	
?CCL13:	FSET?	SEA-CHEST,LOCKED \?CCL15
	FSET	SEA-CHEST,RMUNGBIT
	PRINTR	"It's locked.You keep your rutters in it, and they are your most precious possessions."
?CCL15:	FSET?	SEA-CHEST,OPENBIT /FALSE
	FSET	SEA-CHEST,OPENBIT
	PRINTI	"The sea chest opens.Inside it is "
	ICALL2	DESCRIBE-REST,SEA-CHEST
	PRINTR	"."
?CCL10:	EQUAL?	PRSA,V?LOCK \?CCL19
	EQUAL?	PRSO,SEA-CHEST \?CCL19
	EQUAL?	PRSI,FALSE-VALUE,KEY \?CCL19
	FSET?	SEA-CHEST,LOCKED /?CCL19
	FSET?	SEA-CHEST,OPENBIT \?CCL26
	CALL2	YOULL-HAVE-TO,STR?357
	RSTACK	
?CCL26:	CALL2	HELD?,KEY
	ZERO?	STACK /?CCL28
	FSET	SEA-CHEST,LOCKED
	PRINTR	"You've now locked it securely."
?CCL28:	PRINT	STR?358
	CRLF	
	RTRUE	
?CCL19:	EQUAL?	PRSA,V?UNLOCK \?CCL30
	EQUAL?	PRSO,SEA-CHEST \?CCL30
	EQUAL?	PRSI,FALSE-VALUE,KEY \?CCL30
	FSET?	SEA-CHEST,LOCKED \?CCL30
	CALL2	HELD?,KEY
	ZERO?	STACK /?CCL37
	FCLEAR	SEA-CHEST,LOCKED
	PRINTI	"You unlock "
	ICALL1	THE-PRINT-PRSO
	PRINTR	"."
?CCL37:	FSET	SEA-CHEST,RMUNGBIT
	PRINT	STR?358
	CRLF	
	RTRUE	
?CCL30:	EQUAL?	PRSA,V?CLOSE \FALSE
	FSET?	SEA-CHEST,OPENBIT \FALSE
	FCLEAR	SEA-CHEST,OPENBIT
	PRINTR	"The sea chest is now closed."


	.FUNCT	I-BUNK:ANY:0:0,CNT
	GETP	BLACKTHORNE,P?HEALTH
	GRTR?	STACK,0 /FALSE
	ICALL	QUEUE,I-BUNK,6
	GETP	BUNK,P?COUNT
	ADD	1,STACK >CNT
	PUTP	BUNK,P?COUNT,CNT
	CRLF	
	PRINTI	"You glance at your bunk.You are so tired.Go to sleep just for an hour, for ten minutes..."
	CRLF	
	CRLF	
	GRTR?	CNT,4 \?CCL5
	PRINTI	"""I must sleep.Sleep.They rely on me..."" You fall into a deep, exhausted sleep which is interrupted only when the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" is holed on the reef and sinks to the bottom."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL5:	PRINTR	"""I won't, I'll sleep tomorrow,"" you force yourself to say."


	.FUNCT	LG-BUNK-F:ANY:0:0
	EQUAL?	PRSA,V?BOARD \FALSE
	PRINTR	"This is no time to think of sleep!"


	.FUNCT	BUNK-F:ANY:0:0
	EQUAL?	PRSA,V?BOARD,V?CLIMB-ON \FALSE
	CALL	JIGS-UP?,J-BUNK,STR?360
	ZERO?	STACK /TRUE
	PRINTI	"While you might have had a chance of resisting sleep if you hadn't lain in the bunk, once you are in it, you fall quickly into an exhausted slumber.When you are awakened, it is by the wrenching, tearing sound of the reef scraping the hull off of the ship.You and the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" are doomed."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	DESK-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"This is a battered old writing desk, with a top large enough for charts and rutters."
	EQUAL?	SCENE,S-ERASMUS \?CND4
	IN?	APPLE,ROPER \?CND4
	PRINTR	"You don't see the apples you've been saving."
?CND4:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL9
	FSET?	KEY,NDESCBIT \?CCL12
	EQUAL?	SCENE,S-ERASMUS \?CCL12
	ICALL	PERFORM,V?SEARCH,DESK
	RTRUE	
?CCL12:	PRINTR	"Opening the desk reveals little of interest.You've seen it all a thousand times before."
?CCL9:	EQUAL?	PRSA,V?SEARCH \FALSE
	FSET?	KEY,NDESCBIT \?CCL19
	EQUAL?	SCENE,S-ERASMUS \?CCL19
	FSET	KEY,TAKEBIT
	FSET	KEY,TRYTAKEBIT
	FCLEAR	KEY,NDESCBIT
	IN?	APPLE,ROPER \?CND22
	PRINTI	"The first thing you notice is that the apples you've been saving are gone!"
?CND22:	FSET?	SEA-CHEST,RMUNGBIT \?CCL26
	FCLEAR	SEA-CHEST,RMUNGBIT
	MOVE	KEY,WINNER
	ICALL2	THIS-IS-IT,KEY
	PRINTI	"You search for the key to your sea chest.Can someone have taken it?No!There it is.You take it with thanks."
	CRLF	
	JUMP	?CND24
?CCL26:	PRINTI	"You notice the key to your sea chest, safe and sound where you left it."
	CRLF	
?CND24:	ICALL1	RESTART-STORM?
	CALL2	SCORE-OBJECT,KEY
	RSTACK	
?CCL19:	PRINTR	"You search the desk, finding nothing of particular interest."


	.FUNCT	KEY-F:ANY:0:0
	EQUAL?	PRSA,V?FIND \?CCL3
	FSET?	KEY,NDESCBIT \?CND4
	PRINTI	"You keep the key in your desk, so you look there first."
?CND4:	ICALL	PERFORM,V?SEARCH,DESK
	RTRUE	
?CCL3:	FSET?	KEY,NDESCBIT \?CCL7
	PRINTR	"You see no key here."
?CCL7:	EQUAL?	PRSA,V?UNLOCK \?CCL9
	EQUAL?	PRSO,SEA-CHEST \?CCL9
	EQUAL?	PRSI,KEY \?CCL9
	FSET?	SEA-CHEST,LOCKED \?CCL9
	FCLEAR	SEA-CHEST,LOCKED
	PRINTR	"The chest unlocks with a rusty click."
?CCL9:	EQUAL?	PRSA,V?LOCK \FALSE
	EQUAL?	PRSO,SEA-CHEST \FALSE
	EQUAL?	PRSI,KEY \FALSE
	FSET?	SEA-CHEST,LOCKED /FALSE
	FCLEAR	SEA-CHEST,OPENBIT
	FSET	SEA-CHEST,LOCKED
	PRINTR	"The chest is now securely locked."


	.FUNCT	APPLE-F:ANY:0:0,TMP
	EQUAL?	PRSA,V?FIND \?CCL3
	IN?	APPLE,ROPER \FALSE
	FSET?	APPLE,NDESCBIT \FALSE
	PRINTR	"A cursory search of the premises reveals no apple."
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL10
	IN?	APPLE,ROPER \FALSE
	FSET?	APPLE,NDESCBIT \?CCL16
	PRINTR	"You see no apple."
?CCL16:	PRINTR	"This is the last of the apples you have carefully hoarded all the way from Santa Maria Island, off Chile.It's bruised and tiny, with mold on a rotting section."
?CCL10:	EQUAL?	PRSA,V?EAT \?CCL18
	CALL2	HELD?,APPLE
	ZERO?	STACK \?CND19
	PRINTR	"You don't have the apple."
?CND19:	GETP	APPLE,P?COUNT
	SUB	STACK,1 >TMP
	PUTP	APPLE,P?COUNT,TMP
	ZERO?	TMP \?CCL23
	REMOVE	APPLE
	PRINTR	"You eat the last quarter of the apple."
?CCL23:	PRINTI	"You carefully eat a quarter of the apple, wrap the remainder, and put it away.There are a few maggots in the quarter you've cut off, but you heed the old sea legend that apple maggots are effective against scurvy.You chew the fruit gently because your teeth are aching and your gums sore and tender.After you finish the apple, you feel better."
	CRLF	
	EQUAL?	TMP,3 \TRUE
	PUTP	WINNER,P?HEALTH,1
	SET	'TIRED-TIME,0
	ICALL2	DEQUEUE,I-TIRED-WARNING
	ICALL2	DEQUEUE,I-TIRED
	ICALL1	RESTART-STORM?
	ICALL2	SCORE-OBJECT,APPLE
	RTRUE	
?CCL18:	EQUAL?	PRSA,V?GIVE \FALSE
	EQUAL?	PRSO,APPLE \FALSE
	FSET?	PRSI,PERSON \FALSE
	REMOVE	APPLE
	ICALL1	CTHE-PRINT-PRSI
	PRINTI	" take"
	ICALL2	PRINT-PLURAL,PRSI
	PRINTI	" the apple and gobble"
	ICALL2	PRINT-PLURAL,PRSI
	PRINTI	" it greedily."
	EQUAL?	PRSI,VINCK,PIETERZOON,CROOCQ \?CND31
	PRINTR	"""Thank you, Pilot.Thank you!"""
?CND31:	CRLF	
	RTRUE	


	.FUNCT	RAT-PSEUDO:ANY:0:0
	CALL2	RANDOM-PSEUDO,STR?361
	RSTACK	


	.FUNCT	COCKROACH-PSEUDO:ANY:0:0
	CALL2	RANDOM-PSEUDO,STR?362
	RSTACK	


	.FUNCT	RANDOM-PSEUDO:ANY:1:1,WHAT
	PRINTI	"You don't see the "
	PRINT	WHAT
	PRINTR	" any more."


	.FUNCT	MATES-CABIN-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is the Mates' cabin."
	EQUAL?	SCENE,S-ERASMUS \?CND4
	PRINTI	"It is now shared by Baccus van Nekk, the chief merchant, Hendrik the third mate, and the boy, Croocq."
?CND4:	PRINTR	"The passageway is outside."
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?SEARCH \?CCL10
	EQUAL?	PRSO,GLOBAL-HERE \?CCL10
	IN?	APPLE,ROPER \?CCL10
	PRINTR	"You find nothing.Roper watches with a smirk on his face.""Go ahead, Pilot.Search all you want."""
?CCL10:	EQUAL?	PRSA,V?SEARCH \FALSE
	EQUAL?	PRSO,PIETERZOON,VAN-NEKK,CROOCQ \FALSE
	IN?	APPLE,ROPER \FALSE
	ICALL1	DPRINT-PRSO
	PRINTR	" reluctantly allows himself to be searched, cursing you all the while.You find nothing."

	.SEGMENT "RODRIGUES"

	.ENDSEG

	.SEGMENT "ERASMUS"


	.FUNCT	CAPTAINS-CABIN-DOOR-F:ANY:0:0
	EQUAL?	PRSA,V?KNOCK \FALSE
	IN?	SPILLBERGEN,CAPTAINS-CABIN \FALSE
	PRINTR	"You hear a faint response."


	.FUNCT	MATES-CABIN-DOOR-F:ANY:0:0
	EQUAL?	PRSA,V?KNOCK \FALSE
	EQUAL?	SCENE,S-ERASMUS \FALSE
	PRINTR	"""Aye?Come in, damn you!Do think this is a palace?"""

	.SEGMENT "RODRIGUES"

	.SEGMENT "ANJIRO"


	.FUNCT	PASSAGE-DOOR-F:ANY:0:0
	EQUAL?	SCENE,S-ANJIRO \?CCL3
	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	ICALL	PERFORM,V?RUB,RIBBON
	RTRUE	
?CCL3:	EQUAL?	SCENE,S-ERASMUS \FALSE
	EQUAL?	PRSA,V?KNOCK \FALSE
	PRINTR	"You hear noise inside, but no response to your knock."

	.ENDSEG

	.SEGMENT "ERASMUS"


	.FUNCT	WHEEL-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"The wheel dominates the quarterdeck.It is turned "
	EQUAL?	SHIP-COURSE,P?PORT \?CCL8
	PRINTI	"to port"
	JUMP	?CND6
?CCL8:	EQUAL?	SHIP-COURSE,P?STARBOARD \?CCL10
	PRINTI	"to starboard"
	JUMP	?CND6
?CCL10:	PRINTI	"straight"
?CND6:	PRINTI	" and "
	FSET?	WHEEL,RMUNGBIT \?CCL13
	PRINTI	"lashed in place"
	JUMP	?CND11
?CCL13:	PRINTI	"free to turn"
?CND11:	PRINTI	" now."
	RTRUE	


	.FUNCT	WHEEL-F:ANY:0:0,ST?,TOOK?
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"The wheel is connected to the rudder and steers the ship.It is turned "
	EQUAL?	SHIP-COURSE,P?PORT \?CCL6
	PRINTI	"to port"
	JUMP	?CND4
?CCL6:	EQUAL?	SHIP-COURSE,P?STARBOARD \?CCL8
	PRINTI	"to starboard"
	JUMP	?CND4
?CCL8:	PRINTI	"straight"
?CND4:	PRINTI	" now, "
	FSET?	WHEEL,RMUNGBIT \?CCL11
	PRINTR	"lashed in place against the surging sea."
?CCL11:	FSET?	WHEEL,ONBIT \?CCL13
	PRINTR	"unlashed and held steady only by all the strength you can summon from a weakened body."
?CCL13:	PRINTR	"spinning freely from side to side, the lashing hanging loosely beside it."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?TAKE-OVER \?CCL15
	FSET?	WHEEL,RMUNGBIT \?CCL18
	ICALL	PERFORM,V?UNTIE,WHEEL
	RTRUE	
?CCL18:	FSET?	WHEEL,ONBIT /?CCL20
	PRINTI	"You take hold of the wheel, trying to keep it under control"
	EQUAL?	SHIP-Y,1 \?CCL23
	GRTR?	SHIP-X,0 \?CCL23
	LESS?	SHIP-X,6 \?CCL23
	PRINTR	", but the currents and the crashing waves spin it away from from you.You just aren't strong enough to hold it alone.""Piss on you, storm!Get your dung-eating hands off my ship!"", you rage in frustration."
?CCL23:	FCLEAR	HENDRIK,TRYTAKEBIT
	FSET	WHEEL,ONBIT
	PRINTR	"."
?CCL20:	PRINTR	"You hold the wheel as strongly as you can, fighting the surging sea."
?CCL15:	EQUAL?	PRSA,V?DROP \?CCL28
	FSET?	WHEEL,RMUNGBIT \?CCL31
	ICALL	PERFORM,V?UNTIE,WHEEL
	RTRUE	
?CCL31:	FSET?	WHEEL,ONBIT \?CCL33
	FCLEAR	WHEEL,ONBIT
	PRINTR	"You let go of the wheel."
?CCL33:	PRINTR	"You arent' holding it."
?CCL28:	EQUAL?	PRSA,V?PUT \?CCL35
	EQUAL?	PRSO,LASHING \?CCL35
	EQUAL?	PRSI,WHEEL \?CCL35
	ICALL	PERFORM,V?TIE,WHEEL
	RTRUE	
?CCL35:	EQUAL?	PRSA,V?TAKE,V?TAKE-OFF \?CCL40
	EQUAL?	PRSO,LASHING \?CCL40
	ICALL	PERFORM,V?UNTIE,WHEEL
	RTRUE	
?CCL40:	EQUAL?	PRSA,V?TIE \?CCL44
	EQUAL?	PRSO,WHEEL \?CCL44
	FSET?	WHEEL,RMUNGBIT \?CCL49
	PRINT	STR?131
	CRLF	
	RTRUE	
?CCL49:	EQUAL?	SHIP-Y,1 \?CCL51
	GRTR?	SHIP-X,0 \?CCL51
	LESS?	SHIP-X,6 \?CCL51
	FSET?	WHEEL,ONBIT /?CCL51
	PRINTI	"The wheel is spinning too wildly to lash."
	CALL2	YOULL-HAVE-TO,STR?363
	RSTACK	
?CCL51:	FSET	WHEEL,RMUNGBIT
	FCLEAR	WHEEL,ONBIT
	PRINTR	"You loop the protective lashing around the spokes of the wheel.It is now locked in place."
?CCL44:	EQUAL?	PRSA,V?UNTIE \?CCL57
	EQUAL?	PRSO,WHEEL \?CCL57
	FSET?	WHEEL,RMUNGBIT \?CCL62
	FCLEAR	HENDRIK,TRYTAKEBIT
	FSET	WHEEL,ONBIT
	FCLEAR	WHEEL,RMUNGBIT
	PRINTR	"You remove the protective lashing, and brace yourself in place against the force of the sea.You can now turn the wheel freely."
?CCL62:	PRINT	STR?131
	CRLF	
	RTRUE	
?CCL57:	EQUAL?	PRSA,V?TIE \?CCL64
	EQUAL?	PRSI,WHEEL \?CCL64
	EQUAL?	PRSO,LASHING \?CCL69
	ICALL	PERFORM,V?TIE,WHEEL
	RTRUE	
?CCL69:	PRINTI	"You can't tie "
	ICALL1	THE-PRINT-PRSO
	PRINTR	" to the wheel!"
?CCL64:	EQUAL?	PRSA,V?UNTIE \?CCL71
	EQUAL?	PRSO,LASHING \?CCL71
	EQUAL?	PRSI,WHEEL \?CCL71
	CALL	PERFORM,V?UNTIE,WHEEL
	RSTACK	
?CCL71:	EQUAL?	PRSA,V?STRAIGHTEN \?CCL76
	EQUAL?	PRSO,WHEEL \?CCL76
	SET	'P-DIRECTION,P?FORE
	ICALL	PERFORM,V?TURN,WHEEL,INTDIR
	RTRUE	
?CCL76:	EQUAL?	PRSA,V?TURN \FALSE
	EQUAL?	PRSO,WHEEL \FALSE
	FSET?	WHEEL,ONBIT /?CND83
	EQUAL?	SHIP-Y,1 \?CCL87
	GRTR?	SHIP-X,0 \?CCL87
	LESS?	SHIP-X,6 \?CCL87
	PRINTI	"You grab for the spinning, thrashing wheel, but the force of the storm is too strong, and the"
	PRINT	STR?330
	CRLF	
	RTRUE	
?CCL87:	SET	'TOOK?,TRUE-VALUE
	FCLEAR	HENDRIK,TRYTAKEBIT
	FSET	WHEEL,ONBIT
	PRINTI	"You take the wheel"
	FSET?	WHEEL,RMUNGBIT \?CND83
	FCLEAR	WHEEL,RMUNGBIT
	PRINTI	", unlashing it first"
?CND83:	FSET?	LG-ERASMUS,RMUNGBIT \?CCL95
	ZERO?	TOOK? /?CCL98
	PRINTI	", but the"
	JUMP	?CND96
?CCL98:	PRINTI	"The"
?CND96:	PRINTR	" ship is pinned to the reef, so turning the wheel is futile!"
?CCL95:	FSET?	WHEEL,RMUNGBIT \?CCL100
	ZERO?	TOOK? /?CCL103
	PRINTI	", but it's"
	JUMP	?CND101
?CCL103:	PRINTI	"The wheel is"
?CND101:	PRINTR	" lashed in place and won't turn."
?CCL100:	FSET?	FORESAILS,RMUNGBIT \?CCL105
	ZERO?	TOOK? /?CCL108
	PRINTI	" and turn it"
	JUMP	?CND106
?CCL108:	PRINTI	"You turn the wheel"
?CND106:	PRINTR	", but there just isn't enough sail without the foresails, and the ship wallows like a pig!"
?CCL105:	EQUAL?	PRSI,INTDIR \?CCL110
	EQUAL?	P-DIRECTION,P?STARBOARD \?PRD114
	EQUAL?	SHIP-COURSE,P?PORT /?CCL112
?PRD114:	EQUAL?	P-DIRECTION,P?PORT \?CND111
	EQUAL?	SHIP-COURSE,P?STARBOARD \?CND111
?CCL112:	SET	'ST?,P-DIRECTION
	SET	'P-DIRECTION,P?FORE
?CND111:	EQUAL?	P-DIRECTION,SHIP-COURSE \?CCL121
	ZERO?	TOOK? /?CND122
	PRINTI	"."
?CND122:	EQUAL?	SHIP-COURSE,P?FORE \?CCL126
	PRINTI	"You maintain course "
	ICALL2	TELL-DIRECTION,SHIP-DIRECTION
	PRINTI	", the wheel still "
	JUMP	?CND124
?CCL126:	PRINTI	"The wheel is already "
?CND124:	EQUAL?	SHIP-COURSE,P?PORT \?CCL129
	PRINTI	"turned to port"
	JUMP	?CND127
?CCL129:	EQUAL?	SHIP-COURSE,P?STARBOARD \?CCL131
	PRINTI	"turned to starboard"
	JUMP	?CND127
?CCL131:	EQUAL?	SHIP-COURSE,P?FORE \?CND127
	PRINTI	"straight"
?CND127:	PRINTR	"."
?CCL121:	EQUAL?	P-DIRECTION,P?PORT \?CCL134
	ICALL	QUEUE,I-BROADSIDE,2
	ICALL2	SET-COURSE,P?PORT
	ZERO?	TOOK? /?CND135
	PRINTI	"."
?CND135:	PRINTI	"Straining against the sea, you turn the wheel to port."
	ZERO?	REEF-FLAG /?CCL139
	EQUAL?	REEF-X,REEF-Y \?CCL139
	PRINTR	"The ship turns broadside to the reef, struggling against the wind which tries to drive it onto the spines."
?CCL139:	EQUAL?	SHIP-X,6 \?CCL143
	EQUAL?	SHIP-Y,2 \?CCL143
	PRINTR	"Fighting the wind, the ship slowly turns away from the reef."
?CCL143:	EQUAL?	SHIP-X,1 \?CCL147
	EQUAL?	SHIP-Y,1 \?CCL147
	PRINTR	"Struggling, the ship begins to turn to port, slowly, slowly as the swift currents are drawing you deeper into the maze of rocks."
?CCL147:	PRINTR	"The ship struggles against the wind."
?CCL134:	EQUAL?	P-DIRECTION,P?STARBOARD \?CCL151
	ICALL	QUEUE,I-BROADSIDE,2
	ICALL2	SET-COURSE,P?STARBOARD
	ZERO?	TOOK? /?CCL154
	PRINTI	" and turn it"
	JUMP	?CND152
?CCL154:	PRINTI	"You turn the wheel"
?CND152:	PRINTI	" to starboard."
	EQUAL?	SHIP-X,8 \?CCL157
	EQUAL?	SHIP-Y,2 \?CCL157
	PRINTR	"The wind snaps the sails full and the ship heads for the gap, but it means coming very close to the waiting reef!"
?CCL157:	EQUAL?	SHIP-X,5 \?CCL161
	EQUAL?	SHIP-Y,1 \?CCL161
	PRINTI	"With a crack the sails fill, shooting the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" into the gap!"
?CCL161:	PRINTR	"The ship gains speed with the wind."
?CCL151:	EQUAL?	P-DIRECTION,P?FORE,P?IN \?CCL165
	ICALL2	DEQUEUE,I-BROADSIDE
	ICALL2	SET-COURSE,P?FORE
	ZERO?	ST? /?CCL168
	ZERO?	TOOK? /?CCL171
	PRINTI	" and haul it to "
	JUMP	?CND169
?CCL171:	PRINTI	"You haul the wheel to "
?CND169:	ICALL2	TELL-DIRECTION,ST?
	PRINTI	", centering it"
	JUMP	?CND166
?CCL168:	ZERO?	TOOK? /?CCL174
	PRINTI	" and straighten it"
	JUMP	?CND166
?CCL174:	PRINTI	"You straighten the wheel"
?CND166:	EQUAL?	SHIP-Y,9 \?CCL177
	EQUAL?	SHIP-X,19 \?CCL177
	SET	'SHIP-DIRECTION,P?WEST
	PRINTI	".Helped by the following wind, the ship returns to its course."
	CRLF	
	CALL2	SCORE-OBJECT,WHEEL
	RSTACK	
?CCL177:	PRINTR	", trying to hold a steady course."
?CCL165:	ZERO?	TOOK? /?CND180
	PRINTI	"."
?CND180:	PRINTR	"You can only turn the ship to port or starboard!"
?CCL110:	ZERO?	TOOK? /?CND182
	PRINTI	"."
?CND182:	PRINT	STR?364
	CRLF	
	RTRUE	


	.FUNCT	I-BROADSIDE:ANY:0:0
	EQUAL?	SHIP-COURSE,P?FORE /FALSE
	CRLF	
	PRINTI	"The "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" continues to turn, further and further off the wind.Soon she'll be broadside to the waves!"


	.FUNCT	I-SHIP-BROADSIDE:ANY:0:0
	EQUAL?	SHIP-COURSE,P?FORE /FALSE
	CALL1	SHIP-BROADSIDE
	RSTACK	


	.FUNCT	SHIP-BROADSIDE:ANY:0:0
	CRLF	
	PRINTI	"The ship continues turning to "
	ICALL2	TELL-DIRECTION,SHIP-COURSE
	ICALL2	JIGS-UP,STR?365
	RETURN	M-FATAL


	.FUNCT	SET-COURSE:ANY:1:1,DIR
	EQUAL?	DIR,SHIP-COURSE,P?FORE /?CND1
	ICALL	QUEUE,I-STORM,1
?CND1:	SET	'SHIP-COURSE,DIR
	RTRUE	


	.FUNCT	I-TIRED-WARNING:ANY:0:0
	GETP	BLACKTHORNE,P?HEALTH
	ZERO?	STACK \FALSE
	CRLF	
	PRINTR	"Exhaustion is rapidly overcoming you, but you know you can't sleep now."


	.FUNCT	I-TIRED:ANY:0:0
	GETP	BLACKTHORNE,P?HEALTH
	ZERO?	STACK \FALSE
	CRLF	
	CALL2	JIGS-UP,STR?366
	RSTACK	

	.SEGMENT "PIT"

	.SEGMENT "YABU"


	.FUNCT	SPILLBERGEN-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-ERASMUS,S-YABU,S-PIT /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Captain-General Paulus Spillbergen "
	EQUAL?	SCENE,S-ERASMUS \?CCL11
	PRINTI	"lies half conscious in his bunk."
	RTRUE	
?CCL11:	EQUAL?	SCENE,S-YABU \?CCL13
	PRINTI	"lies nearly unconscious on a pallet."
	RTRUE	
?CCL13:	EQUAL?	SCENE,S-PIT \FALSE
	LOC	LONG-STRAW
	ZERO?	STACK /?CCL18
	LOC	SHORT-STRAW
	ZERO?	STACK /?CCL18
	PRINTI	"lies delirious in the mud."
	RTRUE	
?CCL18:	PRINTI	"sits in the mud, leaning back against a wall."
	RTRUE	


	.FUNCT	SPILLBERGEN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?STOP /?CTR7
	EQUAL?	PRSA,V?SHUT-UP \?CCL8
	EQUAL?	PRSO,ROOMS \?CCL8
?CTR7:	PRINTR	"He stops for a moment, looking at you pitifully."
?CCL8:	PRINTR	"He stirs weakly, but otherwise doesn't respond."
?CCL5:	EQUAL?	PRSA,V?PISS \?CCL14
	PRINTR	"You have come to hate him, but to humilate him in his helpless, weakened condition would be too much."
?CCL14:	EQUAL?	PRSA,V?MOVE \?CCL16
	PRINTR	"He's too weak to be moved."
?CCL16:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL18
	PRINTI	"You want to hit him, even as weak and helpless as he is.He's to blame, it's true, but you can't do it."
	PRINT	STR?367
	CRLF	
	RTRUE	
?CCL18:	EQUAL?	PRSA,V?WHO \?CCL20
	PRINTI	"Paulus Spillbergen is the Captain-General of the fleet."
	PRINT	STR?367
	CRLF	
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?EXAMINE \?CCL22
	PRINTI	"Spillbergen "
	EQUAL?	HERE,CAPTAINS-CABIN \?CND23
	PRINTI	"is lying half conscious in his bunk.He "
?CND23:	PRINTI	"is a short, florid man, normally very fat, now very thin, the skin of his paunch hanging slackly in folds."
	EQUAL?	HERE,CAPTAINS-CABIN \?CND25
	FSET?	FLAGON,SCOREBIT \?CND25
	PRINTR	"He looks parched."
?CND25:	CRLF	
	RTRUE	
?CCL22:	EQUAL?	PRSA,V?FIND \?CCL30
	EQUAL?	SCENE,S-ERASMUS \?CCL30
	EQUAL?	HERE,CAPTAINS-CABIN /?CCL30
	PRINTR	"He's in his cabin."
?CCL30:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL35
	EQUAL?	PRSI,GLOBAL-WATER \?CCL35
	PRINTR	"""I'm parched, Pilot!Give me water!You had some before!"""
?CCL35:	EQUAL?	PRSA,V?SHOW \?CCL39
	EQUAL?	PRSI,SPILLBERGEN \?CCL39
	EQUAL?	PRSO,FLAGON,APPLE \FALSE
	PRINTI	"The captain reaches feebly for "
	ICALL1	THE-PRINT-PRSO
	PRINTR	"."
?CCL39:	EQUAL?	PRSA,V?GIVE \?CCL46
	EQUAL?	PRSI,SPILLBERGEN \?CCL46
	EQUAL?	PRSO,FLAGON \?CCL51
	FSET	FLAGON,OPENBIT
	PRINTI	"Weakly, Spillbergen drinks a little water."
	FSET?	FLAGON,SCOREBIT \?CCL54
	PRINTI	"""Thanks,"" he says.""Where's land -- where's land?""

""Ahead"" is all you can say in reply."
	CRLF	
	ICALL1	RESTART-STORM?
	CALL2	SCORE-OBJECT,FLAGON
	RSTACK	
?CCL54:	CRLF	
	RTRUE	
?CCL51:	EQUAL?	PRSO,APPLE \FALSE
	REMOVE	APPLE
	PRINTR	"The captain greedily devours your last apple, the pulp dripping down his chin."
?CCL46:	EQUAL?	PRSA,V?SOOTHE \?CCL58
	PRINTR	"His whining continues unabated."
?CCL58:	EQUAL?	PRSA,V?HELP \?CCL60
	PRINTR	"He seems hungry and thirsty."
?CCL60:	EQUAL?	PRSA,V?SEARCH \FALSE
	PRINTR	"He squirms and whines in a futile attempt to prevent you.You find nothing interesting anyway."


	.FUNCT	PIETERZOON-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL6
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,PIETERZOON,ROOMS
	RTRUE	
?CCL6:	ICALL2	CTHE-PRINT,WINNER
	PRINT	STR?368
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	IN?	PIETERZOON,HERE /?CCL11
	EQUAL?	HERE,PIT \?CCL11
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \?CCL11
	PRINTI	"Pieterzoon isn't here."
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	CALL1	END-QUOTE
	RSTACK	
?CCL11:	EQUAL?	PRSA,V?EXAMINE \?CCL19
	FSET?	PIETERZOON,DEAD \?CCL19
	PRINTR	"He looks like a boiled roast of beef."
?CCL19:	EQUAL?	PRSA,V?SEND \FALSE
	EQUAL?	PRSO,PIETERZOON \FALSE
	PRINTR	"""I'm too weak, Pilot!Go forward and send Ginsel out, or Maetsukker!He's always shirking his watch!"""


	.FUNCT	ROPER-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	SCENE,S-ERASMUS /?CCL8
	PRINTR	"He responds with disdain."
?CCL8:	EQUAL?	PRSA,V?ACCUSE \?PRD12
	EQUAL?	PRSO,ROPER /?CTR9
?PRD12:	EQUAL?	PRSA,V?TELL-ME-ABOUT \?PRD15
	EQUAL?	PRSO,APPLE /?CTR9
?PRD15:	EQUAL?	PRSA,V?BE,V?BE? \?CCL10
	EQUAL?	PRSO,YOU \?CCL10
	EQUAL?	PRSI,INTPP \?CCL10
	CALL	PP?,W?IN,PILOTS-CABIN
	ZERO?	STACK /?CCL10
?CTR9:	FCLEAR	APPLE,NDESCBIT
	PRINTR	"""You've been in my cabin,"" you say tiredly.

""I didn't steal anything, Pilot.Besides, alone in the wilderness we good Christians must share what little we have.""You recall how Roper and the rest didn't conserve their food, especially the fruit which has made your scurvy a matter of aching gums rather than lost teeth."
?CCL10:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL23
	PRINTR	"""I'll turn the other cheek, as any good Christian would!"" says Roper.You remember him shooting at the priests in Chile."
?CCL23:	EQUAL?	PRSA,V?GIVE \?CCL25
	EQUAL?	PRSO,APPLE \?CCL25
	EQUAL?	PRSI,BLACKTHORNE,ME \?CCL25
	PRINTR	"""It's ours to share.We ate one, shared it out, and we'll do the same with the other, as God is my witness!"""
?CCL25:	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL30
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,ROPER,ROOMS
	RTRUE	
?CCL30:	PRINTR	"He responds scornfully."
?CCL5:	EQUAL?	RARG,M-CONTAINER \?CCL32
	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	PRSO,APPLE \FALSE
	FCLEAR	APPLE,DONT-ALL
	FCLEAR	APPLE,NDESCBIT
	MOVE	APPLE,WINNER
	PRINTI	"You grab Roper tightly, and twist his arm until he drops the apple into your hands."
	CRLF	
	ICALL1	RESTART-STORM?
	CALL2	SCORE-OBJECT,ROPER
	RSTACK	
?CCL32:	EQUAL?	PRSA,V?WHO \?CCL39
	PRINTR	"Jan Roper is one of the merchant adventurers, and a fanatic Calvinist.He nearly killed you in Chile in his haste to fire his musket at a priest."
?CCL39:	EQUAL?	PRSA,V?EXAMINE \?CCL41
	PRINTI	"He's a narrow-eyed young man with a high forehead and a thin nose."
	EQUAL?	HERE,MATES-CABIN \?CND42
	PRINTR	"His pale chin is marred by a drip of apple juice."
?CND42:	CRLF	
	RTRUE	
?CCL41:	EQUAL?	PRSA,V?SEARCH \?CCL45
	EQUAL?	SCENE,S-ERASMUS \FALSE
	IN?	APPLE,ROPER \?CCL50
	FSET?	APPLE,NDESCBIT \?CCL53
	FCLEAR	APPLE,NDESCBIT
	PRINTR	"Roper twists away as best he can, then pulls an apple from his pocket.""Here it is!"" he screams, dancing away from you."
?CCL53:	PRINTR	"""Keep away from me!What more do you want?"" Roper whines."
?CCL50:	PRINTR	"""What more do you want from me?You've already stolen my apple, you hoarder!"""
?CCL45:	EQUAL?	PRSA,V?GIVE \?CCL55
	EQUAL?	PRSO,APPLE \?CCL55
	EQUAL?	PRSI,ROPER \?CCL55
	REMOVE	APPLE
	PRINTR	"Roper grabs the apple and stuffs it into his mouth."
?CCL55:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL60
	PRINTI	"You "
	EQUAL?	PRSA,V?THROW \?CCL63
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CND64
	PRINTI	"threaten to "
?CND64:	MOVE	PRSO,HERE
	PRINTI	"throw "
	ICALL1	THE-PRINT-PRSO
	PRINTI	" at him"
	JUMP	?CND61
?CCL63:	ZERO?	PRSI /?CCL67
	FSET?	PRSI,WEAPONBIT \?CCL67
	PRINTI	"threaten him with "
	ICALL1	THE-PRINT-PRSI
	JUMP	?CND61
?CCL67:	EQUAL?	PRSA,V?KICK \?CCL71
	PRINTI	"kick at him as you would kick a dog"
	JUMP	?CND61
?CCL71:	PRINTI	"raise your fists, threatening him"
?CND61:	PRINTI	", and he backs fearfully away."
	IN?	APPLE,ROPER \?CCL74
	FSET?	APPLE,NDESCBIT \?CCL77
	FCLEAR	APPLE,NDESCBIT
	PRINTR	"""It's mine, I tell you!Share and share alike!"" he whines, pulling an apple out of his pocket."
?CCL77:	MOVE	APPLE,HERE
	PRINTI	"""Don't hit me!"" he screams, dropping the apple on the ground."
	CRLF	
	CALL2	SCORE-OBJECT,ROPER
	RSTACK	
?CCL74:	CRLF	
	RTRUE	
?CCL60:	EQUAL?	PRSA,V?SEND \FALSE
	EQUAL?	PRSO,ROPER \FALSE
	PRINTR	"He refuses to go, scornfully suggesting you get the regular crewmen on deck instead.He's so incompetent a seaman that you relent."


	.FUNCT	SONK-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \FALSE
	ICALL2	CTHE-PRINT,WINNER
	PRINT	STR?368
	CRLF	
	RTRUE	


	.FUNCT	SALAMON-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	ICALL2	CTHE-PRINT,WINNER
	PRINTR	" responds with gestures conveying little enthusiasm."
?CCL5:	EQUAL?	PRSA,V?WHO \?CCL7
	PRINTR	"Salamon is a mute."
?CCL7:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	PRINTR	"In the end, you can't actually bring yourself to do it."


	.FUNCT	VAN-NEKK-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CCL6
	EQUAL?	PRSO,APPLE,ROPER \?CCL6
	PRINTR	"Van Nekk points angrily at Roper.""He took it, Pilot!He said you were hoarding food!"""
?CCL6:	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER \?CCL10
	EQUAL?	PRSO,FORESAILS /FALSE
?CCL10:	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL14
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,VAN-NEKK,ROOMS
	RTRUE	
?CCL14:	PRINT	STR?369
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?SEND \FALSE
	EQUAL?	PRSO,VAN-NEKK \FALSE
	PRINTR	"""I'd go, Pilot, but it's not my watch.It's Vinck's watch, I think, and Ginsel's, and Maetsukker's, if I've not gone crazed.""He smiles wanly."


	.FUNCT	CROOCQ-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CCL8
	EQUAL?	PRSO,APPLE,ROPER \?CCL8
	PRINTR	"Croocq says, ""I don't know anything about it, Pilot."""
?CCL8:	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER \?CCL12
	EQUAL?	PRSO,FORESAILS /FALSE
?CCL12:	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL16
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,CROOCQ,ROOMS
	RTRUE	
?CCL16:	PRINT	STR?369
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?TELL \?CCL18
	IN?	CROOCQ,CAULDRON /?CCL21
	IN?	CROOCQ,VILLAGE-SQUARE \FALSE
?CCL21:	PRINTI	"He's in no condition to respond."
	CRLF	
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL18:	EQUAL?	PRSA,V?SEND \FALSE
	EQUAL?	PRSO,CROOCQ \FALSE
	PRINTR	"He's too far gone to go on deck; almost too tired to stand."


	.FUNCT	SEND-HIM-OUT?:ANY:0:0
	EQUAL?	SCENE,S-ERASMUS \FALSE
	EQUAL?	PRSA,V?REPLACE /TRUE
	EQUAL?	PRSA,V?FOLLOW \?PRD7
	EQUAL?	PRSO,ME /TRUE
?PRD7:	EQUAL?	PRSA,V?WALK \?PRD10
	EQUAL?	P-WALK-DIR,P?UP,P?OUT /TRUE
?PRD10:	EQUAL?	PRSA,V?STEP-ON,V?TAKE,V?BOARD /?PRD15
	EQUAL?	PRSA,V?WALK-TO,V?CLIMB-ON \FALSE
?PRD15:	EQUAL?	PRSO,DECK,BRIDGE-OF-ERASMUS,ON-DECK /TRUE
	RFALSE	

	.ENDSEG

	.ENDI
