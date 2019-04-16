
	.SEGMENT "VOYAGE"


	.FUNCT	HIRO-MATSU-REFUSES:ANY:0:0
	PRINTC	34
	ICALL2	PRINTUNDER,STR?455
	PRINTR	""" Hiro-matsu shakes his head, and speaks at length clearly refusing permission because of the danger."


	.FUNCT	YABU-BOARDS-SKIFF:ANY:0:0
	ICALL	QUEUE,I-SKIFF,-1
	MOVE	HIRO-MATSU,GENERIC-OBJECTS
	MOVE	YABU,SKIFF
	MOVE	SEARCH-PARTY,SKIFF
	MOVE	OARS,SKIFF
	FSET	OARS,TAKEBIT
	PRINTI	"This time the old man points his sword at the skiff and shakes his head.He and Yabu begin an animated discussion in Japanese, motioning the mate over to join them.Hiro-matsu studies the coast for a while.Finally, he beckons a samurai, points to you, and gives some apparent instructions.The samurai and six other warriors clamber nimbly into the skiff, and to your surprise, so does Yabu!

Hiro-matsu points to the skiff, bows politely to you, and then goes below."
	CRLF	
	CALL2	SCORE-OBJECT,SKIFF
	RSTACK	


	.FUNCT	I-SKIFF:ANY:0:0
	INC	'DELAY-CNT
	ZERO?	SKIFF-CNT \?CND3
	IN?	BLACKTHORNE,SKIFF /?CND3
	GRTR?	DELAY-CNT,2 \?CCL9
	MOVE	BLACKTHORNE,SKIFF
	CRLF	
	PRINTI	"Yabu barks orders, and you are pitched headlong into the skiff."
	CRLF	
	JUMP	?CND3
?CCL9:	CRLF	
	PRINTI	"Yabu motions for you to get in the skiff."
	CRLF	
?CND3:	SET	'DELAY-CNT,0
	INC	'SKIFF-CNT
	EQUAL?	SKIFF-CNT,1 \FALSE
	ICALL2	DEQUEUE,I-SKIFF
	RFALSE	


	.FUNCT	IN-THE-SEA-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	IN?	WINNER,SKIFF /?CCL6
	ICALL	QUEUE,I-DROWN,5
	PRINTI	"You execute a perfect dive into the sea."
	CRLF	
	CRLF	
	RTRUE	
?CCL6:	IN?	YABU,SKIFF \?CND7
	FSET	YABU,NDESCBIT
?CND7:	IN?	SEARCH-PARTY,SKIFF \FALSE
	FSET	SEARCH-PARTY,NDESCBIT
	RFALSE	
?CCL3:	EQUAL?	RARG,M-LEAVE \?CCL12
	IN?	YABU,SKIFF \?CND13
	FCLEAR	YABU,NDESCBIT
?CND13:	IN?	SEARCH-PARTY,SKIFF \FALSE
	FCLEAR	SEARCH-PARTY,NDESCBIT
	RFALSE	
?CCL12:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?HELLO,V?ASK-ABOUT,V?TELL \?CCL21
	EQUAL?	PRSO,RODRIGUES \?CCL21
	IN?	RODRIGUES,HERE \?CCL21
	IN?	OAR,RODRIGUES \?CCL27
	PRINTI	"""Are you crazy, Ingeles?"""
	CRLF	
	JUMP	?CND25
?CCL27:	PRINTI	"He's drowning!"
	CRLF	
?CND25:	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL21:	EQUAL?	PRSA,V?DIVE \?CCL32
	PRINTR	"You dive beneath the surface, but find nothing of interest."
?CCL32:	EQUAL?	PRSA,V?DROP \?CCL34
	CALL2	HELD?,PRSO
	ZERO?	STACK /?CCL34
	REMOVE	PRSO
	PRINTR	"Gone forever, beneath the waves."
?CCL34:	EQUAL?	PRSA,V?SWIM,V?DANCE,V?HIDE-BEHIND /?CTR37
	EQUAL?	PRSA,V?HIDE-UNDER \?CCL38
?CTR37:	PRINTR	"You try desperately to stay afloat."
?CCL38:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?CCL42
	EQUAL?	PRSO,LG-LAND \?CCL42
	PRINTR	"That would be suicide. You would be pulped on the rocks!"
?CCL42:	EQUAL?	PRSA,V?WALK-TO,V?BOARD,V?CLIMB-ON /?PRD52
	EQUAL?	PRSA,V?CLIMB-FOO \?PRD50
?PRD52:	EQUAL?	PRSO,LG-GALLEY,ROOMS /?PRD48
?PRD50:	EQUAL?	PRSA,V?DROP,V?EXIT \?CCL46
	EQUAL?	PRSO,LG-SEA \?CCL46
?PRD48:	IN?	WINNER,SKIFF /?CCL46
	PRINTR	"The storm has carried you further towards the rocks, and you fight the current, trying to get back, but it's hopeless.They'll have to fend for themselves."
?CCL46:	EQUAL?	PRSA,V?HELP,V?TAKE,V?WALK-TO \FALSE
	EQUAL?	PRSO,LG-RODRIGUES,RODRIGUES \FALSE
	IN?	RODRIGUES,HERE \FALSE
	PRINTI	"Here among the waves it's not as obvious where Rodrigues is, but you swim toward where you last saw him."
	FSET?	OAR,SCOREBIT /?CCL64
	FCLEAR	RODRIGUES,INVISIBLE
	PRINTR	"There he is!He's clinging to a broken oar!You stroke towards him and at last, fighting the sea, you reach him.He's wet but alive.""By the Virgin, Ingeles!"" he chokes.""Who's conning the galley!"""
?CCL64:	PRINTR	"You search for as long as your strength holds, but you find no sign of him."


	.FUNCT	I-DROWN:ANY:0:0
	CRLF	
	PRINTI	"At last, your strength gives out.You are still not fully recovered from the voyage to Japan.You can swim but not forever.You sink beneath the waves."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	LG-GALLEY-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	ZERO?	GALLEY-IN-BAY? /?CCL6
	PRINTI	"The galley rides heavily "
	FSET?	ANCHOR,SCOREBIT /?CND7
	PRINTI	"at anchor "
?CND7:	PRINTI	"on the relatively gentle swells of the bay."
	RTRUE	
?CCL6:	PRINTI	"Riding the waves like a fat-bellied pig, the overladen galley appears and disappears in the troughs of the waves."
	RTRUE	


	.FUNCT	LG-GALLEY-F:ANY:0:0
	EQUAL?	PRSA,V?ENTER,V?BOARD,V?CLIMB-FOO /?CTR2
	EQUAL?	PRSA,V?CLIMB-ON \?CCL3
?CTR2:	EQUAL?	HERE,WHARF \?CCL8
	CALL2	DO-WALK,P?EAST
	RSTACK	
?CCL8:	EQUAL?	HERE,GALLEY,MAIN-DECK,MAIN-DECK-2 \?CCL10
	PRINT	STR?181
	CRLF	
	RTRUE	
?CCL10:	PRINTR	"The galley isn't here."
?CCL3:	EQUAL?	PRSA,V?TURN \FALSE
	EQUAL?	HERE,GALLEY \?CCL15
	ICALL	PERFORM,V?TURN,WHEEL,PRSI
	RTRUE	
?CCL15:	EQUAL?	HERE,MAIN-DECK \?CCL17
	ICALL1	ARENT-WHERE-PRSO-IS
	IN?	RODRIGUES,GALLEY \?CND18
	ICALL2	FRUSTRATED,RODRIGUES
?CND18:	CRLF	
	RTRUE	
?CCL17:	PRINTR	"You aren't on the galley."


	.FUNCT	FRUSTRATED:ANY:1:1,WHO
	PRINTI	"Frustrated, you yell the command to "
	ICALL2	DPRINT,WHO
	PRINTR	", but realize that he can't hear you above the storm."


	.FUNCT	DRESS-BLACKTHORNE:ANY:0:1,EUROPEAN?
	ZERO?	EUROPEAN? /?CCL3
	MOVE	CLOTHES,BLACKTHORNE
	FSET	CLOTHES,WEARBIT
	MOVE	BOOTS,BLACKTHORNE
	FSET	BOOTS,WEARBIT
	RTRUE	
?CCL3:	GRTR?	SCENE,S-JOURNEY \?CND4
	LOC	DICTIONARY
	ZERO?	STACK /?CND4
	MOVE	DICTIONARY,BLACKTHORNE
?CND4:	MOVE	SOCKS,BLACKTHORNE
	FSET	SOCKS,WEARBIT
	MOVE	SANDALS,BLACKTHORNE
	FSET	SANDALS,WEARBIT
	MOVE	KIMONO,BLACKTHORNE
	FSET	KIMONO,WEARBIT
	RTRUE	


	.FUNCT	GALLEY-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL2	DRESS-BLACKTHORNE,TRUE-VALUE
	PUTP	BLACKTHORNE,P?HEALTH,4
	ICALL	PUT-ON,SLIPPERS,YABU
	ICALL	PUT-ON,YABU-KIMONO,YABU
	ICALL	PUT-ON,YABU-SWORDS,YABU
	MOVE	SAFETY-LINE,BLACKTHORNE
	FSET	SAFETY-LINE,WEARBIT
	MOVE	RODRIGUES,HERE
	ICALL	NEW-SDESC,RODRIGUES,STR?11
	CALL	QUEUE,I-RODRIGUES,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTR	"You are standing on the quarterdeck of Toranaga's galley, with a good view forward to the oar deck."
?CCL5:	EQUAL?	RARG,M-LEAVE \?CCL7
	FCLEAR	GALLEY-WHEEL,ONBIT
	RTRUE	
?CCL7:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL12
	FSET?	SAFETY-LINE,WEARBIT \FALSE
	PRINT	YOU-HAVE-TO
	PRINT	STR?458
	PRINTR	", even though you know that without it you could easily be carried overboard."
?CCL12:	EQUAL?	PRSA,V?UNTIE \?CCL17
	EQUAL?	PRSO,ME \?CCL17
	ICALL	PERFORM,V?UNTIE,SAFETY-LINE
	RTRUE	
?CCL17:	EQUAL?	PRSA,V?ROW \?CCL21
	EQUAL?	PRSO,FALSE-VALUE \?CCL21
	PRINTR	"The oars aren't here.They're forward on the main deck."
?CCL21:	EQUAL?	PRSA,V?TURN \?CCL25
	EQUAL?	PRSO,INTDIR \?CCL25
	ICALL	PERFORM,V?TURN,GALLEY-WHEEL,INTDIR
	RTRUE	
?CCL25:	EQUAL?	PRSA,V?TURN-TOWARD,V?TURN-AWAY \?CCL29
	EQUAL?	PRSO,GALLEY-WHEEL /?CCL29
	ICALL	PERFORM,PRSA,GALLEY-WHEEL,PRSO
	RTRUE	
?CCL29:	EQUAL?	PRSA,V?POINT \?CCL33
	EQUAL?	PRSO,LG-BAY,LG-LAND \?CCL33
	SET	'WINNER,OARSMEN
	ICALL	PERFORM,V?POINT,PRSO
	SET	'WINNER,PLAYER
	RTRUE	
