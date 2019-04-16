
	.SEGMENT "QUAKE"


	.FUNCT	PLATEAU-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	PUTP	BLACKTHORNE,P?HEALTH,5
	MOVE	SWORDS,BLACKTHORNE
	FSET	SWORDS,WEARBIT
	FSET	SWORDS,SCOREBIT
	ICALL1	B-SIT
	MOVE	MARIKO,HERE
	MOVE	TORANAGA,HERE
	CALL	QUEUE,I-QUAKE,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	IN?	WINNER,HERE \?CCL8
	PRINTR	"This is a plateau on a hillside.Beyond are the rising foothills of mountains that soar to a clouded sky.Below in the valley is the samurai camp.The day is sultry."
?CCL8:	PRINTR	"You are in a fissure, below ground level in the shaking earth."
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	ZERO?	QUAKE-CNT /FALSE
	ZERO?	QUAKE? /?CCL15
	EQUAL?	PRSA,V?LIE-DOWN /?CTR14
	EQUAL?	PRSA,V?HOLD,V?BOARD,V?HOLD-ON /?PRD21
	EQUAL?	PRSA,V?HIT \?CCL15
?PRD21:	EQUAL?	PRSO,GROUND \?CCL15
?CTR14:	PRINTR	"You hold the ground like a baby holding its mother.You want the noise and shaking to stop!"
?CCL15:	EQUAL?	PRSA,V?YELL \?CCL25
	ZERO?	QUAKE? /?CCL25
	PRINTR	"Your lungs try to force a scream out, but nothing comes."
?CCL25:	IN?	MAIN-FISSURE,HERE \?CCL29
	FSET?	MAIN-FISSURE,RMUNGBIT /?CCL29
	EQUAL?	PRSA,V?CLIMB-DOWN,V?BOARD /?CCL29
	CALL1	MOTION-VERB?
	ZERO?	STACK /?CCL29
	FSET	MAIN-FISSURE,RMUNGBIT
	PRINTR	"Desperately you scramble away from the onrushing chasm, grabbing at the ground, forcing yourself to move, and it passes you by."
?CCL29:	EQUAL?	PRSA,V?WALK \?CCL35
	EQUAL?	P-WALK-DIR,P?DOWN \?CCL35
	IN?	MARIKO,SIDE-FISSURE \?CCL35
	ICALL	PERFORM,V?THROUGH,SIDE-FISSURE
	RTRUE	
?CCL35:	EQUAL?	PRSA,V?WALK \?CCL40
	EQUAL?	P-WALK-DIR,P?DOWN \?CCL40
	IN?	TORANAGA,MAIN-FISSURE \?CCL40
	ICALL	PERFORM,V?THROUGH,MAIN-FISSURE
	RTRUE	
?CCL40:	ZERO?	QUAKE? \?PRD47
	CALL2	QUEUED?,I-CRAWL
	ZERO?	STACK /?CCL45
?PRD47:	EQUAL?	PRSA,V?WALK /?CTR44
	EQUAL?	PRSA,V?STAND \?CCL45
	FSET?	BLACKTHORNE,SITTING \?CCL45
?CTR44:	PRINTR	"You can't stand up.You can barely avoid panic."
?CCL45:	EQUAL?	PRSA,V?FOLLOW \?CCL55
	EQUAL?	PRSO,MARIKO \?CCL58
	IN?	MARIKO,SIDE-FISSURE \?CCL58
	CALL	PERFORM,V?THROUGH,SIDE-FISSURE
	RSTACK	
?CCL58:	EQUAL?	PRSI,TORANAGA \FALSE
	IN?	TORANAGA,MAIN-FISSURE \FALSE
	ICALL	PERFORM,V?THROUGH,MAIN-FISSURE
	RTRUE	
?CCL55:	EQUAL?	PRSA,V?EXAMINE \?CCL66
	EQUAL?	PRSO,TORANAGA,MARIKO \?CCL66
	IN?	PRSO,HERE /?CCL66
	LOC	PRSO
	ICALL	PERFORM,V?LOOK-INSIDE,STACK
	RTRUE	
?CCL66:	EQUAL?	PRSA,V?LOOK-DOWN \?CCL71
	IN?	SIDE-FISSURE,HERE \?CCL74
	IN?	MARIKO,SIDE-FISSURE \?CCL74
	ICALL	PERFORM,V?LOOK-INSIDE,SIDE-FISSURE
	RTRUE	
?CCL74:	IN?	MAIN-FISSURE,HERE \?CCL78
	IN?	TORANAGA,MAIN-FISSURE \?CCL78
	ICALL	PERFORM,V?LOOK-INSIDE,MAIN-FISSURE
	RTRUE	
?CCL78:	ZERO?	QUAKE? /FALSE
	PRINTR	"The ground is trembling and rolling!"
?CCL71:	EQUAL?	PRSA,V?LISTEN \?CCL84
	EQUAL?	PRSO,FALSE-VALUE,GROUND \?CCL84
	ZERO?	QUAKE? /?CCL84
	PRINTR	"Everything around you rumbles with a deep basso profundity that you can barely believe."
?CCL84:	EQUAL?	PRSA,V?FIND,V?SAY,V?YELL-AT \?CCL89
	EQUAL?	PRSO,TORANAGA \?CCL92
	IN?	TORANAGA,SIDE-FISSURE \?CCL92
	FSET?	TORANAGA,DEAD \?CCL97
	PRINTR	"He is dead."
?CCL97:	PRINTI	"He has fallen into "
	ICALL2	THE-PRINT,SIDE-FISSURE
	PRINTR	"!"
?CCL92:	EQUAL?	PRSO,MARIKO \FALSE
	IN?	MARIKO,SIDE-FISSURE \FALSE
	FSET?	MARIKO,DEAD \?CCL104
	PRINTR	"She is dead."
?CCL104:	PRINTI	"She has fallen into "
	ICALL2	THE-PRINT,SIDE-FISSURE
	PRINTR	"!"
?CCL89:	EQUAL?	PRSA,V?TAKE,V?HELP,V?REACH-FOR \?CCL106
	EQUAL?	PRSO,TORANAGA \?CCL106
	IN?	MAIN-FISSURE,HERE /?CCL111
	PRINTR	"You will yourself to crawl to Toranaga, but your body refuses, forcing you to hug the once-solid ground."
?CCL111:	IN?	BLACKTHORNE,SIDE-FISSURE \?CCL113
	CALL2	DO-WALK,P?UP
	RSTACK	
?CCL113:	ZERO?	TORANAGA-HELD-FLAG /?CCL115
	PRINTR	"You hold Toranaga in a death grip, unsure of how long you can hold him with the earth trembling like a leaf around you, but knowing it's his death if you let go."
?CCL115:	FSET?	MAIN-FISSURE,SCOREBIT \FALSE
	IN?	BLACKTHORNE,MAIN-FISSURE \?CCL120
	CALL2	JIGS-UP,STR?567
	RSTACK	
?CCL120:	ICALL2	MARGINAL-PIC,P-QUAKE
	SET	'TORANAGA-HELD-FLAG,TRUE-VALUE
	PRINTR	"You come out of your stupor and lunge forward.Your left hand grabs Toranaga's sash."
?CCL106:	EQUAL?	PRSA,V?DROP \?CCL122
	EQUAL?	PRSO,TORANAGA \?CCL122
	ZERO?	TORANAGA-HELD-FLAG /FALSE
	FSET?	MAIN-FISSURE,SCOREBIT \FALSE
	SET	'TORANAGA-HELD-FLAG,FALSE-VALUE
	MOVE	TORANAGA,MAIN-FISSURE
	PRINTR	"You let go, and begins to lose his precarious balance."
?CCL122:	EQUAL?	PRSA,V?TAKE,V?HELP,V?REACH-FOR \?CCL131
	EQUAL?	PRSO,MARIKO \?CCL131
	ZERO?	TORANAGA-HELD-FLAG /?CCL136
	FSET?	MAIN-FISSURE,SCOREBIT \?CCL136
	MOVE	TORANAGA,MAIN-FISSURE
	SET	'TORANAGA-HELD-FLAG,FALSE-VALUE
	PRINTR	"You try to reach Mariko and hold on to Toranaga at the same time, but it's impossible.Just as your fingers reach her, Toranaga's sash slips from your grasp and he tumbles into the abyss."
?CCL136:	IN?	MARIKO,SIDE-FISSURE \?CCL140
	PRINTR	"She's too far away, too deep in the fissure."
?CCL140:	PRINTR	"Crawling as fast as you can, you try to reach her, but there's no chance."
?CCL131:	EQUAL?	PRSA,V?GIVE \?CCL142
	EQUAL?	PRSO,SWORDS \?CCL142
	EQUAL?	PRSI,TORANAGA \?CCL142
	IN?	TORANAGA,HERE \?CTR147
	FSET?	SIDE-FISSURE,RMUNGBIT /?CCL148
