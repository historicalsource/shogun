"MARIKO for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT OCHIBA>

<ROOM OCHIBA-ROOM
      (LOC ROOMS)
      (SCENE S-OCHIBA)
      (SCORE 3)
      (DESC "Reception Room")
      (SYNONYM ROOM)
      (ADJECTIVE RECEPTION)
      (FDESC
"Your feet take you under the final portcullis and your escorts lead
you up to the huge door.  Here they leave you alone.  Desperate for
any distraction from the ordeal to come, you admire the camellia blossom
Mariko took from a vase in your quarters and gave to you.  The flower is
reassuring.  Not everyone here in Osaka is an enemy.|
|
You stand rigid for a moment, petrified with
nervousness.  What if you disgrace yourself?  What if you slip or your
swords fall or your limited Japanese fails you.  You take a deep breath
and walk forward into the flare-lit maw.")
      (LDESC
"It is an immense, high-raftered room with a golden ornamented
ceiling.  Gold-paneled columns support the rafters, which are made of rare and
polished woods.  Five hundred samurai and their ladies are here, wearing
all the colors of the rainbow.  To one side is a line of guests who wait
to bow before the raised platform at the far end.")
      (FLAGS ONBIT)
      (ACTION OCHIBA-ROOM-F)>

<ROUTINE OCHIBA-ROOM-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<MOVE ,CAMELLIA ,BLACKTHORNE>
		<MOVE ,SWORDS ,BLACKTHORNE>
		<FSET ,SWORDS ,WEARBIT>
		<FSET ,SWORDS ,RMUNGBIT>
		<MOVE ,ISHIDO ,OCHIBA-ROOM>
		<MOVE ,OCHIBA ,OCHIBA-ROOM>
		<QUEUE I-OCHIBA -1>)
	       (<RARG? BEG>
		<COND (<OR <P? (BOW HELLO KONNICHI-WA KONBANWA)
			       (<> OCHIBA ISHIDO)>
			   <VERB? KNEEL>>
		       <COND (<FSET? ,BLACKTHORNE ,TRYTAKEBIT>
			      <COND (<P? (HELLO KONNICHI-WA KONBANWA)
					 (OCHIBA <>)>
				     <SETG WINNER ,OCHIBA>
				     <PERFORM ,V?HELLO>
				     <SETG WINNER ,PLAYER>
				     <RTRUE>)
				    (ELSE
				     <TELL
"You have already bowed to the hosts." CR>)>)
			     (<FSET? ,OCHIBA ,RMUNGBIT>
			      <FSET ,BLACKTHORNE ,TRYTAKEBIT>
			      <B-STAND>
			      <TELL
"In front of the platform, you kneel and bow formally as you have seen
the others do, once to Ochiba and once to Ishido.  You then stand and
walk forward.">
			      <COND (<AND <FSET? ,SWORDS ,WEARBIT>
					  <FSET? ,SWORDS ,RMUNGBIT>>
				     <FCLEAR ,SWORDS ,RMUNGBIT>
				     <FCLEAR ,SWORDS ,WEARBIT>
				     <MOVE ,SWORDS ,HERE>
				     <TELL
" Suddenly, just as you had feared, your sword belt comes loose and
your swords clatter to the floor.  You turn red, scrambling for them
on the ground, and Ishido begins a swelling round of humiliating
laughter.">)>
			      <CRLF>)
			     (ELSE
			      <TELL
"You must be very nervous: you aren't at the front of the line yet!" CR>)>)
		      (<P? CURSE (ISHIDO OCHIBA)>
		       <TELL
"You insult " D ,PRSO ", forfeiting any gain you might have gotten
from the exchange." CR>)
		      (<ACT-CRAZY?>
		       <COND (<EQUAL? ,QCONTEXT ,ISHIDO>
			      <TELL
"Ishido stares at you.  \"This is what I meant!\"" CR>)
			     (ELSE
			      <TELL "Ochiba looks disgusted." CR>)>)
		      (<OR <HOSTILE-VERB?>
			   <P? (DRAW PICK USE TAKE) SWORDS>>
		       <TELL
"Such a foolish action would surely lead to your immediate death." CR>)>)>>

<OBJECT CAMELLIA
	(DESC "camellia blossom")
	(SYNONYM BLOSSOM FLOWER CAMELLIA)
	(ADJECTIVE CAMELLIA PINK)
	(FLAGS TAKEBIT SCOREBIT)
	(ACTION CAMELLIA-F)>

<ROUTINE CAMELLIA-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a particularly beautiful pink camellia blossom that you cut from
a tree in the garden.  It is at the peak of its beauty." CR>)
	       (<P? GIVE CAMELLIA OCHIBA>
		<COND (<NOT <FSET? ,BLACKTHORNE ,TRYTAKEBIT>>
		       <TELL
"Ochiba recoils from the unaccustomed familiarity.  You haven't even
greeted her properly.  \"His manners are barbaric,\" she says to Ishido,
with sadness." CR>)
		      (ELSE
		       <REMOVE ,CAMELLIA>
		       <SCORE-OBJECT ,CAMELLIA>
		       <TELL
"\"In my land we are ruled by a Queen.  We have the custom to always give
a Lady a birthday gift.  Even a Queen.  Please excuse if this is not good
manners.\"  She looks at the flower.  Five hundred people wait to see how
she will respond to your gallantry and daring.|
|
\"I am not a Queen, Anjin-san, only the mother of the Heir and widow of
the Lord Taiko.  I cannot accept your gift as a Queen, but as a Lady on
her birthday, perhaps I may ask everyone's permission to accept the
gift?\"|
|
The room bursts into applause." CR>)>)>>

<GLOBAL OCHIBA-QUESTION <>>

<ROUTINE I-OCHIBA ()
	 <ZLINES ,OCHIBA-CNT
		 (<TELL CR
"The procession of guests creeps forward, each politely bowing to
Ochiba and greeting her on her birthday." CR>)
		 (<FSET ,OCHIBA ,RMUNGBIT>
		  <TELL CR
"Ochiba is looking at you,
and then Ishido is looking at you, too.  Soon all conversation dies
and everyone is watching you.  The men and women ahead of you in
line melt away and suddenly no one is between you and the platform." CR>)
		 (DELAY
		  <COND (<NOT <FSET? ,BLACKTHORNE ,TRYTAKEBIT>>
			 <COND (<G? ,DELAY-CNT 4>
				<TELL CR
"Ishido stands, bows to Lady Ochiba, and asks, \"With your permission,
Lady, I will remove this insult to your person.\"" CR>
				<JIGS-UP>
				<RFATAL>)
			       (ELSE
				<TELL CR
"Every eye is on you as you stand before Ochiba.  Every breath is held." CR>
				<RTRUE>)>)>)
		 (1)
		 (<SETG OCHIBA-QUESTION 1>
		  <SETG QCONTEXT ,OCHIBA>
		  <TELL CR
"\"Please wait, Anjin-san,\" says Ochiba.  You feel the extraordinary
sensuality that surrounds her, without conscious effort on her
part.  \"">
		  <COND (<FSET? ,HANASE-MASEN ,RMUNGBIT>
			 <TELL
"You speak our language, then?\"" CR>)
			(ELSE
			 <TELL
"It is said that you speak our language?\"" CR>)>)
		 (DELAY
		  <COND (<EQUAL? ,OCHIBA-QUESTION 1>
			 <COND (<G? ,DELAY-CNT 2>
				<SETG OCHIBA-QUESTION <>>
				<TELL CR
"\"Ah, I suppose what we have heard is not true, then.  He must not
truly speak our language.\"  She turns to Ishido and smiles." CR>)
			       (ELSE
				<TELL CR
"\"Is it true that you speak our language, Anjin-san?\" she asks in a
friendly way, using the Japanese that you can barely understand." CR>)>
			 <RTRUE>)>)
		 (1)
		 (<SETG QCONTEXT ,ISHIDO>
		  <TELL CR
"Ishido rudely interrupts.  \"When we last met, you were a madman.  I
hope you won't get mad tonight or any other night.\"" CR>)
		 (<SETG QCONTEXT ,ISHIDO>
		  <SETG OCHIBA-QUESTION 2>
		  <TELL CR
"\"Such madness is usual among you barbarians, "I"neh?""\"  He emphasizes
the word 'barbarians.'  Such public rudeness to a guest is very
bad.  Lady Ochiba seems surprised." CR>)
		 (DELAY
		  <COND (<EQUAL? ,OCHIBA-QUESTION 2>
			 <COND (<G? ,DELAY-CNT 3>
				<SETG OCHIBA-QUESTION 0>
				<TELL CR
"\"Bah!  It is clear he is a barbarian without honor!\"  Ishido turns
away with a snort of dirision." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"Ishido continues to taunt you.  \"You are a barbarian.  You "I"barbarians"
" are prone to fits of madness, as I've been told?\"  The room is
hushed, everyone waiting to see how you will respond." CR>
				<RTRUE>)>)>)
		 (<MOVE ,MARIKO ,HERE>
		  <TELL CR
"\"Mariko-san, your pupil does you credit, "I"neh?""\" calls out
Ochiba.  Mariko is coming through the guests.  \"I have done little,
Ochiba-sama.  It's all the Anjin-san's work and the word book that the
Christian
fathers gave him.\"" CR>)
		 (<TELL CR
"Ochiba turns to Mariko.  \"Now, Mariko-san, we must talk about the
poetry competition!  It will
be held in two days, when Lord Toranaga leaves his own borders to
journey here.  What's the
theme to be?  And the first line of the poem?\"  Mariko is renowned as
a poetess.|
|
Mariko thinks a moment.  \"It should be about "I"today"", Lady Ochiba,
and the first line: 'On a leafless branch.'\"|
|
Ishido compliments her on her choice.  \"Excellent, but we'll have to
be very good to compete with you, Mariko-san!\"" CR>)
		 (<TELL CR
"Mariko continues, \"So sorry, Sire, but I will not be there.  I'm leaving Osaka tomorrow
with the Lady Kiritsubo and the Lady Sazuko, to meet Lord Toranaga.\"|
|
\"Nonsense!\" replies Ishido.  \"He will be here so soon that to go to
meet him isn't necessary.\"|
|
\"So sorry, Sire, but those are the orders of my liege Lord.  I must
leave tomorrow.  Am I confined here?  And if so, on whose orders?\"|
|
Ishido keeps his eyes riveted on her.  \"No, you are not confined.\"" CR>)
		 (<TELL CR
"Many of the ladies in the room turn to their neighbors, and some
whisper openly what all those held against their will in Osaka are
thinking: 'If she can go, so can I, so can you!  I'll leave tomorrow,
too!'" CR>)
		 (<DEQUEUE I-OCHIBA>
		  <TELL CR
"Mariko makes a half-bow to the room and leaves.  Yabu steps forward
with you and the two of you follow her out, very conscious that you
are the only samurai present wearing Toranaga's uniform." CR>
		  <NEXT-SCENE>)>>

<OBJECT OCHIBA
	(LOC OCHIBA-ROOM)
	(DESC "Lady Ochiba")
	(SYNONYM OCHIBA LADY)
	(ADJECTIVE LADY)
	(FLAGS PERSON JAPANESEBIT NOABIT FEMALE)
	(DESCFCN OCHIBA-DESC)
	(ACTION OCHIBA-F)>

<ROUTINE OCHIBA-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"On the platform, alone, is the Lady Ochiba.">)>>

<ROUTINE OCHIBA-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<OR <VERB? YES HAI NO IYE>
			   <P? SAY JAPANESE>
			   <P? NIHON-GO-GA HANASE-MASEN>>
		       <COND (<OR <EQUAL? ,OCHIBA-QUESTION 1>
				  <P? NIHON-GO-GA HANASE-MASEN>>
			      <SETG OCHIBA-QUESTION <>>
			      <COND (<VERB? HAI IYE SPEAK NIHON-GO-GA>
				     <FSET ,HANASE-MASEN ,RMUNGBIT>)>
			      <COND (<VERB? NO IYE>
				     <TELL
"\"No, Highness.  I have learned a few words and phrases, so that I may
better be understood, however.">)
				    (ELSE
				     <TELL
"\"Please excuse me, Highness.">)>
			      <TELL
"  I have to use short words and respectfully
ask you to use simple words with me.\"" CR>)
			     (ELSE
			      <TELL
"She doesn't seem to be listening." CR>)>)
		      (<VERB? HELLO>
		       <COND (<NOT <FSET? ,OCHIBA ,TRYTAKEBIT>>
			      <FSET ,OCHIBA ,TRYTAKEBIT> ;"greeted her"
			      <TELL
"\"May I respectfully congratulate
you on your birthday and pray that you live to enjoy a thousand more.\"" CR>)
			     (ELSE
			      <TELL
"You have already congratulated her." CR>)>)
		      (<P? THANK YOU>
		       <TELL
"\"Domo, Ochiba-sama.\"  She acknowledges your thanks." CR>)
		      (<OR <P? NO>
			   <NOT-A-BARBARIAN?>>
		       <TELL
"\"This may be true, Anjin-san, but your manners are less than perfect.\"" CR>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? EXAMINE>
		<TELL
"She is slight, almost girlish in build, with a luminous glow to her
fair skin.  She is at the peak of her beauty.  Her sloe eyes are large
under painted, arched brows, her
hair set like a winged helmet.  Her kimono is exquisitely rich, gold
threads on the rarest blue-black silk.  She sits comfortably on a
cushion." CR>)
	       (<VERB? WHO>
		<TELL
"The Lady Ochiba is the widow of the Taiko, and the mother of the
Heir, Yaemon.  The rumors say that she is now the mistress of Lord
Ishido.  All Japan wonders if the Taiko, who had never before sired
a child, was truly the Yaemon's father, but only Ochiba knows for
sure." CR>)>>

<END-SEGMENT>



"S-DEPARTURE"

<BEGIN-SEGMENT DEPARTURE>

<ROUTINE DEPARTURE-AFTER-F ()
	 <TELL
"Ishido and his supporters meet in Kiyama's opulent, overrich quarters.|
|
\"It's impossible, Lord General,\" Ochiba says.  \"You can't let a lady of her
rank commit seppuku.  So sorry, but you've been trapped.  The hostages will have
to be freed, and then there's nothing to stop Toranaga.\"|
|
\"I agree,\" Lord Kiyama says forcefully.|
|
\"With due humility, Lady,\" Ishido replies, \"whatever I said or didn't say,
doesn't matter an "I"eta""'s turd to her.  She's already decided, at least
Toranaga has.  We are at war, Toranaga's not yet in our hands, and until he's
dead the Heir is in total danger.\"|
|
He walks over to the window.  \"Suppose she's disarmed?  Capture her!  Confine
her until Toranaga's in our hands, then the hostages don't matter.  In eighteen
days Toranaga has to be here!\"|
|
\"You really think Lady Toda could be captured?\" Kiyama says.|
|
\"Yes,\" replies Ishido." CR>>

<ROUTINE I-DEPARTURE ()
	 <ZLINES ,DEPARTURE-CNT
		 (<MOVE ,YAMAZAKI ,FORECOURT>
		  <THIS-IS-IT ,YAMAZAKI>
		  <TELL CR
"Twenty Browns form up as a vanguard and move off.  Porters pick up
Mariko's palanquin and follow the Browns, Kiri and Lady
Sazuko close behind.|
|
When Mariko's palanquin comes into the sunlight, a Captain of Grays
steps forward, standing directly in her way.  \"May I see your
papers?\" he inquires.|
|
Mariko says formally, \"We require none.  I am Toda Mariko-noh-Buntaro
and I have been ordered by my leige Lord, Lord Toranaga, to escort his
ladies to meet him.  Kindly let us pass.\"|
|
\"My name is Yamazaki Danzenji, Captain of the Fourth Legion, and my line
is as ancient as your own, my Lady.  Please excuse me, but my leige Lord,
Lord Ishido, says no one may
leave Osaka Castle without papers.\"|
|
\"So sorry, Captain, but if you do not move out of the way I will order
you killed.\"" CR>)
		 (<QUEUE I-FIGHT -1>
		  <SETG OPPONENT ,YAMAZAKI>
		  <TELL CR
G"\"You will not pass without papers!\""" the Gray Captain replies
proudly.  Mariko nods sadly.  \"Please kill him,\" she orders quietly,
and at once
the battle is joined.  It is terrifyingly fair and formal, one Gray for
each Brown and one for yourself." CR>)
		 (DELAY
		  <COND (<QUEUED? I-FIGHT> <RFALSE>)>)
		 (<MOVE ,MARIKO ,HERE>
		  <MOVE ,KOJIMA ,HERE>
		  <SETG OPPONENT ,KOJIMA>
		  <THIS-IS-IT ,KOJIMA>
		  <TELL CR
"Almost immediately, twenty more Browns run forward to form a new
vanguard.  From up ahead twenty more Grays move silently out from the
hundreds that are waiting.|
|
\"Wait,\" Mariko orders.  She steps out of her palanquin and picks up
a sword, unsheaths it, and walks forward alone.  She approaches the
officer.  \"You know who I am.  Please get out of my way.\"|
|
\"I am Kojima Harutomo, Captain of the Sixth Legion.  Please excuse me,
you may not pass, Lady.\"" CR>)
		 (<TELL CR
"Mariko darts forward but her blow is contained.  The Gray stays on the
defensive although he could kill her without effort.|
|
Again Mariko tries to bring the Gray to battle, but he slides away, allowing
her to exhaust herself.  But he does this gravely, giving her every courtesy,
giving her the honor that is her due.  She knows she cannot last much
longer.  She sees how easy it would be for the massed Grays to cut them all
off if
they wish and leave them stranded and helpless.  She breaks off the fight." CR>)
		 (<SETG OPPONENT <>>
		  <MOVE ,ISHIDO ,HERE>
		  <TELL CR
"Lord Ishido emerges from the crowd of Grays.  \"Lady Toda, the castle
orders must be obeyed.  But if you wish, I will call a meeting of the
Regents and ask for a ruling.\"|
|
Mariko turns to Ishido and bows.  \"My orders are clear.  If I am not
permitted to obey, I will not be able to live with that shame.\"" CR>)
		 (<TELL CR
"\"These men have prevented me from
doing my duty, from obeying my leige Lord.  I cannot live with this
shame, Sire.  Unless we are allowed to obey our leige Lord, as is our
right, I will commit seppuku at sunset!\"|
|
She bows and walks toward the gateway.  All in the avenue and all on the
battlements bow to her in homage.  She goes into the garden, her footsteps
taking her to the secluded, rustic little tea house.  She goes inside and,
once there, she weeps silently for all the men who have died." CR>
		  <REMOVE ,KOJIMA>
		  <REMOVE ,YAMAZAKI>
		  <REMOVE ,MARIKOS-LITTER>
		  <DEQUEUE I-DEPARTURE>
		  <NEXT-SCENE>)>>

<GLOBAL YAMAZAKI-ATTACK <>>

<GLOBAL YAMAZAKI-ATTACKS
	<LTABLE 0
"The Captain leaps forward, his sword a whirling arc directed at your
head!"
"The Captain swings his sword, chopping viciously at your knees."
"The Captain charges at you, his sword pointed straight at your belly."
"The Captain screams \"Yaemon!\" and begins an overhand blow toward
your head.">>

<OBJECT YAMAZAKI
	(SCENE S-DEPARTURE)
	(DESC "Yamazaki")
	(SYNONYM GRAY CAPTAIN LEADER YAMAZAKI DANZENJI)
	(ADJECTIVE GRAY)
	(FLAGS PERSON NOABIT NOTHEBIT SCOREBIT)
	(HEALTH 4)
	(GENERIC GENERIC-CAPTAIN-F)
	(ACTION YAMAZAKI-F)>

<ROUTINE YAMAZAKI-F ("OPT" (RARG <>) "AUX" H)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? WHO (YAMAZAKI YOU)>
		       <TELL
"\"My name is Yamazaki Danzenji, Captain of the Fourth Legion!\"" CR>)
		      (<VERB? STOP>
		       <TELL
G"\"You will not pass without papers!\"" CR>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
"He is dead.  You have killed him." CR>)
		      (ELSE
		       <TELL
G"He is dressed in the Gray uniform." CR>)>)
	       (<VERB? BOW>
		<TELL
"He looks you over carefully, considering his options." CR>)
	       (<HOSTILE-VERB?>
		<COND (<VERB? BITE PISS SPIT KICK>
		       <TELL
"He is clearly insulted that you would ever try such a barbaric action." CR>)
		      (<OR <AND <PRSO? ,YAMAZAKI>
				<NOT <PRSI? ,SWORDS <>>>>
			   <AND <PRSI? ,YAMAZAKI>
				<NOT <PRSO? ,SWORDS <>>>>>
		       <TELL
"You aren't taking him very seriously, are you?" CR>)
		      (<FSET? ,YAMAZAKI ,DEAD>
		       <TELL
"You strike the already-dead Gray with your sword.  The onlookers are
shocked at this insult to a worthy opponent!" CR>)
		      (<NOT <FSET? ,YAMAZAKI ,RMUNGBIT>>
		       <COND (<QUEUED? I-FIGHT>
			      <FSET ,YAMAZAKI ,RMUNGBIT>
			      <COND (<FSET? ,SWORDS ,WEARBIT>
				     <FCLEAR ,SWORDS ,WEARBIT>
				     <TELL
"You draw your sword, and the Captain bows to you and does the same." CR>)
				    (ELSE
				     <SETG DELAYING-FIGHT? <>>
				     <TELL
"You strike at the Gray Captain, and he dodges expertly as he draws his
sword.  He is clearly shocked that you would attack him before he had a
chance to draw his sword." CR>)>)
			     (ELSE
			      <TELL
"\"Not yet, Anjin-san!  Wait for my order!\"" CR>)>)
		      (<ZERO? ,YAMAZAKI-ATTACK>
		       <SETG DELAYING-FIGHT? <>>
		       <TELL
"You swing powerfully if somewhat inexpertly with your sword.  The
Captain parries." CR>)
		      (ELSE
		       <SETG DELAYING-FIGHT? <>>
		       <SETG YAMAZAKI-ATTACK <>>
		       <SET H <GETP ,YAMAZAKI ,P?HEALTH>>
		       <PUTP ,YAMAZAKI ,P?HEALTH <SET H <- .H 1>>>
		       <TELL <PICK-ONE ,SWORD-ATTACKS> CR>
		       <COND (<ZERO? .H>
			      <FSET ,YAMAZAKI ,DEAD>
			      <SETG OPPONENT <>>
			      <COND (<ZERO? <GETP ,BROWNS ,P?COUNT>>
				     <DEQUEUE I-FIGHT>)>
			      <TELL CR
"The captain stares at you silently for a moment, then his eyes glaze
and he falls to the ground, dead." CR>
			      <SCORE-OBJECT ,YAMAZAKI>)>
		       <RTRUE>)>)>>

<CONSTANT SWORD-ATTACKS
	  <LTABLE 0
"You swing, wishing for luck, for good karma, for a pistol, by
God!  He parries, but the force of your blow is strong, and the tip
manages to carve into his wrist."
"You hold the blade before you, stabbing almost wildly with it, wondering
why his attack is so formal.  You see an opening and plunge madly
forward, wounding him in the chest."
"You interpose your blade, and there is a ringing, almost bell-like
crash as they meet.  You slide your blade around and manage to wound
him.  He seems almost surprised."
"Leaping and yelling, you charge him, and in an astonishing flurry he
fights back, executing a daring turn and riposte, but he's off balance
and you slice the back of his calf.">>

<OBJECT KOJIMA
	(SCENE S-DEPARTURE)
	(DESC "Kojima")
	(SYNONYM CAPTAIN LEADER KOJIMA)
	(ADJECTIVE GRAY)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT)
	(HEALTH 4)
	(GENERIC GENERIC-CAPTAIN-F)
	(ACTION KOJIMA-F)>

<ROUTINE KOJIMA-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? WHO (KOJIMA YOU)>
		       <TELL
"\"My name is Kojima Harumoto, Captain of the Sixth Legion!\"" CR>)
		      (<VERB? STOP>
		       <TELL
G"\"You will not pass without papers!\"" CR>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
"He is dead.  Mariko has killed him." CR>)
		      (ELSE
		       <TELL
G"He is dressed in the Gray uniform." CR>)>)
	       (<HOSTILE-VERB?>
		<COND (<FSET? ,KOJIMA ,DEAD>
		       <TELL
"You prepare to strike the already-dead Gray with your sword.  Mariko
says, \"No, Anjin-san.  He was samurai.  He was doing his duty.\"" CR>)
		      (ELSE
		       <TELL
"Mariko says, \"Anjin-san, this is my fight.  You must not
shame me by fighting this man.  I am samurai, and this is my duty, and
my honor.\"" CR>)>)>>

<GLOBAL DELAYING-FIGHT? 0>

<ROUTINE CAPTAIN-KILLS-YOU ()
	 <CRLF>
	 <JIGS-UP
"The Captain, having decided you are a barbarian without honor, removes your
head.">>

<ROUTINE I-FIGHT ("AUX" (B <GETP ,BROWNS ,P?COUNT>))
	 <COND (<NOT <FSET? ,YAMAZAKI ,DEAD>>
		<SETG DELAYING-FIGHT? <+ ,DELAYING-FIGHT? 1>>
		<COND (<B-NOT-STANDING?>
		       <COND (<G? ,DELAYING-FIGHT? 4>
			      <CAPTAIN-KILLS-YOU>)
			     (ELSE
			      <TELL CR
"The Captain motions for you to stand and fight." CR>)>)
		      (<OR <NOT <HELD? ,SWORDS>>
			   <FSET? ,SWORDS ,WEARBIT>>
		       <COND (<G? ,DELAYING-FIGHT? 4>
			      <CAPTAIN-KILLS-YOU>
			      <CRLF>
			      <JIGS-UP
"The Captain, having decided you are a barbarian without honor, removes your
head.">)
			     (ELSE
			      <TELL CR
"The Captain waits for you to draw your sword." CR>)>)
		      (ELSE
		       <COND (<NOT <FSET? ,YAMAZAKI ,RMUNGBIT>>
			      <FSET ,YAMAZAKI ,RMUNGBIT>
			      <THIS-IS-IT ,YAMAZAKI>
			      <SETG OPPONENT ,YAMAZAKI>
			      <TELL CR
"The Captain bows formally, draws his sword, and prepares to attack you." CR>)
			     (<NOT <ZERO? ,YAMAZAKI-ATTACK>>
			      <TELL CR
"The Captain swings his sword at you, but
oddly, at the last second he seems to adjust his attack so that
you are only slightly cut, rather than sliced in two." CR>)
			     (ELSE
			      <SETG YAMAZAKI-ATTACK T>
			      <TELL CR <PICK-ONE ,YAMAZAKI-ATTACKS> CR>)>)>)>
	 <COND (<NOT <ZERO? .B>>
		<SET B <- .B <RANDOM 7>>>
		<COND (<L=? .B 0> <SET B 0>)>
		<PUTP ,BROWNS ,P?COUNT .B>
		<COND (<ZERO? .B>
		       <COND (<FSET? ,YAMAZAKI ,DEAD>
			      <DEQUEUE I-FIGHT>)>
		       <TELL CR
"It is now one to one, the last Brown, blood-stained and wounded, already
the victor of four duels.  The fresh Gray dispatches him easily and stands
alone among the bodies." CR>)
		      (ELSE
		       <TELL CR
"Each time a Gray falls, another calmy walks out of the waiting pack to
join his comrades in the killing.  It is now " <GET ,NUMBERS .B> " Brown">
		       <COND (<NOT <EQUAL? .B 1>>
			      <TELL "s versus as many Grays." CR>)
			     (ELSE
			      <TELL " versus one Gray." CR>)>)>)>
	 <RTRUE>>

<END-SEGMENT>



"S-SEPPUKU"

<BEGIN-SEGMENT SEPPUKU>

<ROOM FORMAL-GARDEN
      (LOC ROOMS)
      (SCENE S-SEPPUKU S-ESCAPE)
      (DESC "Formal Garden")
      (SYNONYM GARDEN)
      (ADJECTIVE FORMAL)
      (SCORE 1)
      (FDESC
"In a sudden hush, Mariko's maid Chimmoko comes out of the small gates
to the garden and walks over to you and bows.  \"Anjin-san, please excuse
me, my Mistress wishes to see you.  I will escort you.\"|
|
You get up, still deep in your reverie and your overpowering sense of
doom.  The shadows are long now.|
|
Chimmoko goes over to Sumiyori.  \"Please excuse me, Captain, but my Lady
asks you to please prepare everything.\"|
|
\"Where does she want it done?\"|
|
The maid points to the space in front of the arch.  \"There, Sire.\"|
|
Sumiyori is startled.  \"It's to be in public?  She's doing it for all
to see?  But, well ... what about her second?\"|
|
\"She believes Lord Kiyama will honor her.\"|
|
\"And if he doesn't?\"|
|
\"I don't know, Captain.  She hasn't told me.\"  Chimmoko bows and then
goes back to the gates and beckons you.  The Grays begin to follow but
Chimmoko shakes her head and says her mistress had not bidden
them.  They allow you to leave and you follow the servant into the garden.")
      (LDESC
"It is like a different world within the garden gates, verdant and serene,
the sun on the treetops, birds chattering and insects foraging, the brook
falling sweetly into the lily pond.  A tiny thatch-roofed tea house is
beside the garden gate.  The courtyard of the keep, a world away, is to the
east.")
      (EAST TO COURTYARD IF GARDEN-GATE IS OPEN)
      (OUT TO COURTYARD IF GARDEN-GATE IS OPEN)
      (NORTH TO TEA-HOUSE)
      (IN TO TEA-HOUSE)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL GARDEN-GATE TEA-HOUSE)
      (ACTION FORMAL-GARDEN-F)>

<ROUTINE FORMAL-GARDEN-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<QUEUE I-SEPPUKU -1>
		<FSET ,FORTIFIED-GATE ,OPENBIT>
		<MOVE ,MARIKO ,TEA-HOUSE>
		<FCLEAR ,MARIKO ,SCOREBIT>
		<FSET ,GARDEN-GATE ,OPENBIT>
		<MOVE ,CHIMMOKO ,HERE>
		<MOVE ,YABU ,FORECOURT>
		<MOVE ,KIRITSUBO ,FORECOURT>
		<MOVE ,SUMIYORI ,FORECOURT>
		<MOVE ,ISHIDO ,GENERIC-OBJECTS>)
	       (<RARG? ENTER>
		<COND (<AND <SCENE? ,S-ESCAPE>
			    <EQUAL? ,OHERE ,COURTYARD>
			    <IN? ,MARIKO ,COURTYARD>>
		       <QUEUE I-COME-BACK 6>
		       <TELL
"As you enter the garden, Mariko calls to you \"Anjin-san, we are leaving
soon.  Come back!\"  You see her explain to Yabu what she said." CR CR>)>)>>

<OBJECT GARDEN-GATE
	(LOC LOCAL-GLOBALS)
	(DESC "garden gate")
	(SYNONYM GATE)
	(ADJECTIVE GARDEN)
	(FLAGS DOORBIT)>

<OBJECT LILY-POND
	(LOC FORMAL-GARDEN)
	(DESC "lily pond")
	(SYNONYM POND WATER)
	(ADJECTIVE LILY)
	(FLAGS NDESCBIT VEHBIT)
	(ACTION LILY-POND-F)>

<ROUTINE LILY-POND-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The lily pond glistens in the sun, its waters rippled by the
gentle fall of water from the brook." CR>)
	       (<VERB? BOARD THROUGH>
		<TELL
"To do so would disturb the serenity and peace of the garden and the
pond." CR>)>>

<ROOM TEA-HOUSE
      (LOC ROOMS)
      (SCENE S-SEPPUKU S-ESCAPE S-DEPARTURE S-MARIKO)
      (DESC "Tea House")
      (LDESC
"The tea house is small, simple, and immaculate.  The doorway is small
so that all will be humble, equal, the host and guest, the most high
Lord and the merest samurai.")
      (SYNONYM HOUSE)
      (ADJECTIVE LITTLE TEA CHA-NO-YU)
      (OUT TO FORMAL-GARDEN)
      (SOUTH TO FORMAL-GARDEN)
      (FLAGS ONBIT OUTSIDE)
      (ACTION TEA-HOUSE-F)>

<ROUTINE TEA-HOUSE-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<P? KISS MARIKO>
		       <TELL
"You kiss her gently and tenderly." CR>)>)
	       (<RARG? ENTER>
		<COND (<SCENE? ,S-SEPPUKU>
		       <THIS-IS-IT ,MARIKO>
		       <SETG QCONTEXT ,MARIKO>
		       <TELL
"You go forward alone.  ">)>
		<TELL "You ">
		<COND (<FSET? ,SANDALS ,WEARBIT>
		       <FCLEAR ,SANDALS ,WEARBIT>
		       <MOVE ,SANDALS ,FORMAL-GARDEN>
		       <TELL "slip your feet out of your thongs and ">)>
		<TELL "walk
up the three steps.  You have to stoop, almost to your knees, to go
through the tiny screened doorway." CR CR>)>>

<OBJECT GREEN-RIBBON
	(OWNER MARIKO)
	(DESC "green silk ribbon")
	(SYNONYM RIBBON)
	(ADJECTIVE GREEN SILK)
	(FLAGS TAKEBIT)
	(ACTION GREEN-RIBBON-F)>

<ROUTINE GREEN-RIBBON-F ()
	 <COND (<AND <VERB? DROP> <FSET? ,PRSO ,RMUNGBIT>>
		<YOULL-HAVE-TO "untie it">)
	       (<P? TIE RIBBON <>>
		<COND (<NOT <HELD? ,PRSO>>
		       <TELL G"You don't have it." CR>)
		      (<NOT <FSET? ,PRSO ,RMUNGBIT>>
		       <FSET ,PRSO ,RMUNGBIT>
		       <TELL
"You tie the ribbon to your sash in homage to Mariko's courage." CR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)
	       (<VERB? UNTIE>
		<COND (<NOT <HELD? ,PRSO>>
		       <TELL G"You don't have it." CR>)
		      (<FSET? ,PRSO ,RMUNGBIT>
		       <FCLEAR ,PRSO ,RMUNGBIT>
		       <TELL
"You untie the ribbon." CR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)>>

<OBJECT SUMIYORI
	(SCENE S-SEPPUKU)
	(DESC "Sumiyori")
	(SYNONYM BROWN CAPTAIN LEADER SUMIYORI)
	(ADJECTIVE CAPTAIN BROWN)
	(FLAGS PERSON NOABIT NOTHEBIT)
	(ACTION SUMIYORI-F)>

<ROUTINE SUMIYORI-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<VERB? WHO>
		<TELL
"Sumiyori is the senior officer of Toranaga's Browns in Osaka." CR>)>>

<ROUTINE I-SEPPUKU ()
	 <ZLINES ,SEPPUKU-CNT
		 (DELAY
		  <COND (<NOT <HERE? ,FORMAL-GARDEN ,TEA-HOUSE>>
			 <MOVE ,CHIMMOKO ,HERE>
			 <TELL CR
"Mariko's servant Chimmoko urges you to return to the garden." CR>
			 <RTRUE>)>)
		 (<COND (<HERE? ,FORMAL-GARDEN>
			 <MOVE ,CHIMMOKO ,HERE>
			 <TELL CR
"Chimmoko points to the little "I"cha-no-yu"" house." CR>)>)
		 (DELAY
		  <COND (<HERE? ,FORMAL-GARDEN>
			 <MOVE ,CHIMMOKO ,HERE>
			 <TELL CR
"Chimmoko points imploringly at the tea house.  \"My mistress wishes
to see you, please, Anjin-san,\" she says in the simplified Japanese
that is all you can understand." CR>
			 <RTRUE>)>)
		 (<MOVE ,CHIMMOKO ,FORMAL-GARDEN>
		  <COND (<HERE? ,TEA-HOUSE>
			 <TELL CR
"\"Thou,\" Mariko says in Latin, the language of love." CR>)>)
		 (<MOVE ,MARIKO ,FORMAL-GARDEN>
		  <COND (<HERE? ,TEA-HOUSE>
			 <TELL CR
"Chimmoko approaches.  \"It's time, Mistress.\"|
|
\"Is everything ready?\"  Mariko asks.|
|
\"Yes, Mistress.\"|
|
\"Wait for me beside the lily pond.\"  The footsteps go away.  Mariko
turns back to you and kisses you gently.  She bows to you and goes
through the doorway." CR>)
			(<HERE? ,FORMAL-GARDEN>
			 <TELL CR
"Chimmoko enters the tea house, then re-emerges a moment
later.  Mariko follows her, and bows to you as she goes by." CR>)>)
		 (DELAY
		  <COND (<HERE? ,TEA-HOUSE> <RTRUE>)>)
		 (<MOVE ,GREEN-RIBBON ,FORMAL-GARDEN>
		  <COND (<HERE? ,FORMAL-GARDEN>
			 <TELL CR
"Mariko stops by the lily pond and undoes her obi and lets it
fall.  Chimmoko helps her out of her blue kimono.  Beneath it Mariko wears
the most brilliant white kimono and obi you have ever seen.  It is
a formal death kimono.  She
unties the green ribbon from her hair and casts it aside." CR>)>)
		 (<FCLEAR ,COURTYARD ,TOUCHBIT>
		  <MOVE ,MARIKO ,COURTYARD>
		  <MOVE ,CHIMMOKO ,COURTYARD>
		  <COND (<HERE? ,FORMAL-GARDEN ,FORECOURT ,COURTYARD>
			 <TELL CR
"Clad completely in white, Mariko walks from the garden into the courtyard,
never looking at you." CR>)>)
		 (<FCLEAR ,FORECOURT ,TOUCHBIT>
		  <MOVE ,MARIKO ,FORECOURT>
		  <MOVE ,CHIMMOKO ,FORECOURT>
		  <COND (<HERE? ,FORMAL-GARDEN ,FORECOURT ,COURTYARD>
			 <TELL CR
"Mariko walks to the gateway, where eight tatamis have been laid out in
the center of the main gate." CR>)>)
		 (<FSET ,MARIKO ,SITTING>
		  <COND (<HERE? ,FORECOURT>
			 <TELL CR
"At a sign from Sumiyori everyone bows.  Mariko bows to them.  Four samurai
come forward and spread a crimson coverlet over the tatamis.|
|
Mariko goes to the crimson square and kneels in the center, in front of
the tiny white cushion.  Her right hand brings out her stiletto dagger
from her white obi and she places it on the cushion in front of
her.  Mariko arranges the skirts of her kimono perfectly, Chimmoko helping
her, tying a small white blanket around her waist with the cord.  You
know that this is to prevent her skirts being blooded and disarranged
by her death throes." CR>)
			(<HERE? ,COURTYARD>
			 <TELL CR
"Through the crowd to the south you can see Mariko in the forecourt preparing
for her death." CR>)>)
		 (<COND (<HERE? ,FORECOURT>
			 <TELL CR
"Serene and prepared, Mariko looks up at the castle donjon.  Sun still
dominates the upper story, glittering off the golden tiles.  Rapidly
the flaming light mounts the spire.  Then it disappears.|
|
Servants are lighting flares along the avenue.  When they finish, they
flee as quickly and silently as they arrived.|
|
Mariko reaches forward and straightens the knife.  She looks through
the gateway to the far end of the avenue.  It is as still and as empty
as it had ever been." CR>)
			(<HERE? ,COURTYARD>
			 <TELL CR
"The crowd is such that you can no longer see Mariko." CR>)>)
		 (<COND (<HERE? ,FORECOURT>
			 <TELL CR
"Mariko looks once again at the knife.  She says \"Kasigi Yabu-sama!  It
seems Lord Kiyama has declined to assist me.  Please, I would be honored
if you would be my second.|
|
\"It is my honor,\" Yabu replies.  He bows, gets to his feet, and stands
behind her to her left.  His sword sings as it slides from its
scabbard.  \"I am ready, Lady,\" he says.|
|
\"Please wait until I make the second cut.\"" CR>)>)
		 (<MOVE ,ISHIDO ,FORECOURT>
		  <COND (<HERE? ,FORECOURT>
			 <MARGINAL-PIC ,P-SEPPUKU>
			 <TELL CR
"With her right hand, Mariko makes the sign of the cross, then leans
forward and takes the knife and touches it to her lips as though to
taste the polished steel.  She changes her grip and holds the knife
firmly with her right hand under the left side of her throat.|
|
Suddenly flares round the far end of the avenue.  A retinue
approaches.  Ishido is at their head.|
|
Mariko does not move the knife.  Yabu is as still as a coiled
spring.  \"Lady,\" he says, \"do you wait or are you continuing?  I wish to be
perfect for you.\"" CR>)
			(ELSE
			 <TELL CR
"You can hear a subdued whispering coming from all around." CR>)>)
		 (<COND (<HERE? ,FORECOURT>
			 <TELL CR
"\"I wait ... we ... I\"  Her hand lowers the knife.  Yabu lowers his
sword and it hisses back into his scabbard.|
|
Ishido stands at the gateway.  \"It's not sunset yet, Lady.  Are you
so keen to die?\"|
|
\"No, Lord General.  Just to obey my Lord ... \" She holds her hands
together to stop their shaking.  A rumble of anger goes through the
Browns at Ishido's arrogant rudeness." CR CR
"Ishido says loudly, \"The Lady Ochiba begged the Regents on behalf
of the Heir to make an exception in your case.  Here are permits for
you to leave at dawn tomorrow.\"  He shoves them into the hands of
Sumiyori.|
|
\"Sire?\" Mariko says, without understanding, her voice threadbare." CR CR
"\"You are free to leave.  At dawn,\" barks Ishido.|
|
\"And Kiritsubo-san and the Lady Sazuko?\"|
|
\"Isn't that also part of your 'duty?'  Their permits are there also.\"" CR CR
"Ishido addresses the others.  \"Any ladies may apply, any samurai.  I've
said before, it's stupid to leave for seventeen days, it's insulting to
flout the Heir's welcome ...\" -- his ruthless gaze goes back to Mariko --
\"or to pressure them with threats of seppuku!\"" CR>)
			(ELSE
			 <TELL CR
"You can hear a building, burgeoning noise from all around the
forecourt." CR CR
"As suddenly as it started, the noise ceases." CR>)>)
		 (<MOVE ,ISHIDO ,GENERIC-OBJECTS>
		  <COND (<HERE? ,FORECOURT>
			 <TELL CR
"Ishido turns on his heel, shouts an order to the Grays, and walks off." CR>)
			(ELSE
			 <TELL CR
"From the forecourt you can hear the sound of marching feet." CR>)>)
		 (<FSET ,MARIKO ,SCOREBIT>
		  <SETG MARIKO-WON-FLAG T>
		  <FCLEAR ,MARIKO ,SITTING>
		  <COND (<HERE? ,FORECOURT>
			 <TELL CR
"Yabu turns to Mariko.  \"Lady, it's over now.  You've ... you've won.  You've
won.\"|
|
Mariko tries to grope to her feet.  She fails.  She tries a second
time.  Again she fails.  Her hands go to the crimson again, and this time she
forces herself upright.  She wavers and almost falls, then her feet
move and slowly she totters across the crimson, reeling helplessly toward
the main door." CR>)>)
		 (<DEQUEUE I-SEPPUKU>
		  <COND (<HERE? ,FORECOURT>
			 <TELL CR
"Mariko teeters helplessly, unable to move forward any further.  There is
a hushed silence, everyone in the forecourt watching her.  She falls to
the ground." CR>)
			(ELSE
			 <TELL CR
"From the forecourt is hushed silence, as though all of Osaka is waiting
for something, and then a sigh, just barely audible though thousands of
throats make it, comes over the walls." CR>)>
		  <NEXT-SCENE>)>>

<GLOBAL MARIKO-WON-FLAG <>>

<END-SEGMENT>
