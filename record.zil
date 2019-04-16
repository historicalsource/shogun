"RECORD for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<BEGIN-SEGMENT RECORD>

<SYNTAX \#RANDOM OBJECT = V-$RANDOM>
<SYNTAX \#COMMAND = V-$COMMAND>
<SYNTAX \#RECORD = V-$RECORD>
<SYNTAX \#UNRECORD = V-$UNRECORD>

<ROUTINE V-$COMMAND ()
	 <DIRIN ,D-COMMAND-FILE>
	 <RTRUE>>

<ROUTINE V-$RANDOM ()
	 <COND (<NOT <PRSO? ,INTNUM>>
		<TELL "Illegal call to #RANDOM." CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

<ROUTINE V-$RECORD ()
	 <DIROUT ,D-RECORD-ON> ;"all READS and INPUTS get sent to command file"
	 <RTRUE>>

<ROUTINE V-$UNRECORD ()
	 <DIROUT ,D-RECORD-OFF>
	 <RTRUE>>


"debugging help"

;<SYNTAX $P OBJECT = V-$P>

;<ROUTINE V-$P ()
	 <COND (<PICINF ,P-NUMBER ,YX-TBL>
		<TELL N <GET ,YX-TBL 0> "x" N <GET ,YX-TBL 1> CR>)
	       (ELSE <TELL "No such picture." CR>)>>

;<SYNTAX $D OBJECT = V-$D>

;<ROUTINE V-$D ()
	 <COND (<PICINF ,P-NUMBER ,YX-TBL>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>
		<CENTER-PIC ,P-NUMBER>
		<INPUT 1>)
	       (ELSE <TELL "No such picture." CR>)>>

;<SYNTAX $W OBJECT = V-$W>

;<ROUTINE V-$W ("AUX" WIN ATTRS TMP)
	 <SET WIN ,P-NUMBER>
	 <TELL "#" N .WIN
	       " at " N <WINGET .WIN ,WTOP>
	       "," N <WINGET .WIN ,WLEFT>
	       "; size " N <WINGET .WIN ,WHIGH>
	       "x" N <WINGET .WIN ,WWIDE>>
	 <COND (<OR <NOT <ZERO? <WINGET .WIN ,WLMARGIN>>>
		    <NOT <ZERO? <WINGET .WIN ,WRMARGIN>>>>
		<TELL " (" N <WINGET .WIN ,WLMARGIN>
		      "<->" N <WINGET .WIN ,WRMARGIN> ")">)>
	 <COND (<NOT <ZERO? <SET TMP <WINGET .WIN ,WHLIGHT>>>>
		<TELL "; HL=" N .TMP>)>
	 <COND (<NOT <EQUAL? <SET TMP <WINGET .WIN ,WCOLOR>> 257>>
		<TELL "; f,b=" N <LOW-BYTE .TMP> "," N <HIGH-BYTE .TMP>>)>
	 <COND (<NOT <EQUAL? <SET TMP <WINGET .WIN ,WFONT>> 0>>
		<TELL "; F=" N .TMP>)>
	 <SET TMP <WINGET .WIN ,WFSIZE>>
	 <COND (<OR <EQUAL? .WIN ,S-FULL>
		    <NOT <EQUAL? <HIGH-BYTE .TMP> ,FONT-Y>>
		    <NOT <EQUAL? <LOW-BYTE .TMP> ,FONT-X>>>
		<TELL "; FS=" N <HIGH-BYTE .TMP> "x" N <HIGH-BYTE .TMP>>)>
	 <TELL "; cursor " N <WINGET .WIN ,WYPOS>
	       "," N <WINGET .WIN ,WXPOS>
	       "; line " N <WINGET .WIN ,WLCNT>
	       "; ">
	 <COND (<AND <NOT <ZERO? <SET TMP <WINGET .WIN ,WCRCNT>>>>
		     <NOT <ZERO? <WINGET .WIN ,WCRFUNC>>>>
		<TELL " CR=" N .TMP>)>
	 <SET ATTRS <WINGET .WIN ,WATTRS>>
	 <COND (<ZERO? <BAND .ATTRS ,A-WRAP>> <TELL "-">)
	       (ELSE <TELL "+">)>
	 <TELL "W,">
	 <COND (<ZERO? <BAND .ATTRS ,A-SCROLL>> <TELL "-">)
	       (ELSE <TELL "+">)>
	 <TELL "S,">
	 <COND (<ZERO? <BAND .ATTRS ,A-SCRIPT>> <TELL "-">)
	       (ELSE <TELL "+">)>
	 <TELL "P,">
	 <COND (<ZERO? <BAND .ATTRS ,A-BUFFER>> <TELL "-">)
	       (ELSE <TELL "+">)>
	 <TELL "B">
	 <CRLF>>

;<DEFMAC TELLBIT ('BIT)
	<FORM COND (<FORM FSET? ',PRSO <CHTYPE .BIT GVAL>>
		    <FORM TELL <STRING " " <SPNAME .BIT>>>)>>

;<SYNTAX $X OBJECT (MOBY) = V-$X>

;<ROUTINE V-$X ("AUX" TMP)
	 <COND (<PRSO? INTNUM>
		<TELL N ,P-NUMBER "/ " N <GETB ,P-NUMBER 0>>)
	       (ELSE <TELL "??">)>
	 <CRLF>>

;<SYNTAX $G OBJECT (MOBY) = V-$G PRE-$G>

;<ROUTINE PRE-$G ("AUX" TMP)
	 <COND (<AND <PRSO? INTNUM>
		     <G? ,P-NUMBER 15>
		     <L? ,P-NUMBER 256>>
		<TELL "Global " N ,P-NUMBER "/ " N <VALUE ,P-NUMBER>>)
	       (ELSE <TELL "??">)>
	 <CRLF>>

;<ROUTINE V-$G () <RTRUE>>

;<SYNTAX $I OBJECT (MOBY) = V-$I PRE-$I>

;<ROUTINE PRE-$I ("AUX" TMP)
	 <COND (<PRSO? INTNUM> <SETG PRSO ,P-NUMBER>)> 
	 <TELL-OBJ ,PRSO>
	 <TELL "; in ">
	 <COND (<SET TMP <LOC ,PRSO>>
		<TELL-OBJ .TMP>)
	       (ELSE <TELL "limbo">)>
	 <COND (<FIRST? ,PRSO>
		<TELL "; contains">
		<REPEAT ((F <FIRST? ,PRSO>))
			<TELL " ">
			<TELL-OBJ .F>
			<COND (<NOT <SET F <NEXT? .F>>>
			       <RETURN>)>>)>
	 <TELL "; flags">
	 <TELLBIT AN>
	 <TELLBIT BODY-PART>
	 <TELLBIT CANT-HOLD>
	 <TELLBIT CONTBIT>
	 <TELLBIT DEAD>
	 <TELLBIT DONT-ALL>
	 <TELLBIT DONT-IT>
	 <TELLBIT DOORBIT>
	 <TELLBIT DUTCHBIT>
	 <TELLBIT ENGLISHBIT>
	 <TELLBIT FEMALE>
	 <TELLBIT FOODBIT>
	 <TELLBIT FURNITURE>
	 <TELLBIT INVISIBLE>
	 <TELLBIT JAPANESEBIT>
	 <TELLBIT LIGHTBIT>
	 <TELLBIT LOCKABLE>
	 <TELLBIT LOCKED>
	 <TELLBIT NDESCBIT>
	 <TELLBIT NOABIT>
	 <TELLBIT NOTHEBIT>
	 <TELLBIT ONBIT>
	 <TELLBIT OPENABLE>
	 <TELLBIT OPENBIT>
	 <TELLBIT OUTSIDE>
	 <TELLBIT PERSON>
	 <TELLBIT PLURAL>
	 <TELLBIT PORTUGUESEBIT>
	 <TELLBIT READBIT>
	 <TELLBIT RLANDBIT>
	 <TELLBIT RMUNGBIT>
	 <TELLBIT SCOREBIT>
	 <TELLBIT SEARCHBIT>
	 <TELLBIT SITTING>
	 <TELLBIT SPANISHBIT>
	 <TELLBIT SURFACEBIT>
	 <TELLBIT TAKEBIT>
	 <TELLBIT THE>
	 <TELLBIT TOOLBIT>
	 <TELLBIT TOUCHBIT>
	 <TELLBIT TRANSBIT>
	 <TELLBIT TRYTAKEBIT>
	 <TELLBIT VEHBIT>
	 <TELLBIT WEAPONBIT>
	 <TELLBIT WEARABLE>
	 <TELLBIT WEARBIT>
	 <TELL ";">
	 <REPEAT ((P 0))
		 <COND (<ZERO? <SET P <NEXTP ,PRSO .P>>> <RETURN>)
		       (ELSE
			<TELL " ">
			<TELLPROP .P>
			<TELL "(" N <PTSIZE <GETPT ,PRSO .P>> ")">)>>
	 <CRLF>>

;<ROUTINE V-$I () <RTRUE>>

;<ROUTINE TELL-OBJ (TMP)
	 <TELL N .TMP ":\"">
	 <COND (<EQUAL? .TMP ,ROOMS>
		<TELL "ROOMS">)
	       (<EQUAL? .TMP ,GLOBAL-OBJECTS>
		<TELL "GLOBAL-OBJECTS">)
	       (<EQUAL? .TMP ,LOCAL-GLOBALS>
		<TELL "LOCAL-GLOBALS">)
	       (<EQUAL? .TMP ,GENERIC-OBJECTS>
		<TELL "GENERIC-OBJECTS">)
	       (ELSE <TELL D .TMP>)>
	 <TELL "\"">>

;<ROUTINE TELLPROP (P)
	 <COND (<EQUAL? .P ,P?NORTH> <TELL "NORTH">) ;63
	       (<EQUAL? .P ,P?NE> <TELL "NE">) ;62
	       (<EQUAL? .P ,P?EAST> <TELL "EAST">) ;61
	       (<EQUAL? .P ,P?SE> <TELL "SE">) ;60
	       (<EQUAL? .P ,P?SOUTH> <TELL "SOUTH">) ;59
	       (<EQUAL? .P ,P?SW> <TELL "SW">) ;58
	       (<EQUAL? .P ,P?WEST> <TELL "WEST">) ;57
	       (<EQUAL? .P ,P?NW> <TELL "NW">) ;56
	       (<EQUAL? .P ,P?UP> <TELL "UP">) ;55
	       (<EQUAL? .P ,P?DOWN> <TELL "DOWN">) ;54
	       (<EQUAL? .P ,P?IN> <TELL "IN">) ;53
	       (<EQUAL? .P ,P?OUT> <TELL "OUT">) ;52
	       (<EQUAL? .P ,P?FORE> <TELL "FORE">) ;51
	       (<EQUAL? .P ,P?AFT> <TELL "AFT">) ;50
	       (<EQUAL? .P ,P?PORT> <TELL "PORT">) ;49
	       (<EQUAL? .P ,P?STARBOARD> <TELL "STARBOARD">) ;48
	       (<EQUAL? .P ,P?ACTION> <TELL "ACTION">) ;47
	       (<EQUAL? .P ,P?ADJACENT> <TELL "ADJACENT">) ;46
	       (<EQUAL? .P ,P?SYNONYM> <TELL "SYNONYM">) ;45
	       (<EQUAL? .P ,P?CONTFCN> <TELL "CONTFCN">) ;44
	       (<EQUAL? .P ,P?THINGS> <TELL "THINGS">) ;43
	       (<EQUAL? .P ,P?DESCFCN> <TELL "DESCFCN">) ;42
	       (<EQUAL? .P ,P?GLOBAL> <TELL "GLOBAL">) ;41
	       (<EQUAL? .P ,P?FDESC> <TELL "FDESC">) ;40
	       (<EQUAL? .P ,P?LDESC> <TELL "LDESC">) ;39
	       (<EQUAL? .P ,P?COUNT> <TELL "COUNT">) ;38
	       (<EQUAL? .P ,P?SIZE> <TELL "SIZE">) ;37
	       (<EQUAL? .P ,P?TEXT> <TELL "TEXT">) ;36
	       (<EQUAL? .P ,P?VALUE> <TELL "VALUE">) ;35
	       (<EQUAL? .P ,P?CAPACITY> <TELL "CAPACITY">) ;34
	       (<EQUAL? .P ,P?ADJECTIVE> <TELL "ADJECTIVE">) ;33
	       (<EQUAL? .P ,P?OWNER> <TELL "OWNER">) ;32
	       (<EQUAL? .P ,P?GENERIC> <TELL "GENERIC">) ;31
	       (<EQUAL? .P ,P?HEALTH> <TELL "HEALTH">) ;30
	       (<EQUAL? .P ,P?PICTURE> <TELL "PICTURE">) ;29
	       (<EQUAL? .P ,P?SCENE> <TELL "SCENE">) ;28
	       (<EQUAL? .P ,P?SDESC> <TELL "SDESC">) ;27
	       (<EQUAL? .P ,P?SCORE> <TELL "SCORE">) ;26
	       (<EQUAL? .P ,P?MOUSE> <TELL "MOUSE">) ;25
	       (<EQUAL? .P ,P?AFTER> <TELL "AFTER">) ;24
	       (ELSE <TELL N .P>)>>

;<SYNTAX $M = V-$M>

;<ROUTINE V-$M ("AUX" S (X 0) (Y 0))
	 <REPEAT ((N <GET ,SCENE-LOCS 0>) (CNT 0))
		 <COND (<G? <SET CNT <+ .CNT 1>> .N> <RETURN>)
		       (ELSE
			<SET S <GETPT <GET ,SCENE-LOCS .CNT> ,P?SCORE>>
			<PRINT <GET ,SCENE-NAMES .CNT>>
			<SET X <+ .X <GETB .S 0>>>
			<SET Y <+ .Y <GETB .S 1>>>
			<TELL ": "
			      N <* ,SCORE-FACTOR <GETB .S 0>>
			      "/"
			      N <* ,SCORE-FACTOR <GETB .S 1>>
			      CR>)>>
	 <TELL "Total: " N <* ,SCORE-FACTOR .X>
	       "/"
	       N <* ,SCORE-FACTOR .Y>
	       CR CR
	       "Missing">
	 <REPEAT ((CNT 0))
		 <COND (<G? <SET CNT <+ .CNT 1>> ,LAST-OBJECT> <RETURN>)
		       (<FSET? .CNT ,SCOREBIT>
			<TELL ", " D .CNT>)>>
	 <CRLF>>

<END-SEGMENT ;"RECORD">
