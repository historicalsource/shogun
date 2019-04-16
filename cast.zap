
	.SEGMENT "0"


	.FUNCT	NEW-SDESC:ANY:2:3,OBJ,STR,IMPROPER?
	ZERO?	IMPROPER? /?CCL3
	FSET	OBJ,THE
	FCLEAR	OBJ,NOTHEBIT
	FCLEAR	OBJ,NOABIT
	JUMP	?CND1
?CCL3:	FCLEAR	OBJ,THE
	FSET	OBJ,NOTHEBIT
	FSET	OBJ,NOABIT
?CND1:	PUTP	OBJ,P?SDESC,STR
	RTRUE	


	.FUNCT	YABU-WAKARIMASEN:ANY:0:0
	PRINTC	34
	ICALL2	PRINTUNDER,STR?241
	PRINTR	","" Yabu replies gruffly."


	.FUNCT	WAKARIMASEN:ANY:0:0
	EQUAL?	PRSA,V?KONNICHI-WA \?PRD5
	EQUAL?	PRSO,ROOMS /?CTR2
?PRD5:	EQUAL?	PRSA,V?KONBANWA \?CCL3
?CTR2:	PRINTC	34
	ICALL2	PRINTUNDER,STR?242
	PRINTI	","" "
	ICALL2	THE-PRINT,WINNER
	PRINTR	" answers politely."
?CCL3:	EQUAL?	PRSA,V?NIHON-GO-GA \?CCL9
	EQUAL?	PRSO,HANASE-MASEN \?CCL9
	ICALL2	CTHE-PRINT,WINNER
	PRINTR	" seems to understand, but is at a loss what to say next."
?CCL9:	CALL1	JAPANESE-VERB?
	ZERO?	STACK /?CCL13
	ICALL2	CTHE-PRINT,WINNER
	PRINTR	" seems impressed that you know some Japanese, but apparently isn't sure what you are getting at."
?CCL13:	PRINTC	34
	ICALL2	PRINTUNDER,STR?243
	PRINTI	""""
	ICALL2	CTHE-PRINT,WINNER
	PRINTR	" doesn't appear to understand you."


	.FUNCT	GENERIC-PILOT-F:ANY:2:2,R,F
	EQUAL?	SCENE,S-RODRIGUES \?CCL3
	RETURN	RODRIGUES
?CCL3:	RETURN	BLACKTHORNE


	.FUNCT	BLACKTHORNE-F:ANY:0:1,RARG
	EQUAL?	RARG,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?BE,V?BE? \?CCL6
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL6
	EQUAL?	PRSI,BLACKTHORNE \?CCL11
	PRINTR	"That's correct."
?CCL11:	EQUAL?	PRSI,ENGLISH \FALSE
	PRINTR	"That's right, although your mother was Dutch."
?CCL6:	EQUAL?	PRSA,V?BE?,V?BE,V?WHERE /FALSE
	EQUAL?	PRSA,V?HOW /FALSE
	EQUAL?	PRSO,BLACKTHORNE \FALSE
	ICALL	PERFORM,PRSA,ME,PRSI
	RTRUE	
?CCL3:	EQUAL?	RARG,M-WINNER \FALSE
	FSET?	BLACKTHORNE,SITTING \?CCL24
	CALL1	MOTION-VERB?
	ZERO?	STACK \?PRD27
	EQUAL?	PRSA,V?STAND /?PRD27
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?PRD31
	ZERO?	OPPONENT /?PRD31
	EQUAL?	OPPONENT,PRSO,PRSI /?PRD27
?PRD31:	EQUAL?	PRSA,V?OPEN,V?CLOSE \?CCL24
	FSET?	PRSO,DOORBIT \?CCL24
?PRD27:	CALL1	PAST-TENSE?
	ZERO?	STACK \?CCL24
	EQUAL?	HERE,MURA-HOUSE /FALSE
	LOC	WINNER
	FSET?	STACK,VEHBIT /FALSE
	EQUAL?	SCENE,S-NINJA \?CCL43
	FSET?	MARIKO,RMUNGBIT \?CCL43
	IN?	YABU,SECRET-REDOUBT /?CCL48
	PRINTR	"You are too shaken to stand."
?CCL48:	ICALL1	B-STAND
	FCLEAR	BLACKTHORNE,RMUNGBIT
	PRINTR	"You lurch up, Yabu helping you, and painfully approach Mariko."
?CCL43:	EQUAL?	SCENE,S-TORANAGA /FALSE
	EQUAL?	SCENE,S-QUAKE \?CCL52
	ZERO?	QUAKE? \FALSE
	CALL2	QUEUED?,I-CRAWL
	ZERO?	STACK \FALSE
?CCL52:	ICALL1	B-STAND
	PRINTI	"You stand up"
	EQUAL?	PRSA,V?STAND /?CTR58
	EQUAL?	PRSA,V?WALK \?CCL59
	EQUAL?	P-WALK-DIR,P?UP \?CCL59
?CTR58:	PRINTR	"."
?CCL59:	PRINTR	" first."
?CCL24:	FSET?	WINNER,RMUNGBIT \FALSE
	EQUAL?	SCENE,S-NINJA \FALSE
	CALL1	GAME-VERB?
	ZERO?	STACK \FALSE
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \?CCL72
	EQUAL?	PRSO,MARIKO /?CTR71
	EQUAL?	PRSI,MARIKO \?CCL72
?CTR71:	CALL2	YOULL-HAVE-TO,STR?244
	RSTACK	
?CCL72:	CALL1	PASSIVE-VERB?
	ZERO?	STACK \FALSE
	PRINTR	"The explosion has left you too dazed to do anything."


	.FUNCT	I-DONT-KNOW?:ANY:0:0
	EQUAL?	PRSA,V?KNOW \FALSE
	EQUAL?	PRSS,ME \FALSE
	EQUAL?	PRSQ,V?DO? \FALSE
	GET	PARSE-RESULT,16
	BTST	STACK,PARSE-QUESTION /FALSE
	GET	PARSE-RESULT,16
	BTST	STACK,PARSE-NOT /TRUE
	RFALSE	


	.FUNCT	BOOTS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	EQUAL?	SCENE,S-ERASMUS \?CCL6
	PRINTR	"They are salt-encrusted and worn."
?CCL6:	PRINTR	"They have been cleaned and shined."
?CCL3:	EQUAL?	PRSA,V?LOOK-INSIDE,V?SMELL \?CCL8
	PRINTR	"They are the same boots you've been wearing for two years now.Let's just say they aren't in perfect condition any more."
?CCL8:	EQUAL?	PRSA,V?TAKE-OFF \?CCL10
	FSET?	BOOTS,WEARBIT \?CCL10
	EQUAL?	SCENE,S-ERASMUS \FALSE
	PRINTR	"You'd be crazy to remove your boots in this weather!"
?CCL10:	EQUAL?	PRSA,V?WEAR \FALSE
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL20
	CALL1	ITAKE
	EQUAL?	STACK,TRUE-VALUE \TRUE
?CCL20:	FSET?	BOOTS,WEARBIT /FALSE
	FSET	BOOTS,WEARBIT
	PRINTR	"You put on your boots."


	.FUNCT	CLOTHES-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	EQUAL?	SCENE,S-ERASMUS \?CCL6
	PRINTR	"They are filthy, torn, and wet."
?CCL6:	FSET?	CLOTHES,TOUCHBIT /FALSE
	PRINTR	"They are in a neat pile, washed and pressed and mended with tiny, exquisite stitching.But your knife is gone, and so are your keys.Your boots are nowhere to be found.Worst of all, there is no sign of your precious rutters!"
?CCL3:	EQUAL?	PRSA,V?TAKE \?CCL10
	EQUAL?	SCENE,S-ANJIRO \FALSE
	GETP	WINNER,P?HEALTH
	LESS?	STACK,3 \FALSE
	ICALL	QUEUE,I-COLLAPSE,4
	PRINTR	"You are still too weak to stand and go over to the clothes."
?CCL10:	EQUAL?	PRSA,V?WEAR \?CCL17
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL20
	GETP	WINNER,P?HEALTH
	LESS?	STACK,3 \?CCL20
	ICALL	PERFORM,V?TAKE,CLOTHES
	RTRUE	
?CCL20:	FSET?	CLOTHES,WEARBIT /FALSE
	IN?	CLOTHES,WINNER /?CCL24
	CALL1	ITAKE
	ZERO?	STACK /FALSE
?CCL24:	FSET	CLOTHES,WEARBIT
	PRINTI	"You "
	IN?	WINNER,QUILT \?CND29
	MOVE	WINNER,HERE
?CND29:	FSET?	BLACKTHORNE,SITTING \?CND31
	ICALL1	B-STAND
	PRINTI	"stand shakily and "
?CND31:	PRINTI	"put on your clothes"
	CALL2	HELD?,BOOTS
	ZERO?	STACK \?CND33
	PRINTI	", feeling strange without your boots"
?CND33:	PRINTR	"."
?CCL17:	EQUAL?	PRSA,V?TAKE-OFF \?CCL36
	EQUAL?	SCENE,S-ERASMUS \?CCL39
	PRINTR	"You would freeze, or at least take a terrible chill."
?CCL39:	FSET?	BOOTS,WEARBIT \?CCL41
	CALL2	YOULL-HAVE-TO,STR?246
	RSTACK	
?CCL41:	EQUAL?	PRSA,V?TAKE-OFF \?CCL43
	CALL1	FORMAL-SCENE?
	ZERO?	STACK /?CCL43
	PRINTR	"You would expose yourself to ridicule."
?CCL43:	FCLEAR	CLOTHES,WEARBIT
	PRINTR	"You remove your clothes."
?CCL36:	EQUAL?	PRSA,V?TEAR \FALSE
	EQUAL?	SCENE,S-ERASMUS \?CCL50
	PRINTR	"You are in desperate straits, but rending your garments seems like an odd reaction."
?CCL50:	PRINTR	"Your clothes are thick, strong European fabrics and don't tear at all easily."


	.FUNCT	KIMONO-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE-OFF \?CCL3
	CALL1	FORMAL-SCENE?
	ZERO?	STACK /?CCL3
	PRINTR	"You would expose yourself to ridicule."
?CCL3:	EQUAL?	PRSA,V?WEAR \?CCL7
	CALL	NOUN-USED?,PRSO,W?CLOTHES
	ZERO?	STACK /?CCL7
	FSET?	PRSO,RMUNGBIT /?CCL7
	ICALL2	PERFORM,V?DRESS
	RTRUE	
?CCL7:	EQUAL?	PRSA,V?TAKE-OFF \?CCL12
	CALL	NOUN-USED?,PRSO,W?CLOTHES
	ZERO?	STACK /?CCL12
	FSET?	PRSO,RMUNGBIT /?CCL12
	ICALL2	PERFORM,V?STRIP
	RTRUE	
?CCL12:	EQUAL?	PRSA,V?TEAR \FALSE
	PRINTR	"Your kimono would tear easily, but it would be silly to do so."


	.FUNCT	SOCKS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"These are tabi socks.They are different from European socks in that there is a notch for the thong of a sandal.They remind you of mittens."
?CCL3:	EQUAL?	PRSA,V?TAKE-OFF,V?WEAR \FALSE
	FSET?	SANDALS,WEARBIT \FALSE
	CALL2	HAVE-TO-TAKE-OFF,SANDALS
	RSTACK	


	.FUNCT	SWORDS-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET?	SWORDS,RMUNGBIT \?CCL6
	FCLEAR	SWORDS,RMUNGBIT
	FSET	SWORDS,SCOREBIT
	ICALL2	SCORE-OBJECT,SWORDS
	PRINTR	"You quickly check your sword belt.It's loose, almost ready to fall off!What a stroke of luck you checked it!How embarrassing if it had fallen off!"
?CCL6:	PRINTI	"You have a pair of samurai swords, one the long killing sword"
	GRTR?	SCENE,S-QUAKE \?CND7
	PRINTI	" named 'Oil Seller'"
?CND7:	PRINTR	", and the other the shorter stabbing sword."
?CCL3:	EQUAL?	PRSA,V?WHO,V?WHAT \?CCL10
	CALL	NOUN-USED?,PRSO,W?SELLER
	ZERO?	STACK /?CCL10
	PRINTR	"The name comes from an experience you would rather forget.One day hunting with Toranaga, your path had been blocked by a weather-beaten old oil seller.Cursing, you commanded him to move, and he cursed you back.Toranaga pointed to one of his bodyguards, asked you to give him your sword, and before you realized what was happening, the samurai lunged at the peddler.He walked on a pace before falling, divided in two at the waist.Toranaga suggested you call your sword 'Oil Seller' in honor of the incident.""Your sword has now become legend."""
