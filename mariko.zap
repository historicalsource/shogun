
	.SEGMENT "OCHIBA"


	.FUNCT	OCHIBA-ROOM-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	MOVE	CAMELLIA,BLACKTHORNE
	MOVE	SWORDS,BLACKTHORNE
	FSET	SWORDS,WEARBIT
	FSET	SWORDS,RMUNGBIT
	MOVE	ISHIDO,OCHIBA-ROOM
	MOVE	OCHIBA,OCHIBA-ROOM
	CALL	QUEUE,I-OCHIBA,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?BOW,V?HELLO,V?KONNICHI-WA /?PRD12
	EQUAL?	PRSA,V?KONBANWA \?PRD10
?PRD12:	EQUAL?	PRSO,FALSE-VALUE,OCHIBA,ISHIDO /?CTR7
?PRD10:	EQUAL?	PRSA,V?KNEEL \?CCL8
?CTR7:	FSET?	BLACKTHORNE,TRYTAKEBIT \?CCL17
	EQUAL?	PRSA,V?HELLO,V?KONNICHI-WA,V?KONBANWA \?CCL20
	EQUAL?	PRSO,OCHIBA,FALSE-VALUE \?CCL20
	SET	'WINNER,OCHIBA
	ICALL2	PERFORM,V?HELLO
	SET	'WINNER,PLAYER
	RTRUE	
?CCL20:	PRINTR	"You have already bowed to the hosts."
?CCL17:	FSET?	OCHIBA,RMUNGBIT \?CCL24
	FSET	BLACKTHORNE,TRYTAKEBIT
	ICALL1	B-STAND
	PRINTI	"In front of the platform, you kneel and bow formally as you have seen the others do, once to Ochiba and once to Ishido.You then stand and walk forward."
	FSET?	SWORDS,WEARBIT \?CND25
	FSET?	SWORDS,RMUNGBIT \?CND25
	FCLEAR	SWORDS,RMUNGBIT
	FCLEAR	SWORDS,WEARBIT
	MOVE	SWORDS,HERE
	PRINTR	"Suddenly, just as you had feared, your sword belt comes loose and your swords clatter to the floor.You turn red, scrambling for them on the ground, and Ishido begins a swelling round of humiliating laughter."
?CND25:	CRLF	
	RTRUE	
?CCL24:	PRINTR	"You must be very nervous: you aren't at the front of the line yet!"
?CCL8:	EQUAL?	PRSA,V?CURSE \?CCL30
	EQUAL?	PRSO,ISHIDO,OCHIBA \?CCL30
	PRINTI	"You insult "
	ICALL1	DPRINT-PRSO
	PRINTR	", forfeiting any gain you might have gotten from the exchange."
?CCL30:	CALL1	ACT-CRAZY?
	ZERO?	STACK /?CCL34
	EQUAL?	QCONTEXT,ISHIDO \?CCL37
	PRINTR	"Ishido stares at you.""This is what I meant!"""
?CCL37:	PRINTR	"Ochiba looks disgusted."
?CCL34:	CALL1	HOSTILE-VERB?
	ZERO?	STACK \?CCL39
	EQUAL?	PRSA,V?DRAW,V?PICK,V?USE /?PRD43
	EQUAL?	PRSA,V?TAKE \FALSE
?PRD43:	EQUAL?	PRSO,SWORDS \FALSE
?CCL39:	PRINTR	"Such a foolish action would surely lead to your immediate death."


	.FUNCT	NOT-A-BARBARIAN?:ANY:0:0
	EQUAL?	PRSA,V?BE \FALSE
	EQUAL?	PRSO,BLACKTHORNE,ME \FALSE
	CALL1	P-NEGATIVE?
	ZERO?	STACK /?CCL8
	EQUAL?	PRSI,GLOBAL-BARBARIAN,CRAZY /TRUE
	RFALSE	
?CCL8:	EQUAL?	PRSI,GLOBAL-SAMURAI,GLOBAL-HATAMOTO /TRUE
	EQUAL?	PRSI,INTADJ \FALSE
	GET	PARSE-RESULT,11
	EQUAL?	STACK,W?SAMURAI /TRUE
	RFALSE	


	.FUNCT	CAMELLIA-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"This is a particularly beautiful pink camellia blossom that you cut from a tree in the garden.It is at the peak of its beauty."
?CCL3:	EQUAL?	PRSA,V?GIVE \FALSE
	EQUAL?	PRSO,CAMELLIA \FALSE
	EQUAL?	PRSI,OCHIBA \FALSE
	FSET?	BLACKTHORNE,TRYTAKEBIT /?CCL11
	PRINTR	"Ochiba recoils from the unaccustomed familiarity.You haven't even greeted her properly.""His manners are barbaric,"" she says to Ishido, with sadness."
?CCL11:	REMOVE	CAMELLIA
	ICALL2	SCORE-OBJECT,CAMELLIA
	PRINTR	"""In my land we are ruled by a Queen.We have the custom to always give a Lady a birthday gift.Even a Queen.Please excuse if this is not good manners.""She looks at the flower.Five hundred people wait to see how she will respond to your gallantry and daring.

""I am not a Queen, Anjin-san, only the mother of the Heir and widow of the Lord Taiko.I cannot accept your gift as a Queen, but as a Lady on her birthday, perhaps I may ask everyone's permission to accept the gift?""

The room bursts into applause."


	.FUNCT	I-OCHIBA:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	OCHIBA-CNT,2 \?CCL5
	FSET?	BLACKTHORNE,TRYTAKEBIT /?CND3
	GRTR?	DELAY-CNT,4 \?CCL10
	CRLF	
	PRINTI	"Ishido stands, bows to Lady Ochiba, and asks, ""With your permission, Lady, I will remove this insult to your person."""
	CRLF	
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL10:	CRLF	
	PRINTR	"Every eye is on you as you stand before Ochiba.Every breath is held."
