
	.SEGMENT "NINJA"

	.SEGMENT "AUDIENCE"


	.FUNCT	STAIRS-EXIT:ANY:0:2,RARG,STRICT?
	EQUAL?	SCENE,S-NINJA \?CCL3
	RETURN	STAIRS
?CCL3:	ZERO?	RARG \FALSE
	PRINTI	"The guards point to toward the audience chamber instead."
	CRLF	
	RFALSE	


	.FUNCT	OUTER-CORRIDOR-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	ICALL	REPLACE-SYNONYM,LG-CREWMEN,W?MAN,W?CREWMAN,TRUE-VALUE
	ICALL	REPLACE-SYNONYM,LG-CREWMEN,W?MEN,W?CREWMEN,TRUE-VALUE
	MOVE	HIRO-MATSU,HERE
	MOVE	TORANAGAS-GUARDS,AUDIENCE-CHAMBER
	MOVE	ALVITO,AUDIENCE-CHAMBER
	MOVE	YABU,AUDIENCE-CHAMBER
	MOVE	TORANAGA,AUDIENCE-CHAMBER
	MOVE	FALCON,TORANAGA
	PUTP	BLACKTHORNE,P?HEALTH,4
	FCLEAR	OUTER-DOOR,OPENBIT
	CALL	QUEUE,I-AUDIENCE,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"This outer corridor is where those who are about to be granted audience with Toranaga wait.The great Audience Chamber is to the east and stairs down to the lower part of the keep are to the west."
	EQUAL?	SCENE,S-TORANAGA \?CND6
	PRINTR	"Massed samurai, their young officer in front of them, protect the last door -- each with right hand on the sword hilt, left on the scabbard, motionless and ready, staring at you."
?CND6:	CRLF	
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	SCENE,S-NINJA \FALSE
	EQUAL?	PRSA,V?WALK \?CCL15
	IN?	NINJA,HERE \?CCL15
	ZERO?	KNOCKOUT-CNT /?CCL15
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?WEST \FALSE
	IN?	YABU,HERE \FALSE
	CALL1	YABU-LISTENS
	RSTACK	


	.FUNCT	AUDIENCE-CHAMBER-F:ANY:1:1,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is the immense audience room.The room is forty paces square and ten high, the tatami mats the best quality, four fingers thick and impeccable."
	FSET?	VASE,TOUCHBIT /?CND4
	PRINTI	"Near the dais, in a niche, is a small earthenware vase with a single spray of cherry blossom and this fills the room with color and fragrance."
?CND4:	EQUAL?	SCENE,S-TORANAGA \?CND6
	PRINTI	"Ten paces from the dais, circling it, are twenty samurai, seated cross-legged and facing outward."
?CND6:	PRINTI	"Doors lead east and west to the outer and inner corridors, respectively."
	FSET?	SECRET-ROOM-DOOR,INVISIBLE /?CND8
	PRINTR	"On the south wall is a formerly secret door used by the ninja attackers."
?CND8:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	SCENE,S-TORANAGA \?CCL14
	EQUAL?	PRSA,V?LISTEN \?CCL17
	EQUAL?	PRSO,FALSE-VALUE,TORANAGA,ALVITO /?CTR16
	EQUAL?	PRSO,HIRO-MATSU,LG-MEN \?CCL17
?CTR16:	PRINTI	"You can't understand anything they say in Japanese"
	RANDOM	100
	LESS?	25,STACK /?CCL24
	PRINTR	", except that once you hear the word ""Anjin."""
?CCL24:	PRINTR	"."
?CCL17:	EQUAL?	PRSA,V?TEKI,V?SAY \?CCL26
	EQUAL?	PRSA,V?SAY \?PRD30
	EQUAL?	PRSO,INTQUOTE \?PRD30
	CALL2	GET-INTQUOTE,0 >?TMP1
	CALL2	GET-INTQUOTE,1
	EQUAL?	W?TEKI,?TMP1,STACK /?CCL28
?PRD30:	EQUAL?	PRSA,V?TEKI /?CCL28
	EQUAL?	PRSA,V?SAY \?CND27
	EQUAL?	PRSO,TEKI \?CND27
?CCL28:	FSET?	TEKI,RMUNGBIT /?CCL39
	PRINTR	"That's not a word you know."
?CCL39:	FSET?	ALVITO,SCOREBIT /?CCL41
	PRINTR	"You've already said that.Don't belabor it."
?CCL41:	EQUAL?	POINTEE,ALVITO \?CND27
	FCLEAR	ALVITO,RMUNGBIT
	PRINTI	"You say "
	ICALL2	PRINTUNDER,STR?179
	PRINTI	".Toranaga speaks curtly, and the priest begins translating simultaneously, a few words behind.""Why are you an enemy of Tsukku-san, who's the enemy of no one?""Alvito adds, ""The Japanese cannot pronounce my name either.Tsukku is a pun on "
	ICALL2	PRINTUNDER,STR?483
	PRINTI	" -- to interpret."""
	CRLF	
	ICALL2	SCORE-OBJECT,ALVITO
	RTRUE	
?CND27:	CALL	JIGS-UP?,J-JOKE,STR?484
	ZERO?	STACK /TRUE
	CALL2	JIGS-UP,STR?485
	RSTACK	
?CCL26:	CALL1	ACT-CRAZY?
	ZERO?	STACK /?CCL47
	PRINTR	"Toranaga looks at you with surprise.He seems to think you are crazy."
?CCL47:	EQUAL?	PRSA,V?POINT \?CCL49
	EQUAL?	PRSO,ALVITO /?CCL49
	SET	'POINTEE,PRSO
	PRINTI	"You point at "
	ICALL1	THE-PRINT-PRSO
	PRINTI	"."
	ICALL2	CTHE-PRINT,ALVITO
	PRINTR	" seems pleased at how foolishly you are acting."
?CCL49:	EQUAL?	PRSA,V?LOOK-UP,V?EXAMINE \?CCL53
	EQUAL?	PRSO,ROOMS,TORANAGA \?CCL53
	FSET?	BLACKTHORNE,SITTING \?CCL53
	FSET?	FALCON,RMUNGBIT \?CCL53
	FCLEAR	FALCON,RMUNGBIT
	PRINTR	"You look up boldly at Toranaga.He seems surprised and amused at your impertinence."
?CCL53:	EQUAL?	PRSA,V?WALK-AROUND /?CTR58
	EQUAL?	PRSA,V?WALK-TO,V?FOLLOW,V?JOIN \?PRD62
	EQUAL?	PRSO,ALVITO,TORANAGA,DAIS /?CTR58
?PRD62:	EQUAL?	PRSA,V?WALK \?PRD65
	EQUAL?	P-WALK-DIR,P?FORE,P?IN /?CTR58
?PRD65:	EQUAL?	PRSA,V?AVOID \?CCL59
	EQUAL?	PRSO,INNER-DOOR,OUTER-DOOR \?CCL59
?CTR58:	FSET?	DAIS,RMUNGBIT /?CCL72
	PRINTR	"Alvito hisses, ""Captain, Lord Toranaga has not given you permission to move."""
?CCL72:	FSET?	DAIS,SCOREBIT \?CCL74
	PRINTI	"You carefully and quietly stand, bow to Toranaga, and move to Alvito's side, away from the main door."
	CRLF	
	CALL2	SCORE-OBJECT,DAIS
	RSTACK	
?CCL74:	EQUAL?	PRSO,DAIS,TORANAGA \?CCL76
	PRINTR	"You are already as close to the dais as Toranaga's samurai will allow."
?CCL76:	PRINTR	"Alvito hisses, ""If you move again, it will mean your life!"""
?CCL59:	EQUAL?	PRSA,V?WALK,V?LEAVE \?CCL78
	PRINTR	"You are not allowed to leave."
?CCL78:	IN?	ISHIDO,HERE \?CCL80
	EQUAL?	PRSA,V?TELL,V?YELL,V?YELL-AT /?CTR79
	EQUAL?	PRSA,V?SAY /?CTR79
	CALL1	PASSIVE-VERB?
	ZERO?	STACK \?CCL80
	CALL1	GAME-VERB?
	ZERO?	STACK \?CCL80
	EQUAL?	PRSA,V?SIT /?CCL80
?CTR79:	PRINTI	"Alvito hisses, ""As you value your life, Englishman, keep silent!"""
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL80:	EQUAL?	PRSA,V?SPEAK,V?PICK \?CCL93
	ZERO?	ALVITO-TRANSLATES? /?CCL93
	CALL1	ALVITO-SPEAKS
	RSTACK	
?CCL93:	ZERO?	ALVITO-TRANSLATES? \?CCL97
	EQUAL?	PRSA,V?TELL \?CCL97
	PRINTI	"Your impatience and impertinence could cost you your life."
	CRLF	
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL97:	IN?	FALCON,TORANAGA \FALSE
	EQUAL?	PRSA,V?BOW \?CCL104
	EQUAL?	PRSO,FALSE-VALUE,TORANAGA \?CCL104
	FSET?	HERE,RMUNGBIT /?CCL109
	FSET	HERE,RMUNGBIT
	PRINTR	"You bow as you have learned to, remembering Rodrigues' words: ""Behave like a king and they'll treat you like a king.""You don't want to kneel."
?CCL109:	FSET?	BLACKTHORNE,SITTING \?CCL111
	PRINTR	"You count slowly to six, and then you incline your head and bow slightly again."
?CCL111:	PRINTR	"You've already bowed once.You glance nervously around at the seated samurai.What can you do to show you are respectful but equal?"
?CCL104:	EQUAL?	PRSA,V?SIT \?CCL113
	FSET?	HERE,RMUNGBIT /?CCL116
	CALL	JIGS-UP?,J-SIT,STR?486
	ZERO?	STACK /TRUE
	ICALL1	B-SIT
	PRINTI	"You sit cross-legged without bowing and stare at Toranaga.Everyone in the room is deathly silent, watching to see what he will do.The answer comes quickly, with a flash of steel you barely see before it ends your life."
	CALL1	JIGS-UP
	RSTACK	
?CCL116:	FSET?	BLACKTHORNE,SITTING /FALSE
	ICALL1	B-SIT
	PRINTR	"Taking a deep breath, you sit cross-legged and stare at Toranaga."
?CCL113:	EQUAL?	PRSA,V?KNEEL \FALSE
	FCLEAR	AUDIENCE-CHAMBER,SCOREBIT
	ICALL1	B-KNEEL
	PRINTR	"You kneel abjectly, in imitation of Hiro-matsu."
?CCL14:	EQUAL?	SCENE,S-NINJA \FALSE
	EQUAL?	PRSA,V?LEAVE \?CCL128
	CALL2	DO-WALK,P?EAST
	RSTACK	
?CCL128:	EQUAL?	PRSA,V?WALK \?CCL130
	IN?	NINJA,HERE \?CCL130
	ZERO?	KNOCKOUT-CNT /?CCL130
	PRINT	STR?482
	CRLF	
	RTRUE	
?CCL130:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?WEST \FALSE
	IN?	YABU,HERE \?CCL140
	CALL1	YABU-LISTENS
	RSTACK	
?CCL140:	CALL2	QUEUED?,I-ATTACK
	ZERO?	STACK /?CCL142
	IN?	NINJA,SECRET-ROOM \?CCL142
	FSET?	NINJA,INVISIBLE /?CCL142
	PRINTR	"You go toward the exit to the outer corridor and the stairs, but the guards motion you back."
?CCL142:	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?WEST,P?SOUTH \FALSE
	IN?	NINJA,HERE \FALSE
	PRINT	STR?487
	CRLF	
	RTRUE	


	.FUNCT	VASE-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	FCLEAR	FLOWER,NDESCBIT
	FCLEAR	VASE,NDESCBIT
	RFALSE	
