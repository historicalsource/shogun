"QVERBS for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<FILE-FLAGS MDL-ZIL?>

<DEFAULTS-DEFINED
	PRINT-IS/ARE>

<BEGIN-SEGMENT 0>

<OBJECT WHAT
	(LOC GLOBAL-OBJECTS)
	(DESC "what")
	(SYNONYM WHAT WHO ;WHOM)
	(FLAGS NOTHEBIT)
	(ACTION WHAT-F)>

<DEFINE WHAT-F ("AUX" OBJ TMP NOT? LOC?)
	<SET NOT? <ANDB ,PARSE-NOT <PARSE-FLAGS ,PARSE-RESULT>>>
	<SET LOC? <PARSE-LOC ,PARSE-RESULT>>
	<COND (<VERB? BE?>
	       <RFALSE>)
	      (<EQUAL? <SET OBJ <PARSE-QW ,PARSE-RESULT>>
		       ,W?WHO ,W?WHAT ,W?WHERE ,W?WHY ,W?WHEN ,W?HOW>
	       <RFALSE>)
	      (<NOT <EVERYWHERE-VERB?> ;<ABSTRACT-VERB?>>
	       <TELL
"That's precisely the sort of question you'll have to answer for
yourself." CR>
	       <RTRUE>)
	      (<EQUAL? ,PRSI ,INTPP>
	       <COND (<AND <SET OBJ <P-PP-OBJ>>
			   <NOT .NOT?>>
		      <SET TMP <OR <P-PP-PREP> <PP-PREP .LOC?>>>
		      <COND (<EQUAL? .TMP ,W?BEHIND>
			     <PERFORM ,V?LOOK-BEHIND .OBJ>
			     <RTRUE>)
			    (<EQUAL? .TMP ,W?DOWN>
			     <PERFORM ,V?LOOK-DOWN .OBJ>
			     <RTRUE>)
			    (<EQUAL? .TMP ,W?IN ,W?ON ,W?THROUGH>
			     <PERFORM ,V?LOOK-INSIDE .OBJ>
			     <RTRUE>)
			    (<EQUAL? .TMP ,W?UNDER>
			     <PERFORM ,V?LOOK-UNDER .OBJ>
			     <RTRUE>)>)>)
	      ;(<EQUAL? ,PRSI ,INTADJ>
	       <SET ADJ? <PARSE-ADJ ,PARSE-RESULT>>
	       <COND (<IS-PRSO-ADJ? .ADJ?>
		      <COND (.NOT? <TELL "Wrong,">)
			    (ELSE <TELL "Right,">)>
		      <PRSO-IS <>>)
		     (ELSE
		      <COND (.NOT? <TELL "Right,">)
			    (ELSE <TELL "Wrong,">)>
		      <PRSO-IS T>)>
	       <TELL " ">
	       <PRINTB .ADJ?>
	       <TELL "." CR>)
	      ;(ELSE
	       <TELL "So you think">
	       <PRSO-IS .NOT?>
	       <COND (,PRSI <TELL " " A ,PRSI>)>
	       <TELL "." CR>)>>

<DEFINE TELL-Q-WORD ("AUX" WD)
	 <COND (<VERB? BE?>
		<TELL "if">)
	       (<EQUAL? <SET WD <PARSE-QW ,PARSE-RESULT>>
			,W?WHO ,W?WHAT ,W?WHERE ,W?WHY ,W?WHEN ,W?HOW>
		<PRINTB .WD>)
	       (T
		<TELL "whether">)>>

<DEFINE P-NEGATIVE? ()
	 <ANDB ,PARSE-NOT <PARSE-FLAGS ,PARSE-RESULT>>>

