
	.SEGMENT "ESCAPE"


	.FUNCT	CORTEGE-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The procession consists of Toranaga's retainers.Most prominent are the litters carrying Kiritsubo and Mariko.A force of Browns guards the column, and a force of Grays guards the Browns."
?CCL3:	EQUAL?	PRSA,V?FOLLOW \FALSE
	IN?	CORTEGE,HERE /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	


	.FUNCT	ESCAPE-FOLLOW-KIRI:ANY:0:0,DIR
	ZERO?	SEEN-TORANAGA? /?CCL3
	IN?	KIRIS-LITTER,COURTYARD \?CCL3
	CALL	JIGS-UP?,J-SWITCH,STR?529
	ZERO?	STACK /TRUE
	PRINTI	"You follow Kiri into the garden and the little hut.She's crouched inside, trying to be quiet, but when you blunder in she screams in spite of herself.The scream brings guards.They recognize Kiri and wonder, if she is here, who is in the litter?It is only after the ensuing battle that Ishido returns and orders you killed."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL3:	IN?	KIRIS-LITTER,HERE /?CCL10
	LOC	KIRIS-LITTER
	CALL2	NEXT-ROOM?,STACK >DIR
	ZERO?	DIR /?CCL13
	CALL2	DO-WALK,DIR
	RSTACK	
?CCL13:	PRINTR	"You've lost track of her."
?CCL10:	PRINTR	"She's in her litter, so you can follow it when it leaves."

	.SEGMENT "MAZE"


	.FUNCT	BUNTARO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTR	"Buntaro responds sharply and impatiently, but you can't understand what he says."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	EQUAL?	SCENE,S-ESCAPE \FALSE
	PRINTR	"Buntaro looks nervous, but alert and ready.You feel he would like to kill someone, and wouldn't be too particular about who."
?CCL7:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"Toda Buntaro, Lord of Sakura, is a short, bandy-legged, ugly man with a quick temper.He is the only living son of Lord Hiro-matsu, and the husband of Lady Mariko."

	.ENDSEG

	.SEGMENT "ESCAPE"


	.FUNCT	SAZUKO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?WHO \?CCL7
	PRINTR	"Lady Sazuko is the seventh of Toranaga's official consorts, the youngest, and very pregnant."
?CCL7:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Lady Sazuko is a short, square-faced girl of little beauty.She is very pregnant."


	.FUNCT	I-ISHIDO:ANY:0:0
	INC	'ISHIDO-CNT
	EQUAL?	ISHIDO-CNT,1 \?CCL5
	ICALL	QUEUE,I-ISHIDO,-1
	MOVE	ISHIDO,FORECOURT
	MOVE	GRAYS,FORECOURT
	MOVE	BUNTARO,FORECOURT
	MOVE	YABU,FORECOURT
	FSET	FORTIFIED-GATE,OPENBIT
	EQUAL?	HERE,FORECOURT,COURTYARD \?CCL8
	CRLF	
	PRINTC	34
	ICALL2	PRINTUNDER,STR?530
	PRINTI	""" The warning comes from the forecourt.Ishido is approaching down the avenue at the head of two hundred Grays."
	CRLF	
	CRLF	
	PRINTI	"Buntaro and Yabu hurry to the fortified door as the guards open it."
	CRLF	
	CRLF	
	PRINTI	"Ishido bows to Yabu elaborately.""A fine evening, Lord Yabu.""Though no man seems hostile on either side, all are ready."
	CRLF	
	CRLF	
	PRINTR	"Ishido nods perfunctorily to Buntaro, who returns the minimum politeness allowable.Buntaro had led one of the regiments in Korea when Ishido was in overall command.Each had accused the other of treachery."
?CCL8:	CRLF	
	PRINTR	"You hear a loud shout from the forecourt, and a great deal of commotion from that direction."
?CCL5:	EQUAL?	ISHIDO-CNT,2 \?CCL10
	EQUAL?	HERE,FORECOURT \?CCL13
	CRLF	
	PRINTI	"Ishido says, ""You'd think you were all going into battle, Yabu-san, instead of just being a ceremonial escort for the Lady Kiritsubo."""
	CRLF	
	CRLF	
	PRINTR	"Buntaro stomps pugnaciously forward.""We're always ready for battle.We can take on ten men for each one of yours.We never turn our backs and run like snot-nosed cowards!"""
?CCL13:	EQUAL?	HERE,COURTYARD \FALSE
	CRLF	
	PRINTR	"Ishido is arguing with Buntaro.You are too far away to hear any of what he is saying."
?CCL10:	EQUAL?	ISHIDO-CNT,3 \?CCL17
	EQUAL?	HERE,FORECOURT \?CCL20
	CRLF	
	PRINTI	"Yabu moves carefully between Buntaro and Ishido, wanting desperately to avoid a clash that would lock them forever within the castle.""We're among friends, Buntaro-san."""
	CRLF	
	CRLF	
	PRINTR	"""Friends?Where?In this manure pile?"" sneers Buntaro.One of the Grays' hands flashes for his sword hilt, ten Browns follow, and in a moment, all are waiting for Ishido's sword to come out and signal the attack."
?CCL20:	EQUAL?	HERE,COURTYARD \FALSE
	CRLF	
	PRINTR	"You can see Yabu hurriedly move between Ishido and Buntaro.You can see even from here that there is going to be blood shed."
?CCL17:	EQUAL?	ISHIDO-CNT,4 \?CCL24
	MOVE	HIRO-MATSU,FORECOURT
	EQUAL?	HERE,FORECOURT \?CCL27
	CRLF	
	PRINTI	"Quietly, Hiro-matsu walks out of the garden shadows into the forecourt.  ""You can find friends in manure, sometimes, my son,"" he says calmly.Hands ease off sword hilts.""We have friends all over the castle.All over Osaka.""He stares into Buntaro's eyes.""Isn't that so, my son?"""
	CRLF	
	CRLF	
	PRINTI	"With an enormous effort, Buntaro nods and steps back a pace."
	CRLF	
	CRLF	
	PRINTR	"Ishido says mildly, ""I came to pay my respects to Lady Kiritsubo.I was not informed until a few moments ago that anyone was leaving."""
?CCL27:	EQUAL?	HERE,COURTYARD \FALSE
	CRLF	
	PRINTI	"You can see Hiro-matsu approach the angry pair.He says something which causes Buntaro to back off.Tensions seem to ease."
	CRLF	
	CRLF	
	PRINTR	"Ishido asks something politely of Hiro-matsu."
?CCL24:	EQUAL?	ISHIDO-CNT,5 \FALSE
	MOVE	HIRO-MATSU,COURTYARD
	MOVE	YABU,COURTYARD
	MOVE	ISHIDO,GENERIC-OBJECTS
	ICALL2	DEQUEUE,I-ISHIDO
	ICALL	QUEUE,I-KIRI,-1
	EQUAL?	HERE,FORECOURT,COURTYARD \FALSE
	CRLF	
	PRINTI	"Ishido strides through the gateway into the courtyard, Hiro-matsu and Yabu accompanying him.Five guards follow.He bows politely and wishes Kiritsubo well."
	CRLF	
	CRLF	
	PRINTI	"Satisfied that all is as it should be, Ishido turns and leaves with all his men.Hiro-matsu exhales and scratches his piles."
	EQUAL?	HERE,COURTYARD \?CCL37
	PRINTR	"""You'd better leave now, Yabu-san.That rice maggot'll give you no more trouble.""Yabu replies, ""Yes, at once."""
?CCL37:	PRINTR	"He says something to Yabu, who bows and then begins to get the escort moving."


	.FUNCT	TORANAGA-IN-DRAG-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	ICALL2	CTHE-PRINT,TORANAGA-IN-DRAG
	PRINTR	" looks at you, but doesn't reply."
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL5
	IN?	PRSO,KIRIS-LITTER \?CCL8
	PRINTI	"You can't get a good look at "
	ICALL1	THE-PRINT-PRSO
	PRINTR	"."
?CCL8:	FSET?	TORANAGA-IN-DRAG,SCOREBIT \?CCL10
	ICALL	REPLACE-SYNONYM,TORANAGA-IN-DRAG,W?KIRITSUBO,W?TORANAGA
	FCLEAR	TORANAGA-IN-DRAG,FEMALE
	PRINTI	"You look at the veiled figure.She is dressed exactly like Kiri, and at first you assume that it must be her.But if so, how did she get here?Then you look more carefully, and realize it's a man, not a woman -- it's Toranaga, in disguise!What can he be planning?Escape!"
	CRLF	
	CALL2	SCORE-OBJECT,TORANAGA-IN-DRAG
	RSTACK	
?CCL10:	PRINTR	"Toranaga looks back at you and makes a gesture that you can clearly see means 'go away.'"
?CCL5:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	CALL	JIGS-UP?,J-DRAG,STR?532
	ZERO?	STACK /TRUE
	FSET?	TORANAGA-IN-DRAG,SCOREBIT \?CCL18
	PRINTI	"You grapple with the veiled figure.As you fight, her veil drops off"
	PRINT	STR?533
	CRLF	
	JUMP	?CND16
?CCL18:	PRINTI	"You grapple with Toranaga, whose feminine kimono conceals armor and swords.He draws his killing sword and ends your life."
	CRLF	
?CND16:	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	VEIL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE,V?LOOK-BEHIND /?PRD5
	EQUAL?	PRSA,V?LOOK-UNDER,V?RAISE \?CCL3