?CCL33:	EQUAL?	PRSA,V?BOARD \FALSE
	EQUAL?	PRSO,LG-SEA \FALSE
	FSET?	SAFETY-LINE,WEARBIT \?CCL42
	PRINT	YOU-HAVE-TO
	PRINT	STR?458
	PRINTR	"."
?CCL42:	FSET?	LIFE-RING,WEARBIT /FALSE
	PRINT	STR?459
	CRLF	
	RTRUE	


	.FUNCT	GALLEY-WHEEL-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"The helm is here, turned "
	EQUAL?	SHIP-COURSE,P?PORT \?CCL8
	PRINTI	"to port"
	JUMP	?CND6
?CCL8:	EQUAL?	SHIP-COURSE,P?STARBOARD \?CCL10
	PRINTI	"to starboard"
	JUMP	?CND6
?CCL10:	PRINTI	"straight"
?CND6:	PRINTI	" now."
	FSET?	SAFETY-LINE,WEARBIT /?CCL13
	FSET?	GALLEY-WHEEL,ONBIT \FALSE
?CCL13:	FSET?	GALLEY-WHEEL,ONBIT \?CCL18
	PRINTI	"You have the helm"
	FSET?	SAFETY-LINE,WEARBIT \?CND16
	PRINTI	" and a "
	JUMP	?CND16
?CCL18:	FSET?	SAFETY-LINE,WEARBIT \?CND16
	PRINTI	"The "
?CND16:	FSET?	SAFETY-LINE,WEARBIT \?CCL24
	PRINTI	"life line secures you as the deck pitches and rolls."
	RTRUE	
?CCL24:	PRINTI	". There is a life line lashed to the binnacle."
	RTRUE	


	.FUNCT	GALLEY-WHEEL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"The helm steers the ship.The galley is steering "
	EQUAL?	SHIP-COURSE,P?PORT \?CCL6
	PRINTR	"south toward the open sea."
?CCL6:	PRINTR	"toward the bay."
?CCL3:	EQUAL?	PRSA,V?TAKE \?CCL8
	FSET?	GALLEY-WHEEL,ONBIT \?CCL11
	PRINTR	"You already have it!"
?CCL11:	FSET	GALLEY-WHEEL,ONBIT
	PRINTR	"You take the helm."
?CCL8:	EQUAL?	PRSA,V?DROP \?CCL13
	FSET?	GALLEY-WHEEL,ONBIT /?CCL16
	CALL1	YOU-ARENT-HOLDING
	RSTACK	
?CCL16:	FCLEAR	GALLEY-WHEEL,ONBIT
	PRINTI	"You release the helm."
	IN?	RODRIGUES,HERE \?CND17
	PRINTR	"Rodrigues takes it."
?CND17:	CRLF	
	RTRUE	
?CCL13:	EQUAL?	PRSA,V?STRAIGHTEN \?CCL20
	EQUAL?	PRSO,GALLEY-WHEEL \?CCL20
	SET	'P-DIRECTION,P?FORE
	ICALL	PERFORM,V?TURN,GALLEY-WHEEL,INTDIR
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?TURN-TOWARD \?CCL24
	EQUAL?	PRSO,GALLEY-WHEEL \?CCL24
	EQUAL?	PRSI,LG-BAY,LG-LAND \?CCL29
	SET	'P-DIRECTION,P?STARBOARD
	ICALL	PERFORM,V?TURN,PRSO,INTDIR
	RTRUE	
?CCL29:	EQUAL?	PRSI,LG-SEA \FALSE
	SET	'P-DIRECTION,P?PORT
	ICALL	PERFORM,V?TURN,PRSO,INTDIR
	RTRUE	
?CCL24:	EQUAL?	PRSA,V?TURN-AWAY \?CCL33
	EQUAL?	PRSO,GALLEY-WHEEL \?CCL33
	EQUAL?	PRSI,LG-BAY,LG-LAND \?CCL38
	SET	'P-DIRECTION,P?PORT
	ICALL	PERFORM,V?TURN,PRSO,INTDIR
	RTRUE	
?CCL38:	EQUAL?	PRSI,LG-SEA \FALSE
	SET	'P-DIRECTION,P?STARBOARD
	ICALL	PERFORM,V?TURN,PRSO,INTDIR
	RTRUE	
?CCL33:	EQUAL?	PRSA,V?TURN \FALSE
	EQUAL?	PRSO,GALLEY-WHEEL \FALSE
	FSET?	ANCHOR,SCOREBIT /?CCL47
	PRINTR	"The galley is anchored safely in the bay.Turning the wheel is a waste of time."
?CCL47:	FSET?	GALLEY-WHEEL,ONBIT /?CCL49
	CALL1	YOU-ARENT-HOLDING
	RSTACK	
?CCL49:	EQUAL?	PRSI,INTDIR \?CCL51
	EQUAL?	P-DIRECTION,P?PORT,P?SOUTH \?CCL54
	SET	'SHIP-COURSE,P?PORT
	SET	'SHIP-DIRECTION,P?SOUTH
	PRINTR	"You turn to wheel to port, steering the galley out to sea, running with the wind."
?CCL54:	EQUAL?	P-DIRECTION,P?STARBOARD,P?WEST \?CCL56
	SET	'SHIP-COURSE,P?STARBOARD
	SET	'SHIP-DIRECTION,P?WEST
	PRINTR	"You turn the wheel to starboard, steering for the bay."
?CCL56:	EQUAL?	P-DIRECTION,P?FORE,P?IN \?CCL58
	SET	'SHIP-COURSE,P?FORE
	PRINTR	"You try to hold a steady course."
?CCL58:	PRINTR	"You can't steer the galley in that direction!"
?CCL51:	PRINT	STR?364
	CRLF	
	RTRUE	


	.FUNCT	SAFETY-LINE-F:ANY:0:0
	EQUAL?	PRSA,V?THROW,V?GIVE \?PRD5
	EQUAL?	PRSI,LG-RODRIGUES /?CTR2
?PRD5:	EQUAL?	PRSA,V?TURN \?PRD8
	EQUAL?	PRSI,LG-RODRIGUES /?CTR2
?PRD8:	EQUAL?	PRSA,V?REACH-FOR \?CCL3
	EQUAL?	PRSO,LG-RODRIGUES \?CCL3
?CTR2:	PRINTR	"It's much too short."
?CCL3:	EQUAL?	PRSA,V?TIE \?CCL14
	EQUAL?	PRSI,SAFETY-LINE \?CCL14
	EQUAL?	PRSO,SAFETY-LINE /?CCL14
	ICALL	PERFORM,PRSA,SAFETY-LINE,PRSO
	RTRUE	
?CCL14:	EQUAL?	PRSA,V?TIE \?CCL19
	EQUAL?	PRSO,SAFETY-LINE \?CCL19
	EQUAL?	PRSI,FALSE-VALUE,ME,BLACKTHORNE /?CCL19
	EQUAL?	PRSI,RODRIGUES \?CCL25
	PRINTI	"""Lifelines, Ingeles?Have you no "
	ICALL2	PRINTUNDER,STR?460
	PRINTR	"?"""
?CCL25:	EQUAL?	PRSI,SAFETY-LINE \?CCL27
	PRINTR	"Tying the safety line to itself would be foolish."
?CCL27:	PRINTR	"You can't tie the safety line to that."
?CCL19:	EQUAL?	PRSA,V?UNTIE,V?TAKE-OFF,V?DROP \?CCL29
	FSET?	SAFETY-LINE,WEARBIT \?CCL32
	MOVE	SAFETY-LINE,GALLEY
	FCLEAR	SAFETY-LINE,WEARBIT
	PRINTI	"You untie the line."
	FSET?	ANCHOR,SCOREBIT \?CND33
	PRINTI	"You know that without your lifeline you can easily be carried overboard."
	FSET?	OARSMEN,SCOREBIT \?CND33
	PRINTR	"But the oars have to be shipped or you are lost."
?CND33:	CRLF	
	RTRUE	
?CCL32:	PRINTR	"You're already untied!"
?CCL29:	EQUAL?	PRSA,V?TIE,V?WEAR,V?TAKE \FALSE
	FSET?	SAFETY-LINE,WEARBIT /?CCL41
	MOVE	SAFETY-LINE,WINNER
	FSET	SAFETY-LINE,WEARBIT
	PRINTR	"You gratefully return to the safety of the line."
?CCL41:	PRINTR	"You're already tied as securely as possible."


	.FUNCT	MAIN-DECK-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINT	STR?462
	FSET?	ANCHOR,SCOREBIT /?CCL6
	PRINTR	"The rowers are resting after their ordeal, exhausted but proud of their victory over the sea."
?CCL6:	FSET?	MAIN-DECK,SCOREBIT /?CCL8
	PRINTI	"Banks of twenty rowers are to each side, disciplined, trained samurai."
	FSET?	OARSMEN,SCOREBIT /?CCL11
	PRINTR	"They row steadily, urged on by the beat of a drum."
?CCL11:	PRINTR	"They wait patiently for their next order."
?CCL8:	PRINTR	"The chaos here is incredible.Half the oars are flailing in the air, some of the oarsmen have been washed overboard, and some have slipped their safety lines to try to fight order into their oars."
?CCL3:	EQUAL?	RARG,M-ENTER \?CCL13
	FSET?	ANCHOR,SCOREBIT /?CCL16
	PRINTI	"You make your way forward"
	JUMP	?CND14
?CCL16:	PRINTI	"You fight your way forward along the heaving, greasy deck,"
?CND14:	PRINTI	" down the short gangway to the main deck."
	CRLF	
	CRLF	
	RTRUE	
?CCL13:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?CLIMB-FOO,V?HOLD-ON \?CCL21
	EQUAL?	PRSO,ROOMS \?CCL21
	ZERO?	GOT-GUNWALE? \?CCL26
	ICALL	PERFORM,V?TAKE,GUNWALE
	RTRUE	
?CCL26:	PRINTR	"You have returned to the relative security of the deck."
?CCL21:	FSET?	GUNWALE,RMUNGBIT \?CCL28
	ZERO?	GOT-GUNWALE? \?CCL28
	EQUAL?	PRSA,V?WALK,V?WALK-TO \?CCL33
	PRINTR	"You can't walk while being swept overboard!"
?CCL33:	CALL1	GAME-VERB?
	ZERO?	STACK \FALSE
	EQUAL?	PRSA,V?TAKE,V?BOARD,V?SWIM /FALSE
	EQUAL?	PRSA,V?HOLD,V?HOLD-ON /FALSE
	PRINTR	"Your preoccupations are unusual for someone who is being swept overboard in the middle of the ocean."
?CCL28:	EQUAL?	PRSA,V?TAKE-OFF \?CCL41
	EQUAL?	PRSO,LG-GALLEY \?CCL41
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?CCL41:	EQUAL?	PRSA,V?WALK \?CCL45
	EQUAL?	P-WALK-DIR,P?DOWN \?CCL45
	FSET?	SKIFF,RMUNGBIT \?CCL45
	ICALL	PERFORM,V?BOARD,SKIFF
	RTRUE	