?CCL5:	EQUAL?	OCHIBA-CNT,4 \?CCL12
	EQUAL?	OCHIBA-QUESTION,1 \?CND3
	GRTR?	DELAY-CNT,2 \?CCL17
	SET	'OCHIBA-QUESTION,FALSE-VALUE
	CRLF	
	PRINTR	"""Ah, I suppose what we have heard is not true, then.He must not truly speak our language.""She turns to Ishido and smiles."
?CCL17:	CRLF	
	PRINTR	"""Is it true that you speak our language, Anjin-san?"" she asks in a friendly way, using the Japanese that you can barely understand."
?CCL12:	EQUAL?	OCHIBA-CNT,7 \?CND3
	EQUAL?	OCHIBA-QUESTION,2 \?CND3
	GRTR?	DELAY-CNT,3 \?CCL23
	SET	'OCHIBA-QUESTION,0
	CRLF	
	PRINTR	"""Bah!It is clear he is a barbarian without honor!""Ishido turns away with a snort of dirision."
?CCL23:	CRLF	
	PRINTI	"Ishido continues to taunt you.""You are a barbarian.You "
	ICALL2	PRINTUNDER,STR?590
	PRINTR	" are prone to fits of madness, as I've been told?""The room is hushed, everyone waiting to see how you will respond."
?CND3:	SET	'DELAY-CNT,0
	INC	'OCHIBA-CNT
	EQUAL?	OCHIBA-CNT,1 \?CCL26
	CRLF	
	PRINTR	"The procession of guests creeps forward, each politely bowing to Ochiba and greeting her on her birthday."
?CCL26:	EQUAL?	OCHIBA-CNT,2 \?CCL28
	FSET	OCHIBA,RMUNGBIT
	CRLF	
	PRINTR	"Ochiba is looking at you, and then Ishido is looking at you, too.Soon all conversation dies and everyone is watching you.The men and women ahead of you in line melt away and suddenly no one is between you and the platform."
?CCL28:	EQUAL?	OCHIBA-CNT,3 /TRUE
	EQUAL?	OCHIBA-CNT,4 \?CCL31
	SET	'OCHIBA-QUESTION,1
	SET	'QCONTEXT,OCHIBA
	CRLF	
	PRINTI	"""Please wait, Anjin-san,"" says Ochiba.You feel the extraordinary sensuality that surrounds her, without conscious effort on her part."""
	FSET?	HANASE-MASEN,RMUNGBIT \?CCL34
	PRINTR	"You speak our language, then?"""
?CCL34:	PRINTR	"It is said that you speak our language?"""
?CCL31:	EQUAL?	OCHIBA-CNT,5 /TRUE
	EQUAL?	OCHIBA-CNT,6 \?CCL37
	SET	'QCONTEXT,ISHIDO
	CRLF	
	PRINTR	"Ishido rudely interrupts.""When we last met, you were a madman.I hope you won't get mad tonight or any other night."""
?CCL37:	EQUAL?	OCHIBA-CNT,7 \?CCL39
	SET	'QCONTEXT,ISHIDO
	SET	'OCHIBA-QUESTION,2
	CRLF	
	PRINTI	"""Such madness is usual among you barbarians, "
	ICALL2	PRINTUNDER,STR?587
	PRINTR	"""He emphasizes the word 'barbarians.'  Such public rudeness to a guest is very bad.Lady Ochiba seems surprised."
?CCL39:	EQUAL?	OCHIBA-CNT,8 \?CCL41
	MOVE	MARIKO,HERE
	CRLF	
	PRINTI	"""Mariko-san, your pupil does you credit, "
	ICALL2	PRINTUNDER,STR?587
	PRINTR	""" calls out Ochiba.Mariko is coming through the guests.""I have done little, Ochiba-sama.It's all the Anjin-san's work and the word book that the Christian fathers gave him."""
?CCL41:	EQUAL?	OCHIBA-CNT,9 \?CCL43
	CRLF	
	PRINTI	"Ochiba turns to Mariko.""Now, Mariko-san, we must talk about the poetry competition!It will be held in two days, when Lord Toranaga leaves his own borders to journey here.What's the theme to be?And the first line of the poem?""Mariko is renowned as a poetess.

Mariko thinks a moment.""It should be about "
	ICALL2	PRINTUNDER,STR?591
	PRINTR	", Lady Ochiba, and the first line: 'On a leafless branch.'""

Ishido compliments her on her choice.""Excellent, but we'll have to be very good to compete with you, Mariko-san!"""
?CCL43:	EQUAL?	OCHIBA-CNT,10 \?CCL45
	CRLF	
	PRINTR	"Mariko continues, ""So sorry, Sire, but I will not be there.I'm leaving Osaka tomorrow with the Lady Kiritsubo and the Lady Sazuko, to meet Lord Toranaga.""

""Nonsense!"" replies Ishido.""He will be here so soon that to go to meet him isn't necessary.""

""So sorry, Sire, but those are the orders of my liege Lord.I must leave tomorrow.Am I confined here?And if so, on whose orders?""