?PRD5:	IN?	VEIL,TORANAGA-IN-DRAG \?CCL3
	ICALL	PERFORM,V?EXAMINE,TORANAGA-IN-DRAG
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?TAKE \FALSE
	IN?	VEIL,TORANAGA-IN-DRAG \FALSE
	FSET?	TORANAGA-IN-DRAG,SCOREBIT \FALSE
	CALL	JIGS-UP?,J-VEIL,STR?534
	ZERO?	STACK /TRUE
	MOVE	VEIL,WINNER
	PRINTI	"You snatch the veil"
	PRINT	STR?533
	CRLF	
	CALL1	JIGS-UP
	RSTACK	

	.SEGMENT "SEPPUKU"


	.FUNCT	COURTYARD-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	ICALL	QUEUE,I-ISHIDO,2
	MOVE	TORANAGA-IN-DRAG,TEA-HOUSE
	MOVE	MARIKO,HERE
	MOVE	SAZUKO,HERE
	MOVE	KIRITSUBO,KIRIS-LITTER
	CALL2	MOVE-CORTEGE,HERE
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"This is the courtyard of Toranaga's keep within Osaka castle.The garden is through a gate to the west, and to the south is the forecourt and fortified gate that guards the keep.

In the forecourt, outside the gate, "
	EQUAL?	SCENE,S-ESCAPE \?CCL8
	PRINTR	"an escort of sixty heavily armed samurai is drawn up in neat lines, every third man carrying a flare."
?CCL8:	EQUAL?	SCENE,S-SEPPUKU \FALSE
	PRINTR	"is a crowd of Grays, and mingling with them other samurai and their women."
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSO,ISHIDO,BUNTARO,YABU /?PRD17
	EQUAL?	PRSO,HIRO-MATSU /?PRD17
	EQUAL?	PRSI,ISHIDO,BUNTARO,YABU /?PRD17
	EQUAL?	PRSI,HIRO-MATSU \?CCL15
?PRD17:	IN?	PRSO,HERE /?CCL15
	IN?	PRSO,FORECOURT \?CCL24
	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" seems to be talking with some others by the gate.You are too far away to really tell what's going on."
?CCL24:	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" doesn't seem to be anywhere nearby."
?CCL15:	EQUAL?	PRSA,V?WALK \?CCL26
	EQUAL?	P-WALK-DIR,P?SOUTH,P?OUT \?CCL26
	FSET?	FORTIFIED-GATE,OPENBIT /?CCL26
	PRINTR	"You must wait for the gate to be opened."
?CCL26:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?WEST \FALSE
	EQUAL?	SCENE,S-ESCAPE \FALSE
	ZERO?	BEEN-IN-GARDEN? /FALSE
	PRINTR	"""No, Anjin-san, stay here!"" Mariko says.""We are leaving soon."""

	.ENDSEG

	.SEGMENT "ESCAPE"


	.FUNCT	I-KIRI:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	KIRI-CNT,5 \?CCL5
	IN?	PLAYER,COURTYARD \?CND3
	CRLF	
	PRINTR	"The samurai eye you strangely, motioning you through the gate."
?CCL5:	EQUAL?	KIRI-CNT,6 \?CND3
	EQUAL?	HERE,FORECOURT \?CND3
	CRLF	
	PRINTR	"You are urged along by the other members of the procession."
?CND3:	SET	'DELAY-CNT,0
	INC	'KIRI-CNT
	EQUAL?	KIRI-CNT,1 \?CCL13
	EQUAL?	HERE,COURTYARD \?CCL16
	CRLF	
	PRINTI	"Kiritsubo begins to cry.She obviously doesn't want to leave.She tries to stifle her sobs and unlooses her thick veil.She calls Yabu over to her litter and points to Lady Sazuko, Toranaga's pregnant consort, apparently giving him instructions.All you can understand is the word "
	ICALL2	PRINTUNDER,STR?514
	PRINTR	", 'please.'  Yabu bows."
?CCL16:	CRLF	
	PRINTR	"You can hear conversations and crying coming from the courtyard."
?CCL13:	EQUAL?	KIRI-CNT,2 \?CCL18
	FSET	KIRITSUBO,SCOREBIT
	EQUAL?	HERE,COURTYARD \?CCL21
	CRLF	
	PRINTR	"Lady Sazuko bows and hurries off, Yabu following.The girl runs up the steps.As she nears the top she slips and falls.Kiri screams something in Japanese.All eyes flash to the prostrate girl."
?CCL21:	EQUAL?	HERE,FORMAL-GARDEN \?CCL23
	SET	'SEEN-TORANAGA?,TRUE-VALUE
	CRLF	
	PRINTI	"Kiritsubo hurries through the garden into the little tea house, then emerges again moments later.As she passes you, your eyes meet."
	FSET?	TORANAGA-IN-DRAG,SCOREBIT \?CCL26
	ICALL	REPLACE-SYNONYM,TORANAGA-IN-DRAG,W?KIRITSUBO,W?TORANAGA
	PRINTI	"It is not Kiri, but Toranaga in disguise!"
	CRLF	
	JUMP	?CND24
?CCL26:	PRINTI	"It is Toranaga.Kiritsubo and Toranaga have switched!"
	CRLF	
?CND24:	CRLF	
	PRINTI	"The figure slips into Kiri's litter, veil drawn."
	CRLF	
	CALL	SCORE-OBJECT,TORANAGA-IN-DRAG,KIRITSUBO
	RSTACK	
?CCL23:	EQUAL?	HERE,TEA-HOUSE \?CCL28
	CRLF	
	PRINTI	"Suddenly, Kiritsubo dashes into the tea house.When she sees you, she screams in surprise.In moments, Yabu pokes his head into the tea house."
	ICALL2	JIGS-UP,STR?536
	CRLF	
	RTRUE	
?CCL28:	CRLF	
	PRINTR	"There seems to be some commotion in the courtyard."
?CCL18:	EQUAL?	KIRI-CNT,3 \?CCL30
	MOVE	TORANAGA-IN-DRAG,KIRIS-LITTER
	MOVE	KIRITSUBO,TEA-HOUSE
	FCLEAR	KIRITSUBO,SCOREBIT
	EQUAL?	HERE,COURTYARD \?CCL33
	EQUAL?	OHERE,FORMAL-GARDEN \?CND34
	CRLF	
	PRINTI	"You see that Sazuko, one of Toranaga's consorts, has fallen to the ground.She is pregnant, and everyone is terrified for the safety of the child."
	CRLF	
?CND34:	CRLF	
	PRINTR	"Mariko and Yabu rush to aid the girl.Yabu picks her up.Sazuko is more startled than hurt.She speaks to them, embarrassed at her clumsiness, then stands.Everyone relaxes.Toranaga's unborn child is safe."
?CCL33:	CRLF	
	PRINTR	"The commotion in the courtyard seems to have subsided."
?CCL30:	EQUAL?	KIRI-CNT,4 \?CCL37
	REMOVE	SAZUKO
	EQUAL?	HERE,FORMAL-GARDEN,TEA-HOUSE \?CND38
	ICALL1	I-COME-BACK
?CND38:	MOVE	MARIKO,MARIKOS-LITTER
	EQUAL?	HERE,COURTYARD \?CCL42
	CRLF	
	PRINTR	"Yabu shouts orders at the head of the column and sets off.Mariko gets into her litter, leaving the curtains partially open.Kiri's litter is closed."
?CCL42:	CRLF	
	PRINTR	"You can hear the procession preparing to move out."
?CCL37:	EQUAL?	KIRI-CNT,5 \?CCL44
	ICALL2	MOVE-CORTEGE,FORECOURT
	MOVE	HIRO-MATSU,GENERIC-OBJECTS
	EQUAL?	HERE,COURTYARD,FORECOURT \?CCL47
	CRLF	
	PRINTR	"The column begins to move out into the forecourt, the litter bearers carrying Mariko's and Kiritsubo's litters.Samurai move to the great door and prepare to close it."
?CCL47:	CRLF	
	PRINTR	"You can hear the procession moving off."
?CCL44:	EQUAL?	KIRI-CNT,6 \?CCL49
	FCLEAR	FORTIFIED-GATE,OPENBIT
	CRLF	
	PRINTR	"The last of the column moves out into the forecourt, and the huge fortified door closes as the great wooden bar falls into place.The head of the column is already moving on towards the gateway."
?CCL49:	EQUAL?	KIRI-CNT,7 \FALSE
	CALL1	TELL-CHECKPOINTS
	RSTACK	


	.FUNCT	TELL-CHECKPOINTS:ANY:0:0
	ICALL2	DEQUEUE,I-KIRI
	ICALL2	MOVE-CORTEGE,GATEWAY
	SET	'ISHIDO-CNT,0
	ICALL	QUEUE,I-ISHIDO-2,-1
	CRLF	
	PRINTR	"The little cortege surrounding the two litters goes slowly through the maze of the castle and through the continual checkpoints.Each time there are formal bows, the documents are meticulously examined afresh, a new captain and group of escorting Grays take over, and then you are passed.At each checkpoint you watch with increasing misgivings as the captain of the guard comes close to scrutinize the drawn curtains of Kiritsubo's litter.  Each time the man bows politely to the half-seen figure, hears the muffled sobs, and in the course of time, waves you on again.

