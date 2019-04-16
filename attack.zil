"ATTACK for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT NINJA>

<OBJECT PISTOL
	(OWNER BLACKTHORNE)
	(DESC "pistol")
	(SYNONYM PISTOL GUN)
	(FLAGS TAKEBIT WEAPONBIT)
	(ACTION PISTOL-F)>

<ROUTINE PISTOL-F ()
	 <COND (<FSET? ,PISTOL ,NDESCBIT>
		<TELL
"You can't find your pistol anywhere!  It must have been blown out of
your grasp by the force of the explosion!" CR>)
	       (<VERB? EXAMINE>
		<TELL
"This is a">
		<COND (<FSET? ,PISTOL ,RMUNGBIT> <TELL "n unloaded">)
		      (ELSE <TELL " loaded">)>
		<TELL " pistol." CR>)
	       (<P? LOAD PISTOL (<> POWDER-HORN)>
		<COND (<NOT <HELD? ,POWDER-HORN>>
		       <TELL
"You don't have any powder!" CR>)
		      (<FSET? ,PISTOL ,RMUNGBIT>
		       <COND (<QUEUED? I-LOAD-PISTOL>
			      <TELL
"With all the speed you can, you work on loading the pistol." CR>)
			     (ELSE
			      <QUEUE I-LOAD-PISTOL -1>
			      <TELL
"You begin the laborious task of loading the pistol." CR>)>)
		      (ELSE
		       <TELL "It's already loaded." CR>)>)>>

<OBJECT POWDER-HORN
	(LOC BLACKTHORNE-QUARTERS)
	(DESC "powder horn")
	(SYNONYM HORN POWDER)
	(ADJECTIVE POWDER)
	(FLAGS TAKEBIT)
	(ACTION POWDER-HORN-F)>

<ROUTINE POWDER-HORN-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"There is plenty of powder in the horn." CR>)
	       (<P? PUT POWDER-HORN (TOP-CATCH BOTTOM-CATCH)>
		<TELL
"The powder won't stay on the catch." CR>)
	       (<P? PUT POWDER-HORN PISTOL>
		<PERFORM ,V?LOAD ,PISTOL>
		<RTRUE>)
	       (<OR <P? SHOOT PISTOL>
		    <P? EXPLODE * POWDER-HORN>>
		<TELL
"You would blow yourself up too!" CR>)>>

;<GLOBAL LOAD-PISTOL-CNT 0>

