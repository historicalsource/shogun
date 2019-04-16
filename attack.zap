
	.SEGMENT "YOKOHAMA"

	.SEGMENT "NINJA"


	.FUNCT	PISTOL-F:ANY:0:0
	FSET?	PISTOL,NDESCBIT \?CCL3
	PRINTR	"You can't find your pistol anywhere!It must have been blown out of your grasp by the force of the explosion!"
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTI	"This is a"
	FSET?	PISTOL,RMUNGBIT \?CCL8
	PRINTI	"n unloaded"
	JUMP	?CND6
?CCL8:	PRINTI	" loaded"
?CND6:	PRINTR	" pistol."
?CCL5:	EQUAL?	PRSA,V?LOAD \FALSE
	EQUAL?	PRSO,PISTOL \FALSE
	EQUAL?	PRSI,FALSE-VALUE,POWDER-HORN \FALSE
	CALL2	HELD?,POWDER-HORN
	ZERO?	STACK \?CCL16
	PRINTR	"You don't have any powder!"
?CCL16:	FSET?	PISTOL,RMUNGBIT \?CCL18
	CALL2	QUEUED?,I-LOAD-PISTOL
	ZERO?	STACK /?CCL21
	PRINTR	"With all the speed you can, you work on loading the pistol."
?CCL21:	ICALL	QUEUE,I-LOAD-PISTOL,-1
	PRINTR	"You begin the laborious task of loading the pistol."
?CCL18:	PRINTR	"It's already loaded."

	.ENDSEG

	.SEGMENT "NINJA"


	.FUNCT	POWDER-HORN-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?CCL3
	PRINTR	"There is plenty of powder in the horn."
?CCL3:	EQUAL?	PRSA,V?PUT \?CCL5
	EQUAL?	PRSO,POWDER-HORN \?CCL5
	EQUAL?	PRSI,TOP-CATCH,BOTTOM-CATCH \?CCL5
	PRINTR	"The powder won't stay on the catch."
?CCL5:	EQUAL?	PRSA,V?PUT \?CCL10
	EQUAL?	PRSO,POWDER-HORN \?CCL10
	EQUAL?	PRSI,PISTOL \?CCL10
	ICALL	PERFORM,V?LOAD,PISTOL
	RTRUE	
?CCL10:	EQUAL?	PRSA,V?SHOOT \?PRD17
	EQUAL?	PRSO,PISTOL /?CCL15
?PRD17:	EQUAL?	PRSA,V?EXPLODE \FALSE
	EQUAL?	PRSI,POWDER-HORN \FALSE
?CCL15:	PRINTR	"You would blow yourself up too!"


	.FUNCT	I-LOAD-PISTOL:ANY:0:0
	INC	'LOAD-PISTOL-CNT
	EQUAL?	LOAD-PISTOL-CNT,1 \?CCL5
	CRLF	
	PRINTR	"First the powder, tamping it carefully."
?CCL5:	EQUAL?	LOAD-PISTOL-CNT,2 \?CCL7
	CRLF	
	PRINT	STR?608
	PRINTR	" the paper plug to hold the charge tight."
?CCL7:	EQUAL?	LOAD-PISTOL-CNT,3 \?CCL9
	CRLF	
	PRINT	STR?608
	PRINTR	" the lead ball and another plug."
?CCL9:	EQUAL?	LOAD-PISTOL-CNT,4 \FALSE
	SET	'LOAD-PISTOL-CNT,0
	FCLEAR	PISTOL,RMUNGBIT
	ICALL2	DEQUEUE,I-LOAD-PISTOL
	CRLF	
	PRINT	STR?608
	PRINTR	", blow the dust carefully away from the flint.Finished!"


	.FUNCT	MARIKO-FOLLOW-ME:ANY:0:0
	IN?	MARIKO,HERE /?CCL3
	LOC	MARIKO
	CALL2	NEXT-ROOM?,STACK
	ZERO?	STACK /?CCL6
	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /?CCL9
	PRINTR	"Mariko is struggling with the ninja in the next room.They are trying to abduct her!"
?CCL9:	PRINTR	"Mariko is in the next room."
?CCL6:	PRINTR	"You no longer know where Mariko is."
?CCL3:	EQUAL?	HERE,SECRET-REDOUBT,BALCONY \?CCL11
	PRINTR	"""No, Anjin-san, I can no longer follow."""
?CCL11:	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /?CCL13
	PRINTR	"She struggles to free herself from the ninja, but she can't.""Help me, Anjin-san!"" she yells."
?CCL13:	ICALL	QUEUE,I-MARIKO-FOLLOW,-1
	CALL2	QUEUED?,I-NINJA
	ZERO?	STACK /?CCL16
	ZERO?	CAPTURE-CNT /?CCL19
	PRINTI	"""You can't let them take me"
	JUMP	?CND17
?CCL19:	PRINTI	"""I'll stay close by"
?CND17:	PRINTI	", Anjin-san."" she replies."
	CRLF	
	JUMP	?CND14
?CCL16:	CALL2	QUEUED?,I-NINJA-COWED
	ZERO?	STACK /?CCL21
	PRINTI	"""I'm coming!"" she says, rushing to your side."
	CRLF	
	JUMP	?CND14
?CCL21:	PRINTI	"""I will follow you,"" she replies."
	CRLF	
?CND14:	CALL2	SCORE-OBJECT,MARIKO
	RSTACK	


	.FUNCT	NINJA-TALK-TO-YABU:ANY:0:0
	EQUAL?	PRSA,V?TELL-ME-ABOUT,V?WHAT \?CCL3
	EQUAL?	PRSO,PLAN \?CCL6
	FSET?	MARIKO,RMUNGBIT \?CCL9
	PRINTR	"Yabu is very nervous.""I know nothing of any plan!"" he blusters."
?CCL9:	CALL	ADJ-USED?,PLAN,W?SECRET
	ZERO?	STACK /?CCL12
	PRINTI	"""No secret"
	JUMP	?CND10
?CCL12:	PRINTI	"""So sorry"
?CND10:	PRINTI	", Anjin-san.You misunderstood.Say only must have plan.Very difficult escape Osaka, neh?Understand?""Yabu appears somewhat nervous."
	CRLF	
	CALL2	SCORE-OBJECT,PLAN
	RSTACK	
?CCL6:	EQUAL?	PRSO,NINJA,LG-NINJA \?CCL14
	PRINTR	"""Ninja!Filthy assassins!Who would use ninja!Filth!""He seems very agitated and nervous."
?CCL14:	EQUAL?	PRSO,MARIKO \FALSE
	FSET?	MARIKO,RMUNGBIT \?CCL19
	PRINTR	"""Mariko is dead, Anjin-san."""
?CCL19:	PRINTR	"""She has done a very foolish thing, Anjin-san,"" he says vehemently.He seems to be suppressing an even stronger response.He is very nervous."
?CCL3:	EQUAL?	PRSA,V?YES,V?HAI \?CCL21
	EQUAL?	HERE,OUTER-ROOM \?CCL21
	FSET?	PLAN,SCOREBIT /?CCL26
	PRINTR	"""Very good, Anjin-san,"" Yabu replies, looking much relieved."
?CCL26:	EQUAL?	YABU-CNT,1,2 \FALSE
	PRINTR	"""Good, good!"" Yabu nods.""Very worried about Lady Toda.""He smiles."
?CCL21:	EQUAL?	PRSA,V?NO,V?IYE \?CCL30
	EQUAL?	HERE,OUTER-ROOM \?CCL30
	FSET?	PLAN,SCOREBIT /?CCL35
	PRINTR	"""Don't worry, Anjin-san,"" Yabu replies, trying to look unworried."
?CCL35:	EQUAL?	YABU-CNT,1,2 \FALSE
	PRINTR	"""There is no plan, Anjin-san!"" Yabu says.""I'm only worried about Lady Toda."""
?CCL30:	CALL1	YABU-WAKARIMASEN
	RSTACK	


	.FUNCT	NINJA-INTERRUPT-YABU:ANY:0:0
	CALL	JIGS-UP?,J-CALL-YABU,STR?609
	ZERO?	STACK /?CCL3
	PRINTI	"Yabu seems surprised to hear you call to him.He turns and says something to you in an angry tone of voice.You hear the word """
	ICALL2	PRINTUNDER,STR?610
	PRINTI	""", which means 'forbidden.'  Then Yabu draws his killing sword, advances on you, and removes your head."
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL3:	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL


	.FUNCT	NINJA-FOLLOW-YABU:ANY:0:0,RM
	LOC	YABU >RM
	EQUAL?	HERE,RM \?CCL3
	EQUAL?	HERE,CELLARS \?CCL6
	PRINTR	"He doesn't appear to be going anywhere."
?CCL6:	ZERO?	FOLLOW-FLAG /?CCL8
	PRINTR	"You continue following him, keeping well behind and being as quiet as possible."
?CCL8:	ICALL1	SETUP-FOLLOW-YABU
	PRINTR	"You follow Yabu, doing your best to avoid being noticed."
?CCL3:	CALL2	NEXT-ROOM?,RM
	ZERO?	STACK /?CCL10
	ZERO?	FOLLOW-FLAG /?CCL13
	EQUAL?	HERE,INNER-CORRIDOR \?CCL16
	PRINTI	"You follow warily behind him, keeping out of sight."
	CRLF	
	JUMP	?CND11
?CCL16:	EQUAL?	HERE,AUDIENCE-CHAMBER \?CCL18
	PRINTI	"You follow behind him, bowing to the guards but keeping far enough behind Yabu that he doesn't know he's being followed."
	CRLF	
	JUMP	?CND11
?CCL18:	EQUAL?	HERE,OUTER-CORRIDOR \?CCL20
	PRINTI	"You follow him, letting him get one turn ahead of you on the stairs."
	CRLF	
	JUMP	?CND11
?CCL20:	EQUAL?	HERE,STAIRS \?CCL22
	PRINTI	"You slip silently into the servants' quarters, and they stare at you but don't move.Yabu is heading towards a stairway leading down."
	CRLF	
	JUMP	?CND11
?CCL22:	EQUAL?	HERE,SERVANTS-QUARTERS \?CCL24
	PRINTI	"You follow Yabu at a safe distance, sometimes almost losing him in the labyrinthine cellars.He reaches a large, dimly-lit room full of boxes and barrels."
	CRLF	
	JUMP	?CND11
?CCL24:	PRINTI	"You follow behind as silently and stealthily as you can."
	CRLF	
	JUMP	?CND11
?CCL13:	ICALL1	SETUP-FOLLOW-YABU
	PRINTI	"You begin following Yabu, "
	EQUAL?	HERE,OUTER-ROOM \?CCL27
	PRINTI	"hoping he won't lose you."
	CRLF	
	JUMP	?CND11
?CCL27:	PRINTI	"keeping far enough behind that he doesn't realize he's being followed."
	CRLF	
?CND11:	CRLF	
	ICALL2	GOTO,RM
	RTRUE	
?CCL10:	SET	'FOLLOW-FLAG,FALSE-VALUE
	PRINTR	"You've lost him!"


	.FUNCT	EXAMINE-MARIKO:ANY:0:0
	FSET?	MARIKO,RMUNGBIT \?CCL3
	FSET?	MARIKO,DEAD \?CCL6
	PRINTI	"She seems at peace, sleeping.You move the kimono aside, then put it back again.Her pulse is almost imperceptible.Then it ceases."
	JUMP	?CND4
?CCL6:	PRINTI	"Lady Mariko is broken and dying.She is still alive, but fading rapidly."
?CND4:	PRINTR	"Her face is hardly touched but her body is terribly mutilated.Around her neck is her rosary, the tiny golden cross lying on her throat."
?CCL3:	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /?CCL8
	PRINTR	"Lady Mariko is struggling to free herself."
?CCL8:	CALL2	QUEUED?,I-NINJA
	ZERO?	STACK /?CCL10
	PRINTR	"Lady Mariko looks like the samurai she is, brave and fearless, intent upon her purpose."
?CCL10:	PRINTR	"Lady Mariko looks tired, but delicate and beautiful.The effects of the afternoon are still with her, but she is content to be here with you."


	.FUNCT	NINJA-TAKE-MARIKO:ANY:0:0
	FSET?	MARIKO,RMUNGBIT \?CCL3
	FSET?	BLACKTHORNE,RMUNGBIT \?CCL6
	PRINTR	"You're too far away.You'll have to get closer somehow."
?CCL6:	MOVE	MARIKO,WINNER
	PRINTR	"You take her in your arms, her broken body so small it feels like she can hardly be real."
?CCL3:	IN?	MARIKO,SECRET-REDOUBT \?CCL8
	MOVE	MARIKO,WINNER
	ICALL	QUEUE,I-MARIKO-STRUGGLES,-1
	PRINTR	"You grab her, dragging her toward the balcony, but she tries to get away.""No, Anjin-san!I must stay here!"""
?CCL8:	SET	'WINNER,MARIKO
	ICALL2	PERFORM,V?FOLLOW
	SET	'WINNER,PLAYER
	RTRUE	


	.FUNCT	PRIVATE-QUARTERS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	PUTP	OUTER-CORRIDOR,P?FDESC,FALSE-VALUE
	FCLEAR	OUTER-CORRIDOR,TOUCHBIT
	FCLEAR	AUDIENCE-CHAMBER,TOUCHBIT
	MOVE	SWORDS,BLACKTHORNE-QUARTERS
	MOVE	PISTOL,BLACKTHORNE
	MOVE	MARIKO,HERE
	FSET	MARIKO,SCOREBIT
	MOVE	KIRITSUBO,HERE
	MOVE	GUARDS,AUDIENCE-CHAMBER
	MOVE	GRAY-CAPTAIN,AUDIENCE-CHAMBER
	MOVE	YABU,OUTER-ROOM
	CALL	QUEUE,I-CHIMMOKO,1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"These are Lady Mariko's private quarters.Shojis screen a private room to the west, your room to the east, and an outer room which leads to a corridor on the south."
	FSET?	SECRET-REDOUBT-DOOR,INVISIBLE /?CND6
	PRINTR	"On the north wall is the iron-bound door to Lord Toranaga's secret room."
?CND6:	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \?CCL9
	EQUAL?	PRSA,V?WALK \?CCL12
	IN?	NINJA,HERE \?CCL12
	ZERO?	KNOCKOUT-CNT /?CCL12
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL12:	EQUAL?	PRSA,V?WALK \?CCL17
	EQUAL?	P-WALK-DIR,P?SOUTH,P?OUT \?CCL17
	IN?	NINJA,HERE \?CCL17
	PRINT	STR?487
	CRLF	
	RTRUE	
?CCL17:	EQUAL?	PRSA,V?LEAVE \FALSE
	FSET?	SECRET-REDOUBT-DOOR,OPENBIT \?CCL25
	PUSH	P?NORTH
	JUMP	?CND23
?CCL25:	PUSH	P?WEST
?CND23:	CALL2	DO-WALK,STACK
	RSTACK	
?CCL9:	EQUAL?	RARG,M-END \FALSE
	ZERO?	MARIKO-PLAN? \?CCL30
	FSET?	OUTER-ROOM,TOUCHBIT \?CCL30
	FSET?	YABU,TOUCHBIT \?CCL30
	IN?	MARIKO,HERE \?CCL30
	IN?	KIRITSUBO,HERE \?CCL30
	FSET?	LG-NINJA,INVISIBLE \?CCL30
	ICALL2	THIS-IS-IT,YABU
	SET	'QCONTEXT,MARIKO
	SET	'MARIKO-PLAN?,TRUE-VALUE
	CRLF	
	PRINTR	"Kiri asks you a question which you don't understand.Mariko translates for her.""Did you ask Yabu about the 'plan'?"""
?CCL30:	ZERO?	NINJA-ATTACKING-CUL-DE-SAC? /FALSE
	FSET?	SECRET-REDOUBT-DOOR,INVISIBLE \FALSE
	IN?	BLACKTHORNE,PRIVATE-QUARTERS \FALSE
	IN?	KIRITSUBO,PRIVATE-QUARTERS \FALSE
	FCLEAR	SECRET-REDOUBT-DOOR,INVISIBLE
	CRLF	
	PRINTR	"Kiri pulls a section of shoji on the north wall aside, revealing a hidden iron-fortified door set into the stone wall beyond.The hinges are well oiled.""This is my Master's secret haven,"" she pants."


	.FUNCT	CHIMMOKO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	EQUAL?	PRSA,V?FIND \?CCL6
	EQUAL?	PRSO,YABU,LG-YABU \?CCL6
	IN?	YABU,OUTER-ROOM \?CCL11
	PRINTR	"""He is in the outer chamber, Anjin-san."""
