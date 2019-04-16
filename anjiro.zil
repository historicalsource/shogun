"ANJIRO for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT ANJIRO>

<CONSTANT J-PLUNGE 20>
<CONSTANT J-GUARDS 21>

<ROOM GARDEN
      (LOC ROOMS)
      (SCENE S-ANJIRO S-RODRIGUES)
      (DESC "Garden")
      (SYNONYM GARDEN)
      (ADJECTIVE SMALL)
      (LDESC
"This is a small garden surrounded by a high wall.  It is unlike anything
you have ever seen: a little waterfall and stream and a small bridge
and manicured pebbled paths and rocks and flowers and shrubs.  It's so
clean, so neat.  The house is to the west, the village to the east.")
      (IN PER MURA-HOUSE-EXIT)
      (WEST PER MURA-HOUSE-EXIT)
      (EAST TO ANJIRO)
      (OUT TO ANJIRO)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL MURA-DOOR MURA-HOUSE LG-VILLAGE)
      (ACTION GARDEN-F)>

<ROUTINE MURA-HOUSE-EXIT ("OPT" (RARG <>) (STRICT? <>))
	 <COND (<RARG? ENTER> ,MURA-HOUSE)
	       (<FSET? ,BOOTS ,WEARBIT>
		<TELL
CTHE ,ONNA " runs up to you, very agitated.  As politely as she can,
she points to your boots, bowing and shaking her head." CR>
		<RFALSE>)
	       (ELSE ,MURA-HOUSE)>>

