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

<ROUTINE YABU-WAKARIMASEN ()
	 <TELL
"\""I"Wakarimasen, Anjin-san"",\" Yabu replies gruffly." CR>>

<ROUTINE WAKARIMASEN ()
	 <COND (<OR <P? KONNICHI-WA ROOMS>
		    <P? KONBANWA>>
		<TELL
"\""I"Domo, genki desu"",\" " THE ,WINNER " answers politely." CR>)
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
				<VERB? STAND>
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

<OBJECT KIMONO
	(OWNER BLACKTHORNE)
	(DESC "kimono")
	(SYNONYM KIMONO CLOTHES)
	(ADJECTIVE SILK)
	(FLAGS TAKEBIT WEARABLE)
	(ACTION KIMONO-F)>

<ROUTINE KIMONO-F ()
	 <COND (<AND <VERB? TAKE-OFF> <FORMAL-SCENE?>>
		<TELL
"You would expose yourself to ridicule." CR>)
	       (<AND <VERB? WEAR>
		     <NOUN-USED? ,PRSO ,W?CLOTHES>
		     <NOT <FSET? ,PRSO ,RMUNGBIT>>>
		<PERFORM ,V?DRESS>
		<RTRUE>)
	       (<AND <VERB? TAKE-OFF>
		     <NOUN-USED? ,PRSO ,W?CLOTHES>
		     <NOT <FSET? ,PRSO ,RMUNGBIT>>>
		<PERFORM ,V?STRIP>
		<RTRUE>)
	       (<VERB? TEAR>
		<TELL
"Your kimono would tear easily, but it would be silly to do so." CR>)>>

<OBJECT SANDALS
	(OWNER BLACKTHORNE)
	(DESC "pair of sandals")
	(SYNONYM SANDALS SLIPPERS THONG THONGS)
	(FLAGS TAKEBIT WEARABLE PLURAL)>

<OBJECT SOCKS
	(OWNER BLACKTHORNE)
	(DESC "socks")
	(SYNONYM SOCKS TABIS)
	(ADJECTIVE TABI)
	(FLAGS TAKEBIT WEARABLE PLURAL NOABIT)
	(ACTION SOCKS-F)>

<ROUTINE SOCKS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"These are tabi socks.  They are different from European socks in that
there is a notch for the thong of a sandal.  They remind you of mittens." CR>)
	       (<AND <VERB? TAKE-OFF WEAR>
		     <FSET? ,SANDALS ,WEARBIT>>
		<HAVE-TO-TAKE-OFF ,SANDALS>)>>

<OBJECT SWORDS
	(OWNER BLACKTHORNE)
	(DESC "swords")
	(SYNONYM SWORDS SWORD SELLER)
	(ADJECTIVE PAIR KILLING STABBING OIL LONG SHORT)
	(FLAGS TAKEBIT WEARABLE WEAPONBIT NOABIT SCOREBIT PLURAL)
	(GENERIC GENERIC-SWORD-F)
	(ACTION SWORDS-F)>

<ROUTINE SWORDS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,SWORDS ,RMUNGBIT>
		       <FCLEAR ,SWORDS ,RMUNGBIT>
		       <FSET ,SWORDS ,SCOREBIT>
		       <SCORE-OBJECT ,SWORDS>
		       <TELL
"You quickly check your sword belt.  It's loose, almost ready to fall
off!  What a stroke of luck you checked it!  How embarrassing if it had
fallen off!" CR>)
		      (ELSE
		       <TELL
"You have a pair of samurai swords, one the long killing sword">
		       <COND (<G? ,SCENE ,S-QUAKE>
			      <TELL
" named 'Oil Seller'">)>
		       <TELL ", and
the other the shorter stabbing sword." CR>)>)
	       (<AND <VERB? WHO WHAT>
		     <NOUN-USED? ,PRSO ,W?SELLER>>
		<TELL
"The name comes from an experience you would rather forget.  One day
hunting with Toranaga, your path had been blocked by a weather-beaten
old oil
seller.  Cursing, you commanded him to move, and he cursed you
back.  Toranaga pointed to one of his bodyguards, asked you to give him
your sword, and before you realized what was happening, the samurai
lunged at the peddler.  He walked on a pace before falling, divided
in two at the waist.  Toranaga suggested you call your sword 'Oil
Seller' in honor of the incident.  \"Your sword has now become legend.\"" CR>)
	       (<VERB? WEAR>
		<COND (<NOT <FSET? ,PRSO ,WEARBIT>>
		       <FSET ,PRSO ,WEARBIT>
		       <TELL
"You shove the sword into your sash." CR>)
		      (ELSE
		       <TELL "The sword is already in your sash." CR>)>)
	       (<AND <VERB? TAKE>
		     <NOT <HELD? ,PRSO>>>
		<COND (<EQUAL? <ITAKE> T>
		       <FSET ,SWORDS ,WEARBIT>
		       <TELL
"You take the sword and shove it into your sash." CR>)
		      (ELSE <RTRUE>)>)
	       (<OR <AND <VERB? DRAW PICK USE TAKE>
			 <HELD? ,PRSO>>
		    <P? PUT * HANDS>>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <FCLEAR ,PRSO ,WEARBIT>
		       <TELL
"Your skill with the sword is not great, but you are now as ready as
you will ever be!" CR>)
		      (ELSE
		       <TELL "You've already drawn your sword." CR>)>)>>

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

<CONSTANT OMI-NAME "Omi">

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
		       <CURSE-OMI>)>)
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
	 <COND ;(<GLOBAL-IN? ,LG-MEN ,HERE>
		,LG-MEN)
	       (ELSE
		<TELL "You'll have to be more specific." CR>
		,ROOMS ;"means 'handled'")>>

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

<OBJECT BROWNS
	(DESC "Brown-uniformed samurai")
	(SYNONYM BROWNS BROWN SAMURAI)
	(ADJECTIVE BROWNS BROWN BROWN-UNIFORMED)
	(FLAGS PERSON JAPANESEBIT NOABIT)
	(COUNT 20)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION BROWNS-F)>

<ROUTINE BROWNS-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<AND <HERE? ,MAIN-DECK-2>
			    <SCENE? ,S-ESCAPE>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?MIZU>
		       <RTRUE>)
		      (ELSE
		<TELL
"The Browns are not under your orders." CR>)>
		<END-QUOTE>)
	       (ELSE
		<COND (<VERB? WHO>
		       <TELL
"The Browns are Toranaga's samurai." CR>)
		      (<VERB? EXAMINE>
		       <TELL
"They are all dressed in the Brown uniform." CR>)>)>>

<OBJECT GRAYS
	(DESC "Gray-uniformed samurai")
	(SYNONYM GRAYS GRAY SAMURAI ESCORT GUARDS GUARDSMEN)
	(ADJECTIVE GRAY GRAY-UNIFORMED)
	(FLAGS PERSON JAPANESEBIT NOABIT)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION GRAYS-F)>