?CCL10:	EQUAL?	PRSA,V?WEAR \?CCL14
	FSET?	PRSO,WEARBIT /?CCL17
	FSET	PRSO,WEARBIT
	PRINTR	"You shove the sword into your sash."
?CCL17:	PRINTR	"The sword is already in your sash."
?CCL14:	EQUAL?	PRSA,V?TAKE \?CCL19
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL19
	CALL1	ITAKE
	EQUAL?	STACK,TRUE-VALUE \TRUE
	FSET	SWORDS,WEARBIT
	PRINTR	"You take the sword and shove it into your sash."
?CCL19:	EQUAL?	PRSA,V?DRAW,V?PICK,V?USE /?PRD30
	EQUAL?	PRSA,V?TAKE \?PRD28
?PRD30:	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL26
?PRD28:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,HANDS \FALSE
?CCL26:	FSET?	PRSO,WEARBIT \?CCL37
	FCLEAR	PRSO,WEARBIT
	PRINTR	"Your skill with the sword is not great, but you are now as ready as you will ever be!"
?CCL37:	PRINTR	"You've already drawn your sword."


	.FUNCT	SEBASTIO-F:ANY:0:1,RARG,OW
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?HELP \?CCL8
	EQUAL?	PRSO,ME \?CCL8
	PRINTR	"""Ah, help!""he says with icy contempt.""Help a heretic pirate!"""
?CCL8:	EQUAL?	PRSA,V?HELLO \?CCL12
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" ignores your greeting."
?CCL12:	EQUAL?	PRSA,V?FIND \?CCL14
	EQUAL?	PRSO,ME,THIS \?CCL14
	ZERO?	YABU-QUESTION /?CCL19
	CALL1	SPEAK-ONLY-TO-YABU
	RSTACK	
?CCL19:	PRINTR	"""The Japans, pirate."" the priest says angrily."
?CCL14:	EQUAL?	PRSA,V?BE \?CCL21
	EQUAL?	PRSO,THIS \?CCL21
	EQUAL?	PRSI,JAPAN \?CCL21
	ZERO?	YABU-QUESTION /?CCL27
	CALL1	SPEAK-ONLY-TO-YABU
	RSTACK	
?CCL27:	PRINTR	"""Yes, Japan.Nippon,"" the priest says impatiently."
?CCL21:	EQUAL?	PRSA,V?WHO \?CCL29
	EQUAL?	PRSO,YOU \?CCL32
	ZERO?	YABU-QUESTION /?CCL35
	CALL1	SPEAK-ONLY-TO-YABU
	RSTACK	
?CCL35:	ICALL	NEW-SDESC,SEBASTIO,STR?248
	PRINTR	"""Father Sebastio.I'm from Portugal.I'm a Jesuit."""
?CCL32:	EQUAL?	PRSO,YABU,GLOBAL-DAIMYO \?CCL37
	CALL	NOUN-USED?,PRSO,W?DAIMYO
	ZERO?	STACK /?CCL37
	PRINTI	"""The "
	ICALL2	PRINTUNDER,STR?82
	PRINTI	" is Kasigi Yabu."
	PRINT	STR?249
	CRLF	
	RTRUE	
?CCL37:	EQUAL?	PRSO,OMI \?CCL41
	ZERO?	YABU-QUESTION /?CCL44
	CALL1	SPEAK-ONLY-TO-YABU
	RSTACK	
?CCL44:	PRINTC	34
	FSET?	OMI,NOTHEBIT /?CND45
	PRINTI	"Who told you about Kasigi Omi-san?"
?CND45:	PRINTR	"Kasigi Omi-san is the samurai in charge of this village.He is the Lord Yabu's nephew."""
?CCL41:	EQUAL?	PRSO,MURA \?CCL48
	ZERO?	YABU-QUESTION /?CCL51
	CALL1	SPEAK-ONLY-TO-YABU
	RSTACK	
?CCL51:	PRINTR	"""He is the headman of this village.He, at least, is a good Christian."""
?CCL48:	PRINT	STR?250
	CRLF	
	RTRUE	
?CCL29:	EQUAL?	PRSA,V?WHAT \?CCL53
	EQUAL?	PRSO,YOU \?CCL56
	ICALL	PERFORM,V?WHO,YOU
	RTRUE	
?CCL56:	EQUAL?	PRSO,GLOBAL-DAIMYO,YABU \?CCL58
	CALL	NOUN-USED?,PRSO,W?DAIMYO
	ZERO?	STACK /?CCL61
	PRINTI	"""The "
	ICALL2	PRINTUNDER,STR?82
	PRINTI	" is a feudal lord."
	PRINT	STR?249
	CRLF	
	RTRUE	
?CCL61:	PRINTI	"""Who told you about "
	ICALL2	DPRINT,YABU
	PRINTR	"?"""
?CCL58:	EQUAL?	PRSO,GLOBAL-SAMURAI \?CCL63
	PRINTR	"""Warriors -- soldiers -- members of the warrior caste."""
?CCL63:	PRINT	STR?250
	CRLF	
	RTRUE	
?CCL53:	ZERO?	OMI-QUESTION /?CCL65
	SET	'OW,WINNER
	SET	'WINNER,OMI
	ICALL	PERFORM,PRSA,PRSO,PRSI
	SET	'WINNER,OW
	RTRUE	
?CCL65:	ZERO?	YABU-QUESTION /?CCL67
	EQUAL?	PRSA,V?TRANSLATE \?CCL70
	PRINTI	"You harden your voice."""
	ICALL2	PRINTUNDER,STR?251
	PRINTI	"  First translate what I said.Now!""The priest reddens, and you see that the exchange has not gone unnoticed by the "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	"."
?CCL70:	SET	'OW,WINNER
	SET	'WINNER,YABU
	ICALL	PERFORM,PRSA,PRSO,PRSI
	SET	'WINNER,OW
	RTRUE	
?CCL67:	EQUAL?	PRSA,V?TRANSLATE \?CCL72
	PRINTR	"""It's not your place to command me, heretic!"""
?CCL72:	EQUAL?	PRSA,V?BE \?CCL74
	EQUAL?	PRSO,ME \?CCL74
	EQUAL?	PRSI,HERETIC,PIRATE \?CCL79
	CALL1	P-NEGATIVE?
	ZERO?	STACK /?CCL79
	PRINTR	"""Liar!"" storms the priest."
?CCL79:	EQUAL?	PRSI,BLACKTHORNE \?CCL83
	PRINTR	"He doesn't seem to have heard of you before."
?CCL83:	PRINTR	"""I'll know who and what you are soon enough!"""
?CCL74:	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" looks at you with contempt."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL85
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTI	" is a short, thick man with dark hair and a long beard.His robe is travel-stained and his boots are besmirched with mud.He is obviously a Portuguese or Spanish priest, and though his flowing robe is orange, there is no mistaking the "
	IN?	SEBASTIO-CRUCIFIX,PRSO \?CND86
	PRINTI	"crucifix and "
?CND86:	PRINTR	"rosary at his belt, or the cold hostility on his face."
?CCL85:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL89
	EQUAL?	PRSO,SEBASTIO \?CCL89
	EQUAL?	PRSI,STRAIT-OF-MAGELLAN \?CCL89
	EQUAL?	YABU-QUESTION,4 \?CCL89
	ICALL	PERFORM,PRSA,YABU,PRSI
	RTRUE	
?CCL89:	EQUAL?	PRSA,V?ANSWER,V?REPLY \?CCL95
	PRINTI	"""That's no response, pirate!"" rages "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTR	"."
?CCL95:	EQUAL?	PRSA,V?BOW \?CCL97
	PRINTR	"""You learn fast, pirate!"" he says, surprised, but he doesn't return your bow."
?CCL97:	EQUAL?	PRSA,V?THROW \?CCL99
	EQUAL?	PRSO,SEBASTIO-CRUCIFIX \?CCL99
	EQUAL?	PRSI,SEBASTIO /FALSE
?CCL99:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	PRINTI	"You "
	FSET?	BLACKTHORNE,SITTING \?CND105
	ICALL1	B-STAND
	PRINTI	"storm to your feet, "
?CND105:	EQUAL?	PRSA,V?THROW \?CCL109
	MOVE	PRSO,HERE
	PRINTI	"throw "
	ICALL1	THE-PRINT-PRSO
	PRINTI	" at"
	JUMP	?CND107
?CCL109:	EQUAL?	PRSA,V?SPIT \?CCL111
	PRINTI	"spit at"
	JUMP	?CND107
?CCL111:	EQUAL?	PRSA,V?KICK \?CCL113
	PRINTI	"kick"
	JUMP	?CND107
?CCL113:	EQUAL?	PRSA,V?PISS \?CCL115
	PRINTI	"piss on"
	JUMP	?CND107
?CCL115:	PRINTI	"strike"
?CND107:	PRINTC	32
	ICALL2	THE-PRINT,SEBASTIO
	PRINTI	", and he curses at you but turns the other cheek."
	CRLF	
	IN?	OMI,HERE \TRUE
	IN?	YABU,HERE \TRUE
	ICALL	QUEUE,I-BOW?,2
	CRLF	
	PRINTR	"Omi and Yabu look at each other in surprise."


	.FUNCT	OMI-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?PISS,V?CURSE,V?FUCK /?CTR7
	EQUAL?	PRSA,V?NO,V?IYE \?CCL8
	CALL2	QUEUED?,I-TAKE-CROOCQ
	ZERO?	STACK /?CCL8
?CTR7:	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?CURSE,OMI
	RTRUE	
?CCL8:	CALL1	QUESTION-VERB?
	ZERO?	STACK \?CTR13
	EQUAL?	PRSA,V?ASK-ABOUT,V?TELL-ME-ABOUT \?CCL14
?CTR13:	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" snaps, ""You're to answer questions, not ask them.""He says something to the samurai, who scowls."
?CCL14:	ZERO?	OMI-QUESTION /?CCL18
	CALL1	I-DONT-KNOW?
	ZERO?	STACK /?CCL18
	PRINTI	"""Liar!"" screams "
	ICALL2	THE-PRINT,SEBASTIO
	PRINTR	".""They use torture here.They can find out anything!"""
?CCL18:	EQUAL?	OMI-QUESTION,1 \?CCL22
	EQUAL?	PRSA,V?BE \?CCL22
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL22
	ZERO?	PRSI /?CCL22
	CALL1	ENGLISH?
	ZERO?	STACK \?PRD31
	CALL1	DUTCH?
	ZERO?	STACK /?CCL29
?PRD31:	CALL1	P-NEGATIVE?
	ZERO?	STACK \?CCL29
	SET	'QCONTEXT,FALSE-VALUE
	SET	'OMI-QUESTION,0
	ICALL2	CTHE-PRINT,SEBASTIO
	CALL1	ENGLISH?
	ZERO?	STACK /?CCL36
	PRINTI	" steps back as though struck.""English!England"
	JUMP	?CND34
?CCL36:	PRINTI	" nods suspiciously.""Dutch!Holland"
?CND34:	PRINTR	"!""He begins to explain to Omi but the samurai cuts him short."
?CCL29:	ICALL2	SETUP-ANSWER,STR?254
	ICALL1	SEBASTIO-SCREAMS
	EQUAL?	PRSI,BLACKTHORNE \?CCL39
	PRINTR	"I want to know your nationality, not your name, heretic!"""
?CCL39:	PRINTR	"I know you aren't what you say you are!"""
?CCL22:	EQUAL?	OMI-QUESTION,2 \?CCL41
	EQUAL?	PRSA,V?BE \?PRD45
	EQUAL?	PRSO,BLACKTHORNE,ME \?PRD45
	EQUAL?	PRSI,INTPP /?CTR40
?PRD45:	EQUAL?	PRSA,V?COME-FROM \?CCL41
?CTR40:	EQUAL?	PRSA,V?COME-FROM \?PRD53
	EQUAL?	PRSO,HOLLAND /?CTR50
?PRD53:	CALL	PP?,W?FROM,HOLLAND
	ZERO?	STACK /?CCL51
?CTR50:	SET	'QCONTEXT,FALSE-VALUE
	SET	'OMI-QUESTION,0
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	"'s anger is obvious.""A Dutch pirate ship!"" he gasps.He says something haltingly to Omi-san."
?CCL51:	ICALL1	SEBASTIO-SCREAMS
	PRINTR	"That's a Dutch pirate ship!Admit you're a heretic, murdering Dutchman!"""