?CCL3:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	FSET?	FLOWER,NDESCBIT \FALSE
	PRINTR	"The vase contains one sprig of cherry blossoms."


	.FUNCT	FLOWER-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"The cherry blossoms are past their peak, but still beautiful."
?CCL3:	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	SCENE,S-TORANAGA \?CCL8
	PRINTR	"It would be worth your life to take that sprig of cherry."
?CCL8:	FCLEAR	PRSO,NDESCBIT
	RFALSE	

	.ENDSEG

	.SEGMENT "AUDIENCE"


	.FUNCT	ISHIDO-VS-TORANAGA-AFTER-F:ANY:0:0
	PRINTR	"Toranaga watches you leave the room, taking his mind off the interview and coming to grips with the problem of Ishido.Toranaga was summoned to Osaka to give answers to the Council of Regents, and against the advice of his advisors, he chose to obey.Now he is stuck, the meeting delayed and delayed, Toranaga caught in the castle of his most deadly enemy.

Ishido comes instantly to the point. ""What is your answer to the Council of Regents?""

Toranaga answers, ""As President of the Council of Regents I do not believe an answer is necessary.Our late Master, the Taiko, has been dead a year.I don't threaten his house or my nephew Yaemon, the Taiko's Heir.I seek no more territory.By the Lord Buddha, I'll not be the first to break the peace.""

Ishido bristles.""The Lady Ochiba, the mother of the heir, is hostage in your castle at Yedo, against your safety here.The Council requests her presence in Osaka instantly.We're all agreed: Lord Sugiyama, Lord Onoshi, Lord Kiyama, and I.Here are their signatures.""

Toranaga is livid.Why had Kiyama and Onoshi defected to Ishido? Four to one means isolation and disaster!"


	.FUNCT	FALCON-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The falcon has a broken wing feather, which Toranaga is repairing.The falcon is hooded."


	.FUNCT	TORANAGAS-GUARDS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \FALSE
	ICALL1	WAKARIMASEN
	CALL1	END-QUOTE
	RSTACK	


	.FUNCT	ALVITO-F:ANY:0:1,RARG,ADJ
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	EQUAL?	PRSA,V?SPEAK,V?PICK \?CCL8
	ZERO?	ALVITO-TRANSLATES? /?CCL8
	CALL1	ALVITO-SPEAKS
	RSTACK	
?CCL8:	EQUAL?	PRSA,V?HELLO /?CTR11
	EQUAL?	PRSA,V?YES \?CCL12
	EQUAL?	P-PRSA-WORD,W?NOD \?CCL12
?CTR11:	ICALL2	CTHE-PRINT,ALVITO
	PRINTR	" bows in response, more like a European courtier than a Japanese."
?CCL12:	EQUAL?	PRSA,V?SORRY \?CCL18
	PRINTR	"""It is of no consequence now.""You are not sure he is sincere."
?CCL18:	EQUAL?	PRSA,V?WHO \?CCL20
	EQUAL?	PRSO,YOU \?CCL20
	ICALL	NEW-SDESC,ALVITO,STR?489
	PRINT	STR?490
	CRLF	
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?BE? \?CCL24
	EQUAL?	PRSO,YOU \?CCL24
	EQUAL?	PRSI,INTADJ \?CCL24
	GET	PARSE-RESULT,11 >ADJ
	EQUAL?	ADJ,W?PORTUGUESE \FALSE
	PRINTR	"""I have that privilege."""
?CCL24:	EQUAL?	PRSA,V?BE \?CCL32
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL32
	EQUAL?	PRSI,ENGLAND \?CCL32
	PRINTR	"""Yes, Pilot, you are of the enemy.In spite of this, you may trust me to translate what you say accurately.I am merely the Lord Toranaga's instrument in this."""
?CCL32:	ICALL2	CTHE-PRINT,ALVITO
	PRINTR	" ruminates on your remark, but doesn't reply."
?CCL5:	EQUAL?	PRSA,V?BOW \?CCL37
	ICALL	PERFORM,V?HELLO,ALVITO
	RTRUE	
?CCL37:	EQUAL?	PRSA,V?EXAMINE \?CCL39
	ICALL2	CTHE-PRINT,ALVITO
	PRINTR	" is a graceful, handsome man, perhaps a few years older than you.He wears tabi socks and a flowing kimono that seems, on him, to belong.A rosary and a carved golden cross hang at his belt.He has an easy elegance, and the aura of strength and natural power of the Jesuits."
?CCL39:	EQUAL?	PRSA,V?POINT \FALSE
	FSET?	ALVITO,RMUNGBIT \FALSE
	SET	'POINTEE,ALVITO
	PRINTR	"You point to Alvito."


	.FUNCT	ALVITO-SPEAKS:ANY:0:0
	EQUAL?	PRSO,PORTUGUESE,LATIN,SPANISH /?CTR2
	EQUAL?	PRSO,ALVITO \?CCL3
	CALL	ADJ-USED?,ALVITO,W?PORTUGUESE
	ZERO?	STACK /?CCL3
?CTR2:	PRINTR	"""Very well,"" Alvito replies."
?CCL3:	PRINTR	"""This is not a time for foolishness!"" Alvito answers, and speaks briefly to Toranaga, who scowls."


	.FUNCT	I-AUDIENCE:ANY:0:0
	INC	'DELAY-CNT
	EQUAL?	AUDIENCE-CNT,1 \?CCL5
	FSET?	BLACKTHORNE,SITTING /?CND3
	GRTR?	DELAY-CNT,3 /?CTR9
	CALL1	PASSIVE-VERB?
	ZERO?	STACK \?CCL10
?CTR9:	CRLF	
	PRINTI	"Toranaga looks up slowly, gestures imperceptably at Hiro-matsu, and goes back to his falconry.Hiro-matsu rises, bows to Toranaga, and slays you with a single stroke."
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL10:	EQUAL?	DELAY-CNT,1 \?CCL14
	CRLF	
	PRINTR	"In the doorway the officer's hand is on his sword.Hiro-matsu has already grasped his, though his head is still bent."
?CCL14:	EQUAL?	DELAY-CNT,2 \?CCL16
	CRLF	
	PRINTR	"The tension in the room rises as everyone begins to stare at you.But as a true-born Englishman and vassal of the Queen, it's unmanly to degrade yourself as they do here."
?CCL16:	EQUAL?	DELAY-CNT,3 \?CND3
	CRLF	
	PRINTR	"Hiro-matsu's sword inches out of its scabbard.He is preparing himself to cleanse your disrespect to his liege lord.Will you die rather than abase yourself?"
?CCL5:	EQUAL?	AUDIENCE-CNT,5 \?CCL19
	FSET?	ALVITO,SCOREBIT \?CND3
	GRTR?	DELAY-CNT,3 \?CCL24
	FCLEAR	ALVITO,RMUNGBIT
	FCLEAR	ALVITO,SCOREBIT
	PRINTR	"""Very well, I will tell him myself.""Alvito speaks to Toranaga, who responds gruffly, scowling at you.The priest seems very satisfied with the outcome."
?CCL24:	CRLF	
	PRINTI	"Alvito waits patiently."
	EQUAL?	DELAY-CNT,1 \?CND25
	PRINTI	"You wonder if '"
	ICALL2	PRINTUNDER,STR?179
	PRINTR	"' truly means 'enemy.'  Of course it does, you tell yourself.This man's not like the other one."
?CND25:	CRLF	
	RTRUE	
?CCL19:	EQUAL?	AUDIENCE-CNT,7 \?CND3
	FSET?	DAIS,SCOREBIT \?CND3
	GRTR?	DELAY-CNT,1 \?CCL32
	FCLEAR	DAIS,SCOREBIT
	CRLF	
	PRINTR	"Toranaga gestures to the guards, who unceremoniously grab you and hustle you across the room, setting you down with a thump next to Alvito, who can barely suppress a smile at your treatment."
?CCL32:	CRLF	
	PRINTR	"""Captain, it is your death if you do not come here immediately!"""
?CND3:	SET	'DELAY-CNT,0
	INC	'AUDIENCE-CNT
	EQUAL?	AUDIENCE-CNT,1 \?CCL35
	FSET	OUTER-DOOR,OPENBIT
	CRLF	
	PRINTI	"You and Hiro-matsu stop before the officer of the watch, a mean-tempered, dangerous young man.He and Hiro-matsu converse briefly, and then several of the samurai search you expertly.Nothing would have escaped them.

The officer opens the thick door himself, and you and Hiro-matsu are ushered into the audience room."
	CRLF	
	CRLF	
	MOVE	HIRO-MATSU,AUDIENCE-CHAMBER
	ICALL2	THIS-IS-IT,ORDERS
	ICALL2	THIS-IS-IT,HIRO-MATSU
	ICALL2	GOTO,AUDIENCE-CHAMBER
	CRLF	
	PRINTR	"Just beyond the doorway Hiro-matsu kneels, puts his swords on the floor, and bows his head low, waiting in that abject position.

The officer indicates to you to do the same, but you are disgusted with the old man's servility."
?CCL35:	EQUAL?	AUDIENCE-CNT,2 \?CCL37
	CRLF	
	PRINTI	"Toranaga looks up slowly.He watches you briefly, his face impassive, then looks down and concentrates on his work again.Tension subsides in the room."
	CRLF	
	CALL2	SCORE-OBJECT,AUDIENCE-CHAMBER
	RSTACK	
?CCL37:	EQUAL?	AUDIENCE-CNT,3 \?CCL39
	REMOVE	FALCON
	CRLF	
	PRINTR	"Toranaga gives the falcon to a handler, who bows and leaves.Then Toranaga greets Hiro-matsu, and they converse briefly and casually.At one point they are clearly talking about you."
?CCL39:	EQUAL?	AUDIENCE-CNT,4 \?CCL41
	FCLEAR	FALCON,RMUNGBIT
	SET	'ALVITO-TRANSLATES?,TRUE-VALUE
	ICALL	NEW-SDESC,ALVITO,STR?489
	ICALL2	THIS-IS-IT,ALVITO
	SET	'QCONTEXT,ALVITO
	CRLF	
	PRINTI	"Toranaga turns and beckons to the lean-faced Portuguese who is sitting patiently in his shadow.The priest comes forward, and kneels close to the dais.Toranaga speaks briefly to him, and the man then glances pleasantly at you.He speaks to you in Portuguese."
	PRINT	STR?491
	CRLF	
	RTRUE	
?CCL41:	EQUAL?	AUDIENCE-CNT,5 \?CCL43
	FSET	ALVITO,RMUNGBIT
	FSET	TEKI,RMUNGBIT
	CRLF	
	PRINTI	"""The Japanese word for 'enemy' is '"
	ICALL2	PRINTUNDER,STR?179
	PRINTR	".'  You may use it if you wish.If you point at me and use the word, Lord Toranaga will understand clearly what you mean.I am your enemy, but not your assassin.That you will do yourself."""
?CCL43:	EQUAL?	AUDIENCE-CNT,6 \?CCL45
	CRLF	
	PRINTR	"Toranaga begins to interrogate you, Alvito translating smoothly, calmly.It's clear that Alvito has told him some of the questions to ask, but others obviously surprise the Jesuit.The existence of the Protestant religion, and the English and Dutch alliance against Spain and Portugal make Toranaga pause and think: the Catholics are not the only sort of Christian after all, and a small island country can hold off, perhaps even beat a great empire through command of the seas!Before long Alvito is sweating; this is worse, far worse than he anticipated."
