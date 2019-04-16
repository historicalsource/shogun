"CAST for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT 0>

<CONSTANT J-HEAD 1>
<CONSTANT J-KILL-MARIKO 2>
<CONSTANT J-SEPPUKU 3>
<CONSTANT J-CALL-YABU 4>
<CONSTANT J-SHOOT-YABU 5>
<CONSTANT J-ATTACK-ISHIDO 6>
<CONSTANT J-LAUGH-AT-TORANAGA 7>
<CONSTANT J-SWITCH 8>
<CONSTANT J-WRONG-ANSWER 9>

<ROUTINE NEW-SDESC (OBJ STR "OPT" (IMPROPER? <>))
	 <COND (.IMPROPER?
		<FSET .OBJ ,THE>
		<FCLEAR .OBJ ,NOTHEBIT>
		<FCLEAR .OBJ ,NOABIT>)
	       (ELSE
		<FCLEAR .OBJ ,THE>
		<FSET .OBJ ,NOTHEBIT>
		<FSET .OBJ ,NOABIT>)>
	 <PUTP .OBJ ,P?SDESC .STR>>

<ROUTINE WAKARIMASEN ()
	 <COND (<OR <P? KONNICHI-WA ROOMS>
		    <P? KONBANWA>>
		<TELL
I"\"Domo, genki desu,\"" " " THE ,WINNER " answers politely." CR>)
	       (<P? NIHON-GO-GA HANASE-MASEN>
		<TELL
CTHE ,WINNER " seems to understand, but is at a loss what to say next." CR>)
	       (<JAPANESE-VERB?>
		<TELL
CTHE ,WINNER " seems impressed that you know some Japanese, but apparently
isn't sure what you are getting at." CR>)
	       (ELSE
		<TELL
"\""I"Wakarimasen, Anjin-san.""\"  " CTHE ,WINNER " doesn't appear to
understand you." CR>)>>

<VOC "ANJIN" NOUN>
<VOC "ANJIN-SAN" NOUN>

<OBJECT BLACKTHORNE
	(LOC BRIDGE-OF-ERASMUS)
	(OWNER LG-ERASMUS)
	(DESC "Blackthorne")
	(SYNONYM JOHN BLACKTHORNE
		 PILOT PILOT-MAJOR
		 PILOT ;ANJIN PILOT-MAJOR ;ANJIN-SAN)
	(ADJECTIVE JOHN)
	(FLAGS PERSON ENGLISHBIT NOABIT NOTHEBIT OPENBIT CONTBIT SEARCHBIT)
	(HEALTH 3)	;"0=ERASMUS, 1=ANJIRO, 2=ANJIRO, 3 otherwise"
	(GENERIC GENERIC-PILOT-F)
	(ACTION BLACKTHORNE-F)>

<ROUTINE GENERIC-PILOT-F (R F)
	 <COND (<SCENE? ,S-RODRIGUES> ,RODRIGUES)
	       (ELSE ,BLACKTHORNE)>>

<ROUTINE BLACKTHORNE-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND (<P? (BE BE?) (ME BLACKTHORNE)>
		       <COND (<PRSI? BLACKTHORNE>
			      <TELL
"That's correct." CR>)
			     (<PRSI? ENGLISH>
			      <TELL
"That's right, although your mother was Dutch." CR>)>)
		      (<VERB? BE? BE WHERE HOW>
		       <RFALSE>)
		      (<PRSO? BLACKTHORNE>
		       <PERFORM ,PRSA ,ME ,PRSI>
		       <RTRUE>)>)
	       (<RARG? WINNER>
		<COND (<AND <B-NOT-STANDING?>
			    <OR <MOTION-VERB?>
				<AND <HOSTILE-VERB?>
				     ,OPPONENT
				     <EQUAL? ,OPPONENT ,PRSO ,PRSI>>
				<AND <VERB? OPEN CLOSE>
				     <FSET? ,PRSO ,DOORBIT>>>
			    <NOT <PAST-TENSE?>>>
		       <COND (<HERE? ,MURA-HOUSE> <RFALSE>)
			     (<FSET? <LOC ,WINNER> ,VEHBIT>
			      <RFALSE>)
			     (<AND <SCENE? ,S-NINJA>
				   <FSET? ,MARIKO ,RMUNGBIT>>
			      <COND (<NOT <IN? ,YABU ,SECRET-REDOUBT>>
				     <TELL
"You are too shaken to stand." CR>)
				    (ELSE
				     <B-STAND>
				     <FCLEAR ,BLACKTHORNE ,RMUNGBIT>
				     <TELL
"You lurch up, Yabu helping you, and painfully approach Mariko." CR>)>)
			     (<SCENE? ,S-TORANAGA> <RFALSE>)
			     (<AND <SCENE? ,S-QUAKE>
				   <OR ,QUAKE?
				       <QUEUED? I-CRAWL>>>
			      <RFALSE>)
			     (ELSE
			      <B-STAND>
			      <TELL "You stand up">
			      <COND (<OR <P? STAND> <P? WALK ,P?UP>>
				     <TELL "." CR>)
				    (ELSE
				     <TELL " first." CR>)>)>)
		      (<AND <FSET? ,WINNER ,RMUNGBIT>
			    <SCENE? ,S-NINJA>>
		       <COND (<GAME-VERB?> <RFALSE>)
			     (<AND <NOT <ABSTRACT-VERB?>>
				   <OR <PRSO? MARIKO>
				       <PRSI? MARIKO>>>
			      <YOULL-HAVE-TO "get closer to her">)
			     (<NOT <PASSIVE-VERB?>>
			      <TELL
"The explosion has left you too dazed to do anything." CR>)>)>)>>

<ROUTINE I-DONT-KNOW? ()
	 <AND <VERB? KNOW>
	      <EQUAL? ,PRSS ,ME>
	      <EQUAL? ,PRSQ ,V?DO?>
	      <NOT <BTST <PARSE-FLAGS ,PARSE-RESULT> ,PARSE-QUESTION>>
	      <BTST <PARSE-FLAGS ,PARSE-RESULT> ,PARSE-NOT>>>

<OBJECT BOOTS
	(OWNER BLACKTHORNE)
	(DESC "your boots")
	(FDESC "Sitting at the bottom of the steps are your boots.")
	(SYNONYM BOOTS PAIR)
	(FLAGS TAKEBIT WEARABLE PLURAL NOTHEBIT NOABIT)
	(ACTION BOOTS-F)>

<ROUTINE BOOTS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL
"They are salt-encrusted and worn." CR>)
		      (ELSE
		       <TELL
"They have been cleaned and shined." CR>)>)
	       (<VERB? LOOK-INSIDE SMELL>
		<TELL
"They are the same boots you've been wearing for two years now.  Let's
just say they aren't in perfect condition any more." CR>)
	       (<AND <VERB? TAKE-OFF>
		     <FSET? ,BOOTS ,WEARBIT>>	
		<COND (<SCENE? S-ERASMUS>
		       <TELL
"You'd be crazy to remove your boots in this weather!" CR>)>)
	       (<VERB? WEAR>
		<COND (<AND <NOT <HELD? ,PRSO>>
			    <NOT <EQUAL? <ITAKE> T>>>
		       <RTRUE>)
		      (<NOT <FSET? ,BOOTS ,WEARBIT>>
		       <FSET ,BOOTS ,WEARBIT>
		       <TELL
"You put on your boots." CR>)>)>>

<OBJECT CLOTHES
	(OWNER BLACKTHORNE)
	(DESC "your clothes")
	(SYNONYM CLOTHES)
	(ADJECTIVE ;MY PILE)
	(FLAGS TAKEBIT WEARABLE PLURAL NOTHEBIT NOABIT)
	(ACTION CLOTHES-F)>

<ROUTINE CLOTHES-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL
"They are filthy, torn, and wet." CR>)
		      (<NOT <FSET? ,CLOTHES ,TOUCHBIT>>
		       <TELL
"They are in a neat pile, washed and pressed and mended with tiny,
exquisite stitching.  But your knife is gone, and so are your
keys.  Your boots are nowhere to be found.  Worst of all, there is no sign
of your precious rutters!" CR>)>)
	       (<VERB? TAKE>
		<COND (<AND <SCENE? ,S-ANJIRO>
			    <L? <GETP ,WINNER ,P?HEALTH> 3>>
		       <QUEUE I-COLLAPSE 4>
		       <TELL
"You are still too weak to stand and go over to the clothes." CR>)>)
	       (<VERB? WEAR>
		<COND (<AND <NOT <HELD? ,PRSO>>
			    <L? <GETP ,WINNER ,P?HEALTH> 3>>
		       <PERFORM ,V?TAKE ,CLOTHES>
		       <RTRUE>)
		      (<AND <NOT <FSET? ,CLOTHES ,WEARBIT>>
			    <OR <IN? ,CLOTHES ,WINNER>
				<ITAKE>>>
		       <FSET ,CLOTHES ,WEARBIT>
		       <TELL "You ">
		       <COND (<IN? ,WINNER ,QUILT>
			      <MOVE ,WINNER ,HERE>)>
		       <COND (<B-NOT-STANDING?>
			      <B-STAND>
			      <TELL "stand shakily and ">)>
		       <TELL "put on your clothes">
		       <COND (<NOT <HELD? ,BOOTS>>
			      <TELL ", feeling strange without your boots">)>
		       <TELL "." CR>)>)
	       (<VERB? TAKE-OFF>
		<COND (<SCENE? S-ERASMUS>
		       <TELL
"You would freeze, or at least take a terrible chill." CR>)
		      (<FSET? ,BOOTS ,WEARBIT>
		       <YOULL-HAVE-TO "take off your boots">)
		      (<AND <VERB? TAKE-OFF> <FORMAL-SCENE?>>
		       <TELL
"You would expose yourself to ridicule." CR>)
		      (ELSE
		       <FCLEAR ,CLOTHES ,WEARBIT>
		       <TELL
"You remove your clothes." CR>)>)
	       (<VERB? TEAR>
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL
"You are in desperate straits, but rending your garments seems like an odd
reaction." CR>)
		      (ELSE 
		       <TELL
"Your clothes are thick, strong European fabrics and don't tear at all
easily." CR>)>)>>

<OBJECT SEBASTIO
	(SDESC "priest")
	;(DESC "Father Sebastio")
	(SYNONYM PRIEST SEBASTIO MAN FATHER JESUIT EUROPEAN)
	(ADJECTIVE FATHER TONSURED)
	(FLAGS PERSON PORTUGUESEBIT OPENBIT CONTBIT SEARCHBIT NOABIT
	 THE)
	(ACTION SEBASTIO-F)>

<ROUTINE SEBASTIO-F ("OPT" (RARG <>) "AUX" OW)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? HELP ME>
		       <TELL
"\"Ah, help!\"  he says with icy contempt.  \"Help a heretic pirate!\"" CR>)
		      (<VERB? HELLO>
		       <TELL
CTHE ,SEBASTIO " ignores your greeting." CR>)
		      (<P? FIND ;WHERE (ME THIS)>
		       <COND (,YABU-QUESTION
			      <SPEAK-ONLY-TO-YABU>)
			     (ELSE
			      <TELL
"\"The Japans, pirate.\" the priest says angrily." CR>)>)
		      (<P? BE THIS JAPAN>
		       <COND (,YABU-QUESTION
			      <SPEAK-ONLY-TO-YABU>)
			     (ELSE
			      <TELL
"\"Yes, Japan.  Nippon,\" the priest says impatiently." CR>)>)
		      (<VERB? WHO>
		       <COND (<PRSO? YOU>
			      <COND (,YABU-QUESTION <SPEAK-ONLY-TO-YABU>)
				    (ELSE
				     <NEW-SDESC ,SEBASTIO "Father Sebastio">
				     <TELL
"\"Father Sebastio.  I'm from Portugal.  I'm a Jesuit.\"" CR>)>)
			     (<AND <PRSO? ,YABU ,GLOBAL-DAIMYO>
				   <NOUN-USED? ,PRSO ,W?DAIMYO>>
			      <TELL
"\"The "I"daimyo"" is Kasigi Yabu."G" He owns this whole province.\"" CR>)
			     (<PRSO? ,OMI>
			      <COND (,YABU-QUESTION <SPEAK-ONLY-TO-YABU>)
				    (ELSE
				     <TELL "\"">
				     <COND (<NOT <FSET? ,OMI ,NOTHEBIT>>
					    <TELL
"Who told you about Kasigi Omi-san?  ">)>
				     <TELL
"Kasigi Omi-san is the samurai in charge of this village.  He is
the Lord Yabu's nephew.\"" CR>)>)
			     (<PRSO? ,MURA>
			      <COND (,YABU-QUESTION <SPEAK-ONLY-TO-YABU>)
				    (ELSE
				     <TELL
"\"He is the headman of this village.  He, at least, is a good
Christian.\"" CR>)>)
			     (ELSE
			      <TELL
G"\"I'm not here to answer your questions, pirate!\"" CR>)>)
		      (<VERB? WHAT>
		       <COND (<PRSO? YOU>
			      <PERFORM ,V?WHO ,YOU>
			      <RTRUE>)
			     (<PRSO? ,GLOBAL-DAIMYO ,YABU>
			      <COND (<NOUN-USED? ,PRSO ,W?DAIMYO>
				     <TELL
"\"The "I"daimyo"" is a feudal lord."G" He owns this whole province.\"" CR>)
				    (ELSE
				     <TELL
"\"Who told you about " D ,YABU "?\"" CR>)>)
			     (<PRSO? ,GLOBAL-SAMURAI>
			      <TELL
"\"Warriors -- soldiers -- members of the warrior caste.\"" CR>)
			     (ELSE
			      <TELL
G"\"I'm not here to answer your questions, pirate!\"" CR>)>)
		      (,OMI-QUESTION
		       <SET OW ,WINNER>
		       <SETG WINNER ,OMI>
		       <PERFORM ,PRSA ,PRSO ,PRSI>
		       <SETG WINNER .OW>
		       <RTRUE>)
		      (,YABU-QUESTION
		       <COND (<VERB? TRANSLATE>
			      <TELL
"You harden your voice.  \""I"Que va!""  First translate what I
said.  Now!\"  The priest reddens, and you see that the exchange has not gone
unnoticed by the "I"daimyo""." CR>)
			     (ELSE
			      <SET OW ,WINNER>
			      <SETG WINNER ,YABU>
			      <PERFORM ,PRSA ,PRSO ,PRSI>
			      <SETG WINNER .OW>
			      <RTRUE>)>)
		      (<VERB? TRANSLATE>
		       <TELL
"\"It's not your place to command me, heretic!\"" CR>)
		      (<P? BE ME>
		       <COND (<AND <PRSI? ,HERETIC ,PIRATE>
				   <P-NEGATIVE?>>
			      <TELL
"\"Liar!\" storms the priest." CR>)
			     (<PRSI? ,BLACKTHORNE>
			      <TELL
"He doesn't seem to have heard of you before." CR>)
			     (ELSE
			      <TELL
"\"I'll know who and what you are soon enough!\"" CR>)>)
		      (ELSE
		       <TELL
CTHE ,SEBASTIO " looks at you with contempt." CR>)>)
	       (<VERB? EXAMINE>
		<TELL
CTHE ,SEBASTIO " is a short, thick man with dark hair and a long
beard.  His robe is travel-stained and his boots are besmirched with
mud.  He is
obviously a Portuguese or Spanish priest, and though his flowing robe is
orange, there is no mistaking the ">
		<COND (<IN? ,SEBASTIO-CRUCIFIX ,PRSO>
		       <TELL "crucifix and ">)>
		<TELL "rosary at his
belt, or the cold hostility on his face." CR>)
	       (<AND <P? TELL-ABOUT SEBASTIO STRAIT-OF-MAGELLAN>
		     <EQUAL? ,YABU-QUESTION 4>>
		<PERFORM ,PRSA ,YABU ,PRSI>
		<RTRUE>)
	       (<VERB? ANSWER REPLY>
		<TELL
"\"That's no response, pirate!\" rages " THE ,SEBASTIO "." CR>)
	       (<VERB? BOW>
		<TELL
"\"You learn fast, pirate!\" he says, surprised, but he doesn't return
your bow." CR>)
	       (<P? THROW SEBASTIO-CRUCIFIX SEBASTIO>
		<RFALSE>)
	       (<HOSTILE-VERB?>
		<TELL "You ">
		<COND (<B-NOT-STANDING?>
		       <B-STAND>
		       <TELL "storm to your feet, ">)>
		<COND (<VERB? THROW>
		       <MOVE ,PRSO ,HERE>
		       <TELL "throw " THE ,PRSO " at">)
		      (<VERB? SPIT>
		       <TELL "spit at">)
		      (<VERB? KICK>
		       <TELL "kick">)
		      (<VERB? PISS>
		       <TELL "piss on">)
		      (ELSE
		       <TELL "strike">)>
		<TELL " " THE ,SEBASTIO ", and he curses at you
but turns the other cheek." CR>
		<COND (<AND <IN? ,OMI ,HERE> <IN? ,YABU ,HERE>>
		       <QUEUE I-BOW? 2>
		       <TELL CR
"Omi and Yabu look at each other in surprise." CR>)>
		<RTRUE>)>>

<OBJECT OMI
	;(SDESC "Omi")
	(SDESC "young man")
	(SYNONYM MAN OMI OMI-SAN SAMURAI)
	(ADJECTIVE YOUNG KASIGI)
	(PICTURE P-OMI)
	(FLAGS PERSON JAPANESEBIT SCOREBIT THE ;NOTHEBIT)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION OMI-F)>

<ROUTINE OMI-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<OR <VERB? PISS CURSE FUCK>
			   <AND <VERB? NO IYE>
				<QUEUED? I-TAKE-CROOCQ>>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?CURSE ,OMI>
		       <RTRUE>)
		      (<OR <QUESTION-VERB?>
			   <VERB? ASK-ABOUT TELL-ME-ABOUT>>
		       <TELL
CTHE ,SEBASTIO " snaps, \"You're to answer questions, not ask
them.\"  He says something to the samurai, who scowls." CR>)
		      (<AND ,OMI-QUESTION
			    <I-DONT-KNOW?>>
		       <TELL
"\"Liar!\" screams " THE ,SEBASTIO ".  \"They use torture here.  They can
find out anything!\"" CR>)
		      (<AND <EQUAL? ,OMI-QUESTION 1>
			    <P? BE (ME BLACKTHORNE)> ,PRSI>
		       <COND (<AND <OR <ENGLISH?> <DUTCH?>>
				   <NOT <P-NEGATIVE?>>>
			      <SETG QCONTEXT <>>
			      <SETG OMI-QUESTION 0>
			      <TELL CTHE ,SEBASTIO>
			      <COND (<ENGLISH?>
				     <TELL
" steps back as though struck.  \"English!  England">)
				    (ELSE
				     <TELL
" nods suspiciously.  \"Dutch!  Holland">)>
			      <TELL
"!\"He begins to explain to Omi but the samurai cuts him short." CR>)
			     (ELSE
			      <SETUP-ANSWER "i am">
			      <SEBASTIO-SCREAMS>
			      <COND (<PRSI? ,BLACKTHORNE>
				     <TELL
"I want to know your nationality, not your name, heretic!\"" CR>)
				    (ELSE
				     <TELL
"I know you aren't what you say you are!\"" CR>)>)>)
		      (<AND <EQUAL? ,OMI-QUESTION 2>
			    <OR <P? BE (BLACKTHORNE ME) INTPP>
				<P? COME-FROM>>>
		       <COND (<OR <P? COME-FROM HOLLAND>
				  <PP? ,W?FROM ,HOLLAND>>
			      <SETG QCONTEXT <>>
			      <SETG OMI-QUESTION 0>
			      <TELL
CTHE ,SEBASTIO "'s anger is obvious.  \"A Dutch pirate ship!\" he
gasps.  He says something haltingly to Omi-san." CR>)
			     (ELSE
			      <SEBASTIO-SCREAMS>
			      <TELL "That's a
Dutch pirate ship!  Admit you're a heretic, murdering Dutchman!\"" CR>)>)
		      (<AND <EQUAL? ,OMI-QUESTION 3>
			    <VERB? YES NO IYE BE HAI>>
		       <COND (<OR <VERB? YES HAI>
				  <AND <P? BE (BLACKTHORNE ME) LEADER>
				       <NOT <P-NEGATIVE?>>>>
			      <SETG QCONTEXT <>>
			      <SETG OMI-QUESTION 0>
			      <SETG ORPHAN-ANSWER <>>
			      <TELL CTHE ,SEBASTIO>
			      <COND (<VERB? HAI>
				     <TELL
" looks surprised at your knowledge of Japanese, and
speaks rapidly and excitedly to Omi." CR>)
				    (ELSE
				     <TELL
" translates for Omi, still digesting what you have
told him." CR>)>
			      <SCORE-OBJECT ,OMI>)
			     (ELSE
			      <SETUP-ANSWER "i am">
			      <TELL
CTHE ,SEBASTIO " screams, \"Coward, I know you're the leader!  The
villagers have already told me so!\"" CR>)>)
		      (,OMI-QUESTION
		       <COND (<VERB? SAY REPLY>
			      <PERFORM ,V?BE ,ME ,PRSO>
			      <RTRUE>)
			     (ELSE
			      <TELL
CTHE ,OMI " doesn't respond, but the priest says, \"You'd better learn to be
polite -- and find some manners quickly.  Here they don't tolerate lack
of manners.\"  His voice edges.  \"Hurry up and answer!\"" CR>)>)
		      (<AND <VERB? STOP>
			    <NOT ,ANSWER-HAI?>
			    <HERE? ,VILLAGE-SQUARE>
			    <QUEUED? I-TAKE-CROOCQ>>
		       <SETG QCONTEXT ,OMI>
		       <TELL
"\"Omi-san says, you agree to behave?  You will obey all orders?\"" CR>)
		      (<AND <VERB? HAI YES>
			    <NOT ,ANSWER-HAI?>
			    <HERE? ,VILLAGE-SQUARE>
			    <QUEUED? I-TAKE-CROOCQ>>
		       <COND (<VERB? YES>
			      <TELL
"\"You must speak to him in Japanese, heretic!  You must say 'hai.'\"  "
D ,SEBASTIO " is sweating and nervous." CR>)
			     (ELSE
			      <SETG ANSWER-HAI? T>
			      <SETG DELAY-CNT 0>
			      <THIS-IS-IT ,ORDERS>
			      <TELL
"\"Omi-san says, lie down.  Immediately.\"" CR>
			      <SCORE-OBJECT ,VILLAGE-SQUARE>)>)
		      (ELSE
		       <TELL
CTHE ,OMI " ignores you, for now." CR>)>)
	       (<VERB? EXAMINE>
		<TELL
"The young man is a head shorter and much younger than you, his
handsome face slightly pockmarked though.  He wears breeches and clogs
and a light kimono with two scabbarded swords stuck into the belt.  One
is daggerlike, the other, a two-handed killing sword, is long and
slightly curved." CR>)
	       (<VERB? WHO>
		<TELL
CTHE ,OMI " is an ambitious young man.  He serves his masters well, but
himself better." CR>)
	       (<VERB? THANK>
		<COND (<IN? ,SEBASTIO ,HERE>
		       <TELL
CTHE ,SEBASTIO " translates.  Omi seems pleased by your politeness." CR>)
		      (ELSE
		       <TELL
"Omi responds with a curt bow, and says \"Domo.\"" CR>)>)
	       (<OR <VERB? PISS CURSE FUCK>
		    <AND <OR <VERB? NO IYE> <HOSTILE-VERB?>>
			 <QUEUED? I-TAKE-CROOCQ>>>
		<COND (<SCENE? S-PIT>
		       <COND (<NOT ,PISS-FLAG>
			      <SETG PISS-FLAG T>
			      <TELL
"You lose your composure.  \"Tell him to go to hell.  Tell him I piss on
him and his whole country.  Tell him exactly what I said!  Exactly, by
God!\" you yell at the priest.  Omi listens, then the knuckles on his
sword hand whiten.  You can see he is trying not to give way to his
emotions." CR>)
			     (ELSE
			      <TELL
"You continue to scream abuse at Omi." CR>)>)>)
	       (<OR <HOSTILE-VERB?> <VERB? STOP>>
		<REMOVES-YOUR-HEAD ,OMI>)>>

<ROUTINE SEBASTIO-SCREAMS ()
	 <TELL
CTHE ,SEBASTIO " screams, \"Lying pig of a heretic!  ">>

<ROUTINE REMOVES-YOUR-HEAD (WHO)
	 <COND (<JIGS-UP? ,J-HEAD>
		<TELL
CTHE .WHO " responds to your feeble attack by removing your head." CR>
		<JIGS-UP>)
	       (ELSE <RTRUE>)>>

<OBJECT MURA
	(LOC GENERIC-OBJECTS)
	(DESC "Mura")
	(SYNONYM MURA HEADMAN MAN)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT OPENBIT CONTBIT SEARCHBIT)
	(GENERIC GENERIC-MAN-F)
	(ACTION MURA-F)>

<ROUTINE GENERIC-MAN-F (R F)
	 <TELL "You'll have to be more specific." CR>
	 ,ROOMS ;"means 'handled'">

<ROUTINE MURA-F ("OPT" (RARG <>))
	 <COND ;(<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<AND <VERB? TAKE>
			    <IN? ,PRSO ,PLAYER>
			    <NOT <FSET? ,PRSO ,WEARBIT>>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?GIVE ,PRSO ,MURA>)
		      (<AND <VERB? NO IYE>
			    <EQUAL? ,QCONTEXT ,MURA>
			    <SCENE? ,S-RODRIGUES>>
		       <TELL
"Mura replies in halting Portuguese, \"So sorry, Anjin-san, you must
go.\"" CR>)
		      (<P? (TELL-ME-ABOUT FIND) ONNA>
		       <NEW-SDESC ,ONNA "Haku">
		       <REPLACE-SYNONYM ,ONNA ,W?ONNA ,W?HAKU>
		       <TELL
"\"Where's Onna?\" you ask. \"I want Onna!\"  Mura replies in heavily-accented
Portuguese, \""I"Onna"" mean 'woman.'  Her name Haku.\"" CR>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"Mura is a short, wiry, middle-aged man.  You realize there's more
to him than the simple fisherman he appears to be." CR>)
		      (<AND <P? GIVE * MURA>
			    <HERE? ,BATH-HOUSE>
			    <NOT <FSET? ,PRSO ,WEARBIT>>>
		       <MOVE ,PRSO ,MURA>
		       <TELL
"Mura takes " THE ,PRSO "." CR>)
		      (<VERB? ATTACK HIT>
		       <TELL
"Mura is unarmed, but the moment you get within reach, he chops your
elbow with the side of his hand and your arm hangs down, momentarily
paralyzed.  \"Please excuse me, Captain-san,\" he says in very
bad Portuguese." CR>)
		      (<VERB? WHO>
		       <TELL
"Mura is the headman of the village of Anjiro." CR>)>)>>

<OBJECT MARIKO
	;(DESC "Mariko")
	(SDESC "Mariko")
	(PICTURE P-MARIKO)
	(SYNONYM MARIKO TODA WOMAN)
	(ADJECTIVE LADY TODA)
	(FLAGS PERSON JAPANESEBIT FEMALE NOABIT NOTHEBIT
	 OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(DESCFCN MARIKO-DESC)
	(ACTION MARIKO-F)>

<ROUTINE MARIKO-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<AND <SCENE? ,S-SEPPUKU>
			    <HERE? ,TEA-HOUSE ,FORECOURT>>
		       <RTRUE>)
		      (<AND <SCENE? ,S-NINJA>
			    <OR <FSET? ,MARIKO ,DEAD>
				<FSET? ,MARIKO ,RMUNGBIT>>>
		       <RTRUE>)>)
	       (<RARG? OBJDESC>
		<TELL "Mariko ">
		<COND (<HERE? ,TEA-HOUSE>
		       <TELL
"kneels here, facing the doorway.">)
		      (<HERE? ,FORECOURT>
		       <COND (<FSET? ,MARIKO ,SITTING>
			      <TELL
"kneels serenely in the center of the crimson coverlet.">)
			     (ELSE
			      <TELL
"is standing in the center of the main gate.">)>)
		      (<SCENE? ,S-NINJA>
		       <TELL "lies ">
		       <COND (<FSET? ,MARIKO ,DEAD>
			      <TELL "dead">)
			     (ELSE
			      <TELL "dying">)>
		       <TELL " on the floor.">)>)>>

<ROUTINE MARIKO-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<OR <FSET? ,MARIKO ,DEAD>
			   <FSET? ,MARIKO ,RMUNGBIT>>
		       <TELL
"Mariko can no longer respond." CR>)
		      (<P? (WHO TELL-ME-ABOUT) (YOU MARIKO)>
		       <TELL
"\"I am Lady Toda Mariko-noh-Buntaro.  The priests know me as Lady Maria,
as I am Christian.\"" CR>)
		      (<P? (WHAT TELL-ME-ABOUT) PROPHECY>
		       <COND (<HERE? ,MAPLE-GLADE>
			      <TELL
"Mariko asks permission of Toranaga, who nods.  ">)>
		       <TELL
"\"Six years ago a Chinese embassy came to the Taiko to try to settle the
Japanese-Chinese-Korean war.  A famous astrologer was among them.  He forecast
many things which have since come true.  The Taiko asked him to predict the
deaths of certain of his counselors.  The astrologer said that Toranaga would
die by the sword when he was middle-aged.  Ishido, the famous conqueror of
Korea, would die undiseased, an old man, his feet firm in the earth, the
most famous man of his day.  The Taiko himself would die in his bed, respected,
revered, of old age, leaving a healthy son to follow him.  At this time Yaemon
had not yet been born, so that part of the prophecy has already come to
pass.\"" CR>
		       <SCORE-OBJECT ,PROPHECY>)
		      (<SCENE? ,S-MARIKO>
		       <COND (<OR <P? KONNICHI-WA ROOMS>
				  <P? NIHON-GO-GA HANASE-MASEN>>
			      <COND (<FSET? ,MAPLE-GLADE ,SCOREBIT>
				     <SETG WINNER ,PLAYER>
				     <PERFORM ,V?KONNICHI-WA ,MARIKO>
				     <RTRUE>)>)
			     (<AND <EQUAL? ,QCONTEXT ,MARIKO>
				   <VERB? LEARN TRAIN TEACH>
				   <PAST-TENSE?>>
			      <COND (<OR <AND <EQUAL? ,PRSS ,DOMINGO>
					      <PRSO? ME>>
					 <PRSO? PRISON DOMINGO>>
				     <HOW-I-LEARNED>)
				    (ELSE
				     <TELL
"She doesn't seem to believe you." CR>)>)
			     (<P? TEACH ME JAPANESE>
			      <TELL
"\"If my master wishes,\" she answers, turning to Toranaga.  They converse
for a while.  \"My Master says that only a few bar -- foreigners have been
able to learn our language, and these are all priests.  But he would like to
be able to talk to you directly, without the need for an interpreter.  He will
consider this request.\"" CR>)
			     (<P? (WHO TELL-ME-ABOUT) YAEMON>
			      <NEW-SDESC ,YAEMON "Yaemon">
			      <TELL
"\"This is the Heir, the only son of the Taiko.  His name is Yaemon.\"" CR>)
			     (<P? (WHO TELL-ME-ABOUT) (YOU MARIKO)>
			      <TELL
"\"My name is Toda Mariko noh-Buntaro.  I am a 'senhora,' not a 'senhorita,'
if you please.\"" CR>)
			     (<OR <QUESTION-VERB?>
				  <VERB? ASK-ABOUT TELL-ME-ABOUT>>
			      <TELL
"\"Lord Toranaga has instructed me to say that ">
			      <COND (<EQUAL? ,LG-CREWMEN ,PRSO ,PRSI>
				     <TELL
"your crewmen are being treated well.  They will given a place to live, and
to learn to be civilized.\"" CR>)
				    (ELSE
				     <TELL
"you will please confine yourself
to answering questions only, for the moment.\"  Then she says, \"I'm sure, if
you are patient, Pilot-Captain B'ackthon, that you'll be given an opportunity
to ask anything you wish later.\"" CR>)>)
			     (<JAPANESE-VERB?>
			      <TELL
"\"If you will excuse me, senhor, my Master orders me to say your accent is a
little wrong.\"  She repeats the word several times slowly, showing you how to
say it." CR>)
			     (ELSE
			      <I-DONT-UNDERSTAND>)>)
		      (<VERB? THOU>
		       <I-LOVE-YOU>)
		      (<VERB? TELL-ME-ABOUT>
		       <COND (<PRSO? ,SUICIDE>
			      <TELL
"\"If the shame is too great, or if our liege Lord commands, we
take our lives.  I have been trained to do so, as have all samurai.\"" CR>
			      <RTRUE>)
			     (<PRSO? ,KIYAMA>
			      <TELL
"\"Lord Kiyama is a member of the Council of Regents, and the most powerful
of the Christian daimyos.\"" CR>)
			     (<SCENE? ,S-NINJA>
			      <COND (<PRSO? ,YABU>
				     <TELL
"\"He is very angry with me for confronting Lord Ishido, and even
angrier that I did not go through with my seppuku, but that was my
"I"karma"", Anjin-san.\"" CR>
				     <RTRUE>)
				    (<PRSO? ,ACHIKO>
				     <TELL
"\"Her grandfather-in-law, Lord Kiyama, opposes Lord Toranaga.  He has
disowned her for her presumption in joining us.\"" CR>
				     <RTRUE>)>)>
		       <TELL
"\"I cannot tell you