?CCL41:	EQUAL?	OMI-QUESTION,3 \?CCL57
	EQUAL?	PRSA,V?YES,V?NO,V?IYE /?CTR56
	EQUAL?	PRSA,V?BE,V?HAI \?CCL57
?CTR56:	EQUAL?	PRSA,V?YES,V?HAI /?CTR63
	EQUAL?	PRSA,V?BE \?CCL64
	EQUAL?	PRSO,BLACKTHORNE,ME \?CCL64
	EQUAL?	PRSI,LEADER \?CCL64
	CALL1	P-NEGATIVE?
	ZERO?	STACK \?CCL64
?CTR63:	SET	'QCONTEXT,FALSE-VALUE
	SET	'OMI-QUESTION,0
	SET	'ORPHAN-ANSWER,FALSE-VALUE
	ICALL2	CTHE-PRINT,SEBASTIO
	EQUAL?	PRSA,V?HAI \?CCL73
	PRINTI	" looks surprised at your knowledge of Japanese, and speaks rapidly and excitedly to Omi."
	CRLF	
	JUMP	?CND71
?CCL73:	PRINTI	" translates for Omi, still digesting what you have told him."
	CRLF	
?CND71:	CALL2	SCORE-OBJECT,OMI
	RSTACK	
?CCL64:	ICALL2	SETUP-ANSWER,STR?254
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" screams, ""Coward, I know you're the leader!The villagers have already told me so!"""
?CCL57:	ZERO?	OMI-QUESTION /?CCL75
	EQUAL?	PRSA,V?SAY,V?REPLY \?CCL78
	ICALL	PERFORM,V?BE,ME,PRSO
	RTRUE	
?CCL78:	ICALL2	CTHE-PRINT,OMI
	PRINTR	" doesn't respond, but the priest says, ""You'd better learn to be polite -- and find some manners quickly.Here they don't tolerate lack of manners.""His voice edges.""Hurry up and answer!"""
?CCL75:	EQUAL?	PRSA,V?STOP \?CCL80
	ZERO?	ANSWER-HAI? \?CCL80
	EQUAL?	HERE,VILLAGE-SQUARE \?CCL80
	CALL2	QUEUED?,I-TAKE-CROOCQ
	ZERO?	STACK /?CCL80
	SET	'QCONTEXT,OMI
	PRINTR	"""Omi-san says, you agree to behave?You will obey all orders?"""
?CCL80:	EQUAL?	PRSA,V?HAI,V?YES \?CCL86
	ZERO?	ANSWER-HAI? \?CCL86
	EQUAL?	HERE,VILLAGE-SQUARE \?CCL86
	CALL2	QUEUED?,I-TAKE-CROOCQ
	ZERO?	STACK /?CCL86
	EQUAL?	PRSA,V?YES \?CCL93
	PRINTI	"""You must speak to him in Japanese, heretic!You must say 'hai.'"""
	ICALL2	DPRINT,SEBASTIO
	PRINTR	" is sweating and nervous."
?CCL93:	SET	'ANSWER-HAI?,TRUE-VALUE
	SET	'DELAY-CNT,0
	ICALL2	THIS-IS-IT,ORDERS
	PRINTI	"""Omi-san says, lie down.Immediately."""
	CRLF	
	CALL2	SCORE-OBJECT,VILLAGE-SQUARE
	RSTACK	
?CCL86:	ICALL2	CTHE-PRINT,OMI
	PRINTR	" ignores you, for now."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL95
	PRINTR	"The young man is a head shorter and much younger than you, his handsome face slightly pockmarked though.He wears breeches and clogs and a light kimono with two scabbarded swords stuck into the belt.One is daggerlike, the other, a two-handed killing sword, is long and slightly curved."
?CCL95:	EQUAL?	PRSA,V?WHO \?CCL97
	ICALL2	CTHE-PRINT,OMI
	PRINTR	" is an ambitious young man.He serves his masters well, but himself better."
?CCL97:	EQUAL?	PRSA,V?THANK \?CCL99
	IN?	SEBASTIO,HERE \?CCL102
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTR	" translates.Omi seems pleased by your politeness."
?CCL102:	PRINTR	"Omi responds with a curt bow, and says ""Domo."""
?CCL99:	EQUAL?	PRSA,V?PISS,V?CURSE,V?FUCK /?CTR103
	EQUAL?	PRSA,V?NO,V?IYE /?PRD108
	CALL1	HOSTILE-VERB?
	ZERO?	STACK /?CCL104
?PRD108:	CALL2	QUEUED?,I-TAKE-CROOCQ
	ZERO?	STACK /?CCL104
?CTR103:	EQUAL?	SCENE,S-PIT \FALSE
	CALL1	CURSE-OMI
	RSTACK	
?CCL104:	CALL1	HOSTILE-VERB?
	ZERO?	STACK \?CCL115
	EQUAL?	PRSA,V?STOP \FALSE
?CCL115:	CALL2	REMOVES-YOUR-HEAD,OMI
	RSTACK	


	.FUNCT	SEBASTIO-SCREAMS:ANY:0:0
	ICALL2	CTHE-PRINT,SEBASTIO
	PRINTI	" screams, ""Lying pig of a heretic!"
	RTRUE	


	.FUNCT	REMOVES-YOUR-HEAD:ANY:1:1,WHO
	CALL2	JIGS-UP?,J-HEAD
	ZERO?	STACK /TRUE
	ICALL2	CTHE-PRINT,WHO
	PRINTI	" responds to your feeble attack by removing your head."
	CRLF	
	CALL1	JIGS-UP
	RSTACK	


	.FUNCT	GENERIC-MAN-F:ANY:2:2,R,F
	PRINTI	"You'll have to be more specific."
	CRLF	
	RETURN	ROOMS


	.FUNCT	MURA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	EQUAL?	PRSA,V?TAKE \?CCL6
	IN?	PRSO,PLAYER \?CCL6
	FSET?	PRSO,WEARBIT /?CCL6
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?GIVE,PRSO,MURA
	RSTACK	
?CCL6:	EQUAL?	PRSA,V?NO,V?IYE \?CCL11
	EQUAL?	QCONTEXT,MURA \?CCL11
	EQUAL?	SCENE,S-RODRIGUES \?CCL11
	PRINTR	"Mura replies in halting Portuguese, ""So sorry, Anjin-san, you must go."""
?CCL11:	EQUAL?	PRSA,V?TELL-ME-ABOUT,V?FIND \?CCL16
	EQUAL?	PRSO,ONNA \?CCL16
	ICALL	NEW-SDESC,ONNA,STR?255
	ICALL	REPLACE-SYNONYM,ONNA,W?ONNA,W?HAKU
	PRINTI	"""Where's Onna?"" you ask. ""I want Onna!""Mura replies in heavily-accented Portuguese, """
	ICALL2	PRINTUNDER,STR?256
	PRINTR	" mean 'woman.'  Her name Haku."""
?CCL16:	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL23
	PRINTR	"Mura is a short, wiry, middle-aged man.You realize there's more to him than the simple fisherman he appears to be."
?CCL23:	EQUAL?	PRSA,V?GIVE \?CCL25
	EQUAL?	PRSI,MURA \?CCL25
	EQUAL?	HERE,BATH-HOUSE \?CCL25
	FSET?	PRSO,WEARBIT /?CCL25
	MOVE	PRSO,MURA
	PRINTI	"Mura takes "
	ICALL1	THE-PRINT-PRSO
	PRINTR	"."
?CCL25:	EQUAL?	PRSA,V?ATTACK,V?HIT \?CCL31
	PRINTR	"Mura is unarmed, but the moment you get within reach, he chops your elbow with the side of his hand and your arm hangs down, momentarily paralyzed.""Please excuse me, Captain-san,"" he says in very bad Portuguese."
?CCL31:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"Mura is the headman of the village of Anjiro."


	.FUNCT	BROWNS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	HERE,MAIN-DECK-2 \?CCL8
	EQUAL?	SCENE,S-ESCAPE \?CCL8
	SET	'WINNER,PLAYER
	ICALL2	PERFORM,V?MIZU
	RTRUE	
?CCL8:	PRINTI	"The Browns are not under your orders."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?WHO \?CCL13
	PRINTR	"The Browns are Toranaga's samurai."
?CCL13:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"They are all dressed in the Brown uniform."


	.FUNCT	GRAYS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTI	"The Grays ignore you."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?WHO \?CCL8
	PRINTR	"The Grays are Ishido's samurai."
?CCL8:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	SCENE,S-PRISON \?CCL13
	PRINTR	"They are behaving more like escorts than guards."
?CCL13:	PRINTR	"They are all dressed in the Gray uniform."


	.FUNCT	MARIKO-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-SEPPUKU \?CCL6
	EQUAL?	HERE,TEA-HOUSE,FORECOURT /TRUE
?CCL6:	EQUAL?	SCENE,S-NINJA \FALSE
	FSET?	MARIKO,DEAD /TRUE
	FSET?	MARIKO,RMUNGBIT /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Mariko "
	EQUAL?	HERE,TEA-HOUSE \?CCL19
	PRINTI	"kneels here, facing the doorway."
	RTRUE	
?CCL19:	EQUAL?	HERE,FORECOURT \?CCL21
	FSET?	MARIKO,SITTING \?CCL24
	PRINTI	"kneels serenely in the center of the crimson coverlet."
	RTRUE	
?CCL24:	PRINTI	"is standing in the center of the main gate."
	RTRUE	
?CCL21:	EQUAL?	SCENE,S-NINJA \FALSE
	PRINTI	"lies "
	FSET?	MARIKO,DEAD \?CCL29
	PRINTI	"dead"
	JUMP	?CND27
?CCL29:	PRINTI	"dying"
?CND27:	PRINTI	" on the floor."
	RTRUE	


	.FUNCT	MARIKO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	FSET?	MARIKO,DEAD /?CTR7
	FSET?	MARIKO,RMUNGBIT \?CCL8
?CTR7:	PRINTR	"Mariko can no longer respond."
?CCL8:	EQUAL?	PRSA,V?WHO,V?TELL-ME-ABOUT \?CCL12
	EQUAL?	PRSO,YOU,MARIKO \?CCL12
	PRINTR	"""I am Lady Toda Mariko-noh-Buntaro.The priests know me as Lady Maria, as I am Christian."""
?CCL12:	EQUAL?	PRSA,V?WHAT,V?TELL-ME-ABOUT \?CCL16
	EQUAL?	PRSO,PROPHECY \?CCL16
	EQUAL?	HERE,MAPLE-GLADE \?CND19
	PRINTI	"Mariko asks permission of Toranaga, who nods."
?CND19:	PRINTI	"""Six years ago a Chinese embassy came to the Taiko to try to settle the Japanese-Chinese-Korean war.A famous astrologer was among them.He forecast many things which have since come true.The Taiko asked him to predict the deaths of certain of his counselors.The astrologer said that Toranaga would die by the sword when he was middle-aged.Ishido, the famous conqueror of Korea, would die undiseased, an old man, his feet firm in the earth, the most famous man of his day.The Taiko himself would die in his bed, respected, revered, of old age, leaving a healthy son to follow him.At this time Yaemon had not yet been born, so that part of the prophecy has already come to pass."""
	CRLF	
	CALL2	SCORE-OBJECT,PROPHECY
	RSTACK	
?CCL16:	EQUAL?	SCENE,S-MARIKO \?CCL22
	EQUAL?	PRSA,V?KONNICHI-WA \?PRD27
	EQUAL?	PRSO,ROOMS /?CTR24
?PRD27:	EQUAL?	PRSA,V?NIHON-GO-GA \?CCL25
	EQUAL?	PRSO,HANASE-MASEN \?CCL25
?CTR24:	FSET?	MAPLE-GLADE,SCOREBIT \FALSE
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?KONNICHI-WA,MARIKO
	RTRUE	
?CCL25:	EQUAL?	QCONTEXT,MARIKO \?CCL36
	EQUAL?	PRSA,V?LEARN,V?TRAIN,V?TEACH \?CCL36
	CALL1	PAST-TENSE?
	ZERO?	STACK /?CCL36
	EQUAL?	PRSS,DOMINGO \?PRD44
	EQUAL?	PRSO,ME /?CTR41
?PRD44:	EQUAL?	PRSO,PRISON,DOMINGO \?CCL42
?CTR41:	CALL1	HOW-I-LEARNED
	RSTACK	
?CCL42:	PRINTR	"She doesn't seem to believe you."
?CCL36:	EQUAL?	PRSA,V?TEACH \?CCL48
	EQUAL?	PRSO,ME \?CCL48
	EQUAL?	PRSI,JAPANESE \?CCL48
	PRINTR	"""If my master wishes,"" she answers, turning to Toranaga.They converse for a while.""My Master says that only a few bar -- foreigners have been able to learn our language, and these are all priests.But he would like to be able to talk to you directly, without the need for an interpreter.He will consider this request."""