<ROUTINE I-LOAD-PISTOL ()
	 <ZLINES ,LOAD-PISTOL-CNT
		 (<TELL CR
"First the powder, tamping it carefully." CR>)
		 (<TELL CR
G"You continue loading the pistol.  Next"" the paper plug to hold the charge
tight." CR>)
		 (<TELL CR
G"You continue loading the pistol.  Next"" the lead ball and another
plug." CR>)
		 (<SETG LOAD-PISTOL-CNT 0>
		  <FCLEAR ,PISTOL ,RMUNGBIT>
		  <DEQUEUE I-LOAD-PISTOL>
		  <TELL CR
G"You continue loading the pistol.  Next"", blow the dust carefully away from
the flint.  Finished!" CR>)>>

<ROOM PRIVATE-QUARTERS
      (LOC ROOMS)
      (SCENE S-NINJA)
      (DESC "Mariko's Quarters")
      (OWNER MARIKO)
      (SYNONYM QUARTERS)
      (SCORE 6)
      (FDESC
"It is early in the morning of the day after Mariko's confrontation, two
or three hours before dawn.  After she woke, you and Mariko had an hour
alone together.  \"I still cannot believe that Ishido gave in,\" she
said.  \"I knew it was my karma to bring the hostages out of Osaka.  Only I could
do that for Lord Toranaga.  And now it's done.  But at what a cost, neh?
Madonna forgive me.\"|
|
Now you, Mariko, Kiri, Lady Etsu, and Achiko, the granddaughter of Kiyama, are
together in Mariko's quarters.  You are still suspicious enough of Ishido's
intentions to be carrying your pistol.")
      (AFTER ETSU-AFTER-F)
      (NORTH TO SECRET-REDOUBT IF SECRET-REDOUBT-DOOR IS OPEN)
      (IN TO SECRET-REDOUBT IF SECRET-REDOUBT-DOOR IS OPEN)
      (SOUTH TO OUTER-ROOM IF NORTH-SHOJI IS OPEN)
      (OUT TO OUTER-ROOM IF NORTH-SHOJI IS OPEN)
      (WEST TO PRIVATE-QUARTERS-2)
      (EAST TO BLACKTHORNE-QUARTERS)
      (GLOBAL NORTH-SHOJI SECRET-REDOUBT-DOOR LG-NINJA LG-WOMEN)
      (FLAGS ONBIT NOTHEBIT NOABIT)
      (ACTION PRIVATE-QUARTERS-F)>

<ROUTINE PRIVATE-QUARTERS-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<PUTP ,OUTER-CORRIDOR ,P?FDESC <>>
		<FCLEAR ,OUTER-CORRIDOR ,TOUCHBIT>
		<FCLEAR ,AUDIENCE-CHAMBER ,TOUCHBIT>
		<MOVE ,SWORDS ,BLACKTHORNE-QUARTERS>
		<MOVE ,PISTOL ,BLACKTHORNE>
		<MOVE ,MARIKO ,HERE>
		<FSET ,MARIKO ,SCOREBIT>
		<MOVE ,KIRITSUBO ,HERE>
		<MOVE ,GUARDS ,AUDIENCE-CHAMBER>
		<MOVE ,GRAY-CAPTAIN ,AUDIENCE-CHAMBER>
		<MOVE ,YABU ,OUTER-ROOM>
		<QUEUE I-CHIMMOKO 1>)
	       (<RARG? LOOK>
		<TELL
"These are Lady Mariko's private quarters.  Shojis screen a private room to
the west, your room to the east, and an outer room which leads to a
corridor on the south.">
		<COND (<NOT <FSET? ,SECRET-REDOUBT-DOOR ,INVISIBLE>>
		       <TELL
" On the north wall is the iron-bound door to Lord Toranaga's secret
room.">)>
		<CRLF>)
	       (<RARG? BEG>
		<COND (<AND <VERB? WALK>
			    <IN? ,NINJA ,HERE>
			    ,KNOCKOUT-CNT>
		       <TELL
G"You can't break through the encircling ninja!" CR>)
		      (<AND <P? WALK (P?SOUTH P?OUT)>
			    <IN? ,NINJA ,HERE>>
		       <TELL
G"You would have to walk right through the ninja!" CR>)
		      (<VERB? LEAVE>
		       <DO-WALK <COND (<FSET? ,SECRET-REDOUBT-DOOR ,OPENBIT>
				       ,P?NORTH)
				      (ELSE ,P?WEST)>>)>)
	       (<RARG? END>
		<COND (<AND <NOT ,MARIKO-PLAN?>
			    <FSET? ,OUTER-ROOM ,TOUCHBIT>
			    <FSET? ,YABU ,TOUCHBIT>
			    <IN? ,MARIKO ,HERE>
			    <IN? ,KIRITSUBO ,HERE>
			    <FSET? ,LG-NINJA ,INVISIBLE>>
		       <THIS-IS-IT ,YABU>
		       <SETG QCONTEXT ,MARIKO>
		       <SETG MARIKO-PLAN? T>
		       <TELL CR
"Kiri asks you a question which you don't understand.  Mariko translates for
her.  \"Did you ask Yabu about the 'plan'?\"" CR>)
		      (<AND ,NINJA-ATTACKING-CUL-DE-SAC?
			    <FSET? ,SECRET-REDOUBT-DOOR ,INVISIBLE>
			    <IN? ,BLACKTHORNE ,PRIVATE-QUARTERS>
			    <IN? ,KIRITSUBO ,PRIVATE-QUARTERS>>
		       <FCLEAR ,SECRET-REDOUBT-DOOR ,INVISIBLE>
		       <TELL CR
"Kiri pulls a section of shoji on the north wall aside, revealing a hidden
iron-fortified door set into the stone wall beyond.  The hinges are
well oiled.  \"This is my Master's secret haven,\" she pants." CR>)>)>>

<GLOBAL MARIKO-PLAN? <>>

<OBJECT PLAN
	(LOC GENERIC-OBJECTS)
	(DESC "plan")
	(SYNONYM PLAN)
	(ADJECTIVE SECRET)
	(FLAGS SCOREBIT)>

<OBJECT CHIMMOKO
	(LOC OUTER-ROOM)
	(OWNER MARIKO)
	(DESC "Chimmoko")
	(SYNONYM CHIMMOKO MAID)
	(FLAGS PERSON JAPANESEBIT FEMALE NOABIT NOTHEBIT)
	(ACTION CHIMMOKO-F)>

<ROUTINE CHIMMOKO-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<COND (<P? FIND ;WHERE (YABU LG-YABU)>
		       <COND (<IN? ,YABU ,OUTER-ROOM>
			      <TELL
"\"He is in the outer chamber, Anjin-san.\"" CR>)
			     (ELSE
			      <TELL
"\"I don't know, Anjin-san.  He was very angry.\"" CR>)>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<P? ASK-ABOUT CHIMMOKO>
		<COND (<SCENE? ,S-SEPPUKU>
		       <TELL
"\"Please go to my mistress, Anjin-san. This is no time for questions.\"" CR>)
		      (ELSE
		       <TELL
"She has nothing to say about " THE ,PRSI "." CR>)>)
	       (<VERB? WHO>
		<TELL "Chimmoko is one of Mariko's maids." CR>)>>

<ROUTINE I-CHIMMOKO ()
	 <COND (<IN? ,YABU ,OUTER-ROOM>
		<COND (<HERE? ,PRIVATE-QUARTERS ,PRIVATE-QUARTERS-2
			      ,BLACKTHORNE-QUARTERS>
		       <SETG YABU-CNT 0>
		       <QUEUE I-YABU -1>
		       <QUEUE I-YABU-LEAVES 4>
		       <MOVE ,CHIMMOKO ,HERE>
		       <TELL CR
"Chimmoko, Mariko's servant, enters and bows.  \"Lord Yabu wishes to
speak with the Anjin-san,\" she says.">
		       <COND (<NOT <HERE? <LOC ,YABU>>>
			      <TELL " \"He is waiting in the outer room.\"">)>
		       <CRLF>)
		      (ELSE
		       <QUEUE I-CHIMMOKO 1>)>)>>

<OBJECT ETSU
	(LOC PRIVATE-QUARTERS-2)
	(DESC "Lady Etsu")
	(SYNONYM LADY ETSU)
	(ADJECTIVE LADY OLD)
	(FLAGS PERSON JAPANESEBIT FEMALE NOABIT NOTHEBIT)
	(ACTION ETSU-F)>

<ROUTINE ETSU-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<VERB? STOP>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?HELP ,ETSU>
		       <RTRUE>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? WHO>
		<TELL "Lady Maeda Etsu is Lord Maeda's mother, an elderly
samurai of very high lineage." CR>)
	       (<VERB? EXAMINE>
		<TELL
"She is an elderly samurai and customarily leans painfully on her cane;
\"It's my joints, they get worse every day.\"  Her hair is white but her
back is straight." CR>)>>

<OBJECT ACHIKO
	(LOC PRIVATE-QUARTERS)
	(DESC "Achiko")
	(SYNONYM ACHIKO GIRL)
	(ADJECTIVE LADY YOUNG KIYAMA)
	(FLAGS PERSON JAPANESEBIT FEMALE NOABIT NOTHEBIT)
	(ACTION ACHIKO-F)>

<ROUTINE ACHIKO-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<RARG? SUBJ>
		<RFALSE>)
	       (<VERB? WHO>
		<TELL
"Kiyama Achiko is the granddaughter-in-law of Lord Kiyama." CR>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,DEAD>
		       <TELL
"Achiko's lifeless body is spawled on the floor." CR>)
		      (ELSE
		       <TELL
"She appears to be holding up well." CR>)>)>>

<ROUTINE I-WOMEN ("AUX" (NINJA? <NOT <IN? ,NINJA ,SECRET-ROOM>>))
	 <COND (<IN? ,ETSU ,BLACKTHORNE-QUARTERS>
		<CHOREOGRAPH ,PRIVATE-QUARTERS T>)
	       (<IN? ,ETSU ,PRIVATE-QUARTERS-2>
		<CHOREOGRAPH ,PRIVATE-QUARTERS T>)
	       (<IN? ,ETSU ,SECRET-REDOUBT>
		<COND (<AND .NINJA? <FSET? ,BALCONY-DOOR ,OPENBIT>>
		       <CHOREOGRAPH ,BALCONY>)>)
	       (<IN? ,ETSU ,PRIVATE-QUARTERS>
		<COND (.NINJA?
		       <COND (<FSET? ,SECRET-REDOUBT-DOOR ,OPENBIT>
			      <CHOREOGRAPH ,SECRET-REDOUBT>)
			     (ELSE <RFALSE>)>)
		      (ELSE
		       <FSET ,NORTH-SHOJI ,OPENBIT>
		       <CHOREOGRAPH ,OUTER-ROOM T>)>)
	       (<IN? ,ETSU ,OUTER-ROOM>
		<COND (.NINJA?
		       <FSET ,NORTH-SHOJI ,OPENBIT>
		       <CHOREOGRAPH ,PRIVATE-QUARTERS>)
		      (ELSE
		       <FSET ,SOUTH-SHOJI ,OPENBIT>
		       <CHOREOGRAPH ,INNER-CORRIDOR T>)>)
	       (<IN? ,ETSU ,INNER-CORRIDOR>
		<COND (.NINJA?
		       <FSET ,SOUTH-SHOJI ,OPENBIT>
		       <CHOREOGRAPH ,OUTER-ROOM>)
		      (<FSET? ,INNER-DOOR ,OPENBIT>
		       <CHOREOGRAPH ,AUDIENCE-CHAMBER T>)
		      (<HERE? ,INNER-CORRIDOR>
		       <TELL CR
"The women stop inside the door, listening intently." CR>)>)
	       (<IN? ,ETSU ,AUDIENCE-CHAMBER>
		<COND (.NINJA?
		       <COND (<FSET? ,INNER-DOOR ,OPENBIT>
			      <COND (<QUEUED? I-NINJA-COWED>
				     <CHOREOGRAPH ,INNER-CORRIDOR>)>)
			     (<QUEUED? I-NINJA-TAKE-MARIKO>
			      <TELL CR
"The women huddle in fear against the closed door." CR>)
			     (ELSE
			      <TELL CR
"Mariko pounds on the closed door as the rest of the women huddle
around her in fear.  \"Anjin-san!  Open the door!\"" CR>)>)>)>>

<ROUTINE CHOREOGRAPH (RM "OPT" (MARIKO? <>)
		      "AUX" (NINJA? <>) (ORM <LOC ,ETSU>))
	 <COND (<NOT <IN? ,NINJA ,SECRET-ROOM>>
		<SET NINJA? T>)>
	 <COND (<OR <QUEUED? I-NINJA-TAKE-MARIKO>
		    <QUEUED? I-MARIKO-FOLLOW>>
		<SET MARIKO? <>>)>
	 <MOVE ,CHIMMOKO .RM>
	 <MOVE ,ACHIKO .RM>
	 <MOVE ,ETSU .RM>
	 <MOVE ,KIRITSUBO .RM>
	 <COND (.MARIKO? <MOVE ,MARIKO .RM>)>
	 <COND (<EQUAL? .ORM ,HERE>
		<CRLF>
		<COND (.MARIKO? <TELL
"Mariko and the other">)
		      (ELSE <TELL
"The">)>
		<TELL " women">
		<COND (.NINJA?
		       <COND (<IN? ,MARIKO ,HERE>
			      <TELL ", save Mariko,">)>
		       <TELL " flee">)
		      (ELSE
		       <TELL
", treading a narrow path between fear and curiosity, leave">)>
		<TELL " the room and crowd into " THE .RM "." CR>)
	       (<EQUAL? .RM ,HERE>
		<CRLF>
		<COND (.NINJA?
		       <COND (.MARIKO?
			      <TELL
"Mariko and the rest of the">)
			     (ELSE
			      <TELL
"The">)>
		       <TELL
" women pour out of " THE .ORM ", fleeing the ninja." CR>)
		      (ELSE
		       <COND (.MARIKO?
			      <TELL "Mariko ">
			      <COND (,STATIONARY? <TELL "comes from ">)
				    (ELSE <TELL "follows you into ">)>
			      <TELL
THE .ORM " into the room.  The rest of the women follow her,">)
			     (ELSE
			      <TELL "The women ">
			      <COND (,STATIONARY? <TELL "come">)
				    (ELSE <TELL "follow you">)>
			      <TELL " into the room,">)>
		       <TELL
" curious about the commotion, but huddled together in some fear." CR>)>)
	       (<NEXT-ROOM? .RM T>
		<TELL CR
"The women">
		<COND (.NINJA?
		       <TELL ", fleeing the ninja, pour">)
		      (ELSE
		       <TELL " come">)>
		<TELL " into " THE .RM "." CR>)>>

<ROUTINE I-MARIKO-FOLLOW ()
	 <COND (<NOT <IN? ,MARIKO ,HERE>>
		<COND (,CAPTURE-CNT
		       <COND (<NEXT-ROOM? <LOC ,MARIKO>>
			      <TELL CR
"In the next room, you can hear Mariko struggling vainly to break free
of the encircling ninja.  \"Anjin-san!\" she calls." CR>)
			     (ELSE
			      <TELL CR
"You can dimly hear Mariko calling for help." CR>)>)
		      (ELSE
		       <MOVE ,MARIKO ,HERE>
		       <COND (<HERE? ,SECRET-REDOUBT>
			      <DEQUEUE I-MARIKO-FOLLOW>)>
		       <TELL CR
"Mariko follows ">
		       <COND (<OR <SCENE? ,S-NINJA ,S-ESCAPE>
				  <PROB 50>>
			      <TELL
"quickly after you." CR>)
			     (ELSE
			      <TELL
"a pace behind, as is the custom." CR>)>)>)>>

<ROOM PRIVATE-QUARTERS-2
      (LOC ROOMS)
      (SCENE S-NINJA)
      (DESC "Private Quarters")
      (ADJECTIVE PRIVATE)
      (SYNONYM QUARTERS)
      (LDESC
"This is a smaller room, part of Mariko's quarters.  The Lady Etsu has
been staying here.")
      (EAST TO PRIVATE-QUARTERS)
      (FLAGS ONBIT)
      (GLOBAL LG-NINJA LG-WOMEN)>

<ROOM BLACKTHORNE-QUARTERS
      (LOC ROOMS)
      (SCENE S-NINJA)
      (DESC "Your Quarters")
      (OWNER BLACKTHORNE)
      (SYNONYM QUARTERS ROOM)
      (ADJECTIVE SMALL)
      (LDESC
"This is a small room in which you are quartered.")
      (WEST TO PRIVATE-QUARTERS)
      (OUT TO PRIVATE-QUARTERS)
      (FLAGS ONBIT)
      (GLOBAL LG-NINJA LG-WOMEN)>

<OBJECT SWORDS
	(OWNER BLACKTHORNE)
	(DESC "swords")
	(SYNONYM SWORDS SWORD SELLER)
	(ADJECTIVE PAIR KILLING STABBING OIL LONG SHORT)
	(FLAGS TAKEBIT WEARABLE WEAPONBIT NOABIT SCOREBIT PLURAL)
	(GENERIC GENERIC-SWORD-F)
	(ACTION SWORDS-F)>

<ROUTINE SWORDS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,SWORDS ,RMUNGBIT>
		       <FCLEAR ,SWORDS ,RMUNGBIT>
		       <FSET ,SWORDS ,SCOREBIT>
		       <SCORE-OBJECT ,SWORDS>
		       <TELL
"You quickly check your sword belt.  It's loose, almost ready to fall
off!  What a stroke of luck you checked it!  How embarrassing if it had
fallen off!" CR>)
		      (ELSE
		       <TELL
"You have a pair of samurai swords, one the long killing sword">
		       <COND (<G? ,SCENE ,S-QUAKE>
			      <TELL
" named 'Oil Seller'">)>
		       <TELL ", and
the other the shorter stabbing sword." CR>)>)
	       (<AND <VERB? WHO WHAT>
		     <NOUN-USED? ,PRSO ,W?SELLER>>
		<TELL
"The name comes from an experience you would rather forget.  One day
hunting with Toranaga, your path had been blocked by a weather-beaten
old oil
seller.  Cursing, you commanded him to move, and he cursed you
back.  Toranaga pointed to one of his bodyguards, asked you to give him
your sword, and before you realized what was happening, the samurai
lunged at the peddler.  He walked on a pace before falling, divided
in two at the waist.  Toranaga suggested you call your sword 'Oil
Seller' in honor of the incident.  \"Your sword has now become legend.\"" CR>)
	       (<VERB? WEAR>
		<COND (<NOT <FSET? ,PRSO ,WEARBIT>>
		       <FSET ,PRSO ,WEARBIT>
		       <TELL
"You shove the sword into your sash." CR>)
		      (ELSE
		       <TELL "The sword is already in your sash." CR>)>)
	       (<AND <VERB? TAKE>
		     <NOT <HELD? ,PRSO>>>
		<COND (<EQUAL? <ITAKE> T>
		       <FSET ,SWORDS ,WEARBIT>
		       <TELL
"You take the sword and shove it into your sash." CR>)
		      (ELSE <RTRUE>)>)
	       (<OR <AND <VERB? DRAW PICK USE TAKE>
			 <HELD? ,PRSO>>
		    <P? PUT * HANDS>>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <FCLEAR ,PRSO ,WEARBIT>
		       <TELL
"Your skill with the sword is not great, but you are now as ready as
you will ever be!" CR>)
		      (ELSE
		       <TELL "You've already drawn your sword." CR>)>)>>

<ROOM SECRET-REDOUBT
      (LOC ROOMS)
      (SCENE S-NINJA)
      (DESC "Secret Redoubt")
      (SYNONYM REDOUBT BOLTHOLE HOLE HAVEN)
      (ADJECTIVE SECRET BOLT)
      (SOUTH TO PRIVATE-QUARTERS IF SECRET-REDOUBT-DOOR IS OPEN)
      (NORTH TO BALCONY IF BALCONY-DOOR IS OPEN)
      (OUT TO BALCONY IF BALCONY-DOOR IS OPEN)
      (GLOBAL SECRET-REDOUBT-DOOR BALCONY-DOOR LG-NINJA LG-WOMEN)
      (FLAGS ONBIT)
      (ACTION SECRET-REDOUBT-F)>

<ROUTINE SECRET-REDOUBT-F (RARG "AUX" (CNT <GETP ,BOLTS ,P?COUNT>))
	 <COND (<RARG? LOOK>
		<TELL
"This is Lord Toranaga's secret bolt hole.  ">
		<COND (<IN? ,SECRET-REDOUBT-DOOR ,LOCAL-GLOBALS>
		       <TELL "An iron-bound
door, well-oiled and well-maintained, is on the south wall.  There
are three iron bolts on the door, ">
		       <BOLT-STATE .CNT>
		       <TELL ".  ">)
		      (ELSE
		       <TELL
"There is an explosion-scarred hole on the south wall.  ">)>
		<TELL "On the
north wall is the door to the balcony, its bolts rusty and not so
well-maintained." CR>)
	       (<RARG? BEG>
		<COND (<AND <VERB? WALK>
			    <IN? ,NINJA ,HERE>
			    ,KNOCKOUT-CNT>
		       <TELL
G"You can't break through the encircling ninja!" CR>)
		      (<AND <P? WALK P?SOUTH>
			    <IN? ,NINJA ,HERE>>
		       <TELL
G"You would have to walk right through the ninja!" CR>)>)>>

<ROUTINE BOLT-STATE (CNT)
	 <COND (<ZERO? .CNT>
		<TELL "and they are all shut">)
	       (<EQUAL? .CNT 1 2 4>
		<TELL "but one of them is open">)
	       (<EQUAL? .CNT 3 5 6>
		<TELL "but two are currently open">)
	       (ELSE
		<TELL "but none of them are latched now">)>>

<ROUTINE BOLTS-REMAINING (CNT)
	 <TELL "">
	 <COND (<EQUAL? .CNT 7>
		<TELL "All the bolts are now open." CR>)
	       (<EQUAL? .CNT 3 5 6>
		<TELL "Two bolts are open." CR>)
	       (<EQUAL? .CNT 1 2 4>
		<TELL "One bolt is open." CR>)
	       (<ZERO? .CNT>
		<TELL "All the bolts are now closed." CR>)>>

<OBJECT BOLTS
	(LOC SECRET-REDOUBT)
	(DESC "bolt")
	(SYNONYM BOLT BOLTS)
	(ADJECTIVE IRON FIRST SECOND THIRD)
	(FLAGS NDESCBIT OPENBIT OPENABLE)
	(COUNT 7) ;"bit on means bolt open"
	(ACTION BOLTS-F)>

<ROUTINE BOLTS-F ("AUX" (CNT <GETP ,BOLTS ,P?COUNT>))
	 <COND (<VERB? EXAMINE>
		<TELL
"There are three iron bolts to hold the door securely closed, ">
		<BOLT-STATE .CNT>
		<TELL "." CR>)
	       (<VERB? OPEN UNLOCK>
		<COND (<ADJ-USED? ,PRSO ,W?FIRST>
		       <COND (<ZERO? <BAND .CNT 1>>
			      <SET CNT <BOR .CNT 1>>
			      <TELL G"You open the first bolt.">)
			     (ELSE
			      <TELL "The first bolt is already open.">)>)
		      (<ADJ-USED? ,PRSO ,W?SECOND>
		       <COND (<ZERO? <BAND .CNT 2>>
			      <SET CNT <BOR .CNT 2>>
			      <TELL G"You open the second bolt.">)
			     (ELSE
			      <TELL "The second bolt is already open.">)>)
		      (<ADJ-USED? ,PRSO ,W?THIRD>
		       <COND (<ZERO? <BAND .CNT 4>>
			      <SET CNT <BOR .CNT 4>>
			      <TELL G"You open the third bolt.">)
			     (ELSE
			      <TELL "The third bolt is already open.">)>)
		      (ELSE
		       <COND (<ZERO? <BAND .CNT 1>>
			      <SET CNT <BOR .CNT 1>>
			      <TELL G"You open the first bolt.">)
			     (<ZERO? <BAND .CNT 2>>
			      <SET CNT <BOR .CNT 2>>
			      <TELL G"You open the second bolt.">)
			     (<ZERO? <BAND .CNT 4>>
			      <SET CNT <BOR .CNT 4>>
			      <TELL G"You open the third bolt.">)
			     (ELSE
			      <TELL "All the bolts are open already." CR>
			      <RTRUE>)>)>
		<COND (<NOT <ZERO? .CNT>>
		       <FCLEAR ,SECRET-REDOUBT-DOOR ,LOCKED>)>
		<PUTP ,BOLTS ,P?COUNT .CNT>
		<BOLTS-REMAINING .CNT>
		<RTRUE>)
	       (<VERB? CLOSE LOCK>
		<COND (<FSET? ,SECRET-REDOUBT-DOOR ,OPENBIT>
		       <TELL
"The door isn't closed, so there's no point in locking the bolts!" CR>)
		      (<ADJ-USED? ,PRSO ,W?FIRST>
		       <COND (<NOT <ZERO? <BAND .CNT 1>>>
			      <SET CNT <BAND .CNT 6>>
			      <TELL G"You close the first bolt.">)
			     (ELSE
			      <TELL "The first bolt is already closed.">)>)
		      (<ADJ-USED? ,PRSO ,W?SECOND>
		       <COND (<NOT <ZERO? <BAND .CNT 2>>>
			      <SET CNT <BAND .CNT 5>>
			      <TELL G"You close the second bolt.">)
			     (ELSE
			      <TELL "The second bolt is already closed.">)>)
		      (<ADJ-USED? ,PRSO ,W?THIRD>
		       <COND (<NOT <ZERO? <BAND .CNT 4>>>
			      <SET CNT <BAND .CNT 3>>
			      <TELL G"You close the third bolt.">)
			     (ELSE
			      <TELL "The third bolt is already closed.">)>)
		      (ELSE
		       <COND (<NOT <ZERO? <BAND .CNT 1>>>
			      <SET CNT <BAND .CNT 6>>
			      <TELL G"You close the first bolt.">)
			     (<NOT <ZERO? <BAND .CNT 2>>>
			      <SET CNT <BAND .CNT 5>>
			      <TELL G"You close the second bolt.">)
			     (<NOT <ZERO? <BAND .CNT 4>>>
			      <SET CNT <BAND .CNT 3>>
			      <TELL G"You close the third bolt.">)
			     (ELSE
			      <TELL "All the bolts are closed already." CR>
			      <RTRUE>)>)>
		<COND (<ZERO? .CNT>
		       <FSET ,SECRET-REDOUBT-DOOR ,LOCKED>)>
		<PUTP ,BOLTS ,P?COUNT .CNT>
		<BOLTS-REMAINING .CNT>
		<RTRUE>)>>

<OBJECT SECRET-REDOUBT-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "secret door")
	(LDESC "The iron-bound door lies shattered in a corner.")
	(SYNONYM DOOR)
	(ADJECTIVE SECRET HIDDEN IRON-FORTIFIED IRON)
	(FLAGS INVISIBLE DOORBIT LOCKABLE)
	(ACTION SECRET-REDOUBT-DOOR-F)>

<ROUTINE SECRET-REDOUBT-DOOR-F ("AUX" (CNT <GETP ,BOLTS ,P?COUNT>))
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a heavy, iron-bound door.  It looks very strong.">
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL
" The door is open now.">)>
		<COND (<HERE? ,SECRET-REDOUBT>
		       <TELL
" There are three iron bolts to secure the door, ">
		       <BOLT-STATE .CNT>
		       <TELL "." CR>)>
		<CRLF>)
	       (<VERB? OPEN>
		<COND (<EQUAL? .CNT 7> <RFALSE>)
		      (ELSE <TELL "The door is still bolted." CR>)>)
	       (<VERB? LOCK>
		<PERFORM ,V?CLOSE ,BOLTS>
		<RTRUE>)
	       (<VERB? UNLOCK>
		<PERFORM ,V?OPEN ,BOLTS>
		<RTRUE>)>>

<OBJECT BALCONY-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "balcony door")
	(SYNONYM DOOR)
	(ADJECTIVE BALCONY)
	(FLAGS DOORBIT LOCKABLE TRYTAKEBIT)
	(ACTION BALCONY-DOOR-F)>

<ROUTINE BALCONY-DOOR-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This strong, iron-bound door has rarely been used.  The catches
are rusty and the door itself is covered with cobwebs.  Unfortunately,
it appears to be the only other exit from the room." CR>)
	       (<VERB? OPEN>
		<COND (<OR <NOT <FSET? ,TOP-CATCH ,OPENBIT>>
			   <NOT <FSET? ,BOTTOM-CATCH ,OPENBIT>>>
		       <TELL
"The door won't open.  The rusty ">
		       <COND (<FSET? ,TOP-CATCH ,OPENBIT>
			      <TELL
"bottom catch holds">)
			     (<FSET? ,BOTTOM-CATCH ,OPENBIT>
			      <TELL
"top catch holds">)
			     (ELSE
			      <TELL
"top and bottom catches hold">)>
		       <TELL " it securely closed." CR>)
		      (<AND <HERE? ,SECRET-REDOUBT>
			    <OR <QUEUED? I-NINJA-VS-SECRET-DOOR>
				<QUEUED? I-NINJA-TAKE-MARIKO>>>
		       <FSET ,PRSO ,OPENBIT>
		       <TELL
"You throw the door open.  Sweet night air rushes in">
		       <COND (<IN? ,ETSU ,SECRET-REDOUBT>
			      <MOVE ,ETSU ,BALCONY>
			      <MOVE ,ACHIKO ,BALCONY>
			      <MOVE ,CHIMMOKO ,BALCONY>
			      <MOVE ,KIRITSUBO ,BALCONY>
			      <TELL
", and the women
pour onto the veranda.  Old Lady Etsu stumbles and you help her
through, then turn to help Mariko." CR>)
			     (ELSE <TELL "." CR>)>)>)
	       (<VERB? LOCK UNLOCK>
		<TELL "There's no lock, only a top and bottom catch." CR>)
	       (<HOSTILE-VERB?>
		<COND (<NOT <FSET? ,TOP-CATCH ,OPENBIT>>
		       <REDIRECT ,BALCONY-DOOR ,TOP-CATCH>)
		      (<NOT <FSET? ,TOP-CATCH ,OPENBIT>>
		       <REDIRECT ,BALCONY-DOOR ,BOTTOM-CATCH>)
		      (ELSE
		       <PERFORM ,V?OPEN ,BALCONY-DOOR>)>
		<RTRUE>)>>

<NEW-ADD-WORD "CATCHES" NOUN <VOC "CATCH"> ,PLURAL-FLAG>

<OBJECT TOP-CATCH
	(LOC SECRET-REDOUBT)
	(DESC "top catch")
	(SYNONYM CATCH ;CATCHES)
	(ADJECTIVE UPPER TOP RUSTY IRON)
	(FLAGS NDESCBIT OPENABLE LOCKED)
	(ACTION CATCH-F)>

<OBJECT BOTTOM-CATCH
	(LOC SECRET-REDOUBT)
	(DESC "bottom catch")
	(SYNONYM CATCH ;CATCHES)
	(ADJECTIVE LOWER BOTTOM RUSTY IRON)
	(FLAGS NDESCBIT OPENABLE LOCKED)
	(ACTION CATCH-F)>

<ROUTINE CATCH-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL CTHE ,PRSO " is open." CR>)
		      (<NOT <FSET? ,PRSO ,LOCKED>>
		       <TELL CTHE ,PRSO " is closed." CR>)
		      (<FSET? ,PRSO ,RMUNGBIT>
		       <TELL "It looks a little looser than before." CR>)
		      (ELSE
		       <TELL
"This rusty iron catch hasn't been used in years, but it still looks
strong." CR>)>)
	       (<VERB? OPEN>
		<COND (<FSET? ,PRSO ,LOCKED>
		       <TELL
"The catches are very rusty and won't open." CR>)>)
	       (<AND <VERB? SHOOT>
		     <NOT <FSET? ,PISTOL ,RMUNGBIT>>>
		<FSET ,PISTOL ,RMUNGBIT>
		<TELL
"The pistol goes off, but it doesn't appear to have
done anything to " THE ,PRSI "." CR>)
	       (<AND <HOSTILE-VERB?>
		     <NOT <FSET? ,PRSO ,OPENBIT>>>
		<COND (<NOT <FSET? ,PRSO ,RMUNGBIT>>
		       <FSET ,PRSO ,RMUNGBIT>
		       <TELL
"You pound on " THE ,PRSO " with all your might, small flakes of rust
falling like snow, but it only gives a little." CR>)
		      (ELSE
		       <FSET ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,LOCKED>
		       <TELL
"You smash again and again, and finally " THE ,PRSO " clatters open." CR>)>)
	       (<AND <VERB? CLOSE>
		     <FSET? ,PRSO ,OPENBIT>>
		<FCLEAR ,PRSO ,OPENBIT>
		<TELL
"The catch slides closed with a rusty squeal">
		<COND (<FSET? ,BALCONY-DOOR ,OPENBIT>
		       <TELL
", but " THE ,BALCONY-DOOR " is still open">)>
		<TELL "." CR>)>>

<ROOM BALCONY
      (LOC ROOMS)
      (DESC "Balcony")
      (SYNONYM BALCONY)
      (LDESC
"This is a small balcony surrounded by a low battlement.  The night air
is cool and sweet here after the smoke and confusion inside.  The only
exit is back into the redoubt.  This is as far as you can retreat.")
      (IN TO SECRET-REDOUBT IF BALCONY-DOOR IS OPEN)
      (SOUTH TO SECRET-REDOUBT IF BALCONY-DOOR IS OPEN)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL BALCONY-DOOR LG-NINJA LG-WOMEN)
      (ACTION BALCONY-F)>

<ROUTINE BALCONY-F ("OPT" (RARG <>))
	 <COND (<RARG? BEG>
		<COND (<AND <VERB? WALK>
			    <IN? ,NINJA ,HERE>
			    ,KNOCKOUT-CNT>
		       <TELL
G"You can't break through the encircling ninja!" CR>)
		      (<AND <P? WALK (P?SOUTH P?IN)>
			    <IN? ,NINJA ,HERE>>
		       <TELL
G"You would have to walk right through the ninja!" CR>)
		      (<P? (LEAP DIVE) (BALCONY GLOBAL-HERE)>
		       <COND (<JIGS-UP? ,J-PLUNGE>
			      <JIGS-UP "You plunge to your death.">)
			     (ELSE <RTRUE>)>)>)>>

<OBJECT NORTH-SHOJI
	(LOC LOCAL-GLOBALS)
	(DESC "inner shoji")
	(SYNONYM SHOJI DOOR)
	(ADJECTIVE INNER)
	(FLAGS DOORBIT)>

<OBJECT SOUTH-SHOJI
	(LOC LOCAL-GLOBALS)
	(DESC "outer shoji")
	(SYNONYM SHOJI DOOR)
	(ADJECTIVE OUTER)
	(FLAGS DOORBIT)>

<ROOM OUTER-ROOM
      (LOC ROOMS)
      (DESC "Outer Room")
      (SYNONYM ROOM)
      (ADJECTIVE OUTER)
      (LDESC
"This is a waiting room outside Mariko's quarters.  There are shoji
screens all around.  One opens north to the private rooms, and one
south to the inner corridor.")
      (NORTH TO PRIVATE-QUARTERS IF NORTH-SHOJI IS OPEN)
      (IN TO PRIVATE-QUARTERS IF NORTH-SHOJI IS OPEN)
      (OUT TO INNER-CORRIDOR IF SOUTH-SHOJI IS OPEN)
      (SOUTH TO INNER-CORRIDOR IF SOUTH-SHOJI IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL LG-NINJA NORTH-SHOJI SOUTH-SHOJI LG-WOMEN)
      (ACTION OUTER-ROOM-F)>

<ROUTINE OUTER-ROOM-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<VERB? LEAVE>
		       <DO-WALK ,P?NORTH>)
		      (<VERB? WALK>
		       <COND (<IN? ,YABU ,HERE>
			      <TELL
"\"Please, Anjin-san, don't leave until I am done.\"" CR>)
			     (<IN? ,NINJA ,HERE>
			      <COND (,KNOCKOUT-CNT
				     <TELL
G"You can't break through the encircling ninja!" CR>)
				    (<PRSO? P?SOUTH P?OUT>
				     <TELL
G"You would have to walk right through the ninja!" CR>)>)>)>)
	       (<RARG? ENTER>
		<COND (<IN? ,YABU ,HERE>
		       <FSET ,YABU ,TOUCHBIT>
		       <DEQUEUE I-YABU-LEAVES>
		       <SETG YABU-CNT 0>
		       <QUEUE I-YABU -1>
		       <TELL
"As you enter, you see Yabu waiting impatiently.  Beyond him you see
a guard watching curiously." CR CR>)>)>>

<ROUTINE I-YABU-LEAVES ()
	 <COND (<L? ,YABU-CNT 3>
		<SETG YABU-CNT 3>)>
	 <MOVE ,YABU ,INNER-CORRIDOR>
	 <MOVE ,CHIMMOKO ,HERE>
	 <TELL CR
"Mariko's servant Chimmoko approaches you, very agitated.  \"Anjin-san,
Lord Yabu has left!  He was very disturbed!\"" CR>>

<GLOBAL FOLLOW-FLAG <>>

<ROUTINE SETUP-FOLLOW-YABU ()
	 <COND (<AND <QUEUED? I-YABU>
		     <NOT <EQUAL? ,FOLLOW-FLAG ,YABU>>>
		<SETG FOLLOW-FLAG ,YABU>
		<DEQUEUE I-YABU>
		<QUEUE I-FOLLOW-YABU -1>
		<QUEUE I-YABU -1>)>>

<ROUTINE I-FOLLOW-YABU ("AUX" (L <LOC ,YABU>))
	 <COND (,FOLLOW-FLAG
		<COND (<AND <NOT <HERE? .L>>
			    <NOT <NEXT-ROOM? .L>>>
		       <SETG FOLLOW-FLAG <>>
		       <DEQUEUE I-FOLLOW-YABU>
		       <TELL CR
"You seem to have lost Yabu!  He's gotten too far ahead of you." CR>)>)
	       (ELSE
		<DEQUEUE I-FOLLOW-YABU>
		<RFALSE>)>>

<GLOBAL YABU-BETRAYED? <>>

<ROUTINE I-YABU ()
	 <THIS-IS-IT ,YABU>
	 <ZLINES ,YABU-CNT
		 (DELAY
		  <COND (<AND <IN? ,YABU ,OUTER-ROOM>
			      <NOT <IN? ,PLAYER ,OUTER-ROOM>>>
			 <RFALSE>)>)
		 (;1
		  <COND (<IN? ,YABU ,HERE>
			 <SETG QCONTEXT ,YABU>
			 <TELL CR
"\"So sorry to disturb you, Anjin-san.  I just want see -- make sure
all right, understand?  Lady Toda all right?  Not sick?\"  Yabu seems
nervous.  You are reminded that this afternoon Yabu said something
about a \"plan.\"" CR>)>)
		 (;2
		  <COND (<IN? ,YABU ,HERE>
			 <SETG QCONTEXT ,YABU>
			 <TELL CR
"Yabu says, trying to keep his words simple so you will understand,
\"Just want make sure all right.  Understand?\"" CR>)>)
		 (;3
		  <MOVE ,YABU ,INNER-CORRIDOR>
		  <SETG QCONTEXT <>>
		  <COND (<HERE? ,OUTER-ROOM>
			 <TELL CR
"Yabu bows, very friendly, and leaves.  His manner seems very
suspicious.  The guard closes the shoji behind him." CR>)>)
		 (DELAY
		  <COND (<HERE? ,INNER-CORRIDOR>)
			(<L? ,DELAY-CNT 2>
			 <RFALSE>)>)
		 (;4
		  <MOVE ,YABU ,AUDIENCE-CHAMBER>
		  <COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"Yabu walks through the audience chamber, checking that the guards are
alert." CR>)>)
		 (DELAY
		  <COND (<HERE? ,AUDIENCE-CHAMBER>)
			(<AND <NOT <HERE? ,INNER-CORRIDOR ,AUDIENCE-CHAMBER>>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<MOVE ,YABU ,OUTER-CORRIDOR>
		  <COND (<HERE? ,AUDIENCE-CHAMBER>
			 <TELL CR
"Yabu leaves the audience chamber for the outer corridor, heading for
the main stairway." CR>)>)
		 (DELAY
		  <COND (<HERE? ,OUTER-CORRIDOR>)
			(<AND <NOT <HERE? ,AUDIENCE-CHAMBER ,OUTER-CORRIDOR>>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<MOVE ,YABU ,STAIRS>
		  <COND (<HERE? ,OUTER-CORRIDOR>
			 <TELL CR
"Yabu goes down the stairs." CR>)>)
		 (DELAY
		  <COND (<HERE? ,STAIRS>)
			(<AND <NOT <HERE? ,OUTER-CORRIDOR ,STAIRS>>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<MOVE ,YABU ,SERVANTS-QUARTERS>
		  <COND (<HERE? ,STAIRS>
			 <TELL CR
"Yabu goes down the steps and enters the servants' quarters.  The servants
drag themselves out of sleep and put their heads to the flagstones." CR>)>)
		 (DELAY
		  <COND (<HERE? ,SERVANTS-QUARTERS>)
			(<AND <NOT <HERE? ,STAIRS ,SERVANTS-QUARTERS>>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<MOVE ,YABU ,CELLARS>
		  <COND (<HERE? ,SERVANTS-QUARTERS>
			 <TELL CR
"Yabu leads the way deeper into the bowels of the fortress, down steps,
along little-used corridors.  There are no guards here." CR>)>)
		 (DELAY
		  <COND (<HERE? ,CELLARS>)
			(<AND <NOT <HERE? ,SERVANTS-QUARTERS ,CELLARS>>
			      <L? ,DELAY-CNT 2>>
			 <RFALSE>)>)
		 (<COND (<HERE? ,CELLARS>
			 <TELL CR
"Yabu stands in the middle of a large cellar room.  He seems to be
composing himself, glancing nervously ahead." CR>)>)
		 (<MOVE ,NINJA ,CELLARS>
		  <FSET ,CELLAR-DOOR ,OPENBIT>
		  <COND (<HERE? ,CELLARS>
			 <TELL CR
"Yabu rushes for a hardly noticed, heavily barred, small iron door.  He
fights back the rusted bolts.  A draught of cool air from outside, then
a spear stabs for his throat and stops just in time.  Sinister black shapes
stare in from the darkness beyond the door.|
|
\"I'm Kasigi Yabu,\" he says, and makes a sign with his hands.  Instantly
twenty black-clad men pour out of the dark
and rush for a long-forgotten back way to the floors above.  Yabu watches
them intently, sweat beading on his brow." CR>
			 <SCORE-OBJECT ,CELLARS>)
			(ELSE
			 <FCLEAR ,CELLARS ,SCOREBIT>)>
		  <SETG FOLLOW-FLAG <>>
		  <RTRUE>)
		 (<COND (<AND <HERE? ,CELLARS>
			      <FSET? ,BARRELS ,SCOREBIT>>
			 <CRLF>
			 <JIGS-UP
"One of the ninja notices you lurking in the dark, and quickly and
quietly you are surrounded, overpowered, and killed.">
			 <RFATAL>)>
		  <MOVE ,YABU ,GENERIC-OBJECTS>
		  <MOVE ,NINJA ,SECRET-ROOM>
		  <FCLEAR ,CELLAR-DOOR ,OPENBIT>
		  <SETG YABU-BETRAYED? T>
		  <COND (<HERE? ,CELLARS>
			 <SETG FOLLOW-FLAG <>>
			 <TELL CR
"Yabu nervously watches more "I"ninja"" pour into the cellar.  As soon
as they are gone, he closes the door and slips away.|
|
As quickly and quietly as possible you return to the living quarters,
fearing that anyone you encounter may be in on the plot." CR CR>
			 <GOTO ,OUTER-ROOM>)>
		  <RTRUE>)
		 (<DEQUEUE I-YABU>
		  <QUEUE I-ATTACK -1>
		  <RFALSE>)>>

<ROOM STAIRS
      (LOC ROOMS)
      (DESC "Winding Stairs")
      (SYNONYM STAIRS)
      (ADJECTIVE WINDING)
      (LDESC
"This is the main staircase leading from the tower to the cellars of Toranaga's
keep at Osaka.")
      (UP TO OUTER-CORRIDOR)
      (DOWN TO SERVANTS-QUARTERS)
      (FLAGS ONBIT)
      (ACTION STAIRS-F)>

<ROUTINE STAIRS-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<AND <P? WALK P?DOWN>
			    <IN? ,YABU ,HERE>>
		       <YABU-LISTENS>)>)>>

<ROOM SERVANTS-QUARTERS
      (LOC ROOMS)
      (SCENE S-NINJA)
      (DESC "Servants' Quarters")
      (SYNONYM QUARTERS)
      (ADJECTIVE SERVANTS)
      (LDESC
"This is a crowded, narrow room full of servants.  Many of them are
asleep.  Others are kneeling, head to flagstones.  A stairway leads
down to the cellars from here.")
      (UP TO STAIRS)
      (DOWN TO CELLARS)
      (FLAGS ONBIT)
      (ACTION SERVANTS-QUARTERS-F)>

<ROUTINE SERVANTS-QUARTERS-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<AND <P? WALK P?DOWN>
			    <IN? ,YABU ,HERE>>
		       <YABU-LISTENS>)>)>>

<OBJECT SERVANTS
	(LOC SERVANTS-QUARTERS)
	(DESC "servants")
	(SYNONYM SERVANTS SERVANT)
	(FLAGS NDESCBIT PERSON JAPANESEBIT PLURAL OPENBIT CONTBIT SEARCHBIT)
	(ACTION SERVANTS-F)>

<ROUTINE SERVANTS-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL "They seem afraid to respond." CR>
		<END-QUOTE>)
	       (<VERB? EXAMINE>
		<TELL
"Those that are not asleep are prostrate on the stone floor,
bowing abjectly and pretending not to exist." CR>)
	       (<VERB? WAKE>
		<TELL
"You would only call even more attention to yourself.  Yabu might hear." CR>)>>

<ROOM CELLARS
      (LOC ROOMS)
      (DESC "Cellars")
      (SYNONYM CELLAR CELLARS)
      (UP TO SERVANTS-QUARTERS)
      (GLOBAL CELLAR-DOOR)
      (FLAGS ONBIT SCOREBIT)
      (ACTION CELLARS-F)>

<ROUTINE CELLARS-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"These are the cellars of the fortress.  The stone walls are damp and
mildewed, though well-lit.  Crates, boxes and barrels are everywhere.">
		<COND (,YABU-BETRAYED?
		       <TELL
" An ">
		       <COND (<FSET? ,CELLAR-DOOR ,OPENBIT>
			      <TELL "open ">)>
		       <TELL "iron-bound door is set in the east wall.">)>
		<CRLF>)
	       (<RARG? ENTER>
		<COND (,YABU-BETRAYED?
		       <TELL
"As you make your way down into the cellars, wondering where Yabu has gotten
to, you"G" are surprised by a force of attacking ninja!  They are equally
surprised, but react more quickly." CR>
		       <JIGS-UP>
		       <RFATAL>)>)
	       (<RARG? BEG>
		<COND (<VERB? HIDE>
		       <PERFORM ,V?HIDE-BEHIND ,BARRELS>
		       <RTRUE>)
		      (<AND <NOT <VERB? HIDE-BEHIND HIDE-UNDER>>
			    <MOTION-VERB?>>
		       <COND (<JIGS-UP? ,J-CELLAR
"If you were to emerge from hiding, you would be seen.">
			      <COND (<P? WALK P?EAST>
				     <TELL
"You emerge from the shadows and approach the door.  ">)
				    (ELSE
				     <TELL
"You try to sneak across the cellar.  ">)>
			      <COND (<IN? ,NINJA ,HERE>
				     <TELL CTHE ,NINJA " notice">)
				    (<IN? ,YABU ,HERE>
				     <TELL D ,YABU " notices">)
				    (ELSE
				     <TELL "The ninja rear guard notices">)>
			      <TELL
" you almost immediately.  A glint of metal in the
torchlight is your last sight.">
			      <JIGS-UP>)
			     (ELSE <RTRUE>)>)
		      (<AND <P? SHOOT PISTOL *>
			    <NOT <FSET? ,PISTOL ,RMUNGBIT>>>
		       <COND (<JIGS-UP? ,J-SHOOT>
			      <TELL
"The shot rings out, but in the dim light of the cellars, you don't hit
anything.  ">
			      <COND (<FSET? ,PRSO ,PERSON>
				     <TELL
CTHE ,PRSO " doesn't miss, however.">)>
			      <CRLF>
			      <JIGS-UP>)
			     (ELSE <RTRUE>)>)>)
	       (<RARG? END>
		<COND (,YABU-HEARD?
		       <TELL CR
"Yabu stops for a moment as though he heard something, then turns and
rushes back toward you, drawing his sword as he charges.  It's quite
clear he heard you following him some time ago!" CR>
		       <JIGS-UP>
		       <RFATAL>)>)>>

<OBJECT BARRELS
	(LOC CELLARS)
	(DESC "crates, barrels, and boxes")
	(SYNONYM CRATE BARREL BOX CRATES BARRELS BOXES PILE STACK)
	(FLAGS NDESCBIT FURNITURE SURFACEBIT VEHBIT SCOREBIT)
	(ACTION BARRELS-F)>

<ROUTINE BARRELS-F ()
	 <COND (<VERB? HIDE-UNDER HIDE-BEHIND BOARD WALK-AROUND>
		<COND (<NOT <FSET? ,BARRELS ,SCOREBIT>>
		       <TELL G"You already are." CR>)
		      (ELSE
		       <TELL
"Quietly, you conceal yourself behind one of the piles, and watch." CR>
		       <SCORE-OBJECT ,BARRELS>)>)>>

<OBJECT CELLAR-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "iron-bound door")
	(SYNONYM DOOR)
	(ADJECTIVE CELLAR IRON-BOUND IRON BOUND)
	(FLAGS AN DOORBIT LOCKABLE)
	(ACTION CELLAR-DOOR-F)>

<ROUTINE CELLAR-DOOR-F ()
	 <COND (<SCENE? ,S-AFTERMATH>
		<COND (<NOT <PAST-TENSE?>>
		       <TELL "There's no door here." CR>)>)
	       (<NOT <PASSIVE-VERB?>>
		<DO-WALK ,P?EAST>)>>

<ROOM INNER-CORRIDOR
      (LOC ROOMS)
      (DESC "Inner Corridor")
      (SYNONYM CORRIDOR)
      (ADJECTIVE INNER)
      (LDESC
"This inner corridor is between the Audience Chamber to the west, and
the inner apartments of the keep to the north.  A sturdy iron-barred door
separates the Audience Chamber and the corridor.")
      (NORTH TO OUTER-ROOM IF SOUTH-SHOJI IS OPEN)
      (IN TO OUTER-ROOM IF SOUTH-SHOJI IS OPEN)
      (WEST TO AUDIENCE-CHAMBER IF INNER-DOOR IS OPEN)
      (OUT TO AUDIENCE-CHAMBER IF INNER-DOOR IS OPEN)
      (GLOBAL INNER-DOOR LG-NINJA SOUTH-SHOJI GUARDS)
      (FLAGS ONBIT)
      (ACTION INNER-CORRIDOR-F)>

<ROUTINE INNER-CORRIDOR-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<VERB? LEAVE>
		       <DO-WALK ,P?NORTH>)
		      (<AND <VERB? WALK>
			    <IN? ,NINJA ,HERE>
			    ,KNOCKOUT-CNT>
		       <TELL
G"You can't break through the encircling ninja!" CR>)
		      (<AND <P? WALK (P?WEST P?OUT)>
			    <IN? ,NINJA ,HERE>>
		       <TELL
G"You would have to walk right through the ninja!" CR>)
		      (<AND <P? WALK P?WEST>
			    <IN? ,YABU ,HERE>>
		       <COND (<JIGS-UP? ,J-FOLLOW-CLOSE
"You realize you're getting too close to Yabu, so you wait instead of
walking.">
			      <YABU-LISTENS>)
			     (ELSE <RTRUE>)>)>)>>

<ROUTINE YABU-LISTENS ()
	 <COND (<PROB 50> <SETG YABU-HEARD? T>)
	       (ELSE <SETG STUPID-MOVE <>>)>
	 <TELL
"You're getting too close to Yabu.  He stops briefly: he may have heard
you!" CR>>

<GLOBAL YABU-HEARD? <>>

<ROOM SECRET-ROOM
      (LOC ROOMS)
      (DESC "Secret Room")
      (SYNONYM ROOM)
      (ADJECTIVE SECRET)
      (LDESC
"This is a secret room south of the Audience Chamber. A dark and narrow
stairway leads down as well.")
      (NORTH TO AUDIENCE-CHAMBER IF SECRET-ROOM-DOOR IS OPEN)
      (GLOBAL SECRET-ROOM-DOOR LG-NINJA)
      (FLAGS ONBIT)
      (ACTION SECRET-ROOM-F)>

<ROUTINE SECRET-ROOM-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<P? WALK P?DOWN>
		       <COND (<JIGS-UP? ,J-REAR-GUARD
"You suddenly realize that the ninja have probably left a rear guard, and
decide not to follow.">
			      <JIGS-UP
"You walk right into the ninja rear guard, which is lurking in the
darkness.">)
			     (ELSE <RTRUE>)>)>)>>

<OBJECT SECRET-ROOM-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "secret door")
	(SYNONYM DOOR)
	(ADJECTIVE SECRET)
	(FLAGS INVISIBLE DOORBIT LOCKABLE)>

<OBJECT INNER-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "iron-barred inner door")
	(SYNONYM DOOR)
	(ADJECTIVE IRON-BARRED IRON-BOUND INNER STURDY)
	(FLAGS DOORBIT OPENBIT LOCKABLE)
	(ACTION INNER-DOOR-F)>

<ROUTINE INNER-DOOR-F ()
	 <COND (<VERB? OPEN>
		<COND (<FSET? ,INNER-DOOR ,LOCKED>
		       <TELL
"The iron bar is firmly in place.  The door won't open." CR>)>)
	       (<VERB? CLOSE>
		<COND (<AND <IN? ,MARIKO ,AUDIENCE-CHAMBER>
			    <HERE? ,INNER-CORRIDOR>>
		       <TELL
"Mariko screams through the narrowing gap, \"Anjin-san!  Don't leave me
behind!\"" CR CR>
		       <RFALSE>)
		      (<AND <IN? ,GRAY-CAPTAIN ,AUDIENCE-CHAMBER>
			    <NOT <FSET? ,GRAY-CAPTAIN ,DEAD>>>
		       <TELL
CTHE ,GUARDS G" stop you from closing the door." CR>)
		      (<IN? ,GUARDS ,AUDIENCE-CHAMBER>
		       <TELL
CTHE ,GUARDS G" stop you from closing the door." CR>)>)
	       (<VERB? LOCK>
		<PERFORM ,V?CLOSE ,IRON-BAR>
		<RTRUE>)
	       (<VERB? UNLOCK>
		<PERFORM ,V?OPEN ,IRON-BAR>
		<RTRUE>)>>

<OBJECT IRON-BAR
	(LOC INNER-CORRIDOR)
	(DESC "iron bar")
	(SYNONYM BAR)
	(ADJECTIVE IRON)
	(FLAGS NDESCBIT OPENBIT OPENABLE)
	(ACTION IRON-BAR-F)>

<ROUTINE IRON-BAR-F ()
	 <COND (<VERB? EXAMINE>
		<TELL-OPEN-CLOSED>)
	       (<AND <VERB? OPEN>
		     <NOT <FSET? ,IRON-BAR ,OPENBIT>>>
		<FSET ,IRON-BAR ,OPENBIT>
		<FCLEAR ,INNER-DOOR ,LOCKED>
		<TELL
"You slide the bar aside." CR>)
	       (<AND <VERB? CLOSE>
		     <FSET? ,IRON-BAR ,OPENBIT>>
		<COND (<AND <IN? ,GRAY-CAPTAIN ,AUDIENCE-CHAMBER>
			    <NOT <FSET? ,GRAY-CAPTAIN ,DEAD>>>
		       <TELL
CTHE ,GUARDS G" stop you from barring the door." CR>)
		      (<IN? ,GUARDS ,AUDIENCE-CHAMBER>
		       <TELL
CTHE ,GUARDS G" stop you from barring the door." CR>)
		      (ELSE
		       <FCLEAR ,IRON-BAR ,OPENBIT>
		       <FSET ,INNER-DOOR ,LOCKED>
		       <TELL
			"You slide the bar into place." CR>)>)>>

<OBJECT OUTER-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "outer door")
	(SYNONYM DOOR)
	(ADJECTIVE OUTER)
	(FLAGS AN LOCKABLE DOORBIT OPENBIT)>

<ROUTINE I-ATTACK ()
	 <ZLINES ,ATTACK-CNT
		 (2
		  <COND (<HERE? ,STAIRS ,SERVANTS-QUARTERS>
			 <TELL
"You"G" are surprised by a force of attacking ninja!  They are equally
surprised, but react quickly." CR>
			 <JIGS-UP>
			 <RFATAL>)>)
		 (DELAY
		  <COND (<OR <NOT ,YABU-BETRAYED?>
			     <L=? ,DELAY-CNT 3>>
			 <RFALSE>)>)
		 (<COND (<HERE? <LOC ,ACHIKO>>
			 <TELL CR
"The young girl, Achiko, mumbles in her sleep.  She had asked to stay
with Mariko, as had old Lady Etsu.  Kiyama had sent for Achiko, his
granddaughter-in-law, but she refused to leave Mariko.  At once the
daimyo had disowned her." CR>)>)
		 (1)
		 (<QUEUE I-WOMEN -1>
		  <FCLEAR ,LG-NINJA ,INVISIBLE>
		  <TELL CR
"Suddenly, the quiet is shattered by the cry \"Ninja!\"" CR>)
		 (<TELL CR
"From below come the sounds of battle being joined.  Furious cries,
screams, and the clash of swords fill the air." CR>)
		 (<MOVE ,NINJA ,SECRET-ROOM>
		  <MOVE ,NINJA-LEADER ,SECRET-ROOM>
		  <TELL CR
G"The sounds of ""battle continue, a violent shouting melee.">
		  <COND (<HERE? ,AUDIENCE-CHAMBER ,OUTER-CORRIDOR
				,INNER-CORRIDOR>
			 <TELL " The frantic
guards at the fortified door to the outer corridor listen anxiously to
the mounting holocaust below.">)>
		  <CRLF>)
		 (<QUEUE I-NINJA -1>
		  <COND (<NOT <FSET? ,OUTER-DOOR ,OPENBIT>>
			 <FSET ,OUTER-DOOR ,OPENBIT>
			 <TELL CR
"The guards reopen the outer door, so as to better hear the melee below." CR>)>
		  <MOVE ,GUARDS ,OUTER-CORRIDOR>
		  <COND (<OR <HERE? ,AUDIENCE-CHAMBER>
			     <AND <HERE? ,INNER-CORRIDOR>
				  <FSET? ,INNER-DOOR ,OPENBIT>>>
			 <TELL CR
"The officers of the Browns and Grays order their men to take up defensive
positions at the far end of the corridor, no longer able to stand the
waiting.  Only the captain of the Grays remains, beside the door to the
inner corridor." CR>)
			(ELSE
			 <TELL CR
"You can hear officers shouting orders." CR>)>)
		 (<DEQUEUE I-ATTACK>
		  <COND (<NOT <FSET? ,GRAY-CAPTAIN ,DEAD>>
			 <MOVE ,GRAY-CAPTAIN ,OUTER-CORRIDOR>
			 <COND (<OR <HERE? ,AUDIENCE-CHAMBER>
				    <AND <HERE? ,INNER-CORRIDOR>
					 <FSET? ,INNER-DOOR ,OPENBIT>>>
				<TELL CR
"Now the captain of the Grays leaves the audience chamber." CR>)>)
			(ELSE <RFALSE>)>)>>

<OBJECT GRAY-CAPTAIN
	(SCENE S-NINJA S-PRISON)
	(OWNER <>)
	(DESC "Gray Captain")
	(SYNONYM CAPTAIN)
	(ADJECTIVE GRAY)
	(FLAGS PERSON)
	(HEALTH 4)
	(GENERIC GENERIC-CAPTAIN-F)
	(ACTION GRAY-CAPTAIN-F)>

<ROUTINE GRAY-CAPTAIN-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<RARG? SUBJ>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,DEAD>
		       <COND (<EQUAL? <GETP ,PRSO ,P?OWNER> ,NINJA>
			      <TELL
"He has been hacked to death by the ninja." CR>)
			     (ELSE
			      <TELL
"He is dead.  You killed him, remember?" CR>)>)
		      (<AND <NOT <FSET? ,LG-NINJA ,INVISIBLE>>
			    <SCENE? ,S-NINJA>>
		       <TELL
"He is impatient to join the battle, torn between his duty to guard
the hostages and his desire to destroy the attackers." CR>)
		      (ELSE
		       <TELL
"He is supervising the guards." CR>)>)
	       (<P? SHOOT * PISTOL>
		<COND (<FSET? ,PISTOL ,RMUNGBIT>
		       <RFALSE>)
		      (ELSE
		       <COND (<OR <NOT <IN? ,GUARDS ,HERE>>
				  <JIGS-UP? ,J-KILL-CAPTAIN>>
			      <PUTP ,GRAY-CAPTAIN ,P?OWNER ,BLACKTHORNE>
			      <FSET ,GRAY-CAPTAIN ,DEAD>
			      <TELL
"You fire the pistol, killing the captain instantly.">
			      <COND (<IN? ,GUARDS ,HERE>
				     <JIGS-UP
" The other guards turn and immediately assume this is a
betrayal.  They cut you down in short order.">)
				    (ELSE
				     <TELL
" As the gray guards aren't here, you may get away with it." CR>)>)
			     (ELSE <RTRUE>)>)>)
	       (<AND <HOSTILE-VERB?>
		     <NOT <FSET? ,GRAY-CAPTAIN ,DEAD>>>
		<COND (<JIGS-UP? ,J-KILL-CAPTAIN>
		       <JIGS-UP
"You attack the captain.  Surprised, and assuming you are part of
some scheme of betrayal, he fights back, and you are dispatched quickly.">)
		      (ELSE <RTRUE>)>)>>

<CONSTANT J-PLUNGE 170>
<CONSTANT J-CELLAR 171>
<CONSTANT J-SHOOT 172>
<CONSTANT J-FOLLOW-CLOSE 173>
<CONSTANT J-REAR-GUARD 174>
<CONSTANT J-KILL-CAPTAIN 175>
<CONSTANT J-KILL-GUARDS 176>
<CONSTANT J-CALTROPS 177>

<OBJECT GUARDS
	;(LOC AUDIENCE-CHAMBER)
	(DESC "guards")
	(SYNONYM GUARDS GUARD)
	(ADJECTIVE SAMURAI GRAY BROWN)
	(FLAGS PERSON JAPANESEBIT PLURAL NOABIT)
	(GENERIC GENERIC-SAMURAI-F)
	(DESCFCN GUARDS-DESC)
	(ACTION GUARDS-F)>

<ROUTINE GUARDS-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<COND (<SCENE? ,S-TORANAGA>
		       <TELL
"Guards stand at attention around the perimeter of the room.">)
		      (<SCENE? ,S-PRISON>
		       <TELL
"Samurai guards supervise the activities.">)
		      (ELSE
		       <TELL
"Guards on watch stand here and there about the room.">)>)>>

<ROUTINE GUARDS-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL
"The guards are Grays, Ishido's men." CR>)
	       (<VERB? TELL>
		<TELL
"They don't respond, as they are on duty." CR>
		<END-QUOTE>
		<RFATAL>)
	       (<HOSTILE-VERB?>
		<COND (<JIGS-UP? ,J-KILL-GUARDS>
		       <JIGS-UP
"The guards, assuming this is some sort of betrayal, respond to your
attack by killing you.">)
		      (ELSE <RTRUE>)>)>>

<OBJECT LG-NINJA
	(LOC LOCAL-GLOBALS)
	(DESC "ninja")
	(SYNONYM NINJA FIGURE MEN)
	(ADJECTIVE RED SPOT BLACK CLAD)
	(FLAGS INVISIBLE PERSON)
	(GENERIC GENERIC-NINJA-F)
	(ACTION LG-NINJA-F)>

<ROUTINE LG-NINJA-F ("OPT" (RARG <>) "AUX" NEARBY? RM)
	 <SET NEARBY? <NEXT-ROOM? <LOC ,NINJA>>>
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (.NEARBY?
		       <TELL G"There is no response." CR>)
		      (ELSE
		       <TELL "There are no ninja nearby." CR>)>)
	       (<AND <SCENE? S-AFTERMATH>
		     <OR <PASSIVE-VERB?>
			 ,QCONTEXT>>
		<RFALSE>)
	       (<VERB? FIND ;WHERE LISTEN>
		<TELL
"You see no ninja nearby, but there is plenty of noise." CR>)
	       (<VERB? FOLLOW>
		<COND (<QUEUED? I-NINJA-TAKE-MARIKO>
		       <TELL "You ">
		       <COND (<EQUAL? ,FOLLOW-FLAG ,NINJA>
			      <TELL "continue">)
			     (ELSE
			      <SETG FOLLOW-FLAG ,NINJA>
			      <TELL "begin">)>
		       <TELL
G" following the ninja, trying to keep up with
them as they take Mariko." CR>
		       <SET RM <LOC ,NINJA>>
		       <COND (<HERE? .RM>
			      <COND (,FOLLOW-FLAG
				     <TELL
"You continue following the ninja, pushing your way ahead, trying to
keep close." CR>)
				    (ELSE
				     <SETUP-FOLLOW-NINJA>
				     <TELL
"You begin"
G" following the ninja, trying to keep up with
them as they take Mariko." CR>)>)
			     (<NEXT-ROOM? <LOC ,NINJA>>
			      <TELL "You ">
			      <COND (,FOLLOW-FLAG
				     <TELL "continue">)
				    (ELSE
				     <SETUP-FOLLOW-NINJA>
				     <TELL "begin">)>
			      <TELL
" following the ninja, desperate to keep up as they retreat with Mariko." CR>)
			     (ELSE
			      <SETG FOLLOW-FLAG <>>
			      <TELL "You've lost them!" CR>)>
		       <RTRUE>)
		      (<FSET? ,NINJA ,INVISIBLE>
		       <TELL "They are gone." CR>)
		      (ELSE
		       <TELL
"They don't seem to be going anywhere." CR>)>)
	       (<P? AIM PISTOL LG-NINJA>
		<TELL
"The pistol doesn't seem to scare them unless it's fired." CR>)
	       (<P? SHOOT PISTOL LG-NINJA>
		<COND (.NEARBY?
		       <PERFORM ,V?SHOOT ,PISTOL ,NINJA>
		       <RTRUE>)
		      (ELSE
		       <FSET ,PISTOL ,RMUNGBIT>
		       <TELL
"The ninja aren't close enough, so your shot is wasted." CR>)>)
	       (<OR <VERB? TAKE> <HOSTILE-VERB?>>
		<TELL
"The ninja aren't close enough to attack." CR>)>>

<OBJECT NINJA-LEADER
	(LOC SECRET-ROOM)
	(DESC "ninja leader")
	(SYNONYM LEADER MAN)
	(ADJECTIVE RED SPOT NINJA)
	(FLAGS NDESCBIT PERSON JAPANESEBIT SCOREBIT)
	(ACTION NINJA-F)>

<OBJECT NINJA
	(LOC SECRET-ROOM)
	(DESC "ninja")
	(SYNONYM NINJA FIGURE MEN)
	(ADJECTIVE RED SPOT BLACK CLAD)
	(FLAGS PERSON JAPANESEBIT SCOREBIT PLURAL)
	(COUNT 5)
	(DESCFCN NINJA-DESC)
	(GENERIC GENERIC-NINJA-F)
	(ACTION NINJA-F)>

<ROUTINE GENERIC-NINJA-F (R F)
	 ,LG-NINJA>

<ROUTINE NINJA-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<TELL
"A force of black-clad, black-masked ninja is here.">)>>

<ROUTINE NINJA-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
"The black-masked " D ,WINNER " doesn't answer." CR>)
	       (<VERB? EXAMINE>
		<TELL
"The ninja are black-clad, black-masked shapes of darkness." CR>)
	       (<VERB? COUNT>
		<TELL
"It's hard to tell, they are like black-clad ghosts in the dim, pre-dawn
light." CR>)
	       (<P? AIM PISTOL (NINJA NINJA-LEADER)>
		<COND (<FSET? ,PISTOL ,RMUNGBIT>
		       <TELL
"The ninja know the pistol isn't loaded." CR>)
		      (ELSE
		       <TELL
"The ninja don't seem too impressed." CR>)>)
	       (<P? SHOOT PISTOL (NINJA NINJA-LEADER)>
		<COND (<HERE? ,CELLARS>
		       <COND (<JIGS-UP? ,J-CELLAR>
			      <JIGS-UP
"Your pistol shatters the quiet of the cellars.  Yabu turns, shocked,
and realizes you have been following him.  He charges, sword drawn,
and dispatches you before you can escape.">)>
		       <RFATAL>)>
		<SETG KNOCKOUT-CNT 0>
		<COND (<NOT <FSET? ,BALCONY ,TOUCHBIT>>
		       <QUEUE I-NINJA-COWED <GETP ,NINJA ,P?COUNT>>)>
		<FSET ,PISTOL ,RMUNGBIT>
		<COND (<AND <OR <HERE? ,AUDIENCE-CHAMBER>
				<AND <HERE? ,INNER-CORRIDOR>
				     <FSET? ,INNER-DOOR ,OPENBIT>>>
			    <FSET? ,NINJA ,SCOREBIT>>
		       <QUEUE I-CAPTAIN-RETURNS 1>
		       <MARGINAL-PIC ,P-NINJA <>>
		       <REMOVE ,NINJA-LEADER>
		       <TELL
"The pistol goes off, and the back of the ninja leader's head disappears,
momentarily stopping the charge.">
		       <COND (<NOT <FSET? ,GRAY-CAPTAIN ,DEAD>>
			      <TELL
"  The shot alerts the Captain of the Grays.">)>
		       <CRLF>
		       <SCORE-OBJECT ,NINJA>)
		      (ELSE
		       <TELL
"Your pistol fires, blasting " A ,PRSI " into his next
incarnation." CR>)>)
	       (<OR <P? (KILL ATTACK HIT) (NINJA NINJA-LEADER) SWORDS>
		    <P? (SWING THROW) SWORDS (NINJA NINJA-LEADER)>>
		<COND (<VERB? THROW> <MOVE ,SWORDS ,HERE>)>
		<TELL
"You strike at a ninja, but there are too many of them to take them on
one at a time." CR>)
	       (<OR <VERB? TAKE> <HOSTILE-VERB?>>
		<TELL
,YOU-HAVE-TO "use a weapon to have any chance of survival." CR>)>>

<ROUTINE I-CAPTAIN-RETURNS ()
	 <COND (<NOT <FSET? ,GRAY-CAPTAIN ,DEAD>>
		<FSET ,GRAY-CAPTAIN ,DEAD>
		<PUTP ,GRAY-CAPTAIN ,P?OWNER ,NINJA>
		<COND (<HERE? ,AUDIENCE-CHAMBER ,INNER-CORRIDOR>
		       <TELL CR
"The Captain of the Grays charges back into the Audience Chamber,
attacking with mindless ferocity.  He cuts down one ninja, then the pack
falls on him and he dies." CR>)
		      (ELSE
		       <TELL CR
"There are sounds of a short fight outside, and then all is quiet." CR>)>)>>

;<GLOBAL CAPTURE-CNT 0>
;<GLOBAL KNOCKOUT-CNT 0>

;<GLOBAL NINJA-COWED-CNT 0>

<ROUTINE I-NINJA ("AUX" (L <LOC ,NINJA>) C NEAR)
	 <COND (<QUEUED? I-CAPTAIN-RETURNS>
		<RFALSE>)
	       (<SET C <QUEUED? I-NINJA-COWED>>
		<SET C <GET .C ,C-TICK>>
		<COND (<IN? ,NINJA ,HERE>
		       <COND (<G? .C 1>
			      <ZLINES ,NINJA-COWED-CNT
				      (<TELL CR
"The ninja near you seem wary of your pistol, expecting another shot." CR>)
				      (<TELL CR
"The ninja seem hesitant to risk another blast." CR>)
				      (<TELL CR
"The ninja are beginning to overcome their fear." CR>)>
			      <RTRUE>)>)
		      (<NOT <NEXT-ROOM? <LOC ,NINJA>>>
		       <COND (<G? .C 1>
			      <SETG KNOCKOUT-CNT 0>
			      <QUEUE I-NINJA-COWED 1>
			      <TELL CR
"You can hear the ninja preparing to resume the attack." CR>
			      <RTRUE>)>)
		      (ELSE
		       <COND (<G? .C 1>
			      <TELL CR
"The ninja seem quiet, perhaps they are afraid of your pistol." CR>
			      <RTRUE>)>)>
		<RFALSE>)
	       (<NOT <FSET? ,MARIKO ,RMUNGBIT>>
		<COND (<EQUAL? .L <META-LOC ,MARIKO>>
		       <COND (<HERE? .L>
			      <ZLINES ,CAPTURE-CNT
				      (<TELL CR
"The ninja surge toward you, trying to get to Mariko." CR>)
				      (<COND (<HELD? ,MARIKO>
					      <MOVE ,MARIKO ,HERE>
					      <TELL CR
"You drop Mariko, telling her to run, trying to hold off the ninja." CR>)>
				       <TELL CR
"The ninja are trying to move between you and Mariko, cutting you off." CR>)
				      (<TELL CR
"A bold ninja grabs for Mariko, who stabs him with a small but effective
dagger." CR>)
				      (<DEQUEUE I-NINJA>
				       <QUEUE I-NINJA-TAKE-MARIKO -1>
				       <COND (<HERE? BALCONY>
					      <TELL CR
"Mariko tries to run for the parapet, but the ninja overpower her." CR>)
					     (ELSE
					      <TELL CR
G"The ninja overpower Mariko"G" and quickly begin forcing her back towards
the exit." CR>)>)>
			      <RTRUE>)
			     (ELSE
			      <SET NEAR <NEXT-ROOM? .L T>>
			      <ZLINES ,CAPTURE-CNT
				      (<COND (.NEAR
					      <TELL CR
G"You hear the sounds of a struggle"" between Mariko and the ninja." CR>
					      <RTRUE>)>)
				      (<COND (.NEAR
					      <TELL CR
"The sounds of "G"struggle continue." CR>
					      <RTRUE>)>)
				      (<DEQUEUE I-NINJA>
				       <QUEUE I-NINJA-TAKE-MARIKO -1>
				       <COND (.NEAR
					      <TELL CR
G"The ninja overpower Mariko"G" and quickly begin forcing her back towards
the exit." CR>
					      <RTRUE>)>)>)>)
		      (<EQUAL? .L <LOC ,BLACKTHORNE>>
		       <ZLINES ,KNOCKOUT-CNT
			       (<TELL CR "The ninja surround you." CR>
				<RTRUE>)
			       (<TELL CR
"The ninja are all around you.  First, they try a few quick feints to
gauge your speed." CR>
				<RTRUE>)
			       (<JIGS-UP
"Satisfying themselves as to your abilities, they close in and moments
later, you are knocked out by a blow you didn't even see.">
				<RFATAL>)>)>)>
	 <SETG CAPTURE-CNT 0> ;"ninja not in room with mariko"
	 <SETG KNOCKOUT-CNT 0> ;"ninja not in room with blackthorne"
	 <COND (<IN? ,NINJA ,SECRET-ROOM>
		<COND (<AND ;<IN? ,BLACKTHORNE ,AUDIENCE-CHAMBER>
			    <NOT <IN? ,GRAY-CAPTAIN ,AUDIENCE-CHAMBER>>
			    <OR <IN? ,MARIKO ,AUDIENCE-CHAMBER>
				<FSET? ,INNER-DOOR ,LOCKED>>>
		       <FCLEAR ,SECRET-ROOM-DOOR ,INVISIBLE>
		       <FSET ,SECRET-ROOM-DOOR ,OPENBIT>
		       <MOVE ,NINJA ,AUDIENCE-CHAMBER>
		       <THIS-IS-IT ,NINJA>
		       <COND (<LOC ,NINJA-LEADER>
			      <MOVE ,NINJA-LEADER ,AUDIENCE-CHAMBER>
			      <THIS-IS-IT ,NINJA-LEADER>)>
		       <COND (<HERE? ,AUDIENCE-CHAMBER>
			      <TELL CR
"Suddenly, a secret door on the south side of the room bursts open, and
a black-clad figure charges through the door, directly at you!  Behind
him the rest of his men are crowding into the opening." CR>)
			     (<AND <HERE? ,INNER-CORRIDOR>
				   <FSET? ,INNER-DOOR ,LOCKED>>
			      <TELL CR
"You hear noises outside the door, quiet and stealthy, but definitely
there." CR>)
			     (ELSE
			      <TELL CR
"There is a sudden commotion in the audience chamber." CR>)>)>)
	       (<IN? ,NINJA ,AUDIENCE-CHAMBER>
		<COND (<FSET? ,INNER-DOOR ,OPENBIT>
		       <SETG NINJA-ATTACKING-CUL-DE-SAC? T>
		       <MOVE ,NINJA ,INNER-CORRIDOR>
		       <COND (<LOC ,NINJA-LEADER>
			      <MOVE ,NINJA-LEADER ,INNER-CORRIDOR>)>
		       <COND (<HERE? ,AUDIENCE-CHAMBER ,INNER-CORRIDOR
				     ,OUTER-CORRIDOR>
			      <TELL CR
"The ninja crowd through the door into the inner corridor." CR>)
			     (ELSE
			      <TELL CR
G"The sounds of ""the fighting are getting closer." CR>)>)
		      (<NOT <QUEUED? I-NINJA-VS-INNER-DOOR>>
		       <SETG NINJA-ATTACKING-CUL-DE-SAC? T>
		       <FCLEAR ,OUTER-DOOR ,OPENBIT>
		       <FSET ,OUTER-DOOR ,LOCKED>
		       <QUEUE I-NINJA-VS-INNER-DOOR -1>
		       <COND (<HERE? ,INNER-CORRIDOR ,AUDIENCE-CHAMBER>
			      <TELL CR
"The ninja circle the door, then begin tearing at it with crowbars.  Others
secure the doors to the audience chamber, cutting off this entire
section of the keep." CR>)
			     (ELSE
			      <TELL CR
"You can hear the sound of the ninja tearing at the inner door." CR>)>)>)
	       (<IN? ,NINJA ,INNER-CORRIDOR>
		<FSET ,SOUTH-SHOJI ,OPENBIT>
		<FSET ,SOUTH-SHOJI ,RMUNGBIT>
		<MOVE ,NINJA ,OUTER-ROOM>
		<COND (<LOC ,NINJA-LEADER>
		       <MOVE ,NINJA-LEADER ,OUTER-ROOM>)>
		<COND (<HERE? ,OUTER-ROOM ,INNER-CORRIDOR>
		       <TELL CR
"The ninja surge through the flimsy shojis into the outer reception
room." CR>)
		      (ELSE
		       <TELL CR
"You can hear shojis bursting to shards; the ninja are probably in
the reception room!" CR>)>)
	       (<IN? ,NINJA ,OUTER-ROOM>
		<FSET ,NORTH-SHOJI ,OPENBIT>
		<FSET ,NORTH-SHOJI ,RMUNGBIT>
		<MOVE ,NINJA ,PRIVATE-QUARTERS>
		<COND (<LOC ,NINJA-LEADER>
		       <MOVE ,NINJA-LEADER ,PRIVATE-QUARTERS>)>
		<COND (<HERE? ,PRIVATE-QUARTERS ,PRIVATE-QUARTERS-2
			      ,BLACKTHORNE-QUARTERS>
		       <TELL CR
"The ninja storm into the private apartments, scenting their quarry." CR>)
		      (ELSE
		       <TELL CR
"You can hear the ninja ransacking the private apartments." CR>)>)
	       (<IN? ,NINJA ,PRIVATE-QUARTERS>
		<COND (<FSET? ,SECRET-REDOUBT-DOOR ,OPENBIT>
		       <MOVE ,NINJA ,SECRET-REDOUBT>
		       <COND (<LOC ,NINJA-LEADER>
			      <MOVE ,NINJA-LEADER ,SECRET-REDOUBT>)>
		       <COND (<HERE? ,PRIVATE-QUARTERS ,SECRET-REDOUBT
				     ,PRIVATE-QUARTERS-2 ,BLACKTHORNE-QUARTERS>
			      <TELL CR
"The ninja storm through the door into the bolt hole." CR>)
			     (ELSE
			      <TELL CR
"The sound quiets; the ninja must be behind more formidable walls now." CR>)>)
		      (<NOT <QUEUED? I-NINJA-VS-SECRET-DOOR>>
		       <SETG DOOR-CNT 0>
		       <QUEUE I-NINJA-VS-SECRET-DOOR -1>
		       <COND (<HERE? ,SECRET-REDOUBT ,PRIVATE-QUARTERS>
			      <TELL CR
"The ninja gather outside the door, scraping at the hinges and
the floor." CR>)
			     (ELSE
			      <TELL CR
"You hear the sounds of scraping and pounding." CR>)>)>)
	       (<IN? ,NINJA ,SECRET-REDOUBT>
		<COND (<FSET? ,MARIKO ,RMUNGBIT> <RFALSE>)
		      (<FSET? ,BALCONY-DOOR ,OPENBIT>
		       <MOVE ,NINJA ,BALCONY>
		       <COND (<LOC ,NINJA-LEADER>
			      <MOVE ,NINJA-LEADER ,BALCONY>)>
		       <COND (<HERE? ,BALCONY ,SECRET-REDOUBT>
			      <TELL CR
"The ninja crowd out onto the balcony." CR>)>)
		      (ELSE
		       <COND (<HERE? ,BALCONY ,SECRET-REDOUBT>
			      <FSET ,BALCONY-DOOR ,OPENBIT>
			      <TELL CR
"The ninja begin to attack the door, and almost immediately smash it open." CR>)>)>)>>

<ROUTINE SETUP-FOLLOW-NINJA ()
	 <COND (<AND <QUEUED? I-NINJA-TAKE-MARIKO>
		     <NOT <EQUAL? ,FOLLOW-FLAG ,NINJA>>>
		<SETG FOLLOW-FLAG ,NINJA>
		<DEQUEUE I-NINJA-TAKE-MARIKO>
		<QUEUE I-FOLLOW-NINJA -1>
		<QUEUE I-NINJA-TAKE-MARIKO -1>)>>

<ROUTINE I-FOLLOW-NINJA ("AUX" (L <LOC ,NINJA>))
	 <COND (,FOLLOW-FLAG
		<COND (<HERE? .L>
		       <TELL CR
"You've caught up with the ninja!" CR>)
		      (<NEXT-ROOM? .L>
		       <CRLF>
		       <TELL
"You are managing to keep up with the retreating ninja.">
		       <TELL CR CR>
		       <GOTO .L>
		       <RTRUE>)
		      (ELSE
		       <SETG FOLLOW-FLAG <>>
		       <DEQUEUE I-FOLLOW-NINJA>
		       <TELL
"You've lost the ninja!  They're too far ahead of you, and you can't
be sure where they've headed." CR>)>)
	       (ELSE
		<DEQUEUE I-FOLLOW-NINJA>
		<RFALSE>)>>

<ROUTINE I-MARIKO-STRUGGLES ()
	 <COND (<HELD? ,MARIKO>
		<TELL CR
"Mariko tries to break free of your hold." CR>)
	       (<FSET? ,MARIKO ,DEAD>
		<DEQUEUE I-MARIKO-STRUGGLES>
		<RFALSE>)
	       (ELSE
		<COND (<AND <IN? ,MARIKO ,BALCONY>
			    <NOT <HELD? ,MARIKO>>
			    <FSET? ,BALCONY-DOOR ,OPENBIT>>
		       <MOVE ,MARIKO ,SECRET-REDOUBT>
		       <COND (<HERE? ,BALCONY ,SECRET-REDOUBT>
			      <TELL CR
"Mariko flees back into the redoubt." CR>)>)
		      (<IN? ,MARIKO ,HERE>
		       <TELL CR
"Mariko scurries away from you." CR>)>)>>

<ROUTINE I-NINJA-TAKE-MARIKO ("AUX" (L <LOC ,NINJA>) D)
	 <COND (<IN? ,MARIKO .L>
		<COND (<QUEUED? I-NINJA-COWED>
		       <DEQUEUE I-NINJA-TAKE-MARIKO>
		       <SETG CAPTURE-CNT 0>
		       <QUEUE I-NINJA -1>
		       <SETG FOLLOW-FLAG <>>
		       <COND (<IN? ,MARIKO ,HERE>
			      <TELL CR
"Mariko takes advantage of the ninja's confusion to bite at her
captor's hand, breaking free and shoving her way to your side." CR>
			      <RTRUE>)
			     (ELSE
			      <TELL CR
"You hear shouts of frustration from the ninja." CR>
			      <RTRUE>)>)>
		<COND (<IN? ,NINJA ,SECRET-ROOM>
		       <REMOVE ,NINJA-LEADER>
		       <REMOVE ,NINJA>
		       <REMOVE ,MARIKO>
		       <SETG FOLLOW-FLAG <>>
		       <SETG CAPTURE-CNT 0>
		       <DEQUEUE I-NINJA-COWED>
		       <DEQUEUE I-NINJA-TAKE-MARIKO>
		       <COND (<HERE? ,SECRET-ROOM ,AUDIENCE-CHAMBER
				     ,INNER-CORRIDOR>
			      <TELL CR
"You hear a shout of triumph from the ninja as they carry Mariko
away.  You realize that this was their goal, and that one way or another,
Ishido was behind it." CR>)
			     (ELSE
			      <TELL CR
"You realize that by now the ninja have escaped with Mariko.  You have
no doubt that Ishido was behind it." CR>)>
		       <FAILED-SCENE>
		       <RFATAL>)>
		<SET D
		     <COND (<IN? ,NINJA ,AUDIENCE-CHAMBER>
			    ,SECRET-ROOM)
			   (<IN? ,NINJA ,INNER-CORRIDOR>
			    ,AUDIENCE-CHAMBER)
			   (<IN? ,NINJA ,OUTER-ROOM>
			    ,INNER-CORRIDOR)
			   (<IN? ,NINJA ,PRIVATE-QUARTERS>
			    ,OUTER-ROOM)
			   (<OR <IN? ,NINJA ,PRIVATE-QUARTERS-2>
				<IN? ,NINJA ,BLACKTHORNE-QUARTERS>
				<IN? ,NINJA ,SECRET-REDOUBT>>
			    ,PRIVATE-QUARTERS)
			   (<IN? ,NINJA ,BALCONY>
			    ,SECRET-REDOUBT)>>
		<MOVE ,NINJA .D>
		<COND (<LOC ,NINJA-LEADER>
		       <MOVE ,NINJA-LEADER .D>)>
		<MOVE ,MARIKO .D>
		<COND (<AND <IN? ,CALTROPS ,NINJA>
			    <PROB 50>>
		       <MOVE ,CALTROPS .L>
		       <COND (<HERE? .L>
			      <TELL CR
"The ninja scatter handfuls of tiny, spiked metal balls on the floor." CR>)>)
		      (<AND <IN? ,SMOKE-BOMB ,NINJA>
			    <PROB 50>>
		       <MOVE ,SMOKE-BOMB .L>
		       <QUEUE I-REMOVE-SMOKE 2>
		       <COND (<HERE? .L>
			      <TELL CR
"One of the ninja throws a smoke bomb which fills the room with choking,
acrid smoke." CR>)>)
		      (<AND <IN? ,FIRE-BOMB ,NINJA>
			    <PROB 50>>
		       <MOVE ,FIRE-BOMB .L>
		       <QUEUE I-REMOVE-FIRE 2>
		       <COND (<HERE? .L>
			      <TELL CR
"A ninja tosses a fire bomb which spreads sticky burning pitch on the
floor." CR>)>)>
		<COND (<HERE? .D .L>
		       <TELL CR
"The ninja retreat, " <PICK-ONE ,MARIKO-STRUGGLES>>
		       <COND (<AND <EQUAL? ,FOLLOW-FLAG ,NINJA>
				   <HERE? .L>>
			      <TELL " You follow, fighting your way
through the chaos, trying to catch up." CR CR>
			      <GOTO .D>)
			     (ELSE <CRLF>)>
		       <RTRUE>)>)>>

<OBJECT CALTROPS
	(LOC NINJA)
	(DESC "caltrops")
	(SYNONYM CALTROPS CALTROP BALLS BALL)
	(ADJECTIVE TINY SPIKED METAL)
	(FLAGS TAKEBIT PLURAL)
	(ACTION CALTROPS-F)>

<GLOBAL AVOID-CALTROPS? <>>

<ROUTINE CALTROPS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"These are tiny spiked metal balls that remind you of the caltrops used in
Europe to stop cavalry attacks.  They are festooned with needle-like
spines." CR>)
	       (<VERB? TAKE>
		<COND (<JIGS-UP? ,J-CALTROPS
"At the last second, you remember that ninja are famous for using poison.">
		       <JIGS-UP
"Unlike caltrops in Europe, these are poisoned!  Almost immediately you feel
a searing pain in your hand.  Within moments you are writhing on the floor.">)
		      (ELSE <RTRUE>)>)
	       (<VERB? AVOID>
		<SETG AVOID-CALTROPS? T>
		<TELL
"You do your best to avoid stepping on the caltrops." CR>)>>

<OBJECT SMOKE-BOMB
	(LOC NINJA)
	(DESC "smoke")
	(SYNONYM BOMB SMOKE)
	(ADJECTIVE SMOKE)
	(FLAGS NDESCBIT)
	(ACTION SMOKE-BOMB-F)>

<ROUTINE SMOKE-BOMB-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The smoke chokes your lungs and blocks your view just enough to make the
area a confusing, incomprehensible hell." CR>)>>

<ROUTINE I-REMOVE-SMOKE ("AUX" (L <LOC ,SMOKE-BOMB>))
	 <REMOVE ,SMOKE-BOMB>
	 <COND (<HERE? .L>
		<TELL CR
"The smoke has dissipated enough that you can breathe and see better
now." CR>)>>

<OBJECT FIRE-BOMB
	(LOC NINJA)
	(DESC "fire bomb")
	(SYNONYM BOMB FIRE)
	(ADJECTIVE FIRE)
	(FLAGS NDESCBIT)
	(ACTION FIRE-BOMB-F)>

<ROUTINE FIRE-BOMB-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The fire bomb has broadcast burning pitch all over the floor.  It looks
like it would be dangerous to move." CR>)>>

<ROUTINE I-REMOVE-FIRE ("AUX" (L <LOC ,FIRE-BOMB>))
	 <REMOVE ,FIRE-BOMB>
	 <COND (<HERE? .L>
		<TELL CR
"The fire from the bomb has died down somewhat now." CR>)>>

<CONSTANT MARIKO-STRUGGLES
	  <LTABLE 0
		  "dragging a struggling Mariko with them."
		  "pulling Mariko along."
		  "several manhandling Mariko into step with them."
		  "Mariko being pushed along ahead of them.">>

<GLOBAL NINJA-ATTACKING-CUL-DE-SAC? <>>

<ROUTINE I-NINJA-COWED ("AUX" (CNT <GETP ,NINJA ,P?COUNT>)) 
	 <COND (<LOC ,NINJA>
	 <SETG NINJA-COWED-CNT 0>
	 <COND (<G? .CNT 2>
		<SET CNT <- .CNT 2>>
		<PUTP ,NINJA ,P?COUNT .CNT>
		<COND (<IN? ,NINJA ,HERE>
		       <TELL CR
"The ninja resume their attack." CR>)
		      (ELSE
		       <TELL CR
G"The sounds of ""fighting redouble in intensity." CR>)>)
	       (ELSE 
		<COND (<IN? ,NINJA ,HERE>
		       <TELL CR
"The ninja have realized how long it takes to reload the pistol, and
fearlessly resume their attack." CR>)
		      (ELSE
		       <TELL CR
G"The sounds of ""fighting resume their former intensity." CR>)>)>)>>

;<GLOBAL DOOR-CNT 0>

<ROUTINE I-NINJA-VS-INNER-DOOR ()
	 <COND (<FSET? ,INNER-DOOR ,OPENBIT>
		<DEQUEUE I-NINJA-VS-INNER-DOOR>
		<RFALSE>)
	       (<QUEUED? I-NINJA-COWED>
		<COND (<HERE? ,INNER-CORRIDOR ,OUTER-ROOM>
		       <TELL CR
"There are only muffled sounds outside the door as the ninja regroup." CR>
		       <RTRUE>)
		      (ELSE
		       <RFALSE>)>)
	       (<FSET? ,IRON-BAR ,OPENBIT>
		<FSET ,INNER-DOOR ,OPENBIT>
		<DEQUEUE I-NINJA-VS-INNER-DOOR>
		<COND (<HERE? ,INNER-CORRIDOR>
		       <TELL CR
"The inner door jerks inward as the ninja smash against it, and they realize
that it isn't barred.  They throw the door open!" CR>
		       <RTRUE>)
		      (<HERE? ,OUTER-ROOM>
		       <TELL CR
"From the corridor comes the thud of the ninja crashing against the
unbarred inner door, and then the sound of the door being opened." CR>
		       <RTRUE>)>)
	       (<HERE? ,OUTER-ROOM>
		<TELL CR
"You can hear the ninja furiously attacking the inner door." CR>)>
	 <ZLINES ,DOOR-CNT
		 (<COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The door rocks under the furious blows of the assault jimmies." CR>)>)
		 (<COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The wood of the door begins to splinter." CR>)>)
		 (<COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The men with the crowbars rip at the door, which shrieks under the
blows." CR>)>)
		 (<MOVE ,DOOR-CRACK ,INNER-CORRIDOR>
		  <COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"One of the door panels cracks, then a hinge snaps and the tip of a
jimmy comes through to widen the crack." CR>)>)
		 (<COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The whole door shakes as ninja tear at it with shoulders and raging
fists and feet and weapons.  The door bellows and shudders and one of
the bolts springs away and clatters to the floor." CR>)>)
		 (<COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The door is near collapsing." CR>)>)
		 (<COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The entire door teeters as another bolt flies off." CR>)>)
		 (<DEQUEUE I-NINJA-VS-INNER-DOOR>
		  <REMOVE ,DOOR-CRACK>
		  <FSET ,INNER-DOOR ,OPENBIT>
		  <FSET ,INNER-DOOR ,RMUNGBIT>
		  <COND (<HERE? ,INNER-CORRIDOR>
			 <TELL CR
"The door shatters, opening the way for the ninja!" CR>)
			(<HERE? ,OUTER-ROOM>
			 <TELL CR
"Suddenly, you hear the door crash to the floor, and the ninjas
are through!" CR>)>)>>

<OBJECT DOOR-CRACK
	(DESC "crack")
	(SYNONYM CRACK)
	(FLAGS NDESCBIT)
	(ACTION DOOR-CRACK-F)>

<ROUTINE DOOR-CRACK-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"The crack is large enough to fire a pistol through." CR>)
	       (<P? SHOOT * DOOR-CRACK>
		<PERFORM ,V?SHOOT ,PRSO ,NINJA>
		<RTRUE>)>>

<ROUTINE I-NINJA-VS-SECRET-DOOR ("AUX" CNT NUM)
	 <COND (<AND <FSET? ,SECRET-REDOUBT-DOOR ,OPENBIT>
		     <NOT <FSET? ,SECRET-REDOUBT-DOOR ,RMUNGBIT>>>
		<DEQUEUE I-NINJA-VS-SECRET-DOOR>
		<RFALSE>)
	       (<NOT <ZERO? <SET CNT <GETP ,BOLTS ,P?COUNT>>>>
		<COND (<EQUAL? .CNT 1 2 4> <SET NUM 1>)
		      (<EQUAL? .CNT 2 5 6> <SET NUM 2>)
		      (ELSE <SET NUM 3>)> 
		<COND (<OR <EQUAL? .NUM 3>
			   <PROB <* .NUM 33>>>
		       <FCLEAR ,SECRET-REDOUBT-DOOR ,LOCKED>
		       <FSET ,SECRET-REDOUBT-DOOR ,OPENBIT>)>
		<COND (<HERE? ,SECRET-REDOUBT>
		       <COND (<FSET? ,SECRET-REDOUBT-DOOR ,OPENBIT>
			      <TELL CR
"The ninja smash against the ">
			      <COND (<EQUAL? .NUM 3>
				     <TELL
"unsecured door, and it bursts open!" CR>
				     <RTRUE>)
				    (ELSE
				     <TELL
"partly secured door, the ">
				     <COND (<EQUAL? .NUM 2>
					    <TELL "bolt tears">)
					   (ELSE
					    <TELL "bolts tear">)>
				     <TELL
" free, and the door bursts open!" CR>
				     <RTRUE>)>)
			     (ELSE
			      <TELL CR
"The door jolts inward as the open bolts wiggle uselessly." CR>
			      <RTRUE>)>)
		      (<HERE? ,BALCONY>
		       <TELL CR
"You can hear the ninja hitting the door in the redoubt." CR>)
		      (ELSE <RFALSE>)>)>
	 <ZLINES ,DOOR-CNT
		 (<COND (<HERE? ,SECRET-REDOUBT>
			 <TELL CR
"There is a sudden hammering and a harsh muffled voice from outside.  Mariko
licks her dry lips.  \"He said to open the door and surrender
or he'd -- he'd blow it up.\"" CR>)>)
		 (<COND (<HERE? ,SECRET-REDOUBT>
			 <TELL CR
"The muffled voice becomes angrier and more demanding">
			 <COND (<IN? ,ETSU ,HERE>
				<TELL ", all eyes in the room look at you">)>
			 <TELL ".  Mariko translates, \"He said, if we open the
door and surrender, everyone will go free except for you.  He said
they want you as a hostage, Anjin-san.\"" CR>)>)
		 (<COND (<HERE? ,SECRET-REDOUBT>
			 <TELL CR
"A ferocious pounding on the door, iron clanging on iron, then
the voice begins, a short violent crescendo.  All sound outside ceases.  \"Get
away from the door,\" Mariko shouts, \"He's going to explode
the door!\"" CR>)>)
		 (4
		  <MOVE ,NINJA ,SECRET-REDOUBT>
		  <COND (<LOC ,NINJA-LEADER>
			 <MOVE ,NINJA-LEADER ,SECRET-REDOUBT>)>
		  <MOVE ,SECRET-REDOUBT-DOOR ,SECRET-REDOUBT>
		  <FSET ,SECRET-REDOUBT-DOOR ,OPENBIT>
		  <FSET ,SECRET-REDOUBT-DOOR ,RMUNGBIT>
		  <COND (<IN? ,MARIKO ,SECRET-REDOUBT>
			 <FSET ,MARIKO ,RMUNGBIT>
			 <FSET ,MARIKO ,SCOREBIT>
			 <MOVE ,ROSARY ,MARIKO>)>
		  <COND (<HERE? ,SECRET-REDOUBT>
			 <DEQUEUE I-LOAD-PISTOL>
			 <COND (<HELD? ,MARIKO>
				<TELL CR
"Mariko pounds you on the shoulders.  \"Let me go, Anjin-san!  Let me...\"">
				<TELL G"The explosion
blows you aside as the door wrenches loose from its hinges and blasts
into the room"><TELL ", killing you instantly." CR>
				<JIGS-UP>
				<RFATAL>)
			       (ELSE
				<FSET ,BLACKTHORNE ,RMUNGBIT> ;"out of it"
				<B-LIE-DOWN>
				<COND (<IN? ,PISTOL ,BLACKTHORNE>
				       <MOVE ,PISTOL ,HERE>
				       <FSET ,PISTOL ,NDESCBIT>)>
				<MARGINAL-PIC ,P-EXPLOSION <>
					      ,P-EXPLOSION-CORNER>
				<TELL CR
"Mariko presses back against the iron and calls out firmly, \"I, Toda
Mariko, protest this shameful attack and by my death --\"">
				<TELL G" The explosion
blows you aside as the door wrenches loose from its hinges and blasts
into the room">
<TELL " and shrieks off a far wall.  The detonation knocks you off
your feet.  Smoke gushes into the room, the ninja
following instantly.  The door comes to rest in a corner." CR>)>)
			(<HERE? ,BALCONY>
			 <TELL CR
"There is a tremendous explosion in the redoubt, and smoke and debris
pour out onto the balcony." CR>)>)
		 (<COND (<AND <HERE? ,SECRET-REDOUBT>
			      <FSET? ,MARIKO ,RMUNGBIT>>
			 <TELL CR
"A ninja goes to his knees beside Mariko, seeing at once that
she is broken and dying fast." CR>)>)
		 (<COND (<FSET? ,MARIKO ,RMUNGBIT>
			 <FSET ,MARIKO ,DEAD>)>
		  <COND (<IN? ,NINJA <LOC ,ACHIKO>>
			 <FSET ,ACHIKO ,DEAD>
			 <COND (<HERE? <LOC ,ACHIKO>>
				<TELL CR
"The ninja recognizes Achiko, draws his knife, and as she
charges him, knifes her in the left breast." CR>)
			       (ELSE
				<TELL CR
"You hear a woman's scream, then all is silent." CR>)>)>)
		 (<COND (<FSET? ,MARIKO ,RMUNGBIT>
			 <REMOVE ,NINJA>
			 <FSET ,NINJA ,INVISIBLE>
			 <REMOVE ,NINJA-LEADER>
			 <DEQUEUE I-NINJA-COWED>
			 <COND (<HERE? ,SECRET-REDOUBT>
				<TELL CR
"The ninja leader signals the retreat, and the ninja melt
away into the night." CR>)>)>)
		 (<COND (<FSET? ,MARIKO ,RMUNGBIT>
			 <MOVE ,YABU ,SECRET-REDOUBT>
			 <COND (<HERE? ,SECRET-REDOUBT>
				<TELL CR
"Yabu comes into the room, his face ashen.  He looks over, sees you
are still alive, and much of the anxiety leaves him.  He looks at
Mariko, rasps an order, then rips off his kimono and covers her to
the neck." CR>)>)>)
		 (<COND (<FSET? ,MARIKO ,RMUNGBIT>
			 <COND (<HERE? ,SECRET-REDOUBT>
				<TELL CR
"Your eyes clear for a moment and you see Yabu, his image twisting
drunkenly, then you see Mariko.  You can't tell if she is alive or
dead." CR>)>)>)
		 (DELAY
		  <COND (<NOT <FSET? ,MARIKO ,RMUNGBIT>>
			 <RFALSE>)
			(<G? ,DELAY-CNT 4>)
			(<AND <FSET? ,MARIKO ,RMUNGBIT>
			      <FSET? ,MARIKO ,SCOREBIT>>
			 <RFALSE>)>)
		 (<DEQUEUE I-NINJA-VS-SECRET-DOOR>
		  <TELL CR
"Your head seems to burst with red and purple light and you
collapse.  Kind hands catch you and help you to the floor." CR>
		  <NEXT-SCENE>)>>

<ROUTINE ETSU-AFTER-F ()
	 <TELL
"On the balcony, Lady Etsu stands, supported by her maid.  \"I, Maeda
Etsu,\" she says, her voice frail, \"attest that Toda Mariko-sama
cast away her life to save herself from dishonorable capture, and that
but for the barbarian samurai's bravery Lady Toda would have been
captured and dishonored.  I accuse Lord General Ishido of mounting this
dishonorable attack.  I ask you all to bear witness that I can no longer
live with this shame.\"|
|
She mounts painfully to the battlement.  Everyone bows to her.|
|
\"I have told the truth.  I attest to it by my death,\" she says.  Then
she closes her eyes thankfully and lets herself fall forward to welcome
death.">>

<OBJECT ROSARY
	(DESC "rosary")
	(SYNONYM ROSARY CROSS)
	(ADJECTIVE GOLD TINY GOLDEN)
	(FLAGS TAKEBIT WEARBIT)
	(ACTION ROSARY-F)>

<ROUTINE ROSARY-F ()
	 <COND (<VERB? TAKE>
		<TELL
"You lift it gently from her chest.  How, you wonder, could she be at
once samurai and Christian?  How could she choose her own death to
aid her liege Lord, and at the same time pray to the Christian God
who abhors suicide?  "I"Karma, neh?""  You did not need to understand
her, only to love her.  You replace the rosary." CR>)>>

<END-SEGMENT>

<BEGIN-SEGMENT YOKOHAMA>

<CONSTANT J-GRAB-PISTOL 180>

<ROOM YOKOHAMA
      (LOC ROOMS)
      (SCENE S-YOKOHAMA)
      (DESC "Yokohama")
      (FDESC
"You recuperate for a few days, and then, to your surprise, your guards are
gone.  You are taken down to the dock, where you are met by the Captain-General
of the Black Ship, Ferriera, and Dell'Aqua, the Father-Visitor of the Jesuits.|
|
Dell'Aqua says, \"Pilot, I'm taking you to your galley.  Are you all right?\"|
|
\"You're really letting me go?  Why?\"|
|
\"Because the Lady Mariko asked us to protect you.\"|
|
\"But that's no reason!  You wouldn't do that just because she asked you.\"|
|
\"I agree,\" Ferriera says.  \"Eminence, why not tell him the whole truth?\"|
|
\"It doesn't make sense.  You know I'm going to destroy you.  I'll take your
Black Ship.\"|
|
Ferriera laughs scornfully.  \"With what, Ingeles?  You have no ship!\"")
      (FLAGS OUTSIDE ONBIT SCOREBIT)
      (SCORE 1)
      (GLOBAL LG-ERASMUS LG-SEA)
      (ACTION YOKOHAMA-F)>

<ROUTINE YOKOHAMA-F ("OPT" (RARG <>))
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<MOVE ,VINCK ,HERE>
		<FSET ,VINCK ,OPENBIT>
		<FSET ,VINCK ,SEARCHBIT>
		<FSET ,VINCK ,CONTBIT>
		<FCLEAR ,VINCK ,NDESCBIT>
		<FCLEAR ,PISTOL ,NDESCBIT>
		<QUEUE I-VINCK-NUTS -1>)
	       (<RARG? LOOK>
		<TELL
"This is the harbor at Yokohama, the best harbor you have ever seen, a
beautiful protected anchorage.  The burned hulk of the "I"Erasmus"" lies in the
shallows just off the beach.  All around you are the grisly remains of the
heads of the guards who failed in their duty when the "I"Erasmus"" burned, more
than a hundred.  Seabirds ravage and quarrel over the feast." CR>)
	       (<RARG? BEG>
		<COND (<P? EXAMINE LG-ERASMUS>
		       <MARGINAL-PIC ,P-BURNED-ERASMUS>
		       <TELL
"You study the hulk of the ship.  Naga has told you it happened at night,
during an earthquake and "I"tai-fun"".  It had still been burning, there
in the shallows, on the next day.  Now only the black gutted ribs rise out
of the sea." CR>)
		      (<P? (BOARD WALK-TO) LG-ERASMUS>
		       <TELL
"She's aground in twenty feet of water, and you have no boat." CR>)
		      (<P? TAKE PISTOL>
		       <COND (<FSET? ,VINCK ,DEAD>
			      <RFALSE>)
			     (ELSE
			      <PERFORM ,V?ATTACK ,VINCK>
			      <RTRUE>)>)
		      (<AND <P? BOW VINCK>
			    <NOT <FSET? ,VINCK ,DEAD>>>
		       <TELL
"\"You've become a sod-eating Jappo, Pilot!  Look at you!  You're damned
to hell like all these heathens!\"" CR>)
		      (<AND <NOT <FSET? ,VINCK ,DEAD>>
			    <HOSTILE-VERB?>
			    <PRSO? VINCK>>
		       <COND (<IN? ,PISTOL ,VINCK>
			      <COND (<JIGS-UP? ,J-GRAB-PISTOL
"You take another look at Vinck's mad eyes, and think better of it.">
				     <TELL
"You grab for Vinck's pistol, hoping that his madness will give you time
to get it before he fires, but you're wrong, he's fast, too fast!  The
pistol fires, and you realize that you were ready for death, prepared, and
that it doesn't matter.  You've lost Mariko, and lost the "I"Erasmus"", and it's
only "I"karma"", nothing to worry about." CR>
				     <JIGS-UP>)
				    (ELSE <RTRUE>)>)
			     (ELSE
			      <TELL
"You can hardly tell whether it's rage or a desire to snap him out of his
fit, but either way, it doesn't work." CR>)>)
		      (<AND <P? (MOVE BURY HELP TAKE) VINCK>
			    <FSET? ,VINCK ,DEAD>>
		       <MOVE ,VINCK ,WINNER>
		       <SCORE-OBJECT ,YOKOHAMA>
		       <MARGINAL-PIC ,P-VINCK <>>
		       <TELL
"You close his eyes and pick him up and sling him over your shoulder and
walk back.  Samurai run toward you, Naga and Yabu at their head.|
|
\"What happened, Anjin-san?\"|
|
\"He went mad.\"" CR>
		       <NEXT-SCENE>)>)>>

<OBJECT HEADS
	(LOC YOKOHAMA)
	(DESC "severed heads")
	(SYNONYM HEADS HEAD POLE POLES REMAINS)
	(ADJECTIVE SEVERED GRISLY DEAD)
	(FLAGS NDESCBIT)
	(ACTION HEADS-F)>

<ROUTINE HEADS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"They have been here on the beach for several days.  They are no better
for the experience." CR>)
	       (<OR <VERB? TAKE>
		    <HOSTILE-VERB?>>
		<TELL
"You want to lash out, to destroy whoever burned the "I"Erasmus"", but
these men are beyond all revenge.  You want to just take them away and
bury them.  "I"Shigata ga nai, neh?" CR>)>>

<ROUTINE I-VINCK-NUTS ()
	 <ZLINES ,VINCK-CNT
		 (<TELL CR
"\"You should never have left her to them, Pilot!  What are we going to do
now?  How are we going to get home?  You should have left her at Yedo safe,
an' us safe, with our eters.\"  The whine in Vinck's voice irritates
you.  Everything about him irritates you now.  Three times in the last week you
have almost told your vassals to knife Vinck quietly and throw him overboard
to put him out of his misery.  But you always curbed your temper and sought
out Yabu.  Near Yabu, Vinck made no sound, petrified of him, and rightly." CR>)
		 (<TELL CR
"\"We're marooned with these piss eaters for the rest of our lives!  Eh?\"" CR CR
"\"We're to grovel to these God-cursed heathens for the rest of our
muck-eating lives and how long'll that be when all they talk about's war war
war?\"" CR>)
		 (<TELL CR
"\"It's your fault!  You said to come to the Japans and we come and how many
died coming here?  You're to blame.\"" CR CR
"\"How're we going to get home?  That's your God-cursed job, to get us
home!  How you going to do that?  Eh?\"|
|
\"Another of our ships'll get here, Johann.  We've just got to wait,\" you
reply." CR>)
		 (<MOVE ,PISTOL ,VINCK>
		  <PUTP ,PISTOL ,P?OWNER ,VINCK>
		  <FCLEAR ,PISTOL ,RMUNGBIT>
		  <TELL CR
"\"Wait?  Five muck-plagued years?  Twenty?\"  Vinck's mind snaps.  \"They're going
to chop off our heads and stick them like those there and the birds'll eat
us ... \"  A paroxysm of insane laughter shakes him and he reaches into his
shirt for his pistol.  Vinck waves the pistol in your face." CR>)
		 (<FSET ,VINCK ,DEAD>
		  <TELL CR
"Vinck takes to his heels down the beach, the seabirds scudding into the air,
mewing and cawing out of his path.  Vinck runs for a frantic hundred paces or
more, then collapses, ending up on his back, his legs still moving, arms
waving, mouthing obscenities.  After a moment he turns on his belly with a
last shriek, facing you, and freezes." CR>)
		 (<CRLF>
		  <COND (<IN? ,PISTOL ,VINCK>
			 <TELL "The pistol is leveled at you, Vinck's">)
			(ELSE
			 <TELL "His empty fist is pointed at you, his">)>
		  <FSET ,VINCK ,RMUNGBIT>
		  <TELL " eyes staring with demented antagonism,
the lips pulled back from his teeth.  Vinck is dead." CR>)
		 (DELAY
		  <COND (<NOT <HELD? ,VINCK>>
			 <RFALSE>)>)
		 (<DEQUEUE I-VINCK-NUTS>
		  <RFALSE>)>> 

<END-SEGMENT>



"S-AFTERMATH"

<BEGIN-SEGMENT AFTERMATH>

<ROOM STABLE
      (LOC ROOMS)
      (SCENE S-AFTERMATH)
      (SCORE 3)
      (AFTER NEVER-AFTER-F)
      (FDESC
"Toranaga is checking the girths of his saddle.  Deftly he knees the
horse in the belly, her stomach muscles relax, and he tightens the
strap another two notches.  Rotten animal, he thinks, despising horses
for their constant trickeries and treacheries and ill-tempered
dangerousness.  He waits a moment and knees the horse hard again.  The
horse grunts and rattles her bridle and he tightens the straps completely.|
|
\"Good, Sire!  Very good,\" the Hunt Master says with admiration.  \"Many
would have been satisfied the first time.\"")
      (DESC "Stable")
      (SYNONYM STABLE)
      (LDESC
"This is the stable area of the camp at Anjiro.")
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL LG-SHIP LG-NINJA CELLAR-DOOR)
      (ACTION STABLE-F)>

<ROUTINE STABLE-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE>
		<FCLEAR ,LG-NINJA ,INVISIBLE>
		<MOVE ,YABU ,HERE>
		<MOVE ,OMI ,HERE>
		<MOVE ,HIRO-MATSU ,HERE>
		<MOVE ,TORANAGA ,HERE>
		<THIS-IS-IT ,TORANAGA>
		<QUEUE I-STABLE -1>)
	       (<RARG? BEG>
		<COND (<EQUAL? ,AFTERMATH-QUESTION 4>
		       <COND (<P? TELL-ABOUT TORANAGA SEALED-SCROLL>
			      <BUILD-ANOTHER-SHIP>)
			     (<AND <P? MAKE LG-SHIP>
				   <TRY-QCONTEXT?>>
			      <RTRUE>)>)
		      (<EQUAL? ,AFTERMATH-QUESTION 1>
		       <COND (<P? TELL-ABOUT TORANAGA>
			      <COND (<PRSI? YABU PLAN>
				     <SETG WINNER ,TORANAGA>
				     <PERFORM ,V?NO>
				     <RTRUE>)
				    (ELSE
				     <TELL
G"Toranaga looks annoyed.  \"Please answer the question, Anjin-san.\"" CR>)>)>)
		      (<EQUAL? ,AFTERMATH-QUESTION 2>
		       <COND (<P? TELL-ABOUT TORANAGA>
			      <COND (<PRSI? LG-NINJA>
				     <YABU-BETRAYED-YOU>)
				    (<PRSI? PLAN>
				     <TELL
"\"I don't care about that!  What did he do?  I'm not interested in talk,\"
replies Toranaga." CR>)
				    (ELSE
				     <TELL
G"Toranaga looks annoyed.  \"Please answer the question, Anjin-san.\"" CR>)>)>)>)>>

<ROUTINE I-STABLE ()
	 <ZLINES ,STABLE-CNT
		 (<MOVE ,SEALED-SCROLL ,BLACKTHORNE>
		  <THIS-IS-IT ,SEALED-SCROLL>
		  <TELL CR
"\"Listen, Anjin-san, before Mariko-sama
left Yedo, she gave me this.  Mariko-sama said if you live after Osaka --
if you live, understand -- she asked me to give this to you.\"  Toranaga hands you a sealed scroll." CR>)
		 (DELAY
		  <COND (<FSET? ,SEALED-SCROLL ,SCOREBIT>
			 <TELL CR
"\"Please ">
			 <COND (<FSET? ,SEALED-SCROLL ,OPENBIT>
				<TELL "read the message">)
			       (ELSE
				<TELL "open the scroll">)>
			 <TELL ", Anjin-san.\"" CR>
			 <RTRUE>)>)
		 (<SETG AFTERMATH-QUESTION 4>
		  <SETG QCONTEXT ,TORANAGA>
		  <TELL CR
G"\"What did the message say, Anjin-san?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,AFTERMATH-QUESTION 4>
			 <TELL CR
G"\"What did the message say, Anjin-san?\"" CR>
			 <RTRUE>)>)
		 (<TELL CR
"Toranaga turns to the watchers.  \"So, Hiro-matsu-san, how's the training
of the musket regiment?\"|
|
Hiro-matsu scowls.  \"I still think this is all dishonorable and
unnecessary.  Soon we'll be able to forget it.  We'll piss all over
Ishido without this
sort of treachery.\"" CR>)
		 (<SETG AFTERMATH-QUESTION 1>
		  <SETG QCONTEXT ,TORANAGA>
		  <THIS-IS-IT ,YABU>
		  <TELL CR
"Yabu says, \"Please excuse me, but without these guns, we'll lose.  This
is a modern war, this way we've a chance to win.\"  He looks back at
Toranaga.  \"I heard in the night that Jikkyu's dead.  My informant reports
he died two days ago.  He's been sick for some time.  Doesn't this open
up the southern route?  We could slice into Ishido's underbelly!\"|
|
\"What did Jikkyu die of?\" asks Toranaga.|
|
\"Sickness, Sire.\"|
|
\"A five-hundred-koku sickness?\"|
|
Yabu laughs nervously, wondering how Toranaga could have breached his
security net.  \"Yes, I would assume so.  Cheap, "I"neh""?  Five hundred
koku for the southern route.\"|
|
Hiro-matsu says stiffly to Toranaga, \"Please excuse me but I think
that's a disgusting story.\"|
|
\"Treachery's a weapon of war.  Jikkyu was an enemy and a fool.  Yabu-sama
has served me well.  Here and at Osaka.  "I"Neh"", Yabu-san?\"|
|
\"I always try to serve you loyally, Sire.\"|
|
\"Yes, it is true.\"  Toranaga turns to you.  \"Isn't it true, Anjin-san,
that Yabu served me loyally at Osaka?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,AFTERMATH-QUESTION 1>
			 <COND (<G? ,DELAY-CNT 3>
				<TORANAGA-LOSES-PATIENCE>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"Anjin-san, isn't it true that Yabu is my loyal vassal?,\" asks
Toranaga." CR>
				<RTRUE>)>)>)
		 (<SETG AFTERMATH-QUESTION 2>
		  <THIS-IS-IT ,YABU>
		  <SETG QCONTEXT ,TORANAGA>
		  <TELL CR
"Calmly and genially, Toranaga asks \"What did Yabu do, then, to
betray me?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,AFTERMATH-QUESTION 2>
			 <COND (<G? ,DELAY-CNT 3>
				<TORANAGA-LOSES-PATIENCE>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"What did Yabu do, Anjin-san?\" asks Toranaga." CR>
				<RTRUE>)>)>)
		 (<SETG AFTERMATH-QUESTION 3>
		  <THIS-IS-IT ,YABU>
		  <SETG QCONTEXT ,TORANAGA>
		  <TELL CR
"Toranaga, steel in his voice, but still very quiet, asks \"What did
he say to the ninja?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,AFTERMATH-QUESTION 3>
			 <COND (<G? ,DELAY-CNT 3>
				<TORANAGA-LOSES-PATIENCE>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"What did he say, Anjin-san?\" asks Toranaga." CR>
				<RTRUE>)>)>)
		 (<MOVE ,OMI ,GENERIC-OBJECTS>
		  <MOVE ,YABU ,GENERIC-OBJECTS>
		  <MOVE ,BUNTARO ,GENERIC-OBJECTS>
		  <TELL CR
"\"Thank you, Anjin-san.  You have confirmed what was said by a servant
who survived the attack.  I wanted the word of a samurai as well.\"|
|
\"What am I accused of, Sire?  Helping "I"ninja""?  Ridiculous!  What have
the fantasies of servants and barbarians to do with me?  They're liars!\"|
|
\"Yabu-sama, did you do these things?\" Hiro-matsu asks.|
|
\"Of course not!\"|
|
Toranaga says, \"But I think you did, so all your lands are forfeit.  Please
slit your belly today.  Before noon.  What arrangements do you
want made?\"|
|
\"Just some paper and ink and a brush for my will and death poem, and
two tatamis -- there's no reason to hurt my knees or to kneel in the
dirt like a stinking peasant.  "I"Neh?""\" Yabu adds with bravado.|
|
Buntaro and a party of samurai warily lead Yabu away, looking from
one to the other with suppressed excitement." CR>)
		 (<MOVE ,PEDESTAL ,HERE>
		  <THIS-IS-IT ,YABU-HEAD>
		  <MOVE ,OMI ,HERE>
		  <TELL CR
"Just after noon, Omi returns and unwraps Yabu's head.  \"Lord Kasigi
Yabu obeyed, Sire, just before noon.\"  Toranaga inspects his enemy
as he has done ten thousand times before, wondering how his head would
look after death, viewed by his conqueror, and whether terror would
show, or agony or anger or horror or all of them or none of them.  Or
dignity." CR>)
		 (<TELL CR
"\"Did he die well?\"|
|
\"The best I have ever seen, Sire.\"  He pauses.  \"Do you wish me to bury
it, or display it?\"|
|
\"Put it on a spear, facing the wreck of the Anjin-san's ship.\"|
|
\"Yes, Sire.\"|
|
\"What was his death poem?\"|
|
Omi says,|
	\"'What are clouds|
	But an excuse for the sky?|
	What is life|
	But an escape from death?'\"|
|
Toranaga smiles." CR>
		  <DEQUEUE I-STABLE>
		  <NEXT-SCENE>)>>

<ROUTINE TORANAGA-LOSES-PATIENCE ()
	 <TELL CR
"Toranaga loses his patience with you.  \"The Anjin was probably a part of
the conspiracy! Take this barbarian away and
dispose of him.  Then send the body to the "I"eta""!\"">
	 <JIGS-UP>>

<ROUTINE BUILD-ANOTHER-SHIP ()
	 <SETG AFTERMATH-QUESTION 0>
	 <SETG QCONTEXT <>>
	 <TELL
"\"Mariko-sama say this ship is not necessary.  Say build new
ship.  Say -- \"|
|
\"Ah!  Possible?  Possible?  Anjin-san?\"|
|
\"Yes,\" you reply, \"Yes!\"  And you think, by next year, a new ship,
a ship like her, trim and miniature like a Yoshitomo blade, and just
as dangerous.  Next year she'll take the Black Ship, a prize twenty
times her own weight, like Mariko did at Osaka.  \""I"The Lady"" will
be her name,\" you say aloud.|
|
Toranaga salutes you warmly, for the first time as an equal." CR>>

<ROUTINE AFTERMATH-ANSWERS ()
	 <COND (<EQUAL? ,AFTERMATH-QUESTION 4>
		<COND (<P? MAKE LG-SHIP>
		       <BUILD-ANOTHER-SHIP>)>)
	       (<EQUAL? ,AFTERMATH-QUESTION 1>
		<COND (<OR <VERB? NO IYE>
			   <AND <EQUAL? ,PRSS ,YABU>
				<P? BETRAY YOU>
				<PAST-TENSE?>>>
		       <SETG AFTERMATH-QUESTION 0>
		       <TELL
"\"No, Toranaga-sama, Yabu was not loyal to you at Osaka,\" you
reply.  Yabu starts, but Toranaga merely nods." CR>)>)
	       (<EQUAL? ,AFTERMATH-QUESTION 2>
		<COND (<YABU-LET-IN-NINJA?>
		       <YABU-BETRAYED-YOU>)>)
	       (<EQUAL? ,AFTERMATH-QUESTION 3>
		<COND (<P? BE ME YABU>
		       <SETG AFTERMATH-QUESTION 0>
		       <FSET ,YABU ,SCOREBIT>
		       <TELL
"\"He said to them, 'I am Kasigi Yabu,' and they poured through
the door into the keep.  I returned as fast as I could to protect
Mariko, Kiritsubo and the rest, knowing I would be killed if I
tried to fight them there.\"" CR>
		       <SCORE-OBJECT ,YABU>)>)>>

<ROUTINE YABU-BETRAYED-YOU ()
	 <SETG AFTERMATH-QUESTION 0>
	 <TELL
"\"Yabu betrayed you, Sire.  I followed him to the cellars of the
keep where he let in a force of "I"ninja"".\"  Yabu is turning red
with barely suppressed rage." CR>
	 <SCORE-OBJECT ,TRAITOR>>

<ROUTINE YABU-LET-IN-NINJA? ()
	 <COND (<EQUAL? ,PRSS ,YABU>
		<COND (<P? LET-IN LG-NINJA> <RTRUE>)
		      (<AND <P? SEND LG-NINJA>
			    <PAST-TENSE?>>
		       <RTRUE>)
		      (<AND <P? (OPEN UNLOCK) CELLAR-DOOR>
			    <PAST-TENSE?>>
		       <RTRUE>)
		      (<AND <P? (KILL BETRAY) MARIKO>
			    <PAST-TENSE?>>
		       <RTRUE>)>)
	       (<NOT ,PRSS>
		<COND (<P? TELL-ABOUT TORANAGA LG-NINJA>
		       <RTRUE>)>)>>

<GLOBAL AFTERMATH-QUESTION <>>

<OBJECT SEALED-SCROLL
	(SDESC "sealed scroll")
	(OWNER MARIKO)
	(SCENE S-AFTERMATH)
	(SYNONYM SCROLL LETTER MESSAGE SEAL)
	(ADJECTIVE SEALED RICE-PAPER)
	(FLAGS CONTBIT SEARCHBIT TAKEBIT READBIT SCOREBIT OPENABLE)
	(ACTION SEALED-SCROLL-F)>

<ROUTINE SEALED-SCROLL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "It's a rice-paper scroll." CR>)
	       (<VERB? READ>
		<COND (<NOT <HELD? ,PRSO>>
		       <NOT-HOLDING ,PRSO>)
		      (<FSET? ,PRSO ,OPENBIT>
		       <TELL
"Mariko has written in Latin \"Thou.  I love thee.  If this is read by
thee then I am dead in Osaka and perhaps, because of me, thy ship
is dead too.  I may sacrifice this most prized part of thy life because
of my Faith, to safeguard my Church, but more to save thy life which is
more precious to me than everything -- even the interest of my Lord
Toranaga.  It may come to a choice, my love: thee or thy ship.  So sorry,
but I choose life for thee.  This ship is doomed anyway -- with or
without thee.  I will concede thy ship to thine enemy so that thou may
live.  This ship is nothing.  "I"Build another.""  I believe Lord Toranaga
will give thee all the craftsmen and carpenters necessary.  Build another
ship and build another life, my love.  Forgive me -- but thy life is
all important.  I love thee.\"" CR>
		       <SCORE-OBJECT ,SEALED-SCROLL>)
		      (ELSE
		       <YOULL-HAVE-TO "break the seal">)>)
	       (<P? (SHOW GIVE) * TORANAGA>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL
"The message is written in Latin.  It's gibberish to him." CR>)
		      (ELSE
		       <TELL
"He has already seen the scroll.  He gave it to you, didn't he?" CR>)>)
	       (<AND <VERB? MUNG OPEN TEAR>
		     <NOUN-USED? ,PRSO ,W?SEAL>>
		<COND (<NOT <HELD? ,PRSO>>
		       <NOT-HOLDING ,PRSO>)
		      (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <FSET ,PRSO ,OPENBIT>
		       <NEW-SDESC ,SEALED-SCROLL "scroll">
		       <TELL
"You break the seal and open the scroll." CR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)>>

<OBJECT PEDESTAL
	(DESC "pedestal")
	(SCENE S-AFTERMATH)
	(SYNONYM PEDESTAL SPIKE)
	(ADJECTIVE SMALL)
	(FLAGS OPENBIT CONTBIT SEARCHBIT TAKEBIT)
	(ACTION YABU-HEAD-F)>

<OBJECT YABU-HEAD
	(LOC PEDESTAL)
	(DESC "head")
	(SCENE S-AFTERMATH)
	(OWNER YABU)
	(SYNONYM HEAD MASK)
	(ADJECTIVE DEATH)
	(FLAGS PERSON DEAD TAKEBIT)
	(ACTION YABU-HEAD-F)>

<ROUTINE YABU-HEAD-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"Yabu's death mask shows only berserk wrath, the lips pulled back
into a ferocious challenge.  The head has been freshly washed, the
hair groomed, and it is stuck
on the spike of a small pedestal that is customarily used for the
viewing." CR>)
	       (<VERB? TAKE>
		<TELL
"You pick up the head and its pedestal, at once fascinated and
repelled.  You replace it carefully, thinking it was Yabu's "I"karma"" to
end this way." CR>)>>

<ROUTINE NEVER-AFTER-F ()
	 <TELL
"Before long, you and a hundred samurai are working to raise the keel
of the "I"Erasmus"".  One day, you notice Father Alvito standing on a
dune overlooking the beach.  You join him.|
|
\"You really believe you can float the hulk?\" he asks.  \"No matter.  It
will all be a waste, all that labor.\"|
|
\"There'll be another 'Act of God?'  Another sabotage?  Then I'll build
another, and if that fails, another.  I'll get back to England and then
I'm coming back, with a privateer!\"|
|
\"Yes. I know. That's why you will never leave.  You know too much,
Anjin-san.  You're a fine adversary, one to respect.  Surely we can have
a truce, and make peace.  I ask it because of Mariko-sama.\"|
|
\"I'll offer you a truce, not peace.  In her memory.\"" CR>>

<END-SEGMENT>



"S-EPILOGUE"

<BEGIN-SEGMENT SEKIGAHARA>

<ROOM SEKIGAHARA
      (LOC ROOMS)
      (SCENE S-EPILOGUE)
      (DESC "Sekigahara")
      (FLAGS ONBIT)
      (SCORE 0)
      (ACTION SEKIGAHARA-F)>

<ROUTINE SEKIGAHARA-F ("OPT" (RARG <>) "AUX" LEFT WIDE Y)
	 <COND (<RARG? ENTER>
		<SET LEFT <WINGET ,S-TEXT ,WLEFT>>
		<SET WIDE <WINGET ,S-TEXT ,WWIDE>>
		<PICINF ,P-CREST ,YX-TBL>
		<WINDEF 4
			<WINGET ,S-TEXT ,WTOP> .LEFT
			<+ <GET ,YX-TBL 0> <* 2 ,FONT-Y>> .WIDE>
		<SCREEN 4>
		<CLEAR 4>
		<CENTER-PIC ,P-CREST>
		<SET Y <+ <WINGET 4 ,WHIGH> <WINGET 4 ,WTOP>>>
		<WINDEF ,S-TEXT .Y .LEFT <- <LOWCORE VWRD> .Y 1> .WIDE>
		<SCREEN ,S-TEXT>)
	       (<RARG? LOOK>
		<TELL
"That year, at dawn on the twenty-first day of the tenth month, the
Month without Gods, the main armies clashed.  It was in the mountains
near Sekigahara, astride the North Road, the weather foul -- fog, then
sleet.  By late afternoon Toranaga had won the battle and the slaughter
began.  Forty thousand heads were taken.|
|
Three days later Ishido was captured alive and Toranaga genially
reminded him of the prophecy and sent him in chains to Osaka for
public viewing, ordering the "I"eta"" to plant the General Lord Ishido's
feet firm in the earth, with only his head outside the earth, and to
invite passersby to saw at the most famous neck in the realm with a
bamboo saw.  Ishido lingered three days and died very old." CR CR>
		<TYPE-ANY-KEY>
		<RESET-MARGIN>
		<CLEAR ,S-TEXT>
		<FINISH T>)>>

<END-SEGMENT>