?CCL45:	EQUAL?	AUDIENCE-CNT,7 \?CCL47
	SET	'QCONTEXT,FALSE-VALUE
	FSET	DAIS,RMUNGBIT
	ICALL2	THIS-IS-IT,ORDERS
	CRLF	
	PRINTR	"Suddenly, there is the sound of loud voices outside the room.Hiro-matsu and half the guards are instantly at the doorway and the rest move into a tight knot screening the dais.

""You are to come over here, Captain Blackthorne, away from the door,"" Father Alvito says with carefully contained urgency.""If you value your life, do not move suddenly or say anything!"""
?CCL47:	EQUAL?	AUDIENCE-CNT,8 \?CCL49
	MOVE	ISHIDO,AUDIENCE-CHAMBER
	MOVE	GRAYS,AUDIENCE-CHAMBER
	FCLEAR	DAIS,RMUNGBIT
	CRLF	
	PRINTR	"The door at the far end shivers open.Alvito translates what follows.""Lord Ishido wishes to see you, Sire,"" Naga announces.""He's -- he's here in the corridor and he wishes to see you.At once, he says.""

""Naga-san, tell Lord Ishido he is always welcome.Ask him to come in.""

A tall man strides into the room.Ten of his samurai, gray-uniformed, follow.

Toranaga says, ""Welcome, Lord Ishido.Please sit there.""He gestures at the single cushion on the dais.""I'd like you to be comfortable.""

""Thank you, no,"" responds Ishido.""I'd be embarrassed to be comfortable while you were not.One day I will take your cushion, but not today."""
?CCL49:	EQUAL?	AUDIENCE-CNT,9 \FALSE
	CRLF	
	PRINTI	"Ishido looks at you with pronounced distaste.""I heard he was ugly but not this ugly!Rumor has it that he's a pirate.Before you crucify him, please let me have him for half a day.Perhaps he could be taught to dance like a bear, and you could exhibit him throughout the Empire: 'The Freak from the East.'""

Toranaga smiles.""You're a man of vast humor, Lord Ishido.I agree the sooner the barbarian's removed the better.Naga-san, send some men and put him with the common criminals.""Alvito turns to you, and says ""You are to follow these men.You are to be detained.I don't know how for how long: until Lord Toranaga decides."""
	CRLF	
	MOVE	ALVITO,GENERIC-OBJECTS
	ICALL	REPLACE-SYNONYM,ALVITO,W?PRIEST,W?ALVITO,TRUE-VALUE
	MOVE	ISHIDO,GENERIC-OBJECTS
	MOVE	TORANAGA,GENERIC-OBJECTS
	REMOVE	GRAYS
	REMOVE	TORANAGAS-GUARDS
	CALL1	NEXT-SCENE
	RSTACK	

	.ENDSEG

	.SEGMENT "PRISON"


	.FUNCT	LG-LINE-F:ANY:0:0
	EQUAL?	HERE,PRISON \?CCL3
	EQUAL?	PRSA,V?BOARD \FALSE
	EQUAL?	PRSO,LG-LINE \FALSE
	PRINTR	"Now that the food has been distributed, the line has vanished.Everyone is back in his own little space."
?CCL3:	EQUAL?	PRSA,V?BOARD \?CCL10
	EQUAL?	PRSO,LG-LINE \?CCL10
	FSET?	LG-LINE,SCOREBIT \?CCL15
	PRINTI	"You join the line of prisoners."
	CRLF	
	CALL2	SCORE-OBJECT,LG-LINE
	RSTACK	
?CCL15:	PRINTR	"You're in line already."
?CCL10:	EQUAL?	PRSA,V?DISEMBARK,V?EXIT \FALSE
	EQUAL?	PRSO,LG-LINE \FALSE
	FSET?	LG-LINE,SCOREBIT \?CCL22
	PRINTR	"You aren't in line."
?CCL22:	PRINTR	"You are nudged back into line."


	.FUNCT	PRISONER-PSEUDO:ANY:0:0
	PRINTI	"The other prisoners "
	EQUAL?	HERE,PRISON \?CCL3
	PRINTR	"avoid you."
?CCL3:	PRINTR	"seem resigned to their fate."


	.FUNCT	PRISON-F:ANY:1:1,RARG,C
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	MOVE	CUP,BLACKTHORNE
	CALL	QUEUE,I-PRISON,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-END \?CCL5
	CALL1	QUESTION-VERB?
	ZERO?	STACK \?CCL8
	EQUAL?	PRSA,V?TELL-ME-ABOUT,V?ASK-ABOUT,V?TELL-ABOUT \FALSE
?CCL8:	CALL2	QUEUED?,I-BULLDOG >C
	ZERO?	C /?CND11
	GET	C,C-TICK
	ADD	STACK,1
	PUT	C,C-TICK,STACK
?CND11:	CALL2	QUEUED?,I-OUT-OF-PRISON >C
	ZERO?	C /FALSE
	GET	C,C-TICK
	ADD	STACK,1
	PUT	C,C-TICK,STACK
	RTRUE	
?CCL5:	EQUAL?	RARG,M-BEG \?CCL17
	EQUAL?	PRSA,V?LEAVE \?CCL20
	FSET?	THUG,DEAD /?CCL20
	PRINTR	"You try to get away, but the thug grabs you as you try to squeeze through the crowd of watchers."
?CCL20:	EQUAL?	PRSA,V?SPEAK \?CCL24
	IN?	DOMINGO,HERE \?CCL24
	ZERO?	PRSI /?CND27
	EQUAL?	PRSI,DOMINGO /?CND27
	ICALL1	CTHE-PRINT-PRSI
	PRINTI	" doesn't seem to understand you, but "
	ICALL2	THE-PRINT,DOMINGO
	PRINTI	" looks at you with excitement."
?CND27:	ICALL1	DOMINGO-STARES
	EQUAL?	PRSO,SPANISH \?CCL33
	ICALL2	DEQUEUE,I-PRISON
	CALL2	QUEUED?,I-OUT-OF-PRISON
	ZERO?	STACK \?CND34
	ICALL	QUEUE,I-MADMAN,3
	ICALL	QUEUE,I-BULLDOG,5
	ICALL	QUEUE,I-OUT-OF-PRISON,10
?CND34:	PRINTI	"""The mother tongue!Oh, it is so good to hear it again, my son!"""
	CRLF	
	CALL2	SCORE-OBJECT,DOMINGO
	RSTACK	
?CCL33:	EQUAL?	PRSO,LATIN \?CCL37
	PRINTI	"""You are an educated man, senor!"" he replies with obvious pleasure"
	FSET?	DOMINGO,SCOREBIT \?CCL40
	PRINTR	", then stops suddenly.""The senor is not a Jesuit?Does the senor speak Spanish?"""
?CCL40:	PRINTR	"."
?CCL37:	EQUAL?	PRSO,DUTCH \?CCL42
	PRINTI	"""Ah, the senor is from our dominions in Spanish Flanders!"
	FSET?	DOMINGO,SCOREBIT \?CND43
	PRINTR	"But please, speak Spanish!I have heard no Spanish since I came to this awful place!"""
?CND43:	CRLF	
	RTRUE	