?CCL48:	EQUAL?	PRSA,V?WHO,V?TELL-ME-ABOUT \?CCL53
	EQUAL?	PRSO,YAEMON \?CCL53
	ICALL	NEW-SDESC,YAEMON,STR?257
	PRINTR	"""This is the Heir, the only son of the Taiko.His name is Yaemon."""
?CCL53:	EQUAL?	PRSA,V?WHO,V?TELL-ME-ABOUT \?CCL57
	EQUAL?	PRSO,YOU,MARIKO \?CCL57
	PRINTR	"""My name is Toda Mariko noh-Buntaro.I am a 'senhora,' not a 'senhorita,' if you please."""
?CCL57:	CALL1	QUESTION-VERB?
	ZERO?	STACK \?CTR60
	EQUAL?	PRSA,V?ASK-ABOUT,V?TELL-ME-ABOUT \?CCL61
?CTR60:	PRINTI	"""Lord Toranaga has instructed me to say that "
	EQUAL?	LG-CREWMEN,PRSO,PRSI \?CCL66
	PRINTR	"your crewmen are being treated well.They will given a place to live, and to learn to be civilized."""
?CCL66:	PRINTR	"you will please confine yourself to answering questions only, for the moment.""Then she says, ""I'm sure, if you are patient, Pilot-Captain B'ackthon, that you'll be given an opportunity to ask anything you wish later."""
?CCL61:	CALL1	JAPANESE-VERB?
	ZERO?	STACK /?CCL68
	PRINTR	"""If you will excuse me, senhor, my Master orders me to say your accent is a little wrong.""She repeats the word several times slowly, showing you how to say it."
?CCL68:	CALL1	I-DONT-UNDERSTAND
	RSTACK	
?CCL22:	EQUAL?	PRSA,V?THOU \?CCL70
	CALL1	I-LOVE-YOU
	RSTACK	
?CCL70:	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CCL72
	EQUAL?	PRSO,SUICIDE \?CCL75
	PRINTR	"""If the shame is too great, or if our liege Lord commands, we take our lives.I have been trained to do so, as have all samurai."""
?CCL75:	EQUAL?	PRSO,KIYAMA \?CCL77
	PRINTI	"""Lord Kiyama is a member of the Council of Regents, and the most powerful of the Christian daimyos."""
	CRLF	
	JUMP	?CND73
?CCL77:	EQUAL?	SCENE,S-NINJA \?CND73
	EQUAL?	PRSO,YABU \?CCL81
	PRINTI	"""He is very angry with me for confronting Lord Ishido, and even angrier that I did not go through with my seppuku, but that was my "
	ICALL2	PRINTUNDER,STR?258
	PRINTR	", Anjin-san."""
?CCL81:	EQUAL?	PRSO,ACHIKO \?CND73
	PRINTR	"""Her grandfather-in-law, Lord Kiyama, opposes Lord Toranaga.He has disowned her for her presumption in joining us."""
?CND73:	PRINTR	"""I cannot tell you anything more, Anjin-san.So sorry."""
?CCL72:	EQUAL?	PRSA,V?STOP,V?KINJIRU \?CCL84
	EQUAL?	SCENE,S-SEPPUKU \?CCL87
	ZERO?	MARIKO-WON-FLAG /?CCL90
	PRINTR	"She doesn't respond, or even notice you.She's almost in a trance."
?CCL90:	PRINTI	"""No, Anjin-san.I must obey the orders of Lord Toranaga.If I cannot, I must commit "
	ICALL2	PRINTUNDER,STR?259
	PRINTR	" to expunge the shame.Only if Lord Ishido relents and allows me to obey my liege-lord may I stop."""
?CCL87:	CALL1	I-DONT-UNDERSTAND
	RSTACK	
?CCL84:	EQUAL?	PRSA,V?FIND \?CCL92
	EQUAL?	PRSO,SECRET-ROOM-DOOR \?CCL92
	PRINTR	"""I don't know about any secret doors,"" she says, puzzled."
?CCL92:	EQUAL?	PRSA,V?FIND \?CCL96
	EQUAL?	PRSO,SECRET-REDOUBT-DOOR \?CCL96
	PRINTR	"""It's in my room, Anjin-san!"""
?CCL96:	EQUAL?	PRSA,V?FOLLOW,V?LEAVE,V?ISOGI /?CTR99
	EQUAL?	PRSA,V?WALK \?CCL100
	EQUAL?	P-WALK-DIR,P?EAST,P?NORTH,P?OUT \?CCL100
?CTR99:	EQUAL?	SCENE,S-NINJA \?CCL107
	CALL1	MARIKO-FOLLOW-ME
	RSTACK	
?CCL107:	CALL1	I-DONT-UNDERSTAND
	RSTACK	
?CCL100:	EQUAL?	PRSA,V?LOVE,V?THOU \?CCL109
	CALL1	I-LOVE-YOU
	RSTACK	
?CCL109:	EQUAL?	PRSA,V?YES,V?HAI \?CCL111
	EQUAL?	HERE,WAREHOUSE \?CCL114
	SET	'QCONTEXT,FALSE-VALUE
	MOVE	LARGE-KNIFE,BLACKTHORNE
	MOVE	SMALL-KNIFE,BLACKTHORNE
	PRINTR	"""Good!"" she responds.She turns to Toranaga.""My Master says you should be armed.""She hands you a knife.""Better, give me two,"" you respond, and Toranaga agrees.You slide the large one into your sash and tie the small one, haft downwards, to your forearm.""My Master asks, do all Englishmen carry knives secretly in their sleeves like that?""

""No, but most seamen do.""Now you are ready.Mariko stares at the wharf, then commits herself.

""Follow me!"""
?CCL114:	EQUAL?	HERE,WHARF,MAIN-DECK-2 \?CCL116
	EQUAL?	QCONTEXT,MARIKO \?CCL116
	SET	'QCONTEXT,FALSE-VALUE
	PRINTR	"""That is good,"" she replies."
?CCL116:	EQUAL?	HERE,PRIVATE-QUARTERS \FALSE
	ZERO?	MARIKO-PLAN? /FALSE
	EQUAL?	QCONTEXT,MARIKO \FALSE
	INC	'MARIKO-PLAN?
	EQUAL?	MARIKO-PLAN?,2 \?CCL126
	SET	'QCONTEXT,MARIKO
	ICALL2	THIS-IS-IT,YABU
	PRINTR	"""Do you think he plans to betray us?"""
?CCL126:	GRTR?	MARIKO-PLAN?,2 \FALSE
	SET	'QCONTEXT,FALSE-VALUE
	FSET?	CELLARS,SCOREBIT \?CCL131
	PRINT	STR?260
	CRLF	
	RTRUE	
?CCL131:	PRINT	STR?261
	CRLF	
	RTRUE	
?CCL111:	EQUAL?	PRSA,V?NO,V?IYE \?CCL133
	EQUAL?	HERE,WAREHOUSE \?CCL136
	PRINTR	"""If I am in danger, it is no matter, I am samurai."""
?CCL136:	EQUAL?	HERE,WHARF,MAIN-DECK-2 \?CCL138
	EQUAL?	QCONTEXT,MARIKO \?CCL138
	SET	'QCONTEXT,FALSE-VALUE
	PRINTR	"""Then the danger is greater, but we must continue,"" she replies."
?CCL138:	EQUAL?	HERE,PRIVATE-QUARTERS \FALSE
	ZERO?	MARIKO-PLAN? /FALSE
	EQUAL?	QCONTEXT,MARIKO \FALSE
	INC	'MARIKO-PLAN?
	EQUAL?	MARIKO-PLAN?,2 \?CCL148
	SET	'QCONTEXT,MARIKO
	PRINT	STR?262
	CRLF	
	RTRUE	
?CCL148:	GRTR?	MARIKO-PLAN?,2 \FALSE
	SET	'QCONTEXT,FALSE-VALUE
	PRINTR	"""We're safe now."""
?CCL133:	EQUAL?	PRSA,V?WALK,V?CLIMB-UP,V?CLIMB-FOO \?CCL152
	IN?	MARIKO,SIDE-FISSURE \?CCL152
	PRINTR	"""I can't make it, Anjin-san!I'm sliding!"""
?CCL152:	EQUAL?	PRSA,V?HOLD-ON \?PRD160
	EQUAL?	PRSO,ROOMS,ME /?PRD158
?PRD160:	EQUAL?	PRSA,V?TAKE,V?REACH-FOR \?CCL156
	EQUAL?	PRSO,ME \?CCL156
?PRD158:	IN?	MARIKO,SIDE-FISSURE \?CCL156
	IN?	PLAYER,SIDE-FISSURE \?CCL167
	PRINTR	"""I'm trying, Anjin-san, but the mud is slippery!"""
?CCL167:	PRINTR	"""I can't reach you, Anjin-san!"""
?CCL156:	EQUAL?	PRSA,V?BATHE \?CCL169
	EQUAL?	PRSO,ME \?CCL169
	EQUAL?	SCENE,S-JOURNEY \?CCL174
	IN?	BLACKTHORNE,YOKOSE-BATHTUB \?CCL177
	SET	'WINNER,BLACKTHORNE
	ICALL	PERFORM,V?BATHE,ME
	RTRUE	
?CCL177:	PRINTR	"""You aren't in the tub yet, Anjin-san!"""
?CCL174:	PRINTR	"""While you may need a bath, Anjin-san, there are no facilities!"""
?CCL169:	EQUAL?	PRSA,V?BETRAY \?CCL179
	EQUAL?	PRSO,YABU \?CCL179
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?TELL-ABOUT,MARIKO,YABU
	RTRUE	
?CCL179:	CALL1	I-DONT-UNDERSTAND
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL183
	EQUAL?	SCENE,S-SEPPUKU \?CCL186
	EQUAL?	HERE,TEA-HOUSE \?CCL186
	CALL1	SEPPUKU-EXAMINE-MARIKO
	RSTACK	
?CCL186:	EQUAL?	SCENE,S-NINJA \?CCL190
	CALL1	EXAMINE-MARIKO
	RSTACK	
?CCL190:	PRINT	STR?263
	PRINTR	" and if you put both hands around her waist, your fingers would touch.She wears no jewelry of any kind, except silver pins in her hair."
?CCL183:	EQUAL?	PRSA,V?WHO \?CCL192
	PRINTR	"Lady Toda Mariko is the wife of Buntaro.She speaks fluent Portuguese and Latin, and is a Christian."
?CCL192:	EQUAL?	PRSA,V?BE \?CCL194
	EQUAL?	PRSO,YABU \?CCL194
	EQUAL?	PRSI,TRAITOR \?CCL194
	ICALL	PERFORM,V?TELL-ABOUT,MARIKO,YABU
	RTRUE	
?CCL194:	EQUAL?	PRSA,V?BLESS \?CCL199
	FSET?	MARIKO,RMUNGBIT \FALSE
	PRINTI	"You make the sign of the cross over her and say the sacred Latin words that are necessary, though no sound comes from your mouth.The others watch you.When you are done, you fight to your feet again and stand upright."
	CRLF	
	CALL2	SCORE-OBJECT,MARIKO
	RSTACK	
?CCL199:	EQUAL?	PRSA,V?WALK-TO \?CCL204
	FSET?	MARIKO,RMUNGBIT \FALSE
	FSET?	BLACKTHORNE,SITTING \FALSE
	ICALL1	B-STAND
	PRINTR	"Painfully you drag yourself closer to her."
?CCL204:	EQUAL?	PRSA,V?RUB \?CCL211
	FSET?	MARIKO,RMUNGBIT \?CCL211
	ICALL	PERFORM,V?EXAMINE,MARIKO
	RTRUE	
?CCL211:	EQUAL?	PRSA,V?HELP,V?STOP \?CCL215
	EQUAL?	SCENE,S-SEPPUKU,S-NINJA,S-QUAKE \FALSE
	ICALL	PERFORM,V?TAKE,MARIKO
	RTRUE	
?CCL215:	EQUAL?	PRSA,V?TAKE \?CCL220
	EQUAL?	PRSO,MARIKO \?CCL220
	EQUAL?	SCENE,S-NINJA \?CCL225
	CALL1	NINJA-TAKE-MARIKO
	RSTACK	
?CCL225:	EQUAL?	SCENE,S-SEPPUKU \FALSE
	CALL1	SEPPUKU-TAKE-MARIKO
	RSTACK	
