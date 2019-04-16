"PIC for
				Library
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<BEGIN-SEGMENT 0>

<CONSTANT P-TITLE 1>	;"standard number for title pic"

<CONSTANT YX-TBL <TABLE 0 0>>

<ROUTINE YCEILING (Y)
	 <SET Y <+ .Y ,FONT-Y -1>>
	 <- .Y <MOD .Y ,FONT-Y>>>

<ROUTINE XCEILING (X)
	 <SET X <+ .X ,FONT-X -1>>
	 <- .X <MOD .X ,FONT-X>>>

<END-SEGMENT>

<BEGIN-SEGMENT STARTUP>

<ROUTINE TITLE-SCREEN ()
	 <CLEAR ,S-FULL>
	 <COND (<PICINF ,P-TITLE ,YX-TBL>
		<CURSOR-OFF>
		<SCREEN ,S-FULL>
		<DISPLAY ,P-TITLE 1 1>
		<CURSET <WINGET ,S-TEXT ,WHIGH> 1>
		<INPUT 1>
		<CLEAR ,S-FULL>
		<CURSOR-ON>)>
	 <DISPLAY-BORDER ,P-BORDER>
	 <V-VERSION T>>

<END-SEGMENT>

<BEGIN-SEGMENT 0>

<GLOBAL CURRENT-BORDER 0>

<ROUTINE DISPLAY-BORDER ("OPT" (B ,CURRENT-BORDER))
	 <COND (<APPLE?> <RFALSE>)
	       (<PICINF .B ,YX-TBL>
		<SCREEN ,S-FULL>
		<DISPLAY .B 1 1>
		<SETG CURRENT-BORDER .B>
		<SCREEN ,S-TEXT>)>>

<ROUTINE CENTER-PIC-X (P "AUX" X Y)
	 <COND (<PICINF .P ,YX-TBL>
		<FLUSH-OLD-PICTURE>
		<MAKE-ROOM-FOR <SET Y <GET ,YX-TBL 0>>>
		<SET X <- <WINGET -3 ,WWIDE> <GET ,YX-TBL 1>>>
		<COND (<G? .X 1> <SET X </ .X 2>>)
		      (ELSE <SET X 1>)>
		<DISPLAY .P 0 .X>
		<N-CRLF </ <+ .Y ,FONT-Y -1> ,FONT-Y>>
		<RTRUE>)>>

"display a picture centered in the current window"

<ROUTINE CENTER-PIC (P "AUX" X Y)
	 <COND (<PICINF .P ,YX-TBL>
		<SET Y <- <WINGET -3 ,WHIGH> <GET ,YX-TBL 0>>>
		<SET X <- <WINGET -3 ,WWIDE> <GET ,YX-TBL 1>>>
		<COND (<G? .Y 1> <SET Y </ .Y 2>>)
		      (ELSE <SET Y 1>)>
		<COND (<G? .X 1> <SET X </ .X 2>>)
		      (ELSE <SET X 1>)>
		<DISPLAY .P .Y .X>)>>

<CONSTANT TEXT-MARGIN 2>	;"left and right text margins in pixels"

<ROUTINE FLUSH-OLD-PICTURE ("AUX" Y)
	 <COND (<SET Y <WINGET ,S-TEXT ,WCRCNT>>
		<N-CRLF .Y>
		<RESET-MARGIN>)>>

<ROUTINE N-CRLF (Y)
	 <REPEAT ((CNT 0))
		 <COND (<IGRTR? CNT .Y> <RETURN>)>
		 <CRLF>>>