?CCL42:	EQUAL?	PRSO,PORTUGUESE,ENGLISH \FALSE
	PRINTI	"""The senor is "
	EQUAL?	PRSO,PORTUGUESE \?CCL49
	PRINTI	"a Portuguese"
	JUMP	?CND47
?CCL49:	PRINTI	"a heretic English"
?CND47:	MOVE	DOMINGO,GENERIC-OBJECTS
	ICALL2	DEQUEUE,I-PRISON
	ICALL	QUEUE,I-OUT-OF-PRISON,2
	PRINTR	"!""He begins to rant and rave in a mixture of Spanish and Latin, growing ever more angry.The nearby Japanese shift uneasily.One of them gets up and shakes the priest gently, and gradually he comes out of his fit, but from then on he ignores you, and ultimately his flock leads him away."
?CCL24:	EQUAL?	PRSA,V?BOW \?CCL51
	EQUAL?	PRSO,FALSE-VALUE \?CCL51
	IN?	BULLDOG,HERE \?CCL51
	ICALL	PERFORM,V?BOW,BULLDOG
	RTRUE	
?CCL51:	EQUAL?	PRSA,V?SLEEP \FALSE
	FSET?	THUG,DEAD /?CCL59
	PRINTR	"To sleep now would be fatal!"
?CCL59:	PRINTR	"You try to find a safe place to rest in this hell."
?CCL17:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?OPEN \FALSE
	EQUAL?	PRSO,PRISON \FALSE
	ICALL	PERFORM,V?OPEN,IRON-DOOR
	RTRUE	


	.FUNCT	CUP-F:ANY:0:0
	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL3
	PRINTR	"It contains thin, watery gruel, but it's food, by God!"
?CCL3:	EQUAL?	PRSA,V?EAT,V?DRINK \?CCL5
	IN?	GRUEL,CUP \?CCL5
	ICALL	PERFORM,PRSA,GRUEL
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?TAKE \?CCL9
	IN?	CUP,THUG \FALSE
	PRINTR	"The thug jerks his hand away, and kicks you in the knee."
?CCL9:	EQUAL?	PRSA,V?GIVE \?CCL14
	EQUAL?	PRSO,CUP \?CCL14
	EQUAL?	HERE,PRISON \?CCL14
	REMOVE	CUP
	EQUAL?	PRSI,DOMINGO \?CCL20
	ICALL2	CTHE-PRINT,DOMINGO
	PRINTR	" takes the gruel and eats it thankfully."
?CCL20:	PRINTR	"Surprised that you don't want the gruel, the other prisoners fight each other for it."
?CCL14:	EQUAL?	PRSA,V?DROP \?CCL22
	FSET?	CUP,TOUCHBIT /FALSE
	EQUAL?	HERE,PRISON \FALSE
	PRINTI	"You drop the cup."
	RTRUE	
?CCL22:	EQUAL?	PRSA,V?POUR,V?POUR-FROM \FALSE
	FSET?	CUP,TOUCHBIT /?CCL32
	EQUAL?	HERE,PRISON \?CCL32
	PRINTI	"You start to tip the cup to pour it."
	CALL1	START-FIGHT
	RSTACK	
?CCL32:	PRINTR	"What a waste of good gruel, gruel that cost a man his life!"


	.FUNCT	GRUEL-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It's thin, watery stuff."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?DROP,V?GIVE /?CTR4
	EQUAL?	PRSA,V?POUR,V?THROW \?CCL5
?CTR4:	ICALL	REDIRECT,GRUEL,CUP
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?EAT,V?DRINK \FALSE
	FSET?	CUP,TOUCHBIT /?CCL12
	EQUAL?	HERE,PRISON \?CCL12
	PRINTI	"You bring the cup towards your lips."
	CALL1	START-FIGHT
	RSTACK	
?CCL12:	IN?	CUP,THUG \?CCL16
	PRINT	YOU-HAVE-TO
	PRINTR	"fight for it!"
?CCL16:	REMOVE	GRUEL
	PRINTR	"It's thin, watery barley and rice, but you wolf it down."


	.FUNCT	THUG-DESC:ANY:2:2,RARG,OBJ
	EQUAL?	RARG,M-OBJDESC? /TRUE
	FSET?	THUG,DEAD \?CCL6
	PRINTI	"The dead thug lies in the filth of the floor, his head at an unnatural angle to his body."
	RTRUE	
?CCL6:	PRINTI	"An apelike man stares at you with hatred."
	RTRUE	


	.FUNCT	THUG-F:ANY:0:1,RARG,TMP
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	PRINTR	"He appears uninterested in talking to you."
?CCL5:	EQUAL?	PRSA,V?GIVE \?CCL7
	EQUAL?	PRSO,CUP \?CCL7
	EQUAL?	PRSI,THUG \?CCL7
	FSET?	THUG,DEAD /?CCL7
	MOVE	CUP,THUG
	REMOVE	GRUEL
	PRINTR	"He grabs it out of your hand and wolfs it down.His hostility only seems to have increased, though."
?CCL7:	EQUAL?	PRSA,V?TAKE \?CCL13
	FSET?	THUG,DEAD \?CCL16
	PRINTR	"He's too heavy, especially in light of what you've been through lately."
?CCL16:	ICALL	PERFORM,V?ATTACK,THUG
	RTRUE	
?CCL13:	EQUAL?	PRSA,V?MOVE \?CCL18
	FSET?	THUG,DEAD \?CCL21
	PRINTR	"You shove his lifeless body."
?CCL21:	PRINTR	"You shove him away from you."
?CCL18:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	EQUAL?	PRSA,V?THROW \?CND24
	MOVE	PRSO,HERE
?CND24:	FSET?	THUG,DEAD \?CCL28
	EQUAL?	PRSA,V?PISS \?CCL31
	PRINTR	"Adding insult to injury."
?CCL31:	PRINTR	"He's already very dead."
?CCL28:	FSET?	THUG,RMUNGBIT /?CND32
	FSET	THUG,RMUNGBIT
	PUTP	THUG,P?HEALTH,1000
?CND32:	GETP	THUG,P?HEALTH
	SUB	STACK,1 >TMP
	PUTP	THUG,P?HEALTH,TMP
	ZERO?	TMP /?CCL36
	EQUAL?	PRSA,V?BITE \?CCL39
	PRINTR	"You grapple with him, and in desperation bite him on the arm.He jerks away, bleeding."
?CCL39:	EQUAL?	PRSA,V?THROW \?CCL41
	ICALL1	CTHE-PRINT-PRSO
	PRINTR	" hits him and clatters to the ground."
?CCL41:	EQUAL?	PRSA,V?KICK \?CCL43
	PRINTR	"You kick him savagely, and he staggers back."
?CCL43:	EQUAL?	PRSA,V?MOVE \?CCL45
	PRINTR	"You grab for him and try to pull him past you and down."
?CCL45:	EQUAL?	PRSA,V?PUSH \?CCL47
	PRINTR	"You shove him, and he momentarily loses his balance."
?CCL47:	EQUAL?	PRSA,V?HIT \?CCL49
	PRINTR	"You smash him in the jaw, knocking him backwards."
?CCL49:	CALL2	PICK-ONE,YOU-ATTACKS
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL36:	MOVE	CUP,HERE
	FSET	THUG,DEAD
	ICALL	REPLACE-ADJECTIVE,THUG,W?FILTHY,W?DEAD
	SET	'OPPONENT,FALSE-VALUE
	MOVE	BULLDOG,HERE
	PRINTI	"You close with him, intending to "
	PRINTB	P-PRSA-WORD
	PRINTI	" him, but he grabs you.You manage to grab his throat and hammer his head against a beam until he's senseless.He falls on some of the other prisoners, who curse loudly, and one of them, a heavyset bulldog of a man, chops him viciously on the neck with the side of his hand.There is a dry snap and the thug's head sags.The bulldog man lifts the half-shaven head and lets it fall.He smiles at you and shrugs."
	CRLF	
	CALL2	SCORE-OBJECT,THUG
	RSTACK	


	.FUNCT	START-FIGHT:ANY:0:1,INT?,BAD?
	FSET?	THUG,RMUNGBIT \?CND1
	SET	'BAD?,TRUE-VALUE
?CND1:	PUTP	BLACKTHORNE,P?HEALTH,4
	FSET	THUG,RMUNGBIT
	FSET	CUP,TOUCHBIT
	ICALL2	THIS-IS-IT,THUG
	SET	'OPPONENT,THUG
	ZERO?	INT? /?CND3
	CRLF	
?CND3:	ZERO?	BAD? \?CTR6
	LOC	GRUEL
	ZERO?	STACK \?CCL7
?CTR6:	PRINTI	"The"
	JUMP	?CND5
?CCL7:	PRINTI	"Suddenly, the"
?CND5:	PRINTI	" apelike man -- unshaven, filthy, lice-ridden -- "
	FSET?	BLACKTHORNE,SITTING \?CND10
	ICALL1	B-STAND
	PRINTI	"jerks you to your feet, "
?CND10:	PRINTI	"chops you over the kidneys and "
	IN?	CUP,THUG \?CCL14
	PRINTI	"spits out"
	JUMP	?CND12
?CCL14:	IN?	CUP,BLACKTHORNE \?CCL16
	PRINTI	"takes"
	JUMP	?CND12
?CCL16:	PRINTI	"then picks up"
?CND12:	MOVE	CUP,THUG
	PRINTR	" your ration.The others wait to see what will happen."


	.FUNCT	I-PRISON:ANY:0:0,TMP
	INC	'DELAY-CNT
	EQUAL?	PRISON-CNT,2 \?CCL5
	FSET?	THUG,SCOREBIT \?CND3
	GETP	BLACKTHORNE,P?HEALTH
	SUB	STACK,1 >TMP
	PUTP	BLACKTHORNE,P?HEALTH,TMP
	ZERO?	TMP /?CCL10
	CRLF	
	CALL2	PICK-ONE,THUG-ATTACKS
	PRINT	STACK
	CRLF	
	CRLF	
	PRINTR	"The other prisoners watch impassively."
?CCL10:	CRLF	
	PRINTI	"With a ferocious overhand blow, the thug smashes you to the floor, and then jumps on you, breaking your neck."
	ICALL1	JIGS-UP
	RETURN	M-FATAL
?CCL5:	EQUAL?	PRISON-CNT,7 \?CND3
	FSET?	DOMINGO,SCOREBIT \?CND3
	GRTR?	DELAY-CNT,5 \?CCL16
	CRLF	
	PRINTI	"He shakes his head, as though trying to wake from a dream.""The senor is a dream.The devil is sending me dreams, yes!""He hobbles away, his followers grouped closely about him."
	CRLF	
	ICALL2	DEQUEUE,I-PRISON
	ICALL	QUEUE,I-OUT-OF-PRISON,2
	RETURN	M-FATAL
?CCL16:	SET	'QCONTEXT,DOMINGO
	CRLF	
	PRINTI	"""The senor speaks Spanish, eh?The senor is not a thrice-damned heretic, is he?""There is an edge of hysteria in the old man's voice.His followers edge closer to him."
	CRLF	
?CND3:	SET	'DELAY-CNT,0
	INC	'PRISON-CNT
	EQUAL?	PRISON-CNT,1 /TRUE
	EQUAL?	PRISON-CNT,2 \?CCL20
	FSET?	CUP,TOUCHBIT /FALSE
	CALL2	START-FIGHT,TRUE-VALUE
	RSTACK	
?CCL20:	EQUAL?	PRISON-CNT,3 \?CCL25
	ICALL	QUEUE,I-BULLDOG-EATS-IT,2
	ICALL2	THIS-IS-IT,CUP
	ICALL2	THIS-IS-IT,BULLDOG
	CRLF	
	PRINTR	"To your amazement, the bulldog-like man offers you the cup of gruel that you had presumed lost."
?CCL25:	EQUAL?	PRISON-CNT,6 /TRUE
	EQUAL?	PRISON-CNT,7 \?CCL28
	ICALL1	B-SIT
	MOVE	DOMINGO,HERE
	ICALL2	THIS-IS-IT,DOMINGO
	SET	'QCONTEXT,DOMINGO
	CRLF	
	PRINTR	"Your exhaustion is beginning to take its toll, and you start to fall into a nightmare.In what seems like moments, you are jerked to wakefulness, your ears exploding with the sonorous Latin of the Last Sacrament: ""In nomine Patris et Filii et Spiritus Sancti.""There is another European, a toothless old scarecrow of a man, bending over you!"
?CCL28:	EQUAL?	PRISON-CNT,8 \FALSE
	ICALL2	DEQUEUE,I-PRISON
	RFALSE	


	.FUNCT	I-BULLDOG-EATS-IT:ANY:0:1,NOT-INT?
	IN?	CUP,HERE \FALSE
	IN?	GRUEL,CUP \FALSE
	REMOVE	CUP
	ZERO?	NOT-INT? \?CND6
	CRLF	
?CND6:	PRINTR	"The bulldog man, amazed that you don't want the gruel, eats it, nodding happily in your direction."


	.FUNCT	BULLDOG-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	EQUAL?	PRSA,V?DOMO \?CCL6
	PRINTR	"He smiles at you."
?CCL6:	PRINTI	"He appears well-disposed to you, but doesn't understand what you say."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?GIVE \FALSE
	EQUAL?	PRSO,CUP \FALSE
	CALL2	I-BULLDOG-EATS-IT,TRUE-VALUE
	RSTACK	


	.FUNCT	DOMINGO-STARES:ANY:0:0
	FSET?	DOMINGO,TOUCHBIT /FALSE
	FSET	DOMINGO,TOUCHBIT
	PRINTI	"He stares down at you with rheumy eyes.""Oh blessed Virgin!The senor is real!""His words become a jumble of Japanese and Latin and Spanish.His head twitches.""The senor is real?"" he asks again."
	RTRUE	


	.FUNCT	DOMINGO-F:ANY:0:1,RARG
	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,M-WINNER \?CCL5
	ICALL1	DOMINGO-STARES
	EQUAL?	QCONTEXT,DOMINGO \?CCL8
	FSET?	DOMINGO,SCOREBIT \?CCL8
	EQUAL?	PRSA,V?YES,V?NO \?CCL8
	EQUAL?	PRSA,V?YES \?CCL14
	SET	'DELAY-CNT,5
	PRINTR	"""The devil is testing me!He sends me a fellow Christian, and then he transforms him into a heretic!"""
?CCL14:	PRINTR	"""Then show me you are of our Empire!The senor is a German, perhaps? Speak Spanish and prove to me you are a subject of the King!"""
?CCL8:	EQUAL?	PRSA,V?YES,V?NO \?CCL16
	PRINTR	"He seems oblivious to your answer, listening only to what language you are speaking."
?CCL16:	EQUAL?	PRSA,V?BE \?CCL18
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL18
	ZERO?	PRSI /?CCL18
	CALL1	ENGLISH?
	ZERO?	STACK /?CCL24
	ICALL	PERFORM,V?SPEAK,ENGLISH
	RTRUE	
?CCL24:	CALL1	DUTCH?
	ZERO?	STACK /?CCL26
	ICALL	PERFORM,V?SPEAK,DUTCH
	RTRUE	
?CCL26:	CALL1	SPANISH?
	ZERO?	STACK /?CCL28
	PRINTR	"""I can tell you aren't Spanish, senor."""
?CCL28:	CALL1	PORTUGUESE?
	ZERO?	STACK /?CCL30
	ICALL	PERFORM,V?SPEAK,PORTUGUESE
	RTRUE	
?CCL30:	PRINTR	"He doesn't seem too excited to hear this."
?CCL18:	FSET?	DOMINGO,SCOREBIT \?CCL32
	PRINTR	"He seems to ignore what you say, only listening to the sound of the language itself."
?CCL32:	EQUAL?	PRSA,V?WHO \?PRD36
	EQUAL?	PRSO,YOU,DOMINGO /?CTR33
?PRD36:	EQUAL?	PRSA,V?HELLO \?CCL34
?CTR33:	FCLEAR	DOMINGO,AN
	ICALL	NEW-SDESC,DOMINGO,STR?501
	PRINTR	"""I'm Friar...Friar Domingo...Domingo of the Sacred Order of St. Francis.I came here to teach the heathen, to bring them to the light, but Jesuits put me here, Jesuits poured filth into the ears of the Taiko!"""
