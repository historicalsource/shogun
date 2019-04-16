"GLOBALS for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT 0>

<INCLUDE "PDEFS">

"global objects and associated routines"

<OBJECT GLOBAL-OBJECTS
	(FLAGS AN
	       BODY-PART
	       CONTBIT
	       DEAD
	       DONT-ALL
	       DONT-IT
	       DOORBIT
	       DUTCHBIT
	       ENGLISHBIT
	       FEMALE
	       FOODBIT
	       FURNITURE
	       INVISIBLE
	       JAPANESEBIT
	       LIGHTBIT
	       LOCKABLE
	       LOCKED
	       NDESCBIT
	       NOABIT
	       NOTHEBIT
	       ONBIT
	       OPENABLE
	       OPENBIT
	       OUTSIDE
	       PERSON
	       PLURAL
	       PORTUGUESEBIT
	       READBIT
	       RLANDBIT
	       RMUNGBIT
	       SCOREBIT
	       SEARCHBIT
	       SITTING
	       SPANISHBIT
	       SURFACEBIT
	       TAKEBIT
	       THE
	       TOOLBIT
	       TOUCHBIT
	       TRANSBIT
	       TRYTAKEBIT
	       VEHBIT
	       WEAPONBIT
	       WEARABLE
	       WEARBIT)>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ZZMGCK) ;"Yes, this needs to exist."
	(DESCFCN 0)
        (CONTFCN 0)
	(GLOBAL GLOBAL-OBJECTS)
	(FDESC "F")
	(LDESC "F")
	(THINGS 0)
	(COUNT 0)
	(SIZE 0)
	(TEXT "")
	(VALUE 0)
	(CAPACITY 0)>

<OBJECT ROOMS
	(IN TO ROOMS)>

<OBJECT INTDIR
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;ADJECTIVE
	 NORTH EAST WEST SOUTH
	 FORE AFT PORT STARBOARD)
	(DESC "direction")
	(GENERIC GENERIC-NORTH-F)
	;(ACTION INTDIR-F)>

;<ROUTINE INTDIR-F ()
	<SETG P-DIRECTION <WORD-DIR-ID <NP-NAME <GET-NP>>>>
	<RFALSE>>

<GLOBAL P-DIRECTION <>>

<ROUTINE TELL-DIRECTION (DIR)
	 <COND (<EQUAL? .DIR ,P?SOUTH>
		<TELL "south">)
	       (<EQUAL? .DIR ,P?NORTH>
		<TELL "north">)
	       (<EQUAL? .DIR ,P?WEST>
		<TELL "west">)
	       (<EQUAL? .DIR ,P?EAST>
		<TELL "east">)
	       (<EQUAL? .DIR ,P?SW>
		<TELL "southwest">)
	       (<EQUAL? .DIR ,P?NW>
		<TELL "northwest">)
	       (<EQUAL? .DIR ,P?SE>
		<TELL "southeast">)
	       (<EQUAL? .DIR ,P?NE>
		<TELL "northeast">)
	       (<EQUAL? .DIR ,P?PORT>
		<TELL "port">)
	       (<EQUAL? .DIR ,P?STARBOARD>
		<TELL "starboard">)
	       (<EQUAL? .DIR ,P?FORE>
		<TELL "straight">)>>

<SYNONYM NORTH N>
<SYNONYM SOUTH S>
<SYNONYM EAST E>
<SYNONYM WEST W>
<SYNONYM DOWN D>
<SYNONYM UP U ALOFT>
<SYNONYM NE NORTHEAST>
<SYNONYM NW NORTHWEST>
<SYNONYM SE SOUTHEAST>
<SYNONYM SW SOUTHWEST>
<SYNONYM IN AHEAD>
<SYNONYM FORE FOREWARD FORWARD FORARD STRAIGHT>
<DIR-SYNONYM FORE F>
<SYNONYM STARBOARD SB RIGHT>
<SYNONYM PORT P LEFT>

<GLOBAL HERE:OBJECT <>>

<GLOBAL LIT <>>

<GLOBAL MOVES 0>
<GLOBAL OMOVES 0>
<GLOBAL SCORE 0>
<GLOBAL OSCORE 0>

<CONSTANT DIR-BIT 1>
<CONSTANT DIR-DIR 2>
<CONSTANT DIR-NAME 3>

<GLOBAL P-DIRECTION <>>

<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(DESC "number")
	(SYNONYM INT.NUM DEGREES NORTH)
	(ADJECTIVE INT.NUM DEGREES NUMBER)
	(GENERIC GENERIC-NORTH-F)
	(ACTION INTNUM-F)>

<ROUTINE GENERIC-NORTH-F (R F)
	 ,INTDIR>

<ROUTINE INTNUM-F ()
	 <COND (<PRSO? ,INTNUM>
		<COND (<VERB? PUSH>
		       <TELL G "There's no number ""to push here." CR>)>)>>

<OBJECT THIS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM THIS THAT)
	(DESC "this")
	(FLAGS AN NOABIT NOTHEBIT NDESCBIT TOUCHBIT)>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(SYNONYM IT ;THEM ;THEY OBJECT)
	(DESC "it")
	(FLAGS AN NOABIT NOTHEBIT NDESCBIT TOUCHBIT)>

<OBJECT THEM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;IT THEM THEY OBJECTS)
	(DESC "them")
	(FLAGS ;AN NOABIT NOTHEBIT NDESCBIT TOUCHBIT)>

<OBJECT HIM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HIM HE)
	(DESC "him")
	(FLAGS PERSON NOABIT NOTHEBIT NDESCBIT TOUCHBIT)
	(ACTION HIM-F)>

<ROUTINE HIM-F ("OPT" (RARG <>) (O ,HIM) (H ,P-HIM-OBJECT))
	 <COND (.RARG <RFALSE>)
	       (.H
		<COND (<AND <OR <VERB? TELL>
				<P? (TELL-ABOUT ASK-ABOUT) .O>>
			    <NOT <ACCESSIBLE? .H>>>
		       <TELL CTHE .H " isn't here." CR>
		       <COND (<VERB? TELL> <END-QUOTE> <RFATAL>)>)
		      (ELSE
		       <COND (<EQUAL? ,WINNER .O> <SETG WINNER .H>)>
		       <COND (<EQUAL? ,PRSS .O> <SETG PRSS .H>)>
		       <REDIRECT .O .H>
		       <RTRUE>)>)
	       (ELSE
		<MORE-SPECIFIC>
		<COND (<VERB? TELL> <END-QUOTE> <RFATAL>)>)>>

<OBJECT HER
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HER SHE)
	(DESC "her")
	(FLAGS FEMALE PERSON NOABIT NOTHEBIT NDESCBIT TOUCHBIT)
	(ACTION HER-F)>

<ROUTINE HER-F ("OPT" (RARG <>))
	 <HIM-F .RARG ,HER ,P-HER-OBJECT>>

<OBJECT LIGHT
	(LOC GLOBAL-OBJECTS)
	(DESC "light")
	(SYNONYM LIGHT LIGHTS)
        (ACTION LIGHT-F)>