?CCL11:	PRINTR	"""I don't know, Anjin-san.He was very angry."""
?CCL6:	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL13
	EQUAL?	PRSO,CHIMMOKO \?CCL13
	EQUAL?	SCENE,S-SEPPUKU \?CCL18
	PRINTR	"""Please go to my mistress, Anjin-san. This is no time for questions."""
?CCL18:	PRINTI	"She has nothing to say about "
	ICALL1	THE-PRINT-PRSI
	PRINTR	"."
?CCL13:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"Chimmoko is one of Mariko's maids."


	.FUNCT	I-CHIMMOKO:ANY:0:0
	IN?	YABU,OUTER-ROOM \FALSE
	EQUAL?	HERE,PRIVATE-QUARTERS,PRIVATE-QUARTERS-2,BLACKTHORNE-QUARTERS \?CCL6
	SET	'YABU-CNT,0
	ICALL	QUEUE,I-YABU,-1
	ICALL	QUEUE,I-YABU-LEAVES,4
	MOVE	CHIMMOKO,HERE
	CRLF	
	PRINTI	"Chimmoko, Mariko's servant, enters and bows.""Lord Yabu wishes to speak with the Anjin-san,"" she says."
	LOC	YABU
	EQUAL?	HERE,STACK /?CND7
	PRINTR	"""He is waiting in the outer room."""
?CND7:	CRLF	
	RTRUE	
?CCL6:	CALL	QUEUE,I-CHIMMOKO,1
	RSTACK	


	.FUNCT	ETSU-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?STOP \?CCL8
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?HELP,ETSU
	RTRUE	
?CCL8:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?WHO \?CCL10
	PRINTR	"Lady Maeda Etsu is Lord Maeda's mother, an elderly samurai of very high lineage."
?CCL10:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"She is an elderly samurai and customarily leans painfully on her cane; ""It's my joints, they get worse every day.""Her hair is white but her back is straight."


	.FUNCT	ACHIKO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	PRSA,V?WHO \?CCL7
	PRINTR	"Kiyama Achiko is the granddaughter-in-law of Lord Kiyama."
?CCL7:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	PRSO,DEAD \?CCL12
	PRINTR	"Achiko's lifeless body is spawled on the floor."
?CCL12:	PRINTR	"She appears to be holding up well."


	.FUNCT	I-WOMEN:ANY:0:0,NINJA?
	IN?	NINJA,SECRET-ROOM /?PRD2
	SET	'NINJA?,1
	JUMP	?PEN1
?PRD2:	SET	'NINJA?,0
?PEN1:	IN?	ETSU,BLACKTHORNE-QUARTERS \?CCL6
	CALL	CHOREOGRAPH,PRIVATE-QUARTERS,TRUE-VALUE
	RSTACK	
?CCL6:	IN?	ETSU,PRIVATE-QUARTERS-2 \?CCL8
	CALL	CHOREOGRAPH,PRIVATE-QUARTERS,TRUE-VALUE
	RSTACK	
?CCL8:	IN?	ETSU,SECRET-REDOUBT \?CCL10
	ZERO?	NINJA? /FALSE
	FSET?	BALCONY-DOOR,OPENBIT \FALSE
	CALL2	CHOREOGRAPH,BALCONY
	RSTACK	
?CCL10:	IN?	ETSU,PRIVATE-QUARTERS \?CCL17
	ZERO?	NINJA? /?CCL20
	FSET?	SECRET-REDOUBT-DOOR,OPENBIT \FALSE
	CALL2	CHOREOGRAPH,SECRET-REDOUBT
	RSTACK	
?CCL20:	FSET	NORTH-SHOJI,OPENBIT
	CALL	CHOREOGRAPH,OUTER-ROOM,TRUE-VALUE
	RSTACK	
?CCL17:	IN?	ETSU,OUTER-ROOM \?CCL25
	ZERO?	NINJA? /?CCL28
	FSET	NORTH-SHOJI,OPENBIT
	CALL2	CHOREOGRAPH,PRIVATE-QUARTERS
	RSTACK	
?CCL28:	FSET	SOUTH-SHOJI,OPENBIT
	CALL	CHOREOGRAPH,INNER-CORRIDOR,TRUE-VALUE
	RSTACK	
?CCL25:	IN?	ETSU,INNER-CORRIDOR \?CCL30
	ZERO?	NINJA? /?CCL33
	FSET	SOUTH-SHOJI,OPENBIT
	CALL2	CHOREOGRAPH,OUTER-ROOM
	RSTACK	
?CCL33:	FSET?	INNER-DOOR,OPENBIT \?CCL35
	CALL	CHOREOGRAPH,AUDIENCE-CHAMBER,TRUE-VALUE
	RSTACK	
?CCL35:	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The women stop inside the door, listening intently."
?CCL30:	IN?	ETSU,AUDIENCE-CHAMBER \FALSE
	ZERO?	NINJA? /FALSE
	FSET?	INNER-DOOR,OPENBIT \?CCL45
	CALL2	QUEUED?,I-NINJA-COWED
	ZERO?	STACK /FALSE
	CALL2	CHOREOGRAPH,INNER-CORRIDOR
	RSTACK	
?CCL45:	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /?CCL50
	CRLF	
	PRINTR	"The women huddle in fear against the closed door."
?CCL50:	CRLF	
	PRINTR	"Mariko pounds on the closed door as the rest of the women huddle around her in fear.""Anjin-san!Open the door!"""


	.FUNCT	CHOREOGRAPH:ANY:1:2,RM,MARIKO?,NINJA?,ORM
	LOC	ETSU >ORM
	IN?	NINJA,SECRET-ROOM /?CND1
	SET	'NINJA?,TRUE-VALUE
?CND1:	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK \?CCL4
	CALL2	QUEUED?,I-MARIKO-FOLLOW
	ZERO?	STACK /?CND3
?CCL4:	SET	'MARIKO?,FALSE-VALUE
?CND3:	MOVE	CHIMMOKO,RM
	MOVE	ACHIKO,RM
	MOVE	ETSU,RM
	MOVE	KIRITSUBO,RM
	ZERO?	MARIKO? /?CND7
	MOVE	MARIKO,RM
?CND7:	EQUAL?	ORM,HERE \?CCL11
	CRLF	
	ZERO?	MARIKO? /?CCL14
	PRINTI	"Mariko and the other"
	JUMP	?CND12
?CCL14:	PRINTI	"The"
?CND12:	PRINTI	" women"
	ZERO?	NINJA? /?CCL17
	IN?	MARIKO,HERE \?CND18
	PRINTI	", save Mariko,"
?CND18:	PRINTI	" flee"
	JUMP	?CND15
?CCL17:	PRINTI	", treading a narrow path between fear and curiosity, leave"
?CND15:	PRINTI	" the room and crowd into "
	ICALL2	THE-PRINT,RM
	PRINTR	"."
?CCL11:	EQUAL?	RM,HERE \?CCL21
	CRLF	
	ZERO?	NINJA? /?CCL24
	ZERO?	MARIKO? /?CCL27
	PRINTI	"Mariko and the rest of the"
	JUMP	?CND25
?CCL27:	PRINTI	"The"
?CND25:	PRINTI	" women pour out of "
	ICALL2	THE-PRINT,ORM
	PRINTR	", fleeing the ninja."
?CCL24:	ZERO?	MARIKO? /?CCL30
	PRINTI	"Mariko "
	ZERO?	STATIONARY? /?CCL33
	PRINTI	"comes from "
	JUMP	?CND31
?CCL33:	PRINTI	"follows you into "
?CND31:	ICALL2	THE-PRINT,ORM
	PRINTI	" into the room.The rest of the women follow her,"
	JUMP	?CND28
?CCL30:	PRINTI	"The women "
	ZERO?	STATIONARY? /?CCL36
	PRINTI	"come"
	JUMP	?CND34
?CCL36:	PRINTI	"follow you"
?CND34:	PRINTI	" into the room,"
?CND28:	PRINTR	" curious about the commotion, but huddled together in some fear."
?CCL21:	CALL	NEXT-ROOM?,RM,TRUE-VALUE
	ZERO?	STACK /FALSE
	CRLF	
	PRINTI	"The women"
	ZERO?	NINJA? /?CCL41
	PRINTI	", fleeing the ninja, pour"
	JUMP	?CND39
?CCL41:	PRINTI	" come"
?CND39:	PRINTI	" into "
	ICALL2	THE-PRINT,RM
	PRINTR	"."


	.FUNCT	I-MARIKO-FOLLOW:ANY:0:0
	IN?	MARIKO,HERE /FALSE
	ZERO?	CAPTURE-CNT /?CCL6
	LOC	MARIKO
	CALL2	NEXT-ROOM?,STACK
	ZERO?	STACK /?CCL9
	CRLF	
	PRINTR	"In the next room, you can hear Mariko struggling vainly to break free of the encircling ninja.""Anjin-san!"" she calls."
?CCL9:	CRLF	
	PRINTR	"You can dimly hear Mariko calling for help."
?CCL6:	MOVE	MARIKO,HERE
	EQUAL?	HERE,SECRET-REDOUBT \?CND10
	ICALL2	DEQUEUE,I-MARIKO-FOLLOW
?CND10:	CRLF	
	PRINTI	"Mariko follows "
	EQUAL?	SCENE,S-NINJA,S-ESCAPE /?CTR13
	RANDOM	100
	LESS?	50,STACK /?CCL14
?CTR13:	PRINTR	"quickly after you."
?CCL14:	PRINTR	"a pace behind, as is the custom."


	.FUNCT	SECRET-REDOUBT-F:ANY:1:1,RARG,CNT
	GETP	BOLTS,P?COUNT >CNT
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is Lord Toranaga's secret bolt hole."
	IN?	SECRET-REDOUBT-DOOR,LOCAL-GLOBALS \?CCL6
	PRINTI	"An iron-bound door, well-oiled and well-maintained, is on the south wall.There are three iron bolts on the door, "
	ICALL2	BOLT-STATE,CNT
	PRINTI	"."
	JUMP	?CND4
?CCL6:	PRINTI	"There is an explosion-scarred hole on the south wall."
?CND4:	PRINTR	"On the north wall is the door to the balcony, its bolts rusty and not so well-maintained."
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL11
	IN?	NINJA,HERE \?CCL11
	ZERO?	KNOCKOUT-CNT /?CCL11
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL11:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?SOUTH \FALSE
	IN?	NINJA,HERE \FALSE
	PRINT	STR?487
	CRLF	
	RTRUE	


	.FUNCT	BOLT-STATE:ANY:1:1,CNT
	ZERO?	CNT \?CCL3
	PRINTI	"and they are all shut"
	RTRUE	
?CCL3:	EQUAL?	CNT,1,2,4 \?CCL5
	PRINTI	"but one of them is open"
	RTRUE	
?CCL5:	EQUAL?	CNT,3,5,6 \?CCL7
	PRINTI	"but two are currently open"
	RTRUE	
?CCL7:	PRINTI	"but none of them are latched now"
	RTRUE	


	.FUNCT	BOLTS-REMAINING:ANY:1:1,CNT
	PRINTC	11
	EQUAL?	CNT,7 \?CCL3
	PRINTR	"All the bolts are now open."
?CCL3:	EQUAL?	CNT,3,5,6 \?CCL5
	PRINTR	"Two bolts are open."
?CCL5:	EQUAL?	CNT,1,2,4 \?CCL7
	PRINTR	"One bolt is open."
?CCL7:	ZERO?	CNT \FALSE
	PRINTR	"All the bolts are now closed."


	.FUNCT	BOLTS-F:ANY:0:0,CNT
	GETP	BOLTS,P?COUNT >CNT
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"There are three iron bolts to hold the door securely closed, "
	ICALL2	BOLT-STATE,CNT
	PRINTR	"."
?CCL3:	EQUAL?	PRSA,V?OPEN,V?UNLOCK \?CCL5
	CALL	ADJ-USED?,PRSO,W?FIRST
	ZERO?	STACK /?CCL8
	BTST	CNT,1 /?CCL11
	BOR	CNT,1 >CNT
	PRINT	STR?614
	JUMP	?CND6
?CCL11:	PRINTI	"The first bolt is already open."
	JUMP	?CND6
?CCL8:	CALL	ADJ-USED?,PRSO,W?SECOND
	ZERO?	STACK /?CCL13
	BTST	CNT,2 /?CCL16
	BOR	CNT,2 >CNT
	PRINT	STR?615
	JUMP	?CND6
?CCL16:	PRINTI	"The second bolt is already open."
	JUMP	?CND6
?CCL13:	CALL	ADJ-USED?,PRSO,W?THIRD
	ZERO?	STACK /?CCL18
	BTST	CNT,4 /?CCL21
	BOR	CNT,4 >CNT
	PRINT	STR?616
	JUMP	?CND6
?CCL21:	PRINTI	"The third bolt is already open."
	JUMP	?CND6
?CCL18:	BTST	CNT,1 /?CCL24
	BOR	CNT,1 >CNT
	PRINT	STR?614
	JUMP	?CND6
?CCL24:	BTST	CNT,2 /?CCL26
	BOR	CNT,2 >CNT
	PRINT	STR?615
	JUMP	?CND6
?CCL26:	BTST	CNT,4 /?CCL28
	BOR	CNT,4 >CNT
	PRINT	STR?616
?CND6:	ZERO?	CNT /?CND29
	FCLEAR	SECRET-REDOUBT-DOOR,LOCKED
?CND29:	PUTP	BOLTS,P?COUNT,CNT
	ICALL2	BOLTS-REMAINING,CNT
	RTRUE	
?CCL28:	PRINTR	"All the bolts are open already."
?CCL5:	EQUAL?	PRSA,V?CLOSE,V?LOCK \FALSE
	FSET?	SECRET-REDOUBT-DOOR,OPENBIT \?CCL35
	PRINTI	"The door isn't closed, so there's no point in locking the bolts!"
	CRLF	
	JUMP	?CND33
?CCL35:	CALL	ADJ-USED?,PRSO,W?FIRST
	ZERO?	STACK /?CCL37
	BTST	CNT,1 \?CCL40
	BAND	CNT,6 >CNT
	PRINT	STR?617
	JUMP	?CND33
?CCL40:	PRINTI	"The first bolt is already closed."
	JUMP	?CND33
?CCL37:	CALL	ADJ-USED?,PRSO,W?SECOND
	ZERO?	STACK /?CCL42
	BTST	CNT,2 \?CCL45
	BAND	CNT,5 >CNT
	PRINT	STR?618
	JUMP	?CND33
?CCL45:	PRINTI	"The second bolt is already closed."
	JUMP	?CND33
?CCL42:	CALL	ADJ-USED?,PRSO,W?THIRD
	ZERO?	STACK /?CCL47
	BTST	CNT,4 \?CCL50
	BAND	CNT,3 >CNT
	PRINT	STR?619
	JUMP	?CND33
?CCL50:	PRINTI	"The third bolt is already closed."
	JUMP	?CND33
?CCL47:	BTST	CNT,1 \?CCL53
	BAND	CNT,6 >CNT
	PRINT	STR?617
	JUMP	?CND33
?CCL53:	BTST	CNT,2 \?CCL55
	BAND	CNT,5 >CNT
	PRINT	STR?618
	JUMP	?CND33
?CCL55:	BTST	CNT,4 \?CCL57
	BAND	CNT,3 >CNT
	PRINT	STR?619
?CND33:	ZERO?	CNT \?CND58
	FSET	SECRET-REDOUBT-DOOR,LOCKED
?CND58:	PUTP	BOLTS,P?COUNT,CNT
	ICALL2	BOLTS-REMAINING,CNT
	RTRUE	
?CCL57:	PRINTR	"All the bolts are closed already."


	.FUNCT	SECRET-REDOUBT-DOOR-F:ANY:0:0,CNT
	GETP	BOLTS,P?COUNT >CNT
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"This is a heavy, iron-bound door.It looks very strong."
	FSET?	PRSO,OPENBIT \?CND4
	PRINTI	"The door is open now."
