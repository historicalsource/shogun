"MISC for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<BEGIN-SEGMENT 0>

<PROPDEF SCENE <> (SCENE "MANY" S:FIX = <> "MANY" <BYTE .S>)>
<PROPDEF SCORE <> (SCORE N:FIX = 2 <BYTE 0> <BYTE .N>)>

;"tell macro and friends"

;"moved tell-tokens to DEFS"

<ROUTINE PRINT-HIM/HER (X)
	 <COND (<FSET? .X ,PLURAL>
		<TELL "them">)
	       (<FSET? .X ,PERSON>
		<COND (<EQUAL? .X ,ME ,WINNER>
		       <TELL "yourself">)
		      (<FSET? .X ,FEMALE>
		       <TELL "her">)
		      (ELSE <TELL "him">)>)
	       (ELSE <TELL "it">)>>

<ROUTINE CPRINT-HE/SHE (X)
	 <COND (<FSET? .X ,PLURAL>
		<TELL "They">)
	       (<FSET? .X ,PERSON>
		<COND (<EQUAL? .X ,ME ,WINNER>
		       <TELL "You">)
		      (<FSET? .X ,FEMALE>
		       <TELL "She">)
		      (ELSE <TELL "He">)>)
	       (ELSE <TELL "It">)>>

<ROUTINE PRINT-HE/SHE (X)
	 <COND (<FSET? .X ,PLURAL>
		<TELL "they">)
	       (<FSET? .X ,PERSON>
		<COND (<EQUAL? .X ,ME ,WINNER>
		       <TELL "yourself">)
		      (<FSET? .X ,FEMALE>
		       <TELL "she">)
		      (ELSE <TELL "he">)>)
	       (ELSE <TELL "it">)>>

<ROUTINE PRINT-HIS/HER (X)
	 <COND (<FSET? .X ,PLURAL>
		<TELL "their">)
	       (<FSET? .X ,PERSON>
		<COND (<EQUAL? .X ,ME ,WINNER>
		       <TELL "your">)
		      (<FSET? .X ,FEMALE>
		       <TELL "her">)
		      (ELSE <TELL "his">)>)
	       (ELSE <TELL "its">)>>

<ROUTINE PRINT-PLURAL (OBJ)
	 <COND (<NOT <FSET? .OBJ ,PLURAL>>
		<TELL "s">)>>

<ROUTINE PRINTUNDER (X)
	 <HLIGHT ,H-UNDER>
	 <PRINT .X>
	 <HLIGHT ,H-NORMAL>>

<ROUTINE CTHE-PRINT-PRSO ()
	 <THE-PRINT ,PRSO T>>

<ROUTINE CTHE-PRINT-PRSI ()
	 <THE-PRINT ,PRSI T>>

<ROUTINE CTHE-PRINT (O)
	 <THE-PRINT .O T>>

<ROUTINE THE-PRINT-PRSO ()
	 <THE-PRINT ,PRSO>>

<ROUTINE THE-PRINT-PRSI ()
	 <THE-PRINT ,PRSI>>

<ROUTINE THE-PRINT (O "OPTIONAL" (CAP? <>))
	 <DPRINT .O .CAP? <NOT <FSET? .O ,NOTHEBIT>>>>

<ROUTINE CPRINTA-PRSO ()
	 <PRINTA ,PRSO T>>

;<ROUTINE CPRINTA-PRSI ()
	 <PRINTA ,PRSI T>>

;<ROUTINE CPRINTA (O)
	 <PRINTA .O T>>

<ROUTINE PRINTA-PRSO ()
	 <PRINTA ,PRSO>>

<ROUTINE PRINTA-PRSI ()
	 <PRINTA ,PRSI>>

<ROUTINE PRINTA (O "OPT" (CAP? <>))
	 <COND (<FSET? .O ,THE>
		<COND (.CAP? <PRINTI "The ">)
		      (ELSE <PRINTI "the ">)>)
	       (<NOT <FSET? .O ,NOABIT>>
		<COND (<FSET? .O ,AN>
		       <COND (.CAP? <PRINTI "An ">)
			     (ELSE <PRINTI "an ">)>)
		      (.CAP? <PRINTI "A ">)
		      (ELSE <PRINTI "a ">)>)>
	 <IPRINT .O>>

<ROUTINE DPRINT-PRSO ()
	 <DPRINT ,PRSO>>

<ROUTINE DPRINT-PRSI ()
	 <DPRINT ,PRSI>>

;<ROUTINE CDPRINT-PRSO ()
	 <DPRINT ,PRSO T>>

;<ROUTINE CDPRINT-PRSI ()
	 <DPRINT ,PRSI T>>

;<ROUTINE CDPRINT (O)
	 <DPRINT .O T>>

<ROUTINE DPRINT (O "OPTIONAL" (CAP? <>) (THE? <>) "AUX" S)
	 <COND (<EQUAL? .O ,PLAYER ,ME>
		<COND (.CAP? <TELL "You">)
		      (ELSE <TELL "you">)>)
	       (<AND <EQUAL? .O ,RUTTER> .CAP?>
		<TELL "Your rutter">)
	       (ELSE
		<COND (<AND <SET S <GET-OWNER .O>>
			    <NOT <EQUAL? .S <GETP .O ,P?OWNER>>>>
		       <COND (<EQUAL? .S ,PLAYER>
			      <COND (.CAP? <TELL "Your ">)
				    (T <TELL "your ">)>)
			     (ELSE
			      <DPRINT .S .CAP? ;.THE?>
			      <TELL "'s ">)>)
		      (<OR .THE? <FSET? .O ,THE>>
		       <COND (.CAP? <PRINTI "The ">)
			     (T <PRINTI "the ">)>)>
		<IPRINT .O>)>>

<ROUTINE IPRINT (O "AUX" TMP)
	 <COND ;(<AND <EQUAL? .O ,PSEUDO-OBJECT>
		     <NOT ,P-MERGED>
		     <EQUAL? .O ,PRSO ,PRSI>>
		<THING-PRINT ,PSEUDO-PRSO ;"<EQUAL? .O ,PRSO>">)
	       (<SET TMP <GETP .O ,P?SDESC>>
		<PRINT .TMP>)
	       (ELSE
		<PRINTD .O>)>>