?CTR147:	PRINTR	"This is a strange time to be trying to give your swords away."
?CCL148:	FSET?	MAIN-FISSURE,SCOREBIT \?CCL152
	PRINTR	"Toranaga refuses your gift.""I have perfectly good swords of my own,"" he says."
?CCL152:	ICALL2	SCORE-OBJECT,SWORDS
	SET	'DELAY-CNT,0
	MOVE	SWORDS,TORANAGA
	FSET	SWORDS,WEARBIT
	ICALL	MARGINAL-PIC,P-SWORDS,FALSE-VALUE
	PRINTI	"You kneel in front of Toranaga and offer your sword as a sword should be offered."""
	ICALL2	PRINTUNDER,STR?568
	PRINTI	", Toranaga-sama,"" you say.He accepts the sword and shoves it into his sash."""
	ICALL2	PRINTUNDER,STR?509
	PRINTI	", Anjin-san.""He smiles, leans forward, and claps you once on the shoulder, hard."""
	ICALL2	PRINTUNDER,STR?569
	PRINTR	""" Friend, eh?"
?CCL142:	EQUAL?	PRSA,V?EXAMINE \?CCL154
	EQUAL?	PRSO,SWORDS \?CCL154
	FSET?	MAIN-FISSURE,SCOREBIT /FALSE
	PRINTR	"The short stabbing sword is gone, but the killing sword is still scabbarded, though muddied and scarred."
?CCL154:	EQUAL?	PRSA,V?PISS \FALSE
	EQUAL?	PRSO,FALSE-VALUE,MAIN-FISSURE,SIDE-FISSURE \FALSE
	FSET?	MAIN-FISSURE,SCOREBIT /FALSE
	IN?	TORANAGA,HERE \FALSE
	PRINTI	"Nothing comes, not even a dribble."
	FSET?	SIDE-FISSURE,RMUNGBIT \?CCL171
	FSET?	PLATEAU,SCOREBIT \?CCL171
	PRINTI	"You and Toranaga laugh at the sheer joy of being alive, which blocks you even more.At length you both succeed.You relax and collect your strength."
	CRLF	
	SET	'DELAY-CNT,0
	CALL2	SCORE-OBJECT,PLATEAU
	RSTACK	
?CCL171:	CRLF	
	RTRUE	


	.FUNCT	I-QUAKE:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	QUAKE-CNT,3 \?CCL5
	FSET?	MAIN-FISSURE,RMUNGBIT /?CND3
	GRTR?	DELAY-CNT,1 /?CTR9
	IN?	WINNER,MAIN-FISSURE \?CCL10
?CTR9:	CRLF	
	ICALL2	JIGS-UP,STR?570
	JUMP	?CND3
?CCL10:	CRLF	
	PRINTI	"You stare in horror as the fissure rumbles toward you!"
	CRLF	
	JUMP	?CND3
?CCL5:	EQUAL?	QUAKE-CNT,11 \?CCL14
	FSET?	SWORDS,SCOREBIT \?CND3
	LESS?	DELAY-CNT,2 \?CND3
	RFALSE	
?CCL14:	EQUAL?	QUAKE-CNT,12 \?CND3
	FSET?	SWORDS,SCOREBIT \?CCL22
	LESS?	DELAY-CNT,2 /FALSE
?CCL22:	FSET?	PLATEAU,SCOREBIT \?CND3
	LESS?	DELAY-CNT,2 /FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'QUAKE-CNT
	EQUAL?	QUAKE-CNT,1 \?CCL30
	SET	'QUAKE?,TRUE-VALUE
	CRLF	
	PRINTI	"Suddenly, the silence is colossal.Then the earth begins to shake"
	CALL1	B-LYING?
	ZERO?	STACK \?CCL33
	ICALL1	B-LIE-DOWN
	PRINTR	" and you are tumbled to the ground."
?CCL33:	PRINTR	"."
?CCL30:	EQUAL?	QUAKE-CNT,2 \?CCL35
	SET	'QUAKE?,FALSE-VALUE
	CRLF	
	PRINTR	"You feel your lungs about to burst, and every fiber of your being screams in panic.Toranaga and Mariko hold onto the ground with their hands and feet.The rumbling, catastrophic roar comes from earth and sky, surrounding you, building and building.

An avalanche of rocks starts from the mountain to the north and howls down into the valley below.Part of the samurai camp vanishes.

Then the tremor stops."
?CCL35:	EQUAL?	QUAKE-CNT,3 \?CCL37
	SET	'QUAKE?,TRUE-VALUE
	MOVE	MAIN-FISSURE,HERE
	CRLF	
	PRINTI	"Again the earth cries out.The second quake begins"
	CALL1	B-LYING?
	ZERO?	STACK \?CND38
	ICALL1	B-LIE-DOWN
	PRINTI	", tossing you like a rag doll into the dust"
?CND38:	PRINTR	".The earth rips open at the north end of the plateau.A gaping fissure rushes toward you at an incredible speed."
?CCL37:	EQUAL?	QUAKE-CNT,4 \?CCL41
	ICALL2	THIS-IS-IT,TORANAGA
	FSET	MAIN-FISSURE,SCOREBIT
	CRLF	
	PRINTR	"Toranaga and Mariko teeter on the brink of the cleft.As though in a nightmare you see Toranaga, nearest the maw, begin to topple into it."
?CCL41:	EQUAL?	QUAKE-CNT,5 \?CCL43
	CRLF	
	ZERO?	TORANAGA-HELD-FLAG \?CCL46
	MOVE	TORANAGA,MAIN-FISSURE
	FSET	TORANAGA,DEAD
	FSET	TORANAGA,NDESCBIT
	PRINTI	"Toranaga plunges into the cleft and is lost from sight!"
	CRLF	
	JUMP	?CND44
?CCL46:	SET	'TORANAGA-HELD-FLAG,FALSE-VALUE
	PRINTI	"Mud and rocks pour down, dragging you and Toranaga into the fissure.You fight for a handhold and foothold, almost pulled down into the abyss.Still partially stunned, Toranaga hacks his toes into the face of the wall and half-dragged, half-carried by you, claws his way out.You both lay gasping on the ground."
	CRLF	
	MOVE	BLACKTHORNE,HERE
	ICALL2	SCORE-OBJECT,MAIN-FISSURE
?CND44:	CRLF	
	PRINTR	"Suddenly, there is another shock."
?CCL43:	EQUAL?	QUAKE-CNT,6 \?CCL48
	FSET	MAIN-FISSURE,RMUNGBIT
	REMOVE	MAIN-FISSURE
	MOVE	SIDE-FISSURE,HERE
	MOVE	MAIN-FISSURE,HERE
	MOVE	MARIKO,SIDE-FISSURE
	ICALL2	THIS-IS-IT,MARIKO
	CRLF	
	PRINTR	"The earth splits again, opening a side fissure away from the main cleft.Mariko screams as it swallows her."
?CCL48:	EQUAL?	QUAKE-CNT,7 \?CCL50
	CRLF	
	PRINTI	"There is a new shock."
	IN?	BLACKTHORNE,SIDE-FISSURE \?CCL53
	PRINTR	"The ledge you and Mariko are on mostly gives way, only a few tiny holds remaining as the rest falls downward."
?CCL53:	IN?	MARIKO,SIDE-FISSURE \?CND51
	PRINTR	"Mariko screams for help from within the side fissure."
?CND51:	CRLF	
	RTRUE	
?CCL50:	EQUAL?	QUAKE-CNT,8 \?CCL56
	CRLF	
	PRINTI	"The chasm howls and begins to close."
	IN?	BLACKTHORNE,SIDE-FISSURE \?CCL59
	IN?	MARIKO,SIDE-FISSURE \?CCL59
	PRINTR	"You and Mariko fight for balance."
?CCL59:	IN?	BLACKTHORNE,SIDE-FISSURE \?CCL63
	PRINTR	"The far wall screeches sickeningly as it approaches.Mud and stones tumble off it."
?CCL63:	IN?	MARIKO,SIDE-FISSURE \?CND57
	PRINTR	"You can barely hear Mariko over the rumble of the earthquake.""Anjin-san!Help me!"""
?CND57:	CRLF	
	RTRUE	
?CCL56:	EQUAL?	QUAKE-CNT,9 \?CCL66
	SET	'QUAKE?,FALSE-VALUE
	CRLF	
	PRINTI	"The gap is closing."
	IN?	MARIKO,SIDE-FISSURE \?CND67
	FSET	MARIKO,DEAD
	FSET	MARIKO,NDESCBIT
	PRINTR	"Mariko's ledge gives way, and she slides into the depths, clutching futilely at the mud walls, her last scream silenced."
?CND67:	CRLF	
	RTRUE	
