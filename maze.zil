"MAZE for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT MAZE>

<CONSTANT MAZE-WINDOW 3>

<CONSTANT MWALL 128>

<DEFMAC MSTREET? ('VAL)
   <FORM ZERO? <FORM BAND .VAL ,MWALL>>>

<OBJECT HOUSE
	(LOC LOCAL-GLOBALS)
	(SYNONYM HOUSE HOUSES SHOP SHOPS)
	(DESC "house")
	(FLAGS NDESCBIT)
	(ACTION HOUSE-F)>

<ROUTINE HOUSE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"Houses and shops crowd the street on all sides, some dark and some
lit by oil lamps flickering through the paper panels of the shojis." CR>)
	       (<VERB? ENTER BOARD THROUGH>
		<TELL
"As you start to move off from the cortege, Mariko calls you back,
speaking in Latin.  \"No, Pilot, that is not the way.\"" CR>)>>

<OBJECT RONIN
	(SYNONYM RONIN DETACHMENT)
	(DESC "detachment of ronin")
	(FLAGS PERSON PLURAL JAPANESEBIT)
	(ACTION RONIN-F)>

<ROUTINE RONIN-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL
"The ronin take orders only from Toranaga." CR>
		<END-QUOTE>)>>

<OBJECT FISH-GATE
	(SYNONYM GATE FISH)
	(ADJECTIVE BATTERED ETCHED)
	(DESC "gate")
	(FLAGS NDESCBIT SCOREBIT)
	(ACTION FISH-GATE-F)>

<ROUTINE FISH-GATE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's just a weathered old gate with a fish carved on it." CR>)>>

<OBJECT AMBUSHERS
	(SYNONYM AMBUSHER BOWMAN FIGURE SHAPE
	 	 AMBUSHERS BOWMEN FIGURES SHAPES)
	(ADJECTIVE SHADOWY DIM)
	(DESC "dim figures")
	(FLAGS PERSON JAPANESEBIT PLURAL)
	(DESCFCN AMBUSHERS-DESC)
	(ACTION AMBUSHERS-F)>

<ROUTINE AMBUSHERS-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"Dim figures can be seen on one of the tiled roofs of a nearby house.">)>>

<ROUTINE AMBUSHERS-F ("OPT" RARG)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL G"There is no response." CR>)
	       (<VERB? EXAMINE>
		<TELL
"From here, in the dark, they are merely dim dark outlines." CR>)>>

<OBJECT MESSENGER
	(SYNONYM MESSENGER MAN SAMURAI GRAY)
	(ADJECTIVE GRAY)
	(DESC "messenger")
	(FLAGS PERSON JAPANESEBIT INVISIBLE SCOREBIT)
	(GENERIC GENERIC-MAN-F)
	(ACTION MESSENGER-F)>

<ROUTINE MESSENGER-F ("OPT" (RARG <>))
	 <COND (<AND <IN? ,MESSENGER ,LOCAL-GLOBALS>
		     <NOT <PASSIVE-VERB?>>>
		<TELL "He's gone!" CR>)
	       (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<OR <VERB? STOP>
		    <HOSTILE-VERB?>>
		<COND (<FSET? ,MESSENGER ,DEAD>
		       <TELL "Buntaro hacked him to pieces." CR>)
		      (<NOT <FSET? ,MESSENGER ,RMUNGBIT>>
		       <FSET ,MESSENGER ,RMUNGBIT>
		       <TELL
"You stretch to intercept the man, grabbing and nearly tackling him, and he
tumbles to the ground." CR>)
		      (ELSE
		       <TELL
"Desperately you struggle with the messenger and manage to knock him down
a second time." CR>
		       <SCORE-OBJECT ,MESSENGER>)>)>>

<ROOM AMBUSH-SITE
      (LOC ROOMS)
      (DESC "City Street")
      (LDESC
"This is a dark, deserted street in the middle of Osaka.")
      (SYNONYM STREET)
      (ADJECTIVE CITY)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL MESSENGER)
      (ACTION AMBUSH-SITE-F)>

<ROUTINE AMBUSH-SITE-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<VERB? WALK>
		       <TELL
"You are pinned down by the attack.  To run would be suicidal!" CR>)
		      (<AND <P? (PUSH TAKE HELP PULL-BEHIND) MARIKO>
			    <FSET? ,MARIKOS-LITTER ,SCOREBIT>>
		       <B-LIE-DOWN>
		       <TELL
"You roll for cover, taking Mariko with you into the lee of the tumbled
litter." CR>
		       <SCORE-OBJECT ,MARIKOS-LITTER>)
		      (<AND <OR <VERB? DODGE>
				<P? (HIDE-BEHIND HIDE-UNDER) MARIKOS-LITTER>>
			    <FSET? ,MARIKOS-LITTER ,SCOREBIT>>
		       <B-LIE-DOWN>
		       <TELL
"You roll for cover into the lee of the tumbled litter." CR>)>)>>