Finally, you pass a checkpoint, turn a corner, and reach the last barrier."


	.FUNCT	CURTAINS-F:ANY:0:0
	EQUAL?	PRSA,V?OPEN,V?CLOSE \?CCL3
	EQUAL?	PRSA,V?OPEN \?CCL6
	FSET?	CURTAINS,OPENBIT /?CCL6
	CALL2	QUEUED?,I-ISHIDO-2
	ZERO?	STACK /?CCL6
	LESS?	ISHIDO-CNT,3 /?CCL6
	SET	'ISHIDO-CNT,5
	SET	'ISHIDO-DISTRACTED?,FALSE-VALUE
	FSET	CURTAINS,OPENBIT
	PRINTR	"You shove the curtains open, revealing not Kiritsubo, but Toranaga!He is veiled and dressed in a woman's kimono, but there's no mistaking him!"
?CCL6:	PRINTR	"Kiritsubo's maids politely bar your approach."
?CCL3:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	PRINTR	"All you can see is a shadowy, veiled figure."


	.FUNCT	I-COME-BACK:ANY:0:0
	FSET?	KIRITSUBO,SCOREBIT \?CND1
	LOC	SAZUKO
	ZERO?	STACK /?CND1
	ICALL	QUEUE,I-COME-BACK,2
	RFALSE	
?CND1:	SET	'BEEN-IN-GARDEN?,TRUE-VALUE
	EQUAL?	HERE,FORMAL-GARDEN,TEA-HOUSE \FALSE
	LOC	MARIKO
	EQUAL?	STACK,COURTYARD,MARIKOS-LITTER,FORECOURT \FALSE
	CRLF	
	PRINTI	"Mariko calls to you again, ""Anjin-san, come here!""She speaks briefly to Yabu, who bustles into the garden to get you."
	EQUAL?	HERE,TEA-HOUSE \?CCL12
	IN?	TORANAGA-IN-DRAG,HERE /?CTR11
	IN?	KIRITSUBO,HERE \?CCL12
?CTR11:	PRINTI	"Yabu calls for you, searching the garden, and then looks in the tea house."
	IN?	TORANAGA-IN-DRAG,HERE \?CCL19
	ICALL2	JIGS-UP,STR?536
	RETURN	M-FATAL
?CCL19:	ICALL2	JIGS-UP,STR?537
	RETURN	M-FATAL
?CCL12:	PRINTI	"He hustles you unceremoniously back to the courtyard."
	CRLF	
	CRLF	
	CALL2	GOTO,COURTYARD
	RSTACK	

	.SEGMENT "MAZE"


	.FUNCT	KIRIS-LITTER-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"Kiritsubo's curtained litter "
	EQUAL?	HERE,COURTYARD \?CCL6
	PRINTI	"sits near the garden gate"
	JUMP	?CND4
?CCL6:	PRINTI	"is nearby"
?CND4:	IN?	OBJ,KIRITSUBO /?CTR8
	IN?	OBJ,TORANAGA-IN-DRAG \?CCL9
?CTR8:	PRINTI	", and through the "
	FSET?	CURTAINS,OPENBIT \?CCL14
	PRINTI	"open"
	JUMP	?CND12
?CCL14:	PRINTI	"closed"
?CND12:	PRINTI	" curtains you can see the shadowy figure of Kiritsubo."
	RETURN	M-FATAL
?CCL9:	PRINTC	46
	RETURN	M-FATAL


	.FUNCT	KIRIS-LITTER-F:ANY:0:1,RARG
	ZERO?	RARG \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	FSET?	CURTAINS,OPENBIT \?CCL8
	PRINTI	"Through the open curtains of the litter you can see "
	ZERO?	SEEN-TORANAGA? /?CCL11
	PRINTR	"a disguised Toranaga."
?CCL11:	PRINTR	"Kiritsubo."
?CCL8:	PRINTR	"The litter is heavily curtained, and the curtains are closed."
?CCL5:	EQUAL?	PRSA,V?BOARD \?CCL13
	PRINTR	"Kiritsubo's maid prevents you."
?CCL13:	EQUAL?	PRSA,V?OPEN,V?CLOSE,V?LOOK-INSIDE \FALSE
	ICALL	PERFORM,PRSA,CURTAINS
	RTRUE	


	.FUNCT	MARIKOS-LITTER-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	HERE,WOODS,CITY \?CCL6
	EQUAL?	PRSA,V?WALK \?CCL6
	EQUAL?	PRSO,P?EAST /?CCL6
	PRINTR	"""No, Anjin-san, the docks are to the east, through the city.""The kaga-men don't move."
?CCL6:	EQUAL?	PRSA,V?SIT \?CCL11
	PRINT	STR?520
	CRLF	
	RTRUE	
?CCL11:	EQUAL?	PRSA,V?SLEEP \FALSE
	ZERO?	OPPONENT \FALSE
	CALL2	QUEUED?,I-AMBUSH
	ZERO?	STACK \FALSE
	PRINTR	"You manage to doze a little, regaining some strength."
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?BOARD \FALSE
	EQUAL?	HERE,WOODS \?CCL24
	CALL1	GET-IN-LITTER
	RSTACK	
?CCL24:	PRINTR	"Mariko's maid prevents you."

	.ENDSEG

	.SEGMENT "ESCAPE"


	.FUNCT	GET-IN-LITTER:ANY:0:1,FORCE?
	ICALL2	DEQUEUE,I-ESCAPE-CONTINUES
	MOVE	PLAYER,MARIKOS-LITTER
	ZERO?	FORCE? /?CCL3
	CRLF	
	PRINTI	"Mariko motions to the escort, and with great politeness but very insistently, they load you"
	JUMP	?CND1
?CCL3:	PRINTI	"You sway on your feet, and allow yourself to be helped"
?CND1:	PRINTI	" into the litter.At once the procession starts again.The rolling gait is soothing and you lay back, depleted."
	CRLF	
	CRLF	
	MOVE	KIRIS-LITTER,CITY
	MOVE	BUNTARO,CITY
	MOVE	YABU,CITY
	CALL2	GOTO,CITY
	RSTACK	

	.SEGMENT "DEPARTURE"


	.FUNCT	MARIKOS-LITTER-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"Mariko's litter is here"
	IN?	MARIKO,OBJ \?CCL6
	PRINTI	", and through the open curtains you can see Mariko."
	RETURN	M-FATAL
?CCL6:	PRINTC	46
	RETURN	M-FATAL

	.SEGMENT "SEPPUKU"


	.FUNCT	FORECOURT-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	MOVE	SWORDS,BLACKTHORNE
	FSET	SWORDS,WEARBIT
	MOVE	SAZUKO,FORECOURT
	MOVE	KIRITSUBO,FORECOURT
	MOVE	GRAYS,FORECOURT
	MOVE	BROWNS,FORECOURT
	MOVE	MARIKOS-LITTER,FORECOURT
	MOVE	MARIKO,MARIKOS-LITTER
	CALL	QUEUE,I-DEPARTURE,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"This is the forecourt of Toranaga's keep.To the south is the maze of paths and walls that makes up the rest of the castle.To the north, through an arched gateway with a fortified gate, is a courtyard."
	EQUAL?	SCENE,S-DEPARTURE,S-SEPPUKU \?CND6
	PRINTR	"The forecourt is crowded with Grays, other samurai and their women."
?CND6:	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-LEAVE \?CCL9
	EQUAL?	SCENE,S-ESCAPE \FALSE
	IN?	KIRIS-LITTER,FORECOURT \FALSE
	ICALL1	TELL-CHECKPOINTS
	CRLF	
	RTRUE	
?CCL9:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL19
	EQUAL?	SCENE,S-DEPARTURE \?CCL22
	CALL2	QUEUED?,I-FIGHT
	ZERO?	STACK /?CCL25
	CALL	JIGS-UP?,J-FLEE,STR?539
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?540
	RSTACK	
?CCL25:	PRINTR	"Mariko says, ""Please, Anjin-san, you cannot abandon me now.I must fulfill my duty."""
?CCL22:	EQUAL?	P-WALK-DIR,P?NORTH \?CCL30
	EQUAL?	SCENE,S-ESCAPE \FALSE
	IN?	CORTEGE,HERE \FALSE
	PRINTR	"The guards won't let you back through the gate."
?CCL30:	EQUAL?	P-WALK-DIR,P?SOUTH \FALSE
	EQUAL?	SCENE,S-ESCAPE \?CCL40
	CALL2	QUEUED?,I-ISHIDO
	ZERO?	STACK /?CCL43
	PRINTR	"The Grays stop you, indicating that you must leave with Kiritsubo or not at all."
?CCL43:	CALL2	QUEUED?,I-KIRI
	ZERO?	STACK /FALSE
	IN?	SAZUKO,COURTYARD \?CCL48
	PRINTR	"You start off into the maze of the castle, and then think better of it, deciding to wait for the rest of the cortege."
?CCL48:	IN?	KIRIS-LITTER,GATEWAY /FALSE
	IN?	KIRIS-LITTER,FORECOURT /FALSE
	PRINTR	"You decide it would be too dangerous to get ahead of the rest of the cortege."
?CCL40:	EQUAL?	SCENE,S-DEPARTURE \?CCL54
	PRINTR	"A near-solid mass of Gray samurai blocks the avenue."
?CCL54:	EQUAL?	SCENE,S-SEPPUKU \FALSE
	PRINTR	"The avenue is blocked by the onlookers nervously anticipating the events to come."