?CCL220:	EQUAL?	SCENE,S-SEPPUKU \?CCL229
	EQUAL?	HERE,FORECOURT \?CCL229
	ZERO?	MARIKO-WON-FLAG \?CCL229
	CALL1	PASSIVE-VERB?
	ZERO?	STACK /?CTR234
	CALL1	SPEAKING-VERB?
	ZERO?	STACK \?CTR234
	CALL1	JAPANESE-VERB?
	ZERO?	STACK /?CCL235
?CTR234:	EQUAL?	PRSA,V?TELL \?CND239
	ICALL1	END-QUOTE
?CND239:	CALL	JIGS-UP?,J-SEPPUKU,STR?264
	ZERO?	STACK /TRUE
	PRINTI	"You interrupt the ceremony."
	CALL1	INTERRUPTED-SEPPUKU
	RSTACK	
?CCL235:	EQUAL?	PRSA,V?BOW \FALSE
	PRINTR	"You bow to Mariko in respect for her courage."
?CCL229:	EQUAL?	PRSA,V?KISS,V?FUCK,V?LOVE \?CCL247
	FSET?	MARIKO,DEAD /?CTR249
	FSET?	MARIKO,RMUNGBIT \?CCL250
?CTR249:	PRINTR	"You kiss her lightly on the lips."
?CCL250:	EQUAL?	HERE,TEA-HOUSE \?CCL254
	PRINTR	"Mariko kisses you lightly and sadly."
?CCL254:	GRTR?	SCENE,S-ESCAPE /?CCL256
	PRINTR	"She refuses your advances."
?CCL256:	PRINTR	"""This is not the time or the place, Anjin-san!"" she replies in Latin, ""though truly I love thee."""
?CCL247:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL258
	EQUAL?	PRSO,MARIKO \?CCL258
	EQUAL?	SCENE,S-MARIKO \?CCL263
	CALL1	MARIKO-TELL-MARIKO-ABOUT
	RSTACK	
?CCL263:	EQUAL?	PRSI,YABU,LG-YABU,LG-NINJA \?CCL265
	FSET?	CELLARS,SCOREBIT /?CCL265
	SET	'MARIKO-PLAN?,3
	SET	'QCONTEXT,FALSE-VALUE
	PRINT	STR?261
	CRLF	
	RTRUE	
?CCL265:	PRINTI	"Mariko seems very interested as you tell her about "
	ICALL1	THE-PRINT-PRSI
	PRINTR	", watching you with demurely lowered eyes."
?CCL258:	EQUAL?	PRSA,V?SHOOT \?CCL269
	EQUAL?	PRSO,PISTOL \?CCL269
	EQUAL?	PRSI,MARIKO \?CCL269
	IN?	NINJA,HERE \?CCL269
	CALL	JIGS-UP?,J-KILL-MARIKO,STR?265
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?266
	RSTACK	
?CCL269:	EQUAL?	PRSA,V?FOLLOW \?CCL278
	IN?	MARIKO,HERE /?CCL278
	EQUAL?	SCENE,S-SEPPUKU \?CCL283
	EQUAL?	HERE,TEA-HOUSE \?CCL286
	CALL2	DO-WALK,P?OUT
	RSTACK	
?CCL286:	EQUAL?	HERE,FORMAL-GARDEN \FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	
?CCL283:	EQUAL?	SCENE,S-NINJA \FALSE
	IN?	MARIKO,HERE /FALSE
	LOC	MARIKO
	CALL2	NEXT-ROOM?,STACK
	ZERO?	STACK \FALSE
	PRINTR	"You've lost her!You can only assume the ninja are taking her to their secret door."
?CCL278:	EQUAL?	PRSA,V?PUSH \FALSE
	EQUAL?	PRSO,MARIKO \FALSE
	EQUAL?	PRSI,INTDIR \FALSE
	SET	'WINNER,MARIKO
	ICALL	PERFORM,V?WALK,P-DIRECTION
	SET	'WINNER,PLAYER
	RTRUE	


	.FUNCT	INTERRUPTED-SEPPUKU:ANY:0:0
	CALL2	JIGS-UP,STR?267
	RSTACK	


	.FUNCT	I-LOVE-YOU:ANY:0:0
	PRINTR	"""Thou,"" she replies in Latin, your private language of love. ""I love thee!"""


	.FUNCT	I-DONT-UNDERSTAND:ANY:0:0
	PRINTR	"""I don't understand, Anjin-san."""


	.FUNCT	YABU-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-NINJA \?CCL6
	EQUAL?	HERE,OUTER-ROOM /TRUE
	ZERO?	FOLLOW-FLAG \TRUE
	RFALSE	
?CCL6:	EQUAL?	HERE,VILLAGE-SQUARE /TRUE
	EQUAL?	HERE,PEBBLED-BEACH,ROCKY-SHORE,CLIFF-PATH /TRUE
	EQUAL?	HERE,AROUND-HEADLAND /TRUE
	IN?	YABU,SKIFF /FALSE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	EQUAL?	HERE,VILLAGE-SQUARE \?CCL24
	PRINTI	"The "
	ICALL2	PRINTUNDER,STR?82
	PRINTI	", Kasigi Yabu, sits on the platform."
	RTRUE	
?CCL24:	EQUAL?	HERE,PEBBLED-BEACH,ROCKY-SHORE,CLIFF-PATH /?CTR25
	EQUAL?	HERE,AROUND-HEADLAND \?CCL26
?CTR25:	PRINTI	"Yabu, wet and impatient, watches you carefully."
	RTRUE	
?CCL26:	ZERO?	FOLLOW-FLAG /?CCL30
	EQUAL?	HERE,CELLARS \?CCL33
	PRINTI	"Yabu looks nervously into the shadows."
	RTRUE	
?CCL33:	PRINTI	"Yabu is walking away from you."
	RTRUE	
?CCL30:	PRINTI	"Yabu sits impatiently, facing you."
	RTRUE	


	.FUNCT	YABU-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	SCENE,S-YABU \?CCL8
	CALL1	YABU-TALK-TO-YABU
	RSTACK	
?CCL8:	EQUAL?	SCENE,S-NINJA \?CCL10
	CALL1	NINJA-TALK-TO-YABU
	RSTACK	
?CCL10:	EQUAL?	HERE,CLIFF-PATH \?CCL12
	EQUAL?	PRSA,V?LOOK,V?WALK \?CCL12
	SET	'WINNER,BLACKTHORNE
	ICALL	PERFORM,V?POINT,RODRIGUES
	SET	'WINNER,YABU
	RTRUE	
?CCL12:	CALL1	YABU-WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL16
	PRINTI	"Kasigi Yabu is short, squat, and dominating."
	EQUAL?	HERE,VILLAGE-SQUARE \?CND17
	PRINTI	"There's arrogance and cruelty in the "
	ICALL2	PRINTUNDER,STR?268
	PRINTI	" face, you think."
	GRTR?	YABU-CNT,0 \?CND19
	PRINTI	"He seems irritated and impatient.The priest's Japanese isn't fluent, you realize, as Yabu seems to ask for another word, a clearer word."
?CND19:	PRINTR	"He kneels comfortably, his heels tucked neatly under him, flanked by four lieutenants, one of whom is Kasigi Omi, his nephew and vassal.They all wear silk kimonos and, over them, ornate surcoats with wide belts."
?CND17:	CRLF	
	RTRUE	
?CCL16:	EQUAL?	YABU-QUESTION,4 \?CCL22
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL22
	EQUAL?	PRSO,YABU \?CCL22
	EQUAL?	PRSI,STRAIT-OF-MAGELLAN \?CCL22
	SET	'WINNER,YABU
	ICALL	PERFORM,V?COME-FROM,STRAIT-OF-MAGELLAN
	SET	'WINNER,PLAYER
	RTRUE	
?CCL22:	EQUAL?	SCENE,S-NINJA \?CCL28
	EQUAL?	PRSA,V?TELL,V?ASK-ABOUT,V?TELL-ABOUT /?PRD31
	EQUAL?	PRSA,V?SAY \?CCL28
?PRD31:	EQUAL?	PRSO,YABU \?CCL28
	EQUAL?	HERE,STAIRS,SERVANTS-QUARTERS,CELLARS \FALSE
	CALL1	NINJA-INTERRUPT-YABU
	RSTACK	
?CCL28:	EQUAL?	PRSA,V?WHO \?CCL38
	PRINTR	"Kasigi Yabu is chief of the Kasigi clan, Lord of Izu."
?CCL38:	EQUAL?	PRSA,V?FOLLOW \?CCL40
	EQUAL?	SCENE,S-VOYAGE \?CCL43
	PRINTR	"You are hard put to keep up with him, but you force yourself, in spite of your weakness."
?CCL43:	EQUAL?	SCENE,S-NINJA \FALSE
	CALL2	QUEUED?,I-YABU-LEAVES
	ZERO?	STACK \FALSE
	CALL1	NINJA-FOLLOW-YABU
	RSTACK	
?CCL40:	EQUAL?	PRSA,V?SHOOT \?CCL49
	CALL	JIGS-UP?,J-SHOOT-YABU,STR?269
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?270
	RSTACK	
?CCL49:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	CALL2	REMOVES-YOUR-HEAD,YABU
	RSTACK	


	.FUNCT	GENERIC-YABU-F:ANY:2:2,R,F
	IN?	YABU,HERE \?CCL3
	RETURN	YABU
?CCL3:	RETURN	LG-YABU


	.FUNCT	LG-YABU-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER /FALSE
	EQUAL?	PRSA,V?TELL,V?SAY \?CCL7
	ICALL	PERFORM,V?YELL-AT,YABU
	ICALL1	END-QUOTE
	EQUAL?	PRSA,V?TELL \TRUE
	RETURN	M-FATAL
?CCL7:	EQUAL?	PRSA,V?EXAMINE \?CCL12
	CALL2	QUEUED?,I-YABU-RETURNS
	ZERO?	STACK /?CCL15
	PRINTR	"Yabu is climbing back up the cliff."
?CCL15:	IN?	YABU,LEDGE-1 \?CCL17
	PRINTR	"Yabu is climbing down the cliff."
?CCL17:	IN?	YABU,LEDGE-2 \?CCL19
	PRINTR	"Yabu has just tumbled to the bottom of the cliff."
?CCL19:	IN?	YABU,LEDGE-3 \?CCL21
	PRINTR	"Yabu is resting at the bottom of the cliff."
?CCL21:	IN?	YABU,LEDGE-4 \FALSE
	ZERO?	YABU-WARNED? /?CCL26
	PRINTR	"Yabu is soaked from the rain and the spray, but alert and strong."
?CCL26:	ZERO?	YABU-RESIGNED? /?CCL28
	PRINTR	"Yabu is sitting composed and dignified on a sea-threatened rock, quietly awaiting his death."
?CCL28:	PRINTR	"Yabu is on the rocks, out of the surf."
?CCL12:	EQUAL?	PRSA,V?HELP \?CCL30
	PRINTR	"There is little you can do directly."
?CCL30:	EQUAL?	PRSA,V?BOW,V?ASK-ABOUT,V?HELLO /?CTR31
	EQUAL?	PRSA,V?SHOW,V?THANK \?CCL32
?CTR31:	PRINT	STR?271
	CRLF	
	RTRUE	
?CCL32:	CALL1	PASSIVE-VERB?
	ZERO?	STACK /?CCL36
	ICALL	REDIRECT,LG-YABU,YABU
	RTRUE	
?CCL36:	EQUAL?	PRSA,V?LOWER,V?THROW,V?GIVE /?PRD40
	EQUAL?	PRSA,V?PUT \?CCL38
?PRD40:	EQUAL?	PRSI,LG-YABU /FALSE
?CCL38:	PRINT	STR?271
	CRLF	
	RTRUE	


	.FUNCT	ISHIDO-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-OCHIBA /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Ishido, tall, lean and autocratic, stands beside the platform."
	RTRUE	


	.FUNCT	GENERIC-SWORD-F:ANY:2:2,R,F
	CALL2	HELD?,SWORDS
	ZERO?	STACK \?CTR2
	CALL2	ACCESSIBLE?,SWORDS
	ZERO?	STACK /?CCL3
?CTR2:	RETURN	SWORDS
?CCL3:	CALL2	HELD?,ISHIDO-SWORD
	ZERO?	STACK \?CTR6
	CALL2	ACCESSIBLE?,ISHIDO-SWORD
	ZERO?	STACK /?CCL7