?CCL34:	EQUAL?	PRSA,V?HELP \?CCL40
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL40
	PRINTR	"""Only God can help us, senor."""
?CCL40:	EQUAL?	PRSA,V?FIND \?CCL44
	EQUAL?	PRSO,ME,BLACKTHORNE \?CCL44
	PRINTR	"""This is the prison, senor.All here await their fate."""
?CCL44:	EQUAL?	PRSA,V?TEACH \?PRD50
	EQUAL?	PRSO,ME,BLACKTHORNE \?PRD50
	EQUAL?	PRSI,FALSE-VALUE,JAPANESE /?CTR47
?PRD50:	CALL1	JAPANESE-VERB?
	ZERO?	STACK /?CCL48
	GETP	JAPANESE,P?COUNT
	GRTR?	STACK,0 \?CCL48
?CTR47:	ICALL	QUEUE,I-TEACH,2
	ICALL2	I-TEACH,TRUE-VALUE
	RTRUE	
?CCL48:	CALL1	QUESTION-VERB?
	ZERO?	STACK /?CCL57
	FSET?	JAPAN,RMUNGBIT /?CCL57
	CALL1	DOMINGO-OFFERS-HELP
	RSTACK	
?CCL57:	EQUAL?	PRSA,V?TELL-ME-ABOUT,V?WHO,V?WHAT \?CCL61
	EQUAL?	PRSO,MADMAN,CRAZY \?CCL64
	PRINTI	"""Everyone here believes that madness is caused only by "
	ICALL2	PRINTUNDER,STR?502
	PRINTI	", who are evil, malicious spirits.Thus, madmen, like children and the very old, are not responsible for their actions and have special privileges."""
	JUMP	?CND62
?CCL64:	EQUAL?	PRSO,SUICIDE \?CCL66
	PRINTI	"""A sin against God, senor!They are so touchy, so pride-filled, that if they are thwarted, or if they cannot do their duty, they will kill themselves.They'll do it if their liege orders it, in a wink.A heinous sin!"""
	JUMP	?CND62
?CCL66:	EQUAL?	PRSO,PRISON \?CCL68
	PRINTI	"""The Japanese didn't have prisons until recently.Only the guilty come here.For just a little while."""
	JUMP	?CND62
?CCL68:	EQUAL?	PRSO,GLOBAL-SAMURAI \?CCL70
	PRINTI	"""Samurai means 'servant,' but they are fierce warriors who serve their heathen masters.Men and women, too, are samurai.They own everything, they are everything, but some have seen the light!"""
	JUMP	?CND62
?CCL70:	EQUAL?	PRSO,JESUITS \?CCL72
	PRINTI	"""Their lies put me here and caused twenty-six Holy Fathers to be martyred!Does the senor know that Jesuits are merely traders, gun runners, and usurers?That they control all the silk trade here, all trade with China?That the annual Black Ship is worth a million in gold?That they've forced His Holiness, the Pope, to grant them total power over Asia -- them and their dogs, the Portuguese?That all other religions are forbidden here?That they secretly smuggled guns into Japan for Christian kings here, inciting them to rebellion?"""
	JUMP	?CND62
?CCL72:	EQUAL?	PRSO,CHURCH,GOD \?CCL74
	PRINTI	"""My son, you must want to make your confession.I will be glad to help you."""
	JUMP	?CND62
?CCL74:	EQUAL?	PRSO,SATAN \?CCL76
	PRINTI	"""He tests me constantly!I fight, but it's so difficult!"""
	JUMP	?CND62
?CCL76:	EQUAL?	PRSO,ALVITO \?CCL78
	PRINTI	"""That Jesuit puppy!He had the temerity to try to 'intercede' with the Taiko when that imp of Satan threatened to ban us from Japan!As though our own priests weren't good enough to speak with that monster!"""
	JUMP	?CND62
?CCL78:	EQUAL?	PRSO,BLACK-SHIP \?CCL80
	PRINTI	"""They're the greatest ships in the world, almost two thousand tons.I'm told they sail well before the wind but lumber when the wind's abeam.They carry twenty or thirty guns.They are the greatest treasure ships in all Asia, carrying the silks of China here to Japan!The silver alone is a fortune beyond calculation!"""
	JUMP	?CND62
?CCL80:	EQUAL?	PRSO,DOMINGO,YOU \?CCL82
	ICALL	PERFORM,V?WHO,DOMINGO
	RTRUE	
?CCL82:	EQUAL?	PRSO,JAPAN \?CCL84
	PRINTI	"""The land was discovered in 1542, senor, the year I was born.There were three men, da Mota, Peixoto, and one other.They were all Portuguese traders, they were blown off course to land in Kyushu.Soon after, the Church sent missionaries to convert the heathen."""
	JUMP	?CND62
?CCL84:	EQUAL?	PRSO,GORODA \?CCL86
	PRINTI	"""He was a devil!He conquered all Japan and made a mountain of skulls and declared himself Dictator, but still wasn't powerful enough to be Shogun!Then he was assassinated by one of his generals.Now he burns in Hell!"""
	JUMP	?CND62
?CCL86:	EQUAL?	PRSO,TAIKO \?CCL88
	PRINTI	"""He was an ugly little man.The Jesuits filled his ears with lies.He was Goroda's general, born a peasant, so he could never be Shogun, even though he brought the whole of Japan under his devil's rule!He turned against us, and the Hand of God lay heavy on him: a storm smashed his great castle.It was marvelous to behold!Now he is dead and the carrion crows, Toranaga, Ishido and the rest, fight over the carcass -- and the filthy Jesuits aren't the least of these!"""
	JUMP	?CND62
?CCL88:	EQUAL?	PRSO,KIYAMA \?CCL90
	PRINTI	"""Lord Kiyama is a good Christian, but under the thumb of the Jesuits!"""
	JUMP	?CND62
?CCL90:	EQUAL?	PRSO,SHOGUN \?CCL92
	PRINTI	"""The Shogun is the Supreme Ruler.Save for the Emperor himself, he is all powerful.There has been no Shogun for hundreds of years, even the Taiko never became Shogun, but Toranaga!Ah, he would be Shogun if he could!"""
	JUMP	?CND62
?CCL92:	EQUAL?	PRSO,TORANAGA \?CCL94
	PRINTI	"""He's a sly one.Vicious and sly as a snake, subtle as a fox!"""
	JUMP	?CND62
?CCL94:	EQUAL?	PRSO,ISHIDO \?CCL96
	PRINTI	"""He hates the Church, but he hates us all, Jesuit and Franciscan alike!An evil man."""
	JUMP	?CND62
?CCL96:	EQUAL?	PRSO,SPAIN \?CCL98
	PRINTI	"""Ah, Spain!My village is outside Madrid, senor, in the mountains.It is called Santa Veronica."""
	JUMP	?CND62
?CCL98:	EQUAL?	PRSO,BULLDOG \?CCL100
	PRINTC	34
	CALL	NOUN-USED?,PRSO,W?GONZALEZ
	ZERO?	STACK \?CND101
	PRINTI	"His name is Gonzalez, senor."
?CND101:	PRINTI	"He is one of us."""
	JUMP	?CND62
?CCL100:	FSET?	PRSO,PERSON \?CCL104
	PRINTI	"""I know nothing of "
	ICALL2	PRINT-HIM/HER,PRSO
	PRINTI	", senor."""
?CND62:	FSET?	JAPAN,RMUNGBIT /?CCL108
	PRINTC	11
	CALL1	DOMINGO-OFFERS-HELP
	RSTACK	
?CCL104:	FSET?	JAPAN,RMUNGBIT \?CND62
	ICALL2	CTHE-PRINT,DOMINGO
	PRINTI	" seems to have lost the thread of your question."
	CALL2	PICK-ONE,DOMINGO-RAMBLES
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL108:	CRLF	
	RTRUE	
?CCL61:	RANDOM	100
	LESS?	60,STACK /?CCL110
	ICALL2	CTHE-PRINT,DOMINGO
	PRINTI	" doesn't seem to be listening.He mutters something irrelevant."
	CALL2	PICK-ONE,DOMINGO-RAMBLES
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL110:	PRINTR	"His mind seems to have wandered.In any case, he doesn't respond."
?CCL5:	EQUAL?	SCENE,S-PRISON /?CCL112
	CALL1	ABSTRACT-VERB?
	ZERO?	STACK \?CCL112
	PRINTI	"Father Domingo isn't here."
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	ICALL1	END-QUOTE
	RETURN	M-FATAL
?CCL112:	EQUAL?	PRSA,V?LIE \?CCL119
	PRINTR	"Volunteer nothing, but don't lie."
?CCL119:	EQUAL?	PRSA,V?EXAMINE \?CCL121
	PRINTR	"He is a toothless old man with long filthy hair and a matted beard and broken nails.He wears a foul, threadbare smock.In one hand he carries a wooden cross."
?CCL121:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	PRINTR	"You can't bring yourself to hurt this saintly, if slightly addled, man.He may be a hated Spaniard, but he has made a place for himself in this hell."


	.FUNCT	DOMINGO-OFFERS-HELP:ANY:0:0
	FSET	JAPAN,RMUNGBIT
	PRINTR	"He is very excited.""If the senor has never been to Asia before, he will be like a child in the wilderness.I will teach you!I will tell you all the secrets you will need to survive!"""


	.FUNCT	I-TEACH:ANY:0:1,P?,CNT
	IN?	DOMINGO,HERE \?CCL3
	ICALL	QUEUE,I-TEACH,-1,TRUE-VALUE
	ZERO?	P? \?CCL6
	EQUAL?	PRSA,V?TEACH \?CCL6
	EQUAL?	PRSO,ME \?CCL6
	EQUAL?	PRSI,JAPANESE /FALSE
?CCL6:	GETP	JAPANESE,P?COUNT
	ADD	STACK,1 >CNT
	PUTP	JAPANESE,P?COUNT,CNT
	ZERO?	P? \?CND12
	CRLF	
?CND12:	PRINTC	34
	CALL1	JAPANESE-VERB?
	ZERO?	STACK /?CND14
	PRINTI	"Very good, my son!"
?CND14:	EQUAL?	CNT,1 \?CCL18
	PRINTI	"Ah, Japanese!It's a devil's own language for us, but they find our languages as hard, or worse!The first thing you must know is to be polite, always polite, even when you're spitting in their eyes.'"
	ICALL2	PRINTUNDER,STR?509
	PRINTI	",' that's the first word to know.It means 'thank you,' sometimes you say '"
	ICALL2	PRINTUNDER,STR?510
	PRINTI	"' as well, '"
	ICALL2	PRINTUNDER,STR?511
	PRINTI	".'"""
	CRLF	
	CALL2	SCORE-OBJECT,JAPANESE
	RSTACK	
?CCL18:	EQUAL?	CNT,2 \?CCL20
	PRINTI	"To greet someone politely, you say '"
	ICALL2	PRINTUNDER,STR?512
	PRINTI	"'  It means 'How are you?'  To say you are well, you say '"
	ICALL2	PRINTUNDER,STR?242
	PRINTR	".'"""
?CCL20:	EQUAL?	CNT,3 \?CCL22
	IN?	BULLDOG,HERE \?CCL25
	PRINTI	"That man over there, he tells me he"
	JUMP	?CND23