?CND4:	EQUAL?	HERE,SECRET-REDOUBT \?CND6
	PRINTI	"There are three iron bolts to secure the door, "
	ICALL2	BOLT-STATE,CNT
	PRINTC	46
	CRLF	
?CND6:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL9
	EQUAL?	CNT,7 /FALSE
	PRINTR	"The door is still bolted."
?CCL9:	EQUAL?	PRSA,V?LOCK \?CCL14
	EQUAL?	HERE,PRIVATE-QUARTERS \?CCL17
	PRINTR	"The door doesn't lock from this side."
?CCL17:	ICALL	PERFORM,V?CLOSE,BOLTS
	RTRUE	
?CCL14:	EQUAL?	PRSA,V?UNLOCK \FALSE
	EQUAL?	HERE,PRIVATE-QUARTERS \?CCL22
	PRINTR	"The door doesn't unlock from this side."
?CCL22:	ICALL	PERFORM,V?OPEN,BOLTS
	RTRUE	


	.FUNCT	BALCONY-DOOR-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"This strong, iron-bound door has rarely been used.The catches are rusty and the door itself is covered with cobwebs.Unfortunately, it appears to be the only other exit from the room."
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL5
	FSET?	TOP-CATCH,OPENBIT \?CTR7
	FSET?	BOTTOM-CATCH,OPENBIT /?CCL8
?CTR7:	PRINTI	"The door won't open.The rusty "
	FSET?	TOP-CATCH,OPENBIT \?CCL13
	PRINTI	"bottom catch holds"
	JUMP	?CND11
?CCL13:	FSET?	BOTTOM-CATCH,OPENBIT \?CCL15
	PRINTI	"top catch holds"
	JUMP	?CND11
?CCL15:	PRINTI	"top and bottom catches hold"
?CND11:	PRINTR	" it securely closed."
?CCL8:	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CALL2	QUEUED?,I-NINJA-VS-SECRET-DOOR
	ZERO?	STACK \?CCL17
	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /FALSE
?CCL17:	FSET	PRSO,OPENBIT
	PRINTI	"You throw the door open.Sweet night air rushes in"
	IN?	ETSU,SECRET-REDOUBT \?CCL24
	MOVE	ETSU,BALCONY
	MOVE	ACHIKO,BALCONY
	MOVE	CHIMMOKO,BALCONY
	MOVE	KIRITSUBO,BALCONY
	PRINTR	", and the women pour onto the veranda.Old Lady Etsu stumbles and you help her through, then turn to help Mariko."
?CCL24:	PRINTR	"."
?CCL5:	EQUAL?	PRSA,V?LOCK,V?UNLOCK \?CCL26
	PRINTR	"There's no lock, only a top and bottom catch."
?CCL26:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	FSET?	TOP-CATCH,OPENBIT /?CCL31
	ICALL	REDIRECT,BALCONY-DOOR,TOP-CATCH
	RTRUE	
?CCL31:	FSET?	TOP-CATCH,OPENBIT /?CCL33
	ICALL	REDIRECT,BALCONY-DOOR,BOTTOM-CATCH
	RTRUE	
?CCL33:	ICALL	PERFORM,V?OPEN,BALCONY-DOOR
	RTRUE	


	.FUNCT	CATCH-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET?	PRSO,OPENBIT \?CCL6
	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" is open."
?CCL6:	FSET?	PRSO,LOCKED /?CCL8
	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" is closed."
?CCL8:	FSET?	PRSO,RMUNGBIT \?CCL10
	PRINTR	"It looks a little looser than before."
?CCL10:	PRINTR	"This rusty iron catch hasn't been used in years, but it still looks strong."
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL12
	FSET?	PRSO,LOCKED \FALSE
	PRINTR	"The catches are very rusty and won't open."
?CCL12:	EQUAL?	PRSA,V?SHOOT \?CCL17
	FSET?	PISTOL,RMUNGBIT /?CCL17
	FSET	PISTOL,RMUNGBIT
	PRINTI	"The pistol goes off, but it doesn't appear to have done anything to "
	ICALL1	THE-PRINT-PRSI
	PRINTR	"."
?CCL17:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL21
	FSET?	PRSO,OPENBIT /?CCL21
	FSET?	PRSO,RMUNGBIT /?CCL26
	FSET	PRSO,RMUNGBIT
	PRINTI	"You pound on "
	ICALL1	THE-PRINT-PRSO
	PRINTR	" with all your might, small flakes of rust falling like snow, but it only gives a little."
?CCL26:	FSET	PRSO,OPENBIT
	FCLEAR	PRSO,LOCKED
	PRINTI	"You smash again and again, and finally "
	ICALL1	THE-PRINT-PRSO
	PRINTR	" clatters open."
?CCL21:	EQUAL?	PRSA,V?CLOSE \FALSE
	FSET?	PRSO,OPENBIT \FALSE
	FCLEAR	PRSO,OPENBIT
	PRINTI	"The catch slides closed with a rusty squeal"
	FSET?	BALCONY-DOOR,OPENBIT \?CND31
	PRINTI	", but "
	ICALL2	THE-PRINT,BALCONY-DOOR
	PRINTI	" is still open"
?CND31:	PRINTR	"."


	.FUNCT	BALCONY-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL6
	IN?	NINJA,HERE \?CCL6
	ZERO?	KNOCKOUT-CNT /?CCL6
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL6:	EQUAL?	PRSA,V?WALK \?CCL11
	EQUAL?	P-WALK-DIR,P?SOUTH,P?IN \?CCL11
	IN?	NINJA,HERE \?CCL11
	PRINT	STR?487
	CRLF	
	RTRUE	
?CCL11:	EQUAL?	PRSA,V?LEAP,V?DIVE \FALSE
	EQUAL?	PRSO,BALCONY,GLOBAL-HERE \FALSE
	CALL2	JIGS-UP?,J-PLUNGE
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?622
	RSTACK	


	.FUNCT	OUTER-ROOM-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?LEAVE \?CCL6
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?CCL6:	EQUAL?	PRSA,V?WALK \FALSE
	IN?	YABU,HERE \?CCL11
	PRINTR	"""Please, Anjin-san, don't leave until I am done."""
?CCL11:	IN?	NINJA,HERE \FALSE
	ZERO?	KNOCKOUT-CNT /?CCL16
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL16:	EQUAL?	PRSO,P?SOUTH,P?OUT \FALSE
	PRINT	STR?487
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	IN?	YABU,HERE \TRUE
	FSET	YABU,TOUCHBIT
	ICALL2	DEQUEUE,I-YABU-LEAVES
	SET	'YABU-CNT,0
	ICALL	QUEUE,I-YABU,-1
	PRINTI	"As you enter, you see Yabu waiting impatiently.Beyond him you see a guard watching curiously."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	I-YABU-LEAVES:ANY:0:0
	LESS?	YABU-CNT,3 \?CND1
	SET	'YABU-CNT,3
?CND1:	MOVE	YABU,INNER-CORRIDOR
	MOVE	CHIMMOKO,HERE
	CRLF	
	PRINTR	"Mariko's servant Chimmoko approaches you, very agitated.""Anjin-san, Lord Yabu has left!He was very disturbed!"""


	.FUNCT	SETUP-FOLLOW-YABU:ANY:0:0
	CALL2	QUEUED?,I-YABU
	ZERO?	STACK /FALSE
	EQUAL?	FOLLOW-FLAG,YABU /FALSE
	SET	'FOLLOW-FLAG,YABU
	ICALL2	DEQUEUE,I-YABU
	ICALL	QUEUE,I-FOLLOW-YABU,-1
	CALL	QUEUE,I-YABU,-1
	RSTACK	


	.FUNCT	I-FOLLOW-YABU:ANY:0:0,L
	LOC	YABU >L
	ZERO?	FOLLOW-FLAG /?CCL3
	EQUAL?	HERE,L /FALSE
	CALL2	NEXT-ROOM?,L
	ZERO?	STACK \FALSE
	SET	'FOLLOW-FLAG,FALSE-VALUE
	ICALL2	DEQUEUE,I-FOLLOW-YABU
	CRLF	
	PRINTR	"You seem to have lost Yabu!He's gotten too far ahead of you."
?CCL3:	ICALL2	DEQUEUE,I-FOLLOW-YABU
	RFALSE	


	.FUNCT	I-YABU:ANY:0:0
	ICALL2	THIS-IS-IT,YABU
	INC	'DELAY-CNT
	ZERO?	YABU-CNT \?CCL5
	IN?	YABU,OUTER-ROOM \?CND3
	IN?	PLAYER,OUTER-ROOM /?CND3
	RFALSE	
?CCL5:	EQUAL?	YABU-CNT,3 \?CCL11
	EQUAL?	HERE,INNER-CORRIDOR /?CND3
	LESS?	DELAY-CNT,2 \?CND3
	RFALSE	
?CCL11:	EQUAL?	YABU-CNT,4 \?CCL16
	EQUAL?	HERE,AUDIENCE-CHAMBER /?CND3
	EQUAL?	HERE,INNER-CORRIDOR,AUDIENCE-CHAMBER /?CND3
	LESS?	DELAY-CNT,2 \?CND3
	RFALSE	
?CCL16:	EQUAL?	YABU-CNT,5 \?CCL23
	EQUAL?	HERE,OUTER-CORRIDOR /?CND3
	EQUAL?	HERE,AUDIENCE-CHAMBER,OUTER-CORRIDOR /?CND3
	LESS?	DELAY-CNT,2 \?CND3
	RFALSE	
?CCL23:	EQUAL?	YABU-CNT,6 \?CCL30
	EQUAL?	HERE,STAIRS /?CND3
	EQUAL?	HERE,OUTER-CORRIDOR,STAIRS /?CND3
	LESS?	DELAY-CNT,2 \?CND3
	RFALSE	
?CCL30:	EQUAL?	YABU-CNT,7 \?CCL37
	EQUAL?	HERE,SERVANTS-QUARTERS /?CND3
	EQUAL?	HERE,STAIRS,SERVANTS-QUARTERS /?CND3
	LESS?	DELAY-CNT,2 \?CND3
	RFALSE	
?CCL37:	EQUAL?	YABU-CNT,8 \?CND3
	EQUAL?	HERE,CELLARS /?CND3
	EQUAL?	HERE,SERVANTS-QUARTERS,CELLARS /?CND3
	LESS?	DELAY-CNT,2 /FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'YABU-CNT
	EQUAL?	YABU-CNT,1 \?CCL51
	IN?	YABU,HERE \FALSE
	SET	'QCONTEXT,YABU
	CRLF	
	PRINTR	"""So sorry to disturb you, Anjin-san.I just want see -- make sure all right, understand?Lady Toda all right?Not sick?""Yabu seems nervous.You are reminded that this afternoon Yabu said something about a ""plan."""
?CCL51:	EQUAL?	YABU-CNT,2 \?CCL56
	IN?	YABU,HERE \FALSE
	SET	'QCONTEXT,YABU
	CRLF	
	PRINTR	"Yabu says, trying to keep his words simple so you will understand, ""Just want make sure all right.Understand?"""
?CCL56:	EQUAL?	YABU-CNT,3 \?CCL61
	MOVE	YABU,INNER-CORRIDOR
	SET	'QCONTEXT,FALSE-VALUE
	EQUAL?	HERE,OUTER-ROOM \FALSE
	CRLF	
	PRINTR	"Yabu bows, very friendly, and leaves.His manner seems very suspicious.The guard closes the shoji behind him."
?CCL61:	EQUAL?	YABU-CNT,4 \?CCL66
	MOVE	YABU,AUDIENCE-CHAMBER
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"Yabu walks through the audience chamber, checking that the guards are alert."
?CCL66:	EQUAL?	YABU-CNT,5 \?CCL71
	MOVE	YABU,OUTER-CORRIDOR
	EQUAL?	HERE,AUDIENCE-CHAMBER \FALSE
	CRLF	
	PRINTR	"Yabu leaves the audience chamber for the outer corridor, heading for the main stairway."
?CCL71:	EQUAL?	YABU-CNT,6 \?CCL76
	MOVE	YABU,STAIRS
	EQUAL?	HERE,OUTER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"Yabu goes down the stairs."
?CCL76:	EQUAL?	YABU-CNT,7 \?CCL81
	MOVE	YABU,SERVANTS-QUARTERS
	EQUAL?	HERE,STAIRS \FALSE
	CRLF	
	PRINTR	"Yabu goes down the steps and enters the servants' quarters.The servants drag themselves out of sleep and put their heads to the flagstones."
?CCL81:	EQUAL?	YABU-CNT,8 \?CCL86
	MOVE	YABU,CELLARS
	EQUAL?	HERE,SERVANTS-QUARTERS \FALSE
	CRLF	
	PRINTR	"Yabu leads the way deeper into the bowels of the fortress, down steps, along little-used corridors.There are no guards here."
?CCL86:	EQUAL?	YABU-CNT,9 \?CCL91
	EQUAL?	HERE,CELLARS \FALSE
	CRLF	
	PRINTR	"Yabu stands in the middle of a large cellar room.He seems to be composing himself, glancing nervously ahead."
?CCL91:	EQUAL?	YABU-CNT,10 \?CCL96
	MOVE	NINJA,CELLARS
	FSET	CELLAR-DOOR,OPENBIT
	EQUAL?	HERE,CELLARS \?CCL99
	CRLF	
	PRINTI	"Yabu rushes for a hardly noticed, heavily barred, small iron door.He fights back the rusted bolts.A draught of cool air from outside, then a spear stabs for his throat and stops just in time.Sinister black shapes stare in from the darkness beyond the door.

""I'm Kasigi Yabu,"" he says, and makes a sign with his hands.Instantly twenty black-clad men pour out of the dark and rush for a long-forgotten back way to the floors above.Yabu watches them intently, sweat beading on his brow."
	CRLF	
	ICALL2	SCORE-OBJECT,CELLARS
	JUMP	?CND97
?CCL99:	FCLEAR	CELLARS,SCOREBIT
?CND97:	SET	'FOLLOW-FLAG,FALSE-VALUE
	RTRUE	
?CCL96:	EQUAL?	YABU-CNT,11 \?CCL101
	EQUAL?	HERE,CELLARS \?CND102
	FSET?	BARRELS,SCOREBIT \?CND102
	CRLF	
	ICALL2	JIGS-UP,STR?624
	RETURN	M-FATAL
?CND102:	MOVE	YABU,GENERIC-OBJECTS
	MOVE	NINJA,SECRET-ROOM
	FCLEAR	CELLAR-DOOR,OPENBIT
	SET	'YABU-BETRAYED?,TRUE-VALUE
	EQUAL?	HERE,CELLARS \TRUE
	SET	'FOLLOW-FLAG,FALSE-VALUE
	CRLF	
	PRINTI	"Yabu nervously watches more "
	ICALL2	PRINTUNDER,STR?625
	PRINTI	" pour into the cellar.As soon as they are gone, he closes the door and slips away.

As quickly and quietly as possible you return to the living quarters, fearing that anyone you encounter may be in on the plot."
	CRLF	
	CRLF	
	ICALL2	GOTO,OUTER-ROOM
	RTRUE	
?CCL101:	EQUAL?	YABU-CNT,12 \FALSE
	ICALL2	DEQUEUE,I-YABU
	ICALL	QUEUE,I-ATTACK,-1
	RFALSE	


	.FUNCT	STAIRS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?DOWN \FALSE
	IN?	YABU,HERE \FALSE
	CALL1	YABU-LISTENS
	RSTACK	


	.FUNCT	SERVANTS-QUARTERS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?DOWN \FALSE
	IN?	YABU,HERE \FALSE
	CALL1	YABU-LISTENS
	RSTACK	


	.FUNCT	SERVANTS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTI	"They seem afraid to respond."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	PRINTR	"Those that are not asleep are prostrate on the stone floor, bowing abjectly and pretending not to exist."
?CCL7:	EQUAL?	PRSA,V?WAKE \FALSE
	PRINTR	"You would only call even more attention to yourself.Yabu might hear."


	.FUNCT	CELLARS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"These are the cellars of the fortress.The stone walls are damp and mildewed, though well-lit.Crates, boxes and barrels are everywhere."
	ZERO?	YABU-BETRAYED? /?CND4
	PRINTI	"An "
	FSET?	CELLAR-DOOR,OPENBIT \?CND6
	PRINTI	"open "