<DEFINE TRY-QCONTEXT? ("AUX" W)
	 <COND (<AND ,QCONTEXT
		     <IN? ,QCONTEXT ,HERE>
		     <NOT <EQUAL? ,QCONTEXT ,WINNER>>
		     <OR <PAST-TENSE?>
			 <AND <NOT <EQUAL? ,QCONTEXT ,PRSO>>
			      <NOT <VERB? ASK-ABOUT>>
			      <NOT <AND <VERB? TELL-ABOUT>
					<EQUAL? ,PRSO ,ME>>>>>>
		<SET W ,WINNER>
		<SETG WINNER ,QCONTEXT>
		<PERFORM ,PRSA ,PRSO ,PRSI>
		<SETG WINNER .W ;,PLAYER>
		<RTRUE>)>>

<DEFINE PRE-BE ()
	<COND (<TRY-QCONTEXT?>
	       <RTRUE>)>>

<SYNTAX BE OBJECT (MOBY) = V-BE PRE-BE>
<SYNTAX BE OBJECT (MOBY) OBJECT (MOBY) = V-BE PRE-BE>

<SYNTAX BE? OBJECT (MOBY) = V-BE?>
<SYNTAX BE? OBJECT (MOBY) OBJECT (MOBY) = V-BE?>

<DEFINE V-BE ("AUX" TMP NOT? ADJ? LOC? OBJ PREP)
 <SET NOT? <ANDB ,PARSE-NOT <PARSE-FLAGS ,PARSE-RESULT>>>
 <SET ADJ? <PARSE-ADJ ,PARSE-RESULT>>
 <SET LOC? <PARSE-LOC ,PARSE-RESULT>>
 <COND (<OR <VERB? BE? WHO WHAT WHERE WHY WHEN HOW>
	    <EQUAL? <SET TMP <PARSE-QW ,PARSE-RESULT>>
		    ,W?WHO ,W?WHAT ,W?WHERE ,W?WHY ,W?WHEN ,W?HOW>>
	<COND (<TRY-QCONTEXT?>
	       <RTRUE>)>
	<COND (<EQUAL? ,PRSI ,INTADJ>
	       <COND (<EQUAL? ,PRSO ,ME ,PLAYER>
		      <COND (<VERB? BE?>
			     <TELL "You">)
			    (T
			     <PRINT ,WHO-KNOWS-STRING>
			     <TELL-Q-WORD>
			     <TELL " you">)>
		      <COND (<IS-PRSO-ADJ? .ADJ?>
			     <TELL " are ">)
			    (ELSE <TELL " aren't ">)>)
		     (ELSE
		      <COND (<VERB? BE?>
			     <TELL-CTHE ,PRSO>)
			    (T
			     <PRINT ,WHO-KNOWS-STRING>
			     <TELL-Q-WORD>
			     <TELL " ">
			     <TELL-THE ,PRSO>)>
		      <PRINT-IS/ARE ,PRSO>
		      <COND (<NOT <IS-PRSO-ADJ? .ADJ?>>
			     <TELL "n't">)>
		      <TELL " ">)>
	       <PRINTB .ADJ?>
	       <TELL "." CR>)
	      (<EQUAL? ,PRSI ,INTPP>
	       <COND (<AND <SET PREP <P-PP-PREP>>
			   <SET OBJ <P-PP-OBJ>>>
		      <COND (<VERB? BE?>
			     <PRSO-IS <NOT <RIGHT-PREP? .PREP ,PRSO .OBJ>>
				      T>
			     <TELL " ">
			     <PRINTB .PREP>
			     <TELL " ">
			     <TELL-THE .OBJ>
			     <TELL "." CR>)
			    (ELSE
			     <PRINT ,WHO-KNOWS-STRING>
			     <TELL-Q-WORD>
			     <PRSO-IS .NOT?>
			     <TELL " ">
			     <PRINTB .PREP>
			     <TELL " ">
			     <TELL-THE .OBJ>
			     <TELL "." CR>)>)
		     (ELSE
		      <PRINT ,WHO-KNOWS-STRING>
		      <TELL-Q-WORD>
		      <PRSO-IS .NOT?>
		      <TELL " ">
		      <PRINTB <PP-PREP .LOC?>>
		      <TELL " ">
		      <NP-PRINT <PP-NOUN .LOC?>>
		      <TELL "." CR>)>)
	      (<PARSE-SUBJ ,PARSE-RESULT>
	       <WHO-KNOWS>)
	      (<AND <NOT ,PRSI> <EQUAL? <PARSE-QW ,PARSE-RESULT> ,W?WHERE>>
	       <COND (<NOT <EQUAL? ,PRSO <> ,ROOMS>>
		      <SET LOC? <LOC ,PRSO>>)
		     (T <SET LOC? <>>)>
	       <COND (<NOT .LOC?>
		      <TELL "That's an excellent question." CR>)
		     (<IN? ,PRSO ,HERE>
		      <PRSO-IS <> T>
		      <TELL " here." CR>)
		     (<EQUAL? .LOC? ,GENERIC-OBJECTS>
		      <TELL "You don't know where ">
		      <TELL-THE ,PRSO>
		      <PRINT-IS/ARE ,PRSO>
		      <TELL "." CR>)
		     (<EQUAL? .LOC? ,GLOBAL-OBJECTS>
		      <TELL "No doubt ">
		      <TELL-THE ,PRSO>
		      <PRINT-IS/ARE ,PRSO>
		      <TELL " around here somewhere." CR>)
		     (<AND <EQUAL? .LOC? ,LOCAL-GLOBALS>
			   <GLOBAL-IN? ,PRSO ,HERE>>
		      <TELL-CTHE ,PRSO>
		      <PRINT-IS/ARE ,PRSO>
		      <TELL " nearby." CR>)
		     (<FSET? .LOC? ,PERSONBIT>
		      <TELL-CTHE .LOC?>
		      <TELL " has ">
		      <TELL-THE ,PRSO>
		      <TELL "." CR>)
		     (<EQUAL? <META-LOC ,PRSO> ,HERE>
		      <TELL-CTHE ,PRSO>
		      <PRINT-IS/ARE ,PRSO>
		      <TELL " in ">
		      <TELL-THE .LOC?>
		      <TELL "." CR>)
		     (<IN? .LOC? ,ROOMS>
		      <TELL-CTHE ,PRSO>
		      <PRINT-IS/ARE ,PRSO>
		      <TELL " probably ">
		      <COND (<FSET? ,PRSO ,TOUCHBIT>
			     <TELL
"still in the place called \"" D .LOC? ".\"" CR>)
			    (ELSE
			     <COND (<NOT <FSET? ,PRSO ,PERSONBIT>>
				    <TELL "lying ">)>
			     <TELL "around somewhere." CR>)>)
		     (ELSE
		      <PRINT ,WHO-KNOWS-STRING>
		      <TELL "where ">
		      <TELL-THE ,PRSO>
		      <PRINT-IS/ARE ,PRSO>
		      <TELL "." CR>)>)
	      (ELSE
	       <PRINT ,WHO-KNOWS-STRING>
	       <TELL-Q-WORD>
	       <COND (<NOT <EQUAL? ,PRSO <> ,ROOMS>>
		      <PRSO-IS .NOT?>
		      <COND (,PRSI <TELL " " A ,PRSI>)>)>
	       <TELL "." CR>)>)
       (ELSE
	<COND (<EQUAL? ,PRSI ,INTADJ>
	       <COND (<IS-PRSO-ADJ? .ADJ?>
		      <COND (.NOT? <TELL "Wrong,">)
			    (ELSE <TELL "Right,">)>
		      <PRSO-IS <>>)
		     (ELSE
		      <COND (.NOT? <TELL "Right,">)
			    (ELSE <TELL "Wrong,">)>
		      <PRSO-IS T>)>
	       <TELL " ">
	       <PRINTB .ADJ?>
	       <TELL "." CR>)
	      (<EQUAL? ,PRSI ,INTPP>
	       <TELL "So, you say">
	       <PRSO-IS .NOT?>
	       <TELL " ">
	       <COND (<SET TMP <P-PP-PREP>>
		      <PRINTB .TMP>)
		     (ELSE
		      <PRINTB <PP-PREP .LOC?>>)>
	       <TELL " ">
	       <COND (<SET TMP <P-PP-OBJ>>
		      <TELL-THE .TMP>)
		     (ELSE <NP-PRINT <PP-NOUN .LOC?>>)>
	       <TELL "." CR>)
	      (<EQUAL? ,P-PRSA-WORD ,W?BE>
	       <COND (<EQUAL? ,PRSO ,WINNER>
		      <TELL-CTHE ,PRSO>
		      <TELL " is already " "that" "." CR>)
		     (T <TELL "That would take a bit of magic." CR>)>)
	      (ELSE
	       <TELL "So you think">
	       <PRSO-IS .NOT?>
	       <COND (,PRSI <TELL " " A ,PRSI>)>
	       <TELL "." CR>)>)>>