?CCL19:	EQUAL?	PRSA,V?PARRY,V?STOP \FALSE
	CALL2	HELD?,SWORDS
	ZERO?	STACK /FALSE
	CALL2	QUEUED?,I-FIGHT
	ZERO?	STACK /FALSE
	PRINTR	"You force your sword around, desperately trying to block the attack!"


	.FUNCT	FORTIFIED-GATE-F:ANY:0:0
	EQUAL?	PRSA,V?OPEN,V?CLOSE \FALSE
	PRINTR	"You could no more open or close this gate by yourself than tear down Osaka Castle with your bare hands."

	.ENDSEG

	.SEGMENT "ESCAPE"


	.FUNCT	GATEWAY-F:ANY:1:1,RARG,MAD?
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is the last portcullis and last gateway of the castle, and beyond is the final drawbridge and the final moat.To the south, on the far side of the bridge, is the ultimate strongpoint."
	EQUAL?	SCENE,S-ESCAPE \?CCL6
	PRINTR	"A multitude of flares turn the night into crimson day."
?CCL6:	PRINTR	"Crowds of curious onlookers clog the street."
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL8
	EQUAL?	OHERE,FORECOURT \TRUE
	SET	'ISHIDO-CNT,0
	ICALL	QUEUE,I-ISHIDO-2,-1
	RTRUE	
?CCL8:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	SCENE,S-ESCAPE \FALSE
	CALL2	QUEUED?,I-ISHIDO-2 >MAD?
	ZERO?	MAD? \?PEN16
	CALL2	QUEUED?,I-MADNESS >MAD?
?PEN16:	EQUAL?	PRSA,V?EXAMINE \?CCL21
	EQUAL?	PRSO,MARIKO,YABU,BUNTARO \?CCL21
	ZERO?	MAD? /FALSE
	ICALL1	DPRINT-PRSO
	PRINTI	" looks very "
	CALL2	QUEUED?,I-MADNESS
	ZERO?	STACK /?CCL29
	PRINTR	"scared."
?CCL29:	PRINTR	"worried."
?CCL21:	EQUAL?	PRSA,V?HELP \?CCL31
	EQUAL?	PRSO,TORANAGA \?CCL31
	PRINTR	"Precisely what you need to do, but how?"
?CCL31:	EQUAL?	PRSA,V?WALK \?CCL35
	CALL2	QUEUED?,I-MARIKO-FOLLOW
	ZERO?	STACK /?CCL38
	SET	'ISHIDO-DISTRACTED?,PRSA
	RFALSE	
?CCL38:	EQUAL?	PRSO,P?SOUTH \?CCL40
	ZERO?	MAD? /FALSE
	ZERO?	SEEN-MAD-SCENE? /?CND44
	SET	'ISHIDO-DISTRACTED?,PRSA
	PRINTI	"You bow to Ishido like a spastic puppet and half walk, half dance for the gateway.""Follow me, follow me!"" you shout, like a demented Pied Piper."
	CRLF	
?CND44:	PRINTI	"The Grays bar the way."
	CRLF	
	ZERO?	SEEN-MAD-SCENE? /TRUE
	CRLF	
	PRINTR	"You roar with feigned rage and imperiously order them out of the way, then immediately switch to hysterical laughter."
?CCL40:	EQUAL?	PRSO,P?NORTH \FALSE
	ZERO?	MAD? /FALSE
	PRINTR	"The narrow street is blocked by the litters, kaga-men, and escorts."
?CCL35:	EQUAL?	PRSA,V?STOP \?PRD57
	EQUAL?	PRSO,FALSE-VALUE,CRAZY /?PRD55
?PRD57:	EQUAL?	PRSA,V?ACT \?CCL53
	EQUAL?	PRSO,SANE \?CCL53
?PRD55:	CALL2	QUEUED?,I-MARIKO-FOLLOW
	ZERO?	STACK /?CCL53
	FSET?	BLACKTHORNE,RMUNGBIT /?CCL64
	FSET	BLACKTHORNE,RMUNGBIT
	SET	'ISHIDO-DISTRACTED?,PRSA
	PRINTR	"You stop instantly, turn and walk quietly toward the bridge."
?CCL64:	PRINTR	"You've already stopped."
?CCL53:	EQUAL?	PRSA,V?TAKE,V?STOP \?CCL66
	EQUAL?	PRSO,ISHIDO \?CCL66
	ICALL	PERFORM,V?ATTACK,ISHIDO
	RTRUE	
?CCL66:	EQUAL?	PRSA,V?BOW \?CCL70
	EQUAL?	PRSO,ISHIDO \?CCL70
	PRINTR	"He looks at you contemptuously."
?CCL70:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL74
	EQUAL?	PRSO,ISHIDO \?CCL74
	EQUAL?	MADNESS-CNT,3 \?CCL79
	SET	'ISHIDO-DISTRACTED?,PRSA
	PRINTR	"You go berserk, bunching your fists and hurling yourself at Ishido.It takes four Browns to haul you off, then Buntaro smashes you hard on the back of your neck, stunning you."
?CCL79:	CALL	JIGS-UP?,J-ISHIDO,STR?541
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?542
	RSTACK	
?CCL74:	CALL1	ACT-CRAZY?
	ZERO?	STACK \?CCL83
	EQUAL?	PRSA,V?DISTRACT \FALSE
	EQUAL?	PRSO,ISHIDO \FALSE
?CCL83:	LESS?	ISHIDO-CNT,3 \?CCL90
	CALL2	QUEUED?,I-MADNESS
	ZERO?	STACK /FALSE
?CCL90:	LESS?	JERK-CNT,2 \?CND93
	SET	'ISHIDO-DISTRACTED?,PRSA
?CND93:	ZERO?	SEEN-MAD-SCENE? \?CND95
	SET	'SEEN-MAD-SCENE?,TRUE-VALUE
	ICALL2	MARGINAL-PIC,P-MAD-SCENE
?CND95:	EQUAL?	ISHIDO-CNT,3,4,5 \?CCL99
	LESS?	JERK-CNT,2 \?CCL102
	PRINTI	"Ishido and the others whirl on you dumbfounded."
	ICALL1	TORANAGA-CLOSES-CURTAIN
	CRLF	
	CALL2	SCORE-OBJECT,CRAZY
	RSTACK	
?CCL102:	PRINTR	"Ishido starts briefly, but is more interested in Kiri's litter."
?CCL99:	PRINTR	"Everyone continues to stare at you.The tension is incredible, and your exhaustion is beginning to take its toll."


	.FUNCT	TORANAGA-CLOSES-CURTAIN:ANY:0:0
	SET	'ISHIDO-DISTRACTED?,PRSA
	ICALL2	DEQUEUE,I-ISHIDO-2
	SET	'ISHIDO-CNT,0
	ICALL	QUEUE,I-MADNESS,-1
	FSET?	CURTAINS,OPENBIT \FALSE
	FCLEAR	CURTAINS,OPENBIT
	PRINTI	"For an instant Toranaga is in full view behind Ishido.In the never-ending second before Toranaga tugs the curtains closed again, you know that Yabu has recognized him, and Mariko, and probably Buntaro and some of the Brown samurai."
	RTRUE	


	.FUNCT	I-ISHIDO-2:ANY:0:0
	INC	'DELAY-CNT
	ZERO?	ISHIDO-CNT \?CCL5
	CALL2	QUEUED?,I-KIRI
	ZERO?	STACK \FALSE
	EQUAL?	HERE,GATEWAY \FALSE
	IN?	KIRIS-LITTER,HERE /?CND3
	RFALSE	
?CCL5:	EQUAL?	ISHIDO-CNT,6 \?CND3
	ZERO?	ISHIDO-DISTRACTED? \?CND3
	IN?	KIRIS-LITTER,AT-PORTCULLIS /?CCL13
	IN?	KIRIS-LITTER,ON-BRIDGE \?CND3
?CCL13:	GRTR?	DELAY-CNT,2 \?CCL20
	CRLF	
	PRINTI	"Ishido seems to come to a decision.It appears to involve arrows."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL20:	CRLF	
	PRINTR	"Ishido watches the cortege, a strange expression on his face."
?CND3:	SET	'DELAY-CNT,0
	INC	'ISHIDO-CNT
	EQUAL?	ISHIDO-CNT,1 \?CCL23
	MOVE	ISHIDO,GATEWAY
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTR	"Ishido steps from the shadows.The Browns see him almost in the same instant.Hostility whips though them.Buntaro almost leaps past you to get nearer the head of the column."
?CCL23:	EQUAL?	ISHIDO-CNT,2 \?CCL25
	MOVE	PARCHMENT,ISHIDO
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTI	"Ishido takes a roll of parchment out of his sleeve.""I wanted to ask Lady Kiritsubo if she'd take this with her to Yedo.For my niece.It's unlikely I'll go to Yedo for some time.""

""Certainly.""Yabu puts out his hand to take the parchment.

""Don't trouble yourself, Yabu-san.I'll ask her.""Ishido walks toward the litter."
	CRLF	
	CRLF	
	PRINTR	"The maids obsequiously intercept Ishido.""May I take the message, Lord.My Mis--""