?CND6:	PRINTR	"iron-bound door is set in the east wall."
?CND4:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL9
	ZERO?	YABU-BETRAYED? /FALSE
	PRINTI	"As you make your way down into the cellars, wondering where Yabu has gotten to, you"
	PRINT	STR?628
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL9:	EQUAL?	RARG,M-BEG \?CCL14
	EQUAL?	PRSA,V?HIDE \?CCL17
	ICALL	PERFORM,V?HIDE-BEHIND,BARRELS
	RTRUE	
?CCL17:	EQUAL?	PRSA,V?HIDE-BEHIND,V?HIDE-UNDER /?CCL19
	CALL1	MOTION-VERB?
	ZERO?	STACK /?CCL19
	CALL	JIGS-UP?,J-CELLAR,STR?629
	ZERO?	STACK /TRUE
	EQUAL?	PRSA,V?WALK \?CCL27
	EQUAL?	P-WALK-DIR,P?EAST \?CCL27
	PRINTI	"You emerge from the shadows and approach the door."
	JUMP	?CND25
?CCL27:	PRINTI	"You try to sneak across the cellar."
?CND25:	IN?	NINJA,HERE \?CCL32
	ICALL2	CTHE-PRINT,NINJA
	PRINTI	" notice"
	JUMP	?CND30
?CCL32:	IN?	YABU,HERE \?CCL34
	ICALL2	DPRINT,YABU
	PRINTI	" notices"
	JUMP	?CND30
?CCL34:	PRINTI	"The ninja rear guard notices"
?CND30:	PRINTI	" you almost immediately.A glint of metal in the torchlight is your last sight."
	CALL1	JIGS-UP
	RSTACK	
?CCL19:	EQUAL?	PRSA,V?SHOOT \FALSE
	EQUAL?	PRSO,PISTOL \FALSE
	FSET?	PISTOL,RMUNGBIT /FALSE
	CALL2	JIGS-UP?,J-SHOOT
	ZERO?	STACK /TRUE
	PRINTI	"The shot rings out, but in the dim light of the cellars, you don't hit anything."
	FSET?	PRSO,PERSON \?CND43
	ICALL1	CTHE-PRINT-PRSO
	PRINTI	" doesn't miss, however."
?CND43:	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL14:	EQUAL?	RARG,M-END \FALSE
	ZERO?	YABU-HEARD? /FALSE
	CRLF	
	PRINTI	"Yabu stops for a moment as though he heard something, then turns and rushes back toward you, drawing his sword as he charges.It's quite clear he heard you following him some time ago!"
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL


	.FUNCT	BARRELS-F:ANY:0:0
	EQUAL?	PRSA,V?HIDE-UNDER,V?HIDE-BEHIND,V?BOARD /?CCL3
	EQUAL?	PRSA,V?WALK-AROUND \FALSE
?CCL3:	FSET?	BARRELS,SCOREBIT /?CCL8
	PRINT	STR?181
	CRLF	
	RTRUE	
?CCL8:	PRINTI	"Quietly, you conceal yourself behind one of the piles, and watch."
	CRLF	
	CALL2	SCORE-OBJECT,BARRELS
	RSTACK	


	.FUNCT	CELLAR-DOOR-F:ANY:0:0
	EQUAL?	SCENE,S-AFTERMATH \?CCL3
	CALL1	PAST-TENSE?
	ZERO?	STACK \FALSE
	PRINTR	"There's no door here."
?CCL3:	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	


	.FUNCT	INNER-CORRIDOR-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?LEAVE \?CCL6
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?CCL6:	EQUAL?	PRSA,V?WALK \?CCL8
	IN?	NINJA,HERE \?CCL8
	ZERO?	KNOCKOUT-CNT /?CCL8
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?WALK \?CCL13
	EQUAL?	P-WALK-DIR,P?WEST,P?OUT \?CCL13
	IN?	NINJA,HERE \?CCL13
	PRINT	STR?487
	CRLF	
	RTRUE	
?CCL13:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?WEST \FALSE
	IN?	YABU,HERE \FALSE
	CALL	JIGS-UP?,J-FOLLOW-CLOSE,STR?631
	ZERO?	STACK /TRUE
	CALL1	YABU-LISTENS
	RSTACK	


	.FUNCT	YABU-LISTENS:ANY:0:0
	RANDOM	100
	LESS?	50,STACK /?CCL3
	SET	'YABU-HEARD?,TRUE-VALUE
	JUMP	?CND1
?CCL3:	SET	'STUPID-MOVE,FALSE-VALUE
?CND1:	PRINTR	"You're getting too close to Yabu.He stops briefly: he may have heard you!"


	.FUNCT	SECRET-ROOM-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?DOWN \FALSE
	CALL	JIGS-UP?,J-REAR-GUARD,STR?633
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?634
	RSTACK	


	.FUNCT	INNER-DOOR-F:ANY:0:0
	EQUAL?	PRSA,V?OPEN \?CCL3
	FSET?	INNER-DOOR,LOCKED \FALSE
	PRINTR	"The iron bar is firmly in place.The door won't open."
?CCL3:	EQUAL?	PRSA,V?CLOSE \?CCL8
	IN?	MARIKO,AUDIENCE-CHAMBER \?CCL11
	EQUAL?	HERE,INNER-CORRIDOR \?CCL11
	PRINTI	"Mariko screams through the narrowing gap, ""Anjin-san!Don't leave me behind!"""
	CRLF	
	CRLF	
	RFALSE	
?CCL11:	IN?	GRAY-CAPTAIN,AUDIENCE-CHAMBER \?CCL15
	FSET?	GRAY-CAPTAIN,DEAD /?CCL15
	ICALL2	CTHE-PRINT,GUARDS
	PRINT	STR?635
	CRLF	
	RTRUE	
?CCL15:	IN?	GUARDS,AUDIENCE-CHAMBER \FALSE
	ICALL2	CTHE-PRINT,GUARDS
	PRINT	STR?635
	CRLF	
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?LOCK \?CCL21
	ICALL	PERFORM,V?CLOSE,IRON-BAR
	RTRUE	
?CCL21:	EQUAL?	PRSA,V?UNLOCK \FALSE
	ICALL	PERFORM,V?OPEN,IRON-BAR
	RTRUE	


	.FUNCT	IRON-BAR-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	EQUAL?	HERE,INNER-CORRIDOR /?CTR5
	FSET?	INNER-DOOR,OPENBIT \?CCL6
?CTR5:	CALL1	TELL-OPEN-CLOSED
	RSTACK	
?CCL6:	PRINT	STR?636
	ICALL1	THE-PRINT-PRSO
	PRINTR	" from here."
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL10
	FSET?	IRON-BAR,OPENBIT /?CCL10
	EQUAL?	HERE,INNER-CORRIDOR /?CTR14
	FSET?	INNER-DOOR,OPENBIT \?CCL15
?CTR14:	FSET	IRON-BAR,OPENBIT
	FCLEAR	INNER-DOOR,LOCKED
	PRINTR	"You slide the bar aside."
?CCL15:	PRINT	STR?637
	ICALL1	THE-PRINT-PRSO
	PRINTR	" from here."
?CCL10:	EQUAL?	PRSA,V?CLOSE \FALSE
	FSET?	IRON-BAR,OPENBIT \FALSE
	EQUAL?	HERE,AUDIENCE-CHAMBER \?CCL24
	FSET?	INNER-DOOR,OPENBIT /?CCL24
	PRINT	STR?638
	ICALL1	THE-PRINT-PRSO
	PRINTR	" from here."
?CCL24:	IN?	GRAY-CAPTAIN,AUDIENCE-CHAMBER \?CCL28
	FSET?	GRAY-CAPTAIN,DEAD /?CCL28
	ICALL2	CTHE-PRINT,GRAY-CAPTAIN
	PRINTI	" stops"
	PRINT	STR?639
	CRLF	
	RTRUE	
?CCL28:	IN?	GUARDS,AUDIENCE-CHAMBER \?CCL32
	ICALL2	CTHE-PRINT,GUARDS
	PRINTI	" stop"
	PRINT	STR?639
	CRLF	
	RTRUE	
?CCL32:	FCLEAR	IRON-BAR,OPENBIT
	FSET	INNER-DOOR,LOCKED
	PRINTR	"You slide the bar into place."


	.FUNCT	I-ATTACK:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	ATTACK-CNT,2 \?CND3
	ZERO?	YABU-BETRAYED? /FALSE
	GRTR?	DELAY-CNT,3 \FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'ATTACK-CNT
	EQUAL?	ATTACK-CNT,2 \?CCL11
	EQUAL?	HERE,STAIRS,SERVANTS-QUARTERS \FALSE
	PRINTI	"You"
	PRINT	STR?640
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL11:	EQUAL?	ATTACK-CNT,3 \?CCL16
	LOC	ACHIKO
	EQUAL?	HERE,STACK \FALSE
	CRLF	
	PRINTR	"The young girl, Achiko, mumbles in her sleep.She had asked to stay with Mariko, as had old Lady Etsu.Kiyama had sent for Achiko, his granddaughter-in-law, but she refused to leave Mariko.At once the daimyo had disowned her."
?CCL16:	EQUAL?	ATTACK-CNT,4 /TRUE
	EQUAL?	ATTACK-CNT,5 \?CCL22
	ICALL	QUEUE,I-WOMEN,-1
	FCLEAR	LG-NINJA,INVISIBLE
	CRLF	
	PRINTR	"Suddenly, the quiet is shattered by the cry ""Ninja!"""
?CCL22:	EQUAL?	ATTACK-CNT,6 \?CCL24
	CRLF	
	PRINTR	"From below come the sounds of battle being joined.Furious cries, screams, and the clash of swords fill the air."
?CCL24:	EQUAL?	ATTACK-CNT,7 \?CCL26
	MOVE	NINJA,SECRET-ROOM
	MOVE	NINJA-LEADER,SECRET-ROOM
	CRLF	
	PRINT	STR?641
	PRINTI	"battle continue, a violent shouting melee."
	EQUAL?	HERE,AUDIENCE-CHAMBER,OUTER-CORRIDOR,INNER-CORRIDOR \?CND27
	PRINTR	"The frantic guards at the fortified door to the outer corridor listen anxiously to the mounting holocaust below."
?CND27:	CRLF	
	RTRUE	
?CCL26:	EQUAL?	ATTACK-CNT,8 \?CCL30
	ICALL	QUEUE,I-NINJA,-1
	FSET?	OUTER-DOOR,OPENBIT /?CND31
	FSET	OUTER-DOOR,OPENBIT
	CRLF	
	PRINTI	"The guards reopen the outer door, so as to better hear the melee below."
	CRLF	
?CND31:	MOVE	GUARDS,OUTER-CORRIDOR
	EQUAL?	HERE,AUDIENCE-CHAMBER /?CTR34
	EQUAL?	HERE,INNER-CORRIDOR \?CCL35
	FSET?	INNER-DOOR,OPENBIT \?CCL35
?CTR34:	CRLF	
	PRINTR	"The officers of the Browns and Grays order their men to take up defensive positions at the far end of the corridor, no longer able to stand the waiting.Only the captain of the Grays remains, beside the door to the inner corridor."
?CCL35:	CRLF	
	PRINTR	"You can hear officers shouting orders."
?CCL30:	EQUAL?	ATTACK-CNT,9 \FALSE
	ICALL2	DEQUEUE,I-ATTACK
	FSET?	GRAY-CAPTAIN,DEAD /FALSE
	MOVE	GRAY-CAPTAIN,OUTER-CORRIDOR
	EQUAL?	HERE,AUDIENCE-CHAMBER /?CCL47
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	FSET?	INNER-DOOR,OPENBIT \FALSE
?CCL47:	CRLF	
	PRINTR	"Now the captain of the Grays leaves the audience chamber."

	.SEGMENT "PRISON"


	.FUNCT	GRAY-CAPTAIN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL7
	FSET?	PRSO,DEAD \?CCL10
	GETP	PRSO,P?OWNER
	EQUAL?	STACK,NINJA \?CCL13
	PRINTR	"He has been hacked to death by the ninja."
?CCL13:	PRINTR	"He is dead.You killed him, remember?"
?CCL10:	FSET?	LG-NINJA,INVISIBLE /?CCL15
	EQUAL?	SCENE,S-NINJA \?CCL15
	PRINTR	"He is impatient to join the battle, torn between his duty to guard the hostages and his desire to destroy the attackers."
?CCL15:	PRINTR	"He is supervising the guards."
?CCL7:	EQUAL?	PRSA,V?SHOOT \?CCL19
	EQUAL?	PRSI,PISTOL \?CCL19
	FSET?	PISTOL,RMUNGBIT /FALSE
	IN?	GUARDS,HERE \?CTR26
	CALL2	JIGS-UP?,J-KILL-CAPTAIN
	ZERO?	STACK /TRUE
?CTR26:	PUTP	GRAY-CAPTAIN,P?OWNER,BLACKTHORNE
	FSET	GRAY-CAPTAIN,DEAD
	PRINTI	"You fire the pistol, killing the captain instantly."
	IN?	GUARDS,HERE \?CCL32
	CALL2	JIGS-UP,STR?642
	RSTACK	
?CCL32:	PRINTR	"As the gray guards aren't here, you may get away with it."
?CCL19:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	FSET?	GRAY-CAPTAIN,DEAD /FALSE
	CALL2	JIGS-UP?,J-KILL-CAPTAIN
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?643
	RSTACK	

	.ENDSEG

	.SEGMENT "NINJA"


	.FUNCT	GUARDS-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	EQUAL?	SCENE,S-TORANAGA \?CCL8
	PRINTI	"Guards stand at attention around the perimeter of the room."
	RTRUE	
?CCL8:	EQUAL?	SCENE,S-PRISON \?CCL10
	PRINTI	"Samurai guards supervise the activities."
	RTRUE	
?CCL10:	PRINTI	"Guards on watch stand here and there about the room."
	RTRUE	


	.FUNCT	GUARDS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTR	"The guards are Grays, Ishido's men."
?CCL5:	EQUAL?	PRSA,V?TELL \?CCL7
	PRINTI	"They don't respond, as they are on duty."
	CRLF	
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL7:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	CALL2	JIGS-UP?,J-KILL-GUARDS
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?644
	RSTACK	


	.FUNCT	LG-NINJA-F:ANY:0:1,RARG,NEARBY?,RM
	LOC	NINJA
	CALL2	NEXT-ROOM?,STACK >NEARBY?
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	ZERO?	NEARBY? /?CCL8
	PRINT	STR?211
	CRLF	
	RTRUE	
?CCL8:	PRINTR	"There are no ninja nearby."
?CCL5:	EQUAL?	SCENE,S-AFTERMATH \?CCL10
	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	ZERO?	QCONTEXT \FALSE
?CCL10:	EQUAL?	PRSA,V?FIND,V?LISTEN \?CCL16
	PRINTR	"You see no ninja nearby, but there is plenty of noise."
?CCL16:	EQUAL?	PRSA,V?FOLLOW \?CCL18
	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /?CCL21
	PRINTI	"You "
	EQUAL?	FOLLOW-FLAG,NINJA \?CCL24
	PRINTI	"continue"
	JUMP	?CND22
?CCL24:	SET	'FOLLOW-FLAG,NINJA
	PRINTI	"begin"
?CND22:	PRINT	STR?645
	CRLF	
	LOC	NINJA >RM
	EQUAL?	HERE,RM \?CCL27
	ZERO?	FOLLOW-FLAG /?CCL30
	PRINTR	"You continue following the ninja, pushing your way ahead, trying to keep close."
?CCL30:	ICALL1	SETUP-FOLLOW-NINJA
	PRINTI	"You begin"
	PRINT	STR?645
	CRLF	
	RTRUE	
?CCL27:	LOC	NINJA
	CALL2	NEXT-ROOM?,STACK
	ZERO?	STACK /?CCL32
	PRINTI	"You "
	ZERO?	FOLLOW-FLAG /?CCL35
	PRINTI	"continue"
	JUMP	?CND33
?CCL35:	ICALL1	SETUP-FOLLOW-NINJA
	PRINTI	"begin"
?CND33:	PRINTR	" following the ninja, desperate to keep up as they retreat with Mariko."
?CCL32:	SET	'FOLLOW-FLAG,FALSE-VALUE
	PRINTR	"You've lost them!"
