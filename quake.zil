"QUAKE for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT QUAKE>

<ROOM PLATEAU
      (LOC ROOMS)
      (SCENE S-QUAKE)
      (DESC "Plateau")
      (SYNONYM PLATEAU)
      (SCORE 4)
      (AFTER ZATAKI-AFTER-F)
      (FDESC
"You sit cross-legged in front of Toranaga, swords in his
sash.  Mariko is explaining something to you.  \"War
is coming,\" she says.  \"When?\" you ask.  \"Very soon, so you are to leave
at once with me.  I'm going to Osaka, you are to accompany me part of
the way, but you're going on to Yedo to prepare your ship for war.\"")
      (FLAGS ONBIT OUTSIDE SCOREBIT)
      (ACTION PLATEAU-F)>

<ROUTINE PLATEAU-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<PUTP ,BLACKTHORNE ,P?HEALTH 5>
		<MOVE ,SWORDS ,BLACKTHORNE>
		<FSET ,SWORDS ,WEARBIT>
		<FSET ,SWORDS ,SCOREBIT>
		<B-SIT>
		<MOVE ,MARIKO ,HERE>
		<MOVE ,TORANAGA ,HERE>
		<QUEUE I-QUAKE -1>)
	       (<RARG? LOOK>
		<COND (<IN? ,WINNER ,HERE>
		       <TELL
"This is a plateau on a hillside.  Beyond are the rising foothills of
mountains that soar to a clouded sky.  Below in the valley is the
samurai camp.  The day is sultry." CR>)
		      (ELSE
		       <TELL
"You are in a fissure, below ground level in the shaking earth." CR>)>)
	       (<RARG? BEG>
		<COND (<NOT ,QUAKE-CNT> <RFALSE>)
		      (<AND ,QUAKE?
			    <OR <VERB? LIE-DOWN>
				<P? (HOLD BOARD HOLD-ON HIT) GROUND>>>
		       <TELL
"You hold the ground like a baby holding its mother.  You want the
noise and shaking to stop!" CR>)
		      (<AND <P? YELL> ,QUAKE?>
		       <TELL
"Your lungs try to force a scream out, but nothing comes." CR>)
		      (<AND <IN? ,MAIN-FISSURE ,HERE>
			    <NOT <FSET? ,MAIN-FISSURE ,RMUNGBIT>>
			    <NOT <VERB? CLIMB-DOWN BOARD>>
			    <MOTION-VERB?>>
		       <FSET ,MAIN-FISSURE ,RMUNGBIT>
		       <TELL
"Desperately you scramble away from the onrushing chasm, grabbing at the
ground, forcing yourself to move, and it passes you by." CR>)
		      (<AND <P? WALK P?DOWN>
			    <IN? ,MARIKO ,SIDE-FISSURE>>
		       <PERFORM ,V?THROUGH ,SIDE-FISSURE>
		       <RTRUE>)
		      (<AND <P? WALK P?DOWN>
			    <IN? ,TORANAGA ,MAIN-FISSURE>>
		       <PERFORM ,V?THROUGH ,MAIN-FISSURE>
		       <RTRUE>)
		      (<AND <OR ,QUAKE?
				<QUEUED? I-CRAWL>>
			    <OR <VERB? WALK>
				<AND <VERB? STAND>
				     <B-NOT-STANDING?>>>>
		       <TELL
"You can't stand up.  You can barely avoid panic." CR>)
		      (<VERB? FOLLOW>
		       <COND (<AND <PRSO? ,MARIKO>
				   <IN? ,MARIKO ,SIDE-FISSURE>>
			      <PERFORM ,V?THROUGH ,SIDE-FISSURE>)
			     (<AND <PRSI? ,TORANAGA>
				   <IN? ,TORANAGA ,MAIN-FISSURE>>
			      <PERFORM ,V?THROUGH ,MAIN-FISSURE>
			      <RTRUE>)>)
		      (<AND <P? EXAMINE (TORANAGA MARIKO)>
			    <NOT <IN? ,PRSO ,HERE>>>
		       <PERFORM ,V?LOOK-INSIDE <LOC ,PRSO>>
		       <RTRUE>)
		      (<VERB? LOOK-DOWN>
		       <COND (<AND <IN? ,SIDE-FISSURE ,HERE>
				   <IN? ,MARIKO ,SIDE-FISSURE>>
			      <PERFORM ,V?LOOK-INSIDE ,SIDE-FISSURE>
			      <RTRUE>)
			     (<AND <IN? ,MAIN-FISSURE ,HERE>
				   <IN? ,TORANAGA ,MAIN-FISSURE>>
			      <PERFORM ,V?LOOK-INSIDE ,MAIN-FISSURE>
			      <RTRUE>)
			     (,QUAKE?
			      <TELL
"The ground is trembling and rolling!" CR>)>)
		      (<AND <P? LISTEN (<> GROUND)> ,QUAKE?>
		       <TELL
"Everything around you rumbles with a deep basso profundity that
you can barely believe." CR>)
		      (<VERB? FIND ;WHERE SAY YELL-AT>
		       <COND (<AND <PRSO? TORANAGA>
				   <IN? ,TORANAGA ,SIDE-FISSURE>>
			      <COND (<FSET? ,TORANAGA ,DEAD>
				     <TELL
"He is dead." CR>)
				    (ELSE
				     <TELL
"He has fallen into " THE ,SIDE-FISSURE "!" CR>)>)
			     (<AND <PRSO? MARIKO>
				   <IN? ,MARIKO ,SIDE-FISSURE>>
			      <COND (<FSET? ,MARIKO ,DEAD>
				     <TELL
"She is dead." CR>)
				    (ELSE
				     <TELL
"She has fallen into " THE ,SIDE-FISSURE "!" CR>)>)>)
		      (<P? (TAKE HELP REACH-FOR) TORANAGA>
		       <COND (<NOT <IN? ,MAIN-FISSURE ,HERE>>
			      <TELL
"You will yourself to crawl to Toranaga, but your body refuses,
forcing you to hug the once-solid ground." CR>)
			     (<IN? ,BLACKTHORNE ,SIDE-FISSURE>
			      <DO-WALK ,P?UP>)
			     (,TORANAGA-HELD-FLAG
			      <TELL
"You hold Toranaga in a death grip, unsure of how long you can hold
him with the earth trembling like a leaf around you, but knowing it's
his death if you let go." CR>)
			     (<FSET? ,MAIN-FISSURE ,SCOREBIT>
			      <COND (<IN? ,BLACKTHORNE ,MAIN-FISSURE>
				     <JIGS-UP
"You reach out for Toranaga as he begins to fall, and you grab his sash,
but you've lost your precarious balance on the ledge.  Both of you tumble
into the pit.">)
				    (ELSE
				     <MARGINAL-PIC ,P-QUAKE>
				     <SETG TORANAGA-HELD-FLAG T>
				     <TELL
"You come out of your stupor and lunge forward.  Your left hand grabs
Toranaga's sash." CR>)>)>)
		      (<P? DROP TORANAGA>
		       <COND (<AND ,TORANAGA-HELD-FLAG
				   <FSET? ,MAIN-FISSURE ,SCOREBIT>>
			      <SETG TORANAGA-HELD-FLAG <>>
			      <MOVE ,TORANAGA ,MAIN-FISSURE>
			      <TELL
"You let go, and begins to lose his precarious balance." CR>)>)
		      (<P? (TAKE HELP REACH-FOR) MARIKO>
		       <COND (<AND ,TORANAGA-HELD-FLAG
				   <FSET? ,MAIN-FISSURE ,SCOREBIT>>
			      <MOVE ,TORANAGA ,MAIN-FISSURE>
			      <SETG TORANAGA-HELD-FLAG <>>
			      <TELL
"You try to reach Mariko and hold on to Toranaga at the same time, but
it's impossible.  Just as your fingers reach her, Toranaga's sash slips
from your grasp and he tumbles into the abyss." CR>)
			     (<IN? ,MARIKO ,SIDE-FISSURE>
			      <TELL
"She's too far away, too deep in the fissure." CR>)
			     (ELSE
			      <TELL
"Crawling as fast as you can, you try to reach her,
but there's no chance." CR>)>)
		      (<P? GIVE SWORDS TORANAGA>
		       <COND (<OR <NOT <IN? ,TORANAGA ,HERE>>
				  <NOT <FSET? ,SIDE-FISSURE ,RMUNGBIT>>>
			      <TELL
"This is a strange time to be trying to give your swords away." CR>)
			     (<FSET? ,MAIN-FISSURE ,SCOREBIT>
			      <TELL
"Toranaga refuses your gift.  \"I have perfectly good swords of my own,\"
he says." CR>)
			     (ELSE
			      <SCORE-OBJECT ,SWORDS>
			      <SETG DELAY-CNT 0>
			      <MOVE ,SWORDS ,TORANAGA>
			      <FSET ,SWORDS ,WEARBIT>
			      <MARGINAL-PIC ,P-SWORDS <>>
			      <TELL
"You kneel in front of Toranaga and offer your sword as a sword should
be offered.  \""I"Dozo"", Toranaga-sama,\" you say.  He accepts the sword
and shoves it into his sash.  \""I"Domo"", Anjin-san.\"  He smiles, leans
forward, and claps you once on the shoulder, hard.  \""I"Tomo, neh?""\"
Friend, eh?" CR>)>)
		      (<P? EXAMINE SWORDS>
		       <COND (<NOT <FSET? ,MAIN-FISSURE ,SCOREBIT>>
			      <TELL
"The short stabbing sword is gone, but the killing sword is still
scabbarded, though muddied and scarred." CR>)>)
		      (<P? PISS (<> MAIN-FISSURE SIDE-FISSURE)>
		       <COND (<AND <NOT <FSET? ,MAIN-FISSURE ,SCOREBIT>>
				   <IN? ,TORANAGA ,HERE>>
			      <TELL
"Nothing comes, not even a dribble.">
			      <COND (<AND <FSET? ,SIDE-FISSURE ,RMUNGBIT>
					  <FSET? ,PLATEAU ,SCOREBIT>>
				     <TELL
"You and Toranaga laugh at the sheer
joy of being alive, which blocks you even more.  At length you both
succeed.  You relax and collect your strength." CR>
				     <SETG DELAY-CNT 0>
				     <SCORE-OBJECT ,PLATEAU>)
				    (ELSE <CRLF>)>)>)>)>>

<GLOBAL TORANAGA-HELD-FLAG <>>

<GLOBAL QUAKE? <>>

<ROUTINE I-QUAKE ()
	 <ZLINES ,QUAKE-CNT
		 (<SETG QUAKE? T>
		  <TELL CR
"Suddenly, the silence is colossal.  Then the earth begins to shake">
		  <COND (<NOT <B-LYING?>>
			 <B-LIE-DOWN>
			 <TELL
" and you are tumbled to the ground." CR>)
			(ELSE
			 <TELL "." CR>)>)
		 (<SETG QUAKE? <>>
		  <TELL CR
"You feel your lungs about to burst, and every fiber of your being
screams in panic.  Toranaga and Mariko hold onto the ground with their
hands and feet.  The rumbling, catastrophic roar comes from earth and sky,
surrounding you, building and building.|
|
An avalanche of rocks starts from the mountain to the north and howls down
into the valley below.  Part of the samurai camp vanishes.|
|
Then the tremor stops." CR>)
		 (<SETG QUAKE? T>
		  <MOVE ,MAIN-FISSURE ,HERE>
		  <TELL CR
"Again the earth cries out.  The second quake begins">
		  <COND (<NOT <B-LYING?>>
			 <B-LIE-DOWN>
			 <TELL
", tossing you like a rag doll into the dust">)>
		  <TELL ".  The earth rips open
at the north end of the plateau.  A gaping fissure rushes toward you at an
incredible speed." CR>)
		 (DELAY
		  <COND (<NOT <FSET? ,MAIN-FISSURE ,RMUNGBIT>>
			 <COND (<OR <G? ,DELAY-CNT 1>
				    <IN? ,WINNER ,MAIN-FISSURE>>
				<CRLF>
				<JIGS-UP
"The fissure swallows you like a snake eating a bird.">)
			       (ELSE
				<TELL CR
"You stare in horror as the fissure rumbles toward you!" CR>)>)>)
		 (<THIS-IS-IT ,TORANAGA>
		  <FSET ,MAIN-FISSURE ,SCOREBIT>
		  <TELL CR
"Toranaga and Mariko teeter on the brink of the cleft.  As though in a
nightmare you see Toranaga, nearest the maw, begin to topple into it." CR>)
		 (<CRLF>
		  <COND (<NOT ,TORANAGA-HELD-FLAG>
			 <MOVE ,TORANAGA ,MAIN-FISSURE>
			 <FSET ,TORANAGA ,DEAD>
			 <FSET ,TORANAGA ,NDESCBIT>
			 <TELL
"Toranaga plunges into the cleft and is lost from sight!" CR>)
			(ELSE
			 <SETG TORANAGA-HELD-FLAG <>>
			 <TELL
"Mud and rocks pour down, dragging you and Toranaga into the
fissure.  You fight for a handhold and foothold, almost pulled down into the
abyss.  Still partially stunned, Toranaga hacks his toes into the face of
the wall and half-dragged, half-carried by you, claws his way out.  You
both lay gasping on the ground." CR>
			 <MOVE ,BLACKTHORNE ,HERE>
			 <SCORE-OBJECT ,MAIN-FISSURE>)>
		  <TELL CR
"Suddenly, there is another shock." CR>)
		 (<FSET ,MAIN-FISSURE ,RMUNGBIT>
		  <REMOVE ,MAIN-FISSURE>
		  <MOVE ,SIDE-FISSURE ,HERE>
		  <MOVE ,MAIN-FISSURE ,HERE> ;"so it will list first"
		  <MOVE ,MARIKO ,SIDE-FISSURE>
		  <THIS-IS-IT ,MARIKO>
		  <TELL CR
"The earth splits again, opening a side fissure away from the main
cleft.  Mariko screams as it swallows her." CR>)
		 (<TELL CR
"There is a new shock.">
		  <COND (<IN? ,BLACKTHORNE ,SIDE-FISSURE>
			 <TELL
"The ledge you and Mariko are on mostly gives way, only a few tiny
holds remaining as the rest falls downward.">)
			(<IN? ,MARIKO ,SIDE-FISSURE>
			 <TELL
"Mariko screams for help from within the side fissure.">)>
		  <CRLF>)
		 (<TELL CR
"The chasm howls and begins to close.">
		  <COND (<AND <IN? ,BLACKTHORNE ,SIDE-FISSURE>
			      <IN? ,MARIKO ,SIDE-FISSURE>>
			 <TELL
"You and Mariko fight for balance.">)
			(<IN? ,BLACKTHORNE ,SIDE-FISSURE>
			 <TELL
"The far wall screeches sickeningly as it approaches.  Mud and
stones tumble off it.">)
			(<IN? ,MARIKO ,SIDE-FISSURE>
			 <TELL
"You can barely hear Mariko over the rumble of the earthquake.  \"Anjin-san!  Help me!\"">)>
		  <CRLF>)
		 (<SETG QUAKE? <>>
		  <TELL CR
"The gap is closing.">
		  <COND (<IN? ,MARIKO ,SIDE-FISSURE>
			 <FSET ,MARIKO ,DEAD>
			 <FSET ,MARIKO ,NDESCBIT>
			 <TELL
"Mariko's ledge gives way, and she slides into the depths, clutching
futilely at the mud walls, her last scream silenced.">)>
		  <CRLF>)
		 (<COND (<IN? ,BLACKTHORNE ,SIDE-FISSURE>
			 <TELL CR
"Part of the wall falls away, carrying you with it into the abyss." CR>
			 <JIGS-UP>)
			(ELSE
			 <FSET ,SIDE-FISSURE ,RMUNGBIT>
			 <TELL CR
"The gap stops -- six paces across the mouth, eight deep.|
|
A bird screeches out of a tree and takes to the air screaming.  In the grass
an ant moves." CR>)>)
		 (<COND (<IN? ,TORANAGA ,HERE>
			 <TELL CR
"Toranaga points to the fissure that ">
			 <COND (<IN? ,MARIKO ,HERE>
				<TELL "almost swallowed him">)
			       (ELSE
				<TELL "swallowed Mariko">)>
			 <TELL ", now only a
narrow ditch.  He belches loudly, then hawks and spits.  A torrent of
abuse pours over the ditch">
			 <COND (<IN? ,MARIKO ,HERE>
				<TELL
", Mariko translating with increasing amusement: \"The pox on the karma, the pox on the
quake, the pox on the ditch -- I've lost my ">
				<COND (<IN? ,SWORDS ,TORANAGA>
				       <TELL "best ">)>
				<TELL "swords and the pox on that too!\"" CR>)
			       (ELSE
				<TELL "." CR CR
"You are stunned.  Mariko would have said \"Karma,\" but you cannot
understand such stoicism." CR>)>
			 <RTRUE>)
			(ELSE
			 <TELL CR
"You lie exhausted on the ground.  What will happen now, with Toranaga
dead?  Ishido will win, for certain, and you will never survive.  Mariko ">
			 <COND (<IN? ,MARIKO ,HERE>
				<TELL "says">)
			       (ELSE
				<TELL "would have said">)>
			 <TELL " \"Karma,\" but you cannot take it so
philosophically." CR>
			 <FAILED-SCENE>
			 <RFATAL>)>)
		 (DELAY
		  <COND (<AND <FSET? ,SWORDS ,SCOREBIT>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<COND (<FSET? ,PLATEAU ,SCOREBIT>
			 <TELL CR
"Toranaga rises, straddles the now narrow ditch, hitches up his kimono,
and attempts to urinate into it.  Nothing comes, and he laughs, inviting
you to join him." CR>)
			(ELSE
			 <TELL CR
"Toranaga looks around, savoring life, stretching like a cat.  He is able to
take a peasant's enjoyment in mere existence." CR>)>)
		 (DELAY
		  <COND (<AND <FSET? ,SWORDS ,SCOREBIT>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)
			(<AND <FSET? ,PLATEAU ,SCOREBIT>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<COND (<IN? ,MARIKO ,HERE>
			 <TELL CR
G"You lay full length on the ground and look up at the sky.  A moment ago
you were all ""almost dead, and all worry and heartache was wasted.  "I"Karma"
", you understand karma now." CR>
			 <REMOVE ,SWORDS>
			 <NEXT-SCENE>)
			(ELSE
			 <TELL CR
G"You lay full length on the ground and look up at the sky.  A moment ago
you were all ""alive, and now Mariko is dead.  "I"Karma"", you understand
karma now, but you can't accept it." CR>
			 <FAILED-SCENE>)>)>>

<OBJECT EARTHQUAKE
	(DESC "earthquake")
	(SYNONYM QUAKE EARTHQUAKE)
	(ADJECTIVE EARTH)
	(ACTION EARTHQUAKE-F)>

<ROUTINE EARTHQUAKE-F ()
	 <COND (<VERB? LISTEN>
		<COND (,QUAKE?
		       <TELL
"There is a low rumbling noise all around you, coming from deep
in the earth." CR>)
		      (ELSE
		       <TELL
"Right now, all is quiet." CR>)>)>>

<OBJECT MAIN-FISSURE
	(DESC "main fissure")
	(SYNONYM FISSURE CHASM CLEFT DITCH LEDGE)
	(ADJECTIVE MAIN FIRST OLD MUDDY)
	(FLAGS SEARCHBIT OPENBIT CONTBIT VEHBIT ;SCOREBIT)
	(GENERIC GENERIC-FISSURE-F)
	(DESCFCN FISSURE-DESC)
	(ACTION MAIN-FISSURE-F)>

<ROUTINE MAIN-FISSURE-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<AND <FSET? ,TORANAGA ,DEAD>
			    <OR <PRSO? ,TORANAGA>
				<PRSI? ,TORANAGA>>>
		       <TELL
"Toranaga has fallen out of sight to the bottom of the abyss." CR>)
		      (<P? TAKE MAIN-FISSURE>
		       <TELL
"You dig your fingers into the muddy walls of the cleft, your
fingernails tearing from the effort." CR>) 
		      (<P? LOOK-UP>
		       <TELL
"You can see the lip of the chasm and beyond, the blue sky." CR>)
		      (<OR <VERB? DISEMBARK CLIMB-UP>
			   <P? WALK (UP OUT)>
			   <P? CLIMB-FOO WALL>>
		       <MOVE ,WINNER ,HERE>
		       <B-LIE-DOWN>
		       <TELL
"You pull yourself out of the fissure." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? LISTEN>
		       <PERFORM ,V?LISTEN ,EARTHQUAKE>
		       <RTRUE>)
		      (<VERB? EXAMINE LOOK-INSIDE>
		       <TELL
"The cleft is is twenty paces deep and ten across and stinks of death.">
		       <COND (<IN? ,TORANAGA ,MAIN-FISSURE>
			      <COND (<IN? ,WINNER ,MAIN-FISSURE>
				     <TELL
"You are only barely holding on beside Toranaga." CR>)
				    (ELSE
				     <TELL
"Toranaga clings precariously to the wall a few feet below." CR>)>)
			     (ELSE <CRLF>)>)
		      (<VERB? ENTER BOARD CLIMB-DOWN>
		       <COND (<NOT <FSET? ,MAIN-FISSURE ,RMUNGBIT>>
			      <MOVE ,WINNER ,MAIN-FISSURE>
			      <B-STAND>
			      <TELL
"You claw your way to the fissure and into it, fingers and toes fighting
for a hold on the mud and rocks of the side wall." CR>)
			     (ELSE
			      <TELL
G"There are no longer any footholds or ledges." CR>)>)>)>>

<ROUTINE GENERIC-FISSURE-F (R F)
	 <COND (<AND <FSET? ,MAIN-FISSURE ,SCOREBIT>
		     <FSET? ,SIDE-FISSURE ,SCOREBIT>>
		<RFALSE>)
	       (<FSET? ,MAIN-FISSURE ,SCOREBIT>
		,MAIN-FISSURE)
	       (<FSET? ,SIDE-FISSURE ,SCOREBIT>
		,SIDE-FISSURE)
	       (<AND <NOT <FSET? ,MAIN-FISSURE ,RMUNGBIT>>
		     <NOT <FSET? ,SIDE-FISSURE ,RMUNGBIT>>>
		<RFALSE>)
	       (<NOT <FSET? ,MAIN-FISSURE ,RMUNGBIT>>
		,MAIN-FISSURE)
	       (<NOT <FSET? ,SIDE-FISSURE ,RMUNGBIT>>
		,SIDE-FISSURE)
	       (ELSE
		,MAIN-FISSURE)>>

<OBJECT SIDE-FISSURE
	(DESC "side fissure")
	(SYNONYM FISSURE CHASM CLEFT DITCH GAP LEDGE)
	(ADJECTIVE SIDE NEW SECOND MUDDY)
	(FLAGS SEARCHBIT OPENBIT CONTBIT VEHBIT SCOREBIT)
	(GENERIC GENERIC-FISSURE-F)
	(DESCFCN FISSURE-DESC)
	(ACTION SIDE-FISSURE-F)>

<ROUTINE FISSURE-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<COND (<EQUAL? .OBJ ,SIDE-FISSURE>
		       <TELL
"A deep and narrow side fissure arcs off from the main fissure.">
		       <COND (<AND <IN? ,MARIKO ,SIDE-FISSURE>
				   <IN? ,BLACKTHORNE ,SIDE-FISSURE>>
			      <TELL
"You and Mariko are clinging">)
			     (<IN? ,MARIKO ,SIDE-FISSURE>
			      <TELL
"Mariko clings">)
			     (<IN? ,BLACKTHORNE ,SIDE-FISSURE>
			      <TELL
"You are clinging">)
			     (ELSE <RFATAL>)>
		       <TELL " desperately to the crumbling"G" wall, standing
precariously on a narrow ledge.">
		       <RFATAL>)
		      (<EQUAL? .OBJ ,MAIN-FISSURE>
		       <TELL
"The main fissure snakes down from the hill, its muddy depths gaping.">
		       <COND (<IN? ,BLACKTHORNE ,SIDE-FISSURE>
			      <TELL
"You are clinging desperately to the muddy"G" wall, standing
precariously on a narrow ledge.">)>
		       <RFATAL>)>)>>

<ROUTINE SIDE-FISSURE-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<AND <FSET? ,MARIKO ,DEAD>
			    <OR <PRSO? ,MARIKO>
				<PRSI? ,MARIKO>>>
		       <TELL
"Mariko has fallen into the depths." CR>)
		      (<P? TAKE SIDE-FISSURE>
		       <TELL
"You try to grip the crumbling ledge with your feet, but it's
giving way beneath you!" CR>)
		      (<P? LOOK-UP>
		       <TELL
"You can see the crumbling mud of the chasm wall">
		       <COND (<AND <IN? ,TORANAGA ,PLATEAU>
				   <NOT <IN? ,MARIKO ,PLATEAU>>>
			      <TELL ", and Toranaga reaching down towards
you with his iron grip." CR>)
			     (ELSE <TELL "." CR>)>)
		      (<P? (TAKE REACH-FOR) MARIKO>
		       <TELL
"You pull her towards you as the ledge crumbles further." CR>)
		      (<OR <P? (RAISE PUSH-UP PUSH-OUT PUSH HELP THROW-OFF)
			       MARIKO
			       (<> ROOMS SIDE-FISSURE)>
			   <P? (PUSH-TO PUSH-UP GIVE) MARIKO TORANAGA>>
		       <TELL
"Your terror lends you inhuman strength and somehow you manage to
rip Mariko out of the tomb and shove her upward.">
		       <COND (<IN? ,TORANAGA ,HERE>
			      <MOVE ,MARIKO ,HERE>
			      <TELL
"Toranaga clutches her wrist and hauls her over the lip of the
chasm." CR>
			      <SCORE-OBJECT ,SIDE-FISSURE>)
			     (ELSE
			      <TELL
"She tries to pull herself over the lip of the chasm but she can't
get a grip on the mud and falls back." CR>)>)
		      (<OR <VERB? DISEMBARK CLIMB-UP>
			   <P? WALK (OUT UP)>
			   <P? CLIMB-FOO WALL>>
		       <MOVE ,WINNER ,HERE>
		       <QUEUE I-CRAWL 2>
		       <B-LIE-DOWN>
		       <TELL
"You tear yourself free of the mud and crumbling walls and grope half out
of your grave.  You lie on
the shuddering brink, your lungs gulping air, unable to crawl away." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? LISTEN>
		       <PERFORM ,V?LISTEN ,EARTHQUAKE>
		       <RTRUE>)
		      (<VERB? EXAMINE LOOK-INSIDE>
		       <TELL
"The fissure is ten paces wide and thirty paces deep.">
		       <COND (<AND <IN? ,MARIKO ,SIDE-FISSURE>
				   <NOT <FSET? ,MARIKO ,DEAD>>>
			      <COND (<IN? ,WINNER ,SIDE-FISSURE>
				     <TELL
"You are standing beside Mariko on a small ledge.">)
				    (ELSE
				     <TELL
"Mariko is shivering on a ledge a few feet below.">)>)>
		       <CRLF>)
		      (<VERB? REACH-IN>
		       <PERFORM ,V?TAKE ,MARIKO>
		       <RTRUE>)
		      (<VERB? ENTER BOARD CLIMB-DOWN>
		       <COND (<NOT <FSET? ,SIDE-FISSURE ,RMUNGBIT>>
			      <MOVE ,WINNER ,SIDE-FISSURE>
			      <B-STAND>
			      <TELL
"You let yourself slide down, mud and stones crumbling off of the wall
and almost blinding you.">
			      <COND (<IN? ,MARIKO ,SIDE-FISSURE>
				     <TELL
"You reach the narrow ledge on which Mariko is standing." CR>)
				    (ELSE
				     <TELL
"You reach a narrow crumbling ledge." CR>)>)
			     (ELSE
			      <TELL
G"There are no longer any footholds or ledges." CR>)>)>)>>

<ROUTINE I-CRAWL () <RFALSE>>

<ROUTINE ZATAKI-AFTER-F ()
	 <MARGINAL-PIC ,P-WARRIOR T ,P-WARRIOR-CORNER T>
	 <TELL
"At the Hour of the Goat the sentries on the bridge stand aside.  The
cortege begins to cross.  First are the heralds carrying banners bedecked
with the all-powerful cipher of the Regents, then the rich palanquin, and
finally more guards." CR>
	<TELL CR
"Villagers bow.  All are on their knees, secretly agog at such richness and
pomp." CR>
	<TELL CR
"Saigawa Zataki, Lord of Shinano and Toranaga's half brother, rides in
the palanquin." CR>
	<TELL CR
"\"Welcome, brother.\"  Toranaga steps off the dais and bows.  He wears
the simplest of kimonos and soldier's straw sandals.  And swords.  \"Please
excuse me for receiving you so informally, but I came as quickly as I
could.\"" CR>
	<TELL CR
"Zataki gets out of the palanquin and bows in return, beginning the
interminable, meticulous formalities of the ceremonial that now rules
both of them." CR>
	<TELL CR
"At length they are seated opposite each other on the dais, two swords
lengths apart.  Mariko serves ceremonial cha.  Then Zataki says brusquely,
\"I bring orders from the Council of Regents.\"" CR>
	<TELL CR
"A sudden hush falls on the square.  Everyone, even his own men, is aghast
at Zataki's lack of manners, at the insolent way he said 'orders' and
not 'message,' and at his failure to wait for Toranaga to ask, \"How can
I be of service?\" as the ceremonial demanded." CR>
	<TELL CR
"Zataki rips two small scrolls out of his sleeve.  He breaks the seal on
the first scroll and reads, in a loud, chilling voice: \"By order of
the Council of Regents, in the name of the Emperor: We greet our vassal
Yoshi Toranaga and invite him to make obeisance before us in Osaka
forthwith, and invite him to inform our ambassador, the Regent Saigawa
Zataki, if our invitation is accepted or refused -- forthwith.\"" CR>
	<TELL CR
"He places the scroll in front of him.  Toranaga signals to Buntaro,
who bows low to Zataki, picks up the scroll, and brings it to Toranaga." CR>
	<TELL CR
"Toranaga studies the scroll interminably." CR>
	<TELL CR
"\"Give me your answer now.  You've no more time!  Forthwith, the message
said.  Of course you refuse to obey, good, so it's done.  Here!\"  Zataki
puts the second scroll on the tatamis.  \"Here's your formal impeachment
and order to commit seppuku, which you'll treat with equal contempt!  The
next time we meet will be on a battlefield!\"" CR>
	<TELL CR
"\"How can I prove I'm not trying to overthrow the heir?\"  Toranaga
asks his brother." CR>
	<TELL CR
"\"Immediately abdicate all your titles and power to your son and heir,
Lord Sudara, and commit seppuku today!  Then I and all my men will support
him as Lord of the Kwanto!\"" CR>
	<TELL CR
"\"I'll consider what you've said.\"" CR>
	<TELL CR
"\"Is this another of your tricks?  Buntaro-san, give your master the
second scroll!\"" CR>
	<TELL CR
"\"No!\"  Toranaga's voice reverberates around the square.  Then, with
great ceremony, he adds loudly, \"I agree to go to Osaka and to submit
to the will of the Council.\"  He bows formally." CR>
	<TELL CR
"\"You're going to submit?,\" Zataki begins, his face twisting with
disbelief." CR>
	<TELL CR
"\"Listen!  I accept the invitation!  I will leave today!\"" CR>>

<OBJECT ZATAKI
	(LOC GLOBAL-OBJECTS)
	(DESC "Zataki")
	(SYNONYM ZATAKI)
	(ADJECTIVE SAIGAWA LORD)
	(FLAGS PERSON JAPANESEBIT NOABIT NOTHEBIT OPENBIT CONTBIT SEARCHBIT)
	(CONTFCN ZATAKI-F)
	(ACTION ZATAKI-F)>

<ROUTINE ZATAKI-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND ;(<VERB? EXAMINE>
		       <TELL
"Saigawa Zataki is taller than Toranaga, and younger by five years, with
the same breadth of shoulders and prominent nose.  But his stomach is
flat, the stubble of his beard black and heavy, his eyes mere slits in
his face.  His kimono is rich, his armor glittering and ceremonial, and
his swords well used." CR>)
		      (<VERB? WHO>
		       <TELL
"Zataki is Lord of Shinano and half-brother of Toranaga.">
		       <COND (<G=? ,SCENE ,S-QUAKE>
			      <TELL
"He is a member of the Council of Regents, replacing Lord Sugiyama,
who was murdered by "I"ronin"" -- or assassinated by Ishido.">)>
		       <CRLF>)>)>>

<END-SEGMENT ;"QUAKE">

"S-JOURNEY"

<BEGIN-SEGMENT YOKOSE>

<CONSTANT J-YOSHI 130>

<ROOM YOKOSE-BATH-HOUSE
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (SCORE 3)
      (AFTER JOURNEY-AFTER-F)
      (FDESC
"Toranaga tells everyone he will head up the east road toward Atami
and Odawara, thence over the mountains to Yedo.  Mariko is given
permission to go to Osaka.  \"But first you'll go directly from here
to Mishima, then continue on to Yedo with the Anjin-san.  You're
responsible for him until you arrive.\"|
|
Buntaro turns to Mariko.  \"Sayonara -- until I see you at Osaka.  When
we meet there or when you return from there, then we begin again.\"|
|
\"Sayonara, my Lord.\"  Mariko bows.  He swings into his saddle and
is off toward the head of the column.|
|
\"Go with God,\" she says, and you watch her eyes following Buntaro.|
|
The journey to Mishima takes nine days, and every night, for part of
the night, you are together.  Secretly.  Your escort, Captain Akira
Yoshinaka, unwittingly makes it easier by placing you in adjoining rooms.|
|
Tonight the group arrives at Yokose Spa, road-weary and dirty from the
journey.  Everyone is anxious for a bath and a night's sleep -- or
other relaxation.")
      (DESC "Bath House")
      (LDESC
"This is the bath house outside the inn at Yokose.  The first floor of
the inn is to the west.")
      (SYNONYM BATH HOUSE)
      (ADJECTIVE BATH)
      (WEST TO YOKOSE-FIRST-FLOOR)
      (FLAGS ONBIT RMUNGBIT)
      (ACTION YOKOSE-BATH-HOUSE-F)>

<ROUTINE YOKOSE-BATH-HOUSE-F ("OPT" (RARG <>))
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<MOVE ,MARIKO ,YOKOSE-BATH-HOUSE>
		<MOVE ,ROBE ,MARIKO>
		<FSET ,ROBE ,WEARBIT>
		<MOVE ,CHIMMOKO ,YOKOSE-BATH-HOUSE>
		<MOVE ,GYOKO ,YOKOSE-SPA-5>
		<MOVE ,KIKU ,YOKOSE-SPA-5>
		<MOVE ,YOSHINAKA ,YOKOSE-BATH-HOUSE>
		<QUEUE I-YOKOSE-BATH -1>)
	       (<RARG? BEG>
		<COND (<AND <P? WALK P?WEST>
			    <FSET? ,YOKOSE-BATHTUB ,SCOREBIT>>
		       <TELL
"\"Anjin-san, you must bathe before you go to your room!\" chides Mariko." CR>)
		      (<P? EXAMINE MARIKO>
		       <COND (<FSET? ,ROBE ,WEARBIT>
			      <TELL
"Mariko is standing near the tub, wearing a thick cotton bathing robe
tied loosely about her waist." CR>)
			     (ELSE
			      <COND (<IN? ,MARIKO ,YOKOSE-BATHTUB>
				     <COND (<IN? ,BLACKTHORNE ,YOKOSE-BATHTUB>
					    <TELL
"Mariko is next to you in the bathtub, washing unhurriedly.">)
					   (ELSE
					    <TELL
"Mariko is in the bath tub, naked.">)>)
				    (ELSE
				     <TELL
"She is naked, preparing to take her bath.">)>
			      <TELL "The first time you saw her naked
you were greatly affected.  Now her nakedness, of itself, does not touch
you physically.  Living closely in Japanese style in a Japanese house
where the walls are paper and the rooms multipurpose, you have seen her
unclothed and partially clothed many times." CR>)>)
		      (<P? THROW TOWEL MARIKO>
		       <TELL
"\"You are behaving like a child, Anjin-san!\"" CR>)
		      (<AND <IN? ,PLAYER ,HERE>
			    <TAKE-A-BATH?>>
		       <PERFORM ,V?BOARD ,YOKOSE-BATHTUB>
		       <RTRUE>)
		      (<P? RINSE (ME BLACKTHORNE)>
		       <COND (<FSET? ,BLACKTHORNE ,RMUNGBIT>
			      <TELL "You already have!" CR>)
			     (ELSE
			      <PERFORM ,V?BOARD ,YOKOSE-BATHTUB>
			      <RTRUE>)>)
		      (<AND <P? BATHE MARIKO>
			    <IN? ,MARIKO ,YOKOSE-BATHTUB>
			    <NOT <IN? ,WINNER ,YOKOSE-BATHTUB>>>
		       <YOULL-HAVE-TO "get in the tub">)
		      (<AND <P? BATHE *> ,PRSO>
		       <COND (<FSET? ,PRSO ,PERSON>
			      <COND (<FSET? ,PRSO ,PLURAL>
				     <TELL
G"There wouldn't be room for so many!" CR>)
				    (ELSE
				     <TELL
CTHE ,PRSO G" smiles at your invitation, but shakes " HIS/HER ,PRSO
" head." CR>)>)
			     (ELSE
			      <TELL
CTHE ,PRSO G" would probably be worse for the experience." CR>)>)>)
	       (<RARG? END>
		<COND (<AND <IN? ,TOWEL ,HERE>
			    <NOT <FSET ,TOWEL ,TOUCHBIT>>
			    <NOT <FIND-IN ,BLACKTHORNE ,WEARBIT>>>
		       <MOVE ,TOWEL ,BLACKTHORNE>
		       <TELL CR
"Although your modesty is much reduced since you arrived in Japan, you
grab a nearby towel anyway." CR>)>)>>

<ROUTINE JOURNEY-AFTER-F ()
	 <TELL
"You continue on to Yedo, Toranaga's capital.  Toranaga has delayed his
departure for Osaka for weeks, complaining of the weather one day, and
the need for careful preparation another.  He tells Hiro-matsu, \"I never
intended to go to Osaka.  Ishido took the bait.  With no real concession
whatsoever I've gained a month, put Ishido and his filthy allies in
turmoil!\"|
|
After several days of waiting, Mariko receives from Toranaga the travel
documents she needs to go to Osaka, and you are given money to hire
additional crew for the "I"Erasmus"" in Nagasaki.  The survivors of the
"I"Erasmus"" have found a place for themselves among the "I"eta"" of Yedo
and except for Vinck, are useless as crew and unwilling to accommodate to
Japanese ways.|
|
You, Vinck, Mariko, and Yabu board a galley for Osaka.  When you arrive,
you find the elaborate preparations for Toranaga's visit underway.|
|
\"Of course, the Council will have no objections if I check the
arrangements?\" Yabu asks Prince Ogaki, an intermediary between the
Council and the Emperor.  \"The ceremony must be worthy of the Council
and occasion!\"|
|
\"Worthy of His Imperial Majesty!\" responds Ogaki.  \"It's his summons,
now.  Here is your invitation to the ceremony.\"|
|
Yabu quails as he sees the Imperial seal.  No one, not even Toranaga, could
refuse such a summons.  Nineteen days!  That's all the time that's
left!  Feeling weak, Yabu hears Ogaki say, \"Tomorrow you are invited to a
formal reception by Lord Ishido to honor the birthday of the Lady Ochiba.\"" CR>>

<OBJECT ROBE
	(LOC YOKOSE-BATH-HOUSE)
	(OWNER MARIKO)
	(DESC "robe")
	(SYNONYM ROBE)
	(ADJECTIVE THICK COTTON BATHING BATH)
	(FLAGS TAKEBIT WEARABLE WEARBIT)
	(ACTION ROBE-F)>

<ROUTINE ROBE-F ()
	 <COND (<VERB? WEAR>
		<TELL "It's like a child's robe to you.  It wouldn't fit." CR>)
	       (<AND <VERB? TAKE-OFF>
		     <IN? ,ROBE ,MARIKO>
		     <FSET? ,ROBE ,WEARBIT>>
		<MOVE ,ROBE ,HERE>
		<FCLEAR ,ROBE ,WEARBIT>
		<TELL
"You offer to take her robe, and she thanks you, unself-consciously letting
you remove it.  You put it aside, neatly folded." CR>)>>

<OBJECT TOWEL
	(LOC YOKOSE-BATH-HOUSE)
	(DESC "towel")
	(SYNONYM TOWEL)
	(ADJECTIVE SMALL BATH)
	(FLAGS TAKEBIT TOOLBIT WEARABLE)
	(ACTION TOWEL-F)>

<ROUTINE TOWEL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is an embarrassingly small towel." CR>)
	       (<P? (DRY RUB) ME>
		<COND (<IN? ,WINNER ,YOKOSE-BATHTUB>
		       <TELL "You're still in the tub." CR>)
		      (<NOT <FSET? ,YOKOSE-BATHTUB ,TOUCHBIT>>
		       <TELL "You aren't wet." CR>)
		      (ELSE
		       <TELL "You dry off as best you can." CR>)>)
	       (<VERB? WEAR HIDE-BEHIND HIDE-UNDER>
		<TELL
"The towel is nearly too small to cover the subject." CR>)>>

<OBJECT YOKOSE-BATHTUB
	(LOC YOKOSE-BATH-HOUSE)
	(DESC "bath tub")
	(SYNONYM TUB BATH POOL WATER)
	(ADJECTIVE BATH WOODEN HOT)
	(FLAGS NDESCBIT CANT-HOLD VEHBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(CAPACITY 300)
	(DESCFCN YOKOSE-BATHTUB-DESC)
	(ACTION YOKOSE-BATHTUB-F)>

<ROUTINE YOKOSE-BATHTUB-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"A large wooden bathtub dominates the room.">
		<COND (<IN? ,MARIKO ,BATHTUB>
		       <TELL
"Mariko is bathing in the tub.">)>
		<RFATAL>)>>

<ROUTINE YOKOSE-BATHTUB-F ("OPT" (RARG <>) "AUX" RUIN)
	 <COND (<RARG? BEG>
		<COND (<VERB? WALK>
		       <YOULL-HAVE-TO "get out of the tub">)
		      (<AND <VERB? WEAR>
			    <NOT <IN? ,PRSO ,BATHTUB>>>
		       <TELL
G"You'd get it wet!" CR>)
		      (<VERB? LIE-DOWN KNEEL>
		       <TELL G"You would drown." CR>)
		      (<P? BATHE MARIKO>
		       <COND (<IN? ,MARIKO ,YOKOSE-BATHTUB>
			      <TELL
"You beckon Mariko to your side of the tub, and begin soaping her back.">
			      <EXHIBITION>)>)
		      (<OR <VERB? LEAP DIVE>
			   <TAKE-A-BATH?>>
		       <COND (<IN? ,MARIKO ,YOKOSE-BATHTUB>
			      <TELL
"You begin soaping away the filth of the road, and Mariko moves over to
soap your back.">
			      <EXHIBITION>)
			     (ELSE
			      <TELL "You scrub yourself." CR>)>)
		      (<P? EXIT GLOBAL-HERE>
		       <PERFORM ,V?DISEMBARK>
		       <RTRUE>)
		      (<OUTSIDE-TUB? ,YOKOSE-BATHTUB>
		       <TELL
CTHE ,PRSO IS/ARE ,PRSO G" outside the tub and out of reach." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <COND (<NOUN-USED? ,PRSO ,W?WATER>
			      <TELL
"It's very hot, despite Mariko's complaints, and very clean." CR>)
			     (ELSE
			      <TELL
G"The tub is wooden, large enough for several people, and deep enough
that they could sit in it with only their heads above water." CR>)>)
		      (<P? (TAKE MOVE) YOKOSE-BATHTUB>
		       <COND (<AND <EQUAL? ,P-PRSA-WORD ,W?TAKE>
				   <NOUN-USED? ,PRSO ,W?BATH>>
			      <PERFORM ,V?BATHE ,ME>
			      <RTRUE>)
			     (ELSE
			      <TELL
G"It's much too heavy!" CR>)>)
		      (<VERB? POUR>
		       <TELL G"And waste all that nice hot water?" CR>)
		      (<VERB? CLIMB-FOO BOARD ENTER>
		       <SET RUIN <RUINABLE? ,WINNER>>
		       <COND (.RUIN
			      <COND (<OR <IN? ,MARIKO ,HERE>
					 <IN? ,MARIKO ,YOKOSE-BATHTUB>>
				     <TELL
"Mariko says, \"Please, Anjin-san, don't climb into the tub ">
				     <COND (<FSET? .RUIN ,WEARBIT>
					    <TELL
"wearing your dirty " D .RUIN>)
					   (ELSE
					    <TELL
"carrying " THE .RUIN ".  You'll get " HIM/HER .RUIN " wet">)>
				     <TELL "!\"" CR>)
				    (ELSE
				     <TELL
"You remember at the last second that you are still ">
				     <COND (<FSET? .RUIN ,WEARBIT>
					    <TELL "wear">)
					   (ELSE <TELL "carry">)>
				     <TELL "ing your "
D .RUIN "." CR>)>)
			     (<NOT <FSET? ,BLACKTHORNE ,RMUNGBIT>>
			      <PUT-DOWN-TOWEL>
			      <FSET ,BLACKTHORNE ,RMUNGBIT>
			      <TELL
"You soap yourself up and rinse off by pouring buckets of water over
your head.  You never enter a bathtub dirty!  Now you are ready for
the hot soak that makes a bath a true bath!" CR>) 
			     (ELSE
			      <PUT-DOWN-TOWEL>
			      <MOVE ,WINNER ,YOKOSE-BATHTUB>
			      <FSET ,YOKOSE-BATHTUB ,TOUCHBIT>
			      <FCLEAR ,BLACKTHORNE ,RMUNGBIT>
			      <TELL
G"You climb gingerly up and over the side of the tub, and ease yourself
in.  The water is scalding!" CR>)>)
		      (<VERB? DRINK TASTE>
		       <TELL
G"You try to drink the scalding bathwater, but it's far too hot." CR>)>)>>

<ROUTINE PUT-DOWN-TOWEL ()
	 <COND (<IN? ,TOWEL ,WINNER>
		<MOVE ,TOWEL ,HERE>
		<TELL
"First, you put down the towel so it won't get wet.  ">)>>

<ROUTINE EXHIBITION ()
	 <TELL "People are watching all around the room, undisturbed by
a public exhibition that would lead to prison or worse in
England.|
|
As the bath finishes and you climb out, you try to hide your anticipation
of the night -- your anticipation and your fear of discovery." CR>
	 <SCORE-OBJECT ,YOKOSE-BATHTUB>
	 <TIME-PASSES>
	 <DRESS-BLACKTHORNE>
	 <MOVE ,DICTIONARY ,YOKOSE-SPA-1>
	 <MOVE ,MARIKO ,YOKOSE-SPA-3>
	 <MOVE ,CHIMMOKO ,YOKOSE-SPA-3>
	 <MOVE ,GYOKO ,YOKOSE-SPA-5>
	 <MOVE ,KIKU ,YOKOSE-SPA-5>
	 <MOVE ,YOSHINAKA ,YOKOSE-SPA-6>
	 <MOVE ,BLACKTHORNE ,HERE>
	 <MOVE ,TOWEL ,HERE>
	 <DRESS-BLACKTHORNE>
	 <DEQUEUE I-YOKOSE-BATH>
	 <QUEUE I-YOSHINAKA -1>
	 <CRLF>
	 <GOTO ,YOKOSE-SPA-1>>

<ROUTINE I-YOKOSE-BATH ("AUX" (H? <HERE? ,YOKOSE-BATH-HOUSE>))
	 <ZLINES ,BATH-CNT
		 (<THIS-IS-IT ,MARIKO>
		  <COND (.H?
			 <TELL CR
"Mariko calls to you, \"Come, Anjin-san, bathe thyself!  The water is
nearly cold, as is to thy liking!\"  In fact, you still find the
temperature of the baths near to scalding." CR>)>)
		 (<COND (<IN? ,ROBE ,MARIKO>
			 <MOVE ,ROBE ,HERE>
			 <FCLEAR ,ROBE ,WEARBIT>
			 <COND (.H?
				<TELL CR
"Mariko removes her thick cotton bathing robe">)>)
			(ELSE
			 <COND (.H?
			 <TELL CR
"Mariko finishes preparing for her bath">)>)>
		  <COND (.H?
		  <TELL " with the assistance of
Chimmoko, her maid." CR>)>)
		 (DELAY
		  <COND (<AND <L? ,DELAY-CNT 4>
			      <OR <HELD? ,KIMONO>
				  <HELD? ,SANDALS>
				  <HELD? ,SOCKS>>>
			 <COND (<EQUAL? ,DELAY-CNT 1 2>
				<COND (.H?
				       <TELL CR
"\"Come, Anjin-san, the water chills!\" Mariko laughs." CR>
				       <RTRUE>)
				      (ELSE <RFALSE>)>)
			       (<EQUAL? ,DELAY-CNT 3>
				<COND (.H?
				       <TELL CR
"\"I chill as well, Anjin-san, the air is cold!\" Mariko says." CR>
				       <RTRUE>)
				      (ELSE
				       <RFALSE>)>)
			       (ELSE
				<COND (.H?
				       <TELL CR
"\"Well, I suppose I'll bathe without you,\" she says, disappointed at
your prudishness." CR>
				       <RTRUE>)
				      (ELSE <RFALSE>)>)>)>)
		 (<MOVE ,MARIKO ,YOKOSE-BATHTUB>
		  <COND (.H?
			 <COND (<AND <NOT <HELD? ,KIMONO>>
				     <NOT <HELD? ,SANDALS>>
				     <NOT <HELD? ,SOCKS>>>
				<MARGINAL-PIC ,P-BATH <>>)>
			 <TELL CR
"Mariko climbs into the tub and begins bathing." CR>)>)
		 (DELAY
		  <COND (<IN? ,BLACKTHORNE ,YOKOSE-BATH-HOUSE>
			 <COND (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"Mariko begins to soap herself." CR>)
			       (<EQUAL? ,DELAY-CNT 2>
				<TELL CR
"Mariko is soaping herself and Chimmoko helps by scrubbing her back." CR>)
			       (<EQUAL? ,DELAY-CNT 3>
				<TELL CR
"Mariko rinses off, water streaming down her long black hair." CR>)
			       (<EQUAL? ,DELAY-CNT 4>
				<MOVE ,MARIKO ,YOKOSE-SPA-3>
				<MOVE ,CHIMMOKO ,YOKOSE-SPA-3>
				<TELL CR
"Mariko climbs out of the bath, puts on her robe, and with a slightly
disappointed bow, heads inside." CR>
				<FAILED-SCENE>)>
			 <RTRUE>)>)
		 (<REMOVE ,ROBE>
		  <DEQUEUE I-YOKOSE-BATH>)>>

<OBJECT SHOJI-1
	(LOC LOCAL-GLOBALS)
	(DESC "west shoji")
	(SYNONYM SHOJI DOOR)
	(FLAGS NDESCBIT DOORBIT)>

<OBJECT SHOJI-2
	(LOC LOCAL-GLOBALS)
	(DESC "east shoji")
	(SYNONYM SHOJI DOOR)
	(FLAGS NDESCBIT DOORBIT)>

<OBJECT SHOJI-3
	(LOC LOCAL-GLOBALS)
	(DESC "west shoji")
	(SYNONYM SHOJI DOOR)
	(FLAGS NDESCBIT DOORBIT)>

<OBJECT SHOJI-4
	(LOC LOCAL-GLOBALS)
	(DESC "east shoji")
	(SYNONYM SHOJI DOOR)
	(FLAGS NDESCBIT DOORBIT)>

<OBJECT SHOJI-5
	(LOC LOCAL-GLOBALS)
	(DESC "west shoji")
	(SYNONYM SHOJI DOOR)
	(FLAGS NDESCBIT DOORBIT)>

<OBJECT SHOJI-6
	(LOC LOCAL-GLOBALS)
	(DESC "east shoji")
	(SYNONYM SHOJI DOOR)
	(FLAGS NDESCBIT DOORBIT)>

<ROOM YOKOSE-SPA-1
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (OWNER BLACKTHORNE)
      (DESC "Blackthorne's Room")
      (LDESC
"This is your room at the spa at Yokose.  The corridor is outside, and
Mariko's room is next to yours, but accessible only from the corridor.")
      (SYNONYM YOKOSE SPA ROOM)
      (ADJECTIVE YOKOSE)
      (OUT TO YOKOSE-CORRIDOR-1)
      (EAST TO YOKOSE-CORRIDOR-1)
      (FLAGS ONBIT RMUNGBIT)
      (GLOBAL LG-YOSHINAKA SHOJI-1)
      (ACTION YOKOSE-SPA-1-F)>

<ROUTINE YOKOSE-SPA-1-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<VERB? SLEEP>
		       <TELL
"You can't sleep. You only want to be with Mariko. You know your time
together will end soon." CR>)>)
	       (<RARG? ENTER>
		<COND (<FSET? ,HERE ,SCOREBIT>
		       <SCORE-OBJECT ,HERE>
		       <TELL
"You return to the safety and loneliness of your own room, remembering
Mariko's answer when you asked \"After Mishima, what then?\"|
|
\"There's a pass that curls up through the mountains.  After that the road falls
away to the city of Odawara.  From there to Yedo is only a matter of time.\"|
|
\"How much time?\"|
|
\"Not enough,\" she answered.|
|
\"You're wrong, my love, so sorry,\" you said.  \"There's all the time in the
world.\"" CR>
		       <NEXT-SCENE>
		       <RFATAL> ;"short out v-first-look")>)>>

<ROOM YOKOSE-SPA-2
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "Room in the Inn")
      (LDESC
"This is a room at the spa at Yokose.  The corridor is outside.")
      (SYNONYM YOKOSE SPA ROOM)
      (ADJECTIVE YOKOSE)
      (OUT TO YOKOSE-CORRIDOR-1)
      (WEST TO YOKOSE-CORRIDOR-1)
      (GLOBAL LG-YOSHINAKA SHOJI-2)
      (FLAGS ONBIT RMUNGBIT)
      (ACTION YOKOSE-SPA-F)>

<ROUTINE YOKOSE-SPA-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<VERB? SLEEP>
		       <TELL
"You should sleep in your own room. To sleep in someone else's would be
impolite." CR>)>)>>

<OBJECT YOKOSE-GUEST-1
	(LOC YOKOSE-SPA-2)
	(DESC "guest")
	(SYNONYM GUEST)
	(FLAGS PERSON JAPANESEBIT)
	(ACTION YOKOSE-GUEST-F)>

<ROOM YOKOSE-CORRIDOR-1
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "South of Corridor")
      (LDESC
"This is the corridor outside the rooms.  It continues north and there
are rooms to the east and west.")
      (SYNONYM YOKOSE SPA CORRIDOR)
      (ADJECTIVE YOKOSE)
      (WEST TO YOKOSE-SPA-1)
      (EAST TO YOKOSE-SPA-2)
      (NORTH TO YOKOSE-CORRIDOR-2)
      (GLOBAL LG-YOSHINAKA SHOJI-1 SHOJI-2)
      (FLAGS ONBIT)>

<ROOM YOKOSE-SPA-3
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "Mariko's Room")
      (OWNER MARIKO)
      (LDESC
"This is a room at the spa at Yokose.  The corridor is outside.")
      (SYNONYM YOKOSE SPA ROOM)
      (ADJECTIVE YOKOSE)
      (OUT TO YOKOSE-CORRIDOR-2)
      (EAST TO YOKOSE-CORRIDOR-2)
      (FLAGS ONBIT RMUNGBIT SCOREBIT)
      (GLOBAL LG-YOSHINAKA SHOJI-3)
      (ACTION YOKOSE-SPA-3-F)>

<ROUTINE YOKOSE-SPA-3-F ("OPT" (RARG <>))
	 <COND (<RARG? ENTER>
		<COND (<EQUAL? <LOC ,YOSHINAKA> ,YOKOSE-CORRIDOR-1
			       ,YOKOSE-CORRIDOR-2 ,YOKOSE-CORRIDOR-3>
		       <SETG YOSHI-GOAL ,YOKOSE-SPA-3>)>
		<COND (<IN? ,CHIMMOKO ,HERE>
		       <MOVE ,CHIMMOKO ,YOKOSE-CORRIDOR-2>
		       <TELL
"As you enter the room, Chimmoko slips silently out." CR CR>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<P? WALK (P?OUT P?EAST)>
		       <COND (<EQUAL? <LOC ,YOSHINAKA> ,YOKOSE-CORRIDOR-1
				      ,YOKOSE-CORRIDOR-2 ,YOKOSE-CORRIDOR-3>
			      <TELL
"You open the shoji a crack, make a quick scan of the corridor looking
for anyone who might be watching, and ">
			      <COND (<JIGS-UP? ,J-YOSHI
"catch a fleeting glimpse of Yoshinaka.  Heart pounding, you slip the
shoji closed.">
				     <JIGS-UP
"seeing no one, slip out.  Suddenly,
Yoshinaka appears out of nowhere.  Mariko screams, and Yoshinaka looks almost
regretful as he takes your head.">
				     <RFATAL>)
				    (ELSE <RTRUE>)>)>)
		      (<P? (KISS FUCK LOVE) MARIKO>
		       <COND (<IN? ,YOSHINAKA ,HERE>
			      <TELL
"Such activity would be fatal with Yoshinaka here to see!" CR>)
			     (<FSET? ,HERE ,SCOREBIT>
			      <FSET ,YOKOSE-SPA-1 ,SCOREBIT>
			      <SCORE-OBJECT ,HERE>
			      <TELL
"\"Thou!  At long last I know what love means,\" she murmurs in Latin, the
language of lovers.  \"I love thee, so I'm
afraid for thee.\" she whispers.  \"I've
destroyed thee, my love, by beginning.  We're doomed now.  I've destroyed thee
-- that is the truth.\"|
|
\"No, Mariko, somehow something will happen to make everything right.\"|
|
\"I should never have begun.  The fault is mine.\"|
|
\"Do not worry, I beg thee.  "I"Karma"" is "I"karma"".\"|
|
At length she is persuaded and melts into your arms." CR>)
			     (ELSE
			      <SETG YOSHI-GOAL ,YOKOSE-SPA-3>
			      <TELL
"\"Ah, Anjin-san, we tempt fate even now!  Danger is everywhere for
us.  You must go.\"" CR>)>)
		      (<VERB? SLEEP>
		       <TELL
"\"You can't sleep here, Anjin-san. We would be discovered for
certain!\"" CR>)>)>>

<ROOM YOKOSE-SPA-4
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "Room at the Inn")
      (LDESC
"This is a room at the spa at Yokose.  The corridor is outside.")
      (SYNONYM YOKOSE SPA ROOM)
      (ADJECTIVE YOKOSE)
      (OUT TO YOKOSE-CORRIDOR-2)
      (WEST TO YOKOSE-CORRIDOR-2)
      (GLOBAL LG-YOSHINAKA SHOJI-4)
      (FLAGS ONBIT RMUNGBIT)
      (ACTION YOKOSE-SPA-F)>

<OBJECT YOKOSE-GUEST-2
	(LOC YOKOSE-SPA-4)
	(DESC "guest")
	(SYNONYM GUEST)
	(FLAGS PERSON JAPANESEBIT)
	(ACTION YOKOSE-GUEST-F)>

<ROUTINE YOKOSE-GUEST-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"What you can mostly see is that the guest is annoyed at having his sleep
disturbed." CR>)>)>>

<ROOM YOKOSE-CORRIDOR-2
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "Middle of Corridor")
      (LDESC
"This is the corridor outside the rooms.  It continues north and south
and there are rooms to the east and west.")
      (SYNONYM YOKOSE SPA CORRIDOR)
      (ADJECTIVE YOKOSE)
      (WEST TO YOKOSE-SPA-3)
      (EAST TO YOKOSE-SPA-4)
      (NORTH TO YOKOSE-CORRIDOR-3)
      (SOUTH TO YOKOSE-CORRIDOR-1)
      (GLOBAL LG-YOSHINAKA SHOJI-3 SHOJI-4)
      (FLAGS ONBIT)>

<ROOM YOKOSE-SPA-5
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "Gyoko's Room")
      (OWNER GYOKO)
      (LDESC
"This is a room at the spa at Yokose.  The corridor is outside.")
      (SYNONYM YOKOSE SPA ROOM)
      (ADJECTIVE YOKOSE)
      (OUT TO YOKOSE-CORRIDOR-3)
      (EAST TO YOKOSE-CORRIDOR-3)
      (GLOBAL LG-YOSHINAKA SHOJI-5)
      (FLAGS ONBIT RMUNGBIT)
      (ACTION YOKOSE-SPA-F)>

<ROOM YOKOSE-SPA-6
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (OWNER YOSHINAKA)
      (DESC "Yoshinaka's Room")
      (LDESC
"This is a room at the spa at Yokose.  The corridor is outside.")
      (SYNONYM YOKOSE SPA ROOM)
      (ADJECTIVE YOKOSE)
      (OUT TO YOKOSE-CORRIDOR-3)
      (WEST TO YOKOSE-CORRIDOR-3)
      (GLOBAL LG-YOSHINAKA SHOJI-6)
      (FLAGS ONBIT RMUNGBIT)
      (ACTION YOKOSE-SPA-F)>

<ROOM YOKOSE-CORRIDOR-3
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "North of Corridor")
      (LDESC
"This is the corridor outside the rooms.  It continues south and there
are rooms to the east and west.  A stair leads down.")
      (SYNONYM YOKOSE SPA CORRIDOR)
      (ADJECTIVE YOKOSE)
      (WEST TO YOKOSE-SPA-5)
      (EAST TO YOKOSE-SPA-6)
      (SOUTH TO YOKOSE-CORRIDOR-2)
      (DOWN TO YOKOSE-FIRST-FLOOR)
      (GLOBAL LG-YOSHINAKA SHOJI-5 SHOJI-6)
      (FLAGS ONBIT)>

<ROOM YOKOSE-FIRST-FLOOR
      (LOC ROOMS)
      (SCENE S-JOURNEY)
      (DESC "First Floor")
      (LDESC
"This is the first floor of the spa at Yokose.  A stair leads up to
the private rooms.  To the east is the bath house.")
      (SYNONYM YOKOSE SPA)
      (ADJECTIVE YOKOSE)
      (EAST TO YOKOSE-BATH-HOUSE)
      (UP TO YOKOSE-CORRIDOR-3)
      (FLAGS ONBIT RMUNGBIT)>

<OBJECT GYOKO
	(DESC "Gyoko")
	(SYNONYM GYOKO)
	(FLAGS PERSON FEMALE NOABIT NOTHEBIT JAPANESEBIT)>

<OBJECT KIKU
	(DESC "Kiku")
	(SYNONYM KIKU)
	(FLAGS PERSON FEMALE NOABIT NOTHEBIT JAPANESEBIT)>

<OBJECT LG-YOSHINAKA
	(LOC LOCAL-GLOBALS)
	(DESC "Yoshinaka")
	(SYNONYM YOSHINAKA)
	(FLAGS PERSON NOABIT NOTHEBIT JAPANESEBIT)
	(ACTION LG-YOSHINAKA-F)>

<ROUTINE LG-YOSHINAKA-F ("OPT" (RARG <>) "AUX" (L <LOC ,YOSHINAKA>))
	 <COND (<OR <P? (TELL-ABOUT ASK-ABOUT) * YOSHINAKA>
		    <VERB? FIND WHERE FOLLOW>>
		<REDIRECT ,LG-YOSHINAKA ,YOSHINAKA>
		<RTRUE>)
	       (<AND <NOT <FSET? .L ,RMUNGBIT>>
		     <NOT <FSET? ,HERE ,RMUNGBIT>>>
	        <TELL
"Yoshinaka is down the hall." CR>)
	       (<VERB? LISTEN>
		<TELL
"He seems to be in ">
		<TELL-WHOSE .L ,YOSHINAKA>
		<TELL " room." CR>)
	       (ELSE
		<TELL "You don't see Yoshinaka right now." CR>)>>

<OBJECT YOSHINAKA
	(DESC "Yoshinaka")
	(SYNONYM YOSHINAKA)
	(FLAGS PERSON NOABIT NOTHEBIT JAPANESEBIT)
	(ACTION YOSHINAKA-F)>

<ROUTINE YOSHINAKA-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<RARG? <>>
		<COND (<VERB? LISTEN>
		       <TELL
"You can hear him making his rounds." CR>)>)>>

<GLOBAL YOSHI-CHATS 0>

<GLOBAL YOSHI-WAITS? 0>
<GLOBAL YOSHI-GOAL <>>
<GLOBAL YOSHI-TABLE
	<LTABLE YOKOSE-SPA-1 YOKOSE-SPA-2 YOKOSE-SPA-3
		YOKOSE-SPA-4 YOKOSE-SPA-5 YOKOSE-SPA-6>>

;<ROUTINE DEBUG-YOSHI (L NL)
	 <TELL "[Yoshi: ">
	 <TELL-WHERE .L>
	 <TELL " -> ">
	 <TELL-WHERE .NL>
	 <TELL "]" CR>>
		
<ROUTINE I-YOSHINAKA ("AUX" (L <LOC ,YOSHINAKA>) NL (P <RANDOM 4>) N TMP)
	 <COND (<IN? ,YOSHINAKA ,YOKOSE-CORRIDOR-1>
		<COND (<AND <HERE? .L>
			    <L=? .P ,YOSHI-CHATS>>)
		      (<EQUAL? ,YOSHI-GOAL ,YOKOSE-SPA-1 ,YOKOSE-SPA-2>
		       <MOVE ,YOSHINAKA ,YOSHI-GOAL>)
		      (ELSE
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-2>)>)
	       (<IN? ,YOSHINAKA ,YOKOSE-CORRIDOR-2>
		<COND (<AND <HERE? .L>
			    <L=? .P ,YOSHI-CHATS>>)
		      (<EQUAL? ,YOSHI-GOAL ,YOKOSE-SPA-1 ,YOKOSE-SPA-2>
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-1>)
		      (<EQUAL? ,YOSHI-GOAL ,YOKOSE-SPA-3 ,YOKOSE-SPA-4>
		       <MOVE ,YOSHINAKA ,YOSHI-GOAL>)
		      (ELSE
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-3>)>)
	       (<IN? ,YOSHINAKA ,YOKOSE-CORRIDOR-3>
		<COND (<AND <HERE? .L>
			    <L=? .P ,YOSHI-CHATS>>)
		      (<EQUAL? ,YOSHI-GOAL ,YOKOSE-SPA-5 ,YOKOSE-SPA-6>
		       <MOVE ,YOSHINAKA ,YOSHI-GOAL>)
		      (ELSE
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-2>)>)
	       (<EQUAL? .L ,YOKOSE-SPA-1 ,YOKOSE-SPA-2>
		<COND (<OR <HERE? .L> <L=? .P ,YOSHI-CHATS>>
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-1>)>)
	       (<EQUAL? .L ,YOKOSE-SPA-3 ,YOKOSE-SPA-4>
		<COND (<AND <EQUAL? .L ,YOKOSE-SPA-3>
			    <HERE? ,YOKOSE-SPA-3>>
		       <TELL CR
"Yoshinaka seems reluctant to leave before you do.  He seems very
nervous.  Mariko says, \"Perhaps you should leave, Anjin-san.\"" CR>
		       <RTRUE>)
		      (<OR <HERE? .L> <L=? .P ,YOSHI-CHATS>>
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-2>)>)
	       (<EQUAL? .L ,YOKOSE-SPA-5>
		<COND (<OR <HERE? .L> <L=? .P ,YOSHI-CHATS>>
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-3>)>)
	       (<EQUAL? .L ,YOKOSE-SPA-6>
		<COND (<ZERO? ,YOSHI-WAITS?>
		       <REPEAT ((CNT 0))
			       <COND (<EQUAL? .CNT 5> <RETURN>)>
			       <SET N <+ .CNT <RANDOM <- 5 .CNT>>>>
			       <SET CNT <+ .CNT 1>>
			       <SET TMP <GET ,YOSHI-TABLE .CNT>>
			       <PUT ,YOSHI-TABLE .CNT <GET ,YOSHI-TABLE .N>>
			       <PUT ,YOSHI-TABLE .N .TMP>>
		       <PUT ,YOSHI-TABLE 6 ,YOKOSE-SPA-6>
		       <PUT ,YOSHI-TABLE 0 1>
		       <SETG YOSHI-GOAL <GET ,YOSHI-TABLE 1>>
		       <MOVE ,YOSHINAKA ,YOKOSE-CORRIDOR-3>)
		      (ELSE <SETG YOSHI-WAITS? <- ,YOSHI-WAITS? 1>>)>)>
	 <COND (<NOT <IN? ,YOSHINAKA .L>>
		<SETG YOSHI-CHATS 0>)
	       (ELSE
		<SETG YOSHI-CHATS <+ ,YOSHI-CHATS 1>>)>
	 <SET NL <LOC ,YOSHINAKA>>
	 <COND (<AND <NOT <EQUAL? .L .NL>>
		     <NOT <FSET? .L ,RMUNGBIT>> ;"was in corridor"
		     <FSET? .NL ,RMUNGBIT>> ;"entered a room"
		<COND (<NOT <EQUAL? .NL ,YOKOSE-SPA-6>>
		       <PUT ,YOSHI-TABLE
			    0
			    <+ <GET ,YOSHI-TABLE 0> 1>>
		       <SETG YOSHI-GOAL
			     <GET ,YOSHI-TABLE
				  <GET ,YOSHI-TABLE 0>>>)
		      (ELSE
		       <SETG YOSHI-WAITS? <+ 5 <RANDOM 5>>>)>)>
	 <COND (<HERE? ,YOKOSE-FIRST-FLOOR ,YOKOSE-BATH-HOUSE>
		<RFALSE>)
	       (<NOT <EQUAL? .L .NL>> ;"Yoshi moved"
		<COND (<FSET? .L ,RMUNGBIT> ;"was in someone's room"
		       <COND (<NOT <FSET? .NL ,RMUNGBIT>>
			      <COND (<FSET? ,HERE ,RMUNGBIT>
				     <COND (<YOKOSE-NEIGHBOR? ,HERE .L>
					    <TELL CR
"You can hear Yoshinaka leaving ">
					    <TELL-WHOSE .L ,YOSHINAKA>
					    <TELL " room." CR>)
					   (<HERE? .L>
					    <TELL CR
"Yoshinaka, very polite, bows and leaves the room." CR>)>)
				    (ELSE
				     <TELL CR
"You see Yoshinaka emerge from ">
				     <TELL-WHOSE .L ,YOSHINAKA>
				     <TELL " room." CR>)>)>)
		      (ELSE ;"was in corridor"
		       <COND (<HERE? ,YOKOSE-SPA-3>
			      <CRLF>
			      <JIGS-UP
"There is a moment of silence outside the door.  Then, with a burst, the shoji
is thrown aside!  Yoshinaka charges into the room, sword drawn.  Mariko screams,
knowing your fate is sealed.  Caught!  If only the two of you had been less
love-besotted, more careful!  But it was a love doomed from the start, as Mariko
always knew.">
			      <RFATAL>)
			     (<FSET? .NL ,RMUNGBIT> ;"entered a room"
			      <COND (<EQUAL? .NL ,YOKOSE-SPA-1>
				     <COND (<HERE? .NL>
					    <TELL CR
"Yoshinaka knocks politely on your door, and then enters the room.  \"So sorry,
Anjin-san.  Must check rooms, must make sure all safe, "I"neh?""\"" CR>)
					   (<HERE? ,YOKOSE-CORRIDOR-1
						   ,YOKOSE-CORRIDOR-2
						   ,YOKOSE-CORRIDOR-3>
					    <TELL CR
"Yoshinaka enters your room, checking to make sure all is as it should
be." CR>)
					   (<HERE? ,YOKOSE-SPA-3>
					    <TELL CR
"You can hear Yoshinaka entering your room." CR>)>)
				    (<FSET? ,HERE ,RMUNGBIT>
				     <COND (<HERE? .NL>
					    <TELL 'YOSHINAKA>
					    <COND (<HERE? ,YOKOSE-SPA-6>
						   <TELL
" comes into his room.">)
						  (ELSE
						   <TELL
" knocks on the door, and ">
						   <COND (<GETP .NL ,P?OWNER>
							  <TELL-WHO .NL>)
							 (ELSE
							  <TELL "the guest">)>
						   <TELL
" equally politely, bids him enter.">)>
					    <TELL 
"Yoshinaka is somewhat surprised to find you there as well." CR>)
					   (<YOKOSE-NEIGHBOR? ,HERE .NL>
					    <TELL CR
"You can hear Yoshinaka entering ">
					    <TELL-WHOSE .NL ,YOSHINAKA>
					    <TELL " room." CR>)>)
				    (<EQUAL? .NL ,YOKOSE-SPA-6>
				     <TELL CR
"Yoshinaka returns to his room, evidently finished with this round of
inspection." CR>)
				    (ELSE
				     <TELL CR
"You see Yoshinaka knock politely on ">
				     <TELL-WHOSE .NL ,YOSHINAKA>
				     <TELL " door
and then enter the room." CR>)>)
			     (<NOT <FSET? ,HERE ,RMUNGBIT>>
			      <TELL CR
"Yoshinaka walks ">
			      <COND (<OR <EQUAL? .L ,YOKOSE-CORRIDOR-1>
					 <AND <EQUAL? .L ,YOKOSE-CORRIDOR-2>
					      <EQUAL? .NL ,YOKOSE-CORRIDOR-3>>>
				     <TELL "north up">)
				    (ELSE
				     <TELL "south down">)>
			      <TELL " the corridor">
			      <COND (<HERE? .NL>
				     <TELL ", joining you">)>
			      <TELL "." CR>)>)>)
	       (ELSE ;"Yoshi didn't move"
		<COND (<FSET? .L ,RMUNGBIT>
		       <COND (<OR <NOT <FSET? ,HERE ,RMUNGBIT>>
				  <YOKOSE-NEIGHBOR? ,HERE .L>>
			      <COND (<EQUAL? .L ,YOKOSE-SPA-1>
				     <TELL CR
"Thanks to the thin shoji-screen walls, which are almost transparent to
sound, you can tell that Yoshinaka is still in your room." CR>)
				    (<EQUAL? .L ,YOKOSE-SPA-6>
				     <TELL CR
"Yoshinaka seems to still be in his room." CR>)
				    (ELSE
				     <TELL CR
"You can hear Yoshinaka">
				     <COND (<FSET? ,HERE ,RMUNGBIT>
					    <TELL ", in the next room,">)>
				     <TELL " talking to ">
				     <TELL-WHO .NL ,YOSHINAKA>
				     <TELL "." CR>)>)
			     (<HERE? .L>
			      <COND (<EQUAL? .L ,YOKOSE-SPA-6>
				     <TELL CR
"Between his rounds of inspection, Yoshinaka quietly meditates." CR>)
				    (ELSE
				     <TELL CR
"Yoshinaka, very apologetic but determined to do his duty, looks over the
room." CR>)>)>)
		      (<HERE? .L>
		       <COND (<NOT ,YOSHI-CHATS>
			      <TELL CR
"Yoshinaka bows and greets you in simple phrases so that you will
understand.  \"Good evening, Anjin-san.\"  He seems unsure why you are
up and about at this hour of the night." CR>)>)
		      (ELSE
		       <TELL CR
"Yoshinaka, down the corridor to the ">
		       <COND (<OR <HERE? ,YOKOSE-CORRIDOR-3>
				  <AND <HERE? ,YOKOSE-CORRIDOR-2>
				       <EQUAL? .L ,YOKOSE-CORRIDOR-1>>>
			      <TELL "south">)
			     (ELSE <TELL "north">)>
		       <TELL ", is making his rounds." CR>)>)>>

;<ROUTINE TELL-WHERE (RM)
	 <COND (<EQUAL? .RM ,YOKOSE-SPA-1> <TELL "Room 1">)
	       (<EQUAL? .RM ,YOKOSE-SPA-2> <TELL "Room 2">)
	       (<EQUAL? .RM ,YOKOSE-SPA-3> <TELL "Room 3">)
	       (<EQUAL? .RM ,YOKOSE-SPA-4> <TELL "Room 4">)
	       (<EQUAL? .RM ,YOKOSE-SPA-5> <TELL "Room 5">)
	       (<EQUAL? .RM ,YOKOSE-SPA-6> <TELL "Room 6">)
	       (<EQUAL? .RM ,YOKOSE-CORRIDOR-1> <TELL "Corridor 1">)
	       (<EQUAL? .RM ,YOKOSE-CORRIDOR-2> <TELL "Corridor 2">)
	       (<EQUAL? .RM ,YOKOSE-CORRIDOR-3> <TELL "Corridor 3">)
	       (ELSE <TELL "?">)>>

<ROUTINE TELL-WHO (OBJ "OPT" (WHO ,BLACKTHORNE)
		   "AUX" (O <GETP .OBJ ,P?OWNER>))
	 <COND (<NOT .O> <TELL "a guest">)
	       (<EQUAL? .O ,BLACKTHORNE> <TELL "you">)
	       (<EQUAL? .O .WHO> <TELL HIM/HER .O>)
	       (ELSE <TELL D .O>)>>

<ROUTINE TELL-WHOSE (OBJ "OPT" (WHO ,BLACKTHORNE)
		     "AUX" (O <GETP .OBJ ,P?OWNER>))
	 <COND (<NOT .O> <TELL "a guest's">)
	       (<EQUAL? .O ,BLACKTHORNE> <TELL "your">)
	       (<EQUAL? .O .WHO> <TELL HIS/HER .O>)
	       (ELSE <TELL D .O "'s">)>>

<ROUTINE YOKOSE-NEIGHBOR? (H L)
	 <COND (<EQUAL? .H ,YOKOSE-FIRST-FLOOR ,YOKOSE-BATH-HOUSE> <RFALSE>)
	       (<EQUAL? .H ,YOKOSE-SPA-1>
		<COND (<EQUAL? .L ,YOKOSE-SPA-3> <RTRUE>)>)
	       (<EQUAL? .H ,YOKOSE-SPA-2>
		<COND (<EQUAL? .L ,YOKOSE-SPA-4> <RTRUE>)>)
	       (<EQUAL? .H ,YOKOSE-SPA-3>
		<COND (<EQUAL? .L ,YOKOSE-SPA-1 ,YOKOSE-SPA-5> <RTRUE>)>)
	       (<EQUAL? .H ,YOKOSE-SPA-4>
		<COND (<EQUAL? .L ,YOKOSE-SPA-2 ,YOKOSE-SPA-6> <RTRUE>)>)
	       (<EQUAL? .H ,YOKOSE-SPA-5>
		<COND (<EQUAL? .L ,YOKOSE-SPA-3> <RTRUE>)>)
	       (<EQUAL? .H ,YOKOSE-SPA-6>
		<COND (<EQUAL? .L ,YOKOSE-SPA-4> <RTRUE>)>)>
	 <RFALSE>>

<END-SEGMENT>