Ishido keeps his eyes riveted on her.""No, you are not confined."""
?CCL45:	EQUAL?	OCHIBA-CNT,11 \?CCL47
	CRLF	
	PRINTR	"Many of the ladies in the room turn to their neighbors, and some whisper openly what all those held against their will in Osaka are thinking: 'If she can go, so can I, so can you!I'll leave tomorrow, too!'"
?CCL47:	EQUAL?	OCHIBA-CNT,12 \FALSE
	CRLF	
	PRINTI	"Mariko makes a half-bow to the room and leaves.Yabu steps forward with you and the two of you follow her out, very conscious that you are the only samurai present wearing Toranaga's uniform."
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	OCHIBA-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	PRINTI	"On the platform, alone, is the Lady Ochiba."
	RTRUE	


	.FUNCT	OCHIBA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?YES,V?HAI,V?NO /?CTR7
	EQUAL?	PRSA,V?IYE /?CTR7
	EQUAL?	PRSA,V?SAY \?PRD12
	EQUAL?	PRSO,JAPANESE /?CTR7
?PRD12:	EQUAL?	PRSA,V?NIHON-GO-GA \?CCL8
	EQUAL?	PRSO,HANASE-MASEN \?CCL8
?CTR7:	EQUAL?	OCHIBA-QUESTION,1 /?CTR18
	EQUAL?	PRSA,V?NIHON-GO-GA \?CCL19
	EQUAL?	PRSO,HANASE-MASEN \?CCL19
?CTR18:	SET	'OCHIBA-QUESTION,FALSE-VALUE
	EQUAL?	PRSA,V?HAI,V?IYE,V?SPEAK /?CCL25
	EQUAL?	PRSA,V?NIHON-GO-GA \?CND24
?CCL25:	FSET	HANASE-MASEN,RMUNGBIT
?CND24:	EQUAL?	PRSA,V?NO,V?IYE \?CCL30
	PRINTI	"""No, Highness.I have learned a few words and phrases, so that I may better be understood, however."
	JUMP	?CND28
?CCL30:	PRINTI	"""Please excuse me, Highness."
?CND28:	PRINTR	"I have to use short words and respectfully ask you to use simple words with me."""
?CCL19:	PRINTR	"She doesn't seem to be listening."
?CCL8:	EQUAL?	PRSA,V?HELLO \?CCL32
	FSET?	OCHIBA,TRYTAKEBIT /?CCL35
	FSET	OCHIBA,TRYTAKEBIT
	PRINTR	"""May I respectfully congratulate you on your birthday and pray that you live to enjoy a thousand more."""
?CCL35:	PRINTR	"You have already congratulated her."
?CCL32:	EQUAL?	PRSA,V?THANK \?CCL37
	EQUAL?	PRSO,YOU \?CCL37
	PRINTR	"""Domo, Ochiba-sama.""She acknowledges your thanks."
?CCL37:	EQUAL?	PRSA,V?NO /?CTR40
	CALL1	NOT-A-BARBARIAN?
	ZERO?	STACK /?CCL41
?CTR40:	PRINTR	"""This may be true, Anjin-san, but your manners are less than perfect."""
?CCL41:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL45
	PRINTR	"She is slight, almost girlish in build, with a luminous glow to her fair skin.She is at the peak of her beauty.Her sloe eyes are large under painted, arched brows, her hair set like a winged helmet.Her kimono is exquisitely rich, gold threads on the rarest blue-black silk.She sits comfortably on a cushion."
?CCL45:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"The Lady Ochiba is the widow of the Taiko, and the mother of the Heir, Yaemon.The rumors say that she is now the mistress of Lord Ishido.All Japan wonders if the Taiko, who had never before sired a child, was truly the Yaemon's father, but only Ochiba knows for sure."

	.ENDSEG

	.SEGMENT "DEPARTURE"


	.FUNCT	DEPARTURE-AFTER-F:ANY:0:0
	PRINTI	"Ishido and his supporters meet in Kiyama's opulent, overrich quarters.

""It's impossible, Lord General,"" Ochiba says.""You can't let a lady of her rank commit seppuku.So sorry, but you've been trapped.The hostages will have to be freed, and then there's nothing to stop Toranaga.""

""I agree,"" Lord Kiyama says forcefully.

""With due humility, Lady,"" Ishido replies, ""whatever I said or didn't say, doesn't matter an "
	ICALL2	PRINTUNDER,STR?218
	PRINTR	"'s turd to her.She's already decided, at least Toranaga has.We are at war, Toranaga's not yet in our hands, and until he's dead the Heir is in total danger.""

He walks over to the window.""Suppose she's disarmed?Capture her!Confine her until Toranaga's in our hands, then the hostages don't matter.In eighteen days Toranaga has to be here!""

""You really think Lady Toda could be captured?"" Kiyama says.

""Yes,"" replies Ishido."


	.FUNCT	I-DEPARTURE:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	DEPARTURE-CNT,2 \?CND3
	CALL2	QUEUED?,I-FIGHT
	ZERO?	STACK \FALSE
?CND3:	SET	'DELAY-CNT,0
	INC	'DEPARTURE-CNT
	EQUAL?	DEPARTURE-CNT,1 \?CCL9
	MOVE	YAMAZAKI,FORECOURT
	ICALL2	THIS-IS-IT,YAMAZAKI
	CRLF	
	PRINTR	"Twenty Browns form up as a vanguard and move off.Porters pick up Mariko's palanquin and follow the Browns, Kiri and Lady Sazuko close behind.

When Mariko's palanquin comes into the sunlight, a Captain of Grays steps forward, standing directly in her way.""May I see your papers?"" he inquires.

Mariko says formally, ""We require none.I am Toda Mariko-noh-Buntaro and I have been ordered by my leige Lord, Lord Toranaga, to escort his ladies to meet him.Kindly let us pass.""

""My name is Yamazaki Danzenji, Captain of the Fourth Legion, and my line is as ancient as your own, my Lady.Please excuse me, but my leige Lord, Lord Ishido, says no one may leave Osaka Castle without papers.""

""So sorry, Captain, but if you do not move out of the way I will order you killed."""
?CCL9:	EQUAL?	DEPARTURE-CNT,2 \?CCL11
	ICALL	QUEUE,I-FIGHT,-1
	SET	'OPPONENT,YAMAZAKI
	CRLF	
	PRINT	STR?592
	PRINTR	" the Gray Captain replies proudly.Mariko nods sadly.""Please kill him,"" she orders quietly, and at once the battle is joined.It is terrifyingly fair and formal, one Gray for each Brown and one for yourself."