?CCL21:	FSET?	NINJA,INVISIBLE \?CCL37
	PRINTR	"They are gone."
?CCL37:	PRINTR	"They don't seem to be going anywhere."
?CCL18:	EQUAL?	PRSA,V?AIM \?CCL39
	EQUAL?	PRSO,PISTOL \?CCL39
	EQUAL?	PRSI,LG-NINJA \?CCL39
	PRINTR	"The pistol doesn't seem to scare them unless it's fired."
?CCL39:	EQUAL?	PRSA,V?SHOOT \?CCL44
	EQUAL?	PRSO,PISTOL \?CCL44
	EQUAL?	PRSI,LG-NINJA \?CCL44
	ZERO?	NEARBY? /?CCL50
	ICALL	PERFORM,V?SHOOT,PISTOL,NINJA
	RTRUE	
?CCL50:	FSET	PISTOL,RMUNGBIT
	PRINTR	"The ninja aren't close enough, so your shot is wasted."
?CCL44:	EQUAL?	PRSA,V?TAKE /?CCL52
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL52:	PRINTR	"The ninja aren't close enough to attack."


	.FUNCT	GENERIC-NINJA-F:ANY:2:2,R,F
	RETURN	LG-NINJA


	.FUNCT	NINJA-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"A force of black-clad, black-masked ninja is here."
	RTRUE	


	.FUNCT	NINJA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTI	"The black-masked "
	ICALL2	DPRINT,WINNER
	PRINTR	" doesn't answer."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	PRINTR	"The ninja are black-clad, black-masked shapes of darkness."
?CCL7:	EQUAL?	PRSA,V?COUNT \?CCL9
	PRINTR	"It's hard to tell, they are like black-clad ghosts in the dim, pre-dawn light."
?CCL9:	EQUAL?	PRSA,V?AIM \?CCL11
	EQUAL?	PRSO,PISTOL \?CCL11
	EQUAL?	PRSI,NINJA,NINJA-LEADER \?CCL11
	FSET?	PISTOL,RMUNGBIT \?CCL17
	PRINTR	"The ninja know the pistol isn't loaded."
?CCL17:	PRINTR	"The ninja don't seem too impressed."
?CCL11:	EQUAL?	PRSA,V?SHOOT \?CCL19
	EQUAL?	PRSO,PISTOL \?CCL19
	EQUAL?	PRSI,NINJA,NINJA-LEADER \?CCL19
	EQUAL?	HERE,CELLARS \?CND23
	CALL2	JIGS-UP?,J-CELLAR
	ZERO?	STACK /?CND25
	ICALL2	JIGS-UP,STR?646
?CND25:	RETURN	M-FATAL
?CND23:	SET	'KNOCKOUT-CNT,0
	FSET?	BALCONY,TOUCHBIT /?CND27
	IN?	MARIKO,HERE \?CND29
	SET	'CAPTURE-CNT,0
?CND29:	GETP	NINJA,P?COUNT
	ICALL	QUEUE,I-NINJA-COWED,STACK
?CND27:	FSET	PISTOL,RMUNGBIT
	EQUAL?	HERE,AUDIENCE-CHAMBER /?PRD35
	EQUAL?	HERE,INNER-CORRIDOR \?CCL33
	FSET?	INNER-DOOR,OPENBIT \?CCL33
?PRD35:	FSET?	NINJA,SCOREBIT \?CCL33
	ICALL	QUEUE,I-CAPTAIN-RETURNS,1
	ICALL	MARGINAL-PIC,P-NINJA,FALSE-VALUE
	REMOVE	NINJA-LEADER
	PRINTI	"The pistol goes off, and the back of the ninja leader's head disappears, momentarily stopping the charge."
	FSET?	GRAY-CAPTAIN,DEAD /?CND40
	PRINTI	"The shot alerts the Captain of the Grays."
?CND40:	CRLF	
	CALL2	SCORE-OBJECT,NINJA
	RSTACK	
?CCL33:	PRINTI	"Your pistol fires, blasting "
	ICALL1	PRINTA-PRSI
	PRINTR	" into his next incarnation."
?CCL19:	EQUAL?	PRSA,V?KILL,V?ATTACK,V?HIT \?PRD45
	EQUAL?	PRSO,NINJA,NINJA-LEADER \?PRD45
	EQUAL?	PRSI,SWORDS /?CTR42
?PRD45:	EQUAL?	PRSA,V?SWING,V?THROW \?CCL43
	EQUAL?	PRSO,SWORDS \?CCL43
	EQUAL?	PRSI,NINJA,NINJA-LEADER \?CCL43
?CTR42:	EQUAL?	PRSA,V?THROW \?CND52
	MOVE	SWORDS,HERE
?CND52:	PRINTR	"You strike at a ninja, but there are too many of them to take them on one at a time."
?CCL43:	EQUAL?	PRSA,V?TAKE /?CCL55
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL55:	PRINT	YOU-HAVE-TO
	PRINTR	"use a weapon to have any chance of survival."


	.FUNCT	I-CAPTAIN-RETURNS:ANY:0:0
	FSET?	GRAY-CAPTAIN,DEAD /FALSE
	FSET	GRAY-CAPTAIN,DEAD
	PUTP	GRAY-CAPTAIN,P?OWNER,NINJA
	EQUAL?	HERE,AUDIENCE-CHAMBER,INNER-CORRIDOR \?CCL6
	CRLF	
	PRINTR	"The Captain of the Grays charges back into the Audience Chamber, attacking with mindless ferocity.He cuts down one ninja, then the pack falls on him and he dies."
?CCL6:	CRLF	
	PRINTR	"There are sounds of a short fight outside, and then all is quiet."


	.FUNCT	I-NINJA:ANY:0:0,L,C,NEAR
	LOC	NINJA >L
	CALL2	QUEUED?,I-CAPTAIN-RETURNS
	ZERO?	STACK \FALSE
	CALL2	QUEUED?,I-NINJA-COWED >C
	ZERO?	C /?CCL5
	GET	C,C-TICK >C
	IN?	NINJA,HERE \?CCL8
	GRTR?	C,1 \FALSE
	INC	'NINJA-COWED-CNT
	EQUAL?	NINJA-COWED-CNT,1 \?CCL15
	CRLF	
	PRINTR	"The ninja near you seem wary of your pistol, expecting another shot."
?CCL15:	EQUAL?	NINJA-COWED-CNT,2 \?CCL17
	CRLF	
	PRINTR	"The ninja seem hesitant to risk another blast."
?CCL17:	EQUAL?	NINJA-COWED-CNT,3 \TRUE
	CRLF	
	PRINTR	"The ninja are beginning to overcome their fear."
?CCL8:	LOC	NINJA
	CALL2	NEXT-ROOM?,STACK
	ZERO?	STACK \?CCL20
	GRTR?	C,1 \FALSE
	SET	'KNOCKOUT-CNT,0
	ICALL	QUEUE,I-NINJA-COWED,1
	CRLF	
	PRINTR	"You can hear the ninja preparing to resume the attack."
?CCL20:	GRTR?	C,1 \FALSE
	CRLF	
	PRINTR	"The ninja seem quiet, perhaps they are afraid of your pistol."
?CCL5:	FSET?	MARIKO,RMUNGBIT /?CND1
	CALL2	META-LOC,MARIKO
	EQUAL?	L,STACK \?CCL28
	EQUAL?	HERE,L \?CCL31
	INC	'CAPTURE-CNT
	EQUAL?	CAPTURE-CNT,1 \?CCL36
	CRLF	
	PRINTR	"The ninja surge toward you, trying to get to Mariko."
?CCL36:	EQUAL?	CAPTURE-CNT,2 \?CCL38
	CALL2	HELD?,MARIKO
	ZERO?	STACK /?CND39
	MOVE	MARIKO,HERE
	CRLF	
	PRINTI	"You drop Mariko, telling her to run, trying to hold off the ninja."
	CRLF	
?CND39:	CRLF	
	PRINTR	"The ninja are trying to move between you and Mariko, cutting you off."
?CCL38:	EQUAL?	CAPTURE-CNT,3 \?CCL42
	CRLF	
	PRINTR	"A bold ninja grabs for Mariko, who stabs him with a small but effective dagger."
?CCL42:	EQUAL?	CAPTURE-CNT,4 \TRUE
	ICALL2	DEQUEUE,I-NINJA
	ICALL	QUEUE,I-NINJA-TAKE-MARIKO,-1
	EQUAL?	HERE,BALCONY \?CCL46
	CRLF	
	PRINTR	"Mariko tries to run for the parapet, but the ninja overpower her."
?CCL46:	CRLF	
	PRINT	STR?647
	PRINT	STR?648
	CRLF	
	RTRUE	
?CCL31:	CALL	NEXT-ROOM?,L,TRUE-VALUE >NEAR
	INC	'CAPTURE-CNT
	EQUAL?	CAPTURE-CNT,1 \?CCL51
	ZERO?	NEAR /?CND1
	CRLF	
	PRINT	STR?649
	PRINTR	" between Mariko and the ninja."
?CCL51:	EQUAL?	CAPTURE-CNT,2 \?CCL55
	ZERO?	NEAR /?CND1
	CRLF	
	PRINTI	"The sounds of "
	PRINT	STR?650
	CRLF	
	RTRUE	
?CCL55:	EQUAL?	CAPTURE-CNT,3 \?CND1
	ICALL2	DEQUEUE,I-NINJA
	ICALL	QUEUE,I-NINJA-TAKE-MARIKO,-1
	ZERO?	NEAR /?CND1
	CRLF	
	PRINT	STR?647
	PRINT	STR?648
	CRLF	
	RTRUE	
?CCL28:	LOC	BLACKTHORNE
	EQUAL?	L,STACK \?CND1
	INC	'KNOCKOUT-CNT
	EQUAL?	KNOCKOUT-CNT,1 \?CCL66
	CRLF	
	PRINTR	"The ninja surround you."
?CCL66:	EQUAL?	KNOCKOUT-CNT,2 \?CCL68
	CRLF	
	PRINTR	"The ninja are all around you.First, they try a few quick feints to gauge your speed."
?CCL68:	EQUAL?	KNOCKOUT-CNT,3 \?CND1
	ICALL2	JIGS-UP,STR?651
	RETURN	M-FATAL
?CND1:	SET	'CAPTURE-CNT,0
	SET	'KNOCKOUT-CNT,0
	IN?	NINJA,SECRET-ROOM \?CCL72
	IN?	GRAY-CAPTAIN,AUDIENCE-CHAMBER /FALSE
	IN?	MARIKO,AUDIENCE-CHAMBER /?CCL75
	FSET?	INNER-DOOR,LOCKED \FALSE
?CCL75:	FCLEAR	SECRET-ROOM-DOOR,INVISIBLE
	FSET	SECRET-ROOM-DOOR,OPENBIT
	MOVE	NINJA,AUDIENCE-CHAMBER
	ICALL2	THIS-IS-IT,NINJA
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND80
	MOVE	NINJA-LEADER,AUDIENCE-CHAMBER
	ICALL2	THIS-IS-IT,NINJA-LEADER
?CND80:	EQUAL?	HERE,AUDIENCE-CHAMBER \?CCL84
	CRLF	
	PRINTR	"Suddenly, a secret door on the south side of the room bursts open, and a black-clad figure charges through the door, directly at you!Behind him the rest of his men are crowding into the opening."
?CCL84:	EQUAL?	HERE,INNER-CORRIDOR \?CCL86
	FSET?	INNER-DOOR,LOCKED \?CCL86
	CRLF	
	PRINTR	"You hear noises outside the door, quiet and stealthy, but definitely there."
?CCL86:	CRLF	
	PRINTR	"There is a sudden commotion in the audience chamber."
?CCL72:	IN?	NINJA,AUDIENCE-CHAMBER \?CCL90
	FSET?	INNER-DOOR,OPENBIT \?CCL93
	SET	'NINJA-ATTACKING-CUL-DE-SAC?,TRUE-VALUE
	MOVE	NINJA,INNER-CORRIDOR
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND94
	MOVE	NINJA-LEADER,INNER-CORRIDOR
?CND94:	EQUAL?	HERE,AUDIENCE-CHAMBER,INNER-CORRIDOR,OUTER-CORRIDOR \?CCL98
	CRLF	
	PRINTR	"The ninja crowd through the door into the inner corridor."
?CCL98:	CRLF	
	PRINT	STR?641
	PRINTR	"the fighting are getting closer."
?CCL93:	CALL2	QUEUED?,I-NINJA-VS-INNER-DOOR
	ZERO?	STACK \FALSE
	SET	'NINJA-ATTACKING-CUL-DE-SAC?,TRUE-VALUE
	FCLEAR	OUTER-DOOR,OPENBIT
	FSET	OUTER-DOOR,LOCKED
	ICALL	QUEUE,I-NINJA-VS-INNER-DOOR,-1
	EQUAL?	HERE,INNER-CORRIDOR,AUDIENCE-CHAMBER \?CCL103
	CRLF	
	PRINTR	"The ninja circle the door, then begin tearing at it with crowbars.Others secure the doors to the audience chamber, cutting off this entire section of the keep."
?CCL103:	CRLF	
	PRINTR	"You can hear the sound of the ninja tearing at the inner door."
?CCL90:	IN?	NINJA,INNER-CORRIDOR \?CCL105
	FSET	SOUTH-SHOJI,OPENBIT
	FSET	SOUTH-SHOJI,RMUNGBIT
	MOVE	NINJA,OUTER-ROOM
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND106
	MOVE	NINJA-LEADER,OUTER-ROOM
?CND106:	EQUAL?	HERE,OUTER-ROOM,INNER-CORRIDOR \?CCL110
	CRLF	
	PRINTR	"The ninja surge through the flimsy shojis into the outer reception room."
?CCL110:	CRLF	
	PRINTR	"You can hear shojis bursting to shards; the ninja are probably in the reception room!"
?CCL105:	IN?	NINJA,OUTER-ROOM \?CCL112
	FSET	NORTH-SHOJI,OPENBIT
	FSET	NORTH-SHOJI,RMUNGBIT
	MOVE	NINJA,PRIVATE-QUARTERS
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND113
	MOVE	NINJA-LEADER,PRIVATE-QUARTERS
?CND113:	EQUAL?	HERE,PRIVATE-QUARTERS,PRIVATE-QUARTERS-2,BLACKTHORNE-QUARTERS \?CCL117
	CRLF	
	PRINTR	"The ninja storm into the private apartments, scenting their quarry."
?CCL117:	CRLF	
	PRINTR	"You can hear the ninja ransacking the private apartments."
?CCL112:	IN?	NINJA,PRIVATE-QUARTERS \?CCL119
	FSET?	SECRET-REDOUBT-DOOR,OPENBIT \?CCL122
	MOVE	NINJA,SECRET-REDOUBT
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND123
	MOVE	NINJA-LEADER,SECRET-REDOUBT
?CND123:	EQUAL?	HERE,PRIVATE-QUARTERS,SECRET-REDOUBT,PRIVATE-QUARTERS-2 /?CTR126
	EQUAL?	HERE,BLACKTHORNE-QUARTERS \?CCL127
?CTR126:	CRLF	
	PRINTR	"The ninja storm through the door into the bolt hole."
?CCL127:	CRLF	
	PRINTR	"The sound quiets; the ninja must be behind more formidable walls now."
?CCL122:	CALL2	QUEUED?,I-NINJA-VS-SECRET-DOOR
	ZERO?	STACK \FALSE
	SET	'DOOR-CNT,0
	ICALL	QUEUE,I-NINJA-VS-SECRET-DOOR,-1
	EQUAL?	HERE,SECRET-REDOUBT,PRIVATE-QUARTERS \?CCL134
	CRLF	
	PRINTR	"The ninja gather outside the door, scraping at the hinges and the floor."
?CCL134:	CRLF	
	PRINTR	"You hear the sounds of scraping and pounding."
?CCL119:	IN?	NINJA,SECRET-REDOUBT \FALSE
	FSET?	MARIKO,RMUNGBIT /FALSE
	FSET?	BALCONY-DOOR,OPENBIT \?CCL141
	MOVE	NINJA,BALCONY
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND142
	MOVE	NINJA-LEADER,BALCONY