<ROUTINE GARDEN-F (RARG)
	 <COND (<RARG? ENTER>
		<COND (<SCENE? ,S-ANJIRO>
		       <QUEUE I-SEBASTIO -1>
		       <COND (<IN? ,ONNA ,MURA-HOUSE>
			      <MOVE ,ONNA ,GARDEN>)>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<P? LISTEN (<> NOISE)>
		       <TELL
G"It sounds like a group of people.  ""You can't be sure, but one seems
to be speaking Portuguese!" CR>)
		      (<P? EXAMINE NOISE>
		       <TELL "You'll have to go out to do that." CR>)
		      (<P? LISTEN PORTUGUESE>
		       <TELL
"It definitely sounds like Portuguese, but you're too far away to
be sure." CR>)
		      (<AND <SCENE? ,S-ANJIRO>
			    <VERB? WALK WALK-TO>
			    <HENCHMEN-RESTRAIN>>
		       <RTRUE>)>)>>

<OBJECT HIGH-WALL
	(LOC GARDEN)
	(DESC "high wall")
	(SYNONYM WALL)
	(ADJECTIVE HIGH)
	(FLAGS NDESCBIT)
	(ACTION HIGH-WALL-F)>

<ROUTINE HIGH-WALL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The wall is made of small stones mortared together with great
precision.  It is at first completely a wall and at then suggests a
high mountain
cliff with the garden plants growing up to the base." CR>)
	       (<VERB? CLIMB-UP CLIMB-FOO>
		<TELL
"You're too weak to climb the wall." CR>)>>

<OBJECT WATERFALL
	(LOC GARDEN)
	(DESC "little waterfall")
	(SYNONYM WATERFALL WATER POOL)
	(ADJECTIVE LITTLE)
	(FLAGS NDESCBIT)
	(ACTION WATERFALL-F)>

<ROUTINE WATERFALL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"A fall of sweet, clear water drops from one level of the garden to
the other.  The gentle tinkling sound is very soothing." CR>)
	       (<VERB? LOOK-INSIDE>
		<TELL
"The little pool at the base of waterfall is filled with carp." CR>)
	       (<VERB? DRINK>
		<TELL
"The water is cool and tasty." CR>)>>

<OBJECT PATHS
	(LOC GARDEN)
	(DESC "manicured path")
	(SYNONYM PATH PATHS)
	(ADJECTIVE MANICURED)
	(FLAGS NDESCBIT)
	(ACTION PATHS-F)>

<ROUTINE PATHS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The paths lead in neat, seemingly chance-laid loops throughout the
garden." CR>)
	       (<VERB? FOLLOW>
		<TELL
"You walk about for a while, following the paths.  The garden is so
neat, so orderly.  Just walking in it is calming.  You haven't seen a
living plant during all your long voyage, and here there are so many." CR>)>>

<OBJECT SMALL-BRIDGE
	(LOC GARDEN)
	(SCENE S-ANJIRO)
	(DESC "small bridge")
	(SYNONYM BRIDGE)
	(ADJECTIVE SMALL)
	(FLAGS NDESCBIT)
	(ACTION SMALL-BRIDGE-F)>

<ROUTINE SMALL-BRIDGE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's a small, decorative footbridge that crosses the little stream." CR>)
	       (<VERB? CROSS>
		<TELL
"You cross the little bridge, standing in the center looking at the slowly
flowing stream for a while.  The garden is very peaceful.  You cross
back." CR>)>>

<OBJECT STREAM
	(LOC GARDEN)
	(DESC "stream")
	(SYNONYM STREAM)
	(ADJECTIVE LITTLE)
	(FLAGS NDESCBIT VEHBIT)
	(ACTION STREAM-F)>

<ROUTINE STREAM-F ()
	 <COND (<VERB? BOARD STEP-ON CLIMB-DOWN>
		<TELL
"You content yourself with splashing a little water on your face." CR>)>>

<OBJECT PLANTS
	(LOC GARDEN)
	(DESC "plant")
	(SYNONYM FLOWER SHRUB FLOWERS SHRUBS PLANT)
	(FLAGS NDESCBIT)
	(ACTION PLANTS-F)>

<ROUTINE PLANTS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The garden is planted with flowers, shrubs, and odd small trees.  It
looks like a small patch of orderly wilderness." CR>)
	       (<VERB? TAKE>
		<TELL
"You think better of disturbing the harmony of the garden." CR>)
	       (<VERB? SMELL>
		<TELL
"The flowers smell very nice.  Your nose has had little to smell of
comparable fragrance for years." CR>)>>



<BEGIN-SEGMENT RODRIGUES>

<ROOM ANJIRO-WATERFRONT
      (LOC ROOMS)
      (SCENE S-RODRIGUES)
      (AFTER LEAVE-ANJIRO-AFTER-F)
      (SCORE 4)
      (DESC "Waterfront")
      (FDESC
"The next day you walk down the hill, four samurai flanking you.  Ahead
the street curves with the contour of the hillside, slides down toward
the harbor.")
      (SYNONYM WATERFRONT)
      (WEST TO ANJIRO)
      (EAST TO ANJIRO-HARBOR)
      (GLOBAL LG-ERASMUS SAMURAI-GUARDS LG-SEA LG-VILLAGE LG-BAY VILLAGERS
       LG-LAND)
      (FLAGS ONBIT OUTSIDE)
      (ACTION ANJIRO-WATERFRONT-F)>

<ROUTINE ANJIRO-WATERFRONT-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE T>
		<NEW-SDESC ,HIRO-MATSU "old man">
		<FCLEAR ,HIRO-MATSU ,NOABIT>
		<FCLEAR ,HIRO-MATSU ,NOTHEBIT>
		<FSET ,HIRO-MATSU ,AN>
		<NEW-SDESC ,OMI ,OMI-NAME>
		<MOVE-CREW ,PIT>
		<REMOVE ,HENCHMAN-BODY>
		<REMOVE ,HENCHMAN-HEAD>
		<MOVE ,SECRET-RUTTER ,GENERIC-OBJECTS>
		<MOVE ,RUTTER ,GENERIC-OBJECTS>
		<MOVE ,SEA-CHEST ,PILOTS-CABIN>
		<FSET ,SEA-CHEST ,OPENBIT>
		<MOVE ,SMALL-BOAT ,ANJIRO-WATERFRONT>
		<MOVE ,BOAT-OAR ,SMALL-BOAT>
		<MOVE ,SLAVER ,ANJIRO-WATERFRONT>
		<MOVE ,MURA ,ANJIRO-WATERFRONT>
		<MOVE ,OMI ,ANJIRO-WATERFRONT>
		<MOVE ,YABU ,ANJIRO-WATERFRONT>
		<MOVE ,HIRO-MATSU ,ANJIRO-WATERFRONT>
		<MOVE ,TORANAGA ,GENERIC-OBJECTS>
		<MOVE ,ARCHERS ,ANJIRO-WATERFRONT>
		<FCLEAR ,ARCHERS ,INVISIBLE>
		<QUEUE I-MEET-RODRIGUES -1>)
	       (<RARG? LOOK>
		<TELL
"This is the waterfront of the village.  The ground is cobbled and a
stone launching ramp goes from the shore into the sea.  There are men and
women cleaning fish.  Small islands are visible to the east and south.  At
anchor, to the east, is the "I"Erasmus""." CR>)
	       (<RARG? ENTER>
		<COND (<SCENE? ,S-ANJIRO>
		       <COND (<IN? ,WINNER ,SMALL-BOAT>
			      <TELL
"You row the boat up onto the beach." CR CR>)
			     (<NOT <FSET? ,RUTTER ,RMUNGBIT>>
			      <QUEUE I-RUTTER-CLUE 1>)>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<AND <SCENE? S-RODRIGUES>
			    <OR <P? (POINT EXAMINE) LG-ERASMUS>
				<P? SHOW LG-ERASMUS RODRIGUES>>>
		       <TELL
"You look out at the "I"Erasmus"", and " THE ,RODRIGUES " watches you.">
		       <COND (<NOT <FSET? ,LIZARD ,SCOREBIT>>
			      <THIS-IS-IT ,LG-ERASMUS>
			      <SETG QCONTEXT ,RODRIGUES>
			      <TELL "She's
moored a hundred yards away.  \"Tell me about her, Ingeles,\" asks
the Portuguese.  \"She looks like a pisscutter!\"">)>
		       <CRLF>)
		      (<AND <SCENE? S-RODRIGUES>
			    <P? (WALK WALK-TO) (P?WEST P?NORTH P?SOUTH)>>
		       <TELL
"Mura restrains you with iron gentleness." CR>)
		      (<AND <SCENE? S-ANJIRO>
			    <VERB? WALK WALK-TO>
			    <HENCHMEN-RESTRAIN>>
		       <RTRUE>)
		      (<AND <OR <VERB? SWIM>
				<P? THROUGH (LG-SEA LG-BAY)>
				<P? WALK (P?EAST P?OUT)>
				<P? WALK-TO LG-ERASMUS>>
			    <NOT <IN? ,WINNER ,SMALL-BOAT>>>
		       <TELL
"You wade into the water, striding deeper and deeper, until you
realize that you haven't regained enough strength to swim.  You return to
the beach." CR>)
		      (<P? WALK (P?NORTH P?SOUTH)>
		       <FCLEAR ,OMI ,RMUNGBIT> ;"he won't kill you"
		       <TELL
"You wander through the village, but the villagers are apparently
unwilling to let you go too far, and you are gently guided back to the
pebbled beach of the waterfront." CR>)>)
	       (<RARG? END>
		<VILLAGERS-STARE>)>>

<ROUTINE VILLAGERS-STARE ()
	 <COND (<AND <SCENE? ,S-ANJIRO>
		     <NOT <FSET? ,CLOTHES ,WEARBIT>>
		     <OR <NOT ,STATIONARY?> <PROB 33>>>
		<TELL CR
G"The villagers stare at you, and the little children laugh and
point.  They've never seen a naked barbarian before." CR>)>>

<OBJECT ARCHERS
	(DESC "archers")
	(SYNONYM ARCHER ARCHERS SAMURAI BOW ARROW MEN)
	(FLAGS PERSON JAPANESEBIT PLURAL SCOREBIT INVISIBLE AN NOABIT)
	(ACTION ARCHERS-F)>

<ROUTINE ARCHERS-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<WAKARIMASEN>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <COND (<FSET? ,ARCHERS ,RMUNGBIT>
			      <TELL
"One of the archers has drawn out an arrow, and is putting it in his bow." CR>)
			     (ELSE
			      <TELL
"These are archers from the galley, all dressed in the same uniform as " THE
,HIRO-MATSU "." CR>)>)
		      (<OR <P? (WARN TELL-ABOUT) RODRIGUES ARCHERS>
			   <P? POINT ARCHERS>>
		       <COND (<IN? ,WINNER ,SMALL-BOAT>
			      <TELL
"Rodrigues stops rowing immediately, and turns toward shore">
			      <COND (<FSET? ,ARCHERS ,RMUNGBIT>
				     <TELL ", waving and
babbling in pidgin Japanese, reassuring the captain samurai, who says
something to the man with the arrow.  Now the man puts it away." CR>
				     <FCLEAR ,ARCHERS ,RMUNGBIT>
				     <SCORE-OBJECT ,ARCHERS>)
				    (ELSE
				     <TELL
", where nothing is happening.  \"No games, Ingeles,\" he warns." CR>)>)>)
		      (<VERB? TELL>
		       <TELL "They aren't allowed to talk to you." CR>
		       <END-QUOTE>
		       <RFATAL>)>)>>

<END-SEGMENT ;"ANJIRO+RODRIGUES">
<BEGIN-SEGMENT ANJIRO>

<ROUTINE I-RUTTER-CLUE ()
	 <COND (<NOT <FSET? ,RUTTER ,RMUNGBIT>>
		<FSET ,RUTTER ,RMUNGBIT>
		<TELL CR
"It comes suddenly to mind that since you awoke, you haven't
seen your rutters or the rest of the crew.  ">
		<COND (<HERE? ,ON-DECK>
		       <TELL "Could they be aboard">)
		      (ELSE
		       <TELL "Can they still be on the "I"Erasmus">)>
		<TELL ", you wonder?" CR>)>>

<BEGIN-SEGMENT RODRIGUES>

<OBJECT SMALL-BOAT
	(LOC ANJIRO-WATERFRONT)
	(SCENE S-ANJIRO S-RODRIGUES)
	(DESC "small boat")
	(SYNONYM BOAT ROWBOAT)
	(ADJECTIVE SMALL)
	(FLAGS VEHBIT CONTBIT OPENBIT SEARCHBIT)
	(CAPACITY 300)
	(ACTION SMALL-BOAT-F)>

<ROUTINE SMALL-BOAT-F (RARG)
	 <COND (<RARG? BEG>
		<COND (<VERB? LAUNCH>
		       <DO-WALK ,P?EAST>
		       <RTRUE>)
		      (<VERB? WALK-TO WALK>
		       <COND (<OR <P? WALK P?OUT>
				  <AND <P? WALK ,P?UP>
				       <HERE? AT-ERASMUS>>>
			      <PERFORM ,V?DISEMBARK>
			      <RTRUE>)
			     (<NOT <HELD? ,BOAT-OAR>>
			      <TELL
"You need an oar to row." CR>)
			     (<OR <P? WALK-TO LG-ERASMUS>
				  <P? WALK (P?EAST ,P?OUT)>>
			      <COND (<HERE? ,ANJIRO-WATERFRONT>
				     <TELL
"You launch the boat and row out into the harbor towards the "I"Erasmus""."
CR CR>
				     <GOTO ,ANJIRO-HARBOR>)
				    (<HERE? ,ANJIRO-HARBOR>
				     <TELL
"You row up to the side of the "I"Erasmus"".  The samurai aboard eye you
curiously." CR CR>
				     <GOTO ,AT-ERASMUS>)>)
			     (<P? WALK-TO LG-LAND>
			      <DO-WALK ,P?WEST>)
			     (<P? WALK ,P?WEST>
			      <COND (<HERE? ,ANJIRO-WATERFRONT>
				     <TELL
"You can't row the boat over land!" CR>)
				    (ELSE <RFALSE>)>)
			     (<PRSO? ,P?UP ,P?DOWN>
			      <TELL
"If you can row a boat that way, you're a better seaman than Drake
himself!" CR>)
			     (ELSE
			      <TELL
"You row that way for a while, but there is nothing interesting in that
direction." CR>)>)
		      (<VERB? SWIM SWIM-TO>
		       <TELL
"Why swim when you're in a nice dry boat?" CR>)
		      (<P? (BOARD THROUGH) LG-ERASMUS>
		       <PERFORM ,V?DISEMBARK>
		       <RTRUE>)
		      (<VERB? DISEMBARK>
		       <COND (<HERE? ,AT-ERASMUS>
			      <TELL
"You clamber up the gangway onto the deck.  One samurai, more elaborately
dressed than the others, comes over to you and bows." CR CR>
			      <MOVE ,WINNER ,HERE>
			      <GOTO ,ON-DECK>)
			     (<HERE? ,ANJIRO-HARBOR>
			      <PERFORM ,V?LEAP ,LG-SEA>
			      <RTRUE>)
			     (<HERE? ,ANJIRO-WATERFRONT>
			      <MOVE ,WINNER ,HERE>
			      <TELL "You disembark from the boat." CR>)>)
		      (<P? (ENTER BOARD THROUGH) LG-SEA>
		       <COND (<HERE? ,ANJIRO-HARBOR ,AT-ERASMUS>
			      <COND (<IN? ,RODRIGUES ,SMALL-BOAT>
				     <TELL
"Rodrigues grabs you.  \"Not so fast, Ingeles!\"" CR>)
				    (<JIGS-UP? ,J-PLUNGE
"You reconsider.  You are very tired, and might not be able to stay
afloat.">
				     <MOVE ,WINNER ,HERE>
				     <JIGS-UP
"You plunge into the water.  All too soon, you realize you were more tired
than you originally thought.  You struggle to return to the boat, but you
aren't strong enough to pull yourself aboard.">)
				    (ELSE <RTRUE>)>)
			     (<HERE? ,ANJIRO-WATERFRONT>
			      <TELL
"The boat is on dry land here." CR>)>)>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"It's just a small wooden rowboat.">
		       <COND (<NOT <FSET? ,RUTTER ,RMUNGBIT>>
			      <FSET ,RUTTER ,RMUNGBIT>
			      <TELL "It reminds you that you haven't
seen your rutters anywhere, and you glance out at the "I"Erasmus"".">)>
		       <CRLF>)
		      (<VERB? BOARD>
		       <COND (<SCENE? ,S-ANJIRO>
			      <HENCHMEN-RESTRAIN>)
			     (<SCENE? ,S-RODRIGUES>
			      <COND (<NOT <IN? ,RODRIGUES ,SMALL-BOAT>>
				     <COND (<IN? ,RODRIGUES ,HERE>
					    <COND (<FSET? ,LIZARD ,SCOREBIT>
						   <TELL
"\"I'm not done with you yet">)
						  (ELSE
						   <TELL "\"Me first">)>
					    <TELL
", Ingeles!\" says " THE ,RODRIGUES "." CR>)
					   (ELSE
					    <TELL
"Mura stops you and points to the galley.  \"No, Anjin-san.  So sorry, go
there.\"" CR>)>)>)>)
		      (<VERB? LAUNCH>
		       <COND (<SCENE? ,S-ANJIRO>
			      <COND (<HENCHMEN-RESTRAIN>
				     <RTRUE>)
				    (ELSE
				     <MOVE ,WINNER ,PRSO>
				     <TELL
"You launch the boat, pushing it into the water, and although you are
still weak, you manage to haul yourself into it." CR CR>
				     <DO-WALK ,P?EAST>
				     <RTRUE>)>)
			     (<SCENE? ,S-RODRIGUES>
			      <PERFORM ,V?BOARD ,SMALL-BOAT>
			      <RTRUE>)>)>)>>

<OBJECT BOAT-OAR
	(LOC SMALL-BOAT)
	(SCENE S-ANJIRO S-RODRIGUES)
	(DESC "oars")
	(SYNONYM OAR OARS)
	(FLAGS TAKEBIT NOABIT PLURAL)>

<OBJECT LG-SMALL-BOAT
	(LOC LOCAL-GLOBALS)
	(SCENE S-ANJIRO S-RODRIGUES)
	(DESC "small boat")
	(SYNONYM BOAT ROWBOAT)
	(ADJECTIVE SMALL)
	(FLAGS NDESCBIT VEHBIT)
	(ACTION LG-SMALL-BOAT-F)>

<ROUTINE LG-SMALL-BOAT-F ()
	 <COND (<OR <NOT <SCENE? ,S-ANJIRO>>
		    <NOT <IN? ,SMALL-BOAT ,AT-ERASMUS>>>
		<TELL
"There's no " D ,SMALL-BOAT " to be found here." CR>)
	       (<VERB? EXAMINE>
		<TELL
"You sneak a quick glance over the side.  Yes, the boat's still
there, bobbing in the light waves." CR>)
	       (<VERB? BOARD>
		<DO-WALK ,P?DOWN>)>>

<END-SEGMENT ;"ANJIRO+RODRIGUES">
<BEGIN-SEGMENT ANJIRO>

<ROUTINE HENCHMEN-RESTRAIN ()
	 <COND (<FSET? ,SEBASTIO-HENCHMEN ,RMUNGBIT>
		<RFALSE>)
	       (<IN? ,OMI ,HERE>
		<TELL
CTHE ,SEBASTIO " points to you, saying something in Japanese to " THE
,OMI ", who nods.  The priest's companions restrain you." CR>)
	       (<IN? ,SEBASTIO ,HERE>
		<TELL
CTHE ,SEBASTIO " motions to his companions, who restrain you." CR>)
	       (ELSE <RFALSE>)>>

<BEGIN-SEGMENT RODRIGUES>

<ROOM ANJIRO-HARBOR
      (LOC ROOMS)
      (DESC "Harbor")
      (SYNONYM HARBOR)
      (EAST TO AT-ERASMUS)
      (WEST TO ANJIRO-WATERFRONT)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL LG-ERASMUS SAMURAI-GUARDS LG-SEA LG-BAY LG-LAND ARCHERS)
      (ACTION ANJIRO-HARBOR-F)>

<ROUTINE ANJIRO-HARBOR-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"This is the middle of the harbor.  The "I"Erasmus"" is to the east, the
waterfront to the west.  Small islands lie distantly toward the eastern
and southern horizons." CR>)
	       (<RARG? BEG>
		<COND (<AND <P? WALK (P?EAST ,P?OUT)>
			    <NOT <IN? ,WINNER ,SMALL-BOAT>>>
		       <TELL "You are too weak to swim that far." CR>)>)>>

<ROOM AT-ERASMUS
      (LOC ROOMS)
      (DESC "Beside the Erasmus")
      (UP TO ON-DECK)
      (WEST TO ANJIRO-HARBOR)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL LG-ERASMUS SAMURAI-GUARDS GANGWAY LG-SEA LG-LAND LG-BAY ARCHERS)
      (ACTION AT-ERASMUS-F)>

<ROUTINE AT-ERASMUS-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
"The "I"Erasmus"" rides at anchor here, held by three bow cables." CR>)
	       (<RARG? ENTER>
		<COND (<AND <EQUAL? ,OHERE ,ON-DECK>
			    <SCENE? ,S-ANJIRO>>
		       <TELL
"As you climb down the gangway you can still feel the sweat trickling
down your spine.  You hate everything about the Japans and wish yourself
and your crew back aboard, armed, and out to sea." CR>
		       <MOVE ,BLACKTHORNE ,HERE>
		       <NEXT-SCENE>
		       <RFATAL> ;"don't do v-first-look")>)>>

<END-SEGMENT ;"ANJIRO+RODRIGUES">
<BEGIN-SEGMENT ANJIRO>

<ROOM ANJIRO
      (LOC ROOMS)
      ;(SCENE S-ANJIRO)
      (DESC "Anjiro")
      (SYNONYM ANJIRO ;VILLAGE)
      (PICTURE P-ANJIRO)
      (IN TO GARDEN)
      (WEST TO GARDEN)
      (EAST TO ANJIRO-WATERFRONT)
      (GLOBAL MURA-DOOR LG-ERASMUS LG-VILLAGE VILLAGERS)
      (FLAGS ONBIT OUTSIDE RMUNGBIT ;"kludge to make picture come up")
      (ACTION ANJIRO-F)>

<ROUTINE ANJIRO-F ("OPT" (RARG <>))
	 <COND (<RARG? LOOK>
		<TELL
"The village is set around a crescent harbor that faces east, perhaps
two hundred houses unlike any you've ever seen nestling at the beginning
of the mountain which spills down to the shore.  Above are terraced
fields to the west and dirt roads that lead north and south.  Below to
the east is the waterfront.  In the harbor you can see the "I"Erasmus"
" riding at anchor." CR>)
	       (<RARG? BEG>
		<COND (<AND <SCENE? S-ANJIRO>
			    <VERB? WALK WALK-TO>
			    <HENCHMEN-RESTRAIN>>
		       <RTRUE>)
		      (<P? WALK (P?NORTH P?SOUTH)>
		       <FCLEAR ,OMI ,RMUNGBIT> ;"he won't kill you"
		       <TELL
"You follow the dirt road through the village, conscious of many people
watching you.  When they see you have noticed them, they bow to you.  They
pass to and fro, like so many multicolored butterflies.  After a while you
find you've returned to the house you left." CR>)
		      (<P? WALK P?UP>
		       <FCLEAR ,OMI ,RMUNGBIT> ;"he won't kill you"
		       <TELL
"You walk up the dirt path that leads to the fields, watched by curious
eyes every second.  In the terraced fields are farmers up to the their knees
in water, planting and weeding.  How can anything grow in such wetness,
you wonder, and how can the fields have been built on such steep
hillsides?  Confused, you walk back to the house you left." CR>)>)
	       (<RARG? END>
		<VILLAGERS-STARE>)
	       (<RARG? <>>
		<COND (<VERB? FIND>
		       <COND (<G? ,SCENE ,S-ERASMUS>
			      <TELL
"Anjiro is a small fishing village in the province of Izu." CR>)
			     (ELSE
			      <TELL
"You've never heard of any place called Anjiro." CR>)>)>)>>

<BEGIN-SEGMENT YABU>
<BEGIN-SEGMENT RODRIGUES>

<OBJECT VILLAGERS
	(LOC LOCAL-GLOBALS)
	(DESC "villagers")
	(SYNONYM VILLAGERS WOMEN MEN FISHERMEN)
	(FLAGS PERSON JAPANESEBIT PLURAL OPENBIT CONTBIT SEARCHBIT)
	(ACTION VILLAGERS-F)>

<ROUTINE VILLAGERS-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL "They don't understand you." CR>
		<END-QUOTE>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <COND (<HERE? ,VILLAGE-SQUARE>
			      <TELL
"They are watching everything that's going on with great interest." CR>)
			     (ELSE
			      <TELL
"They go about their daily activities, pretending not to be interested in
you." CR>)>)
		      (<VERB? BOW>
		       <TELL
"They return your bow with amusement.  You are obviously a new and amazing
sight for them." CR>)>)>>

<END-SEGMENT ;"ANJIRO+RODRIGUES+YABU">
<BEGIN-SEGMENT ANJIRO>

<OBJECT SEBASTIO-HENCHMEN
	(SCENE S-ANJIRO)
	(DESC "priest's henchmen")
	(OWNER SEBASTIO)
	(SYNONYM MEN HENCHMEN HENCHMAN COMPANIONS)
	(ADJECTIVE JAPANESE)
	(FLAGS PERSON JAPANESEBIT THE NOABIT SCOREBIT PLURAL)
	(ACTION SEBASTIO-HENCHMEN-F)>

<ROUTINE SEBASTIO-HENCHMEN-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL CTHE ,SEBASTIO " interrupts.  \"None of these men
understand Portuguese, heretic.\"" CR>)
	       (<VERB? EXAMINE>
		<TELL
"There are ten of them, all natives, black-haired and black-eyed,
one dressed like " THE ,SEBASTIO " except that he has thong slippers.  The
rest are in varicolored robes, loose trousers, or loincloths." CR>)
	       (<OR <HOSTILE-VERB?>
		    <VERB? PARRY STOP>
		    <P? HELP ME>>
		<COND (<IN? ,OMI ,HERE>
		       <TELL
CTHE ,OMI " barks an order, and they quickly and efficiently pin you
in place.  You are so weak you can hardly struggle." CR>)
		      (<FSET? ,SEBASTIO-HENCHMEN ,SCOREBIT>
		       <TELL
"You are outnumbered and weak, but you manage to smash the nose of
one.  The noise of his scream slows the rest down a little." CR>
		       <SCORE-OBJECT ,SEBASTIO-HENCHMEN>)
		      (ELSE
		       <TELL "You try your best to fend them off." CR>)>)>>

<OBJECT HENCHMAN-BODY
	(DESC "body")
	(SYNONYM BODY CORPSE MAN)
	(ADJECTIVE DEAD KILLED MURDERED HEADLESS)
	(SIZE 200)
	(FLAGS PERSON JAPANESEBIT DEAD TAKEBIT TRYTAKEBIT)
	(ACTION HENCHMAN-BODY-F)>

<ROUTINE HENCHMAN-BODY-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL
"He looks like a typical villager, but he's quite dead." CR>)
	       (<AND <IN? ,OMI ,HERE>
		     <OR <VERB? TAKE>
			 <HOSTILE-VERB?>>>
		<TELL G"Omi prevents you, threatening with his still-bloody
sword.  \""I"Ikinasai""!\" he repeats." CR>)>>

<OBJECT HENCHMAN-HEAD
	(DESC "severed head")
	(SYNONYM HEAD)
	(ADJECTIVE SEVERED)
	(FLAGS TAKEBIT TRYTAKEBIT PERSON DEAD)
	(ACTION HENCHMAN-HEAD-F)>

<ROUTINE HENCHMAN-HEAD-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL "Its expression is frozen in a grimace of death." CR>)
	       (<AND <P? GIVE HENCHMAN-HEAD>
		     <FSET? ,PRSI ,PERSON>
		     <NOT <FSET? ,PRSI ,DEAD>>>
		<TELL
CTHE ,PRSI " doesn't seem interested." CR>)
	       (<AND <OR <VERB? TAKE>
			 <HOSTILE-VERB?>>
		     <IN? ,OMI ,HERE>>
		<TELL G"Omi prevents you, threatening with his still-bloody
sword.  \"">
		<COND (<VERB? KICK>
		       <TELL I"What sizzle!""\" he exclaims." CR>)
		      (ELSE <TELL I"Ikinasai!""\" he repeats." CR>)>)>>

<ROUTINE I-SEBASTIO ()
	 <ZLINES ,SEBASTIO-CNT
		 (DELAY
		  <COND (<HERE? ,ANJIRO ,ANJIRO-WATERFRONT>)
			(<G? ,DELAY-CNT 5>
			 <TELL CR
"Your curiosity gets the better of you and you go out into the street."
CR CR>
			 <GOTO ,ANJIRO>)
			(<AND <G? ,DELAY-CNT 2>
			      <HERE? ,MURA-HOUSE ,GARDEN>>
			 <TELL CR
"You hear a commotion outside." CR>
			 <RTRUE>)
			(ELSE <RFALSE>)>)
		 (<MOVE ,SEBASTIO ,HERE>
		  <SETG QCONTEXT ,SEBASTIO>
		  <THIS-IS-IT ,SEBASTIO>
		  <THIS-IS-IT ,SEBASTIO-HENCHMEN>
		  <MOVE ,SEBASTIO-HENCHMEN ,HERE>
		  <TELL CR
"You see a tonsured man approaching and fear sweeps sickeningly from
your testicles into your stomach.  He is obviously a Portuguese or
Spanish priest, and though his flowing robe is orange, there is no
mistaking the crucifix and rosary at his belt, or the cold hostility
on his face.  Priests here!  A world away in Europe, England and Holland
are fighting for their freedom from the priests.  Is there no place not
infested by these idolators and their Inquisition?  Your fear begins to
give way to rage.|
|
Behind him are several Japanese." CR>)
		 (<TELL CR
"\"Who are you?\" the priest says in Portuguese.  ">
		  <COND (<NOT <FSET? ,CLOTHES ,WEARBIT>>
			 <TELL
"\"You're as naked as a savage!  You have no shame, just like the pagans
here!  Put on some clothes and hide your shame!\"  ">)>
		  <TELL "He points to the
harbor.  \"That's a Netherlander privateer.  You're a heretic
Dutchman.  You're pirates.  You're an enemy of the church!\"" CR>)
		 (<TELL CR
"\"They crucify criminals here.  You're going to die.  The "I"daimyo's"" coming
with his samurai.  God have mercy on you!\"" CR>)
		 (<THIS-IS-IT ,SEBASTIO-HENCHMEN>
		  <SETG OPPONENT ,SEBASTIO-HENCHMEN>
		  <TELL CR
"The priest lifts his crucifix and holds it between you as a shield.  \"Oh,
God, protect us from this evil!  May God have mercy on your soul.\"|
|
He snaps something in Japanese and the men surge toward you, grabbing and
pinioning your arms.  You feel yourself choking!" CR>)
		 (DELAY
		  <COND (<FSET? ,SEBASTIO-HENCHMEN ,SCOREBIT>
			 <COND (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"You can feel the life being choked out of you!" CR>
				<RTRUE>)
			       (ELSE
				<CRLF>
				<JIGS-UP
"One of the priest's henchmen gives you a chop on the windpipe, crushing
it.  You fall to the ground, choking and gasping, and then you die.">
				<RFATAL>)>)>)
		 (<QUEUE I-OMI -1>
		  <DEQUEUE I-SEBASTIO>)>>

<GLOBAL PISS-FLAG <>>

<GLOBAL OMI-QUESTION 0>

<ROUTINE I-OMI ("AUX" TMP)
	 <ZLINES ,OMI-CNT
		 (<SETG OPPONENT <>>
		  <MOVE ,OMI ,HERE>
		  <THIS-IS-IT ,OMI>
		  <TELL CR
"Suddenly the attack ceases.  A young man is ten paces away.  He wears two
scabbarded swords in his belt.  His right hand is casually on the hilt
of the longer one.  \""I"Nanigoto da?""\" he asks harshly.  \""I"NANIGOTO DA?""\"
The Japanese fall to their knees." CR>)
		 (<SETG QCONTEXT ,SEBASTIO>
		  <SETG OMI-QUESTION 1>
		  <SETUP-ANSWER "i am">
		  <TELL CR
CTHE ,OMI " says, \""I"Doko no kuni no monoda?""\" The priest
translates, \"Kasigi Omi-san says, 'What's your nationality?'\"" CR>)
		 (DELAY
		  <COND (,OMI-QUESTION
			 <COND (<G? ,DELAY-CNT 2>
				<OMI-KILLS-YOU>
				<RFATAL>)>
			 <SETUP-ANSWER "i am">
			 <TELL-ANSWER-OR-DIE "What's your nationality">
			 <RTRUE>)>)
		 (<SETG QCONTEXT ,SEBASTIO>
		  <SETG OMI-QUESTION 2>
		  <NEW-SDESC ,OMI "Omi">
		  <SETUP-ANSWER "i sailed from">
		  <TELL CR
CTHE ,OMI " says, \""I"Onushi ittai doko kara kitanoda?""\"The priest
says nervously, \"Kasigi Omi-san says, 'Where did you sail from?'\"" CR>)
		 (DELAY
		  <COND (,OMI-QUESTION
			 <COND (<G? ,DELAY-CNT 2>
				<OMI-KILLS-YOU>
				<RFATAL>)>
			 <SETUP-ANSWER "i sailed from">
			 <TELL-ANSWER-OR-DIE "Where did you sail from">
			 <RTRUE>)>)
		 (<SETG QCONTEXT ,SEBASTIO>
		  <SETG OMI-QUESTION 3>
		  <SETUP-ANSWER "i am">
		  <TELL CR
"Another flurry of words from Omi.  \"Omi-san asks if you're the
leader.  The headman says there are only a few of you heretics alive and most
are sick.\"" CR>)
		 (DELAY
		  <COND (,OMI-QUESTION
			 <COND (<G? ,DELAY-CNT 2>
				<OMI-KILLS-YOU>
				<RFATAL>)>
			 <SETUP-ANSWER "i am">
			 <TELL-ANSWER-OR-DIE "Are you the leader">
			 <RTRUE>)>)
		 (<SETG QCONTEXT ,OMI>
		  <TELL CR
"Another spate of words from the samurai.  \"Omi-san says because you
are the leader you will be allowed to walk around the village freely, until
his master comes.\"" CR>)
		 (<FSET ,SEBASTIO-HENCHMEN ,RMUNGBIT>
		  <MOVE ,HENCHMAN-BODY ,HERE>
		  <MOVE ,HENCHMAN-HEAD ,HERE>
		  <TELL CR
"Omi speaks contemptuously to the priest and his men, then waves
them away.  They all bow low,
except for one man who rises deliberately, without bowing.  With blinding
speed Omi's killing sword hisses in a silver arc and the man's head
topples off his shoulders.  No one else moves a muscle.  \""I"Ikinasai!""\" he
says, motioning everyone away." CR>)
		 (<COND (<IN? ,SEBASTIO ,HERE>
			 <TELL CR
CTHE ,SEBASTIO " gravely makes the sign of the cross over the body.  \"In
nomine Patris et Filii et Spiritus Sancti.\"  He stares at the samurai,
who again says \""I"Ikinasai!""\"" CR>)>)
		 (<SET TMP <LOC ,SEBASTIO>>
		  <REMOVE ,SEBASTIO>
		  <REMOVE ,SEBASTIO-HENCHMEN>
		  <FSET ,OMI ,RMUNGBIT>
		  <COND (<EQUAL? .TMP ,HERE>
			 <TELL CR
"The priest turns and walks away.  His remaining supporters follow." CR>)>)
		 (<SETG QCONTEXT <>>
		  <COND (<OR <NOT <IN? ,OMI ,HERE>>
			     <NOT <FSET? ,OMI ,RMUNGBIT>>>
			 <MOVE ,OMI ,GENERIC-OBJECTS>
			 <DEQUEUE I-OMI>
			 <TELL CR
"In the distance, you can hear Omi laughing uproariously." CR>)
			(ELSE
			 <CRLF>
			 <JIGS-UP
"Omi scowls at you, then begins to laugh uproariously.  In one swift
stroke he removes your head.">)>)>>

<ROUTINE TELL-ANSWER-OR-DIE (STR)
	 <TELL CR
CTHE ,OMI " scowls, fingering the sword in his scabbard.  The priest
looks nervously at him and then at you.  \"" .STR "?  Answer!\"
rasps the priest.  \"Answer or die, heretic!\"" CR>>

<ROUTINE OMI-KILLS-YOU ()
	 <TELL CR
CTHE ,OMI " barks a few impatient words to " THE ,SEBASTIO ", who nods
eagerly.  Moments later, " THE ,OMI "'s sword separates your head from
your body." CR>
	 <JIGS-UP>>

<ROOM MURA-HOUSE
      (LOC ROOMS)
      (SCENE S-ANJIRO S-RODRIGUES)
      (DESC "Mura's House")
      (OWNER MURA)
      (SYNONYM HOUSE)
      (SCORE 4)
      (FDESC
"You awaken suddenly.  For a moment you think you are dreaming, because
you are ashore and in a small, clean room whose floor is covered with
soft mats.  You are lying on a thick quilt.|
|
You realize that you aren't dreaming because you are terribly hungry.")
      (LDESC
"The room is filled with muted light shining through the opaque paper
that fills squares of cedar lath.  The ceiling is polished cedar.")
      (EAST TO GARDEN IF MURA-DOOR IS OPEN)
      (OUT TO GARDEN IF MURA-DOOR IS OPEN)
      (FLAGS ONBIT)
      (GLOBAL MURA-DOOR LG-VILLAGE)
      (ACTION MURA-HOUSE-F)>

<ROUTINE MURA-HOUSE-F (RARG "AUX" H)
	 <COND (<RARG? SCENE-SETUP>
		<FCLEAR ,ON-DECK ,TOUCHBIT>
		<MOVE ,BLACKTHORNE ,QUILT>
		<B-SIT>
		<REMOVE ,BOOTS>
		<FCLEAR ,BOOTS ,WEARBIT>
		<REMOVE ,CLOTHES>
		<FCLEAR ,CLOTHES ,WEARBIT>
		<PUTP ,BLACKTHORNE ,P?HEALTH 1>
		<MOVE ,SMALL-BOAT ,ANJIRO-WATERFRONT>
		<MOVE ,BOAT-OAR ,SMALL-BOAT>
		<FCLEAR ,PASSAGE-DOOR ,OPENBIT>
		<FCLEAR ,FOCSLE-DOOR ,OPENBIT>
		<MOVE-CREW <>>
		<MOVE ,SAMURAI-GUARDS ,ON-DECK>
		<REMOVE ,ERASMUS-ANCHOR>
		<MOVE ,RIBBON ,ON-DECK>
		<SETG COLLAPSE-CNT 0>
		<QUEUE I-COLLAPSE -1>)
	       (<RARG? BEG>
		<SET H <GETP ,WINNER ,P?HEALTH>>
		<COND (<AND <P? LOOK-OUT ROOMS>
			    <FSET? ,MURA-DOOR ,OPENBIT>>
		       <TELL
"You see a beautiful, neat garden." CR>)
		      (<VERB? SLEEP>
		       <TELL
"You have just awakened.  Don't be a sleepy-head." CR>)
		      (<P? LISTEN (<> NOISE)>
		       <TELL
G"It sounds like a group of people.  ""One of them is speaking Portuguese!" CR>)
		      (<AND <P? DRESS>
			    <IN? ,CLOTHES ,HERE>>
		       <PERFORM ,V?WEAR ,CLOTHES>
		       <RTRUE>)
		      (<AND <VERB? STAND>
			    <B-NOT-STANDING?>>
		       <COND (<L? .H 3>
			      <SETG COLLAPSE-CNT 4>
			      <QUEUE I-COLLAPSE -1>
			      <TELL
"You try to stand but you're still too weak." CR>)
			     (ELSE
			      <B-STAND>
			      <TELL
"You stand shakily." CR>)>)
		      (<VERB? DANCE>
		       <TELL "You don't have the strength." CR>)
		      (<AND <P? MAKE SIGN-OF-CROSS>
			    <IN? ,ONNA ,HERE>>
		       <TELL
"She smiles at you and nods." CR>)>)>>

<ROUTINE I-COLLAPSE ("AUX" (H <GETP ,BLACKTHORNE ,P?HEALTH>))
	 <COND (<EQUAL? .H 3>
		<DEQUEUE I-COLLAPSE>)
	       (ELSE
		<ZLINES ,COLLAPSE-CNT
			(4)
			(<COND (<EQUAL? .H 1>
				<TELL CR
"You are still extremely weak and hungry." CR>)
			       (<EQUAL? .H 2>
				<TELL CR
"You are feeling better, but still on the verge of collapse." CR>)>)
			(3)
			(<COND (<EQUAL? .H 1 2>
				<TELL CR
"You are on the verge of collapsing from weakness and hunger." CR>)>)
			(<COND (<EQUAL? .H 1 2>
				<CRLF>
				<JIGS-UP
"You collapse from accumulated weakness and hunger.">)>)>)>>

<OBJECT MURA-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM SHOJI DOOR PANEL PAPER SCREEN SQUARES LATHS)
	(ADJECTIVE PAPER WOOD TRANSLUCENT)
	(FLAGS NDESCBIT DOORBIT TRYTAKEBIT)
	(ACTION MURA-DOOR-F)>

<ROUTINE MURA-DOOR-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,MURA-DOOR ,RMUNGBIT>
		       <TELL
"The door has been broken by your clumsiness." CR>)
		      (ELSE
		       <TELL
"The door is made of square wood laths and covered with paper.  It
looks translucent, shadows from the outside mottling the light and
flimsy structure." CR>)>)
	       (<VERB? OPEN MUNG TEAR RUB>
		<COND (<FSET? ,MURA-DOOR ,RMUNGBIT>
		       <COND (<VERB? OPEN>
			      <COND (<NOT <FSET? ,PRSO ,OPENBIT>>
				     <FSET ,MURA-DOOR ,OPENBIT>
				     <TELL
"You gingerly slide open the broken door." CR>)
				    (ELSE
				     <ITS-ALREADY-X "open">)>)
			     (ELSE
			      <TELL
"You've already broken it." CR>)>)
		      (<AND <HERE? ,MURA-HOUSE>
			    <NOT <FSET? ,MURA-DOOR ,RMUNGBIT>>>
		       <COND (<B-NOT-STANDING?>
			      <TELL
,YOU-HAVE-TO "stand up to reach the door." CR>
			      <RTRUE>)
			     (<VERB? MUNG TEAR>
			      <TELL
"That wouldn't be very nice, even if the door is flimsy-looking." CR>
			      <RTRUE>)>
		       <FSET ,MURA-DOOR ,OPENBIT>
		       <FSET ,MURA-DOOR ,RMUNGBIT>
		       <MOVE ,ONNA ,HERE>
		       <MARGINAL-PIC ,P-GARDEN>
		       <TELL
"You reach to open the door, reeling slightly as you are still very
weak, and put out a hand to steady yourself but the light, square wood
laths can't bear your weight and they shatter, paper ripping apart.  ">
		       <COND (<IN? ,FOOD ,WINNER>
			      <MOVE ,FOOD ,HERE>
			      <TELL "You drop the food.  ">)>
		       <COND (<IN? ,CHOPSTICKS ,WINNER>
			      <MOVE ,CHOPSTICKS ,HERE>
			      <TELL "You drop the sticks.  ">)>
		       <COND (<IN? ,TRAY ,WINNER>
			      <MOVE ,TRAY ,HERE>
			      <MOVE-ALL ,TRAY ,HERE>
			      <TELL "You drop the tray.  ">)>
		       <TELL "
You marvel at how flimsy it is, not at
all like the sturdy wooden doors of England.  Are there no thieves
here?|
|
You right yourself and manage to open the door.  ">
		       <COND (<QUEUED? I-ONNA-RETURNS>
			      <MOVE ,FOOD ,TRAY>
			      <MOVE ,TRAY ,HERE>
			      <MOVE ,CLOTHES ,HERE>
			      <MOVE ,BOOTS ,GARDEN>
			      <DEQUEUE I-ONNA-RETURNS>
			      <TELL
"Behind the door, carrying a tray of food and a bundle of your clothes,
is a shocked " D ,ONNA ".  She places the tray on the floor and retreats
with as much calm as she can muster." CR>)
			     (ELSE
			      <TELL
"The shocked woman in the corridor is staring at you." CR>)>)>)
	       (<AND <VERB? REPAIR>
		     <FSET? ,PRSO ,RMUNGBIT>>
		<TELL "You try to fix the door, but it's futile." CR>)>>

<OBJECT QUILT
	(LOC MURA-HOUSE)
	(SCENE S-ANJIRO)
	(DESC "quilt")
	(SYNONYM QUILT)
	(ADJECTIVE THICK PADDED SOFT COTTON)
	(FLAGS TAKEBIT VEHBIT OPENBIT CONTBIT SEARCHBIT FURNITURE SURFACEBIT)
	(ACTION QUILT-F)>

<ROUTINE QUILT-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"It's a thick padded cotton quilt." CR>)>)
	       (<RARG? BEG>
		<COND (<MOTION-VERB?>
		       <COND (<L? <GETP ,WINNER ,P?HEALTH> 3>
			      <TELL "You're still too weak." CR>)
			     (ELSE
			      <MOVE ,WINNER ,HERE>
			      <RFALSE>)>)>)>>

<OBJECT MURA-CRUCIFIX
	(LOC MURA-HOUSE)
	(SCENE S-ANJIRO)
	(DESC "crucifix")
	(FDESC "Hanging on the wall is a crucifix.")
	(SYNONYM CRUCIFIX CROSS)
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION MURA-CRUCIFIX-F)>

<ROUTINE MURA-CRUCIFIX-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is the sort of crucifix you would expect to find in a Catholic
country.  You cannot help but look at it with anger and dread, as Spain
and Portugal, the Catholic powers, have been at war with England for
decades.|
|
All your life you have heard rumors of Portugal's secret
empire in the East, how they had by now converted the heathens to
Catholicism and so held them in bondage.  Can these rumors have been
true?  If so, what about the other rumors, that gold here is as cheap as
pig iron, and emeralds and diamonds are as plentiful as pebbles on the
beach?" CR>)
	       (<VERB? TAKE MOVE LOWER>
		<TELL
"It's fixed to the wall." CR>)
	       (<VERB? MUNG>
		<TELL
"Much as you might like to break it, idolatrous symbol of the hated
enemy that it is, you can't get to it." CR>)>>

<OBJECT TRAY
	(LOC MURA-HOUSE)
	(DESC "red lacquered tray")
	(SYNONYM TRAY BOWL)
	(ADJECTIVE RED LACQUERED)
	(CAPACITY 10)
	(FLAGS TAKEBIT SEARCHBIT OPENBIT CONTBIT SURFACEBIT)>

<OBJECT CHOPSTICKS
	(LOC TRAY)
	(DESC "pair of sticks")
	(OWNER CHOPSTICKS)
	(SYNONYM STICKS CHOPSTICKS STICK PAIR)
	(ADJECTIVE CHOP ;PAIR)
	(FLAGS TAKEBIT TOOLBIT PLURAL)
	(ACTION CHOPSTICKS-F)>

<ROUTINE CHOPSTICKS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"These are two short sticks of polished wood, slightly pointed at one
end.  You have no idea what they are for." CR>)
	       (<AND <HOSTILE-VERB?>
		     <PRSI? ,CHOPSTICKS>>
		<TELL
"A pair of chopsticks makes a poor substitute for a weapon." CR>)
	       (<OR <P? EAT FOOD>
		    <P? USE CHOPSTICKS>
		    <P? PICK-UP FOOD>>
		<COND (<OR <IN? ,FOOD ,TRAY>
			   <HELD? ,FOOD>>
		       <TELL
"You try to scoop the food with the sticks, but it doesn't work.  Why
there is no knife or spoon here, you cannot understand." CR>)
		      (ELSE
		       <TELL
"You can't understand how to use the sticks." CR>)>)>>

<OBJECT FOOD
	(LOC TRAY)
	(DESC "food")
	(SYNONYM FOOD VEGETABLES SOUP PORRIDGE)
	(ADJECTIVE MORE FISH COOKED COLD THICK)
	(FLAGS TAKEBIT FOODBIT SCOREBIT NOABIT)
	(ACTION FOOD-F)>

<ROUTINE FOOD-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The food consists of cold cooked vegetables, fish soup, and a thick
porridge of wheat or barley." CR>)
	       (<VERB? WAIT-FOR>
		<COND (<QUEUED? I-ONNA-RETURNS>
		       <TELL
"Your stomach rumbles as you wait for more food; perhaps there'll be
grog or a good roast capon this time!" CR>)>)
	       (<VERB? SMELL>
		<TELL
"It smells very strange.  Oh for a loaf of fresh crunchy bread, or a
roast with gravy!  Nonetheless, it's all you've got." CR>)
	       (<P? EAT FOOD (<> FINGERS HANDS MOUTH)>
		<REMOVE ,FOOD>
		<COND (<L? <GETP ,BLACKTHORNE ,P?HEALTH> 2>
		       <QUEUE I-REMEMBER 1>
		       <QUEUE I-ONNA 2>
		       <TELL
"You wolf down the vegetables, which have a piquant taste.  You drain the
bowl of soup.  You eat the porridge with your fingers, as there appear to
be no utensils, just some sticks of wood.|
|
You are still ravenously hungry." CR>
		       <PUTP ,BLACKTHORNE ,P?HEALTH 2>)
		      (ELSE
		       <PUTP ,BLACKTHORNE ,P?HEALTH 3>
		       <TELL
"This tray of food is the same as the first.  There is no meat and no
grog or brandy.  You can eat more slowly now, and you try to savor the
unfamiliar fare, but you can't convince yourself it's more than just
filling.  Your stomach is pleasantly full when you finish, though." CR>
		       <SCORE-OBJECT ,FOOD>)>)>>

<ROUTINE I-REMEMBER ()
	 <TELL CR
"With an effort you try to collect yourself.  You remember getting the
anchor out.  With Vinck.  At least you think it was Vinck.  There were lights
ashore.  Then there were lights and strange voices.  One of the natives talked
a little Portuguese.  They must have carried you ashore and put you here." CR>>

<ROUTINE I-ONNA ()
	 <MOVE ,ONNA ,MURA-HOUSE>
	 <FSET ,MURA-DOOR ,OPENBIT>
	 <THIS-IS-IT ,ONNA>
	 <SETG QCONTEXT ,ONNA>
	 <TELL CR
"A panel in the wall slides open.  A middle-aged, heavy-set, round-faced
woman drops to her knees beside the door and bows and smiles at
you.  \""I"Goshujinsama, gokibun wa ikaga desu ka?""\" she asks." CR>>

<NEW-ADD-WORD "HAKU" NOUN>

<BEGIN-SEGMENT PIT>

<OBJECT ONNA
	(SDESC "middle-aged woman")
	(SYNONYM WOMAN ONNA ONNA LADY)
	(ADJECTIVE MIDDLE-AGED HEAVY-SET ROUND-FACED)
	(FLAGS PERSON JAPANESEBIT FEMALE THE OPENBIT SEARCHBIT CONTBIT)
	(ACTION ONNA-F)>

<ROUTINE ONNA-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<OR <P? BE? THIS JAPAN>
			   <P? FIND ;WHERE ME>>
		       <TELL G"She stares at you uncomprehendingly""." CR>)
		      (<VERB? WHO>
		       <NEW-SDESC ,ONNA "Onna">
		       <TELL
"She doesn't understand you, so you point to yourself and say
\"Blackthorne\" several times, very deliberately.  She frowns,
and then with a flood of understanding
points at herself and says, \"Onna!  Onna!\"" CR>)
		      (<AND <OR <VERB? SORRY>
				<AND <P? BE (ME BLACKTHORNE) INTADJ>
				     <ADJ? ,W?SORRY>>>
			    <FSET? ,MURA-DOOR ,RMUNGBIT>>
		       <TELL
"\"I'm sorry,\" you say, gesturing toward the broken door.  The woman
finally understands, and smiles as if to indicate that she forgives you." CR>)
		      (ELSE
		       <TELL
G"She stares at you uncomprehendingly"" and says something you cannot
understand." CR>)>)
	       (<VERB? EXAMINE>
		<TELL
"She is a middle-aged, heavy-set, round-faced woman." CR>)
	       (<VERB? FIND WHERE>
		<COND (<IN? ,MURA ,HERE>
		       <SETG WINNER ,MURA>
		       <PERFORM ,V?FIND ,PRSO>
		       <SETG WINNER ,BLACKTHORNE>
		       <RTRUE>)>)
	       (<P? ASK-FOR ONNA *>
		<TELL
"She doesn't understand you." CR>)
	       (<P? RUB (STOMACH TRAY)>
		<PERFORM ,V?SHOW ,PRSO ,ONNA>
		<RTRUE>)
	       (<P? (SHOW GIVE) * ONNA>
		<COND (<PRSO? ,ME>
		       <SETG WINNER ,ONNA>
		       <PERFORM ,V?WHO>
		       <SETG WINNER ,PLAYER>
		       <RTRUE>)
		      (<OR <PRSO? HENCHMAN-HEAD>
			   <PRSO? <LOC ,HENCHMAN-HEAD>>>
		       <TELL
"She screams and crosses herself." CR>)
		      (<HERE? ,MURA-HOUSE ,GARDEN>
		       <COND (<VERB? SHOW>
			      <TELL "You point to ">)
			     (ELSE
			      <COND (<FSET? ,PRSO ,TAKEBIT>
				     <FCLEAR ,PRSO ,WEARBIT>
				     <MOVE ,PRSO ,ONNA>)>
			      <TELL "You give her ">)>
		       <COND (<AND <PRSO? ,GLOBAL-FOOD>
				   <IN? ,TRAY ,HERE>>
			      <TELL "the empty tray">)
			     (ELSE <TELL THE ,PRSO>)>
		       <TELL
", and the woman looks at " HIM/HER ,PRSO " and ">
		       <COND (<PRSO? ,MURA-CRUCIFIX>
			      <TELL "makes the sign of the cross." CR>)
			     (<AND <PRSO? ,TRAY ,FOOD ,MOUTH ,STOMACH
					  ,GLOBAL-FOOD>
				   <NOT <LOC ,CLOTHES>>>
			      <MOVE ,ONNA ,GARDEN>
			      <COND (<NOT <FSET? ,MURA-DOOR ,RMUNGBIT>>
				     <FCLEAR ,MURA-DOOR ,OPENBIT>)>
			      <MOVE ,TRAY ,ONNA>
			      <QUEUE I-ONNA-RETURNS 2>
			      <TELL "nods.  She smiles, politely takes the tray, and ">
			      <COND (<FSET? ,MURA-DOOR ,RMUNGBIT>
				     <TELL "then glances ruefully at the door." CR>)
				    (ELSE
				     <TELL "slides the door shut." CR>)>)
			     (ELSE
			      <TELL
"says something incomprehensible." CR>)>)>)
	       (<VERB? RUB RAISE FUCK>
		<TELL
CTHE ,ONNA " seems surprised, but not unwilling." CR>)>>

<END-SEGMENT ;"ANJIRO+PIT">

<BEGIN-SEGMENT ANJIRO>

<ROUTINE I-ONNA-RETURNS ()
	 <MOVE ,FOOD ,TRAY>
	 <MOVE ,CLOTHES ,HERE>
	 <MOVE ,TRAY ,HERE>
	 <MOVE ,BOOTS ,GARDEN>
	 <TELL CR
"The ">
	 <COND (<HERE? ,MURA-HOUSE>
		<TELL "door slides open again, and the ">)>
	 <TELL "small woman reappears with more
food, and your clothes which she places in a neat pile.  She bows
again and departs." CR>>

<BEGIN-SEGMENT RODRIGUES>

<OBJECT RIBBON
	(DESC "silk ribbon")
	(LDESC
"Stretched across each doorway is a red silk ribbon.")
	(SYNONYM RIBBON TAPE BANNER)
	(ADJECTIVE RED SILK)
	(FLAGS TAKEBIT READBIT)
	(ACTION RIBBON-F)>

<GLOBAL RIBBON-CNT 0>

<ROUTINE RIBBON-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The wide band of red silk is pasted across the doorway.  It is covered with
queer, squiggly writing." CR>)
	       (<VERB? READ>
		<TELL
"The ribbon is covered with queer, squiggled writing.  You can't read it,
though." CR>)
	       (<VERB? POINT>
		<TELL
"The leader says, politely, \""I"Kasigi Yabu-sama!  Kinjiru!""\" ">
		<COND (<NOT ,RIBBON-CNT>
		       <TELL "He smiles politely." CR>)
		      (ELSE
		       <TELL "His expression is very serious." CR>)>)
	       (<NOT <PASSIVE-VERB?>>
		<TELL
"\""I"Hotte oke!""\"  The samurai on guard shakes his head to make the point
clear.">
		<COND (<SCENE? S-ANJIRO>
		       <TELL "He is no longer smiling.|
|
You try again.  \""I"Kinjiru!""\" the guards say emphatically.|
|
When you still don't seem to be listening, the guard yells,
\""I"KINJIRU!""\" You are jerked around to face the samurai.  Their swords
are half out of the scabbards.  They wait for you to make up your mind.|
|
You realize they are not going to let you retrieve your rutters, and
begin to retreat.  You remember to bow and at once all hostility vanishes,
but the guards are still watchful." CR>
		       <SCORE-OBJECT ,SAMURAI-GUARDS>
		       <CRLF>
		       <GOTO ,AT-ERASMUS>)
		      (ELSE
		       <COND (<IN? ,RODRIGUES ,HERE>
			      <TELL CR
"\"Leave this to me, Ingeles!\" blusters Rodrigues." CR>)
			     (ELSE <CRLF>)>)>)>>

<ROUTINE I-RIBBON ()
	 <COND (<AND <HERE? ,ON-DECK ,BRIDGE-OF-ERASMUS>
		     <NOT <FSET? ,SAMURAI-GUARDS ,RMUNGBIT>>>
		<SETG RIBBON-CNT <+ ,RIBBON-CNT 1>>
		<COND (<G=? ,RIBBON-CNT 3>
		       <CRLF>
		       <JIGS-UP
"In a flash, the samurai indicate that you have wasted too much of
their time and patience.  You cannot benefit from this decision, as
an instant later you are dead.">)
		      (ELSE
		       <QUEUE I-RIBBON 4>
		       <TELL CR
"The samurai leader makes a long speech part of which emphatically
seems to indicate you are expected to leave immediately.   But what
of your rutters?  How can you retrieve them?" CR>)>)>>

<OBJECT SAMURAI-GUARDS
	(SCENE S-ANJIRO S-RODRIGUES S-ESCAPE)
	(DESC "samurai guards")
	(SYNONYM SAMURAI GUARDS GUARD MAN MEN CREW CREWMEN CREWMAN)
	(FLAGS PERSON JAPANESEBIT PLURAL SCOREBIT NOABIT)
	(DESCFCN SAMURAI-GUARDS-DESC)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION SAMURAI-GUARDS-F)>

<ROUTINE SAMURAI-GUARDS-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<TELL
"Several samurai are at posts on the main deck.  They ">
		<COND (,RIBBON-CNT
		       <TELL "watch you warily.">)
		      (<FSET? ,SAMURAI-GUARDS ,RMUNGBIT>
		       <TELL "seem relaxed.">)
		      (ELSE
		       <TELL "seem a little nervous.">)>)>>

<ROUTINE SAMURAI-GUARDS-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
"None of the guards appear to understand you." CR>)
	       (<VERB? EXAMINE>
		<COND (<SCENE? S-ESCAPE>
		       <TELL
"They are at attention, alert, and rigidly correct in their bearing." CR>)
		      (<HERE? ,ON-DECK ,AT-ERASMUS ,BRIDGE-OF-ERASMUS>
		       <TELL
"These men are all samurai.  Some have steel breastplates but most wear
simple kimonos, and the two swords.  All wear their hair the same way:
the top of the head shaved and the hair at the back and sides gathered
into a queue, oiled, then doubled over the crown and tied neatly." CR>)
		      (ELSE
		       <TELL
"You can't see the "I"Erasmus"" well enough from here to tell much about
who's crewing it." CR>)>)
	       (<VERB? WHO>
		<COND (<SCENE? ,S-ANJIRO>
		       <TELL
"They are all dressed alike, so perhaps they are soldiers put here by
the "I"daimyo""." CR>)
		      (<SCENE? ,S-RODRIGUES>
		       <TELL
"They are samurai of Kasigi Yabu, the "I"daimyo"" of this province." CR>)>)
	       (<HOSTILE-VERB?>
		<COND (<OR <HERE? ,ON-DECK> <SCENE? ,S-ESCAPE>>
		       <COND (<JIGS-UP? ,J-GUARDS>
			      <JIGS-UP
"They efficiently fill their function as guards.">)
			     (ELSE <RTRUE>)>)
		      (ELSE
		       <TELL
"Luckily for you, you aren't close enough to attack the guards." CR>)>)
	       (<AND <HERE? ,ANJIRO-WATERFRONT>
		     <NOT <ABSTRACT-VERB?>>>
		<TELL
"The crewmen on the "I"Erasmus"" aren't here." CR>
		<COND (<VERB? TELL> <END-QUOTE> <RFATAL>)
		      (ELSE <RTRUE>)>)
	       (<VERB? GIVE SHOW>
		<COND (<PRSO? ,HENCHMAN-HEAD>
		       <TELL
"They discuss it among themselves.  They don't seem upset or disgusted by it." CR>)
		      (ELSE
		       <TELL "They don't seem interested." CR>)>)
	       (<VERB? BOW>
		<COND (<SCENE? S-ESCAPE>
		       <TELL
"They return your bow with perfect military correctness." CR>)
		      (<NOT <FSET? ,PRSO ,RMUNGBIT>>
		       <FSET ,PRSO ,RMUNGBIT>
		       <COND (<EQUAL? ,RIBBON-CNT 3>
			      <TELL
"You bow politely.  At once all the hostility vanishes and they all
bow and smile again." CR>)
			     (ELSE
			      <TELL
"All the guards relax slightly and begin to smile." CR>)>)
		      (ELSE
		       <TELL "The leader returns your bow.">
		       <COND (,RIBBON-CNT
			      <TELL
"The guards seem more relaxed now.">)>
		       <CRLF>)>)
	       (<VERB? TELL-ABOUT>
		<TELL
"They don't appear to understand you." CR>)>>

<END-SEGMENT ;"ANJIRO">



"YABU for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT YABU>

<ROOM VILLAGE-SQUARE	;"setup s-yabu"
      (LOC ROOMS)
      (SCENE S-YABU)
      (DESC "Village Square")
      (SCORE 2)
      (FDESC
"The next day, you and your crewmen are brought before the
daimyo.  Samurai slam all of you on your knees and push your heads into the dust.")
      (SYNONYM SQUARE)
      (ADJECTIVE VILLAGE)
      (NORTH TO BATH-HOUSE IF BATH-FLAG)
      (FLAGS OUTSIDE ONBIT SCOREBIT)
      (GLOBAL CREWMEN LG-ERASMUS VILLAGERS PIT LG-VILLAGE)
      (ACTION VILLAGE-SQUARE-F)>

<ROUTINE VILLAGE-SQUARE-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<COND (<SCENE? ,S-YABU>
		       <DRESS-BLACKTHORNE T>
		       <B-KNEEL>
		       <MOVE-CREW ,HERE T ;"set their ndescbits">
		       <MOVE ,MURA ,HERE>
		       <MOVE ,SEBASTIO ,HERE>
		       <NEW-SDESC ,SEBASTIO "Father Sebastio">
		       <MOVE ,OMI ,HERE>
		       <NEW-SDESC ,OMI "Omi">
		       <MOVE ,YABU ,HERE>
		       <SETG YABU-CNT 0>
		       <QUEUE I-YABU-AUDIENCE -1>)>)
	       (<RARG? LOOK>
		<TELL
"This is the village square of Anjiro.  The day is clear and warm.">
		<COND (<SCENE? S-YABU>
		       <TELL "You are ">
		       <COND (<B-KNEELING?>
			      <TELL "kneeling">)
			     (ELSE <TELL "standing">)>
		       <TELL " in front of the platform.">)>
		<COND (,BATH-FLAG
		       <TELL
"A narrow path leads north between two wooden fences.">)>
		<CRLF>)
	       (<RARG? BEG>
		<COND (<AND <SCENE? ,S-YABU ,S-PIT>
			    <P? BOW (<> OMI YABU)>>
		       <COND (<NOT ,PRSO> <SETG PRSO ,YABU>)>
		       <TELL "You bow">
		       <COND (<B-NOT-STANDING?>
			      <TELL ", bending forward from your ">
			      <COND (<B-KNEELING?>
				     <TELL "kneeling">)
				    (ELSE <TELL "sitting">)>
			      <TELL " position">)>
		       <TELL ".  ">
		       <COND (<QUEUED? I-BOW?>
			      <DEQUEUE I-BOW?>
			      <COND (<SCENE? ,S-YABU>
				     <DEQUEUE I-YABU-AUDIENCE>
				     <TELL
"Yabu motions the guards forward, giving them curt orders.  \"You have
insulted the Lord Yabu with your bad manners and incredible impertinence,\"
explains Father Sebastio smugly.  Yabu turns to confer with Omi." CR>
				     <COND (<FSET? ,SEBASTIO-CRUCIFIX ,SCOREBIT>
					    <TELL CR
"\"You are to be put to death for being a pirate and a heretic,\" says
Sebastio, but for some reason you think he is lying.  Yabu looks pleased and
Omi unhappy about the outcome.  Why, you wonder?  As the guards lead you
away, you can't help believing you were close to convincing them to let you
live." CR>
					    <JIGS-UP>
					    <RFATAL>)
					   (ELSE
					    <TELL CR
"After a while, Yabu and Omi finish their polite discussion.  Yabu speaks
to the guards again, and Father Sebastio explodes with indignation.  \"They
are sparing you and your crew precisely because you are heretics who hate
the true Church!  Surely this land is in the power of Satan!\"|
|
Yabu smiles happily at you and your crewmen, then points to you and barks
an additional order to Omi, who bows.  You shudder, wondering what fate
could be in store for you, and afraid you are about to find out." CR>
					    <NEXT-SCENE>)>)
				    (ELSE
				     <TELL
CTHE ,PRSO " returns your bow, and relaxes." CR>)>)
			     (<SCENE? ,S-YABU>
			      <TELL
CTHE ,PRSO " returns your bow.  He seems at once astonished and amused by
your behavior, but it's clear he has no love for the priest." CR>)
			     (ELSE
			      <TELL
CTHE ,PRSO " seems pleased by this display of manners." CR>)>)
		      (<SCENE? S-YABU>
		       <COND (<AND <VERB? STAND>
				   <B-NOT-STANDING?>>
			      <TELL
"You stand up.  The Japanese seem surprised by your audacity." CR>)
			     (<ACT-CRAZY?>
			      <TELL
"Yabu stares at you in surprise.  You must be insane!" CR>)
			     (<AND <VERB? TELL SEND>
				   <NOT <PRSO? YABU SEBASTIO>>>
			      <SPEAK-ONLY-TO-YABU>
			      <COND (<VERB? TELL> <END-QUOTE> <RFATAL>)
				    (ELSE <RTRUE>)>)>)
		      (<SCENE? ,S-PIT>
		       <COND (<P? THROUGH PIT>
			      <DO-WALK ,P?DOWN>)
			     (<AND <P? WALK P?DOWN>
				   <IN? ,LADDER ,HERE>>
			      <PERFORM ,V?CLIMB-DOWN ,LADDER>
			      <RTRUE>)
			     (<AND <VERB? LIE-DOWN BOARD LOWER>
				   ,ANSWER-HAI?
				   <FSET? ,CROOCQ ,SCOREBIT>>
			      <COND (<NOT <B-LYING?>>
				     <B-LIE-DOWN>
				     <TELL
"You do as you were ordered." CR>
				     <SCORE-OBJECT ,CROOCQ>)>)>)>)>>

<ROUTINE YABU-TALK-TO-YABU ()
	 <COND (<AND <P? BE (BLACKTHORNE ME)>
		     <EQUAL? ,YABU-QUESTION 1>>
		<COND (<NOT <PRSI? BLACKTHORNE ME>>
		       <TELL
"\"This is no time for foolishness, heretic!\" roars the priest." CR>)
		      (<AND <NOUN-USED? ,PRSI ,W?BLACKTHORNE>
			    <ADJ-USED? ,PRSI ,W?JOHN>
			    <NOT <P-NEGATIVE?>>>
		       <SETG QCONTEXT <>>
		       <SETG YABU-QUESTION 0>
		       <TELL
G"Father Sebastio translates your answer.  ""He seems very deferential to
Yabu, and very sweaty." CR>)
		      (ELSE
		       <TELL
"\"No, no!  What is your ">
		       <COND (<OR <NOUN-USED? ,PRSI
					      ,W?BLACKTHORNE>
				  <ADJ-USED? ,PRSI ,W?JOHN>>
			      <TELL "full ">)>
		       <TELL
"name, pirate?\" storms the priest, annoyed in
spite of himself." CR>)>)
	       (<AND <EQUAL? ,YABU-QUESTION 2>
		     <OR <AND <P? BE (BLACKTHORNE ME) INTPP>
			      <PP? ,W?FROM ,HOLLAND>>
			 <P? COME-FROM HOLLAND>>
		     <NOT <P-NEGATIVE?>>>
		<SETG QCONTEXT <>>
		<SETG YABU-QUESTION 0>
		<TELL
G"Father Sebastio translates your answer.  ""Yabu is showing irritation
and impatience.  Perhaps the Jesuit's Japanese isn't fluent?" CR>)
	       (<AND <EQUAL? ,YABU-QUESTION 3>
		     <P? BE
			 (BLACKTHORNE ME)
			 (BLACKTHORNE RODRIGUES LEADER)>
		     <OR <NOUN-USED? ,PRSI ,W?PILOT>
			 <NOUN-USED? ,PRSI ,W?PILOT-MAJOR>>
		     <NOT <P-NEGATIVE?>>>
		<SETG QCONTEXT ,YABU>
		<SETG YABU-QUESTION 4>
		<TELL
"Father Sebastio doesn't translate what you said.  Instead he asks,
\"Why is an Englishman the pilot of a Dutch ship?  Answer!\"  Yabu
looks annoyed at the priest.  Perhaps they aren't allies
after all." CR>)
	       (<AND <EQUAL? ,YABU-QUESTION 4>
		     <EQUAL? ,PRSS ,ME ,BLACKTHORNE>
		     <P? (WALK WALK-TO WALK-AROUND
			  COME-FROM COME-TO-FROM)
			 (<> ENGLAND STRAIT-OF-MAGELLAN
			  JAPAN PACIFIC GLOBAL-HERE LG-SEA
			  LG-ERASMUS BLACK-SHIP NOT-HERE-OBJECT)
			 (<> ENGLAND STRAIT-OF-MAGELLAN
			  PACIFIC LG-SEA LG-ERASMUS BLACK-SHIP)>
		     <PAST-TENSE?>
		     <NOT <P-NEGATIVE?>>>
		<COND (<PRSO? NOT-HERE-OBJECT>
		       <TELL
"\"Liar! You came around Africa and India!\""G" screams the priest." CR>)
		      (<AND <PRSO? <> LG-SEA LG-ERASMUS
				   BLACK-SHIP>
			    <PRSI? <> LG-SEA LG-ERASMUS
				   BLACK-SHIP>>
		       <TELL
"\"Of course you did!  You didn't fly!\""G" screams the priest." CR>)
		      (ELSE
		       <SETG YABU-QUESTION 0>
		       <SETG QCONTEXT <>>
		       <TELL
"You describe your voyage.  \"We came through Magellan's Pass.  This is the
one hundred and thirty-sixth day from there.\"|
|
\"You're lying!  Magellan's Pass is secret.  You came via Africa and
India.  You'll have to tell the truth eventually.  They use torture
here.\"" CR>
		       <SCORE-OBJECT ,STRAIT-OF-MAGELLAN>)>)
	       (<AND <P? BE (BLACKTHORNE ME)>
		     <P-NEGATIVE?>>
		<COND (<PRSI? CHURCH>
		       <TELL
"\"I've already told the "I"daimyo"" that you're a heretic!\"" CR>)
		      (<PRSI? PORTUGUESE>
		       <TELL
"\"That's right, heretic, dig your own grave!  Only we Portuguese and
the damnable Spanish are allowed to trade here!\"" CR>)
		      (<AND <PRSI? PIRATE>
			    <EQUAL? ,YABU-QUESTION 4>>
		       <SETG QCONTEXT <>>
		       <SETG YABU-QUESTION 0>
		       <TELL
"\"You liar!  You filthy heretics are all pirates!\"  The priest speaks
haltingly to Yabu, who answers brusquely.  He is apparently losing
interest in the interrogation, and looks out into the harbor, toward
the ship." CR>)
		      (ELSE
		       <TELL
CTHE ,SEBASTIO " translates what you have said.  Yabu doesn't seem
terribly interested, but only annoyed at the priest's poor Japanese." CR>)>)
	       (<AND ,YABU-QUESTION
		     <VERB? SAY REPLY>>
		<COND (<EQUAL? ,YABU-QUESTION 1 3>
		       <PERFORM ,V?BE ,ME ,PRSO>
		       <RTRUE>)
		      (ELSE
		       <PERFORM ,V?COME-FROM>
		       <RTRUE>)>)
	       (ELSE
		<TELL
CTHE ,SEBASTIO " haltingly translates what you have said.  Yabu appears
increasingly impatient." CR>)>>

<ROUTINE SPEAK-ONLY-TO-YABU ()
	 <TELL
"Yabu says something sharply, and the priest warns, \"Speak only to
the Lord Yabu!  You are endangering your miserable life, heretic!\""
CR>>

<OBJECT SEBASTIO-CRUCIFIX
	(SCENE S-ANJIRO S-YABU S-PIT)
	(LOC SEBASTIO)
	(DESC "crucifix")
	(OWNER SEBASTIO)
	(SYNONYM CRUCIFIX CROSS)
	(ADJECTIVE PECTORAL WOOD WOODEN)
	(FLAGS DONT-ALL TAKEBIT TRYTAKEBIT NDESCBIT SCOREBIT)
	(ACTION SEBASTIO-CRUCIFIX-F)>

<ROUTINE SEBASTIO-CRUCIFIX-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's wooden, beautifully carved">
		<COND (<IN? ,PRSO ,SEBASTIO>
		       <TELL ", and hangs on a long chain from the priest's
belt." CR>)
		      (ELSE <TELL "." CR>)>)
	       (<VERB? MUNG THROW>
		<COND (<AND ,PRSI
			    <FSET? ,PRSI ,PERSON>
			    <NOT <PRSI? ,SEBASTIO>>>
		       <RFALSE>)
		      (<IN? ,PRSO ,PLAYER>
		       <COND (<AND <IN? ,OMI ,HERE> <IN? ,YABU ,HERE>>
			      <QUEUE I-BOW? 2>)>
		       <QUEUE I-SEBASTIO-PRAYS 1>
		       <MOVE ,SEBASTIO-CRUCIFIX ,HERE>
		       <COND (<VERB? MUNG>
			      <TELL
"You break the crucifix in two, and hurl the pieces ">)
			     (ELSE
			      <TELL
"You throw the crucifix ">)>
		       <COND (<PRSI? ,SEBASTIO>
			      <TELL "at " THE ,SEBASTIO ".">)
			     (ELSE <TELL "on the ground.">)>
		       <COND (<AND <IN? ,OMI ,HERE> <IN? ,YABU ,HERE>>
			      <TELL
"The samurai watch.  Omi, in particular, seems interested and excited.">)>
		       <CRLF>
		       <SCORE-OBJECT ,SEBASTIO-CRUCIFIX>)
		      (ELSE
		       <TELL
"You don't have it." CR>)>)
	       (<VERB? PISS>
		<TELL
"You are so nervous that you can't." CR>)
	       (<VERB? SPIT>
		<TELL
"Your mouth is so dry from tension and fear that you can't muster any
spit." CR>)
	       (<P? GIVE SEBASTIO-CRUCIFIX>
		<COND (<PRSI? SEBASTIO>
		       <MOVE ,SEBASTIO-CRUCIFIX ,SEBASTIO>
		       <TELL
"He snatches it back, snarling." CR>)
		      (<PRSI? ,YABU ,OMI>
		       <TELL
"He refuses, looking rather surprised." CR>)>)
	       (<VERB? TAKE>
		<COND (<NOT <FSET? ,PRSO ,SCOREBIT>>
		       <TELL
"You pick up the broken pieces of the crucifix.  Sebastio watches you
with contempt and hatred." CR>)
		      (<NOT <IN? ,PRSO ,SEBASTIO>>
		       <RFALSE>)
		      (<FSET? ,SEBASTIO-CRUCIFIX ,RMUNGBIT>
		       <QUEUE I-BOW? 2>
		       <FCLEAR ,PRSO ,DONT-ALL>
		       <MOVE ,PRSO ,PLAYER>
		       <FSET ,PRSO ,TOUCHBIT>
		       <TELL
"You snatch the crucifix from " THE ,SEBASTIO "'s hand.  He stares at
you, shocked and astonished.  Yabu watches your incredible behavior
with disgust, Omi with increasing interest.  You can almost see his
curiosity: what will the barbarian do next?" CR>)
		      (ELSE
		       <TELL
"You grab for the crucifix, but Sebastio snatches it away, holding
it up as if to ward you off.  \"Demon!  Heretic!\" he screams.  \"You'd
love to defile this holy cross to prove to these pagans you're also a
satan worshipper and an enemy of the church!  You'll die first!\"" CR>
		       <JAPANESE-INTERESTED?>)>)>>

<ROUTINE JAPANESE-INTERESTED? ()
	 <COND (<IN? ,OMI ,HERE>
		<COND (<IN? ,YABU ,HERE>
		       <TELL CR
"Yabu appears a little less bored, and Omi somewhat interested by
your behavior." CR>)
		      (ELSE
		       <TELL CR
CTHE ,OMI " watches this exchange with interest.  He seems
very excited by your apparent hatred of the priest." CR>)>)>
	 <RTRUE>>

<ROUTINE I-SEBASTIO-PRAYS ()
	 <TELL CR
CTHE ,SEBASTIO " kneels, staring fixedly at the pieces of the cross.  He
picks up the violated wood.  He turns to you, and says quietly, \"I
will pray for you, heretic.\"" CR>>

<ROUTINE I-BOW? ()
	 <TELL CR
"Yabu seems to have taken your treatment of the priest as a personal
insult.  Amazed by your lack of manners, he orders you
put to death." CR>
	 <JIGS-UP>
	 <RFATAL>>

<GLOBAL YABU-QUESTION 0>

<ROUTINE I-YABU-AUDIENCE ()
	 <ZLINES ,YABU-CNT
		 (<SETUP-ANSWER "i am">
		  <THIS-IS-IT ,SEBASTIO>
		  <SETG QCONTEXT ,YABU>
		  <SETG YABU-QUESTION 1>
		  <TELL CR
"Father Sebastio comes forward.  \"I will translate for you,\" he
says.  \"The "I"daimyo"", Kasigi Yabu, Lord of Izu, wants to know who you are,
where you come from, how you got here, and what acts of piracy you have
committed.\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,YABU-QUESTION 1>
			 <THIS-IS-IT ,SEBASTIO>
			 <COND (<G? ,DELAY-CNT 3>
				<YABU-SAYS "filthy barbarian pirate">
				<RFATAL>)
			       (ELSE
				<SETUP-ANSWER "i am">
				<TELL CR
"\"Answer the "I"daimyo"", heretic!  Who are you?\"" CR>
				<RTRUE>)>)>)
		 (<SETUP-ANSWER "i sailed from">
		  <THIS-IS-IT ,SEBASTIO>
		  <SETG QCONTEXT ,YABU>
		  <SETG YABU-QUESTION 2>
		  <TELL CR
"Father Sebastio asks, \"Where did you sail from?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,YABU-QUESTION 2>
			 <THIS-IS-IT ,SEBASTIO>
			 <COND (<G? ,DELAY-CNT 3>
				<YABU-SAYS "mannerless freak">
				<RFATAL>)
			       (ELSE
				<SETUP-ANSWER "i sailed from">
				<TELL CR
"\"Answer the "I"daimyo"", heretic!  Where did your pirate ship sail
from?\"" CR>
				<RTRUE>)>)>)
		 (<SETG YABU-QUESTION 3>
		  <THIS-IS-IT ,SEBASTIO>
		  <SETG QCONTEXT ,YABU>
		  <SETUP-ANSWER "i am">
		  <TELL CR
"The Jesuit asks, \"What are you?  You're not the Captain!\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,YABU-QUESTION 3>
			 <THIS-IS-IT ,SEBASTIO>
			 <COND (<G? ,DELAY-CNT 3>
				<CRLF>
				<YABU-SAYS "barbarian ape">
				<RFATAL>)
			       (ELSE
				<SETUP-ANSWER "i am">
				<TELL CR
"\"Answer the "I"daimyo"", heretic!  What are you?  You're obviously
an officer!\"" CR>
				<RTRUE>)>)>)
		 (<SETG YABU-QUESTION 4>
		  <THIS-IS-IT ,SEBASTIO>
		  <SETG QCONTEXT ,YABU>
		  <SETUP-ANSWER "i sailed">
		  <TELL CR
"Father Sebastio asks, trying to control his anger, \"How did you get
here?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,YABU-QUESTION 4>
			 <THIS-IS-IT ,SEBASTIO>
			 <COND (<G? ,DELAY-CNT 2>
				<SETG YABU-QUESTION 0>
				<TELL CR
G"The priest confers with Yabu.  \"Yabu says ""it is unimportant.  We
will find out these facts in due time.\"" CR>
				<RFATAL>)
			       (ELSE
				<SETUP-ANSWER "i sailed">
				<TELL CR
"\"Answer the "I"daimyo""!  How did you get here?\"" CR>
				<RTRUE>)>)>)
		 (<SETG YABU-QUESTION 0>
		  <THIS-IS-IT ,SEBASTIO>
		  <SETG QCONTEXT <>>
		  <SETUP-ANSWER <>>
		  <FSET ,SEBASTIO-CRUCIFIX ,RMUNGBIT>
		  <THIS-IS-IT ,SEBASTIO-CRUCIFIX>
		  <TELL CR
"Now, " THE ,SEBASTIO " is barely listening to you.  \"You're a lying
heretic pirate!\" screams the priest, spittle flying from his mouth
as he whirls toward you, shaking his fist.  His crucifix on its long
chain waves mockingly near your face." CR>)
		 (<THIS-IS-IT ,YABU>
		  <TELL CR
"\""I"Ano mono wa nani o moshite oru?""\" the "I"daimyo"" snaps
impatiently." CR>)
		 (2
		  <THIS-IS-IT ,YABU>
		  <TELL CR
"Yabu is becoming bored and impatient.  He turns his back to the priest,
obvious detestation all over his face." CR>)
		 (3
		  <TELL CR
CTHE ,SEBASTIO " translates Yabu's sentence. \"This ship, alien, non-Portuguese, and pirate, is
confiscated with all it contains.  All pirates are sentenced to immediate
crucifixion.\"" CR>
		  <DEQUEUE I-YABU-AUDIENCE>
		  <JIGS-UP>)>>

<ROUTINE YABU-SAYS (STR)
	 <CRLF>
	 <TELL
G"The priest confers with Yabu.  \"Yabu says ""you are a " .STR ", and you
are condemned to death.\"">
	 <JIGS-UP>>

<END-SEGMENT ;"YABU">



<BEGIN-SEGMENT PIT>

<ROOM PIT	;"setup s-pit"
      (LOC ROOMS)
      (SCENE S-PIT)
      (DESC "Pit")
      (AFTER PIT-AFTER-F)
      (SYNONYM PIT CELLAR)
      (SCORE 5)
      (FDESC
"At Yabu's order, the samurai herd you and your crew across the square,
down a ladder, and underground.  A trap door locks above you.")
      (FLAGS ONBIT)
      (GLOBAL TRAPDOOR LG-CREWMEN PIETERZOON)
      (ACTION PIT-F)>

<ROUTINE PIT-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE T>
		<PUTP ,VILLAGE-SQUARE ,P?FDESC <>>
		<NEW-SDESC ,ONNA "Onna">
		<NEW-SDESC ,SEBASTIO "Father Sebastio">
		<REMOVE ,SEBASTIO-CRUCIFIX>
		<NEW-SDESC ,OMI "Omi">
		<MOVE ,CAULDRON ,VILLAGE-SQUARE>
		<MOVE-CREW ,PIT>
		<REMOVE ,CREWMEN>
		<MOVE ,ROPER ,HERE>
		<MOVE ,SONK ,HERE>
		<QUEUE I-PIT -1>)
	       (<RARG? LOOK>
		<TELL
"You are crammed into a deep cellar, one of the many that the fishermen
use to store sun-dried fish.  The cellar is five paces long and five wide
and four deep, with an earthen floor and walls.  ">
		<COND (<IN? ,OFFAL ,HERE>
		       <TELL
"The floor is awash with rotting fish offal and seawater.  ">)>
		<TELL-CEILING>)
	       (<RARG? BEG>
		<COND (<P? DISEMBARK ROOMS>
		       <DO-WALK ,P?UP>)
		      (<P? BOARD GLOBAL-HERE>
		       <TELL G"You already are." CR>)
		      (<AND <VERB? PICK>
			    <FSET? ,PRSO ,PERSON>
			    ,MUST-CHOOSE?>
		       <TELL
"\"The only fair thing is to draw straws!\" says Vinck." CR>)
		      (<AND <HOSTILE-VERB?>
			    <PRSO? ,OMI ,MURA ,SEBASTIO>>
		       <TELL
G"You can't reach ""him." CR>)
		      (<AND <VERB? PISS>
			    ,PRSO
			    <FSET? ,PRSO ,PERSON>>
		       <TELL
"The crewmen are appalled at your behavior.  " CTHE ,PRSO " squirms
away, trying to clean himself off." CR>)
		      (<AND <P? SIT (ROOMS GROUND)>
			    <B-STANDING?>
			    <IN? ,OFFAL ,HERE>>
		       <B-SIT>
		       <TELL
"You find a relatively dry spot and sit down.  The others complain but
they finally rearrange themselves and quiet down." CR>)
		      (<AND <P? LIE-DOWN>
			    <IN? ,OFFAL ,HERE>>
		       <TELL
"You want to lie down in old fish heads?  You must be a barbarian!" CR>)
		      (<VERB? YELL YELL-AT>
		       <COND (<NOT <FSET? ,TRAPDOOR ,OPENBIT>>
			      <TELL
"You begin yelling, and everyone else joins in.  \"Water!  And food, by
God!  Let us out of here!\"" CR>)
			     (ELSE
			      <TELL
"The Japanese look at you with contempt." CR>)>)
		      (<P? LOOK-UP>
		       <TELL-CEILING>)
		      (<P? WALK (P?UP P?OUT)>
		       <COND (<IN? ,LADDER ,HERE>
			      <PERFORM ,V?CLIMB-FOO ,LADDER>
			      <RTRUE>)
			     (ELSE
			      <TELL
"You can't climb out without a ladder.  The pit is too deep." CR>)>)
		      (<P? (PARRY STOP) <>>
		       <COND (<OR <IN? ,OMI-SAMURAI ,LADDER>
				  <IN? ,OMI-SAMURAI ,PIT>>
			      <PERFORM ,V?ATTACK ,OMI-SAMURAI>
			      <RTRUE>)>)
		      (<OR <P? (HELP TAKE STOP PUSH-DOWN SIT)
			       (VINCK PIETERZOON)>
			   <P? (HELP STOP) ME>>
		       <COND (<PRSO? VINCK ME>
			      <PERFORM ,V?STOP ,LADDER>
			      <RTRUE>)
			     (<AND <PRSO? PIETERZOON>
				   <IN? ,PIETERZOON ,CAULDRON>>
			      <TELL
			       "\"">
			      <COND (,VINCK-PICKED? <TELL "Vinck">)
				    (ELSE <TELL "The Pilot">)>
			      <TELL
" should have gone.  He was the lamb of God.  And now his
soul's forfeit, he'll burn for all eternity.\"" CR>)>)
		      (<AND <P? LISTEN (<> PIETERZOON VINCK)>
			    <OR <IN? ,PIETERZOON ,CAULDRON>
				<IN? ,VINCK ,CAULDRON>>>
		       <TELL
"There is no longer any sound.  The silence, you fear, is that of death." CR>)>)>>

<ROUTINE TELL-CEILING ()
	 <TELL
"The ceiling is made of planks with a foot of earth above and a single ">
	 <COND (<FSET? ,TRAPDOOR ,OPENBIT>
		<TELL "open ">)
	       (ELSE
		<TELL "closed ">)>
	 <TELL D ,TRAPDOOR " set into it." CR>>

<OBJECT SEAWATER
	(DESC "seawater")
	(SYNONYM SEAWATER WATER)
	(ADJECTIVE SEA)
	(FLAGS NDESCBIT)
	(ACTION SEAWATER-F)>

<ROUTINE SEAWATER-F ()
	 <COND (<VERB? DRINK>
		<TELL
"You'll go mad from drinking seawater!" CR>)>>

<OBJECT OFFAL
	(DESC "offal")
	(SYNONYM OFFAL HEADS FISH ENTRAILS)
	(ADJECTIVE FISH ROTTING)
	(FLAGS NDESCBIT)
	(ACTION OFFAL-F)>

<ROUTINE OFFAL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's rotting fish heads and entrails." CR>)
	       (<VERB? SMELL>
		<TELL
"It smells offal." CR>)
	       (<VERB? EAT>
		<TELL
"You'd be crazy to eat that!" CR>)>>

<GLOBAL VINCK-PICKED? <>>

<ROUTINE I-PIT ()
	 <ZLINES ,PIT-CNT
		 (<TELL CR
"Captain-General Spillbergen, half-awake and querulous, says \"Pass the
water.\"" CR CR
"\"There isn't any, Paulus\" Van Nekk answers gloomily, \"We haven't
even got a pot to piss in!\"" CR CR
"Spillbergen points at Vinck.  \"Ask for water!\" he orders." CR CR
"Vinck stands under the opening and shouts, \"Hey!  You up there!  Give
us God-cursed water!  We want food and water!\"" CR CR
"There is no answer." CR>)
		 (<FSET ,TRAPDOOR ,OPENBIT>
		  <MOVE ,OMI ,TRAPDOOR>
		  <MOVE ,SEBASTIO ,TRAPDOOR>
		  <MOVE ,MURA ,TRAPDOOR>
		  <MARGINAL-PIC ,P-PIT>
		  <TELL CR
"The trapdoor opens.  Omi looks down at you.  Beside him are Mura and the
priest.">
		  <COND (<VERB? YELL YELL-AT>
			 <TELL
"Everyone but you begins yelling.  \"Water!  And food, by God!  Let
us out of here!\"">)
			(ELSE
			 <TELL
"Everyone is still yelling.">)>
		  <MOVE ,OFFAL ,PIT>
		  <MOVE ,SEAWATER ,PIT>
		  <TELL "Omi motions to Mura, who nods and leaves." CR CR
"Mura returns with another fisherman, carrying a large barrel.  They empty
the contents, rotting fish offal and seawater, onto your heads." CR>)
		 (<SETG MUST-CHOOSE? T>
		  <FCLEAR ,TRAPDOOR ,OPENBIT>
		  <MOVE ,SEBASTIO ,VILLAGE-SQUARE>
		  <MOVE ,MURA ,VILLAGE-SQUARE>
		  <MOVE ,OMI ,VILLAGE-SQUARE>
		  <TELL CR
"Omi begins talking.  When he finishes, the priest nervously
translates.  \"These are Kasigi Omi's orders: You will begin to act like
decent human
beings.  You will make no more noise.  When you have learned to behave, you
will be allowed up into the world of men.  Lord Yabu has spared all your
lives, providing you serve him loyally.  All except one.  One of you is to
die.  At dusk.  You are to choose who it will be.\"" CR CR
"The trapdoor slams into place." CR>)
		 (<MOVE ,VINCKS-STRAW ,HERE>
		  <SETG VINCK-PICKED? <>>
		  <COND (<PROB 50> <SETG VINCK-PICKED? T>)>
		  <MOVE ,STRAW ,SPILLBERGEN>
		  <TELL CR
"It's now very near dusk." CR CR
"Spillbergen collects a bundle of rice straw stalks from the litter in
the pit.  Slowly, reluctantly,
the crewmen draw straws.  Sonk first, then Pieterzoon, then Jan Roper,
Salomon, and Croocq.  Then Ginsel is safe.  Five left.  Maetsukker, weeping
openly, pushes Vinck aside and takes a straw.  He can't believe it's not
the one.  Van Nekk picks and the straw is not short!|
|
Vinck watches his fingers select a straw and it falls to
the ground but everyone sees it's the shortest straw yet.|
|
Now it's your turn.  Spillbergen holds out his trembling hand toward
you.  There are only two straws left; one for you and one for the
Captain." CR>)
		 (DELAY
		  <COND (<NOT <OR <IN? ,SHORT-STRAW ,BLACKTHORNE>
				  <IN? ,LONG-STRAW ,BLACKTHORNE>>>
			 <COND (<G? ,DELAY-CNT 5>
				<TELL CR
"One of the men hits you over the head, you fight back, and in no time
it's a melee.  You are knocked unconscious, and drown, unnoticed as the
rest of the crew squabbles." CR>
				<JIGS-UP>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"Pick, curse you!\" yells Maetsukker.  \"Yes, pick!\" the other crewmen
take up the cry." CR>
				<COND (<EQUAL? ,DELAY-CNT 5>
				       <TELL CR
"You realize you'd better pick now, or you'll be forced to." CR>)>
				<RTRUE>)>)>)
		 (<TELL CR
"Spillbergen, last to pick, unclenches his hand and you see that
his straw is long.  Everyone stares at ">
		  <SETG PIT-CNT 0>
		  <SETG MUST-CHOOSE? <>>
		  <DEQUEUE I-PIT>
		  <COND (,VINCK-PICKED?
			 <QUEUE I-TAKE-VINCK -1>
			 <TELL "Vinck.  \"I'm dead!\" he
laughs, unnerving you all." CR>)
			(ELSE
			 <QUEUE I-TAKE-YOU -1>
			 <TELL "you.  The men ease away from you." CR>)>)>>

<GLOBAL MUST-CHOOSE? <>>

<ROUTINE TRAPDOOR-OPENS ()
	 <TELL CR
"The trapdoor opens.  Omi stands etched against the sky, his kimono blooded
by the dying sun.  The ladder is lowered, and Omi motions for the one man
to come up.  \""I"Isogi""!\" he barks.  Hurry up.  ">>

<ROUTINE I-TAKE-VINCK ()
	 <ZLINES ,PIT-CNT
		 (<FSET ,TRAPDOOR ,OPENBIT>
		  <MOVE ,OMI ,TRAPDOOR>
		  <MOVE ,LADDER ,HERE>
		  <TRAPDOOR-OPENS>
		  <TELL "Vinck tries to stand, but
his legs fail him.  Pieterzoon bends down to help him to his feet." CR>)
		 (<COND (<NOT <FSET? ,VINCK ,RMUNGBIT>>
			 <THEY-TAKE-VICTIM ,VINCK>)
			(<FSET? ,LADDER ,SCOREBIT>
			 <TELL CR
"\"Get away from the ladder, Pilot!  You're ordered away!\"  Spillbergen shakily
keeps to his corner, as far from the ladder as possible." CR>)
			(ELSE
			 <TELL CR
"Vinck comes out of his cataleptic state and throws himself at one of the
samurai, berserk.  He intercepts a blow that would have sliced your wrist
off." CR>)>)
		 (<COND (<FSET? ,LADDER ,SCOREBIT>
			 <TELL CR
"Vinck begins to climb the ladder, almost in a trance." CR>)
			(<FSET? ,OMI-SAMURAI ,RMUNGBIT>
			 <FCLEAR ,OMI-SAMURAI ,RMUNGBIT>
			 <RFALSE>)
			(ELSE
			 <OMI-BARKS>)>)
		 (DELAY
		  <COND (<AND <FSET? ,LADDER ,RMUNGBIT>
			      <L? ,DELAY-CNT 2>>
			 <FCLEAR ,LADDER ,RMUNGBIT>
			 <RFALSE>)
			(<AND <IN? ,LOSING-SAMURAI ,PIT>
			      <FSET? ,LOSING-SAMURAI ,SCOREBIT>
			      <L? ,DELAY-CNT 5>>
			 <RFALSE>)>)
		 (<COND (<FSET? ,LADDER ,SCOREBIT>
			 <FCLEAR ,LADDER ,SCOREBIT>
			 <TELL CR
G"The samurai are hampered by the confined space, but a kick from one of
them catches Vinck in the face and he reels away." CR>)
			(ELSE
			 <THEY-TAKE-VICTIM ,PIETERZOON>)>)
		 (DELAY
		  <COND (<FSET? ,LADDER ,RMUNGBIT>
			 <FCLEAR ,LADDER ,RMUNGBIT>
			 <RFALSE>)
			(<AND <IN? ,LOSING-SAMURAI ,PIT>
			      <FSET? ,LOSING-SAMURAI ,SCOREBIT>
			      <L? ,DELAY-CNT 5>>
			 <RFALSE>)>)
		 (<COND (<NOT <FSET? ,LADDER ,SCOREBIT>>
			 <THEY-TAKE-VICTIM ,PIETERZOON>)>)>>

<ROUTINE OMI-BARKS ()
	 <TELL CR
"Omi barks an order, and several ">
	 <COND (<IN? ,OMI-SAMURAI ,LADDER> <TELL "more ">)
	       (ELSE
		<FSET ,OMI-SAMURAI ,RMUNGBIT>
		<MOVE ,OMI-SAMURAI ,LADDER>)>
	 <THIS-IS-IT ,OMI-SAMURAI>
	 <TELL "samurai start to descend the ladder." CR>
	 <SCORE-OBJECT ,LADDER>
	 <RTRUE>>

<ROUTINE I-TAKE-YOU ()
	 <COND (<IN? ,BLACKTHORNE ,VILLAGE-SQUARE>
		<DEQUEUE I-TAKE-YOU>
		<CRLF>
		<JIGS-UP
"Almost immediately, the samurai surround you, truss you up, and
dump you in the huge iron cauldron.  The fire beneath it is lit,
the water begins to heat up.|
|
At first the heat is almost pleasant, but then it begins to sear
into your exhausted flesh, and you struggle vainly to break your
bonds.  You begin to scream.|
|
Just as you lose consciousness, you see the samurai bringing up
Vinck, and you can't help but wonder what would have happened had
you resisted.">
		<RFATAL>)>
	 <ZLINES ,PIT-CNT
		 (<FSET ,TRAPDOOR ,OPENBIT>
		  <MOVE ,OMI ,TRAPDOOR>
		  <MOVE ,LADDER ,HERE>
		  <TRAPDOOR-OPENS>
		  <TELL
"Roper says, \"Don't be afraid, Pilot.  You're the anointed of God.  You're
in God's hands.\"" CR>)
		 (<COND (<FSET? ,OMI-SAMURAI ,RMUNGBIT>
			 <FCLEAR ,OMI-SAMURAI ,RMUNGBIT>
			 <RFALSE>)
			(ELSE
			 <OMI-BARKS>
			 <RTRUE>)>)
		 (<TELL CR
G"The samurai are hampered by the confined space, but a kick from one of
them catches Vinck in the face and he reels away." CR>)
		 (DELAY
		  <COND (<AND <IN? ,LOSING-SAMURAI ,PIT>
				  <FSET? ,LOSING-SAMURAI ,SCOREBIT>>
			 <RFALSE>)
			(<FSET? ,LADDER ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 4>
				<FCLEAR ,LADDER ,SCOREBIT>)>
			 <RFALSE>)>)
		 (<COND (<NOT <FSET? ,LADDER ,SCOREBIT>>
			 <THEY-TAKE-VICTIM ,PIETERZOON>)>)
		 (<DEQUEUE I-TAKE-YOU>
		  <RFALSE>)>>

<NEW-ADD-WORD "STRAWS" NOUN <VOC "STRAW"> ,PLURAL-FLAG>

<OBJECT STRAW
	(DESC "straw")
	(SYNONYM STRAW STALK)
	(ADJECTIVE RICE)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-STRAW-F)
	(ACTION STRAW-F)>

<ROUTINE GENERIC-STRAW-F (R F)
	 <COND (<AND <LOC ,LONG-STRAW> <LOC ,SHORT-STRAW>>
		<>)
	       (ELSE ,STRAW)>>

<ROUTINE STRAW-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"There are two straws in Spillbergen's hand.  You stare at them intently,
but you can discern no difference between them." CR>)
	       (<VERB? TAKE PICK DRAW>
		<REMOVE ,STRAW>
		<COND (,VINCK-PICKED?
		       <MOVE ,SHORT-STRAW <LOC ,VINCKS-STRAW>>
		       <REMOVE ,VINCKS-STRAW>
		       <PUTP ,SHORT-STRAW ,P?OWNER ,VINCK>
		       <MOVE ,LONG-STRAW ,BLACKTHORNE>
		       <TELL
"You pick a straw, drawing your life out of Spillbergen's hand.  It's
long!" CR>)
		      (ELSE
		       <MOVE ,LONG-STRAW <LOC ,VINCKS-STRAW>>
		       <REMOVE ,VINCKS-STRAW>
		       <PUTP ,LONG-STRAW ,P?OWNER ,VINCK>
		       <MOVE ,SHORT-STRAW ,BLACKTHORNE>
		       <TELL
"You take a straw, and as you see it emerge, you realize that it's
short, very short!  Shorter than Vinck's.  Vinck laughs a short, barking
laugh, then is quiet." CR>)>)>>

<OBJECT VINCKS-STRAW
	(DESC "Vinck's straw")
	(OWNER VINCK)
	(SYNONYM STRAW STALK)
	(ADJECTIVE RICE SHORTEST)
	(FLAGS TAKEBIT NOABIT)
	(GENERIC GENERIC-STRAW-F)
	(ACTION VINCKS-STRAW-F)>

<ROUTINE VINCKS-STRAW-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's the shortest drawn yet." CR>)
	       (<VERB? TAKE>
		<TELL "\"No, Pilot, draw your own straw!\"" CR>)>>

<OBJECT SHORT-STRAW
	(DESC "short straw")
	(OWNER <>)
	(SYNONYM STRAW STALK)
	(ADJECTIVE RICE SHORT)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-STRAW-F)
	(ACTION SHORT-STRAW-F)>

<ROUTINE SHORT-STRAW-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's very short." CR>)
	       (<VERB? TRADE GIVE>
		<TELL
"No one wants the short straw." CR>)
	       (<P? ASK-FOR VINCK SHORT-STRAW>
		<PERFORM ,V?TRADE ,LONG-STRAW ,VINCK>
		<RTRUE>)>>

<OBJECT LONG-STRAW
	(DESC "long straw")
	(OWNER <>)
	(SYNONYM STRAW STALK)
	(ADJECTIVE RICE LONG)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-STRAW-F)
	(ACTION LONG-STRAW-F)>

<ROUTINE LONG-STRAW-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's blessedly long." CR>)
	       (<P? ASK-FOR>
		<PERFORM ,V?TRADE ,SHORT-STRAW>
		<RTRUE>)
	       (<AND <P? (TRADE GIVE) LONG-STRAW (<> VINCK SHORT-STRAW)>
		     <HELD? ,LONG-STRAW>>
		<REMOVE ,LONG-STRAW>
		<DEQUEUE I-TAKE-VINCK>
		<QUEUE I-TAKE-YOU -1>
		<TELL
"\"Bless you, Pilot!\" babbles Vinck">
		<COND (<IN? ,SHORT-STRAW ,VINCK>
		       <MOVE ,SHORT-STRAW ,PLAYER>
		       <TELL
", thrusting the death straw into your hands." CR>)
		      (ELSE <TELL "." CR>)>)>>

<ROUTINE THEY-TAKE-VICTIM (WHO)
	 <MOVE ,OMI ,VILLAGE-SQUARE>
	 <MOVE ,OMI-SAMURAI ,VILLAGE-SQUARE>
	 <NEW-SDESC ,OMI-SAMURAI "samurai guards" T>
	 <FSET ,OMI-SAMURAI ,NOABIT>
	 <MOVE ,BLACKTHORNE ,HERE>
	 <REMOVE ,LADDER>
	 <MOVE .WHO ,CAULDRON>
	 ;<FSET .WHO ,NDESCBIT>
	 <FCLEAR ,TRAPDOOR ,OPENBIT>
	 <FCLEAR ,LADDER ,SCOREBIT> ;"just in case"
	 <COND (<EQUAL? .WHO ,VINCK>
		<TELL CR
"Vinck, in an almost cataleptic state, climbs onto the ladder, pulling
himself painfully upward.  Van Nekk and Jan Roper are praying silently,
their eyes closed.  Pieterzoon cannot watch.  You stare ashamedly at Vinck,
hating yourself for letting him go." CR CR
"As he reaches the top of the ladder, three samurai grab him.  The ladder
is quickly pulled up and the trapdoor slams shut like the sound of doom." CR>
		<FAILED-SCENE>
		<RTRUE>)
	       (<EQUAL? .WHO ,PIETERZOON>
		<MOVE ,VINCK ,HERE>
		<TELL CR
"Three more samurai, carrying knives and wearing only loincloths, leap
nimbly into the cellar.  The first two crash into you, carrying you
helpless to the floor.  ">
		<COND (<IN? ,DAGGER ,BLACKTHORNE>
		       <MOVE ,DAGGER ,HERE>
		       <TELL "The dagger falls from your grip.  ">)>
		<TELL
"They attack viciously, and the crewmen retreat.">
		<COND (<IN? ,DAGGER ,HERE>
		       <REMOVE ,DAGGER>
		       <TELL "One samurai retrieves the dagger.">)>
		<TELL "|
|
Omi comes arrogantly into the pit and grabs the nearest man, who is
Pieterzoon.  He jerks him toward the ladder.  \"Christ help me, it's not
me that's to go -- \"Pieterzoon is being driven up the ladder." CR CR
"Omi follows without hurrying.  The samurai retreat">
		<COND (<IN? ,LOSING-SAMURAI ,HERE>
		       <COND (<FSET? ,LOSING-SAMURAI ,SCOREBIT>
			      <REMOVE ,LOSING-SAMURAI>
			      <TELL ", including the one you knocked off
of the ladder, though he appears wary and even embarrassed.">)
			     (ELSE
			      <TELL " stepping contemptuously over
the prostrate body of their unconscious comrade.">)>)
		      (ELSE <TELL ".">)>
		<TELL "The ladder is jerked aloft.  Air and
sky and light vanish.  Bolts crash into place." CR>)>
	 <DEQUEUE I-TAKE-VINCK>
	 <DEQUEUE I-TAKE-YOU>
	 <SETG PIT-CNT 0>
	 <QUEUE I-TAKE-CROOCQ -1>
	 <RTRUE>>

<OBJECT TRAPDOOR
	(LOC PIT)
	(DESC "trapdoor")
	(SYNONYM TRAPDOOR DOOR OPENING CEILING)
	(ADJECTIVE TRAP)
	(FLAGS DOORBIT SEARCHBIT)
	(DESCFCN TRAPDOOR-DESC)
	(ACTION TRAPDOOR-F)>

<ROUTINE TRAPDOOR-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<FSET? .OBJ ,OPENBIT> <RTRUE>)
		      (ELSE <RFATAL>)>)
	       (ELSE
		<TELL
"Through the open trapdoor you can see Omi">
		<COND (<IN? ,MURA ,TRAPDOOR>
		       <TELL ", Father Sebastio and Mura">)>
		<TELL " silhouetted against the sky.">)>>

<ROUTINE TRAPDOOR-F ("OPT" (RARG <>))
	 <COND (.RARG <RFALSE>)
	       (<VERB? OPEN CLOSE>
		<COND (<IN? ,WINNER ,LADDER>
		       <TELL
"The weapons of the samurai prevent you from climbing high enough." CR>)
		      (ELSE
		       <TELL G"You can't reach ""it." CR>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (<NOT <FSET? ,TRAPDOOR ,OPENBIT>>
		       <TELL
"It's closed." CR>)
		      (<IN? ,OMI ,TRAPDOOR>
		       <TRAPDOOR-DESC ,M-OBJDESC ,TRAPDOOR>
		       <CRLF>)>)
	       (<VERB? KNOCK>
		<TELL G"You can't reach ""it." CR>)>>

<OBJECT LADDER
	(DESC "ladder")
	(SYNONYM LADDER)
	(FLAGS SURFACEBIT TAKEBIT TRYTAKEBIT VEHBIT
	       SCOREBIT OPENBIT CONTBIT SEARCHBIT)
	(DESCFCN LADDER-DESC)
	(ACTION LADDER-F)>

<ROUTINE LADDER-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL "A ladder leads ">
		<COND (<HERE? ,PIT>
		       <TELL "up through the open trap door.">)
		      (ELSE
		       <TELL "down into the pit.">)>)>>

<ROUTINE LADDER-F ("OPT" (RARG <>))
	 <COND (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <COND (<IN? ,OMI-SAMURAI ,LADDER>
			      <TELL
"There are samurai on the ladder." CR>)
			     (ELSE
			      <TELL
"It's a rickety wooden ladder." CR>)>)
		      (<VERB? STOP KINJIRU>
		       <COND (<IN? ,OMI-SAMURAI ,LADDER>
			      <TELL
"Swords swinging, the samurai continue down the ladder." CR>)
			     (<IN? ,OMI-SAMURAI ,PIT>
			      <TELL
"There's nothing to block or stop." CR>)
			     (<NOT <IN? ,LADDER ,HERE>>
			      <COND (<FSET? ,LADDER ,SCOREBIT>
				     <TELL "You hold ">
				     <COND (,VINCK-PICKED? <TELL "him ">)>
				     <TELL
"back.  The others grumble, but Roper says \"Aye, no
need to go until they come for you.\"" CR>)
				    (,VINCK-PICKED?
				     <TELL
"You grab Vinck, but he pulls away." CR>)
				    (ELSE
				     <TELL "You hold back." CR>)>)
			     (<AND ,VINCK-PICKED?
				   <NOT <FSET? ,VINCK ,RMUNGBIT>>>
			      <FSET ,VINCK ,RMUNGBIT>
			      <TELL
"You move between Vinck and the ladder.  \""I"Kinjiru"G"!\" you say,
remembering the word from the ship.  \"None of my crew is walking to
death without a fight!\"|
|
\"It's all right, Pilot,\" Vinck whispers.  \"We did agree and it was
fair.  It's God's will.  I'm going.\"""  He steps to the foot of the ladder." CR>)
			     (<FSET? ,LADDER ,SCOREBIT>
			      <TELL
"You stand implacably ">
			      <COND (,VINCK-PICKED?
				     <TELL "in the way.  ">)
				    (ELSE
				     <TELL
"at the foot of the ladder.  The watchers can see no one is coming up.  ">)>
			      <SAMURAI-ON-LADDER>)>)
		      (<OR <VERB? TAKE SHAKE MOVE LOWER KICK>
			   <P? PUSH-DOWN <> LADDER>>
		       <COND (<HERE? ,VILLAGE-SQUARE>
			      <TELL
G"Two of the samurai prevent you, and although you struggle, they hold
you easily." CR>)
			     (ELSE
			      <TELL
"You shake the ladder.">
			      <FSET ,LADDER ,RMUNGBIT>
			      <COND (<QUEUED? I-TAKE-CROOCQ>
				     <TELL
"There is no reaction from those above.  They wait patiently." CR>)
				    (<IN? ,OMI-SAMURAI ,LADDER>
				     <TELL
"The samurai hold tightly onto the ladder, but one swings a sword at
you!" CR>
				     <SCORE-OBJECT ,LADDER>)
				    (ELSE
				     <TELL
"A gasp goes through the cellar.  ">
				     <SAMURAI-ON-LADDER>
				     <RTRUE>)>)>)
		      (<VERB? CLIMB-FOO CLIMB-ON CLIMB-UP CLIMB-DOWN BOARD>
		       <COND (<HERE? ,VILLAGE-SQUARE>
			      <TELL
G"Two of the samurai prevent you, and although you struggle, they hold
you easily." CR>)
			     (<OR <QUEUED? I-TAKE-CROOCQ>
				  <QUEUED? I-TAKE-YOU>>
			      <MOVE ,LADDER ,VILLAGE-SQUARE>
			      <MOVE ,OMI-SAMURAI ,VILLAGE-SQUARE>
			      <NEW-SDESC ,OMI-SAMURAI "samurai guards" T>
			      <FSET ,OMI-SAMURAI ,NOABIT>
			      <MOVE ,SEBASTIO ,VILLAGE-SQUARE>
			      <MOVE ,OMI ,VILLAGE-SQUARE>
			      <TELL
"You climb up the ladder into the sunlight, blinking in the brightness.">
			      <COND (<HELD? ,DAGGER>
				     <REMOVE ,DAGGER>
				     <TELL
"As you reach the top of the ladder, strong hands grab you and force
you to drop the dagger.">)>
			      <CRLF>
			      <CRLF>
			      <GOTO ,VILLAGE-SQUARE>)
			     (ELSE
			      <MOVE ,PLAYER ,LADDER>
			      <COND (<IN? ,OMI ,TRAPDOOR>
				     <FSET ,OMI-SAMURAI ,RMUNGBIT>
				     <MOVE ,OMI-SAMURAI ,LADDER>
				     <THIS-IS-IT ,OMI-SAMURAI>
				     <TELL
"You begin to climb onto the ladder, but Omi orders two samurai forward,
and they climb down, swords unsheathed." CR>
				     <SCORE-OBJECT ,LADDER>)
				    (<IN? ,OMI-SAMURAI ,LADDER>
				     <TELL
"Swords swinging, the samurai block your progress and then continue
down the ladder." CR>)
				    (<AND ,VINCK-PICKED?
					  <NOT <FSET? ,VINCK ,RMUNGBIT>>>
				     <FSET ,VINCK ,RMUNGBIT>
				     <TELL
"You block Vinck from the ladder.  \""I"Kinjiru"G"!\" you say,
remembering the word from the ship.  \"None of my crew is walking to
death without a fight!\"|
|
\"It's all right, Pilot,\" Vinck whispers.  \"We did agree and it was
fair.  It's God's will.  I'm going.\"""  He continues toward the ladder." CR>)
				    (<FSET? ,LADDER ,SCOREBIT>
				     <TELL
"You climb onto the lower rungs of the ladder, ">
				     <COND (,VINCK-PICKED?
					    <TELL "blocking it.  ">)
					   (ELSE
					    <TELL
"then stop.  The watchers can see you are coming no higher.  ">)>
				     <SAMURAI-ON-LADDER>)>)>)>)>>

<ROUTINE SAMURAI-ON-LADDER ()
	 <FSET ,OMI-SAMURAI ,RMUNGBIT>
	 <MOVE ,OMI-SAMURAI ,LADDER>
	 <THIS-IS-IT ,OMI-SAMURAI>
	 <TELL G"Omi snarls orders to his men.  At once
a samurai, followed by two others, starts down the steps, swords
unsheathed." CR>
	 <SCORE-OBJECT ,LADDER>>

<OBJECT LOSING-SAMURAI
	(DESC "captured samurai")
	(SCENE S-PIT)
	(SYNONYM SAMURAI COMRADE)
	(ADJECTIVE CAPTURED PROSTRATE UNCONSCIOUS)
	(FLAGS PERSON JAPANESEBIT SCOREBIT OPENBIT SEARCHBIT CONTBIT)
	(GENERIC GENERIC-SAMURAI-F)
	(CONTFCN LOSING-SAMURAI-F)
	(ACTION LOSING-SAMURAI-F)>

<ROUTINE LOSING-SAMURAI-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<AND <RARG? CONTAINER>
		     <NOT <PASSIVE-VERB?>>>
		<PERFORM ,V?ATTACK ,LOSING-SAMURAI>
		<RTRUE>)
	       (<RARG? WINNER>
		<COND (<NOT <FSET? ,LOSING-SAMURAI ,SCOREBIT>>
		       <TELL
G"He appears to be unconscious." CR>)
		      (ELSE
		       <TELL
G"He doesn't respond." CR>)>)
	       (<VERB? EXAMINE>
		<COND (<NOT <FSET? ,LOSING-SAMURAI ,SCOREBIT>>
		       <TELL
G"He appears to be unconscious." CR>)
		      (ELSE
		       <TELL
"He's fighting, kicking and punching, trying to get away." CR>)>)
	       (<VERB? WAKE>
		<COND (<NOT <FSET? ,LOSING-SAMURAI ,SCOREBIT>>
		       <TELL
"He's alive, but he doesn't wake up." CR>)>)
	       (<VERB? SEARCH>
		<COND (<NOT <FSET? ,LOSING-SAMURAI ,SCOREBIT>>
		       <TELL
"You don't find anything of interest." CR>)>)
	       (<OR <VERB? TAKE MOVE> <HOSTILE-VERB?>>
		<COND (<FSET? ,LOSING-SAMURAI ,SCOREBIT>
		       <DROPS-DAGGER>)
		      (<VERB? KILL>
		       <COND (<FSET? ,LOSING-SAMURAI ,DEAD>
			      <TELL
"He's already dead." CR>)
			     (<PRSI? ,DAGGER>
			      <FSET ,LOSING-SAMURAI ,DEAD>
			      <TELL
"You stab him in the heart.  He's dead." CR>)
			     (ELSE
			      <FSET ,LOSING-SAMURAI ,DEAD>
			      <TELL
"You hold his face under the water until he stops breathing.  He's dead." CR>)>)
		      (<VERB? TAKE MOVE>
		       <TELL
"You move him up against the wall where he won't drown.  The others are saying
\"Kill him, Pilot!\" or \"Use him as a hostage!\"" CR>)
		      (ELSE
		       <TELL
"He's already unconscious." CR>)>)>>

<OBJECT OMI-SAMURAI
	(SDESC "attacking samurai") ;"samurai guards"
	(SCENE S-PIT)
	(OWNER OMI)
	(SYNONYM SAMURAI GUARDS GUARD)
	(ADJECTIVE ATTACKING)
	(FLAGS PERSON JAPANESEBIT NOABIT PLURAL)
	(DESCFCN OMI-SAMURAI-DESC)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION OMI-SAMURAI-F)>

<ROUTINE OMI-SAMURAI-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<IN? ,OMI-SAMURAI ,LADDER> <RTRUE>)
		      (ELSE <RFALSE>)>)
	       (<RARG? OBJDESC>
		<TELL
"Advancing down the ladder are ">
		<COND (<IN? ,LOSING-SAMURAI ,PIT>
		       <TELL "two">)
		      (ELSE <TELL "three">)>
		<TELL " samurai.">)>>

<ROUTINE OMI-SAMURAI-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<TELL
"They seem uninterested in conversing with barbarians." CR>
		<END-QUOTE>)
	       (<OR <VERB? TAKE MOVE PARRY STOP> <HOSTILE-VERB?>>
		<COND (<HERE? ,VILLAGE-SQUARE>
		       <TELL
"You are easily subdued by Omi's guards." CR>)
		      (<IN? ,OMI-SAMURAI ,LADDER>
		       <SETG OPPONENT ,OMI-SAMURAI>
		       <COND (<NOT <IN? ,LOSING-SAMURAI ,HERE>>
			      <MOVE ,LOSING-SAMURAI ,HERE>
			      <SETG OPPONENT ,LOSING-SAMURAI>
			      <THIS-IS-IT ,LOSING-SAMURAI>
			      <QUEUE I-LOSING-SAMURAI -1>
			      <TELL
"You grapple with one of the samurai, who kicks viciously.  The entire
crew hurls themselves at the ladder.  The man manages to throw his
sword out of the pit, but tumbles heavily into the mud." CR>)
			     (ELSE
			      <TELL
"The remaining samurai are more wary this time.  Oddly, they make no effort
to rescue their comrade." CR>)>)
		      (<FSET? ,LOSING-SAMURAI ,SCOREBIT>
		       <DROPS-DAGGER>)>)>>

<ROUTINE I-LOSING-SAMURAI ()
	 <COND (<AND <HERE? ,PIT>
		     <IN? ,LOSING-SAMURAI ,HERE>
		     <FSET? ,LOSING-SAMURAI ,SCOREBIT>>
		<THIS-IS-IT ,LOSING-SAMURAI>
		<COND (<NOT <FSET? ,LOSING-SAMURAI ,RMUNGBIT>>
		       <FSET ,LOSING-SAMURAI ,RMUNGBIT>
		       <TELL CR
"The samurai you knocked off of the ladder gropes his way to his feet.  The
fall obviously hurt him." CR>)
		      (<NOT <FSET? ,LOSING-SAMURAI ,SURFACEBIT>>
		       <FSET ,LOSING-SAMURAI ,SURFACEBIT>
		       <TELL CR
"The muddy samurai draws a dagger and slashes at you.  He is like a cornered
rat." CR>)
		      (ELSE
		       <TELL CR
"The samurai charges, and almost as much by blind ferocity as skill, he
shoves his dagger into your chest, ending your life." CR>
		       <JIGS-UP>)>)
	       (ELSE
		<DEQUEUE I-LOSING-SAMURAI>
		<RFALSE>)>>

<ROUTINE DROPS-DAGGER ()
	 <MOVE ,DAGGER ,HERE>
	 <TELL
"You attempt to subdue the samurai, and Vinck helps, pounding again
and again.  \"Don't kill him -- we can use him as a hostage!\" you
warn.  Finally, Vinck kicks him in the back of the neck and he goes
limp, dropping his dagger." CR>
	 <SCORE-OBJECT ,LOSING-SAMURAI>>

<OBJECT DAGGER
	(LOC LOSING-SAMURAI)
	(DESC "dagger")
	(SYNONYM DAGGER)
	(FLAGS TAKEBIT WEAPONBIT)>

<OBJECT CAULDRON
	(DESC "cauldron")
	(SYNONYM CAULDRON)
	(FLAGS OPENBIT CONTBIT SEARCHBIT VEHBIT)
	(DESCFCN CAULDRON-DESC)
	(CONTFCN CAULDRON-F)
	(ACTION CAULDRON-F)>

<ROUTINE CAULDRON-F ("OPT" (RARG <>))
	 <COND (<P? (THROUGH BOARD) CAULDRON>
		<TELL
"They'll put you in soon enough!" CR>)
	       (<NOT <PASSIVE-VERB?>>
		<TELL
"The guards prevent you from getting close to the cauldron." CR>)>>

<ROUTINE CAULDRON-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<TELL
"A huge black-iron cauldron stands in the square.">
		<COND (<IN? ,CROOCQ ,CAULDRON>
		       <TELL "The boy Croocq, trussed like a chicken,
is inside.">)>
		<RFATAL>)>>

<ROUTINE I-TAKE-CROOCQ ("AUX" TMP)
	 <ZLINES ,PIT-CNT
		 (<COND (<SET TMP <FIRST? ,CAULDRON>>
			 <FSET .TMP ,DEAD>)>
		  <TELL CR
"The screams begin when the moon is high, and cease just before first
light." CR>)
		 (<REMOVE ,SHORT-STRAW>
		  <REMOVE ,LONG-STRAW>
		  <MOVE ,OMI ,TRAPDOOR>
		  <MOVE ,SEBASTIO ,TRAPDOOR>
		  <FSET ,TRAPDOOR ,OPENBIT>
		  <MOVE ,LADDER ,PIT>
		  <TELL CR
"Finally, it is high noon.  Everyone is nervous, tired and scared from
listening to the screams.|
|
There are footsteps above.  The trapdoor opens and the ladder is lowered
again.  The priest stands there
flanked by samurai.|
|
\"Pilot.  You are to come up.  You are to come up alone,\" he says." CR>)
		 (DELAY
		  <COND (<IN? ,BLACKTHORNE ,PIT>
			 <COND (<G? ,DELAY-CNT 2>
				<MOVE ,OMI ,VILLAGE-SQUARE>
				<MOVE ,SEBASTIO ,VILLAGE-SQUARE>
				<TELL CR
"A samurai points at you and beckons you up.  Another samurai shoves a
long barbed staff into the cellar and hooks you out." CR CR>
				<GOTO ,VILLAGE-SQUARE>
				<RTRUE>)
			       (ELSE
				<TELL CR
"\"I don't know what they want,\" Father Sebastio says gravely.  \"But
you must come up at once.\"" CR>
				<RTRUE>)>)>)
		 (<SETG ANSWER-HAI? <>>
		  <FSET ,CROOCQ ,SCOREBIT>
		  <SETG QCONTEXT ,OMI>
		  <TELL CR
"The priest says, \"Omi-san says that you will be given a bath.  And
food and drink.  If you behave, you will not be put back into the pit.  Your
men will stay below.  If you do not behave, another of your men
will be taken up.  There is plenty of firewood.\"  He pauses while Omi
speaks to him at length.  \"Omi-san says you must obey.  Do what you are
told.  Eat dung if need be.  The Japanese for 'yes' is '"I"hai"".'  If you
agree, say it directly to him.\"" CR>)
		 (DELAY
		  <COND (<NOT ,ANSWER-HAI?>
			 <COND (<EQUAL? <CROOCQ-IN-CAULDRON> T>
				<COND (<EQUAL? ,DELAY-CNT 1 2>
				       <OMI-SAYS-LIE-DOWN>)>)>
			 <RFATAL>)
			(<NOT <B-LYING?>>
			 <COND (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"Omi watches you with great curiousity." CR>
				<RTRUE>)
			       (<EQUAL? <CROOCQ-IN-CAULDRON> T>
				<COND (<EQUAL? ,DELAY-CNT 2 3>
				       <OMI-SAYS-LIE-DOWN>
				       <RTRUE>)
				      (ELSE
				       <TELL CR
"\"Omi-san says, to make an agreement and then not keep it is
stupid.\"  Omi then removes your head." CR>
				       <JIGS-UP>
				       <RFATAL>)>)>)>)
		 (<SETG QCONTEXT ,OMI>
		  <TELL CR
"\"Omi-san says that ">
		  <COND (,PISS-FLAG
			 <TELL
"he did not insult you personally, neither was there
any cause for you to insult him.  B">)
			(ELSE <TELL "b">)>
		  <TELL "ecause you are a barbarian and know no
better yet, you will not be killed.  But you will be taught manners.\"  You
see Omi hitch up his kimono.  He pisses on your back.">
		  <COND (,PISS-FLAG
			 <TELL "\"Omi-san says, it
is very bad manners to say you will piss on anyone.  It is bad manners and
very stupid to say you will piss on anyone when you are unarmed.  It is
very bad manners and even more stupid to say you will piss on anyone
when you are unarmed, powerless, and not prepared to allow your friends
or family or whomever to perish first.\"">)>
		  <REPLACE-SYNONYM ,BLACKTHORNE ,W?PILOT ,W?ANJIN>
		  <REPLACE-SYNONYM ,BLACKTHORNE ,W?PILOT-MAJOR ,W?ANJIN-SAN>
		  <TELL CR CR>
		  <COND (<IN? ,CROOCQ ,CAULDRON>
			 <MOVE ,CROOCQ ,HERE>
			 <TELL
"You watch the samurai remove the unconscious boy from the cauldron.  ">)>
<TELL "By the Lord God,
you swear, I will remember this day and somehow, somewhere, Omi will pay.|
|
Omi adjusts his kimono and continues to speak in a casual way.  The priest
translates, \"Omi-san says that because no one can say the barbarous sounds
of your name, you are to be called Anjin -- Pilot.  He asks me to
impress upon you that this is not intended as an insult.  If you continue
to behave, you will be called Anjin-san -- Mr. Pilot -- when you merit
it.\"" CR>)
		 (<SETG QCONTEXT ,OMI>
		  <SETG BATH-FLAG T>
		  <TELL CR
"The priest translates.  \"Omi-san suggests that you take a bath.\"  He
smirks contemptuously.  \"A
barbarous custom.  Once when you're born and once when you're laid out
is good enough for us, but here they bathe constantly.  Mura says there is a
bath house over there.\"  He points to the north." CR>
		  <DEQUEUE I-TAKE-CROOCQ>)>>

<GLOBAL CROOCQ-CNT 0>

<ROUTINE CROOCQ-IN-CAULDRON ()
	 <SETG CROOCQ-CNT <+ ,CROOCQ-CNT 1>>
	 <COND (<EQUAL? ,CROOCQ-CNT 1>
		<MOVE ,CROOCQ ,CAULDRON>
		<TELL CR
"Omi gives a quiet order.  Instantly two samurai go down into the pit
and bring out Croocq, the boy.  They drag him over to the cauldron,
truss him while others bring firewood and water.  They put the petrified
boy into the brimming cauldron and ignite the wood." CR>)
	       (<EQUAL? ,CROOCQ-CNT 2>
		<TELL CR
"The fire is beginning to warm the water, and a nauseating groan breaks
from Croocq's mouth." CR>)
	       (<EQUAL? ,CROOCQ-CNT 3>
		<TELL CR
"Flames from the wooden fire set in the bricks below the grate lick
the metal of the cauldron.  More wood is put on." CR>)
	       (<EQUAL? ,CROOCQ-CNT 4>
		<TELL CR
"Croocq screams a thin, wailing scream, and then faints.  A man with a
pole pokes him until he revives." CR>)
	       (<EQUAL? ,CROOCQ-CNT 5>
		<TELL CR
"The boy begins begging, shouting, \"Pilot, don't let them boil me
alive, Pilot!\"" CR>)
	       (ELSE
		<TELL CR
"\"Omi-san says he will train someone else,\" a nauseated-looking
Sebastio tells you.  You have only a moment to ruminate on that before
he removes your head." CR>
		<JIGS-UP>
		<RFATAL>)>
	 <RTRUE>>

<ROUTINE OMI-SAYS-LIE-DOWN ()
	 <THIS-IS-IT ,ORDERS>
	 <TELL CR
"\"Omi-san says, ">
	 <COND (,ANSWER-HAI?
		<TELL "lie down immediately!\"" CR>)
	       (ELSE
		<TELL "you agree to behave?\"" CR>)>>

<GLOBAL ANSWER-HAI? <>>
<GLOBAL BATH-FLAG <>>

<ROUTINE CURSE-OMI ()
	 <COND (<NOT ,PISS-FLAG>
		<SETG PISS-FLAG T>
		<TELL
"You lose your composure.  \"Tell him to go to hell.  Tell him I piss on
him and his whole country.  Tell him exactly what I said!  Exactly, by
God!\" you yell at the priest.  Omi listens, then the knuckles on his
sword hand whiten.  You can see he is trying not to give way to his
emotions." CR>)
	       (ELSE
		<TELL
"You continue to scream abuse at Omi." CR>)>>

<ROOM BATH-HOUSE
      (LOC ROOMS)
      (DESC "Bath House")
      (SYNONYM HOUSE)
      (ADJECTIVE BATH)
      (SOUTH TO VILLAGE-SQUARE)
      (FLAGS ONBIT)
      (ACTION BATH-HOUSE-F)>

<ROUTINE BATH-HOUSE-F ("OPT" (RARG <>))
	 <COND (<RARG? LOOK>
		<TELL
"The bath house is dominated by a huge wooden tub, steaming with
scalding water.  You are reminded of the torture you have just
seen, and shiver with fear." CR>)
	       (<RARG? ENTER>
		<COND (<NOT <IN? ,MURA ,BATH-HOUSE>>
		       ;<DRESS-BLACKTHORNE T>
		       <MOVE ,CROWD ,BATH-HOUSE>
		       <MOVE ,ONNA ,BATH-HOUSE>
		       <MOVE ,MURA ,BATH-HOUSE>
		       <QUEUE I-BATH -1>
		       <TELL
"You enter the bath house, followed by Mura, who keeps a close eye on
you." CR CR>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<AND <OR <P? WALK P?SOUTH>
				<HOSTILE-VERB?>>
			    <NOT <IN? ,BLACKTHORNE ,BATHTUB>>>
		       <TELL
"Mura moves to stop you, and you are thinking, \"How can this little man
stop me?\",
when, like a flash he seems to pull you toward him and over his shoulder
in one fluid movement and you are sprawled gasping on the floor, out of
breath.  \"So sorry, Captain-san,\" he says, in very bad Portuguese." CR>)
		      (<AND <IN? ,PLAYER ,HERE>
			    <TAKE-A-BATH?>>
		       <PERFORM ,V?BOARD ,BATHTUB>
		       <RTRUE>)
		      (<AND <P? BATHE *> ,PRSO>
		       <COND (<FSET? ,PRSO ,PERSON>
			      <COND (<FSET? ,PRSO ,PLURAL>
				     <TELL
G"There wouldn't be room for so many!" CR>)
				    (ELSE
				     <TELL
CTHE ,PRSO G" smiles at your invitation, but shakes " HIS/HER ,PRSO
" head." CR>)>)
			     (ELSE
			      <TELL
CTHE ,PRSO G" would probably be worse for the experience." CR>)>)
		      (<VERB? STRIP>
		       <SETG DELAY-CNT 0>
		       <COND (<OR <FSET? ,BOOTS ,WEARBIT>
				  <FSET? ,CLOTHES ,WEARBIT>>
			      <COND (<FSET? ,BOOTS ,WEARBIT>
				     <PERFORM ,V?TAKE-OFF ,BOOTS>
				     <COND (<FSET? ,CLOTHES ,WEARBIT>
					    <CRLF>)>)>
			      <COND (<FSET? ,CLOTHES ,WEARBIT>
				     <PERFORM ,V?TAKE-OFF ,CLOTHES>)>
			      <RTRUE>)
			     (ELSE
			      <TELL "You're naked." CR>)>)
		      (<AND <P? TAKE-OFF BOOTS>
			    <FSET? ,BOOTS ,WEARBIT>>
		       <SETG DELAY-CNT 0>
		       <MOVE ,BOOTS ,WINNER>
		       <FCLEAR ,BOOTS ,WEARBIT>
		       <TELL
"You remove your boots.  The old women watching cackle and nudge each
other in the ribs." CR>)
		      (<P? TAKE-OFF CLOTHES>
		       <SETG DELAY-CNT 0>
		       <COND (<FSET? ,BOOTS ,WEARBIT>
			      <TELL
,YOU-HAVE-TO G"take off ""your boots first.  Your pants won't go over the
boots." CR>)
			     (ELSE
			      <MOVE ,CLOTHES ,WINNER>
			      <FCLEAR ,CLOTHES ,WEARBIT>
			      <TELL
"You slowly remove your clothes, embarrassed by the audience.  They don't
even have the courtesy of looking the other way.  The old women laugh
and joke with each other.  Finally, you are naked, covering yourself as
best you can.  One old crone claps her hands, and Mura says to you, with
enormous gravity, \"Captain-san, Mother-san thank you, best she's ever
seen, now die happy!\"" CR>)>)
		      (<P? BATHE (BOOTS CLOTHES)>
		       <TELL
"You should leave that to your hosts." CR>)>)
	       (<AND <RARG? END>
		     <NOT <FSET? ,BATHTUB ,SCOREBIT>>>
		<FSET ,PIT ,INVISIBLE>
		<NEXT-SCENE>)>>

<ROUTINE I-BATH ()
	 <ZLINES ,BATH-CNT
		 (DELAY
		  <COND (<OR <FSET? ,BOOTS ,WEARBIT>
			     <FSET? ,CLOTHES ,WEARBIT>>
			 <COND (<G? ,DELAY-CNT 5>
				<SETG DELAY-CNT 0>
				<FCLEAR ,CLOTHES ,WEARBIT>
				<FCLEAR ,BOOTS ,WEARBIT>
				<MOVE ,CLOTHES ,MURA>
				<MOVE ,BOOTS ,MURA>
				<TELL CR
"Mura signals to some of the onlookers, and you are surrounded, overpowered,
and stripped before you can even react.  \"So sorry, Anjin,\" says Mura." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"Mura pantomimes removing your clothes, saying \""I"Dozo, Anjin, gomen nasai.""\"" CR>
				<RTRUE>)>)
			(<OR <HELD? ,CLOTHES>
			     <HELD? ,BOOTS>>
			 <TELL CR
"Mura points to your ">
			 <COND (<HELD? ,CLOTHES> <TELL "clothes." CR>)
			       (ELSE <TELL "boots." CR>)>
			 <RTRUE>)
			(<NOT <IN? ,BLACKTHORNE ,BATHTUB>>
			 <COND (<G? ,DELAY-CNT 3>
				<TELL CR
"Mura looks extremely annoyed.  \"Bath, please.  Stinku.  Bad.  Like all
Portuguese.\"  He chops you in the forearm, then calmly touches a nerve in
your neck.  There is blinding pain.  \"Please excuse me, Anjin,\" he says,
bowing very low.  \"Bath very good.\"  Then they lower you into the scalding
water." CR>
				<NEXT-SCENE>
				<RTRUE>)
			       (ELSE
				<TELL CR
"Mura points to the bathtub.  \"Please go there,\" he says in halting
Portuguese." CR>
				<RTRUE>)>)>)
		 (<DEQUEUE I-BATH>
		  <RFALSE>)>>

<OBJECT CROWD
	(SCENE S-PIT)
	(LOC BATH-HOUSE)
	(DESC "crowd of villagers")
	(OWNER CROWD)
	(SYNONYM VILLAGERS CROWD WOMEN MEN CRONE)
	(ADJECTIVE OLD GAPING STARING)
	(FLAGS PERSON JAPANESEBIT PLURAL OPENBIT CONTBIT SEARCHBIT)
	(DESCFCN CROWD-DESC)
	(ACTION CROWD-F)>

<ROUTINE CROWD-F ("OPT" (RARG <>))
	 <COND (<RARG? WINNER>
		<TELL "They just giggle." CR>
		<END-QUOTE>)>>

<ROUTINE CROWD-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"A crowd of villagers, old women and men, are sitting and standing
around the tub.  They seem intensely interested in the proceedings.">)>>

<OBJECT BATHTUB
	(LOC BATH-HOUSE)
	(DESC "bath tub")
	(SYNONYM TUB BATH POOL WATER)
	(ADJECTIVE BATH WOODEN HOT)
	(FLAGS NDESCBIT CANT-HOLD VEHBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(CAPACITY 300)
	(ACTION BATHTUB-F)>

<ROUTINE BATHTUB-F ("OPT" (RARG <>) "AUX" RUIN)
	 <COND (<RARG? BEG>
		<COND (<VERB? WALK>
		       <YOULL-HAVE-TO "get out of the tub">)
		      (<AND <VERB? WEAR>
			    <NOT <IN? ,PRSO ,BATHTUB>>>
		       <TELL
G"You'd get it wet!" CR>)
		      (<VERB? LIE-DOWN KNEEL>
		       <TELL G"You would drown." CR>)
		      (<OR <VERB? LEAP DIVE>
			   <TAKE-A-BATH?>>
		       <TELL
"You splash some of the scalding water half-heartedly over yourself.  The
water is soapy and scented, and it washes away the filth.  Three times
you make them scour your back with the roughest stone and with pumice.  You
begin to feel cleaner, but your back still burns with shame.|
|
Before long, even your hatred of Omi becomes a banked fire as the heat of
the bath burns into you, relaxing every muscle and dissolving your
fatigue." CR>
		       <SCORE-OBJECT ,BATHTUB>)
		      (<P? EXIT GLOBAL-HERE>
		       <PERFORM ,V?DISEMBARK>
		       <RTRUE>)
		      (<OUTSIDE-TUB? ,BATHTUB>
		       <TELL
CTHE ,PRSO IS/ARE ,PRSO G" outside the tub and out of reach." CR>)>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <COND (<NOUN-USED? ,PRSO ,W?WATER>
			      <TELL
"It's very hot, and very clean." CR>)
			     (ELSE
			      <TELL
G"The tub is wooden, large enough for several people, and deep enough
that they could sit in it with only their heads above water." CR>)>)
		      (<P? (TAKE MOVE) BATHTUB>
		       <COND (<AND <EQUAL? ,P-PRSA-WORD ,W?TAKE>
				   <NOUN-USED? ,PRSO ,W?BATH>>
			      <PERFORM ,V?BATHE ,ME>
			      <RTRUE>)
			     (ELSE
			      <TELL
G"It's much too heavy!" CR>)>)
		      (<VERB? POUR>
		       <TELL G"And waste all that nice hot water?" CR>)
		      (<VERB? CLIMB-FOO BOARD ENTER>
		       <SET RUIN <RUINABLE? ,WINNER>>
		       <COND (.RUIN
			      <MURA-STOPS-YOU .RUIN>
			      <COND (<FSET? .RUIN ,WEARBIT>
				     <TELL
"He pantomimes removing them, and the old women
giggle and make loud remarks to him." CR>)
				    (ELSE <CRLF>)>)
			     (ELSE
			      <MOVE ,WINNER ,BATHTUB>
			      <TELL
G"You climb gingerly up and over the side of the tub, and ease yourself
in.  The water is scalding!" CR>)>)
		      (<AND <P? (PUT THROW) * BATHTUB>
			    <HELD? ,PRSO>
			    <FSET? ,PRSO ,WEARABLE>>
		       <MURA-STOPS-YOU ,PRSO>
		       <CRLF>)
		      (<VERB? DRINK TASTE>
		       <TELL
G"You try to drink the scalding bathwater, but it's far too hot." CR>)>)>>

<ROUTINE TAKE-A-BATH? ()
	 <OR <P? BATHE (<> ME)>
	     <AND <P? TAKE (BATHTUB YOKOSE-BATHTUB)>
		  <NOUN-USED? ,PRSO ,W?BATH>>>>

<ROUTINE RUINABLE? (WHO "AUX" WEAR)
	 <COND (<AND <IN? ,BOOTS .WHO>
		     <FSET? ,BOOTS ,WEARBIT>>
		<RETURN ,BOOTS>)
	       (<AND <IN? ,CLOTHES .WHO>
		     <FSET? ,CLOTHES ,WEARBIT>>
		<RETURN ,CLOTHES>)
	       (ELSE
		<SET WEAR <FIRST? .WHO>>
		<REPEAT ()
			<COND (<NOT .WEAR> <RFALSE>)
			      (<NOT <EQUAL? .WEAR ,LONG-STRAW ,SHORT-STRAW>>
			       <RETURN .WEAR>)
			      (ELSE
			       <SET WEAR <NEXT? .WEAR>>)>>)>>

<ROUTINE MURA-STOPS-YOU (OBJ)
	 <TELL 'MURA>
	 <THIS-IS-IT ,MURA>
	 <COND (<NOT <FSET? .OBJ ,WEARBIT>>
		<TELL
" offers to take ">)
	       (ELSE
		<TELL
", whose grip is surprisingly strong, stops you before you ruin ">)>
	 <TELL D .OBJ ".">>

<ROUTINE PIT-AFTER-F ()
	 <TELL
"Yabu and Omi are sitting sipping "I"cha"" -- tea -- with all the ceremony Omi's
mother can command.  \"Where did you learn so much about the barbarian mind?\" he
asks Omi.|
|
\"When I was fourteen I had a teacher who had been a Christian priest.  He said
that Christians were vulnerable because they were taught that all people should
'love' one another, and that life was sacred.  These new barbarians are just a
different sect.  I thought we could control the leader by taking the life or
threatening to take the life of one of his men.\"  Omi avoids mentioning the
torture death, the befouled death, reining in his disgust.|
|
\"Is the barbarian broken for good?\" asks Yabu.  \"Is it temporary or
permanent?\"|
|
\"Temporary,\" Omi answers hesitantly.  \"Only temporary, Lord.\"" CR>>

<END-SEGMENT ;"PIT">



"S-RODRIGUES"

;"The next day, Lord Toda Hiro-matsu, Lord Toranaga's favorite general, arrives
by galley from Osaka.  How, Yabu wonders, does he know of the
ship?  Spies!  But who?|
|
Hiro-matsu seizes your ship and its cargo for his liege Lord
Toranaga, and then
stuns Yabu by saying, \"I'm taking the pirate leader to Osaka.  Lord
Toranaga wants to see him!\""

<BEGIN-SEGMENT RODRIGUES>

<OBJECT SLAVER
	(SCENE S-RODRIGUES)
	(OWNER TORANAGA)
	(DESC "galley")
	(SYNONYM GALLEY SLAVER VESSEL SHIP)
	(ADJECTIVE SLAVE)
	(FLAGS VEHBIT)
	(DESCFCN SLAVER-DESC)
	(GENERIC GENERIC-GALLEY-F)
	(ACTION SLAVER-F)>

<ROUTINE SLAVER-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<TELL
"A sixty-oared galley is anchored off of one of the jetties.">)>>

<ROUTINE SLAVER-F ("OPT" (RARG <>))
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a sixty-oared galley, thirty oars a side, neat and trim, the oars
stacked with care, ready for instant departure." CR>)
	       (<VERB? BOARD WALK-TO>
		<COND (<IN? ,RODRIGUES ,HERE>
		       <TELL
"\"No need, Ingeles, the galley isn't ready to leave.  There's time.\"  You
are startled.  Minutes ago they were herding you aboard.  What does this
man want from you?" CR>)
		      (ELSE
		       <TELL
"You move to board the galley, but you can't give yourself up to
slavery.  What of the promise they made, that if you behaved they would
treat you well?  Are they betraying it now?" CR>)>)>>

<OBJECT MURA-ROPE
	(SCENE S-RODRIGUES)
	(OWNER MURA)
	(DESC "rope")
	(SYNONYM ROPE)>

<GLOBAL RODRIGUES-QUESTION 0>

<ROUTINE I-MEET-RODRIGUES ()
	 <ZLINES ,MEET-CNT
		 (<FCLEAR ,BRIDGE-OF-ERASMUS ,TOUCHBIT>
		  <FCLEAR ,ON-DECK ,TOUCHBIT>
		  <FCLEAR ,PASSAGEWAY ,TOUCHBIT>
		  <FCLEAR ,PILOTS-CABIN ,TOUCHBIT>
		  <TELL CR
"You can see that even Omi and Yabu are deferring to the old man.  He
has evidently come from the slave galley.|
|
You shiver involuntarily.  The last time you saw a slave galley was
two years ago when the fleet was outward bound off the Gold Coast.  You've
always had a mortal fear of being taken alive and made a galley
slave -- not an unusual fate for a captured seaman." CR>)
		 (<SETG QCONTEXT ,MURA>
		  <SETG OPPONENT ,MURA>
		  <TELL CR
"Omi kneels before the old man, and you do the same, bowing exactly as
low as Omi.  Now there is a discussion among Omi, the old man and
Yabu.  Yabu speaks to Mura.|
|
Mura points at the galley.  \"Anjin-san.  Please go there.\"" CR>)
		 (<SETG QCONTEXT ,OMI>
		  <MOVE ,MURA-ROPE ,MURA>
		  <THIS-IS-IT ,ARCHERS>
		  <TELL CR
"\""I"Isogi!""\" Omi commands, waving you toward the galley.|
|
When you still don't move, there is an immediate order from Omi and
four samurai fall on you and pinion your arms.  Mura produces a rope and
begins to bind your hands." CR>)
		 (<MOVE ,RODRIGUES ,ANJIRO-WATERFRONT>
		  <SETG QCONTEXT ,RODRIGUES>
		  <SETG RODRIGUES-QUESTION 1>
		  <TELL CR
"\"Madonna!  Leave him alone!  Hey, let that bastard alone!  "I"Kinjiru,
neh?""  Is he the pilot?  The Anjin?\"|
|
You can scarcely believe your ears.  The boisterous abuse in Portuguese
comes from the deck of the galley.  Then you see a man start down the
gangway, a Portuguese seaman!|
|
\"Are you the pilot?  The pilot of the Dutchman?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,RODRIGUES-QUESTION 1>
			 <COND (<G? ,DELAY-CNT 3>
				<DIE-IN-STORM>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"Well, are you the pilot or no?  I'm trying to help you, you fool!\"" CR>
				<RTRUE>)>)>)
		 (<SETG RODRIGUES-QUESTION 2>
		  <SETG QCONTEXT ,RODRIGUES>
		  <SETUP-ANSWER "i trained at">
		  <TELL CR
"\"Now tell me where you trained as a pilot?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,RODRIGUES-QUESTION 2>
			 <COND (<G? ,DELAY-CNT 3>
				<DIE-IN-STORM>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"All you Ingeles pilots come out of the same nest of pirates!  If you're
really one, you'll know, so tell!  Where did you train?\"" CR>
				<RTRUE>)>)>)
		 (<SETG RODRIGUES-QUESTION 3>
		  <SETG QCONTEXT ,RODRIGUES>
		  <SETUP-ANSWER "the latitude is">
		  <TELL CR
"\"Maybe you are a pilot!  Now, what's the latitude of
The Lizard?\"" CR>)
		 (DELAY
		  <COND (<EQUAL? ,RODRIGUES-QUESTION 3>
			 <COND (<G? ,DELAY-CNT 3>
				<DIE-IN-STORM>
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"Well, are you a pilot or no?  I'm trying to help you, you
fool!  What's the latitude of The Lizard?\"" CR>
				<RTRUE>)>)>)
		 (<TELL CR
"\"All right, Ingeles!\"  " THE ,RODRIGUES " looks out into the harbor.  \"She's
got good lines, your ship.  Madonna, she'd be fast, very fast.  Very rough
to deal with.\"" CR>)
		 (DELAY
		  <COND (<FSET? ,LG-ERASMUS ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 3>
				<CRLF>
				<LETS-GO-ABOARD <>>
				<FCLEAR ,LG-ERASMUS ,SCOREBIT>
				<RTRUE>)
			       (ELSE <RFALSE>)>)>)
		 (<TELL CR
"Rodrigues yells to the surprised samurai, \"You don't have to worry
about him, Captain-san, I'm responsible.  Me, Rodrigu-san, "I"ichi ban"
" Anjin-san, by the Virgin!  "I"Wakarimasu ka?""\"" CR>)
		 (DELAY
		  <COND (<NOT <IN? ,BLACKTHORNE ,SMALL-BOAT>>
			 <COND (<G? ,DELAY-CNT 3>
				<DIE-IN-STORM>)
			       (ELSE
				<TELL CR
"\"Hurry, hurry!  Get in the boat!  Hurry up!\"  " CTHE ,RODRIGUES " continues his
dominating abuse of the astonished samurai." CR>)>
			 <RTRUE>)>)
		 (<MOVE ,BOAT-OAR ,RODRIGUES>
		  <SETG OPPONENT ,ARCHERS>
		  <TELL CR
CTHE ,RODRIGUES " grabs the oars and shoves off with great skill.  The captain
samurai calls out, unmistakably beckoning you to come back.  " CTHE ,RODRIGUES "
points to the "I"Erasmus.""  \"Just go there,\" he shouts.  \"Tell me if
the archers put arrows in their bows, Ingeles!\"" CR CR>
		  <GOTO ,ANJIRO-HARBOR>)
		 (<FSET ,ARCHERS ,RMUNGBIT>
		  <TELL CR
CTHE ,RODRIGUES " rows toward the "I"Erasmus"", pushing against the oars
in Japanese fashion while standing amidships." CR>) 
		 (<TELL CR
CTHE ,RODRIGUES " continues to row toward the "I"Erasmus""." CR>)
		 (<COND (<FSET? ,ARCHERS ,SCOREBIT>
			 <CRLF>
			 <JIGS-UP
"One of the archers fires an arrow with incredible accuracy.  It takes
Rodrigues in the back, and he falls.  The second arrow takes you.">
			 <RFATAL>)
			(ELSE
			 <TELL CR
"You are at the "I"Erasmus"".  " CTHE ,RODRIGUES " ships the oars under the
watchful eyes of the samurai on board." CR CR>
			 <GOTO ,AT-ERASMUS>)>)
		 (<MOVE ,BOAT-OAR ,SMALL-BOAT>
		  <MOVE ,RODRIGUES ,ON-DECK>
		  <TELL CR
CTHE ,RODRIGUES " vaults onto the deck.  \""I"Konnichi wa"" to all sod-eating
samas!\" he bellows, bowing like a courtier.">
		  <COND (<HERE? ,ON-DECK>
			 <TELL "">
			 <SEALED-PASSAGE>)
			(ELSE
			 <CRLF>)>)
		 (DELAY
		  <COND (<NOT <HERE? ,ON-DECK>>
			 <COND (<G? ,DELAY-CNT 3>
				<JIGS-UP
"The watching Japanese don't know what's gone wrong, but assume you're
trying to escape.  A flight of arrows ends your life.">
				<RFATAL>)
			       (<IN? ,PLAYER ,SMALL-BOAT>
				<TELL CR
"\"Come on, Ingeles!  Hurry!\"  " CTHE ,RODRIGUES " continues his
half-obsequious, half-insulting banter with the suspicious
samurai.  \"I can't keep this up, we can't give them time to think!\"" CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"The last you hear from " CTHE ,RODRIGUES " is a volley of blistering
curses." CR>
				<RTRUE>)>)>)
		 (<MOVE ,RODRIGUES ,PASSAGEWAY>
		  <COND (<HERE? ,ON-DECK ,PASSAGEWAY>
			 <FSET ,PASSAGE-DOOR ,OPENBIT>
			 <NEW-SDESC ,HIRO-MATSU "Hiro-matsu">
			 <FCLEAR ,HIRO-MATSU ,AN>
			 <TELL CR
"\""I"Kinjiru,"" eh?\" Rodrigues says, unimpressed.  \"I'm from Toda Hiro-matsu-sama,
who's a bigger king than your bugger and Toady-sama's from Toranaga-sama,
who's the biggest bugger-sama in this whole world.  "I"Neh?""\"  He rips
the seal off the door, and drops a hand to one of his pistols.|
|
\"Toranaga-sama!\" he yells.  \""I"Wakarimasu ka?""\"  The samurai hesitate,
swords ready.  " CTHE ,RODRIGUES " crashes his foot against the door, the latch
snaps, and the door bursts open.  \""I"WAKARIMASU KA?""\"|
|
\"Wakarimasu, Anjin-san.\" The samurai
quickly put their swords away, and " THE ,RODRIGUES " says hoarsely, \"That's
better,\" and leads the way aft." CR>)>)
		 (DELAY
		  <COND (<NOT <HERE? ,PASSAGEWAY>>
			 <COND (<G? ,DELAY-CNT 3>
				<DIE-IN-STORM>
				<RFATAL>)
			       (<HERE? ,ON-DECK ,CAPTAINS-CABIN ,MATES-CABIN>
				<TELL CR
"Rodrigues yells back to you, \"If you value your life, Ingeles, follow
me!\"" CR>
				<RTRUE>)
			       (ELSE
				<HEAR-RODRIGUES>
				<RTRUE>)>)>)
		 (<MOVE ,RODRIGUES ,PILOTS-CABIN>
		  <FSET ,PILOTS-CABIN-DOOR ,OPENBIT>
		  <COND (<HERE? ,PILOTS-CABIN>
			 <TELL CR
"\"This must be your cabin, eh?\" says Rodrigues and follows you inside." CR>)
			(<HERE? ,PASSAGEWAY>
			 <TELL CR
"\"Which is your cabin?\" asks " THE ,RODRIGUES ", and when you point it out
he enters.  The door was unlocked." CR>)
			(<HERE? ,ON-DECK ,MATES-CABIN ,CAPTAINS-CABIN
				,BELOW-DECKS>
			 <DONT-BE-STUPID>)>)
		 (DELAY
		  <COND (<NOT <HERE? ,PILOTS-CABIN>>
			 <COND (<G? ,DELAY-CNT 3>
				<DIE-IN-STORM>
				<RFATAL>)
			       (<HERE? ,PASSAGEWAY ,MATES-CABIN
				       ,CAPTAINS-CABIN>
				<DONT-BE-STUPID>
				<RTRUE>)
			       (ELSE
				<HEAR-RODRIGUES>
				<RTRUE>)>)>)
		 (<SETG QCONTEXT ,RODRIGUES>
		  <TELL CR
"\"Where are they?\" " THE ,RODRIGUES " asks.  \"Your rutters.  Where are your
rutters?  No pilot would worry about clothes, you came for the rutters,
didn't you?  Why do you think I came aboard?  I was here two or three
hours ago, and searched for them, but found nothing!  The Portuguese
rutter -- it had to be Portuguese!  Where is it?\"|
|
\"Stolen.  They're stolen!\"  It's all you can say." CR CR>
		  <SETG QCONTEXT <>>
		  <NEXT-SCENE>)>>

<ROUTINE LETS-GO-ABOARD (YOU?)
	 <TELL
"\"Ah, Ingeles, let's go aboard.  I'd like see what she's like.  Come on,
get in the boat.\"" CR>
	 <COND (<NOT .YOU?>
		<TELL CR
"\"Good idea. I'd like to retrieve my clothes,\" you say, trying to not
mention your rutters." CR>)>
	 <MOVE ,RODRIGUES ,SMALL-BOAT>
	 <TELL CR
"He points to a small boat pulled up on the beach, and jumps in." CR>
	 <RTRUE>>

<ROUTINE HEAR-RODRIGUES ()
	 <TELL CR
"You hear Rodrigues calling for you, scorching the air with invective." CR>>

<ROUTINE DIE-IN-STORM ()
	 <CRLF>
	 <JIGS-UP
"\"You're a stubborn bastard, Ingeles!\"  Rodrigues says a few words of
gutter Japanese to the samurai, and you are bound and hustled off to a
cramped cabin below decks on the galley.|
|
You spend an awful night below, and the next day when the storm catches
the galley, you wish you were on deck, helping.  When the sea pours in and
the galley sinks, you wish so even more strongly.">
	 <RFATAL>>

<ROUTINE SEALED-PASSAGE ()
	 <TELL "Rodrigues heads immediately for
the sealed passage.  \""I"Kinjiru, gomen nasai,""\" says one of the samurai." CR>>

<ROUTINE DONT-BE-STUPID ()
	 <TELL CR
"\"Get in here, we haven't much time!  These buggers are going to start
wondering what we're doing!\" says Rodrigues." CR>>

<ROUTINE LEAVE-ANJIRO-AFTER-F ()
	 <TELL
"Omi and the others waited on the jetty until the galley rounded the headland
and vanished.  He then returned to the pit, summoning the priest.|
|
\"Priest, tell the barbarians they are to come up, one by one.  Lord Yabu has
said they may live again in the world of men.  But the smallest breaking of a
rule, and two will be put back into the pit.  They are to behave and obey all
orders.\"" CR>>

<END-SEGMENT ;"RODRIGUES">