<DEFINE RIGHT-PREP? (PREP OBJ CONT)
	 <COND (<NOT <IN? .OBJ .CONT>> <RFALSE>)
	       (<EQUAL? .PREP ,W?IN ,W?INSIDE>
		<COND (<SEE-INSIDE? .CONT>
		       <RTRUE>)
		      (ELSE <RFALSE>)>)
	       (<AND <EQUAL? .PREP ,W?ON>
		     <OR <FSET? .CONT ,SURFACEBIT>
			 ;<FSET? .CONT ,FURNITURE>>>
		<RTRUE>)>>

<DEFINE V-BE? ()
	 <V-BE>>

<SYNTAX HOW OBJECT (MOBY) (FIND RLANDBIT) = V-HOW>
<SYNTAX HOW OBJECT (MOBY) OBJECT (MOBY) = V-HOW>

<SYNTAX WHAT OBJECT (MOBY) (FIND RLANDBIT) = V-WHAT>
<SYNTAX WHAT OBJECT (MOBY) OBJECT (MOBY) = V-WHAT>

<SYNTAX WHEN OBJECT (MOBY) (FIND RLANDBIT) = V-WHEN>
<SYNTAX WHEN OBJECT (MOBY) OBJECT (MOBY) = V-WHEN>

<SYNTAX WHERE OBJECT (MOBY) (FIND RLANDBIT) = V-WHERE PRE-WHERE>
<SYNTAX WHERE OBJECT (MOBY) OBJECT (MOBY) = V-WHERE PRE-WHERE>