?CND142:	EQUAL?	HERE,BALCONY,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"The ninja crowd out onto the balcony."
?CCL141:	EQUAL?	HERE,BALCONY,SECRET-REDOUBT \FALSE
	FSET	BALCONY-DOOR,OPENBIT
	CRLF	
	PRINTR	"The ninja begin to attack the door, and almost immediately smash it open."


	.FUNCT	SETUP-FOLLOW-NINJA:ANY:0:0
	CALL2	QUEUED?,I-NINJA-TAKE-MARIKO
	ZERO?	STACK /FALSE
	EQUAL?	FOLLOW-FLAG,NINJA /FALSE
	SET	'FOLLOW-FLAG,NINJA
	ICALL2	DEQUEUE,I-NINJA-TAKE-MARIKO
	ICALL	QUEUE,I-FOLLOW-NINJA,-1
	CALL	QUEUE,I-NINJA-TAKE-MARIKO,-1
	RSTACK	


	.FUNCT	I-FOLLOW-NINJA:ANY:0:0,L
	LOC	NINJA >L
	ZERO?	FOLLOW-FLAG /?CCL3
	EQUAL?	HERE,L \?CCL6
	CRLF	
	PRINTR	"You've caught up with the ninja!"
?CCL6:	CALL2	NEXT-ROOM?,L
	ZERO?	STACK /?CCL8
	CRLF	
	PRINTI	"You are managing to keep up with the retreating ninja."
	CRLF	
	CRLF	
	ICALL2	GOTO,L
	RTRUE	
?CCL8:	SET	'FOLLOW-FLAG,FALSE-VALUE
	ICALL2	DEQUEUE,I-FOLLOW-NINJA
	PRINTR	"You've lost the ninja!They're too far ahead of you, and you can't be sure where they've headed."
?CCL3:	ICALL2	DEQUEUE,I-FOLLOW-NINJA
	RFALSE	


	.FUNCT	I-MARIKO-STRUGGLES:ANY:0:0
	CALL2	HELD?,MARIKO
	ZERO?	STACK /?CCL3
	CRLF	
	PRINTR	"Mariko tries to break free of your hold."
?CCL3:	FSET?	MARIKO,DEAD /?CTR4
	FSET?	MARIKO,RMUNGBIT \?CCL5
?CTR4:	ICALL2	DEQUEUE,I-MARIKO-STRUGGLES
	RFALSE	
?CCL5:	IN?	MARIKO,BALCONY \?CCL10
	CALL2	HELD?,MARIKO
	ZERO?	STACK \?CCL10
	FSET?	BALCONY-DOOR,OPENBIT \?CCL10
	MOVE	MARIKO,SECRET-REDOUBT
	EQUAL?	HERE,BALCONY,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"Mariko flees back into the redoubt."
?CCL10:	IN?	MARIKO,HERE \FALSE
	CRLF	
	PRINTR	"Mariko scurries away from you."


	.FUNCT	I-NINJA-TAKE-MARIKO:ANY:0:0,L,D
	LOC	NINJA >L
	IN?	MARIKO,L \FALSE
	CALL2	QUEUED?,I-NINJA-COWED
	ZERO?	STACK /?CND4
	ICALL2	DEQUEUE,I-NINJA-TAKE-MARIKO
	SET	'CAPTURE-CNT,0
	ICALL	QUEUE,I-NINJA,-1
	SET	'FOLLOW-FLAG,FALSE-VALUE
	IN?	MARIKO,HERE \?CCL8
	CRLF	
	PRINTR	"Mariko takes advantage of the ninja's confusion to bite at her captor's hand, breaking free and shoving her way to your side."
?CCL8:	CRLF	
	PRINTR	"You hear shouts of frustration from the ninja."
?CND4:	IN?	NINJA,SECRET-ROOM \?CND9
	REMOVE	NINJA-LEADER
	REMOVE	NINJA
	REMOVE	MARIKO
	SET	'FOLLOW-FLAG,FALSE-VALUE
	SET	'CAPTURE-CNT,0
	ICALL2	DEQUEUE,I-NINJA-COWED
	ICALL2	DEQUEUE,I-NINJA-TAKE-MARIKO
	EQUAL?	HERE,SECRET-ROOM,AUDIENCE-CHAMBER,INNER-CORRIDOR \?CCL13
	CRLF	
	PRINTI	"You hear a shout of triumph from the ninja as they carry Mariko away.You realize that this was their goal, and that one way or another, Ishido was behind it."
	CRLF	
	JUMP	?CND11
?CCL13:	CRLF	
	PRINTI	"You realize that by now the ninja have escaped with Mariko.You have no doubt that Ishido was behind it."
	CRLF	
?CND11:	ICALL1	FAILED-SCENE
	RETURN	M-FATAL
?CND9:	IN?	NINJA,AUDIENCE-CHAMBER \?CCL16
	SET	'D,SECRET-ROOM
	JUMP	?CND14
?CCL16:	IN?	NINJA,INNER-CORRIDOR \?CCL18
	SET	'D,AUDIENCE-CHAMBER
	JUMP	?CND14
?CCL18:	IN?	NINJA,OUTER-ROOM \?CCL20
	SET	'D,INNER-CORRIDOR
	JUMP	?CND14
?CCL20:	IN?	NINJA,PRIVATE-QUARTERS \?CCL22
	SET	'D,OUTER-ROOM
	JUMP	?CND14
?CCL22:	IN?	NINJA,PRIVATE-QUARTERS-2 /?CTR23
	IN?	NINJA,BLACKTHORNE-QUARTERS /?CTR23
	IN?	NINJA,SECRET-REDOUBT \?CCL24
?CTR23:	SET	'D,PRIVATE-QUARTERS
	JUMP	?CND14
?CCL24:	IN?	NINJA,BALCONY /?CCL29
	SET	'D,0
	JUMP	?CND14
?CCL29:	SET	'D,SECRET-REDOUBT
?CND14:	MOVE	NINJA,D
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND30
	MOVE	NINJA-LEADER,D
?CND30:	MOVE	MARIKO,D
	IN?	CALTROPS,NINJA \?CCL34
	RANDOM	100
	LESS?	50,STACK /?CCL34
	MOVE	CALTROPS,L
	EQUAL?	HERE,L \?CND32
	CRLF	
	PRINTI	"The ninja scatter handfuls of tiny, spiked metal balls on the floor."
	CRLF	
	JUMP	?CND32
?CCL34:	IN?	SMOKE-BOMB,NINJA \?CCL40
	RANDOM	100
	LESS?	50,STACK /?CCL40
	MOVE	SMOKE-BOMB,L
	ICALL	QUEUE,I-REMOVE-SMOKE,2
	EQUAL?	HERE,L \?CND32
	CRLF	
	PRINTI	"One of the ninja throws a smoke bomb which fills the room with choking, acrid smoke."
	CRLF	
	JUMP	?CND32
?CCL40:	IN?	FIRE-BOMB,NINJA \?CND32
	RANDOM	100
	LESS?	50,STACK /?CND32
	MOVE	FIRE-BOMB,L
	ICALL	QUEUE,I-REMOVE-FIRE,2
	EQUAL?	HERE,L \?CND32
	CRLF	
	PRINTI	"A ninja tosses a fire bomb which spreads sticky burning pitch on the floor."
	CRLF	
?CND32:	EQUAL?	HERE,D,L \FALSE
	CRLF	
	PRINTI	"The ninja retreat, "
	CALL2	PICK-ONE,MARIKO-STRUGGLES
	PRINT	STACK
	EQUAL?	FOLLOW-FLAG,NINJA \?CCL55
	EQUAL?	HERE,L \?CCL55
	PRINTI	"You follow, fighting your way through the chaos, trying to catch up."
	CRLF	
	CRLF	
	ICALL2	GOTO,D
	RTRUE	
?CCL55:	CRLF	
	RTRUE	


	.FUNCT	CALTROPS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"These are tiny spiked metal balls that remind you of the caltrops used in Europe to stop cavalry attacks.They are festooned with needle-like spines."
?CCL3:	EQUAL?	PRSA,V?TAKE \?CCL5
	CALL	JIGS-UP?,J-CALTROPS,STR?652
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?653
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?AVOID \FALSE
	SET	'AVOID-CALTROPS?,TRUE-VALUE
	PRINTR	"You do your best to avoid stepping on the caltrops."


	.FUNCT	SMOKE-BOMB-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The smoke chokes your lungs and blocks your view just enough to make the area a confusing, incomprehensible hell."


	.FUNCT	I-REMOVE-SMOKE:ANY:0:0,L
	LOC	SMOKE-BOMB >L
	REMOVE	SMOKE-BOMB
	EQUAL?	HERE,L \FALSE
	CRLF	
	PRINTR	"The smoke has dissipated enough that you can breathe and see better now."


	.FUNCT	FIRE-BOMB-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The fire bomb has broadcast burning pitch all over the floor.It looks like it would be dangerous to move."


	.FUNCT	I-REMOVE-FIRE:ANY:0:0,L
	LOC	FIRE-BOMB >L
	REMOVE	FIRE-BOMB
	EQUAL?	HERE,L \FALSE
	CRLF	
	PRINTR	"The fire from the bomb has died down somewhat now."


	.FUNCT	I-NINJA-COWED:ANY:0:0,CNT
	GETP	NINJA,P?COUNT >CNT
	LOC	NINJA
	ZERO?	STACK /FALSE
	SET	'NINJA-COWED-CNT,0
	GRTR?	CNT,2 \?CCL6
	SUB	CNT,2 >CNT
	PUTP	NINJA,P?COUNT,CNT
	IN?	NINJA,HERE \?CCL9
	CRLF	
	PRINTR	"The ninja resume their attack."
?CCL9:	CRLF	
	PRINT	STR?641
	PRINTR	"fighting redouble in intensity."
?CCL6:	IN?	NINJA,HERE \?CCL12
	CRLF	
	PRINTR	"The ninja have realized how long it takes to reload the pistol, and fearlessly resume their attack."
?CCL12:	CRLF	
	PRINT	STR?641
	PRINTR	"fighting resume their former intensity."


	.FUNCT	I-NINJA-VS-INNER-DOOR:ANY:0:0
	FSET?	INNER-DOOR,OPENBIT \?CCL3
	ICALL2	DEQUEUE,I-NINJA-VS-INNER-DOOR
	RFALSE	
?CCL3:	CALL2	QUEUED?,I-NINJA-COWED
	ZERO?	STACK /?CCL5
	EQUAL?	HERE,INNER-CORRIDOR,OUTER-ROOM \FALSE
	CRLF	
	PRINTR	"There are only muffled sounds outside the door as the ninja regroup."
?CCL5:	FSET?	IRON-BAR,OPENBIT \?CCL10
	FSET	INNER-DOOR,OPENBIT
	ICALL2	DEQUEUE,I-NINJA-VS-INNER-DOOR
	EQUAL?	HERE,INNER-CORRIDOR \?CCL13
	CRLF	
	PRINTR	"The inner door jerks inward as the ninja smash against it, and they realize that it isn't barred.They throw the door open!"
?CCL13:	EQUAL?	HERE,OUTER-ROOM \?PRG16
	CRLF	
	PRINTR	"From the corridor comes the thud of the ninja crashing against the unbarred inner door, and then the sound of the door being opened."
?CCL10:	EQUAL?	HERE,OUTER-ROOM \?PRG16
	CRLF	
	PRINTI	"You can hear the ninja furiously attacking the inner door."
	CRLF	
?PRG16:	INC	'DOOR-CNT
	EQUAL?	DOOR-CNT,1 \?CCL20
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The door rocks under the furious blows of the assault jimmies."
?CCL20:	EQUAL?	DOOR-CNT,2 \?CCL25
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The wood of the door begins to splinter."
?CCL25:	EQUAL?	DOOR-CNT,3 \?CCL30
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The men with the crowbars rip at the door, which shrieks under the blows."
?CCL30:	EQUAL?	DOOR-CNT,4 \?CCL35
	MOVE	DOOR-CRACK,INNER-CORRIDOR
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"One of the door panels cracks, then a hinge snaps and the tip of a jimmy comes through to widen the crack."
?CCL35:	EQUAL?	DOOR-CNT,5 \?CCL40
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The whole door shakes as ninja tear at it with shoulders and raging fists and feet and weapons.The door bellows and shudders and one of the bolts springs away and clatters to the floor."
?CCL40:	EQUAL?	DOOR-CNT,6 \?CCL45
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The door is near collapsing."
?CCL45:	EQUAL?	DOOR-CNT,7 \?CCL50
	EQUAL?	HERE,INNER-CORRIDOR \FALSE
	CRLF	
	PRINTR	"The entire door teeters as another bolt flies off."
?CCL50:	EQUAL?	DOOR-CNT,8 \FALSE
	ICALL2	DEQUEUE,I-NINJA-VS-INNER-DOOR
	REMOVE	DOOR-CRACK
	FSET	INNER-DOOR,OPENBIT
	FSET	INNER-DOOR,RMUNGBIT
	EQUAL?	HERE,INNER-CORRIDOR \?CCL58
	CRLF	
	PRINTR	"The door shatters, opening the way for the ninja!"
?CCL58:	EQUAL?	HERE,OUTER-ROOM \FALSE
	CRLF	
	PRINTR	"Suddenly, you hear the door crash to the floor, and the ninjas are through!"


	.FUNCT	DOOR-CRACK-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?CCL3
	PRINTR	"The crack is large enough to fire a pistol through."
?CCL3:	EQUAL?	PRSA,V?SHOOT \FALSE
	EQUAL?	PRSI,DOOR-CRACK \FALSE
	ICALL	PERFORM,V?SHOOT,PRSO,NINJA
	RTRUE	


	.FUNCT	I-NINJA-VS-SECRET-DOOR:ANY:0:0,CNT,NUM,?TMP1
	FSET?	SECRET-REDOUBT-DOOR,OPENBIT \?CCL3
	FSET?	SECRET-REDOUBT-DOOR,RMUNGBIT /?CCL3
	ICALL2	DEQUEUE,I-NINJA-VS-SECRET-DOOR
	RFALSE	
?CCL3:	GETP	BOLTS,P?COUNT >CNT
	ZERO?	CNT /?PRG30
	EQUAL?	CNT,1,2,4 \?CCL9
	SET	'NUM,1
	JUMP	?CND7
?CCL9:	EQUAL?	CNT,2,5,6 \?CCL11
	SET	'NUM,2
	JUMP	?CND7
?CCL11:	SET	'NUM,3
?CND7:	EQUAL?	NUM,3 /?CCL13
	MUL	NUM,33 >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?CND12
?CCL13:	FCLEAR	SECRET-REDOUBT-DOOR,LOCKED
	FSET	SECRET-REDOUBT-DOOR,OPENBIT
?CND12:	EQUAL?	HERE,SECRET-REDOUBT \?CCL18
	FSET?	SECRET-REDOUBT-DOOR,OPENBIT \?CCL21
	CRLF	
	PRINTI	"The ninja smash against the "
	EQUAL?	NUM,3 \?CCL24
	PRINTR	"unsecured door, and it bursts open!"
?CCL24:	PRINTI	"partly secured door, the "
	EQUAL?	NUM,2 \?CCL27
	PRINTI	"bolt tears"
	JUMP	?CND25
?CCL27:	PRINTI	"bolts tear"
?CND25:	PRINTR	" free, and the door bursts open!"
?CCL21:	CRLF	
	PRINTR	"The door jolts inward as the open bolts wiggle uselessly."
?CCL18:	EQUAL?	HERE,BALCONY \FALSE
	CRLF	
	PRINTI	"You can hear the ninja hitting the door in the redoubt."
	CRLF	
?PRG30:	INC	'DELAY-CNT
	EQUAL?	DOOR-CNT,12 \?CND32
	FSET?	MARIKO,RMUNGBIT \FALSE
	GRTR?	DELAY-CNT,4 /?CND32
	FSET?	MARIKO,RMUNGBIT \?CND32
	FSET?	MARIKO,SCOREBIT /FALSE
?CND32:	SET	'DELAY-CNT,0
	INC	'DOOR-CNT
	EQUAL?	DOOR-CNT,1 \?CCL43
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"There is a sudden hammering and a harsh muffled voice from outside.Mariko licks her dry lips.""He said to open the door and surrender or he'd -- he'd blow it up."""
?CCL43:	EQUAL?	DOOR-CNT,2 \?CCL48
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTI	"The muffled voice becomes angrier and more demanding"
	IN?	ETSU,HERE \?CND52
	PRINTI	", all eyes in the room look at you"