?CCL11:	EQUAL?	DEPARTURE-CNT,3 \?CCL13
	MOVE	MARIKO,HERE
	MOVE	KOJIMA,HERE
	SET	'OPPONENT,KOJIMA
	ICALL2	THIS-IS-IT,KOJIMA
	CRLF	
	PRINTR	"Almost immediately, twenty more Browns run forward to form a new vanguard.From up ahead twenty more Grays move silently out from the hundreds that are waiting.

""Wait,"" Mariko orders.She steps out of her palanquin and picks up a sword, unsheaths it, and walks forward alone.She approaches the officer.""You know who I am.Please get out of my way.""

""I am Kojima Harutomo, Captain of the Sixth Legion.Please excuse me, you may not pass, Lady."""
?CCL13:	EQUAL?	DEPARTURE-CNT,4 \?CCL15
	CRLF	
	PRINTR	"Mariko darts forward but her blow is contained.The Gray stays on the defensive although he could kill her without effort.

Again Mariko tries to bring the Gray to battle, but he slides away, allowing her to exhaust herself.But he does this gravely, giving her every courtesy, giving her the honor that is her due.She knows she cannot last much longer.She sees how easy it would be for the massed Grays to cut them all off if they wish and leave them stranded and helpless.She breaks off the fight."
?CCL15:	EQUAL?	DEPARTURE-CNT,5 \?CCL17
	SET	'OPPONENT,FALSE-VALUE
	MOVE	ISHIDO,HERE
	CRLF	
	PRINTR	"Lord Ishido emerges from the crowd of Grays.""Lady Toda, the castle orders must be obeyed.But if you wish, I will call a meeting of the Regents and ask for a ruling.""

Mariko turns to Ishido and bows.""My orders are clear.If I am not permitted to obey, I will not be able to live with that shame."""
?CCL17:	EQUAL?	DEPARTURE-CNT,6 \FALSE
	CRLF	
	PRINTI	"""These men have prevented me from doing my duty, from obeying my leige Lord.I cannot live with this shame, Sire.Unless we are allowed to obey our leige Lord, as is our right, I will commit seppuku at sunset!""

She bows and walks toward the gateway.All in the avenue and all on the battlements bow to her in homage.She goes into the garden, her footsteps taking her to the secluded, rustic little tea house.She goes inside and, once there, she weeps silently for all the men who have died."
	CRLF	
	REMOVE	KOJIMA
	REMOVE	YAMAZAKI
	REMOVE	MARIKOS-LITTER
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	YAMAZAKI-F:ANY:0:1,RARG,H
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?WHO \?CCL8
	EQUAL?	PRSO,YAMAZAKI,YOU \?CCL8
	PRINTR	"""My name is Yamazaki Danzenji, Captain of the Fourth Legion!"""
?CCL8:	EQUAL?	PRSA,V?STOP \?CCL12
	PRINT	STR?592
	CRLF	
	RTRUE	
?CCL12:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL14
	FSET?	PRSO,DEAD \?CCL17
	PRINTR	"He is dead.You have killed him."
?CCL17:	PRINT	STR?274
	CRLF	
	RTRUE	
?CCL14:	EQUAL?	PRSA,V?BOW \?CCL19
	PRINTR	"He looks you over carefully, considering his options."
?CCL19:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	EQUAL?	PRSA,V?BITE,V?PISS,V?SPIT /?CTR23
	EQUAL?	PRSA,V?KICK \?CCL24
?CTR23:	PRINTR	"He is clearly insulted that you would ever try such a barbaric action."
?CCL24:	EQUAL?	PRSO,YAMAZAKI \?PRD30
	EQUAL?	PRSI,SWORDS,FALSE-VALUE \?CTR27
?PRD30:	EQUAL?	PRSI,YAMAZAKI \?CCL28
	EQUAL?	PRSO,SWORDS,FALSE-VALUE /?CCL28
?CTR27:	PRINTR	"You aren't taking him very seriously, are you?"
?CCL28:	FSET?	YAMAZAKI,DEAD \?CCL36
	PRINTR	"You strike the already-dead Gray with your sword.The onlookers are shocked at this insult to a worthy opponent!"
?CCL36:	FSET?	YAMAZAKI,RMUNGBIT /?CCL38
	CALL2	QUEUED?,I-FIGHT
	ZERO?	STACK /?CCL41
	FSET	YAMAZAKI,RMUNGBIT
	FSET?	SWORDS,WEARBIT \?CCL44
	FCLEAR	SWORDS,WEARBIT
	PRINTR	"You draw your sword, and the Captain bows to you and does the same."
?CCL44:	SET	'DELAYING-FIGHT?,FALSE-VALUE
	PRINTR	"You strike at the Gray Captain, and he dodges expertly as he draws his sword.He is clearly shocked that you would attack him before he had a chance to draw his sword."
?CCL41:	PRINTR	"""Not yet, Anjin-san!Wait for my order!"""
?CCL38:	ZERO?	YAMAZAKI-ATTACK \?CCL46
	SET	'DELAYING-FIGHT?,FALSE-VALUE
	PRINTR	"You swing powerfully if somewhat inexpertly with your sword.The Captain parries."
?CCL46:	SET	'DELAYING-FIGHT?,FALSE-VALUE
	SET	'YAMAZAKI-ATTACK,FALSE-VALUE
	GETP	YAMAZAKI,P?HEALTH >H
	DEC	'H
	PUTP	YAMAZAKI,P?HEALTH,H
	CALL2	PICK-ONE,SWORD-ATTACKS
	PRINT	STACK
	CRLF	
	ZERO?	H \TRUE
	FSET	YAMAZAKI,DEAD
	SET	'OPPONENT,FALSE-VALUE
	GETP	BROWNS,P?COUNT
	ZERO?	STACK \?CND49
	ICALL2	DEQUEUE,I-FIGHT
?CND49:	CRLF	
	PRINTI	"The captain, slowed by pain and loss of blood, cannot even parry your next stroke, which skewers him like a lamb.He stares at you silently for a moment, then his eyes glaze and he falls to the ground, dead."
	CRLF	
	ICALL2	SCORE-OBJECT,YAMAZAKI
	RTRUE	


	.FUNCT	KOJIMA-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?WHO \?CCL8
	EQUAL?	PRSO,KOJIMA,YOU \?CCL8
	PRINTR	"""My name is Kojima Harumoto, Captain of the Sixth Legion!"""
?CCL8:	EQUAL?	PRSA,V?STOP \?CCL12
	PRINT	STR?592
	CRLF	
	RTRUE	
?CCL12:	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL14
	FSET?	PRSO,DEAD \?CCL17
	PRINTR	"He is dead.Mariko has killed him."
?CCL17:	PRINT	STR?274
	CRLF	
	RTRUE	
?CCL14:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	FSET?	KOJIMA,DEAD \?CCL22
	PRINTR	"You prepare to strike the already-dead Gray with your sword.Mariko says, ""No, Anjin-san.He was samurai.He was doing his duty."""
