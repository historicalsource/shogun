"ERASMUS for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT ERASMUS>

;<CONSTANT CREW
	  <LTABLE HENDRIK VINCK MAETSUKKER GINSEL SPILLBERGEN VAN-NEKK
		  CROOCQ SONK ROPER PIETERZOON SALAMON>>

<OBJECT COMPASS
	(SCENE S-ERASMUS)
	(DESC "compass")
	(SYNONYM COMPASS)
	(ADJECTIVE MAGNETIC)
	(FLAGS TAKEBIT READBIT)
	(ACTION COMPASS-F)>

<ROUTINE COMPASS-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL
"The compass points north.  From it you can see that the course is ">
		<TELL-DIRECTION ,SHIP-DIRECTION>
		<TELL " and that the wind is out of the east, perhaps
a point or two south of east." CR>)>>

<OBJECT DECK
	(SCENE S-ERASMUS)
	(LOC LOCAL-GLOBALS)
	(DESC "deck")
	(SYNONYM DECK ABOVE WATCH POST POSTS)
	(FLAGS NDESCBIT TAKEBIT)
	(GENERIC GENERIC-DECK-F)
	(ACTION DECK-F)>

<ROUTINE DECK-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<NOUN-USED? ,PRSO ,W?WATCH>
		       <COND (<FSET? ,MAETSUKKER ,SCOREBIT>
			      <TELL
"The men on watch are tired." CR>)
			     (ELSE
			      <TELL
"The watch is as fresh as can be expected." CR>)>)>)
	       (<VERB? TAKE>
		<COND (<NOUN-USED? ,PRSO ,W?WATCH>
		       <TELL
"You are too tired to take the watch yourself." CR>)
		      (ELSE
		       <TELL "You can't take that." CR>)>)
	       (<VERB? RELEASE>
		<COND (<HERE? ,BELOW-DECKS>
		       <TELL
"You should probably send some of these men out to relieve the
watch." CR>)
		      (ELSE
		       <TELL
,YOU-HAVE-TO "send some fresh crewmen out to do that." CR>)>)
	       (<VERB? WALK-UNDER>
		<DO-WALK ,P?FORE>)
	       (<VERB? STEP-ON BOARD>
		<DO-WALK ,P?OUT>)>>

<OBJECT REEF
	(LOC LOCAL-GLOBALS)
	(OWNER REEF)
	(DESC "reef")
	(SYNONYM REEF REEFS REEF-TOPS ROCKS GAP BREAK)
	(FLAGS NDESCBIT SCOREBIT)
	(ACTION REEF-F)>

<ROUTINE REEF-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<SCENE? ,S-ANJIRO ,S-RODRIGUES>
		       <TELL
"The reefs are over the horizon, invisible." CR>)
		      (<NOT ,REEF-FLAG>
		       <TELL
"You've been avoiding reefs for days.  Right now the visibility is
terrible; only a few hundred yards.  You couldn't see a reef unless
you were almost on top of it.  A horrible thought!" CR>)
		      (<AND <EQUAL? ,SHIP-X 8> ;"10"
			    <EQUAL? ,SHIP-Y 2>>
		       <TELL
G"There's a break in the reef ahead and to starboard!" CR>)
		      (<AND <EQUAL? ,SHIP-X 6> ;"11"
			    <EQUAL? ,SHIP-Y 2>>
		       <TELL
"The gap in the reef is to port." CR>)
		      (<AND <EQUAL? ,SHIP-Y 1> ;"12"
			    <EQUAL? ,SHIP-X 5>>
		       <TELL
"The neck of the pass is right here, right to starboard, a maelstrom
of foaming sea and crashing combers." CR>)
		      (<AND <EQUAL? ,SHIP-Y 1>
			    <G? ,SHIP-X 0>
			    <L? ,SHIP-Y 5>>
		       <TELL
"The reef surrounds you on both sides, a terrifyingly narrow channel
hemmed in by rocks and smashed by waves." CR>)
		      (<EQUAL? ,REEF-X ,REEF-Y>
		       <TELL
"The reef is barely two hundred yards ">
		       <TELL-REEF-DIR>
		       <TELL ", great black claws of rocks
pounded by the hungry sea.  A foaming line of surf looms ">
		       <TELL-REEF-DIR>
		       <TELL ", broken intermittently ">
		       <COND (<EQUAL? ,SHIP-DIRECTION ,P?WEST ,P?NW>
			      <TELL "to port">)
			     (<EQUAL? ,SHIP-DIRECTION ,P?SW>
			      <TELL "to starboard">)
			     (ELSE
			      <TELL "by too-narrow channels">)>
		       <TELL "." CR>)
		      (ELSE
		       <TELL
"The reef is off to the west, veiled in storm but revealed by
breakers." CR>)>)
	       (<VERB? TURN-AROUND>
		<TELL ,YOU-HAVE-TO G"specify a direction." CR>)
	       (<VERB? TURN-TOWARD TURN-AWAY AVOID>
		<COND (,REEF-FLAG
		       <COND (<VERB? TURN-TOWARD>
			      <SETG P-DIRECTION ,P?STARBOARD>)
			     (ELSE
			      <SETG P-DIRECTION ,P?PORT>)>
		       <PERFORM ,V?TURN ,WHEEL ,INTDIR>
		       <RTRUE>)>)>>

<ROUTINE TELL-REEF-DIR ()
	 <COND (<EQUAL? ,SHIP-DIRECTION ,P?WEST>
		<TELL "ahead">)
	       (<EQUAL? ,SHIP-DIRECTION ,P?SW>
		<TELL "to starboard">)
	       (<EQUAL? ,SHIP-DIRECTION ,P?NW>
		<TELL "to port">)
	       (ELSE <TELL "away">)>>

<OBJECT FORESAILS
	(LOC LOCAL-GLOBALS)
	(DESC "foresails")
	(SYNONYM FORESAILS SAILS SAIL HALLIARD)
	(ADJECTIVE FORE)
	(FLAGS NDESCBIT SCOREBIT)
	(ACTION FORESAILS-F)>

<ROUTINE FORESAILS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,FORESAILS ,TRYTAKEBIT>
		       <TELL "The foremast has snapped.  You may be able
to survive without it for a while, though." CR>)
		      (ELSE
		       <TELL
"In this storm, only the barest storm sails are necessary, but you
can't get by with none.  The foresails ">
		       <COND (<FSET? ,PRSO ,RMUNGBIT>
			      <TELL "have been torn away!" CR>)
			     (ELSE
			      <TELL "are barely hanging together." CR>)>)>)
	       (<P? ASK-ABOUT * FORESAILS>
		<TELL
D ,PRSO " replies, \"Foresails only in a storm like this, by
God!  Anything more and we'd lose the mast!\"" CR>)
	       (<VERB? LOWER>
		<COND (<OR <FSET? ,FORESAILS ,RMUNGBIT>
			   <FSET? ,FORESAILS ,TRYTAKEBIT>>
		       <TELL "No need for that!" CR>)
		      (ELSE
		       <TELL
"Without foresails, there would be no control, and the ship would be
doomed.  You wisely reconsider." CR>)>)
	       (<VERB? RAISE REPAIR>
		<COND (<FSET? ,FORESAILS ,TRYTAKEBIT>
		       <TELL
"The mast itself has snapped, there's no way to repair the sails!" CR>)
		      (<NOT <FSET? ,FORESAILS ,RMUNGBIT>>
		       <COND (<FSET? ,FORESAILS ,SCOREBIT>
			      <TELL
"The foresails are still holding on, the maximum sail that the
ship can tolerate in this terrific gale." CR>)
			     (ELSE
			      <TELL
"The new foresails have already been raised." CR>)>)
		      (,CREW-ON-DECK?
		       <FCLEAR ,FORESAILS ,RMUNGBIT>
		       <TELL
"You yell to the crewmen, \"Fores'ls ho!\"  Foot by foot they haul
themselves into the shrouds of the foremast rigging, dragging new
sails aloft as others below
lean on the ropes to give them a hand.  They curse the sail out of
its ropes.  It falls open, cracking like a cannonade as the wind
fills it, and the ship lurches.  Now you have some control!" CR>
		       <SCORE-OBJECT ,FORESAILS>)
		      (<OR <IN? ,HENDRIK ,ON-DECK>
			   <IN? ,GINSEL ,ON-DECK>
			   <IN? ,VINCK ,ON-DECK>
			   <IN? ,MAETSUKKER ,ON-DECK>>
		       <QUEUE I-HANDS 2>
		       <TELL
"The crewmen on deck try to obey, but there are too few of them!  You
need more crew on deck!  They ring the bell.  \"All hands on deck!\"
someone screams." CR>)
		      (ELSE
		       <TELL
"There's no one here to carry out your order!" CR>)>)>>

<OBJECT LG-ERASMUS
	(LOC LOCAL-GLOBALS)
	(OWNER BLACKTHORNE)
	(DESC "Erasmus")
	(SYNONYM ERASMUS SHIP BOAT)
	(FLAGS NDESCBIT THE ;PERSON FEMALE VEHBIT SCOREBIT)
	(GENERIC GENERIC-SHIP-F)
	(ACTION LG-ERASMUS-F)>

<ROUTINE LG-ERASMUS-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<P? (TELL ASK-ABOUT) LG-ERASMUS>
		<TELL "You have been at sea too long!" CR>)
	       (<VERB? EXAMINE>
		<COND (<SCENE? ,S-ANJIRO>
		       <COND (<HERE? ,ANJIRO ,ANJIRO-WATERFRONT
				     ,ANJIRO-HARBOR ,AT-ERASMUS>
			      <TELL
"The " I "Erasmus"" is anchored neatly, fifty yards from shore, in good
water, with three bow cables.  You can see native men aboard." CR>
			      <COND (<NOT <FSET? ,RUTTER ,RMUNGBIT>>
				     <FSET ,RUTTER ,RMUNGBIT>
				     <TELL CR
"With a start you realize you don't know where your rutters are!  Can
they still be on the ship?  They are your most precious possessions,
and the stolen Portuguese one is a death sentence in any Catholic
country!" CR>)>
			      <RTRUE>)
			     (ELSE
			      <TELL
"You are surprised at how neat the ship is.  The tattered sails are down
and tied in place.  But the lashings are different from any you've ever
seen.  You presume the Japaners have made the vessel secure." CR>)>)
		      (<FSET? ,FORESAILS ,TRYTAKEBIT>
		       <TELL
"The ship is without a foremast!" CR>)
		      (<FSET? ,FORESAILS ,RMUNGBIT>
		       <TELL
"Right now, the "I"Erasmus"" is missing her foresails." CR>)
		      (ELSE
		       <TELL
"The " I "Erasmus"" is a pisscutter of a ship, lean and taut as a
greyhound.  If she can make it to port, God willing, all will be
well.  Otherwise, you're a dead man." CR>)>)
	       (<AND <VERB? DROP>
		     <EQUAL? ,P-PRSA-WORD ,W?ABANDON>
		     <SCENE? ,S-ERASMUS>>
		<TELL
G"That would be suicide in this storm." CR>)
	       (<VERB? WALK-TO>
		<COND (<AND <SCENE? ,S-ANJIRO ,S-RODRIGUES>
			    <NOT <IN? ,PLAYER ,SMALL-BOAT>>>
		       <TELL
,YOU-HAVE-TO "use a boat to do that." CR>)>)
	       (<VERB? LEAP DIVE>
		<COND (<HERE? ,ON-DECK ,BRIDGE-OF-ERASMUS>
		       <COND (<SCENE? ,S-ERASMUS>
			      <TELL
G"That would be suicide in this storm." CR>)
			     (ELSE
			      <TELL
"You hurry over the side and down the gangway!" CR CR>
			      <DO-WALK ,P?DOWN>)>)
		      (ELSE
		       <TELL
"You can hardly jump overboard from here!" CR>)>)
	       (<AND <VERB? DISEMBARK EXIT>
		     <SCENE? ,S-ANJIRO ,S-RODRIGUES>>
		<DO-WALK ,P?DOWN>)
	       (<VERB? POINT>
		<COND (<EQUAL? ,OMI-QUESTION 1 2>
		       <TELL
"\"That's no answer, heretic!\"" CR>)
		      (<IN? ,SEBASTIO ,HERE>
		       <TELL
"\"Your ship has been well cared for, pirate!\"" CR>)>)
	       (<VERB? BOARD CLIMB-ON THROUGH CLIMB-UP>
		<COND (<HERE? ,AT-ERASMUS>
		       <DO-WALK ,P?UP>)
		      (<HERE? ,ON-DECK ,BRIDGE-OF-ERASMUS
			      ,PASSAGEWAY ,PILOTS-CABIN ,MATES-CABIN
			      ,CAPTAINS-CABIN>
		       <TELL "You already are!" CR>)
		      (ELSE
		       <YOULL-HAVE-TO "get to it">)>)
	       (<VERB? TURN>
		<COND (<HERE? ,BRIDGE-OF-ERASMUS>
		       <PERFORM ,V?TURN ,WHEEL ,PRSI>
		       <RTRUE>)
		      (<SCENE? ,S-ERASMUS>
		       <ARENT-WHERE-PRSO-IS>
		       <FRUSTRATED <COND (<FSET? ,HENDRIK ,DEAD> ,VINCK)
					 (ELSE ,HENDRIK)>>)>)
	       (<VERB? REPAIR>
		<MORE-SPECIFIC>)
	       (<HOSTILE-VERB?>
		<TELL "What an infantile idea." CR>)>>

<ROUTINE ARENT-WHERE-PRSO-IS ()
	 <TELL
"You aren't on the bridge, where " THE ,PRSO " is.">>

<OBJECT GANGWAY
	(LOC LOCAL-GLOBALS)
	(DESC "gangway")
	(SYNONYM GANGWAY)
	(FLAGS NDESCBIT)
	(ACTION GANGWAY-F)>

<ROUTINE GANGWAY-F ()
	 <COND (<VERB? CLIMB-UP>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)
	       (<VERB? CLIMB-FOO CLIMB-ON>
		<COND (<HERE? ,AT-ERASMUS ,WHARF>
		       <DO-WALK ,P?UP>)
		      (<HERE? ,ON-DECK ,MAIN-DECK>
		       <DO-WALK ,P?DOWN>)>)>>

<GLOBAL STORM-DELAY? <>>

<GLOBAL SHIP-DIRECTION <>>
<GLOBAL SHIP-X 21>
<GLOBAL SHIP-Y 9>

<GLOBAL SHIP-COURSE <>>

;<GLOBAL SHIP-DEBUG <>>	;"T to print out ship position stuff"

;<ROUTINE SHIP-INFO ()
	 <TELL
"[Course ">
	 <TELL-DIRECTION ,SHIP-DIRECTION>
	 <TELL "; wheel ">
	 <TELL-DIRECTION ,SHIP-COURSE>
	 <TELL "; X=" N ,SHIP-X ",Y=" N ,SHIP-Y "; Reef X=" N ,REEF-X ",Y=" N ,REEF-Y "]" CR>>

<ROUTINE QUEUE-STORM ("AUX" S DONE?)
	 <SET S <GETPT <GET ,SCENE-LOCS ,SCENE> ,P?SCORE>>
	 <SET S <GETB .S 0>>
	 <SET DONE? <DONE-BELOW?>>
	 <COND (<L? ,STORM-DELAY? 0>
		<SETG STORM-DELAY? <+ ,STORM-DELAY? 1>>
		<QUEUE I-STORM 30>)
	       (<AND ,STORM-DELAY? ;"delay storm if loser increased score"
		     <FSET? ,BELL ,SCOREBIT> ;"unless we're in height of storm"
		     <G? .S ,STORM-DELAY?>
		     <NOT .DONE?>>
		<SETG STORM-DELAY? .S>
		<QUEUE I-STORM 10>
		<RFALSE>)
	       (<OR <FSET? ,HERE ,OUTSIDE> ;"storm fast if outside"
		    .DONE? ;"or hanging around below decks too long">
		<SETG STORM-DELAY? .S>
		<QUEUE I-STORM
		       <COND (<OR ,REEF-FLAG <EQUAL? .S 7>> 4)
			     (<AND <FSET? ,HERE ,OUTSIDE> .DONE?> 3)
			     (ELSE 9)>>)
	       (<AND <EQUAL? ,SHIP-COURSE ,P?PORT ,P?STARBOARD> ;"or if stupid"
		     <NOT <FSET? ,WHEEL ,RMUNGBIT>>
		     <NOT <FSET? ,HENDRIK ,TRYTAKEBIT>>>
		<QUEUE I-STORM 2>)
	       (ELSE ;"storm slow if inside"
		<SETG STORM-DELAY? .S>
		<QUEUE I-STORM
		       <COND (,REEF-FLAG 7) (ELSE 15)>>)>>

<GLOBAL WHEEL-SPINNING? <>>

<ROUTINE I-STORM ()
	 <COND (<NOT <QUEUE-STORM>> ;"returns false if storm-delay in effect"
		<RFALSE>)>
	 <COND (<EQUAL? ,SHIP-COURSE ,P?FORE>)
	       (<EQUAL? ,SHIP-COURSE ,P?PORT>
		<COND (<EQUAL? ,SHIP-DIRECTION ,P?WEST>
		       <SETG SHIP-DIRECTION ,P?SW>)
		      (<EQUAL? ,SHIP-DIRECTION ,P?SW>
		       <SETG SHIP-DIRECTION ,P?SOUTH>)
		      (<EQUAL? ,SHIP-DIRECTION ,P?NW>
		       <SETG SHIP-DIRECTION ,P?WEST>)
		      (<EQUAL? ,SHIP-DIRECTION ,P?NORTH>
		       <SETG SHIP-DIRECTION ,P?NW>)>)
	       (<EQUAL? ,SHIP-COURSE ,P?STARBOARD>
		<COND (<EQUAL? ,SHIP-DIRECTION ,P?WEST>
		       <SETG SHIP-DIRECTION ,P?NW>)
		      (<EQUAL? ,SHIP-DIRECTION ,P?SW>
		       <SETG SHIP-DIRECTION ,P?WEST>)
		      (<EQUAL? ,SHIP-DIRECTION ,P?NW>
		       <SETG SHIP-DIRECTION ,P?NORTH>)
		      (<EQUAL? ,SHIP-DIRECTION ,P?SOUTH>
		       <SETG SHIP-DIRECTION ,P?SW>)>)>
	 <COND (<EQUAL? ,SHIP-DIRECTION ,P?WEST>
		<COND (<OR <FSET? ,FORESAILS ,RMUNGBIT>
			   <AND <EQUAL? ,SHIP-Y 1>
				<L=? ,SHIP-X 7>>>
		       <SETG SHIP-X <- ,SHIP-X 1>>)
		      (ELSE
		       <SETG SHIP-X <- ,SHIP-X 2>>)>)
	       (<EQUAL? ,SHIP-DIRECTION ,P?SW>
		<SETG SHIP-X <- ,SHIP-X 1>>
		<SETG SHIP-Y <- ,SHIP-Y 1>>)
	       (<EQUAL? ,SHIP-DIRECTION ,P?NW>
		<SETG SHIP-X <- ,SHIP-X 1>>
		<SETG SHIP-Y <+ ,SHIP-Y 1>>)
	       (<EQUAL? ,SHIP-DIRECTION ,P?NORTH ,P?SOUTH>
		<SHIP-BROADSIDE>)>
	 <COND (<NOT <REEF-DISTANCE>>
		<COND (<G? ,SHIP-X 6>
		       <TELL CR
"The waiting spines of the reef tear into the ship!">
		       <COND (<FSET? ,HERE ,OUTSIDE>
			      <TELL "The gap is tantalizingly
close, but you missed it.">)>
		       <TELL "Two years out from England, and it ends here in
a watery grave." CR>
		       <JIGS-UP>)
		      (<EQUAL? ,SHIP-X 6>
		       <TELL CR
"The ship smashes into the ">
		       <COND (<FSET? ,HERE ,OUTSIDE>
			      <TELL "side of the gap in the ">)>
		       <TELL "reef, tearing a huge
rent in the hull.  Water pours in, and the stern crashes against the rocks">
		       <COND (<FSET? ,HERE ,OUTSIDE>
			      <TELL
", throwing you to the deck.  Suddenly the mainmast gives way.  It's crashing
down upon you">)>
		       <TELL "!" CR>
		       <JIGS-UP>)
		      (ELSE
		       <CRLF>
		       <COND (<FSET? ,HERE ,OUTSIDE>
			      <TELL "You steer">)
			     (ELSE
			      <TELL "The ship steers">)>
		       <TELL
" directly into the waiting rocks!" CR>
		       <JIGS-UP>)>
		<RFATAL>)>
	 <COND (<AND <L? ,SHIP-X 19>
		     <NOT <GETP ,BLACKTHORNE ,P?HEALTH>>>
		<QUEUE I-TIRED-WARNING 5 T>
		<QUEUE I-TIRED 10 T>)>
	 ;<COND (,SHIP-DEBUG <SHIP-INFO>)>
	 <COND (,REEF-FLAG)
	       (<REEF-SIGHTED?>
		<SETG REEF-FLAG T>
		<CRLF>
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <COND (<IN? ,GINSEL ,BELOW-DECKS>
			      <TELL "The bow lookout">)
			     (ELSE
			      <TELL "Ginsel, the bow lookout,">)>
		       <TELL " yells \"Rotz vooruit!\"  Reef
ahead!  A foaming line of surf stretches ahead of you,
broken intermittently to port!" CR>
		       <COND (<AND <HERE? ,BRIDGE-OF-ERASMUS>
				   <FSET? ,HENDRIK ,RMUNGBIT>>
			      <FCLEAR ,HENDRIK ,RMUNGBIT>
			      <TELL CR
"The yelling wakes Hendrik." CR>)>)
		      (ELSE
		       <FCLEAR ,HENDRIK ,RMUNGBIT>
		       <TELL
"Faintly, over the roar of the storm, you hear the terrified
cry \"Rotz vooruit!\"  Reef ahead!  ">
		       <COND (<HERE? ,BELOW-DECKS>
			      <TELL
"The crewmen pull themselves painfully from their bunks.  \"We're
dead men!\" screams one.">
			      <COND (<IN? ,VINCK ,HERE>
				     <MOVE ,VINCK ,ON-DECK>
				     <TELL
"\"We'd better go above, Pilot,\" urges Vinck as he shuffles toward
the door." CR>)
				    (ELSE <CRLF>)>)
			     (<HERE? ,CAPTAINS-CABIN>
			      <TELL
"\"Get out there, Pilot!\" Spillbergen orders you.  \"We'll all die
thanks to you!  Out!\"" CR>)
			     (ELSE
			      <TELL
"You sense from the terror in the voice that the reefs are close.">
			      <COND (<IN? ,GINSEL ,BELOW-DECKS>
				     <TELL
"Has the watch been asleep?  All too likely!">)>
			      <CRLF>)>)>
		<RTRUE>)>
	 <COND (<AND <EQUAL? ,SHIP-Y 9>
		     <EQUAL? ,SHIP-X 19>>
		<QUEUE I-HENDRIK -1>
		<FCLEAR ,WHEEL ,ONBIT>
		<TELL CR
"The ship heels in a sudden squall, throwing you ">
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <COND (<HERE? ,BRIDGE-OF-ERASMUS>
			      <TELL
"from your post at the wheel." CR>)
			     (ELSE
			      <TELL "to the deck." CR>)>)
		      (ELSE
		       <COND (<HERE? ,BRIDGE-OF-ERASMUS>
			      <TELL
"from your post at the wheel, which">)
			     (ELSE
			      <TELL "to the deck.  The wheel">)>
		       <SETG SHIP-COURSE ,P?PORT>
		       <SETG SHIP-DIRECTION ,P?SW>
		       <QUEUE I-BROADSIDE 4>
		       <QUEUE I-SHIP-BROADSIDE 8>
		       <TELL
", uncontrolled, begins to turn to port." CR>)>
		<RTRUE>)
	       (<OR <EQUAL? ,SHIP-X 18>
		    <AND <EQUAL? ,SHIP-Y 9>
			 <EQUAL? ,SHIP-X 17>>>
		<TELL CR
"The wind freshens even more, and the ship lurches." CR>
		<RTRUE>)
	       (<AND <EQUAL? ,SHIP-Y 8>
		     <EQUAL? ,SHIP-X 14>>
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <TELL CR
"A forepeak halliard snaps, and the highest top gallant spar is carried
away into the sea, ">
		       <COND (<EQUAL? ,SHIP-DIRECTION ,P?SW>
			      <TELL
"but the ship is now making way parallel to the reef." CR>)
			     (ELSE
			      <TELL
"and the ship continues to approach the waiting reef." CR>)>)>)
	       (<AND <EQUAL? ,SHIP-Y 7>
		     <EQUAL? ,SHIP-X 13>>
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <CRLF>
		       <COND (<EQUAL? ,SHIP-DIRECTION ,P?SW>
			      <TELL
"The ship runs parallel to the reef, barely staying away from it, and a huge following wave towers over the ship!" CR>)
			     (ELSE
			      <TELL
"The ship is being carried still closer to the reef, and a huge wave is
approaching from the starboard side!" CR>)>)>)
	       (<AND <EQUAL? ,SHIP-Y 6>
		     <EQUAL? ,SHIP-X 12>>
		<COND (<NOT <EQUAL? ,SHIP-DIRECTION ,P?SW>>
		       <FSET ,LG-ERASMUS ,RMUNGBIT>)>
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <TELL CR
"Another halliard gives, block and tackle swinging wildly.  The wave breaks
over the ship!  ">
		       <COND (<EQUAL? ,SHIP-DIRECTION ,P?SW>
			      <TELL "It looks for a moment like you're
going to founder, but she shakes it off." CR>)
			     (ELSE
			      <TELL
"The force of the wave drives the ship onto the reef, the sharp
rocks tearing into the wooden hull!  In what seems like an instant, she's
sinking!" CR>)>
		       <RTRUE>)>)
	       (<AND <EQUAL? ,SHIP-Y 5>
		     <EQUAL? ,SHIP-X 11>>
		<FSET ,FORESAILS ,RMUNGBIT>
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <CRLF>
		       <COND (<EQUAL? ,SHIP-DIRECTION ,P?SW>
			      <TELL
"Another following sea towers above the ship.  The ship is wallowing,
and the foresails are torn away by the tempest." CR>
			      <RTRUE>)
			     (ELSE
			      <JIGS-UP
"You struggle to stay afloat in the raging sea, but you are too weak to
fight the waves for long, and are dashed against the rocks.">
			      <RFATAL>)>)>)
		 (<AND <EQUAL? ,SHIP-Y 4>
		       <EQUAL? ,SHIP-X 10>>
		  <FSET ,HENDRIK ,DEAD>
		  <MOVE ,HENDRIK ,GENERIC-OBJECTS>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"This wave comes in stronger than the last.  Hendrik is caught and lifted,
gasping and struggling, into the sea." CR>
			 <TELL CR
"A giant comber throws Hendrik high above the ship, then takes him
away and pulps him against a rock spine." CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 2>
		       <EQUAL? ,SHIP-X 8>>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
G"There's a break in the reef ahead and to starboard!" CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 2>
		       <EQUAL? ,SHIP-X 6>>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"The gulch through the reef is three points to windward, and you aren't gaining
way!  You search desperately for another channel but know there is
none.  The "I"Erasmus"" is heading for the rocks starboard of the gap!" CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 1>
		       <EQUAL? ,SHIP-X 7>>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"The ship is being swept past the gap in the reef!" CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 1>
		       <EQUAL? ,SHIP-X 5>>
		  <COND (<HERE? ,BRIDGE-OF-ERASMUS ,ON-DECK>
			 <MOVE ,VINCK ,HERE>)
			(ELSE <MOVE ,VINCK ,BRIDGE-OF-ERASMUS>)>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"The ship is gaining way, helped by the fall off from the wind.  You are
holding course parallel to the reef and approaching a narrow gap which
heads to starboard." CR CR
"You see Vinck making his way up the companionway to the bridge." CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 1>
		       <EQUAL? ,SHIP-X 4>
		       <EQUAL? ,SHIP-DIRECTION ,P?WEST>>
		  <TELL CR
"There is a wailing, tormented shudder as the keel scrapes the razor
spines of the reef below!">
		  <COND (<NOT <FSET? ,WHEEL ,RMUNGBIT>>
			 <SETG WHEEL-SPINNING? T>
			 <DEQUEUE I-BROADSIDE>
			 <COND (<FSET? ,WHEEL ,ONBIT>
				<FCLEAR ,WHEEL ,ONBIT>
				<COND (<FSET? ,HERE ,OUTSIDE>
				       <TELL
"The"G" wheel spins out of your hands!" CR>)>)
			       (ELSE
				<TELL
"The wheel begins spinning wildly!" CR>)>)>)
		 (<AND <EQUAL? ,SHIP-Y 1>
		       <EQUAL? ,SHIP-X 3>
		       <EQUAL? ,SHIP-DIRECTION ,P?WEST>>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"The ship is sucked into a narrow vortex between the rocks.  ">
			 <COND (<AND <NOT <FSET? ,WHEEL ,ONBIT>>
				     <NOT <FSET? ,WHEEL ,RMUNGBIT>>>
				<TELL
"The wheel spins from side to side, out of control!  ">)>
			 <FSET ,FORESAILS ,TRYTAKEBIT> ;"can't be repaired"
			 <TELL "The bowsprit
catches a rock and is torn loose!  The foremast snaps!  The men on deck
fall on the rigging with axes and cut it adrift as the ship founders
down the channel." CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 1>
		       <EQUAL? ,SHIP-X 2>
		       <EQUAL? ,SHIP-DIRECTION ,P?WEST>>
		  <COND (<AND <NOT <FSET? ,WHEEL ,ONBIT>>
			      <NOT <FSET? ,WHEEL ,RMUNGBIT>>>
			 <CRLF>
			 <JIGS-UP
"Out of control, the ship spins broadside, and holes against the rocks.">
			 <RFATAL>)
			(<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"The ship is pulled by the waves deeper into the strait, and then
pushed back by the return, but she's making some progress." CR>)>)
		 (<AND <EQUAL? ,SHIP-Y 1>
		       <EQUAL? ,SHIP-X 1>
		       <EQUAL? ,SHIP-DIRECTION ,P?WEST>>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"For an instant, the strait broadens.  Ahead, it narrows ominously and
turns to port." CR>)>)
		 (<AND <ZERO? ,SHIP-Y>
		       <ZERO? ,SHIP-X>
		       <EQUAL? ,SHIP-DIRECTION ,P?SW>>
		  <DEQUEUE I-STORM>
		  <COND (<FSET? ,HERE ,OUTSIDE>
			 <TELL CR
"The sea race quickens.  The ship is in the neck and dead, but then the
keel scrapes a mud shoal, and the shock turns her head.  The rudder bites
into the sea, the wind and sea join to help, and before the wind she
speeds through the pass to safety.  Into the bay beyond." CR>
			 <COND (<IN? ,COMPASS ,BLACKTHORNE>
				<REMOVE ,COMPASS>)>
			 <COND (<IN? ,QUILL ,BLACKTHORNE>
				<REMOVE ,QUILL>)>
			 <REMOVE ,APPLE>
			 <SCORE-OBJECT ,REEF>
			 <CRLF>
			 <NEXT-SCENE>)>)>>

<GLOBAL REEF-FLAG <>>

"returns T the first time the reef is sighted"

<ROUTINE REEF-SIGHTED? ()
	 <COND (,REEF-FLAG <RFALSE>)
	       (<OR <L=? ,REEF-X 2>
		    <L=? ,REEF-Y 2>>
		<RTRUE>)
	       (ELSE <RFALSE>)>>

<GLOBAL REEF-X <>>	;"x distance from ship to reef"
<GLOBAL REEF-Y <>>	;"y distance from ship to reef"

<ROUTINE REEF-DISTANCE ()
	 <SETG REEF-X 0>
	 <SETG REEF-Y 0>
	 <COND (<EQUAL? ,SHIP-X 0>
		<COND (<ZERO? ,SHIP-Y>
		       <SETG REEF-X 1000>
		       <SETG REEF-Y 1000>)
		      (ELSE <RFALSE>)>)
	       (<AND <EQUAL? ,SHIP-Y 0>
		     <G? ,SHIP-X 0>
		     <L? ,SHIP-X 7>>
		<RFALSE>)
	       (<AND <EQUAL? ,SHIP-Y 1>
		     <EQUAL? ,SHIP-X 6>>
		<RFALSE>)
	       (<AND <EQUAL? ,SHIP-Y 0 1>
		     <EQUAL? ,SHIP-X 7>>
		<SETG REEF-X 1>
		<SETG REEF-Y <- 3 ,SHIP-Y>>)
	       (<AND <EQUAL? ,SHIP-Y 1>
		     <L=? ,SHIP-X 5>>
		<SETG REEF-X ,SHIP-X>
		<SETG REEF-Y 1>)
	       (<L=? ,SHIP-Y 1>
		<COND (<L? ,SHIP-X 7>
		       <RFALSE>)
		      (ELSE
		       <SETG REEF-X <- ,SHIP-X 6>>
		       <SETG REEF-Y <+ <- ,SHIP-Y> <- ,SHIP-X 4>>>)>)
	       (<G=? ,SHIP-Y 11>
		<SETG REEF-X <- ,SHIP-X 15>>
		<COND (<G? ,SHIP-X 15> <SETG REEF-Y 1000>)
		      (ELSE <SETG REEF-Y 0>)>)
	       (<AND <EQUAL? ,SHIP-Y 2>
		     <EQUAL? ,SHIP-X 6 7>>
		<SETG REEF-X <- ,SHIP-X 5>>
		<SETG REEF-Y 1>)
	       (<G=? ,SHIP-Y 2>
		<SETG REEF-X <- <- ,SHIP-X 6> <- ,SHIP-Y 2>>>
		<SETG REEF-Y <- <- ,SHIP-X 4> ,SHIP-Y>>)>
	 <COND (<OR <L=? ,REEF-X 0> <L=? ,REEF-Y 0>>
		<SETG REEF-X 0>
		<SETG REEF-Y 0>
		<RFALSE>)
	       (ELSE <RTRUE>)>>



<OBJECT CREWMEN
	(LOC BELOW-DECKS)
	(DESC "crewmen")
	(SYNONYM CREW CREWMEN CREWMAN MEN MAN SAILOR SAILORS)
	(FLAGS PERSON DUTCHBIT NOABIT THE PLURAL DONT-ALL)
	(DESCFCN CREWMEN-DESC)
	(GENERIC GENERIC-CREWMEN-F)
	(ACTION LG-CREWMEN-F)>

<ROUTINE CREWMEN-DESC ("OPT" RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<HERE? ,BELOW-DECKS ,VILLAGE-SQUARE>
		       <RTRUE>)>)
	       (<RARG? OBJDESC>
		<COND (<HERE? ,BELOW-DECKS>
		       <COND (,CREW-ON-DECK?
			      <TELL
"A few of the worst-off crewmen are still here.">)
			     (,REEF-FLAG
			      <TELL
"Most of the surviving crewmen are preparing to go on deck.">)
			     (ELSE
			      <TELL
"Most of the survivors of the crew are here in bunks
and hammocks, some sleeping, some awake.">)>)
		      (<HERE? ,VILLAGE-SQUARE>
		       <TELL
"The rabble of the ship's crew kneel behind you, guards watching them.">)>)>>

<OBJECT LG-CREWMEN
	(LOC LOCAL-GLOBALS)
	(DESC "crewmen")
	(SYNONYM CREW CREWMEN CREWMAN MAN MEN)
	(FLAGS PERSON DUTCHBIT JAPANESEBIT NOABIT THE PLURAL)
	(GENERIC GENERIC-CREWMEN-F)
	(ACTION LG-CREWMEN-F)>

<GLOBAL CREW-ON-DECK? <>>

<ROUTINE LG-CREWMEN-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<SCENE? S-ERASMUS S-YABU> ;"dutch crew"
		<COND (<RARG? WINNER>
		       <COND (<OR <HERE? PILOTS-CABIN CAPTAINS-CABIN
					 PASSAGEWAY>
				  <AND <HERE? ,BELOW-DECKS>
				       ,CREW-ON-DECK?>>
			      <TELL "There are no crewmen here." CR>)
			     (<P? WHO YOU>
			      <SETG WINNER ,PLAYER>
			      <PERFORM ,V?WHO ,CREWMEN>
			      <END-QUOTE>
			      <RFATAL>)
			     (<HERE? ,BELOW-DECKS ,MATES-CABIN>
			      <TELL
G"The crewmen whine and groan and pretend you are referring to someone
else.  You'll have to order specific crewmen to get any results." CR>)
			     (<P? (RAISE REPAIR LOWER REPLACE) FORESAILS>
			      <RFALSE>)
			     (<AND <IN? ,VINCK ,HERE>
				   <P? HELP>
				   <P? TAKE WHEEL>>
			      <SETG WINNER ,VINCK>
			      <PERFORM ,PRSA ,PRSO ,PRSI>
			      <RTRUE>)
			     (<AND <HERE? BELOW-DECKS>
				   <SEND-HIM-OUT?>>
			      <TELL
"The crewmen mutter among themselves, but no one moves." CR>)
			     (ELSE
			      <CURSES-IN "Dutch">)>)
		      (<VERB? EXAMINE WHO>
		       <LIST-PEOPLE ,CREWMAN? "crewman" "crewmen">
		       <COND (<HERE? ,BELOW-DECKS>
			      <COND (<IN? ,VINCK ,BELOW-DECKS>
				     <COND (<IN? ,GINSEL ,BELOW-DECKS>
					    <COND (<IN? ,MAETSUKKER
							,BELOW-DECKS>
						   <TELL
"Vinck, Ginsel, and Maetsukker are">)
						  (ELSE
						   <TELL
"Vinck and Ginsel are">)>)
					   (<IN? ,MAETSUKKER ,BELOW-DECKS>
					    <TELL
"Vinck and Maetsukker are">)
					   (ELSE
					    <TELL
"Vinck is">)>)
				    (<IN? ,GINSEL ,BELOW-DECKS>
				     <COND (<IN? ,MAETSUKKER ,BELOW-DECKS>
					    <TELL
"Ginsel and Maetsukker are">)
					   (ELSE
					    <TELL
"Ginsel is">)>)
				    (<IN? ,MAETSUKKER ,BELOW-DECKS>
				     <TELL
"Maetsukker is">)
				    (ELSE <CRLF> <RTRUE>)>
			      <TELL
" in the best condition, although everyone is badly off.">)
			     (<HERE? ,BRIDGE-OF-ERASMUS>
			      <TELL "">
			      <LIST-PEOPLE ,CREWMAN? "crewman" "crewmen"
					   ,ON-DECK "elsewhere on deck">)
			     (<HERE? ,ON-DECK>
			      <TELL "">
			      <LIST-PEOPLE ,CREWMAN?
					   "crewman" "crewmen"
					   ,BRIDGE-OF-ERASMUS
					   "on the bridge">)>
		       <CRLF>)
		      (<AND <VERB? TELL>
			    ,CREW-ON-DECK?
			    <HERE? ,BRIDGE-OF-ERASMUS ,ON-DECK>>
		       <RFALSE>)
		      (<NOT <CREW-HERE?>>
		       <TELL
G"There aren't any crewmen here." CR>
		       <COND (<VERB? TELL>
			      <END-QUOTE>
			      <RFATAL>)
			     (ELSE <RTRUE>)>)
		      (<AND <HERE? ,BELOW-DECKS>
			    <VERB? SEND>>
		       <TELL
G"The crewmen whine and groan and pretend you are referring to someone
else.  You'll have to order specific crewmen to get any results." CR>)
		      (<AND <VERB? WAKE> <HERE? ,BELOW-DECKS>>
		       <TELL
"You cuff a few of the sleepers into wakefulness, but most are too far
gone to do more than curse feebly." CR>)>)
	       (<SCENE? S-PIT>
		<COND (<VERB? EXAMINE>
		       <TELL
"They look scared." CR>)>)
	       (<SCENE? S-RODRIGUES>
		<TELL "There are no longer any crewmen aboard." CR>)
	       (<SCENE? S-VOYAGE> ;"japanese crew of galley"
		<COND (<RARG? WINNER>
		       <COND (<P? (DROP THROW PUT LOWER) ANCHOR>
			      <RFALSE>)
			     (ELSE
			      <CURSES-IN "Japanese">)>)>)
	       (<SCENE? S-MARIKO>
 		<COND (<NOT <ABSTRACT-VERB?>>
		       <TELL CTHE ,LG-CREWMEN " aren't here." CR>
		       <COND (<VERB? TELL> <END-QUOTE> <RFATAL>)
			     (ELSE <RTRUE>)>)>)>>

<ROUTINE CURSES-IN (L)
	 <TELL
"The only responses are muttered curses in " .L "." CR>>

<ROUTINE CREW-HERE? ()
	 <REPEAT ((F <FIRST? ,HERE>))
		 <COND (<NOT .F>
			<RFALSE>)
		       (<AND <NOT <EQUAL? .F ,CREWMEN>>
			     <FSET? .F ,DUTCHBIT>>
			<RTRUE>)>
		 <SET F <NEXT? .F>>>>

<OBJECT HENDRIK
	(DESC "Hendrik Specz")
	(SYNONYM HENDRIK SPECZ MATE)
	(ADJECTIVE HENDRIK THIRD)
	(FLAGS PERSON DUTCHBIT NOABIT NOTHEBIT)
	(DESCFCN HENDRIK-DESC)
	(ACTION HENDRIK-F)>

<ROUTINE HENDRIK-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<FSET? ,HENDRIK ,RMUNGBIT> <RTRUE>)
		      (<FSET? ,HENDRIK ,TRYTAKEBIT> <RTRUE>)
		      (ELSE <RFALSE>)>)
	       (<RARG? OBJDESC>
		<TELL "Hendrik Specz ">
		<COND (<FSET? ,HENDRIK ,RMUNGBIT>
		       <TELL "is asleep at">)
		      (ELSE
		       <TELL "has">)>
		<TELL " the wheel.">)>>

<ROUTINE HENDRIK-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<VERB? FOLLOW WALK WALK-TO WALK-UNDER>
		       <COND (<FSET? ,WHEEL ,ONBIT>
			      <TELL
"\"Pilot, it's my watch.  Let me take the wheel.  You must rest.\"" CR>)
			     (ELSE
			      <TELL
"\"One of us must stay and hold the God-cursed wheel, or we all die!\"" CR>)>)
		      (<OR <P? TAKE-OVER (<> WHEEL DECK)>
			   <P? (TAKE TURN) (WHEEL DECK)>>
		       <FSET ,HENDRIK ,TRYTAKEBIT> ;"hendrik has the wheel"
		       <HENDRIK-TAKES-WHEEL>
		       <TELL
"\"Aye, Pilot, I take the wheel.\"" CR>)
		      (<P? (RAISE REPAIR LOWER) FORESAILS>
		       <RFALSE>)
		      (<PRSO? ,WHEEL>
		       <TELL
"\"If you want the wheel, take it,\" snarls Hendrik." CR>)
		      (<OR <P? SHUT-UP ROOMS>
			   <AND <P? BE INTADJ>
				<ADJ? ,W?QUIET>>>
		       <TELL
"\"We'll all be quiet soon enough!\"" CR>)
		      (<VERB? TELL-ME-ABOUT>
		       <COND (<PRSO? ,JAPAN>
			      <TELL
"\"You're the one who said it's here.  Between latitudes thirty and
forty north, you said.  Well, I don't see it.\"" CR>)
			     (<PRSO? ,SPILLBERGEN>
			      <TELL
"\"He's a maggot-eaten fool and we'll all be dead because of him.\"" CR>)
			     (ELSE
			      <TELL
"He doesn't answer." CR>)>)
		      (<I-DONT-KNOW?>
		       <TELL
"\"You don't know?  You're the God-cursed Pilot, you'd better know!\"" CR>)
		      (ELSE
		       <TELL
"Hendrik's reply is a mixture of whining and curses." CR>)>)
	       (<VERB? TELL>
		<COND (<FSET? ,HENDRIK ,RMUNGBIT>
		       <TELL
"Hendrik is asleep." CR>
		       <END-QUOTE>)>)
	       (<P? EXAMINE>
		<TELL
"Hendrik, like all the crew members, is suffering from scurvy.  His face
is gray, his eyes are sunken, and his skin is blotched and sallow.  He
is dying." CR>)
	       (<VERB? GIVE>
		<COND (<FSET? ,HENDRIK ,RMUNGBIT>
		       <YOULL-HAVE-TO "wake him">)
		      (<PRSO? WHEEL>
		       <SETG WINNER ,HENDRIK>
		       <PERFORM ,V?TAKE ,WHEEL>
		       <SETG WINNER ,PLAYER>
		       <RTRUE>)>)
	       (<VERB? SOOTHE>
		<TELL
"He remains skeptical, muttering quietly to himself." CR>)
	       (<OR <HOSTILE-VERB?>
		    <AND <VERB? WAKE>
			 <FSET? ,PRSO ,RMUNGBIT>>>
		<COND (<FSET? ,PRSO ,RMUNGBIT>
		       <FCLEAR ,PRSO ,RMUNGBIT>
		       <TELL "You awaken Hendrik.  ">
		       <COND (,REEF-FLAG
			      <TELL
"\"We're lost,\" he screams.  \"Oh, Lord Jesus help us!\"" CR>)
			     (ELSE
			      <TELL
"\"I wasn't asleep,\" he says, sheepishly." CR>)>)
		      (ELSE
		       <TELL
"You realize it's only your fatigue making you want to hurt him, and
refrain." CR>)>)>>

<ROUTINE I-HENDRIK ()
	 <ZLINES ,HENDRIK-CNT
		 (<MOVE ,HENDRIK ,HERE>
		  <TELL CR
"Hendrik Specz, the third mate, appears on deck, pulling himself
painfully up the gangway.  ">
		  <THIS-IS-IT ,HENDRIK>
		  <COND (<HERE? ,BRIDGE-OF-ERASMUS>
			 <TELL
"He joins you on the bridge.  \"Go below, Pilot.  I take this watch if
it pleases you.\"  Gray with fatigue, he leans heavily against the
binnacle and retches.  \"Blessed Lord Jesus help me!\"" CR>)
			(ELSE
			 <TELL
"\"God curse you, Pilot!  Have you gone mad at last!  No one is at the
wheel!  We'll head onto the reef, God rot your bones!\"" CR>)>)
		 (<COND (<HERE? ,BRIDGE-OF-ERASMUS>
			 <MOVE ,HENDRIK ,HERE>
			 <SETG QCONTEXT ,HENDRIK>
			 <TELL CR
"\"Where's the landfall you promised us?  Where's the Japans?  Where is it,
I ask?\"" CR>)
			(<HERE? ,ON-DECK>
			 <COND (<AND <NOT <FSET? ,WHEEL ,RMUNGBIT>>
				     <NOT <FSET? ,WHEEL ,ONBIT>>
				     <NOT <FSET? ,HENDRIK ,TRYTAKEBIT>>>
				<TELL CR
"\"You'll drown us all, you crazy Englishman!\" Hendrik screams">
				<COND (<NOT <IN? ,HENDRIK ,BRIDGE-OF-ERASMUS>>
				       <MOVE ,HENDRIK ,BRIDGE-OF-ERASMUS>
				       <TELL
" as he rushes to the bridge." CR>)
				      (ELSE <TELL "." CR>)>)
			       (ELSE
				<TELL CR
G"Hendrik is muttering to himself.  Only a few curses are audible." CR>)>)>)
		 (<SETG QCONTEXT <>>
		  <COND (<HERE? ,BRIDGE-OF-ERASMUS>
			 <MOVE ,HENDRIK ,HERE>
			 <TELL CR
"\"Perhaps there is no Japans,\" Hendrik mutters scornfully.  \"It's just a "
I "Gottbewonden" " legend.\"" CR>)
			(<HERE? ,ON-DECK>
			 <TELL CR
G"Hendrik is muttering to himself.  Only a few curses are audible." CR>)>)
		 (<DEQUEUE I-HENDRIK>
		  <MOVE ,HENDRIK ,BRIDGE-OF-ERASMUS>
		  <COND (<AND <NOT <FSET? ,WHEEL ,RMUNGBIT>>
			      <NOT <FSET? ,WHEEL ,ONBIT>>
			      <NOT <FSET? ,HENDRIK ,TRYTAKEBIT>>>
			 <HENDRIK-SAVES-THE-DAY>)>
		  <COND (<AND <FSET? ,HERE ,OUTSIDE>
			      <NOT <HERE? ,ON-DECK>>>
			 <QUEUE I-TIRED-WARNING 4 T>
			 <QUEUE I-TIRED 8 T>)>
		  <TELL CR
"You are tired, deathly tired, and near starving.">
		  <COND (<OR <IN? ,VINCK ,BELOW-DECKS>
			     <IN? ,GINSEL ,BELOW-DECKS>
			     <IN? ,MAETSUKKER ,BELOW-DECKS>>
			 <COND (<AND <IN? ,VINCK ,BELOW-DECKS>
				     <IN? ,GINSEL ,BELOW-DECKS>
				     <IN? ,MAETSUKKER ,BELOW-DECKS>>
				<TELL
"With a start, you realize it's time to ">
				<COND (<FSET? ,HERE ,OUTSIDE>
				       <TELL "go below and ">)>
				<TELL "send out replacements for the
men on watch, by now freezing and windburned.">)
			       (ELSE
				<TELL "You know more men are needed
on watch.">)>)>
		  <COND (<ZERO? <GETP ,BLACKTHORNE ,P?HEALTH>>
			 <TELL
"It's past time to eat some of your meager cache of food; a few shrivelled
apples.">)>
		  <COND (<FSET? ,FLAGON ,SCOREBIT>
			 <TELL
"Time, too, for the unpleasant task of visiting Captain Spillbergen,
still in nominal command but deathly sick, confined to his cabin.">)>
		  <COND (<FSET? ,RUTTER ,SCOREBIT>
			 <TELL "It's also time to write
in your rutter, though God knows there is nothing new since yesterday;
nothing, that is, but death.">)>
		  <CRLF>)>>

<ROUTINE HENDRIK-TAKES-WHEEL ()
	 <FSET ,HENDRIK ,TRYTAKEBIT>
	 <SETG SHIP-COURSE ,P?FORE>
	 <SETG SHIP-DIRECTION P?WEST>
	 <DEQUEUE I-BROADSIDE>
	 <DEQUEUE I-SHIP-BROADSIDE>>

<ROUTINE HENDRIK-SAVES-THE-DAY ()
	 <FCLEAR ,WHEEL ,SCOREBIT>
	 <HENDRIK-TAKES-WHEEL>
	 <COND (<HERE? ,ON-DECK ,BRIDGE-OF-ERASMUS>
		<TELL CR
"Hendrik grabs the wheel, muttering vile curses on you and your kin." CR>)>>

<OBJECT MAETSUKKER
	(LOC BELOW-DECKS)
	(DESC "Maetsukker")
	(SYNONYM MAETSUKKER)
	(FLAGS NDESCBIT PERSON DUTCHBIT NOABIT NOTHEBIT SCOREBIT)
	(ACTION MAETSUKKER-F)>

<ROUTINE MAETSUKKER-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? (RAISE REPAIR LOWER) FORESAILS>
		       <RFALSE>)
		      (<SEND-HIM-OUT?>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SEND ,MAETSUKKER ,ROOMS>
		       <RTRUE>)
		      (ELSE
		       <TELL
"Maetsukker makes an almost inaudible remark about your mother." CR>)>)
	       (<VERB? EXAMINE>
		<TELL
"Maetsukker is a small, sharp-featured man.  He is in better shape than
most of the crew members." CR>)
	       (<AND <P? SEND MAETSUKKER>
		     <SCENE? ,S-ERASMUS>>
		<COND (<NOT <HERE? ,BELOW-DECKS>>
		       <TELL
"\"I'm already on watch, Pilot!\" he snarls." CR>)
		      (<NOT <FSET? ,MAETSUKKER ,RMUNGBIT>>
		       <FSET ,MAETSUKKER ,RMUNGBIT>
		       <TELL
"\"I'm near death,\" the small, sharp-featured man says, and cringes
away from you.  \"I'm sick.  Look, the scurvy's taken all my
teeth.  Take someone else!\"  Other members of the crew take up the
refrain.  They are all sick, all scurvied, all tired unto death." CR>)
		      (ELSE
		       <TELL
"\"I'm a merchant, not a seaman!  I'm not part of the crew!  Take someone
else!\"  Other crewmen nod in agreement.  None of them want to go on deck
if they can avoid it." CR>)>)
	       (<OR <VERB? TAKE>
		    <HOSTILE-VERB?>>
		<COND (<NOT <HERE? ,BELOW-DECKS>>
		       <TELL
"The two of you begin fighting, but before you can do any damage, the
other crewmen pull you apart." CR>)
		      (<FSET? ,MAETSUKKER ,RMUNGBIT>
		       <MOVE ,MAETSUKKER ,ON-DECK>
		       <TELL
"Maetsukker screams as you ">
		       <COND (<VERB? KICK>
			      <TELL "kick him like a dog and then ">)
			     (<VERB? HIT SWING>
			      <TELL "punch him in the stomach and then ">)
			     (<VERB? BITE>
			      <TELL "growl, baring your teeth, and then ">)>
		       <TELL "jerk him to his feet.  Blood flecks his
mouth as he pulls the door open and flees in agony.  The other crewmen
grumble, but seem to accept this assertion of your authority." CR>
		       <COND (<AND <IN? ,GINSEL ,ON-DECK>
				   <IN? ,VINCK ,ON-DECK>>
			      <RESTART-STORM?>
			      <SCORE-OBJECT ,MAETSUKKER>)>
		       <RTRUE>)
		      (ELSE
		       <TELL
"You have no reason to attack Maetsukker." CR>)>)>>

<OBJECT GINSEL
	(LOC BELOW-DECKS)
	(DESC "Ginsel")
	(SYNONYM GINSEL)
	(FLAGS NDESCBIT PERSON DUTCHBIT NOABIT NOTHEBIT)
	(ACTION GINSEL-F)>

<ROUTINE GINSEL-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? (RAISE REPAIR LOWER) FORESAILS>
		       <RFALSE>)
		      (<SEND-HIM-OUT?>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SEND ,GINSEL ,ROOMS>
		       <RTRUE>)
		      (<HOSTILE-VERB?>
		       <TELL "He looks at you as though you are crazy." CR>)
		      (ELSE
		       <TELL "Ginsel nods weakly." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"Ginsel is a tall, good-looking youth with short arms and very bowed
legs.  He has lost all his teeth to scurvy and looks very weak." CR>)
		      (<P? SEND GINSEL>
		       <MOVE ,GINSEL ,ON-DECK>
		       <TELL
"\"Ginsel, you're bow lookout,\" you say quietly.|
\"Yes, sir.\"  Ginsel pulls himself upright and stumbles out." CR>
		       <COND (<AND <IN? ,MAETSUKKER ,ON-DECK>
				   <IN? ,VINCK ,ON-DECK>>
			      <RESTART-STORM?>
			      <SCORE-OBJECT ,MAETSUKKER>)>
		       <RTRUE>)>)>>

<ROOM BRIDGE-OF-ERASMUS
      (LOC ROOMS)
      (SCENE S-ERASMUS)
      (OWNER LG-ERASMUS)
      (DESC "Bridge")
      (SYNONYM BRIDGE)
      (PICTURE P-STORM)
      (SCORE 11)
      (FDESC
"The gale tears at you, biting deep within, and you know that if you
don't make landfall soon you'll all be dead.  You are John Blackthorne,
Pilot-Major of a dead fleet: one ship left out of five, eight and twenty
men out of one hundred and seven, and only ten of those can walk.  Little
food, almost no water, and that brackish and foul.")
      (DOWN TO ON-DECK)
      (FORE TO ON-DECK)
      (PORT SORRY "You would fall overboard.")
      (STARBOARD SORRY "You would fall overboard.")
      (AFT SORRY "You would fall overboard.")
      (ACTION BRIDGE-OF-ERASMUS-F)
      (GLOBAL LG-ERASMUS REEF FORESAILS LG-CREWMEN LG-SEA DECK)
      (FLAGS ONBIT OUTSIDE)>

<ROUTINE BRIDGE-OF-ERASMUS-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE T>
		<MOVE ,COMPASS ,BLACKTHORNE>
		<PUTP ,BLACKTHORNE ,P?HEALTH 0>
		<SETG SHIP-COURSE ,P?FORE>
		<SETG SHIP-DIRECTION ,P?WEST>
		<QUEUE I-BROADSIDE 4>
		<QUEUE I-SHIP-BROADSIDE 8>
		<SETG STORM-DELAY? -2> ;"give 2*25 moves before storm serious"
		<QUEUE I-STORM -1>)
	       (<RARG? LOOK>
		<TELL
"This is the bridge of the " I "Erasmus"", a Dutch merchant and
privateer.  The ">
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <TELL "securely lashed">)
		      (ELSE
		       <TELL "unlashed">)>
		<TELL
" wheel is directly forward of you, a sea chair is lashed to the
deck aft of the wheel, and the ship's bell is hanging here.">
		<COND (<QUEUED? I-STORM>
		       <TELL
"Spray blows past in an angry torrent.">)>
		<CRLF>)
	       (<RARG? ENTER>
		<COND (<AND <SCENE? ,S-ERASMUS>
			    <NOT <FSET? ,HENDRIK ,RMUNGBIT>>
			    <FSET? ,BELL ,SCOREBIT>
			    <OR <FSET? ,PASSAGEWAY ,TOUCHBIT>
				<FSET? ,BELOW-DECKS ,TOUCHBIT>>>
		       <FSET ,HENDRIK ,RMUNGBIT> ;"asleep"
		       <FSET ,WHEEL ,RMUNGBIT> ;"lash wheel"
		       <TELL
"As you climb onto the bridge, you see that Hendrik has fallen asleep
at his post.  At least the wheel is lashed in place." CR CR>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<P? LISTEN <>>
		       <PERFORM ,V?LISTEN ,WIND>
		       <RTRUE>)
		      (<AND <P? WALK (P?DOWN P?FORE)>
			    <NOT <FSET? ,WHEEL ,RMUNGBIT>>
			    <NOT <FSET? ,WHEEL ,ONBIT>>
			    <OR <NOT <IN? ,HENDRIK ,BRIDGE-OF-ERASMUS>>
				<NOT <FSET? ,HENDRIK ,TRYTAKEBIT>>>>
		       <COND (<AND <IN? ,HENDRIK ,BRIDGE-OF-ERASMUS>
				   <NOT <FSET? ,HENDRIK ,TRYTAKEBIT>>>
			      <TELL
"Hendrik grabs for the wheel as you leave.  \"Curse you, Pilot!  Someone
has to hold the course!\"">)
			     (ELSE
			      <TELL
"As you climb down to the deck, you see the wheel spinning
uncontrolled.">)>
		       <CRLF>
		       <CRLF>
		       <RFALSE>)
		      (<P? TURN INTDIR>
		       <PERFORM ,V?TURN ,WHEEL ,INTDIR>
		       <RTRUE>)
		      (<P? TAKE-OVER <>>
		       <PERFORM ,V?TAKE-OVER ,WHEEL>
		       <RTRUE>)
		      (<AND <VERB? SHRUG>
			    <IN? ,HENDRIK ,HERE>>
		       <TELL
"Hendrik's reaction is unprintable." CR>)
		      (<P? LOOK-UP ROOMS>
		       <PERFORM ,V?EXAMINE ,FORESAILS>
		       <RTRUE>)>)>>

<ROUTINE DONE-BELOW? ()
	 <COND (<AND <NOT <FSET? ,ROPER ,SCOREBIT>>
		     <NOT <FSET? ,APPLE ,SCOREBIT>>
		     <NOT <FSET? ,KEY ,SCOREBIT>>
		     <NOT <FSET? ,RUTTER ,SCOREBIT>>
		     <NOT <FSET? ,CAPTAINS-DESK ,SCOREBIT>>
		     <NOT <FSET? ,FLAGON ,SCOREBIT>>
		     <NOT <FSET? ,MAETSUKKER ,SCOREBIT>>>
		<RTRUE>)>>

<ROUTINE RESTART-STORM? ()
	 <COND (<DONE-BELOW?>
		<SETG STORM-DELAY? 0>
		<QUEUE I-STORM 2>
		<RTRUE>)>>

<OBJECT BELL
	(LOC BRIDGE-OF-ERASMUS)
	(DESC "bell")
	(SYNONYM BELL)
	(FLAGS NDESCBIT SCOREBIT)
	(ACTION BELL-F)>

<ROUTINE BELL-F ()
	 <COND (<VERB? RING>
		<TELL "You ring the bell.  \"All hands on deck!\" you yell.">
		<COND (<SCENE? ,S-ERASMUS>
		       <QUEUE I-HANDS 2>
		       <COND (<AND <IN? ,HENDRIK ,BRIDGE-OF-ERASMUS>
				   <FSET? ,HENDRIK ,RMUNGBIT>>
			      <FCLEAR ,HENDRIK ,RMUNGBIT>
			      <TELL "The noise wakes Hendrik.  \"We're
lost,\" he screams.  \"Oh, Lord Jesus help us!\"">)>
		       <CRLF>
		       <COND (<AND ,REEF-FLAG
				   <FSET? ,BELL ,SCOREBIT>>
			      <SCORE-OBJECT ,BELL>)>)
		      (ELSE <CRLF>)>
		<RTRUE>)>>

<ROUTINE MOVE-CREW (RM "OPT" (NDESC? <>))
	 <COND (<NOT .RM>
		<REMOVE ,CREWMEN>
		<REMOVE ,HENDRIK>
		<REMOVE ,VINCK>
		<REMOVE ,MAETSUKKER>
		<REMOVE ,GINSEL>
		<REMOVE ,SPILLBERGEN>
		<REMOVE ,VAN-NEKK>
		<REMOVE ,CROOCQ>
		<REMOVE ,SONK>
		<REMOVE ,ROPER>
		<REMOVE ,PIETERZOON>
		<REMOVE ,SALAMON>)
	       (ELSE
		<SETG CREW-ON-DECK? T>
		<COND (<EQUAL? .RM ,VILLAGE-SQUARE ,PIT>
		       <MOVE ,PIETERZOON .RM>
		       <COND (.NDESC? <FSET ,PIETERZOON ,NDESCBIT>)
			     (ELSE <FCLEAR ,PIETERZOON ,NDESCBIT>)>
		       <MOVE ,ROPER .RM>
		       <COND (.NDESC? <FSET ,ROPER ,NDESCBIT>)
			     (ELSE <FCLEAR ,ROPER ,NDESCBIT>)>
		       <MOVE ,SONK .RM>
		       <COND (.NDESC? <FSET ,SONK ,NDESCBIT>)
			     (ELSE <FCLEAR ,SONK ,NDESCBIT>)>
		       <MOVE ,SALAMON .RM>
		       <COND (.NDESC? <FSET ,SALAMON ,NDESCBIT>)
			     (ELSE <FCLEAR ,SALAMON ,NDESCBIT>)>)>
		<MOVE ,VINCK .RM>
		<COND (.NDESC? <FSET ,VINCK ,NDESCBIT>)
		      (ELSE <FCLEAR ,VINCK ,NDESCBIT>)>
		<MOVE ,CROOCQ .RM>
		<COND (.NDESC? <FSET ,CROOCQ ,NDESCBIT>)
		      (ELSE <FCLEAR ,CROOCQ ,NDESCBIT>)>
		<MOVE ,GINSEL .RM>
		<COND (.NDESC? <FSET ,GINSEL ,NDESCBIT>)
		      (ELSE <FCLEAR ,GINSEL ,NDESCBIT>)>
		<MOVE ,MAETSUKKER .RM>
		<COND (.NDESC? <FSET ,MAETSUKKER ,NDESCBIT>)
		      (ELSE <FCLEAR ,MAETSUKKER ,NDESCBIT>)>
		<MOVE ,VAN-NEKK .RM>
		<COND (.NDESC? <FSET ,VAN-NEKK ,NDESCBIT>)
		      (ELSE <FCLEAR ,VAN-NEKK ,NDESCBIT>)>
		<COND (<EQUAL? .RM ,VILLAGE-SQUARE ,PIT>
		       <MOVE ,SPILLBERGEN .RM>)>
		<MOVE ,CREWMEN .RM>)>>

<ROUTINE I-HANDS ()
	 <COND (<NOT ,CREW-ON-DECK?>
		<TELL CR
"The noise of the bell and your yelling have aroused the crew and
they pull themselves out onto the deck.">
		<COND (,REEF-FLAG
		       <MOVE-CREW ,ON-DECK>
		       <TELL "They are terrified when they
see the encroaching reef, most are panicked and don't know what
to do next, but a few with their last reserves of strength
try ineffectually to get the ship under control." CR>)
		      (ELSE
		<TELL "They sullenly look around, see that there is
no danger, and muttering curses, return below, oblivious to your
entreaties." CR>)>)>>

<OBJECT SEA-CHAIR
	(LOC BRIDGE-OF-ERASMUS)
	(DESC "sea chair")
	(SYNONYM CHAIR)
	(ADJECTIVE SEA)
	(FLAGS NDESCBIT FURNITURE OPENBIT CONTBIT VEHBIT SEARCHBIT)
	(ACTION SEA-CHAIR-F)>

<ROUTINE SEA-CHAIR-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<VERB? WALK>
		       <YOULL-HAVE-TO "get out of the sea chair">)
		      (<VERB? STAND>
		       <B-STAND>
		       <MOVE ,WINNER ,HERE>
		       <TELL
"You rise to your feet." CR>)>)
	       (ELSE
		<COND (<VERB? BOARD SIT>
		       <COND (<NOT <IN? ,WINNER ,SEA-CHAIR>>
			      <MOVE ,WINNER ,SEA-CHAIR>
			      <B-SIT>
			      <TELL
"You are now sitting in the sea chair." CR>)>)>)>>

<OBJECT FOCSLE-DOOR
	(LOC LOCAL-GLOBALS)
	(OWNER CREWMEN)
	(DESC "focsle door")
	(SYNONYM DOOR)
	(ADJECTIVE CREW FOCSLE FORECASTLE)
	(FLAGS DOORBIT LOCKABLE)
	(ACTION FOCSLE-DOOR-F)>

<ROUTINE FOCSLE-DOOR-F ()
	 <COND (<AND <NOT <PASSIVE-VERB?>>
		     <SCENE? ,S-ANJIRO>>
		<PERFORM ,V?RUB ,RIBBON>
		<RTRUE>)>>

<ROOM BELOW-DECKS
      (LOC ROOMS)
      (SCENE S-ERASMUS)
      (DESC "Below Decks")
      (SYNONYM QUARTERS FORECASTLE FOCSLE DECKS)
      (ADJECTIVE CREW ;BELOW)
      (PICTURE P-BELOW-DECKS)
      (UP TO ON-DECK IF FOCSLE-DOOR IS OPEN)
      (AFT TO ON-DECK IF FOCSLE-DOOR IS OPEN)
      (OUT TO ON-DECK IF FOCSLE-DOOR IS OPEN)
      (ACTION BELOW-DECKS-F)
      (FLAGS ONBIT)
      (GLOBAL DECK LG-ERASMUS FOCSLE-DOOR LG-CREWMEN LG-BUNK)
      (THINGS <> RAT RAT-PSEUDO
	      <> COCKROACH COCKROACH-PSEUDO)>

<ROUTINE BELOW-DECKS-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"The crew's quarters of the "I"Erasmus"".  A companionway leads up to the
deck.  It's dim, warm and close here, and the stench is abominable." CR>)
	       (<RARG? ENTER>
		<COND (<AND <SCENE? S-ERASMUS>
			    <EQUAL? ,OHERE ,ON-DECK>
			    <NOT ,CREW-ON-DECK?>>
		       <SETG TIRED-TIME <DEQUEUE I-TIRED>>
		       <FCLEAR ,FOCSLE-DOOR ,OPENBIT>
		       <THIS-IS-IT ,CREWMEN>
		       <COND (,REEF-FLAG
			      <TELL
"As you enter, you see the men resignedly preparing to go on deck." CR CR>)
			     (ELSE
			      <TELL
"As you enter, a volley of feeble curses greets you.  You close the door
and they subside.  No one moves." CR CR>)>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<VERB? SMELL>
		       <TELL
"The stench here is terrible.  Rotten food, rotten flesh, offal, and
worse." CR>)
		      (<AND <P? TAKE * LG-BUNK>
			    <FSET? ,PRSO ,PERSON>>
		       <PERFORM ,V?MOVE ,PRSO>
		       <RTRUE>)
		      (<P? YELL-AT (<> CREWMEN)>
		       <TELL
"They just yell right back at you." CR>)
		      (<P? (ATTACK HIT) CREWMEN>
		       <TELL
"They back off, intimidated." CR>)>)>>

<BEGIN-SEGMENT ANJIRO>
<BEGIN-SEGMENT RODRIGUES>

<ROOM ON-DECK
      (SCENE S-ERASMUS)
      (LOC ROOMS)
      (DESC "Deck")
      (SYNONYM DECK)
      (UP TO BRIDGE-OF-ERASMUS)
      (DOWN SORRY "The gangways are fore and aft.  Down is ambiguous.")
      (PORT SORRY "You would fall overboard.")
      (STARBOARD SORRY "You would fall overboard.")
      (AFT TO PASSAGEWAY IF PASSAGE-DOOR IS OPEN)
      (FORE TO BELOW-DECKS IF FOCSLE-DOOR IS OPEN)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL LG-ERASMUS FOCSLE-DOOR PASSAGE-DOOR REEF LG-CREWMEN FORESAILS
       DECK GANGWAY LG-SEA LG-SMALL-BOAT)
      (ACTION ON-DECK-F)>

<ROUTINE ON-DECK-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is the main deck of the "I"Erasmus"".  A companionway leads up to the
bridge, and another one forward leads below decks to the
crew quarters.  A stairway aft leads to the officers' cabins." CR>)
	       (<RARG? BEG>
		<COND (<SCENE? ,S-ANJIRO ,S-RODRIGUES>
		       <COND (<P? LISTEN <>>
			      <PERFORM ,V?LISTEN ,WIND>
			      <RTRUE>)
			     (<P? WALK (P?UP P?FORE P?AFT)>
			      <COND (<IN? ,RODRIGUES ,PASSAGEWAY>
				     <RFALSE>)
				    (ELSE
				     <PERFORM ,V?RUB ,RIBBON>
				     <RTRUE>)>)
			     (<P? WALK (P?DOWN ,P?PORT ,P?WEST)>
			      <COND (<FSET? ,SAMURAI-GUARDS ,RMUNGBIT>
				     <TELL
"You climb down the gangway into the ">
				     <COND (<IN? ,SMALL-BOAT ,AT-ERASMUS>
					    <MOVE ,WINNER ,SMALL-BOAT>
					    <TELL D ,SMALL-BOAT>)
					   (ELSE
					    <TELL "water">)>
				     <TELL "." CR CR>
				     <GOTO ,AT-ERASMUS>)
				    (<EQUAL? ,RIBBON-CNT 3>
				     <TELL
"You start down the gangway, and stop.  You feel your cold sweat and see
the samurai staring at you malevolently." CR>)
				    (ELSE
				     <TELL
"You start to climb down the gangway, but you can't force yourself
to leave without trying to regain your rutters." CR>)>)
			     (<P? BOW <>>
			      <PERFORM ,V?BOW ,SAMURAI-GUARDS>
			      <RTRUE>)>)
		      (<SCENE? ,S-ERASMUS>
		       <COND (<P? LOOK-UP ROOMS>
			      <PERFORM ,V?EXAMINE ,FORESAILS>
			      <RTRUE>)>)>)
	       (<RARG? ENTER>
		<COND (<SCENE? S-ERASMUS>
		       <COND (<AND ,TIRED-TIME
				   <EQUAL? ,OHERE ,BELOW-DECKS ,PASSAGEWAY>>
			      <QUEUE I-TIRED ,TIRED-TIME>)>
		       <COND (<OR <EQUAL? <SCORE-HAVE> 7> ;"almost done"
				  <AND <EQUAL? ,OHERE ,PASSAGEWAY>
				       <FSET? ,APPLE ,SCOREBIT>>
				  <AND <EQUAL? ,OHERE ,BELOW-DECKS>
				       <FSET? ,MAETSUKKER ,SCOREBIT>>>
			      <SETG STORM-DELAY? <>>
			      <QUEUE-STORM>)>)
		      (<SCENE? ,S-ANJIRO>
		       <COND (<EQUAL? ,OHERE ,AT-ERASMUS>
			      <QUEUE I-RIBBON 3>)>)
		      (<SCENE? ,S-RODRIGUES>
		       <COND (<AND <EQUAL? ,OHERE ,AT-ERASMUS>
				   <IN? ,RODRIGUES ,HERE>>
			      <TELL
"As you climb aboard, ">
			      <SEALED-PASSAGE>
			      <CRLF>)>)>
		<RTRUE>)>>

<END-SEGMENT ;"ERASMUS+ANJIRO+RODRIGUES">

<BEGIN-SEGMENT ERASMUS>

<OBJECT ERASMUS-ANCHOR
	(LOC ON-DECK)
	(OWNER LG-ERASMUS)
	(DESC "anchor")
	(SYNONYM ANCHOR)
	(SIZE 200)
	(FLAGS TAKEBIT AN)
	(DESCFCN ERASMUS-ANCHOR-DESC)
	(ACTION ERASMUS-ANCHOR-F)>

<ROUTINE ERASMUS-ANCHOR-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<SCENE? ,S-ERASMUS> <RTRUE>)
		      (ELSE <RFALSE>)>)
	       (<RARG? OBJDESC>
		<TELL
"The anchor hangs over the side, ready to be dropped if ever, by the
grace of God and your good piloting, the "I"Erasmus"" reaches port.">)>>

<ROUTINE ERASMUS-ANCHOR-F ()
	 <COND (<VERB? RAISE>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<VERB? DROP THROW PUT LOWER>
		<TELL
G"That would be suicide in this storm." CR>)>>

<BEGIN-SEGMENT RODRIGUES>

<ROOM PASSAGEWAY
      (LOC ROOMS)
      (DESC "Passageway")
      (SYNONYM PASSAGEWAY)
      (LDESC
"The Captain's cabin is aft of here.  Your cabin is to port, and the Mates'
cabin to starboard.  The main deck is forward of here.")
      (AFT TO CAPTAINS-CABIN IF CAPTAINS-CABIN-DOOR IS OPEN)
      (STARBOARD TO MATES-CABIN IF MATES-CABIN-DOOR IS OPEN)
      (PORT TO PILOTS-CABIN IF PILOTS-CABIN-DOOR IS OPEN)
      (FORE TO ON-DECK IF PASSAGE-DOOR IS OPEN)
      (OUT TO ON-DECK IF PASSAGE-DOOR IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL DECK LG-ERASMUS LG-CREWMEN PASSAGE-DOOR
              PILOTS-CABIN CAPTAINS-CABIN MATES-CABIN
	      PILOTS-CABIN-DOOR CAPTAINS-CABIN-DOOR MATES-CABIN-DOOR)
      (ACTION PASSAGEWAY-F)
      (THINGS <> RAT RAT-PSEUDO
	      <> COCKROACH COCKROACH-PSEUDO)>

<ROUTINE PASSAGEWAY-F (RARG)
	 <COND (<RARG? ENTER>
		<COND (<SCENE? ,S-ERASMUS>
		       <SETG TIRED-TIME <DEQUEUE I-TIRED>>
		       <QUEUE I-BELOW-DECKS -1 T>
		       <COND (<IN? ,ROPER ,PASSAGEWAY>
			      <MOVE ,ROPER ,MATES-CABIN>
			      <MOVE ,APPLE ,ROPER>
			      <TELL
"As you enter the relative quiet of the aft passageway, you notice
Jan Roper heading across the passage from your cabin to the Mates'
cabin." CR CR>)>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<P? (OPEN CLOSE)>
		       <COND (<PRSO? PILOTS-CABIN>
			      <PERFORM ,PRSA ,PILOTS-CABIN-DOOR>
			      <RTRUE>)
			     (<PRSO? MATES-CABIN>
			      <PERFORM ,PRSA ,MATES-CABIN-DOOR>
			      <RTRUE>)
			     (<PRSO? CAPTAINS-CABIN>
			      <PERFORM ,PRSA ,CAPTAINS-CABIN-DOOR>
			      <RTRUE>)>)>)>>

<END-SEGMENT ;"ERASMUS+RODRIGUES">
<BEGIN-SEGMENT ERASMUS>

<ROUTINE I-BELOW-DECKS ()
	 <COND (<FSET? ,HERE ,OUTSIDE>
		<DEQUEUE I-BELOW-DECKS>
		<RFALSE>)
	       (<PROB 25>
		<TELL CR <PICK-ONE ,BELOW-DECKS-BACKGROUND> CR>)>>

<GLOBAL BELOW-DECKS-BACKGROUND
	<LTABLE 0
		"A rat scurries in the shadows cast by a hanging oil lamp."
		"Timbers creak pleasantly."
		"Cockroaches swarm on the floor.">>

<ROOM CAPTAINS-CABIN
      (LOC ROOMS)
      (DESC "Captain's Cabin")
      (OWNER SPILLBERGEN)
      (SYNONYM CABIN ROOM)
      (LDESC
"This is the great cabin, the Captain-General's quarters and
magazine.  The passageway leading to the other officers' cabins
is forward.")
      (FORE TO PASSAGEWAY IF CAPTAINS-CABIN-DOOR IS OPEN)
      (OUT TO PASSAGEWAY IF CAPTAINS-CABIN-DOOR IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL DECK LG-ERASMUS CAPTAINS-CABIN-DOOR LG-CREWMEN LG-BUNK)
      (ACTION CAPTAINS-CABIN-F)
      (THINGS <> RAT RAT-PSEUDO
	      <> COCKROACH COCKROACH-PSEUDO)>

<ROUTINE CAPTAINS-CABIN-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<P? FIND GLOBAL-WATER>
		       <PERFORM ,V?OPEN ,CAPTAINS-DESK>
		       <RTRUE>)>)
	       (<RARG? LEAVE>
		<COND (<SCENE? S-ERASMUS>
		       <DEQUEUE I-WHINE>
		       <TELL CR
"You close your ears to the whines and leave, hating Spillbergen
anew." CR CR>)>)
	       (<RARG? END>
		<COND (<AND <SCENE? S-ERASMUS>
			    <NOT <QUEUED? I-WHINE>>>
		       <I-WHINE T>)>)>>

<ROUTINE I-WHINE ("OPT" (END <>))
	 <QUEUE I-WHINE 3>
	 <THIS-IS-IT ,SPILLBERGEN>
	 <TELL CR
"Spillbergen whines weakly.  \"I'm ">
	 <COND (<FSET? ,FLAGON ,SCOREBIT> <TELL "thirsty">)
	       (ELSE <TELL "hungry">)>
	 <TELL ",\" he rasps.">
	 <COND (.END
		<TELL
"You've set some water aside for him, out of pity.">)>
	 <CRLF>>

<OBJECT FLAGON
	(LOC CAPTAINS-DESK)
	(DESC "flagon")
	(SYNONYM FLAGON WATER DRINK)
	(FLAGS TAKEBIT SEARCHBIT OPENABLE TRANSBIT CONTBIT SCOREBIT)
	(CAPACITY 10)
	(ACTION FLAGON-F)>

<ROUTINE FLAGON-F ("AUX" (W <NOUN-USED? ,PRSO ,W?WATER>))
	 <COND (<AND <VERB? LEAP DIVE> .W>
		<PERFORM ,PRSA ,LG-SEA>
		<RTRUE>)
	       (<AND .W <FSET? ,FLAGON ,RMUNGBIT>>
		<TELL "There's no longer any water in the flagon." CR>)
	       (<VERB? EXAMINE>
		<TELL
"This is a flagon ">
		<COND (<FSET? ,FLAGON ,RMUNGBIT>
		       <TELL "which contained">)
		      (ELSE <TELL "containing">)>
		<TELL " a secret cache of water you've set aside
for the Captain-General.  The water doesn't look too palatable." CR>)
	       (<VERB? PUT-AWAY>
		<MOVE ,FLAGON ,CAPTAINS-DESK>
		<TELL "You put the flagon back into the desk." CR>)
	       (<VERB? LOOK-INSIDE>
		<COND (<NOT <FSET? ,FLAGON ,OPENBIT>>
		       <TELL CTHE ,FLAGON " isn't open." CR>)
		      (<FSET? ,FLAGON ,RMUNGBIT>
		       <TELL CTHE ,FLAGON " is now empty." CR>)
		      (ELSE
		       <TELL
"There is some water in the flagon." CR>)>)
	       (<VERB? POUR>
		<COND (<NOT <FSET? ,FLAGON ,OPENBIT>>
		       <TELL CTHE ,FLAGON " isn't open." CR>)
		      (<FSET? ,FLAGON ,RMUNGBIT>
		       <TELL CTHE ,FLAGON " is empty." CR>)
		      (ELSE
		       <FSET ,FLAGON ,RMUNGBIT>
		       <TELL
"You pour the water">
		       <COND (<AND <HERE? ,CAPTAINS-CABIN>
				   <PRSI? <> ,SPILLBERGEN>>
			      <TELL
" on the Captain, who whines pitifully at your
cruelty." CR>)
			     (ELSE <TELL "." CR>)>)>)
	       (<VERB? DRINK TASTE>
		<COND (<NOT <FSET? ,FLAGON ,OPENBIT>>
		       <TELL CTHE ,FLAGON " isn't open." CR>)
		      (<FSET? ,FLAGON ,RMUNGBIT>
		       <TELL
"There's no more water." CR>)
		      (ELSE
		       <TELL
"You sip a little">
		       <COND (<FSET? ,FLAGON ,SCOREBIT>
			      <TELL ", reserving the rest for Spillbergen">)>
		       <TELL
".  The water tastes terrible, but at least it's not salt water.  It's
well known that if you descend to drinking salt water, you go mad." CR>)>)
	       (<AND <P? GIVE>
		     <NOT <FSET? ,FLAGON ,RMUNGBIT>>
		     <FSET? ,PRSI ,PERSON>>
		<COND (<FSET? ,PRSI ,PLURAL>
		       <TELL
"You can't share that little bit of water among so many." CR>)
		      (ELSE
		       <MOVE ,FLAGON ,PRSI>
		       <FSET ,FLAGON ,OPENBIT>
		       <TELL CTHE ,PRSI " drinks it greedily." CR>)>)
	       (<AND <VERB? TAKE>
		     <NOUN-USED? ,PRSO ,W?WATER>>
		<COND (<HELD? ,FLAGON>
		       <COND (<FSET? ,FLAGON ,RMUNGBIT>
			      <TELL
"The flagon held the last of the good water, tarry but drinkable." CR>)
			     (ELSE
			      <TELL
"You already have a flagon full of water." CR>)>)
		      (ELSE
		       <RFALSE>)>)>>

<OBJECT SECRET-DRAWER
	(LOC CAPTAINS-CABIN)
	(OWNER SPILLBERGEN)
	(DESC "secret drawer")
	(SYNONYM DRAWER CATCH ORNAMENTATION)
	(ADJECTIVE SECRET SMALL)
	(FLAGS INVISIBLE NDESCBIT SEARCHBIT OPENABLE CONTBIT FURNITURE)
	(ACTION SECRET-DRAWER-F)>

<ROUTINE SECRET-DRAWER-F ()
	 <COND (<VERB? EXAMINE OPEN CLOSE>
		<PERFORM ,PRSA ,CAPTAINS-DESK>
		<RTRUE>)
	       (<VERB? PUSH MOVE>
		<PERFORM ,V?OPEN ,CAPTAINS-DESK>
		<RTRUE>)>>

<OBJECT CAPTAINS-DESK
	(LOC CAPTAINS-CABIN)
	(OWNER SPILLBERGEN)
	(DESC "desk")
	(LDESC "The Captain's ornate desk fills one wall of the cabin.")
	(SYNONYM DESK)
	(ADJECTIVE CAPTAIN)
	(FLAGS SEARCHBIT SURFACEBIT OPENABLE CONTBIT FURNITURE SCOREBIT)
	(CAPACITY 100)
	(ACTION CAPTAINS-DESK-F)>

<ROUTINE CAPTAINS-DESK-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This desk is much like your own, but the captain hasn't used it in
weeks.  He is too sick to leave his bunk.">
		<COND (<NOT <FSET? ,CAPTAINS-DESK ,RMUNGBIT>>
		       <TELL "">
		       <PERFORM ,V?OPEN ,CAPTAINS-DESK>
		       <RTRUE>)>
		<CRLF>)
	       (<VERB? OPEN LOOK-INSIDE SEARCH LOOK-ON>
		<COND (<NOT <FSET? ,CAPTAINS-DESK ,RMUNGBIT>>
		       <FSET ,CAPTAINS-DESK ,RMUNGBIT>
		       <FCLEAR ,SECRET-DRAWER ,INVISIBLE>
		       <TELL
"You look through the desk, knowing you left a flagon of water in it.  In your
tiredness you fumble around, unsure where you put it, and then remember
the secret drawer.  Where's that catch?  Ah, there it is, a small piece of
ornamentation." CR>)
		      (<NOT <FSET? ,CAPTAINS-DESK ,OPENBIT>>
		       <FSET ,CAPTAINS-DESK ,OPENBIT>
		       <FSET ,SECRET-DRAWER ,OPENBIT>
		       <TELL
"You open the secret drawer to the desk, revealing ">
		       <DESCRIBE-REST ,CAPTAINS-DESK>
		       <TELL "." CR>
		       <RESTART-STORM?>
		       <SCORE-OBJECT ,CAPTAINS-DESK>)>)>>

<BEGIN-SEGMENT RODRIGUES>

<ROOM PILOTS-CABIN
      (LOC ROOMS)
      (DESC "Pilot's Cabin")
      (SCENE S-ERASMUS S-ANJIRO S-RODRIGUES)
      (OWNER BLACKTHORNE)
      (SYNONYM CABIN ROOM)
      ;(ADJECTIVE MY)
      (STARBOARD TO PASSAGEWAY IF PILOTS-CABIN-DOOR IS OPEN)
      (OUT TO PASSAGEWAY IF PILOTS-CABIN-DOOR IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL DECK PILOTS-CABIN-DOOR LG-ERASMUS LG-CREWMEN)
      (THINGS <> RAT RAT-PSEUDO
	      <> COCKROACH COCKROACH-PSEUDO)
      (ACTION PILOTS-CABIN-F)>

<ROUTINE PILOTS-CABIN-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is your cabin, sparsely furnished and small but nonetheless the
second best on the ship.  The only exit is out to the passageway.">
		<COND (<AND <SCENE? S-ERASMUS>
			    <NOT <FSET? ,HERE ,TOUCHBIT>>>
		       <TELL
"There's something wrong here.  Your cabin has been disturbed.  As
you look around, trying to see what's wrong, your eyes stray to the
sea chest which contains your rutters.  You do it almost in a panic, for
a pilot's rutters are his life.">)
		      (<SCENE? S-RODRIGUES>
		       <TELL
"The room looks as though it has been tidied up and then thoroughly
turned over again.">)>
		<CRLF>)
	       (<RARG? ENTER>
		<COND (<SCENE? S-ERASMUS>
		       <QUEUE I-BUNK 4>)>
		<RTRUE>)
	       (<RARG? LEAVE>
		<COND (<SCENE? ,S-ERASMUS>
		       <DEQUEUE I-BUNK>)>)
	       (<RARG? BEG>
		<COND (<P? WALK (P?OUT P?STARBOARD)>
		       <COND (<OR <HELD? ,RUTTER>
				  <HELD? ,SECRET-RUTTER>>
			      <TELL
"As you start to leave, you remember you are carrying one of your
precious rutters out into the storm or into the inquisitive eyes
of your crew.  You think better of it." CR>)>)
		      (<VERB? SLEEP LIE-DOWN>
		       <PERFORM ,V?BOARD ,BUNK>
		       <RTRUE>)>)>>

<END-SEGMENT ;"ERASMUS+RODRIGUES">
<BEGIN-SEGMENT ERASMUS>

<NEW-ADD-WORD "RUTTERS" NOUN <VOC "RUTTER"> ,PLURAL-FLAG>
<NEW-ADD-WORD "MAPS" NOUN <VOC "MAP"> ,PLURAL-FLAG>

<OBJECT SECRET-RUTTER
	(LOC SEA-CHEST)
	(DESC "secret Portuguese rutter")
	(SYNONYM RUTTER MAP)
	(ADJECTIVE SECRET PORTUGUESE)
	(FLAGS READBIT TAKEBIT OPENABLE)
	(ACTION SECRET-RUTTER-F)>

<ROUTINE SECRET-RUTTER-F ()
	 <COND (<OR <VERB? ;WHERE FIND>
		    <AND <P? BE * INTPP>
			 <PP? ,W?ON ,LG-ERASMUS>>>
		<COND (<SCENE? ,S-ANJIRO>
		       <PERFORM ,PRSA ,RUTTER ,PRSI>
		       <RTRUE>)>)
	       (<IN? ,RUTTER ,GENERIC-OBJECTS>
		<COND (<ABSTRACT-VERB?> <RFALSE>)
		      (ELSE
		       <TELL
G"There's no rutter here." CR>)>)
	       (<P? PUT-AWAY SECRET-RUTTER ROOMS>
		<PERFORM ,PRSA ,PRSO ,SEA-CHEST>
		<RTRUE>)
	       (<VERB? EXAMINE READ OPEN>
		<FSET ,PRSO ,OPENBIT>
		<TELL
"This rutter explains the sea route through Magellan's Pass into the
Pacific and up the west coast of Spanish America.  It is a treasure
beyond price." CR>)
	       (<VERB? WRITE>
		<TELL
"You haven't written in this rutter since you fled the Spanish into
the Pacific.  It deals with Magellan's Pass, and goes no further than
Chile." CR>)
	       (<VERB? FOLLOW STEER-BY>
		<TELL
G"You are in uncharted territory now, and the rutter is no help." CR>)
	       (<P? SHOW * (VINCK HENDRIK)>
		<TELL
CTHE ,PRSI " appears interested, probably wondering why you are
revealing your secret now.  Perhaps you expect to die..." CR>)
	       (<VERB? MUNG TEAR>
		<TELL G"You could never destroy such a valuable object." CR>)
	       (<VERB? PUT DROP>
		<FCLEAR ,PRSO ,OPENBIT>
		<RFALSE>)>>

<OBJECT RUTTER
	(LOC SEA-CHEST)
	(OWNER BLACKTHORNE)
	(DESC "your rutter")
	(SYNONYM RUTTER ;RUTTERS MAP ;MAPS)
	;(ADJECTIVE MY)
	(FLAGS NOABIT NOTHEBIT READBIT TAKEBIT SCOREBIT OPENABLE)
	(ACTION RUTTER-F)>

<ROUTINE RUTTER-F ()
	 <COND (<OR <VERB? ;WHERE FIND>
		    <AND <P? BE * INTPP>
			 <PP? ,W?ON ,LG-ERASMUS>>>
		<COND (<SCENE? ,S-ANJIRO>
		       <FSET ,RUTTER ,RMUNGBIT>
		       <TELL
"You haven't seen your rutters.  Could they still be on the "I"Erasmus""?  Or
worse, could they have been taken?  They are your most precious
possessions, and the secret one could cost you your life in any
Catholic nation!" CR>)>)
	       (<VERB? WHAT>
		<TELL
"A rutter is a small book containing the detailed observation of
a pilot who has been there before.  It records magnetic compass courses
between ports and capes, headlands and channels.  It sets down how we
got there and how we got back.  Rutters that reveal the mysteries of
the Pass of Magellan into the Pacific -- a Portuguese discovery -- and
thence the seaways to Asia are guarded as national treasures by the
Spanish and Portuguese." CR>)
	       (<IN? ,RUTTER ,GENERIC-OBJECTS>
		<COND (<ABSTRACT-VERB?> <RFALSE>)
		      (ELSE
		       <TELL
G"There's no rutter here." CR>)>)
	       (<P? PUT-AWAY RUTTER ROOMS>
		<PERFORM ,PRSA ,PRSO ,SEA-CHEST>
		<RTRUE>)
	       (<VERB? FOLLOW STEER-BY>
		<TELL
G"You are in uncharted territory now, and the rutter is no help." CR>)
	       (<VERB? EXAMINE READ OPEN>
		<FSET ,RUTTER ,OPENBIT>
		<TELL
"This rutter is the record of your voyage from Rotterdam in the Netherlands
south through the Atlantic, through the Pass of Magellan, up the west
coast of South America, and into the unknown Pacific." CR>)
	       (<VERB? WRITE>
		<COND (<NOT <PRSI? <> ,QUILL>>
		       <CANT-X-WITH-PRSI "write">)
		      (<FSET? ,RUTTER ,SCOREBIT>
		       <TELL "You">
		       <COND (<NOT <HELD? ,QUILL>>
			      <SETG PRSO ,QUILL>
			      <COND (<NOT <ITAKE <>>>
				     <TELL
"'ll have a devil of a time writing without a quill." CR>
				     <RTRUE>)
				    (ELSE
				     <TELL " take the quill and">)>
			      <SETG PRSO ,RUTTER>)>
		       <FSET ,RUTTER ,OPENBIT>
		       <TELL " write: \"April 21 1600.  Fifth
hour.  Dusk.  133d day from Santa Maria Island, Chile, on the 32 degree
North line
of latitude.  Sea still high and wind strong.  We are running before the
wind along a course of 270 degrees, making way briskly.  Large reefs
were sighted at half the hour bearing North East by North half a
league distant.  Three men died in the night of the scurvy.  Today
Bosun Rijckloff died.  I estimate we are still on course and that
landfall in the Japans should be soon.\"|
|
But how soon, you wonder?" CR>
		       <RESTART-STORM?>
		       <SCORE-OBJECT ,RUTTER>)
		      (ELSE
		       <TELL
"You've already written in the rutter today.  Perhaps you need some
rest." CR>)>)
	       (<VERB? MUNG TEAR>
		<TELL G"You could never destroy such a valuable object." CR>)
	       (<VERB? PUT DROP>
		<FCLEAR ,RUTTER ,OPENBIT>
		<RFALSE>)>>

<OBJECT SEA-CHEST
	(LOC PILOTS-CABIN)
	(DESC "sea chest")
	(SYNONYM CHEST TRUNK)
	(ADJECTIVE SEA)
	(SIZE 200)
	(FLAGS LOCKED LOCKABLE TAKEBIT SEARCHBIT CONTBIT OPENABLE)
	(CAPACITY 20)
	(ACTION SEA-CHEST-F)>

<ROUTINE SEA-CHEST-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
			    <FSET? ,PRSO ,LOCKED>>
		       <FSET ,SEA-CHEST ,RMUNGBIT>	
		       <TELL
"It's locked and appears undisturbed." CR>)>)
	       (<VERB? OPEN>
		<COND (<PRSI? ,KEY>
		       <PERFORM ,V?UNLOCK ,SEA-CHEST ,KEY>
		       <RTRUE>)
		      (<FSET? ,SEA-CHEST ,LOCKED>
		       <FSET ,SEA-CHEST ,RMUNGBIT>
		       <TELL
"It's locked.  You keep your rutters in it, and they are your most
precious possessions." CR>)
		      (<NOT <FSET? ,SEA-CHEST ,OPENBIT>>
		       <FSET ,SEA-CHEST ,OPENBIT>
		       <TELL
"The sea chest opens.  Inside it is ">
		       <DESCRIBE-REST ,SEA-CHEST>
		       <TELL "." CR>)>)
	       (<AND <P? LOCK SEA-CHEST (<> KEY)>
		     <NOT <FSET? ,SEA-CHEST ,LOCKED>>>
		<COND (<FSET? ,SEA-CHEST ,OPENBIT>
		       <YOULL-HAVE-TO "close it">)
		      (<HELD? ,KEY>
		       <FSET ,SEA-CHEST ,LOCKED>
		       <TELL "You've now locked it securely." CR>)
		      (ELSE
		       <TELL G"You don't have the key." CR>)>)
	       (<AND <P? UNLOCK SEA-CHEST (<> KEY)>
		     <FSET? ,SEA-CHEST ,LOCKED>>
		<COND (<HELD? ,KEY>
		       <FCLEAR ,SEA-CHEST ,LOCKED>
		       <TELL "You unlock " THE ,PRSO "." CR>)
		      (ELSE
		       <FSET ,SEA-CHEST ,RMUNGBIT>
		       <TELL G"You don't have the key." CR>)>)
	       (<VERB? CLOSE>
		<COND (<FSET? ,SEA-CHEST ,OPENBIT>
		       <FCLEAR ,SEA-CHEST ,OPENBIT>
		       <TELL
"The sea chest is now closed." CR>)>)>>

<ROUTINE I-BUNK ("AUX" CNT)
	 <COND (<G? <GETP ,BLACKTHORNE ,P?HEALTH> 0>
		<RFALSE>)>
	 <QUEUE I-BUNK 6>
	 <PUTP ,BUNK ,P?COUNT <SET CNT <+ 1 <GETP ,BUNK ,P?COUNT>>>>
	 <TELL CR
"You glance at your bunk.  You are so tired.  Go to sleep just for an hour,
for ten minutes..." CR CR>
	 <COND (<G? .CNT 4>
		<TELL "\"I must sleep.  Sleep.  They rely on me...\" You
fall into a deep, exhausted sleep which is interrupted only when the "
I"Erasmus"" is holed on the reef and sinks to the bottom." CR>
		<JIGS-UP>)
	       (ELSE
		<TELL "\"I won't, I'll sleep tomorrow,\" you force yourself
to say." CR>)>>

<OBJECT LG-BUNK
	(LOC LOCAL-GLOBALS)
	(SCENE S-ERASMUS S-ANJIRO S-RODRIGUES)
	(DESC "bed")
	(SYNONYM BUNK BED HAMMOCK BUNKS BEDS HAMMOCKS)
	(FLAGS FURNITURE SURFACEBIT VEHBIT)
	(ACTION LG-BUNK-F)>

<ROUTINE LG-BUNK-F ()
	 <COND (<VERB? BOARD>
		<TELL
"This is no time to think of sleep!" CR>)>>

<OBJECT BUNK
	(LOC PILOTS-CABIN)
	(SCENE S-ERASMUS S-ANJIRO S-RODRIGUES)
	(DESC "bunk")
	(FDESC "The long narrow bunk with its straw palliasse looks inviting.")
	(SYNONYM BUNK BED)
	(ADJECTIVE LONG NARROW)
	(FLAGS FURNITURE VEHBIT)
	(COUNT 0)
	(ACTION BUNK-F)>

<CONSTANT J-BUNK 10>

<ROUTINE BUNK-F ()
	 <COND (<VERB? BOARD CLIMB-ON>
		<COND (<JIGS-UP? ,J-BUNK
"Your tired brain tells you that if you lie down, you will sleep, and if
you sleep, the ship will be lost, so you push yourself away.">
		       <TELL
"While you might have had a chance of resisting sleep if you hadn't lain
in the bunk, once you are in it, you fall quickly into an exhausted
slumber.  When you are awakened, it is by the wrenching, tearing sound of
the reef scraping the hull off of the ship.  You and the "I"Erasmus"" are
doomed." CR>
		       <JIGS-UP>)
		      (ELSE <RTRUE>)>)>>

<OBJECT DESK
	(LOC PILOTS-CABIN)
	(DESC "desk")
	(SYNONYM DESK)
	(FLAGS FURNITURE OPENBIT SURFACEBIT CONTBIT SEARCHBIT)
	(CAPACITY 100)
	(ACTION DESK-F)>

<ROUTINE DESK-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a battered old writing desk, with a top large enough for
charts and rutters.">
		<COND (<AND <SCENE? ,S-ERASMUS> <IN? ,APPLE ,ROPER>>
		       <TELL
"You don't see the apples you've been saving.">)>
		<CRLF>)
	       (<VERB? OPEN>
		<COND (<AND <FSET? ,KEY ,NDESCBIT>
			    <SCENE? ,S-ERASMUS>>
		       <PERFORM ,V?SEARCH ,DESK>
		       <RTRUE>)
		      (ELSE
		       <TELL
"Opening the desk reveals little of interest.  You've seen it all a
thousand times before." CR>)>)
	       (<VERB? SEARCH>
		<COND (<AND <FSET? ,KEY ,NDESCBIT>
			    <SCENE? ,S-ERASMUS>>
		       <FSET ,KEY ,TAKEBIT>
		       <FSET ,KEY ,TRYTAKEBIT>
		       <FCLEAR ,KEY ,NDESCBIT>
		       <COND (<IN? ,APPLE ,ROPER>
			      <TELL
"The first thing you notice is that the apples you've been saving are
gone!  ">)>
		       <COND (<FSET? ,SEA-CHEST ,RMUNGBIT>
			      <FCLEAR ,SEA-CHEST ,RMUNGBIT>
			      <MOVE ,KEY ,WINNER>
			      <THIS-IS-IT ,KEY>
			      <TELL
"You search for the key to your sea chest.  Can someone have taken it?  No!  There it is.  You take it with thanks." CR>)
			     (ELSE
			      <TELL "You notice the key to your sea chest,
safe and sound where you left it." CR>)>
		       <RESTART-STORM?>
		       <SCORE-OBJECT ,KEY>)
		      (ELSE
		       <TELL
"You search the desk, finding nothing of particular interest." CR>)>)>>

<OBJECT QUILL
	(LOC DESK)
	(DESC "quill")
	(SYNONYM QUILL PEN)
	(ADJECTIVE FRESH QUILL)
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT KEY
	(LOC PILOTS-CABIN)
	(DESC "rusty key")
	(SYNONYM KEY)
	(ADJECTIVE RUSTY)
	(FLAGS NDESCBIT ;TRYTAKEBIT ;TAKEBIT SCOREBIT)
	(ACTION KEY-F)>

<ROUTINE KEY-F ()
	 <COND (<VERB? FIND>
		<COND (<FSET? ,KEY ,NDESCBIT>
		       <TELL
"You keep the key in your desk, so you look there first.  ">)>
		<PERFORM ,V?SEARCH ,DESK>
		<RTRUE>)
	       (<FSET? ,KEY ,NDESCBIT>
		<TELL
"You see no key here." CR>)
	       (<AND <P? UNLOCK SEA-CHEST KEY>
		     <FSET? ,SEA-CHEST ,LOCKED>>
		<FCLEAR ,SEA-CHEST ,LOCKED>
		<TELL
"The chest unlocks with a rusty click." CR>)
	       (<AND <P? LOCK SEA-CHEST KEY>
		     <NOT <FSET? ,SEA-CHEST ,LOCKED>>>
		<FCLEAR ,SEA-CHEST ,OPENBIT>
		<FSET ,SEA-CHEST ,LOCKED>
		<TELL
"The chest is now securely locked." CR>)>>

<OBJECT APPLE
	(DESC "tiny bruised apple")
	(OWNER BLACKTHORNE)
	(SYNONYM APPLE APPLES SLICE)
	(ADJECTIVE BRUISED TINY MOLDY)
	(FLAGS NDESCBIT TAKEBIT FOODBIT SCOREBIT DONT-ALL)
	(COUNT 4)
	(ACTION APPLE-F)>

<ROUTINE APPLE-F ("AUX" TMP)
	 <COND (<VERB? FIND>
		<COND (<AND <IN? ,APPLE ,ROPER>
			    <FSET? ,APPLE ,NDESCBIT>>
		       <TELL
"A cursory search of the premises reveals no apple." CR>)>)
	       (<VERB? EXAMINE>
		<COND (<IN? ,APPLE ,ROPER>
		       <COND (<FSET? ,APPLE ,NDESCBIT>
			      <TELL
"You see no apple." CR>)
			     (ELSE
			      <TELL
"This is the last of the apples you have carefully hoarded all the way
from Santa Maria Island, off Chile.  It's bruised and tiny, with mold on
a rotting section." CR>)>)>)
	       (<VERB? EAT>
		<COND (<NOT <HELD? ,APPLE>>
		       <TELL
"You don't have the apple." CR>
		       <RTRUE>)>
		<SET TMP <- <GETP ,APPLE ,P?COUNT> 1>>
		<PUTP ,APPLE ,P?COUNT .TMP>
		<COND (<ZERO? .TMP>
		       <REMOVE ,APPLE>
		       <TELL
"You eat the last quarter of the apple." CR>)
		      (ELSE
		       <TELL
"You carefully eat a quarter of the apple, wrap the remainder, and put it
away.  There are a few maggots in the quarter you've cut off, but you
heed the old sea legend that apple maggots are effective against
scurvy.  You chew the fruit gently because your teeth are aching and your gums
sore and tender.  After you finish the apple, you feel better." CR>
		       <COND (<EQUAL? .TMP 3>
			      <PUTP ,WINNER ,P?HEALTH 1>
			      <SETG TIRED-TIME 0>
			      <DEQUEUE I-TIRED-WARNING>
			      <DEQUEUE I-TIRED>
			      <RESTART-STORM?>
			      <SCORE-OBJECT ,APPLE>)>
		       <RTRUE>)>)
	       (<AND <P? GIVE APPLE *>
		     <FSET? ,PRSI ,PERSON>>
		<REMOVE ,APPLE>
		<TELL
CTHE ,PRSI " take" S ,PRSI " the apple and gobble" S ,PRSI " it greedily.">
		<COND (<PRSI? ,VINCK ,PIETERZOON CROOCQ>
		       <TELL
"\"Thank you, Pilot.  Thank you!\"">)>
		<CRLF>)>>

<ROUTINE RAT-PSEUDO ()
	 <RANDOM-PSEUDO "rat">>

<ROUTINE COCKROACH-PSEUDO ()
	 <RANDOM-PSEUDO "cockroaches">>

<ROUTINE RANDOM-PSEUDO (WHAT)
	 <TELL "You don't see the " .WHAT " any more." CR>>

<ROOM MATES-CABIN
      (LOC ROOMS)
      (DESC "Mates' Cabin")
      (OWNER MATES)
      (SYNONYM CABIN ROOM)
      (ADJECTIVE MATES)
      (PORT TO PASSAGEWAY IF MATES-CABIN-DOOR IS OPEN)
      (OUT TO PASSAGEWAY IF MATES-CABIN-DOOR IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL DECK MATES-CABIN-DOOR LG-ERASMUS LG-CREWMEN)
      (THINGS <> RAT RAT-PSEUDO
	      <> COCKROACH COCKROACH-PSEUDO)
      (ACTION MATES-CABIN-F)>

<ROUTINE MATES-CABIN-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is the Mates' cabin.">
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL "It is now shared by Baccus van Nekk, the
chief merchant, Hendrik the third mate, and the boy, Croocq.">)>
		<TELL "The passageway is outside." CR>)
	       (<RARG? BEG>
		<COND (<AND <P? SEARCH GLOBAL-HERE>
			    <IN? ,APPLE ,ROPER>>
		       <TELL
"You find nothing.  Roper watches with a smirk on his face.  \"Go ahead,
Pilot.  Search all you want.\"" CR>)
		      (<AND <P? SEARCH (PIETERZOON VAN-NEKK CROOCQ)>
			    <IN? ,APPLE ,ROPER>>
		       <TELL
D ,PRSO " reluctantly allows himself to be searched, cursing you all
the while.  You find nothing." CR>)>)>>

<BEGIN-SEGMENT RODRIGUES>

<OBJECT PILOTS-CABIN-DOOR
	(LOC LOCAL-GLOBALS)
	(OWNER BLACKTHORNE)
	(DESC "Pilot's cabin door")
	(SYNONYM DOOR)
	(ADJECTIVE ;MY CABIN)
	(FLAGS DOORBIT LOCKABLE)>

<END-SEGMENT ;"ERASMUS+RODRIGUES">
<BEGIN-SEGMENT ERASMUS>

<OBJECT CAPTAINS-CABIN-DOOR
	(LOC LOCAL-GLOBALS)
	(OWNER SPILLBERGEN)
	(DESC "Captain's cabin door")
	(SYNONYM DOOR)
	(ADJECTIVE CABIN)
	(FLAGS DOORBIT LOCKABLE)
	(ACTION CAPTAINS-CABIN-DOOR-F)>

<ROUTINE CAPTAINS-CABIN-DOOR-F ()
	 <COND (<VERB? KNOCK>
		<COND (<IN? ,SPILLBERGEN ,CAPTAINS-CABIN>
		       <TELL
"You hear a faint response." CR>)>)>>

<OBJECT MATES
	(LOC GENERIC-OBJECTS)
	(DESC "Mates")
	(SYNONYM MATES MATE OFFICERS OFFICER)
	(ADJECTIVE FIRST SECOND THIRD)
	(FLAGS PERSON DUTCHBIT)>

<OBJECT MATES-CABIN-DOOR
	(LOC LOCAL-GLOBALS)
	(OWNER MATES)
	(DESC "Mates' cabin door")
	(SYNONYM DOOR)
	(ADJECTIVE CABIN)
	(FLAGS DOORBIT LOCKABLE)
	(ACTION MATES-CABIN-DOOR-F)>

<ROUTINE MATES-CABIN-DOOR-F ()
	 <COND (<VERB? KNOCK>
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL
"\"Aye?  Come in, damn you!  Do think this is a palace?\"" CR>)>)>>

<BEGIN-SEGMENT ANJIRO>
<BEGIN-SEGMENT RODRIGUES>

<OBJECT PASSAGE-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "passageway door")
	(SYNONYM DOOR)
	(ADJECTIVE PASSAGE PASSAGEWAY)
	(FLAGS DOORBIT LOCKABLE)
	(ACTION PASSAGE-DOOR-F)>

<ROUTINE PASSAGE-DOOR-F ()
	 <COND (<SCENE? ,S-ANJIRO>
		<COND (<NOT <PASSIVE-VERB?>>
		       <PERFORM ,V?RUB ,RIBBON>
		       <RTRUE>)>)
	       (<SCENE? ,S-ERASMUS>
		<COND (<VERB? KNOCK>
		       <TELL
"You hear noise inside, but no response to your knock." CR>)>)>>

<END-SEGMENT ;"ERASMUS+ANJIRO+RODRIGUES">
<BEGIN-SEGMENT ERASMUS>

<OBJECT LASHING
	(LOC BRIDGE-OF-ERASMUS)
	(DESC "protective lashing")
	(SYNONYM LASHING ROPE)
	(ADJECTIVE PROTECTIVE)
	(FLAGS NDESCBIT)>

<OBJECT WHEEL
	(LOC BRIDGE-OF-ERASMUS)
	(OWNER LG-ERASMUS)
	(DESC "wheel")
	(SYNONYM WHEEL RUDDER HELM TILLER)
	(DESCFCN WHEEL-DESC)
	(FLAGS CANT-HOLD SCOREBIT)
	(ACTION WHEEL-F)>

<ROUTINE WHEEL-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<TELL
"The wheel dominates the quarterdeck.  It is
turned ">
		<COND (<EQUAL? ,SHIP-COURSE ,P?PORT> <TELL "to port">)
		      (<EQUAL? ,SHIP-COURSE ,P?STARBOARD> <TELL "to starboard">)
		      (ELSE <TELL "straight">)>
	 <TELL " and ">
	 <COND (<FSET? ,WHEEL ,RMUNGBIT>
		<TELL "lashed in place">)
	       (ELSE <TELL "free to turn">)>
	 <TELL  " now.">)>>

<ROUTINE WHEEL-F ("AUX" (ST? <>) (TOOK? <>))
	 <COND (<VERB? EXAMINE>
		<TELL
"The wheel is connected to the rudder and steers the ship.  It is
turned ">
		<COND (<EQUAL? ,SHIP-COURSE ,P?PORT> <TELL "to port">)
		      (<EQUAL? ,SHIP-COURSE ,P?STARBOARD> <TELL "to starboard">)
		      (ELSE <TELL "straight">)>
		<TELL " now, ">
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <TELL
"lashed in place against the surging sea." CR>)
		      (<FSET? ,WHEEL ,ONBIT>
		       <TELL
"unlashed and held steady only by all the strength you can summon
from a weakened body." CR>)
		      (ELSE
		       <TELL
"spinning freely from side to side, the lashing hanging loosely beside
it." CR>)>)
	       (<VERB? TAKE TAKE-OVER>
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <PERFORM ,V?UNTIE ,WHEEL>
		       <RTRUE>)
		      (<NOT <FSET? ,WHEEL ,ONBIT>>
		       <TELL
"You take hold of the wheel, trying to keep it under control">
		       <COND (<AND <EQUAL? ,SHIP-Y 1> ;">=13"
				   <G? ,SHIP-X 0>
				   <L? ,SHIP-X 6>>
			      <TELL ", but the currents and the
crashing waves spin it away from from you.  You just aren't strong
enough to hold it alone.  \"Piss on you, storm!  Get your dung-eating
hands off my ship!\", you rage in frustration." CR>)
			     (ELSE
			      <FCLEAR ,HENDRIK ,TRYTAKEBIT>
			      <FSET ,WHEEL ,ONBIT>
			      <TELL "." CR>)>)
		      (ELSE
		       <TELL
"You hold the wheel as strongly as you can, fighting the surging
sea." CR>)>)
	       (<VERB? DROP>
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <PERFORM ,V?UNTIE ,WHEEL>
		       <RTRUE>)
		      (<FSET? ,WHEEL ,ONBIT>
		       <FCLEAR ,WHEEL ,ONBIT>
		       <TELL
"You let go of the wheel." CR>)
		      (ELSE
		       <TELL
"You arent' holding it." CR>)>)
	       (<P? PUT LASHING WHEEL>
		<PERFORM ,V?TIE ,WHEEL>
		<RTRUE>)
	       (<P? (TAKE TAKE-OFF) LASHING>
		<PERFORM ,V?UNTIE ,WHEEL>
		<RTRUE>)
	       (<P? TIE WHEEL>
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <TELL G"It already is." CR>)
		      (<AND <EQUAL? ,SHIP-Y 1> ;">=13"
			    <G? ,SHIP-X 0>
			    <L? ,SHIP-X 6>
			    <NOT <FSET? ,WHEEL ,ONBIT>>>
		       <TELL
"The wheel is spinning too wildly to lash.  ">
		       <YOULL-HAVE-TO "get it under control">)
		      (ELSE
		       <FSET ,WHEEL ,RMUNGBIT>
		       <FCLEAR ,WHEEL ,ONBIT>
		       <TELL
"You loop the protective lashing around the spokes of the wheel.  It
is now locked in place." CR>)>)
	       (<P? UNTIE WHEEL>
		<COND (<FSET? ,WHEEL ,RMUNGBIT>
		       <FCLEAR ,HENDRIK ,TRYTAKEBIT>
		       <FSET ,WHEEL ,ONBIT>
		       <FCLEAR ,WHEEL ,RMUNGBIT>
		       <TELL
"You remove the protective lashing, and brace yourself in place against
the force of the sea.  You can now turn the wheel freely." CR>)
		      (ELSE
		       <TELL
G"It already is." CR>)>)
	       (<P? TIE * WHEEL>
		<COND (<PRSO? ,LASHING>
		       <PERFORM ,V?TIE ,WHEEL>
		       <RTRUE>)
		      (ELSE
		       <TELL
"You can't tie " THE ,PRSO " to the wheel!" CR>)>)
	       (<P? UNTIE LASHING WHEEL>
		<PERFORM ,V?UNTIE ,WHEEL>)
	       (<P? STRAIGHTEN WHEEL>
		<SETG P-DIRECTION ,P?FORE>
		<PERFORM ,V?TURN ,WHEEL ,INTDIR>
		<RTRUE>)
	       (<P? TURN WHEEL>
		<COND (<NOT <FSET? ,WHEEL ,ONBIT>>
		       <COND (<AND <EQUAL? ,SHIP-Y 1> ;">=13"
				   <G? ,SHIP-X 0>
				   <L? ,SHIP-X 6>>
			      <TELL
"You grab for the spinning, thrashing wheel, but the force of the
storm is too strong, and the"G" wheel spins out of your hands!" CR>
			      <RTRUE>)
			     (ELSE
			      <SET TOOK? T>
			      <FCLEAR ,HENDRIK ,TRYTAKEBIT>
			      <FSET ,WHEEL ,ONBIT>
			      <TELL
"You take the wheel">
			      <COND (<FSET? ,WHEEL ,RMUNGBIT>
				     <FCLEAR ,WHEEL ,RMUNGBIT>
				     <TELL ", unlashing it first">)>)>)>
		<COND (<FSET? ,LG-ERASMUS ,RMUNGBIT>
		       <COND (.TOOK? <TELL ", but the">)
			     (ELSE <TELL "The">)>
		       <TELL
" ship is pinned to the reef, so turning the wheel is futile!" CR>)
		      (<FSET? ,WHEEL ,RMUNGBIT>
		       <COND (.TOOK? <TELL ", but it's">)
			     (ELSE <TELL "The wheel is">)>
		       <TELL " lashed in place and won't turn." CR>)
		      (<FSET? ,FORESAILS ,RMUNGBIT>
		       <COND (.TOOK? <TELL " and turn it">)
			     (ELSE
			      <TELL "You turn the wheel">)>
		       <TELL ", but there just isn't enough sail without the
foresails, and the ship wallows like a pig!" CR>)
		      (<PRSI? ,INTDIR>
		       <COND (<OR <AND <EQUAL? ,P-DIRECTION ,P?STARBOARD>
				       <EQUAL? ,SHIP-COURSE ,P?PORT>>
				  <AND <EQUAL? ,P-DIRECTION ,P?PORT>
				       <EQUAL? ,SHIP-COURSE ,P?STARBOARD>>>
			      <SET ST? ,P-DIRECTION>
			      <SETG P-DIRECTION ,P?FORE>)>
		       <COND (<EQUAL? ,P-DIRECTION ,SHIP-COURSE>
			      <COND (.TOOK? <TELL ".  ">)>
			      <COND (<EQUAL? ,SHIP-COURSE ,P?FORE>
				     <TELL "You maintain course ">
				     <TELL-DIRECTION ,SHIP-DIRECTION>
				     <TELL ", the wheel still ">)
				    (ELSE
				     <TELL "The wheel is already ">)>
			      <COND (<EQUAL? ,SHIP-COURSE ,P?PORT>
				     <TELL "turned to port">)
				    (<EQUAL? ,SHIP-COURSE ,P?STARBOARD>
				     <TELL "turned to starboard">)
				    (<EQUAL? ,SHIP-COURSE ,P?FORE>
				     <TELL "straight">)>
			      <TELL "." CR>)
			     (<EQUAL? ,P-DIRECTION ,P?PORT>
			      <QUEUE I-BROADSIDE 2>
			      <SET-COURSE ,P?PORT>
			      <COND (.TOOK? <TELL ".  ">)>
			      <TELL
"Straining against the sea, you turn the wheel to port.">
			      <COND (<AND ,REEF-FLAG ;"3,4"
					  <EQUAL? ,REEF-X ,REEF-Y>>
				     <TELL
"The ship turns broadside to the reef, struggling against the
wind which tries to drive it onto the spines." CR>)
				    (<AND <EQUAL? ,SHIP-X 6> ;"11"
					  <EQUAL? ,SHIP-Y 2>>
				     <TELL
"Fighting the wind, the ship slowly turns away from the reef." CR>)
				    (<AND <EQUAL? ,SHIP-X 1> ;"15"
					  <EQUAL? ,SHIP-Y 1>>
				     <TELL
"Struggling, the ship begins to turn to port, slowly, slowly as the
swift currents are drawing you deeper into the maze of rocks." CR>)
				    (ELSE
				     <TELL
"The ship struggles against the wind." CR>)>)
			     (<EQUAL? ,P-DIRECTION ,P?STARBOARD>
			      <QUEUE I-BROADSIDE 2>
			      <SET-COURSE ,P?STARBOARD>
			      <COND (.TOOK? <TELL " and turn it">)
				    (ELSE <TELL "You turn the wheel">)>
			      <TELL " to starboard.">
			      <COND (<AND <EQUAL? ,SHIP-X 8> ;"10"
					  <EQUAL? ,SHIP-Y 2>>
				     <TELL
"The wind snaps the sails full and the ship heads for the gap, but it
means coming very close to the waiting reef!" CR>)
				    (<AND <EQUAL? ,SHIP-X 5> ;"12"
					  <EQUAL? ,SHIP-Y 1>>
				     <TELL
"With a crack the sails fill, shooting the "I"Erasmus"" into the gap!" CR>)
				    (ELSE
				     <TELL
"The ship gains speed with the wind." CR>)>)
			     (<EQUAL? ,P-DIRECTION ,P?FORE ,P?IN>
			      <DEQUEUE I-BROADSIDE>
			      <SET-COURSE ,P?FORE>
			      <COND (.ST?
				     <COND (.TOOK? <TELL " and haul it to ">)
					   (ELSE <TELL "You haul the wheel to ">)>
				     <TELL-DIRECTION .ST?>
				     <TELL
", centering it">)
				    (ELSE
				     <COND (.TOOK? <TELL " and straighten it">)
					   (ELSE <TELL "You straighten the wheel">)>)>
			      <COND (<AND <EQUAL? ,SHIP-Y 9>
					  <EQUAL? ,SHIP-X 19>>
				     <SETG SHIP-DIRECTION ,P?WEST>
				     <TELL
".  Helped by the following wind, the ship returns to its course." CR>
				     <SCORE-OBJECT ,WHEEL>)
				    (ELSE
				     <TELL
", trying to hold a steady course." CR>)>)
			     (ELSE
			      <COND (.TOOK? <TELL ".  ">)>
			      <TELL
"You can only turn the ship to port or starboard!" CR>)>)
		      (ELSE
		       <COND (.TOOK? <TELL ".  ">)>
		       <TELL G"You must specify a direction!" CR>)>)>>

<ROUTINE I-BROADSIDE ()
	 <COND (<NOT <EQUAL? ,SHIP-COURSE ,P?FORE>>
		<TELL CR
"The "I"Erasmus"" continues to turn, further and further off the
wind.  Soon she'll be broadside to the waves!" CR>)>>

<ROUTINE I-SHIP-BROADSIDE ()
	 <COND (<NOT <EQUAL? ,SHIP-COURSE ,P?FORE>>
		<SHIP-BROADSIDE>)>>

<ROUTINE SHIP-BROADSIDE ()
	 <TELL CR "The ship continues turning to ">
	 <TELL-DIRECTION ,SHIP-COURSE>
	 <JIGS-UP
".  It is now broadside to the waves, which spill torrents of water
onto the deck, and below.  Soon she is foundering, the entire ocean seeming
to want to fill her holds.">
	 <RFATAL>>

<ROUTINE SET-COURSE (DIR)
	 <COND (<NOT <EQUAL? .DIR ,SHIP-COURSE ,P?FORE>>
		<QUEUE I-STORM 1>)>
	 <SETG SHIP-COURSE .DIR>
	 <RTRUE>>

<GLOBAL TIRED-TIME 0>

<ROUTINE I-TIRED-WARNING ()
	 <COND (<ZERO? <GETP ,BLACKTHORNE ,P?HEALTH>>
		<TELL CR
"Exhaustion is rapidly overcoming you, but you know you can't sleep
now." CR>)>>

<ROUTINE I-TIRED ()
	 <COND (<ZERO? <GETP ,BLACKTHORNE ,P?HEALTH>>
		<CRLF>
		<JIGS-UP
"Your exhausted body, pushed beyond its last reserves of strength,
fails you.  You collapse, every fiber aching with months of
deprivation.  It is not long after that the ship is driven against the
rocks.">)>>

<BEGIN-SEGMENT YABU>
<BEGIN-SEGMENT PIT>

<OBJECT SPILLBERGEN
	(LOC CAPTAINS-CABIN)
	(DESC "Captain-General Spillbergen")
	(SYNONYM SPILLBERGEN CAPTAIN MAN)
	(ADJECTIVE CAPTAIN-GENERAL CAPTAIN PAULUS)
	(FLAGS PERSON DUTCHBIT OPENBIT CONTBIT SEARCHBIT NOABIT NOTHEBIT)
	(DESCFCN SPILLBERGEN-DESC)
	(GENERIC GENERIC-CAPTAIN-F)
	(ACTION SPILLBERGEN-F)>

<ROUTINE SPILLBERGEN-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<SCENE? ,S-ERASMUS ,S-YABU ,S-PIT> <RTRUE>)
		      (ELSE <RFALSE>)>)
	       (<RARG? OBJDESC>
		<TELL
"Captain-General Paulus Spillbergen ">
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL "lies half conscious in his bunk.">)
		      (<SCENE? ,S-YABU>
		       <TELL "lies nearly unconscious on a pallet.">)
		      (<SCENE? ,S-PIT>
		       <COND (<AND <LOC ,LONG-STRAW> <LOC ,SHORT-STRAW>>
			      <TELL
"lies delirious in the mud.">)
			     (ELSE
			      <TELL
"sits in the mud, leaning back against a wall.">)>)>)>>

<ROUTINE SPILLBERGEN-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<OR <VERB? STOP>
			   <P? SHUT-UP ROOMS>>
		       <TELL
"He stops for a moment, looking at you pitifully." CR>)
		      (ELSE
		       <TELL
"He stirs weakly, but otherwise doesn't respond." CR>)>)
	       (<VERB? PISS>
		<TELL
"You have come to hate him, but to humilate him in his helpless,
weakened condition would be too much." CR>)
	       (<VERB? MOVE>
		<TELL "He's too weak to be moved." CR>)
	       (<HOSTILE-VERB?>
		<TELL
"You want to hit him, even as weak and helpless as he is.  He's to
blame, it's true, but you can't do it."G" Almost exactly
one year ago the fleet reached Tierra del Fuego, the winds favorable for
the stab into the unknown of Magellan's Pass.  But the Captain-General had
ordered a landing to search for gold and treasure.  The fleet had been
forced to winter in the harsh southern wastes, and it was four months
before they could sail.  By then, one hundred and fifty six men had died
of starvation and cold." CR>)
	       (<VERB? WHO>
		<TELL
"Paulus Spillbergen is the Captain-General of the fleet."G" Almost exactly
one year ago the fleet reached Tierra del Fuego, the winds favorable for
the stab into the unknown of Magellan's Pass.  But the Captain-General had
ordered a landing to search for gold and treasure.  The fleet had been
forced to winter in the harsh southern wastes, and it was four months
before they could sail.  By then, one hundred and fifty six men had died
of starvation and cold." CR>)
	       (<VERB? EXAMINE>
		<TELL "Spillbergen ">
		<COND (<HERE? ,CAPTAINS-CABIN>
		       <TELL
"is lying half conscious in his bunk.  He ">)>
		<TELL "is a short,
florid man, normally very fat, now very thin, the skin of his
paunch hanging slackly in folds.">
		<COND (<AND <HERE? ,CAPTAINS-CABIN>
			    <FSET? ,FLAGON ,SCOREBIT>>
		       <TELL "He looks parched.">)>
		<CRLF>)
	       (<AND <VERB? FIND>
		     <SCENE? ,S-ERASMUS>
		     <NOT <HERE? ,CAPTAINS-CABIN>>>
		<TELL "He's in his cabin." CR>)
	       (<P? ASK-ABOUT * GLOBAL-WATER>
		<TELL
"\"I'm parched, Pilot!  Give me water!  You had some before!\"" CR>)
	       (<P? SHOW * SPILLBERGEN>
		<COND (<PRSO? FLAGON APPLE>
		       <TELL
"The captain reaches feebly for " THE ,PRSO "." CR>)>)
	       (<P? GIVE * SPILLBERGEN>
		<COND (<PRSO? FLAGON>
		       <FSET ,FLAGON ,OPENBIT>
		       <TELL
"Weakly, Spillbergen drinks a little water.">
		       <COND (<FSET? ,FLAGON ,SCOREBIT>
			      <TELL
"\"Thanks,\" he says.  \"Where's land -- where's land?\"|
|
\"Ahead\" is all you can say in reply." CR>
			      <RESTART-STORM?>
			      <SCORE-OBJECT ,FLAGON>)
			     (ELSE <CRLF>)>)
		      (<PRSO? APPLE>
		       <REMOVE ,APPLE>
		       <TELL
"The captain greedily devours your last apple, the pulp dripping down
his chin." CR>)>)
	       (<VERB? SOOTHE>
		<TELL
"His whining continues unabated." CR>)
	       (<VERB? HELP>
		<TELL
"He seems hungry and thirsty." CR>)
	       (<VERB? SEARCH>
		<TELL
"He squirms and whines in a futile attempt to prevent you.  You find
nothing interesting anyway." CR>)>>

<OBJECT PIETERZOON
	(LOC MATES-CABIN)
	(DESC "Pieterzoon")
	(SYNONYM PIETERZOON GUNNER)
	(FLAGS PERSON DUTCHBIT NOABIT NOTHEBIT)
	(ACTION PIETERZOON-F)>

<ROUTINE PIETERZOON-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
	        <COND (<SEND-HIM-OUT?>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SEND ,PIETERZOON ,ROOMS>
		       <RTRUE>)
		      (ELSE
		       <TELL
CTHE ,WINNER G" responds with little enthusiasm." CR>)>)
	       (<RARG? <>>
		<COND (<AND <NOT <IN? ,PIETERZOON ,HERE>>
			    <HERE? ,PIT>
			    <NOT <ABSTRACT-VERB?>>>
		       <TELL
"Pieterzoon isn't here." CR>
		       <COND (<VERB? TELL> <END-QUOTE>)
			     (ELSE <RTRUE>)>)
		      (<AND <VERB? EXAMINE>
			    <FSET? ,PIETERZOON ,DEAD>>
		       <TELL
"He looks like a boiled roast of beef." CR>)
		      (<P? SEND PIETERZOON>
		       <TELL
"\"I'm too weak, Pilot!  Go forward and send Ginsel out, or Maetsukker!  He's
always shirking his watch!\"" CR>)>)>>

<OBJECT ROPER
	(LOC PASSAGEWAY)
	(DESC "Jan Roper")
	(SYNONYM JAN ROPER CALVINIST)
	(ADJECTIVE JAN)
	(FLAGS PERSON DUTCHBIT NOABIT NOTHEBIT SCOREBIT
	       CONTBIT OPENBIT SEARCHBIT)
	(CONTFCN ROPER-F)
	(ACTION ROPER-F)>

<ROUTINE ROPER-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<NOT <SCENE? ,S-ERASMUS>>
		       <TELL "He responds with disdain." CR>)
		      (<OR <P? ACCUSE ROPER>
			   <P? TELL-ME-ABOUT APPLE>
			   <AND <P? (BE BE?) ;WHY YOU INTPP>
				<PP? ,W?IN ,PILOTS-CABIN>>>
		       <FCLEAR ,APPLE ,NDESCBIT>
		       <TELL
"\"You've been in my cabin,\" you say tiredly.|
|
\"I didn't steal anything, Pilot.  Besides, alone in the wilderness
we good Christians must share what little we have.\"  You recall how
Roper and the rest didn't conserve their food, especially the fruit
which has made your scurvy a matter of aching gums rather than lost
teeth." CR>)
		      (<HOSTILE-VERB?>
		       <TELL
"\"I'll turn the other cheek, as any good Christian would!\" says
Roper.  You remember him shooting at the priests in Chile." CR>)
		      (<P? GIVE APPLE (BLACKTHORNE ME)>
		       <TELL
"\"It's ours to share.  We ate one, shared it out, and we'll do the
same with the other, as God is my witness!\"" CR>)
		      (<SEND-HIM-OUT?>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SEND ,ROPER ,ROOMS>
		       <RTRUE>)
		      (ELSE
		       <TELL
"He responds scornfully." CR>)>)
	       (<RARG? CONTAINER>
		<COND (<P? TAKE APPLE>
		       <FCLEAR ,APPLE ,DONT-ALL>
		       <FCLEAR ,APPLE ,NDESCBIT>
		       <MOVE ,APPLE ,WINNER>
		       <TELL
"You grab Roper tightly, and twist his arm until he drops the apple
into your hands." CR>
		       <RESTART-STORM?>
		       <SCORE-OBJECT ,ROPER>)>)
	       (<VERB? WHO>
		<TELL
"Jan Roper is one of the merchant adventurers, and a fanatic
Calvinist.  He nearly killed you in Chile in his haste to fire his musket at a
priest." CR>)
	       (<VERB? EXAMINE>
		<TELL
"He's a narrow-eyed young man with a high forehead and a thin nose.">
		<COND (<HERE? ,MATES-CABIN>
		       <TELL
"His pale chin is marred by a drip of apple juice.">)>
		<CRLF>)
	       (<VERB? SEARCH>
		<COND (<NOT <SCENE? ,S-ERASMUS>>
		       <RFALSE>)
		      (<IN? ,APPLE ,ROPER>
		       <COND (<FSET? ,APPLE ,NDESCBIT>
			      <FCLEAR ,APPLE ,NDESCBIT>
			      <TELL
"Roper twists away as best he can, then pulls an apple from his
pocket.  \"Here it is!\" he screams, dancing away from you." CR>)
			     (ELSE
			      <TELL
"\"Keep away from me!  What more do you want?\" Roper whines." CR>)>)
		      (ELSE
		       <TELL
"\"What more do you want from me?  You've already stolen my apple, you
hoarder!\"" CR>)>)
	       (<P? GIVE APPLE ROPER>
		<REMOVE ,APPLE>
		<TELL
"Roper grabs the apple and stuffs it into his mouth." CR>)
	       (<HOSTILE-VERB?>
		<TELL "You ">
		<COND (<VERB? THROW>
		       <COND (<NOT <HELD? ,PRSO>>
			      <TELL "threaten to ">)>
		       <MOVE ,PRSO ,HERE>
		       <TELL "throw " THE ,PRSO " at him">)
		      (<AND ,PRSI <FSET? ,PRSI ,WEAPONBIT>>
		       <TELL "threaten him with " THE ,PRSI>)
		      (<VERB? KICK>
		       <TELL "kick at him as you would kick a dog">)
		      (ELSE
		       <TELL "raise your fists, threatening him">)>
		<TELL ", and he backs fearfully away.">
		<COND (<IN? ,APPLE ,ROPER>
		       <COND (<FSET? ,APPLE ,NDESCBIT>
			      <FCLEAR ,APPLE ,NDESCBIT>
			      <TELL
"\"It's mine, I tell you!  Share and share alike!\" he whines, pulling
an apple out of his pocket." CR>)
			     (ELSE
			      <MOVE ,APPLE ,HERE>
			      <TELL
"\"Don't hit me!\" he screams, dropping the apple on the ground." CR>
			      <SCORE-OBJECT ,ROPER>)>)
		      (ELSE <CRLF>)>)
	       (<P? SEND ROPER>
		<TELL
"He refuses to go, scornfully suggesting you get the regular crewmen on
deck instead.  He's so incompetent a seaman that you relent." CR>)>>

<OBJECT SONK
	(LOC BELOW-DECKS)
	(DESC "Sonk")
	(SYNONYM SONK COOK)
	(FLAGS NDESCBIT PERSON DUTCHBIT NOABIT NOTHEBIT)
	(ACTION SONK-F)>

<ROUTINE SONK-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL CTHE ,WINNER G" responds with little enthusiasm." CR>)>>

<OBJECT SALAMON
	(LOC BELOW-DECKS)
	(DESC "Salamon")
	(SYNONYM SALAMON MUTE)
	(FLAGS NDESCBIT PERSON DUTCHBIT NOABIT NOTHEBIT)
	(ACTION SALAMON-F)>

<ROUTINE SALAMON-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
CTHE ,WINNER " responds with gestures conveying little enthusiasm." CR>)
	       (<VERB? WHO>
		<TELL "Salamon is a mute." CR>)
	       (<HOSTILE-VERB?>
		<TELL
"In the end, you can't actually bring yourself to do it." CR>)>>

<OBJECT VAN-NEKK
	(LOC MATES-CABIN)
	(DESC "Baccus van Nekk")
	(SYNONYM BACCUS NEKK)
	(ADJECTIVE CHIEF MERCHANT BACCUS VAN)
	(FLAGS PERSON DUTCHBIT NOABIT NOTHEBIT)
	(ACTION VAN-NEKK-F)>

<ROUTINE VAN-NEKK-F ("OPT" (RARG <>))
	 <COND ;(<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? TELL-ME-ABOUT (APPLE ROPER)>
		       <TELL
"Van Nekk points angrily at Roper.  \"He took it, Pilot!  He said you
were hoarding food!\"" CR>)
		      (<P? (RAISE REPAIR LOWER) FORESAILS>
		       <RFALSE>)
		      (<SEND-HIM-OUT?>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SEND ,VAN-NEKK ,ROOMS>
		       <RTRUE>)
		      (ELSE
		       <TELL
G"The only responses are muttered curses in Dutch." CR>)>)
	       (<RARG? <>>
		<COND (<P? SEND VAN-NEKK>
		       <TELL
"\"I'd go, Pilot, but it's not my watch.  It's Vinck's watch, I think, and
Ginsel's, and Maetsukker's, if I've not gone crazed.\"  He smiles wanly." CR>)>)>>

<OBJECT CROOCQ
	(LOC BELOW-DECKS)
	(DESC "Croocq")
	(SYNONYM CROOCQ BOY)
	(ADJECTIVE MAXIMILIAN)
	(FLAGS NDESCBIT PERSON DUTCHBIT NOABIT NOTHEBIT)
	(ACTION CROOCQ-F)>

<ROUTINE CROOCQ-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? TELL-ME-ABOUT (APPLE ROPER)>
		       <TELL
"Croocq says, \"I don't know anything about it, Pilot.\"" CR>)
		      (<P? (RAISE REPAIR LOWER) FORESAILS>
		       <RFALSE>)
		      (<SEND-HIM-OUT?>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SEND ,CROOCQ ,ROOMS>
		       <RTRUE>)
		      (ELSE
		       <TELL
G"The only responses are muttered curses in Dutch." CR>)>)
	       (<VERB? TELL>
		<COND (<OR <IN? ,CROOCQ ,CAULDRON>
			   <IN? ,CROOCQ ,VILLAGE-SQUARE>>
		       <TELL
"He's in no condition to respond." CR>
		       <END-QUOTE>
		       <RFATAL>)>)
	       (<P? SEND CROOCQ>
		<TELL
"He's too far gone to go on deck; almost too tired to stand." CR>)>>

<ROUTINE SEND-HIM-OUT? ()
	 <COND (<SCENE? ,S-ERASMUS>
		<OR <VERB? REPLACE>
		    <P? FOLLOW ME>
		    <P? WALK (P?UP P?OUT)>
		    <P? (STEP-ON TAKE BOARD WALK-TO CLIMB-ON)
			(DECK BRIDGE-OF-ERASMUS ON-DECK)>>)>>

<END-SEGMENT ;"ERASMUS+YABU+PIT">