""No.""To Ishido's surprise the maids do not move out of the way."
?CCL25:	EQUAL?	ISHIDO-CNT,3 \?CCL27
	CRLF	
	PRINTR	"""Move!"" Buntaro snarls.Both maids back off, frightened.

Ishido bows to the curtain.""Kiritsubo-san, I wonder if you'd be kind enough to take this message for me to Yedo?To my niece?""

There is a slight hesitation between the sobs and the figure bows an assent.

""Thank you.""Ishido offers up the slim roll of parchment an inch from the curtains."
?CCL27:	EQUAL?	ISHIDO-CNT,4 \?CCL29
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTI	"Everyone is waiting for the hand to appear."
	ZERO?	SEEN-TORANAGA? /?CND30
	PRINTI	"You realize Toranaga is trapped.Politeness demands that he take the scroll and his hand will give him away!"
?CND30:	CRLF	
	CRLF	
	PRINTR	"Ishido is getting impatient.""Kiritsubo-san?"" he calls."
?CCL29:	EQUAL?	ISHIDO-CNT,5 \?CCL33
	ZERO?	ISHIDO-DISTRACTED? \FALSE
	ICALL2	THIS-IS-IT,ISHIDO
	LOC	KIRIS-LITTER
	IN?	ISHIDO,STACK \?CCL39
	FSET	CURTAINS,OPENBIT
	INC	'JERK-CNT
	CRLF	
	PRINTR	"Ishido takes a quick pace forward and jerks the curtains of the litter apart."
?CCL39:	CRLF	
	PRINT	STR?543
	CRLF	
	RTRUE	
?CCL33:	EQUAL?	ISHIDO-CNT,6 \?CCL41
	ZERO?	ISHIDO-DISTRACTED? \FALSE
	LOC	KIRIS-LITTER
	IN?	ISHIDO,STACK \?CCL47
	ICALL2	DEQUEUE,I-ISHIDO-2
	CRLF	
	PRINTI	"In shock, Ishido stares into the litter, recognizing Toranaga in spite of his disguise.""Guards!"" he yells, as Yabu, Mariko, and Buntaro all realize what is happening.Buntaro begins to draw his sword, but before he can strike at Ishido a hail of arrows stitches him.Within moments the column is a shambles as the Browns and Grays try to defend their masters."
	CRLF	
	CRLF	
	ICALL2	JIGS-UP,STR?544
	RETURN	M-FATAL
?CCL47:	CRLF	
	PRINT	STR?545
	CRLF	
	RTRUE	
?CCL41:	EQUAL?	ISHIDO-CNT,7 \FALSE
	ICALL2	DEQUEUE,I-ISHIDO-2
	RFALSE	


	.FUNCT	ON-BRIDGE-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?LEAP,V?DIVE \?CCL6
	EQUAL?	PRSO,ON-BRIDGE,GLOBAL-HERE \?CCL6
	CALL2	JIGS-UP?,J-MOAT
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?547
	RSTACK	
?CCL6:	EQUAL?	SCENE,S-SEPPUKU /FALSE
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?SOUTH \FALSE
	CALL2	QUEUED?,I-MARIKO-FOLLOW
	ZERO?	STACK /FALSE
	SET	'ISHIDO-DISTRACTED?,PRSA
	RFALSE	


	.FUNCT	AT-PORTCULLIS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	SCENE,S-SEPPUKU /FALSE
	EQUAL?	PRSA,V?WALK \?CCL8
	EQUAL?	P-WALK-DIR,P?SOUTH \?CCL8
	CALL2	QUEUED?,I-MADNESS
	ZERO?	STACK /FALSE
	ICALL2	DEQUEUE,I-MADNESS
	PRINTI	"It requires all of your remaining will to stay erect.You"
	IN?	SANDALS,BLACKTHORNE \?CND14
	MOVE	SANDALS,HERE
	FCLEAR	SANDALS,WEARBIT
	PRINTI	" have lost your sandals, you"
?CND14:	PRINTI	"r face burns from Ishido's blow, and your head pounds with pain.The last guards let you through the portcullis and beyond.They also let Mariko past without stopping, and then the litters.

You lead the way down a slight hill, past some open ground and into a wooded area."
	CRLF	
	CRLF	
	CALL2	GOTO,WOODS
	RSTACK	
?CCL8:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?NORTH \FALSE
	PRINTR	"You are stopped and refused entry at the checkpoint."


	.FUNCT	WOODS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?WALK \FALSE
	IN?	PLAYER,MARIKOS-LITTER /FALSE
	FSET?	MAZE,TOUCHBIT /FALSE
	PRINTR	"You haven't the strength to walk: your performance has totally exhausted you.You try to stand, but your body doesn't obey."
?CCL3:	EQUAL?	RARG,M-END \?CCL11
	EQUAL?	SCENE,S-ESCAPE \FALSE
	FSET?	WOODS,SCOREBIT \FALSE
	ICALL2	MOVE-CORTEGE,WOODS
	MOVE	MARIKO,WOODS
	ICALL	QUEUE,I-ESCAPE-CONTINUES,2
	ICALL1	B-SIT
	CRLF	
	PRINTI	"As you enter the wooded area and assure yourself that you are out of sight of the castle, you gratefully collapse."
	CRLF	
	CALL2	SCORE-OBJECT,WOODS
	RSTACK	
?CCL11:	EQUAL?	RARG,M-ENTER \FALSE
	ICALL2	DEQUEUE,I-ISHIDO-2
	ICALL2	DEQUEUE,I-MARIKO-FOLLOW
	RTRUE	


	.FUNCT	I-ESCAPE-CONTINUES:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	LITTER-CNT,1 \?CND3
	EQUAL?	HERE,WOODS \?CND3
	IN?	PLAYER,MARIKOS-LITTER /?CND3
	GRTR?	DELAY-CNT,2 \?CCL11
	ICALL2	GET-IN-LITTER,TRUE-VALUE
?CND3:	SET	'DELAY-CNT,0
	INC	'LITTER-CNT
	EQUAL?	LITTER-CNT,1 \?CCL14
	ICALL	QUEUE,I-ESCAPE-CONTINUES,-1
	EQUAL?	HERE,WOODS \FALSE
	ICALL2	THIS-IS-IT,MARIKO
	ICALL2	THIS-IS-IT,MARIKOS-LITTER
	CRLF	
	PRINTR	"""Anjin-san!"" Mariko calls to you, jarring you out of your stupor.""It's time to move on.""She glances significantly at the Gray captain, and adds, ""Kiritsubo feels we must hurry for the tide.All the trouble you have caused has made her even more upset.Please use my litter, I'm really very strong and you needn't worry."""
?CCL11:	CRLF	
	PRINTR	"Mariko says, ""Please hurry, Anjin-san!"""
?CCL14:	EQUAL?	LITTER-CNT,2 \FALSE
	ICALL2	DEQUEUE,I-ESCAPE-CONTINUES
	RFALSE	


	.FUNCT	I-MADNESS:ANY:0:0
	ZERO?	ISHIDO-DISTRACTED? /?CCL3
	SET	'ISHIDO-DISTRACTED?,FALSE-VALUE
	INC	'DELAY-CNT
	EQUAL?	MADNESS-CNT,6 \?CND6
	EQUAL?	PRSA,V?STOP \?PRD11
	EQUAL?	PRSO,FALSE-VALUE,CRAZY /?CCL9
?PRD11:	EQUAL?	PRSA,V?ACT \?CND6
	EQUAL?	PRSO,SANE \?CND6
?CCL9:	CRLF	
	PRINTR	"Ishido stares at you, enraged but perplexed."
?CND6:	SET	'DELAY-CNT,0
	INC	'MADNESS-CNT
	EQUAL?	MADNESS-CNT,1 \?CCL18
	MOVE	MARIKO,HERE
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTR	"Ishido draws his sword."
?CCL18:	EQUAL?	MADNESS-CNT,2 \?CCL20
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTR	"Ishido watches you, his sword raised high, ready to strike, but your actions have momentarily stunned him."
?CCL20:	EQUAL?	MADNESS-CNT,3 \?CCL22
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTI	"Ishido's reflexes take over and he sends his sword slashing for your throat.Mariko cries out.The blade stops a hair's breadth from your neck.She tries to "
	IN?	PARCHMENT,TORANAGA \?CCL25
	PRINTI	"explain what you said, and Ishido"
	JUMP	?CND23
?CCL25:	PRINTI	"soothe Ishido, and he"
?CND23:	SET	'OPPONENT,ISHIDO
	PRINTR	" lowers his sword, listens for a moment, then shouts with increasing vehemence and hits you in the face with the back of his hand."
?CCL22:	EQUAL?	MADNESS-CNT,4 \?CCL27
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTI	"Yabu begins placating Ishido, Mariko tearfully repeating over and over in forced semihysteria that the mad barbarian believed he was only trying to save Ishido from a bad "
	ICALL2	PRINTUNDER,STR?502
	PRINTC	46
	EQUAL?	ISHIDO-DISTRACTED?,V?ATTACK,V?HIT \?CND28
	PRINTR	"""It's the worst insult to touch their faces, just like with us!"""
?CND28:	CRLF	
	RTRUE	
?CCL27:	EQUAL?	MADNESS-CNT,5 \?CCL31
	SET	'OPPONENT,FALSE-VALUE
	ICALL2	THIS-IS-IT,ISHIDO
	CRLF	
	PRINTR	"Ishido grabs a bow and arrow.""He's a mad dog!Mad dogs have to be dealt with!"""
?CCL31:	EQUAL?	MADNESS-CNT,6 \?CCL33
	ICALL	QUEUE,I-MARIKO-FOLLOW,-1
	CRLF	
	PRINTR	"Mariko leaps forward from her position near Toranaga's litter.""Don't worry, Lord Ishido.It's a momentary madness.""She approaches you.""I can help now, Anjin-san.We have to try to walk out.I will follow you.Please stop now."""