?CND52:	PRINTR	".Mariko translates, ""He said, if we open the door and surrender, everyone will go free except for you.He said they want you as a hostage, Anjin-san."""
?CCL48:	EQUAL?	DOOR-CNT,3 \?CCL55
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"A ferocious pounding on the door, iron clanging on iron, then the voice begins, a short violent crescendo.All sound outside ceases.""Get away from the door,"" Mariko shouts, ""He's going to explode the door!"""
?CCL55:	EQUAL?	DOOR-CNT,7 \?CCL60
	MOVE	NINJA,SECRET-REDOUBT
	LOC	NINJA-LEADER
	ZERO?	STACK /?CND61
	MOVE	NINJA-LEADER,SECRET-REDOUBT
?CND61:	MOVE	SECRET-REDOUBT-DOOR,SECRET-REDOUBT
	FSET	SECRET-REDOUBT-DOOR,OPENBIT
	FSET	SECRET-REDOUBT-DOOR,RMUNGBIT
	IN?	MARIKO,SECRET-REDOUBT \?CND63
	FSET	MARIKO,RMUNGBIT
	FSET	MARIKO,SCOREBIT
	MOVE	ROSARY,MARIKO
?CND63:	EQUAL?	HERE,SECRET-REDOUBT \?CCL67
	ICALL2	DEQUEUE,I-LOAD-PISTOL
	CALL2	HELD?,MARIKO
	ZERO?	STACK /?CCL70
	CRLF	
	PRINTI	"Mariko pounds you on the shoulders.""Let me go, Anjin-san!Let me..."""
	PRINT	STR?658
	PRINTI	", killing you instantly."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL70:	FSET	BLACKTHORNE,RMUNGBIT
	ICALL1	B-LIE-DOWN
	IN?	PISTOL,BLACKTHORNE \?CND71
	MOVE	PISTOL,HERE
	FSET	PISTOL,NDESCBIT
?CND71:	CALL	MARGINAL-PIC,P-EXPLOSION,FALSE-VALUE,P-EXPLOSION-CORNER
	ZERO?	STACK \?CND73
	CRLF	
?CND73:	PRINTI	"Mariko presses back against the iron and calls out firmly, ""I, Toda Mariko, protest this shameful attack and by my death --"""
	PRINT	STR?659
	PRINTR	" and shrieks off a far wall.The detonation knocks you off your feet.Smoke gushes into the room, the ninja following instantly.The door comes to rest in a corner."
?CCL67:	EQUAL?	HERE,BALCONY \FALSE
	CRLF	
	PRINTR	"There is a tremendous explosion in the redoubt, and smoke and debris pour out onto the balcony."
?CCL60:	EQUAL?	DOOR-CNT,8 \?CCL78
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	FSET?	MARIKO,RMUNGBIT \FALSE
	CRLF	
	PRINTR	"A ninja goes to his knees beside Mariko, seeing at once that she is broken and dying fast."
?CCL78:	EQUAL?	DOOR-CNT,9 \?CCL85
	FSET?	MARIKO,RMUNGBIT \?CND86
	FSET	MARIKO,DEAD
?CND86:	LOC	ACHIKO
	IN?	NINJA,STACK \FALSE
	FSET	ACHIKO,DEAD
	LOC	ACHIKO
	EQUAL?	HERE,STACK \?CCL93
	CRLF	
	PRINTR	"The ninja recognizes Achiko, draws his knife, and as she charges him, knifes her in the left breast."
?CCL93:	CRLF	
	PRINTR	"You hear a woman's scream, then all is silent."
?CCL85:	EQUAL?	DOOR-CNT,10 \?CCL95
	FSET?	MARIKO,RMUNGBIT \FALSE
	REMOVE	NINJA
	FSET	NINJA,INVISIBLE
	REMOVE	NINJA-LEADER
	ICALL2	DEQUEUE,I-NINJA-COWED
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"The ninja leader signals the retreat, and the ninja melt away into the night."
?CCL95:	EQUAL?	DOOR-CNT,11 \?CCL103
	FSET?	MARIKO,RMUNGBIT \FALSE
	MOVE	YABU,SECRET-REDOUBT
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"Yabu comes into the room, his face ashen.He looks over, sees you are still alive, and much of the anxiety leaves him.He looks at Mariko, rasps an order, then rips off his kimono and covers her to the neck."
?CCL103:	EQUAL?	DOOR-CNT,12 \?CCL111
	FSET?	MARIKO,RMUNGBIT \FALSE
	EQUAL?	HERE,SECRET-REDOUBT \FALSE
	CRLF	
	PRINTR	"Your eyes clear for a moment and you see Yabu, his image twisting drunkenly, then you see Mariko.You can't tell if she is alive or dead."
?CCL111:	EQUAL?	DOOR-CNT,13 \FALSE
	CRLF	
	PRINTI	"Your head seems to burst with red and purple light and you collapse.Kind hands catch you and help you to the floor."
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	ETSU-AFTER-F:ANY:0:0
	PRINTR	"On the balcony, Lady Etsu stands, supported by her maid.""I, Maeda Etsu,"" she says, her voice frail, ""attest that Toda Mariko-sama cast away her life to save herself from dishonorable capture, and that but for the barbarian samurai's bravery Lady Toda would have been captured and dishonored.I accuse Lord General Ishido of mounting this dishonorable attack.I ask you all to bear witness that I can no longer live with this shame.""

She mounts painfully to the battlement.Everyone bows to her.

""I have told the truth.I attest to it by my death,"" she says.Then she closes her eyes thankfully and lets herself fall forward to welcome death."


	.FUNCT	ROSARY-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTI	"You lift it gently from her chest.How, you wonder, could she be at once samurai and Christian?How could she choose her own death to aid her liege Lord, and at the same time pray to the Christian God who abhors suicide?"
	ICALL2	PRINTUNDER,STR?162
	PRINTR	"  You did not need to understand her, only to love her.You replace the rosary."

	.ENDSEG

	.SEGMENT "YOKOHAMA"


	.FUNCT	YOKOHAMA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	MOVE	VINCK,HERE
	FSET	VINCK,OPENBIT
	FSET	VINCK,SEARCHBIT
	FSET	VINCK,CONTBIT
	FCLEAR	VINCK,NDESCBIT
	FCLEAR	PISTOL,NDESCBIT
	CALL	QUEUE,I-VINCK-NUTS,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"This is the harbor at Yokohama, the best harbor you have ever seen, a beautiful protected anchorage.The burned hulk of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	" lies in the shallows just off the beach.All around you are the grisly remains of the heads of the guards who failed in their duty when the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" burned, more than a hundred.Seabirds ravage and quarrel over the feast."
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL10
	EQUAL?	PRSO,LG-ERASMUS \?CCL10
	ICALL2	MARGINAL-PIC,P-BURNED-ERASMUS
	PRINTI	"You study the hulk of the ship.Naga has told you it happened at night, during an earthquake and "
	ICALL2	PRINTUNDER,STR?661
	PRINTR	".It had still been burning, there in the shallows, on the next day.Now only the black gutted ribs rise out of the sea."
?CCL10:	EQUAL?	PRSA,V?BOARD,V?WALK-TO \?CCL14
	EQUAL?	PRSO,LG-ERASMUS \?CCL14
	PRINTR	"She's aground in twenty feet of water, and you have no boat."
?CCL14:	EQUAL?	PRSA,V?TAKE \?CCL18
	EQUAL?	PRSO,PISTOL \?CCL18
	FSET?	VINCK,DEAD /FALSE
	ICALL	PERFORM,V?ATTACK,VINCK
	RTRUE	
?CCL18:	EQUAL?	PRSA,V?BOW \?CCL25
	EQUAL?	PRSO,VINCK \?CCL25
	FSET?	VINCK,DEAD /?CCL25
	PRINTR	"""You've become a sod-eating Jappo, Pilot!Look at you!You're damned to hell like all these heathens!"""
?CCL25:	FSET?	VINCK,DEAD /?CCL30
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL30
	EQUAL?	PRSO,VINCK \?CCL30
	IN?	PISTOL,VINCK \?CCL36
	CALL	JIGS-UP?,J-GRAB-PISTOL,STR?662
	ZERO?	STACK /TRUE
	PRINTI	"You grab for Vinck's pistol, hoping that his madness will give you time to get it before he fires, but you're wrong, he's fast, too fast!The pistol fires, and you realize that you were ready for death, prepared, and that it doesn't matter.You've lost Mariko, and lost the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	", and it's only "
	ICALL2	PRINTUNDER,STR?258
	PRINTI	", nothing to worry about."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL36:	PRINTR	"You can hardly tell whether it's rage or a desire to snap him out of his fit, but either way, it doesn't work."
?CCL30:	EQUAL?	PRSA,V?MOVE,V?BURY,V?HELP /?PRD43
	EQUAL?	PRSA,V?TAKE \FALSE
?PRD43:	EQUAL?	PRSO,VINCK \FALSE
	FSET?	VINCK,DEAD \FALSE
	MOVE	VINCK,WINNER
	ICALL2	SCORE-OBJECT,YOKOHAMA
	ICALL	MARGINAL-PIC,P-VINCK,FALSE-VALUE
	PRINTI	"You close his eyes and pick him up and sling him over your shoulder and walk back.Samurai run toward you, Naga and Yabu at their head.

""What happened, Anjin-san?""

""He went mad."""
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	HEADS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"They have been here on the beach for several days.They are no better for the experience."
?CCL3:	EQUAL?	PRSA,V?TAKE /?CCL5
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
?CCL5:	PRINTI	"You want to lash out, to destroy whoever burned the "
	ICALL2	PRINTUNDER,STR?7
	PRINTI	", but these men are beyond all revenge.You want to just take them away and bury them."
	ICALL2	PRINTUNDER,STR?663
	CRLF	
	RTRUE	


	.FUNCT	I-VINCK-NUTS:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	VINCK-CNT,6 \?CND3
	CALL2	HELD?,VINCK
	ZERO?	STACK /FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'VINCK-CNT
	EQUAL?	VINCK-CNT,1 \?CCL9
	CRLF	
	PRINTR	"""You should never have left her to them, Pilot!What are we going to do now?How are we going to get home?You should have left her at Yedo safe, an' us safe, with our eters.""The whine in Vinck's voice irritates you.Everything about him irritates you now.Three times in the last week you have almost told your vassals to knife Vinck quietly and throw him overboard to put him out of his misery.But you always curbed your temper and sought out Yabu.Near Yabu, Vinck made no sound, petrified of him, and rightly."
?CCL9:	EQUAL?	VINCK-CNT,2 \?CCL11
	CRLF	
	PRINTI	"""We're marooned with these piss eaters for the rest of our lives!Eh?"""
	CRLF	
	CRLF	
	PRINTR	"""We're to grovel to these God-cursed heathens for the rest of our muck-eating lives and how long'll that be when all they talk about's war war war?"""
?CCL11:	EQUAL?	VINCK-CNT,3 \?CCL13
	CRLF	
	PRINTI	"""It's your fault!You said to come to the Japans and we come and how many died coming here?You're to blame."""
	CRLF	
	CRLF	
	PRINTR	"""How're we going to get home?That's your God-cursed job, to get us home!How you going to do that?Eh?""

""Another of our ships'll get here, Johann.We've just got to wait,"" you reply."
?CCL13:	EQUAL?	VINCK-CNT,4 \?CCL15
	MOVE	PISTOL,VINCK
	PUTP	PISTOL,P?OWNER,VINCK
	FCLEAR	PISTOL,RMUNGBIT
	CRLF	
	PRINTR	"""Wait?Five muck-plagued years?Twenty?""Vinck's mind snaps.""They're going to chop off our heads and stick them like those there and the birds'll eat us ... ""A paroxysm of insane laughter shakes him and he reaches into his shirt for his pistol.Vinck waves the pistol in your face."
?CCL15:	EQUAL?	VINCK-CNT,5 \?CCL17
	FSET	VINCK,DEAD
	CRLF	
	PRINTR	"Vinck takes to his heels down the beach, the seabirds scudding into the air, mewing and cawing out of his path.Vinck runs for a frantic hundred paces or more, then collapses, ending up on his back, his legs still moving, arms waving, mouthing obscenities.After a moment he turns on his belly with a last shriek, facing you, and freezes."
?CCL17:	EQUAL?	VINCK-CNT,6 \?CCL19
	CRLF	
	IN?	PISTOL,VINCK \?CCL22
	PRINTI	"The pistol is leveled at you, Vinck's"
	JUMP	?CND20
?CCL22:	PRINTI	"His empty fist is pointed at you, his"
?CND20:	FSET	VINCK,RMUNGBIT
	PRINTR	" eyes staring with demented antagonism, the lips pulled back from his teeth.Vinck is dead."
?CCL19:	EQUAL?	VINCK-CNT,7 \FALSE
	ICALL2	DEQUEUE,I-VINCK-NUTS
	RFALSE	

	.ENDSEG

	.SEGMENT "AFTERMATH"


	.FUNCT	STABLE-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	FCLEAR	LG-NINJA,INVISIBLE
	MOVE	YABU,HERE
	MOVE	OMI,HERE
	MOVE	HIRO-MATSU,HERE
	MOVE	TORANAGA,HERE
	ICALL2	THIS-IS-IT,TORANAGA
	CALL	QUEUE,I-STABLE,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	AFTERMATH-QUESTION,4 \?CCL8
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL11
	EQUAL?	PRSO,TORANAGA \?CCL11
	EQUAL?	PRSI,SEALED-SCROLL \?CCL11
	CALL1	BUILD-ANOTHER-SHIP
	RSTACK	
?CCL11:	EQUAL?	PRSA,V?MAKE \FALSE
	EQUAL?	PRSO,LG-SHIP \FALSE
	CALL1	TRY-QCONTEXT?
	ZERO?	STACK \TRUE
	RFALSE	
?CCL8:	EQUAL?	AFTERMATH-QUESTION,1 \?CCL21
	EQUAL?	PRSA,V?TELL-ABOUT \FALSE
	EQUAL?	PRSO,TORANAGA \FALSE
	EQUAL?	PRSI,YABU,PLAN \?CCL29
	SET	'WINNER,TORANAGA
	ICALL2	PERFORM,V?NO
	RTRUE	
?CCL29:	PRINT	STR?666
	CRLF	
	RTRUE	
?CCL21:	EQUAL?	AFTERMATH-QUESTION,2 \FALSE
	EQUAL?	PRSA,V?TELL-ABOUT \FALSE
	EQUAL?	PRSO,TORANAGA \FALSE
	EQUAL?	PRSI,LG-NINJA \?CCL39
	CALL1	YABU-BETRAYED-YOU
	RSTACK	
?CCL39:	EQUAL?	PRSI,PLAN \?CCL41
	PRINTR	"""I don't care about that!What did he do?I'm not interested in talk,"" replies Toranaga."
?CCL41:	PRINT	STR?666
	CRLF	
	RTRUE	


	.FUNCT	I-STABLE:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	STABLE-CNT,1 \?CCL5
	FSET?	SEALED-SCROLL,SCOREBIT \?CND3
	CRLF	
	PRINTI	"""Please "
	FSET?	SEALED-SCROLL,OPENBIT \?CCL10
	PRINTI	"read the message"
	JUMP	?CND8
?CCL10:	PRINTI	"open the scroll"
?CND8:	PRINTR	", Anjin-san."""
?CCL5:	EQUAL?	STABLE-CNT,2 \?CCL12
	EQUAL?	AFTERMATH-QUESTION,4 \?CND3
	CRLF	
	PRINT	STR?667
	CRLF	
	RTRUE	
?CCL12:	EQUAL?	STABLE-CNT,4 \?CCL16
	EQUAL?	AFTERMATH-QUESTION,1 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL21
	ICALL1	TORANAGA-LOSES-PATIENCE
	RETURN	M-FATAL
?CCL21:	CRLF	
	PRINTR	"""Anjin-san, isn't it true that Yabu is my loyal vassal?,"" asks Toranaga."
?CCL16:	EQUAL?	STABLE-CNT,5 \?CCL23
	EQUAL?	AFTERMATH-QUESTION,2 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL28
	ICALL1	TORANAGA-LOSES-PATIENCE
	RETURN	M-FATAL
?CCL28:	CRLF	
	PRINTR	"""What did Yabu do, Anjin-san?"" asks Toranaga."
