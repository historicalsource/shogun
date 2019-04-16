"VERBS for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT 0>

<CONSTANT J-SHOOT-FRIEND 255>

<DEFMAC B-NOT-STANDING? ()
	'<FSET? ,BLACKTHORNE ,SITTING>>

<DEFMAC B-STANDING? ()
	'<NOT <FSET? ,BLACKTHORNE ,SITTING>>>

;<GLOBAL LOAD-MAX 150>
<GLOBAL LOAD-ALLOWED 150>

;"stuff to try to save space"

<GLOBAL PERIOD		".|">
<GLOBAL I-DONT-THINK-THAT "I don't think that ">
<GLOBAL IT-LOOKS-LIKE	"It looks like ">
<GLOBAL IT-IS-ALREADY	"It's already ">
<GLOBAL TOO-DARK	"It's too dark to see!|">
<GLOBAL NOTHING-HAPPENS "Nothing happens.|">
<GLOBAL GOOD-TRICK	"That would be a good trick.|">
<GLOBAL WASTE-OF-TIME	"That would be a waste of time.|">
<GLOBAL THERE-IS-NOTHING "There is nothing ">
<GLOBAL NO-ROOM		"There's no room.">
<GLOBAL THERES-NOTHING-TO "There's nothing to ">
<GLOBAL YOU-ARE		"You already are">
<GLOBAL YOU-HAVE	"You already have ">
<GLOBAL YOU-ARE-NOW	"You are now ">
<GLOBAL YOU-CANT	"You can't ">
<GLOBAL YOU-FIND-NOTHING "You find nothing">
<GLOBAL YOU-HAVE-TO	"You'll have to ">

;<ROUTINE DONT-HAVE-THAT ()
	 <TELL ,YOU-DONT-HAVE "that" ,PERIOD>>

<ROUTINE YOULL-HAVE-TO (STR)
	 <TELL ,YOU-HAVE-TO .STR " first!" CR>>

<ROUTINE TO-A-PRSO? ()
	 <HOW-DO-YOU> <A-PRSO?>>

<ROUTINE CANT-GO ()
	 <TELL ,YOU-CANT "go that way." CR>>

<ROUTINE NOT-HOLDING (OBJ)
	 <THIS-IS-IT .OBJ>
	 <TELL G"You aren't ""holding " THE .OBJ ,PERIOD>>

<ROUTINE ITS-EMPTY ()
	 <TELL CTHE ,PRSO " is empty" ,PERIOD>>

<ROUTINE ITS-ALREADY-X (X)
	 <TELL CTHE ,PRSO " is already " .X ,PERIOD>>

<ROUTINE ALREADY-OPEN ()
	 <ITS-ALREADY-X "open">>

<ROUTINE ALREADY-CLOSED ()
	 <ITS-ALREADY-X "closed">>

<ROUTINE WITH-PRSI? ()
	 <TELL "With "><A-PRSI?>>

<ROUTINE TELL-OPEN-CLOSED ("OPTIONAL" (OBJ <>))
	 <COND (.OBJ <TELL CTHE .OBJ>)
	       (ELSE
		<SET OBJ ,PRSO>
		<TELL THE ,PRSO>)>
	 <TELL IS/ARE .OBJ " ">
	 <OPEN-CLOSED .OBJ>>

<ROUTINE OPEN-CLOSED (OBJ)
	 <COND (<FSET? .OBJ ,OPENBIT>
		<TELL "open">)
	       (ELSE
		<TELL "closed">)>
	 <TELL ,PERIOD>>

<ROUTINE THE-PRSO () <TELL THE ,PRSO ,PERIOD>>

<ROUTINE A-PRSO () <TELL A ,PRSO ,PERIOD>>

<ROUTINE A-PRSO? () <TELL A ,PRSO "?" CR>>

<ROUTINE THE-PRSI () <TELL THE ,PRSI ,PERIOD>>

;<ROUTINE A-PRSI () <TELL A ,PRSI ,PERIOD>>

<ROUTINE A-PRSI? () <TELL A ,PRSI "?" CR>>

<ROUTINE YOU-CANT-X-THAT ("OPT" (STR <>))
	 <TELL ,YOU-CANT <COND (.STR .STR) (ELSE "do")> " ">
	 <COND (<OR <NOT .STR> <NOT ,PRSO> <NOT <FSET? ,PRSO ,PERSON>>>
		<TELL "that!" CR>)
	       (ELSE
		<TELL HIM/HER ,PRSO "!" CR>)>>

<ROUTINE YOU-CANT-X-PRSO (STR)
	 <TELL ,YOU-CANT .STR " ">
	 <COND (,PRSO <TELL THE ,PRSO>)
	       (ELSE <TELL "that">)>
	 <TELL ,PERIOD>>

;<ROUTINE YOU-CANT-X-PRSI (STR)
	 <TELL ,YOU-CANT .STR " ">
	 <COND (,PRSI <TELL THE ,PRSI>)
	       (ELSE <TELL "that">)>
	 <TELL ,PERIOD>>

<ROUTINE UNINTERESTED (OBJ)
	 <COND (<FSET? .OBJ ,DEAD>
		<TELL
,YOU-CANT G"expect a response from a dead person!" CR>)
	       (<EQUAL? .OBJ ,ME>
		<TELL-YUKS>)
	       (ELSE
		<TELL CTHE .OBJ IS/ARE .OBJ " uninterested." CR>)>>

<ROUTINE PLURAL? (OBJ)
	 <COND (<FSET? .OBJ ,PLURAL> <RTRUE>)
	       (ELSE <RFALSE>)>>

<ROUTINE CANT-REACH-THAT ()
	 <YOU-CANT-X-THAT "reach">>

;"end of space saving stuff"

;"subtitle game commands"

<GLOBAL VERBOSITY 1>

<GLOBAL DESCRIPTIONS " descriptions">

<ROUTINE V-VERBOSE ()
	 <SETG VERBOSITY 2>
	 <TELL "Verbose" ,DESCRIPTIONS ,PERIOD CR>
	 <V-LOOK>>

<ROUTINE V-BRIEF ()
	 <SETG VERBOSITY 1>
	 <TELL "Brief" ,DESCRIPTIONS ,PERIOD>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG VERBOSITY <>>
	 <TELL "Super-brief" ,DESCRIPTIONS ,PERIOD>>

<ROUTINE V-DIAGNOSE ()
	 <COND (<FSET? ,MARIKO ,RMUNGBIT>
		<TELL
"You are still in shock, your ears ringing, eyes hardly seeing, your
face a mass of bruises and powder burns." CR>)
	       (ELSE
		<TELL
"You are " <GET ,HEALTH-TELL <GETP ,BLACKTHORNE ,P?HEALTH>> ,PERIOD>)>>

<GLOBAL HEALTH-TELL
       <PTABLE
	"suffering from scurvy, weak, and exhausted.  You are on your last
reserves of strength"
	"suffering from a mild case of scurvy, and very tired.  You are
near the end of your strength"
	"feeling better from having eaten, but still exhausted.  You are
near the end of your strength"
	"recovering from scurvy, but still weak"
	"still very weak"
	"in excellent health">>

<ROUTINE V-INVENTORY ()
	 <SETG D-BIT <- ,WEARBIT>>
	 <COND (<NOT <DESCRIBE-CONTENTS ,WINNER
					<>
					<+ ,D-ALL? ,D-PARA?>>>
		<TELL "You are empty-handed.">)>
	 <SETG D-BIT ,WEARBIT>
	 <DESCRIBE-CONTENTS ,WINNER
			    <>
			    <+ ,D-ALL? ,D-PARA?>>
	 <SETG D-BIT <>>
	 <CRLF>>

<ROUTINE V-QUIT ("OPT" (ASK? T) (SCORE? T) "AUX" SCOR)
	 <COND (.SCORE? <V-SCORE>)>
	 ;<PARSER-REPORT>
	 <COND (<OR <AND .ASK?
			 <TELL
G "Do you wish to ""leave the game">
			 <YES?>>
		    <NOT .ASK?>>
		<QUIT>)
	       (T
		<TELL ,OKAY>)>>

<ROUTINE V-$SCENE ()
	 <COND (<AND <PRSO? INTNUM>
		     <NOT <ZERO? ,P-NUMBER>>
		     <NOT <G? ,P-NUMBER <GET ,SCENE-NAMES 0>>>>
		<GOTO-SCENE ,P-NUMBER>)
	       (ELSE <TELL G"Failed." CR>)>>

<ROUTINE V-CHOOSE ()
	 <COND (<ACCESSIBLE? ,STRAW>
		<PERFORM ,V?PICK ,STRAW>
		<RTRUE>) 
	       (ELSE
		<TELL "There's nothing to draw here." CR>)>>

<ROUTINE V-RESTART ()
	 <V-SCORE T>
	 <TELL G "Do you wish to ""restart">
	 <COND (<YES?>
		<TELL "Restarting." CR>
		<RESTART>
		<TELL ,FAILED>)>>

<GLOBAL OKAY "Okay.|">

<GLOBAL FAILED "Failed.|">

<ROUTINE FINISH ("OPT" (EOG? <>))
	 <UPDATE-STATUS-LINE>
	 <V-SCORE>
	 <COND (<NOT .EOG?>
		<SETUP-TEXT-AND-STATUS> ;"guarantee status line okay")>
	 <CRLF>
	 <GET-FROM-MENU "What now?"
			<COND (.EOG? ,EOG-MENU)
			      (ELSE ,FINISH-MENU)>
			,FINISH-MENU-F>>

<CONSTANT FINISH-MENU ;"menu when undo exists"
	  <LTABLE
<TABLE (PURE STRING LENGTH) "RESTORE a saved game position ">
<TABLE (PURE STRING LENGTH) "RESTART the game from the beginning ">
<TABLE (PURE STRING LENGTH) "QUIT this session of the game ">
<TABLE (PURE STRING LENGTH) "HINT for something confusing ">
<TABLE (PURE STRING LENGTH) "UNDO the last move ">>>

<CONSTANT EOG-MENU ;"menu when undo exists"
	  <LTABLE
<TABLE (PURE STRING LENGTH) "RESTORE a saved game position ">
<TABLE (PURE STRING LENGTH) "RESTART the game from the beginning ">
<TABLE (PURE STRING LENGTH) "QUIT this session of the game ">
<TABLE (PURE STRING LENGTH) "HINT for something confusing ">>>

<ROUTINE FINISH-MENU-F (WHICH MENU)
	 <COND (<EQUAL? .WHICH 1 ;RESTORE>
		<COND (<RESTORE>
		       <TELL ,OKAY>)
		      (T
		       <RESET-MARGIN>
		       <CLEAR ,S-TEXT>
		       <TELL ,FAILED>)>)
	       (<EQUAL? .WHICH 2 ;RESTART>
		<RESTART>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>
		<TELL ,FAILED>)
	       (<EQUAL? .WHICH 3 ;QUIT>
		<COND (<EQUAL? .MENU ,EOG-MENU>
		       <QUIT>)
		      (ELSE
		       <V-QUIT>)>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>)
	       (<EQUAL? .WHICH 4 ;HINT>
		<V-HINT>)
	       (<EQUAL? .WHICH 5 ;UNDO>
		<V-UNDO>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>)>
	 <RFALSE>>

<ROUTINE V-RESTORE ()
	 <COND (<RESTORE> <RTRUE>)
	       (T
		<TELL ,FAILED>)>>

<GLOBAL RESTORED? <>>	;"result of last RESTORE"

<ROUTINE V-SAVE ("AUX" X)
	 <PUTB ,G-INBUF 2 0>	;"make sure AGAIN gets fooled"
	 <SET X <SAVE>>
	 <SETG RESTORED? <>>
	 <COND (<QUEUED? I-SETUP-ANSWER>
		<I-SETUP-ANSWER> ;"because interrupts won't run")>
	 <COND (<ZERO? .X>
		<TELL ,FAILED>)
	       (<EQUAL? .X 1>
		<TELL ,OKAY>)
	       (<EQUAL? .X 2 3>
		<COND (<ZERO? <WINGET ,S-FULL ,WHIGH>>
		       <SET X 3>)>
		<SETG RESTORED? .X>
		<REPAINT-DISPLAY <COND (<EQUAL? .X 2> T)>>
		<CRLF>
		<V-FIRST-LOOK>)>>

<ROUTINE V-UNDO ("AUX" VAL)
	 <COND (<SET VAL <IRESTORE>>
		<INIT-STATUS-LINE>)
	       (ELSE ,FAILED)>>

<CONSTANT TOTAL-SCORE 84>
<CONSTANT SCORE-FACTOR 5>

<ROUTINE V-SCORE ("OPTIONAL" (ASK? T) "AUX" S)
	 <SET S <GETPT <GET ,SCENE-LOCS ,SCENE> ,P?SCORE>>
	 <TELL
"Your score is " N <* ,SCORE-FACTOR <GETB .S 0>> " of a possible "
N <* ,SCORE-FACTOR <GETB .S 1>> " in this scene, and "
N <* ,SCORE-FACTOR ,SCORE> " out of " N <* ,SCORE-FACTOR ,TOTAL-SCORE>
" overall, in " N ,MOVES " move">
	 <COND (<NOT <1? ,MOVES>> <TELL "s">)>
	 <TELL ". You have now achieved a rank of "
	       <GET ,RANKINGS <+ 1 </ ,SCORE <GET ,RANKINGS 0>>>>>
	 <TELL ,PERIOD>
	 <RTRUE>>

<GLOBAL RANKINGS
	<PLTABLE
	 "barbarian"		;"0"
	 "peasant"		;"10"
	 "samurai"		;"20"
	 "daimyo"		;"30"
	 "hatamoto"		;"40"
	 "hatamoto"		;"50"
	 "hatamoto"		;"60"
	 "Regent"		;"70"
	 "Kwampaku"		;"80"
	 "Taiko"		;"90"
	 "Shogun"		;"100">>

<ROUTINE V-SCRIPT ()
	<DIROUT ,D-PRINTER-ON>
	<COND (<FLAG-ON? ,F-SCRIPT>
	       <DIROUT ,D-SCREEN-OFF>
	       <TELL CR
"Start of a transcript of " ,SHOGUN-NAME ,PERIOD>
	       <V-VERSION>
	       <DIROUT ,D-SCREEN-ON>)>>

<ROUTINE V-UNSCRIPT ()
	<COND (<FLAG-ON? ,F-SCRIPT>
	       <DIROUT ,D-SCREEN-OFF>
	       <TELL "End of transcript" ,PERIOD>
	       <DIROUT ,D-SCREEN-ON>)>
	<DIROUT ,D-PRINTER-OFF>
	<RTRUE>>

<CONSTANT SHOGUN-NAME "SHOGUN">

<ROUTINE V-VERSION ("OPT" (C? <>))
	 <COND (.C? <CURSET <+ 1 <* 2 ,FONT-Y>> 1>)>
	 <HLIGHT ,H-BOLD>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL ,SHOGUN-NAME>
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <HLIGHT ,H-NORMAL>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL "A Story of Japan">
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL "Copyright (c) 1988 by Infocom">
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL "All rights reserved.">
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL ,SHOGUN-NAME " is a trademark of James Clavell">
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL "Original Literary Work Copyright 1975 by James Clavell">
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL "Licensed by Noble House Trading Limited, London.">
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL "Release ">
	 <PRINTN <LOWCORE ZORKID>>
	 <TELL " / Serial number ">
	 <LOWCORE-TABLE SERIAL 6 PRINTC>
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>
	 <COND (.C? <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>)>
	 <TELL <GET ,MACHINES ,MACHINE> " Interpreter version "
	       N <LOWCORE (ZVERSION 0)> "." N <LOWCORE INTVR>>
	 <COND (.C? <PRINT-CENTER-TABLE>)>
	 <CRLF>>

<CONSTANT MACHINES
	  <LTABLE "Debugging"
		  "Apple IIe"
		  "Macintosh"
		  "Amiga"
		  "Atari ST"
		  "IBM"
		  "Commodore 128"
		  "Commodore 64"
		  "Apple IIc"
		  "Apple IIgs">>

<ROUTINE PCENTER (STR "OPT" (STR1 <>) (STR2 <>))
	 <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>
	 <TELL .STR>
	 <COND (.STR1 <TELL .STR1>)>
	 <COND (.STR2 <TELL .STR2>)>
	 <PRINT-CENTER-TABLE>
	 <CRLF>>	 

<ROUTINE V-CREDITS ()
	 <HLIGHT ,H-BOLD>
	 <PCENTER ,SHOGUN-NAME>
	 <HLIGHT ,H-NORMAL>
	 <PCENTER "A Story of Japan">
	 <CRLF>
	 <PCENTER "Adapted by Dave Lebling">
	 <CRLF>
	 <PCENTER "Original Illustrations by Donald Langosy">
	 <COND (<APPLE?>
		<PCENTER "Translated by Tanya Allan">)
	       (<EQUAL? ,MACHINE ,IBM>
		<PCENTER "Translated by Donna Dennison">)>
	 <CRLF>
	 <PCENTER "Interpreters by Tim Anderson, Duncan Blanchard,">
	 <PCENTER "J. D. Arnold, and Scott Fray">
	 <CRLF>
	 <PCENTER "English Parser by Stu Galley and Tim Anderson">
	 <CRLF>
	 <PCENTER "Quality control by Patti Pizer, Shaun Kelly,">
	 <PCENTER "Steve Watkins, Adam Levesque, Christian Anthony,">
	 <PCENTER "Liz Jones, Adam Glass, and many others">
	 <CRLF>>

<ROUTINE V-$VERIFY ()
	 <COND (<AND <PRSO? ,INTNUM>
		     <EQUAL? ,P-NUMBER 1564>>
		<TELL N ,SERIAL CR>)
	       (,PRSO
		<DONT-UNDERSTAND>
		;<TELL ,NOT-RECOGNIZED CR>)
	       (ELSE
		<TELL "Verifying..." CR>
		<COND (<VERIFY> <TELL "The disk is correct." CR>)
		      (T <TELL CR "** Disk Failure **" CR>)>)>>

;"subtitle real verbs"

<ROUTINE V-WAKE ()
	 <COND (<PRSO? ,ROOMS>
		<NEW-PRSO ,ME>
		<RTRUE>)
	       (T
		<TELL
,I-DONT-THINK-THAT THE ,PRSO IS/ARE ,PRSO " sleeping." CR>)>>

<ROUTINE V-ANSWER ()
	 <COND (<OR ,OMI-QUESTION
		    ,YABU-QUESTION
		    <AND ,QCONTEXT
			 <ACCESSIBLE? ,QCONTEXT>>>
		<COND (,OMI-QUESTION <TELL CTHE ,OMI>)
		      (,YABU-QUESTION <TELL CTHE ,YABU>)
		      (ELSE <TELL CTHE ,QCONTEXT>)>
		<TELL
" seems to be expecting a more responsive answer." CR>)
	       (ELSE
		<TELL "Nobody is awaiting your answer." CR>
		<END-QUOTE>)>>

"V-ASK-ABOUT -- transform into PRSO, TELL ME ABOUT PRSI"

<ROUTINE PRE-ASK-ABOUT ("AUX" P)
	 <COND (<AND ,QCONTEXT
		     <IN? ,QCONTEXT ,HERE>
		     <NOT <PRSO? ,QCONTEXT>>
		     <NOT ,PRSI>>
		<PERFORM ,PRSA ,QCONTEXT ,PRSO>
		<RTRUE>)
	       (<AND <NOT ,PRSI>
		     <SET P <FIND-IN ,HERE ,PERSON>>
		     <NOT <EQUAL? .P ,WINNER>>>
		<PERFORM-PRSA .P ,PRSO>
		<RTRUE>)>>

<ROUTINE V-ASK-ABOUT ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (<PRSO? ,ME>
		<NEW-VERB ,V?TELL>
		<RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<NEW-WINNER-PRSO ,V?TELL-ME-ABOUT ,PRSI>
		<RTRUE>)
	       (T
		<NEW-VERB ,V?TELL>
		<RTRUE>)>>

<ROUTINE FIND-IN (WHERE WHAT "OPT" (WHAT-NOT <>) "AUX" W)
	 <MAP-CONTENTS (W .WHERE)
		       (END <RFALSE>)
		 <COND (<AND <FSET? .W .WHAT>
			     <VISIBLE? .W>>
			<COND (<AND <EQUAL? .WHAT ,PERSON>
				    <EQUAL? .W ,WINNER>>)
			      (<OR <NOT .WHAT-NOT>
				   <NOT <FSET? .W .WHAT-NOT>>>
			       <RETURN .W>)>)>>>

"V-ASK-FOR -- transform into PRSO, GIVE PRSI TO ME"

<ROUTINE PRE-ASK-FOR ()
	 <PRE-ASK-ABOUT>>

<ROUTINE V-ASK-FOR ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (<PRSO? ,ME ,PLAYER>
		<PERFORM ,V?TAKE ,PRSI>
		<RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<NEW-WINNER-PRSO ,V?GIVE ,PRSI ,ME>
		<RTRUE>)
	       (T
		<TELL
"It's unlikely that " THE ,PRSO " will oblige." CR>)>>

<ROUTINE PRE-ATTACK ("AUX" W)
	 <COND (,PRSI <RFALSE>)
	       (<SET W <FIND-IN ,WINNER ,WEAPONBIT ,WEARBIT>>
		<PERFORM ,PRSA ,PRSO .W>
		<RTRUE>)
	       (ELSE <RFALSE>)>>

<ROUTINE V-ATTACK ()
	 <IKILL "attack">>

<ROUTINE V-HIT ()
	 <IKILL "hit">>

<ROUTINE V-BITE ()
	 <HACK-HACK "Biting">>

<ROUTINE PRE-BOARD ("AUX" AV DIR)
	 <SET AV <LOC ,WINNER>>
	 <COND (<PRSO? ,ROOMS> <RFALSE>)
	       (<FSET? ,PRSO ,VEHBIT>
		<COND (<HELD? ,PRSO>
		       <TELL
,YOU-HAVE-TO "put " THE ,PRSO " down first." CR>)
		      (<EQUAL? .AV ,PRSO>
		       <YOU-ARE-IN .AV>)
		      (<AND <FSET? .AV ,VEHBIT>
			    <HELD? ,PRSO .AV>>
		       <TELL ,YOU-HAVE-TO "leave " THE .AV " first" ,PERIOD>)
		      (T
		       <RFALSE>)>)
	       (<AND <IN? ,PRSO ,ROOMS>
		     <SET DIR <NEXT-ROOM? ,PRSO>>>
		<DO-WALK .DIR>
		<RTRUE>)
	       (T
		<TELL ,YOU-CANT "get ">
		<COND (<FSET? ,PRSO ,PERSON> <TELL "onto ">)
		      (ELSE <TELL "into ">)>
		<TELL THE ,PRSO "!" CR>)>
	 <RFATAL>>

<ROUTINE YOU-ARE-IN (AV)
	 <TELL ,YOU-ARE
	       <COND (<FSET? .AV ,SURFACEBIT> " on ")
		     (ELSE " in ")>
	       THE .AV "!" CR>>

<ROUTINE V-BOARD ("AUX" AV)
	 <TELL ,YOU-ARE-NOW>
	 <COND (<FSET? ,PRSO ,SURFACEBIT> <TELL "on ">)
	       (ELSE <TELL "in ">)>
	 <THE-PRSO>
	 <MOVE ,WINNER ,PRSO>
	 <APPLY <GETP ,PRSO ,P?ACTION> ,M-ENTER>
	 <RTRUE>>

<ROUTINE V-BURN ()
	 <COND (<NOT ,PRSI>
		<TELL "Your gaze is insufficient." CR>)
	       (T
		<WITH-PRSI?>)>>

<ROUTINE V-CHASTISE ()
	 <TELL
"Use prepositions instead: LOOK AT the object, LOOK INSIDE it,
LOOK UNDER it, etc." CR>>

<ROUTINE V-CLIMB-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?DOWN>)
	       (T
		<TELL ,WASTE-OF-TIME>)>>