?CCL22:	PRINTR	"Mariko says, ""Anjin-san, this is my fight.You must not shame me by fighting this man.I am samurai, and this is my duty, and my honor."""


	.FUNCT	CAPTAIN-KILLS-YOU:ANY:0:0
	CRLF	
	CALL2	JIGS-UP,STR?601
	RSTACK	


	.FUNCT	I-FIGHT:ANY:0:0,B
	GETP	BROWNS,P?COUNT >B
	FSET?	YAMAZAKI,DEAD /?CND1
	INC	'DELAYING-FIGHT?
	FSET?	BLACKTHORNE,SITTING \?CCL5
	GRTR?	DELAYING-FIGHT?,4 \?CCL8
	ICALL1	CAPTAIN-KILLS-YOU
	JUMP	?CND1
?CCL8:	CRLF	
	PRINTI	"The Captain motions for you to stand and fight."
	CRLF	
	JUMP	?CND1
?CCL5:	CALL2	HELD?,SWORDS
	ZERO?	STACK /?CTR9
	FSET?	SWORDS,WEARBIT \?CCL10
?CTR9:	GRTR?	DELAYING-FIGHT?,4 \?CCL15
	ICALL1	CAPTAIN-KILLS-YOU
	CRLF	
	ICALL2	JIGS-UP,STR?601
	JUMP	?CND1
?CCL15:	CRLF	
	PRINTI	"The Captain waits for you to draw your sword."
	CRLF	
	JUMP	?CND1
?CCL10:	FSET?	YAMAZAKI,RMUNGBIT /?CCL18
	FSET	YAMAZAKI,RMUNGBIT
	ICALL2	THIS-IS-IT,YAMAZAKI
	SET	'OPPONENT,YAMAZAKI
	CRLF	
	PRINTI	"The Captain bows formally, draws his sword, and prepares to attack you."
	CRLF	
	JUMP	?CND1
?CCL18:	ZERO?	YAMAZAKI-ATTACK /?CCL20
	CRLF	
	PRINTI	"The Captain swings his sword at you, but oddly, at the last second he seems to adjust his attack so that you are only slightly cut, rather than sliced in two."
	CRLF	
	JUMP	?CND1
?CCL20:	SET	'YAMAZAKI-ATTACK,TRUE-VALUE
	CRLF	
	CALL2	PICK-ONE,YAMAZAKI-ATTACKS
	PRINT	STACK
	CRLF	
?CND1:	ZERO?	B /TRUE
	RANDOM	7
	SUB	B,STACK >B
	GRTR?	B,0 /?CND23
	SET	'B,0
?CND23:	PUTP	BROWNS,P?COUNT,B
	ZERO?	B \?CCL27
	FSET?	YAMAZAKI,DEAD \?CND28
	ICALL2	DEQUEUE,I-FIGHT