<ROUTINE GRAYS-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
"The Grays ignore you." CR>
		<END-QUOTE>)
	       (ELSE
		<COND (<VERB? WHO>
		       <TELL
"The Grays are Ishido's samurai." CR>)
		      (<VERB? EXAMINE>
		       <COND (<SCENE? ,S-PRISON>
			      <TELL
"They are behaving more like escorts than guards." CR>)
			     (ELSE
			      <TELL
"They are all dressed in the Gray uniform." CR>)>)>)>>

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
"\"I cannot tell you anything more, Anjin-san.  So sorry.\"" CR>)
		      (<VERB? STOP KINJIRU>
		       <COND (<SCENE? ,S-SEPPUKU>
			      <COND (,MARIKO-WON-FLAG
				     <TELL
"She doesn't respond, or even notice you.  She's almost in a trance." CR>)
				    (ELSE
				     <TELL
"\"No, Anjin-san.  I must obey the orders of Lord Toranaga.  If I cannot,
I must commit "I"seppuku"" to expunge the shame.  Only if Lord Ishido
relents and allows me to obey my liege-lord may I stop.\"" CR>)>)
			     (ELSE
			      <I-DONT-UNDERSTAND>)>)
		      (<P? FIND ;WHERE SECRET-ROOM-DOOR>
		       <TELL
"\"I don't know about any secret doors,\" she says, puzzled." CR>)
		      (<P? FIND ;WHERE SECRET-REDOUBT-DOOR>
		       <TELL
"\"It's in my room, Anjin-san!\"" CR>)
		      (<OR <VERB? FOLLOW LEAVE ISOGI>
			   <P? WALK (P?EAST P?NORTH P?OUT)>>
		       <COND (<SCENE? ,S-NINJA>
			      <MARIKO-FOLLOW-ME>)
			     (ELSE
			      <I-DONT-UNDERSTAND>)>)
		      (<VERB? LOVE THOU>
		       <I-LOVE-YOU>)
		      (<VERB? YES HAI>
		       <COND (<HERE? ,WAREHOUSE>
			      <SETG QCONTEXT <>>
			      <MOVE ,LARGE-KNIFE ,BLACKTHORNE>
			      <MOVE ,SMALL-KNIFE ,BLACKTHORNE>
			      <TELL
"\"Good!\" she responds.  She turns to Toranaga.  \"My Master says you should
be armed.\"  She hands you a knife.  \"Better, give me two,\" you respond, and
Toranaga agrees.  You slide the large one into your sash and tie the small
one, haft
downwards, to your forearm.  \"My Master asks, do all Englishmen carry knives
secretly in their sleeves like that?\"|
|
\"No, but most seamen do.\"  Now you are ready.  Mariko stares at the wharf,
then commits herself.|
|
\"Follow me!\"" CR>)
			     (<AND <HERE? ,WHARF ,MAIN-DECK-2>
				   <EQUAL? ,QCONTEXT ,MARIKO>>
			      <SETG QCONTEXT <>>
			      <TELL
"\"That is good,\" she replies." CR>)
			     (<AND <HERE? ,PRIVATE-QUARTERS>
				   ,MARIKO-PLAN?
				   <EQUAL? ,QCONTEXT ,MARIKO>>
			      <SETG MARIKO-PLAN? <+ ,MARIKO-PLAN? 1>>
			      <COND (<EQUAL? ,MARIKO-PLAN? 2>
				     <SETG QCONTEXT ,MARIKO>
				     <THIS-IS-IT ,YABU>
				     <TELL
"\"Do you think he plans to betray us?\"" CR>)
				    (<G? ,MARIKO-PLAN? 2>
				     <SETG QCONTEXT <>>
				     <COND (<FSET? ,CELLARS ,SCOREBIT>
					    <TELL
G"\"Perhaps you were mistaken.  We're safe now.\"" CR>)
					   (ELSE
					    <TELL
G"\"Yabu has betrayed us, then.  When this is over, Lord Toranaga must
be told!\"" CR>)>)>)>)
		      (<VERB? NO IYE>
		       <COND (<HERE? ,WAREHOUSE>
			      <TELL
"\"If I am in danger, it is no matter, I am samurai.\"" CR>)
			     (<AND <HERE? ,WHARF ,MAIN-DECK-2>
				   <EQUAL? ,QCONTEXT ,MARIKO>>
			      <SETG QCONTEXT <>>
			      <TELL
"\"Then the danger is greater, but we must continue,\" she replies." CR>)
			     (<AND <HERE? ,PRIVATE-QUARTERS>
				   ,MARIKO-PLAN?
				   <EQUAL? ,QCONTEXT ,MARIKO>>
			      <SETG MARIKO-PLAN? <+ ,MARIKO-PLAN? 1>>
			      <COND (<EQUAL? ,MARIKO-PLAN? 2>
				     <SETG QCONTEXT ,MARIKO>
				     <TELL
G"\"But do you still think he plans to betray us?\"" CR>)
				    (<G? ,MARIKO-PLAN? 2>
				     <SETG QCONTEXT <>>
				     <TELL "\"We're safe now.\"" CR>)>)>)
		      (<AND <VERB? WALK CLIMB-UP CLIMB-FOO>
			    <IN? ,MARIKO ,SIDE-FISSURE>>
		       <TELL
"\"I can't make it, Anjin-san!  I'm sliding!\"" CR>)
		      (<AND <OR <P? HOLD-ON (ROOMS ME)>
				<P? (TAKE REACH-FOR) ME>>
			    <IN? ,MARIKO ,SIDE-FISSURE>>
		       <COND (<IN? ,PLAYER ,SIDE-FISSURE>
			      <TELL
"\"I'm trying, Anjin-san, but the mud is slippery!\"" CR>)
			     (ELSE
			      <TELL
"\"I can't reach you, Anjin-san!\"" CR>)>)
		      (<P? BATHE ME>
		       <COND (<SCENE? ,S-JOURNEY>
			      <COND (<IN? ,BLACKTHORNE ,YOKOSE-BATHTUB>
				     <SETG WINNER ,BLACKTHORNE>
				     <PERFORM ,V?BATHE ,ME>
				     <RTRUE>)
				    (ELSE
				     <TELL
"\"You aren't in the tub yet, Anjin-san!\"" CR>)>)
			     (ELSE
			      <TELL
"\"While you may need a bath, Anjin-san, there are no facilities!\"" CR>)>)
		      (<P? BETRAY YABU>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?TELL-ABOUT ,MARIKO ,YABU>
		       <RTRUE>)
		      (ELSE
		       <I-DONT-UNDERSTAND>)>)
	       (<VERB? EXAMINE>
		<COND (<AND <SCENE? ,S-SEPPUKU>
			    <HERE? ,TEA-HOUSE>>
		       <SEPPUKU-EXAMINE-MARIKO>)
		      (<SCENE? ,S-NINJA>
		       <EXAMINE-MARIKO>)
		      (ELSE
		       <TELL
G"You have never seen anyone so petite.  You feel you could pick her up
with one hand"" and if you put both hands around her waist, your fingers
would touch.  She wears no jewelry of any kind, except silver pins in
her hair." CR>)>)
	       (<VERB? WHO>
		<TELL
"Lady Toda Mariko is the wife of Buntaro.  She speaks fluent Portuguese
and Latin, and is a Christian." CR>)
	       (<P? BE YABU TRAITOR>
		<PERFORM ,V?TELL-ABOUT ,MARIKO ,YABU>
		<RTRUE>)
	       (<VERB? BLESS>
		<COND (<FSET? ,MARIKO ,RMUNGBIT>
		       <TELL
"You make the sign of the cross over her and say the sacred Latin
words that are necessary, though no sound comes from your mouth.  The
others watch you.  When you are done, you fight to your feet
again and stand upright." CR>
		       <SCORE-OBJECT ,MARIKO>)>)
	       (<VERB? WALK-TO>
		<COND (<AND <FSET? ,MARIKO ,RMUNGBIT>
			    <B-NOT-STANDING?>>
		       <B-STAND>
		       <TELL
"Painfully you drag yourself closer to her." CR>)>)
	       (<AND <VERB? RUB> <FSET? ,MARIKO ,RMUNGBIT>>
		<PERFORM ,V?EXAMINE ,MARIKO>
		<RTRUE>)
	       (<VERB? HELP STOP>
		<COND (<SCENE? ,S-SEPPUKU ,S-NINJA ,S-QUAKE>
		       <PERFORM ,V?TAKE ,MARIKO>
		       <RTRUE>)>)
	       (<P? TAKE MARIKO>
		<COND (<SCENE? ,S-NINJA>
		       <NINJA-TAKE-MARIKO>)
		      (<SCENE? ,S-SEPPUKU>
		       <SEPPUKU-TAKE-MARIKO>)>)
	       (<AND <SCENE? ,S-SEPPUKU>
		     <HERE? ,FORECOURT>
		     <NOT ,MARIKO-WON-FLAG>>
		<COND (<OR <NOT <PASSIVE-VERB?>>
			   <SPEAKING-VERB?>
			   <JAPANESE-VERB?>>
		       <COND (<VERB? TELL> <END-QUOTE>)>
		       <COND (<JIGS-UP? ,J-SEPPUKU
"You reconsider.  You would both die if you interrupted the ceremony.">
			      <TELL "You interrupt the ceremony.">
			      <INTERRUPTED-SEPPUKU>)
			     (ELSE <RTRUE>)>)
		      (<VERB? BOW>
		       <TELL
"You bow to Mariko in respect for her courage." CR>)>)
	       (<VERB? KISS FUCK LOVE>
		<COND (<OR <FSET? ,MARIKO ,DEAD>
			   <FSET? ,MARIKO ,RMUNGBIT>>
		       <TELL
"You kiss her lightly on the lips." CR>)
		      (<HERE? ,TEA-HOUSE>
		       <TELL
"Mariko kisses you lightly and sadly." CR>)
		      (<L=? ,SCENE ,S-ESCAPE>
		       <TELL
"She refuses your advances." CR>)
		      (ELSE
		       <TELL
"\"This is not the time or the place, Anjin-san!\" she replies in Latin,
\"though truly I love thee.\"" CR>)>)
	       (<P? TELL-ABOUT MARIKO>
		<COND (<SCENE? ,S-MARIKO>
		       <MARIKO-TELL-MARIKO-ABOUT>)
		      (<AND <PRSI? ,YABU ,LG-YABU ,LG-NINJA>
			    <SOLVED? ,CELLARS>>
		       <SETG MARIKO-PLAN? 3>
		       <SETG QCONTEXT <>>
		       <TELL
G"\"Yabu has betrayed us, then.  When this is over, Lord Toranaga must
be told!\"" CR>)
		      (ELSE
		       <TELL
"Mariko seems very interested as you tell her about " THE ,PRSI ",
watching you with demurely lowered eyes." CR>)>)
	       (<AND <P? SHOOT PISTOL MARIKO>
		     <IN? ,NINJA ,HERE>>
		<COND (<JIGS-UP? ,J-KILL-MARIKO
"You stop, realizing you were about to shoot the woman you love.">
		       <JIGS-UP
"You fire the pistol, killing Mariko instantly.  The ninja are
enraged.  It seems clear they were ordered to take Mariko alive at any
cost.  The leader stares at you, seems to hesitate, and then comes to a
decision.  You die moments later.">)
		      (ELSE <RTRUE>)>)
	       (<AND <VERB? FOLLOW>
		     <NOT <IN? ,MARIKO ,HERE>>>
		<COND (<SCENE? ,S-SEPPUKU>
		       <COND (<HERE? ,TEA-HOUSE>
			      <DO-WALK ,P?OUT>)
			     (<HERE? ,FORMAL-GARDEN>
			      <DO-WALK ,P?EAST>)>)
		      (<AND <SCENE? ,S-NINJA>
			    <NOT <IN? ,MARIKO ,HERE>>
			    <NOT <NEXT-ROOM? <LOC ,MARIKO>>>>
		       <TELL
"You've lost her!  You can only assume the ninja are taking her to their
secret door." CR>)>)
	       (<P? PUSH MARIKO INTDIR>
		<SETG WINNER ,MARIKO>
		<PERFORM ,V?WALK ,P-DIRECTION>
		<SETG WINNER ,PLAYER>
		<RTRUE>)>>

<ROUTINE INTERRUPTED-SEPPUKU ()
	 <JIGS-UP
"  The witnesses stare at you in
shock, at your incredible barbarian rudeness in interrupting the
ceremony.  Yabu seems particularly incensed.  His sword is ready in
no time...">>

<ROUTINE I-LOVE-YOU ()
	 <TELL "\"Thou,\" she replies in Latin, your private language of
love. \"I love thee!\"" CR>>

<ROUTINE I-DONT-UNDERSTAND ()
	 <TELL "\"I don't understand, Anjin-san.\"" CR>>

<OBJECT YABU
	(LOC OUTER-ROOM)
	(DESC "Yabu")
	(SYNONYM YABU DAIMYO LORD)
	(ADJECTIVE KASIGI LORD)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT)
	(PICTURE P-YABU)
	(DESCFCN YABU-DESC)
	(GENERIC GENERIC-YABU-F)
	(ACTION YABU-F)>

<ROUTINE YABU-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<SCENE? ,S-NINJA>
		       <COND (<OR <HERE? ,OUTER-ROOM>
				  ,FOLLOW-FLAG>
			      <RTRUE>)
			     (ELSE <RFALSE>)>)
		      (<HERE? ,VILLAGE-SQUARE>
		       <RTRUE>)
		      (<HERE? ,PEBBLED-BEACH ,ROCKY-SHORE ,CLIFF-PATH
			      ,AROUND-HEADLAND>
		       <RTRUE>)
		      (<IN? ,YABU ,SKIFF>
		       <RFALSE>)>)
	       (<RARG? OBJDESC>
		<COND (<HERE? ,VILLAGE-SQUARE>
		       <TELL
"The "I"daimyo"", Kasigi Yabu, sits on the platform.">)
		      (<HERE? ,PEBBLED-BEACH ,ROCKY-SHORE ,CLIFF-PATH
			      ,AROUND-HEADLAND>
		       <TELL
"Yabu, wet and impatient, watches you carefully.">)
		      (,FOLLOW-FLAG
		       <COND (<HERE? ,CELLARS>
			      <TELL "Yabu looks nervously into the shadows.">)
			     (ELSE
			      <TELL "Yabu is walking away from you.">)>) 
		      (ELSE
		       <TELL
"Yabu sits impatiently, facing you.">)>)>>

<ROUTINE YABU-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<SCENE? ,S-YABU>
		       <YABU-TALK-TO-YABU>)
		      (<SCENE? ,S-NINJA>
		       <NINJA-TALK-TO-YABU>)
		      (<AND <HERE? ,CLIFF-PATH>
			    <VERB? LOOK WALK>>
		       <SETG WINNER ,BLACKTHORNE>
		       <PERFORM ,V?POINT ,RODRIGUES>
		       <SETG WINNER ,YABU>
		       <RTRUE>)
		      (ELSE
		       <YABU-WAKARIMASEN>)>)
	       (<VERB? EXAMINE>
		<TELL
"Kasigi Yabu is short, squat, and dominating.">
		<COND (<HERE? ,VILLAGE-SQUARE>
		       <TELL
"There's arrogance and cruelty in the "I"daimyo's"" face, you think.  ">
		       <COND (<G? ,YABU-CNT 0>
			      <TELL
"He seems irritated and impatient.  The priest's Japanese isn't fluent,
you realize, as Yabu seems to ask for another word, a clearer word.  ">)>
		       <TELL 
"He kneels comfortably, his heels tucked neatly under him, flanked by
four lieutenants, one of whom is Kasigi Omi, his nephew and vassal.  They
all wear silk kimonos and, over them, ornate surcoats with wide belts.">)>
		<CRLF>)
	       (<AND <EQUAL? ,YABU-QUESTION 4>
		     <P? TELL-ABOUT YABU STRAIT-OF-MAGELLAN>>
		<SETG WINNER ,YABU>
		<PERFORM ,V?COME-FROM ,STRAIT-OF-MAGELLAN>
		<SETG WINNER ,PLAYER>
		<RTRUE>)
	       (<AND <SCENE? ,S-NINJA>
		     <P? (TELL ASK-ABOUT TELL-ABOUT SAY) YABU>>
		<COND (<HERE? STAIRS SERVANTS-QUARTERS CELLARS>
		       <NINJA-INTERRUPT-YABU>)>)
	       (<VERB? WHO>
		<TELL
"Kasigi Yabu is chief of the Kasigi clan, Lord of Izu." CR>)
	       (<VERB? FOLLOW>
		<COND (<SCENE? ,S-VOYAGE>
		       <TELL
"You are hard put to keep up with him, but you force yourself, in
spite of your weakness." CR>)
		      (<SCENE? ,S-NINJA>
		       <COND (<QUEUED? I-YABU-LEAVES> <RFALSE>)>
		       <NINJA-FOLLOW-YABU>)>)
	       (<VERB? SHOOT>
		<COND (<JIGS-UP? ,J-SHOOT-YABU
"You've seen his speed with the killing sword.  You aren't sure you could
shoot him before he kills you.">
		       <JIGS-UP
"Before you can finish aiming it at Yabu,
his sword slashes through the air like an arc of silver and removes
your head.">)
		      (ELSE <RTRUE>)>)
	       (<HOSTILE-VERB?>
		<REMOVES-YOUR-HEAD ,YABU>)>>

<OBJECT LG-YABU
	(LOC LOCAL-GLOBALS)
	(SCENE S-VOYAGE)
	(DESC "Yabu")
	(SYNONYM YABU)
	(ADJECTIVE KASIGI)
	(FLAGS ;INVISIBLE PERSON JAPANESEBIT NOABIT NOTHEBIT)
	(GENERIC GENERIC-YABU-F)
	(ACTION LG-YABU-F)>

<ROUTINE GENERIC-YABU-F (R F)
	 <COND (<IN? ,YABU ,HERE> ,YABU)
	       (ELSE ,LG-YABU)>>

<ROUTINE LG-YABU-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<RFALSE>)
	       (<VERB? TELL SAY>
		<PERFORM ,V?YELL-AT ,YABU>
		<END-QUOTE>
		<COND (<VERB? TELL> <RFATAL>)
		      (ELSE <RTRUE>)>)
	       (<VERB? EXAMINE>
		<COND (<QUEUED? I-YABU-RETURNS>
		       <TELL
"Yabu is climbing back up the cliff." CR>)
		      (<IN? ,YABU ,LEDGE-1>
		       <TELL
"Yabu is climbing down the cliff." CR>)
		      (<IN? ,YABU ,LEDGE-2>
		       <TELL
"Yabu has just tumbled to the bottom of the cliff." CR>)
		      (<IN? ,YABU ,LEDGE-3>
		       <TELL
"Yabu is resting at the bottom of the cliff." CR>)
		      (<IN? ,YABU ,LEDGE-4>
		       <COND (,YABU-WARNED?
			      <TELL
"Yabu is soaked from the rain and the spray, but alert and strong." CR>)
			     (,YABU-RESIGNED?
			      <TELL
"Yabu is sitting composed and dignified on a sea-threatened rock, quietly
awaiting his death." CR>)
			     (ELSE
			      <TELL
"Yabu is on the rocks, out of the surf." CR>)>)>)
	       (<VERB? HELP>
		<TELL
"There is little you can do directly." CR>)
	       (<VERB? BOW ASK-ABOUT HELLO SHOW THANK>
		<TELL
G"Yabu is too far away." CR>)
	       (<PASSIVE-VERB?>
		<REDIRECT ,LG-YABU ,YABU>
		<RTRUE>)
	       (<P? (LOWER THROW GIVE PUT) * LG-YABU>
		<RFALSE>) 
	       (ELSE
		<TELL
G"Yabu is too far away." CR>)>>

<OBJECT ISHIDO
	(DESC "Ishido")
	(SYNONYM ISHIDO MAN)
	(ADJECTIVE LORD KAZUNARI TALL)
	(PICTURE P-ISHIDO)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT OPENBIT
	 SCOREBIT CONTBIT SEARCHBIT)
	(DESCFCN ISHIDO-DESC)
	(ACTION ISHIDO-F)>

<ROUTINE ISHIDO-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<SCENE? ,S-OCHIBA> <RTRUE>)>)
	       (<RARG? OBJDESC>
		<TELL
"Ishido, tall, lean and autocratic, stands beside the platform.">)>>


<OBJECT ISHIDO-SWORD
	(LOC ISHIDO)
	(OWNER ISHIDO)
	(DESC "sword")
	(SYNONYM SWORD)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-SWORD-F)>

<ROUTINE GENERIC-SWORD-F (R F)
	 <COND (<OR <HELD? ,SWORDS>
		    <ACCESSIBLE? ,SWORDS>>
		,SWORDS)
	       (<OR <HELD? ,ISHIDO-SWORD>
		    <ACCESSIBLE? ,ISHIDO-SWORD>>
		,SWORDS)
	       (ELSE ,YABU-SWORDS)>>

<ROUTINE ISHIDO-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<OR <VERB? YES HAI>
			   <NOT-A-BARBARIAN?>>
		       <COND (<EQUAL? ,OCHIBA-QUESTION 2>
			      <COND (<VERB? YES HAI>
				     <TELL
"\"So, you are a barbarian, then!\" Ishido replies with glee." CR>)
				    (ELSE
				     <SETG OCHIBA-QUESTION <>>
				     <SCORE-OBJECT ,GLOBAL-BARBARIAN>
				     <TELL
"\"Ah, Lord General, you are right.  Barbarians are often mad.  But,
so sorry, now I am samurai -- hatamoto.  "I"I am no longer a
barbarian!""  Now I understand manners, please excuse
me.  "I"Neh?""\"  You know that
the Japanese understand masculinity and pride, and honor them.|
|
Ishido laughs nervously.  \"So, samurai Anjin-san, yes, I accept your
apology.  I apologize also.\"" CR>)>)
			     (ELSE
			      <TELL
"\"That remains to be seen, Anjin,\" replies Ishido." CR>)>)
		      (<VERB? NO IYE>
		       <TELL
"He sniffs, as if to imply he doesn't believe you." CR>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? EXAMINE>
		<TELL
"Ishido Kazunari is tall, lean, swarthy and very tough, a little younger than
Toranaga.  "G"He is dressed in the Gray uniform." CR>)
	       (<VERB? WHO>
		<TELL
"Ishido Kazunari is Commander of the
garrison of Osaka Castle, Commander of the Heir's Bodyguard, Chief General
of the Armies of the West, Conquerer of Korea, member of the Council of
Regents, and Inspector General of the Armies of the late Taiko." CR>)
	       (<P? TELL-ABOUT ISHIDO (TORANAGA KIRITSUBO TORANAGA-IN-DRAG)>
		<COND (,SEEN-TORANAGA?
		       <TELL
"You try to tell Ishido about Toranaga and Kiri switching places, but your
Japanese isn't good enough, and he is merely annoyed." CR>)
		      (ELSE
		       <TELL
"Ishido seems rather uninterested in your ungrammatical babblings." CR>)>)
	       (<HOSTILE-VERB?>
		<COND (<JIGS-UP? ,J-ATTACK-ISHIDO>
		       <JIGS-UP
"Ishido looks intensely pleased at your foolishness, and with a prideful
bow to all around you, hews off your head.  \"Thus I deal with barbarian
dogs!\" he shouts.">)
		      (ELSE <RTRUE>)>)>>


<OBJECT TORANAGA
	(DESC "Toranaga")
	(SYNONYM TORANAGA YOSHI)
	(ADJECTIVE YOSHI LORD)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT OPENBIT CONTBIT SEARCHBIT)
	(DESCFCN TORANAGA-DESC)
	(GENERIC GENERIC-TORANAGA-F)
	(ACTION TORANAGA-F)>

<ROUTINE GENERIC-TORANAGA-F (R F)
	 <COND (<IN? ,TORANAGA-IN-DRAG ,HERE> ,TORANAGA-IN-DRAG)
	       (ELSE ,TORANAGA)>>

<GLOBAL SEEN-FALCON? <>>

<ROUTINE TORANAGA-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<AND <SCENE? ,S-TORANAGA>
			    <IN? ,FALCON ,TORANAGA>>
		       <RTRUE>)>)
	       (ELSE
		<COND (<NOT ,SEEN-FALCON?>
		       <SETG SEEN-FALCON? T>
		       <MARGINAL-PIC ,P-FALCON <>>)>
		<TELL
"Toranaga is repairing a broken wing feather of a hooded falcon as
delicately as any ivory carver.">)>>

<ROUTINE TORANAGA-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<SCENE? S-TORANAGA>
		       <COND (<VERB? TEKI> <RFALSE>)>)
		      (<SCENE? S-MARIKO>
		       <COND (<OR <P? KONNICHI-WA ROOMS>
				  <P? NIHON-GO-GA HANASE-MASEN>>
			      <SETG WINNER ,PLAYER>
			      <PERFORM ,V?KONNICHI-WA ,TORANAGA>
			      <RTRUE>)>)
		      (<SCENE? ,S-QUAKE>
		       <COND (<AND <IN? ,TORANAGA ,PLATEAU>
				   <IN? ,MARIKO ,SIDE-FISSURE>>
			      <TELL
"Toranaga crawls closer to you, trying to help." CR>
			      <RTRUE>)>)
		      (<AND <SCENE? ,S-AFTERMATH>
			    <AFTERMATH-ANSWERS>>
		       <RTRUE>)
		      (<VERB? TELL-ME-ABOUT>
		       <COND (<PRSO? ,LG-ERASMUS>
			      <TELL
"\"You will get your ship back in good time, Anjin-san.\"" CR>
			      <RTRUE>)>)>
		<TELL G"Toranaga doesn't reply." CR>)
	       (<VERB? EXAMINE>
		<TELL
"Toranaga is a short man with a thick belly and a large nose.  His eyebrows
are thick and dark and his mustache and beard gray-flecked and sparse.  Eyes
dominate his face.  He is fifty-eight and strong for his age." CR>)
	       (<VERB? WHO>
		<TELL
"Yoshi Toranaga is Lord of the Kwanto and President of the Council of
Regents." CR>)
	       (<VERB? YELL YELL-AT LAUGH>
		<COND (<JIGS-UP? ,J-LAUGH-AT-TORANAGA
"Such disrespect could be fatal.">
		       <JIGS-UP
"Your disrespect costs you your life.">)
		      (ELSE <RTRUE>)>)>>

<OBJECT HIRO-MATSU
	(SDESC "Hiro-matsu" ;"old man")
	(SYNONYM HIRO-MATSU HIRO MAN)
	(ADJECTIVE LORD OLD)
	(FLAGS PERSON JAPANESEBIT NOTHEBIT NOABIT)
	(ACTION HIRO-MATSU-F)>

<ROUTINE HIRO-MATSU-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<VERB? EXAMINE>
		<TELL
"He is tall for a Japanese, just under six feet, a bull-like man with
heavy jowls.  His military kimono is brown silk, stark but for five
small Toranaga crests -- three interlocked bamboo sprays." CR>)
	       (<VERB? WHO>
		<TELL
"Lord Hiro-matsu, overlord of the provinces of Sagami and Kozuke,
is Toranaga's most trusted general and advisor.  He is an older man,
stern and somewhat slow-witted, but immensely reliable.  He is very
good at killing, and customarily carries his killing sword in his
hand instead of in his belt, symbol of his readiness to kill instantly
to protect his liege lord." CR>)>>

<OBJECT VINCK
	(LOC BELOW-DECKS)
	(DESC "Vinck")
	(SYNONYM VINCK MAN)
	(ADJECTIVE JOHANN JOHANN ;"DEAD")
	(FLAGS NDESCBIT PERSON DUTCHBIT NOABIT NOTHEBIT)
	(DESCFCN VINCK-DESC)
	(ACTION VINCK-F)>

<ROUTINE VINCK-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<SCENE? ,S-YOKOHAMA> <RTRUE>)>)
	       (<RARG? OBJDESC>
		<TELL "Vinck is here">
		<COND (<FSET? ,VINCK ,DEAD>
		       <TELL
", his face frozen in a rictus of death.">)
		      (ELSE
		       <TELL ".">)>)>>

<ROUTINE VINCK-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<VERB? HELLO>
		       <TELL
"He greets you with as much enthusiasm as his weakened condition
allows.  He's the only man of the crew that you could call a friend." CR>)
		      (<VERB? TELL-ME-ABOUT>
		       <COND (<PRSO? ,SPILLBERGEN>
			      <TELL
"\"That glory-greedy bastard!  He's responsible for this.\"" CR>)
			     (<PRSO? ,REEF>
			      <TELL
"\"We'll never make it, by my mother!  Look at those spines!\"  It's
clear that Vinck is near panic." CR>)
			     (<PRSO? ,RUTTER ,SECRET-RUTTER ,GLOBAL-RUTTERS>
			      <TELL
"An odd light enters Vinck's eyes as he answers.  \"Rutters?  Aye,
what about the rutters, eh?  Maybe you'd better give them to me in
case anything happens to you, right?\"  You know that Vinck would
be Pilot if you were to die.  He's your friend, but rutters!  Rutters
are beyond price." CR>)
			     (<PRSO? ,ROPER>
			      <TELL
"\"That poxy merchant?  Listen to him, and you'd think he was a
Christian.  Watch him, and you see his only god clinks in his
strongboxes!\"" CR>)
			     (<AND <PRSO? ,ETA>
				   <SCENE? ,S-YOKOHAMA>>
			      <TELL
"\"Eters are the best heathen we've seen here.  More like us than the
other bastards.  With them, fresh meat's no problem, or tallow -- they
give us no trouble.\"" CR>)>)
		      (<P? (RAISE REPAIR LOWER) FORESAILS>
		       <RFALSE>)
		      (<SEND-HIM-OUT?>
		       <COND (<HERE? ,BELOW-DECKS>
			      <SETG WINNER ,PLAYER>
			      <PERFORM ,V?SEND ,VINCK ,ROOMS>
			      <RTRUE>)
			     (ELSE
			      <TELL
"\"Pilot, I'm on watch now.\"" CR>)>)
		      (<AND <HERE? ,BRIDGE-OF-ERASMUS>
			    <OR <VERB? HELP>
				<P? (TURN TAKE STRAIGHTEN) WHEEL>>>
		       <COND (,WHEEL-SPINNING?
			      <COND (<FSET? ,WHEEL ,ONBIT>
				     <TELL
"\"We've got it, Pilot!  Hold on, for the love of God!\"" CR>)
				    (ELSE
				     <FSET ,WHEEL ,ONBIT>
				     <SETG SHIP-COURSE ,P?FORE>
				     <TELL
"Together you and Vinck grab the wheel and set her on course again, but
she still bobs and twists drunkenly." CR>)>)
			     (ELSE
			      <TELL
"He helps for a few moments, then returns control to you." CR>)>)
		      (<AND <SCENE? ,S-PIT>
			    <OR <HOSTILE-VERB?>
				<VERB? STOP SIT>
				<P? TAKE LADDER>>>
		       <COND (,VINCK-PICKED?
			      <TELL
"\"I gave my word, Pilot.\"" CR>)
			     (ELSE
			      <TELL "Vinck fights back as best he can." CR>)>)
		      (<AND <P? GIVE SHORT-STRAW ME>
			    <IN? ,SHORT-STRAW ,VINCK>
			    <IN? ,LONG-STRAW ,PLAYER>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?TRADE ,LONG-STRAW ,VINCK>
		       <RTRUE>) 
		      (<AND <SCENE? ,S-PIT>
			    <VERB? HELP>
			    <OR <IN? ,OMI-SAMURAI ,LADDER>
				<QUEUED? I-LOSING-SAMURAI>>>
		       <TELL
"He tries to help, but he's not too effective." CR>)
		      (<OR <P? (DROP PUT-AWAY) PISTOL>
			   <P? GIVE PISTOL (ME BLACKTHORNE)>>
		       <TELL
"He laughs, pointing the pistol in your face." CR>)
		      (ELSE
		       <TELL
"A weak assent is the only reply." CR>)>)
	       (<VERB? EXAMINE WHO>
		<COND (<FSET? ,VINCK ,DEAD>
		       <COND (<FSET? ,VINCK ,RMUNGBIT>
			      <TELL
"Vinck is dead, his face frozen in a grimace of rage." CR>)
			     (ELSE
			      <TELL
"He is staring at you as if frozen." CR>)>)
		      (ELSE
		       <TELL
"Johann Vinck is forty-three, toothless and hairless; the oldest man in
the " I "Erasmus" "' crew.  You've sailed with him before, and each of you knows
the measure of the other.  If there's any man of the crew you could call a
friend, it's he." CR>)>)
	       (<P? SEND VINCK>
		<MOVE ,VINCK ,ON-DECK>
		<FCLEAR ,VINCK ,NDESCBIT>
		<TELL
"\"Take the dawn watch, Vinck,\" you order.  Vinck pulls himself
painfully out of his bunk and goes out." CR>
		<COND (<AND <IN? ,GINSEL ,ON-DECK>
			    <IN? ,MAETSUKKER ,ON-DECK>>
		       <RESTART-STORM?>
		       <SCORE-OBJECT ,MAETSUKKER>)>
		<RTRUE>)>>

<OBJECT KIRITSUBO
	(LOC PRIVATE-QUARTERS)
	(DESC "Kiritsubo")
	(SYNONYM KIRITSUBO KIRI CONSORT)
	(ADJECTIVE LADY)
	(FLAGS PERSON JAPANESEBIT FEMALE NOABIT NOTHEBIT)
	(ACTION KIRITSUBO-F)>

<ROUTINE KIRITSUBO-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<VERB? YES HAI>
		       <COND (<AND ,MARIKO-PLAN?
				   <HERE? ,PRIVATE-QUARTERS>>
			      <SETG MARIKO-PLAN? <+ ,MARIKO-PLAN? 1>>
			      <COND (<EQUAL? ,MARIKO-PLAN? 2>
				     <TELL
G"Mariko translates for you, then ""asks \"Do you think he plans to betray us?\"" CR>)
				    (<EQUAL? ,MARIKO-PLAN? 3>
				     <TELL
G"Mariko translates for you, then ""says "G"\"Perhaps you were mistaken.  We're safe now.\"" CR>)>)>)
		      (<VERB? NO IYE>
		       <COND (<AND ,MARIKO-PLAN?
				   <HERE? ,PRIVATE-QUARTERS>>
			      <SETG MARIKO-PLAN? <+ ,MARIKO-PLAN? 1>>
			      <COND (<EQUAL? ,MARIKO-PLAN? 2>
				     <TELL
G"Mariko translates for you, then asks "
G"\"But do you still think he plans to betray us?\"" CR>)
				    (<EQUAL? ,MARIKO-PLAN? 3>
				     <TELL
G"Mariko translates for you, then ""says \"We're safe now.\"" CR>)>)>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? WHO>
		<TELL
"Lady Kiritsubo Toshiko is Matron of Toranaga's ladies-in-waiting, at
fifty-three the oldest of the ladies of his court.  She was once
Toranaga's consort." CR>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,SCOREBIT>
		       <REPLACE-SYNONYM ,TORANAGA-IN-DRAG
					,W?KIRITSUBO
					,W?TORANAGA>
		       <SETG SEEN-TORANAGA? T>
		       <TELL
"Everyone else is watching Sazuko, terrified that some harm may come
to Toranaga's unborn child.  Kiritsubo scuttles with surprising speed
into the garden and inside the little hut.  She vanishes for a moment,
reappears, and darts into the litter, jerking the curtains closed.  For
an instant, your eyes meet.  It is Toranaga!" CR>
		       <SCORE-OBJECT ,KIRITSUBO ,TORANAGA-IN-DRAG>)
		      (ELSE
		       <TELL
"She is a middle-aged woman, her hair gray-flecked, her waist thick,
but her face sparkles with eternal joy." CR>)>)
	       (<VERB? FOLLOW>
		<COND (<SCENE? ,S-ESCAPE>
		       <ESCAPE-FOLLOW-KIRI>)>)>>

<OBJECT RODRIGUES
	(SDESC "seaman")
	(LOC GENERIC-OBJECTS)
	(SCENE S-RODRIGUES S-VOYAGE)
	(SYNONYM VASCO RODRIGUES SEAMAN PILOT)
	(ADJECTIVE VASCO PORTUGUESE)
	(PICTURE P-RODRIGUES)
	(FLAGS PERSON PORTUGUESEBIT OPENBIT CONTBIT SEARCHBIT)
	(GENERIC GENERIC-PILOT-F)
	(DESCFCN RODRIGUES-DESC)
	(CONTFCN RODRIGUES-F)
	(ACTION RODRIGUES-F)>

<ROUTINE RODRIGUES-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL CTHE ,RODRIGUES>
		<COND (<AND <HERE? ,GALLEY>
			    <NOT <FSET? ,GALLEY-WHEEL ,ONBIT>>>
		       <TELL " stands at the helm.">)
		      (<HERE? ,IN-THE-SEA>
		       <COND (<IN? ,OAR ,RODRIGUES>
			      <TELL " floats nearby, clinging to an oar.">)
			     (ELSE
			      <TELL " is drowning nearby">)>)
		      (ELSE
		       <TELL " stands near you.">)>)>>

<GLOBAL WRONG-ANSWER? <>>

<ROUTINE RODRIGUES-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? (WHO TELL-ME-ABOUT) (RODRIGUES YOU)>
		       <NEW-SDESC ,RODRIGUES "Rodrigues">
		       <TELL
"\"I'm Vasco Rodrigues, pilot of this galley!  I'm the best pilot in
all Asia!\"" CR>)
		      (<EQUAL? ,RODRIGUES-QUESTION 1>
		       <COND (<OR <VERB? YES HAI>
				  <AND <P? BE
					   (BLACKTHORNE ME)
					   (RODRIGUES BLACKTHORNE)>
				       <OR <NOUN-USED? ,PRSI ,W?PILOT>
					   <NOUN-USED? ,PRSI ,W?PILOT-MAJOR>>>>
			      <SETG QCONTEXT <>>
			      <SETG RODRIGUES-QUESTION 0>
			      <SETUP-ANSWER <>>
			      <NEW-SDESC ,RODRIGUES "Rodrigues">
			      <TELL
"\"Good, good!">
			      <COND (<VERB? HAI>
				     <TELL
"You sound like a Japper!">)>
			      <NEW-SDESC ,HIRO-MATSU "Hiro-matsu">
			      <FCLEAR ,HIRO-MATSU ,AN>
			      <TELL
"I'm Vasco Rodrigues, pilot of this galley!\"  He turns
to the old man and speaks a mixture of Japanese and Portuguese, calling
him Toda-sama but the way it sounds it comes out \"Toady-sama.\"|
|
\"That's better,\" he says after a while.  \"Listen, Pilot, this man's
like a king.  His name is Toda Hiro-matsu.  I told him I'd be responsible for you, and I'd blow your
head off as soon as drink with you!\"" CR>)
			     (<OR <VERB? NO IYE>
				  <AND <P? BE (BLACKTHORNE ME) BLACKTHORNE>
				       <P-NEGATIVE?>
				       <OR <NOUN-USED? ,PRSI ,W?PILOT>
					   <NOUN-USED? ,PRSI ,W?PILOT-MAJOR>>>>
			      <TELL
"\"Bah!  They've told me you're the pilot, so let's get on with it!\"" CR>)>)
		      (<AND <EQUAL? ,RODRIGUES-QUESTION 2>
			    <TRAINED?>>
		       <SETG QCONTEXT <>>
		       <SETG RODRIGUES-QUESTION 0>
		       <SETUP-ANSWER <>>
		       <TELL
"\"Excellent, Ingeles!  A nest of pirates indeed, but what pilots you
pirates are!  We're taking you to Osaka, at the pleasure of the Great
Lord High Executioner himself.  Toranaga!\"" CR>
		       <SCORE-OBJECT ,TRINITY-HOUSE>)
		      (<AND <EQUAL? ,RODRIGUES-QUESTION 3>
			    <OR <P? BE (LIZARD LATITUDE) (INTNUM INTADJ)>
				<P? ANSWER (INTNUM INTADJ)>>>
		       <COND (<EQUAL? ,P-NUMBER 50>
			      <SETG QCONTEXT <>>
			      <SETG RODRIGUES-QUESTION 0>
			      <SETUP-ANSWER <>>
			      <TELL
"\"You are the pilot, by God!\"  He shakes your hand warmly.  \"Come
aboard.  There's food and good brandy and wine and grog and all pilots should
love all pilots, who're the sperm of the earth!  Amen!  Right?\"" CR>
			      <SCORE-OBJECT ,LIZARD>
			      <RTRUE>)
			     (<NOT ,WRONG-ANSWER?>
			      <SETG WRONG-ANSWER? T>
			      <TELL
"\"Now, pilot, don't try anything stupid.  If you're the pilot you know
the answer!\"" CR>)
			     (<JIGS-UP? ,J-WRONG-ANSWER
"You think again.  Will this Portuguese tolerate wrong answers?  This
is no time for foolishness.">
			      <TELL
"He looks at you suspiciously.  \"Maybe you aren't the pilot, maybe you're
some son of a festering whore who thinks he can lie his way into anything!\"
He signals to the old man, who nods.  You feel something behind you..." CR>
			      <JIGS-UP>
			      <RFATAL>)
			     (ELSE <RTRUE>)>)
		      (<VERB? TELL-ME-ABOUT>
		       <COND (<PRSO? ,SLAVER>
			      <TELL
"\"This is no slaver!  They don't have 'em in Japan, not even in their
mines.  We've samurai rowers.  They're soldiers, the old bugger's personal
soldiers -- and you've never seen slaves row better, or men fight better!\"
He laughs.  \"We came all the way from Osaka -- three-hundred-odd sea miles
in forty hours.\"" CR>)
			     (<PRSO? ,GLOBAL-SAMURAI>
			      <TELL
"\"You've got to be born one.  It's hereditary mostly, like with us.  In
the olden days, peasants could be soldiers and soldiers peasants.  Some
peasant soldiers rose to the highest rank.  The Taiko was one.\"" CR>)
			     (<PRSO? ,TAIKO>
			      <TELL
"\"The Great Despot, the ruler of all Japan, the Great Murderer of all
times.  He died a year ago and now he's burning in hell.\"" CR>)
			     (<PRSO? ,TORANAGA>
			      <TELL
"\"The Great Lord High Executioner himself!  Lord of the Eight Provinces,
the chief "I"daimyo"" of Japan -- like a king or a feudal lord but
better.  They're all despots.\"" CR>)
			     (<PRSO? ,ME>
			      <TELL
"\"You're an Ingeles pirate, and a heretic, but a Pilot is a Pilot, by
God!\"" CR>)
			     (<SCENE? ,S-VOYAGE>
			      <TELL
"\"Pay attention to the storm, Ingeles!\"" CR>)
			     (ELSE
			      <TELL
"\"I've nothing to say about " HIM/HER ,PRSO ", Ingeles!\"" CR>)>)
		      (<P? (DODGE LOOK-OUT) (ROOMS ARCHERS)>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?WARN ,RODRIGUES ,ARCHERS>
		       <RTRUE>)
		      (<P? SHUT-UP ROOMS>
		       <TELL
"\"Thy mother!\" he curses." CR>)
		      (<VERB? HELLO>
		       <TELL
"\"Cheerful, aren't you?  I've heard you Ingeles are all crazy,\" he
remarks genially." CR>)
		      (ELSE
		       <TELL
"\"God curse you, Ingeles!\" snaps " THE ,RODRIGUES "." CR>)>)
	       (<RARG? CONTAINER>
		<TELL "\"Not so fast, Ingeles!\"" CR>)
	       (<VERB? EXAMINE>
		<COND (<HERE? ,CLIFF-PATH>
		       <TELL
"You can only see that he's still clinging to the oar you threw.  From
here, it's impossible to tell if he's alive or dead.  His legs
rise and fall with the waves." CR>)
		      (<HERE? ,MAIN-DECK>
		       <COND (<IN? ,RODRIGUES ,GALLEY>
			      <TELL
"You look back at the quarterdeck to curse Rodrigues for letting the helm
get away from him.  He waves and points and shouts, and you see that the
course has changed.  You realize the swerve had been planned, but the
bastard could have warned you!" CR>)>)
		      (ELSE
		       <TELL
CTHE ,RODRIGUES " is a man as tall as you and about your own age, but
black-haired
and dark-eyed and carelessly dressed in seaman's clothes, rapier by his
side, pistols in his belt.  A jeweled crucifix hangs from his neck.  He
wears a jaunty cap." CR>)>)
	       (<P? TIE RODRIGUES>
		<TELL
"\"I've no time for that now, Ingeles!\"" CR>)
	       (<P? TELL-ABOUT RODRIGUES>
		<COND (<OR <PRSI? LG-ERASMUS STRAIT-OF-MAGELLAN>
			   <AND <PRSI? SLAVER> <NOUN-USED? ,PRSI ,W?SHIP>>>
		       <COND (<OR <FSET? ,LIZARD ,SCOREBIT>
				  <SCENE? ,S-VOYAGE>>
			      <TELL
"\"Don't try to distract me, you heretic!\"" CR>)
			     (<FSET? ,LG-ERASMUS ,SCOREBIT>
			      <TELL
"You tell him about your ship, how you lost the foremast just before
making landfall, how the samurai wouldn't let you retrieve your
gear.  \"Listen, Rodrigues, there's no chance of going aboard, is
there?  They haven't
let me back aboard, I've no clothes and they sealed her
up the moment we arrived.\"  You carefully avoid mentioning your rutters." CR CR>
			      <LETS-GO-ABOARD T>
			      <SCORE-OBJECT ,LG-ERASMUS>)
			     (ELSE
			      <TELL
"\"Don't bore me, Ingeles!\"" CR>)>)
		      (<PRSI? GLOBAL-RUTTERS SECRET-RUTTER RUTTER>
		       <TELL
"You start to tell him about how you haven't been able to retrieve your
rutters, and you stop short.  This man may be a pilot, but he's a
Portuguese, a Catholic, and an enemy.  You want his help in getting
out to the "I"Erasmus"", but don't want to mention the rutters.  Maybe
the ship alone would interest him enough?" CR>)
		      (<PRSI? ME BLACKTHORNE>
		       <TELL
"You tell him a little about yourself.  He has heard of your voyage to
the Arctic, and is impressed." CR>)>)
	       (<P? (SHOW GIVE) * RODRIGUES>
		<COND (<PRSO? ,LIFE-RING>
		       <MOVE ,LIFE-RING ,RODRIGUES>
		       <TELL
"\"Aye, Ingeles, we'll all be needing them if this storm continues.\"  He
rubs his chin.  \"I never learned to swim, you know.\"" CR>)
		      (ELSE
		       <TELL
"Rodrigues examines " THE ,PRSO " with little enthusiasm." CR>)>)
	       (<VERB? CURSE>
		<TELL
"\"Thy mother, Ingeles!\" responds " THE ,RODRIGUES "." CR>)
	       (<VERB? WHO>
		<COND (<FSET? ,PRSO ,NOABIT>
		       <TELL
"He's a Portuguese pilot">
		       <COND (<NOT <SCENE? ,S-RODRIGUES>>
			      <TELL
", a bluff, crude seaman who hates England and
all Protestants, but believes in the brotherhood of pilots.  He got you
aboard the "I"Erasmus"" to make a true search, and your rutters were
nowhere to be found!" CR>)
			     (ELSE <TELL "." CR>)>)
		      (ELSE
		       <TELL
,YOU-HAVE-TO "ask him." CR>)>)
	       (<VERB? BOW>
		<TELL
"\"You do that just like a Japman, Ingeles!\" he replies, impressed." CR>)
	       (<P? PUSH-TO RODRIGUES>
		<TELL
"He shoves you back just as hard.  \"Watch yourself, Ingeles!\" he
yells." CR>)
	       (<AND <VERB? WHAT>
		     <NOUN-USED? ,PRSO ,W?PILOT>>
		<TELL
"A pilot is the one who knows how to get the ship where it wants to go,
and back again." CR>)>>

<ROUTINE TRAINED? ()
	 <COND (<AND <P? TRAIN TRINITY-HOUSE>
		     <OR <NOUN-USED? ,PRSO ,W?TRINITY>
			 <AND <NOUN-USED? ,PRSO ,W?HOUSE>
			      <ADJ-USED? ,PRSO ,W?TRINITY>>>
		     <PAST-TENSE?>>
		<RTRUE>)
	       (<AND <P? BE ME INTPP>
		     <EQUAL? ,W?TRAINED <PARSE-ADJ ,PARSE-RESULT>>
		     <EQUAL? ,TRINITY-HOUSE <P-PP-OBJ>>>
		<RTRUE>)>>

<OBJECT LG-RODRIGUES
	(LOC LOCAL-GLOBALS)
	(SCENE S-VOYAGE)
	(DESC "Rodrigues")
	(SYNONYM VASCO RODRIGUES SEAMAN PILOT BODY)
	(ADJECTIVE VASCO PORTUGUESE)
	(FLAGS PERSON PORTUGUESEBIT NOABIT NOTHEBIT)
	(ACTION LG-RODRIGUES-F)>

<ROUTINE LG-RODRIGUES-F ("OPT" RARG)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<SETG WINNER ,PLAYER>
		<COND (<HERE? ,CLIFF-PATH>
		       <PERFORM ,V?YELL-AT ,YABU>)
		      (ELSE
		       <PERFORM ,V?YELL-AT ,LG-RODRIGUES>)>
		<END-QUOTE>
		<RTRUE>)
	       (<AND <VERB? TELL>
		     <HERE? ,CLIFF-PATH>>
		<TELL
"He's in no condition to respond." CR>
		<END-QUOTE>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<COND (<IN? ,RODRIGUES ,IN-THE-SEA>
		       <COND (<HERE? ,MAIN-DECK ,GALLEY ,IN-THE-SEA>
			      <TELL
"He's out there among the waves, drowning." CR>)
			     (ELSE
			      <TELL
"The last you saw of him, he was being carried away by the waves." CR>)>)
		      (<IN? ,RODRIGUES ,LEDGE-4>
		       <COND (<IN? ,YABU ,LEDGE-4>
			      <TELL
"Yabu has dragged him out of the water." CR>)
			     (ELSE
			      <TELL
"His body is caught in a cleft between two rocks at the base of the
cliff." CR>)>)
		      (<IN? ,RODRIGUES ,LEDGE-3>
		       <TELL
"Yabu is carrying him up the cliff." CR>)>)
	       (<AND <VERB? HELP TAKE WALK-TO>
		     <IN? ,RODRIGUES ,IN-THE-SEA>>
		<COND (<FSET? ,RODRIGUES ,DEAD>
		       <TELL
"You can't see his body anywhere.  He must have drowned, but where is
his body?" CR>)
		      (<HERE? ,GALLEY ,MAIN-DECK ,IN-THE-SEA>
		       <TELL
"His head appears and disappears among the waves.  You can see he's in
danger of drowning, but you can't reach him." CR>)
		      (ELSE
		       <TELL "You don't know where he is." CR>)>)
	       (<VERB? SMELL>
		<TELL
"If he's dead, it hasn't been that long." CR>)
	       (<VERB? FIND>
		<COND (<HERE? ,MAIN-DECK ,GALLEY ,IN-THE-SEA>
		       <TELL
"He's out there somewhere.  As a fellow pilot, you owe him a decent
burial, not the tender ministrations of the crabs." CR>)
		      (<AND <HERE? ,CLIFF-PATH>
			    <FSET? ,AROUND-HEADLAND ,TOUCHBIT>>
		       <PERFORM ,V?LOOK-DOWN>
		       <RTRUE>)
		      (ELSE
		       <TELL
"You scan the foreshore.  You know there is minimal hope of finding
Rodrigues, there are too many caves and hidden places that could never
be investigated.  But you have to try.  All pilots pray helplessly for
death ashore and burial ashore.  All have seen too many sea-bloated
corpses and half-eaten corpses and crab-mutilated corpses." CR>)>)
	       (<AND <NOT <PASSIVE-VERB?>>
		     <HERE? ,CLIFF-PATH>>
		<TELL
"Rodrigues is out of reach." CR>)
	       (<EQUAL? <LOC ,RODRIGUES> ,MAIN-DECK ,GALLEY>
		<COND (<AND <NOT <VERB? SHOW>> <PASSIVE-VERB?>>
		       <REDIRECT ,LG-RODRIGUES ,RODRIGUES>)
		      (ELSE
		       <TELL "Rodrigues isn't here." CR>)>
		<RTRUE>)>>

<OBJECT DICTIONARY
	(DESC "Japanese dictionary")
	(SYNONYM DICTIONARY BOOK)
	(ADJECTIVE JAPANESE WORD)
	(FLAGS READBIT TAKEBIT)
	(ACTION DICTIONARY-F)>

<ROUTINE DICTIONARY-F ("AUX" WD PHR)
	 <COND (<VERB? EXAMINE>
		<TELL
"This book is a Portuguese-Latin-Japanese dictionary and grammar.  The
printing is the best you have ever seen, the quality and detail
staggering.  Father Alvito gave it to you at Toranaga's 'request.'  \"Three
of our Brethren spent twenty-seven years preparing that.\"" CR>)
	       (<P? PUT * YOKOSE-BATHTUB>
		<TELL "Never!" CR>)
	       (<VERB? READ>
		<COND (<HELD? ,PRSO>
		       <TELL
"You read the dictionary hungrily.  It means you can learn Japanese all the
faster.  A priceless book, more valuable than a rutter!" CR>)
		      (ELSE
		       <NOT-HOLDING ,PRSO>)>)
	       (<P? LOOK-UP * DICTIONARY>
		<COND (<HELD? ,PRSI>
		       <COND (<PRSO? INTQUOTE>
			      <SET WD <GET-INTQUOTE 1>>)
			     (ELSE
			      <SET WD <NP-NAME <GET-NP ,PRSO>>>)>
		       <TELL "You look up '">
		       <COND (<OR <SET PHR <JAPANESE-PHRASE?>>
				  <SET WD <JAPANESE-WORD? .WD>>>
			      <HLIGHT ,H-UNDER>)>
		       <COND (<PRSO? INTQUOTE> <PRINT-INTQUOTE>)
			     (ELSE <PRINTB .WD>)>
		       <COND (<OR .PHR .WD> <HLIGHT ,H-NORMAL>)>
		       <TELL "' and find ">
		       <COND (<OR .PHR .WD>
			      <COND (.PHR
				     <TELL "that it means '" .PHR "'" CR>)
				    (<SET WD <GET .WD 1>>
				     <TELL "that it means '" .WD ".'" CR>)
				    (ELSE
				     <TELL
"the Latin and Portuguese equivalents, which you can
then translate into English." CR>)>)
			     (ELSE
			      <TELL
"the Japanese equivalent, including examples of correct usage." CR>)>)
		      (ELSE
		       <NOT-HOLDING ,PRSI>)>)>>

<ROUTINE JAPANESE-WORD? (WD)
	 <INTBL? .WD
		 <REST ,JAPANESE-VOCABULARY 2>
		 </ <GET ,JAPANESE-VOCABULARY 0> 2>
		 *204*>>

<ROUTINE JAPANESE-PHRASE? ("AUX" (CNT 0) (LEN <GET ,JAPANESE-PHRASES 0>)
			   (TBL <REST ,JAPANESE-PHRASES 2>))
	 <REPEAT ()
		 <COND (<EQUAL? .CNT .LEN> <RFALSE>)
		       (<MATCH-INTQUOTE? <GET .TBL 0>>
			<RETURN <GET .TBL 1>>)
		       (ELSE
			<SET CNT <+ .CNT 2>>
			<SET TBL <REST .TBL 4>>)>>>

<ROUTINE MATCH-INTQUOTE? (TBL
			  "AUX" (NP <GET-NP ,INTQUOTE>)
			  (X <REST <NP-LEXBEG .NP> ,LEXV-ELEMENT-SIZE-BYTES>)
			  (LEN <+ -1
				  </ <- <NP-LEXEND .NP> <NP-LEXBEG .NP>>
				     ,LEXV-ELEMENT-SIZE-BYTES>>)
			  (CNT <GET .TBL 0>))
	<SET TBL <REST .TBL 2>> ;"skip count word"
	<REPEAT (WD)
		<SET WD <GET .X 0>>
		<COND (<EQUAL? .WD 0 ,W?INT.NUM ,W?INT.TIM>
		       <RFALSE>)
		      (<EQUAL? .WD ,W?NO.WORD ,W?COMMA ,W?QUOTE
			       ,W?PERIOD ,W?APOSTROPHE>
		       <SET LEN <- .LEN 1>>)
		      (<AND <G? .CNT 0>
			    <EQUAL? .WD <GET .TBL 0>>>
		       <SET LEN <- .LEN 1>>
		       <SET CNT <- .CNT 1>>
		       <SET TBL <REST .TBL 2>>)
		      (ELSE <RFALSE>)>
		<COND (<AND <ZERO? .CNT> <ZERO? .LEN>>
		       <RTRUE>)
		      (ELSE
		       <SET X <REST .X ,LEXV-ELEMENT-SIZE-BYTES>>)>>>

<DEFMAC PHRASE ("ARGS" WDS)
	<FORM LTABLE '(PURE)
	      !<MAPF ,LIST
		     <FUNCTION (WD) <FORM VOC .WD>>
		     .WDS>>>

<CONSTANT JAPANESE-PHRASES
	  <LTABLE (PURE)
		  <PHRASE "ANATA" "WA" "YOKU" "NEMUTTA" "KA">
		  "Did you sleep well?"
		  <PHRASE "ARIGATO" "GOZIEMASHITA">
		  "Thank you, from an inferior to a superior."
		  <PHRASE "DOKO" "NO" "KUNI" "NO" "MONODA">
		  "What's your nationality?"
		  <PHRASE "GENKI" "DESU">
		  "Quite well."
		  <PHRASE "GOMEN" "NASAI">
		  "So sorry."
		  <PHRASE "IKAGA" "DESU" "KA">
		  "How are you?"
		  <PHRASE "KONNICHI" "WA">
		  "Good day."
		  <PHRASE "ONUSHI" "ITTAI" "DOKO" "KARA" "KITANODA">
		  "Where are you from?"
		  <PHRASE "SHIGATA" "GA" "NAI">
		  "There's nothing that can be done."
		  <PHRASE "TSUYUKU" "GA" "IMASU" "KA">
		  "Do you have an interpreter?"
		  <PHRASE "WAKARIMASU" "KA">
		  "Do you understand?">>

<CONSTANT JAPANESE-VOCABULARY
	  <LTABLE (PURE)
		  <VOC "AKABO"> "porter"
		  <VOC "ANJIN"> "pilot"
		  <VOC "ARIGATO"> "very much"
		  <VOC "BANZAI"> "ten thousand years"
		  <VOC "BUSHIDO"> "Way of the Warrior"
		  <VOC "CHA"> "tea"
		  <VOC "CHA-NO-YU"> "tea ceremony"
		  <VOC "DAIMYO"> "Lord"
		  <VOC "DESU"> 0
		  <VOC "DOMO"> "thank you"
		  <VOC "DOZO"> "please"
		  <VOC "ETA"> "outcast"
		  <VOC "GA"> 0
		  <VOC "GENKI"> 0
		  <VOC "GO"> 0
		  <VOC "GOMEN"> 0
		  <VOC "GOZIEMASHITA"> 0
		  <VOC "HAI"> "yes"
		  <VOC "HANASE-MASEN"> 0
		  <VOC "IKAGA"> 0
		  <VOC "ISOGI"> "hurry"
		  <VOC "IYE"> "no"
		  <VOC "KA"> "question"
		  <VOC "KAGA"> "litter"
		  <VOC "KAMI"> "evil spirit"
		  <VOC "KINJIRU"> "forbidden"
		  <VOC "KONNICHI"> "good day"
		  <VOC "KONBANWA"> "good evening"
		  <VOC "MIZU"> "water"
		  <VOC "NAI"> 0
		  <VOC "NASAI"> 0
		  <VOC "NEH"> "eh?"
		  <VOC "NIHON"> "Japan"
		  <VOC "ONNA"> "woman"
		  <VOC "RONIN"> "masterless samurai"
		  <VOC "SEPPUKU"> "suicide"
		  <VOC "SHIGATA"> 0
		  <VOC "SHOJI"> "screen"
		  <VOC "SO"> 0
		  <VOC "TATAMI"> "mat"
		  <VOC "TEKI"> "enemy"
		  <VOC "TOMO"> "friend"
		  <VOC "TSURU"> "grulla (Spanish), grue (French), crane (English)"
		  <VOC "TSUYAKU"> "translator"
		  <VOC "WA"> 0>>

<END-SEGMENT ;"0">