<ROUTINE V-CLIMB-FOO ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (T
		<TELL ,WASTE-OF-TIME>)>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<AND <FSET? ,PRSO ,VEHBIT>
		     <FSET? ,PRSO ,SURFACEBIT>>
		<NEW-VERB ,V?BOARD>
		<RTRUE>)
	       (T
		<TELL ,YOU-CANT "climb onto "><A-PRSO>)>>

<ROUTINE V-CLIMB-OVER ()
	 <YOU-CANT-X-THAT>>

<ROUTINE V-CLIMB-UP ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (T
		<TELL ,WASTE-OF-TIME>)>>

<ROUTINE V-CLOSE ()
	 <COND (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
		     <FSET? ,PRSO ,OPENABLE>>
		<ALREADY-CLOSED>
		;<TELL CTHE ,PRSO " is already closed." CR>)
	       (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <AND <NOT <FSET? ,PRSO ,CONTBIT>>
			 <NOT <FSET? ,PRSO ,DOORBIT>>>>
		<TELL "There's no way to close "><THE-PRSO>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL "Huh?" CR>)
	       (<NOT <EQUAL? <GETP ,PRSO ,P?CAPACITY> 0>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,OPENBIT>
		       <TELL "Closed">
		       <IN-DARK?>)
		      (T
		       <ALREADY-CLOSED>)>)
	       (<FSET? ,PRSO ,DOORBIT>
		<CLOSE-A-DOOR>)
	       (T
		<YOU-CANT-X-THAT "close">)>>

<ROUTINE CLOSE-A-DOOR ()
	 <COND (<FSET? ,PRSO ,OPENBIT>
		<OKAY-THE-PRSO-IS-NOW "closed">
		<FCLEAR ,PRSO ,OPENBIT>)
	       (T
		<ALREADY-CLOSED>)>>

<ROUTINE IN-DARK? ("OPT" (DIE? <>) "AUX" OLIT)
	 <SET OLIT ,LIT>
	 <SETG LIT <LIT? ,HERE>>
	 <COND (<AND .OLIT <NOT ,LIT>>
		<TELL
", leaving you in the dark." CR>
		<COND (.DIE?
		       <CRLF>
		       <TELL "Not alone, however. ">
		       <JIGS-UP ;"this string is a duplicate of one in GOTO"
"This is a civilized country, but nonetheless one should never assume
the dark is safe.  Someone just grabbed you from behind and strangled
you with a silken cord.">)
		      (ELSE <RTRUE>)>)
	       (ELSE <TELL ,PERIOD>)>>

<ROUTINE OKAY-THE-PRSO-IS-NOW (STR)
	 <TELL CTHE ,PRSO " is now " .STR ,PERIOD>>

<ROUTINE V-COMPARE-MANY ()
	 <COND (<EQUAL? <GET ,P-PRSO 0> 2>
		<SETG P-MULT <>>
		<PERFORM ,V?COMPARE <GET ,P-PRSO 1> <GET ,P-PRSO 2>>
		<RFATAL>)
	       (ELSE
		<TELL "You can only compare two things." CR>)>>

<ROUTINE V-WASTE-OF-TIME ()
	 <TELL ,WASTE-OF-TIME>>

<ROUTINE V-COMPARE ()
	 <COND (ELSE
		<TELL ,WASTE-OF-TIME>)>>

;<ROUTINE V-COUNT ()
	 <TELL ,WASTE-OF-TIME>>

<ROUTINE V-CROSS ()
	 <YOU-CANT-X-THAT "cross">>

<ROUTINE V-CURSE ()
	 <COND (<AND <PRSO? <> ROOMS YOU>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (<FSET? ,PRSO ,DUTCHBIT>
		<TELL
'PRSO " makes an anatomically impossible suggestion." CR>)
	       (ELSE
		<TELL
"Fortunately, your swearing is incomprehensible.  Your manners are
very bad, even for a barbarian." CR>)>>

<ROUTINE V-CUT ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<NEW-VERB ,V?KILL>
		<RTRUE>)
	       (<OR <NOT ,PRSI> <NOT <FSET? ,PRSI ,WEAPONBIT>>>
		<COND (<OR <NOT ,PRSI> <INTRINSIC? ,PRSI>>
		       <TELL "Your body">)
		      (ELSE
		       <TELL CTHE ,PRSI>)>
		<TELL
" has an inadequate \"cutting edge.\"" CR>)
	       (T
		<TO-A-PRSO?>)>>

<ROUTINE V-DIG ()
	 <COND (<AND ,PRSI <FSET? ,PRSI ,TOOLBIT>>
		<TELL
"Digging with " THE ,PRSI " would be slow, tiring, and tedious." CR>)
	       (<PRSO? ,GROUND>
		<TELL "You don't have anything to dig with." CR>)
	       (ELSE
		<TELL ,WASTE-OF-TIME>)>>

<ROUTINE V-DISEMBARK ("AUX" AV)
	 <SET AV <LOC ,WINNER>>
	 <COND (<OR <NOT ,PRSO>
		    <PRSO? ,ROOMS>>
		<COND (<AND .AV <FSET? .AV ,VEHBIT>>
		       <NEW-PRSO .AV>
		       <RTRUE>)
		      ;(<FSET? ,HERE ,RWATERBIT>
		       <DO-WALK ,P?UP>)
		      (ELSE
		       <TELL G"You aren't ""in anything." CR>)>)
	       (<NOT <IN? ,WINNER ,PRSO>>
		<TELL "You aren't in " THE ,PRSO "." CR>)
	       (<AND .AV
		     <FSET? .AV ,VEHBIT>>
		<COND (<AND <NOT <EQUAL? .AV ,PRSO>>
			    <NOT <HELD? .AV ,PRSO>>>
		       <YOU-ARE-IN .AV>
		       <RFATAL>)
		      (T
		       <MOVE ,WINNER <LOC ,PRSO>> ;"for vehicle in vehicle"
		       <B-STAND>
		       <TELL ,YOU-ARE-NOW "on your feet." CR>)>)
	       (<IN? ,PRSO ,ROOMS>
		<DO-WALK ,P?OUT>
		<RTRUE>)
	       (<LOC ,PRSO>
		<NEW-VERB ,V?TAKE>
		<RTRUE>)
	       (ELSE
		<TELL G"It's not in anything." CR>)>>

<ROUTINE V-DRINK ("AUX" S)
	 <YOU-CANT-X-THAT "drink">>

<ROUTINE V-DRINK-FROM ("AUX" X)
	 <COND ;(<PRSO? ,WATER>
		<PERFORM ,V?DRINK ,PRSO>
		<RTRUE>)
	       (T
		<TO-A-PRSO?>)>>

<ROUTINE PRE-DROP ()
	 <COND (<PRSO? <LOC ,WINNER>>
		<NEW-VERB ,V?DISEMBARK>
		<RTRUE>)>>

<ROUTINE V-DROP ()
	 <COND (<PRSO? ,ROOMS>
		<TELL G"You aren't "G"hanging from anything." CR>)
	       (<IDROP>
		<TELL "Dropped." CR>)
	       (ELSE <RTRUE>)>>

<ROUTINE V-EAT ("AUX" H)
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL
"Cannibalism is not the solution." CR>)
	       (ELSE
		<TELL
"Much as you may miss meat, bread, and grog, there is little
likelihood that " A ,PRSO " will satisfy you." CR>)>>

<ROUTINE V-ENTER ()
	 <COND (<GETPT ,HERE ,P?IN>
		<DO-WALK ,P?IN>)
	       (ELSE
		<V-WALK-AROUND>)>>

<ROUTINE PRE-EXAMINE ("AUX" P)
	 <COND (<NOT ,LIT> <TELL ,TOO-DARK>)
	       (<OR <HERE? ,MAZE>
		    <AND <HERE? ,SECRET-REDOUBT>
			 <PRSO? MARIKO>>
		    <AND <HERE? ,CLIFF-PATH>
			 <PRSO? YABU RODRIGUES>
			 <NOT <IN? ,PRSO ,HERE>>>>
		<RFALSE>)
	       (<SET P <GETP ,PRSO ,P?PICTURE>>
		<MARGINAL-PIC .P>
		<RFALSE>)>>

<ROUTINE V-EXAMINE ("AUX" H)
	 <COND (<EQUAL? ,PRSO ,HERE>
		<PERFORM ,V?LOOK>
		<RTRUE>)
	       (<AND <FSET? ,PRSO ,READBIT>
		     <GETP ,PRSO ,P?TEXT>>
		<NEW-VERB ,V?READ>
		<RTRUE>)
	       (<FSET? ,PRSO ,DOORBIT>
		<V-LOOK-INSIDE>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <V-LOOK-INSIDE>)
		      (T
		       <THIS-IS-IT ,PRSO>
		       <TELL G "It's closed.|">)>)
	       (<FSET? ,PRSO ,DEAD>
		<TELL CTHE ,PRSO " is dead." CR>)
	       (<FSET? ,PRSO ,ABSTRACTBIT>
		<TELL "You can't see that from here!" CR>)
	       (T
		<PRSO-NOTHING-SPECIAL>)>>

<ROUTINE PRSO-NOTHING-SPECIAL ()
	 <TELL G "You see nothing special about ">
	 <THE-PRSO>>

<ROUTINE V-EXIT ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,VEHBIT>
		       <NEW-VERB ,V?DISEMBARK>
		       <RTRUE>)
		      (ELSE
		       <TELL ,YOU-CANT "exit " THE ,PRSO "." CR>)>)
	       (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (<GETPT ,HERE ,P?OUT>
		<DO-WALK ,P?OUT>)
	       (ELSE
		<V-WALK-AROUND>)>>

<ROUTINE V-FILL ()
	 <COND (<NOT ,PRSI>
		<TELL
,THERES-NOTHING-TO "fill it with" ,PERIOD>)
	       (T
		<TELL-YUKS>)>>

<ROUTINE V-FIND ("OPT" (WHERE <>) "AUX" L)
	 <COND (<PRSO? ,PLAYER>
		<TELL
"As close as the hairs of your beard">)
	       (<INTRINSIC? ,PRSO>
		<TELL
"Nearby, I'm sure">)
	       (<IN? ,PRSO ,PLAYER>
		<TELL "You have it">)
	       (<OR <IN? ,PRSO ,HERE>
		    <PRSO? ,PSEUDO-OBJECT>>
		<TELL "Right in front of you">)
	       (<OR <IN? ,PRSO ,LOCAL-GLOBALS>
		    <IN? ,PRSO ,GLOBAL-OBJECTS>>
		<CPRINT-HE/SHE ,PRSO>
		<TELL " could be nearby">)
	       (<SET L <LOC ,PRSO>>
		<COND (<AND <FSET? .L ,PERSON>
			    <VISIBLE? .L>>
		       <TELL "I think " THE .L " has it">)
		      (<ACCESSIBLE? ,PRSO>
		       <TELL "It's in " THE .L>)
		      (.WHERE
		       <TELL "Beats me">)
		      (T
		       <TELL ,YOU-HAVE-TO "find " HIM/HER ,PRSO " yourself">)>)
	       (ELSE
		<TELL "You have no idea where to find " THE ,PRSO>)>
	 <TELL ,PERIOD>>

<ROUTINE V-FOLLOW ("AUX" TMP LP DIR)
	 <COND (<NOT ,PRSO>
		<TELL
,YOU-HAVE-TO " be more specific about whom you want to follow." CR>)
	       (<AND <SET LP <LOC ,PRSO>>
		     <IN? .LP ,ROOMS>
		     <SET DIR <NEXT-ROOM? .LP>>>
		<DO-WALK .DIR>)
	       (<IN? ,WINNER .LP>
		<COND (ELSE
		       <TELL
,YOU-CANT "follow " THE ,PRSO ", because " HE/SHE ,PRSO IS/ARE ,PRSO
" right here!" CR>)>)
	       (<AND <IN? ,WINNER ,HERE>
		     <IN? .LP ,HERE>
		     <FSET? .LP ,VEHBIT>>
		<PERFORM ,V?BOARD .LP>
		<RTRUE>)
	       (T
		<TELL ,WASTE-OF-TIME>)>>

<ROUTINE PRE-GIVE ()
	 <COND (<AND <WINNER? ,PLAYER>
		     <NOT <HELD? ,PRSO>>
		     <NOT <FSET? ,PRSO ,PERSON>>>
		<YOULL-HAVE-TO "get it">)>>

<ROUTINE V-GIVE ()
	 <COND (<OR <NOT <FSET? ,PRSI ,PERSON>>
		    <FSET? ,PRSO ,PERSON>>
		<TELL ,YOU-CANT "give " A ,PRSO " to " A ,PRSI "!" CR>)
	       (T
		<UNINTERESTED ,PRSI>)>>

<ROUTINE V-GOODBYE ("AUX" OWINNER)
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
,YOU-CANT G"expect a response from a dead person!" CR>)
		      (<FSET? ,PRSO ,PERSON>
		       <NEW-WINNER-PRSO ,PRSA>
		       <RTRUE>)
		      (T
		       <TELL
G"In this country, people who say ""\"Goodbye\" to " A ,PRSO " are
considered barbarians." CR>)>)
	       (T
		<TELL "Leaving so soon?" CR>)>>

<ROUTINE V-HELLO ("AUX" OWINNER)
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
,YOU-CANT G"expect a response from a dead person!" CR>)
		      (<FSET? ,PRSO ,PERSON>
		       <NEW-WINNER-PRSO ,PRSA>
		       <RTRUE>)
		      (T
		       <TELL
G"In this country, people who say ""\"Hello\" to " A ,PRSO " are
considered crazed." CR>)>)
	       (<TRY-QCONTEXT?>
		<RTRUE>)
	       (T
		<TELL "In good spirits, aren't you?" CR>)>>

<ROUTINE V-HELP ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,PERSON>
		       <TELL
CTHE ,PRSO G " doesn't appear to ""need help." CR>)
		      (ELSE
		       <TELL
"There doesn't seem to be any way to help " THE ,PRSO "." CR>)>)
	       (<NOT <EQUAL? ,P-PRSA-WORD ,W?HINT>>
		<TELL
,YOU-HAVE-TO G"be more specific about ""whom you want to help." CR>)
	       (ELSE
		<V-HINT>)>>

<ROUTINE V-HIDE ()
	 <COND (<NOT ,PRSO>
		<TELL "There's no place to hide here." CR>
		<RFATAL>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL
"There doesn't seem any way to hide " THE ,PRSO "." CR>)
	       (<AND ,PRSI <FSET? ,PRSI ,PERSON>>
		<UNINTERESTED ,PRSI>)
	       (<NOT ,PRSI>
		<TELL ,WASTE-OF-TIME> ;"useless")>>

<ROUTINE V-HIDE-BEHIND ("OPT" (STR <>))
	 <TELL
"There doesn't seem to be enough room ">
	 <COND (.STR <TELL .STR>)(ELSE <TELL "behind">)>
	 <TELL " " THE ,PRSO "." CR>>

<ROUTINE V-HIDE-UNDER ()
	 <V-HIDE-BEHIND "under">>

<ROUTINE V-HIDE-FROM ()
	 <TELL ,YOU-HAVE-TO "decide where." CR>>

<ROUTINE V-KICK ()
	 <COND (<OR <NOT <FSET? ,PRSO ,PERSON>>
		    <FSET? ,PRSO ,DEAD>>
		<TELL "Kicking " A ,PRSO " seems a waste of time." CR>)
	       (<FSET? ,PRSO ,FEMALE>
		<TELL
G"Only a motherless coward would attack a woman!" CR>)
	       (ELSE
		<TELL
"A potentially dangerous course of action!" CR>)>>

<ROUTINE V-KILL ()
	 <COND (<AND <PAST-TENSE?>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (ELSE <IKILL "kill">)>>

<ROUTINE IKILL (STR)
	 <COND (<AND <PRSO? ,ROOMS> ,OPPONENT>
		<PERFORM ,PRSA ,OPPONENT>
		<RTRUE>)
	       (<PRSO? <> ,ROOMS>
		<TELL ,THERES-NOTHING-TO .STR " here." CR>)
	       (<FSET? ,PRSO ,DOORBIT>
		<TELL
"Pounding on a door is of little use." CR>)
	       (<OR <NOT <FSET? ,PRSO ,PERSON>>
		    <FSET? ,PRSO ,DEAD>>
		<TELL "Attacking " A ,PRSO " seems a waste of time." CR>)
	       (<FSET? ,PRSO ,FEMALE>
		<TELL
G"Only a motherless coward would attack a woman!" CR>)
	       (<OR <PRSI? <> ,HANDS>
		    <NOT <FSET? ,PRSI ,WEAPONBIT>>>
		<COND (<HELD? ,SWORDS>
		       <PERFORM ,V?ATTACK ,PRSO ,SWORDS>
		       <RTRUE>)
		      (ELSE
		       <TELL
"Trying to " .STR " " THE ,PRSO " with ">
		       <COND (<NOT <PRSI? <> ,HANDS>>
			      <TELL A ,PRSI>)
			     (ELSE <TELL "your bare hands">)>
		       <TELL " is suicidal." CR>)>)
	       (<NOT <IN? ,PRSI ,WINNER>>
		<NOT-HOLDING ,PRSI>)
	       (<PRSI? ,PISTOL>
		<PERFORM ,V?SHOOT ,PRSI ,PRSO>
		<RTRUE>)
	       (<PRSI? ,SWORDS>
		<TELL
"You swing your sword at " THE ,PRSO>
		<COND (<PRSO? ,GRAY-LEADER ,GRAY-CAPTAIN ,SECOND-GRAY
			      ,GRAYS ,BROWNS>
		       <TELL
", but he parries your attack with little difficulty." CR>)
		      (ELSE
		       <TELL
", but " HE/SHE ,PRSI " dodge" S ,PRSI "." CR>)>)
	       (T
		<NOT-TRAINED>)>>

<ROUTINE NOT-TRAINED ("OPT" (WHO ,PRSO))
	 <TELL
"Your lack of training prevents you from successfully hitting
" THE .WHO "." CR>>

<ROUTINE V-KNOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<B-NOT-STANDING?>
		       <YOULL-HAVE-TO "stand up">)
		      (ELSE
		       <TELL "Nobody's home." CR>)>)
	       (T
		<TELL "Why knock on "> <A-PRSO?>)>>