<GLOBAL AMBUSH-PROB 2>

<GLOBAL XAMBUSH 0>
<GLOBAL YAMBUSH 0>

<ROUTINE I-AMBUSH-START ()
	 <COND (<OR <G? ,AMBUSH-PROB 100>
		    <PROB ,AMBUSH-PROB>>
		<SETG XAMBUSH ,X>
		<SETG YAMBUSH ,Y>
		<MOVE-ALL ,MAZE ,AMBUSH-SITE>
		<COND (<IN? ,BLACKTHORNE ,MARIKOS-LITTER>
		       <MOVE ,MARIKOS-LITTER ,MAZE>)
		      (ELSE
		       <MOVE ,BLACKTHORNE ,MAZE>)>
		<MOVE ,AMBUSHERS ,AMBUSH-SITE>
		<QUEUE I-AMBUSH -1>
		<TELL CR
"The arrows come out of the night, the first impaling the captain
through the throat.  His lungs fill with molten fire and death
swallows him.  His last thought is one of wonder, for did not Lord
Kiyama, his master, tell him the ambush was to be later, beside
the wharves, and directed at the pirate?" CR CR>
		<GOTO ,AMBUSH-SITE>)
	       (ELSE
		<QUEUE I-AMBUSH-START 5>
		<SETG AMBUSH-PROB <+ ,AMBUSH-PROB 6>>
		<RFALSE>)>>