?CND28:	CRLF	
	PRINTR	"It is now one to one, the last Brown, blood-stained and wounded, already the victor of four duels.The fresh Gray dispatches him easily and stands alone among the bodies."
?CCL27:	CRLF	
	PRINTI	"Each time a Gray falls, another calmly walks out of the waiting pack to join his comrades in the killing.It is now "
	GET	NUMBERS,B
	PRINT	STACK
	PRINTI	" Brown"
	EQUAL?	B,1 /?CCL32
	PRINTR	"s versus as many Grays."
?CCL32:	PRINTR	" versus one Gray."

	.ENDSEG

	.SEGMENT "ESCAPE"

	.SEGMENT "SEPPUKU"


	.FUNCT	FORMAL-GARDEN-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	ICALL	QUEUE,I-SEPPUKU,-1
	FSET	FORTIFIED-GATE,OPENBIT
	MOVE	MARIKO,TEA-HOUSE
	FCLEAR	MARIKO,SCOREBIT
	FSET	GARDEN-GATE,OPENBIT
	MOVE	CHIMMOKO,HERE
	MOVE	YABU,FORECOURT
	MOVE	KIRITSUBO,FORECOURT
	MOVE	SUMIYORI,FORECOURT
	MOVE	ISHIDO,GENERIC-OBJECTS
	RTRUE	
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	EQUAL?	SCENE,S-ESCAPE \TRUE
	EQUAL?	OHERE,COURTYARD \TRUE
	IN?	MARIKO,COURTYARD \TRUE
	ICALL	QUEUE,I-COME-BACK,6
	PRINTI	"As you enter the garden, Mariko calls to you ""Anjin-san, we are leaving soon.Come back!""You see her explain to Yabu what she said."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	LILY-POND-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The lily pond glistens in the sun, its waters rippled by the gentle fall of water from the brook."
?CCL3:	EQUAL?	PRSA,V?BOARD,V?THROUGH \FALSE
	PRINTR	"To do so would disturb the serenity and peace of the garden and the pond."

	.ENDSEG

	.SEGMENT "SEPPUKU"


	.FUNCT	SEPPUKU-EXAMINE-MARIKO:ANY:0:0
	PRINTR	"She is kneeling, facing the doorway, freshly made up, lips crimson, immaculately coiffured, wearing a fresh kimono of somber blue edged with green, with a lighter green obi and a thin green ribbon for her hair."


	.FUNCT	SEPPUKU-TAKE-MARIKO:ANY:0:0
	EQUAL?	HERE,FORMAL-GARDEN,TEA-HOUSE \?CCL3
	PRINTR	"""No, Anjin-san, I cannot stop.This is my duty to our master.Only in this way may I expiate the sin of my father, and not die in shame."""
?CCL3:	FSET?	MARIKO,SCOREBIT \?CCL5
	FSET?	MARIKO,SITTING /?CCL5
	MOVE	MARIKO,WINNER
	ICALL2	DEQUEUE,I-SEPPUKU
	PRINTI	"You decide that she has endured enough, proved enough, so you come forward and catch her in your arms as she falls, lift her up just as her mind leaves her.For a moment you stand there alone, proud that you alone decided.She rests like a broken doll in your arms.Then you carry her inside.No one moves or bars your path."
	CRLF	
	ICALL2	SCORE-OBJECT,MARIKO
	CALL1	NEXT-SCENE
	RSTACK	
?CCL5:	CALL	JIGS-UP?,J-SEPPUKU,STR?264
	ZERO?	STACK /TRUE
	PRINTI	"You come forward to try to help her."
	CALL1	INTERRUPTED-SEPPUKU
	RSTACK	

	.SEGMENT "ESCAPE"


	.FUNCT	TEA-HOUSE-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?KISS \FALSE
	EQUAL?	PRSO,MARIKO \FALSE
	PRINTR	"You kiss her gently and tenderly."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	EQUAL?	SCENE,S-SEPPUKU \?CND11
	ICALL2	THIS-IS-IT,MARIKO
	SET	'QCONTEXT,MARIKO
	PRINTI	"You go forward alone."
?CND11:	PRINTI	"You "
	FSET?	SANDALS,WEARBIT \?CND13
	FCLEAR	SANDALS,WEARBIT
	MOVE	SANDALS,FORMAL-GARDEN
	PRINTI	"slip your feet out of your thongs and "
?CND13:	PRINTI	"walk up the three steps.You have to stoop, almost to your knees, to go through the tiny screened doorway."
	CRLF	
	CRLF	
	RTRUE	

	.ENDSEG

	.SEGMENT "SEPPUKU"


	.FUNCT	GREEN-RIBBON-F:ANY:0:0
	EQUAL?	PRSA,V?DROP \?CCL3
	FSET?	PRSO,RMUNGBIT \?CCL3
	CALL2	YOULL-HAVE-TO,STR?605
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?TIE \?CCL7
	EQUAL?	PRSO,RIBBON \?CCL7
	EQUAL?	PRSI,FALSE-VALUE \?CCL7
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL13
	PRINT	STR?606
	CRLF	
	RTRUE	
?CCL13:	FSET?	PRSO,RMUNGBIT /?CCL15
	FSET	PRSO,RMUNGBIT
	PRINTR	"You tie the ribbon to your sash in homage to Mariko's courage."
?CCL15:	PRINT	STR?131
	CRLF	
	RTRUE	
?CCL7:	EQUAL?	PRSA,V?UNTIE \FALSE
	CALL2	HELD?,PRSO
	ZERO?	STACK \?CCL20
	PRINT	STR?606
	CRLF	
	RTRUE	