<ROUTINE V-KISS ()
	 <COND (<CREWMAN? ,PRSO>
		<TELL
"You've heard that sort of tale about some of the crew, but you've
never been tempted to find out the truth." CR>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL
"In Japan, kissing is not commonly practiced.  It is considered somewhat
unclean and barbaric." CR>)
	       (ELSE <TELL-YUKS>)>>

<ROUTINE V-LAMP-OFF ()
	 <TO-A-PRSO?> ;"flashlight is only light source">

<ROUTINE V-LAMP-ON ()
	 <TO-A-PRSO?>>

<ROUTINE V-LEAN-ON ()
	 <TELL "Tired?" CR>>

<ROUTINE V-LEAP ()
	 <COND (<B-NOT-STANDING?>
		<YOULL-HAVE-TO "stand up">)
	       (<AND ,PRSO <IN? ,PRSO ,HERE>>
		<COND (<EQUAL? ,PRSO ,OPPONENT>
		       <PERFORM ,V?KICK ,PRSO>
		       <RTRUE>)
		      (ELSE
		       <V-SKIP>)>)
	       (<AND <NOT ,PRSO> ,OPPONENT>
		<PERFORM ,V?DODGE>
		<RTRUE>)
	       (T
		<TELL
"You jump a little ways, but then fall back to the ground." CR>)>>

<ROUTINE V-LEAVE ()
	 <COND (<EQUAL? ,P-PRSA-WORD ,W?WALK>
		<TELL
"Please specify which way you want to walk.  Use compass directions." CR>)
	       (ELSE
		<DO-WALK ,P?OUT>)>>

<ROUTINE V-LISTEN ()
	 <COND (<AND ,PRSO <FSET? ,PRSO ,PERSON>>
		<TELL
"Right now, " THE ,PRSO IS/ARE ,PRSO "n't saying anything." CR>)
	       (<AND ,PRSO <NOT <PRSO? ,NOISE>>>
		<TELL
"At the moment, " THE ,PRSO IS/ARE ,PRSO " quiet and peaceful." CR>)
	       (ELSE
		<TELL
"You hear nothing unusual." CR>)>>

<ROUTINE CANT-X-WITH-PRSI (STR)
	 <TELL "You can't " .STR " anything with " A ,PRSI "." CR>>

<ROUTINE V-LOCK ()
	 <COND (<NOT <PRSI? <> ,KEY>>
		<CANT-X-WITH-PRSI "lock">)
	       (<FSET? ,PRSO ,LOCKED>
		<TELL G"It already is." CR>)
	       (<FSET? ,PRSO ,LOCKABLE>
		<COND (<IN? ,KEY ,WINNER>
		       <FSET ,PRSO ,LOCKED>
		       <TELL "Done." CR>)
		      (ELSE
		       <TELL G"You need a key to do that." CR>)>)
	       (ELSE 
		<NO-LOCK>)>>

<ROUTINE NO-LOCK ()
	 <TELL CTHE ,PRSO " doesn't have a lock." CR>>

<ROUTINE V-INTRODUCE ("AUX" TMP)
	 <COND (<AND <NOT <FSET? ,HERE ,TOUCHBIT>>
		     <OR <FSET? ,HERE ,RMUNGBIT>
			 <AND <SET TMP <GETPT ,HERE ,P?SCENE>>
			      <EQUAL? ,SCENE <GETB .TMP 0>>>>>
		<COND (<SET TMP <GETP ,HERE ,P?PICTURE>>
		       <MARGINAL-PIC .TMP>)>
		<COND (<SET TMP <GETP ,HERE ,P?FDESC>>
		       <TELL .TMP CR CR>)>
		<RTRUE>)>>

<ROUTINE V-AFTER ("AUX" TMP RM)
	 <COND (<AND ,SCENE
		     <SET TMP <GETP <GET ,SCENE-LOCS ,SCENE> ,P?AFTER>>>
		<CRLF>
		<TYPE-ANY-KEY>
		<INTERLUDE-STATUS-LINE>
		<TIME-PASSES>
		<APPLY .TMP>
		<TIME-PASSES>)>>

<ROUTINE TIME-PASSES ()
	 <CRLF>
	 <CENTER-PIC-X ,P-TIME>
	 <CRLF>>

<ROUTINE NEXT-SCENE ()
	 <NEW-SCENE <+ ,SCENE 1>>>

<ROUTINE FAILED-SCENE ()
	 <NEW-SCENE <>>>

<ROUTINE NEW-SCENE ("OPT" (SC <>) "AUX" S SA SP)
	 <UPDATE-STATUS-LINE>
	 <TELL CR
"[">
	 <SET S <GETPT <GET ,SCENE-LOCS ,SCENE> ,P?SCORE>>
	 <SET SA <GETB .S 0>>
	 <SET SP <GETB .S 1>>
	 <COND (.SC
		<TELL
"Congratulations, you have finished this scene with a score of "
N <* ,SCORE-FACTOR .SA> " out of a possible " N <* ,SCORE-FACTOR .SP>>)
	       (ELSE
		<TELL
"Sorry, this scene is no longer winnable">)>
	 <TELL ".]" CR CR>
	 <COND (.SC
		<V-AFTER>
		<CONTINUE-TO-NEXT-SCENE <- .SP .SA>>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>
		<COND (<NOT <EQUAL? ,CURRENT-BORDER ,P-BORDER>>
		       <DISPLAY-BORDER ,P-BORDER>)>
		<GOTO-SCENE .SC>)
	       (ELSE <FINISH>)>>

<ROUTINE SCORE-HAVE ()
	 <GETB <GETPT <GET ,SCENE-LOCS ,SCENE> ,P?SCORE> 0>>

;<ROUTINE SCORE-MAX ()
	 <GETB <GETPT <GET ,SCENE-LOCS ,SCENE> ,P?SCORE> 1>>

<CONSTANT CONTINUE-MENU
	  <LTABLE
<TABLE (PURE STRING LENGTH) "CONTINUE to next scene ">
<TABLE (PURE STRING LENGTH) "SAVE this game position ">
<TABLE (PURE STRING LENGTH) "QUIT this session of the game ">>>

<CONSTANT CONTINUE-AND-HINT-MENU
	  <LTABLE
<TABLE (PURE STRING LENGTH) "CONTINUE to next scene ">
<TABLE (PURE STRING LENGTH) "SAVE this game position ">
<TABLE (PURE STRING LENGTH) "QUIT this session of the game ">
<TABLE (PURE STRING LENGTH) "HINT for something confusing ">>>

<ROUTINE CONTINUE-TO-NEXT-SCENE (HINT?)
	 ;<UPDATE-STATUS-LINE>
	 ;<SETUP-TEXT-AND-STATUS> ;"guarantee status line okay"
	 <GET-FROM-MENU "What now?"
			<COND (.HINT? ,CONTINUE-AND-HINT-MENU)
			      (ELSE ,CONTINUE-MENU)>
			,CONTINUE-MENU-F>>

<ROUTINE CONTINUE-MENU-F (WHICH MENU)
	 <COND (<EQUAL? .WHICH 1 ;CONTINUE>
		<RTRUE>)
	       (<EQUAL? .WHICH 2 ;SAVE>
		<V-SAVE>
		<RFALSE>)
	       (<EQUAL? .WHICH 3 ;QUIT>
		<V-QUIT>
		<RFALSE>)
	       (<EQUAL? .WHICH 4 ;HINT>
		<V-HINT>
		<RFALSE>)>>

<ROUTINE V-FIRST-LOOK ()
	 <COND (<DESCRIBE-ROOM <G? ,VERBOSITY 1>>
		<COND (,VERBOSITY <DESCRIBE-OBJECTS>)>)>>

<ROUTINE V-LOOK ()
	 <COND (<DESCRIBE-ROOM T>
		<DESCRIBE-OBJECTS>)>>

<ROUTINE V-LOOK-BEHIND ()
	 <COND (<PRSO? ME>
		<TELL
"You look back over your shoulder.  "G"There's nothing ""there." CR>)
	       (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
		     <NOT <FSET? ,PRSO ,SURFACEBIT>>
		     <OR <FSET? ,PRSO ,CONTBIT>
			 <FSET? ,PRSO ,DOORBIT>>>
		<INSPECTION-REVEALS ,PRSO>)
	       (ELSE
		<TELL ,THERE-IS-NOTHING "behind "><THE-PRSO>)>>

<ROUTINE V-LOOK-DOWN ()
	 <COND (<NOT ,LIT>
		<TELL ,TOO-DARK>)
	       (<PRSO? <> ,ROOMS ,LG-HOLE>
		<COND (<GLOBAL-IN? ,LG-HOLE ,HERE>
		       <PERFORM ,V?LOOK-INSIDE ,LG-HOLE>)
		      (ELSE
		       <PERFORM ,V?EXAMINE ,GROUND>)>
		<RTRUE>)
	       (ELSE
		<PRSO-NOTHING-SPECIAL>)>>

<ROUTINE WHAT-CONTENTS ()
	 <COND (<NOT <DESCRIBE-CONTENTS ,PRSO>>
		<TELL "nothing">
		<COND (<IN? ,PLAYER ,PRSO>
		       <TELL " (other than you)">)>)>
	 <TELL ,PERIOD>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<PRSO-NOTHING-SPECIAL>)
	       (<FSET? ,PRSO ,DOORBIT>
		<THIS-IS-IT ,PRSO>
		<TELL "All you can tell is that ">
		<TELL-OPEN-CLOSED>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<PRSO? <LOC ,WINNER>>
		       <MOVE ,PLAYER ,ROOMS>
		       <TELL "Aside from you, there's ">
		       <WHAT-CONTENTS>
		       <MOVE ,PLAYER ,PRSO>)
		      (<SEE-INSIDE? ,PRSO>
		       <TELL CTHE ,PRSO " contains ">
		       <WHAT-CONTENTS>)
		      (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
			    <FIRST? ,PRSO>>
		       <NEW-VERB ,V?OPEN>
		       <RTRUE>)
		      (T
		       <THIS-IS-IT ,PRSO>
		       <TELL "It seems ">
		       <TELL-OPEN-CLOSED>)>)
	       (T
		<YOU-CANT-X-PRSO "look inside">)>>

<ROUTINE V-LOOK-ON ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<PRSO-NOTHING-SPECIAL>)
	       (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <FSET? ,PRSO ,FURNITURE>>
		<TELL "On " THE ,PRSO " is ">
		<WHAT-CONTENTS>)
	       (T
		<TELL "You don't see anything on " THE ,PRSO "." CR>)>>

<ROUTINE V-LOOK-UNDER ()
	 <COND (<HELD? ,PRSO>
		<TELL "You see your hand." CR>)
	       (T
		<TELL ,THERE-IS-NOTHING "there." CR>)>>

<ROUTINE V-LOWER ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?SIT>
		<RTRUE>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<YOU-CANT-X-THAT "lower">)
	       (ELSE
		<HACK-HACK "Lowering">)>>

<ROUTINE V-MELT ()
	 <WITH-PRSI?>>

<ROUTINE V-MOVE ()
	 <COND (<PRSO? <> ROOMS>
		<TELL "What moves!" CR>)
	       (<AND <HELD? ,PRSO>
		     <NOT <FSET? ,PRSO ,BODY-PART>>>
		<TELL
"You're holding " HIM/HER ,PRSO ".  Are you planning to juggle " HIM/HER ,PRSO
"?" CR>)
	       (<AND <FSET? ,PRSO ,TAKEBIT>
		     <DEAD? ,PRSO>>
		<V-TURN-OVER>)
	       (<FSET? ,PRSO ,DOORBIT>
		<PERFORM ,V?OPEN ,PRSO>
		<RTRUE>)
	       (T
		<YOU-CANT-X-PRSO "move">)>>

<ROUTINE MOTION-VERB? ()
	 <VERB? WALK WALK-TO WALK-AROUND
		ENTER EXIT
		DODGE AVOID
		LEAP DIVE DANCE
		TURN-AROUND
		HIDE HIDE-BEHIND HIDE-UNDER
		MOVE BOARD CLIMB-DOWN CLIMB-FOO CLIMB-UP>>

<ROUTINE HOSTILE-VERB? ()
	 <COND (<VERB? ATTACK BITE CUT HIT KICK KILL
		       MOVE MUNG PISS PUSH PUSH-OUT RUB
		       SHAKE SHOOT SPIT SWING THROW TRIP>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     <EQUAL? ,P-PRSA-WORD ,W?GRAB ,W?TACKLE ,W?LUNGE>
		     <FSET? ,PRSO ,PERSON>>
		<RTRUE>)
	       (<AND <VERB? FUCK>
		     <FSET? ,PRSO ,PERSON>
		     <NOT <FSET? ,PERSON ,FEMALE>>>
		<RTRUE>)>>

<ROUTINE JAPANESE-VERB? ()
	 <COND (<VERB? DOMO DOZO GENKI-DESU
		       GOMEN-NASAI HAI ISOGI IYE 
		       KINJIRU KONNICHI-WA KONBANWA MIZU
		       NIHON-GO-GA TEKI WAKARIMASU>)>>

<ROUTINE ACT-CRAZY? ()
	 <OR <VERB? YELL YELL-AT DANCE SING LAUGH BABBLE>
	     <P? ACT CRAZY>>>

"verbs which don't require object to exist/be nearby"

<ROUTINE ABSTRACT-VERB? ()
	 <OR <EVERYWHERE-VERB?>
	     <PAST-TENSE?>>>

"verbs with no object or which don't require touching their object."

<ROUTINE PASSIVE-VERB? ()
	 <OR <ABSTRACT-VERB?>
	     <VERB? ASK-ABOUT BOW COMPARE COUNT CURSE DIE DISEMBARK
		    EXAMINE HELLO LAUGH LISTEN LOOK LOOK-BEHIND
		    LOOK-DOWN LOOK-INSIDE LOOK-UNDER POINT READ
		    REPLY SAY SCARE SHOW SPEAK TELL TELL-ABOUT
		    THANK THOU WAIT WAIT-FOR WALK WAVE-AT
		    YAWN YELL YELL-AT>>>

<ROUTINE V-MUNG ()
	 <HACK-HACK "Trying to break">>

<ROUTINE PRE-OPEN ()
	 <COND (<AND <PAST-TENSE?>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (<AND ,PRSI
		     <NOT <HELD? ,PRSI>>>
		<NOT-HOLDING ,PRSI>)>>

<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<SETG P-LAST-OPEN ,PRSO>)>
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL
,YOU-CANT "open a person, at least not without making a mess." CR>)
	       (<FSET? ,PRSO ,OPENBIT>
		<COND (<FSET? ,PRSO ,OPENABLE>
		       <ALREADY-OPEN>)
		      (ELSE
		       <TELL "It looks open from here." CR>)>)
	       (<OR <AND <NOT <FSET? ,PRSO ,CONTBIT>>
		         <NOT <FSET? ,PRSO ,DOORBIT>>>
		    <FSET? ,PRSO ,SURFACEBIT>>
		<COND (<IN? ,PRSO ,ROOMS>
		       <TELL
,YOU-HAVE-TO "specify a door to open." CR>)
		      (ELSE <TO-A-PRSO?>)>)
	       (<NOT <EQUAL? <GETP ,PRSO ,P?CAPACITY> 0>>
		<COND (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <FSET ,PRSO ,OPENBIT>
		       <FSET ,PRSO ,TOUCHBIT>
		       <COND (<OR <NOT <FIRST? ,PRSO>>
				  <FSET? ,PRSO ,TRANSBIT>>
			      <TELL "Opened." CR>)
			     (<AND <SET F <FIRST? ,PRSO>>
				   <NOT <NEXT? .F>>
				   <SET STR <GETP .F ,P?FDESC>>>
			      <OKAY-THE-PRSO-IS-NOW "open">
			      <TELL .STR CR>)
			     (T
			      <TELL "Opening ">
			      <TELL THE ,PRSO " reveals ">
			      <WHAT-CONTENTS>)>)>)
	       (T ;"door"
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <ALREADY-OPEN>)
		      (<FSET? ,PRSO ,LOCKED>
		       <TELL "It's locked." CR>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <OKAY-THE-PRSO-IS-NOW "open">)>)>>

;<ROUTINE V-PAY ()
	 <COND (<NOT ,PRSI>
		<TELL "Pay with what?" CR>
		<RTRUE>)
	       (T
		<WITH-PRSI?>)>>

<ROUTINE V-PICK ()
	 <YOU-CANT-X-THAT "pick">>

;<ROUTINE V-PLAY ()
         <TELL "How peculiar!" CR>>

<ROUTINE V-PLUG ()
	 <NO-EFFECT> ;"no effect">

<ROUTINE V-POINT ()
	 <COND (<AND <SCENE? ,S-ANJIRO>
		     <IN? ,ONNA ,HERE>
		     <NOT <PRSO? ,ONNA>>>
		<PERFORM ,V?SHOW ,PRSO ,ONNA>
		<RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL "It is considered impolite to point." CR>)
	       (ELSE
		<TELL "You are now pointing at " A ,PRSO "." CR>)>>

<ROUTINE V-POUR-FROM ()
	 <COND (<IN? ,PRSO ,PRSI>
		<PERFORM ,V?POUR ,PRSO>
		<RTRUE>)
	       (ELSE
		<TELL "It's not in that!" CR>)>>

<ROUTINE PRE-POUR ()
	 <COND (<EQUAL? ,PRSO ,PRSI>
		<TELL-YUKS>)>>

<ROUTINE V-POUR ()
	 <COND (<AND <FSET? ,PRSO ,CONTBIT>
		     <HELD? ,PRSO>>
		<EMPTY-ALL ,PRSO ,PRSI>)
	       (ELSE
		<YOU-CANT-X-THAT "pour">)>>

<ROUTINE EMPTY-ALL (FROM TO "AUX" F N R (1ST? <>))
	 <MAP-CONTENTS (F N .FROM)
		       <COND (<FSET? .F ,TAKEBIT>
			      <SET 1ST? T>
			      <TELL D .F ": ">
			      <SET R
				   <COND (.TO
					  <PERFORM ,V?PUT .F .TO>)
					 (ELSE
					  <PERFORM ,V?DROP .F>)>>
			      <COND (<EQUAL? .R ,M-FATAL> <RTRUE>)>)>>
	 <COND (<NOT .1ST?> <TELL CTHE .FROM " is empty." CR>)>
	 <RTRUE>>

;<ROUTINE V-PUMP ()
	 <TELL "It's not clear how." CR>>

<ROUTINE V-PUSH ()
	 <HACK-HACK "Pushing">>

<ROUTINE V-PUSH-TO ()
	 <COND (<PRSI? INTDIR>
		<PERFORM ,V?MOVE ,PRSO>
		<RTRUE>)
	       (ELSE
		<TELL
,YOU-CANT "push " THE ,PRSO " into " THE ,PRSI "!" CR>)>>

