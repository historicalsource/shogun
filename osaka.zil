"OSAKA for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT ESCAPE>

<CONSTANT J-DRAG 100>
<CONSTANT J-VEIL 101>
<CONSTANT J-FLEE 102>
<CONSTANT J-MOAT 103>
<CONSTANT J-ISHIDO 104>
<CONSTANT J-PARCHMENT 105>

<OBJECT CORTEGE
	(DESC "cortege")
	(SYNONYM CORTEGE PROCESSION PARTY COLUMN GRAYS BROWNS)
	(FLAGS NDESCBIT)
	(ACTION CORTEGE-F)>

<ROUTINE CORTEGE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The procession consists of Toranaga's retainers.  Most prominent are the
litters carrying Kiritsubo and Mariko.  A force of Browns guards the column,
and a force of Grays guards the Browns." CR>)
	       (<VERB? FOLLOW>
		<COND (<NOT <IN? ,CORTEGE ,HERE>>
		       <DO-WALK ,P?SOUTH>)>)>>

<ROUTINE ESCAPE-FOLLOW-KIRI ("AUX" DIR)
	 <COND (<AND ,SEEN-TORANAGA?
		     <IN? ,KIRIS-LITTER ,COURTYARD>>
		<COND (<JIGS-UP? ,J-SWITCH
"You stop partway, realizing you might be disrupting something you know
nothing about.">
		       <TELL
"You follow Kiri into the garden and the little hut.  She's crouched inside,
trying to be quiet, but when you blunder in she screams in spite of
herself.  The scream brings guards.  They recognize Kiri and wonder, if she
is here,
who is in the litter?  It is only after the ensuing battle that Ishido
returns and orders you killed." CR>
		       <JIGS-UP>)
		      (ELSE <RTRUE>)>)
	       (<NOT <IN? ,KIRIS-LITTER ,HERE>>
		<COND (<SET DIR <NEXT-ROOM? <LOC ,KIRIS-LITTER>>>
		       <DO-WALK .DIR>)
		      (ELSE
		       <TELL "You've lost track of her." CR>)>)
	       (ELSE
		<TELL
"She's in her litter, so you can follow it when it leaves." CR>)>>

<BEGIN-SEGMENT MAZE>

<OBJECT BUNTARO
	(DESC "Buntaro")
	(SYNONYM BUNTARO)
	(ADJECTIVE LORD TODA)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT)
	(ACTION BUNTARO-F)>