?CCL20:	FSET?	PRSO,RMUNGBIT \?CCL22
	FCLEAR	PRSO,RMUNGBIT
	PRINTR	"You untie the ribbon."
?CCL22:	PRINT	STR?131
	CRLF	
	RTRUE	


	.FUNCT	SUMIYORI-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	CALL1	WAKARIMASEN
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"Sumiyori is the senior officer of Toranaga's Browns in Osaka."


	.FUNCT	I-SEPPUKU:ANY:0:0
	INC	'DELAY-CNT
	ZERO?	SEPPUKU-CNT \?CCL5
	EQUAL?	HERE,FORMAL-GARDEN,TEA-HOUSE /?CND3
	MOVE	CHIMMOKO,HERE
	CRLF	
	PRINTR	"Mariko's servant Chimmoko urges you to return to the garden."
?CCL5:	EQUAL?	SEPPUKU-CNT,1 \?CCL9
	EQUAL?	HERE,FORMAL-GARDEN \?CND3
	MOVE	CHIMMOKO,HERE
	CRLF	
	PRINTR	"Chimmoko points imploringly at the tea house.""My mistress wishes to see you, please, Anjin-san,"" she says in the simplified Japanese that is all you can understand."
?CCL9:	EQUAL?	SEPPUKU-CNT,3 \?CND3
	EQUAL?	HERE,TEA-HOUSE /TRUE
?CND3:	SET	'DELAY-CNT,0
	INC	'SEPPUKU-CNT
	EQUAL?	SEPPUKU-CNT,1 \?CCL17
	EQUAL?	HERE,FORMAL-GARDEN \FALSE
	MOVE	CHIMMOKO,HERE
	CRLF	
	PRINTI	"Chimmoko points to the little "
	ICALL2	PRINTUNDER,STR?607
	PRINTR	" house."
?CCL17:	EQUAL?	SEPPUKU-CNT,2 \?CCL22
	MOVE	CHIMMOKO,FORMAL-GARDEN
	EQUAL?	HERE,TEA-HOUSE \FALSE
	CRLF	
	PRINTR	"""Thou,"" Mariko says in Latin, the language of love."
?CCL22:	EQUAL?	SEPPUKU-CNT,3 \?CCL27
	MOVE	MARIKO,FORMAL-GARDEN
	EQUAL?	HERE,TEA-HOUSE \?CCL30
	CRLF	
	PRINTR	"Chimmoko approaches.""It's time, Mistress.""

""Is everything ready?""Mariko asks.

""Yes, Mistress.""

""Wait for me beside the lily pond.""The footsteps go away.Mariko turns back to you and kisses you gently.She bows to you and goes through the doorway."
?CCL30:	EQUAL?	HERE,FORMAL-GARDEN \FALSE
	CRLF	
	PRINTR	"Chimmoko enters the tea house, then re-emerges a moment later.Mariko follows her, and bows to you as she goes by."
?CCL27:	EQUAL?	SEPPUKU-CNT,4 \?CCL34
	MOVE	GREEN-RIBBON,FORMAL-GARDEN
	EQUAL?	HERE,FORMAL-GARDEN \FALSE
	CRLF	
	PRINTR	"Mariko stops by the lily pond and undoes her obi and lets it fall.Chimmoko helps her out of her blue kimono.Beneath it Mariko wears the most brilliant white kimono and obi you have ever seen.It is a formal death kimono.She unties the green ribbon from her hair and casts it aside."
?CCL34:	EQUAL?	SEPPUKU-CNT,5 \?CCL39
	FCLEAR	COURTYARD,TOUCHBIT
	MOVE	MARIKO,COURTYARD
	MOVE	CHIMMOKO,COURTYARD
	EQUAL?	HERE,FORMAL-GARDEN,FORECOURT,COURTYARD \FALSE
	CRLF	
	PRINTR	"Clad completely in white, Mariko walks from the garden into the courtyard, never looking at you."
?CCL39:	EQUAL?	SEPPUKU-CNT,6 \?CCL44
	FCLEAR	FORECOURT,TOUCHBIT
	MOVE	MARIKO,FORECOURT
	MOVE	CHIMMOKO,FORECOURT
	EQUAL?	HERE,FORMAL-GARDEN,FORECOURT,COURTYARD \FALSE
	CRLF	
	PRINTR	"Mariko walks to the gateway, where eight tatamis have been laid out in the center of the main gate."
?CCL44:	EQUAL?	SEPPUKU-CNT,7 \?CCL49
	FSET	MARIKO,SITTING
	EQUAL?	HERE,FORECOURT \?CCL52
	CRLF	
	PRINTR	"At a sign from Sumiyori everyone bows.Mariko bows to them.Four samurai come forward and spread a crimson coverlet over the tatamis.

Mariko goes to the crimson square and kneels in the center, in front of the tiny white cushion.Her right hand brings out her stiletto dagger from her white obi and she places it on the cushion in front of her.Mariko arranges the skirts of her kimono perfectly, Chimmoko helping her, tying a small white blanket around her waist with the cord.You know that this is to prevent her skirts being blooded and disarranged by her death throes."
?CCL52:	EQUAL?	HERE,COURTYARD \FALSE
	CRLF	
	PRINTR	"Through the crowd to the south you can see Mariko in the forecourt preparing for her death."
?CCL49:	EQUAL?	SEPPUKU-CNT,8 \?CCL56
	EQUAL?	HERE,FORECOURT \?CCL59
	CRLF	
	PRINTR	"Serene and prepared, Mariko looks up at the castle donjon.Sun still dominates the upper story, glittering off the golden tiles.Rapidly the flaming light mounts the spire.Then it disappears.

Servants are lighting flares along the avenue.When they finish, they flee as quickly and silently as they arrived.

Mariko reaches forward and straightens the knife.She looks through the gateway to the far end of the avenue.It is as still and as empty as it had ever been."
?CCL59:	EQUAL?	HERE,COURTYARD \FALSE
	CRLF	
	PRINTR	"The crowd is such that you can no longer see Mariko."
?CCL56:	EQUAL?	SEPPUKU-CNT,9 \?CCL63
	EQUAL?	HERE,FORECOURT \FALSE
	CRLF	
	PRINTR	"Mariko looks once again at the knife.She says ""Kasigi Yabu-sama!It seems Lord Kiyama has declined to assist me.Please, I would be honored if you would be my second.

""It is my honor,"" Yabu replies.He bows, gets to his feet, and stands behind her to her left.His sword sings as it slides from its scabbard.""I am ready, Lady,"" he says.

""Please wait until I make the second cut."""
?CCL63:	EQUAL?	SEPPUKU-CNT,10 \?CCL68
	MOVE	ISHIDO,FORECOURT
	EQUAL?	HERE,FORECOURT \?CCL71
	ICALL2	MARGINAL-PIC,P-SEPPUKU
	CRLF	
	PRINTR	"With her right hand, Mariko makes the sign of the cross, then leans forward and takes the knife and touches it to her lips as though to taste the polished steel.She changes her grip and holds the knife firmly with her right hand under the left side of her throat.