?CCL45:	EQUAL?	PRSA,V?BOARD \?CCL50
	EQUAL?	PRSO,LG-SEA \?CCL50
	PRINT	STR?459
	CRLF	
	RTRUE	
?CCL50:	EQUAL?	PRSA,V?ROW,V?WALK-TO \FALSE
	EQUAL?	PRSO,FALSE-VALUE \FALSE
	FSET?	MAIN-DECK,SCOREBIT \?CCL59
	ICALL	PERFORM,V?HELP,OARSMEN
	RTRUE	
?CCL59:	SET	'WINNER,OARSMEN
	ICALL	PERFORM,PRSA,PRSO,PRSI
	SET	'WINNER,PLAYER
	RTRUE	


	.FUNCT	SKIFF-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	EQUAL?	RARG,M-OBJDESC \FALSE
	FSET?	SKIFF,RMUNGBIT \?CCL8
	PRINTI	"The skiff "
	EQUAL?	HERE,PEBBLED-BEACH \?CCL11
	PRINTI	"has been pulled up onto the rocky beach."
	RETURN	M-FATAL
?CCL11:	PRINTI	"rides lightly beside the galley."
	RETURN	M-FATAL
?CCL8:	EQUAL?	HERE,PEBBLED-BEACH \?CCL13
	PRINTI	"The skiff rests on its side on the rocky beach."
	RETURN	M-FATAL
?CCL13:	PRINTI	"A skiff is tied to the deck near the centerline of the galley."
	RETURN	M-FATAL


	.FUNCT	SKIFF-F:ANY:0:1,RARG,TRIES
	EQUAL?	RARG,M-LOOK \?CCL3
	EQUAL?	HERE,IN-THE-SEA \FALSE
	PRINTI	"The skiff rides lightly in the relatively gentle swells of the bay."
	IN?	YABU,SKIFF \?CND7
	IN?	SEARCH-PARTY,SKIFF \?CND7
	PRINTR	"Yabu sits imperiously in the bow, and the search party mans the oars."
?CND7:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \?CCL12
	EQUAL?	HERE,IN-THE-SEA \?CCL15
	EQUAL?	PRSA,V?BOARD,V?WALK-TO,V?CLIMB-FOO \?CCL18
	EQUAL?	PRSO,GALLEY \?CCL18
	MOVE	WINNER,HERE
	CALL2	GOTO,MAIN-DECK
	RSTACK	
?CCL18:	EQUAL?	PRSA,V?DISEMBARK \?CCL22
	ICALL	PERFORM,V?LEAP,LG-SEA
	RTRUE	
?CCL22:	EQUAL?	PRSA,V?WALK /?CCL24
	EQUAL?	PRSA,V?WALK-TO \FALSE
	EQUAL?	PRSO,LG-LAND,LG-BAY,LG-GALLEY \FALSE
?CCL24:	EQUAL?	PRSA,V?WALK \?PRD33
	EQUAL?	P-WALK-DIR,P?EAST /?CTR30
?PRD33:	EQUAL?	PRSA,V?WALK-TO \?CCL31
	EQUAL?	PRSO,LG-LAND \?CCL31
?CTR30:	PRINTI	"The rowers look to Yabu for confirmation, and he nods impatiently."
	JUMP	?CND29
?CCL31:	PRINTI	"Yabu points to the shore instead, indicating the direction for the rowers to go."
?CND29:	CRLF	
	CRLF	
	CALL2	GOTO,PEBBLED-BEACH
	RSTACK	
?CCL15:	EQUAL?	HERE,PEBBLED-BEACH \FALSE
	EQUAL?	PRSA,V?DISEMBARK /?CTR41
	EQUAL?	PRSA,V?WALK \?CCL42
	EQUAL?	P-WALK-DIR,P?OUT \?CCL42
?CTR41:	ZERO?	SEARCHED? \?CCL49
	SET	'SEARCHED?,TRUE-VALUE
	MOVE	BLACKTHORNE,HERE
	MOVE	YABU,HERE
	PRINTR	"You disembark quickly, intending to lead the search party, but Yabu usurps that position and will not yield it."
?CCL49:	PRINTR	"The samurai hold you back; it's apparent that Yabu feels you've had your chance to find Rodrigues, and now it's time to head back to the galley."
?CCL42:	EQUAL?	PRSA,V?WALK \?PRD53
	EQUAL?	P-WALK-DIR,P?WEST /?CTR50
?PRD53:	EQUAL?	PRSA,V?WALK-TO \?CCL51
	EQUAL?	PRSO,GALLEY,LG-GALLEY \?CCL51
?CTR50:	PRINTI	"You are rowed back to the galley, having failed to find Rodrigues."
	CRLF	
	CALL1	FAILED-SCENE
	RSTACK	
?CCL51:	EQUAL?	PRSA,V?WALK,V?WALK-TO \FALSE
	ICALL2	PERFORM,V?DISEMBARK
	RTRUE	
?CCL12:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL64
	PRINTI	"It's a wooden skiff, pointed at bow and stern."
	IN?	SEARCH-PARTY,SKIFF \?CCL67
	PRINTI	"In the skiff are "
	CALL1	WHAT-CONTENTS
	RSTACK	
?CCL67:	PRINTR	"It's big enough to hold quite a few men."
?CCL64:	EQUAL?	PRSA,V?TAKE \?CCL69
	PRINTR	"It's much to heavy for you to carry."
?CCL69:	EQUAL?	PRSA,V?BOARD \?CCL71
	EQUAL?	HERE,PEBBLED-BEACH \?CCL74
	MOVE	YABU,SKIFF
	MOVE	SEARCH-PARTY,SKIFF
	MOVE	PLAYER,SKIFF
	PRINTR	"You board the skiff, and the rest of the shore party follows."
?CCL74:	FSET?	SKIFF,RMUNGBIT \?CCL76
	GETP	SKIFF,P?COUNT >TRIES
	ADD	TRIES,1
	PUTP	SKIFF,P?COUNT,STACK
	ZERO?	TRIES \?CCL79
	PRINTI	"You go to the gunwale and begin to scale down the side but a harsh voice stops you.Hiro-matsu is here, with Yabu beside him."
	CALL1	HIRO-MATSU-REFUSES
	RSTACK	
?CCL79:	EQUAL?	TRIES,1 \?CCL81
	CALL1	YABU-BOARDS-SKIFF
	RSTACK	
?CCL81:	MOVE	BLACKTHORNE,SKIFF
	PRINTI	"You climb down the side of the galley, joining the others in the skiff."
	CRLF	
	CRLF	
	CALL2	GOTO,IN-THE-SEA
	RSTACK	
?CCL76:	PRINT	STR?219
	CRLF	
	RTRUE	
?CCL71:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL83
	IN?	YABU,SKIFF \FALSE
	IN?	SEARCH-PARTY,SKIFF \FALSE
	PRINTR	"In the skiff is the search party of seven samurai, ready at the oars, and Yabu, who looks very pleased with himself."
?CCL83:	EQUAL?	PRSA,V?UNTIE \?CCL90
	FSET?	ANCHOR,SCOREBIT /?CCL93
	FSET?	SKIFF,RMUNGBIT /?CCL96
	FSET	SKIFF,RMUNGBIT
	MOVE	BOAT-OAR,SKIFF
	PRINTR	"You untie the skiff, preparing to launch it."
?CCL96:	PRINTR	"It's already untied."
?CCL93:	PRINTR	"In this gale, any object that isn't tied down is a deadly missile."
?CCL90:	EQUAL?	PRSA,V?LAUNCH,V?LOWER \FALSE
	ZERO?	GALLEY-IN-BAY? /?CCL101
	FSET?	ANCHOR,SCOREBIT \?CCL104
	PRINTR	"The galley is still being washed to and fro.It's too dangerous."
?CCL104:	FSET?	SKIFF,RMUNGBIT /?CCL106
	FSET	SKIFF,RMUNGBIT
	MOVE	BOAT-OAR,SKIFF
	PRINTI	"The skiff is "
	EQUAL?	HERE,MAIN-DECK,GALLEY \?CCL109
	PRINTR	"lowered into the water."
?CCL109:	PRINTR	"pushed out into the surf."
?CCL106:	PRINTI	"It's already "
	EQUAL?	HERE,MAIN-DECK,GALLEY \?CCL112
	PRINTR	"riding the waves beside the galley."
?CCL112:	PRINTR	"waiting in the nearby surf."
?CCL101:	PRINTR	"You can't launch it alone, and in this gale, no one is going to help you."


	.FUNCT	ANCHOR-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	FSET?	GUNWALE,RMUNGBIT \?CCL3
	PRINTR	"It's too far away."
?CCL3:	EQUAL?	PRSA,V?DROP,V?THROW,V?THROW-OFF /?CTR6
	EQUAL?	PRSA,V?PUT,V?LOWER,V?PUSH /?CTR6
	EQUAL?	PRSA,V?MOVE \?CCL7
?CTR6:	ZERO?	GALLEY-IN-BAY? \?CCL13
	PRINTR	"You can't drop anchor until you are safely in the bay!"