?CCL25:	PRINTI	"That man who"
?CND23:	PRINTR	" helped you.His name is Gonzalez, but before he became a Christian he was Akabo.It just means 'porter,' senor.They don't have names.Only samurai have names."""
?CCL22:	EQUAL?	CNT,4 \?CCL27
	ICALL	REPLACE-SYNONYM,GLOBAL-WATER,W?WATER,W?MIZU
	PRINTI	"As '"
	ICALL2	PRINTUNDER,STR?513
	PRINTI	"' is 'thank you,' '"
	ICALL2	PRINTUNDER,STR?514
	PRINTI	"' is 'please.' 'Water' is '"
	ICALL2	PRINTUNDER,STR?515
	PRINTR	".'"""
?CCL27:	EQUAL?	CNT,5 \?CCL29
	PRINTC	39
	ICALL2	PRINTUNDER,STR?516
	PRINTR	"' is 'sorry,' remember the Japanese put a great price on manners and courtesy!"""
?CCL29:	EQUAL?	CNT,6 \?CCL31
	PRINTC	39
	ICALL2	PRINTUNDER,STR?517
	PRINTI	"' is 'I don't speak Japanese,' and yes, you must apologize, so you say '"
	ICALL2	PRINTUNDER,STR?518
	PRINTR	"' as well.The daimyos are prideful and as touchy as wasps, but courteous, ah, so courteous!"""
?CCL31:	ICALL2	DEQUEUE,I-TEACH
	PRINTR	"It is so good to teach, senor!""Domingo continues to teach you simple words and phrases.The old man is lonely, and proud of his knowledge, and his success in converting the prisoners."
?CCL3:	ICALL2	DEQUEUE,I-TEACH
	RFALSE	


	.FUNCT	MADMAN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	PRINTI	"He laughs insanely, pointing his finger and making faces."
	CRLF	
	CALL1	END-QUOTE
	RSTACK	
?CCL3:	EQUAL?	RARG,M-SUBJ /FALSE
	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL10
	PRINTR	"He's wild-eyed and drooling.You shudder.Is this your fate?Will you ever be released?"
?CCL10:	CALL1	HOSTILE-VERB?
	ZERO?	STACK /FALSE
	PRINTR	"The other prisoners stop you, indicating that he is not to be hurt."


	.FUNCT	I-MADMAN:ANY:0:0
	IN?	MADMAN,HERE \?CCL3
	MOVE	MADMAN,GENERIC-OBJECTS
	CRLF	
	PRINTR	"The madman capers away, singing and drooling.You lose sight of him in the crowd of prisoners."
?CCL3:	MOVE	MADMAN,HERE
	ICALL	QUEUE,I-MADMAN,3
	CRLF	
	PRINTR	"Suddenly the crowd of prisoners parts and a naked, filthy prisoner comes into view.He is singing something noisy and incomprehensible.He starts to dance a wild capering dance.The man is obviously crazy, but no one hurts him or kicks him aside, even when he accidentally knocks over a cup of food.Father Domingo makes the sign of the cross and shakes his head."


	.FUNCT	I-BULLDOG:ANY:0:0
	REMOVE	BULLDOG
	CRLF	
	PRINTR	"The iron door of the cell swings open.Guards begin to call names from a list.The man who befriended you is one of those called.One of Domingo's followers is also among those called.He kneels before Domingo, who gives him the sign of the cross and the Last Sacrament.He walks away, and the door closes again.

""His Calvary is outside the door,"" says Domingo."


	.FUNCT	I-OUT-OF-PRISON:ANY:0:0
	CALL2	QUEUED?,I-TEACH
	ZERO?	STACK \?CCL3
	ICALL1	TIME-PASSES
	CRLF	
	PRINTI	"For three days and three nights, you "
	IN?	DOMINGO,HERE \?CCL6
	GETP	JAPANESE,P?COUNT
	ZERO?	STACK /?CCL6
	PRINTI	"fill your mind with facts and Japanese words and phrases.For three days and three nights you sit with Father Domingo and question and listen and learn and sleep in nightmare."
	JUMP	?CND4
?CCL6:	PRINTI	"endure the hell of the prison."
?CND4:	PRINTI	"

Then, on the fourth day, they call out your name.

""Anjin-san!"""
	IN?	DOMINGO,HERE \?CND9
	PRINTI	"

""Thy confession, my son, say it quickly,"" cries Father Domingo.

""Go with God, Father"" you reply, and the door slams behind you."
?CND9:	CRLF	
	CRLF	
	CALL2	GOTO,PRISON-COURTYARD
	RSTACK	
?CCL3:	ICALL	QUEUE,I-OUT-OF-PRISON,1
	RFALSE	


	.FUNCT	PRISON-COURTYARD-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"This is a courtyard with great doors to the east.A line of naked prisoners stands before an official in a somber kimono."
?CCL3:	EQUAL?	RARG,M-BEG \?CCL5
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?EAST \FALSE
	FSET?	LG-LINE,RMUNGBIT /FALSE
	PRINTI	"The jailers "
	FSET?	LG-LINE,SCOREBIT \?CCL14
	PRINTR	"and your escort prevent you from leaving."
?CCL14:	PRINTR	"roughly prod you back into line."
?CCL5:	EQUAL?	RARG,M-ENTER \FALSE
	ICALL	QUEUE,I-LEAVE-PRISON,-1
	MOVE	DOMINGO,GENERIC-OBJECTS
	MOVE	GRAYS,HERE
	ICALL2	THIS-IS-IT,GRAYS
	PRINTI	"The air is incredibly cool and sweet, the clouds meandering before a fine southeasterly wind.You gulp deep draughts of the clean, glorious air.The joy of life fills you."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	OFFICIAL-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The official is dressed in a somber kimono and an overmantle with starched, winglike shoulders."


	.FUNCT	I-LEAVE-PRISON:ANY:0:0
	INC	'DELAY-CNT
	ZERO?	LEAVE-CNT \?CCL5
	FSET?	LG-LINE,SCOREBIT \?CND3
	GRTR?	DELAY-CNT,3 \?CCL10
	FCLEAR	LG-LINE,SCOREBIT
	CRLF	
	PRINTR	"A jailer shoves you to the ground, then kicks you into line with a stream of invective."
?CCL10:	CRLF	
	PRINTR	"One of the jailers prods you roughly toward the line."
?CCL5:	EQUAL?	LEAVE-CNT,2 \?CCL12
	EQUAL?	HERE,PRISON-COURTYARD \?CND3
	CRLF	
	PRINTI	"Your guards hustle you towards the gate."
	CRLF	
	GRTR?	DELAY-CNT,1 \TRUE
	CRLF	
	ICALL2	GOTO,OUTSIDE-PRISON
	RTRUE	
?CCL12:	EQUAL?	LEAVE-CNT,8 \?CND3
	IN?	BLACKTHORNE,YABU-PALANQUIN /?CND3
	CRLF	
	PRINTI	"Yabu points to the palanquin.The Gray captain violently disagrees, saying, """
	ICALL2	PRINTUNDER,STR?455
	PRINTR	""""
?CND3:	SET	'DELAY-CNT,0
	INC	'LEAVE-CNT
	EQUAL?	LEAVE-CNT,1 \?CCL22
	CRLF	
	PRINTR	"The official stands in front of the first prisoner and reads from a delicate scroll.As he finishes, each man begins to plod after his party of jailers toward the great doors of the courtyard."
?CCL22:	EQUAL?	LEAVE-CNT,2 \?CCL24
	MOVE	KIMONO,BLACKTHORNE
	MOVE	SOCKS,BLACKTHORNE
	MOVE	SANDALS,BLACKTHORNE
	FSET	LG-LINE,RMUNGBIT
	FSET	PRISON-GATE,OPENBIT
	ICALL2	THIS-IS-IT,CLOTHES
	CRLF	
	PRINTR	"You reach the front of the line.Unlike the others, you are given clean clothes to wear.Your guards are samurai, and they motion you to put on the clothes."
?CCL24:	EQUAL?	LEAVE-CNT,3 /TRUE
	EQUAL?	LEAVE-CNT,4 \?CCL27
	CRLF	
	PRINTI	"One man is already roped to his cross and the cross is being lifted into the sky.Beside each cross two "
	ICALL2	PRINTUNDER,STR?218
	PRINTI	" wait, their long lances sparkling in the sun.

The samurai jostle closer, hurrying you.You prepare to lunge for the nearest sword, thinking numbly that it would be better to die now, quickly.But suddenly they are turning away from the arena, heading toward the paths that lead through the woods to the city and the castle!"
	CRLF	
	CRLF	
	MOVE	GRAYS,DEEP-WOODS
	CALL2	GOTO,DEEP-WOODS
	RSTACK	
?CCL27:	EQUAL?	LEAVE-CNT,5 \?CCL29
	CRLF	
	PRINTI	"When you are deep in the woods, another party of thirty-odd Grays approaches from around a curve ahead.The two parties of Grays greet each other, and then, just as the new group is preparing to leave, their leader calmly pulls out his sword and impales the leader of your samurai.The ambush is so sudden that all your escort is dead almost in the same instant.Not one has even had time to draw his sword."
	CRLF	
	REMOVE	GRAYS
	MOVE	BANDITS,HERE
	MOVE	BANDIT-LEADER,HERE
	CRLF	
	PRINTR	"At a command from the leader, these new Grays strip off their uniform kimonos.Underneath they wear a motley collection of rags and ancient kimonos.All pull on masks.The bandit leader smiles and motions you to begin walking back toward the city."
?CCL29:	EQUAL?	LEAVE-CNT,6 \?CCL31
	MOVE	BROWNS,HERE
	MOVE	GRAYS,HERE
	MOVE	GRAY-CAPTAIN,HERE
	MOVE	YABU,YABU-PALANQUIN
	MOVE	YABU-PALANQUIN,HERE
	CRLF	
	PRINTI	"Suddenly there are noises ahead and another party of samurai rounds the bend.Browns and Grays, the Browns the vanguard, their leader in a palanquin.Both groups move into skirmish positions, eyeing each other hostilely."
	CRLF	
	MOVE	YABU,HERE
	SET	'DODGED?,FALSE-VALUE
	SET	'OPPONENT,BANDIT-LEADER
	CRLF	
	PRINTR	"The man in the palanquin gets down and you recognize him.It is Kasigi Yabu!He shouts at the bandit leader but the man shakes his sword furiously, ordering them out of the way.Yabu gives a curt order, and charges with a screaming battle cry, limping slightly.The bandit guarding you swings his sword at you!"
?CCL31:	EQUAL?	LEAVE-CNT,7 \?CCL33
	REMOVE	BANDITS
	REMOVE	BANDIT-LEADER
	SET	'OPPONENT,FALSE-VALUE
	ZERO?	DODGED? \?CND34
	CRLF	
	PRINTI	"The bandit leader's sword plunges into you.As a red mist comes over your sight, Yabu, enraged, tries to avenge you, but his leg slows him."
	CRLF	
?CND34:	CRLF	
	PRINTI	"The bandit leader turns and flees, his men following.The Browns and Grays are quickly beside you.Some scramble after the fleeing bandits into the bushes.Yabu stops at the edge of the brush, shouts orders imperiously, then comes back slowly, his limp more pronounced."
	CRLF	
	ZERO?	DODGED? \FALSE
	CALL1	JIGS-UP
	RSTACK	
?CCL33:	EQUAL?	LEAVE-CNT,8 \?CCL40
	FSET	YABU-PALANQUIN,SCOREBIT
	CRLF	
	PRINTI	"None of the bandits are captured.Yabu and the Gray leader begin to argue, Yabu pointing to the castle, and the Gray to the woods.You hear the word "
	ICALL2	PRINTUNDER,STR?519
	PRINTI	", which you know to mean 'prisoner.'  They are trying to decide what to do with you!To return you to Toranaga at the castle, or send you on with the Grays to Ishido.

Yabu motions you to get into the palanquin.The Gray captain says, """
	ICALL2	PRINTUNDER,STR?455
	PRINTR	""""
?CCL40:	EQUAL?	LEAVE-CNT,9 \FALSE
	ICALL2	DEQUEUE,I-LEAVE-PRISON
	RFALSE	


	.FUNCT	GENERIC-BANDIT-F:ANY:2:2,R,F
	EQUAL?	BANDIT-LEADER,OPPONENT \?CCL3
	RETURN	BANDIT-LEADER
?CCL3:	RETURN	BANDITS


	.FUNCT	BANDIT-LEADER-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	PRINT	STR?424
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?FOLLOW \FALSE
	PRINTR	"You bow in agreement and prepare to follow the bandits."


	.FUNCT	BANDITS-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \FALSE
	PRINTR	"They don't respond."


	.FUNCT	YABU-PALANQUIN-F:ANY:0:1,RARG
	EQUAL?	RARG,M-BEG \?CCL3
	EQUAL?	PRSA,V?SIT \FALSE
	PRINT	STR?520
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,FALSE-VALUE \FALSE
	EQUAL?	PRSA,V?BOARD \FALSE
	FIRST?	PRSO \?CCL14
	PRINTR	"There's someone using it already."
?CCL14:	FSET?	YABU-PALANQUIN,SCOREBIT \?CCL16
	PRINTI	"You speak in halting Japanese, knowing the words to be ungrammatical, but hoping they will be understood, ""I friend.Not prisoner.Want bath.Tired.Hungry.Bath.""You point to the castle.""Go there!Now, please.Lord Toranaga.Go now.""You get awkwardly into the palanquin and lay down on the cushions, your feet sticking far out.

Then Yabu laughs, and everyone joins in.He bows mockingly.""Ah so, Anjin-sama!""

""Iye, Yabu-sama.Anjin-san."""
	CRLF	
	ICALL2	SCORE-OBJECT,YABU-PALANQUIN
	CALL1	NEXT-SCENE
	RSTACK	