?CCL33:	EQUAL?	MADNESS-CNT,7 \?CCL35
	EQUAL?	HERE,ON-BRIDGE \?CCL38
	CRLF	
	PRINTR	"Yabu comes to life and says to Ishido, ""If you want him killed, let me do it.""Then he comes very close and drops his voice.""Leave him alive.He's more valuable alive.Trust me.We need him alive.""Ishido puts the bow down."
?CCL38:	ICALL2	DEQUEUE,I-MADNESS
	CRLF	
	ICALL2	JIGS-UP,STR?550
	RETURN	M-FATAL
?CCL35:	EQUAL?	MADNESS-CNT,8 \?CCL40
	EQUAL?	HERE,ON-BRIDGE,AT-PORTCULLIS \FALSE
	IN?	CORTEGE,GATEWAY \FALSE
	ICALL2	MOVE-CORTEGE,ON-BRIDGE
	CRLF	
	PRINTR	"Mariko looks back for an instant.""They're following, Anjin-san, both litters are through the gate and they're on the bridge now!"""
?CCL40:	EQUAL?	MADNESS-CNT,9 \?CCL47
	EQUAL?	HERE,AT-PORTCULLIS,WOODS \FALSE
	IN?	CORTEGE,ON-BRIDGE \FALSE
	ICALL2	MOVE-CORTEGE,AT-PORTCULLIS
	CRLF	
	PRINTR	"Quickly, the cortege follows to the portcullis.Mariko urges you on."
?CCL47:	EQUAL?	MADNESS-CNT,10 \FALSE
	EQUAL?	HERE,WOODS \FALSE
	IN?	CORTEGE,PORTCULLIS \FALSE
	ICALL2	MOVE-CORTEGE,WOODS
	CRLF	
	PRINTI	"Quickly, the cortege goes through the portcullis and towards the woods.Mariko urges you on."
	CRLF	
	CALL2	DEQUEUE,I-MADNESS
	RSTACK	
?CCL3:	EQUAL?	HERE,GATEWAY,ON-BRIDGE,AT-PORTCULLIS \FALSE
	ICALL	QUEUE,I-ISHIDO-2,-1
	EQUAL?	ISHIDO-CNT,5,6 /?CND62
	SET	'ISHIDO-CNT,4
?CND62:	IN?	MARIKO,HERE \?CND64
	EQUAL?	HERE,ON-BRIDGE \?CND64
	CRLF	
	PRINTI	"Mariko looks back for an instant.""He's not letting them go!"""
	CRLF	
?CND64:	CALL1	I-ISHIDO-2
	RSTACK	


	.FUNCT	MOVE-CORTEGE:ANY:1:1,L
	MOVE	CORTEGE,L
	MOVE	KIRIS-LITTER,L
	MOVE	YABU,L
	MOVE	BUNTARO,L
	MOVE	MARIKOS-LITTER,L
	RTRUE	


	.FUNCT	PARCHMENT-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	IN?	PARCHMENT,ISHIDO \?CCL6
	LESS?	ISHIDO-CNT,5 \?CTR8
	CALL2	QUEUED?,I-MADNESS
	ZERO?	STACK /?CCL9
?CTR8:	SET	'ISHIDO-DISTRACTED?,PRSA
	MOVE	PRSO,WINNER
	PRINTI	"You grab the parchment out of Ishido's fingers.He stares at you, shocked."
	ICALL1	TORANAGA-CLOSES-CURTAIN
	CRLF	
	CALL2	SCORE-OBJECT,PARCHMENT
	RSTACK	
?CCL9:	CALL	JIGS-UP?,J-PARCHMENT,STR?551
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?552
	RSTACK	
?CCL6:	IN?	PARCHMENT,KIRIS-LITTER \FALSE
	PRINTR	"You can't reach the parchment any longer."
?CCL3:	EQUAL?	PRSA,V?GIVE \?PRD19
	EQUAL?	PRSO,PARCHMENT \?PRD19
	EQUAL?	PRSI,TORANAGA-IN-DRAG /?CTR16
?PRD19:	EQUAL?	PRSA,V?PUT \?PRD23
	EQUAL?	PRSO,PARCHMENT \?PRD23
	EQUAL?	PRSI,KIRIS-LITTER /?CTR16
?PRD23:	EQUAL?	PRSA,V?THROW \?PRD27
	EQUAL?	PRSO,PARCHMENT \?PRD27
	EQUAL?	PRSI,KIRIS-LITTER /?CTR16
?PRD27:	EQUAL?	PRSA,V?PUT-ON \?CCL17
	EQUAL?	PRSO,PARCHMENT \?CCL17
	EQUAL?	PRSI,CURTAINS \?CCL17
?CTR16:	CALL2	QUEUED?,I-MADNESS
	ZERO?	STACK \?CCL36
	SET	'ISHIDO-DISTRACTED?,PRSA
	PRINTR	"You shove the parchment into the closed curtains, looking for a crack or gap, but all you succeed into doing is getting the parchment entangled."
?CCL36:	MOVE	PARCHMENT,KIRIS-LITTER
	ICALL2	SCORE-OBJECT,CURTAINS
	ICALL	QUEUE,I-ISHIDO-2,-1
	SET	'ISHIDO-CNT,4
	SET	'ISHIDO-DISTRACTED?,PRSA
	PRINTR	"You thrust the parchment through the curtains, babbling the first foolish thing that comes into your head.""It's bad luck in my country for a prince to give a message himself like a common bastard ... bad luck ..."" Everyone watches as you do this."
?CCL17:	EQUAL?	PRSA,V?TEAR,V?MUNG \?CCL38
	EQUAL?	PRSO,PARCHMENT \?CCL38
	SET	'ISHIDO-DISTRACTED?,PRSA
	REMOVE	PARCHMENT
	PRINTR	"You tear the parchment into pieces, scattering them on the ground.Ishido stares at you in mingled surprise and hatred."
?CCL38:	EQUAL?	PRSA,V?READ \FALSE
	EQUAL?	PRSO,PARCHMENT \FALSE
	PRINTR	"You can't read Japanese."


	.FUNCT	CITY-F:ANY:0:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	EQUAL?	OHERE,WOODS \TRUE
	ICALL	MOVE-ALL,WOODS,CITY
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?FIND \FALSE
	LESS?	SCENE,S-VOYAGE /?CCL13
	PRINTR	"Osaka is the greatest and proudest city of Japan.It is on the sea several days sail west of Anjiro."
?CCL13:	PRINTR	"You have no idea where Osaka is."


	.FUNCT	WAREHOUSE-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?EAST \FALSE
	IN?	MARIKO,WHARF \?CCL11
	PRINTI	"You and the six samurai race after her.Mariko is very fleet and you don't catch up with her as you round the corner and head across the open space.You have never felt so naked.The moment you appear, the Grays spot you and surge forward."
	CRLF	
	CRLF	
	ICALL2	GOTO,WHARF
	MOVE	BROWNS,WHARF
	MOVE	GRAYS,WHARF
	MOVE	GRAY-LEADER,MAIN-DECK-2
	FSET	GRAY-LEADER,NDESCBIT
	RTRUE	
?CCL11:	IN?	MARIKO,WAREHOUSE \FALSE
	EQUAL?	QCONTEXT,MARIKO \?CCL16
	PRINTI	"""You must agree first, Anjin-san."
	JUMP	?CND14
?CCL16:	PRINTI	"""Not yet, not yet!The timing must be perfect!"
?CND14:	PRINTR	""" Mariko chides."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	EQUAL?	OHERE,MAZE \TRUE
	ICALL	MOVE-ALL,MAZE,WAREHOUSE
	ICALL	QUEUE,I-RUSE,-1
	RTRUE	


	.FUNCT	LARGE-KNIFE-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE,V?UNTIE,V?TAKE-OFF /?CTR2
	EQUAL?	PRSA,V?USE,V?DRAW,V?PICK \?CCL3
?CTR2:	FSET?	PRSO,WEARBIT \?CCL8
	FCLEAR	PRSO,WEARBIT
	PRINTR	"You take the knife out from the sash and heft it.It feels good."
?CCL8:	CALL2	HELD?,PRSO
	ZERO?	STACK /FALSE
	PRINT	STR?557
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?TIE,V?WEAR,V?PUT-AWAY \FALSE
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL15
	PRINTR	"You don't have it."
?CCL15:	FSET?	PRSO,WEARBIT /?CCL17
	FSET	PRSO,WEARBIT
	PRINTR	"You thrust the knife back into your sash."
?CCL17:	PRINT	STR?131
	CRLF	
	RTRUE	


	.FUNCT	GENERIC-KNIFE-F:ANY:2:2,R,F
	FSET?	LARGE-KNIFE,WEARBIT \?CCL3
	FSET?	SMALL-KNIFE,WEARBIT /?CCL3
	RETURN	SMALL-KNIFE
?CCL3:	FSET?	LARGE-KNIFE,WEARBIT /FALSE
	FSET?	SMALL-KNIFE,WEARBIT \FALSE
	RETURN	LARGE-KNIFE


	.FUNCT	SMALL-KNIFE-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE,V?UNTIE,V?TAKE-OFF /?CTR2
	EQUAL?	PRSA,V?USE,V?DRAW,V?PICK \?CCL3
?CTR2:	FSET?	PRSO,WEARBIT \?CCL8
	FCLEAR	PRSO,WEARBIT
	PRINTR	"You untie the silk ribbon and take the knife into your hand."
?CCL8:	CALL2	HELD?,PRSO
	ZERO?	STACK /FALSE
	PRINT	STR?557
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?TIE,V?WEAR,V?PUT-AWAY \FALSE
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL15
	PRINTR	"You don't have it."
?CCL15:	FSET?	PRSO,WEARBIT /?CCL17
	FSET	PRSO,WEARBIT
	PRINTR	"You tie the knife to your arm again."
?CCL17:	PRINT	STR?131
	CRLF	
	RTRUE	


	.FUNCT	I-RUSE:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	RUSE-CNT,1 \?CCL5
	EQUAL?	QCONTEXT,MARIKO \?CND3
	CRLF	
	PRINTR	"""Please, Anjin-san, this is a good plan, it is my Master's plan.Do you agree?"""