?CCL66:	EQUAL?	QUAKE-CNT,10 \?CCL70
	IN?	BLACKTHORNE,SIDE-FISSURE \?CCL73
	CRLF	
	PRINTI	"Part of the wall falls away, carrying you with it into the abyss."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL73:	FSET	SIDE-FISSURE,RMUNGBIT
	CRLF	
	PRINTR	"The gap stops -- six paces across the mouth, eight deep.

A bird screeches out of a tree and takes to the air screaming.In the grass an ant moves."
?CCL70:	EQUAL?	QUAKE-CNT,11 \?CCL75
	IN?	TORANAGA,HERE \?CCL78
	CRLF	
	PRINTI	"Toranaga points to the fissure that "
	IN?	MARIKO,HERE \?CCL81
	PRINTI	"almost swallowed him"
	JUMP	?CND79
?CCL81:	PRINTI	"swallowed Mariko"
?CND79:	PRINTI	", now only a narrow ditch.He belches loudly, then hawks and spits.A torrent of abuse pours over the ditch"
	IN?	MARIKO,HERE \?CCL84
	PRINTI	", Mariko translating with increasing amusement: ""The pox on the karma, the pox on the quake, the pox on the ditch -- I've lost my "
	IN?	SWORDS,TORANAGA \?CND85
	PRINTI	"best "
?CND85:	PRINTR	"swords and the pox on that too!"""
?CCL84:	PRINTC	46
	CRLF	
	CRLF	
	PRINTR	"You are stunned.Mariko would have said ""Karma,"" but you cannot understand such stoicism."
?CCL78:	CRLF	
	PRINTI	"You lie exhausted on the ground.What will happen now, with Toranaga dead?Ishido will win, for certain, and you will never survive.Mariko "
	IN?	MARIKO,HERE \?CCL89
	PRINTI	"says"
	JUMP	?CND87
?CCL89:	PRINTI	"would have said"
?CND87:	PRINTI	" ""Karma,"" but you cannot take it so philosophically."
	CRLF	
	ICALL1	FAILED-SCENE
	RETURN	M-FATAL
?CCL75:	EQUAL?	QUAKE-CNT,12 \?CCL91
	FSET?	PLATEAU,SCOREBIT \?CCL94
	CRLF	
	PRINTR	"Toranaga rises, straddles the now narrow ditch, hitches up his kimono, and attempts to urinate into it.Nothing comes, and he laughs, inviting you to join him."
?CCL94:	CRLF	
	PRINTR	"Toranaga looks around, savoring life, stretching like a cat.He is able to take a peasant's enjoyment in mere existence."
?CCL91:	EQUAL?	QUAKE-CNT,13 \FALSE
	IN?	MARIKO,HERE \?CCL99
	CRLF	
	PRINT	STR?571
	PRINTI	"almost dead, and all worry and heartache was wasted."
	ICALL2	PRINTUNDER,STR?572
	PRINTI	", you understand karma now."
	CRLF	
	REMOVE	SWORDS
	CALL1	NEXT-SCENE
	RSTACK	
?CCL99:	CRLF	
	PRINT	STR?571
	PRINTI	"alive, and now Mariko is dead."
	ICALL2	PRINTUNDER,STR?572
	PRINTI	", you understand karma now, but you can't accept it."
	CRLF	
	CALL1	FAILED-SCENE
	RSTACK	


	.FUNCT	EARTHQUAKE-F:ANY:0:0
	EQUAL?	PRSA,V?LISTEN \FALSE
	ZERO?	QUAKE? /?CCL6
	PRINTR	"There is a low rumbling noise all around you, coming from deep in the earth."
?CCL6:	PRINTR	"Right now, all is quiet."


	.FUNCT	MAIN-FISSURE-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	FSET?	TORANAGA,DEAD \?CCL6
	EQUAL?	PRSO,TORANAGA /?CTR5
	EQUAL?	PRSI,TORANAGA \?CCL6
?CTR5:	PRINTR	"Toranaga has fallen out of sight to the bottom of the abyss."
?CCL6:	EQUAL?	PRSA,V?TAKE \?CCL12
	EQUAL?	PRSO,MAIN-FISSURE \?CCL12
	PRINTR	"You dig your fingers into the muddy walls of the cleft, your fingernails tearing from the effort."
?CCL12:	EQUAL?	PRSA,V?LOOK-UP \?CCL16
	PRINTR	"You can see the lip of the chasm and beyond, the blue sky."
?CCL16:	EQUAL?	PRSA,V?DISEMBARK,V?CLIMB-UP /?CCL18
	EQUAL?	PRSA,V?WALK \?PRD21
	EQUAL?	P-WALK-DIR,P?UP,P?OUT /?CCL18
?PRD21:	EQUAL?	PRSA,V?CLIMB-FOO \FALSE
	EQUAL?	PRSO,WALL \FALSE
?CCL18:	MOVE	WINNER,HERE
	ICALL1	B-LIE-DOWN
	PRINTR	"You pull yourself out of the fissure."
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?LISTEN \?CCL30
	ICALL	PERFORM,V?LISTEN,EARTHQUAKE
	RTRUE	
?CCL30:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?CCL32
	PRINTI	"The cleft is is twenty paces deep and ten across and stinks of death."
	IN?	TORANAGA,MAIN-FISSURE \?CCL35
	IN?	WINNER,MAIN-FISSURE \?CCL38
	PRINTR	"You are only barely holding on beside Toranaga."
?CCL38:	PRINTR	"Toranaga clings precariously to the wall a few feet below."
?CCL35:	CRLF	
	RTRUE	
?CCL32:	EQUAL?	PRSA,V?ENTER,V?BOARD,V?CLIMB-DOWN \FALSE
	FSET?	MAIN-FISSURE,RMUNGBIT /?CCL43
	MOVE	WINNER,MAIN-FISSURE
	ICALL1	B-STAND
	PRINTR	"You claw your way to the fissure and into it, fingers and toes fighting for a hold on the mud and rocks of the side wall."
?CCL43:	PRINT	STR?573
	CRLF	
	RTRUE	


	.FUNCT	GENERIC-FISSURE-F:ANY:2:2,R,F
	FSET?	MAIN-FISSURE,SCOREBIT \?CCL3
	FSET?	SIDE-FISSURE,SCOREBIT /FALSE
?CCL3:	FSET?	MAIN-FISSURE,SCOREBIT \?CCL7
	RETURN	MAIN-FISSURE
?CCL7:	FSET?	SIDE-FISSURE,SCOREBIT \?CCL9
	RETURN	SIDE-FISSURE
?CCL9:	FSET?	MAIN-FISSURE,RMUNGBIT /?CCL11
	FSET?	SIDE-FISSURE,RMUNGBIT \FALSE
?CCL11:	FSET?	MAIN-FISSURE,RMUNGBIT /?CCL15
	RETURN	MAIN-FISSURE
?CCL15:	FSET?	SIDE-FISSURE,RMUNGBIT /?CCL17
	RETURN	SIDE-FISSURE
?CCL17:	RETURN	MAIN-FISSURE


	.FUNCT	FISSURE-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	OBJ,SIDE-FISSURE \?CCL6
	PRINTI	"A deep and narrow side fissure arcs off from the main fissure."
	IN?	MARIKO,SIDE-FISSURE \?CCL9
	IN?	BLACKTHORNE,SIDE-FISSURE \?CCL9
	PRINTI	"You and Mariko are clinging"
	JUMP	?CND7
?CCL9:	IN?	MARIKO,SIDE-FISSURE \?CCL13
	PRINTI	"Mariko clings"
	JUMP	?CND7
?CCL13:	IN?	BLACKTHORNE,SIDE-FISSURE /?CTR14
	RETURN	M-FATAL
?CTR14:	PRINTI	"You are clinging"
?CND7:	PRINTI	" desperately to the crumbling"
	PRINT	STR?574
	RETURN	M-FATAL
?CCL6:	EQUAL?	OBJ,MAIN-FISSURE \FALSE
	PRINTI	"The main fissure snakes down from the hill, its muddy depths gaping."
	IN?	BLACKTHORNE,SIDE-FISSURE /?CCL19
	RETURN	M-FATAL
?CCL19:	PRINTI	"You are clinging desperately to the muddy"
	PRINT	STR?574
	RETURN	M-FATAL


	.FUNCT	SIDE-FISSURE-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	FSET?	MARIKO,DEAD \?CCL6
	EQUAL?	PRSO,MARIKO /?CTR5
	EQUAL?	PRSI,MARIKO \?CCL6
?CTR5:	PRINTR	"Mariko has fallen into the depths."
?CCL6:	EQUAL?	PRSA,V?TAKE \?CCL12
	EQUAL?	PRSO,SIDE-FISSURE \?CCL12
	PRINTR	"You try to grip the crumbling ledge with your feet, but it's giving way beneath you!"
?CCL12:	EQUAL?	PRSA,V?LOOK-UP \?CCL16
	PRINTI	"You can see the crumbling mud of the chasm wall"
	IN?	TORANAGA,PLATEAU \?CCL19
	IN?	MARIKO,PLATEAU /?CCL19
	PRINTR	", and Toranaga reaching down towards you with his iron grip."