?CCL16:	PRINTR	"No one will let you in it."


	.FUNCT	DEEP-WOODS-EXIT:ANY:0:2,RARG,STRICT?
	ZERO?	RARG \FALSE
	IN?	BANDITS,HERE \?CCL6
	PRINTI	"The bandits"
	PRINT	STR?521
	CRLF	
	RFALSE	
?CCL6:	IN?	YABU,HERE \?CCL8
	PRINTI	"Yabu stops you and points toward the city."
	CRLF	
	RFALSE	
?CCL8:	IN?	BROWNS,HERE \?CCL10
	PRINTI	"The Grays"
	PRINT	STR?521
	CRLF	
	RFALSE	
?CCL10:	PRINTI	"The escort won't let you get ahead of the party."
	CRLF	
	RFALSE	


	.FUNCT	DEEP-WOODS-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"This is a wide track deep in the woods.There are tall trees and a well-tended sward which feels soft underfoot.The castle is to the west and the path continues to the east."
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?SIT \?CCL8
	PRINTR	"You are rudely jerked to your feet."
?CCL8:	EQUAL?	PRSA,V?WALK \?PRD12
	EQUAL?	P-WALK-DIR,P?WEST /?CTR9
?PRD12:	EQUAL?	PRSA,V?WALK-TO \?CCL10
	EQUAL?	PRSO,LG-CASTLE,CITY \?CCL10
?CTR9:	IN?	BANDITS,HERE \?CCL19
	PRINTR	"You start back toward the city, walking as slowly as possible."
?CCL19:	PRINT	STR?522
	CRLF	
	RTRUE	
?CCL10:	EQUAL?	OPPONENT,BANDIT-LEADER \?CCL21
	ZERO?	DODGED? \?CCL21
	CALL1	MOTION-VERB?
	ZERO?	STACK /?CCL21
	SET	'DODGED?,TRUE-VALUE
	PRINTI	"With all your remaining strength you jerk away from the bandit and roll to one side.His sword slashes down, but he misses."
	CRLF	
	CALL2	SCORE-OBJECT,BANDITS
	RSTACK	
?CCL21:	FSET?	YABU-PALANQUIN,SCOREBIT \FALSE
	EQUAL?	PRSA,V?POINT \FALSE
	EQUAL?	PRSO,LG-CASTLE \FALSE
	ICALL	PERFORM,V?BOARD,YABU-PALANQUIN
	RTRUE	


	.FUNCT	PRISON-GATE-F:ANY:0:0
	EQUAL?	PRSA,V?OPEN,V?CLOSE \FALSE
	PRINTR	"The jailers would not appreciate your usurping their job."


	.FUNCT	CROWD-PSEUDO:ANY:0:0
	PRINTR	"The crowd ignores you."


	.FUNCT	OUTSIDE-PRISON-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"Prisoners are being executed here.A large, spruce crowd looks on, crimson and yellow with golden sunshades."
?CCL3:	EQUAL?	RARG,M-BEG \?CCL5
	EQUAL?	PRSA,V?WALK \FALSE
	EQUAL?	P-WALK-DIR,P?WEST \FALSE
	PRINTR	"Your escort refuses to let you return to the prison."
?CCL5:	EQUAL?	RARG,M-ENTER \FALSE
	MOVE	GRAYS,HERE
	PRINTI	"Your guards keep pace and a wary eye on you."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	PRISON-AFTER-F:ANY:0:0
	PRINTR	"A bath and massage and two hours of sleep immeasurably refresh you.The bath attendants, all women of girth and strength, pummel you and shampoo your hair, and the barber trims your beard.The futons on which you sleep are so clean, like the room.It all seems dreamlike.You wait impatiently, hoping to be brought to Toranaga again.

You know, beyond all doubt, because of what Friar Domingo told you about the Portuguese and Japanese politics and trade, that you can help Toranaga, who, in return, can easily give you the riches and freedom you desire.There is no ship in all Asia like yours, and if Toranaga commands, you can sweep the Portuguese and Spanish from the seas with it, make a gift to him of the Black Ship, destroy his enemies, anything!"

	.ENDSEG

	.SEGMENT "MARIKO"


	.FUNCT	MAPLE-GLADE-F:ANY:1:1,RARG
	EQUAL?	RARG,M-SCENE-SETUP \?CCL3
	ICALL1	DRESS-BLACKTHORNE
	ICALL	REPLACE-SYNONYM,RUTTER,W?MAP,W?RUTTER,TRUE-VALUE
	ICALL	REPLACE-SYNONYM,SECRET-RUTTER,W?MAP,W?RUTTER,TRUE-VALUE
	ICALL	NEW-SDESC,MARIKO,STR?215,TRUE-VALUE
	ICALL	REPLACE-SYNONYM,MARIKO,W?MARIKO,W?WOMAN,TRUE-VALUE
	ICALL	REPLACE-SYNONYM,MARIKO,W?TODA,W?WOMAN,TRUE-VALUE
	ICALL	REPLACE-ADJECTIVE,MARIKO,W?TODA,W?LADY,TRUE-VALUE
	ICALL2	THIS-IS-IT,MARIKO
	FCLEAR	MARIKO,THE
	ICALL	NEW-SDESC,YAEMON,STR?524,TRUE-VALUE
	FCLEAR	YAEMON,THE
	FCLEAR	YAEMON,NOABIT
	FCLEAR	YAEMON,NOTHEBIT
	SET	'QCONTEXT,TORANAGA
	ICALL2	THIS-IS-IT,TORANAGA
	MOVE	YAEMON,HERE
	MOVE	MARIKO,HERE
	MOVE	TORANAGA,HERE
	CALL	QUEUE,I-YAEMON,-1
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTR	"This is Toranaga's private garden within Osaka Castle.You are in a glade of maples near a little thatched hut."
?CCL5:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?ENTER,V?THROUGH \?CCL10
	EQUAL?	PRSO,TEA-HOUSE \?CCL10
	PRINTR	"That would be very impolite."
?CCL10:	EQUAL?	PRSA,V?EXAMINE \?CCL14
	EQUAL?	PRSO,MARIKO \?CCL14
	ICALL1	PRE-EXAMINE
	PRINT	STR?525
	PRINTR	".You wonder if she is Toranaga's consort.What would it be like to have such a woman in bed?You'd be afraid of crushing her.No, she wouldn't break.There are women in England almost as small.But not like her."
?CCL14:	FSET?	YAEMON,SCOREBIT \?CCL18
	EQUAL?	PRSA,V?WINK \?PRD22
	EQUAL?	PRSO,FALSE-VALUE /?CTR17
?PRD22:	EQUAL?	PRSA,V?MAKE \?PRD25
	EQUAL?	PRSO,HEAD /?CTR17
?PRD25:	CALL1	ACT-CRAZY?
	ZERO?	STACK /?CCL18
?CTR17:	ICALL	PERFORM,V?SMILE,YAEMON
	RTRUE	
?CCL18:	EQUAL?	PRSA,V?KONNICHI-WA,V?BOW \?CCL29
	EQUAL?	PRSO,MARIKO,TORANAGA,YAEMON /?PRD32
	EQUAL?	PRSO,FALSE-VALUE \?CCL29
?PRD32:	FSET?	MAPLE-GLADE,SCOREBIT \?CCL29
	ICALL1	B-SIT
	EQUAL?	PRSA,V?KONNICHI-WA \?CCL37
	PRINTI	"You use the phrases the old monk taught you."""
	ICALL2	PRINTUNDER,STR?450
	PRINTI	","" you say."
	JUMP	?CND35
?CCL37:	PRINTI	"You bow to "
	ZERO?	PRSO /?CCL40
	ICALL1	THE-PRINT-PRSO
	JUMP	?CND38
?CCL40:	ICALL2	DPRINT,TORANAGA
?CND38:	PRINTI	"."
?CND35:	ICALL	NEW-SDESC,MARIKO,STR?15
	ICALL	REPLACE-SYNONYM,MARIKO,W?WOMAN,W?MARIKO
	ICALL	REPLACE-SYNONYM,MARIKO,W?WOMAN,W?TODA
	ICALL	REPLACE-ADJECTIVE,MARIKO,W?LADY,W?TODA
	EQUAL?	PRSO,FALSE-VALUE,TORANAGA /?CND41
	PRINTI	"You bow to "
	ICALL2	DPRINT,TORANAGA
	PRINTI	" as well."
?CND41:	EQUAL?	PRSA,V?KONNICHI-WA \?CCL45
	PRINTC	34
	ICALL2	PRINTUNDER,STR?526
	PRINTI	"""You gather your kimono around you and sit."""
	ICALL2	PRINTUNDER,STR?527
	PRINTI	"""

The woman looks surprised."""
	FSET?	HERE,RMUNGBIT /?CND46
	FSET	HERE,RMUNGBIT
	PRINTI	"I am your interpreter, senhor,"" she says at once.""My name is Mariko."
?CND46:	SET	'QCONTEXT,MARIKO
	ICALL2	SETUP-ANSWER,STR?528
	PRINTI	"But you speak Japanese?"" she asks.You explain that you know only a few words and phrases.""My Master wishes to know where you learned your 'few words and phrases.'"""
	CRLF	
	CALL2	SCORE-OBJECT,MAPLE-GLADE
	RSTACK	
?CCL45:	FSET	HERE,RMUNGBIT
	PRINTR	"The woman greets you.""My name is Mariko.I am your interpreter, senhor."""
?CCL29:	IN?	ISHIDO,HERE \?CCL49
	EQUAL?	PRSA,V?TELL \?PRD53
	EQUAL?	PRSO,TORANAGA /?CTR48