<ROUTINE PRE-PUT ("AUX" (L <LOC ,PRSO>))
	 <COND (<OR <IN? ,PRSO ,GLOBAL-OBJECTS>
		    <NOT <FSET? ,PRSO ,TAKEBIT>>>
		<TELL "Nice try." CR>)
	       (<AND <VERB? PUT>
		     <FSET? ,PRSO ,WEAPONBIT>
		     <FSET? ,PRSI ,PERSON>>
		<SWAP-VERB ,V?ATTACK>
		<RTRUE>)
	       (<IN? ,PRSO ,PRSI>
		<TAKE-OUT-FIRST ,PRSO ,PRSI>)
	       (<IN? ,PRSI ,PRSO>
		<TAKE-OUT-FIRST ,PRSI ,PRSO>)
	       (<FSET? .L ,PERSON> <RFALSE>)
	       (<AND <FSET? .L ,CONTBIT>
		     <NOT <FSET? .L ,OPENBIT>>>
		<TAKE-OUT-FIRST ,PRSO .L>)>>

<ROUTINE TAKE-OUT-FIRST (OBJ CONT)
	 <TELL
"You should take " THE .OBJ " out of " THE .CONT " first." CR>>

<ROUTINE V-PUT ("AUX" W)
	 <COND (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,DOORBIT>>
		     <NOT <FSET? ,PRSI ,CONTBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<YOU-CANT-X-THAT>
		<RTRUE>)
	       (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>>
		<INSPECTION-REVEALS ,PRSI>)
	       (<PRSI? ,PRSO>
		<TO-A-PRSO?>)
	       (<IN? ,PRSO ,PRSI>
		<TELL "I think ">
		<TELL THE ,PRSO " is already in ">
		<THE-PRSI>)
	       (<OR <FSET? ,PRSI ,PERSON>
		    <AND <FSET? <SET W <LOC ,PRSI>> ,PERSON>
			 <NOT <EQUAL? .W ,WINNER>>>>
		<COND (<NOT .W> <SET W ,PRSI>)>
		<TELL
"Don't you think you should ask " THE .W " first?" CR>)
	       (<PRSO-TOO-BIG?>
		<TELL ,NO-ROOM CR>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <NOT <EQUAL? <ITAKE> T>>>
		<RTRUE>)
	       (<FSET? ,PRSO ,WEARBIT>
		<HAVE-TO-TAKE-OFF>)
	       (T
		<FCLEAR ,PRSO ,WEARBIT>
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<TELL "Done." CR>)>>

<ROUTINE PRSO-TOO-BIG? ()
	 <COND (<G? <- <+ <WEIGHT ,PRSI> <WEIGHT ,PRSO>>
		       <GETP ,PRSI ,P?SIZE>>
		    <GETP ,PRSI ,P?CAPACITY>>
		<RTRUE>)
	       (ELSE <RFALSE>)>>

<ROUTINE INSPECTION-REVEALS (OBJ)
	 <THIS-IS-IT .OBJ>
	 <TELL "Inspection reveals that " THE .OBJ " isn't open." CR>>

<ROUTINE V-PUT-BEHIND ()
	 <TELL ,YOU-CANT "be sure what's behind there already." CR>>

<ROUTINE V-PUT-ON ()
	 <COND (<PRSI? ,ME>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <TELL "You already have " THE ,PRSO " on." CR>)
		      (ELSE
		       <PERFORM ,V?WEAR ,PRSO>
		       <RTRUE>)>)
	       (<PRSI? ,GROUND>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<V-PUT>)
	       (<AND <FSET? ,PRSI ,PERSON>
		     <NOT <FSET? ,PRSO ,DEAD>>>
		<COND (<FSET? ,PRSO ,WEARABLE>
		       <TELL
"Presumably, " THE ,PRSI " would prefer to dress " HIM/HER ,PRSO "self." CR>)
		      (ELSE
		       <TELL
CTHE ,PRSI " doesn't look like a table to me." CR>)>)
	       (T
		<NO-GOOD-SURFACE>)>>

<ROUTINE NO-GOOD-SURFACE ()
	 <TELL "There's no good surface on ">
	 <THE-PRSI>>

<ROUTINE V-PUT-UNDER ()
         <YOU-CANT-X-THAT "put anything under">>

<ROUTINE V-RAISE ()
	 <COND (<AND <FSET? ,PRSO ,PERSON>
		     <NOT <PRSO? ,WINNER ,ME>>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<TELL ,YOU-CANT "raise that." CR>)
	       (<AND <NOT <IN? <LOC ,PRSO> ,WINNER>>
		     <G? <+ <WEIGHT ,PRSO> <WEIGHT ,WINNER>> ,LOAD-ALLOWED>>
		<TELL CTHE ,PRSO " is too heavy." CR>)
	       (ELSE <HACK-HACK "Lifting">)>>

<ROUTINE V-REACH-IN ("AUX" OBJ)
	 <COND (<OR <NOT <FSET? ,PRSO ,CONTBIT>>
		    <FSET? ,PRSO ,PERSON>>
		<TO-A-PRSO?>)
	       (<NOT <FSET? ,PRSO ,OPENBIT>>
		<TELL "It's not open." CR>)
	       (<OR <NOT <SET OBJ <FIRST? ,PRSO>>>
		    <FSET? .OBJ ,INVISIBLE>
		    <NOT <FSET? .OBJ ,TAKEBIT>>>
		<ITS-EMPTY>)
	       (T
		<TELL
G "You feel something " "in " THE ,PRSO "!" CR>
		<RTRUE>)>>

<ROUTINE PRE-READ ()
	 <COND (<NOT ,LIT>
		<TELL ,YOU-CANT "read in the dark." CR>)
	       (<AND ,PRSI <NOT <FSET? ,PRSI ,TRANSBIT>>>
		<HOW-DO-YOU> <A-PRSI?>)>>

<ROUTINE HOW-DO-YOU ()
	 <TELL "How do you do that with ">>

<ROUTINE V-READ ()
	 <COND (<AND <FSET? ,PRSO ,READBIT>
		     <GETP ,PRSO ,P?TEXT>>
		<TELL <GETP ,PRSO ,P?TEXT> CR>)
               (T
                <TO-A-PRSO?>)>>

<ROUTINE V-REPLY ()
	 <END-QUOTE>
	 <COND (<PRSO? INTQUOTE>
		<TELL
"[Please answer without using quotes.]" CR>)
	       (<PRSO? ,QCONTEXT>
		<COND (<NOT ,PRSI>
		       <PERFORM ,V?ANSWER>
		       <RTRUE>)
		      (ELSE
		       <PERFORM ,V?REPLY ,PRSI>
		       <RTRUE>)>)
	       (<AND <NOT ,PRSI>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (ELSE
		<TELL "You are ignored." CR>)>>

<ROUTINE PRE-SRUB ()
	 <SWAP-VERB ,V?RUB>
	 <RTRUE>>

<ROUTINE V-SRUB ()
	 <RTRUE>>

<ROUTINE V-RUB ("AUX" H)
	 <COND (<PRSO? ,AIR>
		<TELL "It's ">
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <TELL "cold." CR>)
		      (ELSE
		       <TELL "warm." CR>)>)
	       (ELSE
		<HACK-HACK "Touching">)>>

<ROUTINE V-SAY ("AUX" V)
	 <COND (<AND <PRSO? INTQUOTE>
		     <OR ,OMI-QUESTION
			 ,YABU-QUESTION
			 ,RODRIGUES-QUESTION
			 ,AFTERMATH-QUESTION>>
		<HOW-TO-USE-TELL ,PRSI>)
	       (<TRY-QCONTEXT?> <RTRUE>)
	       (<PRSO? ,ENGLISH ,PORTUGUESE ,SPANISH
		       ,DUTCH ,LATIN ,JAPANESE>
		<PERFORM ,V?SPEAK ,PRSO ,PRSI>
		<RTRUE>)
	       (<NOT ,PRSI>
		<TELL
"If you wish to speak to someone, you should say (for example) \"">
		<COND (<SET V <FIND-IN ,HERE ,PERSON>>
		       <TELL D .V>)
		      (ELSE <TELL I"person">)>
		<TELL ", "I"what you want to say""\"" CR>
		<END-QUOTE>)>>

<ROUTINE HOW-TO-USE-TELL (WHO)
	 <TELL
"[The correct way to speak to others is to use their name followed by a comma,
and then what you want to say to them.  For example:|
>">
	 <COND (.WHO <TELL D .WHO>)
	       (<AND ,QCONTEXT <IN? ,QCONTEXT ,HERE>>
		<TELL D ,QCONTEXT>)
	       (ELSE <TELL I"person">)>
	 <TELL ", ">
	 <PRINT-INTQUOTE>
	 <TELL CR "]" CR>
	 <END-QUOTE>>

<ROUTINE V-SEARCH ()
	 <COND (<AND ,PRSI <FSET? ,PRSI ,PERSON>>
		<PERFORM ,V?FIND ,PRSI>
		<RTRUE>)
	       (<FSET? ,PRSO ,DEAD>
		<TELL
CTHE ,PRSO " can't object, being dead, but you find nothing interesting." CR>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL
CTHE ,PRSO " refuse"S ,PRSO "." CR>)
	       (<NOT <DESCRIBE-CONTENTS ,PRSO
					<>
					<+ ,D-ALL? ,D-PARA?>>>
		<TELL ,THERE-IS-NOTHING "there" ,PERIOD>)>>

<ROUTINE V-SEND ()
	 <COND (<AND <PAST-TENSE?>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (<AND <FSET? ,PRSO ,PERSON>
		     ,PRSI
		     <FSET? ,PRSI ,PERSON>>
		<TELL
D ,PRSO " isn't interested in seeing " D ,PRSI "." CR>)
	       (<AND <FSET? ,PRSO ,PERSON>
		     <PRSI? <> ,INTDIR>>
		<TELL
D ,PRSO G" doesn't seem to want to go." CR>)
	       (<AND ,PRSI
		     <FSET? ,PRSI ,PERSON>
		     <PRSO? ,INTDIR>>
		<TELL
D ,PRSI G" doesn't seem to want to go." CR>)
	       (T
		<TELL-YUKS>)>>

<ROUTINE V-SEND-UNDER ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL CTHE ,PRSO " refuses." CR>)
	       (ELSE
		<TELL "Look again, you're giving orders to " A ,PRSO "!" CR>)>>

<ROUTINE PRE-SGIVE ()
	 <SWAP-VERB ,V?GIVE>
	 <RTRUE>>

<ROUTINE V-SGIVE ()
	 <RTRUE>>

<ROUTINE V-SHAKE ("AUX" X)
	 <COND (<PRSO? ,HEAD>
		<PERFORM ,V?NO>
		<RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL "Be real." CR>)
	       ;(<NOT <FSET? ,PRSO ,TAKEBIT>>
		<TELL ,YOU-CANT "take it; thus, you can't shake it!" CR>)
	       (T
		<TELL "There's no point in shaking ">
		<THAT/THEM ,PRSO>
		<TELL "." CR>)>>

<ROUTINE THAT/THEM (OBJ)
	 <COND (<FSET? .OBJ ,PLURAL> <TELL "them">)
	       (ELSE <TELL "that">)>>

<ROUTINE V-SHARPEN ()
	 <TELL "You'll never sharpen anything with ">
	 <THAT/THEM ,PRSI>
	 <TELL "!" CR>>

<ROUTINE V-SHOOT-WITH ()
	 <PERFORM ,V?SHOOT ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE PRE-SHOOT ()
	 <COND (<AND <PRSO? ,PISTOL>
		     <FSET? ,PISTOL ,RMUNGBIT>>
		<TELL
"You fire, but the pistol just goes \"click!\"  It isn't loaded!" CR>)
	       (<NOT ,PRSI>
		<COND (<PRSO? ,PISTOL>
		       <FSET ,PISTOL ,RMUNGBIT>
		       <TELL
"You fire " THE ,PRSO " into the air, to little effect." CR>)
		      (<HELD? ,PISTOL>
		       <PERFORM ,V?SHOOT ,PISTOL ,PRSO>
		       <RTRUE>)
		      (<HELD? ,PRSO>
		       <TELL
"Few would consider " A ,PRSO " to be an adequate firearm." CR>)
		      (ELSE
		       <TELL
"You don't have a weapon to shoot " THE ,PRSO " with." CR>)>)>>

<ROUTINE V-SHOOT ()
	 <COND (<PRSO? ,PISTOL>
		<COND (<PRSI? ,PISTOL>
		       <TELL
"A difficult maneuver, in fact an impossible one." CR>
		       <RTRUE>)>
		<COND (<OR <NOT <PRSI? MARIKO ETSU CHIMMOKO ACHIKO YABU
				       KIRITSUBO>>
			   <FSET? ,PRSI ,DEAD>
			   <JIGS-UP? ,J-SHOOT-FRIEND
"Why would you want to shoot a friend?">>
		       <FSET ,PISTOL ,RMUNGBIT>
		       <TELL
"You fire the pistol at " THE ,PRSI>
		       <COND (<FSET? ,PRSI ,DEAD>
			      <TELL ", who was already dead." CR>)
			     (<FSET? ,PRSI ,PERSON>
			      <COND (<GETPT ,PRSI ,P?OWNER>
				     <PUTP ,PRSI ,P?OWNER ,BLACKTHORNE>)>
			      <TELL ", killing ">
			      <COND (<NOT <FSET? ,PRSI ,PLURAL>>
				     <FSET ,PRSI ,DEAD>
				     <TELL HIM/HER ,PRSI>)
				    (ELSE
				     <TELL "one of them">)>
			      <TELL " instantly." CR>)
			     (<PRSI? ,GROUND ,WALL>
			      <TELL ", to no useful effect." CR>)
			     (ELSE
			      <TELL ", missing by a mile." CR>)>
		       <COND (<PRSI? MARIKO ETSU CHIMMOKO ACHIKO YABU>
			      <CRLF>
			      <JIGS-UP
"You hear a scream from the others.  \"The Anjin-san has gone mad!\" they
yell.  You are quickly overcome and dispatched, as a mad dog would be.">)
			     (ELSE <RTRUE>)>)
		      (ELSE <RTRUE>)>)
	       (ELSE
		<TELL
"If you had a weapon, you might be able to shoot it.  Alas, you don't." CR>)>>

<ROUTINE V-SHOW ()
	 <COND (<FSET? ,PRSI ,PERSON>
		<UNINTERESTED ,PRSI>)
	       (ELSE <TELL-YUKS>)>>

<ROUTINE V-SKIP ()
	 <TELL "Anyone who saw you would be unfavorably impressed." CR>>

<ROUTINE V-SLEEP ()
	 <COND (,OPPONENT
		<TELL
"If you can sleep at a time like this, you have nerves of steel!" CR>)
	       (ELSE
		<TELL
"You try to sleep, but you can't let yourself relax now." CR>)>>

<ROUTINE LIKE-A-PRSO (V)
	 <TELL CHE/SHE ,PRSO " " .V " just like " A ,PRSO "." CR>>

<ROUTINE V-SMELL ()
	 <COND (,PRSO
		<LIKE-A-PRSO "smells">)
	       (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM-PRSA <LOC ,WINNER>>
		<RTRUE>)
	       (ELSE
		<TELL
"There's no noticeable smell here." CR>)>>

;<ROUTINE V-SPAY ()
	 <SWAP-VERB ,V?PAY>
	 <RTRUE>>

;<ROUTINE V-SPIN ()
	 <YOU-CANT-X-THAT "spin">>

<ROUTINE PRE-SSHOW ()
	 <SWAP-VERB ,V?SHOW>
	 <RTRUE>>

<ROUTINE V-SSHOW ()
	 <RTRUE>>

<ROUTINE V-SWING ()
	 <COND (<NOT ,PRSI>
		<TELL "Whoosh!" CR>)
	       (T
		<PERFORM ,V?HIT ,PRSI ,PRSO>
		<RTRUE>)>>

<ROUTINE V-SWIM ()
	 <TELL-YUKS>>

<ROUTINE V-SWIM-TO ()
	 <PERFORM ,V?WALK-TO ,PRSO>
	 <RTRUE>>

<ROUTINE PRE-TAKE ()
	 <COND (<AND <IN? ,PRSO ,WINNER>
		     <FSET? ,PRSO ,WEARBIT>>
		<RFALSE>)
	       (<AND <IN? ,PRSO ,WINNER>
		     <NOT <NOUN-USED? ,PRSO ,W?WATER>>>
		<TELL ,YOU-HAVE THE ,PRSO "." CR>)
	       (<AND <NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		     <LOC ,PRSO>
		     <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<CANT-REACH-THAT>
		<RTRUE>)
	       (,PRSI
		<COND (<PRSO? ,ME>
		       <PERFORM ,V?DROP ,PRSI>
		       <RTRUE>)
		      (<OR <HELD? ,PRSO ,PRSI>
			   <EQUAL? ,PRSI <GETP ,PRSO ,P?OWNER>>>
		       <SETG PRSI <>>
		       <RFALSE>)
		      (<FSET? ,PRSI ,PERSON>
		       <TELL
CTHE ,PRSI " doesn't seem to have " THE ,PRSO "." CR>
		       <RTRUE>)
		      (ELSE
		       <TELL CTHE ,PRSO " isn't there." CR>
		       <RTRUE>)>)
	       (<PRSO? <LOC ,WINNER>>
		<TELL "You are ">
		<COND (<FSET? ,PRSO ,PERSON> <TELL "being carried by">)
		      (<FSET? ,PRSO ,SURFACEBIT> <TELL "on">)
		      (ELSE <TELL "in">)>
		<TELL " it!" CR>)>>

"return true if prso or prsi is inaccessible from vehicle and verb requires
access to it.  e.g.,
  >EXAMINE obj-outside-vehicle => rfalse
  >TAKE obj-outside-vehicle => rtrue"

;<ROUTINE NOT-REACHABLE? ()
	 <COND (<PASSIVE-VERB?> <RFALSE>)>
	 <COND (<NOT-IN-VEHICLE? ,PRSO> <RETURN ,PRSO>)
	       (<NOT-IN-VEHICLE? ,PRSI> <RETURN ,PRSI>)>>

;<ROUTINE CANT-REACH-FROM-VEHICLE (O)
	 <TELL
,YOU-CANT "reach " THE .O " from within " THE <LOC ,WINNER> "." CR>>

;<ROUTINE NOT-IN-VEHICLE? (PP "AUX" (V <LOC ,WINNER>))
	 <COND (<OR <NOT .PP>
		    <EQUAL? .PP .V ,ROOMS>
		    <INTRINSIC? .PP>
		    <HELD? .PP>
		    <EQUAL? <META-LOC .PP> .V>>
		<RFALSE>)
	       (ELSE <RTRUE>)>>

<ROUTINE V-TAKE ("AUX" SIZ)
	 <COND (<EQUAL? <ITAKE> T>
		<SET SIZ <GETP ,PRSO ,P?SIZE>>
		<TELL "Taken">
		<COND (<G=? .SIZ 20>
		       <TELL ", but it's ">
		       <COND (<G=? .SIZ 100>
			      <TELL "extremely">)
			     (<G=? .SIZ 50>
			      <TELL "very">)>
		       <TELL " heavy">)>
		<TELL "." CR>)>>

<ROUTINE PUT-ON (OBJ "OPT" (WHO ,WINNER))
	 <MOVE .OBJ .WHO>
	 <FSET .OBJ ,WEARBIT>>

<ROUTINE TAKE-OFF (OBJ)
	 <MOVE .OBJ ,HERE>
	 <FCLEAR .OBJ ,WEARBIT>>

<ROUTINE V-TAKE-OFF ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<NEW-VERB ,V?DISEMBARK>
		<RTRUE>)
	       (<AND <FSET? ,PRSO ,WEARBIT>
		     <IN? ,PRSO ,WINNER>>
		<FCLEAR ,PRSO ,WEARBIT>
		<TELL
"You're no longer wearing " THE ,PRSO ,PERIOD>)
	       (ELSE
		<NEW-VERB ,V?TAKE>
		<RTRUE>)>>

<ROUTINE V-HOLD ("AUX" O)
	 <COND (<FSET? ,PRSO ,BODY-PART>
		<SET O <GET-OWNER ,PRSO>>
		<COND (<NOT <EQUAL? .O ,ME ,BLACKTHORNE <>>>
		       <TELL
"It seems unavailable at the moment." CR>)
		      (<PRSO? ,HEAD>
		       <TELL "Do you have a headache?" CR>)
		      (ELSE
		       <TELL
"You hold your " D ,PRSO " as best you can." CR>)>)
	       (<HELD? ,PRSO>
		<COND (<IN? ,PRSO ,WINNER>
		       <COND (<AND <FSET? ,PRSO ,WEARBIT>
				   <FSET? ,PRSO ,WEAPONBIT>>
			      <FCLEAR ,PRSO ,WEARBIT>
			      <TELL
"You take " THE ,PRSO " and prepare to use " HIM/HER ,PRSO "." CR>)
			     (ELSE
			      <TELL
"You hold " HIM/HER ,PRSO " tightly." CR>)>)
		      (ELSE
		       <TELL
"You take " THE ,PRSO " out of " THE <LOC ,PRSO> " and hold "
HIM/HER ,PRSO "." CR>
		       <MOVE ,PRSO ,WINNER>
		       <RTRUE>)>)
	       (ELSE
		<TELL "You don't have " THE ,PRSO "." CR>)>>