<SYNTAX WHO OBJECT (MOBY) (FIND RLANDBIT) = V-WHO>
<SYNTAX WHO OBJECT (MOBY) OBJECT (MOBY) = V-WHO>
<SYNONYM WHO WHOM>

<SYNTAX WHY OBJECT (MOBY) (FIND RLANDBIT) = V-WHY>
<SYNTAX WHY OBJECT (MOBY) OBJECT (MOBY) = V-WHY>

<SYNTAX WILL OBJECT (MOBY) ;(FIND RLANDBIT) = V-WILL?>
<SYNTAX WOULD OBJECT (MOBY) ;(FIND RLANDBIT) = V-WOULD?>

<DEFINE V-WHO ()
       <COND (<PRSO? ,ROOMS>
	      <MORE-SPECIFIC>)
	     (<NOT ,PRSI>
	      <TELL
"You don't know anything special about " THE ,PRSO "." CR>)
	     (ELSE <V-BE>)>>

<DEFINE V-WHAT ()
	<V-WHO>>

<DEFINE PRE-WHERE ()
 <COND (<AND <ZERO? ,PRSS> <ZERO? ,PRSQ>>
	<PERFORM ,V?FIND ,PRSO ,PRSI>
	<RTRUE>)>>

<DEFINE V-WHERE ()
	<COND (<PRSO? ,ROOMS>
	       <MORE-SPECIFIC>)
	      (ELSE <V-BE>)>>

<DEFINE V-WHEN ()
	<COND (<PRSO? ,ROOMS>
	       <MORE-SPECIFIC>)
	      (ELSE <V-BE>)>>

<DEFINE V-WHY ()
	<COND (<PRSO? ,ROOMS>
	       <MORE-SPECIFIC>)
	      (ELSE <V-BE>)>>

<DEFINE V-HOW ()
	<COND (<PRSO? ,ROOMS>
	       <MORE-SPECIFIC>)
	      (ELSE <V-BE>)>>