?PRD53:	EQUAL?	PRSA,V?ASK-ABOUT,V?TELL-ABOUT \?CCL49
	EQUAL?	PRSO,TORANAGA \?CCL49
?CTR48:	PRINTI	"Mariko motions you not to interrupt Toranaga."
	CRLF	
	EQUAL?	PRSA,V?TELL \TRUE
	CALL1	END-QUOTE
	RSTACK	
?CCL49:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL62
	EQUAL?	PRSO,TORANAGA \?CCL62
	ICALL	PERFORM,V?TELL-ABOUT,MARIKO,PRSI
	RTRUE	
?CCL62:	EQUAL?	PRSA,V?DRAW \?CCL66
	EQUAL?	PRSO,WORLD \?CCL66
	PRINTR	"You kneel in the sand.With your finger you begin to draw a crude map, upside down so they can see it better.You sketch boldly.""I can draw a more accurate map later, with pen and paper.""You gesture.""This is north and south, east and west.Japan is here, my country's on the other side of the world, there.This is all unknown and unexplored.""Your hand waves away the vast expanse of western North America, the interior of South America, all Asia north and east of Muscovy, and inland Africa.""We know the coastlines, but little else.The interiors are almost entirely mysteries."""
?CCL66:	EQUAL?	PRSA,V?BOW \FALSE
	EQUAL?	PRSO,ISHIDO \FALSE
	FSET?	ISHIDO,RMUNGBIT \?CCL75
	PRINTR	"You copy the Japanese.Toranaga seems impressed."
?CCL75:	PRINTR	"You bow to Ishido, but he ignores you."


	.FUNCT	MARIKO-TELL-MARIKO-ABOUT:ANY:0:0
	EQUAL?	PRSI,ME \?CCL3
	PRINTR	"You relate the story of your life. Toranaga questions you closely about many points, particulary those relating to war and politics."
?CCL3:	EQUAL?	PRSI,DOMINGO,PRISON \?CCL5
	CALL1	HOW-I-LEARNED
	RSTACK	
?CCL5:	EQUAL?	PRSI,QUEEN,ENGLAND \?CCL7
	PRINTR	"""My land is ruled by a Queen.Queen Elizabeth whose father freed us from the hated priests, and whose wise rule these many years has kept us free!"""
?CCL7:	EQUAL?	PRSI,BLACK-SHIP \?CCL9
	PRINTR	"""Give me back my ship and I'll sweep the Portuguese and Spanish from the sea and bring you the Black Ship!"""
?CCL9:	EQUAL?	PRSI,WORLD \?CCL11
	PRINTR	"""Perhaps I could draw you a map of the world, as we know it?""

Toranaga seems interested."
?CCL11:	EQUAL?	PRSI,VOYAGE \?CCL13
	PRINTR	"""We were two years sailing here, through Magellan's Pass into the Pacific.""

Toranaga interrupts, and Mariko says, ""My Master says you are mistaken.All bar -- all Portuguese come from the south.""

""Yes, it's true they favor that way,"" you reply.""They have dozens of forts all along the route.Most of those forts employ Japanese troops, by the way.""

You see an immediate reaction on Mariko's face, and when she translates, on Toranaga's."
?CCL13:	EQUAL?	PRSI,CHURCH,POPE \?CCL15
	PRINTR	"""The Pope divided the world between Spain and Portugal.Portugal has the exclusive right to this country, to all these countries -- Japan, China, and Africa -- in return for spreading Catholicism."""
?CCL15:	PRINTR	"Mariko passes on the information to Toranaga, but he doesn't seem too interested."


	.FUNCT	HOW-I-LEARNED:ANY:0:0
	SET	'QCONTEXT,FALSE-VALUE
	ICALL2	SETUP-ANSWER,FALSE-VALUE
	PRINTR	"""There was a monk in the prison, senhorita, a Francisan monk, and he taught me.Things like 'food, friend, bath, go, come, true, false,' and so on.Would you please tell Lord Toranaga that I'm better prepared now to answer his questions, to help, and more than a little pleased to be out of prison.For which I thank him."""


	.FUNCT	I-YAEMON:ANY:0:0
	FSET?	YAEMON,SCOREBIT \?CND1
	EQUAL?	YAEMON-CNT,1 /?CCL4
	GRTR?	YAEMON-CNT,1 \?CND1
	RANDOM	100
	LESS?	67,STACK /?CND1
?CCL4:	SET	'YAEMON-BORED?,TRUE-VALUE
	CRLF	
	ICALL2	CTHE-PRINT,YAEMON
	PRINTI	" seems bored with you.He reminds you of your own son when the talk of adults becomes too serious."
	RANDOM	100
	LESS?	50,STACK /?CCL11
	PRINTI	"He yawns."
	CRLF	
	JUMP	?CND1
?CCL11:	PRINTI	"His attention is drifting."
	CRLF	
?CND1:	EQUAL?	QCONTEXT,MARIKO \?PRG17
	IGRTR?	'MARIKO-IMPATIENT,1 \FALSE
	CRLF	
	PRINTR	"""Please answer, senhor.My Master grows impatient."""
?PRG17:	INC	'DELAY-CNT
	ZERO?	YAEMON-CNT \?CND19
	FSET?	MAPLE-GLADE,SCOREBIT \?CND19
	EQUAL?	DELAY-CNT,1 \?CCL25
	CRLF	
	PRINTI	"The three Japanese are watching you.The woman is curious but nervous, Toranaga is like a hawk watching a rabbit, and the boy stares at you as he would stare at a fabulous monster.It's exactly what your own son, so far away in England, would do."
	JUMP	?CND23
?CCL25:	CRLF	
	PRINTI	"The three Japanese continue to watch you."
?CND23:	PRINTR	"What was the polite phrase the old monk taught you?You try to remember."
?CND19:	SET	'DELAY-CNT,0
	INC	'YAEMON-CNT
	EQUAL?	YAEMON-CNT,1 \?CCL28
	ICALL2	THIS-IS-IT,MARIKO
	CRLF	
	PRINTR	"Mariko begins to ask you questions.Where you were born, whether you are married, where you lived in England.She is not as good an interpreter as Father Alvito, but she is more pleasant to talk to, and beautiful.At one point you compliment her on her flawless grasp of Portuguese, and she blushes, fluttering her fan."
?CCL28:	EQUAL?	YAEMON-CNT,2 \?CCL30
	ICALL2	THIS-IS-IT,MARIKO
	ICALL2	THIS-IS-IT,TORANAGA
	CRLF	
	PRINTR	"""My Lord wishes to know about you and your family,"" Mariko continues.""About your country, its queen and previous rulers, habits, customs, and history.Similarly about all other countries, particularly Portugal and Spain.All about the world you live in.About your ships, weapons, foods, trade.About your wars and battles and how to navigate a ship, how you guided your ship and what happened on the voyage.He wants to understand -- Excuse me, why do you laugh?""

""Only because, senhorita,"" you reply, ""that seems to be just about everything I know.""

""That is precisely what my Master wishes."""
?CCL30:	EQUAL?	YAEMON-CNT,3 \?CCL32
	MOVE	ISHIDO,HERE
	FSET	ISHIDO,RMUNGBIT
	CRLF	
	PRINTR	"Ishido appears at the edge of the glade, bows formally to the young boy, and to Toranaga, who looks annoyed at the interruption but bows back."
?CCL32:	EQUAL?	YAEMON-CNT,4 \?CCL34
	FCLEAR	ISHIDO,RMUNGBIT
	CRLF	
	PRINTR	"Ishido and Toranaga converse.Mariko translates for you.""Please excuse me, Lord Toranaga,"" he says.""There is an important matter I wish to see you about.The last formal meeting of the Regents has been postponed.We do not meet tonight at sunset.Lord Kiyama's sick.Lord Sugiyama and Lord Onoshi have agreed to the delay.A few days are unimportant, aren't they, on such important matters?""

""When will the meeting be?"" Toranaga asks, seething.Any delay jeopardizes him immeasurably."
?CCL34:	EQUAL?	YAEMON-CNT,5 \?CCL36
	CRLF	
	PRINTR	"""I understand Lord Kiyama should be well tomorrow, or perhaps the next day.His physician has forbidden any visitors.The disease might be contagious.""Ishido is very nonchalant, implying the delay could be indefinite."
?CCL36:	EQUAL?	YAEMON-CNT,6 \?CCL38
	MOVE	ISHIDO,GENERIC-OBJECTS
	MOVE	PROPHECY,GENERIC-OBJECTS
	CRLF	
	PRINTR	"""I'll visit Lord Kiyama the day after tomorrow,"" Toranaga says, naming a deadline.""The contagion that will topple me has not yet been born.Remember the soothsayer's prediction!""

""No, Lord Toranaga, I haven't forgotten,"" Ishido says, remembering very well.He bows again, very deferential to the boy, and leaves."
?CCL38:	EQUAL?	YAEMON-CNT,7 \FALSE
	CRLF	
	PRINTI	"Soon the interview is over, and the Heir is sent for his swimming lesson.Toranaga installs you in his own sleeping chamber, as a mark of his favor.Things are looking up, indeed!"
	CRLF	
	CALL1	NEXT-SCENE
	RSTACK	


	.FUNCT	YAEMON-F:ANY:0:1,RARG
	EQUAL?	RARG,M-WINNER \?CCL3
	CALL1	WAKARIMASEN
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL6
	PRINTR	"The boy is small and straight and round-eyed, his full black hair tied into a short queue, his pate unshaven.His curiosity seems enormous."
?CCL6:	EQUAL?	PRSA,V?SMILE,V?WINK \?CCL8
	ZERO?	YAEMON-BORED? /?CCL11
	FSET?	YAEMON,SCOREBIT \?CCL14
	PRINTI	"The boy jumps, then laughs and interrupts Mariko and points and speaks out, and everyone listens indulgently and no one hushes him.

""Lord Toranaga asks why you did that, senor?""

You think for a moment and reply, ""Oh, just to amuse the lad.He's a child like any, and children in my country would usually laugh if you did that.My son must be about his age now.My son's seven.""

""The Heir is seven,"" Mariko says after a pause."
	CRLF	
	CALL2	SCORE-OBJECT,YAEMON
	RSTACK	
?CCL14:	PRINTR	"There is no response this time."
?CCL11:	ICALL2	CTHE-PRINT,YAEMON
	PRINTR	" jumps back, startled."
?CCL8:	EQUAL?	PRSA,V?WHO \FALSE
	PRINTR	"He is the Heir, the only son of the Taiko, who died a year ago.The Council of Regents is to guide him and rule Japan through his minority."


	.FUNCT	ALVITO-AFTER-F:ANY:0:0
	PRINTR	"Elsewhere in Osaka, Father Alvito reports to his superior, dell'Aqua, the Father-Visitor of Asia, the most powerful Jesuit and thus the most powerful man in Asia.

""We're already in trouble.Toranaga began by saying that he understands from the Ingeles that incredible profits are being made from the Portuguese monopoly of the silk trade with China.He 'invites' you to report to the Regents on rates of exchange.He does not object to our making a large profit, providing it comes from the Chinese.I'm sorry to tell you that Blackthorne seems to be particularly well informed.""

Ferriera, the Spanish Captain of the Black Ship, says coldly, ""The sooner the heretic's dead the better.If the Dutch and English start spreading their filth in Asia we're in for trouble!""

""I regret to tell you, Captain, that Toranaga said that if any harm befalls the Ingeles, it's quite possible the Taiko's Expulsion Edicts would be reexamined and all Christian churches, schools, places of rest, would be immediately closed."""

	.ENDSEG

	.ENDI