?CCL23:	EQUAL?	STABLE-CNT,6 \?CND3
	EQUAL?	AFTERMATH-QUESTION,3 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL34
	ICALL1	TORANAGA-LOSES-PATIENCE
	RETURN	M-FATAL
?CCL34:	CRLF	
	PRINTR	"""What did he say, Anjin-san?"" asks Toranaga."
?CND3:	SET	'DELAY-CNT,0
	INC	'STABLE-CNT
	EQUAL?	STABLE-CNT,1 \?CCL37
	MOVE	SEALED-SCROLL,BLACKTHORNE
	ICALL2	THIS-IS-IT,SEALED-SCROLL
	CRLF	
	PRINTR	"""Listen, Anjin-san, before Mariko-sama left Yedo, she gave me this.Mariko-sama said if you live after Osaka -- if you live, understand -- she asked me to give this to you.""Toranaga hands you a sealed scroll."
?CCL37:	EQUAL?	STABLE-CNT,2 \?CCL39
	SET	'AFTERMATH-QUESTION,4
	SET	'QCONTEXT,TORANAGA
	CRLF	
	PRINT	STR?667
	CRLF	
	RTRUE	
?CCL39:	EQUAL?	STABLE-CNT,3 \?CCL41
	CRLF	
	PRINTR	"Toranaga turns to the watchers.""So, Hiro-matsu-san, how's the training of the musket regiment?""

Hiro-matsu scowls.""I still think this is all dishonorable and unnecessary.Soon we'll be able to forget it.We'll piss all over Ishido without this sort of treachery."""
?CCL41:	EQUAL?	STABLE-CNT,4 \?CCL43
	SET	'AFTERMATH-QUESTION,1
	SET	'QCONTEXT,TORANAGA
	ICALL2	THIS-IS-IT,YABU
	CRLF	
	PRINTI	"Yabu says, ""Please excuse me, but without these guns, we'll lose.This is a modern war, this way we've a chance to win.""He looks back at Toranaga.""I heard in the night that Jikkyu's dead.My informant reports he died two days ago.He's been sick for some time.Doesn't this open up the southern route?We could slice into Ishido's underbelly!""

""What did Jikkyu die of?"" asks Toranaga.

""Sickness, Sire.""

""A five-hundred-koku sickness?""

Yabu laughs nervously, wondering how Toranaga could have breached his security net.""Yes, I would assume so.Cheap, "
	ICALL2	PRINTUNDER,STR?668
	PRINTI	"?Five hundred koku for the southern route.""

Hiro-matsu says stiffly to Toranaga, ""Please excuse me but I think that's a disgusting story.""

""Treachery's a weapon of war.Jikkyu was an enemy and a fool.Yabu-sama has served me well.Here and at Osaka."
	ICALL2	PRINTUNDER,STR?669
	PRINTR	", Yabu-san?""

""I always try to serve you loyally, Sire.""

""Yes, it is true.""Toranaga turns to you.""Isn't it true, Anjin-san, that Yabu served me loyally at Osaka?"""
?CCL43:	EQUAL?	STABLE-CNT,5 \?CCL45
	SET	'AFTERMATH-QUESTION,2
	ICALL2	THIS-IS-IT,YABU
	SET	'QCONTEXT,TORANAGA
	CRLF	
	PRINTR	"Calmly and genially, Toranaga asks ""What did Yabu do, then, to betray me?"""
?CCL45:	EQUAL?	STABLE-CNT,6 \?CCL47
	SET	'AFTERMATH-QUESTION,3
	ICALL2	THIS-IS-IT,YABU
	SET	'QCONTEXT,TORANAGA
	CRLF	
	PRINTR	"Toranaga, steel in his voice, but still very quiet, asks ""What did he say to the ninja?"""
?CCL47:	EQUAL?	STABLE-CNT,7 \?CCL49
	MOVE	OMI,GENERIC-OBJECTS
	MOVE	YABU,GENERIC-OBJECTS
	MOVE	BUNTARO,GENERIC-OBJECTS
	CRLF	
	PRINTI	"""Thank you, Anjin-san.You have confirmed what was said by a servant who survived the attack.I wanted the word of a samurai as well.""

""What am I accused of, Sire?Helping "
	ICALL2	PRINTUNDER,STR?625
	PRINTI	"?Ridiculous!What have the fantasies of servants and barbarians to do with me?They're liars!""

""Yabu-sama, did you do these things?"" Hiro-matsu asks.

""Of course not!""

Toranaga says, ""But I think you did, so all your lands are forfeit.Please slit your belly today.Before noon.What arrangements do you want made?""

""Just some paper and ink and a brush for my will and death poem, and two tatamis -- there's no reason to hurt my knees or to kneel in the dirt like a stinking peasant."
	ICALL2	PRINTUNDER,STR?273
	PRINTR	""" Yabu adds with bravado.

Buntaro and a party of samurai warily lead Yabu away, looking from one to the other with suppressed excitement."
?CCL49:	EQUAL?	STABLE-CNT,8 \?CCL51
	MOVE	PEDESTAL,HERE
	ICALL2	THIS-IS-IT,YABU-HEAD
	MOVE	OMI,HERE
	CRLF	
	PRINTR	"Just after noon, Omi returns and unwraps Yabu's head.""Lord Kasigi Yabu obeyed, Sire, just before noon.""Toranaga inspects his enemy as he has done ten thousand times before, wondering how his head would look after death, viewed by his conqueror, and whether terror would show, or agony or anger or horror or all of them or none of them.Or dignity."
?CCL51:	EQUAL?	STABLE-CNT,9 \FALSE
	CRLF	
	PRINTI	"""Did he die well?""

""The best I have ever seen, Sire.""He pauses.""Do you wish me to bury it, or display it?""

""Put it on a spear, facing the wreck of the Anjin-san's ship.""

""Yes, Sire.""

""What was his death poem?""

Omi says,
	""'What are clouds
	But an excuse for the sky?
	What is life
	But an escape from death?'""

Toranaga smiles."
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	TORANAGA-LOSES-PATIENCE:ANY:0:0
	CRLF	
	PRINTI	"Toranaga loses his patience with you.""The Anjin was probably a part of the conspiracy! Take this barbarian away and dispose of him.Then send the body to the "
	ICALL2	PRINTUNDER,STR?218
	PRINTI	"!"""
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	BUILD-ANOTHER-SHIP:ANY:0:0
	SET	'AFTERMATH-QUESTION,0
	SET	'QCONTEXT,FALSE-VALUE
	PRINTI	"""Mariko-sama say this ship is not necessary.Say build new ship.Say -- ""

""Ah!Possible?Possible?Anjin-san?""

""Yes,"" you reply, ""Yes!""And you think, by next year, a new ship, a ship like her, trim and miniature like a Yoshitomo blade, and just as dangerous.Next year she'll take the Black Ship, a prize twenty times her own weight, like Mariko did at Osaka."""
	ICALL2	PRINTUNDER,STR?670
	PRINTR	" will be her name,"" you say aloud.

Toranaga salutes you warmly, for the first time as an equal."


	.FUNCT	AFTERMATH-ANSWERS:ANY:0:0
	EQUAL?	AFTERMATH-QUESTION,4 \?CCL3
	EQUAL?	PRSA,V?MAKE \FALSE
	EQUAL?	PRSO,LG-SHIP \FALSE
	CALL1	BUILD-ANOTHER-SHIP
	RSTACK	
?CCL3:	EQUAL?	AFTERMATH-QUESTION,1 \?CCL10
	EQUAL?	PRSA,V?NO,V?IYE /?CCL13
	EQUAL?	PRSS,YABU \FALSE
	EQUAL?	PRSA,V?BETRAY \FALSE
	EQUAL?	PRSO,YOU \FALSE
	CALL1	PAST-TENSE?
	ZERO?	STACK /FALSE
?CCL13:	SET	'AFTERMATH-QUESTION,0
	PRINTR	"""No, Toranaga-sama, Yabu was not loyal to you at Osaka,"" you reply.Yabu starts, but Toranaga merely nods."
?CCL10:	EQUAL?	AFTERMATH-QUESTION,2 \?CCL21
	CALL1	YABU-LET-IN-NINJA?
	ZERO?	STACK /FALSE
	CALL1	YABU-BETRAYED-YOU
	RSTACK	
?CCL21:	EQUAL?	AFTERMATH-QUESTION,3 \FALSE
	EQUAL?	PRSA,V?BE \FALSE
	EQUAL?	PRSO,ME \FALSE
	EQUAL?	PRSI,YABU \FALSE
	SET	'AFTERMATH-QUESTION,0
	FSET	YABU,SCOREBIT
	PRINTI	"""He said to them, 'I am Kasigi Yabu,' and they poured through the door into the keep.I returned as fast as I could to protect Mariko, Kiritsubo and the rest, knowing I would be killed if I tried to fight them there."""
	CRLF	
	CALL2	SCORE-OBJECT,YABU
	RSTACK	


	.FUNCT	YABU-BETRAYED-YOU:ANY:0:0
	SET	'AFTERMATH-QUESTION,0
	PRINTI	"""Yabu betrayed you, Sire.I followed him to the cellars of the keep where he let in a force of "
	ICALL2	PRINTUNDER,STR?625
	PRINTI	".""Yabu is turning red with barely suppressed rage."
	CRLF	
	CALL2	SCORE-OBJECT,TRAITOR
	RSTACK	


	.FUNCT	YABU-LET-IN-NINJA?:ANY:0:0
	EQUAL?	PRSS,YABU \?CCL3
	EQUAL?	PRSA,V?LET-IN \?CCL6
	EQUAL?	PRSO,LG-NINJA /TRUE
?CCL6:	EQUAL?	PRSA,V?SEND \?CCL10
	EQUAL?	PRSO,LG-NINJA \?CCL10
	CALL1	PAST-TENSE?
	ZERO?	STACK \TRUE
?CCL10:	EQUAL?	PRSA,V?OPEN,V?UNLOCK \?CCL15
	EQUAL?	PRSO,CELLAR-DOOR \?CCL15
	CALL1	PAST-TENSE?
	ZERO?	STACK \TRUE
?CCL15:	EQUAL?	PRSA,V?KILL,V?BETRAY \FALSE
	EQUAL?	PRSO,MARIKO \FALSE
	CALL1	PAST-TENSE?
	ZERO?	STACK \TRUE
	RFALSE	
?CCL3:	ZERO?	PRSS \FALSE
	EQUAL?	PRSA,V?TELL-ABOUT \FALSE
	EQUAL?	PRSO,TORANAGA \FALSE
	EQUAL?	PRSI,LG-NINJA /TRUE
	RFALSE	


	.FUNCT	SEALED-SCROLL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's a rice-paper scroll."
?CCL3:	EQUAL?	PRSA,V?READ \?CCL5
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL8
	CALL2	NOT-HOLDING,PRSO
	RSTACK	
?CCL8:	FSET?	PRSO,OPENBIT \?CCL10
	PRINTI	"Mariko has written in Latin ""Thou.I love thee.If this is read by thee then I am dead in Osaka and perhaps, because of me, thy ship is dead too.I may sacrifice this most prized part of thy life because of my Faith, to safeguard my Church, but more to save thy life which is more precious to me than everything -- even the interest of my Lord Toranaga.It may come to a choice, my love: thee or thy ship.So sorry, but I choose life for thee.This ship is doomed anyway -- with or without thee.I will concede thy ship to thine enemy so that thou may live.This ship is nothing."
	ICALL2	PRINTUNDER,STR?672
	PRINTI	"  I believe Lord Toranaga will give thee all the craftsmen and carpenters necessary.Build another ship and build another life, my love.Forgive me -- but thy life is all important.I love thee."""
	CRLF	
	CALL2	SCORE-OBJECT,SEALED-SCROLL
	RSTACK	
?CCL10:	CALL2	YOULL-HAVE-TO,STR?673
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?SHOW,V?GIVE \?CCL12
	EQUAL?	PRSI,TORANAGA \?CCL12
	FSET?	PRSO,OPENBIT \?CCL17
	PRINTR	"The message is written in Latin.It's gibberish to him."
?CCL17:	PRINTR	"He has already seen the scroll.He gave it to you, didn't he?"
?CCL12:	EQUAL?	PRSA,V?MUNG,V?OPEN,V?TEAR \FALSE
	CALL	NOUN-USED?,PRSO,W?SEAL
	ZERO?	STACK /FALSE
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL24
	CALL2	NOT-HOLDING,PRSO
	RSTACK	
?CCL24:	FSET?	PRSO,OPENBIT /?CCL26
	FSET	PRSO,OPENBIT
	ICALL	NEW-SDESC,SEALED-SCROLL,STR?674
	PRINTR	"You break the seal and open the scroll."
?CCL26:	PRINT	STR?131
	CRLF	
	RTRUE	


	.FUNCT	YABU-HEAD-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"Yabu's death mask shows only berserk wrath, the lips pulled back into a ferocious challenge.The head has been freshly washed, the hair groomed, and it is stuck on the spike of a small pedestal that is customarily used for the viewing."
?CCL3:	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTI	"You pick up the head and its pedestal, at once fascinated and repelled.You replace it carefully, thinking it was Yabu's "
	ICALL2	PRINTUNDER,STR?258
	PRINTR	" to end this way."


	.FUNCT	NEVER-AFTER-F:ANY:0:0
	PRINTI	"Before long, you and a hundred samurai are working to raise the keel of the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	".One day, you notice Father Alvito standing on a dune overlooking the beach.You join him.

""You really believe you can float the hulk?"" he asks.""No matter.It will all be a waste, all that labor.""

""There'll be another 'Act of God?'  Another sabotage?Then I'll build another, and if that fails, another.I'll get back to England and then I'm coming back, with a privateer!""

""Yes. I know. That's why you will never leave.You know too much, Anjin-san.You're a fine adversary, one to respect.Surely we can have a truce, and make peace.I ask it because of Mariko-sama.""

""I'll offer you a truce, not peace.In her memory."""

	.ENDSEG

	.SEGMENT "SEKIGAHARA"


	.FUNCT	SEKIGAHARA-F:ANY:0:1,RARG,LEFT,WIDE,Y,?TMP2,?TMP1
	EQUAL?	RARG,M-ENTER \?CCL3
	WINGET	S-TEXT,WLEFT >LEFT
	WINGET	S-TEXT,WWIDE >WIDE
	PICINF	P-CREST,YX-TBL /?BOGUS4
?BOGUS4:	WINGET	S-TEXT,WTOP >?TMP1
	GET	YX-TBL,0 >?TMP2
	MUL	2,FONT-Y
	ADD	?TMP2,STACK
	ICALL	WINDEF,4,?TMP1,LEFT,STACK,WIDE
	SCREEN	4
	CLEAR	4
	ICALL2	CENTER-PIC,P-CREST
	WINGET	4,WHIGH >?TMP1
	WINGET	4,WTOP
	ADD	?TMP1,STACK >Y
	GET	0,18
	SUB	STACK,Y
	SUB	STACK,1
	ICALL	WINDEF,S-TEXT,Y,LEFT,STACK,WIDE
	SCREEN	S-TEXT
	RTRUE	
?CCL3:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"That year, at dawn on the twenty-first day of the tenth month, the Month without Gods, the main armies clashed.It was in the mountains near Sekigahara, astride the North Road, the weather foul -- fog, then sleet.By late afternoon Toranaga had won the battle and the slaughter began.Forty thousand heads were taken.

Three days later Ishido was captured alive and Toranaga genially reminded him of the prophecy and sent him in chains to Osaka for public viewing, ordering the "
	ICALL2	PRINTUNDER,STR?218
	PRINTI	" to plant the General Lord Ishido's feet firm in the earth, with only his head outside the earth, and to invite passersby to saw at the most famous neck in the realm with a bamboo saw.Ishido lingered three days and died very old."
	CRLF	
	CRLF	
	ICALL1	TYPE-ANY-KEY
	ICALL1	RESET-MARGIN
	CLEAR	S-TEXT
	CALL2	FINISH,TRUE-VALUE
	RSTACK	

	.ENDSEG

	.ENDI