<ROUTINE V-TELL ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<COND (<AND <FSET? ,PRSO ,DEAD>
			    <NOT <PRSO? ,MARIKO>>>
		       <TELL
,YOU-CANT G"expect a response from a dead person!" CR>
		       <END-QUOTE>
		       <RFATAL>)
		      (,P-CONT
		       <SETG WINNER ,PRSO>
		       <RTRUE>)
		      (T
		       <TELL
CTHE ,PRSO " wait">
		       <COND (<NOT <FSET? ,PRSO ,PLURAL>>
			      <TELL "s">)>
		       <TELL " for you to say something." CR>
		       <END-QUOTE>
		       <RFATAL>)>)
	       (T
		<YOU-CANT-X-PRSO "talk to">
		<END-QUOTE>
		<RFATAL>)>>

<ROUTINE V-THANK ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<OR <NOT ,PRSO> <PRSO? ,YOU ,ME>>
		<COND (<FSET? ,JAPANESE ,SCOREBIT>
		       <TELL "You're welcome." CR>)
		      (ELSE
		       <TELL "Domo." CR>)>)
	       (<FSET? ,PRSO ,PERSON>
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
CTHE ,PRSO " is beyond all politeness now." CR>)
		      (<PRSO? ,RODRIGUES>
		       <TELL
"\"You're welcome, Ingeles.\"" CR>)
		      (<PRSO? ,SEBASTIO ,OPPONENT>
		       <TELL
"He ignores your politeness." CR>)
		      (<NOT <FSET? ,PRSO ,JAPANESEBIT>>
		       <TELL
CTHE ,PRSO " is surprised by your politeness." CR>)
		      (ELSE
		       <COND (<FSET? ,PRSO ,PLURAL>
			      <TELL CA ,PRSO>)
			     (ELSE
			      <TELL CTHE ,PRSO>)>
		       <TELL " bows and responds \"Domo.\"" CR>)>)
	       (T
		<TO-A-PRSO?>)>>

<ROUTINE V-DOMO ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (ELSE
		<TELL "How very kind!" CR>)>>

<ROUTINE V-DOZO ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (ELSE
		<TELL "There is no response." CR>)>>

<ROUTINE PRE-THROUGH ()
	 <COND (<OR <PRSO? ,ROOMS>
		    <IN? ,PRSO ,ROOMS>
		    <ACCESSIBLE? ,PRSO>>
		<RFALSE>)
	       (ELSE
		<TELL "You can't see any " D ,PRSO " here." CR>)>>

<ROUTINE V-THROUGH ("AUX" M)
	<COND (<IN? ,PRSO ,ROOMS>
	       <PERFORM ,V?WALK-TO ,PRSO>
	       <RTRUE>)
	      (<PRSO? ,ROOMS>
	       <DO-WALK ,P?IN>)
	      (<FSET? ,PRSO ,VEHBIT>
	       <NEW-VERB ,V?BOARD>
	       <RTRUE>)
	      (<FSET? ,PRSO ,DOORBIT>
	       <COND (<SET M <FIND-DOOR ,PRSO>>
		      <DO-WALK .M>)
		     (ELSE
		      <TELL
,YOU-HAVE-TO G"be more specific about ""the direction you are going." CR>)>)
	      (<FSET? ,PRSO ,PERSON>
	       <TELL ,GOOD-TRICK>)
	      (<NOT <FSET? ,PRSO ,TAKEBIT>>
	       <TELL
"You hit your head against " THE ,PRSO " as you attempt this feat." CR>)
	      (<IN? ,PRSO ,WINNER>
	       <TELL "That would involve quite a contortion!" CR>)
	      (T
	       <TELL-YUKS>)>>

<ROUTINE FIND-DOOR (DOOR "AUX" DIR PT PTS)
	 <MAP-DIRECTIONS (DIR PT ,HERE)
		<COND (<AND <EQUAL? <PTSIZE .PT> ,DEXIT>
			    <EQUAL? <GET .PT ,DEXITOBJ> .DOOR>>
		       <RETURN .DIR>)>>>

<ROUTINE PRE-THROW ()
	 <COND (<PRSO? ,ANCHOR ,ERASMUS-ANCHOR ,MARIKO ,SAFETY-LINE
		       ,OAR ,LIFE-RING>
		<RFALSE>)
	       (<NOT <HELD? ,PRSO>>
		<TELL "You're not carrying " THE ,PRSO "." CR>)
	       (<PRSO? ,LARGE-KNIFE ,SMALL-KNIFE>
		<RFALSE>)
	       (<FSET? ,PRSO ,WEARBIT>
		<YOULL-HAVE-TO "take them off">)>>

<ROUTINE V-THROW ()
	 <COND (<AND ,PRSI <FSET? ,PRSI ,PERSON>>
	        <COND (<IN? ,PRSO ,WINNER>
		       <COND (<IDROP>
			      <NOT-TRAINED ,PRSI>)>)
		      (ELSE
		       <SWAP-VERB ,V?HIT>
		       <RTRUE>)>)
	       (<AND ,PRSI
		     <NOT <PRSI? PSEUDO-OBJECT>>
		     <FSET? ,PRSO ,WEAPONBIT>>
		<SWAP-VERB ,V?HIT>
		<RTRUE>)
	       (<AND ,PRSI
		     <NOT <FSET? ,PRSI ,DOORBIT>>
		     <FSET? ,PRSI ,CONTBIT>
		     <GETP ,PRSI ,P?CAPACITY>>
		<NEW-VERB ,V?PUT>
		<RTRUE>)
	       (<IDROP>
		<TELL "Thrown." CR>)>>

<ROUTINE V-THROW-OFF ()
	 <COND (<GLOBAL-IN? ,LG-SEA ,HERE>
		<REMOVE ,PRSO>
		<TELL
"Splash! " CTHE ,PRSO " is gone for good now!" CR>)
	       (ELSE
		<YOU-CANT-X-THAT "throw anything off">)>>

<ROUTINE V-TIE ()
	 <COND (<AND <NOT ,PRSI>
		     <NOT <PRSO? ,YABU-KIMONO>>
		     <HELD? ,YABU-KIMONO>>
		<PERFORM ,V?TIE ,PRSO ,YABU-KIMONO>
		<RTRUE>)
	       (<PRSO? ,MURA-ROPE>
		<TELL "You can't get it away from Mura." CR>)
	       (ELSE
		<TO-A-PRSO?>)>>

<ROUTINE V-TIE-UP ()
	 <TO-A-PRSO?>>

<ROUTINE V-TIME ("AUX" X)
	 <TELL "You have no easy way to tell time." CR>>

<ROUTINE V-TORTURE ()
	 <TELL "An appalling idea!" CR>>

<ROUTINE NO-EFFECT () ;"used by others"
	 <TELL "This has no effect." CR>>

<ROUTINE V-TURN () ;"used by others"
	 <COND (<AND <PRSO? INTDIR>
		     <SCENE? ,S-ERASMUS ,S-VOYAGE>>
		<TELL "You must be on the bridge to steer!" CR>)
	       (ELSE
		<NO-EFFECT>)>>

<ROUTINE V-TURN-OVER ()
	 <TELL "Moving " THE ,PRSO " reveals nothing." CR>>

<ROUTINE V-TURN-AROUND ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?LOOK-BEHIND ,ME>
		<RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL
"I wouldn't do that, " THE ,PRSO " might get dizzy." CR>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<TELL
,YOU-CANT "turn " THE ,PRSO " around." CR>)
	       (ELSE
		<TELL
"Turning " THE ,PRSO " around gives you a new perspective on it, but
reveals no new information." CR>)>>

<ROUTINE V-UNLOCK ()
	 <COND (<AND <PAST-TENSE?>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (<NOT <PRSI? <> ,KEY>>
		<CANT-X-WITH-PRSI "unlock">)
	       (<FSET? ,PRSO ,LOCKABLE>
		<COND (<NOT <FSET? ,PRSO ,LOCKED>>
		       <TELL G"It already is." CR>)
		      (<IN? ,KEY ,WINNER>
		       <FCLEAR ,PRSO ,LOCKED>
		       <TELL "Done." CR>)
		      (ELSE <TELL G"You need a key to do that." CR>)>)
	       (ELSE 
		<NO-LOCK>)>>

<ROUTINE V-UNTIE ()
	 <TO-A-PRSO?>>

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	 <COND (<AND ,QCONTEXT
		     <PAST-TENSE?>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (<PAST-TENSE?>
		<TELL
"An interesting fact, indeed." CR>)
	       (<NOT ,P-WALK-DIR>
		<NEW-VERB ,V?WALK-TO>
		<RTRUE>)
	       (<B-NOT-STANDING?>
		<YOULL-HAVE-TO "stand up">)
	       (<SET PT <GETPT ,HERE ,PRSO>>
		<SET PTS <PTSIZE .PT>>
		<COND (<EQUAL? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<EQUAL? .PTS ,UEXIT>
		       <SET RM <GETB .PT ,REXIT>>)
		      (<EQUAL? .PTS ,FEXIT>
		       <COND (<NOT <SET RM <APPLY <GET .PT ,FEXITFCN>>>>
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>>
			      <SET RM <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <CANT-GO>
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,DEXIT>
		       <SET OBJ <GET .PT ,DEXITOBJ>>
		       <COND (<FSET? .OBJ ,INVISIBLE>
			      <CANT-GO>
			      <RFATAL>)
			     (<OR <FSET? .OBJ ,OPENBIT>
				  <AND <NOT <FSET? .OBJ ,LOCKED>>
				       <NOT <FSET? .OBJ ,TRYTAKEBIT>>>>
			      <SET RM <GETB .PT ,DEXITRM>>
			      <COND (<NOT <FSET? .OBJ ,OPENBIT>>
				     <FSET .OBJ ,OPENBIT>
				     <TELL
"You open " THE .OBJ " and go through." CR CR>)>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <TELL .STR CR>
			      <THIS-IS-IT .OBJ>
			      <RFATAL>)
			     (T
			      <TELL-OPEN-CLOSED .OBJ>
			      <THIS-IS-IT .OBJ>
			      <RFATAL>)>)>
		<COND (<SCENE? ,S-NINJA>
		       <COND (<AND <NOT ,AVOID-CALTROPS?>
				   <IN? ,CALTROPS ,HERE>>
			      <COND (<PROB 35>
				     <JIGS-UP
"The tiny metal balls on the floor have needle spikes.  You step on one in
your hurry, and find that they are poisoned!  The fiery pain shoots up your
leg, and in no time you fall to the floor in agony.">
				     <RFATAL>)
				    (ELSE
				     <TELL
"As you hurry along, you narrowly miss stepping on a caltrop!" CR CR>)>)
			     (<IN? ,SMOKE-BOMB ,HERE>
			      <TELL
"You try to advance, but the acrid, choking smoke prevents you." CR>
			      <RFATAL>)
			     (<IN? ,FIRE-BOMB ,HERE>
			      <TELL
"The floor is covering with burning pitch which sticks to your feet and
drives you back." CR>
			      <RFATAL>)>)>
		<GOTO .RM>)
	       (<AND <EQUAL? ,PRSO ,P?IN ,P?OUT>
		     ,P-LAST-OPEN
		     <GLOBAL-IN? ,P-LAST-OPEN ,HERE>>
		<PERFORM ,V?THROUGH ,P-LAST-OPEN>
		<RTRUE>)
	       (T
		<CANT-GO>
		<RFATAL>)>>

<GLOBAL P-LAST-OPEN <>>

<ROUTINE V-WALK-AROUND ()
	 <TELL "Please use compass directions instead." CR>>

<ROUTINE V-WALK-TO ("AUX" DIR TMP)
	 <COND (,PRSO
		<COND (<AND ,QCONTEXT
			    <PAST-TENSE?>
			    <TRY-QCONTEXT?>>
		       <RTRUE>)
		      (<PRSO? ,INTDIR>
		       <DO-WALK ,P-DIRECTION>
		       <RTRUE>)
		      (<IN? ,PRSO ,ROOMS>
		       ;"do this first because rooms can be in GLOBALS"
		       <COND (<SET DIR <NEXT-ROOM? ,PRSO>>
			      <DO-WALK .DIR>)
			     (ELSE
			      <TELL
,YOU-HAVE-TO G"specify a direction." CR>)>)
		      (<OR <IN? ,PRSO ,HERE>
			   <GLOBAL-IN? ,PRSO ,HERE>>
		       <COND (<FSET? ,PRSO ,PERSON>
			      <COND (<FSET? ,PRSO ,PLURAL>
				     <TELL "They're">)
				    (<FSET? ,PRSO ,FEMALE>
				     <TELL "She's">)
				    (ELSE <TELL "He's">)>)
			     (ELSE <TELL "It's">)>
		       <TELL " here!" CR>)
		      (<AND <SET TMP <META-LOC ,PRSO>> 
			    <IN? .TMP ,ROOMS>>
		       <PERFORM ,PRSA .TMP>
		       <RTRUE>)
		      (ELSE
		       <TELL
"I'm not sure how to get to ">
		       <COND (<FSET? ,PRSO ,PERSON>
			      <COND (<FSET? ,PRSO ,PLURAL>
				     <TELL "them">)
				    (<FSET? ,PRSO ,FEMALE>
				     <TELL "her">)
				    (ELSE <TELL "him">)>)
			     (ELSE
			      <TELL "that">)>
		       <TELL "." CR>)>)
	       (T
		<V-WALK-AROUND>)>>

<ROUTINE NEXT-ROOM? (RM "OPT" (STRICT? <>) "AUX" DIR PT PTS OBJ)
	 <MAP-DIRECTIONS (DIR PT ,HERE)
		<SET PTS <PTSIZE .PT>>
		<COND (<EQUAL? .PTS ,NEXIT>)
		      (<AND <EQUAL? .PTS ,UEXIT>
			    <EQUAL? <GETB .PT ,REXIT> .RM>>
		       <RETURN .DIR>)
		      (<AND <EQUAL? .PTS ,CEXIT>
			    <EQUAL? <GETB .PT ,REXIT> .RM>>
		       <COND (<OR <NOT .STRICT?>
				  <VALUE <GETB .PT ,CEXITFLAG>>>
			      <RETURN .DIR>)>)
		      (<AND <EQUAL? .PTS ,DEXIT>
			    <EQUAL? <GETB .PT ,DEXITRM> .RM>>
		       <SET OBJ <GET .PT ,DEXITOBJ>>
		       <COND (<OR <NOT .STRICT?>
				  <AND <NOT <FSET? .OBJ ,INVISIBLE>>
				       <FSET? .OBJ ,OPENBIT>>>
			      <RETURN .DIR>)>)
		      (<AND <EQUAL? .PTS ,FEXIT>
			    <EQUAL? <APPLY <GET .PT ,FEXITFCN>
					   ,M-ENTER
					   .STRICT?>
				    .RM>>
		       <RETURN .DIR>)>>
	 <RFALSE>>

<ROUTINE V-WAIT ("AUX" (NUM 3))
	 <COND (<PRSO? ,INTNUM>
		<COND (<G? ,P-NUMBER 100>
		       <TELL "Too long!" CR>)
		      (T
		       <SET NUM ,P-NUMBER>)>)>
	 <TELL "Time passes..." CR>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0>
			<RETURN>)
		       (<CLOCKER>
			<RETURN>)>>
	 <SETG CLOCK-WAIT T>
	 <RTRUE>>

<ROUTINE V-WAIT-FOR ()
	 <COND (<PRSO? INTNUM>
		<NEW-VERB ,V?WAIT>
		<RTRUE>)
	       (<EQUAL? <LOC ,PRSO> ,HERE ,WINNER>
		<CPRINT-HE/SHE ,PRSO>
		<TELL "'s already here!" CR>)
	       (T
		<TELL "You may well wait quite a while." CR>)>>

<ROUTINE V-WAVE ()
	 <COND (<AND <NOT <HELD? ,PRSO>>
		     <FSET? ,PRSO ,BODY-PART>>
		<YOU-ARENT-HOLDING>)
	       (ELSE
		<HACK-HACK "Waving">)>>

<ROUTINE YOU-ARENT-HOLDING ()
	 <TELL "You aren't holding " THE ,PRSO "." CR>>

<ROUTINE V-WAVE-AT ()
	 <COND (<AND <NOT <HELD? ,PRSO>>
		     <FSET? ,PRSO ,BODY-PART>>
		<YOU-ARENT-HOLDING>)
	       (<PRSO? ,HEAD>
		<COND (<NOT ,PRSI>
		       <PERFORM ,V?NO>
		       <RTRUE>)
		      (<FSET? ,PRSI ,PERSON>
		       <SETG WINNER ,PRSI>
		       <PERFORM ,V?NO>
		       <SETG WINNER ,PLAYER>
		       <RTRUE>)
		      (ELSE
		       <TELL
"Shaking one's head at " A ,PRSI " accomplishes little." CR>)>)
	       (<AND ,PRSI <FSET? ,PRSI ,PERSON>>
		<PERFORM ,V?WAVE-AT ,PRSI>
		<RTRUE>)
	       (<PRSO? ,ME>
		<TELL "What a peculiar idea!" CR>)
	       (ELSE
		<TELL CTHE ,PRSO IS/ARE ,PRSO "n't likely to respond." CR>)>>

<ROUTINE V-DRESS ("AUX" (OBJ <>) LAST)
	 <REPEAT ()
	    <SET LAST .OBJ>
	    <SET OBJ <>>
	    <COND (<AND <HELD? ,CLOTHES>
			<NOT <FSET? ,CLOTHES ,WEARBIT>>>
		   <SET OBJ ,CLOTHES>)
		  (<AND <HELD? ,BOOTS>
			<NOT <FSET? ,BOOTS ,WEARBIT>>>
		   <SET OBJ ,BOOTS>)
		  (<AND <HELD? ,KIMONO>
			<NOT <FSET? ,KIMONO ,WEARBIT>>>
		   <SET OBJ ,KIMONO>)
		  (<AND <HELD? ,SOCKS>
			<NOT <FSET? ,SOCKS ,WEARBIT>>>
		   <SET OBJ ,SOCKS>)
		  (<AND <ACCESSIBLE? ,SANDALS>
			<NOT <FSET? ,SANDALS ,WEARBIT>>>
		   <SET OBJ ,SANDALS>)>
	 <COND (.OBJ
		<FSET .OBJ ,RMUNGBIT> ;"prevents recursion"
		<PERFORM ,V?WEAR .OBJ>
		<FCLEAR .OBJ ,RMUNGBIT>
		<COND (<NOT <FSET? .OBJ ,WEARBIT>>
		       <RTRUE>)>)
	       (<NOT .LAST>
		<TELL "You don't have anything to wear!" CR>
		<RTRUE>)
	       (ELSE <RTRUE>)>>>

<ROUTINE V-WEAR ()
	 <COND (<FSET? ,PRSO ,WEARBIT>
		<TELL ,YOU-ARE ,PERIOD>)
	       (<FSET? ,PRSO ,WEARABLE>
		<COND (<EQUAL? ,PLAYER <GETP ,PRSO ,P?OWNER>>
		       <COND (<AND <NOT <HELD? ,PRSO>>
				   <NOT <ITAKE T>>>
			      <RTRUE>)
			     (ELSE
			      <FSET ,PRSO ,WEARBIT>
			      <TELL
"You put on " THE ,PRSO "." CR>)>)
		      (ELSE
		       <TELL "They don't fit you." CR>)>)
	       (ELSE
		<YOU-CANT-X-PRSO "wear">)>>

;<ROUTINE V-WHAT ()
	 <TELL "An excellent question." CR>>

;<ROUTINE V-WHERE ()
	 <COND (<NOT ,PRSO>
		<COND (,P-IT-OBJECT
		       <NEW-PRSO ,P-IT-OBJECT>
		       <RTRUE>)
		      (ELSE
		       <TELL "Why?" CR>)>)
	       (ELSE
		<V-FIND T>)>>

;<ROUTINE PRE-WHO ("AUX" P)
	 <COND (<AND ,PRSO
		     <SET P <GETP ,PRSO ,P?PICTURE>>>
		<MARGINAL-PIC .P>
		<RFALSE>)>>

;<ROUTINE V-WHO ()
	 <COND (<NOT ,PRSO> <V-WHAT>)
	       (<FSET? ,PRSO ,PERSON>
		<NEW-VERB ,V?WHAT>
		<RTRUE>)
	       (T
		<TELL "That's not a person!" CR>)>>

<ROUTINE V-YAWN ()
	 <V-LEAN-ON>>

<ROUTINE V-YELL-AT ()
	 <COND (<AND <FSET? ,PRSO ,PERSON>
		     <NOT <FSET? ,PRSO ,DEAD>>>
		<TELL
"You yell at " D ,PRSO " for a while, which improves your disposition,
but not " HIS/HER ,PRSO "." CR>)>>

<ROUTINE V-YELL ()
	 <COND (<PRSO? ,INTQUOTE>
		<TELL
"You yell at out, loud and strong.  ">)>
	 <TELL
"Raising one's voice is very bad manners and very unsettling
to the harmony of those around you." CR>>

<ROUTINE V-LAUGH ()
	 <COND (<NOT ,PRSO> <TELL "Very funny." CR>)
	       (<AND <FSET? ,PRSO ,PERSON>
		     <NOT <FSET? ,PRSO ,DEAD>>>
		<TELL CTHE ,PRSO " doesn't seem to get the joke." CR>)
	       (ELSE
		<TELL "Your brand of humor is unusual." CR>)>>

;"subtitle object manipulation"

<CONSTANT FUMBLE-MAX 9>

<GLOBAL FUMBLE-NUMBER 9>

<ROUTINE ITAKE ("OPTIONAL" (VB T) (OBJ 0) "AUX" CNT)
	 <COND (<ZERO? .OBJ>
		<SET OBJ ,PRSO>)>
	 <COND (<AND <B-NOT-STANDING?>
		     <FSET? ,PRSO ,TAKEBIT>
		     <NOT <PRSO? ,CLOTHES ,QUILT ,TRAY ,FOOD ,CHOPSTICKS
				 ,CUP ,GRUEL ,GROUND ,SWORDS>>>
		<COND (.VB
		       <TELL "You are ">
		       <COND (<FSET? ,WINNER ,SURFACEBIT> <TELL "lying">)
			     (ELSE <TELL "sitting">)>
		       <TELL
" down, and " THE ,PRSO IS/ARE ,PRSO " out of reach." CR>)>
		<RFALSE>)
	       (<NOT <FSET? .OBJ ,TAKEBIT>>
		<COND (.VB
		       <COND (<AND <FSET? .OBJ ,PERSON>
				   <NOT <FSET? .OBJ ,DEAD>>>
			      <TELL
CHE/SHE .OBJ " twist" S .OBJ " away from you." CR>)
			     (ELSE
			      <TELL-YUKS>)>)>
		<RFALSE>)
	       (<IN? .OBJ ,WINNER>
		<TELL ,YOU-HAVE THE .OBJ ,PERIOD>
		<RFALSE>)
	       (<IN? ,WINNER .OBJ>
		<TELL "You are ">
		<COND (<FSET? .OBJ ,SURFACEBIT> <TELL "on">)
		      (ELSE <TELL "in">)>
		<TELL " it." CR>)
	       (<AND <NOT <IN? <LOC .OBJ> ,WINNER>>
		     <G? <+ <WEIGHT .OBJ> <WEIGHT ,WINNER>> ,LOAD-ALLOWED>>
		<COND (.VB
		       <COND (<ZERO? <CCOUNT ,WINNER>>
			      <TELL "It's too heavy to carry">)
			     (T
			      <TELL "Your load is too heavy">)>
		       <COND (<L? <GETP ,WINNER ,P?HEALTH> 4>
			      <TELL
", especially in light of your exhaustion.">)
			     (T
			      <TELL ".">)>
		       <CRLF>)>
		<RFATAL>)
	       (<G? <SET CNT <CCOUNT ,WINNER>> ,FUMBLE-NUMBER>
		<COND (.VB
		       <TELL
"You're holding too many things and can't quite get them all arranged
to take it as well." CR>)>
		<RFATAL>)
	       (T
		<MOVE .OBJ ,WINNER>
		<FSET .OBJ ,TOUCHBIT>
		<FCLEAR .OBJ ,WEARBIT>
		<FCLEAR .OBJ ,NDESCBIT>
		<RTRUE>)>>

<GLOBAL NOTIFY-FLAG <>>

<ROUTINE V-NOTIFY ()
	 <SETG NOTIFY-FLAG <NOT ,NOTIFY-FLAG>>
	 <COND (,NOTIFY-FLAG
		<TELL "Notifying when points are scored." CR>)
	       (ELSE
		<TELL "Keeping quiet when points are scored." CR>)>>

<ROUTINE SCORE-OBJECT ("OPTIONAL" (OBJ <>))
	 <COND (<FSET? .OBJ ,SCOREBIT>
		<SETG SCORE <+ ,SCORE 1>>
		<FCLEAR .OBJ ,SCOREBIT>
		<COND (<AND <SET OBJ <GET ,SCENE-LOCS ,SCENE>>
			    <SET OBJ <GETPT .OBJ ,P?SCORE>>>
		       <PUTB .OBJ 0 <+ 1 <GETB .OBJ 0>>>)
		      ;(ELSE
		       <TELL
"[Problem with scoring in scene " N ,SCENE ", please report as bug!]" CR>)>
		<COND (,NOTIFY-FLAG
		       <TELL CR
"[Your score just went up.]" CR>)>
		<RTRUE>)>
	 <RTRUE>>

<ROUTINE IDROP ()
	 <COND (<OR <FSET? ,PRSO ,BODY-PART>
		    <NOT <HELD? ,PRSO>>>
		<TELL G"You aren't ""carrying ">
		<THE-PRSO>
		<RFALSE>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<THIS-IS-IT ,PRSO>
		<TELL-OPEN-CLOSED <LOC ,PRSO>>
		<RFALSE>)
	       (<FSET? ,PRSO ,WEARBIT>
		<HAVE-TO-TAKE-OFF>
		<RFALSE>)
	       (T
		<FCLEAR ,PRSO ,WEARBIT>
		<MOVE ,PRSO <LOC ,WINNER>>
		<RTRUE>)>>

<ROUTINE HAVE-TO-TAKE-OFF ("OPT" (OBJ ,PRSO))
	 <TELL ,YOU-HAVE-TO G"take off " THE .OBJ " first." CR>>

<ROUTINE CCOUNT (OBJ "AUX" (CNT 0) X)
	 <MAP-CONTENTS (X .OBJ)
		       (END <RETURN .CNT>)
	      <COND (<NOT <FSET? .X ,WEARBIT>>
		     <SET CNT <+ .CNT 1>>)>>>

;"WEIGHT: Gets sum of SIZEs of supplied object, recursing to nth level."

<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<NOT <FSET? .OBJ ,WEARBIT>>
		<MAP-CONTENTS (CONT .OBJ)
			      <SET WT <+ .WT <WEIGHT .CONT>>>>
		<+ .WT <GETP .OBJ ,P?SIZE>>)>>

;"subtitle movement"

;<ROUTINE LKP (ITM TBL "AUX" (CNT 0) (LEN <GET .TBL 0>))
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> .LEN>
			<RFALSE>)
		       (<EQUAL? <GET .TBL .CNT> .ITM>
			<COND (<EQUAL? .CNT .LEN> <RFALSE>)
			      (T
			       <RETURN <GET .TBL <+ .CNT 1>>>)>)>>>

<GLOBAL OHERE <>>

<ROUTINE GOTO (RM "OPTIONAL" (V? T) "AUX" OLIT)
	 <SETG OHERE .RM>
	 <COND (,HERE <APPLY <GETP ,HERE ,P?ACTION> ,M-LEAVE>)>
	 <SETG OHERE ,HERE>
	 <SET OLIT ,LIT>
	 <COND (<NOT <EQUAL? ,OHERE .RM>>
		<B-STAND>)>
	 <COND (<NOT <IN? <LOC ,WINNER> ,ROOMS>>
		<MOVE <LOC ,WINNER> .RM>)
	       (ELSE
		<MOVE ,WINNER .RM>)>
	 <SETG HERE .RM>
	 <SETG LIT <LIT? ,HERE>>
	 <COND (<AND <NOT .OLIT>
		     <NOT ,LIT>
		     <PROB 80>>
		<JIGS-UP ;"this string is a duplicate of one in FLASHLIGHT-F"
"This is a civilized country, but nonetheless one should never assume
the dark is safe.  Someone just grabbed you from behind and strangled
you with a silken cord.">
		<RTRUE>)>
	 <V-INTRODUCE>
	 <APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
	 <COND (<NOT <EQUAL? ,HERE .RM>>
		<RTRUE>)
	       (.V?
		<V-FIRST-LOOK>)>
	 ;<COND (,LIT <SCORE-OBJECT .RM>)>
	 <RTRUE>>

\

;"subtitle death and stuff"

<GLOBAL STUPID-MOVE <>>

<ROUTINE I-STUPID-MOVE () <SETG STUPID-MOVE <>>>

<ROUTINE JIGS-UP? (N "OPT" (DESC <>))
	 <COND (<NOT <EQUAL? ,STUPID-MOVE .N>>
		<QUEUE I-STUPID-MOVE 2>
		<SETG STUPID-MOVE .N>
		<COND (.DESC <TELL .DESC CR>)
		      (ELSE
		       <TELL
"At the last second, you stop and try to think of something to do that's
less likely to be fatal." CR>)>
		<RFALSE>)
	       (ELSE <RTRUE>)>>

<ROUTINE JIGS-UP ("OPT" (DESC <>))
	 <SETG MOVES <+ ,MOVES 1>> ;"lie to update-status-line"
	 <SETG WINNER ,PLAYER>
	 <COND (.DESC <TELL .DESC>)>
	 <TELL "|
|
    ****  You have died  ****|
|">
	 <COND (<SCENE? ,S-ERASMUS>
		<TELL
"Are the Japans ahead?  Now you will never know.  All pilots fear death
by drowning more than any other death, and most die by drowning.  A
terrible fate." CR>)
	       (ELSE
		<TELL
"Perhaps in a future existence you will be reborn samurai.  Perhaps,
as Father Sebastio would predict, you will burn in hell.  Perhaps you
will ascend to heaven.  Perhaps none of these things will happen. "I"Karma,
neh?" CR>)>
	 <CRLF>
	 <FINISH>>

;<ROUTINE ROB (FROM "OPT" (TO <>) (BIT -1)
	      "AUX" (F <FIRST? .FROM>) N (1ST? <>))
	 <REPEAT ()
		 <COND (.F
			<SET N <NEXT? .F>>
			<COND (<OR <AND <G=? .BIT 0>
					<FSET? .F .BIT>>
				   <AND <FSET? .F ,TAKEBIT>
					<FSET? .F ,TOUCHBIT>>>
			       <SET 1ST? .F>
			       <COND (.TO <MOVE .F .TO>)
				     (ELSE <REMOVE .F>)>)>
			<SET F .N>)
		       (T
			<RETURN>)>>
	 .1ST?>

<ROUTINE MOVE-ALL (FROM "OPT" (TO <>) "AUX" (F <FIRST? .FROM>) N (1ST? <>))
	 <REPEAT ()
		 <COND (.F
			<SET N <NEXT? .F>>
			<SET 1ST? .F>
			<COND (.TO <MOVE .F .TO>)
			      (ELSE <REMOVE .F>)>
			<FCLEAR .F ,WEARBIT>
			<SET F .N>)
		       (T
			<RETURN>)>>
	 .1ST?>

;"subtitle useful utility routines"

<ROUTINE THIS-IS-IT (OBJ)
	 <COND (<FSET? .OBJ ,DONT-IT> <RFALSE>)
	       (<NOT <EQUAL? .OBJ ,IT ,HIM ,HER ,WHAT ,ROOMS>>
		<COND (<OR <FSET? .OBJ ,PERSON>
			   <EQUAL? .OBJ ,LG-ERASMUS>>
		       <COND (<OR <AND <EQUAL? .OBJ ,LG-RODRIGUES>
				       <IN? ,RODRIGUES ,IN-THE-SEA>>
				  <FSET? .OBJ ,DEAD>>
			      <COND (<NOT <EQUAL? ,P-IT-OBJECT .OBJ>>
				     <FCLEAR ,IT ,TOUCHBIT>)>
			      <SETG P-IT-OBJECT .OBJ>)>
		       <COND (<OR <FSET? .OBJ ,PLURAL>
				  <EQUAL? .OBJ ,GRAYS ,BROWNS>>
			      <COND (<NOT <EQUAL? ,P-THEM-OBJECT .OBJ>>
				     <FCLEAR ,THEM ,TOUCHBIT>)>
			      <SETG P-THEM-OBJECT .OBJ>)
			     (<FSET? .OBJ ,FEMALE>
			      <COND (<NOT <EQUAL? ,P-HER-OBJECT .OBJ>>
				     <FCLEAR ,HER ,TOUCHBIT>)>
			      <SETG P-HER-OBJECT .OBJ>)
			     (ELSE
			      <COND (<NOT <EQUAL? ,P-HIM-OBJECT .OBJ>>
				     <FCLEAR ,HIM ,TOUCHBIT>)>
			      <SETG P-HIM-OBJECT .OBJ>)>)
		      (<FSET? .OBJ ,PLURAL>
		       <COND (<NOT <EQUAL? ,P-THEM-OBJECT .OBJ>>
			      <FCLEAR ,THEM ,TOUCHBIT>)>
		       <SETG P-THEM-OBJECT .OBJ>)
		      (ELSE
		       <COND (<NOT <EQUAL? ,P-IT-OBJECT .OBJ>>
			      <FCLEAR ,IT ,TOUCHBIT>)>
		       <SETG P-IT-OBJECT .OBJ>)>)>
	 <RTRUE>>

<ROUTINE INTRINSIC? (OBJ)
	 <EQUAL? .OBJ ,ME ,HANDS ,HEAD ,EYES ,FEET>>

<ROUTINE ACCESSIBLE? (OBJ "AUX" (L <LOC .OBJ>)) ;"can player TOUCH object?"
	 ;"revised 5/2/84 by SEM and SWG"
	 <COND (<FSET? .OBJ ,INVISIBLE>
		<RFALSE>)
	       (<EQUAL? .OBJ ,PSEUDO-OBJECT>
		<COND (<EQUAL? ,LAST-PSEUDO-LOC ,HERE>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<NOT .L>
		<RFALSE>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<RTRUE>)
	       (<AND <EQUAL? .L ,LOCAL-GLOBALS>
		     <GLOBAL-IN? .OBJ ,HERE>>
		<RTRUE>)
	       (<NOT <EQUAL? <META-LOC .OBJ> ,HERE <LOC ,WINNER>>>
		<RFALSE>)
	       (<EQUAL? .L ,WINNER ,HERE <LOC ,WINNER>>
		<RTRUE>)
	       (<AND <FSET? .L ,OPENBIT>
		     <ACCESSIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE VISIBLE? (OBJ "AUX" (L <LOC .OBJ>)) ;"can player SEE object"
	 ;"revised 5/2/84 by SEM and SWG"
	 <COND (<ACCESSIBLE? .OBJ>
		<RTRUE>)
	       (<AND <SEE-INSIDE? .L>
		     <VISIBLE? .L>>
		<RTRUE>)(T
		<RFALSE>)>>

<ROUTINE HELD? (OBJ "OPTIONAL" (WHO <>))
	 ;"is object carried, or in something carried, by player?"
	 <COND (<NOT .WHO> <SET WHO ,PLAYER>)>
	 <COND (<NOT .OBJ> <RFALSE>)
	       (<AND <VERB? GIVE>
		     <FSET? .OBJ ,CANT-HOLD>> ;"can't hold but can give"
		<RTRUE>)
	       (<EQUAL? .OBJ .WHO ,ME> <RTRUE>)
	       (<FSET? .OBJ ,BODY-PART> <RTRUE>)
	       (<IN? .OBJ .WHO>
		<RTRUE>)
	       (<IN? .OBJ ,ROOMS>
		<RFALSE>)
	       (<IN? .OBJ ,GLOBAL-OBJECTS>
		<RFALSE>)
	       (T
		<HELD? <LOC .OBJ> .WHO>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND .OBJ
	      <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT>
	          <FSET? .OBJ ,OPENBIT>>>>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TEE)
	 <COND (<AND .OBJ2
		     <SET TEE <GETPT .OBJ2 ,P?GLOBAL>>>
		<ZMEMQ .OBJ1 .TEE </ <PTSIZE .TEE> 2>>)>>

<ROUTINE DO-WALK (DIR)
	 <SETG P-WALK-DIR .DIR>
	 <PERFORM ,V?WALK .DIR>>

;<ROUTINE SOAK-STUFF (OBJ "OPTIONAL" (RECURSE? T)
		     "AUX" (F <FIRST? .OBJ>) (1ST? T))
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN <NOT .1ST?>>)
		       (<SOAK-OBJ? .F>
			<SET 1ST? <>>)
		       (<AND <NOT .RECURSE?>
			     <EQUAL? .F ,PLAYER>>
			T)
		       (<AND <FSET? .F ,CONTBIT>
			     <FSET? .F ,OPENBIT>
			     <FIRST? .F>>
			<COND (<SOAK-STUFF .F>
			       <SET 1ST? <>>)>)>
		 <SET F <NEXT? .F>>>>

;<ROUTINE SOAK-OBJ? (F)
	 <COND (<FSET? .F ,RMUNGBIT> <RFALSE>)>>

<ROUTINE HACK-HACK (STR)
	 <TELL .STR " " THE ,PRSO " has no effect." CR>>

<ROUTINE TELL-YUKS ()
	 <TELL <PICK-ONE ,YUKS> CR>>

<CONSTANT YUKS
	  <LTABLE 0
		  "Not likely!"
		  "That would never work!"
		  "You can't be serious.">>

<ROUTINE PRE-PRY ()
	 <COND (<AND ,PRSI
		     <NOT <INTRINSIC? ,PRSI>>
		     <NOT <HELD? ,PRSI>>
		     <NOT <IN? ,WINNER ,PRSI>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<NOT-HOLDING ,PRSI>)>>

<ROUTINE V-PRY ()
	 <NO-EFFECT>>

<ROUTINE V-BURY ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL "Cremation is more normal here." CR>)
		      (ELSE
		       <TELL
"Bury " HIM/HER ,PRSO " alive?  How barbaric." CR>)>)
	       (ELSE
		<TELL "You might not be able to find it again." CR>)>>

<ROUTINE V-YES ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (<AND ,PRSO <NOT <PRSO? ,HEAD>>>
		<TELL "You aren't making much sense." CR>)
	       (ELSE
		<TELL "No question was asked that required an answer." CR>)>>

<ROUTINE V-NO ()
	 <V-YES>>

<ROUTINE V-BUY ()
	 <UNINTERESTED ,PRSI>>

<ROUTINE PRE-SSELL ()
	 <SWAP-VERB ,V?SELL>
	 <RTRUE>>

<ROUTINE V-SSELL () <RTRUE>>

<ROUTINE V-SELL ()
	 <UNINTERESTED ,PRSI>>

<ROUTINE PRE-TELL-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?TELL-ME-ABOUT ,PRSI>
		<RTRUE>)>>

<ROUTINE V-TELL-ABOUT ()
	 <COND (<HELD? ,PRSI>
		<SWAP-VERB ,V?SHOW>
		<RTRUE>)
	       (<AND <FSET? ,PRSO ,JAPANESEBIT>
		     <NOT <PRSO? ,MARIKO>>>
		<DIFFICULTY ,PRSO>)
	       (ELSE
		<UNINTERESTED ,PRSO>)>>

<ROUTINE DIFFICULTY (WHO)
	 <TELL
"You have a great deal of difficulty making yourself understood. " CTHE .WHO
" doesn't seem to understand you very well." CR>>

<ROUTINE V-TELL-ME-ABOUT ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<WINNER? ,PLAYER>
		<PERFORM ,V?WHAT ,PRSO>
		<RTRUE>)
	       (<AND <FSET? ,WINNER ,JAPANESEBIT>
		     <NOT <WINNER? ,MARIKO>>>
		<DIFFICULTY ,WINNER>)
	       (ELSE
		<TELL CTHE ,WINNER " doesn't seem to have anything to say
about that." CR>)>>

<ROUTINE V-TRADE ()
	 <COND (<AND ,PRSI <FSET? ,PRSI ,PERSON>>
		<UNINTERESTED ,PRSI>)
	       (<AND <WINNER? ,PLAYER>
		     ,PRSI
		     <NOT <FSET? ,PRSO ,PERSON>>>
		<COND ;(<IN? ,HACKER ,HERE>
		       <SETG WINNER ,HACKER>
		       <NEW-VERB ,PRSA>
		       <SETG WINNER ,PLAYER>
		       <RTRUE>)
		      (ELSE
		       <TELL
"No one here is interested in trading." CR>)>)
	       (ELSE
		<V-BARGAIN>)>>

<ROUTINE V-ERASE ()
	 <TELL-YUKS>>

<ROUTINE V-ADMIRE ()
	 <TELL "Your taste is unusual." CR>>

<ROUTINE V-BARGAIN ()
	 <TELL "A preoccupation with money and trading is inappropriate
in this society, very uncultured." CR>>

<ROUTINE V-REPAIR ()
	 <COND (<FSET? ,PRSO ,RMUNGBIT>
		<TELL "You don't know how." CR>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL "You're a pilot, not a doctor." CR>)
	       (ELSE
		<TELL CTHE ,PRSO " isn't broken." CR>)>>

<ROUTINE V-LOOK-UP ()
	 <COND (<PRSO? ,ROOMS>
		<TELL "Don't get a sore neck." CR>)
	       (<AND <PRSO? INTQUOTE>
		     <ACCESSIBLE? ,DICTIONARY>>
		<PERFORM ,PRSA ,PRSO ,DICTIONARY>
		<RTRUE>)
	       (ELSE
		<NEW-VERB ,V?WHAT>
		<RTRUE>)>>

<ROUTINE V-PLUG-IN ()
	 <YOU-CANT-X-THAT "plug in">>

<ROUTINE V-UNPLUG ()
	 <YOU-CANT-X-THAT "unplug">>

;<ROUTINE V-EDIT ()
	 <YOU-CANT-X-THAT "edit">>

;<ROUTINE V-CLICK ()
	 <TELL ,NOTHING-HAPPENS>>

<ROUTINE V-WALK-UNDER ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?DOWN>)
	       (ELSE
		<TELL "Only a snake could get under " A ,PRSO "!" CR>)>>

<ROUTINE V-SCARE ()
	 <TELL "I don't think you scared " THE ,PRSO " very much." CR>>

<ROUTINE V-WEDGE ()
	 <TELL ,YOU-CANT "wedge open " A ,PRSO " with " A ,PRSI ,PERIOD>>

<ROUTINE PRE-SWEDGE ()
	 <SWAP-VERB ,V?WEDGE>
	 <RTRUE>>

<ROUTINE V-SWEDGE ()
	 <RTRUE>>

<ROUTINE V-PUT-BETWEEN ()
	 <TELL ,YOU-CANT "put " A ,PRSO " between " A ,PRSI ,PERIOD>>

<ROUTINE V-TASTE ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL
"You have got to be kidding." CR>)
	       (ELSE
		<TELL "It tastes exactly as you'd expect " A ,PRSO " to taste,
only worse." CR>)>>

<ROUTINE V-DIE ()
	 <PERFORM ,V?KILL ,ME>
	 <RTRUE>>

<ROUTINE V-COOK ()
	 <TELL
"Most people cook things in ovens." CR>>

<ROUTINE V-DRIVE-ON ()
	 <COND (<FSET? ,PRSI ,PERSON>
		<TELL CTHE ,PRSI " moves out of the way." CR>)
	       (ELSE
		<TELL ,GOOD-TRICK>)>>

<ROUTINE V-DRIVE-TO ()
	 <COND (<AND <IN? ,WINNER ,PRSO>
		     <PRSI? INTDIR>>
		<DO-WALK ,P-DIRECTION>)
	       (ELSE
		<TELL ,GOOD-TRICK>)>>

<ROUTINE V-STEP-ON ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<NEW-VERB ,V?BOARD>
		<RTRUE>)
	       (ELSE
		<TELL ,WASTE-OF-TIME>)>>

<ROUTINE V-STOP ()
	 <TELL ,NOTHING-HAPPENS>>

<ROUTINE V-RELEASE ()
	 <NEW-VERB ,V?DROP>
	 <RTRUE>>

<ROUTINE V-PUSH-DOWN ()
	 <PUSH-FOO "down">>

<ROUTINE V-PUSH-UP ()
	 <PUSH-FOO "up">>

<ROUTINE V-PUSH-OUT ()
	 <PUSH-FOO "out">>

<ROUTINE PUSH-FOO (DIR)
	 <COND (<PRSI? ,ROOMS>
		<TELL
"You push " THE ,PRSO ", but nothing happens." CR>)
	       (ELSE
		<TELL
,YOU-CANT "push " THE ,PRSO " " .DIR " " THE ,PRSI "." CR>)>>

<ROUTINE V-PRAY ()
	 <TELL
"You know that in any Catholic court in the world you would have been
damned long since for heresy.  And in most, if not all, Protestant
courts.  But you pray anyway." CR>>

<ROUTINE PRE-SPUT-ON ()
	 <SWAP-VERB ,V?PUT-ON>
	 <RTRUE>>

<ROUTINE V-SPUT-ON ()
	 <RTRUE>>

<ROUTINE V-LOVE ()
	 <TELL "Your feelings aren't reciprocated." CR>>

<ROUTINE V-THOU ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (ELSE
		<TELL "How formal." CR>)>>

<ROUTINE V-WRITE ()
	 <YOU-CANT-X-THAT "write on">>

<ROUTINE V-RING ()
	 <YOU-CANT-X-THAT "ring">>

<ROUTINE V-BOW ("AUX" WHO)
	 <COND (<B-LYING?>
		<TELL "You can't bow while lying down!" CR>)
	       (<PRSO? <> ,ROOMS ,HEAD>
		<COND (<AND ,OPPONENT <IN? ,OPPONENT ,HERE>>
		       <SET .WHO ,OPPONENT>)
		      (<AND ,QCONTEXT <IN? ,QCONTEXT ,HERE>>
		       <SET .WHO ,QCONTEXT>)
		      (ELSE
		       <SET WHO <FIND-IN ,HERE ,JAPANESEBIT>>)>
		<COND (.WHO
		       <PERFORM ,V?BOW .WHO>
		       <RTRUE>)
		      (ELSE
		       <TELL
"Good practice!" CR>)>)
	       (<PRSO? ME>
		<TELL
"An action not unlike clapping with one hand." CR>)
	       (<FSET? ,PRSO ,PERSON>
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
"You show your respect for the dead " D ,PRSO "." CR>)
		      (<FSET? ,PRSO ,DUTCHBIT>
		       <TELL
"\"What are you, Pilot?  Some kind of God-cursed courtier?\" grumbles "
THE ,PRSO "." CR>)
		      (ELSE
		       <TELL
CTHE ,PRSO " returns your bow, instinctively knowing exactly the correct
degree of deference to show." CR>)>)
	       (ELSE
		<TELL
"You show " THE ,PRSO " all due respect." CR>)>>

<ROUTINE V-SORRY ()
	 <COND (<AND ,PRSO <FSET? ,PRSO ,PERSON>>
		<NEW-WINNER-PRSO ,PRSA>
		<RTRUE>)
	       (ELSE
		<TELL
"I'd be sorry, too." CR>)>>

<ROUTINE V-PISS ()
	 <COND (<AND ,PRSO
		     <OR <FSET? ,PRSO ,PERSON>
			 <FSET? ,PRSO ,BODY-PART>>>
		<TELL
"You decide not to do that to " THE ,PRSO ". It's very bad manners." CR>)
	       (<OR <FSET? ,PRSO ,FOODBIT>
		    <PRSO? ,FLAGON ,CUP>>
		<TELL "What a disgusting idea." CR>)
	       (<SCENE? ,S-ERASMUS>
		<TELL
"You feel much better, now." CR>)
	       (<FSET? ,HERE ,OUTSIDE>
		<TELL
"As you have seen the Japanese do, you turn politely away from any possible
watchers and then do your business." CR>)
	       (ELSE
		<TELL
"What a barbaric idea!  You decide to hold on a little longer." CR>)>>

<ROUTINE V-LOAD ()
	 <COND (<AND <NOT ,PRSO>
		     <HELD? ,PISTOL>>
		<PERFORM ,V?LOAD ,PISTOL>
		<RTRUE>)
	       (ELSE
		<TELL "You can't load that." CR>)>>

<ROUTINE V-STRAIGHTEN ()
	 <TELL "You can't straighten that!" CR>>

<ROUTINE V-LAUNCH ()
	 <TELL "You can't launch anything here." CR>>

<ROUTINE V-BLESS ()
	 <COND (<FSET? ,PRSO ,DEAD>
		<TELL
"You can't be sure it does any good, but you pray that it's at least
the right thing to do." CR>)
	       (ELSE
		<TELL "What an odd thing to do." CR>)>>

<ROUTINE V-MAKE ()
	 <COND (<PRSO? ,SIGN-OF-CROSS>
		<COND (<NOT ,PRSI>
		       <TELL
"An unusual gesture for someone of your religious beliefs." CR>)
		      (<FSET? ,PRSI ,PERSON>
		       <PERFORM ,V?BLESS ,PRSI>
		       <RTRUE>)
		      (ELSE
		       <TELL
"It's generally considered blasphemous to make the sign of the cross
over " A ,PRSI "." CR>)>)
	       (ELSE
		<TELL "You can't make " A ,PRSO "!" CR>)>>

<ROUTINE V-ACT ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL
"Your imitation is unconvincing." CR>)
	       (ELSE
		<TELL
"You will never make it in " I "noh" " plays, that's certain." CR>)>>

<ROUTINE V-DANCE ()
	 <COND (,PRSO
		<TELL CTHE ,PRSO " doesn't seem to want to dance." CR>)
	       (ELSE
		<TELL
"You dance foolishly for a while, then stop, embarrassed." CR>)>>

<ROUTINE V-TEAR ()
	 <YOU-CANT-X-THAT "tear">>

<ROUTINE V-SHIP ()
	 <YOU-CANT-X-THAT "ship">>

<ROUTINE V-SORT ()
	 <TELL CTHE ,PRSO " seems pretty well sorted already." CR>>

<ROUTINE V-ROW ()
	 <COND (<EQUAL? ,HERE ,MAIN-DECK ,GALLEY>
		<TELL
"You could as easily sail the "I"Erasmus"" by blowing on the sails." CR>)
	       (<NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		<TELL
"You aren't in a boat!" CR>)
	       (<PRSI? INTDIR>
		<COND (<IN? ,WINNER ,PRSO>
		       <DO-WALK ,P-DIRECTION>
		       <RTRUE>)
		      (ELSE
		       <TELL "You aren't in " THE ,PRSO "!" CR>)>)
	       (<PRSO? INTDIR>
		<DO-WALK ,P-DIRECTION>
		<RTRUE>)
	       (,PRSI
		<COND (<IN? ,WINNER ,PRSO>
		       <PERFORM ,V?WALK-TO ,PRSI>
		       <RTRUE>)
		      (ELSE
		       <TELL "You aren't in " THE ,PRSO "!" CR>)>)
	       (<NOT ,PRSO>
		<TELL
"Gently down the stream..." CR>)
	       (<FSET? ,PRSO ,VEHBIT>
		<COND (<NOT <IN? ,WINNER ,PRSO>>
		       <TELL
"You aren't in " THE ,PRSO "!" CR>)
		      (ELSE
		       <TELL
,YOU-HAVE-TO G"specify a direction." CR>)>)
	       (,PRSO
		<TELL "You can't row that!" CR>)>>

<ROUTINE V-TAKE-OVER ()
	 <TELL "There's nothing to take over here!" CR>>

<ROUTINE V-SHUT-UP ()
	 <COND (<PRSO? ROOMS>
		<TELL "You stifle yourself." CR>)
	       (ELSE
		<TELL CTHE ,PRSO " doesn't respond." CR>)>>

<ROUTINE V-USE ()
	 <TELL ,YOU-HAVE-TO G"be more specific about ""how you want
to use " THE ,PRSO "." CR>>

<ROUTINE V-STEER-BY ()
	 <TELL "You'll get nowhere that way!" CR>>

<ROUTINE FORMAL-SCENE? ()
	 <COND (<SCENE? S-TORANAGA S-MARIKO S-ESCAPE S-OCHIBA
			S-DEPARTURE S-SEPPUKU S-AFTERMATH>
		<RTRUE>)>>

<ROUTINE V-STRIP ("AUX" (F <FIRST? ,WINNER>) N (1ST? T) (LAST <>))
	 <COND (<FORMAL-SCENE?>
		<TELL
"You would expose yourself to ridicule." CR>)
	       (ELSE
		<REPEAT ()
		 <COND (.F
			<SET N <NEXT? .F>>
			<COND (<FSET? .F ,WEARBIT>
			       <COND (.LAST
				      <COND (.1ST?
					     <SET 1ST? <>>
					     <TELL G"You have removed">)
					    (ELSE
					     <TELL ",">)>
				      <TELL " " THE .LAST>)>
			       <SET LAST .F>
			       <FCLEAR .F ,WEARBIT>
			       ;<MOVE .F ,HERE>)>
			<SET F .N>)
		       (T
			<COND (.LAST
			       <COND (.1ST?
				      <SET 1ST? <>>
				      <TELL G"You have removed">)
				     (ELSE
				      <TELL ", and">)>
			       <TELL " " THE .LAST "." CR>)
			      (ELSE
			       <TELL
"You aren't wearing anything." CR>)>
			<RETURN>)>>)>>

<ROUTINE V-TRANSLATE ()
	 <COND (<HELD? ,DICTIONARY>
		<PERFORM ,V?LOOK-UP ,PRSO ,DICTIONARY>
		<RTRUE>)
	       (<LOC ,DICTIONARY>
		<TELL "You should use the dictionary." CR>)
	       (ELSE
		<TELL "It's still unintelligible." CR>)>>

<ROUTINE SETUP-ANSWER (STR)
	 <COND (<NOT <EQUAL? .STR ,ORPHAN-ANSWER>>
		<SETG ORPHAN-ANSWER .STR>
		<COND (.STR
		       <SETUP-ORPHAN ,ORPHAN-ANSWER>)>)>
	 <COND (.STR
		<QUEUE I-SETUP-ANSWER -1 T>)
	       (ELSE <DEQUEUE I-SETUP-ANSWER>)>>

<GLOBAL ORPHAN-ANSWER <>>

<ROUTINE I-SETUP-ANSWER ()
	 <COND (,ORPHAN-ANSWER
		<SETUP-ORPHAN ,ORPHAN-ANSWER>)
	       (ELSE
		<DEQUEUE I-SETUP-ANSWER>)>
	 <RFALSE>>

<ROUTINE V-SMILE ()
	 <TELL "You smile">
	 <COND (,PRSO <TELL " at " THE ,PRSO>)>
	 <TELL ", showing your bad teeth and rotten gums." CR>>

<ROUTINE V-WINK ()
	 <TELL "You wink">
	 <COND (,PRSO <TELL " at " THE ,PRSO>)>
	 <TELL ", but get no reaction." CR>>

<ROUTINE V-CLEAR ()
	 <COND (<AND <FSET? ,PRSO ,FURNITURE>
		     <FSET? ,PRSO ,SURFACEBIT>>
		<EMPTY-ALL ,PRSO <LOC ,WINNER>>)
	       (ELSE
		<TELL
"I don't see how you propose to do that." CR>)>>

<ROUTINE V-TURN-TOWARD ()
	 <V-TURN-AWAY>>

<ROUTINE V-TURN-AWAY ()
	 <TELL ,YOU-HAVE-TO G"supply a direction, instead." CR>>

<ROUTINE V-REACH-FOR ()
	 <TELL G"You can't reach " THE ,PRSO " with " THE ,PRSI "." CR>>

<ROUTINE V-HUG ()
	 <COND (<AND <FSET? ,PRSO ,PERSON>
		     <NOT <FSET? ,PRSO ,DEAD>>>
		<COND (<FSET? ,PRSO ,DUTCHBIT>
		       <TELL
"\"I'm no god-cursed sodomite!\" growls " THE ,PRSO "." CR>)
		      (ELSE
		       <TELL
"Such public displays of affection are considered barbaric in Japan." CR>)>)
	       (ELSE
		<TELL
"Only a barbarian would try to hug " A ,PRSO "!" CR>)>>

<ROUTINE V-SOOTHE ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL
"Your efforts don't seem to have much effect." CR>)
	       (ELSE
		<TELL
"You can't soothe " A ,PRSO "." CR>)>>

<ROUTINE V-HAI ()
	 <V-IYE>>

<ROUTINE V-IYE ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (ELSE
		<TELL "Your accent is atrocious." CR>)>>

<ROUTINE V-HOLD-ON ()
	 <COND (<PRSO? ROOMS>
		<TELL "There's nothing to hold onto here!" CR>)
	       (ELSE
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-RINSE ()
	 <V-BATHE>>

<ROUTINE V-BATHE ()
	 <TELL "A fine idea, but there are no facilities here." CR>>

<ROUTINE V-REPLACE ()
	 <COND (<HELD? ,PRSO>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (ELSE
		<TELL
CTHE ,PRSO " is irreplaceable." CR>)>>

<ROUTINE V-ESCAPE ()
	 <TELL
"A fine idea, but the details of your plan seem rather sketchy." CR>>

<ROUTINE V-PLEAD ()
	 <COND (,PRSO 
		<TELL CTHE ,PRSO " ignores your pleas." CR>)
	       (ELSE
		<TELL "Your pleas seem to fall on deaf ears." CR>)>>

<ROUTINE V-COMMIT ()
	 <COND (<PRSO? SUICIDE>
		<PERFORM ,V?KILL ,ME>
		<RTRUE>)
	       (ELSE
		<TELL
"It's you that should be committed." CR>)>>

<ROUTINE V-ACCUSE ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<TELL "\"Never!\"" CR>)
	       (ELSE
		<TELL "You are obviously going a bit paranoid." CR>)>>

<ROUTINE V-SPIT ()
	 <TELL "What an uncouth idea." CR>>

<ROUTINE V-TEKI ()
	 <COND (<FSET? ,TEKI ,RMUNGBIT>
		<TELL "In Japanese, "I"teki"" means 'enemy.'" CR>)
	       (ELSE
		<TELL "That's not a word you know." CR>)>>

<ROUTINE GET-INTQUOTE (N "AUX" (NP <GET-NP ,INTQUOTE>) LEN)
	 <SET LEN
	      <- </ <- <NP-LEXEND .NP> <NP-LEXBEG .NP>>
		    ,LEXV-ELEMENT-SIZE-BYTES>
		 1>>
	 <SET N <* .N 2>>
	 <COND (<G? .N .LEN> <RFALSE>)
	       (ELSE
		<ZGET <ZREST <NP-LEXBEG .NP> ,LEXV-ELEMENT-SIZE-BYTES>
		      .N>)>>

<ROUTINE PRE-SSPEAK ()
	 <SWAP-VERB ,V?SPEAK>
	 <RTRUE>>

<ROUTINE V-SSPEAK ()
	 <RTRUE>>

<ROUTINE V-SPEAK ()
	 <COND (<PRSO? ENGLISH>
		<TELL
"English is your native tongue.  You speak the English of London,
and have fond memories of the plays of Jonson and Shakespeare." CR>)
	       (<PRSO? DUTCH>
		<TELL
"Your mother was Dutch, and your men are mostly Dutch, so you speak
it fluently.  Holland is England's only ally against the treacherous
Spanish." CR>)
	       (<PRSO? PORTUGUESE>
		<TELL
"Your Portuguese is excellent." CR>)
	       (<PRSO? SPANISH>
		<TELL
"You can speak the language of the hated Spaniards like a native." CR>)
	       (<PRSO? LATIN>
		<TELL
"Like all educated men, you speak Latin." CR>)
	       (<PRSO? JAPANESE>
		<COND (<SCENE? ,S-ERASMUS ,S-ANJIRO>
		       <TELL "You don't know any Japanese." CR>)
		      (ELSE
		       <TELL
"Your accent is atrocious, and your vocabulary small, but you are
learning fast." CR>)>)
	       (ELSE
		<TELL
"That's not a language you know." CR>)>>

<ROUTINE V-AIM ("AUX" W)
	 <COND (<NOT ,PRSI>
		<COND (<FSET? ,PRSO ,PERSON>
		       <COND (<SET W <FIND-IN ,WINNER ,WEAPONBIT>>
			      <PERFORM ,PRSA .W ,PRSO>
			      <RTRUE>)
			     (ELSE
			      <TELL
"You sight carefully along your finger..." CR>)>)
		      (ELSE
		       <TELL "How strange." CR>)>)
	       (ELSE
		<TELL "You aim " THE ,PRSO " at " THE ,PRSI "." CR>)>>

<ROUTINE V-EXPLODE ()
	 <COND (,PRSI
		<TELL
"A " ,PRSI " doesn't make a very good explosive!" CR>)
	       (ELSE
		<TELL ,YOU-HAVE-TO "use an explosive." CR>)>>


<GLOBAL HINTS-OFF:NUMBER -1>

<REPLACE-DEFINITION INIT-HINT-SCREEN
<ROUTINE INIT-HINT-SCREEN ()
  <SCREEN ,S-FULL>
  <CLEAR ,S-FULL>
  <RESET-MARGIN>
  <DISPLAY ,P-HINT-BORDER 1 1>
  <SETUP-TEXT-AND-STATUS ,P-HINT-LOC>
  <WINDEF ,S-STATUS 1 1 <* 4 ,FONT-Y> <LOWCORE HWRD>>
  <SCREEN ,S-TEXT>
  <MARGIN 0 0>
  ,S-STATUS>>

<REPLACE-DEFINITION LEAVE-HINT-SCREEN
 <ROUTINE LEAVE-HINT-SCREEN ()
	  <REPAINT-DISPLAY>>>

<ROUTINE V-HINT ()
	 <COND (<EQUAL? ,HINTS-OFF -1>
		<SETG HINTS-OFF 0>
		<TELL
"Warning: We strongly recommend that you not use hints unless you're definitely
stuck.  Peeking at hints prematurely will invariably make you enjoy
the story less.  If you want to avoid reading any hints for the rest of this
session, you may at any time during the story type HINTS OFF.|
|
Do you still want a hint">
		<COND (<NOT <YES?>>
		       <RFATAL>)>)
	       (,HINTS-OFF
		<PERFORM ,V?HINTS-OFF ,ROOMS>
		<RFATAL>)>
	 <COND (<G? ,SCENE ,S-ESCAPE> ;"default chapter is current scene"
		<SETG H-CHAPT-NUM <+ ,SCENE 1>>)
	       (ELSE <SETG H-CHAPT-NUM ,SCENE>)>
	 <DO-HINTS>>

<ROUTINE V-HINTS-OFF ()
	 <COND (<NOT <PRSO? ,ROOMS>>
		<TELL "[Sorry, I don't understand.]" CR>
		<RTRUE>)
	       (,HINTS-OFF
		<TELL "[You've already deactivated">)
	       (T
		<SETG HINTS-OFF T>
		<TELL "[Okay, you will no longer have access to">)>
	 <TELL " help in this session.]" CR>>

<ROUTINE V-PICK-UP ()
	 <TELL
CTHE ,PRSI " doesn't seem to be much help in getting " THE ,PRSO "." CR>>

<ROUTINE V-COME-FROM ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (ELSE
		<TELL "So, you c">
		<COND (<PAST-TENSE?>
		       <TELL !\a>)
		      (T
		       <TELL !\o>)>
		<TELL "me from " D ,PRSO "." CR>)>>

<ROUTINE PAST-TENSE? ()
	 <BAND ,PAST-TENSE <WORD-FLAGS ,P-PRSA-WORD>>>

<ROUTINE PRE-COME-TO-FROM ()
	 <COND (<PRSO? ,GLOBAL-HERE ,JAPAN>
		<PERFORM ,V?COME-FROM ,PRSI>
		<RTRUE>)>>

<ROUTINE V-COME-TO-FROM ()
	 <TELL "That's very interesting." CR>>

<ROUTINE V-PARRY ()
	 <TELL "There doesn't seem to be anything to parry." CR>>

<ROUTINE V-TEACH ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL "You do your best to teach " THE ,PRSO "." CR>)
	       (ELSE
		<TELL "You can't teach " A ,PRSO "!" CR>)>>

<ROUTINE V-LEARN ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (ELSE
		<TELL "Perhaps you should ask someone to teach you." CR>)>>

<ROUTINE V-LOOK-OUT ()
	 <COND (<PRSO? ,ROOMS>
		<COND (<FSET? ,HERE ,OUTSIDE>
		       <TELL
"You are outside already!" CR>)
		      (ELSE
		       <TELL
,YOU-HAVE-TO "go outside to look outside." CR>)>)
	       (ELSE
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)>>



"standing, sitting, kneeling, and lying down"

<ROUTINE B-STAND ()
         <FCLEAR ,BLACKTHORNE ,SITTING>
	 <FCLEAR ,BLACKTHORNE ,TRANSBIT>
	 <FCLEAR ,BLACKTHORNE ,SURFACEBIT>>

<ROUTINE B-SITTING? ()
	 <AND <FSET? ,BLACKTHORNE ,SITTING>
	      <NOT <FSET? ,BLACKTHORNE ,TRANSBIT>>
	      <NOT <FSET? ,BLACKTHORNE ,SURFACEBIT>>>>

<ROUTINE B-SIT ()
	 <FSET ,BLACKTHORNE ,SITTING>
	 <FCLEAR ,BLACKTHORNE ,TRANSBIT>
	 <FCLEAR ,BLACKTHORNE ,SURFACEBIT>>

<ROUTINE B-KNEELING? ()
	 <AND <FSET? ,BLACKTHORNE ,SITTING>
	      <FSET? ,BLACKTHORNE ,TRANSBIT>>>

<ROUTINE B-KNEEL ()
	 <FSET ,BLACKTHORNE ,SITTING>
	 <FSET ,BLACKTHORNE ,TRANSBIT>
	 <FCLEAR ,BLACKTHORNE ,SURFACEBIT>>	 

<ROUTINE B-LYING? ()
	 <AND <FSET? ,BLACKTHORNE ,SITTING>
	      <FSET? ,BLACKTHORNE ,SURFACEBIT>>>

<ROUTINE B-LIE-DOWN ()
	 <FSET ,BLACKTHORNE ,SITTING>
	 <FCLEAR ,BLACKTHORNE ,TRANSBIT>
	 <FSET ,BLACKTHORNE ,SURFACEBIT>>

<ROUTINE V-STAND ("AUX" AV)
	 <COND (<PRSO? <> ,ROOMS>
		<SET AV <LOC ,WINNER>>
		<COND (<AND <FSET? .AV ,VEHBIT>
			    <NOT <EQUAL? .AV ,QUILT>>>
		       <TELL
"You shouldn't stand up inside " A .AV "." CR>)
		      (<B-NOT-STANDING?>
		       <B-STAND>
		       <TELL
"You stand up." CR>)
		      (T
		       <TELL ,YOU-ARE " standing." CR>)>)
	       (ELSE 
		<HACK-HACK "Holding up">)>>

<ROUTINE V-SIT ()
	 <COND (<NOT <PRSO? <> ,ROOMS>>
		<TELL ,WASTE-OF-TIME>)
	       (<B-NOT-STANDING?>
		<COND (<B-SITTING?>
		       <TELL G"You already are." CR>)
		      (ELSE
		       <B-SIT>
		       <TELL "You sit up." CR>)>)
	       (ELSE
		<B-SIT>
		<TELL "You sit down." CR>)>>

<ROUTINE V-KNEEL ()
	 <COND (<B-KNEELING?>
		<TELL G"You already are." CR>)
	       (ELSE
		<B-KNEEL>
		<TELL G"You kneel abjectly." CR>)>>

<ROUTINE V-KNEEL-ON ()
	 <COND (<OR <PRSO? ,GROUND>
		    <FSET? ,PRSO ,FURNITURE>>
		<PERFORM ,V?KNEEL>
		<RTRUE>)
	       (ELSE
		<TELL "You can't kneel on that!" CR>)>>

<ROUTINE V-LIE-DOWN ()
	 <COND (<PRSO? ,ROOMS ,GROUND>
		<COND (<B-LYING?>
		       <TELL G"You already are." CR>)
		      (ELSE
		       <B-LIE-DOWN>
		       <TELL "You lie down." CR>)>)
	       (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)>>



<ROUTINE V-LIE ()
	 <TELL
"A duplicitous idea, but you'll have to be more specific." CR>>

<ROUTINE V-AVOID ()
	 <COND (<PRSO? OPPONENT>
		<PERFORM ,V?DODGE>
		<RTRUE>)
	       (ELSE <TELL "You're doing the best you can." CR>)>>

<ROUTINE V-FUCK ()
	 <COND (<AND <PRSO? YOU>
		     <TRY-QCONTEXT?>>
		<RTRUE>)
	       (<FSET? ,PRSO ,PERSON>
		<COND (<FSET? ,PRSO ,FEMALE>
		       <TELL
"What an indelicate, even coarse, suggestion!" CR>)
		      (ELSE
		       <TELL
"Your predelictions are unusual, even given the local attitudes on
these matters." CR>)>)
	       (ELSE
		<TELL "An unusual idea." CR>)>>

<ROUTINE V-KNOW ()
	 <TELL "I don't know." CR>>

<ROUTINE V-TRAIN ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (ELSE
	 <TELL "It'll take a lot of training." CR>)>>

<ROUTINE V-BETRAY ()
	 <COND (<AND <PAST-TENSE?> <TRY-QCONTEXT?>>
		<RTRUE>)
	       (ELSE
		<TELL
"There's no one to betray " THE ,PRSO " to." CR>)>>

<ROUTINE V-LET-IN ()
	 <COND (<TRY-QCONTEXT?>
		<RTRUE>)
	       (ELSE
		<TELL
,YOU-HAVE-TO G"be more specific about ""how you are doing that." CR>)>>

<ROUTINE V-PUT-AWAY ()
	 <COND (<PRSI? ,ROOMS>
		<TELL ,YOU-HAVE-TO G"be more specific about ""where you want
to put " THE ,PRSO "." CR>)
	       (ELSE
		<PERFORM ,V?PUT ,PRSO ,PRSI>
		<RTRUE>)>>

<ROUTINE V-DODGE ()
	 <COND (<AND <PRSO? ROOMS <> OPPONENT> ,OPPONENT>
		<TELL
"You try to get out of the way of " THE ,OPPONENT "'s attack." CR>)
	       (<PRSO? ROOMS <>>
		<TELL "There's nothing to duck." CR>)
	       (ELSE
		<TELL "You don't need to dodge " THE ,PRSO "." CR>)>>

<ROUTINE V-WAKARIMASU ()
	 <TELL "That's nice." CR>>

;<ROUTINE V-WAKARIMASEN ()
	 <TELL "That's too bad." CR>>

<ROUTINE V-MIZU ()
	 <COND (<G=? ,SCENE ,S-PRISON>
		<TELL "That's Japanese for 'water.'" CR>)
	       (ELSE
		<TELL "What's that mean?" CR>)>>

<ROUTINE V-QUIET ()
	 <TELL "There doesn't seem to be anyone paying attention." CR>>



"changing color"

<SYNTAX COLOR = V-COLOR>

<GLOBAL COLOR-NOTE <>>

<GLOBAL FG-COLOR 1>

<GLOBAL BG-COLOR 1>

<ROUTINE V-COLOR ("AUX" (DEFAULT <>) FG BG)
	 <COND (<APPLE?>
		<TELL
"[Sorry, the Apple II doesn't support color selection.]" CR>
		<RTRUE>)
	       (<AND <NOT ,COLOR-NOTE>
		     <EQUAL? ,MACHINE ,MACINTOSH>
		     <MAC-II?>>
		<SETG COLOR-NOTE T>
		<TELL
"If your Mac II displays fewer than 256 colors, you probably won't get
the color you ask for.  Do you still want to go ahead">
		<COND (<NOT <YES?>> <RTRUE>)>)>
	 <CRLF>
	 <SET FG ,FG-COLOR>
	 <SET BG ,BG-COLOR>
	 <REPEAT ()
	    <DO-COLOR>
	    <TELL
"You will get " <GET ,COLOR-TABLE ,FG-COLOR> " text on a "
<GET ,COLOR-TABLE ,BG-COLOR> " background.|
Is that what you want">
	    <COND (<YES?>
		   <COLOR ,FG-COLOR ,BG-COLOR>
		   <V-$REFRESH>
		   <RTRUE>)
		  (ELSE
		   <SETG FG-COLOR .FG>
		   <SETG BG-COLOR .BG>
		   <TELL CR "Do you want to pick again">
		   <COND (<YES?> <CRLF>)
			 (ELSE <RTRUE>)>)>>>

<ROUTINE MAC-II? ()
	 <COND (<AND <EQUAL? ,MACHINE ,MACINTOSH>
		     <EQUAL? <WINGET ,S-FULL ,WWIDE> 640>>)>>

<ROUTINE DO-COLOR ()
	 <COND (<AND <EQUAL? ,MACHINE ,MACINTOSH>
		     <NOT <MAC-II?>>> ;"b&w Mac"
		<COND (<EQUAL? ,BG-COLOR ,C-BLACK>
		       <SETG BG-COLOR ,C-WHITE>
		       <SETG FG-COLOR ,C-BLACK>)
		      (T
		       <SETG BG-COLOR ,C-BLACK>
		       <SETG FG-COLOR ,C-WHITE>)>)
	       (T
		<SETG FG-COLOR <PICK-COLOR ,FG-COLOR "text" T>>
		<SETG BG-COLOR <PICK-COLOR ,BG-COLOR "background">>)>
	 <RTRUE>>

<ROUTINE PICK-COLOR (WHICH STRING "OPTIONAL" (SETTING-FG <>) "AUX" CHAR)
	 <TELL
"The current " .STRING " color is " <GET ,COLOR-TABLE .WHICH> "." CR>
	 <COND (<EQUAL? .WHICH 1>
		<COND (.SETTING-FG <SET WHICH ,C-BLACK>)
		      (ELSE <SET WHICH ,C-WHITE>)>)>
	 <REPEAT ()
		 <SET CHAR
		      <GET-FROM-MENU "Pick a color:"
				     ,COLOR-MENU
				     ,COLOR-MENU-F
				     <COLOR-OFFSET .WHICH>>>
		 <COND (<AND <NOT .SETTING-FG>
			     <EQUAL? .CHAR ,FG-COLOR>>
			<TELL CR
"You can't make the background the same
color as the text!  Pick another color." CR>)
		       (T
			<RETURN>)>>
	 <CRLF>
	 <CRLF>
	 <RETURN .CHAR>>

<ROUTINE COLOR-OFFSET (TMP)
	 <COND (<EQUAL? .TMP ,C-WHITE> <SET TMP 1>)>
	 .TMP>

<ROUTINE COLOR-MENU-F (TMP M)
	 <COND (<EQUAL? .TMP 1> ;"white is really 9, not 1"
		<SET TMP ,C-WHITE>)>
	 .TMP>

<CONSTANT COLOR-MENU
	  <LTABLE <TABLE (PURE STRING LENGTH) "White ">
		  <TABLE (PURE STRING LENGTH) "Black ">
		  <TABLE (PURE STRING LENGTH) "Red ">
		  <TABLE (PURE STRING LENGTH) "Green ">
		  <TABLE (PURE STRING LENGTH) "Yellow ">
		  <TABLE (PURE STRING LENGTH) "Blue ">
		  <TABLE (PURE STRING LENGTH) "Magenta ">
		  <TABLE (PURE STRING LENGTH) "Cyan ">>>

<CONSTANT COLOR-TABLE
	  <TABLE ;0 "no change"
		 ;1 "the default color"
		 ;2 "black"
		 ;3 "red"
		 ;4 "green"
		 ;5 "yellow"
		 ;6 "blue"
		 ;7 "magenta"
		 ;8 "cyan"
		 ;9 "white">>

<ROUTINE V-SHRUG ()
	 <TELL "An eloquent gesture." CR>>

<ROUTINE V-SING ()
	 <COND (<PRSO? <> ,ME>
		<TELL
"You sing an old sea chanty.">
		<COND (<G? ,SCENE 1>
		       <TELL " It's a good thing no Japanese understand
English.">)>
		<CRLF>)
	       (<FSET? ,PRSO ,PERSON>
		<TELL
CTHE ,PRSO " doesn't seem impressed." CR>)
	       (ELSE
		<TELL "You can't sing that." CR>)>>

<ROUTINE V-DISTRACT ()
	 <TELL "You are unsuccessful." CR>>

<ROUTINE V-JOIN ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (ELSE
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)>>

<ROUTINE OUTSIDE-TUB? (TUB)
	 <AND <NOT <GAME-VERB?>>
	      <NOT <PASSIVE-VERB?>>
	      ,PRSO
	      <NOT <HELD? ,PRSO>>
	      <NOT <PRSO? .TUB ,ME ,ROOMS>>
	      <NOT <IN? ,PRSO .TUB>>
	      <NOT <FSET? ,PRSO ,BODY-PART>>
	      <NOT <PRSO? LATIN SPANISH PORTUGUESE DUTCH>>>>

<ROUTINE V-DRAW ()
	 <COND (<AND <FSET? ,PRSO ,WEAPONBIT>
		     <HELD? ,PRSO>>
		<PERFORM ,V?USE ,PRSO>
		<RTRUE>)
	       (ELSE
		<TELL
"The result reveals that it's a good thing you became a Pilot
instead of an artist." CR>)>>

<ROUTINE V-DIVE ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,VEHBIT>
		       <PERFORM ,V?BOARD ,PRSO>
		       <RTRUE>)
		      (<FSET? ,PRSO ,DOORBIT>
		       <PERFORM ,V?THROUGH ,PRSO>
		       <RTRUE>)
		      (<IN? ,PRSO ,ROOMS>
		       <PERFORM ,V?WALK-TO ,PRSO>
		       <RTRUE>)
		      (ELSE
		       <TELL "You can't dive into " THE ,PRSO "." CR>)>)
	       (ELSE
		<TELL "Taking a dive, eh?" CR>)>>

<ROUTINE V-BABBLE ()
	 <TELL "You babble nonsense for a while." CR>>

<ROUTINE V-TRIP ()
	 <TELL "You are unsuccessful." CR>>

<ROUTINE V-NIHON-GO-GA ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<PRSO? ,HANASE-MASEN>
		<TELL "True enough, but you're getting better." CR>)
	       (ELSE
		<TELL G"You are making little sense." CR>)>>

<ROUTINE V-GENKI-DESU ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<PRSO? ,ROOMS>
		<TELL "It's good to know you're feeling well." CR>)
	       (ELSE
		<TELL G"You are making little sense." CR>)>>

<ROUTINE V-GOMEN-NASAI ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<PRSO? ,ROOMS>
		<TELL "No one seems to be expecting an apology." CR>)
	       (ELSE
		<TELL G"You are making little sense." CR>)>>

<ROUTINE V-ISOGI ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (ELSE
		<TELL "No one seems to be listening." CR>)>>

<ROUTINE V-KONBANWA ()
	 <PERFORM ,V?KONNICHI-WA ,ROOMS>
	 <RTRUE>>

<ROUTINE V-KONNICHI-WA ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (<PRSO? ,ROOMS>
		<TELL "Good practice!  Your accent is getting better." CR>)
	       (ELSE
		<TELL G"You are making little sense." CR>)>>

<ROUTINE V-KINJIRU ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (ELSE
		<TELL G"It's not clear what you are getting at." CR>)>>

<ROUTINE V-DRY ()
	 <TELL CTHE ,PRSO " doesn't seem to want to be dried." CR>>

<ROUTINE V-WARN ()
	 <COND (<NOT <FSET? ,PRSO ,PERSON>>
		<YOU-CANT-X-PRSO "warn">)
	       (<FSET? ,PRSO ,DEAD>
		<TELL
,YOU-CANT G"expect a response from a dead person!" CR>)
	       (,PRSI
		<TELL
CTHE ,PRSO " doesn't seem worried about " THE ,PRSI "." CR>)
	       (,OPPONENT
		<PERFORM ,V?WARN ,PRSO ,OPPONENT>
		<RTRUE>)
	       (ELSE
		<TELL
CTHE ,PRSO " doesn't seem worried." CR>)>>

<ROUTINE V-PULL-BEHIND ()
	 <YOU-CANT-X-PRSO "pull">>

<ROUTINE V-TOMO ()
	 <COND (<TRY-QCONTEXT?> <RTRUE>)
	       (ELSE
		<TELL G"It's not clear what you are getting at." CR>)>>

<ROUTINE V-NEH ()
	 <TELL "\"Neh.\"" CR>>

<END-SEGMENT>