<ROUTINE LIGHT-F ()
	 <COND (<VERB? THROUGH>
		<DO-WALK ,P?OUT>)
	       (<VERB? LAMP-ON>
		<COND (,LIT
		       <TELL ,IT-IS-ALREADY "light" ,PERIOD>)
		      (T
		       <TELL
"You need a light source!" CR>)>)
	       (<VERB? LAMP-OFF>
		<TELL ,WASTE-OF-TIME>)>>

<OBJECT LG-HOLE
	(LOC LOCAL-GLOBALS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "hole")
	(SYNONYM HOLE)
	(ADJECTIVE MUDDY)
	(ACTION LG-HOLE-F)>

<ROUTINE LG-HOLE-F ()
	 <COND (<P? DIG LG-HOLE *>
		<PERFORM ,V?DIG ,PRSI>
		<RTRUE>)
	       (<VERB? REACH-IN>
		<TELL ,YOU-FIND-NOTHING " of interest." CR>)>>

<OBJECT CEILING
	(LOC GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILING ROOF)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	 <COND (<VERB? LOOK-UNDER>
		<NEW-VERB ,V?LOOK>
		<RTRUE>)>>

<OBJECT AIR
	(LOC GLOBAL-OBJECTS)
	(DESC "air")
	(SYNONYM AIR COLD)
	(FLAGS AN NOABIT)>

<CONSTANT BODY-PARTS-OWNERS
	<TABLE (LENGTH PURE)
		BLACKTHORNE YABU CHIMMOKO ETSU ACHIKO KIRITSUBO MARIKO
		GRAY-CAPTAIN GUARDS LG-NINJA NINJA-LEADER NINJA
		BUNTARO SAZUKO HIRO-MATSU TORANAGA GRAYS ISHIDO
		TORANAGAS-GUARDS ALVITO OARSMEN RODRIGUES SEARCH-PARTY
		SEBASTIO-HENCHMEN SEBASTIO OMI MURA ONNA SAMURAI-GUARDS
		LOSING-SAMURAI OMI-SAMURAI CREWMEN LG-CREWMEN HENDRIK VINCK
		MAETSUKKER GINSEL MATES SPILLBERGEN PIETERZOON ROPER
		SONK SALAMON VAN-NEKK CROOCQ>>

<OBJECT FEET
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FEET FOOT)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "feet")
	(FLAGS NDESCBIT BODY-PART TOOLBIT TOUCHBIT NOABIT ;NOTHEBIT)>

<OBJECT HANDS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND)
	(ADJECTIVE BARE ;MY)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "hand")
	(FLAGS NDESCBIT BODY-PART TOOLBIT TOUCHBIT NOABIT ;NOTHEBIT)>

<OBJECT HEAD
	(LOC GLOBAL-OBJECTS)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "head")
	(SYNONYM HEAD FACE)
	(FLAGS NOABIT BODY-PART ;NOTHEBIT)>

<OBJECT COJONES
	(LOC GLOBAL-OBJECTS)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "balls")
	(SYNONYM COJONES TESTICLES BALLS NUTS)
	(FLAGS BODY-PART NOABIT PLURAL ;NOTHEBIT)
	(ACTION COJONES-F)>

<ROUTINE COJONES-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<OR <AND <HELD? ,CLOTHES>
				<FSET? ,CLOTHES ,WEARBIT>>
			   <AND <HELD? ,KIMONO>
				<FSET? ,KIMONO ,WEARBIT>>>
		       <TELL
"What an embarrassing idea!" CR>)
		      (<HERE? ,BATH-HOUSE>
		       <TELL
"There are more than enough people doing that already.  The thought
enough makes you blush." CR>)
		      (ELSE
		       <TELL
"They're still there." CR>)>)
	       (<VERB? WALK-TO>
		<PERFORM ,V?ACT ,CRAZY>
		<RTRUE>)
	       (<VERB? WHAT>
		<TELL
"As your mother might have said, \"They are what a bull has that
a steer hasn't.\"" CR>)>>

<OBJECT STOMACH
	(LOC GLOBAL-OBJECTS)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "stomach")
	(SYNONYM STOMACH BELLY)
	(FLAGS BODY-PART NOABIT ;NOTHEBIT)>

<OBJECT FINGERS
	(LOC GLOBAL-OBJECTS)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "fingers")
	(SYNONYM FINGERS)
	(FLAGS BODY-PART NOABIT ;NOTHEBIT)>

<OBJECT MOUTH
	(LOC GLOBAL-OBJECTS)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "mouth")
	(SYNONYM MOUTH)
	(FLAGS BODY-PART NOABIT ;NOTHEBIT)
	(ACTION MOUTH-F)>

<ROUTINE MOUTH-F ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL "They say a closed mouth gathers no foot." CR>)>>

<OBJECT EYES
	(LOC GLOBAL-OBJECTS)
	(OWNER BODY-PARTS-OWNERS)
	(DESC ;"your " "eyes")
	(SYNONYM EYE EYES)
	(FLAGS BODY-PART NOABIT ;NOTHEBIT)
	(ACTION EYES-F)>

<ROUTINE EYES-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "You have no mirror." CR>)
	       (<VERB? OPEN>
		<TELL "They are." CR>)
	       (<VERB? CLOSE>
		<TELL "That won't help." CR>)
	       ;(<NOT ,LIT>
		<TELL ,TOO-DARK>)>>

<GLOBAL PLAYER <>>

<ROUTINE LIST-PEOPLE (TEST SI PL "OPT" (RM ,HERE) (DESC <>))
	 <REPEAT ((F <FIRST? .RM>) (LAST <>) (1ST? T))
		 <COND (<NOT .F>
			<COND (.LAST
			       <COND (.1ST?
				      <TELL "The only " .SI " ">
				      <COND (<EQUAL? .RM ,HERE> <TELL "here">)
					    (ELSE <TELL .DESC>)>
				      <TELL " is ">)
				     (ELSE
				      <TELL " and ">)>
			       <TELL D .LAST ".">)
			      (ELSE
			       <TELL G"There aren't any " .PL " ">
			       <COND (<EQUAL? .RM ,HERE> <TELL "here">)
				     (ELSE <TELL .DESC>)>
			       <TELL ".">)>
			<RETURN>)
		       (<APPLY .TEST .F>
			<COND (.LAST
			       <COND (.1ST?
				      <SET 1ST? <>>
				      <TELL
				       "The " .PL " ">
				      <COND (<EQUAL? .RM ,HERE> <TELL "here">)
					    (ELSE <TELL .DESC>)>
				      <TELL " are">)>
			       <TELL " " D .LAST ",">)>
			<SET LAST .F>)>
		 <SET F <NEXT? .F>>>>

<OBJECT LG-MEN
	(LOC LOCAL-GLOBALS)
	(SYNONYM MAN MEN)
	(DESC "men")
	(FLAGS PERSON TOUCHBIT NOABIT PLURAL)
	(ACTION LG-MEN-F)>