<CONSTANT ADJ-TABLE
	  <LTABLE <VOC "OUTSIDE" <> ;ADJ>
		  OUTSIDE?
		  ;<VOC "INSIDE" ADJ>
		  ;INSIDE?
		  <VOC "OPEN" ADJ>
		  OPEN?
		  <VOC "CLOSED" ADJ>
		  Q-CLOSED?
		  <VOC "LOCKED" ADJ>
		  LOCKED?
		  <VOC "UNLOCKED" ADJ>
		  UNLOCKED?
		  <VOC "DEAD" ADJ>
		  DEAD?
		  <VOC "ALIVE" ADJ>
		  ALIVE?
		  <VOC "QUIET" ADJ>
		  QUIET?>>

<DEFINE QUIET? (OBJ)
	 <RTRUE>>

<DEFINE OUTSIDE? (OBJ)
	 <FSET? ,HERE ,OUTSIDE>>

;<DEFINE INSIDE? (OBJ)
	 <NOT <FSET? ,HERE ,OUTSIDE>>>

<DEFINE OPEN? (OBJ)
	 <AND <OR <FSET? .OBJ ,OPENABLE>
		  <FSET? .OBJ ,DOORBIT>>
	      <FSET? .OBJ ,OPENBIT>>>

<DEFINE Q-CLOSED? (OBJ)
	 <AND <OR <FSET? .OBJ ,OPENABLE>
		  <FSET? .OBJ ,DOORBIT>>
	      <NOT <FSET? .OBJ ,OPENBIT>>>>

<DEFINE LOCKED? (OBJ)
	 <AND <FSET? .OBJ ,DOORBIT>
	      <FSET? .OBJ ,LOCKED>>>

<DEFINE UNLOCKED? (OBJ)
	 <AND <FSET? .OBJ ,DOORBIT>
	      <NOT <FSET? .OBJ ,LOCKED>>>>

<DEFINE DEAD? (OBJ)
	 <OR <NOT <FSET? .OBJ ,PERSONBIT>>
	     <FSET? .OBJ ,DEAD>>>

<DEFINE ALIVE? (OBJ)
	 <AND <FSET? .OBJ ,PERSONBIT>
	      <NOT <FSET? .OBJ ,DEAD>>>>

<DEFINE PRSO-IS (NOT? "OPT" (CAP? <>))
	 <COND (<EQUAL? ,PRSO ,ME ,PLAYER>
		<COND (.CAP? <TELL "You">)
		      (ELSE <TELL " you">)>
		<TELL " are">
		<COND (.NOT? <TELL "n't">)>)
	       (ELSE
		<COND (.CAP? <TELL-CTHE ,PRSO>)
		      (T <TELL " "> <TELL-THE ,PRSO>)>
		<PRINT-IS/ARE ,PRSO>
		<COND (.NOT? <TELL "n't">)>)>>

<DEFAULT-DEFINITION PRINT-IS/ARE
<DEFINE PRINT-IS/ARE (OBJ)
	<COND (<OR <FSET? .OBJ ,PLURAL>
		   <EQUAL? .OBJ ,BLACKTHORNE ,ME ,YOU>>
	       <TELL " are">)
	      (ELSE <TELL " is">)>>>

<DEFINE IS-PRSO-ADJ? (ADJ "AUX" TMP)
	 <COND (<AND <SET TMP <GETPT ,PRSO ,P?ADJECTIVE>>
		     <INTBL? .ADJ .TMP </ <PTSIZE .TMP> 2>>>
		<RTRUE>)
	       (<AND <SET TMP <INTBL? .ADJ ,ADJ-TABLE <GET ,ADJ-TABLE 0>>>
		     <APPLY <GET .TMP 1> ,PRSO>>
		<RTRUE>)>>