<ROUTINE MARGINAL-PIC (P "OPT" (RIGHT? T) (C <>) (CTOP? <>)
		       "AUX" TMP X Y YLEFT HIGH WIDE (CENTER? <>))
	 <COND (<PICINF .P ,YX-TBL>
		<SET HIGH <WINGET ,S-TEXT ,WHIGH>>
		<SET WIDE <WINGET ,S-TEXT ,WWIDE>>
		<FLUSH-OLD-PICTURE>
		<SET Y <YCEILING <GET ,YX-TBL 0>>> ;"pic height rounded up"
		<SET X <GET ,YX-TBL 1>> ;"pic width"
		<COND (<AND .C <PICINF .C ,YX-TBL>>
		       <SETG NEXT-PIC-CRCNT <GET ,YX-TBL 0>>
		       <SETG NEXT-PIC-WIDTH <GET ,YX-TBL 1>>)
		      (ELSE
		       <SET C 0>
		       <SETG NEXT-PIC-CRCNT 0>
		       <SETG NEXT-PIC-WIDTH 0>)>
		<SET YLEFT <MAKE-ROOM-FOR .Y>>
		<COND (<G=? <+ .X <* ,FONT-X 10>> .WIDE>
		       <SET CENTER? T>)>
		<DISPLAY .P
			 0
			 <COND (.CENTER?
				<+ 1 </ <- .WIDE .X> 2>>)
			       (<AND .RIGHT?
				     <L? .X .WIDE>>
				<+ 1 <- .WIDE .X>>)
			       (ELSE 1)>>
		<COND (.CENTER?
		       <CURSET .YLEFT 1>
		       <CURSOR-OFF>
		       <INPUT 1>
		       <CURSOR-ON>
		       <SET Y <- <YCEILING .HIGH> ,FONT-Y>>
		       <COND (<L? <- .HIGH .Y> ,FONT-Y>
			      <SET Y <- .Y ,FONT-Y>>)>
		       <SET Y <+ .Y 1>>
		       <COND (<G? .YLEFT .Y>
			      <SCROLL ,S-TEXT <- .YLEFT .Y>>
			      <CURSET .Y 1>)>
		       <CRLF>)
		      (ELSE
		       <SET-MARGIN <COND (<AND .C .CTOP?> ,NEXT-PIC-WIDTH)
					 (ELSE .X)>
				   .RIGHT?>
		       <SET Y </ .Y ,FONT-Y>>
		       <COND (.C ;"does this picture have a corner?"
			      <COND (.CTOP? <SETG NEXT-PIC-WIDTH .X>)>
			      <SETG PIC-SIDE .RIGHT?>
			      <SET TMP
				   <- </ <YCEILING ,NEXT-PIC-CRCNT>
					 ,FONT-Y>
				      1>>
			      <COND (.CTOP?
				     <SETG NEXT-PIC-CRCNT <- .Y .TMP 1>>
				     <WINPUT 0 ,WCRCNT <+ .TMP 1>>)
				    (ELSE
				     <SETG NEXT-PIC-CRCNT <+ .TMP 1>>
				     <WINPUT 0 ,WCRCNT <- .Y .TMP 1>>)>
			      <WINPUT 0 ,WCRFUNC ,NEXT-MARGIN>)
			     (ELSE
			      <WINPUT 0 ,WCRFUNC ,RESET-MARGIN>
			      <COND (<EQUAL? .P ,P-OAR>
				     <SET Y <+ .Y 1>>)>
			      <WINPUT 0 ,WCRCNT .Y>)>)>)>>

<ROUTINE SET-MARGIN (X RIGHT? "AUX" WIDE)
	 <SET WIDE <WINGET ,S-TEXT ,WWIDE>>
	 <SET X </ <XCEILING <+ .X 2>> ,FONT-X>>
	 <COND (.RIGHT?
		<MARGIN ,TEXT-MARGIN <* .X ,FONT-X>>)
	       (ELSE
		<MARGIN <* .X ,FONT-X> ,TEXT-MARGIN>)>
	 <SET WIDE <- </ .WIDE ,FONT-X> .X>>
	 <PUTB ,P-INBUF 0
	       <COND (<G? .WIDE ,INBUF-LENGTH>
		      ,INBUF-LENGTH)
		     (T
		      .WIDE)>>>

<GLOBAL PIC-SIDE <>>
<GLOBAL NEXT-PIC-WIDTH 0>
<GLOBAL NEXT-PIC-CRCNT 0>

<ROUTINE NEXT-MARGIN ()
	 <COND (,NEXT-PIC-CRCNT
		<SET-MARGIN ,NEXT-PIC-WIDTH ,PIC-SIDE>
		<WINPUT ,S-TEXT ,WCRCNT ,NEXT-PIC-CRCNT>
		<WINPUT ,S-TEXT ,WCRFUNC ,RESET-MARGIN>
		<SETG NEXT-PIC-CRCNT 0>)>
	 <RTRUE>>

<ROUTINE RESET-MARGIN ()
	 <WINPUT ,S-TEXT ,WCRCNT 0>
	 <WINPUT ,S-TEXT ,WCRFUNC 0>
	 <MARGIN ,TEXT-MARGIN ,TEXT-MARGIN>
	 <PUTB ,P-INBUF 0 ,INBUF-LENGTH>>

"make sure room for Y pixels, by scrolling and moreing if necessary"

<ROUTINE MAKE-ROOM-FOR (Y "AUX" YLEFT LLEFT (HIGH <WINGET ,S-TEXT ,WHIGH>)
			(YLOC <WINGET ,S-TEXT ,WYPOS>)
			(XLOC <WINGET ,S-TEXT ,WXPOS>))
	 <COND (<G? .Y .HIGH> <SET Y .HIGH>)>
	 <SET YLEFT <+ 1 <- .HIGH .YLOC>>> ;"pixels left to eos"
	 <COND (<G? .Y .YLEFT> ;"picture won't fit in rest of screen?"
		<SET YLEFT <YCEILING <- .Y .YLEFT>>> ;"won't fit by this much"
		<SET LLEFT ;"what yloc was when lncnt last was 1"
		     <- .YLOC
			<* <- <WINGET ,S-TEXT ,WLCNT> 1>
			   ,FONT-Y>>>
		<COND (<G? .YLEFT .LLEFT> ;"would lose info?"
		       <WINPUT ,S-TEXT ,WLCNT </ .HIGH ,FONT-Y>>
		       <CRLF>
		       <CURSET <- <WINGET ,S-TEXT ,WYPOS> ,FONT-Y> 1>)>
		<SCROLL ,S-TEXT .YLEFT>
		<SET YLOC <- .YLOC .YLEFT>>
		<COND (<L=? .YLOC 0> <SET YLOC 1>)>
		<CURSET .YLOC .XLOC>)>
	 <SET YLEFT <+ .Y <WINGET ,S-TEXT ,WYPOS>>>
	 <RETURN .YLEFT>>

<END-SEGMENT>