<ROUTINE LG-MEN-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL G"There is no response." CR>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <LIST-PEOPLE ,MAN? "man" "men">)
		      (<OR <VERB? TELL>
			   <P? TELL-ABOUT LG-MEN>>
		       <TELL
G"You'll have to address an individual to get a response." CR>
		       <END-QUOTE>
		       <RFATAL>)
		      (<HOSTILE-VERB?>
		       <MORE-SPECIFIC>)>)>>

<ROUTINE MAN? (OBJ)
	 <AND <NOT <EQUAL? .OBJ ,LG-MEN>>
	      <FSET? .OBJ ,PERSON>
	      <NOT <FSET? .OBJ ,FEMALE>>>>

<OBJECT LG-WOMEN
	(SCENE S-NINJA)
	(LOC LOCAL-GLOBALS)
	(SYNONYM WOMAN WOMEN)
	(DESC "women")
	(FLAGS PERSON FEMALE TOUCHBIT NOABIT PLURAL)
	(ACTION LG-WOMEN-F)>

<ROUTINE LG-WOMEN-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL G"There is no response." CR>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <LIST-PEOPLE ,WOMAN? "woman" "women">)
		      (<OR <VERB? TELL>
			   <P? TELL-ABOUT LG-WOMEN>>
		       <TELL
G"You'll have to address an individual to get a response." CR>
		       <END-QUOTE>
		       <RFATAL>)
		      (<HOSTILE-VERB?>
		       <MORE-SPECIFIC>)>)>>

<ROUTINE WOMAN? (OBJ)
	 <AND <NOT <EQUAL? .OBJ ,LG-WOMEN>>
	      <FSET? .OBJ ,PERSON>
	      <FSET? .OBJ ,FEMALE>>>

<OBJECT YOU
	(LOC GLOBAL-OBJECTS)
	(SYNONYM YOU YOURSELF)
	(DESC "myself")
	(FLAGS PERSON TOUCHBIT NOABIT NOTHEBIT)
	(ACTION YOU-F)>

<ROUTINE YOU-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL G"There is no response." CR>)
	       (<VERB? WHO>
		<COND (<TRY-QCONTEXT?>
		       <RTRUE>)
		      (ELSE
		       <MORE-SPECIFIC>)>)
	       (<WINNER? ,PLAYER>
		<REDIRECT ,YOU ,ME>)>>

;<ROUTINE MORE-SPECIFIC ()
	 <TELL ,YOU-HAVE-TO "be more specific." CR>>

<OBJECT ME
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ME MYSELF SELF I WE US)
	(DESC "yourself")
	(FLAGS PERSON TOUCHBIT NOABIT NOTHEBIT)
	(ACTION ME-F)>

<ROUTINE MENTAL-COLLAPSE ()
	 <TELL
"Talking to yourself is a sign of impending mental collapse." CR>>

<ROUTINE ME-F ("OPT" (RARG <>) "AUX" OLIT)
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<VERB? HOW>
		<PERFORM ,V?DIAGNOSE>
		<RTRUE>)
	       (<VERB? WEAR>
		<COND (<ACCESSIBLE? ,CLOTHES>
		       <PERFORM ,V?WEAR ,CLOTHES>
		       <RTRUE>)
		      (ELSE
		       <TELL "You can't see any clothes here." CR>)>)
	       (<P? CROSS ME>
		<PERFORM ,V?MAKE ,SIGN-OF-CROSS>
		<RTRUE>)
	       (<VERB? BE? BE WHERE HOW>
		<COND (<AND <VERB? WHERE>
			    <TRY-QCONTEXT?>>
		       <RTRUE>)
		      (ELSE
		       <REDIRECT ,ME ,PLAYER>
		       <RTRUE>)>)
	       (<VERB? WHO WHAT>
		<TELL
"You are John Blackthorne, Pilot-Major of the "I"Erasmus"", a Dutch
merchanter out of Rotterdam.  You are an Englishman chosen as Pilot
because you speak Dutch, courtesy of your Dutch mother.  You also
speak Spanish, Portuguese, and Latin." CR>)
	       (<VERB? FIND ;WHERE>
		<TELL "You are ">
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL
"aboard the "I"Erasmus""." CR>)
		      (<SCENE? ,S-ANJIRO ,S-YABU ,S-PIT
			       ,S-RODRIGUES>
		       <TELL
"in the Japanese fishing village of Anjiro." CR>)
		      (<SCENE? ,S-VOYAGE>
		       <TELL
"on your way to Osaka, at the command of Lord Toranaga." CR>)
		      (<SCENE? ,S-TORANAGA>
		       <TELL
"in Lord Toranaga's court in Osaka Castle." CR>)
		      (<SCENE? ,S-PRISON>
		       <TELL
"in the prison of Osaka Castle." CR>)
		      (<SCENE? ,S-ESCAPE>
		       <TELL
"in the great city and castle of Osaka." CR>)
		      (<SCENE? ,S-OCHIBA ,S-DEPARTURE ,S-SEPPUKU
			       ,S-NINJA>
		       <TELL "in Osaka Castle." CR>)
		      (ELSE
		       <TELL "in Japan." CR>)>)
	       (<P? EXAMINE ,ME>
		<COND (<OR <FSET? ,KIMONO ,WEARBIT>
			   <FSET? ,SOCKS ,WEARBIT>
			   <FSET? ,SANDALS ,WEARBIT>
			   <FSET? ,SLIPPERS ,WEARBIT>>
		       <SETG D-BIT ,WEARBIT>
		       <DESCRIBE-SENT ,WINNER>
		       <SETG D-BIT <>>
		       <RTRUE>)
		      (<AND <HELD? ,CLOTHES> <FSET? ,CLOTHES ,WEARBIT>>
		       <TELL "You are dressed in ">
		       <COND (<SCENE? ,S-ERASMUS>
			      <TELL "worn, dirty clothes">
			      <COND (<AND <HELD? ,BOOTS>
					  <FSET? ,BOOTS ,WEARBIT>>
				     <TELL " and salt-stained boots">)>
			      <TELL "." CR>)
			     (ELSE
			      <TELL
"your old clothes, which have been cleaned and mended">
			      <COND (<AND <HELD? ,BOOTS>
					  <FSET? ,BOOTS ,WEARBIT>>
				     <TELL ", and your newly polished boots">)>
			      <TELL "." CR>)>)
		      (<AND <HELD? ,BOOTS> <FSET? ,BOOTS ,WEARBIT>>
		       <TELL
"You are wearing your boots." CR>)
		      (ELSE
		       <TELL
"You are naked." CR>)>)
	       (<VERB? SMELL>
		<COND (<SCENE? ,S-ERASMUS>
		       <TELL
"Your smell like anyone who's been at sea for six months would smell." CR>)
		      (ELSE
		       <TELL
"You smell all right, considering." CR>)>)
	       (<AND <P? SHOW * ME>
		     <EQUAL? ,P-PRSA-WORD ,W?READ>>
		<PERFORM ,V?READ ,PRSO>
		<RTRUE>)
	       (<VERB? EAT>
		<TELL
"This is the sort of behavior that most Japanese would find extremely
uncivilized." CR>)
	       (<VERB? HELP>
		<TELL
"It is said that the Lord helps those who help themselves." CR>)
	       (<VERB? TELL>
		<MENTAL-COLLAPSE>
		<END-QUOTE>)
	       (<VERB? LISTEN>
		<TELL "Yes?" CR>)
	       (<VERB? WAKE>
		<TELL ,YOU-ARE>
		<TELL ,PERIOD>)
	       (<AND <RARG? WINNER>
		     <VERB? GIVE>>
		<COND (<PRSO? ,ME>
		       <TELL ,WASTE-OF-TIME>)
		      (<PRSI? ,ME>
		       <COND (<IN? ,PRSO ,PLAYER>
			      <PRE-TAKE>)
			     (T
			      <PERFORM ,V?TAKE ,PRSO>
			      <RTRUE>)>)>)
	       (<VERB? MOVE>
		<V-WALK-AROUND>)
	       (<VERB? SEARCH>
		<V-INVENTORY>
		<RTRUE>)
	       (<OR <P? (TAKE ATTACK HIT SWING BOW) ME>
		    <VERB? ENTER THROUGH TAKE-OFF HOLD>
		    <P? THROW * ME>>
		<TELL
G"You are beginning to give way to madness, I see." CR>)
	       (<VERB? KILL MUNG BURY SHOOT>
		<TELL
"Death is not to be entered into so lightly as that.  Death is a matter
of great seriousness." CR>)
	       (<VERB? FOLLOW>
		<TELL
"You're getting ahead of yourself." CR>)
	       (<P? (THROW THROW-OFF DROP) ME>
		<COND (,PRSI <PERFORM ,V?BOARD ,PRSI> <RTRUE>)
		      (ELSE <TELL
G"You are beginning to give way to madness, I see." CR>)>)>>

<OBJECT GLOBAL-HERE
	(LOC GLOBAL-OBJECTS)
	(DESC "here")
	(SYNONYM ROOM CHAMBER PLACE BASEMENT HERE AREA)
	(ADJECTIVE AREA)
	(FLAGS NOABIT NOTHEBIT)
	(ACTION GLOBAL-HERE-F)>

<ROUTINE GLOBAL-HERE-F ()
	 <COND (<VERB? LOOK EXAMINE LOOK-INSIDE>
		<V-LOOK>
		<RTRUE>)
	       (<P? PUT * ,GLOBAL-HERE>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<VERB? WHERE FIND>
		<PERFORM ,V?FIND ,ME>
		<RTRUE>)
	       (<AND <VERB? THROUGH WALK-TO>
		     <NOT <PAST-TENSE?>>>
		<V-WALK-AROUND>)
	       (<VERB? OPEN CLOSE>
		<TELL "You should try a door instead." CR>)
	       (<VERB? DROP LEAVE EXIT>
		<DO-WALK ,P?OUT>)
	       (<VERB? WALK-AROUND>
		<TELL
"Walking around the room reveals nothing new.  To move elsewhere, just type
the desired direction." CR>)
	       (<VERB? LAMP-ON>
		<NEW-PRSO ,LIGHT>
		<RTRUE>)
	       (<VERB? SEARCH>
		<TELL
"You don't find anything." CR>)
	       (<VERB? WAVE>
		<TELL-YUKS>)>>

<SETG C-NORTH 1>
<SETG C-EAST 2>
<SETG C-WEST 4>
<SETG C-SOUTH 8>
<SETG C-NE 16>
<SETG C-NW 32>
<SETG C-SE 64>
<SETG C-SW 128>

<CONSTANT C-NORTH 1>
<CONSTANT C-EAST 2>
<CONSTANT C-WEST 4>
<CONSTANT C-SOUTH 8>
<CONSTANT C-NE 16>
<CONSTANT C-NW 32>
<CONSTANT C-SE 64>
<CONSTANT C-SW 128>

<OBJECT NORTH-WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "north wall")
	(SYNONYM WALL)
	(ADJECTIVE NORTH FORE)
	(GENERIC GENERIC-WALL-F)
	(ACTION WALL-F)>

<OBJECT EAST-WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "east wall")
	(SYNONYM WALL)
	(ADJECTIVE EAST STARBOARD)
	(FLAGS AN)
	(GENERIC GENERIC-WALL-F)
	(ACTION WALL-F)>

<OBJECT WEST-WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "west wall")
	(SYNONYM WALL)
	(ADJECTIVE WEST PORT)
	(GENERIC GENERIC-WALL-F)
	(ACTION WALL-F)>