?CCL19:	PRINTR	"."
?CCL16:	EQUAL?	PRSA,V?TAKE,V?REACH-FOR \?CCL23
	EQUAL?	PRSO,MARIKO \?CCL23
	PRINTR	"You pull her towards you as the ledge crumbles further."
?CCL23:	EQUAL?	PRSA,V?RAISE,V?PUSH-UP,V?PUSH-OUT /?PRD31
	EQUAL?	PRSA,V?PUSH,V?HELP,V?THROW-OFF \?PRD29
?PRD31:	EQUAL?	PRSO,MARIKO \?PRD29
	EQUAL?	PRSI,FALSE-VALUE,ROOMS,SIDE-FISSURE /?CTR26
?PRD29:	EQUAL?	PRSA,V?PUSH-TO,V?PUSH-UP,V?GIVE \?CCL27
	EQUAL?	PRSO,MARIKO \?CCL27
	EQUAL?	PRSI,TORANAGA \?CCL27
?CTR26:	PRINTI	"Your terror lends you inhuman strength and somehow you manage to rip Mariko out of the tomb and shove her upward."
	IN?	TORANAGA,HERE \?CCL40
	MOVE	MARIKO,HERE
	PRINTI	"Toranaga clutches her wrist and hauls her over the lip of the chasm."
	CRLF	
	CALL2	SCORE-OBJECT,SIDE-FISSURE
	RSTACK	
?CCL40:	PRINTR	"She tries to pull herself over the lip of the chasm but she can't get a grip on the mud and falls back."
?CCL27:	EQUAL?	PRSA,V?DISEMBARK,V?CLIMB-UP /?CCL42
	EQUAL?	PRSA,V?WALK \?PRD45
	EQUAL?	P-WALK-DIR,P?OUT,P?UP /?CCL42
?PRD45:	EQUAL?	PRSA,V?CLIMB-FOO \FALSE
	EQUAL?	PRSO,WALL \FALSE
?CCL42:	MOVE	WINNER,HERE
	ICALL	QUEUE,I-CRAWL,2
	ICALL1	B-LIE-DOWN
	PRINTR	"You tear yourself free of the mud and crumbling walls and grope half out of your grave.You lie on the shuddering brink, your lungs gulping air, unable to crawl away."
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?LISTEN \?CCL54
	ICALL	PERFORM,V?LISTEN,EARTHQUAKE
	RTRUE	
?CCL54:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?CCL56
	PRINTI	"The fissure is ten paces wide and thirty paces deep."
	IN?	MARIKO,SIDE-FISSURE \?CND57
	FSET?	MARIKO,DEAD /?CND57
	IN?	WINNER,SIDE-FISSURE \?CCL63
	PRINTR	"You are standing beside Mariko on a small ledge."
?CCL63:	PRINTR	"Mariko is shivering on a ledge a few feet below."
?CND57:	CRLF	
	RTRUE	
?CCL56:	EQUAL?	PRSA,V?REACH-IN \?CCL65
	ICALL	PERFORM,V?TAKE,MARIKO
	RTRUE	
?CCL65:	EQUAL?	PRSA,V?ENTER,V?BOARD,V?CLIMB-DOWN \FALSE
	FSET?	SIDE-FISSURE,RMUNGBIT /?CCL70
	MOVE	WINNER,SIDE-FISSURE
	ICALL1	B-STAND
	PRINTI	"You let yourself slide down, mud and stones crumbling off of the wall and almost blinding you."
	IN?	MARIKO,SIDE-FISSURE \?CCL73
	PRINTR	"You reach the narrow ledge on which Mariko is standing."
?CCL73:	PRINTR	"You reach a narrow crumbling ledge."
?CCL70:	PRINT	STR?573
	CRLF	
	RTRUE	


	.FUNCT	I-CRAWL:ANY:0:0
	RFALSE	


	.FUNCT	ZATAKI-AFTER-F:ANY:0:0
	ICALL	MARGINAL-PIC,P-WARRIOR,TRUE-VALUE,P-WARRIOR-CORNER,TRUE-VALUE
	PRINTI	"At the Hour of the Goat the sentries on the bridge stand aside.The cortege begins to cross.First are the heralds carrying banners bedecked with the all-powerful cipher of the Regents, then the rich palanquin, and finally more guards."
	CRLF	
	CRLF	
	PRINTI	"Villagers bow.All are on their knees, secretly agog at such richness and pomp."
	CRLF	
	CRLF	
	PRINTI	"Saigawa Zataki, Lord of Shinano and Toranaga's half brother, rides in the palanquin."
	CRLF	
	CRLF	
	PRINTI	"""Welcome, brother.""Toranaga steps off the dais and bows.He wears the simplest of kimonos and soldier's straw sandals.And swords.""Please excuse me for receiving you so informally, but I came as quickly as I could."""
	CRLF	
	CRLF	
	PRINTI	"Zataki gets out of the palanquin and bows in return, beginning the interminable, meticulous formalities of the ceremonial that now rules both of them."
	CRLF	
	CRLF	
	PRINTI	"At length they are seated opposite each other on the dais, two swords lengths apart.Mariko serves ceremonial cha.Then Zataki says brusquely, ""I bring orders from the Council of Regents."""
	CRLF	
	CRLF	
	PRINTI	"A sudden hush falls on the square.Everyone, even his own men, is aghast at Zataki's lack of manners, at the insolent way he said 'orders' and not 'message,' and at his failure to wait for Toranaga to ask, ""How can I be of service?"" as the ceremonial demanded."
	CRLF	
	CRLF	
	PRINTI	"Zataki rips two small scrolls out of his sleeve.He breaks the seal on the first scroll and reads, in a loud, chilling voice: ""By order of the Council of Regents, in the name of the Emperor: We greet our vassal Yoshi Toranaga and invite him to make obeisance before us in Osaka forthwith, and invite him to inform our ambassador, the Regent Saigawa Zataki, if our invitation is accepted or refused -- forthwith."""
	CRLF	
	CRLF	
	PRINTI	"He places the scroll in front of him.Toranaga signals to Buntaro, who bows low to Zataki, picks up the scroll, and brings it to Toranaga."
	CRLF	
	CRLF	
	PRINTI	"Toranaga studies the scroll interminably."
	CRLF	
	CRLF	
	PRINTI	"""Give me your answer now.You've no more time!Forthwith, the message said.Of course you refuse to obey, good, so it's done.Here!""Zataki puts the second scroll on the tatamis.""Here's your formal impeachment and order to commit seppuku, which you'll treat with equal contempt!The next time we meet will be on a battlefield!"""
	CRLF	
	CRLF	
	PRINTI	"""How can I prove I'm not trying to overthrow the heir?""Toranaga asks his brother."
	CRLF	
	CRLF	
	PRINTI	"""Immediately abdicate all your titles and power to your son and heir, Lord Sudara, and commit seppuku today!Then I and all my men will support him as Lord of the Kwanto!"""
	CRLF	
	CRLF	
	PRINTI	"""I'll consider what you've said."""
	CRLF	
	CRLF	
	PRINTI	"""Is this another of your tricks?Buntaro-san, give your master the second scroll!"""
	CRLF	
	CRLF	
	PRINTI	"""No!""Toranaga's voice reverberates around the square.Then, with great ceremony, he adds loudly, ""I agree to go to Osaka and to submit to the will of the Council.""He bows formally."
	CRLF	
	CRLF	
	PRINTI	"""You're going to submit?,"" Zataki begins, his face twisting with disbelief."
	CRLF	
	CRLF	
	PRINTR	"""Listen!I accept the invitation!I will leave today!"""


	.FUNCT	ZATAKI-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?WHO \FALSE
	PRINTI	"Zataki is Lord of Shinano and half-brother of Toranaga."
	LESS?	SCENE,S-QUAKE /?CND7
	PRINTI	"He is a member of the Council of Regents, replacing Lord Sugiyama, who was murdered by "
	ICALL2	PRINTUNDER,STR?565
	PRINTR	" -- or assassinated by Ishido."
?CND7:	CRLF	
	RTRUE	

	.ENDSEG

	.SEGMENT "YOKOSE"


	.FUNCT	YOKOSE-BATH-HOUSE-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	MOVE	MARIKO,YOKOSE-BATH-HOUSE
	MOVE	ROBE,MARIKO
	FSET	ROBE,WEARBIT
	MOVE	CHIMMOKO,YOKOSE-BATH-HOUSE
	MOVE	GYOKO,YOKOSE-SPA-5
	MOVE	KIKU,YOKOSE-SPA-5
	MOVE	YOSHINAKA,YOKOSE-BATH-HOUSE
	CALL	QUEUE,I-YOKOSE-BATH,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-BEG \?CCL5
	EQUAL?	PRSA,V?WALK \?CCL8
	EQUAL?	P-WALK-DIR,P?WEST \?CCL8
	FSET?	YOKOSE-BATHTUB,SCOREBIT \?CCL8
	PRINTR	"""Anjin-san, you must bathe before you go to your room!"" chides Mariko."