?CCL13:	FSET?	ANCHOR,SCOREBIT \?CCL15
	FSET	ANCHOR,NDESCBIT
	ICALL	QUEUE,I-ALL-ON-DECK,1
	PRINTI	"""Let go the anchor!""No one understands your words but they all know what you want.The anchor splashes over the side.You let the ship fall off the wind slightly to test the firmness of the seabed.The ship is safe."
	CRLF	
	CALL2	SCORE-OBJECT,ANCHOR
	RSTACK	
?CCL15:	PRINT	STR?131
	CRLF	
	RTRUE	
?CCL7:	EQUAL?	PRSA,V?RAISE \FALSE
	FSET?	ANCHOR,SCOREBIT \?CCL20
	PRINT	STR?131
	CRLF	
	RTRUE	
?CCL20:	FSET?	ANCHOR,NDESCBIT \FALSE
	PRINTR	"What a dangerous idea!You would be swept onto the rocks."


	.FUNCT	I-ALL-ON-DECK:ANY:0:0
	MOVE	HIRO-MATSU,MAIN-DECK
	MOVE	YABU,MAIN-DECK
	CRLF	
	PRINTI	"Hiro-matsu and Yabu climb shakily up from below decks, both somewhat seasick, but once there, both "
	ICALL2	PRINTUNDER,STR?463
	PRINTR	" stand erect."


	.FUNCT	OARS-F:ANY:0:0
	EQUAL?	PRSA,V?SHIP,V?SORT,V?POINT /?PRD5
	EQUAL?	PRSA,V?TAKE,V?ROW,V?WALK-TO \FALSE
?PRD5:	IN?	WINNER,SKIFF /FALSE
	ICALL	PERFORM,V?HELP,OARSMEN
	RTRUE	


	.FUNCT	OARSMEN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?PUT \?CCL8
	EQUAL?	PRSO,OARS \?CCL8
	EQUAL?	PRSI,GLOBAL-WATER,LG-SEA \?CCL8
	ICALL2	PERFORM,V?ROW
	RTRUE	
?CCL8:	FSET?	MAIN-DECK,SCOREBIT \?CCL13
	EQUAL?	PRSA,V?SHIP,V?SORT,V?POINT /?PRD16
	EQUAL?	PRSA,V?TAKE,V?ROW,V?WALK-TO \?CCL13
?PRD16:	EQUAL?	PRSO,FALSE-VALUE,OARSMEN,OARS /?CTR12
	EQUAL?	PRSO,LG-BAY,LG-LAND \?CCL13
?CTR12:	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?HELP,OARSMEN
	RTRUE	
?CCL13:	EQUAL?	PRSA,V?POINT,V?TAKE,V?ROW /?PRD24
	EQUAL?	PRSA,V?WALK-TO \?CCL22
?PRD24:	EQUAL?	PRSO,FALSE-VALUE,OARS,OARSMEN /?CTR21
	EQUAL?	PRSO,LG-BAY,LG-LAND \?CCL22
?CTR21:	FSET?	ANCHOR,SCOREBIT /?CCL31
	PRINTR	"The galley is anchored.There's no reason to row."
?CCL31:	PRINTI	"The oarsmen don't understand you, but they "
	FSET?	OARSMEN,SCOREBIT \?CCL34
	PRINTI	"get the idea, and begin rowing again."
	CRLF	
	CALL2	SCORE-OBJECT,OARSMEN
	RSTACK	
?CCL34:	PRINTR	"try to row faster."
?CCL22:	EQUAL?	PRSA,V?DROP,V?THROW,V?THROW-OFF /?PRD38
	EQUAL?	PRSA,V?PUT,V?LOWER,V?PUSH /?PRD38
	EQUAL?	PRSA,V?MOVE \?CCL36
?PRD38:	EQUAL?	PRSO,ANCHOR /FALSE
?CCL36:	PRINTR	"They don't seem to understand what you want."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL43
	FSET?	MAIN-DECK,SCOREBIT \?CCL46
	PRINTR	"The oarsmen are in a state of confusion."
?CCL46:	FSET?	OARSMEN,SCOREBIT \?CCL48
	PRINTR	"The oarsmen are settled again at their benches, but not yet rowing again."
?CCL48:	PRINTR	"The oarsmen, unlike those you have seen in Europe, aren't slaves.Each is a samurai warrior, and what they lack in deep water sailing ability they make up in strength and stamina."
?CCL43:	EQUAL?	PRSA,V?BOW \?CCL50
	FSET?	OARSMEN,SCOREBIT /?CCL53
	PRINTR	"The oarsmen acknowledge your gesture of respect."
?CCL53:	PRINTR	"The oarsmen are taken aback by your formality, given the circumstances."
?CCL50:	EQUAL?	PRSA,V?THROW \?CCL55
	EQUAL?	PRSO,LIFE-RING \?CCL55
	REMOVE	LIFE-RING
	PRINTR	"You heave the life ring to the rower, who tries to reach it, but the surge of the sea is too strong and he's swept away."
?CCL55:	EQUAL?	PRSA,V?HELP,V?SORT \FALSE
	FSET?	MAIN-DECK,SCOREBIT \?CCL62
	PRINTI	"You hurl yourself into the work of resorting the rowers.All rowing has stopped except for the two oars most forward, which are keeping the galley tidily into the wind.With signs and yelling, you get the oars shipped, double up the men on the working ones, and generally restore order."
	CRLF	
	CALL2	SCORE-OBJECT,MAIN-DECK
	RSTACK	
?CCL62:	PRINTR	"The oars are already back in some sort of order."


	.FUNCT	GUNWALE-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTI	"The gunwales are nearly awash, as the galley is heavily laden and low in the water.In the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" you would ride out a storm like this easily, but this galley isn't built and rigged for weather."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?HOLD,V?HOLD-ON \FALSE
	FSET?	GUNWALE,RMUNGBIT \?CCL8
	FCLEAR	GUNWALE,RMUNGBIT
	SET	'GOT-GUNWALE?,TRUE-VALUE
	PRINTI	"You grab desperately for the gunwale, and you catch it, your tendons stretching but your grip holds!Then your other hand reaches the rail and, choking, you pull yourself back."
	CRLF	
	CALL2	SCORE-OBJECT,GUNWALE
	RSTACK	
?CCL8:	PRINTR	"You hang onto the gunwales as you go forward."


	.FUNCT	I-RODRIGUES:ANY:0:0
	EQUAL?	HERE,IN-THE-SEA \?PRG5
	IN?	RODRIGUES,IN-THE-SEA \FALSE
?PRG5:	INC	'DELAY-CNT
	EQUAL?	RODRIGUES-CNT,2 \?CCL9
	IN?	BLACKTHORNE,GALLEY \?CND7
	GRTR?	DELAY-CNT,2 \?CCL14
	CRLF	
	ICALL2	JIGS-UP,STR?464
	RETURN	M-FATAL
?CCL14:	CRLF	
	PRINTI	"""Hurry, Ingeles!Where are your "
	ICALL2	PRINTUNDER,STR?460
	PRINTR	"?"" curses Rodrigues."
?CCL9:	EQUAL?	RODRIGUES-CNT,4 \?CCL16
	FSET?	MAIN-DECK,SCOREBIT /?CCL18
	FSET?	OARSMEN,SCOREBIT \?CND7
?CCL18:	ICALL2	THIS-IS-IT,OARSMEN
	GRTR?	DELAY-CNT,6 \?CCL23
	CRLF	
	ICALL2	JIGS-UP,STR?465
	RETURN	M-FATAL
?CCL23:	FSET?	MAIN-DECK,SCOREBIT \?CCL26
	CRLF	
	PRINTI	"The chaos continues, the oarsmen inexperienced with storms so far out to sea, and they can't seem to get sorted out on their own."
	IN?	RODRIGUES,HERE \?CND27
	PRINT	STR?466
	PRINTI	"I told you to help the oarsmen!Are you afraid just because you got a little wet?"""
?CND27:	CRLF	
	JUMP	?CND24
?CCL26:	FSET?	OARSMEN,SCOREBIT \?CND24
	CRLF	
	PRINTI	"The oarsmen, spent by their fight against the waves, and unsure what to do next, wait for the next order."
	IN?	RODRIGUES,HERE \?CND30
	PRINT	STR?466
	PRINTI	"get those bastard-sans rowing again!They don't know what to do so far from shore."""
?CND30:	CRLF	
?CND24:	CRLF	
	PRINTR	"The storm continues to rage, and the galley is getting no closer to the bay."
?CCL16:	EQUAL?	RODRIGUES-CNT,5 \?CCL33
	FSET?	GALLEY-WHEEL,ONBIT /?CND7
	GRTR?	DELAY-CNT,1 \FALSE
	CRLF	
	PRINTR	"Rodrigues curses, ""By your mother, Ingeles!Take the helm!"""
?CCL33:	EQUAL?	RODRIGUES-CNT,9 \?CCL40
	FSET?	OAR,SCOREBIT \?CND7
	EQUAL?	DELAY-CNT,1 \?CCL45
	CRLF	
	PRINTR	"Rodrigues splashes to the surface, but the current is carrying him further away."
?CCL45:	EQUAL?	DELAY-CNT,2 \?CCL47
	CRLF	
	PRINTR	"The rain slashes down and you see that Rodrigues is being carried further from the galley."
?CCL47:	EQUAL?	DELAY-CNT,3 \?CND7
	CRLF	
	PRINTR	"Rodrigues is almost lost in the waves and wind-driven spray."
?CCL40:	EQUAL?	RODRIGUES-CNT,10 \?CCL50
	EQUAL?	HERE,GALLEY \?CTR52
	FSET?	GALLEY-WHEEL,ONBIT /?CCL53
?CTR52:	EQUAL?	DELAY-CNT,1 \?CCL58
	CRLF	
	PRINTR	"There's no one conning the galley!"
?CCL58:	EQUAL?	DELAY-CNT,2 \FALSE
	SET	'SHIP-COURSE,P?PORT
	CRLF	
	PRINTR	"The Japanese captain grabs the wheel, and immediately steers for the open sea!"
?CCL53:	EQUAL?	SHIP-COURSE,P?PORT \?CND7
	LESS?	DELAY-CNT,3 \?CND7
	CRLF	
	PRINTR	"The galley continues out to sea, into the teeth of the storm."
?CCL50:	EQUAL?	RODRIGUES-CNT,11 \?CND7
	FSET?	ANCHOR,SCOREBIT \?CND7
	GRTR?	DELAY-CNT,3 \?CCL69
	CRLF	
	ICALL2	JIGS-UP,STR?467
	RETURN	M-FATAL
?CCL69:	CRLF	
	PRINTR	"The current is swinging the ship around and towards the rocks, away from the safe anchorage."
?CND7:	SET	'DELAY-CNT,0
	INC	'RODRIGUES-CNT
	EQUAL?	RODRIGUES-CNT,1 \?CCL72
	SET	'SHIP-COURSE,P?PORT
	SET	'SHIP-DIRECTION,P?SOUTH
	CALL	MARGINAL-PIC,P-CONFUSION,FALSE-VALUE
	ZERO?	STACK \?CND73
	CRLF	
?CND73:	PRINTR	"""Watch out forward!"" Rodrigues shouts.The galley rolls sickeningly, twenty oars pulling at air instead of sea and there is chaos aboard.The first comber has struck and the port gunwale is awash.The galley is floundering."
?CCL72:	EQUAL?	RODRIGUES-CNT,2 \?CCL76
	ICALL2	THIS-IS-IT,OARSMEN
	FSET	OARSMEN,SCOREBIT
	EQUAL?	HERE,GALLEY \?CCL79
	CRLF	
	PRINTI	"""Go forward,"" Rodrigues orders."
	JUMP	?CND77
?CCL79:	CRLF	
	PRINTI	"Rodrigues yells to you."
?CND77:	PRINTR	"""Get 'em to ship the oars, get 'em back in order, and then get 'em rowing again before we all drown!Hurry, hurry, hurry!"""
?CCL76:	EQUAL?	RODRIGUES-CNT,3 \?CCL81
	MOVE	OAR,GALLEY
	FSET	GUNWALE,RMUNGBIT
	ICALL2	THIS-IS-IT,GUNWALE
	CRLF	
	PRINTR	"Abruptly the galley swerves and you are carried to the down side, tripped by the flailing bodies of rowers who have lost their own footing.

The gunwale is under water and one man goes overboard!You feel the rush of water carrying you over the gunwale as well!"
?CCL81:	EQUAL?	RODRIGUES-CNT,4 \?CCL83
	ZERO?	GOT-GUNWALE? /?CCL86
	ICALL2	THIS-IS-IT,OARSMEN
	CRLF	
	PRINTR	"A man is at your feet and he drags you from the grip of the sea."
?CCL86:	CRLF	
	PRINTI	"You are swept into the raging torrent of the sea, and although you "
	IN?	LIFE-RING,PLAYER \?CCL89
	PRINTI	"are wearing a life ring"
	JUMP	?CND87