?CTR6:	RETURN	SWORDS
?CCL7:	RETURN	YABU-SWORDS


	.FUNCT	ISHIDO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?YES,V?HAI /?CTR7
	CALL1	NOT-A-BARBARIAN?
	ZERO?	STACK /?CCL8
?CTR7:	EQUAL?	OCHIBA-QUESTION,2 \?CCL13
	EQUAL?	PRSA,V?YES,V?HAI \?CCL16
	PRINTR	"""So, you are a barbarian, then!"" Ishido replies with glee."
?CCL16:	SET	'OCHIBA-QUESTION,FALSE-VALUE
	ICALL2	SCORE-OBJECT,GLOBAL-BARBARIAN
	PRINTI	"""Ah, Lord General, you are right.Barbarians are often mad.But, so sorry, now I am samurai -- hatamoto."
	ICALL2	PRINTUNDER,STR?272
	PRINTI	"  Now I understand manners, please excuse me."
	ICALL2	PRINTUNDER,STR?273
	PRINTR	"""You know that the Japanese understand masculinity and pride, and honor them.

Ishido laughs nervously.""So, samurai Anjin-san, yes, I accept your apology.I apologize also."""
?CCL13:	PRINTR	"""That remains to be seen, Anjin,"" replies Ishido."
?CCL8:	EQUAL?	PRSA,V?NO,V?IYE \?CCL18
	PRINTR	"He sniffs, as if to imply he doesn't believe you."
?CCL18:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL20
	PRINTI	"Ishido Kazunari is tall, lean, swarthy and very tough, a little younger than Toranaga."
	PRINT	STR?274
	CRLF	
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?WHO \?CCL22
	PRINTR	"Ishido Kazunari is Commander of the garrison of Osaka Castle, Commander of the Heir's Bodyguard, Chief General of the Armies of the West, Conquerer of Korea, member of the Council of Regents, and Inspector General of the Armies of the late Taiko."
?CCL22:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL24
	EQUAL?	PRSO,ISHIDO \?CCL24
	EQUAL?	PRSI,TORANAGA,KIRITSUBO,TORANAGA-IN-DRAG \?CCL24
	ZERO?	SEEN-TORANAGA? /?CCL30
	PRINTR	"You try to tell Ishido about Toranaga and Kiri switching places, but your Japanese isn't good enough, and he is merely annoyed."
?CCL30:	PRINTR	"Ishido seems rather uninterested in your ungrammatical babblings."
?CCL24:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	CALL2	JIGS-UP?,J-ATTACK-ISHIDO
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?275
	RSTACK	


	.FUNCT	GENERIC-TORANAGA-F:ANY:2:2,R,F
	IN?	TORANAGA-IN-DRAG,HERE \?CCL3
	RETURN	TORANAGA-IN-DRAG
?CCL3:	RETURN	TORANAGA


	.FUNCT	TORANAGA-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-TORANAGA \FALSE
	IN?	FALCON,TORANAGA /TRUE
	RFALSE	
?CCL3:	ZERO?	SEEN-FALCON? \?CND9
	SET	'SEEN-FALCON?,TRUE-VALUE
	ICALL	MARGINAL-PIC,P-FALCON,FALSE-VALUE
?CND9:	PRINTI	"Toranaga is repairing a broken wing feather of a hooded falcon as delicately as any ivory carver."
	RTRUE	


	.FUNCT	TORANAGA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	SCENE,S-TORANAGA \?CCL8
	EQUAL?	PRSA,V?TEKI \?CND6
	RFALSE	
?CCL8:	EQUAL?	SCENE,S-MARIKO \?CCL12
	EQUAL?	PRSA,V?KONNICHI-WA \?PRD16
	EQUAL?	PRSO,ROOMS /?CCL14
?PRD16:	EQUAL?	PRSA,V?NIHON-GO-GA \?CND6
	EQUAL?	PRSO,HANASE-MASEN \?CND6
?CCL14:	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?KONNICHI-WA,TORANAGA
	RTRUE	
?CCL12:	EQUAL?	SCENE,S-QUAKE \?CCL22
	IN?	TORANAGA,PLATEAU \?CND6
	IN?	MARIKO,SIDE-FISSURE \?CND6
	PRINTR	"Toranaga crawls closer to you, trying to help."
?CCL22:	EQUAL?	SCENE,S-AFTERMATH \?CCL28
	CALL1	AFTERMATH-ANSWERS
	ZERO?	STACK \TRUE
?CCL28:	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CND6
	EQUAL?	PRSO,LG-ERASMUS \?CND6
	PRINTR	"""You will get your ship back in good time, Anjin-san."""
?CND6:	PRINT	STR?276
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL35
	PRINTR	"Toranaga is a short man with a thick belly and a large nose.His eyebrows are thick and dark and his mustache and beard gray-flecked and sparse.Eyes dominate his face.He is fifty-eight and strong for his age."
?CCL35:	EQUAL?	PRSA,V?WHO \?CCL37
	PRINTR	"Yoshi Toranaga is Lord of the Kwanto and President of the Council of Regents."
?CCL37:	EQUAL?	PRSA,V?YELL,V?YELL-AT,V?LAUGH \FALSE
	CALL	JIGS-UP?,J-LAUGH-AT-TORANAGA,STR?277
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?278
	RSTACK	


	.FUNCT	HIRO-MATSU-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL7
	PRINTR	"He is tall for a Japanese, just under six feet, a bull-like man with heavy jowls.His military kimono is brown silk, stark but for five small Toranaga crests -- three interlocked bamboo sprays."
?CCL7:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"Lord Hiro-matsu, overlord of the provinces of Sagami and Kozuke, is Toranaga's most trusted general and advisor.He is an older man, stern and somewhat slow-witted, but immensely reliable.He is very good at killing, and customarily carries his killing sword in his hand instead of in his belt, symbol of his readiness to kill instantly to protect his liege lord."


	.FUNCT	VINCK-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? \?CCL3
	EQUAL?	SCENE,S-YOKOHAMA /TRUE
	RFALSE	
?CCL3:	EQUAL?	RARG,M-OBJDESC \FALSE
	PRINTI	"Vinck is here"
	FSET?	VINCK,DEAD \?CCL11
	PRINTI	", his face frozen in a rictus of death."
	RTRUE	
?CCL11:	PRINTC	46
	RTRUE	


	.FUNCT	VINCK-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?HELLO \?CCL8
	PRINTR	"He greets you with as much enthusiasm as his weakened condition allows.He's the only man of the crew that you could call a friend."
?CCL8:	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CCL10
	EQUAL?	PRSO,SPILLBERGEN \?CCL13
	PRINTR	"""That glory-greedy bastard!He's responsible for this."""
?CCL13:	EQUAL?	PRSO,REEF \?CCL15
	PRINTR	"""We'll never make it, by my mother!Look at those spines!""It's clear that Vinck is near panic."
?CCL15:	EQUAL?	PRSO,RUTTER,SECRET-RUTTER,GLOBAL-RUTTERS \?CCL17
	PRINTR	"An odd light enters Vinck's eyes as he answers.""Rutters?Aye, what about the rutters, eh?Maybe you'd better give them to me in case anything happens to you, right?""You know that Vinck would be Pilot if you were to die.He's your friend, but rutters!Rutters are beyond price."
?CCL17:	EQUAL?	PRSO,ROPER \?CCL19
	PRINTR	"""That poxy merchant?Listen to him, and you'd think he was a Christian.Watch him, and you see his only god clinks in his strongboxes!"""
?CCL19:	EQUAL?	PRSO,ETA \FALSE
	EQUAL?	SCENE,S-YOKOHAMA \FALSE
	PRINTR	"""Eters are the best heathen we've seen here.More like us than the other bastards.With them, fresh meat's no problem, or tallow -- they give us no trouble."""
?CCL10:	EQUAL?	PRSA,V?RAISE,V?REPAIR,V?LOWER \?CCL25
	EQUAL?	PRSO,FORESAILS /FALSE
?CCL25:	CALL1	SEND-HIM-OUT?
	ZERO?	STACK /?CCL29
	EQUAL?	HERE,BELOW-DECKS \?CCL32
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?SEND,VINCK,ROOMS
	RTRUE	
?CCL32:	PRINTR	"""Pilot, I'm on watch now."""
?CCL29:	EQUAL?	HERE,BRIDGE-OF-ERASMUS \?CCL34
	EQUAL?	PRSA,V?HELP /?CTR33
	EQUAL?	PRSA,V?TURN,V?TAKE,V?STRAIGHTEN \?CCL34
	EQUAL?	PRSO,WHEEL \?CCL34
?CTR33:	ZERO?	WHEEL-SPINNING? /?CCL43
	FSET?	WHEEL,ONBIT \?CCL46
	PRINTR	"""We've got it, Pilot!Hold on, for the love of God!"""
?CCL46:	FSET	WHEEL,ONBIT
	SET	'SHIP-COURSE,P?FORE
	PRINTR	"Together you and Vinck grab the wheel and set her on course again, but she still bobs and twists drunkenly."
?CCL43:	PRINTR	"He helps for a few moments, then returns control to you."
?CCL34:	EQUAL?	SCENE,S-PIT \?CCL48
	CALL1	HOSTILE-VERB?
	ZERO?	STACK \?CTR47
	EQUAL?	PRSA,V?STOP,V?SIT /?CTR47
	EQUAL?	PRSA,V?TAKE \?CCL48
	EQUAL?	PRSO,LADDER \?CCL48
?CTR47:	ZERO?	VINCK-PICKED? /?CCL58
	PRINTR	"""I gave my word, Pilot."""
?CCL58:	PRINTR	"Vinck fights back as best he can."
?CCL48:	EQUAL?	PRSA,V?GIVE \?CCL60
	EQUAL?	PRSO,SHORT-STRAW \?CCL60
	EQUAL?	PRSI,ME \?CCL60
	IN?	SHORT-STRAW,VINCK \?CCL60
	IN?	LONG-STRAW,PLAYER \?CCL60
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?TRADE,LONG-STRAW,VINCK
	RTRUE	
?CCL60:	EQUAL?	SCENE,S-PIT \?CCL67
	EQUAL?	PRSA,V?HELP \?CCL67
	IN?	OMI-SAMURAI,LADDER /?CTR66
	CALL2	QUEUED?,I-LOSING-SAMURAI
	ZERO?	STACK /?CCL67
?CTR66:	PRINTR	"He tries to help, but he's not too effective."
?CCL67:	EQUAL?	PRSA,V?DROP,V?PUT-AWAY \?PRD76
	EQUAL?	PRSO,PISTOL /?CTR73
?PRD76:	EQUAL?	PRSA,V?GIVE \?CCL74
	EQUAL?	PRSO,PISTOL \?CCL74
	EQUAL?	PRSI,ME,BLACKTHORNE \?CCL74
?CTR73:	PRINTR	"He laughs, pointing the pistol in your face."
?CCL74:	PRINTR	"A weak assent is the only reply."
?CCL5:	EQUAL?	PRSA,V?EXAMINE,V?WHO \?CCL83
	FSET?	VINCK,DEAD \?CCL86
	FSET?	VINCK,RMUNGBIT \?CCL89
	PRINTR	"Vinck is dead, his face frozen in a grimace of rage."
?CCL89:	PRINTR	"He is staring at you as if frozen."
?CCL86:	PRINTI	"Johann Vinck is forty-three, toothless and hairless; the oldest man in the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	"' crew.You've sailed with him before, and each of you knows the measure of the other.If there's any man of the crew you could call a friend, it's he."
?CCL83:	EQUAL?	PRSA,V?SEND \FALSE
	EQUAL?	PRSO,VINCK \FALSE
	MOVE	VINCK,ON-DECK
	FCLEAR	VINCK,NDESCBIT
	PRINTI	"""Take the dawn watch, Vinck,"" you order.Vinck pulls himself painfully out of his bunk and goes out."
	CRLF	
	IN?	GINSEL,ON-DECK \TRUE
	IN?	MAETSUKKER,ON-DECK \TRUE
	ICALL1	RESTART-STORM?
	ICALL2	SCORE-OBJECT,MAETSUKKER
	RTRUE	


	.FUNCT	KIRITSUBO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?YES,V?HAI \?CCL8
	ZERO?	MARIKO-PLAN? /FALSE
	EQUAL?	HERE,PRIVATE-QUARTERS \FALSE
	INC	'MARIKO-PLAN?
	EQUAL?	MARIKO-PLAN?,2 \?CCL16
	PRINT	STR?280
	PRINTR	"asks ""Do you think he plans to betray us?"""