?CCL8:	EQUAL?	PRSA,V?EXAMINE \?CCL13
	EQUAL?	PRSO,MARIKO \?CCL13
	FSET?	ROBE,WEARBIT \?CCL18
	PRINTR	"Mariko is standing near the tub, wearing a thick cotton bathing robe tied loosely about her waist."
?CCL18:	IN?	MARIKO,YOKOSE-BATHTUB \?CCL21
	IN?	BLACKTHORNE,YOKOSE-BATHTUB \?CCL24
	PRINTI	"Mariko is next to you in the bathtub, washing unhurriedly."
	JUMP	?CND19
?CCL24:	PRINTI	"Mariko is in the bath tub, naked."
	JUMP	?CND19
?CCL21:	PRINTI	"She is naked, preparing to take her bath."
?CND19:	PRINTR	"The first time you saw her naked you were greatly affected.Now her nakedness, of itself, does not touch you physically.Living closely in Japanese style in a Japanese house where the walls are paper and the rooms multipurpose, you have seen her unclothed and partially clothed many times."
?CCL13:	EQUAL?	PRSA,V?THROW \?CCL26
	EQUAL?	PRSO,TOWEL \?CCL26
	EQUAL?	PRSI,MARIKO \?CCL26
	PRINTR	"""You are behaving like a child, Anjin-san!"""
?CCL26:	IN?	PLAYER,HERE \?CCL31
	CALL1	TAKE-A-BATH?
	ZERO?	STACK /?CCL31
	ICALL	PERFORM,V?BOARD,YOKOSE-BATHTUB
	RTRUE	
?CCL31:	EQUAL?	PRSA,V?RINSE \?CCL35
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL35
	FSET?	BLACKTHORNE,RMUNGBIT \?CCL40
	PRINTR	"You already have!"
?CCL40:	ICALL	PERFORM,V?BOARD,YOKOSE-BATHTUB
	RTRUE	
?CCL35:	EQUAL?	PRSA,V?BATHE \?CCL42
	EQUAL?	PRSO,MARIKO \?CCL42
	IN?	MARIKO,YOKOSE-BATHTUB \?CCL42
	IN?	WINNER,YOKOSE-BATHTUB /?CCL42
	CALL2	YOULL-HAVE-TO,STR?577
	RSTACK	
?CCL42:	EQUAL?	PRSA,V?BATHE \FALSE
	ZERO?	PRSO /FALSE
	FSET?	PRSO,PERSON \?CCL53
	FSET?	PRSO,PLURAL \?CCL56
	PRINT	STR?427
	CRLF	
	RTRUE	
?CCL56:	ICALL1	CTHE-PRINT-PRSO
	PRINT	STR?428
	ICALL2	PRINT-HIS/HER,PRSO
	PRINTR	" head."
?CCL53:	ICALL1	CTHE-PRINT-PRSO
	PRINT	STR?429
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-END \FALSE
	IN?	TOWEL,HERE \FALSE
	FSET	TOWEL,TOUCHBIT
	RFALSE	


	.FUNCT	JOURNEY-AFTER-F:ANY:0:0
	PRINTI	"You continue on to Yedo, Toranaga's capital.Toranaga has delayed his departure for Osaka for weeks, complaining of the weather one day, and the need for careful preparation another.He tells Hiro-matsu, ""I never intended to go to Osaka.Ishido took the bait.With no real concession whatsoever I've gained a month, put Ishido and his filthy allies in turmoil!""

After several days of waiting, Mariko receives from Toranaga the travel documents she needs to go to Osaka, and you are given money to hire additional crew for the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" in Nagasaki.The survivors of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" have found a place for themselves among the "
	ICALL2	PRINTUNDER,STR?218
	PRINTR	" of Yedo and except for Vinck, are useless as crew and unwilling to accommodate to Japanese ways.

You, Vinck, Mariko, and Yabu board a galley for Osaka.When you arrive, you find the elaborate preparations for Toranaga's visit underway.

""Of course, the Council will have no objections if I check the arrangements?"" Yabu asks Prince Ogaki, an intermediary between the Council and the Emperor.""The ceremony must be worthy of the Council and occasion!""

""Worthy of His Imperial Majesty!"" responds Ogaki.""It's his summons, now.Here is your invitation to the ceremony.""

Yabu quails as he sees the Imperial seal.No one, not even Toranaga, could refuse such a summons.Nineteen days!That's all the time that's left!Feeling weak, Yabu hears Ogaki say, ""Tomorrow you are invited to a formal reception by Lord Ishido to honor the birthday of the Lady Ochiba."""


	.FUNCT	ROBE-F:ANY:0:0
	EQUAL?	PRSA,V?WEAR \?CCL3
	PRINTR	"It's like a child's robe to you.It wouldn't fit."
?CCL3:	EQUAL?	PRSA,V?TAKE-OFF \FALSE
	IN?	ROBE,MARIKO \FALSE
	FSET?	ROBE,WEARBIT \FALSE
	MOVE	ROBE,HERE
	FCLEAR	ROBE,WEARBIT
	PRINTR	"You offer to take her robe, and she thanks you, unself-consciously letting you remove it.You put it aside, neatly folded."


	.FUNCT	TOWEL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"This is an embarrassingly small towel."
?CCL3:	EQUAL?	PRSA,V?DRY,V?RUB \?CCL5
	EQUAL?	PRSO,ME \?CCL5
	IN?	WINNER,YOKOSE-BATHTUB \?CCL10
	PRINTR	"You're still in the tub."
?CCL10:	FSET?	YOKOSE-BATHTUB,TOUCHBIT /?CCL12
	PRINTR	"You aren't wet."
?CCL12:	PRINTR	"You dry off as best you can."
?CCL5:	EQUAL?	PRSA,V?WEAR,V?HIDE-BEHIND,V?HIDE-UNDER \FALSE
	PRINTR	"The towel is nearly too small to cover the subject."


	.FUNCT	YOKOSE-BATHTUB-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"A large wooden bathtub dominates the room."
	IN?	MARIKO,BATHTUB /?CCL5
	RETURN	M-FATAL
?CCL5:	PRINTI	"Mariko is bathing in the tub."
	RETURN	M-FATAL


	.FUNCT	YOKOSE-BATHTUB-F:ANY:0:1,RARG,RUIN
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
?CCL12:	EQUAL?	PRSA,V?BATHE \?CCL14
	EQUAL?	PRSO,MARIKO \?CCL14
	IN?	MARIKO,YOKOSE-BATHTUB \FALSE
	PRINTI	"You beckon Mariko to your side of the tub, and begin soaping her back."
	CALL1	EXHIBITION
	RSTACK	
?CCL14:	EQUAL?	PRSA,V?LEAP,V?DIVE /?CTR20
	CALL1	TAKE-A-BATH?
	ZERO?	STACK /?CCL21
?CTR20:	IN?	MARIKO,YOKOSE-BATHTUB \?CCL26
	PRINTI	"You begin soaping away the filth of the road, and Mariko moves over to soap your back."
	CALL1	EXHIBITION
	RSTACK	
?CCL26:	PRINTR	"You scrub yourself."
?CCL21:	EQUAL?	PRSA,V?EXIT \?CCL28
	EQUAL?	PRSO,GLOBAL-HERE \?CCL28
	ICALL2	PERFORM,V?DISEMBARK
	RTRUE	
?CCL28:	CALL2	OUTSIDE-TUB?,YOKOSE-BATHTUB
	ZERO?	STACK /FALSE
	ICALL1	CTHE-PRINT-PRSO
	ICALL2	PRINT-IS/ARE,PRSO
	PRINT	STR?434
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL37
	CALL	NOUN-USED?,PRSO,W?WATER
	ZERO?	STACK /?CCL40
	PRINTR	"It's very hot, despite Mariko's complaints, and very clean."
?CCL40:	PRINT	STR?435
	CRLF	
	RTRUE	
?CCL37:	EQUAL?	PRSA,V?TAKE,V?MOVE \?CCL42
	EQUAL?	PRSO,YOKOSE-BATHTUB \?CCL42
	EQUAL?	P-PRSA-WORD,W?TAKE \?CCL47
	CALL	NOUN-USED?,PRSO,W?BATH
	ZERO?	STACK /?CCL47
	ICALL	PERFORM,V?BATHE,ME
	RTRUE	
?CCL47:	PRINT	STR?436
	CRLF	
	RTRUE	
?CCL42:	EQUAL?	PRSA,V?POUR \?CCL51
	PRINT	STR?437
	CRLF	
	RTRUE	
?CCL51:	EQUAL?	PRSA,V?CLIMB-FOO,V?BOARD,V?ENTER \?CCL53
	CALL2	RUINABLE?,WINNER >RUIN
	ZERO?	RUIN /?CCL56
	IN?	MARIKO,HERE /?CTR58
	IN?	MARIKO,YOKOSE-BATHTUB \?CCL59
?CTR58:	PRINTI	"Mariko says, ""Please, Anjin-san, don't climb into the tub "
	FSET?	RUIN,WEARBIT \?CCL64
	PRINTI	"wearing your dirty "
	ICALL2	DPRINT,RUIN
	JUMP	?CND62
?CCL64:	PRINTI	"carrying "
	ICALL2	THE-PRINT,RUIN
	PRINTI	".You'll get "
	ICALL2	PRINT-HIM/HER,RUIN
	PRINTI	" wet"
?CND62:	PRINTR	"!"""
?CCL59:	PRINTI	"You remember at the last second that you are still "
	FSET?	RUIN,WEARBIT \?CCL67
	PRINTI	"wear"
	JUMP	?CND65