<ROUTINE I-AMBUSH ()
	 <ZLINES ,AMBUSH-CNT
		 (<TELL CR
"An arrow slams into the litter post an inch from your head!  Two
arrows pierce the curtains of Kiritsubo's litter, and another strikes
one of the maids in the waist.  As she screams, the litter bearers
take to their heels into the darkness.  Mariko ">
		  <COND (<FSET? ,MARIKOS-LITTER ,SCOREBIT>
			 <TELL "stands in the open">)
			(ELSE
			 <TELL "clings to you">)>
		  <TELL ",
staring in shock at the dying maid." CR>)
		 (<TELL CR
"A shower of arrows straddles both litters.">
		  <COND (<FSET? ,MARIKOS-LITTER ,SCOREBIT>
			 <FSET ,MARIKO ,DEAD>
			 <TELL
" One strikes Mariko in the back as she starts to run for cover.  She
falls to the ground and is still." CR>
			 <FAILED-SCENE>)
			(ELSE
			 <TELL
" One thuds into the ground where Mariko was an instant ago." CR>)>)
		 (<MOVE ,TORANAGA ,HERE>
		  <REMOVE ,TORANAGA-IN-DRAG>
		  <FSET ,CURTAINS ,OPENBIT>
		  <MARGINAL-PIC ,P-IN-DRAG T ,P-IN-DRAG-CORNER T>
		  <TELL CR
"Buntaro shields Toranaga's litter with his body as best he can, then
whips open the curtains.  Two arrows are imbedded in Toranaga's chest and
side,
and he jerks them out of the armor he wears beneath the kimono.  He
fights his way out of the litter and stands in the street, sword
drawn, an incongruous figure in kimono and hat." CR>)
		 (<REMOVE ,AMBUSHERS>
		  <TELL CR
"Another volley of arrows comes out of the darkness, one missing you
so narrowly that it takes skin off of your cheek, and then all is silent.|
|
Buntaro and some of his men are near the wall in pursuit but the
ambushers vanish into the blackness.  A dozen men race in pursuit but
all know it's hopeless." CR>)
		 (<MOVE ,MESSENGER ,HERE>
		  <FCLEAR ,MESSENGER ,INVISIBLE>
		  <THIS-IS-IT ,MESSENGER>
		  <SETG OPPONENT ,MESSENGER>
		  <TELL CR
"One of the officer Grays says, \"Toranaga!\" and though it is said
quietly, everyone hears.  Here, incredibly, is the enemy of his
master, free, outside the castle walls.  \"You will wait here, Lord
Toranaga.  You,\" he snaps at one of his men, \"report to Lord Ishido
at once!\"  The man races toward you, heading back toward the castle!" CR>)
		 (DELAY
		  <COND (<FSET? ,MESSENGER ,SCOREBIT>
			 <COND (<AND <FSET? ,MESSENGER ,RMUNGBIT>
				     <NOT <FSET? ,MESSENGER ,SURFACEBIT>>>
				<FSET ,MESSENGER ,SURFACEBIT>
				<TELL CR
"Immediately he rolls and is on his feet again!" CR>)
			       (ELSE
				<MOVE ,MESSENGER ,LOCAL-GLOBALS>
				<FCLEAR ,MESSENGER ,SCOREBIT>
				<TELL CR
"This time the messenger scuttles away from you and is off like a hare
chased by hounds." CR>)>
			 <RTRUE>)
			(<AND <NOT <IN? ,MESSENGER ,LOCAL-GLOBALS>>
			      <NOT <FSET? ,MESSENGER ,DEAD>>>
			 <FSET ,MESSENGER ,DEAD>
			 <TELL CR
"This time Buntaro, with a vicious chop of his sword, cuts the man down." CR>
			 <RTRUE>)>)
		 (<REPLACE-SYNONYM ,CORTEGE ,W?GRAYS ,W?BROWNS>
		  <MOVE ,GRAYS ,HERE>
		  <THIS-IS-IT ,GRAYS>
		  <TELL CR
"The rest of the Grays attack, trying to reach Toranaga.  One officer
whips out his two-handed sword and leaps for Toranaga but Buntaro
parries.  The Browns and Grays, all intermixed, erupt into a swirling
melee.|
|
The Grays fight courageously.  Four join in a suicidal charge at
Toranaga.  The Browns break it and the Grays regroup and charge
again.  Then a senior officer orders three to retreat for help and the
rest to guard the retreat." CR>)
		 (<DEQUEUE I-AMBUSH>
		  <COND (<FSET? ,MESSENGER ,DEAD> <REMOVE ,MESSENGER>)
			(ELSE <QUEUE I-CAUGHT 150>)>
		  <REMOVE ,GRAYS>
		  <MOVE-ALL ,AMBUSH-SITE ,MAZE>
		  <MOVE ,BLACKTHORNE ,AMBUSH-SITE>
		  <TELL CR
"The three Grays tear off, and though Buntaro kills one, the other two
are only wounded.  The rest die." CR CR>
		  <GOTO ,MAZE>)>>

<ROUTINE I-CAUGHT ()
	 <COND (<HERE? MAZE>
		<LEAVE-MAZE>
		<TELL CR
"Ahead of you, a mass of Gray archers materializes out of the night.  Above,
a mass of fireworks blooms in warning from the castle.  Toranaga turns,
ordering the cortege to retreat down an alley, but there are Grays there
too.  The party is surrounded!" CR>
		<JIGS-UP>
		<RFATAL>)>>

<ROOM MAZE
      (LOC ROOMS)
      (SYNONYM STREETS)
      (ADJECTIVE CITY)
      (DESC "City Streets")
      (FLAGS OUTSIDE ONBIT)
      (GLOBAL HOUSE)
      (MOUSE MAZE-MOUSE-F)
      (ACTION MAZE-F)>

<ROUTINE MAZE-F (RARG "AUX" XX YY OXX OYY)
	 <COND (<RARG? LOOK>
		<TELL
"This maze of streets and alleys extends from the great castle to the
harbor.  At night, it is a nightmare of blind alleys, twisting overhung
streets, and shadowy hurrying shapes." CR>)
	       (<RARG? ENTER>
		<PICSET ,MAZE-PICS>
		<COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		       <MOVE-ALL ,CITY ,MAZE>
		       <TELL
"The cortege continues through the winding, curling city streets,
the pedestrians bowing and the very poor on their knees until you
pass." CR CR>
		       <QUEUE I-AMBUSH-START 5>
		       <TELL "[Building Osaka.]" CR CR>
		       <BUILDMAZE>)>
		<COND (<EQUAL? ,OHERE ,WAREHOUSE>
		       <SET XX ,XGOAL>
		       <SET YY ,YGOAL>
		       <TELL
"You have returned to the"G" maze of back streets and alleys." CR>)
		      (<EQUAL? ,OHERE ,AMBUSH-SITE>
		       <SET XX ,XAMBUSH>
		       <SET YY ,YAMBUSH>
		       <TELL
"The cortege re-forms and prepares to continue the escape.  The urgency is
now great, as the escaped grays will spread the alarm." CR>)
		      (ELSE
		       <SET XX ,XSTART>
		       <SET YY ,YSTART>
		       <TELL
"You have entered a"G" maze of back streets and alleys." CR>)>
		<CRLF>
		<TYPE-ANY-KEY>
		<DISPLAY-MAZE>
		<MAZE-MOVE .XX .YY>
		<RTRUE>)
	       (<RARG? LEAVE>
		<LEAVE-MAZE>)
	       (<RARG? BEG>
		<COND (<VERB? DEFINE>
		       <CLEAR ,MAZE-WINDOW>
		       <RFALSE>)
		      (<VERB? WALK>
		       <REPEAT ((MOVED? <>))
			  <SET XX ,X>
			  <SET YY ,Y>
			  <SET OXX ,X>
			  <SET OYY ,Y>
			  <COND (<AND <EQUAL? ,P-WALK-DIR ,P?NORTH>
				      <G? .YY 0>>
				 <SET YY <- .YY 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?EAST>
				      <L? .XX <- ,MAZE-WIDTH 1>>>
				 <SET XX <+ .XX 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?WEST>
				      <G? .XX 0>>
				 <SET XX <- .XX 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?SOUTH>
				      <L? .YY <- ,MAZE-HEIGHT 1>>>
				 <SET YY <+ .YY 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?NE>
				      <L? .XX <- ,MAZE-WIDTH 1>>
				      <G? .YY 0>>
				 <SET XX <+ .XX 1>>
				 <SET YY <- .YY 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?SE>
				      <L? .XX <- ,MAZE-WIDTH 1>>
				      <L? .YY <- ,MAZE-HEIGHT 1>>>
				 <SET XX <+ .XX 1>>
				 <SET YY <+ .YY 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?SW>
				      <G? .XX 0>
				      <L? .YY <- ,MAZE-HEIGHT 1>>>
				 <SET XX <- .XX 1>>
				 <SET YY <+ .YY 1>>)
				(<AND <EQUAL? ,P-WALK-DIR ,P?NW>
				      <G? .XX 0>
				      <G? .YY 0>>
				 <SET XX <- .XX 1>>
				 <SET YY <- .YY 1>>)
				(ELSE
				 <TELL "You can't go that way." CR>
				 <RTRUE>)>
			  <COND (<AND <EQUAL? .XX ,XSTART>
				      <EQUAL? .YY ,YSTART>>
				 <GOTO ,CITY>
				 <RTRUE>)
				(<AND <EQUAL? .XX ,XGOAL>
				      <EQUAL? .YY ,YGOAL>>
				 <GOTO ,WAREHOUSE>
				 <RTRUE>)
				(<AND <MSTREET? <MGETB .XX .YY>>
				      <OR <EQUAL? .XX .OXX>
					  <EQUAL? .YY .OYY>
					  <MSTREET? <MGETB .XX .OYY>>
					  <MSTREET? <MGETB .OXX .YY>>>>
				 <MAZE-MOVE .XX .YY>
				 <COND (<AND <EQUAL? .XX ,XFISH>
					     <EQUAL? .YY ,YFISH>
					     <NOT <LOC ,FISH-GATE>>>
					<MOVE ,FISH-GATE ,HERE>
					<COND (<FSET? ,FISH-GATE ,SCOREBIT>
					       <MOVE ,RONIN ,HERE>
					       <SCORE-OBJECT ,FISH-GATE>
					       <TELL
G"You make your way through the deserted streets.">
					       <TELL
" Toranaga stops the cortege outside a battered gate.  A fish is etched
into its timbers.  He knocks in code.  The door opens at once, and an
ill-kempt samurai bows.  \"Bring your men and follow me,\" Toranaga
says.  Fifteen men, dressed as "I"ronin"" follow him and slip into
place as advance and rear guard.  Others spread the alarm to other
secret cadres.  Soon there are fifty troops with you and a hundred
guarding your flanks." CR>)>)
				       (<AND <EQUAL? .OXX ,XFISH>
					     <EQUAL? .OYY ,YFISH>>
					<REMOVE ,FISH-GATE>)>
				 <COND (<EQUAL? ,P-WALK-DIR ,P?NORTH ,P?SOUTH>
					<COND (<OR <MSTREET?
						    <MGETB <- .XX 1> .YY>>
						   <MSTREET?
						    <MGETB <+ .XX 1> .YY>>>
					       <RETURN>)
					      (ELSE
					       <SET MOVED? T>)>)
				       (<EQUAL? ,P-WALK-DIR ,P?EAST ,P?WEST>
					<COND (<OR <MSTREET?
						    <MGETB .XX <- .YY 1>>>
						   <MSTREET?
						    <MGETB .XX <+ .YY 1>>>>
					       <RETURN>)
					      (ELSE
					       <SET MOVED? T>)>)>)
				(.MOVED? <RETURN>)
				(ELSE
				 <TELL "There's a house there." CR>
				 <RTRUE>)>>
		       <TELL
G"You make your way through the deserted streets." CR>)
		      (<AND <VERB? DROP>
			    <IN? ,WINNER ,MAZE>>
		       <COND (<IDROP>
			      <REMOVE ,PRSO>
			      <TELL
CTHE ,PRSO " drops to the ground and is lost from sight in the dark and
confusion." CR>)
			     (ELSE <RTRUE>)>)>)>>

<ROUTINE LEAVE-MAZE ("AUX" YY)
	 <SET YY <+ <WINGET ,S-TEXT ,WYPOS> <WINGET ,S-TEXT ,WTOP>>>
	 <SETUP-TEXT-AND-STATUS>
	 <SCREEN ,S-TEXT>
	 <CURSET <- .YY <WINGET ,S-TEXT ,WTOP>> 1>>

<CONSTANT MAZE-PICS
	  <TABLE P-MAZE-WALL
		 P-MAZE-STREET
		 P-MAZE-PARTY
		 P-MAZE-CASTLE
		 P-MAZE-DOCK
		 P-MAZE-FISH
		 P-MAZE-BACKGROUND
		 0>>

<ROUTINE MAZE-MOUSE-F (TRM "AUX" (DIR <>) WX WY
		       (BX <GET ,MAZE-BOX-TBL 1>) (BY <GET ,MAZE-BOX-TBL 0>))
	 <SET WY
	      <+ <WINGET ,MAZE-WINDOW ,WTOP>
		 ,YOFFSET
		 <* ,Y .BY>
		 </ .BY 2>>>
	 <SET WX
	      <+ <WINGET ,MAZE-WINDOW ,WLEFT>
		 ,XOFFSET
		 <* ,X .BX>
		 </ .BX 2>>>
	 <SET WY <- ,MOUSE-LOC-Y .WY>>
	 <SET WX <- ,MOUSE-LOC-X .WX>>
	 <COND (<G=? .WX 0> ;"right side"
		<COND (<L? .WY 0> ;"top right"
		       <SET WY <- .WY>>
		       <COND (<G? .WX <* .WY 3>>
			      <SET DIR ,EAST-STR>)
			     (<G? .WY <* .WX 3>>
			      <SET DIR ,NORTH-STR>)
			     (ELSE
			      <SET DIR ,NE-STR>)>)
		      (ELSE ;"bottom right"
		       <COND (<G? .WX <* .WY 3>>
			      <SET DIR ,EAST-STR>)
			     (<G? .WY <* .WX 3>>
			      <SET DIR ,SOUTH-STR>)
			     (ELSE
			      <SET DIR ,SE-STR>)>)>)
	       (<L? .WY 0> ;"top left"
		<SET WY <- .WY>>
		<SET WX <- .WX>>
		<COND (<G? .WX <* .WY 3>>
		       <SET DIR ,WEST-STR>)
		      (<G? .WY <* .WX 3>>
		       <SET DIR ,NORTH-STR>)
		      (ELSE
		       <SET DIR ,NW-STR>)>)
	       (ELSE ;"bottom left"
		<SET WX <- .WX>>
		<COND (<G? .WX <* .WY 3>>
		       <SET DIR ,WEST-STR>)
		      (<G? .WY <* .WX 3>>
		       <SET DIR ,SOUTH-STR>)
		      (ELSE
		       <SET DIR ,SW-STR>)>)>
	 <COND (<AND <L=? .WX </ .BX 2>> <L=? .WY </ .BY 2>>>
		<RFALSE>)
	       (.DIR
		<ADD-TO-INPUT .DIR 13>
		<RETURN 13>)
	       (ELSE
		<RFALSE>)>>

<CONSTANT NORTH-STR <LTABLE (PURE STRING) "north">>
<CONSTANT SOUTH-STR <LTABLE (PURE STRING) "south">>
<CONSTANT EAST-STR <LTABLE (PURE STRING) "east">>
<CONSTANT WEST-STR <LTABLE (PURE STRING) "west">>
<CONSTANT SE-STR <LTABLE (PURE STRING) "se">>
<CONSTANT SW-STR <LTABLE (PURE STRING) "sw">>
<CONSTANT NE-STR <LTABLE (PURE STRING) "ne">>
<CONSTANT NW-STR <LTABLE (PURE STRING) "nw">>

<CONSTANT MAZE-BOX-TBL <TABLE 0 0>>

"Mechanics of building and displaying maze."

<ROUTINE MGETB (X Y)
	 <GETB ,MAZE-MAP <+ <* .Y ,MAZE-WIDTH> .X>>>

<ROUTINE MPUTB (X Y VAL)
	 <PUTB ,MAZE-MAP <+ <* .Y ,MAZE-WIDTH> .X> .VAL>>

<GLOBAL YOFFSET 0>
<GLOBAL XOFFSET 0>

<ROUTINE DISPLAY-MAZE-PIC (VAL Y X "AUX" BY BX OY OX)
	 <COND (<NOT <ZERO? .VAL>> ;<EQUAL? .VAL ;!\#>
		<SET BY <GET ,MAZE-BOX-TBL 0>>
		<SET BX <GET ,MAZE-BOX-TBL 1>>
		<DISPLAY .VAL ;<MAZE-PIC .VAL>
			 <+ 1 ,YOFFSET <* .Y .BY>>
			 <+ 1 ,XOFFSET <* .X .BX>>>)>>

;<ROUTINE MAZE-PIC (VAL)
	 <COND (<EQUAL? .VAL !\B> ,P-MAZE-PARTY)
	       (<EQUAL? .VAL !\*> ,P-MAZE-WALL)
	       (<EQUAL? .VAL !\ > ,P-MAZE-STREET)
	       (<EQUAL? .VAL !\C> ,P-MAZE-CASTLE)
	       (<EQUAL? .VAL !\D> ,P-MAZE-DOCK)
	       (<EQUAL? .VAL !\F> ,P-MAZE-FISH)>>

<ROUTINE MAZE-MOVE (X Y)
	 <SCREEN ,MAZE-WINDOW>
	 <SETG X .X>
	 <SETG Y .Y>
	 <MPUTC <- .X 1> <- .Y 1>>
	 <MPUTC .X <- .Y 1>>
	 <MPUTC <+ .X 1> <- .Y 1>>
	 <MPUTC <- .X 1> .Y>
	 <MPUTC <+ .X 1> .Y>
	 <MPUTC <- .X 1> <+ .Y 1>>
	 <MPUTC .X <+ .Y 1>>
	 <MPUTC <+ .X 1> <+ .Y 1>>
	 <MPUTC .X .Y ,P-MAZE-PARTY ;!\B>
	 <SCREEN ,S-TEXT>>

<ROUTINE MPUTC (X Y "OPT" (VAL <>) "AUX" OVAL)
	 <COND (<VALID .X .Y>
		<SET OVAL <MGETB .X .Y>>
		<COND (<NOT .VAL>
		       <SET VAL .OVAL>
		       <COND (<MSTREET? .VAL>
			      <COND (<AND <EQUAL? .X ,XSTART>
					  <EQUAL? .Y ,YSTART>>
				     <SET VAL ,P-MAZE-CASTLE ;!\C>)
				    (<AND <EQUAL? .X ,XGOAL>
					  <EQUAL? .Y ,YGOAL>>
				     <SET VAL ,P-MAZE-DOCK ;!\D>)
				    (<AND <EQUAL? .X ,XFISH>
					  <EQUAL? .Y ,YFISH>>
				     <SET VAL ,P-MAZE-FISH ;!\F>)
				    (ELSE <SET VAL ,P-MAZE-STREET ;!\ >)>)
			     (ELSE
			      <SET VAL ,P-MAZE-WALL ;!\*>)>)>
		<SET VAL <BOR .VAL <BAND .OVAL ,MWALL>>>
		<COND (<NOT <EQUAL? .VAL .OVAL>>
		       <MPUTB .X .Y .VAL>
		       <DISPLAY-MAZE-PIC <BAND .VAL 127> .Y .X>)>)>>

<ROUTINE DISPLAY-MAZE ("AUX" Y BY BX MH TH SH)
	 <RESET-MARGIN>
	 <CLEAR ,S-TEXT>
	 <PICINF ,P-MAZE-BACKGROUND ,YX-TBL>
	 <SET SH <WINGET ,S-STATUS ,WHIGH>>
	 <WINDEF ,MAZE-WINDOW
		 <SET Y <+ <WINGET ,S-STATUS ,WTOP> .SH>>
		 <WINGET ,S-TEXT ,WLEFT>
		 <SET MH <GET ,YX-TBL 0>>
		 <GET ,YX-TBL 1>>
	 <SET TH <- <WINGET ,S-FULL ,WHIGH> .SH>>
	 <WINDEF ,S-TEXT
		 <+ .Y .MH> <WINGET ,S-TEXT ,WLEFT>
		 <- .TH .MH> <WINGET ,S-TEXT ,WWIDE>>
	 <CLEAR ,S-TEXT>
	 <SCREEN ,MAZE-WINDOW>
	 <PICINF ,P-MAZE-BOX ,MAZE-BOX-TBL>
	 <SET BY <GET ,MAZE-BOX-TBL 0>>
	 <SET BX <GET ,MAZE-BOX-TBL 1>>
	 <SETG YOFFSET
	       </ <- <WINGET ,MAZE-WINDOW ,WHIGH>
		     <* ,MAZE-HEIGHT .BY>>
		  2>>
	 <SETG XOFFSET
	       </ <- <WINGET ,MAZE-WINDOW ,WWIDE>
		     <* ,MAZE-WIDTH .BX>>
		  2>>
	 <PRINTM>
	 <SCREEN ,S-TEXT>>

<ROUTINE PRINTM ("AUX" M (OFFS 0))
	 <DISPLAY ,P-MAZE-BACKGROUND 1 1>
	 <FOR ((Y 0) <L? .Y ,MAZE-HEIGHT> <SET Y <+ .Y 1>>)
	      <FOR ((X 0) <L? .X ,MAZE-WIDTH> <SET X <+ .X 1>>)
		   <DISPLAY-MAZE-PIC <SET M <BAND <GETB ,MAZE-MAP .OFFS> 127>>
				     .Y .X>
		   <SET OFFS <+ .OFFS 1>>>>>

<CONSTANT MAZE-WIDTH 37>
<CONSTANT MAZE-HEIGHT 17>
<GLOBAL SIZE 0>
<GLOBAL PMAX 0>
<GLOBAL MAZE-MAP <ITABLE <* ,MAZE-WIDTH ,MAZE-HEIGHT> (BYTE) 128>>

<CONSTANT DIR
	  <TABLE <TABLE (BYTE) 0 1 2 3> <TABLE (BYTE) 0 1 3 2>
		 <TABLE (BYTE) 0 2 1 3> <TABLE (BYTE) 0 2 3 1>
		 <TABLE (BYTE) 0 3 1 2> <TABLE (BYTE) 0 3 2 1>
		 <TABLE (BYTE) 1 0 2 3> <TABLE (BYTE) 1 0 3 2>
		 <TABLE (BYTE) 1 2 0 3> <TABLE (BYTE) 1 2 3 0>
		 <TABLE (BYTE) 1 3 0 2> <TABLE (BYTE) 1 3 2 0>
		 <TABLE (BYTE) 2 0 1 3> <TABLE (BYTE) 2 0 3 1>
		 <TABLE (BYTE) 2 1 0 3> <TABLE (BYTE) 2 1 3 0>
		 <TABLE (BYTE) 2 3 0 1> <TABLE (BYTE) 2 3 1 0>
		 <TABLE (BYTE) 3 0 1 2> <TABLE (BYTE) 3 0 2 1>
		 <TABLE (BYTE) 3 1 0 2> <TABLE (BYTE) 3 1 2 0>
		 <TABLE (BYTE) 3 2 0 1> <TABLE (BYTE) 3 2 1 0>>>

<CONSTANT XOFF1 <TABLE 0 0 1 -1>>
<CONSTANT YOFF1 <TABLE -1 1 0 0>>
<CONSTANT XOFF2 <TABLE 0 0 2 -2>>
<CONSTANT YOFF2 <TABLE -2 2 0 0>>

<GLOBAL X 0>
<GLOBAL Y 0>
<GLOBAL XSTART 0>
<GLOBAL YSTART 0>
<GLOBAL XGOAL 0>
<GLOBAL YGOAL 0>
<GLOBAL LEN 0>
<GLOBAL LMAX 0>
<GLOBAL FLEN 0>
<GLOBAL XFISH 0>
<GLOBAL YFISH 0>

<ROUTINE BUILDMAZE ("AUX" LEFT PLEN D)
	 <SETG SIZE <* </ ,MAZE-WIDTH 2> </ ,MAZE-HEIGHT 2>>>
	 <SETG PMAX ,SIZE>
	 <SET LEFT ,SIZE>
	 <SETG FLEN <+ 10 <RANDOM 5>>>
	 <FOR ((YY 0) <L? .YY ,MAZE-HEIGHT> <SET YY <+ .YY 1>>)
	      <FOR ((XX 0) <L? .XX ,MAZE-WIDTH> <SET XX <+ .XX 1>>)
		   <MPUTB .XX .YY ,MWALL>>>
	 <FOR ((YY 1) <L? .YY ,MAZE-HEIGHT> <SET YY <+ .YY 2>>)
	      <FOR ((XX 1) <L? .XX ,MAZE-WIDTH> <SET XX <+ .XX 2>>)
		   <MPUTB .XX .YY 0>>>
	 <SETG XGOAL <- ,MAZE-WIDTH 2>
		    ;<+ <* <RANDOM <- </ ,MAZE-WIDTH 2> 1>> 2> 1>>
	 <SETG XSTART ,XGOAL>
	 <SETG X ,XGOAL>
	 <SETG YGOAL <+ <* <RANDOM <- </ ,MAZE-HEIGHT 2> 1>> 2> 1>>
	 <SETG YSTART ,YGOAL>
	 <SETG Y ,YGOAL>
	 <MPUTB ,X ,Y 1>
	 <SETG LEN 1>
	 <SETG LMAX 1>
	 <FOR ((PLEN 0) <G? <SET LEFT <- .LEFT 1>> 0> <SET PLEN <+ .PLEN 1>>)
	      <REPEAT ()
		      <COND (<OR <ZERO? <MGETB ,X ,Y>>
				 <G=? .PLEN ,PMAX>
				 <L? <SET D <FINDMOVE ,X ,Y>> 0>>
			     <BACKUP>
			     <SET PLEN 0>)
			    (ELSE <RETURN>)>>
	      <REMOVEWALL .D>>
	 <FOR ((YY 1) <L? .YY ,MAZE-HEIGHT> <SET YY <+ .YY 2>>)
	      <FOR ((XX 1) <L? .XX ,MAZE-WIDTH> <SET XX <+ .XX 2>>)
		   <MPUTB .XX .YY 0>>>
	 <FOR ((XX 0) <L? .XX ,MAZE-WIDTH> <SET XX <+ .XX 1>>)
	      <MPUTB .XX 0 ,MWALL>
	      <MPUTB .XX <- ,MAZE-HEIGHT 1> ,MWALL>>
	 <FOR ((YY 1) <L? .YY <- ,MAZE-HEIGHT 1>> <SET YY <+ .YY 1>>)
	      <MPUTB 0 .YY ,MWALL>
	      <MPUTB <- ,MAZE-WIDTH 1> .YY ,MWALL>>
	 <SETG XGOAL <+ ,XGOAL 1>>
	 ;<REPEAT ()
		 <SETG XFISH <RANDOM ,MAZE-WIDTH>>
		 <SETG YFISH <RANDOM ,MAZE-HEIGHT>>
		 <COND (<ZERO? <BAND <MGETB ,XFISH ,YFISH> ,MWALL>>
			<RETURN>)>>
	 <MPUTB ,XGOAL ,YGOAL 0> ;"make the exit">

<ROUTINE VISITED (XLOC YLOC)
	 <COND (<NOT <VALID .XLOC .YLOC>>)
	       (<N==? <MGETB .XLOC .YLOC> 0>)>>

<ROUTINE VALID (XLOC YLOC)
	 <COND (<OR <L? .XLOC 0> <G=? .XLOC ,MAZE-WIDTH>
		    <L? .YLOC 0> <G=? .YLOC ,MAZE-HEIGHT>>
		<>)
	       (ELSE T)>>

<ROUTINE FINDMOVE (XLOC YLOC "AUX" (DV <RANDOM 23>) D I)
	 <FOR ((I 0) <L? .I 4> <SET I <+ .I 1>>)
	      <SET D <GETB <GET ,DIR .DV> .I>>
	      <COND (<NOT <VISITED <+ .XLOC <GET ,XOFF2 .D>>
				   <+ .YLOC <GET ,YOFF2 .D>>>>
		     <RETURN .D>)
		    (ELSE <SET D -1>)>>
	 .D>

<ROUTINE BACKUP ("AUX" D XX YY)
	 <SETG LEN <- ,LEN 1>>
	 <FOR ((D 0) <L? .D 4> <SET D <+ .D 1>>)
	      <SET XX <+ ,X <GET ,XOFF2 .D>>>
	      <SET YY <+ ,Y <GET ,YOFF2 .D>>>
	      <COND (<AND <VALID .XX .YY>
			  <==? <MGETB .XX .YY> ,LEN>>
		     <RETURN>)>>
	 <SETG X .XX>
	 <SETG Y .YY>
	 <RTRUE>>

<ROUTINE REMOVEWALL (D)
	 <MPUTB <+ ,X <GET ,XOFF1 .D>>
		<+ ,Y <GET ,YOFF1 .D>>
		0>
	 <SETG LEN <+ <MGETB ,X ,Y> 1>>
	 <SETG X <+ ,X <GET ,XOFF2 .D>>>
	 <SETG Y <+ ,Y <GET ,YOFF2 .D>>>
	 <MPUTB ,X ,Y ,LEN>
	 <COND (<EQUAL? ,LEN ,FLEN>
		<SETG XFISH ,X>
		<SETG YFISH ,Y>)>
	 <COND (<G? ,LEN ,LMAX>
		<SETG LMAX ,LEN>
		<SETG XSTART ,X>
		<SETG YSTART ,Y>)>
	 <RTRUE>>

<END-SEGMENT>