?CCL16:	EQUAL?	MARIKO-PLAN?,3 \FALSE
	PRINT	STR?280
	PRINTI	"says "
	PRINT	STR?260
	CRLF	
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?NO,V?IYE \?CCL20
	ZERO?	MARIKO-PLAN? /FALSE
	EQUAL?	HERE,PRIVATE-QUARTERS \FALSE
	INC	'MARIKO-PLAN?
	EQUAL?	MARIKO-PLAN?,2 \?CCL28
	PRINT	STR?281
	PRINT	STR?262
	CRLF	
	RTRUE	
?CCL28:	EQUAL?	MARIKO-PLAN?,3 \FALSE
	PRINT	STR?280
	PRINTR	"says ""We're safe now."""
?CCL20:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?WHO \?CCL32
	PRINTR	"Lady Kiritsubo Toshiko is Matron of Toranaga's ladies-in-waiting, at fifty-three the oldest of the ladies of his court.She was once Toranaga's consort."
?CCL32:	EQUAL?	PRSA,V?EXAMINE \?CCL34
	FSET?	PRSO,SCOREBIT \?CCL37
	ICALL	REPLACE-SYNONYM,TORANAGA-IN-DRAG,W?KIRITSUBO,W?TORANAGA
	SET	'SEEN-TORANAGA?,TRUE-VALUE
	PRINTI	"Everyone else is watching Sazuko, terrified that some harm may come to Toranaga's unborn child.Kiritsubo scuttles with surprising speed into the garden and inside the little hut.She vanishes for a moment, reappears, and darts into the litter, jerking the curtains closed.For an instant, your eyes meet.It is Toranaga!"
	CRLF	
	CALL	SCORE-OBJECT,KIRITSUBO,TORANAGA-IN-DRAG
	RSTACK	
?CCL37:	PRINTR	"She is a middle-aged woman, her hair gray-flecked, her waist thick, but her face sparkles with eternal joy."
?CCL34:	EQUAL?	PRSA,V?FOLLOW \FALSE
	EQUAL?	SCENE,S-ESCAPE \FALSE
	CALL1	ESCAPE-FOLLOW-KIRI
	RSTACK	


	.FUNCT	RODRIGUES-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	ICALL2	CTHE-PRINT,RODRIGUES
	EQUAL?	HERE,GALLEY \?CCL6
	FSET?	GALLEY-WHEEL,ONBIT /?CCL6
	PRINTI	" stands at the helm."
	RTRUE	
?CCL6:	EQUAL?	HERE,IN-THE-SEA \?CCL10
	IN?	OAR,RODRIGUES \?CCL13
	PRINTI	" floats nearby, clinging to an oar."
	RTRUE	
?CCL13:	PRINTI	" is drowning nearby"
	RTRUE	
?CCL10:	PRINTI	" stands near you."
	RTRUE	


	.FUNCT	RODRIGUES-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?WHO,V?TELL-ME-ABOUT \?CCL8
	EQUAL?	PRSO,RODRIGUES,YOU \?CCL8
	ICALL	NEW-SDESC,RODRIGUES,STR?11
	PRINTR	"""I'm Vasco Rodrigues, pilot of this galley!I'm the best pilot in all Asia!"""
?CCL8:	EQUAL?	RODRIGUES-QUESTION,1 \?CCL12
	EQUAL?	PRSA,V?YES,V?HAI /?CTR14
	EQUAL?	PRSA,V?BE \?CCL15
	EQUAL?	PRSO,BLACKTHORNE,ME \?CCL15
	EQUAL?	PRSI,RODRIGUES,BLACKTHORNE \?CCL15
	CALL	NOUN-USED?,PRSI,W?PILOT
	ZERO?	STACK \?CTR14
	CALL	NOUN-USED?,PRSI,W?PILOT-MAJOR
	ZERO?	STACK /?CCL15
?CTR14:	SET	'QCONTEXT,FALSE-VALUE
	SET	'RODRIGUES-QUESTION,0
	ICALL2	SETUP-ANSWER,FALSE-VALUE
	ICALL	NEW-SDESC,RODRIGUES,STR?11
	PRINTI	"""Good, good!"
	EQUAL?	PRSA,V?HAI \?CND24
	PRINTI	"You sound like a Japper!"
?CND24:	ICALL	NEW-SDESC,HIRO-MATSU,STR?279
	FCLEAR	HIRO-MATSU,AN
	PRINTR	"I'm Vasco Rodrigues, pilot of this galley!""He turns to the old man and speaks a mixture of Japanese and Portuguese, calling him Toda-sama but the way it sounds it comes out ""Toady-sama.""

""That's better,"" he says after a while.""Listen, Pilot, this man's like a king.His name is Toda Hiro-matsu.I told him I'd be responsible for you, and I'd blow your head off as soon as drink with you!"""
?CCL15:	EQUAL?	PRSA,V?NO,V?IYE /?CCL27
	EQUAL?	PRSA,V?BE \FALSE
	EQUAL?	PRSO,BLACKTHORNE,ME \FALSE
	EQUAL?	PRSI,BLACKTHORNE \FALSE
	CALL1	P-NEGATIVE?
	ZERO?	STACK /FALSE
	CALL	NOUN-USED?,PRSI,W?PILOT
	ZERO?	STACK \?CCL27
	CALL	NOUN-USED?,PRSI,W?PILOT-MAJOR
	ZERO?	STACK /FALSE
?CCL27:	PRINTR	"""Bah!They've told me you're the pilot, so let's get on with it!"""
?CCL12:	EQUAL?	RODRIGUES-QUESTION,2 \?CCL38
	CALL1	TRAINED?
	ZERO?	STACK /?CCL38
	SET	'QCONTEXT,FALSE-VALUE
	SET	'RODRIGUES-QUESTION,0
	ICALL2	SETUP-ANSWER,FALSE-VALUE
	PRINTI	"""Excellent, Ingeles!A nest of pirates indeed, but what pilots you pirates are!We're taking you to Osaka, at the pleasure of the Great Lord High Executioner himself.Toranaga!"""
	CRLF	
	CALL2	SCORE-OBJECT,TRINITY-HOUSE
	RSTACK	
?CCL38:	EQUAL?	RODRIGUES-QUESTION,3 \?CCL42
	EQUAL?	PRSA,V?BE \?PRD46
	EQUAL?	PRSO,LIZARD,LATITUDE \?PRD46
	EQUAL?	PRSI,INTNUM,INTADJ /?CTR41
?PRD46:	EQUAL?	PRSA,V?ANSWER \?CCL42
	EQUAL?	PRSO,INTNUM,INTADJ \?CCL42
?CTR41:	EQUAL?	P-NUMBER,50 \?CCL54
	SET	'QCONTEXT,FALSE-VALUE
	SET	'RODRIGUES-QUESTION,0
	ICALL2	SETUP-ANSWER,FALSE-VALUE
	PRINTI	"""You are the pilot, by God!""He shakes your hand warmly.""Come aboard.There's food and good brandy and wine and grog and all pilots should love all pilots, who're the sperm of the earth!Amen!Right?"""
	CRLF	
	ICALL2	SCORE-OBJECT,LIZARD
	RTRUE	
?CCL54:	ZERO?	WRONG-ANSWER? \?CCL56
	SET	'WRONG-ANSWER?,TRUE-VALUE
	PRINTR	"""Now, pilot, don't try anything stupid.If you're the pilot you know the answer!"""
?CCL56:	CALL	JIGS-UP?,J-WRONG-ANSWER,STR?283
	ZERO?	STACK /TRUE
	PRINTI	"He looks at you suspiciously.""Maybe you aren't the pilot, maybe you're some son of a festering whore who thinks he can lie his way into anything!"" He signals to the old man, who nods.You feel something behind you..."
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL42:	EQUAL?	PRSA,V?TELL-ME-ABOUT \?CCL60
	EQUAL?	PRSO,SLAVER \?CCL63
	PRINTR	"""This is no slaver!They don't have 'em in Japan, not even in their mines.We've samurai rowers.They're soldiers, the old bugger's personal soldiers -- and you've never seen slaves row better, or men fight better!"" He laughs.""We came all the way from Osaka -- three-hundred-odd sea miles in forty hours."""
?CCL63:	EQUAL?	PRSO,GLOBAL-SAMURAI \?CCL65
	PRINTR	"""You've got to be born one.It's hereditary mostly, like with us.In the olden days, peasants could be soldiers and soldiers peasants.Some peasant soldiers rose to the highest rank.The Taiko was one."""
?CCL65:	EQUAL?	PRSO,TAIKO \?CCL67
	PRINTR	"""The Great Despot, the ruler of all Japan, the Great Murderer of all times.He died a year ago and now he's burning in hell."""
?CCL67:	EQUAL?	PRSO,TORANAGA \?CCL69
	PRINTI	"""The Great Lord High Executioner himself!Lord of the Eight Provinces, the chief "
	ICALL2	PRINTUNDER,STR?82
	PRINTR	" of Japan -- like a king or a feudal lord but better.They're all despots."""
?CCL69:	EQUAL?	PRSO,ME \?CCL71
	PRINTR	"""You're an Ingeles pirate, and a heretic, but a Pilot is a Pilot, by God!"""
?CCL71:	EQUAL?	SCENE,S-VOYAGE \?CCL73
	PRINTR	"""Pay attention to the storm, Ingeles!"""
?CCL73:	PRINTI	"""I've nothing to say about "
	ICALL2	PRINT-HIM/HER,PRSO
	PRINTR	", Ingeles!"""
?CCL60:	EQUAL?	PRSA,V?DODGE,V?LOOK-OUT \?CCL75
	EQUAL?	PRSO,ROOMS,ARCHERS \?CCL75
	SET	'WINNER,PLAYER
	ICALL	PERFORM,V?WARN,RODRIGUES,ARCHERS
	RTRUE	
?CCL75:	EQUAL?	PRSA,V?SHUT-UP \?CCL79
	EQUAL?	PRSO,ROOMS \?CCL79
	PRINTR	"""Thy mother!"" he curses."
?CCL79:	EQUAL?	PRSA,V?HELLO \?CCL83
	PRINTR	"""Cheerful, aren't you?I've heard you Ingeles are all crazy,"" he remarks genially."
?CCL83:	PRINTI	"""God curse you, Ingeles!"" snaps "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTR	"."
?CCL5:	EQUAL?	RARG,M-CONTAINER \?CCL85
	PRINTR	"""Not so fast, Ingeles!"""
?CCL85:	EQUAL?	PRSA,V?EXAMINE \?CCL87
	EQUAL?	HERE,CLIFF-PATH \?CCL90
	PRINTR	"You can only see that he's still clinging to the oar you threw.From here, it's impossible to tell if he's alive or dead.His legs rise and fall with the waves."
?CCL90:	EQUAL?	HERE,MAIN-DECK \?CCL92
	IN?	RODRIGUES,GALLEY \FALSE
	PRINTR	"You look back at the quarterdeck to curse Rodrigues for letting the helm get away from him.He waves and points and shouts, and you see that the course has changed.You realize the swerve had been planned, but the bastard could have warned you!"
?CCL92:	ICALL2	CTHE-PRINT,RODRIGUES
	PRINTR	" is a man as tall as you and about your own age, but black-haired and dark-eyed and carelessly dressed in seaman's clothes, rapier by his side, pistols in his belt.A jeweled crucifix hangs from his neck.He wears a jaunty cap."
?CCL87:	EQUAL?	PRSA,V?TIE \?CCL97
	EQUAL?	PRSO,RODRIGUES \?CCL97
	PRINTR	"""I've no time for that now, Ingeles!"""
?CCL97:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL101
	EQUAL?	PRSO,RODRIGUES \?CCL101
	EQUAL?	PRSI,LG-ERASMUS,STRAIT-OF-MAGELLAN /?CTR105
	EQUAL?	PRSI,SLAVER \?CCL106
	CALL	NOUN-USED?,PRSI,W?SHIP
	ZERO?	STACK /?CCL106
?CTR105:	FSET?	LIZARD,SCOREBIT /?CTR112
	EQUAL?	SCENE,S-VOYAGE \?CCL113
?CTR112:	PRINTR	"""Don't try to distract me, you heretic!"""
?CCL113:	FSET?	LG-ERASMUS,SCOREBIT \?CCL117
	PRINTI	"You tell him about your ship, how you lost the foremast just before making landfall, how the samurai wouldn't let you retrieve your gear.""Listen, Rodrigues, there's no chance of going aboard, is there?They haven't let me back aboard, I've no clothes and they sealed her up the moment we arrived.""You carefully avoid mentioning your rutters."
	CRLF	
	CRLF	
	ICALL2	LETS-GO-ABOARD,TRUE-VALUE
	CALL2	SCORE-OBJECT,LG-ERASMUS
	RSTACK	