?CCL67:	PRINTI	"carry"
?CND65:	PRINTI	"ing your "
	ICALL2	DPRINT,RUIN
	PRINTR	"."
?CCL56:	FSET?	BLACKTHORNE,RMUNGBIT /?CCL69
	ICALL1	PUT-DOWN-TOWEL
	FSET	BLACKTHORNE,RMUNGBIT
	PRINTR	"You soap yourself up and rinse off by pouring buckets of water over your head.You never enter a bathtub dirty!Now you are ready for the hot soak that makes a bath a true bath!"
?CCL69:	ICALL1	PUT-DOWN-TOWEL
	MOVE	WINNER,YOKOSE-BATHTUB
	FSET	YOKOSE-BATHTUB,TOUCHBIT
	FCLEAR	BLACKTHORNE,RMUNGBIT
	PRINT	STR?438
	CRLF	
	RTRUE	
?CCL53:	EQUAL?	PRSA,V?DRINK,V?TASTE \FALSE
	PRINT	STR?439
	CRLF	
	RTRUE	


	.FUNCT	PUT-DOWN-TOWEL:ANY:0:0
	IN?	TOWEL,WINNER \FALSE
	MOVE	TOWEL,HERE
	PRINTI	"First, you put down the towel so it won't get wet."
	RTRUE	


	.FUNCT	EXHIBITION:ANY:0:0
	PRINTI	"People are watching all around the room, undisturbed by a public exhibition that would lead to prison or worse in England.

As the bath finishes and you climb out, you try to hide your anticipation of the night -- your anticipation and your fear of discovery."
	CRLF	
	ICALL2	SCORE-OBJECT,YOKOSE-BATHTUB
	ICALL1	TIME-PASSES
	ICALL1	DRESS-BLACKTHORNE
	MOVE	DICTIONARY,YOKOSE-SPA-1
	MOVE	MARIKO,YOKOSE-SPA-3
	MOVE	CHIMMOKO,YOKOSE-SPA-3
	MOVE	GYOKO,YOKOSE-SPA-5
	MOVE	KIKU,YOKOSE-SPA-5
	MOVE	YOSHINAKA,YOKOSE-SPA-6
	MOVE	BLACKTHORNE,HERE
	MOVE	TOWEL,HERE
	ICALL1	DRESS-BLACKTHORNE
	ICALL2	DEQUEUE,I-YOKOSE-BATH
	ICALL	QUEUE,I-YOSHINAKA,-1
	CRLF	
	CALL2	GOTO,YOKOSE-SPA-1
	RSTACK	


	.FUNCT	I-YOKOSE-BATH:ANY:0:0,H?
	EQUAL?	HERE,YOKOSE-BATH-HOUSE /?PRD1
	PUSH	0
	JUMP	?PRD2
?PRD1:	PUSH	1
?PRD2:	SET	'H?,STACK
	INC	'DELAY-CNT
	EQUAL?	BATH-CNT,2 \?CCL7
	LESS?	DELAY-CNT,4 \?CND5
	CALL2	HELD?,KIMONO
	ZERO?	STACK \?CCL9
	CALL2	HELD?,SANDALS
	ZERO?	STACK \?CCL9
	CALL2	HELD?,SOCKS
	ZERO?	STACK /?CND5
?CCL9:	EQUAL?	DELAY-CNT,1,2 \?CCL17
	ZERO?	H? /FALSE
	CRLF	
	PRINTR	"""Come, Anjin-san, the water chills!"" Mariko laughs."
?CCL17:	EQUAL?	DELAY-CNT,3 \?CCL22
	ZERO?	H? /FALSE
	CRLF	
	PRINTR	"""I chill as well, Anjin-san, the air is cold!"" Mariko says."
?CCL22:	ZERO?	H? /FALSE
	CRLF	
	PRINTR	"""Well, I suppose I'll bathe without you,"" she says, disappointed at your prudishness."
?CCL7:	EQUAL?	BATH-CNT,3 \?CND5
	IN?	BLACKTHORNE,YOKOSE-BATH-HOUSE \?CND5
	EQUAL?	DELAY-CNT,1 \?CCL34
	CRLF	
	PRINTR	"Mariko begins to soap herself."
?CCL34:	EQUAL?	DELAY-CNT,2 \?CCL36
	CRLF	
	PRINTR	"Mariko is soaping herself and Chimmoko helps by scrubbing her back."
?CCL36:	EQUAL?	DELAY-CNT,3 \?CCL38
	CRLF	
	PRINTR	"Mariko rinses off, water streaming down her long black hair."
?CCL38:	EQUAL?	DELAY-CNT,4 \TRUE
	MOVE	MARIKO,YOKOSE-SPA-3
	MOVE	CHIMMOKO,YOKOSE-SPA-3
	CRLF	
	PRINTI	"Mariko climbs out of the bath, puts on her robe, and with a slightly disappointed bow, heads inside."
	CRLF	
	ICALL1	FAILED-SCENE
	RTRUE	
?CND5:	SET	'DELAY-CNT,0
	INC	'BATH-CNT
	EQUAL?	BATH-CNT,1 \?CCL42
	ICALL2	THIS-IS-IT,MARIKO
	ZERO?	H? /FALSE
	CRLF	
	PRINTR	"Mariko calls to you, ""Come, Anjin-san, bathe thyself!The water is nearly cold, as is to thy liking!""In fact, you still find the temperature of the baths near to scalding."
?CCL42:	EQUAL?	BATH-CNT,2 \?CCL47
	IN?	ROBE,MARIKO \?CCL50
	MOVE	ROBE,HERE
	FCLEAR	ROBE,WEARBIT
	ZERO?	H? /?CND48
	CRLF	
	PRINTI	"Mariko removes her thick cotton bathing robe"
	JUMP	?CND48
?CCL50:	ZERO?	H? /?CND48
	CRLF	
	PRINTI	"Mariko finishes preparing for her bath"
?CND48:	ZERO?	H? /FALSE
	PRINTR	" with the assistance of Chimmoko, her maid."
?CCL47:	EQUAL?	BATH-CNT,3 \?CCL59
	MOVE	MARIKO,YOKOSE-BATHTUB
	ZERO?	H? /FALSE
	CALL2	HELD?,KIMONO
	ZERO?	STACK \?CND63
	CALL2	HELD?,SANDALS
	ZERO?	STACK \?CND63
	CALL2	HELD?,SOCKS
	ZERO?	STACK \?CND63
	ICALL	MARGINAL-PIC,P-BATH,FALSE-VALUE
?CND63:	CRLF	
	PRINTR	"Mariko climbs into the tub and begins bathing."
?CCL59:	EQUAL?	BATH-CNT,4 \FALSE
	REMOVE	ROBE
	CALL2	DEQUEUE,I-YOKOSE-BATH
	RSTACK	


	.FUNCT	YOKOSE-SPA-1-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?SLEEP \FALSE
	PRINTR	"You can't sleep. You only want to be with Mariko. You know your time together will end soon."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	FSET?	HERE,SCOREBIT \FALSE
	ICALL2	SCORE-OBJECT,HERE
	PRINTI	"You return to the safety and loneliness of your own room, remembering Mariko's answer when you asked ""After Mishima, what then?""

""There's a pass that curls up through the mountains.After that the road falls away to the city of Odawara.From there to Yedo is only a matter of time.""

""How much time?""

""Not enough,"" she answered.

""You're wrong, my love, so sorry,"" you said.""There's all the time in the world."""
	CRLF	
	ICALL1	NEXT-SCENE
	RETURN	M-FATAL


	.FUNCT	YOKOSE-SPA-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?SLEEP \FALSE
	PRINTR	"You should sleep in your own room. To sleep in someone else's would be impolite."


	.FUNCT	YOKOSE-SPA-3-F:ANY:0:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	LOC	YOSHINAKA
	EQUAL?	STACK,YOKOSE-CORRIDOR-1,YOKOSE-CORRIDOR-2,YOKOSE-CORRIDOR-3 \?CND4
	SET	'YOSHI-GOAL,YOKOSE-SPA-3