<DEFINE PP? (P N "AUX" (TMP <PARSE-LOC ,PARSE-RESULT>))
	 <COND (<NOT .TMP> <RFALSE>)
	       (<NOT <AND .P <EQUAL? .P <P-PP-PREP>>>>
		<RFALSE>)
	       (<NOT <AND .N <EQUAL? .N <P-PP-OBJ>>>>
		<RFALSE>)
	       (ELSE <RTRUE>)>>

"does a bear shit in the woods?"

"RLANDBIT would allow single-word sentence!"
<SYNTAX CAN OBJECT (MOBY) ;(FIND RLANDBIT) = V-CAN?>
<SYNTAX COULD OBJECT (MOBY) ;(FIND RLANDBIT) = V-COULD?>
<SYNTAX DO OBJECT (MOBY) ;(FIND RLANDBIT) = V-DO?>
<SYNTAX MAY OBJECT (MOBY) ;(FIND RLANDBIT) = V-MAY?>
<SYNTAX MIGHT OBJECT (MOBY) ;(FIND RLANDBIT) = V-MIGHT?>
<SYNTAX MUST OBJECT (MOBY) ;(FIND RLANDBIT) = V-MUST?>
<SYNTAX SHOULD OBJECT (MOBY) ;(FIND RLANDBIT) = V-SHOULD?>

<DEFINE V-STATEMENT () <V-DO?>>

<CONSTANT WHO-KNOWS-STRING "It's not easy to tell "
			   ;"The \"narrator\" can't tell you ">

<DEFINE WHO-KNOWS ("OPT" (WD <PARSE-QUERY ,PARSE-RESULT>) "AUX" OBJ SUBJ)
 <COND (<AND <EQUAL? <PARSE-QW ,PARSE-RESULT> ,W?WHO ,W?WHAT>
	     <SET OBJ <VERB-ONE <WORD-VERB-STUFF ,P-PRSA-WORD>>>
	     <GET-SYNTAX .OBJ 1 0 T>
	     <SET OBJ <DETERMINE-OBJ <> 1 T>>
	     <SET OBJ <NOUN-PHRASE-OBJ1 .OBJ>>>
	<TELL "Perhaps">)
       (T
	<SET OBJ <>>
	<PRINT ,WHO-KNOWS-STRING>
	<TELL-Q-WORD>)>
 <SET SUBJ <PARSE-SUBJ ,PARSE-RESULT>>
 <COND (<T? .SUBJ>
	<SET SUBJ <NOUN-PHRASE-OBJ1 .SUBJ>>)
       (<NOT <EQUAL? ,PRSO <> ,ROOMS>>
	<SET SUBJ ,PRSO>)
       (T
	<TELL "." CR>
	<RTRUE>)>
 <TELL " ">
 <COND (<EQUAL? .SUBJ ,ME ,PLAYER>
	<TELL "you">)
       (ELSE
	<TELL-THE .SUBJ>)>
 <COND (<T? .WD>
	<COND (<OR <NOT <EQUAL? .WD ,W?DO ,W?DOES ,W?DID>>
		   <NOT <PARSE-SUBJ ,PARSE-RESULT>>>
	       <TELL " ">
	       <PRINTB .WD>)>)>
 <COND (<T? <PARSE-SUBJ ,PARSE-RESULT>>
	<TELL " ">
	;<PRINT-VOCAB-WORD ,P-PRSA-WORD>
	<COND (<T? .WD>
	       <COND (<EQUAL? .WD ,W?DID>
		      ;<BAND ,PAST-TENSE <WORD-FLAGS .WD>>
		      ;"Look for past-tense form in vocabulary:"
		      <PROG ((V <ZREST ,VOCAB <+ 1 <GETB ,VOCAB 0>>>)
			     (M <BOR *200* <GETB .V 0>>) N)
			<COND (<EQUAL? ,P-PRSA-WORD ,W?GET>
			       <TELL "got">)
			      (<AND <SET N <INTBL? ,P-PRSA-WORD <ZREST .V 9 ;3>
						   <ZGET <ZREST .V 1> 0> .M>>
				    <BTST <ZGET .N 1> ,PAST-TENSE>>
			       <PRINT-VOCAB-WORD .N>)
			      (T
			       <PRINT-VOCAB-WORD ,P-PRSA-WORD>
			       <TELL "ed">)>>)
		     (T
		      <PRINT-VOCAB-WORD ,P-PRSA-WORD>
		      <COND (<AND <EQUAL? .WD ,W?DO ,W?DOES>
				  <NOT <EQUAL? .SUBJ ,ME ,PLAYER>>
				  <NOT <FSET? .SUBJ ,PLURAL>>>
			     <TELL "s">)>)>
	       <COND (<T? .OBJ>
		      <TELL " ">
		      <COND (<EQUAL? .OBJ .SUBJ>
			     <COND (<NOT <FSET? .OBJ ,PERSONBIT>>
				    <TELL "it">)
				   (<FSET? .OBJ ,FEMALE>
				    <TELL "her">)
				   (T
				    <TELL "him">)>
			     <TELL "self">)
			    (T
			     <TELL-THE .OBJ>)>)
		     (T
		      <ECHO-NOUNS>)>)
	      (T <PRINT-VOCAB-WORD ,P-PRSA-WORD>)>)>
 <TELL "." CR>>