?CCL117:	PRINTR	"""Don't bore me, Ingeles!"""
?CCL106:	EQUAL?	PRSI,GLOBAL-RUTTERS,SECRET-RUTTER,RUTTER \?CCL119
	PRINTI	"You start to tell him about how you haven't been able to retrieve your rutters, and you stop short.This man may be a pilot, but he's a Portuguese, a Catholic, and an enemy.You want his help in getting out to the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	", but don't want to mention the rutters.Maybe the ship alone would interest him enough?"
?CCL119:	EQUAL?	PRSI,ME,BLACKTHORNE \FALSE
	PRINTR	"You tell him a little about yourself.He has heard of your voyage to the Arctic, and is impressed."
?CCL101:	EQUAL?	PRSA,V?SHOW,V?GIVE \?CCL123
	EQUAL?	PRSI,RODRIGUES \?CCL123
	EQUAL?	PRSO,LIFE-RING \?CCL128
	MOVE	LIFE-RING,RODRIGUES
	PRINTR	"""Aye, Ingeles, we'll all be needing them if this storm continues.""He rubs his chin.""I never learned to swim, you know."""
?CCL128:	PRINTI	"Rodrigues examines "
	ICALL1	THE-PRINT-PRSO
	PRINTR	" with little enthusiasm."
?CCL123:	EQUAL?	PRSA,V?CURSE \?CCL130
	PRINTI	"""Thy mother, Ingeles!"" responds "
	ICALL2	THE-PRINT,RODRIGUES
	PRINTR	"."
?CCL130:	EQUAL?	PRSA,V?WHO \?CCL132
	FSET?	PRSO,NOABIT \?CCL135
	PRINTI	"He's a Portuguese pilot"
	EQUAL?	SCENE,S-RODRIGUES /?CCL138
	PRINTI	", a bluff, crude seaman who hates England and all Protestants, but believes in the brotherhood of pilots.He got you aboard the "
	ICALL2	PRINTUNDER,STR?7
	PRINTR	" to make a true search, and your rutters were nowhere to be found!"
?CCL138:	PRINTR	"."
?CCL135:	PRINT	YOU-HAVE-TO
	PRINTR	"ask him."
?CCL132:	EQUAL?	PRSA,V?BOW \?CCL140
	PRINTR	"""You do that just like a Japman, Ingeles!"" he replies, impressed."
?CCL140:	EQUAL?	PRSA,V?PUSH-TO \?CCL142
	EQUAL?	PRSO,RODRIGUES \?CCL142
	PRINTR	"He shoves you back just as hard.""Watch yourself, Ingeles!"" he yells."
?CCL142:	EQUAL?	PRSA,V?WHAT \FALSE
	CALL	NOUN-USED?,PRSO,W?PILOT
	ZERO?	STACK /FALSE
	PRINTR	"A pilot is the one who knows how to get the ship where it wants to go, and back again."


	.FUNCT	TRAINED?:ANY:0:0
	EQUAL?	PRSA,V?TRAIN \?CCL3
	EQUAL?	PRSO,TRINITY-HOUSE \?CCL3
	CALL	NOUN-USED?,PRSO,W?TRINITY
	ZERO?	STACK \?PRD7
	CALL	NOUN-USED?,PRSO,W?HOUSE
	ZERO?	STACK /?CCL3
	CALL	ADJ-USED?,PRSO,W?TRINITY
	ZERO?	STACK /?CCL3
?PRD7:	CALL1	PAST-TENSE?
	ZERO?	STACK \TRUE
?CCL3:	EQUAL?	PRSA,V?BE \FALSE
	EQUAL?	PRSO,ME \FALSE
	EQUAL?	PRSI,INTPP \FALSE
	GET	PARSE-RESULT,11
	EQUAL?	W?TRAINED,STACK \FALSE
	CALL1	P-PP-OBJ
	EQUAL?	TRINITY-HOUSE,STACK /TRUE
	RFALSE	


	.FUNCT	LG-RODRIGUES-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	SET	'WINNER,PLAYER
	EQUAL?	HERE,CLIFF-PATH \?CCL8
	ICALL	PERFORM,V?YELL-AT,YABU
	JUMP	?CND6
?CCL8:	ICALL	PERFORM,V?YELL-AT,LG-RODRIGUES
?CND6:	ICALL1	END-QUOTE
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?TELL \?CCL10
	EQUAL?	HERE,CLIFF-PATH \?CCL10
	PRINTI	"He's in no condition to respond."
	CRLF	
	ICALL1	END-QUOTE
	RTRUE	
?CCL10:	EQUAL?	PRSA,V?EXAMINE \?CCL14
	IN?	RODRIGUES,IN-THE-SEA \?CCL17
	EQUAL?	HERE,MAIN-DECK,GALLEY,IN-THE-SEA \?CCL20
	PRINTR	"He's out there among the waves, drowning."
?CCL20:	PRINTR	"The last you saw of him, he was being carried away by the waves."
?CCL17:	IN?	RODRIGUES,LEDGE-4 \?CCL22
	IN?	YABU,LEDGE-4 \?CCL25
	PRINTR	"Yabu has dragged him out of the water."
?CCL25:	PRINTR	"His body is caught in a cleft between two rocks at the base of the cliff."
?CCL22:	IN?	RODRIGUES,LEDGE-3 \FALSE
	PRINTR	"Yabu is carrying him up the cliff."
?CCL14:	EQUAL?	PRSA,V?HELP,V?TAKE,V?WALK-TO \?CCL29
	IN?	RODRIGUES,IN-THE-SEA \?CCL29
	FSET?	RODRIGUES,DEAD \?CCL34
	PRINTR	"You can't see his body anywhere.He must have drowned, but where is his body?"
?CCL34:	EQUAL?	HERE,GALLEY,MAIN-DECK,IN-THE-SEA \?CCL36
	PRINTR	"His head appears and disappears among the waves.You can see he's in danger of drowning, but you can't reach him."
?CCL36:	PRINTR	"You don't know where he is."
?CCL29:	EQUAL?	PRSA,V?SMELL \?CCL38
	PRINTR	"If he's dead, it hasn't been that long."
?CCL38:	EQUAL?	PRSA,V?FIND \?CCL40
	EQUAL?	HERE,MAIN-DECK,GALLEY,IN-THE-SEA \?CCL43
	PRINTR	"He's out there somewhere.As a fellow pilot, you owe him a decent burial, not the tender ministrations of the crabs."
?CCL43:	EQUAL?	HERE,CLIFF-PATH \?CCL45
	FSET?	AROUND-HEADLAND,TOUCHBIT \?CCL45
	ICALL2	PERFORM,V?LOOK-DOWN
	RTRUE	
?CCL45:	PRINTR	"You scan the foreshore.You know there is minimal hope of finding Rodrigues, there are too many caves and hidden places that could never be investigated.But you have to try.All pilots pray helplessly for death ashore and burial ashore.All have seen too many sea-bloated corpses and half-eaten corpses and crab-mutilated corpses."
?CCL40:	CALL1	PASSIVE-VERB?
	ZERO?	STACK \?CCL49
	EQUAL?	HERE,CLIFF-PATH \?CCL49
	PRINTR	"Rodrigues is out of reach."
?CCL49:	LOC	RODRIGUES
	EQUAL?	STACK,MAIN-DECK,GALLEY \FALSE
	EQUAL?	PRSA,V?SHOW /?CCL56
	CALL1	PASSIVE-VERB?
	ZERO?	STACK /?CCL56
	ICALL	REDIRECT,LG-RODRIGUES,RODRIGUES
	RTRUE	
?CCL56:	PRINTR	"Rodrigues isn't here."


	.FUNCT	DICTIONARY-F:ANY:0:0,WD,PHR
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"This book is a Portuguese-Latin-Japanese dictionary and grammar.The printing is the best you have ever seen, the quality and detail staggering.Father Alvito gave it to you at Toranaga's 'request.'  ""Three of our Brethren spent twenty-seven years preparing that."""
?CCL3:	EQUAL?	PRSA,V?PUT \?CCL5
	EQUAL?	PRSI,YOKOSE-BATHTUB \?CCL5
	PRINTR	"Never!"
?CCL5:	EQUAL?	PRSA,V?READ \?CCL9
	CALL2	HELD?,PRSO
	ZERO?	STACK /?CCL12
	PRINTR	"You read the dictionary hungrily.It means you can learn Japanese all the faster.A priceless book, more valuable than a rutter!"
?CCL12:	CALL2	NOT-HOLDING,PRSO
	RSTACK	
?CCL9:	EQUAL?	PRSA,V?LOOK-UP \FALSE
	EQUAL?	PRSI,DICTIONARY \FALSE
	CALL2	HELD?,PRSI
	ZERO?	STACK /?CCL19
	EQUAL?	PRSO,INTQUOTE \?CCL22
	CALL2	GET-INTQUOTE,1 >WD
	JUMP	?CND20
?CCL22:	CALL2	GET-NP,PRSO
	GET	STACK,2 >WD
?CND20:	PRINTI	"You look up '"
	CALL1	JAPANESE-PHRASE? >PHR
	ZERO?	PHR \?CCL24
	CALL2	JAPANESE-WORD?,WD >WD
	ZERO?	WD /?CND23
?CCL24:	HLIGHT	H-UNDER
?CND23:	EQUAL?	PRSO,INTQUOTE \?CCL29
	ICALL1	PRINT-INTQUOTE
	JUMP	?CND27
?CCL29:	PRINTB	WD
?CND27:	ZERO?	PHR \?CCL31
	ZERO?	WD /?CND30
?CCL31:	HLIGHT	H-NORMAL
?CND30:	PRINTI	"' and find "
	ZERO?	PHR \?CTR35
	ZERO?	WD /?CCL36
?CTR35:	ZERO?	PHR /?CCL41
	PRINTI	"that it means '"
	PRINT	PHR
	PRINTR	"'"
?CCL41:	GET	WD,1 >WD
	ZERO?	WD /?CCL43
	PRINTI	"that it means '"
	PRINT	WD
	PRINTR	".'"
?CCL43:	PRINTR	"the Latin and Portuguese equivalents, which you can then translate into English."
?CCL36:	PRINTR	"the Japanese equivalent, including examples of correct usage."
?CCL19:	CALL2	NOT-HOLDING,PRSI
	RSTACK	


	.FUNCT	JAPANESE-WORD?:ANY:1:1,WD,?TMP1
	ADD	JAPANESE-VOCABULARY,2 >?TMP1
	GET	JAPANESE-VOCABULARY,0
	DIV	STACK,2
	INTBL?	WD,?TMP1,STACK,132 /?BOGUS1
?BOGUS1:	RSTACK	


	.FUNCT	JAPANESE-PHRASE?:ANY:0:0,CNT,LEN,TBL
	GET	JAPANESE-PHRASES,0 >LEN
	ADD	JAPANESE-PHRASES,2 >TBL
?PRG1:	EQUAL?	CNT,LEN /FALSE
	GET	TBL,0
	CALL2	MATCH-INTQUOTE?,STACK
	ZERO?	STACK /?CCL7
	GET	TBL,1
	RSTACK	
?CCL7:	ADD	CNT,2 >CNT
	ADD	TBL,4 >TBL
	JUMP	?PRG1


	.FUNCT	MATCH-INTQUOTE?:ANY:1:1,TBL,NP,X,LEN,CNT,WD,?TMP1
	CALL2	GET-NP,INTQUOTE >NP
	GET	NP,7
	ADD	STACK,4 >X
	GET	NP,8 >?TMP1
	GET	NP,7
	SUB	?TMP1,STACK
	DIV	STACK,4
	ADD	-1,STACK >LEN
	GET	TBL,0 >CNT
	ADD	TBL,2 >TBL
?PRG1:	GET	X,0 >WD
	EQUAL?	WD,0,W?INT.NUM,W?INT.TIM /FALSE
	EQUAL?	WD,W?NO.WORD,W?COMMA,W?QUOTE /?CTR6
	EQUAL?	WD,W?PERIOD,W?APOSTROPHE \?CCL7
?CTR6:	DEC	'LEN
	JUMP	?CND3
?CCL7:	GRTR?	CNT,0 \FALSE
	GET	TBL,0
	EQUAL?	WD,STACK \FALSE
	DEC	'LEN
	DEC	'CNT
	ADD	TBL,2 >TBL
?CND3:	ZERO?	CNT \?CCL16
	ZERO?	LEN /TRUE
?CCL16:	ADD	X,4 >X
	JUMP	?PRG1

	.ENDSEG

	.ENDI