<ROUTINE BUNTARO-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
"Buntaro responds sharply and impatiently, but you can't understand
what he says." CR>)
	       (<VERB? EXAMINE>
		<COND (<SCENE? ,S-ESCAPE>
		       <TELL
"Buntaro looks nervous, but alert and ready.  You feel he would like
to kill someone, and wouldn't be too particular about who." CR>)>)
	       (<VERB? WHO>
		<TELL
"Toda Buntaro, Lord of Sakura, is a short, bandy-legged, ugly man
with a quick temper.  He is the only living son of Lord Hiro-matsu,
and the husband of Lady Mariko." CR>)>>

<END-SEGMENT ;"ESCAPE MAZE">
<BEGIN-SEGMENT ESCAPE>

<OBJECT SAZUKO
	(DESC "Sazuko")
	(SYNONYM SAZUKO GIRL)
	(ADJECTIVE LADY)
	(FLAGS PERSON JAPANESEBIT FEMALE NOABIT NOTHEBIT)
	(ACTION SAZUKO-F)>

<ROUTINE SAZUKO-F ("OPT" RARG)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<VERB? WHO>
		<TELL
"Lady Sazuko is the seventh of Toranaga's official consorts, the youngest,
and very pregnant." CR>)
	       (<VERB? EXAMINE>
		<TELL
"Lady Sazuko is a short, square-faced girl of little beauty.  She is
very pregnant." CR>)>>

<ROUTINE I-ISHIDO ()
	 <ZLINES ,ISHIDO-CNT
		 (<QUEUE I-ISHIDO -1>
		  <MOVE ,ISHIDO ,FORECOURT>
		  <MOVE ,GRAYS ,FORECOURT>
		  <MOVE ,BUNTARO ,FORECOURT>
		  <MOVE ,YABU ,FORECOURT>
		  <FSET ,FORTIFIED-GATE ,OPENBIT>
		  <COND (<HERE? ,FORECOURT ,COURTYARD>
			 <TELL CR
"\"" I "Guards!" "\" The warning comes from the forecourt.  Ishido is
approaching down the avenue at the head of two hundred Grays." CR CR
"Buntaro and Yabu hurry to the fortified door as the guards open it." CR CR
"Ishido bows to Yabu elaborately.  \"A fine evening, Lord Yabu.\"  Though no man
seems hostile on either side, all are ready." CR CR
"Ishido nods perfunctorily to Buntaro, who returns the minimum politeness
allowable.  Buntaro had led one of the regiments in Korea when Ishido was
in overall command.  Each had accused the other of treachery." CR>)
			(ELSE
			 <TELL CR
"You hear a loud shout from the forecourt, and a great deal of commotion
from that direction." CR>)>)
		 (<COND (<HERE? ,FORECOURT>
			 <TELL CR
"Ishido says, \"You'd think you were all going into battle, Yabu-san,
instead of just being a ceremonial escort for the Lady Kiritsubo.\"" CR CR
"Buntaro stomps pugnaciously forward.  \"We're always ready for battle.  We
can take on ten men for each one of yours.  We never turn our backs and
run like snot-nosed cowards!\"" CR>)
			(<HERE? ,COURTYARD>
			 <TELL CR
"Ishido is arguing with Buntaro.  You are too far away to hear any of
what he is saying." CR>)>)
		 (<COND (<HERE? ,FORECOURT>
			 <TELL CR
"Yabu moves carefully between Buntaro and Ishido, wanting desperately
to avoid a clash that would lock them forever within the castle.  \"We're
among friends, Buntaro-san.\"" CR CR
"\"Friends?  Where?  In this manure pile?\" sneers Buntaro.  One of the Grays'
hands flashes for his sword hilt, ten Browns follow, and in a moment,
all are waiting for Ishido's sword to come out and signal the attack." CR>)
			(<HERE? ,COURTYARD>
			 <TELL CR
"You can see Yabu hurriedly move between Ishido and Buntaro.  You can
see even from here that there is going to be blood shed." CR>)>)
		 (<MOVE ,HIRO-MATSU ,FORECOURT>
		  <COND (<HERE? ,FORECOURT>
			 <TELL CR
"Quietly, Hiro-matsu walks out of the garden shadows into the forecourt. 
\"You can find friends in manure, sometimes, my son,\" he says
calmly.  Hands ease off sword hilts.  \"We have friends all over the castle.  All
over Osaka.\"  He stares into Buntaro's eyes.  \"Isn't that so, my son?\""
CR CR "With an enormous effort, Buntaro nods and steps back a pace." CR CR
"Ishido says mildly, \"I came to pay my respects to Lady Kiritsubo.  I was
not informed until a few moments ago that anyone was leaving.\"" CR>)
			(<HERE? ,COURTYARD>
			 <TELL CR
"You can see Hiro-matsu approach the angry pair.  He says something which
causes Buntaro to back off.  Tensions seem to ease." CR CR
"Ishido asks something politely of Hiro-matsu." CR>)>)
		 (<MOVE ,HIRO-MATSU ,COURTYARD>
		  <MOVE ,YABU ,COURTYARD>
		  <MOVE ,ISHIDO ,GENERIC-OBJECTS>
		  <DEQUEUE I-ISHIDO>
		  <QUEUE I-KIRI -1>
		  <COND (<HERE? ,FORECOURT ,COURTYARD>
			 <TELL CR
"Ishido strides through the gateway into the courtyard, Hiro-matsu and Yabu
accompanying him.  Five guards follow.  He bows politely and wishes Kiritsubo
well." CR CR
"Satisfied that all is as it should be, Ishido turns and leaves with all
his men.  Hiro-matsu exhales and scratches his piles.">
			 <COND (<HERE? ,COURTYARD>
				<TELL "\"You'd better
leave now, Yabu-san.  That rice maggot'll give you no more trouble.\"  Yabu
replies, \"Yes, at once.\"" CR>)
			       (ELSE
				<TELL "He says something to Yabu, who bows
and then begins to get the escort moving." CR>)>)>)>>	       

<OBJECT TORANAGA-IN-DRAG
	;(DESC "Toranaga")
	(SDESC "veiled figure")
	(SYNONYM FIGURE KIRI KIRITSUBO KIRITSUBO ;"TORANAGA")
	(ADJECTIVE VEILED DISGUISED)
	(FLAGS PERSON FEMALE JAPANESEBIT SCOREBIT OPENBIT CONTBIT SEARCHBIT)
	(GENERIC GENERIC-TORANAGA-F)
	(ACTION TORANAGA-IN-DRAG-F)>

<ROUTINE TORANAGA-IN-DRAG-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL
CTHE ,TORANAGA-IN-DRAG " looks at you, but doesn't reply." CR>)
	       (<VERB? EXAMINE>
		<COND (<IN? ,PRSO ,KIRIS-LITTER>
		       <TELL
"You can't get a good look at " THE ,PRSO "." CR>)
		      (<FSET? ,TORANAGA-IN-DRAG ,SCOREBIT>
		       <REPLACE-SYNONYM ,TORANAGA-IN-DRAG
					,W?KIRITSUBO
					,W?TORANAGA>
		       <FCLEAR ,TORANAGA-IN-DRAG ,FEMALE>
		       <TELL
"You look at the veiled figure.  She is dressed exactly like Kiri, and at
first you assume that it must be her.  But if so, how did she get
here?  Then you look more carefully, and realize it's a man, not a woman --
it's Toranaga, in disguise!  What can he be planning?  Escape!" CR>
		       <SCORE-OBJECT ,TORANAGA-IN-DRAG>)
		      (ELSE
		       <TELL
"Toranaga looks back at you and makes a gesture that you can clearly
see means 'go away.'" CR>)>)
	       (<HOSTILE-VERB?>
		<COND (<JIGS-UP? ,J-DRAG
"You reconsider your options.  If the Japanese want to hide in tea houses,
what concern is it of yours?">
		       <COND (<FSET? ,TORANAGA-IN-DRAG ,SCOREBIT>
			      <TELL
"You grapple with the veiled figure.  As you fight, her veil drops off"
G", revealing Toranaga!  You are stunned, and back off, amazed, but it is
too late.  The commotion has attracted others, and Toranaga has drawn
his sword from beneath the incongruously feminine kimono.  His sword is
as sharp as it needs to be, though." CR>)
			     (ELSE
			      <TELL
"You grapple with Toranaga, whose feminine kimono conceals armor and
swords.  He draws his killing sword and ends your life." CR>)>
		       <JIGS-UP>)
		      (ELSE <RTRUE>)>)>>

<OBJECT VEIL
	(LOC TORANAGA-IN-DRAG)
	(DESC "veil")
	(SYNONYM VEIL)
	(FLAGS NDESCBIT TAKEBIT DONT-ALL)
	(ACTION VEIL-F)>

<ROUTINE VEIL-F ()
	 <COND (<AND <VERB? EXAMINE LOOK-INSIDE LOOK-BEHIND LOOK-UNDER RAISE>
		     <IN? ,VEIL ,TORANAGA-IN-DRAG>>
		<PERFORM ,V?EXAMINE ,TORANAGA-IN-DRAG>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     <IN? ,VEIL ,TORANAGA-IN-DRAG>>
		<COND (<FSET? ,TORANAGA-IN-DRAG ,SCOREBIT>
		       <COND (<JIGS-UP? ,J-VEIL
"You recall how your countrymen would react to someone snatching a lady's
clothing, and refrain.">
			      <MOVE ,VEIL ,WINNER>
			      <TELL
"You snatch the veil"
G", revealing Toranaga!  You are stunned, and back off, amazed, but it is
too late.  The commotion has attracted others, and Toranaga has drawn
his sword from beneath the incongruously feminine kimono.  His sword is
as sharp as it needs to be, though." CR>
			      <JIGS-UP>)
			     (ELSE <RTRUE>)>)>)>>

<BEGIN-SEGMENT SEPPUKU>

<ROOM COURTYARD
      (LOC ROOMS)
      (SCENE S-ESCAPE)
      (DESC "Courtyard")
      (SYNONYM COURTYARD)
      (PICTURE P-PROCESSION)
      (SCORE 13)
      (AFTER HATAMOTO-AFTER-F)
      (FDESC
"Just after dusk Kiri waddled nervously down the steps.  She headed for
her curtained litter that stood near the little tea house just inside
the garden.  You are leaning
against the wall near the fortified gate.  You are wearing a belted
kimono of the Browns and tabi socks and military thongs.")
      (SOUTH TO FORECOURT IF FORTIFIED-GATE IS OPEN)
      (OUT TO FORECOURT IF FORTIFIED-GATE IS OPEN)
      (WEST TO FORMAL-GARDEN IF GARDEN-GATE IS OPEN)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL FORTIFIED-GATE SAMURAI-GUARDS GARDEN-GATE
       ISHIDO BUNTARO YABU HIRO-MATSU)
      (ACTION COURTYARD-F)>

<ROUTINE COURTYARD-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<QUEUE I-ISHIDO 2>
		<MOVE ,TORANAGA-IN-DRAG ,TEA-HOUSE>
		<MOVE ,MARIKO ,HERE>
		<MOVE ,SAZUKO ,HERE>
		<MOVE ,KIRITSUBO ,KIRIS-LITTER>
		<MOVE-CORTEGE ,HERE>)
	       (<RARG? LOOK>
		<TELL
"This is the courtyard of Toranaga's keep within Osaka castle.  The garden
is through a gate to the west, and to the south is the forecourt and
fortified gate that guards the keep.|
|
In the forecourt, outside the gate, ">
		<COND (<SCENE? ,S-ESCAPE>
		       <TELL "an escort of sixty heavily armed samurai
is drawn up in neat lines, every third man carrying a flare." CR>)
		      (<SCENE? ,S-SEPPUKU>
		       <TELL "is a crowd of Grays, and mingling with
them other samurai and their women." CR>)>)
	       (<RARG? BEG>
		<COND (<AND <OR <PRSO? ISHIDO BUNTARO YABU HIRO-MATSU>
				<PRSI? ISHIDO BUNTARO YABU HIRO-MATSU>>
			    <NOT <IN? ,PRSO ,HERE>>>
		       <COND (<IN? ,PRSO ,FORECOURT>
			      <TELL
CTHE ,PRSO " seems to be talking with some others by the gate.  You are too
far away to really tell what's going on." CR>)
			     (ELSE
			      <TELL
CTHE ,PRSO " doesn't seem to be anywhere nearby." CR>)>) 
		      (<AND <P? WALK (P?SOUTH P?OUT)>
			    <NOT <FSET? ,FORTIFIED-GATE ,OPENBIT>>>
		       <TELL
"You must wait for the gate to be opened." CR>)
		      (<AND <P? WALK P?WEST>
			    <SCENE? ,S-ESCAPE>
			    ,BEEN-IN-GARDEN?>
		       <TELL
"\"No, Anjin-san, stay here!\" Mariko says.  \"We are leaving soon.\"" CR>)>)>>

<END-SEGMENT ;"ESCAPE+SEPPUKU">
<BEGIN-SEGMENT ESCAPE>

<ROUTINE I-KIRI ()
	 <ZLINES ,KIRI-CNT
		 (<COND (<HERE? ,COURTYARD>
			 <TELL CR
"Kiritsubo begins to cry.  She obviously doesn't want to leave.  She tries
to stifle her sobs and unlooses her thick veil.  She calls Yabu over to
her litter and points to Lady Sazuko, Toranaga's pregnant consort, apparently
giving him instructions.  All you can understand is the word "I"dozo"",
'please.'  Yabu bows." CR>)
			(ELSE
			 <TELL CR
"You can hear conversations and crying coming from the courtyard." CR>)>)
		 (<FSET ,KIRITSUBO ,SCOREBIT>
		  <COND (<HERE? ,COURTYARD>
			 <TELL CR
"Lady Sazuko bows and hurries off, Yabu following.  The girl runs up the
steps.  As she nears the top she slips and falls.  Kiri screams something
in Japanese.  All eyes flash to the prostrate girl." CR>)
			(<HERE? ,FORMAL-GARDEN>
			 <SETG SEEN-TORANAGA? T>
			 <TELL CR
"Kiritsubo hurries through the garden into the little tea house, then
emerges again moments later.  As she passes you, your eyes meet.  ">
			 <COND (<FSET? ,TORANAGA-IN-DRAG ,SCOREBIT>
				<REPLACE-SYNONYM ,TORANAGA-IN-DRAG
						 ,W?KIRITSUBO
						 ,W?TORANAGA>
				<TELL
"It is not Kiri, but Toranaga in disguise!" CR>)
			       (ELSE
				<TELL
"It is Toranaga.  Kiritsubo and Toranaga have switched!" CR>)>
			 <TELL CR
"The figure slips into Kiri's litter, veil drawn." CR>
			 <SCORE-OBJECT ,TORANAGA-IN-DRAG ,KIRITSUBO>)
			(<HERE? ,TEA-HOUSE>
			 <TELL CR
"Suddenly, Kiritsubo dashes into the tea house.  When she sees you, she
screams in surprise.  In moments, Yabu pokes his head into the tea house.  ">
			 <JIGS-UP
"He sees the veiled figure, who immediately draws a
sword and surprisingly attacks you rather than Yabu.">
			 <CRLF>)
			(ELSE
			 <TELL CR
"There seems to be some commotion in the courtyard." CR>)>)
		 (<MOVE ,TORANAGA-IN-DRAG ,KIRIS-LITTER>
		  <MOVE ,KIRITSUBO ,TEA-HOUSE>
		  <FCLEAR ,KIRITSUBO ,SCOREBIT>
		  <COND (<HERE? ,COURTYARD>
			 <COND (<EQUAL? ,OHERE ,FORMAL-GARDEN>
				<TELL CR
"You see that Sazuko, one of Toranaga's consorts, has fallen to the
ground.  She is pregnant, and everyone is terrified for the safety of
the child." CR>)>
			 <TELL CR
"Mariko and Yabu rush to aid the girl.  Yabu picks her up.  Sazuko is
more startled than hurt.  She speaks to them, embarrassed at her clumsiness,
then stands.  Everyone relaxes.  Toranaga's unborn child is safe." CR>)
			(ELSE
			 <TELL CR
"The commotion in the courtyard seems to have subsided." CR>)>)
		 (<REMOVE ,SAZUKO>
		  <COND (<HERE? FORMAL-GARDEN TEA-HOUSE>
			 <I-COME-BACK>)>
		  <MOVE ,MARIKO ,MARIKOS-LITTER>
		  <COND (<HERE? ,COURTYARD>
			 <TELL CR
"Yabu shouts orders at the head of the column and sets off.  Mariko
gets into her litter, leaving the curtains partially open.  Kiri's litter
is closed." CR>)
			(ELSE
			 <TELL CR
"You can hear the procession preparing to move out." CR>)>)
		 (<MOVE-CORTEGE ,FORECOURT>
		  <MOVE ,HIRO-MATSU ,GENERIC-OBJECTS>
		  <COND (<HERE? ,COURTYARD ,FORECOURT>
			 <TELL CR
"The column begins to move out into the forecourt, the litter bearers
carrying Mariko's and Kiritsubo's litters.  Samurai move to the great
door and prepare to close it." CR>)
			(ELSE
			 <TELL CR
"You can hear the procession moving off." CR>)>)
		 (DELAY
		  <COND (<IN? ,PLAYER ,COURTYARD>
			 <TELL CR
"The samurai eye you strangely, motioning you through the gate." CR>
			 <RTRUE>)>)
		 (<FCLEAR ,FORTIFIED-GATE ,OPENBIT>
		  <TELL CR
"The last of the column moves out into the forecourt, and the huge
fortified door closes as the great wooden bar falls into place.  The head
of the column is already moving on towards the gateway." CR>)
		 (DELAY
		  <COND (<HERE? ,FORECOURT>
			 <TELL CR
"You are urged along by the other members of the procession." CR>
			 <RTRUE>)>)
		 (<TELL-CHECKPOINTS>)>>

<ROUTINE TELL-CHECKPOINTS ()
	 <DEQUEUE I-KIRI>
	 <MOVE-CORTEGE ,GATEWAY>
	 <SETG ISHIDO-CNT 0>
	 <QUEUE I-ISHIDO-2 -1>
	 <TELL CR
"The little cortege surrounding the two litters goes slowly through the maze
of the castle and through the continual checkpoints.  Each time there are
formal bows, the documents are meticulously examined afresh, a new captain
and group of escorting Grays take over, and then you are passed.  At each
checkpoint you watch with increasing misgivings as the captain of the
guard comes close to scrutinize the drawn curtains of Kiritsubo's litter. 
Each time the man bows politely to the half-seen figure, hears the muffled
sobs, and in the course of time, waves you on again.|
|
Finally, you pass a checkpoint, turn a corner, and reach the last barrier."
CR>>

<OBJECT CURTAINS
	(LOC KIRIS-LITTER)
	(OWNER KIRITSUBO)
	(DESC "curtains")
	(SYNONYM CURTAIN CURTAINS)
	(FLAGS NDESCBIT SCOREBIT OPENABLE)
	(ACTION CURTAINS-F)>

<ROUTINE CURTAINS-F ()
	 <COND (<VERB? OPEN CLOSE>
		<COND (<AND <VERB? OPEN>
			    <NOT <FSET? ,CURTAINS ,OPENBIT>>
			    <QUEUED? I-ISHIDO-2>
			    <G=? ,ISHIDO-CNT 3>>
		       <SETG ISHIDO-CNT 5>
		       <SETG ISHIDO-DISTRACTED? <>>
		       <FSET ,CURTAINS ,OPENBIT>
		       <TELL
"You shove the curtains open, revealing not Kiritsubo, but Toranaga!  He is
veiled and dressed in a woman's kimono, but there's no mistaking him!" CR>)
		      (ELSE
		       <TELL
"Kiritsubo's maids politely bar your approach." CR>)>)
	       (<VERB? LOOK-INSIDE>
		<TELL
"All you can see is a shadowy, veiled figure." CR>)>>

<GLOBAL BEEN-IN-GARDEN? <>>

<ROUTINE I-COME-BACK ()
	 <COND (<AND <FSET? ,KIRITSUBO ,SCOREBIT>
		     <LOC ,SAZUKO>>
		<QUEUE I-COME-BACK 2>
		<RFALSE>)>
	 <SETG BEEN-IN-GARDEN? T>
	 <COND (<AND <HERE? FORMAL-GARDEN TEA-HOUSE>
		     <EQUAL? <LOC ,MARIKO>
			     ,COURTYARD ,MARIKOS-LITTER ,FORECOURT>>
		<TELL CR
"Mariko calls to you again, \"Anjin-san, come here!\"  She speaks
briefly to Yabu, who bustles into the garden to get you.  ">
		<COND (<AND <HERE? TEA-HOUSE>
			    <OR <IN? ,TORANAGA-IN-DRAG ,HERE>
				<IN? ,KIRITSUBO ,HERE>>>
		       <TELL
"Yabu calls for you, searching the garden, and then looks in the
tea house.  ">
		       <COND (<IN? ,TORANAGA-IN-DRAG ,HERE>
			      <JIGS-UP
"He sees the veiled figure, who immediately draws a
sword and surprisingly attacks you rather than Yabu.">)
			     (ELSE
			      <JIGS-UP
"He sees Kiritsubo, and emits a yelp of surprise.  In moments, others
are drawn by the commotion, and as soon as the situation becomes clear,
a battle erupts.">)>
		       <RFATAL>)
		      (ELSE
		       <TELL
"He hustles you unceremoniously back to the courtyard." CR CR>
		       <GOTO ,COURTYARD>)>)>>

<BEGIN-SEGMENT MAZE>

<OBJECT KIRIS-LITTER
	;(LOC COURTYARD)
	(OWNER KIRITSUBO)
	(DESC "Kiritsubo's curtained litter")
	(SYNONYM LITTER PALANQUIN)
	(ADJECTIVE KIRITSUBO KIRI CURTAINED)
	(FLAGS SEARCHBIT NOTHEBIT NOABIT VEHBIT OPENBIT CONTBIT)
	(DESCFCN KIRIS-LITTER-DESC)
	(GENERIC GENERIC-LITTER-F)
	(ACTION KIRIS-LITTER-F)>

<ROUTINE KIRIS-LITTER-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"Kiritsubo's curtained litter ">
		<COND (<HERE? ,COURTYARD>
		       <TELL "sits near the garden gate">)
		      (ELSE
		       <TELL "is nearby">)>
		<COND (<OR <IN? .OBJ ,KIRITSUBO>
			   <IN? .OBJ ,TORANAGA-IN-DRAG>>
		       <TELL ", and through the ">
		       <COND (<FSET? ,CURTAINS ,OPENBIT>
			      <TELL "open">)
			     (ELSE
			      <TELL "closed">)>
		       <TELL
" curtains you can see the shadowy figure of Kiritsubo.">)
		      (ELSE <TELL ".">)>
		<RFATAL>)>>

<ROUTINE KIRIS-LITTER-F ("OPT" (RARG <>))
	 <COND (.RARG <RFALSE>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,CURTAINS ,OPENBIT>
		       <TELL
"Through the open curtains of the litter you can see ">
		       <COND (,SEEN-TORANAGA?
			      <TELL "a disguised Toranaga." CR>)
			     (ELSE
			      <TELL "Kiritsubo." CR>)>)
		      (ELSE
		       <TELL
"The litter is heavily curtained, and the curtains are closed." CR>)>)
	       (<VERB? BOARD>
		<TELL
"Kiritsubo's maid prevents you." CR>)
	       (<VERB? OPEN CLOSE LOOK-INSIDE>
		<PERFORM ,PRSA ,CURTAINS>
		<RTRUE>)>>

<OBJECT MARIKOS-LITTER
	;(LOC COURTYARD)
	(OWNER MARIKO)
	(DESC "Mariko's litter")
	(SYNONYM LITTER PALANQUIN)
	(ADJECTIVE MARIKO)
	(FLAGS SEARCHBIT NOABIT NOTHEBIT VEHBIT OPENBIT CONTBIT SCOREBIT)
	(DESCFCN MARIKOS-LITTER-DESC)
	(GENERIC GENERIC-LITTER-F)
	(ACTION MARIKOS-LITTER-F)>

<ROUTINE MARIKOS-LITTER-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<AND <HERE? WOODS CITY>
			    <P? WALK>
			    <NOT <PRSO? ,P?EAST>>>
		       <TELL
"\"No, Anjin-san, the docks are to the east, through the city.\"  The kaga-men
don't move." CR>)
		      (<VERB? SIT>
		       <TELL G"You are already sitting down." CR>)
		      (<AND <VERB? SLEEP>
			    <NOT ,OPPONENT>
			    <NOT <QUEUED? I-AMBUSH>>>
		       <TELL
"You manage to doze a little, regaining some strength." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? BOARD>
		       <COND (<HERE? ,WOODS>
			      <GET-IN-LITTER>)
			     (ELSE
			      <TELL
"Mariko's maid prevents you." CR>)>)>)>>

<END-SEGMENT ;"ESCAPE+MAZE">
<BEGIN-SEGMENT ESCAPE>

<ROUTINE GET-IN-LITTER ("OPT" (FORCE? <>))
	 <DEQUEUE I-ESCAPE-CONTINUES>
	 <MOVE ,PLAYER ,MARIKOS-LITTER>
	 <COND (.FORCE?
		<TELL CR
"Mariko motions to the escort, and with great politeness but very
insistently, they load you">)
	       (ELSE
		<TELL
"You sway on your feet, and allow yourself to be helped">)>
	 <TELL
" into the litter.  At once the procession starts again.  The rolling gait
is soothing and you lay back, depleted." CR CR>
	 <MOVE ,KIRIS-LITTER ,CITY>
	 <MOVE ,BUNTARO ,CITY>
	 <MOVE ,YABU ,CITY>
	 <GOTO ,CITY>>

<BEGIN-SEGMENT DEPARTURE>

<ROUTINE MARIKOS-LITTER-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"Mariko's litter is here">
		<COND (<IN? ,MARIKO .OBJ>
		       <TELL ", and through
the open curtains you can see Mariko.">)
		      (ELSE <TELL ".">)>
		<RFATAL>)>>

<BEGIN-SEGMENT SEPPUKU>

<ROOM FORECOURT
      (LOC ROOMS)
      (SCENE S-DEPARTURE)
      (SCORE 1)			;"these points aren't assigned yet"
      (DESC "Forecourt")
      (AFTER DEPARTURE-AFTER-F)
      (FDESC
"Mariko walks up the crowded sunlit avenue toward the gates in the
cul-de-sac.  Behind her is a bodyguard of Browns.  Unlike the Grays
lining the avenue and watching from the battlements, none have armor
or carry bows.  Swords are their only weapons.|
|
Mariko gets into her palanquin and sits.  \"Yoshinaka-san!  Please begin.\"")
      (SYNONYM FORECOURT)
      (NORTH TO COURTYARD IF FORTIFIED-GATE IS OPEN)
      (IN TO COURTYARD IF FORTIFIED-GATE IS OPEN)
      (SOUTH TO GATEWAY)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL FORTIFIED-GATE GARDEN-GATE SAMURAI-GUARDS)
      (ACTION FORECOURT-F)>

<ROUTINE FORECOURT-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<MOVE ,SWORDS ,BLACKTHORNE>
		<FSET ,SWORDS ,WEARBIT>
		<MOVE ,SAZUKO ,FORECOURT>
		<MOVE ,KIRITSUBO ,FORECOURT>
		<MOVE ,GRAYS ,FORECOURT>
		<MOVE ,BROWNS ,FORECOURT>
		<MOVE ,MARIKOS-LITTER ,FORECOURT>
		<MOVE ,MARIKO ,MARIKOS-LITTER>
		<QUEUE I-DEPARTURE -1>)
	       (<RARG? LOOK>
		<TELL
"This is the forecourt of Toranaga's keep.  To the south is the maze of
paths and walls that makes up the rest of the castle.  To the north, through an
arched gateway with a fortified gate, is a courtyard.">
		<COND (<SCENE? ,S-DEPARTURE ,S-SEPPUKU>
		       <TELL "The forecourt is crowded with Grays,
other samurai and their women.">)>
		<CRLF>)
	       (<RARG? LEAVE>
		<COND (<AND <SCENE? ,S-ESCAPE>
			    <IN? ,KIRIS-LITTER ,FORECOURT>>
		       <TELL-CHECKPOINTS>
		       <CRLF>)>)
	       (<RARG? BEG>
		<COND (<P? WALK>
		       <COND (<SCENE? ,S-DEPARTURE>
			      <COND (<QUEUED? I-FIGHT>
				     <COND (<JIGS-UP? ,J-FLEE
"You'd never get away!  It's a fight to the finish.">
					    <JIGS-UP
"Your opponent, who until now has shown reluctance to do you real harm,
sees you attempting to flee, and charges you.  He attacks viciously,
overwhelming your inexpert defense.  In moments, you are cut down.">)
					   (ELSE <RTRUE>)>)
				    (ELSE
				     <TELL
"Mariko says, \"Please, Anjin-san, you cannot abandon me now.  I must
fulfill my duty.\"" CR>)>)
			     (<EQUAL? ,P-WALK-DIR ,P?NORTH>
			      <COND (<AND <SCENE? ,S-ESCAPE>
					  <IN? ,CORTEGE ,HERE>>
				     <TELL
"The guards won't let you back through the gate." CR>)>)
			     (<EQUAL? ,P-WALK-DIR ,P?SOUTH>
			      <COND (<SCENE? ,S-ESCAPE>
				     <COND (<QUEUED? I-ISHIDO>
					    <TELL
"The Grays stop you, indicating that you must leave with Kiritsubo or
not at all." CR>)
					   (<QUEUED? I-KIRI>
					    <COND (<IN? ,SAZUKO ,COURTYARD>
						   <TELL
"You start off into the maze of the castle, and then think better of
it, deciding to wait for the rest of the cortege." CR>)
						  (<OR <IN? ,KIRIS-LITTER ,GATEWAY>
						       <IN? ,KIRIS-LITTER ,FORECOURT>>
						   <RFALSE>)
						  (ELSE
						   <TELL
"You decide it would be too dangerous to get ahead of the rest of the
cortege." CR>)>)>)
				    (<SCENE? ,S-DEPARTURE>
				     <TELL
"A near-solid mass of Gray samurai blocks the avenue." CR>)
				    (<SCENE? ,S-SEPPUKU>
				     <TELL
"The avenue is blocked by the onlookers nervously anticipating the
events to come." CR>)>)>)
		      (<AND <VERB? PARRY STOP>
			    <HELD? ,SWORDS>
			    <QUEUED? I-FIGHT>>
		       <TELL
"You force your sword around, desperately trying to block the attack!" CR>)>)>>

<OBJECT FORTIFIED-GATE
	(LOC LOCAL-GLOBALS)
	(DESC "fortified gate")
	(SYNONYM GATE DOOR)
	(ADJECTIVE FORTIFIED)
	(FLAGS DOORBIT)
	(ACTION FORTIFIED-GATE-F)>

<ROUTINE FORTIFIED-GATE-F ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL
"You could no more open or close this gate by yourself than tear
down Osaka Castle with your bare hands." CR>)>>

<END-SEGMENT ;"ESCAPE+DEPARTURE+SEPPUKU">
<BEGIN-SEGMENT ESCAPE>

<OBJECT PORTCULLIS
	(LOC LOCAL-GLOBALS)
	(DESC "portcullis")
	(SYNONYM PORTCULLIS)
	(ADJECTIVE IRON)
	(FLAGS DOORBIT OPENBIT)>

<ROOM GATEWAY
      (LOC ROOMS)
      (DESC "Gateway")
      (SYNONYM GATEWAY)
      (SOUTH TO ON-BRIDGE)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL SAMURAI-GUARDS)
      (ACTION GATEWAY-F)>

<ROUTINE GATEWAY-F (RARG "AUX" (MAD? <>))
	 <COND (<RARG? LOOK>
		<TELL
"This is the last portcullis and last gateway of the castle, and beyond
is the final drawbridge and the final moat.  To the south, on the far side
of the bridge,
is the ultimate strongpoint.">
		<COND (<SCENE? ,S-ESCAPE>
		       <TELL "A multitude of flares turn the night into
crimson day.">)
		      (ELSE
		       <TELL
"Crowds of curious onlookers clog the street.">)>
		<CRLF>)
	       (<RARG? ENTER>
		<COND (<EQUAL? ,OHERE ,FORECOURT>
		       <SETG ISHIDO-CNT 0>
		       <QUEUE I-ISHIDO-2 -1>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<SCENE? ,S-ESCAPE>
		       <SET MAD?
			    <OR <QUEUED? I-ISHIDO-2>
				<QUEUED? I-MADNESS>>>
		       <COND (<P? EXAMINE (MARIKO YABU BUNTARO)>
			      <COND (.MAD?
				     <TELL D ,PRSO " looks very ">
				     <COND (<QUEUED? I-MADNESS>
					    <TELL "scared." CR>)
					   (ELSE
					    <TELL "worried." CR>)>)>)
			     (<P? HELP TORANAGA>
			      <TELL
"Precisely what you need to do, but how?" CR>)
			     (<VERB? WALK>
			      <COND (<QUEUED? I-MARIKO-FOLLOW>
				     <SETG ISHIDO-DISTRACTED? ,PRSA>
				     <RFALSE>)
				    (<PRSO? P?SOUTH>
				     <COND (.MAD?
					    <COND (,SEEN-MAD-SCENE?
						   <SETG ISHIDO-DISTRACTED?
							 ,PRSA>
						   <TELL
"You bow to Ishido like a spastic puppet and half walk, half dance for
the gateway.  \"Follow me, follow me!\" you shout, like a demented
Pied Piper." CR>)>
					    <TELL "The Grays bar the way." CR>
					    <COND (,SEEN-MAD-SCENE?
						   <TELL CR
"You roar with feigned rage and imperiously order them out of the way,
then immediately switch to hysterical laughter." CR>)>
				     <RTRUE>)>)
				    (<AND <PRSO? P?NORTH>
					  .MAD?>
				     <TELL
"The narrow street is blocked by the litters, kaga-men, and escorts." CR>)>)
			     (<AND <OR <P? STOP (<> CRAZY)>
				       <P? ACT SANE>>
				   <QUEUED? I-MARIKO-FOLLOW>>
			      <COND (<NOT <FSET? ,BLACKTHORNE ,RMUNGBIT>>
				     <FSET ,BLACKTHORNE ,RMUNGBIT>
				     <SETG ISHIDO-DISTRACTED? ,PRSA>
				     <TELL
"You stop instantly, turn and walk quietly toward the bridge." CR>)
				    (ELSE
				     <TELL
"You've already stopped." CR>)>)
			     (<P? (TAKE STOP) ISHIDO>
			      <PERFORM ,V?ATTACK ,ISHIDO>
			      <RTRUE>)
			     (<P? BOW ISHIDO>
			      <TELL
"He looks at you contemptuously." CR>)
			     (<AND <HOSTILE-VERB?>
				   <PRSO? ISHIDO>>
			      <COND (<EQUAL? ,MADNESS-CNT 3>
				     <SETG ISHIDO-DISTRACTED? ,PRSA>
				     <TELL
"You go berserk, bunching your fists and hurling yourself at
Ishido.  It takes four Browns to haul you off, then Buntaro smashes you hard on
the back of your neck, stunning you." CR>)
				    (<JIGS-UP? ,J-ISHIDO
"The moment for such an action has passed.  Now it would be fatal.">
				     <JIGS-UP
"Ishido is stunned by your ferocity, shocked by your madness, and amazed
by your insolence.  His sword, unsurprisingly, is as sharp as it looks,
and he uses it well.">)
				    (ELSE <RTRUE>)>)
			     (<OR <ACT-CRAZY?>
				  <P? DISTRACT ISHIDO>>
			      <COND (<OR <G=? ,ISHIDO-CNT 3>
					 <QUEUED? I-MADNESS>>
				     <COND (<L? ,JERK-CNT 2>
					    <SETG ISHIDO-DISTRACTED? ,PRSA>)>
				     <COND (<NOT ,SEEN-MAD-SCENE?>
					    <SETG SEEN-MAD-SCENE? T>
					    <MARGINAL-PIC ,P-MAD-SCENE>)>
				     <COND (<EQUAL? ,ISHIDO-CNT 3 4 5>
					    <COND (<L? ,JERK-CNT 2>
						   <TELL
"Ishido and the others whirl on you dumbfounded.">
						   <TORANAGA-CLOSES-CURTAIN>
						   <CRLF>
						   <SCORE-OBJECT ,CRAZY>)
						  (ELSE
						   <TELL
"Ishido starts briefly, but is more interested in Kiri's litter." CR>)>)
					   (ELSE
					    <TELL
"Everyone continues to stare at you.  The tension is incredible, and your
exhaustion is beginning to take its toll." CR>)>)>)>)>)>>

<GLOBAL SEEN-MAD-SCENE? <>>

<ROUTINE TORANAGA-CLOSES-CURTAIN ()
	 <SETG ISHIDO-DISTRACTED? ,PRSA>
	 <DEQUEUE I-ISHIDO-2>
	 <SETG ISHIDO-CNT 0>
	 <QUEUE I-MADNESS -1>
	 <COND (<FSET? ,CURTAINS ,OPENBIT>
		<FCLEAR ,CURTAINS ,OPENBIT>
		<TELL "For an instant Toranaga
is in full view behind Ishido.  In the never-ending second before Toranaga
tugs the curtains closed again, you know that Yabu has recognized him,
and Mariko, and probably Buntaro and some of the Brown samurai.">)>>

<GLOBAL ISHIDO-DISTRACTED? <>>

<GLOBAL JERK-CNT 0>

<ROUTINE I-ISHIDO-2 ()
	 <ZLINES ,ISHIDO-CNT
		 (DELAY
		  <COND (<OR <QUEUED? I-KIRI>
			     <NOT <HERE? ,GATEWAY>>
			     <NOT <IN? ,KIRIS-LITTER ,HERE>>>
			 <RFALSE>)>)
		 (;1
		  <MOVE ,ISHIDO ,GATEWAY>
		  <THIS-IS-IT ,ISHIDO>
		  <TELL CR
"Ishido steps from the shadows.  The Browns see him almost in the same
instant.  Hostility whips though them.  Buntaro almost leaps past you to
get nearer the head of the column." CR>)
		 (;2
		  <MOVE ,PARCHMENT ,ISHIDO>
		  <THIS-IS-IT ,ISHIDO>
		  <TELL CR
"Ishido takes a roll of parchment out of his sleeve.  \"I wanted to ask
Lady Kiritsubo if she'd take this with her to Yedo.  For my niece.  It's
unlikely I'll go to Yedo for some time.\"|
|
\"Certainly.\"  Yabu puts out his hand to take the parchment.|
|
\"Don't trouble yourself, Yabu-san.  I'll ask her.\"  Ishido walks toward
the litter." CR CR
"The maids obsequiously intercept Ishido.  \"May I take the message,
Lord.  My Mis--\"|
|
\"No.\"  To Ishido's surprise the maids do not move out of the way." CR>)
		 (;3
		  <TELL CR
"\"Move!\" Buntaro snarls.  Both maids back off, frightened.|
|
Ishido bows to the curtain.  \"Kiritsubo-san, I wonder if you'd be kind
enough to take this message for me to Yedo?  To my niece?\"|
|
There is a slight hesitation between the sobs and the figure bows an
assent.|
|
\"Thank you.\"  Ishido offers up the slim roll of parchment an inch from
the curtains." CR>)
		 (;4
		  <THIS-IS-IT ,ISHIDO>
		  <TELL CR
"Everyone is waiting for the hand to appear.">
		  <COND (,SEEN-TORANAGA?
			 <TELL
"You realize Toranaga is trapped.  Politeness demands that he take the
scroll and his hand will give him away!">)>
		  <TELL CR CR
"Ishido is getting impatient.  \"Kiritsubo-san?\" he calls." CR>)
		 (;5
		  <COND (<NOT ,ISHIDO-DISTRACTED?>
			 <THIS-IS-IT ,ISHIDO>
			 <COND (<IN? ,ISHIDO <LOC ,KIRIS-LITTER>>
				<FSET ,CURTAINS ,OPENBIT>
				<SETG JERK-CNT <+ ,JERK-CNT 1>>
				<TELL CR
"Ishido takes a quick pace forward and jerks the curtains of the
litter apart." CR>)
			       (ELSE
				<TELL CR
G"Ishido takes a few paces toward the retreating litter." CR>)>)>)
		 (;6
		  <COND (<NOT ,ISHIDO-DISTRACTED?>
			 <COND (<IN? ,ISHIDO <LOC ,KIRIS-LITTER>>
				<DEQUEUE I-ISHIDO-2>
				<TELL CR
"In shock, Ishido stares into the litter, recognizing Toranaga in
spite of his disguise.  \"Guards!\" he yells, as Yabu, Mariko, and
Buntaro all realize what is happening.  Buntaro begins to draw his
sword, but before he can strike at Ishido a hail of arrows stitches
him.  Within moments the column is a shambles as the Browns and Grays
try to defend their masters." CR CR>
				<JIGS-UP
"Toranaga, encumbered by his disguise, is unable even to defend
himself.  It is only seconds before both he and Ishido are cut down,
and not long after, an arrow finds your heart.">
				<RFATAL>)
			       (ELSE
				<TELL CR
G"Ishido takes a few paces toward the retreating litter, then
stops." CR>)>)>)
		 (DELAY
		  <COND (<AND <NOT ,ISHIDO-DISTRACTED?>
			      <OR <IN? ,KIRIS-LITTER ,AT-PORTCULLIS>
				  <IN? ,KIRIS-LITTER ,ON-BRIDGE>>>
			 <COND (<G? ,DELAY-CNT 2>
				<TELL CR
"Ishido seems to come to a decision.  It appears to involve arrows." CR>
				<JIGS-UP>
				<RFATAL>)
			       (ELSE
				<TELL CR
"Ishido watches the cortege, a strange expression on his face." CR>
				<RTRUE>)>)>)
		 (<DEQUEUE I-ISHIDO-2>
		  <RFALSE>)>>

<ROOM ON-BRIDGE
      (SCENE S-ESCAPE)
      (LOC ROOMS)
      (DESC "Bridge")
      (SYNONYM BRIDGE)
      (ADJECTIVE LAST)
      (LDESC
"This is the last bridge.  It leads south over the moat from the last
checkpoint.")
      (NORTH TO GATEWAY)
      (SOUTH TO AT-PORTCULLIS)
      (FLAGS ONBIT OUTSIDE)
      (ACTION ON-BRIDGE-F)>

<ROUTINE ON-BRIDGE-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<P? (LEAP DIVE) (ON-BRIDGE GLOBAL-HERE)>
		       <COND (<JIGS-UP? ,J-MOAT>
			      <JIGS-UP
"You plunge into the moat and drown.">)
			     (ELSE <RTRUE>)>)
		      (<SCENE? ,S-SEPPUKU> <RFALSE>)
		      (<AND <P? WALK P?SOUTH>
			    <QUEUED? I-MARIKO-FOLLOW>>
		       <SETG ISHIDO-DISTRACTED? ,PRSA>
		       <RFALSE>)>)>>

<ROOM AT-PORTCULLIS
      (LOC ROOMS)
      (DESC "Portcullis")
      (SYNONYM PORTCULLIS)
      (ADJECTIVE LAST)
      (LDESC
"This is the last portcullis.  To the north is the bridge over the
moat.  Guards watch you curiously.")
      (SOUTH TO WOODS)
      (NORTH TO ON-BRIDGE)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL PORTCULLIS SAMURAI-GUARDS)
      (ACTION AT-PORTCULLIS-F)>

<ROUTINE AT-PORTCULLIS-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<SCENE? ,S-SEPPUKU> <RFALSE>)
		      (<P? WALK SOUTH>
		       <COND (<QUEUED? I-MADNESS>
			      <DEQUEUE I-MADNESS>
			      <TELL
"It requires all of your remaining will to stay erect.  You">
			      <COND (<IN? ,SANDALS ,BLACKTHORNE>
				     <MOVE ,SANDALS ,HERE>
				     <FCLEAR ,SANDALS ,WEARBIT>
				     <TELL " have lost
your sandals, you">)>
			      
			      <TELL
"r face burns from Ishido's blow, and your head
pounds with pain.  The last guards let you through the portcullis
and beyond.  They also let Mariko past without stopping, and then
the litters.|
|
You lead the way down a slight hill, past some open ground and
into a wooded area." CR CR>
			      <GOTO ,WOODS>)>)
		      (<P? WALK P?NORTH>
		       <TELL
"You are stopped and refused entry at the checkpoint." CR>)>)>>

<ROOM WOODS
      (LOC ROOMS)
      (DESC "Wooded Area")
      (SYNONYM AREA)
      (ADJECTIVE WOODED)
      (LDESC
"This is a wooded area totally out of sight of the castle.  To the east
is the city proper.")
      (EAST TO CITY)
      (NORTH TO AT-PORTCULLIS)
      (FLAGS ONBIT OUTSIDE SCOREBIT)
      (ACTION WOODS-F)>

<ROUTINE WOODS-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<AND <VERB? WALK>
			    <NOT <IN? ,PLAYER ,MARIKOS-LITTER>>
			    <NOT <FSET? ,MAZE ,TOUCHBIT>>>
		       <TELL
"You haven't the strength to walk: your performance has totally exhausted
you.  You try to stand, but your body doesn't obey." CR>)>)
	       (<RARG? END>
		<COND (<SCENE? ,S-ESCAPE>
		       <COND (<FSET? ,WOODS ,SCOREBIT>
			      <MOVE-CORTEGE ,WOODS>
			      <MOVE ,MARIKO ,WOODS>
			      <QUEUE I-ESCAPE-CONTINUES 2>
			      <B-SIT>
			      <TELL CR
"As you enter the wooded area and assure yourself that you are
out of sight of the castle, you gratefully collapse." CR>
			      <SCORE-OBJECT ,WOODS>)>)>)
	       (<RARG? ENTER>
		<DEQUEUE I-ISHIDO-2>
		<DEQUEUE I-MARIKO-FOLLOW>
		<RTRUE>)>>

<ROUTINE I-ESCAPE-CONTINUES ()
	 <ZLINES ,LITTER-CNT
		 (<QUEUE I-ESCAPE-CONTINUES -1>
		  <COND (<HERE? ,WOODS>
			 <THIS-IS-IT ,MARIKO>
			 <THIS-IS-IT ,MARIKOS-LITTER>
			 <TELL CR
"\"Anjin-san!\" Mariko calls to you, jarring you out of your stupor.  \"It's
time to move on.\"  She glances significantly at the Gray captain,
and adds, \"Kiritsubo feels we must hurry for the tide.  All the trouble
you have caused has made her even more upset.  Please use my litter,
I'm really very strong and you needn't worry.\"" CR>)>)
		 (DELAY
		  <COND (<AND <HERE? ,WOODS>
			      <NOT <IN? ,PLAYER ,MARIKOS-LITTER>>>
			 <COND (<G? ,DELAY-CNT 2>
				<GET-IN-LITTER T>)
			       (ELSE
				<TELL CR
"Mariko says, \"Please hurry, Anjin-san!\"" CR>
				<RTRUE>)>)>)
		 (<DEQUEUE I-ESCAPE-CONTINUES>
		  <RFALSE>)>>

<ROUTINE I-MADNESS ()
	 <COND (,ISHIDO-DISTRACTED?
		<SETG ISHIDO-DISTRACTED? <>>
		<ZLINES ,MADNESS-CNT
			(;1
			 <MOVE ,MARIKO ,HERE>
			 <THIS-IS-IT ,ISHIDO>
			 <TELL CR
"Ishido draws his sword." CR>)
			(;2
			 <THIS-IS-IT ,ISHIDO>
			 <TELL CR
"Ishido watches you, his sword raised high, ready to strike, but your
actions have momentarily stunned him." CR>)
			(;3
			 <THIS-IS-IT ,ISHIDO>
			 <TELL CR
"Ishido's reflexes take over and he sends his sword slashing for your
throat.  Mariko cries out.  The blade stops a hair's breadth from your
neck.  She tries to ">
			 <COND (<IN? ,PARCHMENT ,TORANAGA>
				<TELL "explain what you said, and Ishido">)
			       (ELSE
				<TELL "soothe Ishido, and he">)>
			 <SETG OPPONENT ,ISHIDO>
			 <TELL " lowers his sword,
listens for a moment, then shouts with increasing vehemence and hits
you in the face with the back of his hand." CR>)
			(;4
			 <THIS-IS-IT ,ISHIDO>
			 <TELL CR
"Yabu begins placating Ishido, Mariko tearfully repeating over and
over in forced semihysteria that the mad barbarian believed he was
only trying to save Ishido from a bad " I "kami" ".">
			 <COND (<EQUAL? ,ISHIDO-DISTRACTED?
					,V?ATTACK ,V?HIT>
				<TELL "\"It's the worst
insult to touch their faces, just like with us!\"">)>
			 <CRLF>)
			(;5
			 <SETG OPPONENT <>>
			 <THIS-IS-IT ,ISHIDO>
			 <TELL CR
"Ishido grabs a bow and arrow.  \"He's a mad dog!  Mad dogs have to be
dealt with!\"" CR>)
			(;6
			 <QUEUE I-MARIKO-FOLLOW -1>
			 <TELL CR
"Mariko leaps forward from her position near Toranaga's litter.  \"Don't
worry, Lord Ishido.  It's a momentary madness.\"  She approaches
you.  \"I can help now, Anjin-san.  We have to try to walk out.  I will follow
you.  Please stop now.\"" CR>)
			(DELAY
			 <COND (<OR <P? STOP (<> CRAZY)>
				    <P? ACT SANE>>
				<TELL CR
"Ishido stares at you, enraged but perplexed." CR>
				<RTRUE>)>)
			(;7
			 <COND (<HERE? ,ON-BRIDGE>
				<TELL CR
"Yabu comes to life and says to Ishido, \"If you want him killed, let me
do it.\"  Then he comes very close and drops his voice.  \"Leave him
alive.  He's more valuable alive.  Trust me.  We need him alive.\"  Ishido
puts the
bow down." CR>)
			       (ELSE
				<DEQUEUE I-MADNESS>
				<CRLF>
				<JIGS-UP
"Ishido aims the bow and lets fly.  It's a perfect shot.  As you die,
Ishido says, \"Thus I deal with mad dogs ... and barbarians.\"">
				<RFATAL>)>)
			(;8
			 <COND (<AND <HERE? ,ON-BRIDGE ,AT-PORTCULLIS>
				     <IN? ,CORTEGE ,GATEWAY>>
				<MOVE-CORTEGE ,ON-BRIDGE>
				<TELL CR
"Mariko looks back for an instant.  \"They're following, Anjin-san,
both litters are through the gate and they're on the bridge now!\"" CR>)>)
			(;9
			 <COND (<AND <HERE? ,AT-PORTCULLIS ,WOODS>
				     <IN? ,CORTEGE ,ON-BRIDGE>>
				<MOVE-CORTEGE ,AT-PORTCULLIS>
				<TELL CR
"Quickly, the cortege follows to the portcullis.  Mariko urges you on." CR>)>)
			(;10
			 <COND (<AND <HERE? ,WOODS>
				     <IN? ,CORTEGE ,PORTCULLIS>>
				<MOVE-CORTEGE ,WOODS>
				<TELL CR
"Quickly, the cortege goes through the portcullis and towards the
woods.  Mariko urges you on." CR>
				<DEQUEUE I-MADNESS>)>)>)
	       (<HERE? ,GATEWAY ,ON-BRIDGE ,AT-PORTCULLIS>
		<QUEUE I-ISHIDO-2 -1>
		<COND (<NOT <EQUAL? ,ISHIDO-CNT 5 6>>
		       <SETG ISHIDO-CNT 4>)>
		<COND (<AND <IN? ,MARIKO ,HERE>
			    <HERE? ,ON-BRIDGE>>
		       <TELL CR
"Mariko looks back for an instant.  \"He's not letting them go!\"" CR>)>
		<I-ISHIDO-2>)>>

<ROUTINE MOVE-CORTEGE (L)
	 <MOVE ,CORTEGE .L>
	 <MOVE ,KIRIS-LITTER .L>
	 <MOVE ,YABU .L>
	 <MOVE ,BUNTARO .L>
	 <MOVE ,MARIKOS-LITTER .L>>

<OBJECT PARCHMENT
	(DESC "roll of parchment")
	(OWNER PARCHMENT)
	(SYNONYM PARCHMENT ROLL MESSAGE SCROLL)
	(ADJECTIVE SLIM)
	(FLAGS TAKEBIT READBIT SCOREBIT)
	(ACTION PARCHMENT-F)>

<ROUTINE PARCHMENT-F ()
	 <COND (<VERB? TAKE>
		<COND (<IN? ,PARCHMENT ,ISHIDO>
		       <COND (<OR <G=? ,ISHIDO-CNT 5>
				  <QUEUED? I-MADNESS>>
			      <SETG ISHIDO-DISTRACTED? ,PRSA>
			      <MOVE ,PRSO ,WINNER>
			      <TELL
"You grab the parchment out of Ishido's fingers.  He stares at you,
shocked.">
			      <TORANAGA-CLOSES-CURTAIN>
			      <CRLF>
			      <SCORE-OBJECT ,PARCHMENT>)
			     (<JIGS-UP? ,J-PARCHMENT
"To take the parchment now would cost you your life!">
			      <JIGS-UP
"You snatch the roll of parchment from Ishido's grasp.  He turns,
maddened by your insolence.  His sword is out of its sheath in no
time, and swings toward you...">)
			     (ELSE <RTRUE>)>)
		      (<IN? ,PARCHMENT ,KIRIS-LITTER>
		       <TELL
"You can't reach the parchment any longer." CR>)>)
	       (<OR <P? GIVE PARCHMENT TORANAGA-IN-DRAG>
		    <P? PUT PARCHMENT KIRIS-LITTER>
		    <P? THROW PARCHMENT KIRIS-LITTER>
		    <P? PUT-ON PARCHMENT CURTAINS>>
		<COND (<NOT <QUEUED? I-MADNESS>>
		       <SETG ISHIDO-DISTRACTED? ,PRSA>
		       <TELL
"You shove the parchment into the closed curtains, looking for a crack
or gap, but all you succeed into doing is getting the parchment
entangled." CR>)
		      (ELSE
		       <MOVE ,PARCHMENT ,KIRIS-LITTER>
		       <SCORE-OBJECT ,CURTAINS>
		       <QUEUE I-ISHIDO-2 -1>
		       <SETG ISHIDO-CNT 4>
		       <SETG ISHIDO-DISTRACTED? ,PRSA>
		       <TELL
"You thrust the parchment through the curtains, babbling the
first foolish thing that comes into your head.  \"It's bad luck in my
country for a prince to give a message himself like a common bastard ...
bad luck ...\" Everyone watches as you do this." CR>)>)
	       (<P? (TEAR MUNG) PARCHMENT>
		<SETG ISHIDO-DISTRACTED? ,PRSA>
		<REMOVE ,PARCHMENT>
		<TELL
"You tear the parchment into pieces, scattering them on the
ground.  Ishido stares at you in mingled surprise and hatred." CR>)
	       (<P? READ PARCHMENT>
		<TELL
"You can't read Japanese." CR>)>>

<GLOBAL SEEN-TORANAGA? <>>

<ROOM CITY
      (LOC ROOMS)
      (DESC "City of Osaka")
      (OWNER CITY)
      (SYNONYM CITY OSAKA)
      (LDESC
"The city by night is a fairyland.  The rich houses have many colored
lanterns, oil-lit and candle-lit, hanging over their gateways and in
their gardens, the shoji screens giving off a delightful
translucence.  Even the poor houses are mellowed by the shojis.  Lanterns
light the way of pedestrians and kagas, and of samurai on horseback.|
|
The harbor is to the east.")
      (EAST TO MAZE)
      (WEST SORRY "You can't return to the castle now.")
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL HOUSE)
      (ACTION CITY-F)>

<ROUTINE CITY-F ("OPT" (RARG <>))
	 <COND (<RARG? ENTER>
		<COND (<EQUAL? ,OHERE ,WOODS>
		       <MOVE-ALL ,WOODS ,CITY>)>
		<RTRUE>)
	       (<RARG? <>>
		<COND (<VERB? FIND>
		       <COND (<G=? ,SCENE ,S-VOYAGE>
			      <TELL
"Osaka is the greatest and proudest city of Japan.  It is on the sea several
days sail west of Anjiro." CR>)
			     (ELSE
			      <TELL
"You have no idea where Osaka is." CR>)>)>)>>

<ROOM WAREHOUSE
      (LOC ROOMS)
      (DESC "Warehouse")
      (SYNONYM WAREHOUSE)
      (LDESC
"You are in a narrow and deserted back street near the dock.  The shadows
of a nearby warehouse shield the party from the view of anyone on the
wharf to the east.")
      (WEST SORRY "There's no time for that now.")
      (EAST TO WHARF)
      (FLAGS ONBIT OUTSIDE)
      (ACTION WAREHOUSE-F)>

<ROUTINE WAREHOUSE-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<P? WALK P?EAST>
		       <COND (<IN? ,MARIKO ,WHARF>
			      <TELL
"You and the six samurai race after her.  Mariko is very fleet and you don't
catch up with her as you round the corner
and head across the open space.  You have never felt so naked.  The moment you
appear, the Grays spot you and surge forward." CR CR>
			      <GOTO ,WHARF>
			      <MOVE ,BROWNS ,WHARF>
			      <MOVE ,GRAYS ,WHARF>
			      <MOVE ,GRAY-LEADER ,MAIN-DECK-2>
			      <FSET ,GRAY-LEADER ,NDESCBIT>
			      <RTRUE>)
			     (<IN? ,MARIKO ,WAREHOUSE>
			      <COND (<EQUAL? ,QCONTEXT ,MARIKO>
				     <TELL
"\"You must agree first, Anjin-san.">)
				    (ELSE
				     <TELL
"\"Not yet, not yet!  The timing must be perfect!">)>
			      <TELL "\" Mariko chides." CR>)>)>)
	       (<RARG? ENTER>
		<COND (<EQUAL? ,OHERE ,MAZE>
		       <MOVE-ALL ,MAZE ,WAREHOUSE>
		       <QUEUE I-RUSE -1>)>
		<RTRUE>)>>

<OBJECT LARGE-KNIFE
	(DESC "large knife")
	(SYNONYM KNIFE)
	(ADJECTIVE LARGE)
	(FLAGS TAKEBIT WEARABLE WEAPONBIT)
	(GENERIC GENERIC-KNIFE-F)
	(ACTION LARGE-KNIFE-F)>

<ROUTINE LARGE-KNIFE-F ()
	 <COND (<VERB? TAKE UNTIE TAKE-OFF USE DRAW PICK>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <FCLEAR ,PRSO ,WEARBIT>
		       <TELL
"You take the knife out from the sash and heft it.  It feels good." CR>)
		      (<HELD? ,PRSO>
		       <TELL G"You're already using it." CR>)>)
	       (<VERB? TIE WEAR PUT-AWAY>
		<COND (<NOT <HELD? ,PRSO>>
		       <TELL "You don't have it." CR>)
		      (<NOT <FSET? ,PRSO ,WEARBIT>>
		       <FSET ,PRSO ,WEARBIT>
		       <TELL
"You thrust the knife back into your sash." CR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)>>

<ROUTINE GENERIC-KNIFE-F (R F)
	 <COND (<AND <FSET? ,LARGE-KNIFE ,WEARBIT>
		     <NOT <FSET? ,SMALL-KNIFE ,WEARBIT>>>
		,SMALL-KNIFE)
	       (<AND <NOT <FSET? ,LARGE-KNIFE ,WEARBIT>>
		     <FSET? ,SMALL-KNIFE ,WEARBIT>>
		,LARGE-KNIFE)>>

<OBJECT SMALL-KNIFE
	(DESC "small knife")
	(SYNONYM KNIFE)
	(ADJECTIVE SMALL)
	(FLAGS TAKEBIT WEARABLE WEARBIT WEAPONBIT)
	(GENERIC GENERIC-KNIFE-F)
	(ACTION SMALL-KNIFE-F)>

<ROUTINE SMALL-KNIFE-F ()
	 <COND (<VERB? TAKE UNTIE TAKE-OFF USE DRAW PICK>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <FCLEAR ,PRSO ,WEARBIT>
		       <TELL
"You untie the silk ribbon and take the knife into your hand." CR>)
		      (<HELD? ,PRSO>
		       <TELL G"You're already using it." CR>)>)
	       (<VERB? TIE WEAR PUT-AWAY>
		<COND (<NOT <HELD? ,PRSO>>
		       <TELL "You don't have it." CR>)
		      (<NOT <FSET? ,PRSO ,WEARBIT>>
		       <FSET ,PRSO ,WEARBIT>
		       <TELL
"You tie the knife to your arm again." CR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)>>

<GLOBAL OPPONENT <>>
<GLOBAL DODGED? <>>

<ROUTINE I-RUSE ()
	 <ZLINES ,RUSE-CNT
		 (<SETG QCONTEXT ,MARIKO>
		  <TELL CR
"Toranaga beckons to Mariko, and they converse.  Mariko nods.  \"Anjin-san,
my Master orders that we, with six samurai, go to the galley.  We are to
tell the Grays on board that we were ambushed, and that our Gray escort
sent us ahead to get help, that the battle is still raging.  We will draw
them away from the galley, and our Browns can recover it and we will be
free.  Do you understand?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,QCONTEXT ,MARIKO>
			 <TELL CR
"\"Please, Anjin-san, this is a good plan, it is my Master's plan.  Do you
agree?\"" CR>
			 <RTRUE>)>)
		 (<MOVE ,MARIKO ,WHARF>
		  <TELL CR
"Mariko laughs, bows once to Toranaga, and runs off." CR>)
		 (DELAY
		  <COND (<NOT <IN? ,BLACKTHORNE ,WHARF>>
			 <COND (<G? ,DELAY-CNT 2>
				<TELL
"Toranaga is disgusted by your cowardice.  He personally dispatches
you.  As you die, you remember something about not keeping agreements." CR>
				<JIGS-UP>
				<RFATAL>)
			       (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"The Grays have spotted Mariko.  They surge forward." CR>)
			       (<EQUAL? ,DELAY-CNT 2>
				<TELL CR
"Toranaga urges you forward." CR>)>
			 <RTRUE>)>)
		 (<TELL CR
"The Grays surround you, Mariko jabbering feverishly with the samurai and
the Grays.  You add to the babel in a panting mixture of Portuguese, English,
and Dutch, motioning for them to hurry.  You lean against the gangway, unable
to see anything on the galley distinctly.  You can't tell if the samurai on
deck are Grays or Browns or both." CR>)
		 (<COND (<HERE? ,WHARF ,MAIN-DECK-2>
			 <TELL CR
"Mariko is frantically haranguing the senior officer of the Grays.  He shouts
orders, and suddenly a hundred samurai, all Grays, pour off the ship.|
|
Quickly, Mariko turns to you and asks, \"Does the ship seem all right to
you?\"">
			 <SETG QCONTEXT ,MARIKO>
			 <COND (<HERE? ,WHARF>
				<TELL "She motions you onto the galley.">)>
			 <CRLF>)
			(ELSE
			 <TELL CR
"Mariko is desperately calling you back to the wharf." CR>)>)
		 (DELAY
		  <COND (<NOT <IN? ,BLACKTHORNE ,MAIN-DECK-2>>
			 <TELL CR
"Mariko commands you urgently in Latin, \"Get aboard the galley,
Anjin-san!  We must see if it is safe!\"" CR>
			 <RTRUE>)
			(<EQUAL? ,QCONTEXT ,MARIKO>
			 <TELL CR
"\"Please, Anjin-san, is the ship all right?\"" CR>
			 <RTRUE>)>)
		 (<FSET ,WHARF ,SCOREBIT>
		  <TELL CR
"Mariko looks around, as if assessing the situation.  You can see that there
are still sixteen Grays on the wharf and the galley.  Suddenly, Mariko walks
weakly to the head of the gangway and appears to faint!" CR>)
		 (DELAY
		  <COND (<OR <FSET? ,WHARF ,SCOREBIT>
			     <FSET? ,GLOBAL-WATER ,SCOREBIT>>
			 <COND (<L? ,DELAY-CNT 2> <RFALSE>)>)>)
		 (<MOVE ,RONIN ,WHARF>
		  <TELL CR
"Ashore, thirty of Toranaga's ronin-disguised samurai lope out of an
alleyway.  The Grays that had begun to leave the dock spin around on the
gangway.  Abruptly one shouts orders.  \"Bandits!\" one of the Browns
screams on
cue.  The six Browns split up, intermingling with the Grays." CR>)
		 (<TELL CR
"Toranaga's ronin-samurai charge.  At the same time the Browns on board attack
the remaining Grays on board.  The leader of the Grays on deck, a large tough
grizzle-bearded man, confronts ">
		  <FCLEAR ,GRAY-LEADER ,NDESCBIT>
		  <THIS-IS-IT ,GRAY-LEADER>
		  <SETG OPPONENT ,GRAY-LEADER>
		  <SETG DODGED? <>>
		  <COND (<NOT <FSET? ,WHARF ,SCOREBIT>> ;"helped her?"
			 <TELL "you and ">)>
		  <TELL "Mariko.  \"Kill the traitors!\" he bellows, and
charges." CR>)
		 (<COND (<NOT <FSET? ,GRAY-LEADER ,DEAD>>
			 <TELL CR CTHE ,GRAY-LEADER " ">
			 <COND (,DODGED?
				<TELL
"manages to match your maneuver, and ">)>
			 <TELL
"swings his sword in a vicious arc that cuts deeply into your
side.  You fall, and the second blow is fatal." CR>
			 <JIGS-UP>)
			(ELSE
			 <SETG DODGED? <>>
			 <SETG OPPONENT ,RANDOM-GRAYS>
			 <TELL CR
"The other two Grays lunge for you, killing swords high.  You feel, more than
see, the sword slashing for your throat!" CR>)>)
		 (<COND (<NOT ,DODGED?>
			 <TELL CR
"The killing blow takes you, nearly severing your head." CR>
			 <JIGS-UP>)
			(ELSE
			 <FCLEAR ,WHARF ,SCOREBIT>
			 <MOVE ,SECOND-GRAY ,HERE>
			 <SETG OPPONENT ,SECOND-GRAY>
			 <THIS-IS-IT ,SECOND-GRAY>
			 <TELL CR
"A younger Gray halts over Mariko, sword raised.  Suddenly,
Mariko comes alive.  She throws herself against the inexperienced young samurai's
legs, crashing him to the deck.  Then, she scrambles across the dead Gray,
grabs his sword out of his still-twitching hands, and prepares to defend
herself as best she can." CR>)>)
		 (<TELL CR
"The young Gray that Mariko tripped regains his feet, and howling with rage,
comes at
her.  She backs and slashes bravely but you know she's lost, the man too
strong." CR>)
		 (<COND (<NOT <FSET? ,SECOND-GRAY ,DEAD>>
			 <TELL CR
"The young Gray's blow catches Mariko in the neck, and she drops to the
deck, her
wound bubbling.  You rush to her aid, but he cuts you down as well." CR>
			 <JIGS-UP>)
			(ELSE
			 <MOVE ,RONIN ,HERE>
			 <REMOVE ,GRAYS>
			 <B-SIT>
			 <TELL CR
"Toranaga's ronin-samurai burst up the gangway, over the dead Grays.  They
quickly dispose of the remaining Grays and dump their bodies into the sea.|
|
Wiping the blood off your face, you dimly see Mariko stretched out on the
deck, ronin-samurai milling around her.  You shake off your helpers and
stumble toward her, but your knees give out and you collapse." CR>)>)
		 (<TELL CR
"When all aboard has been checked and double-checked, the leader of the
ronin-samurai cups his hands around his lips and halloos shoreward.  At once
more ronin-disguised samurai under Yabu come out of the night, and fan into
protective shields.  Then Toranaga appears and walks slowly toward the
gangway alone.  He has discarded the woman's kimono and the dark travelling
cloak.  Now he wears his armor, and over it a simple brown kimono, swords in
his sash.  The phalanx moves with measured tread toward the galley.|
|
Bastard, you think.  You're a cruel, cold-gutted, heartless bastard but you've
got majesty, no doubt about that." CR>
		  <NEXT-SCENE>)>>

<ROOM WHARF
      (LOC ROOMS)
      (DESC "Wharf")
      (SYNONYM WHARF)
      (WEST TO WAREHOUSE)
      (UP TO MAIN-DECK)
      (EAST TO MAIN-DECK-2)
      (GLOBAL LG-GALLEY GANGWAY)
      (FLAGS ONBIT OUTSIDE ;SCOREBIT)
      (ACTION WHARF-F)>

<ROUTINE WHARF-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"You are near a gangway leading up to the galley.  The galley is to the
east, moored to stanchions fixed into the stone wharf that extends
a hundred yards out into the sea." CR>)
	       (<RARG? ENTER>
		<REMOVE ,ANCHOR>
		<REMOVE ,SKIFF>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<P? EXAMINE GRAYS>
		       <TELL
"You can only tell that they are dressed like samurai. You can't tell the
color of their uniforms." CR>)
		      (<AND <EQUAL? ,QCONTEXT ,MARIKO>
			    <VERB? YES NO IYE HAI>>
		       <TELL
"\"Anjin-san, we must be sure.  We must look aboard for Grays.\"" CR>)
		      (<P? (BOARD CLIMB-ON) (GALLEY LG-GALLEY ROOMS)>
		       <DO-WALK ,P?EAST>)>)>>

<ROOM MAIN-DECK-2
      (SCENE S-ESCAPE)
      (LOC ROOMS)
      (DESC "Main Deck")
      (SYNONYM DECK)
      (ADJECTIVE MAIN)
      (WEST TO WHARF)
      (DOWN SORRY "There's nothing of interest below decks.")
      (FLAGS ONBIT OUTSIDE SCOREBIT)
      (GLOBAL LG-GALLEY)
      (GENERIC GENERIC-DECK-F)
      (ACTION MAIN-DECK-2-F)>

<ROUTINE MAIN-DECK-2-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
G"This is the oar deck of the galley, forward of the quarterdeck.  ">
		<TELL
"Gray guardsmen crowd the deck." CR>)
	       (<RARG? ENTER>
		<MOVE ,MARIKO ,MAIN-DECK-2>
		<MOVE ,BROWNS ,MAIN-DECK-2>
		<TELL
"You pull yourself up the gangway using the ropes for support.  Your dash
across the wharf has tired you more than you realized at first.  Mariko and
two Browns follow after.">
		<CRLF> <CRLF>)
	       (<RARG? BEG>
		<COND (<P? WALK (P?AFT P?UP)>
		       <TELL
"The gangway aft is blocked by Grays and crewmen." CR>)
		      (<P? TAKE-OFF LG-GALLEY>
		       <DO-WALK ,P?WEST>)
		      (<AND <EQUAL? ,QCONTEXT ,MARIKO>
			    <VERB? YES HAI>>
		       <SETG QCONTEXT <>>
		       <TELL
"\"Well, she's floating, at least,\" you reply, and then notice one of the
crewmen from the voyage to Osaka.  With Mariko's help, you ask him if the
galley is ready, and if there are still Grays aboard.  \"Anjin-san, he thanks
you for the life of his ship, and says they are ready.  As for the other, he
doesn't know.\"  Mariko seems very worried as she says this." CR>)
		      (<P? (HELP WAKE TAKE) MARIKO>
		       <COND (<AND <FSET? ,WHARF ,SCOREBIT>
				   <NOT <FSET? ,GLOBAL-WATER ,SCOREBIT>>>
			      <FSET ,GLOBAL-WATER ,SCOREBIT>
			      <TELL
"You make your way over to Mariko.  \"Get some water -- water, by God!\"  What's
the word for water?  Desperately you search your mind for the Japanese
word.  The old monk had told it to you a thousand times." CR>
			      <SCORE-OBJECT ,WHARF>)
			     (,OPPONENT
			      <TELL
"You'll have to try something more specific." CR>)
			     (<NOT <B-STANDING?>>
			      <TELL
"You try to crawl to her, but you are too fatigued." CR>)>)
		      (<OR <VERB? MIZU>
			   <AND <P? SAY INTQUOTE>
				<EQUAL? ,W?MIZU
					<GET-INTQUOTE 0>
					<GET-INTQUOTE 1>>>
			   <AND <P? SAY GLOBAL-WATER>
				<NOUN-USED? ,PRSO ,W?MIZU>>>
		       <COND (<FSET? ,GLOBAL-WATER ,SCOREBIT>
			      <TELL
"\""I"Mizu, mizu!  Hai!  Wakarimas?""\" you yell.  A man nods, and begins to hurry
away.  You stand protectively over Mariko." CR>
			      <SCORE-OBJECT ,GLOBAL-WATER>)
			     (ELSE
			      <TELL
"You continue yelling, for no apparent reason." CR>)>)
		      (<AND <EQUAL? ,OPPONENT ,GRAY-LEADER
				    ,RANDOM-GRAYS ,SECOND-GRAY>
			    <OR <MOTION-VERB?>
				<VERB? PARRY STOP>>>
		       <SETG DODGED? T>
		       <COND (<FSET? ,GRAY-LEADER ,DEAD>
			      <TELL
"You leap out of the way, and the blow misses." CR>)
			     (ELSE
			      <TELL
"You try desperately to dodge out of the way, trying to avoid the leader's
attack." CR>)>)>)>>

<OBJECT GRAY-LEADER
	(DESC "Gray Leader")
	(SYNONYM GRAY LEADER MAN SAMURAI)
	(ADJECTIVE LARGE TOUGH GRIZZLED GRAY)
	(FLAGS PERSON JAPANESEBIT THE SCOREBIT)
	(ACTION GRAY-LEADER-F)>

<ROUTINE GRAY-LEADER-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND (<FSET? ,GRAY-LEADER ,DEAD>
		       <TELL
G"Don't waste your effort; he's already dead." CR>)
		      (<P? (KILL ATTACK) GRAY-LEADER (LARGE-KNIFE SMALL-KNIFE)>
		       <TELL
G"He's too far away to stab." CR>)
		      (<P? THROW (LARGE-KNIFE SMALL-KNIFE)
			   GRAY-LEADER>
		       <MOVE ,PRSO ,HERE>
		       <COND (<NOT <FSET? ,PRSO ,WEARBIT>>
			      <TELL
"You slide your " D ,PRSO " into your hand and hurl it in an arc.  It takes the
samurai in the throat." CR>
			      <SETG OPPONENT <>>
			      <FSET ,GRAY-LEADER ,DEAD>
			      <COND (<FSET? ,GRAY-LEADER ,NDESCBIT>
				     <TELL CR
"The remaining Grays scream \"Traitors!\"  They fall upon the Browns, and
you are among the first to die." CR>
				     <JIGS-UP>)
				    (ELSE
				     <SCORE-OBJECT ,GRAY-LEADER>)>)
			     (ELSE
			      <HANGS-UP-ON-SLEEVE>)>)>)>>

<OBJECT RANDOM-GRAYS
	(DESC "attacking Grays")
	(SYNONYM GRAY GRAYS SAMURAI)
	(ADJECTIVE ATTACKING GRAY)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT SCOREBIT)
	(ACTION RANDOM-GRAYS-F)>

<ROUTINE RANDOM-GRAYS-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND (<P? (KILL ATTACK)
			   RANDOM-GRAYS
			   (LARGE-KNIFE SMALL-KNIFE)>
		       <TELL
G"They're too far away to stab." CR>)
		      (<P? THROW (LARGE-KNIFE SMALL-KNIFE)
			   RANDOM-GRAYS>
		       <REMOVE ,PRSO>
		       <COND (<NOT <FSET? ,PRSO ,WEARBIT>>
			      <TELL
"You throw your " D ,PRSO " at one of the Grays, and he spins away, but
the other is still alive." CR>
			      <SETG OPPONENT <>>
			      <FSET ,RANDOM-GRAYS ,DEAD>)
			     (ELSE
			      <HANGS-UP-ON-SLEEVE>)>)>)>>

<OBJECT SECOND-GRAY
	(DESC "young Gray samurai")
	(SYNONYM GRAY SAMURAI)
	(ADJECTIVE SECOND YOUNG YOUNGER GRAY)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT SCOREBIT)
	(GENERIC GENERIC-GRAY-F)
	(ACTION SECOND-GRAY-F)>

<ROUTINE GENERIC-GRAY-F (R F)
	 <COND (<FSET? ,SECOND-GRAY ,DEAD> ,RANDOM-GRAYS)
	       (<FSET? ,GRAY-LEADER ,DEAD> ,SECOND-GRAY)
	       (ELSE <RFALSE>)>>

<ROUTINE SECOND-GRAY-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND (<P? (KILL ATTACK) SECOND-GRAY (LARGE-KNIFE SMALL-KNIFE)>
		       <TELL
G"He's too far away to stab." CR>)
		      (<P? THROW (LARGE-KNIFE SMALL-KNIFE)
			   SECOND-GRAY>
		       <REMOVE ,PRSO>
		       <COND (<NOT <FSET? ,PRSO ,WEARBIT>>
			      <TELL
"You throw your " D ,PRSO " at Mariko's assailant.  It strikes him in the back,
causing his blow to go wild.  He slumps to the deck, his life ebbing fast." CR>
			      <SETG OPPONENT <>>
			      <FSET ,SECOND-GRAY ,DEAD>
			      <SCORE-OBJECT ,SECOND-GRAY>)
			     (ELSE
			      <HANGS-UP-ON-SLEEVE>)>)>)>>

<ROUTINE HANGS-UP-ON-SLEEVE ()
	 <TELL
"You fumble in your sleeve for the " D ,PRSO ", but it hangs up on the strip
of silk you tied it with.  ">
	 <COND (<FSET? ,PRSI ,DEAD>
		<TELL "Fortunately, he's already dead, so you are safe from
a counterattack." CR>)
	       (ELSE
		<TELL
"You toss it at " THE ,PRSI " but it misses, and he turns on you!" CR>
		<JIGS-UP>)>>

<ROUTINE HATAMOTO-AFTER-F ()
	 <TELL
"The galley escapes from Osaka harbor, the rowers speeding it back towards
Anjiro and Toranaga's capital, Yedo, beyond.|
|
For your services to him, Lord Toranaga gives you a rare honor.  He
makes you a hatamoto, a high rank of samurai.  This is a position of a special retainer to his
personal staff.  You have his absolute protection.  In return, you are
instructed to learn Japanese, and train a regiment of troops in European
tactics and the use of muskets.|
|
But best of all, he says he will return the "I"Erasmus"" to you, but he won't
say when." CR>>

<END-SEGMENT ;"ESCAPE">