?CCL89:	PRINTI	"can swim"
?CND87:	PRINTI	", there is no hope."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	
?CCL83:	EQUAL?	RODRIGUES-CNT,5 \?CCL91
	MOVE	RODRIGUES,MAIN-DECK
	CRLF	
	EQUAL?	HERE,MAIN-DECK \?CCL94
	PRINTI	"Rodrigues picks his way forward and claps you on the shoulder.He points aft."
	JUMP	?CND92
?CCL94:	PRINTI	"Rodrigues says,"
?CND92:	PRINTI	"""You take the helm.When I signal, steer west for that point.You see it?I'm going"
	EQUAL?	HERE,GALLEY \?CND95
	PRINTI	" forward"
?CND95:	PRINTI	" to help the captain with the oarsmen."""
	EQUAL?	HERE,GALLEY \?CND97
	PRINTR	"He unties his lifeline and goes forward."
?CND97:	CRLF	
	RTRUE	
?CCL91:	EQUAL?	RODRIGUES-CNT,6 \?CCL100
	CRLF	
	PRINTR	"The wind and tide are carrying you close to the rocks.Rodrigues stares, terrified, at the approaching shore."
?CCL100:	EQUAL?	RODRIGUES-CNT,7 \?CCL102
	CRLF	
	PRINTI	"Rodrigues stares in horror at the jagged rocks of the headland.It's clear he's lost his nerve."""
	EQUAL?	SHIP-COURSE,P?PORT \?CND103
	PRINTI	"That's right, Pilot!"
?CND103:	PRINTR	"Steer south for the open sea!"" Rodrigues screams.""Turn and run before the wind!We'll never make it safe to the bay!"""
?CCL102:	EQUAL?	RODRIGUES-CNT,8 \?CCL106
	EQUAL?	SHIP-COURSE,P?PORT \?CCL109
	CRLF	
	PRINTI	"The galley heads for the open sea, trying to run before the wind, but she's too heavily laden, and has already taken on too much water.You try, and the oarsmen try, but it's hopeless.She flounders and you and all aboard drown like rats."
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL109:	CRLF	
	PRINTR	"You hold course toward the bay.Rodrigues shouts, ""God curse you, you'll kill us all!"""
?CCL106:	EQUAL?	RODRIGUES-CNT,9 \?CCL111
	MOVE	RODRIGUES,IN-THE-SEA
	FSET	RODRIGUES,INVISIBLE
	ICALL2	THIS-IS-IT,LG-RODRIGUES
	CALL2	MARGINAL-PIC,P-OVERBOARD
	ZERO?	STACK \?CND112
	CRLF	
?CND112:	PRINTR	"A great wave comes out of the north.The galley has taken much water previously, now you're awash and being driven backward towards the rock-infested shore.

You see the wave take Rodrigues, and you watch him, gasping and struggling in the churning sea.You remember that he can't swim."
?CCL111:	EQUAL?	RODRIGUES-CNT,10 \?CCL115
	FSET	OAR,RMUNGBIT
	CRLF	
	PRINTI	"The last you see of Rodrigues is an arm "
	FSET?	OAR,SCOREBIT \?CCL118
	PRINTR	"waving helplessly through the driving rain."
?CCL118:	PRINTR	"gripping a broken oar."
?CCL115:	EQUAL?	RODRIGUES-CNT,11 \?CCL120
	EQUAL?	SHIP-COURSE,P?PORT \?CCL123
	CRLF	
	ICALL2	JIGS-UP,STR?468
	RETURN	M-FATAL
?CCL123:	SET	'GALLEY-IN-BAY?,TRUE-VALUE
	CRLF	
	PRINTR	"The ship moves away from the rocks, and you hold course for the lee shore.Soon you are in calmer waters.There is still a gale but it's overhead.There is still a tempest but it's out to sea."
?CCL120:	EQUAL?	RODRIGUES-CNT,12 \FALSE
	ICALL2	DEQUEUE,I-RODRIGUES
	CRLF	
	PRINTI	"Somewhere out there is Rodrigues' body.You know "
	FSET?	OAR,SCOREBIT \?CND126
	FSET	RODRIGUES,DEAD
	PRINTI	"in your heart that with nothing to keep him above the waves, he must have drowned, and "
?CND126:	PRINTR	"there is minimal hope of finding his body, but you feel you owe it to him to try."


	.FUNCT	LIFE-RING-F:ANY:0:0
	EQUAL?	PRSA,V?THROW \?CCL3
	EQUAL?	PRSI,LG-RODRIGUES \?CCL3
	FSET?	OAR,RMUNGBIT /?CCL8
	PRINTI	"You "
	IN?	LIFE-RING,HERE \?CCL11
	PRINTI	"snatch the wooden life ring and throw it"
	JUMP	?CND9
?CCL11:	PRINTI	"throw the wooden life ring"
?CND9:	REMOVE	LIFE-RING
	PRINTR	" overboard.Rodrigues tries to reach it, but an ill-timed wave sweeps it out of his reach."
?CCL8:	PRINT	STR?470
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?THROW \?CCL13
	EQUAL?	PRSI,RODRIGUES \?CCL13
	LOC	RODRIGUES
	MOVE	LIFE-RING,STACK
	PRINTI	"You throw "
	ICALL1	THE-PRINT-PRSO
	PRINTR	" to Rodrigues.He drops it beside him, not having any use for it at the moment."
?CCL13:	EQUAL?	PRSA,V?WEAR,V?BOARD \?CCL17
	FSET?	LIFE-RING,WEARBIT /?CCL17
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL22
	CALL1	ITAKE
	EQUAL?	STACK,TRUE-VALUE \TRUE
?CCL22:	FSET	LIFE-RING,WEARBIT
	PRINTR	"You pull the life ring over your shoulders.It makes you very awkward but you feel safer."
?CCL17:	EQUAL?	PRSA,V?TAKE-OFF \FALSE
	FSET?	LIFE-RING,WEARBIT \FALSE
	FCLEAR	LIFE-RING,WEARBIT
	PRINTR	"You remove the life ring, pulling it off over your shoulders."


	.FUNCT	OAR-F:ANY:0:0
	EQUAL?	PRSA,V?TURN \?PRD5
	EQUAL?	PRSI,LG-RODRIGUES /?CTR2
?PRD5:	EQUAL?	PRSA,V?REACH-FOR \?PRD8
	EQUAL?	PRSO,LG-RODRIGUES /?CTR2
?PRD8:	EQUAL?	PRSA,V?THROW,V?GIVE \?CCL3
	EQUAL?	PRSO,OAR \?CCL3
	EQUAL?	PRSI,FALSE-VALUE,LG-RODRIGUES \?CCL3
	IN?	RODRIGUES,IN-THE-SEA \?CCL3
	FSET?	RODRIGUES,INVISIBLE \?CCL3
	EQUAL?	HERE,GALLEY,MAIN-DECK \?CCL3
?CTR2:	FSET?	OAR,RMUNGBIT /?CCL19
	FSET	OAR,NDESCBIT
	ICALL	MARGINAL-PIC,P-OAR,FALSE-VALUE
	PRINTI	"You "
	IN?	OAR,HERE \?CCL22
	PRINTI	"grab the oar and throw it"
	JUMP	?CND20
?CCL22:	PRINTI	"throw the oar"
?CND20:	PRINTI	" toward Rodrigues.It crashes into the water near him and he lunges for it."
	CRLF	
	MOVE	OAR,RODRIGUES
	CALL2	SCORE-OBJECT,OAR
	RSTACK	
?CCL19:	PRINT	STR?470
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?THROW,V?GIVE \?CCL24
	EQUAL?	PRSI,RODRIGUES \?CCL24
	PRINTR	"He doesn't seem to have much use for the oar right now."
?CCL24:	EQUAL?	PRSA,V?REPAIR \FALSE
	PRINTR	"That's beyond your abilities right now."


	.FUNCT	SEARCH-PARTY-FOLLOWS:ANY:0:0
	MOVE	YABU,HERE
	MOVE	SEARCH-PARTY,HERE
	PRINTI	"Yabu sets a strong pace, which you are hard put to keep up with.The other "
	GETP	SEARCH-PARTY,P?COUNT
	GET	NUMBERS,STACK
	PRINT	STACK
	PRINTI	" samurai watch you carefully."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	PEBBLED-BEACH-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	EQUAL?	OHERE,IN-THE-SEA \?CCL6
	IN?	WINNER,SKIFF \?CCL6
	FCLEAR	SKIFF,RMUNGBIT
	MOVE	SEARCH-PARTY,HERE
	PRINTI	"The rowers row the skiff east to the shore, jump out, and pull it up on the beach."
	CRLF	
	CRLF	
	RTRUE	
?CCL6:	EQUAL?	OHERE,ROCKY-SHORE \TRUE
	ICALL1	SEARCH-PARTY-FOLLOWS
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL14
	EQUAL?	P-WALK-DIR,P?SOUTH \?CCL14
	FSET?	ROCKY-SHORE,TOUCHBIT \?CCL14
	CALL1	YABU-PREVENTS
	RSTACK	
