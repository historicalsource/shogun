"STATUS for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<BEGIN-SEGMENT 0>

<CONSTANT S-STATUS 1>
<CONSTANT STATUS-LINES 2>

<ROUTINE SETUP-TEXT-AND-STATUS ("OPT" (P ,P-BORDER-LOC)
				"AUX" X (HIGH <LOWCORE VWRD>)
				(WIDE <LOWCORE HWRD>) (SLEFT 1)
				(SHIGH <* ,STATUS-LINES ,FONT-Y>))
	 <COND (<NOT <APPLE?>> ;"only apples have no borders"
		<PICINF .P ,YX-TBL>
		<SET X <GET ,YX-TBL 1>>
		<SET SLEFT <+ .X .SLEFT>>
		<COND (<NOT <EQUAL? .P ,P-BORDER-LOC>>
		       <SET SHIGH <GET ,YX-TBL 0>>)>
		<SET WIDE <- .WIDE <* .X 2>>>)>
	 <WINDEF ,S-STATUS 1 .SLEFT .SHIGH .WIDE>
	 <WINDEF ,S-TEXT
		 <+ 1 .SHIGH> .SLEFT
		 <- .HIGH .SHIGH> .WIDE>>

<ROUTINE INIT-STATUS-LINE ("OPT" (NO-STS? <>))
	 <RESET-MARGIN>
	 <CLEAR ,S-TEXT>
	 <COND (<NOT .NO-STS?> <SETUP-TEXT-AND-STATUS>)>
	 <SCREEN ,S-STATUS>
	 <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>
	 <PRINTI "0">
	 <DIROUT ,D-TABLE-OFF>
	 <SETG SCORE-WIDTH <LOWCORE TWID>>
	 <COLOR ,BG-COLOR ,FG-COLOR>
	 <CLEAR ,S-STATUS>
	 <UPDATE-STATUS-LINE T>>

<GLOBAL SCORE-WIDTH 0>

<GLOBAL SHERE <>>

<ROUTINE UPDATE-STATUS-LINE ("OPT" (REF? <>) "AUX" WIDE TMP)
	 <COND (<FLAG-ON? ,F-REFRESH>
		<DISPLAY-BORDER>)>
	 <COND (<OR <FLAG-ON? ,F-REFRESH>
		    <NOT <EQUAL? ,HERE ,SHERE>>>
		<SET REF? T>)>
	 <COND (<OR .REF?
		    <NOT <EQUAL? ,SCORE ,OSCORE>>
		    <NOT <EQUAL? ,MOVES ,OMOVES>>> 
		<SCREEN ,S-STATUS>
		<COLOR ,BG-COLOR ,FG-COLOR>
		<SET WIDE </ <WINGET ,S-STATUS ,WWIDE> ,FONT-X>>
		<COND (.REF?
		       <CURSET 1 1>
		       <ERASE 1>
		       <COND (,SCENE
			      <CURSET 1 1>
			      <PRINT <GET ,SCENE-NAMES ,SCENE>>
			      <TELL ":">)>
		       <COND (<NOT <EQUAL? ,MACHINE
					   ,DEBUGGING-ZIP ,MACINTOSH>>
			      <CURSET 1
				      <- </ <WINGET ,S-STATUS ,WWIDE> 2>
					 <* ,SCORE-WIDTH 3>>>
			      <TELL "SHOGUN">)>
		       <LOWCORE FLAGS
				<BAND <LOWCORE FLAGS> <BCOM ,F-REFRESH>>>)>
		<COND (<OR .REF?
			   <AND <SCENE? ,S-ERASMUS>
				<HERE? ,BRIDGE-OF-ERASMUS>>
			   <AND <SCENE? ,S-VOYAGE>
				<HERE? ,GALLEY>>>
		       <COND (.REF?
			      <CCURSET 2 1>
			      <ERASE 1>)>
		       <COND (,HERE
			      <CCURSET 2 1>
			      <SETG SHERE ,HERE>
			      <TELL 'HERE>
			      <SET TMP <LOC ,WINNER>>
			      <COND (<FSET? .TMP ,VEHBIT>
				     <SETG SHERE .TMP>
				     <COND (<FSET? .TMP ,SURFACEBIT>
					    <TELL ", on ">)
					   (ELSE
					    <TELL ", in ">)>
				     <TELL THE .TMP>)>
			      <COND (<HERE? ,BRIDGE-OF-ERASMUS ,GALLEY>
				     <ERASE-ALL-BUT 12>
				     <COND (<OR <AND <HERE? ,BRIDGE-OF-ERASMUS>
						     <FSET? ,WHEEL ,ONBIT>>
						<AND <HERE? ,GALLEY>
						     <FSET? ,GALLEY-WHEEL ,ONBIT>>>
					    <TELL "; course ">
					    <TELL-DIRECTION ,SHIP-DIRECTION>
					    <TELL "; wheel ">
					    <TELL-DIRECTION ,SHIP-COURSE>)>)>)>)>
		<COND (<OR .REF? <NOT <EQUAL? ,SCORE ,OSCORE>>>
		       <COND (.REF?
			      <CCURSET 1 <- .WIDE 10>>
			      <TELL "Score:">
			      <ERASE 1>)>
		       <SET TMP <* ,SCORE ,SCORE-FACTOR>>
		       <RJNUM .TMP 1>
		       <SETG OSCORE ,SCORE>)>
		<COND (<OR .REF? <NOT <EQUAL? ,MOVES ,OMOVES>>>
		       <COND (.REF?
			      <CCURSET 2 <- .WIDE 10>>
			      <TELL "Moves:">
			      <ERASE 1>)>
		       <RJNUM ,MOVES 2>
		       <SETG OMOVES ,MOVES>)>
		<SCREEN ,S-TEXT>)>>