Suddenly flares round the far end of the avenue.A retinue approaches.Ishido is at their head.

Mariko does not move the knife.Yabu is as still as a coiled spring.""Lady,"" he says, ""do you wait or are you continuing?I wish to be perfect for you."""
?CCL71:	CRLF	
	PRINTR	"You can hear a subdued whispering coming from all around."
?CCL68:	EQUAL?	SEPPUKU-CNT,11 \?CCL73
	EQUAL?	HERE,FORECOURT \?CCL76
	CRLF	
	PRINTI	"""I wait ... we ... I""Her hand lowers the knife.Yabu lowers his sword and it hisses back into his scabbard.

Ishido stands at the gateway.""It's not sunset yet, Lady.Are you so keen to die?""

""No, Lord General.Just to obey my Lord ... "" She holds her hands together to stop their shaking.A rumble of anger goes through the Browns at Ishido's arrogant rudeness."
	CRLF	
	CRLF	
	PRINTI	"Ishido says loudly, ""The Lady Ochiba begged the Regents on behalf of the Heir to make an exception in your case.Here are permits for you to leave at dawn tomorrow.""He shoves them into the hands of Sumiyori.

""Sire?"" Mariko says, without understanding, her voice threadbare."
	CRLF	
	CRLF	
	PRINTI	"""You are free to leave.At dawn,"" barks Ishido.

""And Kiritsubo-san and the Lady Sazuko?""

""Isn't that also part of your 'duty?'  Their permits are there also."""
	CRLF	
	CRLF	
	PRINTR	"Ishido addresses the others.""Any ladies may apply, any samurai.I've said before, it's stupid to leave for seventeen days, it's insulting to flout the Heir's welcome ..."" -- his ruthless gaze goes back to Mariko -- ""or to pressure them with threats of seppuku!"""
?CCL76:	CRLF	
	PRINTI	"You can hear a building, burgeoning noise from all around the forecourt."
	CRLF	
	CRLF	
	PRINTR	"As suddenly as it started, the noise ceases."
?CCL73:	EQUAL?	SEPPUKU-CNT,12 \?CCL78
	MOVE	ISHIDO,GENERIC-OBJECTS
	EQUAL?	HERE,FORECOURT \?CCL81
	CRLF	
	PRINTR	"Ishido turns on his heel, shouts an order to the Grays, and walks off."
?CCL81:	CRLF	
	PRINTR	"From the forecourt you can hear the sound of marching feet."
?CCL78:	EQUAL?	SEPPUKU-CNT,13 \?CCL83
	FSET	MARIKO,SCOREBIT
	SET	'MARIKO-WON-FLAG,TRUE-VALUE
	FCLEAR	MARIKO,SITTING
	EQUAL?	HERE,FORECOURT \FALSE
	CRLF	
	PRINTR	"Yabu turns to Mariko.""Lady, it's over now.You've ... you've won.You've won.""

Mariko tries to grope to her feet.She fails.She tries a second time.Again she fails.Her hands go to the crimson again, and this time she forces herself upright.She wavers and almost falls, then her feet move and slowly she totters across the crimson, reeling helplessly toward the main door."
?CCL83:	EQUAL?	SEPPUKU-CNT,14 \FALSE
	EQUAL?	HERE,FORECOURT \?CCL91
	CRLF	
	PRINTI	"Mariko teeters helplessly, unable to move forward any further.There is a hushed silence, everyone in the forecourt watching her.She falls to the ground."
	CRLF	
	JUMP	?CND89
?CCL91:	CRLF	
	PRINTI	"From the forecourt is hushed silence, as though all of Osaka is waiting for something, and then a sigh, just barely audible though thousands of throats make it, comes over the walls."
	CRLF	
?CND89:	CALL1	NEXT-SCENE
	RSTACK	

	.ENDSEG

	.ENDI