<COND (<GASSIGNED? ZILCH>
<DEFINE PE (F I)
	<COND (<TYPE? .I LIST>
	       <FORM .F !.I>)
	      (ELSE
	       <FORM .F .I>)>>

<DEFMAC P? ('V "OPT" ('O '*) ('I '*) ('W '*) "AUX" (L ()))
	<COND (<N==? .I '*>
	       <SET L (<PE PRSI? .I> !.L)>)>
	<COND (<N==? .O '*>
	       <COND (<OR <==? .V 'WALK>
			  <==? .V ',V?WALK>>
		      <SET L (<PE DIR? .O> !.L)>)
		     (ELSE
		      <SET L (<PE PRSO? .O> !.L)>)>)>
	<COND (<N==? .V '*>
	       <SET L (<PE VERB? .V> !.L)>)>
	<COND (<N==? .W '*>
	       <SET L (<PE WINNER? .W> !.L)>)>
	<COND (<EMPTY? <REST .L>>
	       <1 .L>)
	      (ELSE <FORM AND !.L>)>>

<DEFMAC NOT-SOLVED? ('OBJ)
	<FORM FSET? .OBJ ',SCOREBIT>>

<DEFMAC SOLVED? ('OBJ)
	<FORM NOT <FORM FSET? .OBJ ',SCOREBIT>>>

<DEFMAC VERB? ("ARGS" ATMS)
	<MULTIFROB ',PRSA .ATMS>>

<DEFMAC SCENE? ("ARGS" ATMS)
	<MULTIFROB ',SCENE .ATMS>>

<DEFMAC CONTEXT? ("ARGS" ATMS)
	<MULTIFROB '.RARG .ATMS>>

<DEFMAC ADJ? ("ARGS" ATMS)
	<MULTIFROB '<PARSE-ADJ ,PARSE-RESULT> .ATMS>>

<SETG RARG? ,CONTEXT?>

<DEFMAC WINNER? ("ARGS" ATMS)
	<MULTIFROB ',WINNER .ATMS>>

<DEFMAC PRSO? ("ARGS" ATMS)
	<MULTIFROB ',PRSO .ATMS>>

<DEFMAC DIR? ("ARGS" ATMS)
	<MULTIFROB ',P-WALK-DIR .ATMS>>

<DEFMAC PRSI? ("ARGS" ATMS)
	<MULTIFROB ',PRSI .ATMS>>

<DEFMAC HERE? ("ARGS" ATMS)
	<MULTIFROB ',HERE .ATMS>>

<SETG ROOM? ,HERE?>

<DEFINE MULTIFROB (X ATMS "AUX" (OO (OR)) (O .OO) (L ()) ATM SP) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- <COND (<LENGTH? .OO 1> <ERROR .X>)
				       (<LENGTH? .OO 2> <NTH .OO 2>)
				       (ELSE <CHTYPE .OO FORM>)>>)>
		<REST
		 <PUTREST
		  .O
		  <SET O
		       (<REPEAT
			 ((LL <FORM EQUAL? .X>)
			  (L <REST .LL>))
			 <COND (<OR <EMPTY? .ATMS>
				    <==? <LENGTH <REST .LL 2>> 3>>
				<RETURN!- .LL>)>
			 <SET ATM <NTH .ATMS 1>>
			 <PUTREST
			  .L
			  <SET L
			       (<COND
				 (<TYPE? .ATM ATOM>
				  <SET SP <SPNAME .ATM>>
				  <MAKE-GVAL
				   <COND (<==? .X ',PRSA>
					  <PARSE <STRING "V?" .SP>>)
					 (<==? .X ',P-WALK-DIR>
					  <COND (<AND <G? <LENGTH .SP> 2>
						      <==? <1 .SP> !\P>
						      <==? <2 .SP> !\?>>
						 .ATM)
						(ELSE
						 <PARSE
						  <STRING "P?" .SP>>)>)
					 (<==? .X '.RARG>
					  <COND (<AND <G? <LENGTH .SP> 2>
						      <==? <1 .SP> !\M>
						      <==? <2 .SP> !\->>
						 .ATM)
						(ELSE
						 <PARSE
						  <STRING "M-" .SP>>)>)
					 (ELSE .ATM)>>)
				 (ELSE .ATM)>)>>
			 <SET ATMS <REST .ATMS>>>)>>>>>)
(ELSE
 <DEFINE P? (V "OPT" (O '*) (I '*) (W '*) "AUX" (L <>))
	 <AND <OR <==? .W '*> <WINNER? .W>>
	      <OR <==? .V '*> <VERB? .V>>
	      <OR <==? .O '*> <PRSO? .O>>
	      <OR <==? .I '*> <PRSI? .I>>>>

 <DEFINE VERB? ("TUPLE" ATMS)
	 <MAPF <>
	       <FUNCTION (A "AUX" ATM)
		    <COND (<TYPE? .A ATOM>
			   <COND (<SET ATM
				       <LOOKUP <STRING "V?" <SPNAME .A>>
					       <MOBLIST INITIAL>>>
				  <COND (<EQUAL? ,PRSA ,.ATM>
					 <MAPLEAVE T>)>)
				 (ELSE
				  <ERROR NOT-A-VERB? .A>)>)
			  (<EQUAL? ,PRSA .A>
			   <MAPLEAVE T>)>>
	       .ATMS>>
 <DEFINE CONTEXT? ("TUPLE" ATMS)
 	 <MAPF <>
	       <FUNCTION (A "AUX" ATM)
		    <COND (<TYPE? .A ATOM>
			   <COND (<AND <G? <LENGTH <SET ATM <SPNAME .A>>> 2>
				       <==? <1 .ATM> !\M>
				       <==? <2 .ATM> !\->>
				  <COND (<EQUAL? .RARG ,.ATM>
					 <MAPLEAVE T>)>)
				 (<SET ATM
				       <LOOKUP <STRING "M-" <SPNAME .A>>
					       <MOBLIST INITIAL>>>
				  <COND (<EQUAL? .RARG ,.ATM>
					 <MAPLEAVE T>)>)
				 (ELSE
				  <ERROR NOT-A-CONTEXT? .A>)>)
			  (<EQUAL? .RARG .A>
			   <MAPLEAVE T>)>>
	       .ATMS>>
 <SETG RARG? ,CONTEXT?>
 <DEFINE WINNER? ("TUPLE" ATMS)
	 <MULTIFROB ,WINNER .ATMS>>
 <DEFINE PRSO? ("TUPLE" ATMS)
	 <MULTIFROB ,PRSO .ATMS>>
 <DEFINE PRSI? ("TUPLE" ATMS)
	 <MULTIFROB ,PRSI .ATMS>>
 <DEFINE HERE? ("TUPLE" ATMS)
	 <MULTIFROB HERE .ATMS>>
 <SETG ROOM? ,HERE?>
 <DEFINE MULTIFROB (X ATMS) 
	 <MAPF <>
	       <FUNCTION (A)
		    <COND (<TYPE? .A ATOM> <SET A ,.A>)>
		    <COND (<EQUAL? .X .A>
			   <MAPLEAVE T>)>>
	       .ATMS>>)>

<COND (<GASSIGNED? ZILCH>
<DEFMAC BSET ('OBJ "ARGS" BITS)
	<MULTIBITS FSET .OBJ .BITS>>

<DEFMAC BCLEAR ('OBJ "ARGS" BITS)
	<MULTIBITS FCLEAR .OBJ .BITS>>

<DEFMAC BSET? ('OBJ "ARGS" BITS)
	<MULTIBITS FSET? .OBJ .BITS>>

<DEFINE MULTIBITS (X OBJ ATMS
		   "AUX" (OT <COND (<==? .X FSET?> <FORM OR>)
				   (ELSE <FORM PROG ()>)>)
		         (OO <COND (<LENGTH? .OT 1> .OT)
				   (ELSE <REST .OT>)>)
			 (O .OO)
			 ATM) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- .OT>)>
		<SET ATM <NTH .ATMS 1>>
		<SET ATMS <REST .ATMS>>
		<PUTREST .O
			 <SET O
			      (<FORM .X
				     .OBJ
				     <COND (<TYPE? .ATM FORM> .ATM)
					   (ELSE <MAKE-GVAL .ATM>)>>)>>>>)
(ELSE
<DEFINE BSET (OBJ "TUPLE" BITS)
	<MULTIBITS ,FSET .OBJ .BITS>>

<DEFINE BCLEAR (OBJ "TUPLE" BITS)
	<MULTIBITS ,FCLEAR .OBJ .BITS>>

<DEFINE BSET? (OBJ "TUPLE" BITS)
	<MAPF <>
	      <FUNCTION (A)
		   <COND (<FSET? .OBJ ,.A> <MAPLEAVE T>)>>
	      .BITS>>

<DEFINE MULTIBITS (X OBJ ATMS) 
	<MAPF <>
	      <FUNCTION (A)
		   <APPLY!- .X .OBJ ,.A>>
	      .ATMS>>)>

<DEFMAC RFATAL ()
	'<RETURN ,M-FATAL>>

<COND (<GASSIGNED? ZILCH>
       <DEFMAC PROB ('BASE?)
	       <FORM NOT <FORM L? .BASE? '<RANDOM 100>>>>)
      (ELSE
       <DEFINE PROB (BASE?)
	       <NOT <L? .BASE? <RANDOM 100>>>>)>

<ROUTINE PICK-ONE (FROB
		   "AUX" (L <GET .FROB 0>) (CNT <GET .FROB 1>) RND MSG RFROB)
	 <SET L <- .L 1>>
	 <SET FROB <REST .FROB 2>>
	 <SET RFROB <REST .FROB <* .CNT 2>>>
	 <SET RND <RANDOM <- .L .CNT>>>
	 <SET MSG <GET .RFROB .RND>>
	 <PUT .RFROB .RND <GET .RFROB 1>>
	 <PUT .RFROB 1 .MSG>
	 <SET CNT <+ .CNT 1>>
	 <COND (<==? .CNT .L> <SET CNT 0>)>
	 <PUT .FROB 0 .CNT>
	 .MSG>

;<ROUTINE RANDOM-ELEMENT (FROB)
	 <GET .FROB <RANDOM <GET .FROB 0>>>>

<DEFMAC APPLE? ()
   '<EQUAL? ,MACHINE ,APPLE-2E ,APPLE-2C ,APPLE-2GS>>



;"former MAIN.ZIL stuff"

<GLOBAL P-WON <>>

<GLOBAL SCENE 0>

<ROUTINE SCENE-SELECT ("OPT" (FULL? <>) "AUX" TMP M WID WHICH L Y END)
	 <SET L <+ <GET ,PART-MENU ;.MEN 0> 1>>
	 <SET END <+ 1 <WINGET ,S-FULL ,WHIGH>>>
	 <COND (<APPLE?> <SET L <+ .L 2>>)>
	 <SET TMP <* .L ,FONT-Y>>
	 <SET Y <- .END .TMP>>
	 <COND (<APPLE?> <SET Y <- .Y <* 2 ,FONT-Y>>>)>
	 <WINDEF ,S-TEXT
		 .Y <WINGET ,S-TEXT ,WLEFT>
		 .TMP <WINGET ,S-TEXT ,WWIDE>>
	 <RESET-MARGIN>
	 <REPEAT ()
		 <CLEAR ,S-TEXT>
		 <SCREEN ,S-TEXT>
		 <SET WHICH
		      <GET-FROM-MENU "You may choose to: "
				     ,PART-MENU
				     ,SCENE-SELECT-F
				     1>>
		 <COND (.WHICH <RTRUE>)>>>

<ROUTINE SCENE-SELECT-F (TMP M)
	 <COND (<EQUAL? .TMP 1>
		<SETUP-TEXT-AND-STATUS>
		;<SPLIT <* ,FONT-Y ,STATUS-LINES>>
		<SETG SCENE <GET ,SCENES 1>>)
	       (<EQUAL? .TMP 2>
		<CLEAR ,S-TEXT>
		<V-RESTORE>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>
		<RFALSE>)
	       (<EQUAL? .TMP 3>
		<CLEAR ,S-TEXT>
		<V-QUIT T <>>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>
		<RFALSE>)>>



"SCENES AND PARTS"

<CONSTANT PART-MENU
	  <LTABLE <TABLE (PURE STRING LENGTH) "START the game ">
		  <TABLE (PURE STRING LENGTH) "RESTORE a saved game ">
		  <TABLE (PURE STRING LENGTH) "QUIT the game ">>>

<CONSTANT SCENE-NAMES
	  <PLTABLE "Erasmus"
		   "Anjiro"
		   "Yabu"
		   "Pit"		;"omi & yabu"
		   "Rodrigues"		;"crew out of pit"
		   "Voyage to Osaka"	;"rod's advice"
		   "Toranaga"		;"ishido vs. t."
		   "Prison"		;"how to help"
		   "Mariko"		;"alvito & ferriera"
		   "Escape"		;"hatamoto"
		   "Earthquake"		;"zataki"
		   "Journey to Yedo"	;"delay, etc."
		   "Ochiba"
		   "Departure"		;"council"
		   "Seppuku"
		   "Ninja"		;"etsu's death"
		   "Yokohama"
		   "Aftermath"
		   "Epilogue">>

<DEFMAC SCENE-CONSTANTS ("TUPLE" SS "AUX" (CNT 0))
	<MAPF ,PLTABLE
	      <FUNCTION (S)
		   <EVAL <FORM CONSTANT .S <SET CNT <+ .CNT 1>>>>>
	      .SS>>

<CONSTANT SCENES
	  <SCENE-CONSTANTS S-ERASMUS
			   S-ANJIRO
			   S-YABU
			   S-PIT
			   S-RODRIGUES
			   S-VOYAGE
			   S-TORANAGA
			   S-PRISON
			   S-MARIKO
			   S-ESCAPE
			   S-QUAKE
			   S-JOURNEY
			   S-OCHIBA
			   S-DEPARTURE
			   S-SEPPUKU
			   S-NINJA
			   S-YOKOHAMA
			   S-AFTERMATH
			   S-EPILOGUE>>

<CONSTANT SCENE-LOCS
	  <PLTABLE BRIDGE-OF-ERASMUS	;"S-ERASMUS"
		   MURA-HOUSE		;"S-ANJIRO"
		   VILLAGE-SQUARE	;"S-YABU"
		   PIT			;"S-PIT"
		   ANJIRO-WATERFRONT	;"S-RODRIGUES"
		   GALLEY		;"S-VOYAGE"
		   OUTER-CORRIDOR	;"S-TORANAGA"
		   PRISON		;"S-PRISON"
		   MAPLE-GLADE		;"S-MARIKO"
		   COURTYARD		;"S-ESCAPE"
		   PLATEAU		;"S-QUAKE"
		   YOKOSE-BATH-HOUSE	;"S-JOURNEY"
		   OCHIBA-ROOM		;"S-OCHIBA"
		   FORECOURT		;"S-DEPARTURE"
		   FORMAL-GARDEN	;"S-SEPPUKU"
		   PRIVATE-QUARTERS	;"S-NINJA"
		   YOKOHAMA		;"S-YOKOHAMA"
		   STABLE		;"S-AFTERMATH"
		   SEKIGAHARA		;"S-EPILOGUE">>

<CONSTANT SCENE-PICS
	  <TABLE (PURE BYTE LENGTH)
		 P-STORM	;"S-ERASMUS"
		 P-GARDEN	;"S-ANJIRO"
		 P-YABU-SEG	;"S-YABU"
		 P-PIT		;"S-PIT"
		 P-RODRIGUES-SEG ;"S-RODRIGUES"
		 P-CONFUSION	;"S-VOYAGE"
		 P-OSAKA	;"S-TORANAGA"
		 P-PRISON-SEG	;"S-PRISON"
		 P-MARIKO-SEG	;"S-MARIKO"
		 P-PROCESSION	;"S-ESCAPE"
		 P-QUAKE	;"S-QUAKE"
		 P-BATH		;"S-JOURNEY"
		 P-OCHIBA-SEG	;"S-OCHIBA"
		 P-DEPARTURE-SEG ;"S-DEPARTURE"
		 P-SEPPUKU	;"S-SEPPUKU"
		 P-NINJA	;"S-NINJA"
		 P-VINCK	;"S-YOKOHAMA"
		 P-AFTERMATH-SEG ;"S-AFTERMATH"
		 P-CREST	;"S-EPILOGUE">>

<GLOBAL MACHINE <>>
<GLOBAL WIDTH 0>

<END-SEGMENT ;"0">

<BEGIN-SEGMENT STARTUP>

<ROUTINE GO () 
	 <MOUSE-LIMIT -1>
	 <SETG MACHINE <LOWCORE INTID>>
	 <COND ;(<EQUAL? ,MACHINE ,AMIGA> ;"sigh, all Amiga colors are ugly"
		<SETG FG-COLOR ,C-BLACK>
		<SETG BG-COLOR 10 ;"light gray">
		<COLOR ,FG-COLOR ,BG-COLOR>)
	       (ELSE
		<SETG FG-COLOR <LOWCORE (CLRWRD 1)>>
		<SETG BG-COLOR <LOWCORE (CLRWRD 0)>>)>
	 <COND (<APPLE?>
		<SETG TEXT-MARGIN 0>
		<COND (<PICINF ,P-BORDER ,YX-TBL>
		       <SETG BORDER-HEIGHT <GET ,YX-TBL 0>>)>)
	       (ELSE <SETG TEXT-MARGIN 2>)>
	 <SETG LIT T>
	 <SETG CLOCK-HAND <REST ,C-TABLE ,C-TABLELEN>>
	 <SETG PLAYER ,BLACKTHORNE>
	 <SETUP-FULL>
	 <TITLE-SCREEN>
	 <COND (,DEMO-VERSION?
		<SLIDE-SHOW>
		<AGAIN>)>
	 <SETUP-DISPLAY>
	 <SCENE-SELECT>
	 <GOTO-SCENE ,SCENE <>>
	 <MAIN-LOOP>>

<ROUTINE SLIDE-SHOW ()
	<CLEAR -1>
	<TELL
"This is a demonstration version of SHOGUN.|
|
	First you will see a few samples of the graphic screens that await you
in SHOGUN.We've used graphics in surprising new ways to enhance the
story without detracting from Infocom's traditional richness and depth.|
	Then you will be able to interact with a small section of
SHOGUN.Feel free to try the new friendlier parser, the optional mouse
interface, and the on-screen hints.|
	SHOGUN is an adaptation of James Clavell's novel,
which has sold over 7 million copies and inspired the popular T.V.
mini-series.Dave Lebling, while collaborating with Clavell, has
incorporated the creative style and rich prose that have made his
earlier ZORK titles so popular.|
	In SHOGUN you are transcended into the world of Clavell's saga, which
combines all of the mystery and action of a great adventure story with
the intensity and romance of a classic love story.Whether you find
yourself matching wits with tyrannical Japanese aristocrats or fighting
off attacks by Ninja assassins, you are sure to be both challenged and
entertained.Both the action and the intriguing, historical locale set
the stage for unparalleled fun and excitement.|
">
	<TYPE-ANY-KEY>
	<END-DEMO>>

<ROUTINE END-DEMO ()
	<CLEAR -1>
	<TELL "|
You have reached the end of this demonstration version of|">
	<V-VERSION>
	<TELL "||">
	<TYPE-ANY-KEY>
	<SCREEN ,S-TEXT>
	;<DEFAULT-COLORS> ;"return to default before screen clears"
	<RESTART>
	<TELL ,FAILED>
	<AGAIN>>

<END-SEGMENT ;"STARTUP">

<BEGIN-SEGMENT 0>

<CONSTANT S-FULL 7>

<ROUTINE SETUP-FULL ("AUX" (HIGH <LOWCORE VWRD>) (WIDE <LOWCORE HWRD>) X)
	 <WINDEF ,S-FULL 1 1 .HIGH .WIDE>
	 <SET X <WINGET ,S-TEXT ,WFSIZE>>
	 <SETG FONT-Y <HIGH-BYTE .X>>
	 <SETG FONT-X <LOW-BYTE .X>>>

<ROUTINE SETUP-DISPLAY ("AUX" (HIGH <LOWCORE VWRD>) (WIDE <LOWCORE HWRD>))
	 <MOUSE-LIMIT -1>
	 <SETUP-FULL>
	 <SETUP-TEXT-AND-STATUS>
	 <SET WIDE <WINGET ,S-TEXT ,WWIDE>>
	 <MARGIN ,TEXT-MARGIN ,TEXT-MARGIN ,S-TEXT>
	 <SET WIDE <- .WIDE <* 2 ,TEXT-MARGIN>>>
	 <SETG WIDTH <GETB ,P-INBUF 0>>
	 <SET WIDE </ .WIDE ,FONT-X>>
	 <COND (<L? .WIDE ,WIDTH>
		<SETG WIDTH .WIDE>
		<PUTB ,P-INBUF 0
		      <COND (<G? .WIDE ,INBUF-LENGTH>
			     ,INBUF-LENGTH)
			    (T
			     .WIDE)>>)>>

<ROUTINE REPAINT-DISPLAY ("OPT" (NO-BORDER? <>))
	 <RESET-MARGIN>
	 <NORMAL-COLOR>
	 <SETUP-DISPLAY>
	 <COND (<OR <APPLE?> <NOT .NO-BORDER?>>
		<DISPLAY-BORDER>)>
	 <INIT-STATUS-LINE T>
	 <COND (<HERE? ,MAZE>
		<DISPLAY-MAZE>)>>

<ROUTINE GOTO-SCENE (SC "OPT" (OSC ,SCENE))
	 <CLEAR ,S-TEXT>
	 <COND (<AND <APPLE?> <NOT .OSC>>
		<SCREEN ,S-STATUS>
		<CLEAR ,S-STATUS>
		<DISPLAY-BORDER ,P-EBORDER>)
	       (<NOT <EQUAL? ,CURRENT-BORDER ,P-BORDER>>
		<DISPLAY-BORDER ,P-BORDER>)>
	 <END-QUOTE>
	 <RESET-MARGIN>
	 <DEQUEUE-ALL>
	 <SETG ORPHAN-ANSWER <>>
	 <SETG SCENE .SC>
	 <SETG HERE <GET ,SCENE-LOCS ,SCENE>>
	 <TOUCH-SEG <GETB ,SCENE-PICS ,SCENE>>
	 <FCLEAR ,HERE ,TOUCHBIT>
	 <SETG QCONTEXT <>>
	 <MOVE-ALL ,BLACKTHORNE>
	 <MOVE ,BLACKTHORNE ,HERE>
	 <FCLEAR ,BLACKTHORNE ,RMUNGBIT>
	 <SETG P-IT-OBJECT <>>
	 <SETG P-HIM-OBJECT <>>
	 <SETG P-HER-OBJECT <>>
	 <SETG P-THEM-OBJECT <>>
	 <B-STAND>
	 <SETG OPPONENT <>>
	 <APPLY <GETP ,HERE ,P?ACTION> ,M-SCENE-SETUP>
	 <SETG WINNER ,PLAYER>
	 <CLEAR ,S-TEXT>
	 <COND (<ZERO? .OSC>
		<CLEAR ,S-STATUS>
		<INIT-STATUS-LINE>)
	       (ELSE <UPDATE-STATUS-LINE T>)>
	 <GOTO ,HERE>
	 <COND (<ZERO? .OSC>
		<CLOCKER> ;"simulate a previous move..."
		<SETG MOVES 0>)>
	 <RTRUE>>

<ROUTINE TOUCH-SEG (S)
	 <COND (<OR <APPLE?> <EQUAL? ,MACHINE ,IBM>>
		<PICINF .S ,YX-TBL>)>>

;<GLOBAL WAS-IT? <>>
;<GLOBAL WAS-THEM? <>>
;<GLOBAL WAS-HIM? <>>
;<GLOBAL WAS-HER? <>>

;<GLOBAL PERFORM-DEPTH 0> ;"number recursive calls to perform"

;<CONSTANT P-MATCHLEN 0>
;<ROUTINE OBJECT-SUBSTITUTE (OBJ VAR "AUX" (TMP <>) (CNT 0) ICNT OCNT)
	 <COND (<AND .VAR <ACCESSIBLE? .VAR>>
		<SET ICNT <GET ,P-PRSI ,P-MATCHLEN>>
		<SET OCNT <GET ,P-PRSO ,P-MATCHLEN>>
		<REPEAT ()
			<COND (<G? <SET CNT <+ .CNT 1>> .ICNT>
			       <RETURN>)
			      (T
			       <COND (<EQUAL? <GET ,P-PRSI .CNT> .OBJ>
				      <PUT ,P-PRSI .CNT .VAR>
				      <SET TMP T>
				      <RETURN>)>)>>
		<SET CNT 0>
		<REPEAT ()
			<COND (<G? <SET CNT <+ .CNT 1>> .OCNT>
			       <RETURN>)
			      (T
			       <COND (<EQUAL? <GET ,P-PRSO .CNT> .OBJ>
				      <PUT ,P-PRSO .CNT .VAR>
				      <SET TMP T>
				      <RETURN>)>)>>
		.TMP)>>

;<GLOBAL PSEUDO-PRSO <>> ;"T IF ORIGINAL PRSO WAS PSEUDO-OBJECT"

<ROUTINE GAME-VERB? ()
	 <COND (<AND <VERB? TELL> ,P-CONT> <RTRUE>)
	       (<AND <VERB? HELP>
		     <NOT ,PRSO>>
		<RTRUE>)
	       (<VERB? QUIT VERSION BRIEF SUPER-BRIEF VERBOSE COLOR
		       $VERIFY RESTART SAVE RESTORE SCRIPT UNSCRIPT UNDO
		       SCORE TIME DEFINE $REFRESH NOTIFY HINT HINTS-OFF
		       CREDITS>
		<RTRUE>)
	       (<VERB? $RANDOM $COMMAND $RECORD $UNRECORD
		       ;$SCENE ;$SHOW ;$W ;$P ;$D ;$I ;$G ;$X ;$M>
		<RTRUE>)>>

"MULTIPLE-EXCEPTION? -- return true if an object found by all should not
be included when the crunch comes."

;<ROUTINE MULTIPLE-EXCEPTION? (OBJ1 "AUX" (L <LOC .OBJ1>))
	 <COND (<EQUAL? .OBJ1 ,NOT-HERE-OBJECT>
		<SETG P-NOT-HERE <+ ,P-NOT-HERE 1>>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     ,PRSI
		     <NOT <IN? ,PRSO ,PRSI>>>
		;"TAKE X FROM Y and x not in y"
		<RTRUE>)
	       (<NOT <ACCESSIBLE? .OBJ1>>
		;"can't get at object"
		<RTRUE>)
	       (<EQUAL? ,P-GETFLAGS ,P-ALL>
		;"cases for ALL"
		<COND (<AND ,PRSI
			    <PRSO? ,PRSI>>
		       ;"VERB ALL and prso = prsi"
		       <RTRUE>)
		      (<AND <VERB? TAKE> <NOT ,PRSI>>
		       <COND (<OR <AND <NOT <EQUAL? .L ,WINNER ,HERE ,PRSI>>
				       <NOT <EQUAL? .L <LOC ,WINNER>>>
				       <NOT <FSET? .L ,SURFACEBIT>>
				       <NOT <FSET? .L ,SEARCHBIT>>>
				  <AND <NOT <FSET? .OBJ1 ,TAKEBIT>>
				       <NOT <FSET? .OBJ1 ,TRYTAKEBIT>>>>
			      ;"TAKE ALL and object not accessible or takeable"
			      <RTRUE>)
			     (<OR <FSET? .L ,PERSON>
				  <FSET? <LOC .L> ,PERSON>>
			      ;"TAKE ALL held by a person (use TAKE ALL FROM)"
			      <RTRUE>)
			     (<HELD? ,PRSO>
			      ;"TAKE ALL and one object has others in it"
			      <RTRUE>)>)
		      (<VERB? DROP GIVE>
		       <COND (<NOT <IN? .OBJ1 ,WINNER>>
			      ;"GIVE/DROP ALL and object not held"
			      <RTRUE>)
			     (<FSET? .OBJ1 ,WEARBIT>
			      ;"GIVE/DROP ALL and object worn"
			      <RTRUE>)>)
		      (<AND <VERB? PUT>
			    <NOT <IN? ,PRSO ,WINNER>>
			    <HELD? ,PRSO ,PRSI>>
		       ;"PUT ALL IN X and object already in x"
		       <RTRUE>)>)>>

;<ROUTINE SAVE-INPUT (TBL "AUX" (OFFS 0) CNT TMP)
	 <SET CNT <+ <GETB ,P-LEXV <SET TMP <* 4 ,P-INPUT-WORDS>>>
		     <GETB ,P-LEXV <+ .TMP 1>>>>
	 <COND (<EQUAL? .CNT 0> ;"failed"
		<RFALSE>)>
	 <SET CNT <- .CNT 1>>
	 <REPEAT ()
		 <COND (<EQUAL? .OFFS .CNT>
			<PUTB .TBL .OFFS 0>
			<RETURN>)
		       (T
			<PUTB .TBL .OFFS <GETB ,P-INBUF <+ .OFFS 1>>>)>
		 <SET OFFS <+ .OFFS 1>>>
	 <RTRUE>>

;<ROUTINE RESTORE-INPUT (TBL "AUX" CHR)
	 <REPEAT ()
		 <COND (<EQUAL? <SET CHR <GETB .TBL 0>> 0>
			<RETURN>)
		       (T
			<PRINTC .CHR>
			<SET TBL <REST .TBL>>)>>>

<GLOBAL P-MULT <>>

<GLOBAL P-NOT-HERE 0>


;<GLOBAL WHAT-DO-YOU-WANT-TO "What do you want to ">

;<ROUTINE FAKE-ORPHAN ("AUX" TMP)
	 <ORPHAN ,P-SYNTAX <>>
	 <TELL ,WHAT-DO-YOU-WANT-TO>
	 <SET TMP <GET ,P-OTBL ,P-VERBN>>
	 <COND (<EQUAL? .TMP 0>
		<TELL "tell">)
	       (<ZERO? <GETB ,P-VTBL 2>>
		<PRINTB <GET .TMP 0>>)
	       (T
		<WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
		<PUTB ,P-VTBL 2 0>)>
	 <SETG P-OFLAG T>
	 <SETG P-WON <>>
	 <PREP-PRINT
	     <GETB ,P-SYNTAX ,P-SPREP1>>
	 <TELL "?" CR>>

<ROUTINE END-QUOTE ()
	 <SETG P-CONT <>>
	 <RFATAL>>

;"former CLOCK.ZIL stuff"

<GLOBAL CLOCK-WAIT <>>

<GLOBAL C-TABLE <ITABLE 13 <> <>>>

<CONSTANT C-INTLEN 4>	;"length of an interrupt entry in bytes"
<CONSTANT C-RTN 0>	;"word offset of routine name"
<CONSTANT C-TICK 1>	;"word offset of count"

<CONSTANT C-TABLELEN 52>	;"length of interrupt table in bytes"
<GLOBAL C-INTS 52>		;"start of queued interrupts in bytes"

<ROUTINE DEQUEUE (RTN "AUX" TIM)
	 <COND (<SET RTN <QUEUED? .RTN>>
		<SET TIM <GET .RTN ,C-TICK>>
		<PUT .RTN ,C-RTN 0>
		.TIM)>>

<ROUTINE QUEUED? (RTN "AUX" C E)
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<EQUAL? .C .E> <RFALSE>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<COND (<ZERO? <GET .C ,C-TICK>>
			       <RFALSE>)
			      (T <RETURN .C>)>)>
		 <SET C <REST .C ,C-INTLEN>>>>

"this version of QUEUE automatically enables as well"

"QUEUE routine when fresh?:t means only queue if not currently queued"

<ROUTINE QUEUE (RTN TICK "OPT" (I? <>) "AUX" C E (INT <>))
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<EQUAL? .C .E>
			<COND (.INT
			       <SET C .INT>)
			      (ELSE
			       <SETG C-INTS <- ,C-INTS ,C-INTLEN>>
			       <SET INT <REST ,C-TABLE ,C-INTS>>)>
			<PUT .INT ,C-RTN .RTN>
			<RETURN>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<COND (.I? <RFALSE>)
			      (ELSE
			       <SET INT .C>
			       <RETURN>)>)
		       (<ZERO? <GET .C ,C-RTN>>
			<SET INT .C>)>
		 <SET C <REST .C ,C-INTLEN>>>
	 <COND (%<COND (<GASSIGNED? ZILCH>
			'<G? .INT ,CLOCK-HAND>)
		       (ELSE
			'<L=? <LENGTH .INT> <LENGTH ,CLOCK-HAND>>)>
		<SET TICK <- <+ .TICK 3>>>)>
	 <PUT .INT ,C-TICK .TICK>
	 .INT>

<GLOBAL STATIONARY? <>>	;"winner not walking around?"
<GLOBAL STATIONARY-CNT <>> ;"and for how long"

<GLOBAL CLOCK-HAND <>>

<ROUTINE CLOCKER ("AUX" E TICK RTN (FLG <>) (Q? <>) OWINNER TMP)
	 <COND (,CLOCK-WAIT <SETG CLOCK-WAIT <>> <RFALSE>)>
	 <COND (<EQUAL? ,HERE ,STATIONARY?>
		<SETG STATIONARY-CNT <+ ,STATIONARY-CNT 1>>)
	       (ELSE
		<SETG STATIONARY? ,HERE>
		<SETG STATIONARY-CNT 0>)>
	 <SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET OWINNER ,WINNER>
	 <SETG WINNER ,PLAYER>
	 <REPEAT ()
		 <COND (,NEW-SCENE-NUMBER
			<I-NEW-SCENE>
			<SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>
			<SET FLG T>)>
		 <COND (<EQUAL? ,CLOCK-HAND .E>
			<SETG MOVES <+ ,MOVES 1>>
			<SETG WINNER .OWINNER>
			<RETURN .FLG>)
		       (<NOT <ZERO? <GET ,CLOCK-HAND ,C-RTN>>>
			<SET TICK <GET ,CLOCK-HAND ,C-TICK>>
			<COND (<L? .TICK -1>
			       <PUT ,CLOCK-HAND ,C-TICK <- <- .TICK> 3>>
			       <SET Q? ,CLOCK-HAND>)
			      (<NOT <ZERO? .TICK>>
			       <COND (<G? .TICK 0>
				      <SET TICK <- .TICK 1>>
				      <PUT ,CLOCK-HAND ,C-TICK .TICK>)>
			       <COND (<NOT <ZERO? .TICK>>
				      <SET Q? ,CLOCK-HAND>)>
			       <COND (<NOT <G? .TICK 0>>
				      <SET RTN
					   %<COND (<GASSIGNED? ZILCH>
						   '<GET ,CLOCK-HAND ,C-RTN>)
						  (ELSE
						   '<NTH ,CLOCK-HAND
							 <+ <* ,C-RTN 2>
							    1>>)>>
				      <COND (<ZERO? .TICK>
					     <PUT ,CLOCK-HAND ,C-RTN 0>)>
				      <COND (<SET TMP <APPLY .RTN>>
					     <SET FLG .TMP>)>
				      <COND (<AND <NOT .Q?>
						  <NOT
						   <ZERO?
						    <GET ,CLOCK-HAND
							 ,C-RTN>>>>
					     <SET Q? T>)>)>)>)>
		 <COND (,NEW-SCENE-NUMBER ;"new scene during int?"
			<SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>)
		       (<EQUAL? .FLG ,M-FATAL>
			<SETG CLOCK-HAND .E>)
		       (<NOT <EQUAL? ,CLOCK-HAND .E>>
			<SETG CLOCK-HAND <REST ,CLOCK-HAND ,C-INTLEN>>
			<COND (<NOT .Q?>
			       <SETG C-INTS <+ ,C-INTS ,C-INTLEN>>)>)>>>

<ROUTINE DEQUEUE-ALL ("AUX" E TICK RTN (FLG <>) (Q? <>))
	 <COND (,CLOCK-WAIT <SETG CLOCK-WAIT <>> <RFALSE>)>
	 <SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <REPEAT ()
		 <COND (<EQUAL? ,CLOCK-HAND .E>
			<SETG CLOCK-HAND .E>
			<RETURN>)
		       (ELSE
			<PUT ,CLOCK-HAND ,C-TICK 0>
			<PUT ,CLOCK-HAND ,C-RTN 0>)>
		 <SETG CLOCK-HAND <REST ,CLOCK-HAND ,C-INTLEN>>
		 <SETG C-INTS <+ ,C-INTS ,C-INTLEN>>>>

<DEFINE PSEUDO ("TUPLE" V)
	<MAPF ,PLTABLE
	      <FUNCTION (OBJ)
		   <COND (<N==? <LENGTH .OBJ> 3>
			  <ERROR BAD-THING .OBJ>)>
		   <MAPRET <COND (<NTH .OBJ 1>
				  <VOC <SPNAME <NTH .OBJ 1>> ADJECTIVE>)>
			   <COND (<NTH .OBJ 2>
				  <VOC <SPNAME <NTH .OBJ 2>> NOUN>)>
			   ;<3 .OBJ>>>
	      .V>>

<ROUTINE PERFORM-PRSA ("OPT" (O <>) (I <>))
	 <PERFORM ,PRSA .O .I>>

<ROUTINE NEW-VERB (V)
	 <PERFORM .V ,PRSO ,PRSI>>

<ROUTINE SWAP-VERB (V)
	 <PERFORM .V ,PRSI ,PRSO>>

<ROUTINE NEW-PRSO (O)
	 <PERFORM-PRSA .O ,PRSI>>

;<ROUTINE NEW-PRSI (I)
	 <PERFORM-PRSA ,PRSO .I>>

<ROUTINE NEW-WINNER-PRSO (A "OPT" (O <>) (I <>) "AUX" OW)
	 <SET OW ,WINNER>
	 <SETG WINNER ,PRSO>
	 <PERFORM .A .O .I>
	 <SETG WINNER .OW>
	 <RTRUE>>

<ROUTINE REDIRECT (FROM TO "AUX" O I)
	 <SET O <COND (<PRSO? .FROM> .TO) (ELSE ,PRSO)>>
	 <SET I <COND (<PRSI? .FROM> .TO) (ELSE ,PRSI)>>
	 <PERFORM-PRSA .O .I>
	 <RTRUE>>

<GLOBAL DELAY-CNT 0>

<COND (<GASSIGNED? ZILCH>
       <DEFMAC ZLINES ('VAR:<PRIMTYPE ATOM> "ARGS" LINES:LIST
		       "AUX" (CNT:FIX 0) SETTER:ATOM
		       (DELAYS:<OR FALSE LIST> <>))
	       <COND (<TYPE? .VAR ATOM>
		      <EVAL <FORM GLOBAL .VAR 0>>
		      <SET SETTER <CHTYPE .VAR GVAL>>)
		     (<TYPE? .VAR GVAL>
		      <EVAL <FORM GLOBAL <CHTYPE .VAR ATOM> 0>>
		      <SET SETTER 'SETG>)
		     (<TYPE? .VAR LVAL>
		      <EVAL <FORM GLOBAL <CHTYPE .VAR ATOM> 0>>
		      <SET SETTER 'SET>)>
	       <SET DELAYS
		    <MAPF ,LIST
			  <FUNCTION (LINE:LIST)
			       <COND (<EMPTY? .LINE> <MAPRET>)
				     (<==? <1 .LINE> DELAY>
				      <MAPRET (<FORM EQUAL? .VAR .CNT>
					       !<REST .LINE>)>)
				     (ELSE
				      <COND (<AND <NOT <EMPTY? .LINE>>
						  <TYPE? <1 .LINE> FIX>>
					     <SET CNT <+ .CNT <1 .LINE>>>
					     <SET LINE <REST .LINE>>)
					    (ELSE
					     <SET CNT <+ .CNT 1>>)>
				      <MAPRET>)>>
			  .LINES>>
	       <SET CNT 0>
	       <COND (<NOT <EMPTY? .DELAYS>>
		      <SET DELAYS
			   ('<SETG DELAY-CNT <+ ,DELAY-CNT 1>>
			    <FORM COND !.DELAYS>
			    '<SETG DELAY-CNT 0>)>)>
	       <FORM PROG ()
		     !.DELAYS
		     <FORM .SETTER <CHTYPE .VAR ATOM> <FORM + .VAR 1>>
		     <FORM COND 
			   !<MAPF ,LIST
				  <FUNCTION (LINE:LIST)
				       <COND (<NOT <EMPTY? .LINE>>
					      <COND (<==? <1 .LINE> DELAY>
						     <MAPRET>)
						    (<TYPE? <1 .LINE> FIX>
						     <SET CNT
							  <+ .CNT <1 .LINE>>>
						     <SET LINE <REST .LINE>>)
						    (ELSE
						     <SET CNT <+ .CNT 1>>)>
					      <LIST <FORM EQUAL? .VAR .CNT>
						    !.LINE>)
					     (ELSE
					      <ERROR BAD-ZLINES>)>>
				  .LINES>>>>)
      (ELSE
       <DEFINE ZLINES (VAR "ARGS" LINES)
	       <RFALSE>>)>

<COND (<GASSIGNED? ZILCH>
       <DEFMAC FOR ('X "ARGS" BODY)
	       <FORM REPEAT (<1 .X>)
		     <FORM COND (<FORM NOT <2 .X>> '<RETURN>)>
		     !.BODY
		     <3 .X>>>)>

<ROUTINE CREWMAN? (OBJ)
	 <AND <NOT <EQUAL? .OBJ ,CREWMEN ,LG-CREWMEN>>
	      <FSET? .OBJ ,DUTCHBIT>>>



"stuff for handling opcodes that want pixels"

<ROUTINE WINDEF (W TOP LEFT HIGH WIDE)
	 <WINPOS .W .TOP .LEFT>
	 <WINSIZE .W .HIGH .WIDE>>

<GLOBAL FONT-X 7>
<GLOBAL FONT-Y 10>

<ROUTINE C-PIXELS (X)
	 <+ <* <- .X 1> ,FONT-X> 1>>

<ROUTINE L-PIXELS (Y)
	 <+ <* <- .Y 1> ,FONT-Y> 1>>

<ROUTINE CCURSET (Y X)
	 <CURSET <L-PIXELS .Y> <C-PIXELS .X>>>

<ROUTINE IN-SCENE? (OBJ "AUX" SC PT)
	 <COND (<NOT <SET SC <GETPT .OBJ ,P?SCENE>>>
		<RTRUE>)
	       (ELSE
		<SET PT <PTSIZE .SC>>
		<COND (<INTBL? ,SCENE .SC .PT 1> <RTRUE>)
		      (ELSE <RFALSE>)>)>>

<ROUTINE REPLACE-SYNONYM (OBJ OLD NEW "OPT" (DUP? <>) "AUX" TMP S L)
	 <COND (<SET S <GETPT .OBJ ,P?SYNONYM>>
		<SET L </ <PTSIZE .S> 2>>
		<COND (<AND <NOT .DUP?> <INTBL? .NEW .S .L>>
		       <RTRUE>)
		      (<SET TMP <INTBL? .OLD .S .L>>
		       <PUT .TMP 0 .NEW>)>)>>

<ROUTINE REPLACE-ADJECTIVE (OBJ OLD NEW "OPT" (DUP? <>) "AUX" TMP S L)
	 <COND (<SET S <GETPT .OBJ ,P?ADJECTIVE>>
		<SET L </ <PTSIZE .S> 2>>
		<COND (<AND <NOT .DUP?> <INTBL? .NEW .S .L>>
		       <RTRUE>)
		      (<SET TMP <INTBL? .OLD .S .L>>
		       <PUT .TMP 0 .NEW>)>)>>

<ROUTINE CURSOR-OFF ()
	 <CURSET -1>>

<ROUTINE CURSOR-ON ()
	 <CURSET -2>>

<END-SEGMENT ;"0">