<ROUTINE ERASE-ALL-BUT (N)
	 <ERASE <- <WINGET ,S-STATUS ,WWIDE>
		   <WINGET ,S-STATUS ,WXPOS>
		   <* .N ,FONT-X>>>>

<ROUTINE INTERLUDE-STATUS-LINE ()
	 <DISPLAY-BORDER ,P-BORDER2>
	 <SETG SHERE <>>
	 <SCREEN ,S-STATUS>
	 <COLOR ,BG-COLOR ,FG-COLOR>
	 <CURSET 1 1>
	 <ERASE-ALL-BUT 12>
	 <CURSET 1 1>
	 <PRINT <GET ,SCENE-NAMES ,SCENE>>
	 <TELL ":">
	 <COND (<NOT <EQUAL? ,MACHINE ,DEBUGGING-ZIP ,MACINTOSH>>
		<CURSET 1
			<- </ <WINGET ,S-STATUS ,WWIDE> 2>
			   <* ,SCORE-WIDTH 3>>>
		<TELL "SHOGUN">)>
	 <LOWCORE FLAGS <BAND <LOWCORE FLAGS> <BCOM ,F-REFRESH>>>
	 <CCURSET 2 1>
	 <ERASE-ALL-BUT 12>
	 <CCURSET 2 1>
	 <TELL "Interlude">
	 <SCREEN ,S-TEXT>>

<ROUTINE RJNUM (NUM LINE "AUX" (WIDE <WINGET ,S-STATUS ,WWIDE>) (N <>))
	 <SET LINE <+ 1 <* <- .LINE 1> ,FONT-Y>>>
	 <COND (<L? .NUM 10> <SET N 1>)
	       (<L? .NUM 100> <SET N 2>)
	       (<L? .NUM 1000> <SET N 3>)
	       (<L? .NUM 10000> <SET N 4>)>
	 <CURSET .LINE <- .WIDE <* ,SCORE-WIDTH 4>>>
	 <ERASE 1>
	 <CURSET .LINE <- .WIDE <* ,SCORE-WIDTH .N>>>
	 <COND (.N <TELL N .NUM>)
	       (ELSE <TELL "****">)>>

<END-SEGMENT>