?CCL14:	EQUAL?	PRSA,V?WALK \?CCL19
	EQUAL?	P-WALK-DIR,P?NORTH \?CCL19
	PRINTR	"""No, Anjin-san,"" says Yabu.He points south.He knows as well as you that that's where the body will be, if anywhere."
?CCL19:	EQUAL?	PRSA,V?FIND \?PRD25
	EQUAL?	PRSO,RODRIGUES,LG-RODRIGUES /?CCL23
?PRD25:	EQUAL?	PRSA,V?SEARCH \?PRD28
	EQUAL?	PRSO,GLOBAL-HERE /?CCL23
?PRD28:	EQUAL?	PRSA,V?LOOK-DOWN \FALSE
?CCL23:	PRINT	SEARCH-FORESHORE
	PRINT	STR?472
	CRLF	
	RTRUE	


	.FUNCT	LG-PATH-F:ANY:0:0
	EQUAL?	PRSA,V?FOLLOW \FALSE
	PRINTI	"The path runs north and south."
	PRINT	YOU-HAVE-TO
	PRINT	STR?158
	CRLF	
	RTRUE	


	.FUNCT	LG-CLIFF-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The cliff soars two hundred feet above you, and drops fifty feet to the water below."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?MOVE \?CCL5
	MOVE	ROCK,WINNER
	PRINTR	"You take one of the many rocks from the soaking ground."
?CCL5:	EQUAL?	PRSA,V?CLIMB-DOWN,V?CLIMB-FOO \?CCL7
	ICALL2	DO-WALK,P?DOWN
	RTRUE	
?CCL7:	EQUAL?	PRSA,V?CLIMB-UP \?CCL9
	ICALL2	DO-WALK,P?UP
	RTRUE	
?CCL9:	EQUAL?	PRSA,V?SEARCH \FALSE
	ICALL	PERFORM,V?FIND,LG-RODRIGUES
	RTRUE	


	.FUNCT	SEARCH-PARTY-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	IN?	SEARCH-PARTY,SKIFF /FALSE
	RTRUE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"There are "
	GETP	SEARCH-PARTY,P?COUNT
	GET	NUMBERS,STACK
	PRINT	STACK
	PRINTC	32
	EQUAL?	HERE,CLIFF-PATH \?CCL11
	IN?	LOINCLOTH,SEARCH-PARTY \?CCL14
	PRINTI	"samurai here, stripped to their loincloths and"
	JUMP	?CND9
?CCL14:	GETP	YABU-KIMONO,P?COUNT
	EQUAL?	STACK,8 \?CCL16
	PRINTI	"naked samurai here,"
	JUMP	?CND9
?CCL16:	PRINTI	"samurai in soaking wet kimonos here,"
	JUMP	?CND9
?CCL11:	PRINTI	"samurai here,"
?CND9:	PRINTI	" watching you intently."
	RTRUE	


	.FUNCT	SEARCH-PARTY-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?RAISE,V?LOWER \?CCL8
	EQUAL?	PRSO,YABU-KIMONO \?CCL8
	IN?	YABU-KIMONO,SEARCH-PARTY \?CCL8
	SET	'WINNER,PLAYER
	ICALL	PERFORM,PRSA,PRSO
	RTRUE	
?CCL8:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?COUNT \?CCL13
	PRINTI	"There are "
	GETP	SEARCH-PARTY,P?COUNT
	GET	NUMBERS,STACK
	PRINT	STACK
	PRINTR	" samurai here."
?CCL13:	EQUAL?	PRSA,V?EXAMINE \FALSE
	IN?	LOINCLOTH,PRSO \?CCL18
	PRINTR	"The samurai are stripped to their loincloths."
?CCL18:	GETP	YABU-KIMONO,P?COUNT
	EQUAL?	STACK,8 \?CCL20
	PRINTR	"They are naked."
?CCL20:	PRINTR	"They are dressed in rather wet kimonos."


	.FUNCT	GENERIC-KIMONO-F:ANY:2:2,R,F
	IN?	YABU-KIMONO,HERE \?CCL3
	RETURN	YABU-KIMONO
?CCL3:	RETURN	PARTY-KIMONO


	.FUNCT	PARTY-KIMONO-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"These are uniform kimonos in a muddy brown color."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?POINT,V?RUB /?CTR4
	EQUAL?	PRSA,V?TEAR,V?TIE \?CCL5
?CTR4:	FSET?	YABU-KIMONO,RMUNGBIT \?CCL10
	CALL2	ACCESSIBLE?,YABU-KIMONO
	ZERO?	STACK /?CCL10
	IN?	YABU-KIMONO,HERE \?CND13
	MOVE	YABU-KIMONO,WINNER
?CND13:	ICALL	PERFORM,V?TIE,YABU-KIMONO
	RTRUE	
?CCL10:	PRINTR	"No one seems to understand what you are trying to do."
?CCL5:	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTR	"The samurai are reluctant to give up their kimonos."


	.FUNCT	ROCKY-SHORE-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	ICALL1	SEARCH-PARTY-FOLLOWS
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?SOUTH \FALSE
	FSET?	CLIFF-PATH,TOUCHBIT \FALSE
	CALL1	YABU-PREVENTS
	RSTACK	


	.FUNCT	YABU-PREVENTS:ANY:0:0
	PRINTR	"""No, Anjin-san,"" says Yabu.It's clear he thinks you've wasted enough time searching for the body."


	.FUNCT	CLIFF-PATH-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	ICALL1	SEARCH-PARTY-FOLLOWS
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?WALK \?CCL8
	EQUAL?	P-WALK-DIR,P?SOUTH \?CCL8
	FSET?	LEDGE-4,SCOREBIT \?CCL8
	FSET?	AROUND-HEADLAND,TOUCHBIT \?CCL8
	CALL1	YABU-PREVENTS
	RSTACK	
?CCL8:	EQUAL?	PRSA,V?WALK \?CCL14
	EQUAL?	P-WALK-DIR,P?NORTH,P?SOUTH \?CCL14
	FSET?	LEDGE-4,SCOREBIT /?CCL14
	PRINTR	"The samurai watch you like hawks, preventing you from leaving."
?CCL14:	EQUAL?	PRSA,V?LEAP,V?BOARD,V?DIVE \?CCL19
	PRINTR	"The samurai prevent you."
?CCL19:	EQUAL?	PRSA,V?FIND \?PRD23
	EQUAL?	PRSO,RODRIGUES,LG-RODRIGUES /?CTR20
?PRD23:	EQUAL?	PRSA,V?SEARCH \?PRD26
	EQUAL?	PRSO,GLOBAL-HERE /?CTR20
?PRD26:	EQUAL?	PRSA,V?LOOK-DOWN \?CCL21
?CTR20:	FSET?	LEDGE-4,SCOREBIT \?CCL31
	PRINT	SEARCH-FORESHORE
	FSET?	OAR,SCOREBIT /?CCL34
	FSET?	AROUND-HEADLAND,TOUCHBIT \?CCL34
	ICALL2	DEQUEUE,I-SEARCH
	MOVE	RODRIGUES,LEDGE-4
	FCLEAR	RODRIGUES,INVISIBLE
	ICALL2	THIS-IS-IT,LG-RODRIGUES
	PRINTI	"But halfway back along the path, you see Rodrigues!The body is caught in a cleft between two great rocks, above the surf but washed by part of it.One arm is still locked to a broken oar which moves slightly with the ebb and flow."
	CRLF	
	CALL2	SCORE-OBJECT,LEDGE-4
	RSTACK	
?CCL34:	PRINT	STR?472
	CRLF	
	RTRUE	
?CCL31:	FSET?	LEDGE,SCOREBIT \?CCL38
	ZERO?	YABU-RESIGNED? /?CCL38
	ICALL	PERFORM,V?FIND,LEDGE
	RTRUE	
?CCL38:	PRINTR	"You have already found him.Is your memory that short?"
?CCL21:	EQUAL?	PRSA,V?POINT \?PRD44
	EQUAL?	PRSO,RODRIGUES,LG-RODRIGUES /?CTR41
?PRD44:	EQUAL?	PRSA,V?SHOW \?CCL42
	EQUAL?	PRSO,RODRIGUES,LG-RODRIGUES \?CCL42
	EQUAL?	PRSI,YABU \?CCL42
?CTR41:	FSET?	LEDGE-4,SCOREBIT \?CCL52
	PRINTR	"You don't know where Rodrigues is."
?CCL52:	PRINTR	"Yabu peers over the cliff and finally sees Rodrigues.He shrugs as if to say, ""He's dead.""He doesn't seem inclined to do anything else."
?CCL42:	EQUAL?	PRSA,V?HELP,V?TAKE,V?WALK-TO \?CCL54
	EQUAL?	PRSO,YABU,RODRIGUES,LG-RODRIGUES \?CCL54
	FSET?	RODRIGUES,INVISIBLE /FALSE
	CALL2	QUEUED?,I-YABU-CLIMBS
	ZERO?	STACK \?CCL61
	CALL2	QUEUED?,I-YABU-RETURNS
	ZERO?	STACK \?CCL61
	SET	'YABU-CNT,0
	ICALL	QUEUE,I-YABU-CLIMBS,-1
	PRINTI	"You start for the cliff edge, and immediately the samurai restrain you.Yabu shakes his head."""
	ICALL2	PRINTUNDER,STR?455
	PRINTR	"""

You stare at Yabu, towering over him.""If you won't let me go, Yabu-san, then send one of your men.Or go yourself.You!"""
?CCL61:	IN?	YABU,HERE \?CCL65
	PRINTR	"You've hooked him!He's preparing to climb!"
?CCL65:	PRINTR	"Yabu doesn't see you."
?CCL54:	EQUAL?	PRSA,V?WALK \?CCL67
	EQUAL?	P-WALK-DIR,P?DOWN \?CCL67
	FSET?	RODRIGUES,INVISIBLE /?CCL72
	CALL2	QUEUED?,I-YABU-CLIMBS
	ZERO?	STACK \?CCL72
	CALL2	QUEUED?,I-YABU-RETURNS
	ZERO?	STACK \?CCL72
	ICALL	PERFORM,V?WALK-TO,RODRIGUES
	RTRUE	
?CCL72:	IN?	YABU,HERE \?CCL77
	PRINTI	"Quickly, Yabu moves in your way and the samurai surround you."""
	ICALL2	PRINTUNDER,STR?475
	PRINTR	", Anjin-san,"" Yabu says."
?CCL77:	PRINTR	"The samurai prevent you from climbing down."
?CCL67:	EQUAL?	PRSA,V?THROW \?CCL79
	EQUAL?	PRSO,YABU-KIMONO /?CCL79
	LOC	YABU
	EQUAL?	STACK,LEDGE-1,LEDGE-2,LEDGE-3 /?CTR78
	LOC	YABU
	EQUAL?	STACK,LEDGE-4 \?CCL79
?CTR78:	REMOVE	PRSO
	PRINTI	"You throw "
	ICALL1	THE-PRINT-PRSO
	PRINTI	" but "
	ICALL2	PRINT-HE/SHE,PRSO
	PRINTI	" fall"
	ICALL2	PRINT-PLURAL,PRSO
	PRINTI	" unnoticed into the water."
	FSET?	LEDGE,SCOREBIT \?CND85
	PRINTR	"The samurai murmur amongst themselves.Yabu has composed himself for death.It is extremely bad manners to disturb him, as they can see no way for him to climb the cliff."
?CND85:	CRLF	
	RTRUE	
?CCL79:	EQUAL?	PRSA,V?YELL,V?YELL-AT,V?ASK-FOR /?PRD90
	EQUAL?	PRSA,V?WAVE-AT,V?POINT,V?SHOW /?PRD90
	EQUAL?	PRSA,V?CLIMB-DOWN \FALSE
?PRD90:	EQUAL?	PRSO,FALSE-VALUE,YABU,LG-YABU /?PRD94
	EQUAL?	PRSO,LEDGE,SEARCH-PARTY,LG-RODRIGUES \FALSE
?PRD94:	EQUAL?	PRSI,FALSE-VALUE,SEARCH-PARTY \FALSE
	ZERO?	YABU-WARNED? \?CCL99
	FSET?	LEDGE,SCOREBIT /?CCL99
	GETP	YABU-KIMONO,P?COUNT
	LESS?	STACK,8 /?CCL99
	SET	'YABU-WARNED?,TRUE-VALUE
	GETP	SEARCH-PARTY,P?COUNT
	SUB	STACK,1
	PUTP	SEARCH-PARTY,P?COUNT,STACK
	ICALL2	DEQUEUE,I-YABU-CLIMBS
	SET	'YABU-CNT,0
	ICALL	QUEUE,I-YABU-RETURNS,-1
	PRINTI	"You shout, pointing at the ledge, pantomiming a man standing on it carrying a burden:  Yabu carrying Rodrigues, standing above the waves, if only you can get his attention somehow.The samurai talk rapidly to each other and then they too begin to shout.There is still no movement from Yabu.He seems like a stone.

One of the samurai speaks to the others briefly and they all nod and bow.He bows back.Then, with a sudden screaming shout of """
	ICALL2	PRINTUNDER,STR?476
	PRINTI	""" he casts himself off the cliff and falls to his death.Yabu comes violently out of his trance, whirls around and scrambles up.He follows the pointing fingers and shouts of his men and sees the ledge!Within seconds he has scrambled up to it, dragging the unconscious Rodrigues behind him."
	CRLF	
	CALL2	SCORE-OBJECT,SEARCH-PARTY
	RSTACK	