<DEFINE ECHO-NOUNS ("AUX" WD)
 <COND (<NOT <EQUAL? ,PRSO 0 ,WHAT ,NOT-HERE-OBJECT>>
	<COND (<SET WD <PARSE-PARTICLE1 ,PARSE-RESULT>>
	       <TELL " ">
	       <PRINTB .WD>)>
	<TELL " ">
	<TELL-THE ,PRSO>)>
 <COND (<NOT <EQUAL? ,PRSI 0 ,WHAT ,NOT-HERE-OBJECT>>
	<COND (<SET WD <PARSE-PARTICLE2 ,PARSE-RESULT>>
	       <TELL " ">
	       <PRINTB .WD>)>
	<TELL " ">
	<TELL-THE ,PRSI>)>>

<DEFINE V-CAN? () <WHO-KNOWS ,W?CAN>>

<DEFINE V-MAY? () <WHO-KNOWS ,W?MAY>>

<DEFINE V-DO? ()
 <COND (<TRY-QCONTEXT?>
	<RTRUE>)
       (<NOT <BTST <PARSE-FLAGS ,PARSE-RESULT> ,PARSE-QUESTION>>
	<COND (<NOT ,PRSS>
	       <MORE-SPECIFIC>
	       <RTRUE>)
	      (ELSE
	       <TELL "So you think">
	       <COND (<EQUAL? ,PRSS ,ME ,PLAYER>
		      <TELL " you ">
		      <COND (<ANDB ,PARSE-NOT <PARSE-FLAGS ,PARSE-RESULT>>
			     <TELL "don't ">)>)
		     (T
		      <COND ;(.CAP? <TELL-CTHE ,PRSS>)
			    (T <TELL " "> <TELL-THE ,PRSS> <TELL " ">)>
		      <COND (<ANDB ,PARSE-NOT <PARSE-FLAGS ,PARSE-RESULT>>
			     <TELL "doesn't ">)>)>
	       <PRINT-VOCAB-WORD ,P-PRSA-WORD>
	       <ECHO-NOUNS>
	       <TELL "." CR>)>)
       (T
	<WHO-KNOWS ;<COND ;(<BAND ,PAST-TENSE <PARSE-FLAGS ,PARSE-RESULT>>
			  ,W?DID)
			 (T ,W?DOES)>>)>>

<DEFINE V-COULD? () <WHO-KNOWS ,W?COULD>>

<DEFINE V-WOULD? () <WHO-KNOWS ,W?WOULD>>

<DEFINE V-SHOULD? () <WHO-KNOWS ,W?SHOULD>>

<DEFINE V-MIGHT? () <WHO-KNOWS ,W?MIGHT>>

<DEFINE V-WILL? () <WHO-KNOWS ,W?WILL>>

<DEFINE V-MUST? () <WHO-KNOWS ,W?MUST>>