<OBJECT SOUTH-WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "south wall")
	(SYNONYM WALL)
	(ADJECTIVE SOUTH AFT)
	(GENERIC GENERIC-WALL-F)
	(ACTION WALL-F)>

<OBJECT WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(GENERIC GENERIC-WALL-F)
	(ACTION WALL-F)>

<ROUTINE GENERIC-WALL-F (R F)
	 ,WALL>

<ROUTINE WALL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL ,IT-LOOKS-LIKE "a wall." CR>)
	       (<VERB? LOWER MUNG>
		<TELL ,YOU-CANT "pull down a wall that easily." CR>)>>

<OBJECT DIRT
	(LOC GLOBAL-OBJECTS)
	(DESC "dirt")
	(SYNONYM RUBBLE DEBRIS DUST DIRT)
	(FLAGS NOABIT)>

<OBJECT GROUND
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FLOOR GROUND FIELD EARTH DIRT)
	(ADJECTIVE STONE SANDY TINY LEVEL)
	(DESC "ground")
	(FLAGS THE)
	(ACTION GROUND-F)>

<ROUTINE GROUND-F ()
	 <COND (<VERB? EXAMINE>
		<COND ;(<FSET? ,HERE ,RAIRBIT>
		       <TELL
"It's a long way down." CR>)
		      (ELSE
		       <TELL
"You see nothing of interest." CR>)>)
	       (<P? PUT * ,GROUND>
		<PERFORM ,V?BURY ,PRSO>
		<RTRUE>)
	       (<VERB? CLIMB-UP CLIMB-ON CLIMB-FOO BOARD HIT>
		<TELL ,WASTE-OF-TIME>)
	       (<VERB? LOOK-UNDER>
		<TELL
"You can't look under the ground, it's solid!" CR>)>>

<OBJECT CORRIDOR
	(LOC GLOBAL-OBJECTS)
	(DESC "passage")
	(SYNONYM PASSAGE CORRIDOR EXIT TUNNEL)
	(ADJECTIVE LONG DARK STEAM)
	(ACTION CORRIDOR-F)>

<ROUTINE CORRIDOR-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<V-WALK-AROUND>)>>

;<OBJECT LOCAL-WATER
	(SYNONYM WATER)
	(ADJECTIVE FRESH SALT SEA)
	(DESC "water")
	(FLAGS NOABIT)
	(ACTION WATER-F)>

;<OBJECT WATER
	(LOC LOCAL-GLOBALS)
	(SYNONYM WATER)
	(DESC "water")
	(FLAGS NDESCBIT NOABIT)
	(ACTION WATER-F)>