?CCL99:	PRINTR	"You point, screaming at the top of your lungs.The samurai stare at you, but there is no other result."


	.FUNCT	LEDGE-F:ANY:0:0
	EQUAL?	PRSA,V?FIND \?CCL3
	ZERO?	YABU-RESIGNED? /?CCL3
	PRINTI	"You stick your head out over the cliff edge as far as you dare, while the samurai hold your ankles for safety.You begin to search as you would at sea, quarter by quarter.Using every part of your vision but mostly the sides.A complete sweep.Nothing!

Once more.Nothing!

Again.What's that?Just above the tide line?Is it a crack in the cliff?You shift position.Now you can see better:  there is clearly a narrow ledge!"
	CRLF	
	CALL2	SCORE-OBJECT,LEDGE
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \FALSE
	ZERO?	YABU-RESIGNED? /FALSE
	FSET?	PRSO,SCOREBIT /?CCL12
	PRINTR	"It's nearly a foot wide and still just accessible, the rocks between it and Yabu just barely poking above the surf."
?CCL12:	PRINTR	"You don't see any ledges that would help Yabu."


	.FUNCT	AROUND-HEADLAND-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	ICALL1	SEARCH-PARTY-FOLLOWS
	CALL2	QUEUED?,I-SEARCH
	ZERO?	STACK \TRUE
	SET	'YABU-CNT,0
	ICALL	QUEUE,I-SEARCH,-1
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?FIND \?PRD12
	EQUAL?	PRSO,RODRIGUES,LG-RODRIGUES /?CCL10
?PRD12:	EQUAL?	PRSA,V?SEARCH \?PRD15
	EQUAL?	PRSO,GLOBAL-HERE /?CCL10
?PRD15:	EQUAL?	PRSA,V?LOOK-DOWN \FALSE
?CCL10:	PRINT	SEARCH-FORESHORE
	PRINT	STR?472
	PRINTR	"  You realize that if the body is beyond this point it is hidden or swallowed up or already carried out to sea."


	.FUNCT	I-SEARCH:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	YABU-CNT,2 \?CCL5
	CALL	BLACKTHORNE-DALLIES?,AROUND-HEADLAND,CLIFF-PATH
	ZERO?	STACK /?CND3
	RTRUE	
?CCL5:	EQUAL?	YABU-CNT,3 \?CCL9
	CALL	BLACKTHORNE-DALLIES?,CLIFF-PATH,ROCKY-SHORE
	ZERO?	STACK /?CND3
	RTRUE	
?CCL9:	EQUAL?	YABU-CNT,4 \?CND3
	CALL	BLACKTHORNE-DALLIES?,ROCKY-SHORE,PEBBLED-BEACH
	ZERO?	STACK \TRUE
?CND3:	SET	'DELAY-CNT,0
	INC	'YABU-CNT
	EQUAL?	YABU-CNT,1 \?CCL17
	GETP	SEARCH-PARTY,P?COUNT
	SUB	STACK,2
	PUTP	SEARCH-PARTY,P?COUNT,STACK
	CRLF	
	PRINTR	"Yabu motions to two of the samurai, who immediately bow and then lope off toward the fishing village."
?CCL17:	EQUAL?	YABU-CNT,2 \?CCL19
	CRLF	
	PRINTR	"Yabu wipes the rain off of his face, glances up at you, and motions for you to return to the galley."
?CCL19:	EQUAL?	YABU-CNT,3 \?CCL21
	CRLF	
	PRINTR	"Yabu takes a quick look around, anxious to return to the galley."
?CCL21:	EQUAL?	YABU-CNT,4 \?CCL23
	CRLF	
	PRINTR	"Yabu glances around impatiently, obviously anxious to return to the galley."
