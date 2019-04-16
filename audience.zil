"AUDIENCE for
				 SHOGUN
	 (c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT AUDIENCE>

<CONSTANT J-JOKE 70>
<CONSTANT J-SIT 71>

<ROOM OUTER-CORRIDOR ;"setup s-toranaga"
      (LOC ROOMS)
      (SCENE S-TORANAGA)
      (AFTER ISHIDO-VS-TORANAGA-AFTER-F)
      (DESC "Outer Corridor")
      (SYNONYM CORRIDOR)
      (ADJECTIVE OUTER)
      (PICTURE P-OSAKA)
      (SCORE 3)
      (FDESC
"You take your leave of Rodrigues, and then you are on deck,
your mind whirling from the impact of Osaka, its immensity, the teeming
anthills
of people, and the enormous castle that dominates the city.  From within
the castle's vastness comes the soaring beauty of the donjon, seven or
eight stories high, pointed gables with curved roofs at each level,
the tiles all gilded and the walls blue.|
|
The next day you are brought by Hiro-matsu to Toranaga's keep within
the castle.")
      (IN TO AUDIENCE-CHAMBER IF OUTER-DOOR IS OPEN)
      (EAST TO AUDIENCE-CHAMBER IF OUTER-DOOR IS OPEN)
      (WEST PER STAIRS-EXIT)
      (DOWN PER STAIRS-EXIT)
      (GLOBAL OUTER-DOOR LG-NINJA)
      (FLAGS ONBIT)
      (ACTION OUTER-CORRIDOR-F)>

<ROUTINE STAIRS-EXIT ("OPT" (RARG <>) (STRICT? <>))
	 <COND (<SCENE? ,S-NINJA> ,STAIRS)
	       (ELSE
		<COND (<NOT .RARG>
		       <TELL
"The guards point to toward the audience chamber instead." CR>)>
		<RFALSE>)>>

<ROUTINE OUTER-CORRIDOR-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<REPLACE-SYNONYM ,LG-CREWMEN ,W?MAN ,W?CREWMAN T>
		<REPLACE-SYNONYM ,LG-CREWMEN ,W?MEN ,W?CREWMEN T>
		<MOVE ,HIRO-MATSU ,HERE>
		<MOVE ,TORANAGAS-GUARDS ,AUDIENCE-CHAMBER>
		<MOVE ,ALVITO ,AUDIENCE-CHAMBER>
		<MOVE ,YABU ,AUDIENCE-CHAMBER>
		<MOVE ,TORANAGA ,AUDIENCE-CHAMBER>
		<MOVE ,FALCON ,TORANAGA>
		<PUTP ,BLACKTHORNE ,P?HEALTH 4>
		<FCLEAR ,OUTER-DOOR ,OPENBIT>
		<QUEUE I-AUDIENCE -1>)
	       (<RARG? LOOK>
		<TELL
"This outer corridor is where those who are about to be granted
audience with Toranaga wait.  The great Audience Chamber is to the
east and stairs down to the lower part of the keep are to the west.">
		<COND (<SCENE? ,S-TORANAGA>
		       <TELL " Massed samurai, their young officer in
front of them, protect the last door -- each with right hand on the
sword hilt, left on the scabbard, motionless and ready, staring at
you.">)>
		<CRLF>)
	       (<RARG? BEG>
		<COND (<SCENE? ,S-NINJA>
		       <COND (<AND <VERB? WALK>
				   <IN? ,NINJA ,HERE>
				   ,KNOCKOUT-CNT>
			      <TELL
G"You can't break through the encircling ninja!" CR>)
			     (<AND <P? WALK P?WEST>
				   <IN? ,YABU ,HERE>>
			      <YABU-LISTENS>)>)>)>>

<ROOM AUDIENCE-CHAMBER
      (LOC ROOMS)
      (DESC "Audience Chamber")
      (SYNONYM CHAMBER ROOM)
      (ADJECTIVE AUDIENCE)
      (WEST TO OUTER-CORRIDOR IF OUTER-DOOR IS OPEN)
      (EAST TO INNER-CORRIDOR IF INNER-DOOR IS OPEN)
      (IN TO INNER-CORRIDOR IF INNER-DOOR IS OPEN)
      (SOUTH TO SECRET-ROOM IF SECRET-ROOM-DOOR IS OPEN)
      (GLOBAL INNER-DOOR OUTER-DOOR SECRET-ROOM-DOOR LG-NINJA LG-MEN LG-WOMEN)
      (FLAGS ONBIT SCOREBIT)
      (ACTION AUDIENCE-CHAMBER-F)>

<GLOBAL POINTEE ALVITO>

<ROUTINE AUDIENCE-CHAMBER-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is the immense audience room.  The room is forty paces square and
ten high, the tatami mats the best quality, four fingers thick and
impeccable.">
		<COND (<NOT <FSET? ,VASE ,TOUCHBIT>>
		       <TELL
" Near the dais, in a niche, is a small earthenware vase
with a single spray of cherry blossom and this fills the room with
color and fragrance.">)>
		<COND (<SCENE? S-TORANAGA>
		       <TELL
" Ten paces from the dais, circling it, are
twenty samurai, seated cross-legged and facing outward.">)>
		<TELL " Doors lead east and west to the outer
and inner corridors, respectively.">
		<COND (<NOT <FSET? ,SECRET-ROOM-DOOR ,INVISIBLE>>
		       <TELL
" On the south wall is a formerly secret door used by the ninja
attackers.">)>
		<CRLF>)
	       (<RARG? BEG>
		<COND (<SCENE? ,S-TORANAGA>
		       <COND (<P? LISTEN
				  (<> TORANAGA ALVITO HIRO-MATSU LG-MEN)>
			      <TELL
"You can't understand anything they say in Japanese">
			      <COND (<PROB 25>
				     <TELL
", except that once you hear the word \"Anjin.\"" CR>)
				    (ELSE <TELL "." CR>)>)
			     (<VERB? TEKI SAY>
			      <COND (<OR <AND <P? SAY INTQUOTE>
					      <EQUAL? ,W?TEKI
						      <GET-INTQUOTE 0>
						      <GET-INTQUOTE 1>>>
					 <P? TEKI>
					 <P? SAY TEKI>>
				     <COND (<NOT <FSET? ,TEKI ,RMUNGBIT>>
					    <TELL
"That's not a word you know." CR>
					    <RTRUE>)
					   (<NOT <FSET? ,ALVITO ,SCOREBIT>>
					    <TELL
"You've already said that.  Don't belabor it." CR>
					    <RTRUE>)
					   (<EQUAL? ,POINTEE ,ALVITO>
					    <FCLEAR ,ALVITO ,RMUNGBIT>
					    <TELL
"You say "I"teki"".  Toranaga speaks curtly, and
the priest begins translating simultaneously, a few words behind.  \"Why
are you an enemy of Tsukku-san, who's the enemy of no
one?\"  Alvito adds, \"The Japanese cannot pronounce my name either.  Tsukku
is a pun on "I"tsuyaku"" -- to interpret.\"" CR>
					    <SCORE-OBJECT ,ALVITO>
					    <RTRUE>)>)>
			      <COND (<JIGS-UP? ,J-JOKE
"You remember Rodrigues' advice, and decide not to test the local sense
of humor.">
				     <JIGS-UP
"Toranaga speaks angrily to Hiro-matsu.  Alvito translates.  \"This is no
time for jokes.  You have made one joke too many, Englishman!\"">)
				    (ELSE <RTRUE>)>)
			     (<ACT-CRAZY?>
			      <TELL
"Toranaga looks at you with surprise.  He seems to think you are crazy." CR>)
			     (<AND <VERB? POINT>
				   <NOT <PRSO? ,ALVITO>>>
			      <SETG POINTEE ,PRSO>
			      <TELL
"You point at " THE ,PRSO ".  " CTHE ,ALVITO " seems
pleased at how foolishly you are acting." CR>)
			     (<AND <P? (LOOK-UP EXAMINE) (ROOMS TORANAGA)>
				   <B-NOT-STANDING?>
				   <FSET? ,FALCON ,RMUNGBIT>>
			      <FCLEAR ,FALCON ,RMUNGBIT>
			      <TELL
"You look up boldly at Toranaga.  He seems surprised and amused
at your impertinence." CR>)
			     (<OR <VERB? WALK-AROUND>
				  <P? (WALK-TO FOLLOW JOIN)
				      (ALVITO TORANAGA DAIS)>
				  <P? WALK (P?FORE P?IN)>
				  <P? AVOID (INNER-DOOR OUTER-DOOR)>>
			      <COND (<NOT <FSET? ,DAIS ,RMUNGBIT>>
				     <TELL
"Alvito hisses, \"Captain, Lord Toranaga has not given you permission
to move.\"" CR>) 
				    (<FSET? ,DAIS ,SCOREBIT>
				     <TELL
"You carefully and quietly stand, bow to Toranaga, and move to Alvito's
side, away from the main door." CR>
				     <SCORE-OBJECT ,DAIS>)
				    (<PRSO? DAIS TORANAGA>
				     <TELL
"You are already as close to the dais as Toranaga's samurai will allow." CR>)
				    (ELSE
				     <TELL
"Alvito hisses, \"If you move again, it will mean your life!\"" CR>)>)
			     (<VERB? WALK LEAVE>
			      <TELL
"You are not allowed to leave." CR>)
			     (<AND <IN? ,ISHIDO ,HERE>
				   <OR <VERB? TELL YELL YELL-AT SAY>
				       <AND <NOT <PASSIVE-VERB?>>
					    <NOT <GAME-VERB?>>
					    <NOT <VERB? SIT>>>>>
			      <TELL
"Alvito hisses, \"As you value your life, Englishman, keep silent!\"" CR>
			      <COND (<VERB? TELL>
				     <END-QUOTE>
				     <RFATAL>)
				    (ELSE <RTRUE>)>)
			     (<AND <VERB? SPEAK PICK>
				   ,ALVITO-TRANSLATES?>
			      <ALVITO-SPEAKS>)
			     (<AND <NOT ,ALVITO-TRANSLATES?>
				   <VERB? TELL>>
			      <TELL
"Your impatience and impertinence could cost you your life." CR>
			      <END-QUOTE>
			      <RFATAL>)
			     (<IN? ,FALCON ,TORANAGA>
			      <COND (<P? BOW (<> TORANAGA)>
				     <COND (<NOT <FSET? ,HERE ,RMUNGBIT>>
					    <FSET ,HERE ,RMUNGBIT>
					    <TELL
"You bow as you have learned to, remembering Rodrigues' words: \"Behave
like a king and they'll treat you like a king.\"  You don't want to
kneel." CR>)
					   (<B-NOT-STANDING?>
					    <TELL
"You count slowly to six, and then you incline your head and bow
slightly again." CR>)
					   (ELSE
					    <TELL
"You've already bowed once.  You glance nervously around at the seated
samurai.  What can you do to show you are respectful but equal?" CR>)>)
				    (<VERB? SIT>
				     <COND (<NOT <FSET? ,HERE ,RMUNGBIT>>
					    <COND (<JIGS-UP? ,J-SIT
"You think, and decide that a show of pride is one thing, a show of contempt
another.">
						   <B-SIT>
						   <TELL
"You sit cross-legged without bowing and stare at Toranaga.  Everyone in
the room is deathly silent, watching to see what he will do.  The answer
comes quickly, with a flash of steel you barely see before it ends
your life.">
						   <JIGS-UP>)
						  (ELSE <RTRUE>)>)
					   (<B-STANDING?>
					    <B-SIT>
					    <TELL
"Taking a deep breath, you sit cross-legged and stare at Toranaga." CR>)>)
				    (<VERB? KNEEL>
				     <B-KNEEL>
				     <TELL
"You kneel abjectly, in imitation of Hiro-matsu." CR>)>)>)
		      (<SCENE? ,S-NINJA>
		       <COND (<VERB? LEAVE>
			      <DO-WALK ,P?EAST>)
			     (<AND <VERB? WALK>
				   <IN? ,NINJA ,HERE>
				   ,KNOCKOUT-CNT>
			      <TELL
G"You can't break through the encircling ninja!" CR>)
			     (<P? WALK P?WEST>
			      <COND (<IN? ,YABU ,HERE>
				     <YABU-LISTENS>)
				    (<AND <QUEUED? I-ATTACK>
					  <IN? ,NINJA ,SECRET-ROOM>
					  <NOT <FSET? ,NINJA ,INVISIBLE>>>
				     <TELL
"You go toward the exit to the outer corridor and the stairs, but the
guards motion you back." CR>)
				    (<AND <P? WALK (P?WEST P?SOUTH)>
					  <IN? ,NINJA ,HERE>>
				     <TELL
G"You would have to walk right through the ninja!" CR>)>)>)>)>>

<ROUTINE ISHIDO-VS-TORANAGA-AFTER-F ()
	 <TELL
"Toranaga watches you
leave the room, taking his mind off the interview and coming to grips
with the problem of Ishido.  Toranaga was summoned to Osaka to give
answers to the Council of Regents, and against the advice of his
advisors, he chose to obey.  Now he is stuck, the meeting delayed and
delayed, Toranaga caught in the castle of his most deadly enemy.|
|
Ishido comes instantly to the point. \"What is your answer to the
Council of Regents?\"|
|
Toranaga answers, \"As President of the
Council of Regents I do not believe an answer is necessary.  Our late
Master, the Taiko, has been dead a year.  I don't threaten his house
or my nephew Yaemon, the Taiko's Heir.  I seek no more territory.  By
the Lord Buddha, I'll not be the first to break the peace.\"|
|
Ishido
bristles.  \"The Lady Ochiba, the mother of the heir, is hostage in
your castle at Yedo, against your safety here.  The Council requests
her presence in Osaka instantly.  We're all agreed: Lord Sugiyama,
Lord Onoshi, Lord Kiyama, and I.  Here are their signatures.\"|
|
Toranaga is livid.  Why had Kiyama and Onoshi defected to Ishido?
Four to one means isolation and disaster!" CR>>

<OBJECT VASE
 	(LOC AUDIENCE-CHAMBER)
 	(DESC "vase")
 	(SYNONYM VASE)
	(ADJECTIVE EARTHENWARE CERAMIC)
 	(FLAGS NDESCBIT TAKEBIT TRYTAKEBIT OPENBIT CONTBIT SEARCHBIT)
 	(CAPACITY 10)
 	(ACTION VASE-F)>

<ROUTINE VASE-F ()
 	 <COND (<VERB? TAKE>
 		<FCLEAR ,FLOWER ,NDESCBIT>
 		<FCLEAR ,VASE ,NDESCBIT>
		<RFALSE>)
	       (<AND <VERB? LOOK-INSIDE>
		     <FSET? ,FLOWER ,NDESCBIT>>
 		<TELL "The vase contains one sprig of cherry blossoms." CR>)>>

<OBJECT FLOWER
 	(LOC VASE)
 	(DESC "cherry blossom")
	(SYNONYM SPRAY FLOWER BLOSSOM)
	(ADJECTIVE CHERRY)
 	(FLAGS NDESCBIT TAKEBIT TRYTAKEBIT)
 	(ACTION FLOWER-F)>

<ROUTINE FLOWER-F ()
 	 <COND (<VERB? EXAMINE>
 		<TELL
"The cherry blossoms are past their peak, but still beautiful." CR>)
	       (<VERB? TAKE>
 		<COND (<SCENE? ,S-TORANAGA>
		       <TELL
"It would be worth your life to take that sprig of cherry." CR>)
		      (ELSE
		       <FCLEAR ,PRSO ,NDESCBIT>
		       <RFALSE>)>)>>

<OBJECT DAIS
 	(LOC AUDIENCE-CHAMBER)
 	(DESC "dais")
 	(OWNER TORANAGA)
 	(SYNONYM DAIS)
 	(FLAGS NDESCBIT SCOREBIT OPENBIT CONTBIT VEHBIT SEARCHBIT)>

<OBJECT FALCON
	(DESC "peregrine")
	(OWNER TORANAGA)
	(SYNONYM FALCON PEREGRINE WORK)
	(FLAGS NDESCBIT RMUNGBIT)
	(ACTION FALCON-F)>

<ROUTINE FALCON-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The falcon has a broken wing feather, which Toranaga is repairing.  The
falcon is hooded." CR>)>>

<OBJECT TORANAGAS-GUARDS
	(DESC "samurai guards")
	(OWNER TORANAGA)
	(SYNONYM GUARDS SAMURAI)
	(FLAGS NDESCBIT PERSON JAPANESEBIT PLURAL
	 OPENBIT CONTBIT SEARCHBIT NOABIT THE)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION TORANAGAS-GUARDS-F)>

<ROUTINE TORANAGAS-GUARDS-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>
		<END-QUOTE>)>>

<OBJECT ALVITO
	(LOC GENERIC-OBJECTS) ;"was in global-objects"
	(SCENE S-TORANAGA)
	(SDESC "tonsured priest" ;"Father Alvito")
	(SYNONYM ALVITO PRIEST MAN FATHER JESUIT)
	(ADJECTIVE FATHER MARTIN TONSURED LEAN-FACED PORTUGUESE)
	(PICTURE P-ALVITO)
	(FLAGS PERSON PORTUGUESEBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(GENERIC GENERIC-MAN-F)
	(ACTION ALVITO-F)>

<ROUTINE ALVITO-F ("OPT" (RARG <>) "AUX" ADJ)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<AND <VERB? SPEAK PICK>
			    ,ALVITO-TRANSLATES?>
		       <ALVITO-SPEAKS>)
		      (<OR <VERB? HELLO>
			   <AND <VERB? YES>
				<EQUAL? ,P-PRSA-WORD ,W?NOD>>>
		       <TELL
CTHE ,ALVITO " bows in response, more like a European courtier than a
Japanese." CR>)
		      (<VERB? SORRY>
		       <TELL
"\"It is of no consequence now.\"  You are not sure he is sincere." CR>)
		      (<P? WHO YOU>
		       <NEW-SDESC ,ALVITO "Father Alvito">
		       <TELL
G"\"My name is Martin Alvito of the Society of Jesus, Captain-Pilot.  Lord
Toranaga has asked me to interpret for him.\"" CR>)
		      (<P? BE? YOU INTADJ>
		       <SET ADJ <PARSE-ADJ ,PARSE-RESULT>>
		       <COND (<EQUAL? .ADJ ,W?PORTUGUESE>
			      <TELL
"\"I have that privilege.\"" CR>)>)
		      (<P? BE (ME BLACKTHORNE) ENGLAND>
		       <TELL
"\"Yes, Pilot, you are of the enemy.  In spite of this, you may trust
me to translate what you say accurately.  I am merely the Lord Toranaga's
instrument in this.\"" CR>)
		      (ELSE
		       <TELL
CTHE ,ALVITO " ruminates on your remark, but doesn't reply." CR>)>)
	       (<VERB? BOW>
		<PERFORM ,V?HELLO ,ALVITO>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL
CTHE ,ALVITO " is a graceful, handsome man, perhaps a few years older
than you.  He wears tabi socks and a flowing kimono that seems, on him,
to belong.  A rosary and a carved golden cross hang at his belt.  He has
an easy elegance, and the aura of strength and natural power of the
Jesuits." CR>)
	       (<AND <VERB? POINT>
		     <FSET? ,ALVITO ,RMUNGBIT>>
		<SETG POINTEE ,ALVITO>
		<TELL
"You point to Alvito." CR>)>>

<ROUTINE ALVITO-SPEAKS ()
	 <COND (<OR <PRSO? PORTUGUESE LATIN SPANISH>
		    <AND <PRSO? ALVITO>
			 <ADJ-USED? ,ALVITO
				    ,W?PORTUGUESE>>>
		<TELL
"\"Very well,\" Alvito replies." CR>)
	       (ELSE
		<TELL
"\"This is not a time for foolishness!\" Alvito answers, and speaks
briefly to Toranaga, who scowls." CR>)>>

<GLOBAL ALVITO-TRANSLATES? <>>

<ROUTINE I-AUDIENCE ()
	 <ZLINES ,AUDIENCE-CNT
		 (<FSET ,OUTER-DOOR ,OPENBIT>
		  <TELL CR
"You and Hiro-matsu stop before the officer of the watch, a mean-tempered,
dangerous young man.  He and Hiro-matsu converse briefly, and then several
of the samurai search you expertly.  Nothing would have escaped them.|
|
The officer opens the thick door himself, and you and Hiro-matsu are
ushered into the audience room." CR CR>
		  <MOVE ,HIRO-MATSU ,AUDIENCE-CHAMBER>
		  <THIS-IS-IT ,ORDERS>
		  <THIS-IS-IT ,HIRO-MATSU>
		  <GOTO ,AUDIENCE-CHAMBER>
		  <TELL CR
"Just beyond the doorway Hiro-matsu kneels, puts his swords on the
floor, and bows his head low, waiting in that abject position.|
|
The officer indicates to you to do the same, but you are disgusted with
the old man's servility." CR>)
		 (DELAY
		  <COND (<B-STANDING?>
			 <COND (<OR <G? ,DELAY-CNT 3>
				    <NOT <PASSIVE-VERB?>>>
				<TELL CR
"Toranaga looks up slowly, gestures imperceptably at Hiro-matsu, and
goes back to his falconry.  Hiro-matsu rises, bows to Toranaga, and
slays you with a single stroke.">
				<JIGS-UP>
				<RFATAL>)
			       (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"In the doorway the officer's hand is on his sword.  Hiro-matsu has
already grasped his, though his head is still bent." CR>
				<RTRUE>)
			       (<EQUAL? ,DELAY-CNT 2>
				<TELL CR
"The tension in the room rises as everyone begins to stare at you.  But as a
true-born Englishman and vassal of the Queen, it's unmanly to degrade yourself
as they do here." CR>
				<RTRUE>)
			       (<EQUAL? ,DELAY-CNT 3>
				<TELL CR
"Hiro-matsu's sword inches out of its scabbard.  He is preparing
himself to cleanse your disrespect to his liege lord.  Will you die rather
than abase yourself?" CR>
				<RTRUE>)>)>)
		 (<TELL CR
"Toranaga looks up slowly.  He watches you briefly, his face impassive, then
looks down and concentrates on his work again.  Tension subsides in the
room." CR>
		  <SCORE-OBJECT ,AUDIENCE-CHAMBER>)
		 (<REMOVE ,FALCON>
		  <TELL CR
"Toranaga gives the falcon to a handler, who bows and leaves.  Then
Toranaga greets Hiro-matsu, and they converse briefly and casually.  At
one point they are clearly talking about you." CR>)
		 (<FCLEAR ,FALCON ,RMUNGBIT>
		  <SETG ALVITO-TRANSLATES? T>
		  <NEW-SDESC ,ALVITO "Father Alvito">
		  <THIS-IS-IT ,ALVITO>
		  <SETG QCONTEXT ,ALVITO>
		  <TELL CR
"Toranaga turns and beckons to the lean-faced Portuguese who is sitting
patiently in his shadow.  The priest comes forward, and kneels close to
the dais.  Toranaga speaks briefly to him, and the man then glances
pleasantly at you.  He speaks to you in Portuguese.  "
G"\"My name is Martin Alvito of the Society of Jesus,
Captain-Pilot.  Lord Toranaga has asked me to interpret for him.  We can speak
Portuguese, Spanish, or, of course, Latin -- whichever
you prefer,\" Alvito offers smoothly." CR>)
		 (<FSET ,ALVITO ,RMUNGBIT>
		  <FSET ,TEKI ,RMUNGBIT> ;"now know the word"
		  <TELL CR
"\"The Japanese word for 'enemy' is '"I"teki"".'  You may use it if you
wish.  If you point at me and use the word, Lord Toranaga will understand
clearly what you mean.  I am your enemy, but not your assassin.  That you
will do yourself.\"" CR>)
		 (DELAY
		  <COND (<FSET? ,ALVITO ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 3>
				<FCLEAR ,ALVITO ,RMUNGBIT>
				<FCLEAR ,ALVITO ,SCOREBIT>
				<TELL
"\"Very well, I will tell him myself.\"  Alvito speaks to Toranaga, who
responds gruffly, scowling at you.  The priest seems very satisfied with
the outcome." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"Alvito waits patiently.">
				<COND (<EQUAL? ,DELAY-CNT 1>
				       <TELL
" You wonder if '"I"teki""' truly means 'enemy.'  Of course it does, you
tell yourself.  This man's not like the other one.">)>
				<CRLF>
				<RTRUE>)>)>)
		 (<TELL CR
"Toranaga begins to interrogate you, Alvito translating smoothly,
calmly.  It's clear that Alvito has told him some of the questions to ask, but
others obviously surprise the Jesuit.  The existence of the Protestant
religion, and the English and Dutch alliance against Spain and Portugal
make Toranaga pause and think: the Catholics are not the only sort of
Christian after all, and a small island country can hold off, perhaps
even beat a great empire through command of the seas!  Before long Alvito
is sweating; this is worse, far worse than he anticipated." CR>)
		 (<SETG QCONTEXT <>>
		  <FSET ,DAIS ,RMUNGBIT>
		  <THIS-IS-IT ,ORDERS>
		  <TELL CR
"Suddenly, there is the sound of loud voices outside the room.  Hiro-matsu
and half the guards are instantly at the doorway and the rest move into
a tight knot screening the dais.|
|
\"You are to come over here, Captain Blackthorne, away from the door,\"
Father Alvito says with carefully contained urgency.  \"If you value your
life, do not move suddenly or say anything!\"" CR>)
		 (DELAY
		  <COND (<FSET? ,DAIS ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 1>
				<FCLEAR ,DAIS ,SCOREBIT>
				<TELL CR
"Toranaga gestures to the guards, who unceremoniously grab you and
hustle you across the room, setting you down with a thump next to
Alvito, who can barely suppress a smile at your treatment." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"\"Captain, it is your death if you do not come here immediately!\"" CR>
				<RTRUE>)>)>)
		 (<MOVE ,ISHIDO ,AUDIENCE-CHAMBER>
		  <MOVE ,GRAYS ,AUDIENCE-CHAMBER>
		  <FCLEAR ,DAIS ,RMUNGBIT>
		  <TELL CR
"The door at the far end shivers open.  Alvito translates what
follows.  \"Lord Ishido wishes to see you,
Sire,\" Naga announces.  \"He's -- he's here in the corridor and he wishes
to see you.  At once, he says.\"|
|
\"Naga-san, tell Lord Ishido he is always welcome.  Ask him to come in.\"|
|
A tall man strides into the room.  Ten of his samurai, gray-uniformed,
follow.|
|
Toranaga says, \"Welcome, Lord Ishido.  Please sit there.\"  He gestures
at the single cushion on the dais.  \"I'd like you to be comfortable.\"|
|
\"Thank you, no,\" responds Ishido.  \"I'd be embarrassed to be comfortable
while you were not.  One day I will take your cushion, but not today.\"" CR>)
		 (<TELL CR
"Ishido looks at you with pronounced distaste.  \"I heard he was ugly but
not this ugly!  Rumor has it that he's a pirate.  Before you crucify him,
please let me have him for half a day.  Perhaps he could be taught to dance
like a bear, and you could exhibit him throughout the Empire: 'The Freak
from the East.'\"|
|
Toranaga smiles.  \"You're a man of vast humor, Lord Ishido.  I agree
the sooner the barbarian's removed the better.  Naga-san, send some men
and put him with the common criminals.\"  Alvito turns to you, and says
\"You are to follow these men.  You are to be detained.  I don't know how
for how long: until Lord Toranaga decides.\"" CR>
		  <MOVE ,ALVITO ,GENERIC-OBJECTS>
		  <REPLACE-SYNONYM ,ALVITO ,W?PRIEST ,W?ALVITO T>
		  <MOVE ,ISHIDO ,GENERIC-OBJECTS>
		  <MOVE ,TORANAGA ,GENERIC-OBJECTS>
		  <REMOVE ,GRAYS>
		  <REMOVE ,TORANAGAS-GUARDS>
		  <DEQUEUE I-AUDIENCE>
		  <NEXT-SCENE>)>>

<END-SEGMENT>

<BEGIN-SEGMENT PRISON>

<OBJECT LG-LINE
	(LOC LOCAL-GLOBALS)
	(SCENE S-PRISON)
	(DESC "line")
	(SYNONYM LINE)
	(FLAGS NDESCBIT VEHBIT SCOREBIT)
	(ACTION LG-LINE-F)>

<ROUTINE LG-LINE-F ()
	 <COND (<HERE? ,PRISON>
		<COND (<P? BOARD LG-LINE>
		       <TELL
"Now that the food has been distributed, the line has vanished.  Everyone
is back in his own little space." CR>)>)
	       (<P? BOARD LG-LINE>
		<COND (<FSET? ,LG-LINE ,SCOREBIT>
		       <TELL
"You join the line of prisoners." CR>
		       <SCORE-OBJECT ,LG-LINE>)
		      (ELSE
		       <TELL "You're in line already." CR>)>)
	       (<P? (DISEMBARK EXIT) LG-LINE>
		<COND (<FSET? ,LG-LINE ,SCOREBIT>
		       <TELL "You aren't in line." CR>)
		      (ELSE
		       <TELL
"You are nudged back into line." CR>)>)>>

<ROOM PRISON
      (LOC ROOMS)
      (SCENE S-PRISON S-MARIKO)
      (SCORE 6)
      (DESC "Cell Block")
      (AFTER PRISON-AFTER-F)
      (SYNONYM PRISON JAIL CELL BLOCK)
      (ADJECTIVE CELL)
      (FDESC
"Toranaga's guards take you to the prison, strip you, and force you
through the door of one of the cell blocks.|
|
At dawn it is feeding time and the guards pass out cups of gruel
and water through a small opening.  The lining up for food and water
is unusually calm -- without discipline no one would eat.  You take
your ration and pick your way over the bodies toward a corner.")
      (LDESC
"This murky and suffocating room is fifty paces long and ten wide and
packed with naked, sweating Japanese.  Scarcely any light filters through
the boards and beams that make up the walls and low ceiling.  A heavy iron
door seals the prisoners in.")
      (OUT TO PRISON-COURTYARD IF IRON-DOOR IS OPEN)
      (EAST TO PRISON-COURTYARD IF IRON-DOOR IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL LG-LINE IRON-DOOR PRISON MADMAN)
      (THINGS <> PRISONER PRISONER-PSEUDO
	      <> PRISONERS PRISONER-PSEUDO)
      (ACTION PRISON-F)>

<ROUTINE PRISONER-PSEUDO ()
	 <TELL "The other prisoners ">
	 <COND (<HERE? ,PRISON>
		<TELL "avoid you." CR>)
	       (ELSE
		<TELL "seem resigned to their fate." CR>)>>

<ROUTINE PRISON-F (RARG "AUX" C)
	 <COND (<RARG? SCENE-SETUP>
		<MOVE ,CUP ,BLACKTHORNE>
		<QUEUE I-PRISON -1>)
	       (<RARG? END>
		<COND (<OR <QUESTION-VERB?>
			   <VERB? TELL-ME-ABOUT ASK-ABOUT TELL-ABOUT>>
		       <COND (<SET C <QUEUED? I-BULLDOG>>
			      <PUT .C ,C-TICK <+ <GET .C ,C-TICK> 1>>)>
		       <COND (<SET C <QUEUED? I-OUT-OF-PRISON>>
			      <PUT .C ,C-TICK <+ <GET .C ,C-TICK> 1>>)>)>)
	       (<RARG? BEG>
		<COND (<AND <VERB? LEAVE>
			    <NOT <FSET? ,THUG ,DEAD>>>
		       <TELL
"You try to get away, but the thug grabs you as you try to squeeze
through the crowd of watchers." CR>) 
		      (<AND <VERB? SPEAK> <IN? ,DOMINGO ,HERE>>
		       <COND (<AND ,PRSI <NOT <PRSI? ,DOMINGO>>>
			      <TELL
CTHE ,PRSI " doesn't seem to understand you, but " THE ,DOMINGO " looks
at you with excitement.  ">)>
		       <DOMINGO-STARES>
		       <COND (<PRSO? ,SPANISH>
			      <DEQUEUE I-PRISON>
			      <COND (<NOT <QUEUED? I-OUT-OF-PRISON>>
				     <QUEUE I-MADMAN 3>
				     <QUEUE I-BULLDOG 5>
				     <QUEUE I-OUT-OF-PRISON 10>)>
			      <TELL
"\"The mother tongue!  Oh, it is so good to hear it again, my son!\"" CR>
			      <SCORE-OBJECT ,DOMINGO>)
			     (<PRSO? ,LATIN>
			      <TELL
"\"You are an educated man, senor!\" he replies with obvious pleasure">
			      <COND (<FSET? ,DOMINGO ,SCOREBIT>
				     <TELL ",
then stops suddenly.  \"The senor is not a Jesuit?  Does the senor speak
Spanish?\"" CR>)
				    (ELSE <TELL "." CR>)>)
			     (<PRSO? ,DUTCH>
			      <TELL
"\"Ah, the senor is from our dominions in Spanish Flanders!">
			      <COND (<FSET? ,DOMINGO ,SCOREBIT>
				     <TELL " But please,
speak Spanish!  I have heard no Spanish since I came to this awful
place!\"">)>
			      <CRLF>)
			     (<PRSO? ,PORTUGUESE ,ENGLISH>
			      <TELL
"\"The senor is ">
			      <COND (<PRSO? ,PORTUGUESE>
				     <TELL "a Portuguese">)
				    (ELSE
				     <TELL "a heretic English">)>
			      <MOVE ,DOMINGO ,GENERIC-OBJECTS>
			      <DEQUEUE I-PRISON>
			      <QUEUE I-OUT-OF-PRISON 2>
			      <TELL "!\"  He begins to rant and rave in a
mixture of Spanish and Latin, growing ever more angry.  The nearby
Japanese shift uneasily.  One of them gets up and shakes the priest
gently, and gradually he comes out of his fit, but from then on he
ignores you, and ultimately his flock leads him away." CR>)>)
		      (<AND <P? BOW <>>
			    <IN? ,BULLDOG ,HERE>>
		       <PERFORM ,V?BOW ,BULLDOG>
		       <RTRUE>)
		      (<VERB? SLEEP>
		       <COND (<NOT <FSET? ,THUG ,DEAD>>
			      <TELL "To sleep now would be fatal!" CR>)
			     (ELSE
			      <TELL
"You try to find a safe place to rest in this hell." CR>)>)>)
	       (<RARG? <>>
		<COND (<P? OPEN PRISON>
		       <PERFORM ,V?OPEN ,IRON-DOOR>
		       <RTRUE>)>)>>

<OBJECT IRON-DOOR
	(SCENE S-PRISON)
	(LOC LOCAL-GLOBALS)
	(DESC "iron door")
	(SYNONYM DOOR)
	(ADJECTIVE IRON)
	(FLAGS LOCKED LOCKABLE OPENABLE DOORBIT)>

<OBJECT CUP
	(SCENE S-PRISON)
	(DESC "cup")
	(OWNER GRUEL)
	(SYNONYM CUP)
	(FLAGS TAKEBIT OPENBIT CONTBIT SEARCHBIT)
	(CAPACITY 10)
	(ACTION CUP-F)>

<ROUTINE CUP-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<TELL
"It contains thin, watery gruel, but it's food, by God!" CR>)
	       (<AND <VERB? EAT DRINK>
		     <IN? ,GRUEL ,CUP>>
		<PERFORM ,PRSA ,GRUEL>
		<RTRUE>)
	       (<VERB? TAKE>
		<COND (<IN? ,CUP ,THUG>
		       <TELL
"The thug jerks his hand away, and kicks you in the knee." CR>)>)
	       (<AND <P? GIVE CUP>
		     <HERE? ,PRISON>>
		<REMOVE ,CUP>
		<COND (<PRSI? ,DOMINGO>
		       <TELL
CTHE ,DOMINGO " takes the gruel and eats it thankfully." CR>)
		      (ELSE
		       <TELL
"Surprised that you don't want the gruel, the other prisoners fight each
other for it." CR>)>)
	       (<VERB? DROP>
		<COND (<AND <NOT <FSET? ,CUP ,TOUCHBIT>>
			    <HERE? ,PRISON>>
		       <TELL "You drop the cup.  ">)>)
	       (<VERB? POUR POUR-FROM>
		<COND (<AND <NOT <FSET? ,CUP ,TOUCHBIT>>
			    <HERE? ,PRISON>>
		       <TELL "You start to tip the cup to pour it.  ">
		       <START-FIGHT>)
		      (ELSE
		       <TELL
"What a waste of good gruel, gruel that cost a man his life!" CR>)>)>>

<OBJECT GRUEL
	(SCENE S-PRISON)
	(LOC CUP)
	(DESC "gruel")
	(SYNONYM GRUEL RATION FOOD)
	(ADJECTIVE GRUEL)
	(FLAGS TAKEBIT FOODBIT)
	(ACTION GRUEL-F)>

<ROUTINE GRUEL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "It's thin, watery stuff." CR>)
	       (<VERB? TAKE DROP GIVE POUR THROW>
		<REDIRECT ,GRUEL ,CUP>
		<RTRUE>)
	       (<VERB? EAT DRINK>
		<COND (<AND <NOT <FSET? ,CUP ,TOUCHBIT>>
			    <HERE? ,PRISON>>
		       <TELL "You bring the cup towards your lips.  ">
		       <START-FIGHT>)
		      (<IN? ,CUP ,THUG>
		       <TELL ,YOU-HAVE-TO "fight for it!" CR>)
		      (ELSE
		       <REMOVE ,GRUEL>
		       <TELL
"It's thin, watery barley and rice, but you wolf it down." CR>)>)>>

<OBJECT THUG
	(LOC PRISON)
	(DESC "apelike man")
	(SYNONYM APE MAN THUG CONVICT PRISONER)
	(ADJECTIVE APELIKE UNSHAVEN FILTHY LICE-RIDDEN FILTHY ;"DEAD")
	(FLAGS AN PERSON JAPANESEBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(HEALTH 3)
	(DESCFCN THUG-DESC)
	(ACTION THUG-F)>

<ROUTINE THUG-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<COND (<FSET? ,THUG ,DEAD>
		       <TELL
"The dead thug lies in the filth of the floor, his head at an unnatural
angle to his body.">)
		      (ELSE
		       <TELL
"An apelike man stares at you with hatred.">)>)>>

<ROUTINE THUG-F ("OPT" (RARG <>)"AUX" TMP)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
"He appears uninterested in talking to you." CR>)
	       (<AND <P? GIVE CUP THUG>
		     <NOT <FSET? ,THUG ,DEAD>>>
		<MOVE ,CUP ,THUG>
		<REMOVE ,GRUEL>
		<TELL
"He grabs it out of your hand and wolfs it down.  His hostility only
seems to have increased, though." CR>)
	       (<VERB? TAKE>
		<COND (<FSET? ,THUG ,DEAD>
		       <TELL
"He's too heavy, especially in light of what you've been through lately." CR>)
		      (ELSE
		       <PERFORM ,V?ATTACK ,THUG>
		       <RTRUE>)>)
	       (<VERB? MOVE>
		<COND (<FSET? ,THUG ,DEAD>
		       <TELL
"You shove his lifeless body." CR>)
		      (ELSE
		       <TELL
"You shove him away from you." CR>)>)
	       (<HOSTILE-VERB?>
		<COND (<VERB? THROW> <MOVE ,PRSO ,HERE>)>
		<COND (<FSET? ,THUG ,DEAD>
		       <COND (<VERB? PISS>
			      <TELL "Adding insult to injury." CR>)
			     (ELSE
			      <TELL "He's already very dead." CR>)>)
		      (ELSE
		       <COND (<NOT <FSET? ,THUG ,RMUNGBIT>>
			      <FSET ,THUG ,RMUNGBIT>
			      <PUTP ,THUG ,P?HEALTH 1000>)>
		       <SET TMP <- <GETP ,THUG ,P?HEALTH> 1>>
		       <PUTP ,THUG ,P?HEALTH .TMP> 
		       <COND (<NOT <ZERO? .TMP>>
			      <COND (<VERB? BITE>
				     <TELL
"You grapple with him, and in desperation bite him on the arm.  He
jerks away, bleeding." CR>)
				    (<VERB? THROW>
				     <TELL
CTHE ,PRSO " hits him and clatters to the ground." CR>)
				    (<VERB? KICK>
				     <TELL
"You kick him savagely, and he staggers back." CR>)
				    (<VERB? MOVE>
				     <TELL
"You grab for him and try to pull him past you and down." CR>)
				    (<VERB? PUSH>
				     <TELL
"You shove him, and he momentarily loses his balance." CR>)
				    (<VERB? HIT>
				     <TELL
"You smash him in the jaw, knocking him backwards." CR>)
				    (ELSE
				     <TELL <PICK-ONE ,YOU-ATTACKS> CR>)>)
			     (ELSE
			      <MOVE ,CUP ,HERE>
			      <FSET ,THUG ,DEAD>
			      <REPLACE-ADJECTIVE ,THUG ,W?FILTHY ,W?DEAD>
			      <SETG OPPONENT <>>
			      <MOVE ,BULLDOG ,HERE>
			      <TELL
"You close with him, intending to ">
			      <PRINTB ,P-PRSA-WORD>
			      <TELL " him, but he grabs you.  You manage
to grab his throat and hammer his head against a beam
until he's senseless.  He falls on some of the other prisoners, who
curse loudly, and one of them, a heavyset bulldog of a man, chops
him viciously on the neck with the side of his hand.  There is a dry
snap and the thug's head sags.  The bulldog man lifts the half-shaven
head and lets it fall.  He smiles at you and shrugs." CR>
			      <SCORE-OBJECT ,THUG>)>)>)>>

<CONSTANT YOU-ATTACKS
	  <LTABLE 0
"You butt your head into the man's face."
"You kick him in the shins and he skips aside."
"You feign momentary helplessness, then kick him viciously.">>

<CONSTANT THUG-ATTACKS
	  <LTABLE 0
"The man leaps at you, trying to knock you down with a vicious
attack."
"The prisoner tries to bite you."
"The thug kicks out, trying to trip you.">>		  

<ROUTINE START-FIGHT ("OPT" (INT? <>) "AUX" (BAD? <>))
	 <COND (<FSET? ,THUG ,RMUNGBIT> <SET BAD? T>)>
	 <PUTP ,BLACKTHORNE ,P?HEALTH 4>
	 <FSET ,THUG ,RMUNGBIT>
	 <FSET ,CUP ,TOUCHBIT>
	 <THIS-IS-IT ,THUG>
	 <SETG OPPONENT ,THUG>
	 <COND (.INT? <CRLF>)>
	 <COND (<OR .BAD? <NOT <LOC ,GRUEL>>>
		<TELL "The">)
	       (ELSE <TELL "Suddenly, the">)>
	 <TELL " apelike man -- unshaven, filthy, lice-ridden -- ">
	 <COND (<B-NOT-STANDING?>
		<B-STAND>
		<TELL "jerks you to your feet, ">)>
	 <TELL "chops you over the kidneys and ">
	 <COND (<IN? ,CUP ,THUG> <TELL "spits out">)
	       (<IN? ,CUP ,BLACKTHORNE> <TELL "takes">)
	       (ELSE <TELL "then picks up">)>
	 <MOVE ,CUP ,THUG>
	 <TELL " your ration.  The others wait to see what will happen." CR>>

<ROUTINE I-PRISON ("AUX" TMP)
	 <ZLINES ,PRISON-CNT
		 (1)
		 (<COND (<NOT <FSET? ,CUP ,TOUCHBIT>>
			 <START-FIGHT T>)>)
		 (DELAY
		  <COND (<FSET? ,THUG ,SCOREBIT>
			 <SET TMP <- <GETP ,BLACKTHORNE ,P?HEALTH> 1>>
			 <PUTP ,BLACKTHORNE ,P?HEALTH .TMP>
			 <COND (<NOT <ZERO? .TMP>>
				<TELL CR
<PICK-ONE ,THUG-ATTACKS> CR CR
"The other prisoners watch impassively." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"With a ferocious overhand blow, the thug smashes you to the floor,
and then jumps on you, breaking your neck.">
				<JIGS-UP>
				<RFATAL>)>)>)
		 (<QUEUE I-BULLDOG-EATS-IT 2>
		  <THIS-IS-IT ,CUP>
		  <THIS-IS-IT ,BULLDOG>
		  <TELL CR
"To your amazement, the bulldog-like man offers you the cup of gruel
that you had presumed lost." CR>)
		 (3)
		 (<B-SIT>
		  <MOVE ,DOMINGO ,HERE>
		  <THIS-IS-IT ,DOMINGO>
		  <SETG QCONTEXT ,DOMINGO>
		  <TELL CR
"Your exhaustion is beginning to take its toll, and you start to fall
into a nightmare.  In what seems like moments, you are jerked to
wakefulness, your ears exploding
with the sonorous Latin of the Last Sacrament: \"In nomine Patris
et Filii et Spiritus Sancti.\"  There is another European, a toothless
old scarecrow of a man, bending over you!" CR>)
		 (DELAY
		  <COND (<FSET? ,DOMINGO ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 5>
				<TELL CR
"He shakes his head, as though trying to wake from a dream.  \"The senor
is a dream.  The devil is sending me dreams, yes!\"  He hobbles away, his
followers grouped closely about him." CR>
				<DEQUEUE I-PRISON>
				<QUEUE I-OUT-OF-PRISON 2>
				<RFATAL>)
			       (ELSE
				<SETG QCONTEXT ,DOMINGO>
				<TELL CR
"\"The senor speaks Spanish, eh?  The senor is not a thrice-damned
heretic, is he?\"  There is an edge of hysteria in the old man's
voice.  His followers
edge closer to him." CR>)>)>)
		 (<DEQUEUE I-PRISON>
		  <RFALSE>)>>

<ROUTINE I-BULLDOG-EATS-IT ("OPT" (NOT-INT? <>))
	 <COND (<AND <IN? ,CUP ,HERE>
		     <IN? ,GRUEL ,CUP>>
		<REMOVE ,CUP>
		<COND (<NOT .NOT-INT?> <CRLF>)>
		<TELL
"The bulldog man, amazed that you don't want the gruel, eats it,
nodding happily in your direction." CR>)>>

<OBJECT BULLDOG
	(DESC "bulldog-like man")
	(SYNONYM MAN PRISONER BULLDOG AKABO GONZALEZ)
	(ADJECTIVE BULLDOG BULLDOG-LIKE)
	(FLAGS PERSON JAPANESEBIT NDESCBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(ACTION BULLDOG-F)>

<ROUTINE BULLDOG-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<COND (<VERB? DOMO>
		       <TELL "He smiles at you." CR>)
		      (ELSE
		       <TELL "He appears well-disposed to you, but doesn't
understand what you say." CR>
		       <END-QUOTE>)>)
	       (<RARG? <>>
		<COND (<P? GIVE CUP>
		       <I-BULLDOG-EATS-IT T>)>)>>

<OBJECT DOMINGO
	(SDESC "old priest" ;"Fr. Domingo")
	(DESC "old priest")
	(SCENE S-PRISON S-MARIKO S-ESCAPE)
	(SYNONYM FATHER PRIEST MAN DOMINGO FRANCISCAN FRIAR EUROPEAN)
	(ADJECTIVE OLD FATHER FRIAR)
	(FLAGS AN PERSON SPANISHBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(ACTION DOMINGO-F)>

<ROUTINE DOMINGO-STARES ()
	 <COND (<NOT <FSET? ,DOMINGO ,TOUCHBIT>>
		<FSET ,DOMINGO ,TOUCHBIT>
		<TELL
"He stares down at you with rheumy eyes.  \"Oh blessed Virgin!  The senor
is real!\"  His words become a jumble of Japanese and Latin and
Spanish.  His head twitches.  \"The senor is real?\" he asks again.  ">)>>

<ROUTINE DOMINGO-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<DOMINGO-STARES>
		<COND (<AND <EQUAL? ,QCONTEXT ,DOMINGO>
			    <FSET? ,DOMINGO ,SCOREBIT>
			    <VERB? YES NO>>
		       <COND (<VERB? YES>
			      <SETG DELAY-CNT 5>
			      <TELL
"\"The devil is testing me!  He sends me a fellow Christian, and then he
transforms him into a heretic!\"" CR>)
			     (ELSE
			      <TELL
"\"Then show me you are of our Empire!  The senor is a German, perhaps?
Speak Spanish and prove to me you are a subject of the King!\"" CR>)>)
		      (<VERB? YES NO>
		       <TELL
"He seems oblivious to your answer, listening only to what language
you are speaking." CR>)
		      (<AND <P? BE (ME BLACKTHORNE)> ,PRSI>
		       <COND (<ENGLISH?>
			      <PERFORM ,V?SPEAK ,ENGLISH>
			      <RTRUE>)
			     (<DUTCH?>
			      <PERFORM ,V?SPEAK ,DUTCH>
			      <RTRUE>)
			     (<SPANISH?>
			      <TELL
"\"I can tell you aren't Spanish, senor.\"" CR>)
			     (<PORTUGUESE?>
			      <PERFORM ,V?SPEAK ,PORTUGUESE>
			      <RTRUE>)
			     (ELSE
			      <TELL
"He doesn't seem too excited to hear this." CR>)>)
		      (<FSET? ,DOMINGO ,SCOREBIT>
		       <TELL
"He seems to ignore what you say, only listening to the sound of the language
itself." CR>)
		      (<OR <P? WHO (YOU DOMINGO)>
			   <VERB? HELLO>>
		       <FCLEAR ,DOMINGO ,AN>
		       <NEW-SDESC ,DOMINGO "Friar Domingo">
		       <TELL
"\"I'm Friar...  Friar Domingo...  Domingo of the Sacred Order of St.
Francis.  I came here to teach the heathen, to bring them to the light,
but Jesuits put me here, Jesuits poured filth into the ears of the
Taiko!\"" CR>)
		      (<P? HELP (ME BLACKTHORNE)>
		       <TELL
"\"Only God can help us, senor.\"" CR>)
		      (<P? FIND ;WHERE (ME BLACKTHORNE)>
		       <TELL
"\"This is the prison, senor.  All here await their fate.\"" CR>)
		      (<OR <P? TEACH (ME BLACKTHORNE) (<> JAPANESE)>
			   <AND <JAPANESE-VERB?>
				<G? <GETP ,JAPANESE ,P?COUNT> 0>>>
		       <QUEUE I-TEACH 2>
		       <I-TEACH T>
		       <RTRUE>)
		      (<AND <QUESTION-VERB?>
			    <NOT <FSET? ,JAPAN ,RMUNGBIT>>>
		       <DOMINGO-OFFERS-HELP>)
		      (<VERB? TELL-ME-ABOUT WHO WHAT>
		       <COND (<PRSO? ,MADMAN ,CRAZY>
			      <TELL
"\"Everyone here believes that madness is caused only by "I"kami"", who
are evil, malicious spirits.  Thus, madmen, like children and the very
old, are not responsible for their actions and have special privileges.\"">)
			     (<PRSO? ,SUICIDE>
			      <TELL
"\"A sin against God, senor!  They are so touchy, so pride-filled, that
if they are thwarted, or if they cannot do their duty, they will kill
themselves.  They'll do it if their liege orders it, in a wink.  A heinous
sin!\"">)
			     (<PRSO? ,PRISON>
			      <TELL
"\"The Japanese didn't have prisons until recently.  Only the guilty
come here.  For just a little while.\"">)
			     (<PRSO? ,GLOBAL-SAMURAI>
			      <TELL
"\"Samurai means 'servant,' but they are fierce warriors who serve their
heathen masters.  Men and women, too, are samurai.  They own everything,
they are everything, but some have seen the
light!\"">)
			     (<PRSO? ,JESUITS>
			      <TELL
"\"Their lies put me here and caused twenty-six Holy Fathers to be
martyred!  Does the senor know that Jesuits are merely traders, gun runners,
and usurers?  That they control all the silk trade here, all trade with
China?  That the annual Black Ship is worth a million in gold?  That they've
forced His Holiness, the Pope, to grant them total power over Asia --
them and their dogs, the Portuguese?  That all other religions are forbidden
here?  That they secretly smuggled guns into Japan for Christian kings here,
inciting them to rebellion?\"">)
			     (<PRSO? ,CHURCH ,GOD>
			      <TELL
"\"My son, you must want to make your confession.  I will be glad to help
you.\"">)
			     (<PRSO? ,SATAN>
			      <TELL
"\"He tests me constantly!  I fight, but it's so difficult!\"">)
			     (<PRSO? ,ALVITO>
			      <TELL
"\"That Jesuit puppy!  He had the temerity to try to 'intercede' with the
Taiko when that imp of Satan threatened to ban us from Japan!  As though
our own priests weren't good enough to speak with that monster!\"">)
			     (<PRSO? ,BLACK-SHIP>
			      <TELL
"\"They're the greatest ships in the world, almost two thousand tons.  I'm
told they sail well before the wind but lumber when the wind's abeam.  They
carry twenty or thirty guns.  They are the greatest treasure ships
in all Asia, carrying the silks of China here to Japan!  The silver alone
is a fortune beyond calculation!\"">)
			     (<PRSO? ,DOMINGO ,YOU>
			      <PERFORM ,V?WHO ,DOMINGO>
			      <RTRUE>)
			     (<PRSO? ,JAPAN>
			      <TELL
"\"The land was discovered in 1542, senor, the year I was born.  There
were three men, da Mota, Peixoto, and one other.  They were all
Portuguese traders, they were blown off course to land in Kyushu.  Soon
after, the Church sent missionaries to convert the heathen.\"">)
			     (<PRSO? ,GORODA>
			      <TELL
"\"He was a devil!  He conquered all Japan and made a mountain of skulls
and declared himself Dictator, but still wasn't powerful enough to be
Shogun!  Then he was assassinated by one of his generals.  Now he burns
in Hell!\"">)
			     (<PRSO? ,TAIKO>
			      <TELL
"\"He was an ugly little man.  The Jesuits filled his ears with lies.  He
was Goroda's general, born a peasant, so he could never be Shogun, even
though he brought the whole of Japan under his devil's rule!  He turned
against us, and the Hand of God lay heavy on him: a storm smashed his
great castle.  It was marvelous to behold!  Now he is
dead and the carrion crows, Toranaga, Ishido and the rest, fight over
the carcass -- and the filthy Jesuits aren't the least of these!\"">)
			     (<PRSO? ,KIYAMA>
			      <TELL
"\"Lord Kiyama is a good Christian, but under the thumb of the Jesuits!\"">)
			     (<PRSO? ,SHOGUN>
			      <TELL
"\"The Shogun is the Supreme Ruler.  Save for the Emperor himself, he is
all powerful.  There has been no Shogun for hundreds of years, even the
Taiko never became Shogun, but Toranaga!  Ah, he would be Shogun if he
could!\"">)
			     (<PRSO? ,TORANAGA>
			      <TELL
"\"He's a sly one.  Vicious and sly as a snake, subtle as a fox!\"">)
			     (<PRSO? ,ISHIDO>
			      <TELL
"\"He hates the Church, but he hates us all, Jesuit and Franciscan
alike!  An evil man.\"">)
			     (<PRSO? ,SPAIN>
			      <TELL
"\"Ah, Spain!  My village is outside Madrid, senor, in the mountains.  It
is called Santa Veronica.\"">)
			     (<PRSO? ,BULLDOG>
			      <TELL "\"">
			      <COND (<NOT <NOUN-USED? ,PRSO ,W?GONZALEZ>>
				     <TELL
"His name is Gonzalez, senor.  ">)>
			      <TELL "He is one of us.\"">)
			     (<FSET? ,PRSO ,PERSON>
			      <TELL
"\"I know nothing of " HIM/HER ,PRSO ", senor.\"">)
			     (<FSET? ,JAPAN ,RMUNGBIT>
			      <TELL
CTHE ,DOMINGO " seems to have lost the thread of your question.  "
<PICK-ONE ,DOMINGO-RAMBLES> CR>
			      <RTRUE>)>
		       <COND (<NOT <FSET? ,JAPAN ,RMUNGBIT>>
			      <TELL "">
			      <DOMINGO-OFFERS-HELP>)
			     (ELSE <CRLF>)>)
		      (<PROB 60>
		       <TELL
CTHE ,DOMINGO " doesn't seem to be listening.  He mutters something irrelevant.  " <PICK-ONE ,DOMINGO-RAMBLES>
CR>)
		      (ELSE
		       <TELL
"His mind seems to have wandered.  In any case, he doesn't respond." CR>)>)
	       (<AND <NOT <SCENE? S-PRISON>>
		     <NOT <ABSTRACT-VERB?>>>
		<TELL
"Father Domingo isn't here." CR>
		<COND (<VERB? TELL> <END-QUOTE> <RFATAL>)
		      (ELSE <RTRUE>)>)
	       (<VERB? LIE>
		<TELL
"Volunteer nothing, but don't lie." CR>)
	       (<VERB? EXAMINE>
		<TELL
"He is a toothless old man with long filthy hair and a matted beard and
broken nails.  He wears a foul, threadbare smock.  In one hand he carries
a wooden cross." CR>)
	       (<HOSTILE-VERB?>
		<TELL
"You can't bring yourself to hurt this saintly, if slightly addled,
man.  He may be a hated Spaniard, but he has made a place for himself
in this hell." CR>)>>

<ROUTINE DOMINGO-OFFERS-HELP ()
	 <FSET ,JAPAN ,RMUNGBIT>
	 <TELL
"He is very excited.  \"If the senor has never been to Asia before, he will
be like a child in the wilderness.  I will teach you!  I will tell you
all the secrets you will need to survive!\"" CR>>

<CONSTANT DOMINGO-RAMBLES
	  <LTABLE 0
"\"The Japanese truly have but one punishment -- death.  They have almost
no other punishment.  Imprisonment is not one of their punishments, my
son.  To them, prison is just a temporary place to keep the man until they
decide his sentence.  Only the guilty come here.\""
"\"Jesuits put me here, my son.  Jesuits and their filthy lies.\""
"\"Thy ship was Spanish out of where?  I'm so glad!  The senor is from
Spanish Flanders?  Or the Duchy of Brandenburg?  Some part of our
Dominions in Germania?\""
"\"Oh, it's so good to talk the blessed mother tongue again.\""
"\"These men are my flock, senor.  They are all my sons in the Blessed
Lord Jesus.  I've converted so many here!\""
"\"I was put here in September -- it was in the year of our Lord
fifteen hundred ninety eight.\"  You realize with a shock that this was
almost two years ago!  Two years in this filthy hole!">>

<ROUTINE I-TEACH ("OPT" (P? <>) "AUX" CNT)
	 <COND (<IN? ,DOMINGO ,HERE>
		<QUEUE I-TEACH -1 T>
		<COND (<OR .P? <NOT <P? TEACH ME JAPANESE>>>
		       <PUTP ,JAPANESE ,P?COUNT
			     <SET CNT <+ <GETP ,JAPANESE ,P?COUNT> 1>>>
		       <COND (<NOT .P?> <CRLF>)>
		       <TELL "\"">
		       <COND (<JAPANESE-VERB?>
			      <TELL
"Very good, my son!  ">)>
		       <COND (<EQUAL? .CNT 1>
			      <TELL
"Ah, Japanese!  It's a devil's own language for us, but they find our
languages as hard, or worse!  The first thing you must know is to be polite,
always polite, even when you're spitting in their eyes.  '"I"Domo"",' that's
the first word to know.  It means 'thank you,' sometimes you say '"I"arigato""'
as well, '"I"domo arigato"".'\"" CR>
			      <SCORE-OBJECT ,JAPANESE>)
			     (<EQUAL? .CNT 2>
			      <TELL
"To greet someone politely, you say '"I"Konnichi wa.""'  It means 'How
are you?'  To say you are well, you say '"I"Domo, genki desu"".'\"" CR>)
			     (<EQUAL? .CNT 3>
			      <COND (<IN? ,BULLDOG ,HERE>
				     <TELL
"That man over there, he tells me he">)
				    (ELSE
				     <TELL "That man who">)>
			      <TELL " helped you.  His name is Gonzalez,
but before he became a Christian he was Akabo.  It just means 'porter,'
senor.  They don't have names.  Only samurai have names.\"" CR>)
			     (<EQUAL? .CNT 4>
			      <REPLACE-SYNONYM ,GLOBAL-WATER ,W?WATER ,W?MIZU>
			      <TELL
"As '"I"domo""' is 'thank you,' '"I"dozo""' is 'please.' 'Water' is '"I"mizu"".'\"" CR>)
			     (<EQUAL? .CNT 5>
			      <TELL
"'"I"Gomen nasai""' is 'sorry,' remember the Japanese put a great price on
manners and courtesy!\"" CR>)
			     (<EQUAL? .CNT 6>
			      <TELL
"'"I"Nihon go ga hanase-masen""' is 'I don't speak Japanese,' and yes, you
must apologize, so you say '"I"gomen nasai""' as well.  The daimyos are
prideful and as touchy as wasps, but courteous, ah, so courteous!\"" CR>)
			     (ELSE
			      <DEQUEUE I-TEACH>
			      <TELL
"It is so good to teach, senor!\"  Domingo continues to teach you simple
words and phrases.  The old man is
lonely, and proud of his knowledge, and his success in converting the
prisoners." CR>)>)>)
	       (ELSE
		<DEQUEUE I-TEACH>
		<RFALSE>)>>

<OBJECT MADMAN
	(DESC "madman")
	(SYNONYM MADMAN MAN)
	(ADJECTIVE CRAZY MAD INSANE POSSESSED)
	(FLAGS PERSON JAPANESEBIT)
	(GENERIC GENERIC-CRAZY-F)
	(ACTION MADMAN-F)>

<ROUTINE GENERIC-CRAZY-F (R F)
	 <COND (<SCENE? ,S-PRISON> ,MADMAN)
	       (ELSE ,CRAZY)>>

<ROUTINE MADMAN-F ("OPT" RARG)
	 <COND (<RARG? WINNER>
		<TELL
"He laughs insanely, pointing his finger and making faces." CR>
		<END-QUOTE>)
	       (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"He's wild-eyed and drooling.  You shudder.  Is this your fate?  Will
you ever be released?" CR>)
		      (<HOSTILE-VERB?>
		       <TELL
"The other prisoners stop you, indicating that he is not to be hurt." CR>)>)>>

<ROUTINE I-MADMAN ()
	 <COND (<IN? ,MADMAN ,HERE>
		<MOVE ,MADMAN ,GENERIC-OBJECTS>
		<TELL CR
"The madman capers away, singing and drooling.  You lose sight of him in
the crowd of prisoners." CR>)
	       (ELSE
		<MOVE ,MADMAN ,HERE>
		<QUEUE I-MADMAN 3>
		<TELL CR
"Suddenly the crowd of prisoners parts and a naked, filthy prisoner
comes into view.  He is singing something noisy and incomprehensible.  He
starts to dance a wild capering dance.  The man is obviously crazy,
but no one hurts him or kicks him aside, even when he accidentally knocks
over a cup of food.  Father Domingo makes the sign of the cross and
shakes his head." CR>)>>

<ROUTINE I-BULLDOG ()
	 <REMOVE ,BULLDOG>
	 <TELL CR
"The iron door of the cell swings open.  Guards begin to call names from
a list.  The man who befriended you is one of those called.  One of
Domingo's followers is also among those called.  He kneels before Domingo,
who gives him the sign of the cross and the Last Sacrament.  He walks
away, and the door closes again.|
|
\"His Calvary is outside the door,\" says Domingo." CR>>

<ROUTINE I-OUT-OF-PRISON ()
	 <COND (<NOT <QUEUED? I-TEACH>>
		<TIME-PASSES>
		<TELL CR
"For three days and three nights, you ">
		<COND (<AND <IN? ,DOMINGO ,HERE>
			    <NOT <ZERO? <GETP ,JAPANESE ,P?COUNT>>>>
		       <TELL "fill your mind with facts and
Japanese words and phrases.  For three days and three nights you sit
with Father Domingo and question and listen and learn and sleep in
nightmare.">)
		      (ELSE
		       <TELL "endure the hell of the prison.">)>
		<TELL "|
|
Then, on the fourth day, they call out your name.|
|
\"Anjin-san!\"">
		<COND (<IN? ,DOMINGO ,HERE>
		       <TELL "|
|
\"Thy confession, my son, say it quickly,\" cries Father Domingo.|
|
\"Go with God, Father\" you reply, and the door slams behind you.">)>
		<CRLF><CRLF>
		<GOTO ,PRISON-COURTYARD>)
	       (ELSE
		<QUEUE I-OUT-OF-PRISON 1>
		<RFALSE>)>>

<ROOM PRISON-COURTYARD
      (LOC ROOMS)
      (DESC "Prison Courtyard")
      (IN TO PRISON IF IRON-DOOR IS OPEN)
      (WEST TO PRISON IF IRON-DOOR IS OPEN)
      (EAST TO OUTSIDE-PRISON IF PRISON-GATE IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL LG-LINE LG-MEN PRISON-GATE)
      (THINGS <> PRISONER PRISONER-PSEUDO
	      <> PRISONERS PRISONER-PSEUDO)
      (ACTION PRISON-COURTYARD-F)>

<ROUTINE PRISON-COURTYARD-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is a courtyard with great doors to the east.  A line of naked
prisoners stands before an official in a somber kimono." CR>)
	       (<RARG? BEG>
		<COND (<AND <P? WALK P?EAST>
			    <NOT <FSET? ,LG-LINE ,RMUNGBIT>>>
		       <TELL "The jailers ">
		       <COND (<FSET? ,LG-LINE ,SCOREBIT>
			      <TELL
"and your escort prevent you from leaving." CR>)
			     (ELSE
			      <TELL
"roughly prod you back into line." CR>)>)>)
	       (<RARG? ENTER>
		<QUEUE I-LEAVE-PRISON -1>
		<MOVE ,DOMINGO ,GENERIC-OBJECTS>
		<MOVE ,GRAYS ,HERE>
		<THIS-IS-IT ,GRAYS>
		<TELL
"The air is incredibly cool and sweet, the clouds meandering before a fine
southeasterly wind.  You gulp deep draughts of the clean, glorious air.  The
joy of life fills you." CR CR>)>>

<OBJECT OFFICIAL
	(LOC PRISON-COURTYARD)
	(DESC "official")
	(SYNONYM OFFICIAL)
	(ADJECTIVE SOMBER)
	(FLAGS NDESCBIT PERSON JAPANESEBIT)
	(ACTION OFFICIAL-F)>

<ROUTINE OFFICIAL-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"The official is dressed in a somber kimono and an overmantle with starched,
winglike shoulders." CR>)>)>>

<ROUTINE I-LEAVE-PRISON ()
	 <ZLINES ,LEAVE-CNT
		 (DELAY
		  <COND (<FSET? ,LG-LINE ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 3>
				<FCLEAR ,LG-LINE ,SCOREBIT>
				<TELL CR
"A jailer shoves you to the ground, then kicks you into line
with a stream of invective." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"One of the jailers prods you roughly toward the line." CR>
			 <RTRUE>)>)>)
		 (<TELL CR
"The official stands in front of the first prisoner and reads from a
delicate scroll.  As he finishes, each man begins to plod after his
party of jailers toward the great doors of the courtyard." CR>)
		 (<MOVE ,KIMONO ,BLACKTHORNE>
		  <MOVE ,SOCKS ,BLACKTHORNE>
		  <MOVE ,SANDALS ,BLACKTHORNE>
		  <FSET ,LG-LINE ,RMUNGBIT>
		  <FSET ,PRISON-GATE ,OPENBIT>
		  <THIS-IS-IT ,CLOTHES>
		  <TELL CR
"You reach the front of the line.  Unlike the others, you are given
clean clothes to wear.  Your
guards are samurai, and they motion you to put on the clothes." CR>)
		 (DELAY
		  <COND (<HERE? PRISON-COURTYARD>
			 <TELL CR
"Your guards hustle you towards the gate." CR>
			 <COND (<G? ,DELAY-CNT 1>
				<CRLF>
				<GOTO ,OUTSIDE-PRISON>)>
			 <RTRUE>)>)
		 (1)
		 (<TELL CR
"One man is already roped to his cross and the cross is being lifted
into the sky.  Beside each cross two "I"eta"" wait, their long lances
sparkling in the sun.|
|
The samurai jostle closer, hurrying you.  You prepare to lunge for
the nearest sword, thinking numbly that it would be better to die now,
quickly.  But suddenly they are turning away from the arena, heading
toward the paths that lead through the woods to the city and the
castle!" CR CR>
		  <MOVE ,GRAYS ,DEEP-WOODS>
		  <GOTO ,DEEP-WOODS>)
		 (<TELL CR
"When you are deep in the woods, another party of thirty-odd Grays
approaches from around a curve ahead.  The two parties of Grays greet
each other, and then, just as the new group is preparing to leave, their
leader calmly pulls out his sword and impales the leader of your
samurai.  The ambush is so sudden that all your escort is dead almost
in the same instant.  Not one has even had time to draw his sword." CR>
		  <REMOVE ,GRAYS>
		  <MOVE ,BANDITS ,HERE>
		  <MOVE ,BANDIT-LEADER ,HERE>
		  <TELL CR
"At a command from the leader, these new Grays strip off their uniform
kimonos.  Underneath they wear a motley collection of rags and ancient
kimonos.  All pull on masks.  The bandit leader smiles and motions you
to begin walking back toward the city." CR>)
		 (<MOVE ,BROWNS ,HERE>
		  <MOVE ,GRAYS ,HERE>
		  <MOVE ,GRAY-CAPTAIN ,HERE>
		  <MOVE ,YABU ,YABU-PALANQUIN>
		  <MOVE ,YABU-PALANQUIN ,HERE>
		  <TELL CR
"Suddenly there are noises ahead and another party of samurai rounds
the bend.  Browns and Grays, the Browns the vanguard, their leader in
a palanquin.  Both groups move into skirmish positions, eyeing each
other hostilely." CR>
		  <MOVE ,YABU ,HERE>
		  <SETG DODGED? <>>
		  <SETG OPPONENT ,BANDIT-LEADER>
		  <TELL CR
"The man in the palanquin gets down and you recognize him.  It is Kasigi
Yabu!  He shouts at the bandit leader but the man shakes his sword furiously,
ordering them out of the way.  Yabu gives a curt order, and charges with
a screaming battle cry, limping slightly.  The bandit guarding you
swings his sword at you!" CR>)
		 (<REMOVE ,BANDITS>
		  <REMOVE ,BANDIT-LEADER>
		  <SETG OPPONENT <>>
		  <COND (<NOT ,DODGED?>
			 <TELL CR
"The bandit leader's sword plunges into you.  As a red mist comes
over your sight, Yabu, enraged, tries to avenge you, but his leg
slows him." CR>)>
		  <TELL CR
"The bandit leader turns and flees, his men following.  The Browns and
Grays are quickly beside you.  Some scramble after the fleeing bandits
into the bushes.  Yabu stops at the edge of the brush, shouts orders
imperiously, then comes back slowly, his limp more pronounced." CR>
		  <COND (<NOT ,DODGED?> <JIGS-UP>)>)
		 (<FSET ,YABU-PALANQUIN ,SCOREBIT>
		  <TELL CR
"None of the bandits are captured.  Yabu and the Gray leader begin to
argue, Yabu pointing to the castle, and the Gray to the woods.  You
hear the word "I"shunjin"", which you know to mean 'prisoner.'  They
are trying to decide what to do with you!  To return you to Toranaga
at the castle, or send you on with the Grays to Ishido.|
|
Yabu motions you to get into the palanquin.  The Gray captain says,
\""I"Iye!""\"" CR>)
		 (DELAY
		  <COND (<NOT <IN? ,BLACKTHORNE ,YABU-PALANQUIN>>
			 <TELL CR
"Yabu points to the palanquin.  The Gray captain violently disagrees,
saying, \""I"Iye!""\"" CR>
			 <RTRUE>)>)
		 (<DEQUEUE I-LEAVE-PRISON>
		  <RFALSE>)>>

<OBJECT BANDIT-LEADER
	(DESC "bandit leader")
	(SYNONYM BANDIT LEADER RONIN)
	(ADJECTIVE BANDIT)
	(FLAGS PERSON JAPANESEBIT)
	(GENERIC GENERIC-BANDIT-F)
	(ACTION BANDIT-LEADER-F)>

<ROUTINE GENERIC-BANDIT-F (R F)
	 <COND (<EQUAL? ,BANDIT-LEADER ,OPPONENT> ,BANDIT-LEADER)
	       (ELSE ,BANDITS)>>

<ROUTINE BANDIT-LEADER-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL G"He doesn't respond." CR>)
	       (<RARG? <>>
		<COND (<VERB? FOLLOW>
		       <TELL
"You bow in agreement and prepare to follow the bandits." CR>)>)>>

<OBJECT BANDITS
	(DESC "bandits")
	(SYNONYM BANDITS RONIN BANDIT ATTACKER ATTACKERS)
	(FLAGS PERSON JAPANESEBIT PLURAL SCOREBIT)
	(GENERIC GENERIC-BANDIT-F)
	(ACTION BANDITS-F)>

<ROUTINE BANDITS-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL "They don't respond." CR>)>>

<OBJECT YABU-PALANQUIN
	(OWNER YABU)
	(DESC "palanquin")
	(SYNONYM PALANQUIN LITTER)
	(FLAGS VEHBIT OPENBIT CONTBIT SEARCHBIT)
	(CAPACITY 100)
	(GENERIC GENERIC-LITTER-F)
	(ACTION YABU-PALANQUIN-F)>

<ROUTINE YABU-PALANQUIN-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<VERB? SIT>
		       <TELL G"You are already sitting down." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? BOARD>
		       <COND (<FIRST? ,PRSO>
			      <TELL
"There's someone using it already." CR>)
			     (<FSET? ,YABU-PALANQUIN ,SCOREBIT>
			      <TELL
"You speak in halting Japanese, knowing the words to be ungrammatical,
but hoping they will be understood, \"I friend.  Not prisoner.  Want
bath.  Tired.  Hungry.  Bath.\"  You point to the castle.  \"Go
there!  Now, please.  Lord Toranaga.  Go now.\"  You get awkwardly into the
palanquin and lay down on the cushions, your feet sticking far out.|
|
Then Yabu laughs, and everyone joins in.  He bows mockingly.  \"Ah so,
Anjin-sama!\"|
|
\"Iye, Yabu-sama.  Anjin-san.\"" CR>
			      <SCORE-OBJECT ,YABU-PALANQUIN>
			      <NEXT-SCENE>)
			     (ELSE
			      <TELL "No one will let you in it." CR>)>)>)>>

<ROOM DEEP-WOODS
      (LOC ROOMS)
      (DESC "Deep in the Woods")
      (FLAGS ONBIT)
      (WEST TO OUTSIDE-PRISON)
      (EAST PER DEEP-WOODS-EXIT)
      (GLOBAL LG-CASTLE CITY)
      (ACTION DEEP-WOODS-F)>

<ROUTINE DEEP-WOODS-EXIT ("OPT" (RARG <>) (STRICT? <>))
	 <COND (.RARG <RFALSE>)
	       (ELSE
		<COND (<IN? ,BANDITS ,HERE>
		       <TELL "The bandits"G" have you surrounded." CR>)
		      (<IN? ,YABU ,HERE>
		       <TELL "Yabu stops you and points toward the city." CR>)
		      (<IN? ,BROWNS ,HERE>
		       <TELL "The Grays"G" have you surrounded." CR>)
		      (ELSE
		       <TELL "The escort won't let you get ahead of the party." CR>)>
		<RFALSE>)>>

<ROUTINE DEEP-WOODS-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is a wide track deep in the woods.  There are tall trees and
a well-tended sward which feels soft underfoot.  The castle is to the
west and the path continues to the east." CR>)
	       (<RARG? BEG>
		<COND (<VERB? SIT>
		       <TELL
"You are rudely jerked to your feet." CR>)
		      (<OR <P? WALK P?WEST>
			   <P? WALK-TO (LG-CASTLE CITY)>>
		       <COND (<IN? ,BANDITS ,HERE>
			      <TELL
"You start back toward the city, walking as slowly as possible." CR>)
			     (ELSE
			      <TELL
G"No one will let you leave the party." CR>)>)
		      (<AND <EQUAL? ,OPPONENT ,BANDIT-LEADER>
			    <NOT ,DODGED?>
			    <MOTION-VERB?>>
		       <SETG DODGED? T>
		       <TELL
"With all your remaining strength you jerk away from the bandit and
roll to one side.  His sword slashes down, but he misses." CR>
		       <SCORE-OBJECT ,BANDITS>)
		      (<AND <FSET? ,YABU-PALANQUIN ,SCOREBIT>
			    <P? POINT LG-CASTLE>>
		       <PERFORM ,V?BOARD ,YABU-PALANQUIN>
		       <RTRUE>)>)>>

<OBJECT LG-CASTLE
	(LOC LOCAL-GLOBALS)
	(DESC "Osaka castle")
	(SYNONYM CASTLE)
	(ADJECTIVE OSAKA)>

<OBJECT PRISON-GATE
	(LOC LOCAL-GLOBALS)
	(DESC "prison gate")
	(SYNONYM GATE)
	(ADJECTIVE PRISON)
	(FLAGS DOORBIT TRYTAKEBIT)
	(ACTION PRISON-GATE-F)>

<ROUTINE PRISON-GATE-F ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL
"The jailers would not appreciate your usurping their job." CR>)>>

<ROUTINE CROWD-PSEUDO ()
	 <TELL "The crowd ignores you." CR>>

<ROOM OUTSIDE-PRISON
      (LOC ROOMS)
      (DESC "Outside Prison")
      (WEST TO PRISON-COURTYARD IF PRISON-GATE IS OPEN)
      (FLAGS ONBIT OUTSIDE)
      (THINGS LARGE CROWD CROWD-PSEUDO
	      SPRUCE CROWD CROWD-PSEUDO
	      <> PRISONER PRISONER-PSEUDO
	      <> PRISONERS PRISONER-PSEUDO)
      (ACTION OUTSIDE-PRISON-F)>

<ROUTINE OUTSIDE-PRISON-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"Prisoners are being executed here.  A large, spruce crowd looks on,
crimson and yellow with golden sunshades." CR>)
	       (<RARG? BEG>
		<COND (<P? WALK P?WEST>
		       <TELL
"Your escort refuses to let you return to the prison." CR>)>)
	       (<RARG? ENTER>
		<MOVE ,GRAYS ,HERE>
		<TELL "Your guards keep pace and a wary eye on you." CR CR>)>>

<ROUTINE PRISON-AFTER-F ()
	 <TELL
"A bath and massage and two hours of sleep immeasurably refresh you.  The
bath attendants, all women of girth and strength, pummel you and
shampoo your hair, and the barber trims your beard.  The futons on which
you sleep are so clean, like the room.  It all seems dreamlike.  You wait
impatiently, hoping to be brought to Toranaga again.|
|
You know, beyond
all doubt, because of what Friar Domingo told you about the Portuguese
and Japanese politics and trade, that you can help Toranaga, who, in
return, can easily give you the riches and freedom you desire.  There is
no ship in all Asia like yours, and if Toranaga commands, you can sweep
the Portuguese and Spanish from the seas with it, make a gift to him of
the Black Ship, destroy his enemies, anything!" CR>>

<END-SEGMENT>

"S-MARIKO"

<BEGIN-SEGMENT MARIKO>

<ROOM MAPLE-GLADE
      (LOC ROOMS)
      (OWNER MAPLE-GLADE)
      (SCENE S-MARIKO)
      (AFTER ALVITO-AFTER-F)
      (SCORE 3)
      (DESC "Glade of Maples")
      (FDESC "And at last, Toranaga summons you.")
      (SYNONYM GLADE MAPLES)
      (FLAGS ONBIT OUTSIDE SCOREBIT)
      (GLOBAL DOMINGO PRISON LG-CREWMEN TEA-HOUSE)
      (ACTION MAPLE-GLADE-F)>

<ROUTINE MAPLE-GLADE-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<REPLACE-SYNONYM ,RUTTER ,W?MAP ,W?RUTTER T>
		<REPLACE-SYNONYM ,SECRET-RUTTER ,W?MAP ,W?RUTTER T>
		<NEW-SDESC ,MARIKO "woman" T>
		<REPLACE-SYNONYM ,MARIKO ,W?MARIKO ,W?WOMAN T>
		<REPLACE-SYNONYM ,MARIKO ,W?TODA ,W?WOMAN T>
		<REPLACE-ADJECTIVE ,MARIKO ,W?TODA ,W?LADY T>
		<THIS-IS-IT ,MARIKO>
		<FCLEAR ,MARIKO ,THE>
		<NEW-SDESC ,YAEMON "young boy" T>
		<FCLEAR ,YAEMON ,THE>
		<FCLEAR ,YAEMON ,NOABIT>
		<FCLEAR ,YAEMON ,NOTHEBIT>
		<SETG QCONTEXT ,TORANAGA> ;"so 'konnichi wa' will work"
		<THIS-IS-IT ,TORANAGA>
		<MOVE ,YAEMON ,HERE>
		<MOVE ,MARIKO ,HERE>
		<MOVE ,TORANAGA ,HERE>
		<QUEUE I-YAEMON -1>)
	       (<RARG? LOOK>
		<TELL
"This is Toranaga's private garden within Osaka Castle.  You are in
a glade of maples near a little thatched hut." CR>)
	       (<RARG? BEG>
		<COND (<P? (ENTER THROUGH) TEA-HOUSE>
		       <TELL "That would be very impolite." CR>)
		      (<P? EXAMINE MARIKO>
		       <PRE-EXAMINE>
		       <TELL
G"You have never seen anyone so petite.  You could pick her up with one hand"
".  You wonder if she is Toranaga's consort.  What would it be like to have
such a woman in bed?  You'd be afraid of crushing her.  No, she wouldn't
break.  There are women in England almost as small.  But not like her." CR>)
		      (<AND <FSET? ,YAEMON ,SCOREBIT>
			    <OR <P? ,V?WINK <>>
				<P? MAKE HEAD>
				<ACT-CRAZY?>>>
		       <PERFORM ,V?SMILE ,YAEMON>
		       <RTRUE>)
		      (<AND <P? (KONNICHI-WA BOW)
				(MARIKO TORANAGA YAEMON <>)>
			    <FSET? ,MAPLE-GLADE ,SCOREBIT>>
		       <B-SIT>
		       <COND (<VERB? KONNICHI-WA>
			      <TELL
"You use the phrases the old monk taught you.  \""I"Konnichi wa"",\" you
say.  ">)
			     (ELSE
			      <TELL "You bow to ">
			      <COND (,PRSO <TELL THE ,PRSO>)
				    (ELSE <TELL D ,TORANAGA>)>
			      <TELL ".  ">)>
		       <NEW-SDESC ,MARIKO "Mariko">
		       <REPLACE-SYNONYM ,MARIKO ,W?WOMAN ,W?MARIKO>
		       <REPLACE-SYNONYM ,MARIKO ,W?WOMAN ,W?TODA>
		       <REPLACE-ADJECTIVE ,MARIKO ,W?LADY ,W?TODA>
		       <COND (<NOT <PRSO? <> ,TORANAGA>>
			      <TELL "You bow to " D ,TORANAGA " as well.  ">)>
		       <COND (<VERB? KONNICHI-WA>
			      <TELL
"\""I"Konnichi wa, Toranaga-sama.""\"  You gather
your kimono around you and sit.  \""I"Gomen nasai, Toranaga-sama, nihon go ga
hanase-masen.  Tsuyaku go imasu ka?""\"|
|
The woman looks surprised.  \"">
			      <COND (<NOT <FSET? ,HERE ,RMUNGBIT>>
				     <FSET ,HERE ,RMUNGBIT>
				     <TELL
"I am your interpreter, senhor,\" she says at once.  \"My name is
Mariko.  ">)>
			      <SETG QCONTEXT ,MARIKO>
			      <SETUP-ANSWER "i learned from">
			      <TELL "But you
speak Japanese?\" she asks.  You explain that you know only a few words and
phrases.  \"My Master wishes to know where you learned your 'few words and
phrases.'\"" CR>
			      <SCORE-OBJECT ,MAPLE-GLADE>)
			     (ELSE
			      <FSET ,HERE ,RMUNGBIT>
			      <TELL
"The woman greets you.  \"My name is Mariko.  I am your interpreter,
senhor.\"" CR>)>)
		      (<AND <IN? ,ISHIDO ,HERE>
			    <OR <P? TELL TORANAGA>
				<P? (ASK-ABOUT TELL-ABOUT) TORANAGA>>>
		       <TELL
"Mariko motions you not to interrupt Toranaga." CR>
		       <COND (<VERB? TELL> <END-QUOTE>)
			     (ELSE <RTRUE>)>)
		      (<P? TELL-ABOUT TORANAGA>
		       <PERFORM ,V?TELL-ABOUT ,MARIKO ,PRSI>
		       <RTRUE>) 
		      (<P? DRAW WORLD>
		       <TELL
"You kneel in the sand.  With your finger you begin to draw a crude map, upside
down so they can see it better.  You sketch boldly.  \"I can draw a more
accurate map later, with pen and paper.\"  You gesture.  \"This is north and
south, east and west.  Japan is here, my country's on the other side of the
world, there.  This is all unknown and unexplored.\"  Your hand waves away the
vast expanse of western North America, the interior of South America, all Asia
north and east of Muscovy, and inland Africa.  \"We know the coastlines, but
little else.  The interiors are almost entirely mysteries.\"" CR>)
		      (<P? BOW ISHIDO>
		       <COND (<FSET? ,ISHIDO ,RMUNGBIT>
			      <TELL
"You copy the Japanese.  Toranaga seems impressed." CR>)
			     (ELSE
			      <TELL
"You bow to Ishido, but he ignores you." CR>)>)>)>>

<ROUTINE HOW-I-LEARNED ()
	 <SETG QCONTEXT <>>
	 <SETUP-ANSWER <>>
	 <TELL
"\"There was a monk in the prison, senhorita, a Francisan monk, and he taught
me.  Things like 'food, friend, bath, go, come, true, false,' and so on.  Would
you please tell Lord Toranaga that I'm better prepared now to answer his
questions, to help, and more than a little pleased to be out of prison.  For
which I thank him.\"" CR>>

<GLOBAL MARIKO-IMPATIENT 0>
<GLOBAL YAEMON-BORED? 0>

<ROUTINE I-YAEMON ()
	 <COND (<FSET? ,YAEMON ,SCOREBIT>
		<COND (<OR <EQUAL? ,YAEMON-CNT 1>
			   <AND <G? ,YAEMON-CNT 1>
				<PROB 67>>>
		       <SETG YAEMON-BORED? T>
		       <TELL CR
CTHE ,YAEMON " seems bored with you.  He reminds you of your own son when
the talk of adults becomes too serious.  ">
		       <COND (<PROB 50>
			      <TELL "He yawns." CR>)
			     (ELSE
			      <TELL "His attention is drifting." CR>)>)>)>
	 <COND (<EQUAL? ,QCONTEXT ,MARIKO>
		<SETG MARIKO-IMPATIENT <+ ,MARIKO-IMPATIENT 1>>
		<COND (<G? ,MARIKO-IMPATIENT 1>
		       <TELL CR
"\"Please answer, senhor.  My Master grows impatient.\"" CR>
		       <RTRUE>)
		      (ELSE
		       <RFALSE>)>)>
	 <ZLINES ,YAEMON-CNT
		 (DELAY
		  <COND (<FSET? ,MAPLE-GLADE ,SCOREBIT>
			 <COND (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"The three Japanese are watching you.  The woman is curious but nervous,
Toranaga is like a hawk watching a rabbit, and the boy stares at you as he
would stare at a fabulous monster.  It's exactly what your own son, so
far away in England, would do.  ">)
			       (ELSE
				<TELL CR
"The three Japanese continue to watch you.  ">)>
			 <TELL "What was the polite phrase the old monk
taught you?  You try to remember." CR>
			 <RTRUE>)>)
		 (<THIS-IS-IT ,MARIKO>
		  <TELL CR
"Mariko begins to ask you questions.  Where you were born, whether you are
married, where you lived in England.  She is not as good an interpreter as
Father Alvito, but she is more pleasant to talk to, and beautiful.  At one
point you compliment her on her flawless grasp of Portuguese, and she
blushes, fluttering her fan." CR>)
		 (<THIS-IS-IT ,MARIKO>
		  <THIS-IS-IT ,TORANAGA>
		  <TELL CR
"\"My Lord wishes to know about you and your family,\" Mariko
continues.  \"About your country, its queen and previous rulers, habits,
customs, and
history.  Similarly about all other countries, particularly Portugal and
Spain.  All about the world you live in.  About your ships, weapons, foods,
trade.  About
your wars and battles and how to navigate a ship, how you guided your ship
and what happened on the voyage.  He wants to understand -- Excuse me, why do
you laugh?\"|
|
\"Only because, senhorita,\" you reply, \"that seems to be just about
everything I know.\"|
|
\"That is precisely what my Master wishes.\"" CR>)
		 (<MOVE ,ISHIDO ,HERE>
		  <FSET ,ISHIDO ,RMUNGBIT>
		  <TELL CR
"Ishido appears at the edge of the glade, bows formally to the young boy,
and to Toranaga, who looks annoyed at the interruption but bows back." CR>)
		 (<FCLEAR ,ISHIDO ,RMUNGBIT>
		  <TELL CR
"Ishido and Toranaga converse.  Mariko translates for you.  \"Please excuse me,
Lord Toranaga,\" he says.  \"There is an important matter I wish to see you
about.  The last formal meeting of the Regents has been postponed.  We do not
meet tonight at sunset.  Lord Kiyama's sick.  Lord Sugiyama and Lord Onoshi
have agreed to the delay.  A few days are unimportant, aren't they, on such
important matters?\"|
|
\"When will the meeting be?\" Toranaga asks, seething.  Any delay jeopardizes
him immeasurably." CR>)
		 (<TELL CR
"\"I understand Lord Kiyama should be well tomorrow, or perhaps the next
day.  His physician has forbidden any visitors.  The disease might be
contagious.\"  Ishido is very nonchalant, implying the delay could be
indefinite." CR>)
		 (<MOVE ,ISHIDO ,GENERIC-OBJECTS>
		  <MOVE ,PROPHECY ,GENERIC-OBJECTS>
		  <TELL CR
"\"I'll visit Lord Kiyama the day after tomorrow,\" Toranaga says, naming a
deadline.  \"The contagion that will topple me has not yet been born.  Remember
the soothsayer's prediction!\"|
|
\"No, Lord Toranaga, I haven't forgotten,\" Ishido says, remembering very
well.  He bows again, very deferential to the boy, and leaves." CR>)
		 (<DEQUEUE I-YAEMON>
		  <TELL CR
"Soon the interview is over, and the Heir is sent for his swimming
lesson.  Toranaga installs you in his own sleeping chamber, as a mark of his
favor.  Things are looking up, indeed!" CR>
		  <NEXT-SCENE>)>>

<OBJECT PROPHECY
	;(LOC GENERIC-OBJECTS)
	(DESC "prophecy")
	(SYNONYM PROPHECY PREDICTION)
	(FLAGS SCOREBIT)>

<OBJECT YAEMON
	(LOC GENERIC-OBJECTS)
	(SDESC "Yaemon")
	(SYNONYM BOY YAEMON HEIR)
	(ADJECTIVE YOUNG)
	(FLAGS PERSON NOABIT NOTHEBIT JAPANESEBIT SCOREBIT)
	(ACTION YAEMON-F)>

<ROUTINE YAEMON-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (ELSE
		<COND (<VERB? EXAMINE>
		       <TELL
"The boy is small and straight and round-eyed, his full black hair tied into
a short queue, his pate unshaven.  His curiosity seems enormous." CR>)
		      (<VERB? SMILE WINK>
		       <COND (,YAEMON-BORED?
			      <COND (<FSET? ,YAEMON ,SCOREBIT>
				     <TELL
"The boy jumps, then laughs and interrupts Mariko and points and speaks out,
and everyone listens indulgently and no one hushes him.|
|
\"Lord Toranaga asks why you did that, senor?\"|
|
You think for a moment and reply, \"Oh, just to amuse the lad.  He's a child
like any, and children in my country would usually laugh if you did that.  My
son must be about his age now.  My son's seven.\"|
|
\"The Heir is seven,\" Mariko says after a pause." CR>
				     <SCORE-OBJECT ,YAEMON>)
				    (ELSE
				     <TELL
"There is no response this time." CR>)>)
			     (ELSE
			      <TELL
CTHE ,YAEMON " jumps back, startled." CR>)>)
		      (<VERB? WHO>
		       <TELL
"He is the Heir, the only son of the Taiko, who died a year ago.  The Council
of Regents is to guide him and rule Japan through his minority." CR>)>)>>

<ROUTINE ALVITO-AFTER-F ()
	 <TELL
"Elsewhere in Osaka, Father Alvito reports to his superior, dell'Aqua,
the Father-Visitor of Asia,
the most powerful Jesuit and thus the most powerful man in Asia.|
|
\"We're already in trouble.  Toranaga began by saying that he understands from
the Ingeles that incredible profits are being made from the Portuguese monopoly
of the silk trade with China.  He 'invites' you to report to the Regents on rates
of exchange.  He does not object to our making a large profit, providing it comes
from the Chinese.  I'm sorry to tell you that Blackthorne seems to be particularly
well informed.\"|
|
Ferriera, the Spanish Captain of the Black Ship, says coldly, \"The sooner the heretic's
dead the better.  If the Dutch and English start spreading their filth in Asia we're
in for trouble!\"|
|
\"I regret to tell you, Captain, that Toranaga said that if any harm befalls the
Ingeles, it's quite possible the Taiko's Expulsion Edicts would be reexamined and
all Christian churches, schools, places of rest, would be immediately closed.\"" CR>>

<END-SEGMENT>