<DEFINE QUESTION-VERB? ("AUX" TMP) ;"add more later..."
    <OR <EQUAL? <SET TMP <PARSE-QW ,PARSE-RESULT>>
		,W?WHO ,W?WHAT ,W?WHERE ,W?WHY ,W?WHEN ,W?HOW>
	<VERB? BE? CAN? COULD? DO? MAY? MIGHT? MUST? SHOULD? WILL? WOULD?>>>

"PERFORM uses two additional GLOBALs, 'q-verb' and subject, each of
which can be false. Examples:

	'IS THE POPE CATHOLIC'
	becomes
	<SETG PRSQ T>
	<PERFORM ,V?BE ,POPE ,INTADJ ;T>

	'DOES THE GOVERNMENT TAKE MONEY FROM ME'
	becomes
	<SETG PRSQ ,V?DO>
	<SETG PRSS ,GOVERNMENT>
	<PERFORM ,V?TAKE ,MONEY ,ME>

	'WHY DOES THE GOVERNMENT TAKE MONEY FROM ME'
	becomes
	<SETG PRSQ ,V?WHY>
	<SETG PRSS ,GOVERNMENT>
	<PERFORM ,V?TAKE ,MONEY ,ME>

When PERFORM notices the presence of a q-verb, it calls action routines
in this order:
	WINNER
	SUBJECT
	; M-BEG
	Q-PREACTION (from the following table)
	; OBJECT #2
	; OBJECT #1
	Q-ACTION (ditto) or V-STATEMENT

PERFORM also handles statements, for example:

	'MY NAME IS ARTHUR DENT'
	becomes
	<PERFORM ,V?IS ,NAME ,ARTHUR>
"

<CONSTANT QACTIONS <PLTABLE
	V-BE V-BE? 0
	V-DISEMBARK V-DISEMBARK? 0
	V-DROP V-DROP? PRE-DROP?
	V-TAKE V-TAKE? PRE-TAKE?
	;"and so on">>

<DEFINE PRE-DROP? ()
	 <COND (<EQUAL? ,PRSO <LOC ,PRSS>>
		;<SETG PRSQ ,V?DISEMBARK>
		<PERFORM ,V?DISEMBARK ;,PRSA ,PRSO ,PRSI ;,V?DISEMBARK ;,PRSS>
		<RTRUE>)>>

<DEFINE V-DROP? ()
	 <COND (<EQUAL? ,PRSO ,ROOMS>
		<PRINT "You aren't ">
		<TELL "hanging from anything." CR>)>>

<DEFINE V-DISEMBARK? ("AUX" AV)
	 <SET AV <LOC ,PRSS>>
	 <COND (<EQUAL? ,PRSO <> ,ROOMS>
		<COND (<AND .AV <NOT <IN? .AV ,ROOMS>>>
		       <PERFORM ,PRSA .AV ,PRSI ;,PRSQ ;,PRSS>
		       <RTRUE>)
		      (ELSE
		       <PRINT "You aren't ">
		       <TELL "in anything." CR>)>)
	       (<AND .AV <NOT <IN? .AV ,ROOMS>>>
		<COND (<AND <NOT <EQUAL? .AV ,PRSO>>
			    <NOT <HELD? .AV ,PRSO>>>
		       <PRINT "You already are">
		       <COND (<FSET? .AV ,SURFACEBIT> <TELL " on ">)
			     (ELSE <TELL " in ">)>
		       <TELL-THE .AV>
		       <TELL "!" CR>
		       <RTRUE>)>)
	       (<LOC ,PRSO>
		;<SETG PRSQ ,V?TAKE>
		<PERFORM ,V?TAKE ;,PRSA ,PRSO ,PRSI ;,V?TAKE ;,PRSS>
		<RTRUE>)
	       (ELSE
		<PRINT "It's not in anything.">
		<CRLF>)>>

<DEFINE PRE-TAKE? ()
	<COND (<NOT ,PRSI>
	       <PRE-TAKE>)>>

<DEFINE V-TAKE? ()
	<COND (<ZERO? <PARSE-QW ,PARSE-RESULT>>
	       <TELL "Seems reasonable." CR>)>>

<END-SEGMENT>