?CCL5:	EQUAL?	RUSE-CNT,2 \?CCL9
	IN?	BLACKTHORNE,WHARF /?CND3
	GRTR?	DELAY-CNT,2 \?CCL14
	PRINTI	"Toranaga is disgusted by your cowardice.He personally dispatches you.As you die, you remember something about not keeping agreements."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL14:	EQUAL?	DELAY-CNT,1 \?CCL16
	CRLF	
	PRINTR	"The Grays have spotted Mariko.They surge forward."
?CCL16:	EQUAL?	DELAY-CNT,2 \TRUE
	CRLF	
	PRINTR	"Toranaga urges you forward."
?CCL9:	EQUAL?	RUSE-CNT,4 \?CCL19
	IN?	BLACKTHORNE,MAIN-DECK-2 /?CCL22
	CRLF	
	PRINTR	"Mariko commands you urgently in Latin, ""Get aboard the galley, Anjin-san!We must see if it is safe!"""
?CCL22:	EQUAL?	QCONTEXT,MARIKO \?CND3
	CRLF	
	PRINTR	"""Please, Anjin-san, is the ship all right?"""
?CCL19:	EQUAL?	RUSE-CNT,5 \?CND3
	FSET?	WHARF,SCOREBIT /?CCL26
	FSET?	GLOBAL-WATER,SCOREBIT \?CND3
?CCL26:	LESS?	DELAY-CNT,2 /FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'RUSE-CNT
	EQUAL?	RUSE-CNT,1 \?CCL33
	SET	'QCONTEXT,MARIKO
	CRLF	
	PRINTR	"Toranaga beckons to Mariko, and they converse.Mariko nods.""Anjin-san, my Master orders that we, with six samurai, go to the galley.We are to tell the Grays on board that we were ambushed, and that our Gray escort sent us ahead to get help, that the battle is still raging.We will draw them away from the galley, and our Browns can recover it and we will be free.Do you understand?"""
?CCL33:	EQUAL?	RUSE-CNT,2 \?CCL35
	MOVE	MARIKO,WHARF
	CRLF	
	PRINTR	"Mariko laughs, bows once to Toranaga, and runs off."
?CCL35:	EQUAL?	RUSE-CNT,3 \?CCL37
	CRLF	
	PRINTR	"The Grays surround you, Mariko jabbering feverishly with the samurai and the Grays.You add to the babel in a panting mixture of Portuguese, English, and Dutch, motioning for them to hurry.You lean against the gangway, unable to see anything on the galley distinctly.You can't tell if the samurai on deck are Grays or Browns or both."
?CCL37:	EQUAL?	RUSE-CNT,4 \?CCL39
	EQUAL?	HERE,WHARF,MAIN-DECK-2 \?CCL42
	CRLF	
	PRINTI	"Mariko is frantically haranguing the senior officer of the Grays.He shouts orders, and suddenly a hundred samurai, all Grays, pour off the ship.

Quickly, Mariko turns to you and asks, ""Does the ship seem all right to you?"""
	SET	'QCONTEXT,MARIKO
	EQUAL?	HERE,WHARF \?CND43
	PRINTR	"She motions you onto the galley."
?CND43:	CRLF	
	RTRUE	
?CCL42:	CRLF	
	PRINTR	"Mariko is desperately calling you back to the wharf."
?CCL39:	EQUAL?	RUSE-CNT,5 \?CCL46
	FSET	WHARF,SCOREBIT
	CRLF	
	PRINTR	"Mariko looks around, as if assessing the situation.You can see that there are still sixteen Grays on the wharf and the galley.Suddenly, Mariko walks weakly to the head of the gangway and appears to faint!"
?CCL46:	EQUAL?	RUSE-CNT,6 \?CCL48
	MOVE	RONIN,WHARF
	CRLF	
	PRINTR	"Ashore, thirty of Toranaga's ronin-disguised samurai lope out of an alleyway.The Grays that had begun to leave the dock spin around on the gangway.Abruptly one shouts orders.""Bandits!"" one of the Browns screams on cue.The six Browns split up, intermingling with the Grays."
?CCL48:	EQUAL?	RUSE-CNT,7 \?CCL50
	CRLF	
	PRINTI	"Toranaga's ronin-samurai charge.At the same time the Browns on board attack the remaining Grays on board.The leader of the Grays on deck, a large tough grizzle-bearded man, confronts "
	FCLEAR	GRAY-LEADER,NDESCBIT
	ICALL2	THIS-IS-IT,GRAY-LEADER
	SET	'OPPONENT,GRAY-LEADER
	SET	'DODGED?,FALSE-VALUE
	FSET?	WHARF,SCOREBIT /?CND51
	PRINTI	"you and "
?CND51:	PRINTR	"Mariko.""Kill the traitors!"" he bellows, and charges."
?CCL50:	EQUAL?	RUSE-CNT,8 \?CCL54
	FSET?	GRAY-LEADER,DEAD /?CCL57
	CRLF	
	ICALL2	CTHE-PRINT,GRAY-LEADER
	PRINTC	32
	ZERO?	DODGED? /?CND58
	PRINTI	"manages to match your maneuver, and "
?CND58:	PRINTI	"swings his sword in a vicious arc that cuts deeply into your side.You fall, and the second blow is fatal."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL57:	SET	'DODGED?,FALSE-VALUE
	SET	'OPPONENT,RANDOM-GRAYS
	CRLF	
	PRINTR	"The other two Grays lunge for you, killing swords high.You feel, more than see, the sword slashing for your throat!"
?CCL54:	EQUAL?	RUSE-CNT,9 \?CCL61
	ZERO?	DODGED? \?CCL64
	CRLF	
	PRINTI	"The killing blow takes you, nearly severing your head."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL64:	FCLEAR	WHARF,SCOREBIT
	MOVE	SECOND-GRAY,HERE
	SET	'OPPONENT,SECOND-GRAY
	ICALL2	THIS-IS-IT,SECOND-GRAY
	CRLF	
	PRINTR	"A younger Gray halts over Mariko, sword raised.Suddenly, Mariko comes alive.She throws herself against the inexperienced young samurai's legs, crashing him to the deck.Then, she scrambles across the dead Gray, grabs his sword out of his still-twitching hands, and prepares to defend herself as best she can."
?CCL61:	EQUAL?	RUSE-CNT,10 \?CCL66
	CRLF	
	PRINTR	"The young Gray that Mariko tripped regains his feet, and howling with rage, comes at her.She backs and slashes bravely but you know she's lost, the man too strong."
?CCL66:	EQUAL?	RUSE-CNT,11 \?CCL68
	FSET?	SECOND-GRAY,DEAD /?CCL71
	CRLF	
	PRINTI	"The young Gray's blow catches Mariko in the neck, and she drops to the deck, her wound bubbling.You rush to her aid, but he cuts you down as well."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL71:	MOVE	RONIN,HERE
	REMOVE	GRAYS
	ICALL1	B-SIT
	CRLF	
	PRINTR	"Toranaga's ronin-samurai burst up the gangway, over the dead Grays.They quickly dispose of the remaining Grays and dump their bodies into the sea.

Wiping the blood off your face, you dimly see Mariko stretched out on the deck, ronin-samurai milling around her.You shake off your helpers and stumble toward her, but your knees give out and you collapse."
?CCL68:	EQUAL?	RUSE-CNT,12 \FALSE
	CRLF	
	PRINTI	"When all aboard has been checked and double-checked, the leader of the ronin-samurai cups his hands around his lips and halloos shoreward.At once more ronin-disguised samurai under Yabu come out of the night, and fan into protective shields.Then Toranaga appears and walks slowly toward the gangway alone.He has discarded the woman's kimono and the dark travelling cloak.Now he wears his armor, and over it a simple brown kimono, swords in his sash.The phalanx moves with measured tread toward the galley.

Bastard, you think.You're a cruel, cold-gutted, heartless bastard but you've got majesty, no doubt about that."
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	WHARF-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"You are near a gangway leading up to the galley.The galley is to the east, moored to stanchions fixed into the stone wharf that extends a hundred yards out into the sea."
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL5
	REMOVE	ANCHOR
	REMOVE	SKIFF
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL10
	EQUAL?	PRSO,GRAYS \?CCL10
	PRINTR	"You can only tell that they are dressed like samurai. You can't tell the color of their uniforms."
?CCL10:	EQUAL?	QCONTEXT,MARIKO \?CCL14
	EQUAL?	PRSA,V?YES,V?NO,V?IYE /?CTR13
	EQUAL?	PRSA,V?HAI \?CCL14
?CTR13:	PRINTR	"""Anjin-san, we must be sure.We must look aboard for Grays."""
?CCL14:	EQUAL?	PRSA,V?BOARD,V?CLIMB-ON \FALSE
	EQUAL?	PRSO,GALLEY,LG-GALLEY,ROOMS \FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	


	.FUNCT	MAIN-DECK-2-F:ANY:1:1,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINT	STR?462
	PRINTR	"Gray guardsmen crowd the deck."
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL5
	MOVE	MARIKO,MAIN-DECK-2
	MOVE	BROWNS,MAIN-DECK-2
	PRINTI	"You pull yourself up the gangway using the ropes for support.Your dash across the wharf has tired you more than you realized at first.Mariko and two Browns follow after."
	CRLF	
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL10
	EQUAL?	P-WALK-DIR,P?AFT,P?UP \?CCL10
	PRINTR	"The gangway aft is blocked by Grays and crewmen."
?CCL10:	EQUAL?	PRSA,V?TAKE-OFF \?CCL14
	EQUAL?	PRSO,LG-GALLEY \?CCL14
	CALL2	DO-WALK,P?WEST
	RSTACK	
?CCL14:	EQUAL?	QCONTEXT,MARIKO \?CCL18
	EQUAL?	PRSA,V?YES,V?HAI \?CCL18
	SET	'QCONTEXT,FALSE-VALUE
	PRINTR	"""Well, she's floating, at least,"" you reply, and then notice one of the crewmen from the voyage to Osaka.With Mariko's help, you ask him if the galley is ready, and if there are still Grays aboard.""Anjin-san, he thanks you for the life of his ship, and says they are ready.As for the other, he doesn't know.""Mariko seems very worried as she says this."