?CND4:	IN?	CHIMMOKO,HERE \TRUE
	MOVE	CHIMMOKO,YOKOSE-CORRIDOR-2
	PRINTI	"As you enter the room, Chimmoko slips silently out."
	CRLF	
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL12
	EQUAL?	P-WALK-DIR,P?OUT,P?EAST \?CCL12
	LOC	YOSHINAKA
	EQUAL?	STACK,YOKOSE-CORRIDOR-1,YOKOSE-CORRIDOR-2,YOKOSE-CORRIDOR-3 \FALSE
	PRINTI	"You open the shoji a crack, make a quick scan of the corridor looking for anyone who might be watching, and "
	CALL	JIGS-UP?,J-YOSHI,STR?581
	ZERO?	STACK /TRUE
	ICALL2	JIGS-UP,STR?582
	RETURN	M-FATAL
?CCL12:	EQUAL?	PRSA,V?KISS,V?FUCK,V?LOVE \?CCL22
	EQUAL?	PRSO,MARIKO \?CCL22
	IN?	YOSHINAKA,HERE \?CCL27
	PRINTR	"Such activity would be fatal with Yoshinaka here to see!"
?CCL27:	FSET?	HERE,SCOREBIT \?CCL29
	FSET	YOKOSE-SPA-1,SCOREBIT
	ICALL2	SCORE-OBJECT,HERE
	PRINTI	"""Thou!At long last I know what love means,"" she murmurs in Latin, the language of lovers.""I love thee, so I'm afraid for thee."" she whispers.""I've destroyed thee, my love, by beginning.We're doomed now.I've destroyed thee -- that is the truth.""

""No, Mariko, somehow something will happen to make everything right.""

""I should never have begun.The fault is mine.""

""Do not worry, I beg thee."
	ICALL2	PRINTUNDER,STR?572
	PRINTI	" is "
	ICALL2	PRINTUNDER,STR?258
	PRINTR	".""

At length she is persuaded and melts into your arms."
?CCL29:	SET	'YOSHI-GOAL,YOKOSE-SPA-3
	PRINTR	"""Ah, Anjin-san, we tempt fate even now!Danger is everywhere for us.You must go."""
?CCL22:	EQUAL?	PRSA,V?SLEEP \FALSE
	PRINTR	"""You can't sleep here, Anjin-san. We would be discovered for certain!"""


	.FUNCT	YOKOSE-GUEST-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"What you can mostly see is that the guest is annoyed at having his sleep disturbed."


	.FUNCT	LG-YOSHINAKA-F:ANY:0:1,RARG,L
	LOC	YOSHINAKA >L
	EQUAL?	PRSA,V?TELL-ABOUT,V?ASK-ABOUT \?PRD5
	EQUAL?	PRSI,YOSHINAKA /?CTR2
?PRD5:	EQUAL?	PRSA,V?FIND,V?WHERE,V?FOLLOW \?CCL3
?CTR2:	ICALL	REDIRECT,LG-YOSHINAKA,YOSHINAKA
	RTRUE	
?CCL3:	FSET?	L,RMUNGBIT /?CCL9
	FSET?	HERE,RMUNGBIT /?CCL9
	PRINTR	"Yoshinaka is down the hall."
?CCL9:	EQUAL?	PRSA,V?LISTEN \?CCL13
	PRINTI	"He seems to be in "
	ICALL	TELL-WHOSE,L,YOSHINAKA
	PRINTR	" room."
?CCL13:	PRINTR	"You don't see Yoshinaka right now."


	.FUNCT	YOSHINAKA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?LISTEN \FALSE
	PRINTR	"You can hear him making his rounds."


	.FUNCT	I-YOSHINAKA:ANY:0:0,L,NL,P,N,TMP,CNT
	LOC	YOSHINAKA >L
	RANDOM	4 >P
	IN?	YOSHINAKA,YOKOSE-CORRIDOR-1 \?CCL3
	EQUAL?	HERE,L \?CCL5
	GRTR?	P,YOSHI-CHATS \?CND1
?CCL5:	EQUAL?	YOSHI-GOAL,YOKOSE-SPA-1,YOKOSE-SPA-2 \?CCL9
	MOVE	YOSHINAKA,YOSHI-GOAL
	JUMP	?CND1
?CCL9:	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-2
	JUMP	?CND1
?CCL3:	IN?	YOSHINAKA,YOKOSE-CORRIDOR-2 \?CCL11
	EQUAL?	HERE,L \?CCL13
	GRTR?	P,YOSHI-CHATS \?CND1
?CCL13:	EQUAL?	YOSHI-GOAL,YOKOSE-SPA-1,YOKOSE-SPA-2 \?CCL17
	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-1
	JUMP	?CND1
?CCL17:	EQUAL?	YOSHI-GOAL,YOKOSE-SPA-3,YOKOSE-SPA-4 \?CCL19
	MOVE	YOSHINAKA,YOSHI-GOAL
	JUMP	?CND1
?CCL19:	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-3
	JUMP	?CND1
?CCL11:	IN?	YOSHINAKA,YOKOSE-CORRIDOR-3 \?CCL21
	EQUAL?	HERE,L \?CCL23
	GRTR?	P,YOSHI-CHATS \?CND1
?CCL23:	EQUAL?	YOSHI-GOAL,YOKOSE-SPA-5,YOKOSE-SPA-6 \?CCL27
	MOVE	YOSHINAKA,YOSHI-GOAL
	JUMP	?CND1
?CCL27:	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-2
	JUMP	?CND1
?CCL21:	EQUAL?	L,YOKOSE-SPA-1,YOKOSE-SPA-2 \?CCL29
	EQUAL?	HERE,L /?CCL31
	GRTR?	P,YOSHI-CHATS /?CND1
?CCL31:	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-1
	JUMP	?CND1
?CCL29:	EQUAL?	L,YOKOSE-SPA-3,YOKOSE-SPA-4 \?CCL35
	EQUAL?	L,YOKOSE-SPA-3 \?CCL38
	EQUAL?	HERE,YOKOSE-SPA-3 \?CCL38
	CRLF	
	PRINTR	"Yoshinaka seems reluctant to leave before you do.He seems very nervous.Mariko says, ""Perhaps you should leave, Anjin-san."""
?CCL38:	EQUAL?	HERE,L /?CCL41
	GRTR?	P,YOSHI-CHATS /?CND1
?CCL41:	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-2
	JUMP	?CND1
?CCL35:	EQUAL?	L,YOKOSE-SPA-5 \?CCL45
	EQUAL?	HERE,L /?CCL47
	GRTR?	P,YOSHI-CHATS /?CND1
?CCL47:	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-3
	JUMP	?CND1
?CCL45:	EQUAL?	L,YOKOSE-SPA-6 \?CND1
	ZERO?	YOSHI-WAITS? \?CCL53
?PRG54:	EQUAL?	CNT,5 /?REP55
	SUB	5,CNT
	RANDOM	STACK
	ADD	CNT,STACK >N
	INC	'CNT
	GET	YOSHI-TABLE,CNT >TMP
	GET	YOSHI-TABLE,N
	PUT	YOSHI-TABLE,CNT,STACK
	PUT	YOSHI-TABLE,N,TMP
	JUMP	?PRG54
?REP55:	PUT	YOSHI-TABLE,6,YOKOSE-SPA-6
	PUT	YOSHI-TABLE,0,1
	GET	YOSHI-TABLE,1 >YOSHI-GOAL
	MOVE	YOSHINAKA,YOKOSE-CORRIDOR-3
	JUMP	?CND1
?CCL53:	DEC	'YOSHI-WAITS?
?CND1:	IN?	YOSHINAKA,L /?CCL60
	SET	'YOSHI-CHATS,0
	JUMP	?CND58
?CCL60:	INC	'YOSHI-CHATS
?CND58:	LOC	YOSHINAKA >NL
	EQUAL?	L,NL /?CND61
	FSET?	L,RMUNGBIT /?CND61
	FSET?	NL,RMUNGBIT \?CND61
	EQUAL?	NL,YOKOSE-SPA-6 /?CCL68
	GET	YOSHI-TABLE,0
	ADD	STACK,1
	PUT	YOSHI-TABLE,0,STACK
	GET	YOSHI-TABLE,0
	GET	YOSHI-TABLE,STACK >YOSHI-GOAL
	JUMP	?CND61
?CCL68:	RANDOM	5
	ADD	5,STACK >YOSHI-WAITS?