?CCL23:	EQUAL?	YABU-CNT,5 \FALSE
	ICALL2	DEQUEUE,I-SEARCH
	CRLF	
	PRINTI	"Quickly, Yabu orders you put in the skiff, and you are rowed back to the galley.You comply with ill grace, angry at your failure to find Rodrigues."
	CRLF	
	CRLF	
	CALL1	FAILED-SCENE
	RSTACK	


	.FUNCT	BLACKTHORNE-DALLIES?:ANY:2:2,RM,NRM
	IN?	BLACKTHORNE,RM \FALSE
	EQUAL?	DELAY-CNT,1,2 \?CCL6
	CRLF	
	PRINTI	"Yabu motions to you to return."""
	ICALL2	PRINTUNDER,STR?442
	PRINTR	""" he yells."
?CCL6:	EQUAL?	DELAY-CNT,3 \FALSE
	CRLF	
	PRINTI	"Yabu signals to the samurai, barks a few words in Japanese, and the samurai quickly subdue you and begin to carry you back."
	CRLF	
	CRLF	
	MOVE	YABU,NRM
	MOVE	SEARCH-PARTY,NRM
	ICALL2	GOTO,NRM
	RTRUE	


	.FUNCT	I-YABU-CLIMBS:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	YABU-CNT,6 \?CCL5
	ZERO?	YABU-WARNED? \?CND3
	LESS?	DELAY-CNT,5 \?CND3
	CRLF	
	PRINTR	"The tide is coming in fast, washing closer and closer to the rock Yabu is perched on!"
?CCL5:	EQUAL?	YABU-CNT,7 \?CND3
	ZERO?	YABU-WARNED? \?CND3
	LESS?	DELAY-CNT,5 \?CND3
	CRLF	
	PRINTR	"The tide is rising, more and more of Yabu's rock is covered."
?CND3:	SET	'DELAY-CNT,0
	INC	'YABU-CNT
	EQUAL?	YABU-CNT,1 \?CCL17
	GETP	SEARCH-PARTY,P?COUNT
	SUB	STACK,1
	PUTP	SEARCH-PARTY,P?COUNT,STACK
	ICALL2	TAKE-OFF,SLIPPERS
	ICALL2	TAKE-OFF,YABU-KIMONO
	ICALL2	TAKE-OFF,YABU-SWORDS
	CRLF	
	PRINTR	"The wind tears around you, whining off the cliff face.Yabu looks down, weighing the climb and the falling light, and you know Yabu is hooked.A samurai begins to climb down but Yabu orders him back.

Yabu gives orders to one of the samurai, pointing back toward the beach.The man runs off.

Yabu kicks off his thong slippers.He takes the swords out of his belt and puts them safely under cover.He barks some orders at one of the samurai, then takes off his soaking kimono, and clad only in his loincloth, goes to the cliff edge, testing it carefully with his toes and feet."
?CCL17:	EQUAL?	YABU-CNT,2 \?CCL19
	MOVE	YABU,LEDGE-2
	CALL2	MARGINAL-PIC,P-CLIFF
	ZERO?	STACK \?CND20
	CRLF	
?CND20:	PRINTR	"Yabu climbs down the side of the cliff with great skill.

Suddenly, Yabu slips!He grips an outcrop with his left hand, stopping his fall.He grinds his toes in a crevice, fighting for another hold, but his left hand rips away.His toes find a cleft and he hugs the cliff desperately.Then the toehold gives way!He falls the last twenty feet."
?CCL19:	EQUAL?	YABU-CNT,3 \?CCL23
	MOVE	YABU,LEDGE-3
	CRLF	
	PRINTR	"Yabu lands on his feet like a cat, and comes to rest in a wheezing ball.One ankle is twisted, but unbroken."
?CCL23:	EQUAL?	YABU-CNT,4 \?CCL25
	MOVE	YABU,LEDGE-4
	CRLF	
	PRINTI	"Yabu reaches Rodrigues, then shouts something."
	FSET?	RODRIGUES,DEAD \?CCL28
	PRINTI	"He shakes his head, confirming that Rodrigues has drowned."
	CRLF	
	ICALL1	FAILED-SCENE
	RETURN	M-FATAL
?CCL28:	GETP	SEARCH-PARTY,P?COUNT
	SUB	STACK,1
	PUTP	SEARCH-PARTY,P?COUNT,STACK
	PRINTR	"He is signalling that the pilot is still alive!One of the samurai runs off toward the galley to fetch a stretcher and a doctor.

Yabu pulls Rodrigues up onto the rocks, out of the surf."
?CCL25:	EQUAL?	YABU-CNT,5 \?CCL30
	SET	'YABU-RESIGNED?,TRUE-VALUE
	CRLF	
	PRINTR	"Yabu scrambles up and winces at a shaft of pain from his ankle.He manages to climb a few feet up, but then stops, his eyes searching the area diligently for a ledge or a crack within his reach.He sees no way to get further up the cliff."
?CCL30:	EQUAL?	YABU-CNT,6 \?CCL32
	CRLF	
	PRINTR	"Yabu looks out to sea, then looks up at you briefly.He composes himself and sits down on his rocky perch.With a sudden shock you realize that he has resigned himself to death."
?CCL32:	EQUAL?	YABU-CNT,7 \?CCL34
	CRLF	
	PRINTR	"The tide continues to rise."
?CCL34:	EQUAL?	YABU-CNT,8 \?CCL36
	CRLF	
	PRINTR	"The tide is now breaking over Yabu's rock.He does not move."
?CCL36:	EQUAL?	YABU-CNT,9 \FALSE
	ICALL2	DEQUEUE,I-YABU-CLIMBS
	CRLF	
	PRINTI	"A huge comber crashes over the rock.Yabu and Rodrigues are swept away.Rodrigues goes under almost immediately.Yabu cannot swim.He thrashes briefly then goes under and you see him no more.Your feelings are torn.You are glad to see the son of a whore die, but you respect his courage."
	CRLF	
	ICALL1	FAILED-SCENE
	RETURN	M-FATAL


	.FUNCT	YABU-KIMONO-F:ANY:0:0,ROPE?
	GETP	YABU-KIMONO,P?COUNT >ROPE?
	EQUAL?	PRSA,V?MAKE /?CND1
	ZERO?	ROPE? \?CND1
	CALL	NOUN-USED?,PRSO,W?ROPE
	ZERO?	STACK \?CCL6
	CALL	NOUN-USED?,PRSI,W?ROPE
	ZERO?	STACK /?CND1
?CCL6:	PRINTR	"You can't see any rope here."
?CND1:	EQUAL?	PRSA,V?RUB \?CCL11
	PRINTR	"It feels like silk."
?CCL11:	EQUAL?	PRSA,V?WEAR \?CCL13
	ZERO?	ROPE? \?CTR15
	FSET?	YABU-KIMONO,RMUNGBIT \?CCL16
?CTR15:	PRINTR	"The kimono is no longer in any condition to wear!"
?CCL16:	FSET?	CLOTHES,WEARBIT \?CCL20
	PRINTR	"You're already wearing your own clothes."
?CCL20:	FSET	YABU-KIMONO,WEARBIT
	PRINTR	"You put on Yabu's kimono.It doesn't fit very well."
?CCL13:	EQUAL?	PRSA,V?CLIMB-FOO,V?CLIMB-DOWN \?CCL22
	ZERO?	ROPE? /?CCL22
	ICALL2	DO-WALK,P?DOWN
	RTRUE	
?CCL22:	EQUAL?	PRSA,V?TEAR \?CCL26
	FSET?	YABU-KIMONO,WEARBIT \?CCL29
	CALL1	HAVE-TO-TAKE-OFF
	RSTACK	
?CCL29:	FSET?	YABU-KIMONO,RMUNGBIT /?CCL31
	FSET	YABU-KIMONO,RMUNGBIT
	PRINTR	"You tear the silk kimono into strips, testing them for strength.The silk is very strong."
?CCL31:	PRINTR	"If you tear the silk any more, it will be useless."
?CCL26:	EQUAL?	PRSA,V?TIE,V?MAKE \?CCL33
	EQUAL?	PRSO,YABU-KIMONO \?CCL33
	EQUAL?	PRSI,YABU-KIMONO,PARTY-KIMONO,FALSE-VALUE /?CTR32
	EQUAL?	PRSI,ROOMS \?CCL33
?CTR32:	FSET?	YABU-KIMONO,RMUNGBIT \?CCL41
	FSET?	YABU-KIMONO,SCOREBIT \?CCL44
	REMOVE	PARTY-KIMONO
	MOVE	LOINCLOTH,SEARCH-PARTY
	PUTP	YABU-KIMONO,P?SDESC,STR?480
	GETP	YABU-KIMONO,P?COUNT
	ADD	STACK,5
	PUTP	YABU-KIMONO,P?COUNT,STACK
	PRINTI	"You tie the strips together, making a rope.The samurai emulate you, removing their own kimonos and leaving them clad only in loincloths.You now have a rope of some length."
	CRLF	
	CALL2	SCORE-OBJECT,YABU-KIMONO
	RSTACK	
?CCL44:	PRINTR	"You have already made a rope of some length.All the kimonos are now part of it."
?CCL41:	FSET?	YABU-KIMONO,WEARBIT \?CCL46
	CALL1	HAVE-TO-TAKE-OFF
	RSTACK	
?CCL46:	PRINTR	"You have succeeded in tying the kimono in knots."
?CCL33:	EQUAL?	PRSA,V?UNTIE \?CCL48
	EQUAL?	PRSO,YABU-KIMONO \?CCL48
	FSET?	YABU-KIMONO,SCOREBIT \?CCL53
	PRINTR	"You haven't tied it yet."
?CCL53:	PRINTR	"Your knots are too tight to untie."
?CCL48:	EQUAL?	PRSA,V?GIVE \?CCL55
	EQUAL?	PRSO,YABU-KIMONO \?CCL55
	EQUAL?	PRSI,SEARCH-PARTY \?CCL55
	ZERO?	ROPE? /?CCL55
	ZERO?	ROPE-LOWERED? \?CCL62
	PRINTI	"You hand the rope over the samurai."
	CRLF	
	CRLF	
	MOVE	YABU-KIMONO,SEARCH-PARTY
	ICALL	PERFORM,V?LOWER,YABU-KIMONO
	RTRUE	
?CCL62:	PRINTR	"They already are holding the rope."
?CCL55:	EQUAL?	PRSA,V?TIE \?CCL64
	EQUAL?	PRSO,YABU-KIMONO \?CCL64
	ZERO?	ROPE? /?CCL64
	EQUAL?	PRSI,LG-CLIFF \?CCL70
	PRINTR	"There are no good places here to tie the rope.The rock is loose and crumbly with no really large boulders."
?CCL70:	EQUAL?	PRSI,SEARCH-PARTY \?CCL72
	PRINTR	"The samurai are more than strong enough to hold the rope without tying it to them."
?CCL72:	EQUAL?	PRSI,ME,CLOTHES \?CCL74
	PRINTR	"Tying the rope to yourself won't give enough leverage if Yabu ever reaches it."
?CCL74:	ZERO?	PRSI /FALSE
	PRINTI	"Tying the rope to "
	ICALL1	THE-PRINT-PRSI
	PRINTR	" isn't very helpful."
?CCL64:	EQUAL?	PRSA,V?LOWER /?CTR77
	EQUAL?	PRSA,V?THROW,V?GIVE,V?PUT \?CCL78
	EQUAL?	PRSI,LG-YABU,LG-CLIFF \?CCL78
?CTR77:	ZERO?	ROPE-LOWERED? /?CCL85
	PRINTR	"You can't lower the rope any further."
?CCL85:	ZERO?	ROPE? \?CCL87
	PRINTR	"You lower the kimono.It's nowhere long enough to reach Yabu."
?CCL87:	IN?	YABU-KIMONO,SEARCH-PARTY \?CCL90
	PRINTI	"You pantomime the action, and the samurai lower the rope towards Yabu."
	JUMP	?CND88
?CCL90:	IN?	YABU-KIMONO,WINNER \?CCL92
	PRINTI	"With the help of the samurai, you lower the rope towards Yabu."
?CND88:	SET	'ROPE-LOWERED?,TRUE-VALUE
	GETP	YABU-KIMONO,P?COUNT
	LESS?	STACK,8 \?CCL95
	PRINTR	"It's too short, about twenty feet too short."
?CCL92:	PRINTR	"No one has the rope."
?CCL95:	ZERO?	YABU-WARNED? \?CCL97
	PRINTR	"It's just a little short.If you could find some way for him to climb a little higher, just a few feet, he could reach the rope.But it's hopeless, even if there were a way, because he's sitting quietly, composed and waiting for death.The fool won't even pay attention, and the rest of the search party has given up too, believing he can't reach the rope, no matter what.Fools!There must be a way!"
?CCL97:	PRINTR	"It's inches too short, but stretching and scrambling just a little higher, Yabu reaches it!"
?CCL78:	EQUAL?	PRSA,V?RAISE,V?MOVE \FALSE
	ZERO?	ROPE-LOWERED? /?CCL102
	CALL2	QUEUED?,I-YABU-RETURNS
	ZERO?	STACK /?CCL105
	PRINTR	"With Yabu clinging to it, you can't raise it."
?CCL105:	SET	'ROPE-LOWERED?,FALSE-VALUE
	IN?	YABU-KIMONO,SEARCH-PARTY \?CCL108
	PRINTR	"You signal the search party, and they raise the rope."
?CCL108:	IN?	YABU-KIMONO,WINNER \?CCL110
	PRINTR	"You raise the rope."
?CCL110:	PRINTR	"No one is holding the rope."
?CCL102:	ZERO?	ROPE? \?CCL112
	PRINTR	"You lift the kimono."
?CCL112:	PRINT	STR?131
	CRLF	
	RTRUE	


	.FUNCT	LOINCLOTH-F:ANY:0:0
	EQUAL?	PRSA,V?POINT,V?TAKE /?CCL3
	EQUAL?	PRSA,V?TIE \?PRD6
	EQUAL?	PRSO,LOINCLOTH \?PRD6
	EQUAL?	PRSI,YABU-KIMONO /?CCL3
?PRD6:	EQUAL?	PRSA,V?TIE \FALSE
	EQUAL?	PRSO,YABU-KIMONO \FALSE
	EQUAL?	PRSI,LOINCLOTH \FALSE
?CCL3:	REMOVE	LOINCLOTH
	PUTP	YABU-KIMONO,P?COUNT,8
	PRINTI	"You point to the loincloths, and the samurai immediately understand.They remove them and tie them together, adding them to the rope.It is now significantly longer."
	ZERO?	ROPE-LOWERED? /?CND13
	PRINTI	"The rope now reaches almost to Yabu.If he could just "
	CALL2	QUEUED?,I-YABU-RETURNS
	ZERO?	STACK /?CCL17
	PRINTI	"stretch"
	JUMP	?CND15
?CCL17:	PRINTI	"climb a little higher"
?CND15:	PRINTI	", he might be able to reach it."
?CND13:	CRLF	
	CALL2	SCORE-OBJECT,LOINCLOTH
	RSTACK	


	.FUNCT	YABU-SWORDS-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE,V?THROW,V?USE \FALSE
	PRINTR	"The samurai won't let you take Yabu's swords.A samurai's swords are his most precious possession."


	.FUNCT	I-YABU-RETURNS:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	YABU-CNT,1 \?CND3
	ZERO?	ROPE-LOWERED? \?CCL7
	GRTR?	DELAY-CNT,2 \?CCL10
	SET	'ROPE-LOWERED?,TRUE-VALUE
	CRLF	
	PRINTR	"The samurai lower the rope to Yabu."
?CCL10:	CRLF	
	PRINTR	"The rope isn't lowered!Yabu can't reach it, even from the ledge."
?CCL7:	GETP	YABU-KIMONO,P?COUNT
	LESS?	STACK,8 \?CND3
	CRLF	
	PRINTR	"Yabu reaches for the rope, but it's twenty feet short."
?CND3:	SET	'DELAY-CNT,0
	INC	'YABU-CNT
	EQUAL?	YABU-CNT,1 \?CCL14
	CRLF	
	PRINTR	"Yabu staggers up.He half slides, half crawls, dragging the unconscious Rodrigues with him through the surf-disturbed shallows to the bottom of the cliff.He finds the ledge.It's barely a foot wide.Painfully he shoves Rodrigues onto it, almost losing him once, then hauls himself up."
?CCL14:	EQUAL?	YABU-CNT,2 \?CCL16
	MOVE	YABU,LEDGE-3
	MOVE	RODRIGUES,LEDGE-3
	CRLF	
	PRINTR	"Yabu stretches for the rope, pulling himself partway up the cliff, carrying Rodrigues.Twice he loses the pilot, but each time Yabu drags him back.His position is precarious, but you can see that the bottom of the cliff is now completely under water."
?CCL16:	EQUAL?	YABU-CNT,3 \FALSE
	MOVE	YABU,GENERIC-OBJECTS
	MOVE	RODRIGUES,GENERIC-OBJECTS
	CRLF	
	PRINTI	"For almost an hour Yabu sets himself against the sea and against his failing body, and then, in the dusk, he reaches a wide ledge where he's safe from the sea and he can rest and not hang from the makeshift, fraying rope.

Just then, the samurai Yabu sent to the galley returns with coils of strong rope.They make a cradle and shin down the cliff with a skill that you have never seen ashore.Quickly Rodrigues is brought aloft, and then Yabu.You look at him.

""Thank you,"" you say finally, pointing at Rodrigues.""Thank you, Yabu-san.""You bow.That's for your courage, you black-eyed son of a whore.

Yabu bows back, stiffly.But inside, he smiles."
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	VOYAGE-AFTER-F:ANY:0:0
	PRINTR	"The rest of the voyage to Osaka is uneventful.

Rodrigues is tended by a Japanese doctor with strange ideas, such as keeping the air in the cabin fresh, but begins to recover anyway.

""Ah, Ingeles,"" he sighs.""If I live, it is because of a heretic and a Japman.""Then he turns serious.""Japan's an upside-down world.They have a saying, that a man has a false heart in his mouth for all the world to see, another in his breast to show his very special friends and family, and the real one, the true one, the secret one, which is never known to anyone except himself alone.So never forget they're six-faced and have three hearts!"""

	.ENDSEG

	.ENDI