?CCL18:	EQUAL?	PRSA,V?HELP,V?WAKE,V?TAKE \?CCL22
	EQUAL?	PRSO,MARIKO \?CCL22
	FSET?	WHARF,SCOREBIT \?CCL27
	FSET?	GLOBAL-WATER,SCOREBIT /?CCL27
	FSET	GLOBAL-WATER,SCOREBIT
	PRINTI	"You make your way over to Mariko.""Get some water -- water, by God!""What's the word for water?Desperately you search your mind for the Japanese word.The old monk had told it to you a thousand times."
	CRLF	
	CALL2	SCORE-OBJECT,WHARF
	RSTACK	
?CCL27:	ZERO?	OPPONENT /?CCL31
	PRINTR	"You'll have to try something more specific."
?CCL31:	FSET?	BLACKTHORNE,SITTING \FALSE
	PRINTR	"You try to crawl to her, but you are too fatigued."
?CCL22:	EQUAL?	PRSA,V?MIZU /?CTR34
	EQUAL?	PRSA,V?SAY \?PRD38
	EQUAL?	PRSO,INTQUOTE \?PRD38
	CALL2	GET-INTQUOTE,0 >?TMP1
	CALL2	GET-INTQUOTE,1
	EQUAL?	W?MIZU,?TMP1,STACK /?CTR34
?PRD38:	EQUAL?	PRSA,V?SAY \?CCL35
	EQUAL?	PRSO,GLOBAL-WATER \?CCL35
	CALL	NOUN-USED?,PRSO,W?MIZU
	ZERO?	STACK /?CCL35
?CTR34:	FSET?	GLOBAL-WATER,SCOREBIT \?CCL47
	PRINTC	34
	ICALL2	PRINTUNDER,STR?558
	PRINTI	""" you yell.A man nods, and begins to hurry away.You stand protectively over Mariko."
	CRLF	
	CALL2	SCORE-OBJECT,GLOBAL-WATER
	RSTACK	
?CCL47:	PRINTR	"You continue yelling, for no apparent reason."
?CCL35:	EQUAL?	OPPONENT,GRAY-LEADER,RANDOM-GRAYS,SECOND-GRAY \FALSE
	CALL1	MOTION-VERB?
	ZERO?	STACK \?CCL49
	EQUAL?	PRSA,V?PARRY,V?STOP \FALSE
?CCL49:	SET	'DODGED?,TRUE-VALUE
	FSET?	GRAY-LEADER,DEAD \?CCL56
	PRINTR	"You leap out of the way, and the blow misses."
?CCL56:	PRINTR	"You try desperately to dodge out of the way, trying to avoid the leader's attack."


	.FUNCT	GRAY-LEADER-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \FALSE
	FSET?	GRAY-LEADER,DEAD \?CCL6
	PRINT	STR?559
	CRLF	
	RTRUE	
?CCL6:	EQUAL?	PRSA,V?KILL,V?ATTACK \?CCL8
	EQUAL?	PRSO,GRAY-LEADER \?CCL8
	EQUAL?	PRSI,LARGE-KNIFE,SMALL-KNIFE \?CCL8
	PRINT	STR?560
	CRLF	
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?THROW \FALSE
	EQUAL?	PRSO,LARGE-KNIFE,SMALL-KNIFE \FALSE
	EQUAL?	PRSI,GRAY-LEADER \FALSE
	MOVE	PRSO,HERE
	FSET?	PRSO,WEARBIT /?CCL19
	PRINTI	"You slide your "
	ICALL1	DPRINT-PRSO
	PRINTI	" into your hand and hurl it in an arc.It takes the samurai in the throat."
	CRLF	
	SET	'OPPONENT,FALSE-VALUE
	FSET	GRAY-LEADER,DEAD
	FSET?	GRAY-LEADER,NDESCBIT \?CCL22
	CRLF	
	PRINTI	"The remaining Grays scream ""Traitors!""They fall upon the Browns, and you are among the first to die."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL22:	CALL2	SCORE-OBJECT,GRAY-LEADER
	RSTACK	
?CCL19:	CALL1	HANGS-UP-ON-SLEEVE
	RSTACK	


	.FUNCT	RANDOM-GRAYS-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?KILL,V?ATTACK \?CCL6
	EQUAL?	PRSO,RANDOM-GRAYS \?CCL6
	EQUAL?	PRSI,LARGE-KNIFE,SMALL-KNIFE \?CCL6
	PRINT	STR?561
	CRLF	
	RTRUE	
?CCL6:	EQUAL?	PRSA,V?THROW \FALSE
	EQUAL?	PRSO,LARGE-KNIFE,SMALL-KNIFE \FALSE
	EQUAL?	PRSI,RANDOM-GRAYS \FALSE
	REMOVE	PRSO
	FSET?	PRSO,WEARBIT /?CCL17
	PRINTI	"You throw your "
	ICALL1	DPRINT-PRSO
	PRINTI	" at one of the Grays, and he spins away, but the other is still alive."
	CRLF	
	SET	'OPPONENT,FALSE-VALUE
	FSET	RANDOM-GRAYS,DEAD
	RTRUE	
?CCL17:	CALL1	HANGS-UP-ON-SLEEVE
	RSTACK	


	.FUNCT	GENERIC-GRAY-F:ANY:2:2,R,F
	FSET?	SECOND-GRAY,DEAD \?CCL3
	RETURN	RANDOM-GRAYS
?CCL3:	FSET?	GRAY-LEADER,DEAD \FALSE
	RETURN	SECOND-GRAY


	.FUNCT	SECOND-GRAY-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?KILL,V?ATTACK \?CCL6
	EQUAL?	PRSO,SECOND-GRAY \?CCL6
	EQUAL?	PRSI,LARGE-KNIFE,SMALL-KNIFE \?CCL6
	PRINT	STR?560
	CRLF	
	RTRUE	
?CCL6:	EQUAL?	PRSA,V?THROW \FALSE
	EQUAL?	PRSO,LARGE-KNIFE,SMALL-KNIFE \FALSE
	EQUAL?	PRSI,SECOND-GRAY \FALSE
	REMOVE	PRSO
	FSET?	PRSO,WEARBIT /?CCL17
	PRINTI	"You throw your "
	ICALL1	DPRINT-PRSO
	PRINTI	" at Mariko's assailant.It strikes him in the back, causing his blow to go wild.He slumps to the deck, his life ebbing fast."
	CRLF	
	SET	'OPPONENT,FALSE-VALUE
	FSET	SECOND-GRAY,DEAD
	CALL2	SCORE-OBJECT,SECOND-GRAY
	RSTACK	
?CCL17:	CALL1	HANGS-UP-ON-SLEEVE
	RSTACK	


	.FUNCT	HANGS-UP-ON-SLEEVE:ANY:0:0
	PRINTI	"You fumble in your sleeve for the "
	ICALL1	DPRINT-PRSO
	PRINTI	", but it hangs up on the strip of silk you tied it with."
	FSET?	PRSI,DEAD \?CCL3
	PRINTR	"Fortunately, he's already dead, so you are safe from a counterattack."
?CCL3:	PRINTI	"You toss it at "
	ICALL1	THE-PRINT-PRSI
	PRINTI	" but it misses, and he turns on you!"
	CRLF	
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	HATAMOTO-AFTER-F:ANY:0:0
	PRINTI	"The galley escapes from Osaka harbor, the rowers speeding it back towards Anjiro and Toranaga's capital, Yedo, beyond.

For your services to him, Lord Toranaga gives you a rare honor.He makes you a hatamoto, a high rank of samurai.This is a position of a special retainer to his personal staff.You have his absolute protection.In return, you are instructed to learn Japanese, and train a regiment of troops in European tactics and the use of muskets.

But best of all, he says he will return the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" to you, but he won't say when."

	.ENDSEG

	.ENDI