;<ROUTINE WATER-F ()
	 <COND (<P? (POUR THROW) ,LOCAL-WATER>
		<COND (<AND <LOC ,PRSO>
			    <IN? <LOC ,PRSO> ,WINNER>>
		       <PERFORM ,V?POUR <LOC ,PRSO>>
		       <RTRUE>)
		      (ELSE
		       <DONT-HAVE-THAT>)>)
	       (<VERB? EAT DRINK DRINK-FROM>
	        <COND (<PRSO? ,LOCAL-WATER>
		       <COND (<IN? <LOC ,PRSO> ,WINNER>
			      <COND (<FSET? <LOC ,PRSO> ,OPENBIT>
				     <REMOVE ,PRSO>)
				    (ELSE
				     <TELL-OPEN-CLOSED <LOC ,PRSO>>
				     <RTRUE>)>)
			     (<NOT <GLOBAL-IN? ,WATER ,HERE>>
			      <TELL ,YOU-DONT-HAVE THE <LOC ,PRSO> ,PERIOD>
			      <RTRUE>)>)>
		<COND (<OR <AND <PRSO? ,LOCAL-WATER>
				<FSET? ,PRSO ,RMUNGBIT>>
			   ;<AND <PRSO? ,WATER>
				<HERE? ;"ROOM WITH WATER">>>
		       <TELL
"It's bitter and you spit it out immediately.">)
		      (ELSE
		       <TELL
"That was refreshing, but you shouldn't drink untested water.">)>
		<CRLF>)
	       (<VERB? REACH-IN RUB>
		<TELL
"It's wet." CR>)
	       (<VERB? LOOK-INSIDE LOOK-UNDER>
		<MAKE-OUT>)
	       ;(<VERB? THROUGH LEAP>
		<COND (<FSET? ,HERE ,RWATERBIT>
		       <TELL ,YOU-ARE ,PERIOD>)>)>>

;<ROUTINE RANDOM-PSEUDO ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE LOOK-BEHIND>
		<TELL G "You see nothing special about " "it." CR>)
	       (<VERB? TAKE>
		<YOU-CANT-X-THAT "take">)>>

"sleep, hunger, etc."

;<GLOBAL LAST-SLEPT 40> ;"move when you last woke-up, for purposed of V-TIME"

<OBJECT GLOBAL-SLEEP
	(LOC GLOBAL-OBJECTS)
	(DESC "sleep")
	(SYNONYM SLEEP NAP)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)
	(ACTION GLOBAL-SLEEP-F)>

<ROUTINE GLOBAL-SLEEP-F ()
	 <COND (<VERB? WALK-TO TAKE>
                <NEW-VERB ,V?SLEEP>
		<RTRUE>)
	       (<VERB? FIND>
		<TELL "Sleep anywhere." CR>)>>

<OBJECT NOISE
	(LOC GLOBAL-OBJECTS)
	(DESC "noise")
	(SYNONYM NOISE SOUND WHINING CRYING COMMOTION)>

<OBJECT SIGN-OF-CROSS
	(LOC GLOBAL-OBJECTS)
	(OWNER SIGN-OF-CROSS)
	(DESC "cross")
	(SYNONYM SIGN CROSS)
	(ADJECTIVE SIGN)
	(FLAGS ABSTRACTBIT)
	(ACTION SIGN-OF-CROSS-F)>

<ROUTINE SIGN-OF-CROSS-F ()
	 <COND (<VERB? MAKE> <RFALSE>)
	       (ELSE <TELL "There is no cross here." CR>)>>

<OBJECT SANE
	(LOC GENERIC-OBJECTS)
	(DESC "sane")
	(SYNONYM NORMAL SANE ORDINARY QUIET)
	(ADJECTIVE ACTING)
	(FLAGS DONT-IT)>

<OBJECT CRAZY
	(LOC GENERIC-OBJECTS)
	(DESC "insane")
	(SYNONYM KAMI INSANE MADMAN MAD
	         CRAZY BONKERS BERSERK
		 POSSESSED SILLY STUPID)
	(ADJECTIVE ACTING)
	(GENERIC GENERIC-CRAZY-F)
	(FLAGS DONT-IT SCOREBIT NOABIT NOTHEBIT)>

<OBJECT TRAITOR
	(LOC GENERIC-OBJECTS)
	(DESC "traitor")
	(SYNONYM TRAITOR BETRAYER)
	(FLAGS SCOREBIT)>

<OBJECT STRAIT-OF-MAGELLAN
	(LOC GENERIC-OBJECTS)
	(OWNER STRAIT-OF-MAGELLAN)
	(DESC "Magellan's Pass")
	(SYNONYM MAGELLAN PASS STRAIT STRAITS)
	(FLAGS NOABIT NOTHEBIT SCOREBIT)>

<OBJECT PACIFIC
	(LOC GENERIC-OBJECTS)
	(DESC "Pacific Ocean")
	(SYNONYM ATLANTIC PACIFIC OCEAN)
	(ADJECTIVE ATLANTIC PACIFIC)
	(FLAGS NOABIT NOTHEBIT)>

<OBJECT PORTUGAL
	(LOC GLOBAL-OBJECTS)
	(DESC "Portugal")
	(SYNONYM PORTUGAL)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)>

<OBJECT PORTUGUESE
	(LOC GLOBAL-OBJECTS)
	(DESC "Portuguese")
	(SYNONYM PORTUGUESE)
	(ADJECTIVE PORTUGUESE)
	(FLAGS NOABIT NOTHEBIT)
	(ACTION PORTUGUESE-F)>

<ROUTINE PORTUGUESE-F ()
	 <COND (<OR <P? (SPEAK LEARN SAY) PORTUGUESE>
		    <P? TEACH * PORTUGUESE>
		    <P? ASK-ABOUT * PORTUGUESE>>
		<RFALSE>)
	       (<VERB? BE BE?> <RFALSE>)
	       (ELSE
		<FIND-NATIONALITY ,PORTUGUESE ,PORTUGUESEBIT>)>>

<ROUTINE PORTUGUESE? () 
	 <OR <PRSI? PORTUGUESE>
	     <ADJ? ,W?PORTUGUESE>
	     <PP? ,W?FROM ,PORTUGAL>>>

<OBJECT SPAIN
	(LOC GLOBAL-OBJECTS)
	(DESC "Spain")
	(SYNONYM SPAIN)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)>

<OBJECT SPANISH
	(LOC GLOBAL-OBJECTS)
	(DESC "Spanish")
	(SYNONYM SPANISH)
	(ADJECTIVE SPANISH)
	(FLAGS NOABIT NOTHEBIT)
	(ACTION SPANISH-F)>

<ROUTINE SPANISH? ()
	 <OR <PRSI? SPANISH>
	     <ADJ? ,W?SPANISH>
	     <PP? ,W?FROM ,SPAIN>>>

<ROUTINE SPANISH-F ()
	 <COND (<OR <P? (SPEAK LEARN SAY) SPANISH>
		    <P? TEACH * SPANISH>
		    <P? ASK-ABOUT * SPANISH>>
		<RFALSE>)
	       (<VERB? BE BE?> <RFALSE>)
	       (ELSE
		<FIND-NATIONALITY ,SPANISH ,SPANISHBIT>)>>