?CND61:	EQUAL?	HERE,YOKOSE-FIRST-FLOOR,YOKOSE-BATH-HOUSE /FALSE
	EQUAL?	L,NL /?CCL73
	FSET?	L,RMUNGBIT \?CCL76
	FSET?	NL,RMUNGBIT /FALSE
	FSET?	HERE,RMUNGBIT \?CCL82
	CALL	YOKOSE-NEIGHBOR?,HERE,L
	ZERO?	STACK /?CCL85
	CRLF	
	PRINTI	"You can hear Yoshinaka leaving "
	ICALL	TELL-WHOSE,L,YOSHINAKA
	PRINTR	" room."
?CCL85:	EQUAL?	HERE,L \FALSE
	CRLF	
	PRINTR	"Yoshinaka, very polite, bows and leaves the room."
?CCL82:	CRLF	
	PRINTI	"You see Yoshinaka emerge from "
	ICALL	TELL-WHOSE,L,YOSHINAKA
	PRINTR	" room."
?CCL76:	EQUAL?	HERE,YOKOSE-SPA-3 \?CCL90
	CRLF	
	ICALL2	JIGS-UP,STR?586
	RETURN	M-FATAL
?CCL90:	FSET?	NL,RMUNGBIT \?CCL92
	EQUAL?	NL,YOKOSE-SPA-1 \?CCL95
	EQUAL?	HERE,NL \?CCL98
	CRLF	
	PRINTI	"Yoshinaka knocks politely on your door, and then enters the room.""So sorry, Anjin-san.Must check rooms, must make sure all safe, "
	ICALL2	PRINTUNDER,STR?587
	PRINTR	""""
?CCL98:	EQUAL?	HERE,YOKOSE-CORRIDOR-1,YOKOSE-CORRIDOR-2,YOKOSE-CORRIDOR-3 \?CCL100
	CRLF	
	PRINTR	"Yoshinaka enters your room, checking to make sure all is as it should be."
?CCL100:	EQUAL?	HERE,YOKOSE-SPA-3 \FALSE
	CRLF	
	PRINTR	"You can hear Yoshinaka entering your room."
?CCL95:	FSET?	HERE,RMUNGBIT \?CCL104
	EQUAL?	HERE,NL \?CCL107
	PRINTD	YOSHINAKA
	EQUAL?	HERE,YOKOSE-SPA-6 \?CCL110
	PRINTI	" comes into his room."
	JUMP	?CND108
?CCL110:	PRINTI	" knocks on the door, and "
	GETP	NL,P?OWNER
	ZERO?	STACK /?CCL113
	ICALL2	TELL-WHO,NL
	JUMP	?CND111
?CCL113:	PRINTI	"the guest"
?CND111:	PRINTI	" equally politely, bids him enter."
?CND108:	PRINTR	"Yoshinaka is somewhat surprised to find you there as well."
?CCL107:	CALL	YOKOSE-NEIGHBOR?,HERE,NL
	ZERO?	STACK /FALSE
	CRLF	
	PRINTI	"You can hear Yoshinaka entering "
	ICALL	TELL-WHOSE,NL,YOSHINAKA
	PRINTR	" room."
?CCL104:	EQUAL?	NL,YOKOSE-SPA-6 \?CCL117
	CRLF	
	PRINTR	"Yoshinaka returns to his room, evidently finished with this round of inspection."
?CCL117:	CRLF	
	PRINTI	"You see Yoshinaka knock politely on "
	ICALL	TELL-WHOSE,NL,YOSHINAKA
	PRINTR	" door and then enter the room."
?CCL92:	FSET?	HERE,RMUNGBIT /FALSE
	CRLF	
	PRINTI	"Yoshinaka walks "
	EQUAL?	L,YOKOSE-CORRIDOR-1 /?CTR121
	EQUAL?	L,YOKOSE-CORRIDOR-2 \?CCL122
	EQUAL?	NL,YOKOSE-CORRIDOR-3 \?CCL122
?CTR121:	PRINTI	"north up"
	JUMP	?CND120
?CCL122:	PRINTI	"south down"
?CND120:	PRINTI	" the corridor"
	EQUAL?	HERE,NL \?CND127
	PRINTI	", joining you"
?CND127:	PRINTR	"."
?CCL73:	FSET?	L,RMUNGBIT \?CCL131
	FSET?	HERE,RMUNGBIT \?CTR133
	CALL	YOKOSE-NEIGHBOR?,HERE,L
	ZERO?	STACK /?CCL134
?CTR133:	EQUAL?	L,YOKOSE-SPA-1 \?CCL139
	CRLF	
	PRINTR	"Thanks to the thin shoji-screen walls, which are almost transparent to sound, you can tell that Yoshinaka is still in your room."
?CCL139:	EQUAL?	L,YOKOSE-SPA-6 \?CCL141
	CRLF	
	PRINTR	"Yoshinaka seems to still be in his room."
?CCL141:	CRLF	
	PRINTI	"You can hear Yoshinaka"
	FSET?	HERE,RMUNGBIT \?CND142
	PRINTI	", in the next room,"
?CND142:	PRINTI	" talking to "
	ICALL	TELL-WHO,NL,YOSHINAKA
	PRINTR	"."
?CCL134:	EQUAL?	HERE,L \FALSE
	EQUAL?	L,YOKOSE-SPA-6 \?CCL148
	CRLF	
	PRINTR	"Between his rounds of inspection, Yoshinaka quietly meditates."
?CCL148:	CRLF	
	PRINTR	"Yoshinaka, very apologetic but determined to do his duty, looks over the room."
?CCL131:	EQUAL?	HERE,L \?CCL150
	ZERO?	YOSHI-CHATS \FALSE
	CRLF	
	PRINTR	"Yoshinaka bows and greets you in simple phrases so that you will understand.""Good evening, Anjin-san.""He seems unsure why you are up and about at this hour of the night."
?CCL150:	CRLF	
	PRINTI	"Yoshinaka, down the corridor to the "
	EQUAL?	HERE,YOKOSE-CORRIDOR-3 /?CTR155
	EQUAL?	HERE,YOKOSE-CORRIDOR-2 \?CCL156
	EQUAL?	L,YOKOSE-CORRIDOR-1 \?CCL156
?CTR155:	PRINTI	"south"
	JUMP	?CND154
?CCL156:	PRINTI	"north"
?CND154:	PRINTR	", is making his rounds."


	.FUNCT	TELL-WHO:ANY:1:2,OBJ,WHO,O
	ASSIGNED?	'WHO /?CND1
	SET	'WHO,BLACKTHORNE
?CND1:	GETP	OBJ,P?OWNER >O
	ZERO?	O \?CCL5
	PRINTI	"a guest"
	RTRUE	
?CCL5:	EQUAL?	O,BLACKTHORNE \?CCL7
	PRINTI	"you"
	RTRUE	
?CCL7:	EQUAL?	O,WHO \?CCL9
	CALL2	PRINT-HIM/HER,O
	RSTACK	
?CCL9:	CALL2	DPRINT,O
	RSTACK	


	.FUNCT	TELL-WHOSE:ANY:1:2,OBJ,WHO,O
	ASSIGNED?	'WHO /?CND1
	SET	'WHO,BLACKTHORNE
?CND1:	GETP	OBJ,P?OWNER >O
	ZERO?	O \?CCL5
	PRINTI	"a guest's"
	RTRUE	
?CCL5:	EQUAL?	O,BLACKTHORNE \?CCL7
	PRINTI	"your"
	RTRUE	
?CCL7:	EQUAL?	O,WHO \?CCL9
	CALL2	PRINT-HIS/HER,O
	RSTACK	
?CCL9:	ICALL2	DPRINT,O
	PRINTI	"'s"
	RTRUE	


	.FUNCT	YOKOSE-NEIGHBOR?:ANY:2:2,H,L
	EQUAL?	H,YOKOSE-FIRST-FLOOR,YOKOSE-BATH-HOUSE /FALSE
	EQUAL?	H,YOKOSE-SPA-1 \?CCL5
	EQUAL?	L,YOKOSE-SPA-3 /TRUE
	RFALSE	
?CCL5:	EQUAL?	H,YOKOSE-SPA-2 \?CCL9
	EQUAL?	L,YOKOSE-SPA-4 /TRUE
	RFALSE	
?CCL9:	EQUAL?	H,YOKOSE-SPA-3 \?CCL13
	EQUAL?	L,YOKOSE-SPA-1,YOKOSE-SPA-5 /TRUE
	RFALSE	
?CCL13:	EQUAL?	H,YOKOSE-SPA-4 \?CCL17
	EQUAL?	L,YOKOSE-SPA-2,YOKOSE-SPA-6 /TRUE
	RFALSE	
?CCL17:	EQUAL?	H,YOKOSE-SPA-5 \?CCL21
	EQUAL?	L,YOKOSE-SPA-3 /TRUE
	RFALSE	
?CCL21:	EQUAL?	H,YOKOSE-SPA-6 \FALSE
	EQUAL?	L,YOKOSE-SPA-4 /TRUE
	RFALSE	

	.ENDSEG

	.ENDI