<OBJECT ENGLAND
	(LOC GLOBAL-OBJECTS)
	(DESC "England")
	(SYNONYM ENGLAND BRITAIN LONDON)
	(ADJECTIVE ENGLISHMAN BRITON)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)>

<OBJECT ENGLISH
	(LOC GLOBAL-OBJECTS)
	(DESC "English")
	(SYNONYM ENGLISH BRITISH)
	(ADJECTIVE ENGLISH BRITISH)
	(FLAGS NOABIT NOTHEBIT)
	(ACTION ENGLISH-F)>

<ROUTINE ENGLISH? ()
	 <OR <PRSI? ENGLISH>
	     <ADJ? ,W?ENGLISH ,W?BRITISH
		   ,W?ENGLISHMAN ,W?BRITON>
	     <PP? ,W?FROM ,ENGLAND>>>

<ROUTINE ENGLISH-F ()
	 <COND (<OR <P? (SPEAK LEARN SAY) ENGLISH>
		    <P? TEACH * ENGLISH>
		    <P? ASK-ABOUT * ENGLISH>>
		<RFALSE>)
	       (<VERB? BE BE?> <RFALSE>)
	       (ELSE
		<FIND-NATIONALITY ,ENGLISH ,ENGLISHBIT>)>>

<OBJECT HOLLAND
	(LOC GLOBAL-OBJECTS)
	(DESC "Holland")
	(SYNONYM HOLLAND NETHERLANDS ROTTERDAM AMSTERDAM)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)>

<OBJECT DUTCH
	(LOC GLOBAL-OBJECTS)
	(DESC "Dutch")
	(SYNONYM DUTCH)
	(ADJECTIVE DUTCH)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)
	(ACTION DUTCH-F)>

<ROUTINE DUTCH? ()
	 <OR <PRSI? DUTCH>
	     <ADJ? ,W?DUTCH>
	     <PP? ,W?FROM ,HOLLAND>>>

<ROUTINE DUTCH-F ()
	 <COND (<OR <P? (SPEAK LEARN SAY) DUTCH>
		    <P? TEACH * DUTCH>
		    <P? ASK-ABOUT * DUTCH>>
		<RFALSE>)
	       (<VERB? BE BE?> <RFALSE>)
	       (ELSE
		<FIND-NATIONALITY ,DUTCH ,DUTCHBIT>)>>

<OBJECT HANASE-MASEN
	(LOC GLOBAL-OBJECTS)
	(DESC "hanase-masen")
	(SYNONYM HANASE-MASEN)
	(FLAGS ABSTRACTBIT)>

<OBJECT JAPAN
	(LOC GLOBAL-OBJECTS)
	(DESC "Japan")
	(SYNONYM JAPAN JAPANS NIPPON NIHON)
	(FLAGS NOABIT NOTHEBIT)
	(ACTION JAPAN-F)>

<ROUTINE JAPAN-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<SCENE? S-ERASMUS>
		       <TELL
"You aren't even sure you are near Japan." CR>)
		      (ELSE
		       <TELL
"What you see is a place unlike any you've seen before.  It's like another
world." CR>)>)>>

<OBJECT JAPANESE
	(LOC GLOBAL-OBJECTS)
	(DESC "Japanese")
	(SYNONYM JAPANESE)
	(ADJECTIVE JAPANESE)
	(COUNT 0)
	(FLAGS NOABIT NOTHEBIT SCOREBIT)
	(ACTION JAPANESE-F)>

<ROUTINE JAPANESE-F ()
	 <COND (<OR <P? (SPEAK LEARN SAY) JAPANESE>
		    <P? TEACH * JAPANESE>
		    <P? ASK-ABOUT * JAPANESE>>
		<RFALSE>)
	       (<VERB? BE BE?> <RFALSE>)
	       (ELSE
		<FIND-NATIONALITY ,JAPANESE ,JAPANESEBIT>)>>

<ROUTINE FIND-NATIONALITY (OBJ BIT "AUX" (F <FIRST? ,HERE>)
			   (BEST <>) (PBEST <>))
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (<FSET? .F .BIT>
			<COND (<FSET? .F ,PLURAL>
			       <COND (<NOT .PBEST> <SET PBEST .F>)
				     (ELSE <SET PBEST -1>)>)
			      (ELSE
			       <COND (<NOT .BEST> <SET BEST .F>)
				     (ELSE <SET BEST -1>)>)>)>
		 <SET F <NEXT? .F>>>
	 <COND (<G? .PBEST 0>
		<REDIRECT .OBJ .PBEST>
		<RTRUE>)
	       (<G? .BEST 0>
		<REDIRECT .OBJ .BEST>
		<RTRUE>)
	       (<OR <L? .PBEST 0> <L? .BEST 0>>
		<TELL
,YOU-HAVE-TO G"be more specific about ""which " D .OBJ " you mean." CR>)
	       (ELSE
		<TELL
"It's hard to tell whom you mean; please be more specific." CR>)>>

<OBJECT LATIN
	(LOC GLOBAL-OBJECTS)
	(DESC "Latin")
	(SYNONYM LATIN)
	(FLAGS ABSTRACTBIT NOABIT NOTHEBIT)>

<OBJECT GLOBAL-FOOD
	(LOC GLOBAL-OBJECTS)
	(DESC "food")
	(SYNONYM FOOD)
	(ADJECTIVE MORE)
	(ACTION GLOBAL-FOOD-F)>

<ROUTINE GLOBAL-FOOD-F ("AUX" F)
	 <COND (<SET F
		     <OR <FIND-IN ,HERE ,FOODBIT>
			 <FIND-IN ,WINNER ,FOODBIT>>>
		<REDIRECT ,GLOBAL-FOOD .F>
		<RTRUE>)
	       (<VERB? EXAMINE EAT>
		<TELL
"There's no food here." CR>)>>

<OBJECT GLOBAL-WATER
	(LOC GLOBAL-OBJECTS)
	(DESC "water")
	(SYNONYM WATER DRINK WATER)
	(FLAGS NOABIT)
	(ACTION GLOBAL-WATER-F)>

<ROUTINE GLOBAL-WATER-F ()
	 <COND (<VERB? EXAMINE DRINK>
		<COND (<HERE? ,BATH-HOUSE>
		       <PERFORM ,PRSA ,BATHTUB>
		       <RTRUE>)
		      (<HERE? ,YOKOSE-BATH-HOUSE>
		       <PERFORM ,PRSA ,YOKOSE-BATHTUB>
		       <RTRUE>)
		      (ELSE
		       <TELL
"There's no water here." CR>)>)>>

<OBJECT CHURCH
	(LOC GENERIC-OBJECTS)
	(OWNER GOD)
	(DESC "Church")
	(SYNONYM CHURCH SOCIETY)
	(ADJECTIVE CHRISTIAN CATHOLIC)
	(FLAGS ABSTRACTBIT)>

<OBJECT JESUITS
	(LOC GENERIC-OBJECTS)
	(DESC "Jesuits")
	(SYNONYM JESUIT JESUITS)>

<OBJECT GOD
	(LOC GENERIC-OBJECTS)
	(DESC "God")
	(SYNONYM GOD JESUS)
	(FLAGS ABSTRACTBIT)>

<OBJECT SATAN
	(LOC GENERIC-OBJECTS)
	(DESC "Satan")
	(SYNONYM SATAN DEVIL)
	(FLAGS ABSTRACTBIT)>

<OBJECT BLACK-SHIP
	(LOC GLOBAL-OBJECTS)
	(SCENE S-PRISON S-MARIKO S-AFTERMATH)
	(DESC "Black Ship")
	(SYNONYM SHIP)
	(ADJECTIVE BLACK)
	(FLAGS ABSTRACTBIT THE)
	(GENERIC GENERIC-SHIP-F)>

<OBJECT GORODA
	(LOC GENERIC-OBJECTS)
	(DESC "Goroda")
	(SYNONYM GORODA)
	(ADJECTIVE DICTATOR)
	(FLAGS PERSON)>

<OBJECT TAIKO
	(LOC GENERIC-OBJECTS)
	(DESC "Taiko")
	(SYNONYM TAIKO KWAMPAKU NAKAMURA)
	(FLAGS PERSON)>

<OBJECT SHOGUN
	(LOC GENERIC-OBJECTS)
	(DESC "Shogun")
	(SYNONYM SHOGUN)
	(FLAGS PERSON)>

<OBJECT KIYAMA
	(LOC GENERIC-OBJECTS)
	(DESC "Kiyama")
	(SYNONYM KIYAMA)
	(ADJECTIVE LORD)
	(FLAGS PERSON)>

<OBJECT POPE
	(LOC GENERIC-OBJECTS)
	(DESC "Pope")
	(SYNONYM POPE)
	(ADJECTIVE CHRISTIAN CATHOLIC)
	(FLAGS PERSON)>

<OBJECT GLOBAL-HATAMOTO
	(LOC GENERIC-OBJECTS)
	(DESC "hatamoto")
	(SYNONYM HATAMOTO)
	(FLAGS PERSON)
	(ACTION GLOBAL-HATAMOTO-F)>

<ROUTINE GLOBAL-HATAMOTO-F ()
	 <COND (<VERB? WHO WHAT>
		<TELL
"A "I"hatamoto"" is literally a 'banner-man,' which formerly meant one who
carried his lord's banner in battle.  Now it means a vassal who is a personal
retainer, a highly trusted member of the lord's staff." CR>)>>

<OBJECT GLOBAL-BARBARIAN
	(LOC GENERIC-OBJECTS)
	(DESC "barbarian")
	(SYNONYM BARBARIAN)
	(FLAGS PERSON SCOREBIT)>

<OBJECT GLOBAL-SAMURAI
	(LOC GENERIC-OBJECTS)
	(DESC "samurai")
	(SYNONYM SAMURAI)
	(GENERIC GENERIC-SAMURAI-F)
	(FLAGS PERSON)>

<OBJECT GLOBAL-DAIMYO
	(LOC GENERIC-OBJECTS)
	(DESC "daimyo")
	(SYNONYM DAIMYO LORD)
	(FLAGS PERSON)>

<OBJECT PIRATE
	(LOC GENERIC-OBJECTS)
	(DESC "pirate")
	(SYNONYM PIRATE CORSAIR)>

<OBJECT HERETIC
	(LOC GENERIC-OBJECTS)
	(DESC "heretic")
	(SYNONYM HERETIC SATANIST WORSHIPPER)
	(ADJECTIVE SATAN)>

<OBJECT LEADER
	(LOC GENERIC-OBJECTS)
	(DESC "leader")
	(SYNONYM LEADER PILOT-MAJOR)>

<VOC "SORRY" ADJ>

<OBJECT WIND
	(LOC GLOBAL-OBJECTS)
	(DESC "wind")
	(SYNONYM WIND GALE STORM BREEZE)
	(ACTION WIND-F)>

<ROUTINE WIND-F ()
	 <COND (<VERB? EXAMINE FIND RUB>
		<COND (<AND <SCENE? ,S-ERASMUS>
			    <FSET? ,HERE ,OUTSIDE>>
		       <TELL
"The storm is out of the east, humping up the waves and tide.  The
"I"Erasmus"" is ">
		       <COND (<EQUAL? ,SHIP-DIRECTION ,P?WEST>
			      <TELL
"running before the wind." CR>)
			     (<EQUAL? ,SHIP-DIRECTION ,P?SW ,P?NW>
			      <TELL
"fighting to make way south and west." CR>)
			     (<EQUAL? ,SHIP-DIRECTION ,P?SOUTH ,P?NORTH>
			      <TELL
"broadside to the gale." CR>)>)
		      (<SCENE? ,S-VOYAGE>
		       <COND (<HERE? ,GALLEY ,MAIN-DECK ,IN-THE-SEA>
			      <TELL
"The gale is blowing with merciless fury." CR>)
			     (ELSE
			      <TELL
"Here in the lee of the cliffs, the wind is calmer." CR>)>)
		      (<FSET? ,HERE ,OUTSIDE>
		       <TELL
"The wind is calm here." CR>)
		      (ELSE
		       <TELL "You're inside.  There's no wind here." CR>)>)
	       (<VERB? LISTEN>
		<COND (<SCENE? ,S-ERASMUS ,S-VOYAGE>
		       <TELL
"The wind whistles and groans." CR>)>)
	       (<VERB? THROUGH TURN-TOWARD>
		<COND (<AND <SCENE? ,S-ERASMUS ,S-VOYAGE>
			    <FSET? ,HERE ,OUTSIDE>>
		       <TELL
"Facing into the storm helps to keep you awake." CR>)
		      (ELSE
		       <TELL
"There's no wind here." CR>)>)>>

<OBJECT HELP
	(LOC GLOBAL-OBJECTS)
	(DESC "help")
	(SYNONYM HELP ASSISTANCE AID)
	(FLAGS ABSTRACTBIT)
	(ACTION HELP-F)>

<ROUTINE HELP-F ()
	 <COND (<VERB? ASK-FOR>
		<TELL
"No one seems able, or perhaps, willing to help." CR>)
	       (<VERB? TAKE>
		<TELL
"There doesn't seem to be anyone around in a position to help you." CR>)>>

<OBJECT SUICIDE
	(LOC GENERIC-OBJECTS)
	(DESC "suicide")
	(SYNONYM SUICIDE SEPPUKU DEATH)>

<ROUTINE PRINT-SPACES (CNT)
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0>
			<RETURN>)
		       (T
			<PRINTC 32>)>>>

<CONSTANT SLINE <ITABLE NONE 41 ;82>>

<OBJECT TRINITY-HOUSE
	(LOC GLOBAL-OBJECTS ;GENERIC-OBJECTS)
	(DESC "Trinity House")
	(SYNONYM HOUSE TRINITY)	;"try it again as a syn."
	(ADJECTIVE TRINITY)
	(FLAGS ABSTRACTBIT SCOREBIT)
	(ACTION TRINITY-HOUSE-F)>

<ROUTINE TRINITY-HOUSE-F ()
	 <COND (<VERB? WHAT>
		<TELL
"Trinity House in London is where you learned piloting from your old
teacher, Alban Caradoc." CR>)>>

<OBJECT LATITUDE
	(LOC GENERIC-OBJECTS)
	(OWNER LIZARD)
	(DESC "latitude")
	(SYNONYM LATITUDE)>

<OBJECT LIZARD
	(LOC GENERIC-OBJECTS)
	(OWNER LIZARD)
	(DESC "The Lizard")
	(SYNONYM LIZARD)
	(FLAGS NOTHEBIT NOABIT SCOREBIT)
	(ACTION LIZARD-F)>

<ROUTINE LIZARD-F ()
	 <COND (<VERB? WHAT WHERE>
		<TELL
"The Lizard is the southernmost point of Cornwall, a major landmark
for pilots." CR>)>>

<OBJECT ROPE
	(LOC GENERIC-OBJECTS)
	(DESC "rope")
	(SYNONYM ROPE)
	(ACTION ROPE-F)
	(GENERIC GENERIC-ROPE-F)>

<ROUTINE ROPE-F ()
	 <COND (<VERB? FIND>
		<COND (<SCENE? ,S-VOYAGE>
		       <TELL
"You don't see any near at hand." CR>)>)>>

<ROUTINE GENERIC-ROPE-F (R F)
	 <COND (<GETP ,YABU-KIMONO ,P?COUNT>
		,YABU-KIMONO)
	       (ELSE ,ROPE)>>

;"Plural:
	 SEARCH-PARTY SAMURAI-GUARDS OMI-SAMURAI GUARDS
	 GLOBAL-SAMURAI BROWNS GRAYS TORANAGAS-GUARDS
  Singular:
	 OMI LOSING-SAMURAI"

<ROUTINE GENERIC-SAMURAI-F (R F "AUX" (CT <FIND-RES-COUNT .R>) OBJ
			    (V <REST-TO-SLOT .R FIND-RES-OBJ1>) (BEST <>))
 <COND (<G? .CT <FIND-RES-SIZE .R>> <RFALSE>)
       (<AND ,OPPONENT <INTBL? ,OPPONENT .V .CT>>
	<RETURN ,OPPONENT>)
       (<IN? ,LOSING-SAMURAI ,HERE> <RETURN ,LOSING-SAMURAI>)
       (<IN? ,OMI-SAMURAI ,LADDER> <RETURN ,OMI-SAMURAI>)
       (<SCENE? ,S-NINJA> <RETURN ,GUARDS>)>
 <REPEAT ()
	 <COND (<L? <SET CT <- .CT 1>> 0>
		<RETURN .BEST>)
	       (<ACCESSIBLE? <SET OBJ <ZGET .V 0>>>
		<COND (.BEST <RFALSE>)
		      (<FSET? .OBJ ,PLURAL> <SET BEST .OBJ>)>)
	       (T
		<SET V <ZREST .V 2>>)>>>

<OBJECT LG-SHIP
	(SCENE S-AFTERMATH)
	(LOC LOCAL-GLOBALS)
	(DESC "ship")
	(SYNONYM SHIP BOAT ERASMUS)
	(ADJECTIVE NEW ANOTHER)
	(FLAGS NDESCBIT)>

<OBJECT COURSE
	(LOC GLOBAL-OBJECTS)
	(DESC "course")
	(SYNONYM COURSE)
	(ACTION COURSE-F)>

<ROUTINE COURSE-F ()
	 <COND (<NOT <SCENE? ,S-ERASMUS ,S-VOYAGE>>
		<TELL "What course?" CR>)
	       (<VERB? EXAMINE READ>
		<COND (<SCENE? ,S-ERASMUS>
		       <REDIRECT ,COURSE ,COMPASS>
		       <RTRUE>)
		      (ELSE
		       <TELL
"It's hard to tell directions in this storm, but the galley's course
is toward ">
		       <COND (<EQUAL? ,SHIP-COURSE ,P?STARBOARD>
			      <TELL "the bay." CR>)
			     (ELSE <TELL "the open sea." CR>)>)>)
	       (<VERB? HOLD>
		<COND (<HERE? ,BRIDGE-OF-ERASMUS>
		       <PERFORM ,V?STRAIGHTEN ,WHEEL>
		       <RTRUE>)
		      (<HERE? ,GALLEY>
		       <PERFORM ,V?STRAIGHTEN ,GALLEY-WHEEL>
		       <RTRUE>)
		      (ELSE
		       <TELL
"You'd have to be on the ">
		       <COND (<SCENE? ,S-ERASMUS>
			      <TELL "bridge">)
			     (ELSE <TELL "quarterdeck">)>
		       <TELL " to do that." CR>)>)>>

<OBJECT GLOBAL-RUTTERS
	(LOC GENERIC-OBJECTS)
	(OWNER BLACKTHORNE)
	(DESC "rutters")
	(SYNONYM RUTTERS MAPS)>

<OBJECT QUEEN
	(LOC GENERIC-OBJECTS)
	(DESC "Queen Elizabeth")
	(SYNONYM QUEEN ELIZABETH)
	(ADJECTIVE QUEEN)>

<OBJECT WORLD
	(LOC GENERIC-OBJECTS)
	(DESC "world")
	(SYNONYM WORLD GLOBE EARTH MAP)>

<OBJECT VOYAGE
	(LOC GENERIC-OBJECTS)
	(DESC "voyage")
	(SYNONYM VOYAGE TRIP JOURNEY)>

<OBJECT TEKI
	(LOC GENERIC-OBJECTS)
	(DESC "teki")
	(SYNONYM TEKI)>

<OBJECT ETA
	(LOC GENERIC-OBJECTS)
	(DESC "eta")
	(SYNONYM ETA ETER ETERS)
	(FLAGS AN)
	(ACTION ETA-F)>

<ROUTINE ETA-F ()
	 <COND (<VERB? WHAT WHO>
		<TELL
"The "I"eta"" are the lowest class of society, those who are butchers and
tanners, executioners and undertakers." CR>)>>

<OBJECT ORDERS
	(LOC GLOBAL-OBJECTS)
	(DESC "request")
	(SYNONYM REQUEST ORDER ORDERS)
	(ACTION ORDERS-F)>

<ROUTINE ORDERS-F ()
	 <COND (<VERB? FOLLOW DO? COMMIT>
		<COND (<SCENE? ,S-PIT>
		       <COND (<AND ,ANSWER-HAI?
				   <FSET? ,CROOCQ ,SCOREBIT>>
			      <PERFORM ,V?LIE-DOWN>
			      <RTRUE>)>)
		      (<SCENE? ,S-TORANAGA>
		       <COND (<B-STANDING?>
			      <PERFORM ,V?KNEEL>
			      <RTRUE>)
			     (<AND <FSET? ,DAIS ,RMUNGBIT>
				   <FSET? ,DAIS ,SCOREBIT>>
			      <PERFORM ,V?WALK-TO ,ALVITO>
			      <RTRUE>)>)
		      (ELSE
		       <TELL "You'll have to be more specific." CR>)>)>>

<END-SEGMENT>
