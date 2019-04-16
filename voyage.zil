"VOYAGE for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS SENTENCE-ENDS?>

<BEGIN-SEGMENT VOYAGE>

<CONSTANT J-PILING 60>

<ROUTINE HIRO-MATSU-REFUSES ()
	 <TELL
"\""I"Iye!""\" Hiro-matsu shakes his head, and speaks at length clearly
refusing permission because of the danger." CR>>

<ROUTINE YABU-BOARDS-SKIFF ()
	 <QUEUE I-SKIFF -1>
	 <MOVE ,HIRO-MATSU ,GENERIC-OBJECTS>
	 <MOVE ,YABU ,SKIFF>
	 <MOVE ,SEARCH-PARTY ,SKIFF>
	 <MOVE ,OARS ,SKIFF>
	 <FSET ,OARS ,TAKEBIT>
	 <TELL
"This time the old man points his sword at the skiff and shakes his
head.  He and Yabu begin an animated discussion in Japanese, motioning
the mate over to join them.  Hiro-matsu studies the coast for a
while.  Finally, he beckons a samurai, points to you, and gives some apparent
instructions.  The samurai and six other warriors clamber nimbly into
the skiff, and to your surprise, so does Yabu!|
|
Hiro-matsu points to the skiff, bows politely to you, and then goes
below." CR>
	 <SCORE-OBJECT ,SKIFF>>

<ROUTINE I-SKIFF ()
	 <ZLINES ,SKIFF-CNT
		 (DELAY
		  <COND (<NOT <IN? ,BLACKTHORNE ,SKIFF>>
			 <COND (<G? ,DELAY-CNT 2>
				<MOVE ,BLACKTHORNE ,SKIFF>
				<TELL CR
"Yabu barks orders, and you are pitched headlong into the skiff." CR>)
			       (ELSE			      
				<TELL CR
"Yabu motions for you to get in the skiff." CR>)>)>)
		 (<DEQUEUE I-SKIFF>
		  <RFALSE>)>>

<ROOM IN-THE-SEA
      (LOC ROOMS)
      (DESC "In the Sea")
      (SYNONYM SEA)
      (LDESC
"You are in the raging sea between the galley and the rocky,
wave-tormented shore.")
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL LG-SEA LG-LAND LG-BAY LG-RODRIGUES)
      (GENERIC GENERIC-SEA-F)
      (ACTION IN-THE-SEA-F)>

<ROUTINE IN-THE-SEA-F (RARG)
	 <COND (<RARG? ENTER>
		<COND (<NOT <IN? ,WINNER ,SKIFF>>
		       <QUEUE I-DROWN 5>
		       <TELL
"You execute a perfect dive into the sea." CR CR>)
		      (ELSE
		       <COND (<IN? ,YABU ,SKIFF> <FSET ,YABU ,NDESCBIT>)>
		       <COND (<IN? ,SEARCH-PARTY ,SKIFF>
			      <FSET ,SEARCH-PARTY ,NDESCBIT>)>
		       <RFALSE>)>)
	       (<RARG? LEAVE>
		<COND (<IN? ,YABU ,SKIFF> <FCLEAR ,YABU ,NDESCBIT>)>
		<COND (<IN? ,SEARCH-PARTY ,SKIFF>
		       <FCLEAR ,SEARCH-PARTY ,NDESCBIT>)>
		<RFALSE>)
	       (<RARG? BEG>
		<COND (<AND <P? (HELLO ASK-ABOUT TELL) RODRIGUES>
			    <IN? ,RODRIGUES ,HERE>>
		       <COND (<IN? ,OAR ,RODRIGUES>
			      <TELL
"\"Are you crazy, Ingeles?\"" CR>)
			     (ELSE
			      <TELL "He's drowning!" CR>)>
		       <COND (<VERB? TELL> <END-QUOTE> <RFATAL>)
			     (ELSE <RTRUE>)>)
		      (<VERB? DIVE>
		       <TELL
"You dive beneath the surface, but find nothing of interest." CR>)
		      (<AND <VERB? DROP>
			    <HELD? ,PRSO>>
		       <REMOVE ,PRSO>
		       <TELL "Gone forever, beneath the waves." CR>)
		      (<VERB? SWIM DANCE HIDE-BEHIND HIDE-UNDER>
		       <TELL "You try desperately to stay afloat." CR>)
		      (<P? (THROUGH WALK-TO) LG-LAND>
		       <TELL
"That would be suicide. You would be pulped on the rocks!" CR>)
		      (<AND <OR <P? (WALK-TO BOARD CLIMB-ON CLIMB-FOO)
				    (LG-GALLEY ROOMS)>
				<P? (DROP EXIT) LG-SEA>>
			    <NOT <IN? ,WINNER ,SKIFF>>>
		       <TELL
"The storm has carried you further towards the rocks, and you fight
the current, trying to get back, but it's hopeless.  They'll have to
fend for themselves." CR>)
		      (<AND <P? (HELP TAKE WALK-TO) (LG-RODRIGUES RODRIGUES)>
			    <IN? ,RODRIGUES ,HERE>>
		       <TELL
"Here among the waves it's not as obvious where Rodrigues is, but
you swim toward where you last saw him.  ">
		       <COND (<NOT <FSET? ,OAR ,SCOREBIT>>
			      <FCLEAR ,RODRIGUES ,INVISIBLE>
			      <TELL
"There he is!  He's clinging to a broken oar!  You stroke towards him
and at last, fighting the sea, you reach him.  He's wet but alive.  \"By
the Virgin, Ingeles!\" he chokes.  \"Who's conning the galley!\"" CR>)
			     (ELSE
			      <TELL
"You search for as long as your strength holds, but you find no sign
of him." CR>)>)>)>>

<ROUTINE I-DROWN ()
	 <TELL CR
"At last, your strength gives out.  You are still not fully recovered
from the voyage to Japan.  You can swim but not forever.  You sink beneath
the waves." CR>
	 <JIGS-UP>>

<OBJECT LG-GALLEY
	(LOC IN-THE-SEA)
	(DESC "galley")
	(OWNER TORANAGA)
	(SYNONYM GALLEY BOAT SHIP)
	(FLAGS VEHBIT)
	(DESCFCN LG-GALLEY-DESC)
	(GENERIC GENERIC-GALLEY-F)
	(ACTION LG-GALLEY-F)>

<ROUTINE LG-GALLEY-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (ELSE
		<COND (,GALLEY-IN-BAY?
		       <TELL
"The galley rides heavily ">
		       <COND (<NOT <FSET? ,ANCHOR ,SCOREBIT>>
			      <TELL "at anchor ">)>
		       <TELL "on the relatively gentle swells
of the bay.">)
		      (ELSE
		       <TELL
"Riding the waves like a fat-bellied pig, the overladen galley appears
and disappears in the troughs of the waves.">)>)>>

<ROUTINE LG-GALLEY-F ()
	 <COND (<VERB? ENTER BOARD CLIMB-FOO CLIMB-ON>
		<COND (<HERE? ,WHARF>
		       <DO-WALK ,P?EAST>)
		      (<HERE? ,GALLEY ,MAIN-DECK ,MAIN-DECK-2>
		       <TELL G"You already are." CR>)
		      (ELSE
		       <TELL
"The galley isn't here." CR>)>)
	       (<VERB? TURN>
		<COND (<HERE? ,GALLEY>
		       <PERFORM ,V?TURN ,WHEEL ,PRSI>
		       <RTRUE>)
		      (<HERE? ,MAIN-DECK>
		       <ARENT-WHERE-PRSO-IS>
		       <COND (<IN? ,RODRIGUES ,GALLEY>
			      <FRUSTRATED ,RODRIGUES>)>
		       <CRLF>)
		      (ELSE
		       <TELL "You aren't on the galley." CR>)>)>>

<ROUTINE FRUSTRATED (WHO)
	 <TELL "Frustrated, you yell
the command to " D .WHO ", but realize that he can't hear you above the
storm." CR>>

<ROUTINE DRESS-BLACKTHORNE ("OPT" (EUROPEAN? <>))
	 <COND (.EUROPEAN?
		<MOVE ,CLOTHES ,BLACKTHORNE>
		<FSET ,CLOTHES ,WEARBIT>
		<MOVE ,BOOTS ,BLACKTHORNE>
		<FSET ,BOOTS ,WEARBIT>)
	       (ELSE
		<COND (<AND <G? ,SCENE ,S-JOURNEY>
			    <LOC ,DICTIONARY>>
		       <MOVE ,DICTIONARY ,BLACKTHORNE>)>
		<MOVE ,SOCKS ,BLACKTHORNE>
		<FSET ,SOCKS ,WEARBIT>
		<MOVE ,SANDALS ,BLACKTHORNE>
		<FSET ,SANDALS ,WEARBIT>
		<MOVE ,KIMONO ,BLACKTHORNE>
		<FSET ,KIMONO ,WEARBIT>)>>

<ROOM GALLEY
      (LOC ROOMS)
      (SCENE S-VOYAGE)
      (DESC "Toranaga's Galley")
      (SYNONYM GALLEY)
      (OWNER TORANAGA)
      (SCORE 11)
      (FDESC
"It is near noon and you are standing on the quarterdeck of the galley
under an overcast sky.  During the first night the galley had sped
southward down the east coast of the Izu peninsula.  When it came abreast
of the southmost cape, Cape Ito, Rodrigues had set the course West South
West and had left the safety of the coast for the open sea, heading for
a landfall at Cape Shinto two hundred miles away.|
|
\"What do you think, Ingeles?\" asks Rodrigues.|
\"I think there'll be a storm,\" you reply.|
\"When?\"|
\"Before sunset\" you answer.|
|
The storm comes before sunset and catches you out to sea.  Land is
ten miles away.")
      (AFTER VOYAGE-AFTER-F)
      (FORE TO MAIN-DECK)
      (DOWN TO MAIN-DECK)
      (FLAGS ONBIT OUTSIDE)
      (GLOBAL LG-GALLEY CREWMEN LG-RODRIGUES LG-SEA
       LG-LAND LG-BAY ANCHOR)
      (GENERIC GENERIC-GALLEY-F)
      (ACTION GALLEY-F)>

<ROUTINE GALLEY-F (RARG)
	 <COND (<RARG? SCENE-SETUP>
		<DRESS-BLACKTHORNE T>
		<PUTP ,BLACKTHORNE ,P?HEALTH 4>
		<PUT-ON ,SLIPPERS ,YABU>
		<PUT-ON ,YABU-KIMONO ,YABU>
		<PUT-ON ,YABU-SWORDS ,YABU>
		<MOVE ,SAFETY-LINE ,BLACKTHORNE>
		<FSET ,SAFETY-LINE ,WEARBIT>
		<MOVE ,RODRIGUES ,HERE>
		<NEW-SDESC ,RODRIGUES "Rodrigues">
		<QUEUE I-RODRIGUES -1>)
	       (<RARG? LOOK>
		<TELL
"You are standing on the quarterdeck of Toranaga's galley, with a good
view forward to the oar deck." CR>)
	       (<RARG? LEAVE>
		<FCLEAR ,GALLEY-WHEEL ,ONBIT>)
	       (<RARG? BEG>
		<COND (<VERB? WALK>
		       <COND (<FSET? ,SAFETY-LINE ,WEARBIT>
			      <TELL
,YOU-HAVE-TO G"untie your safety line first"", even though you know that
without it you could easily be carried overboard." CR>)>)
		      (<P? UNTIE ME>
		       <PERFORM ,V?UNTIE ,SAFETY-LINE>
		       <RTRUE>)
		      (<P? ROW <>>
		       <TELL "The oars aren't here.  They're forward on
the main deck." CR>)
		      (<P? TURN INTDIR>
		       <PERFORM ,V?TURN ,GALLEY-WHEEL ,INTDIR>
		       <RTRUE>)
		      (<AND <VERB? TURN-TOWARD TURN-AWAY>
			    <NOT <PRSO? ,GALLEY-WHEEL>>>
		       <PERFORM ,PRSA ,GALLEY-WHEEL ,PRSO>
		       <RTRUE>)
		      (<P? POINT (LG-BAY LG-LAND)>
		       <SETG WINNER ,OARSMEN>
		       <PERFORM ,V?POINT ,PRSO>
		       <SETG WINNER ,PLAYER>
		       <RTRUE>)
		      (<P? BOARD LG-SEA>
		       <COND (<FSET? ,SAFETY-LINE ,WEARBIT>
			      <TELL
,YOU-HAVE-TO G"untie your safety line first""." CR>)
			     (<NOT <FSET? ,LIFE-RING ,WEARBIT>>
			      <TELL
G"You would surely drown." CR>)>)>)>>

<OBJECT GALLEY-WHEEL
	(LOC GALLEY)
	(SCENE S-VOYAGE)
	(OWNER GALLEY)
	(DESC "helm")
	(SYNONYM WHEEL RUDDER HELM TILLER)
	(FLAGS CANT-HOLD)
	(DESCFCN GALLEY-WHEEL-DESC)
	(ACTION GALLEY-WHEEL-F)>

<ROUTINE GALLEY-WHEEL-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<TELL "The helm is here, turned ">
		<COND (<EQUAL? ,SHIP-COURSE ,P?PORT> <TELL "to port">)
		      (<EQUAL? ,SHIP-COURSE ,P?STARBOARD>
		       <TELL "to starboard">)
		      (ELSE <TELL "straight">)>
		<TELL " now.">
		<COND (<OR <FSET? ,SAFETY-LINE ,WEARBIT>
			   <FSET? ,GALLEY-WHEEL ,ONBIT>>
		       <COND (<FSET? ,GALLEY-WHEEL ,ONBIT>
			      <TELL "You have the helm">
			      <COND (<FSET? ,SAFETY-LINE ,WEARBIT>
				     <TELL " and a ">)>)
			     (<FSET? ,SAFETY-LINE ,WEARBIT>
			      <TELL "The ">)>
		       <COND (<FSET? ,SAFETY-LINE ,WEARBIT>
			      <TELL
"life line secures you as the deck pitches and rolls.">)
			     (ELSE
			      <TELL
". There is a life line lashed to the binnacle.">)>)>)>>

<ROUTINE GALLEY-WHEEL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The helm steers the ship.  The galley is steering ">
		<COND (<EQUAL? ,SHIP-COURSE ,P?PORT>
		       <TELL "south toward the open sea." CR>)
		      (ELSE <TELL "toward the bay." CR>)>)
	       (<VERB? TAKE>
		<COND (<FSET? ,GALLEY-WHEEL ,ONBIT>
		       <TELL "You already have it!" CR>)
		      (ELSE
		       <FSET ,GALLEY-WHEEL ,ONBIT>
		       <TELL
"You take the helm." CR>)>)
	       (<VERB? DROP>
		<COND (<NOT <FSET? ,GALLEY-WHEEL ,ONBIT>>
		       <YOU-ARENT-HOLDING>)
		      (ELSE
		       <FCLEAR ,GALLEY-WHEEL ,ONBIT>
		       <TELL
"You release the helm.">
		       <COND (<IN? ,RODRIGUES ,HERE>
			      <TELL
"Rodrigues takes it.">)>
		       <CRLF>)>)
	       (<P? STRAIGHTEN GALLEY-WHEEL>
		<SETG P-DIRECTION ,P?FORE>
		<PERFORM ,V?TURN ,GALLEY-WHEEL ,INTDIR>
		<RTRUE>)
	       (<P? TURN-TOWARD GALLEY-WHEEL>
		<COND (<PRSI? ,LG-BAY ,LG-LAND>
		       <SETG P-DIRECTION ,P?STARBOARD>
		       <PERFORM ,V?TURN ,PRSO ,INTDIR>
		       <RTRUE>)
		      (<PRSI? ,LG-SEA>
		       <SETG P-DIRECTION ,P?PORT>
		       <PERFORM ,V?TURN ,PRSO ,INTDIR>
		       <RTRUE>)>)
	       (<P? TURN-AWAY GALLEY-WHEEL>
		<COND (<PRSI? ,LG-BAY ,LG-LAND>
		       <SETG P-DIRECTION ,P?PORT>
		       <PERFORM ,V?TURN ,PRSO ,INTDIR>
		       <RTRUE>)
		      (<PRSI? ,LG-SEA>
		       <SETG P-DIRECTION ,P?STARBOARD>
		       <PERFORM ,V?TURN ,PRSO ,INTDIR>
		       <RTRUE>)>)
	       (<P? TURN GALLEY-WHEEL>
		<COND (<NOT <FSET? ,ANCHOR ,SCOREBIT>>
		       <TELL
"The galley is anchored safely in the bay.  Turning the wheel is a
waste of time." CR>)
		      (<NOT <FSET? ,GALLEY-WHEEL ,ONBIT>>
		       <YOU-ARENT-HOLDING>)
		      (<PRSI? ,INTDIR> 
		       <COND (<EQUAL? ,P-DIRECTION ,P?PORT ,P?SOUTH>
			      <SETG SHIP-COURSE ,P?PORT>
			      <SETG SHIP-DIRECTION ,P?SOUTH>
			      <TELL
"You turn to wheel to port, steering the galley out to sea, running
with the wind." CR>)
			     (<EQUAL? ,P-DIRECTION ,P?STARBOARD ,P?WEST>
			      <SETG SHIP-COURSE ,P?STARBOARD>
			      <SETG SHIP-DIRECTION ,P?WEST>
			      <TELL
"You turn the wheel to starboard, steering for the bay." CR>)
			     (<EQUAL? ,P-DIRECTION ,P?FORE ,P?IN>
			      <SETG SHIP-COURSE ,P?FORE>
			      <TELL
"You try to hold a steady course." CR>)
			     (ELSE
			      <TELL
"You can't steer the galley in that direction!" CR>)>)
		      (ELSE
		       <TELL G"You must specify a direction!" CR>)>)>>

<OBJECT SAFETY-LINE
	(LOC GALLEY)
	(SCENE S-VOYAGE)
	(DESC "safety line")
	(SYNONYM LINE LIFELINE ROPE)
	(ADJECTIVE SAFETY LIFE)
	(FLAGS OPENABLE WEARABLE)
	(ACTION SAFETY-LINE-F)>

<ROUTINE SAFETY-LINE-F ()
	 <COND (<OR <P? (THROW GIVE) * LG-RODRIGUES>
		    <P? TURN * LG-RODRIGUES>
		    <P? REACH-FOR LG-RODRIGUES>>
		<TELL
"It's much too short." CR>)
	       (<AND <P? TIE * SAFETY-LINE>
		     <NOT <PRSO? ,SAFETY-LINE>>>
		<PERFORM ,PRSA ,SAFETY-LINE ,PRSO>
		<RTRUE>)
	       (<AND <P? TIE SAFETY-LINE>
		     <NOT <PRSI? <> ,ME ,BLACKTHORNE>>>
		<COND (<PRSI? ,RODRIGUES>
		       <TELL
"\"Lifelines, Ingeles?  Have you no "I"cojones""?\"" CR>)
		      (<PRSI? ,SAFETY-LINE>
		       <TELL
"Tying the safety line to itself would be foolish." CR>)
		      (ELSE
		       <TELL
"You can't tie the safety line to that." CR>)>)
	       (<VERB? UNTIE TAKE-OFF DROP>
		<COND (<FSET? ,SAFETY-LINE ,WEARBIT>
		       <MOVE ,SAFETY-LINE ,GALLEY>
		       <FCLEAR ,SAFETY-LINE ,WEARBIT>
		       <TELL
"You untie the line.">
		       <COND (<FSET? ,ANCHOR ,SCOREBIT>
			      <TELL
"You know that without your lifeline you can easily be carried overboard.">
			      <COND (<FSET? ,OARSMEN ,SCOREBIT>
				     <TELL
"But the oars have to be shipped or you are lost.">)>)>
		       <CRLF>)
		      (ELSE
		       <TELL
"You're already untied!" CR>)>)
	       (<VERB? TIE WEAR TAKE>
		<COND (<NOT <FSET? ,SAFETY-LINE ,WEARBIT>>
		       <MOVE ,SAFETY-LINE ,WINNER>
		       <FSET ,SAFETY-LINE ,WEARBIT>
		       <TELL
"You gratefully return to the safety of the line." CR>)
		      (ELSE
		       <TELL
"You're already tied as securely as possible." CR>)>)>>

<ROOM MAIN-DECK
      (SCENE S-VOYAGE)
      (LOC ROOMS)
      (DESC "Main Deck")
      (SYNONYM DECK)
      (ADJECTIVE MAIN)
      (AFT TO GALLEY)
      (UP TO GALLEY)
      (DOWN SORRY "There's nothing of interest below decks.")
      (FLAGS ONBIT OUTSIDE SCOREBIT)
      (GLOBAL LG-GALLEY LG-SEA LG-LAND LG-BAY LG-RODRIGUES)
      (GENERIC GENERIC-DECK-F)
      (ACTION MAIN-DECK-F)>

<ROUTINE MAIN-DECK-F (RARG)
	 <COND (<RARG? LOOK>
		<TELL
G"This is the oar deck of the galley, forward of the quarterdeck.  ">
		<COND (<NOT <FSET? ,ANCHOR ,SCOREBIT>>
		       <TELL
"The rowers are resting after their ordeal, exhausted but proud of
their victory over the sea." CR>)
		      (<NOT <FSET? ,MAIN-DECK ,SCOREBIT>>
		       <TELL
"Banks of twenty rowers are to each side, disciplined, trained samurai.  ">
		       <COND (<NOT <FSET? ,OARSMEN ,SCOREBIT>>
			      <TELL "They row steadily, urged on by the
beat of a drum." CR>)
			     (ELSE
			      <TELL
"They wait patiently for their next order." CR>)>)
		      (ELSE
		       <TELL "The chaos here is incredible.  Half the
oars are flailing in the air, some of the oarsmen have been washed
overboard, and some have slipped their safety lines to try to fight
order into their oars." CR>)>)
	       (<RARG? ENTER>
		<COND (<NOT <FSET? ,ANCHOR ,SCOREBIT>>
		       <TELL
"You make your way forward">)
		      (ELSE
		       <TELL
"You fight your way forward along the heaving, greasy deck,">)>
		<TELL " down the short gangway to the main deck.">
		<CRLF> <CRLF>)
	       (<RARG? BEG>
		<COND (<P? (CLIMB-FOO HOLD-ON) ROOMS>
		       <COND (<NOT ,GOT-GUNWALE?>
			      <PERFORM ,V?TAKE ,GUNWALE>
			      <RTRUE>)
			     (ELSE
			      <TELL
"You have returned to the relative security of the deck." CR>)>)
		      (<AND <FSET? ,GUNWALE ,RMUNGBIT>
			    <NOT ,GOT-GUNWALE?>>
		       <COND (<VERB? WALK WALK-TO>
			      <TELL
"You can't walk while being swept overboard!" CR>)
			     (<AND <NOT <GAME-VERB?>>
				   <NOT <VERB? TAKE BOARD SWIM HOLD HOLD-ON>>>
			      <TELL
"Your preoccupations are unusual for someone who is being swept
overboard in the middle of the ocean." CR>)>)
		      (<P? TAKE-OFF LG-GALLEY>
		       <DO-WALK ,P?DOWN>)
		      (<AND <P? WALK DOWN>
			    <FSET? ,SKIFF ,RMUNGBIT>>
		       <PERFORM ,V?BOARD ,SKIFF>
		       <RTRUE>)
		      (<P? BOARD LG-SEA>
		       <TELL
G"You would surely drown." CR>)
		      (<P? (ROW WALK-TO) <>>
		       <COND (<FSET? ,MAIN-DECK ,SCOREBIT>
			      <PERFORM ,V?HELP ,OARSMEN>
			      <RTRUE>)
			     (ELSE
			      <SETG WINNER ,OARSMEN>
			      <PERFORM ,PRSA ,PRSO ,PRSI>
			      <SETG WINNER ,PLAYER>
			      <RTRUE>)>)>)>>

<OBJECT SKIFF
	(LOC MAIN-DECK)
	(SCENE S-VOYAGE)
	(DESC "skiff")
	(SYNONYM SKIFF BOAT)
	(FLAGS TAKEBIT VEHBIT OPENBIT CONTBIT SEARCHBIT SCOREBIT)
	(COUNT 0)
	(SIZE 200)
	(CAPACITY 200)
	(DESCFCN SKIFF-DESC)
	(ACTION SKIFF-F)>

<ROUTINE SKIFF-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?> <RTRUE>)
	       (<RARG? OBJDESC>
		<COND (<FSET? ,SKIFF ,RMUNGBIT>
		       <TELL "The skiff ">
		       <COND (<HERE? ,PEBBLED-BEACH>
			      <TELL
"has been pulled up onto the rocky beach.">)
			     (ELSE
			      <TELL
"rides lightly beside the galley.">)>)
		      (<HERE? ,PEBBLED-BEACH>
		       <TELL
"The skiff rests on its side on the rocky beach.">)
		      (ELSE
		       <TELL
"A skiff is tied to the deck near the centerline of the galley.">)>
		<RFATAL>)>>

<ROUTINE SKIFF-F ("OPT" (RARG <>) "AUX" TRIES)
	 <COND (<RARG? LOOK>
		<COND (<HERE? ,IN-THE-SEA>
		       <TELL
"The skiff rides lightly in the relatively gentle swells of the bay.">
		       <COND (<AND <IN? ,YABU ,SKIFF>
				   <IN? ,SEARCH-PARTY ,SKIFF>>
			      <TELL
"Yabu sits imperiously in the bow, and the search party mans the oars.">)>
		       <CRLF>
		       <RTRUE>)>)
	       (<RARG? BEG>
		<COND (<HERE? IN-THE-SEA>
		       <COND (<AND <VERB? BOARD WALK-TO CLIMB-FOO>
				   <PRSO? ,GALLEY>>
			      <MOVE ,WINNER ,HERE>
			      <GOTO ,MAIN-DECK>)
			     (<VERB? DISEMBARK>
			      <PERFORM ,V?LEAP ,LG-SEA>
			      <RTRUE>)
			     (<OR <VERB? WALK>
				  <P? WALK-TO (LG-LAND LG-BAY LG-GALLEY)>>
			      <COND (<OR <P? WALK ,P?EAST>
					 <P? WALK-TO ,LG-LAND>>
				     <TELL
"The rowers look to Yabu for confirmation, and he nods impatiently.">)
				    (ELSE
				     <TELL
"Yabu points to the shore instead, indicating the direction for the
rowers to go.">)>
			      <CRLF>
			      <CRLF>
			      <GOTO ,PEBBLED-BEACH>)>)
		      (<HERE? PEBBLED-BEACH>
		       <COND (<OR <VERB? DISEMBARK>
				  <P? WALK P?OUT>>
			      <COND (<NOT ,SEARCHED?>
				     <SETG SEARCHED? T>
				     <MOVE ,BLACKTHORNE ,HERE>
				     <MOVE ,YABU ,HERE>
				     <TELL
"You disembark quickly, intending to lead the search party, but Yabu
usurps that position and will not yield it." CR>)
				    (ELSE
				     <TELL
"The samurai hold you back; it's apparent that Yabu feels you've had
your chance to find Rodrigues, and now it's time to head back to the
galley." CR>)>)
			     (<OR <P? WALK ,P?WEST>
				  <P? WALK-TO (GALLEY LG-GALLEY)>>
			      <TELL
"You are rowed back to the galley, having failed to find Rodrigues." CR>
			      <FAILED-SCENE>)
			     (<VERB? WALK WALK-TO>
			      <PERFORM ,V?DISEMBARK>
			      <RTRUE>)>)>)
	       (<RARG? <>>
		<COND (<VERB? EXAMINE>
		       <TELL
"It's a wooden skiff, pointed at bow and stern.  ">
		       <COND (<IN? ,SEARCH-PARTY ,SKIFF>
			      <TELL "In the skiff are ">
			      <WHAT-CONTENTS>)
			     (ELSE
			      <TELL "It's big enough to
hold quite a few men." CR>)>)
		      (<VERB? TAKE>
		       <TELL
"It's much to heavy for you to carry." CR>)
		      (<VERB? BOARD>
		       <COND (<HERE? ,PEBBLED-BEACH>
			      <MOVE ,YABU ,SKIFF>
			      <MOVE ,SEARCH-PARTY ,SKIFF>
			      <MOVE ,PLAYER ,SKIFF>
			      <TELL
"You board the skiff, and the rest of the shore party follows." CR>)
			     (<FSET? ,SKIFF ,RMUNGBIT>
			      <SET TRIES <GETP ,SKIFF ,P?COUNT>>
			      <PUTP ,SKIFF ,P?COUNT <+ .TRIES 1>>
			      <COND (<ZERO? .TRIES>
				     <TELL
"You go to the gunwale and begin to scale down the side but a harsh
voice stops you.  Hiro-matsu is here, with Yabu beside him.  ">
				     <HIRO-MATSU-REFUSES>)
				    (<EQUAL? .TRIES 1>
				     <YABU-BOARDS-SKIFF>)
				    (ELSE
				     <MOVE ,BLACKTHORNE ,SKIFF>
				     <TELL
"You climb down the side of the galley, joining the others in the
skiff." CR CR>
				     <GOTO ,IN-THE-SEA>)>)
			     (ELSE
			      <TELL
G"It would be a good trick, and somewhat amusing, to get into a boat
while it's still on deck, but not a good idea." CR>)>)
		      (<VERB? LOOK-INSIDE>
		       <COND (<AND <IN? ,YABU ,SKIFF>
				   <IN? ,SEARCH-PARTY ,SKIFF>>
			      <TELL
"In the skiff is the search party of seven samurai, ready at the oars, and
Yabu, who looks very pleased with himself." CR>)>)
		      (<VERB? UNTIE>
		       <COND (<NOT <FSET? ,ANCHOR ,SCOREBIT>>
			      <COND (<NOT <FSET? ,SKIFF ,RMUNGBIT>>
				     <FSET ,SKIFF ,RMUNGBIT>
				     <MOVE ,BOAT-OAR ,SKIFF>
				     <TELL
"You untie the skiff, preparing to launch it." CR>)
				    (ELSE
				     <TELL
"It's already untied." CR>)>)
			     (ELSE
			      <TELL
"In this gale, any object that isn't tied down is a deadly
missile." CR>)>)
		      (<VERB? LAUNCH LOWER>
		       <COND (,GALLEY-IN-BAY?
			      <COND (<FSET? ,ANCHOR ,SCOREBIT>
				     <TELL
"The galley is still being washed to and fro.  It's too dangerous." CR>)
				    (<NOT <FSET? ,SKIFF ,RMUNGBIT>>
				     <FSET ,SKIFF ,RMUNGBIT>
				     <MOVE ,BOAT-OAR ,SKIFF>
				     <TELL "The skiff is ">
				     <COND (<HERE? ,MAIN-DECK ,GALLEY>
					    <TELL
"lowered into the water." CR>)
					   (ELSE
					    <TELL
"pushed out into the surf." CR>)>)
				    (ELSE
				     <TELL "It's already ">
				     <COND (<HERE? ,MAIN-DECK ,GALLEY>
					    <TELL
"riding the waves beside the galley." CR>)
					   (ELSE
					    <TELL
"waiting in the nearby surf." CR>)>)>)
			     (ELSE
			      <TELL
"You can't launch it alone, and in this gale, no one is going to
help you." CR>)>)>)>>

<GLOBAL SEARCHED? <>>

<OBJECT ANCHOR
	(LOC MAIN-DECK)
	(SCENE S-VOYAGE)
	(DESC "anchor")
	(SYNONYM ANCHOR)
	(SIZE 200)
	(FLAGS AN TAKEBIT SCOREBIT)
	(ACTION ANCHOR-F)>

<ROUTINE ANCHOR-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,GUNWALE ,RMUNGBIT>>
		<TELL "It's too far away." CR>)
	       (<VERB? DROP THROW THROW-OFF PUT LOWER PUSH MOVE>
		<COND (<NOT ,GALLEY-IN-BAY?>
		       <TELL
"You can't drop anchor until you are safely in the bay!" CR>)
		      (<FSET? ,ANCHOR ,SCOREBIT>
		       <FSET ,ANCHOR ,NDESCBIT>
		       <QUEUE I-ALL-ON-DECK 1>
		       <TELL
"\"Let go the anchor!\"  No one understands your words but they all know
what you want.  The anchor splashes over the side.  You let the ship fall
off the wind slightly to test the firmness of the seabed.  The ship is
safe." CR>
		       <SCORE-OBJECT ,ANCHOR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)
	       (<VERB? RAISE>
		<COND (<FSET? ,ANCHOR ,SCOREBIT>
		       <TELL G"It already is." CR>)
		      (<FSET? ,ANCHOR ,NDESCBIT>
		       <TELL
"What a dangerous idea!  You would be swept onto the rocks." CR>)>)>>

<ROUTINE I-ALL-ON-DECK ()
	 <MOVE ,HIRO-MATSU ,MAIN-DECK>
	 <MOVE ,YABU ,MAIN-DECK>
	 <TELL CR
"Hiro-matsu and Yabu climb shakily up from below decks, both somewhat
seasick, but once there, both "I"daimyos"" stand erect." CR>>

<OBJECT OARS
	(LOC MAIN-DECK)
	(DESC "oars")
	(SYNONYM OARS OAR)
	(FLAGS NDESCBIT)
	(ACTION OARS-F)>

<ROUTINE OARS-F ()
	 <COND (<AND <VERB? SHIP SORT POINT TAKE ROW WALK-TO>
		     <NOT <IN? ,WINNER ,SKIFF>>>
		<PERFORM ,V?HELP ,OARSMEN>
		<RTRUE>)>>

<OBJECT OARSMEN
	(SCENE S-VOYAGE)
	(LOC MAIN-DECK)
	(DESC "oarsmen")
	(SYNONYM OARSMEN OARSMAN MEN MAN ROWER ROWERS CREW CREWMEN)
	(ADJECTIVE OARS)
	(FLAGS NDESCBIT PERSON JAPANESEBIT PLURAL OPENBIT SEARCHBIT
	  CONTBIT ;SCOREBIT)
	(ACTION OARSMEN-F)>

<ROUTINE OARSMEN-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<P? PUT OARS (GLOBAL-WATER LG-SEA)>
		       <PERFORM ,V?ROW>
		       <RTRUE>)
		      (<AND <FSET? ,MAIN-DECK ,SCOREBIT>
			    <P? (SHIP SORT POINT TAKE ROW WALK-TO)
				(<> OARSMEN OARS LG-BAY LG-LAND)>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?HELP ,OARSMEN>
		       <RTRUE>)
		      (<P? (POINT TAKE ROW WALK-TO)
			   (<> OARS OARSMEN LG-BAY LG-LAND)>
		       <COND (<NOT <FSET? ,ANCHOR ,SCOREBIT>>
			      <TELL
"The galley is anchored.  There's no reason to row." CR>)
			     (ELSE
		       <TELL "The oarsmen don't understand you, but they ">
		       <COND (<FSET? ,OARSMEN ,SCOREBIT>
			      <TELL "get the idea, and begin rowing again." CR>
			      <SCORE-OBJECT ,OARSMEN>)
			     (ELSE
			      <TELL "try to row faster." CR>)>)>)
		      (<P? (DROP THROW THROW-OFF PUT LOWER PUSH MOVE) ANCHOR>
		       <RFALSE>)
		      (ELSE
		       <TELL
"They don't seem to understand what you want." CR>)>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,MAIN-DECK ,SCOREBIT>
		       <TELL
"The oarsmen are in a state of confusion." CR>)
		      (<FSET? ,OARSMEN ,SCOREBIT>
		       <TELL
"The oarsmen are settled again at their benches, but not yet rowing
again." CR>)
		      (ELSE
		       <TELL
"The oarsmen, unlike those you have seen in Europe, aren't slaves.  Each
is a samurai warrior, and what they lack in deep water sailing
ability they make up in strength and stamina." CR>)>)
	       (<VERB? BOW>
		<COND (<NOT <FSET? ,OARSMEN ,SCOREBIT>>
		       <TELL
"The oarsmen acknowledge your gesture of respect." CR>)
		      (ELSE
		       <TELL
"The oarsmen are taken aback by your formality, given the
circumstances." CR>)>)
	       (<P? THROW LIFE-RING>
		<REMOVE ,LIFE-RING>
		<TELL
"You heave the life ring to the rower, who tries to reach it, but the surge
of the sea is too strong and he's swept away." CR>)
	       (<VERB? HELP SORT>
		<COND (<FSET? ,MAIN-DECK ,SCOREBIT>
		       <TELL
"You hurl yourself into the work of resorting the rowers.  All rowing
has stopped except for the two oars most forward, which are keeping the
galley tidily into the wind.  With signs and yelling, you get the oars
shipped, double up the men on the working ones, and generally restore
order." CR>
		       <SCORE-OBJECT ,MAIN-DECK>)
		      (ELSE
		       <TELL
"The oars are already back in some sort of order." CR>)>)>>

<OBJECT GUNWALE
	(LOC MAIN-DECK)
	(DESC "gunwale")
	(SYNONYM GUNWALE GUNWALES RAIL RAILS)
	(FLAGS NDESCBIT TAKEBIT SCOREBIT)
	(ACTION GUNWALE-F)>

<GLOBAL GOT-GUNWALE? <>>

<ROUTINE GUNWALE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The gunwales are nearly awash, as the galley is heavily laden and
low in the water.  In the "I"Erasmus"" you would ride out a storm
like this easily, but this galley isn't built and rigged for weather." CR>)
	       (<VERB? TAKE HOLD HOLD-ON>
		<COND (<FSET? ,GUNWALE ,RMUNGBIT>
		       <FCLEAR ,GUNWALE ,RMUNGBIT>
		       <SETG GOT-GUNWALE? T>
		       <TELL
"You grab desperately for the gunwale, and you catch it, your tendons
stretching but your grip holds!  Then your other hand reaches the rail
and, choking, you pull yourself back." CR>
		       <SCORE-OBJECT ,GUNWALE>)
		      (ELSE
		       <TELL
"You hang onto the gunwales as you go forward." CR>)>)>>

<GLOBAL GALLEY-IN-BAY? <>>

<ROUTINE I-RODRIGUES ()
	 <COND (<AND <HERE? IN-THE-SEA>
		     <NOT <IN? ,RODRIGUES ,IN-THE-SEA>>>
		<RFALSE>)>
	 <ZLINES ,RODRIGUES-CNT
		 (;1
		  <SETG SHIP-COURSE ,P?PORT>
		  <SETG SHIP-DIRECTION ,P?SOUTH>
		  <COND (<NOT <MARGINAL-PIC ,P-CONFUSION <>>>
			 <CRLF>)>
		  <TELL
"\"Watch out forward!\" Rodrigues shouts.  The galley rolls sickeningly,
twenty oars pulling at air instead of sea and there is chaos aboard.  The
first comber has struck and the port gunwale is awash.  The galley
is floundering." CR>)
		 (;2
		  <THIS-IS-IT ,OARSMEN>
		  <FSET ,OARSMEN ,SCOREBIT>
		  <COND (<HERE? ,GALLEY>
			 <TELL CR
"\"Go forward,\" Rodrigues orders.  ">)
			(ELSE
			 <TELL CR
"Rodrigues yells to you.  ">)>
		  <TELL "\"Get 'em to ship the oars, get 'em back
in order, and then
get 'em rowing again before we all drown!  Hurry, hurry, hurry!\"" CR>)
		 (DELAY
		  <COND (<IN? ,BLACKTHORNE ,GALLEY>
			 <COND (<G? ,DELAY-CNT 2>
				<CRLF>
				<JIGS-UP
"\"Filthy heretic pig!  You're no pilot, you're the son of a motherless
sow!\"  Rodrigues smashes you in the head for your cowardice.">
				<RFATAL>)
			       (ELSE
				<TELL CR
"\"Hurry, Ingeles!  Where are your "I"cojones""?\" curses Rodrigues." CR>
				<RTRUE>)>)>)
		 (;3
		  <MOVE ,OAR ,GALLEY>
		  <FSET ,GUNWALE ,RMUNGBIT>
		  <THIS-IS-IT ,GUNWALE>
		  <TELL CR
"Abruptly the galley swerves and you are carried to the down side, tripped
by the flailing bodies of rowers who have lost their own footing.|
|
The gunwale is under water and one man goes overboard!  You feel the rush
of water carrying you over the gunwale as well!" CR>)
		 (;4
		  <COND (,GOT-GUNWALE?
			 <THIS-IS-IT ,OARSMEN>
			 <TELL CR
"A man is at your feet and he drags you from the grip of the sea." CR>)
			(ELSE
			 <CRLF>
			 <TELL
"You are swept into the raging torrent of the sea, and although you ">
			 <COND (<IN? ,LIFE-RING ,PLAYER>
				<TELL "are wearing a life ring">)
			       (ELSE <TELL "can swim">)>
			 <TELL ", there is no hope." CR>
			 <JIGS-UP>)>)
		 (DELAY
		  <COND (<OR <FSET? ,MAIN-DECK ,SCOREBIT>
			     <FSET? ,OARSMEN ,SCOREBIT>>
			 <THIS-IS-IT ,OARSMEN>
			 <COND (<G? ,DELAY-CNT 6>
				<CRLF>
				<JIGS-UP
"The galley is smashed against the rocks of the headland.">
				<RFATAL>)
			       (ELSE
				<COND (<FSET? ,MAIN-DECK ,SCOREBIT>
				       <TELL CR
"The chaos continues, the oarsmen inexperienced with storms so far out
to sea, and they can't seem to get sorted out on their own.">
				       <COND (<IN? ,RODRIGUES ,HERE>
					      <TELL
G" Rodrigues yells at you, \"Ingeles, ""I told you to help the
oarsmen!  Are you afraid just because you got a little wet?\"">)>
				       <CRLF>)
				      (<FSET? ,OARSMEN ,SCOREBIT>
				       <TELL CR
"The oarsmen, spent by their fight against the waves, and unsure what
to do next, wait for the next order.">
				       <COND (<IN? ,RODRIGUES ,HERE>
					      <TELL
G" Rodrigues yells at you, \"Ingeles, ""get those bastard-sans rowing
again!  They don't know what to do so far from shore.\"">)>
				       <CRLF>)>
				<TELL CR
"The storm continues to rage, and the galley is getting no closer to the
bay." CR>
				<RTRUE>)>)>)
		 (;5
		  <MOVE ,RODRIGUES ,MAIN-DECK>
		  <CRLF>
		  <COND (<HERE? ,MAIN-DECK>
			 <TELL
"Rodrigues picks his way forward and claps you on the shoulder.  He points
aft.">)
			(ELSE
			 <TELL
"Rodrigues says,">)>
			
		  <TELL
"\"You take the helm.  When I signal, steer west
for that point.  You see it?  I'm going">
		  <COND (<HERE? ,GALLEY> <TELL " forward">)>
		  <TELL " to help the captain with the oarsmen.\"">
		  <COND (<HERE? ,GALLEY>
			 <TELL "He unties his lifeline and goes forward.">)>
		  <CRLF>)
		 (DELAY
		  <COND (<NOT <FSET? ,GALLEY-WHEEL ,ONBIT>>
			 <COND (<G? ,DELAY-CNT 1>
				<TELL CR
"Rodrigues curses, \"By your mother, Ingeles!  Take the helm!\"" CR>
				<RTRUE>)
			       (ELSE <RFALSE>)>)>)
		 (;6
		  <TELL CR
"The wind and tide are carrying you close to the rocks.  Rodrigues stares,
terrified, at the approaching shore." CR>)
		 (;7
		  <TELL CR
"Rodrigues stares in horror at the jagged rocks of the headland.  It's
clear he's lost his nerve.  \"">
		  <COND (<EQUAL? ,SHIP-COURSE ,P?PORT>
			 <TELL "That's right, Pilot!  ">)>
		  <TELL "Steer south for the open sea!\" Rodrigues
screams.  \"Turn and run
before the wind!  We'll never make it safe to the bay!\"" CR>)
		 (;8
		  <COND (<EQUAL? ,SHIP-COURSE ,P?PORT>
			 <TELL CR
"The galley heads for the open sea, trying to run before the wind, but
she's too heavily laden, and has already taken on too much water.  You
try, and the oarsmen try, but it's hopeless.  She flounders and you and
all aboard drown like rats.">
			 <JIGS-UP>
			 <RFATAL>)
			(ELSE
			 <TELL CR
"You hold course toward the bay.  Rodrigues shouts, \"God curse you,
you'll kill us all!\"" CR>)>)
		 (;9
		  <MOVE ,RODRIGUES ,IN-THE-SEA>
		  <FSET ,RODRIGUES ,INVISIBLE>
		  <THIS-IS-IT ,LG-RODRIGUES>
		  <COND (<NOT <MARGINAL-PIC ,P-OVERBOARD>>
			 <CRLF>)>
		  <TELL
"A great wave comes out of the north.  The galley has taken much water
previously, now you're awash and being driven backward towards the
rock-infested shore.|
|
You see the wave take Rodrigues, and you watch him, gasping and struggling
in the churning sea.  You remember that he can't swim." CR>)
		 (DELAY
		  <COND (<FSET? ,OAR ,SCOREBIT>
			 <COND (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"Rodrigues splashes to the surface, but the current is carrying him further
away." CR>
				<RTRUE>)
			       (<EQUAL? ,DELAY-CNT 2>
				<TELL CR
"The rain slashes down and you see that Rodrigues is being carried further
from the galley." CR>
				<RTRUE>) 
			       (<EQUAL? ,DELAY-CNT 3>
				<TELL CR
"Rodrigues is almost lost in the waves and wind-driven spray." CR>
				<RTRUE>)>)>)
		 (<FSET ,OAR ,RMUNGBIT>
		  <TELL CR
"The last you see of Rodrigues is an arm ">
		  <COND (<FSET? ,OAR ,SCOREBIT>
			 <TELL
"waving helplessly through the driving rain." CR>)
			(ELSE
			 <TELL
"gripping a broken oar." CR>)>)
		 (DELAY
		  <COND (<OR <NOT <HERE? ,GALLEY>>
			     <NOT <FSET? ,GALLEY-WHEEL ,ONBIT>>>
			 <COND (<EQUAL? ,DELAY-CNT 1>
				<TELL CR
"There's no one conning the galley!" CR>
				<RTRUE>)
			       (<EQUAL? ,DELAY-CNT 2>
				<SETG SHIP-COURSE ,P?PORT>
				<TELL CR
"The Japanese captain grabs the wheel, and immediately steers for
the open sea!" CR>
				<RTRUE>)
			       (ELSE <RFALSE>)>)
			(<EQUAL? ,SHIP-COURSE ,P?PORT>
			 <COND (<L? ,DELAY-CNT 3>
				<TELL CR
"The galley continues out to sea, into the teeth of the storm." CR>
				<RTRUE>)>)>)
		 (<COND (<EQUAL? ,SHIP-COURSE ,P?PORT>
			 <CRLF>
			 <JIGS-UP
"The galley is now full in the jaws of the storm.  The waves toss
the galley about, and one huge comber crashes over the port gunwale,
and she's sinking!">
			 <RFATAL>)
			(ELSE
			 <SETG GALLEY-IN-BAY? T>
			 <TELL CR
"The ship moves away from the rocks, and you hold course for the lee
shore.  Soon you are in calmer waters.  There is still a gale but it's
overhead.  There is still a tempest but it's out to sea." CR>)>)
		 (DELAY
		  <COND (<FSET? ,ANCHOR ,SCOREBIT>
			 <COND (<G? ,DELAY-CNT 3>
				<CRLF>
				<JIGS-UP
"The ship smashes onto the rocks!  If only you'd dropped anchor in time,
she might have survived.  How humiliating.">
				<RFATAL>)
			       (ELSE
				<TELL CR
"The current is swinging the ship around and towards the rocks, away
from the safe anchorage." CR>
				<RTRUE>)>)>)
		 (<DEQUEUE I-RODRIGUES>
		  <TELL CR
"Somewhere out there is Rodrigues' body.  You know ">
		  <COND (<FSET? ,OAR ,SCOREBIT>
			 <FSET ,RODRIGUES ,DEAD>
			 <TELL "in your heart that with nothing to
keep him above the waves, he must have drowned, and ">)>
		  <TELL
"there is minimal
hope of finding his body, but you feel you owe it to him to try." CR>)>>

<OBJECT LIFE-RING
	(LOC GALLEY)
	(DESC "wooden life ring")
	(FDESC "A wooden life ring hangs nearby.")
	(SYNONYM RING)
	(ADJECTIVE WOODEN LIFE)
	(FLAGS TAKEBIT)
	(ACTION LIFE-RING-F)>

<ROUTINE LIFE-RING-F ()
	 <COND (<P? THROW * LG-RODRIGUES>
		<COND (<NOT <FSET? ,OAR ,RMUNGBIT>>
		       <TELL "You ">
		       <COND (<IN? ,LIFE-RING ,HERE>
			      <TELL
"snatch the wooden life ring and throw it">)
			     (ELSE
			      <TELL
"throw the wooden life ring">)>
		       <REMOVE ,LIFE-RING>
		       <TELL " overboard.  Rodrigues tries to reach it, but
an ill-timed wave sweeps it out of his reach." CR>)
		      (ELSE
		       <TELL G"You can't see Rodrigues anywhere nearby." CR>)>)
	       (<P? THROW * RODRIGUES>
		<MOVE ,LIFE-RING <LOC ,RODRIGUES>>
		<TELL
"You throw " THE ,PRSO " to Rodrigues.  He drops it beside him, not
having any use for it at the moment." CR>)
	       (<AND <VERB? WEAR BOARD>
		     <NOT <FSET? ,LIFE-RING ,WEARBIT>>>
		<COND (<AND <NOT <HELD? ,PRSO>>
			    <NOT <EQUAL? <ITAKE> T>>>
		       <RTRUE>)
		      (ELSE
		       <FSET ,LIFE-RING ,WEARBIT>
		       <TELL
"You pull the life ring over your shoulders.  It makes you very awkward
but you feel safer." CR>)>)
	       (<AND <VERB? TAKE-OFF>
		     <FSET? ,LIFE-RING ,WEARBIT>>
		<FCLEAR ,LIFE-RING ,WEARBIT>
		<TELL
"You remove the life ring, pulling it off over your shoulders." CR>)>>

<OBJECT OAR
	(DESC "broken oar")
	(SYNONYM OAR)
	(ADJECTIVE BROKEN)
	(FLAGS TAKEBIT SCOREBIT)
	(ACTION OAR-F)>

<ROUTINE OAR-F ()
	 <COND (<OR <P? TURN * LG-RODRIGUES>
		    <P? REACH-FOR LG-RODRIGUES>
		    <AND <P? (THROW GIVE) OAR (<> LG-RODRIGUES)>
			 <IN? ,RODRIGUES ,IN-THE-SEA>
			 <FSET? ,RODRIGUES ,INVISIBLE>
			 <HERE? ,GALLEY ,MAIN-DECK>>>
		<COND (<NOT <FSET? ,OAR ,RMUNGBIT>>
		       <FSET ,OAR ,NDESCBIT>
		       <MARGINAL-PIC ,P-OAR <>>
		       <TELL "You ">
		       <COND (<IN? ,OAR ,HERE>
			      <TELL "grab the oar and throw it">)
			     (ELSE
			      <TELL "throw the oar">)>
		       <TELL
" toward Rodrigues.  It crashes into the water near him
and he lunges for it." CR>
		       <MOVE ,OAR ,RODRIGUES>
		       <SCORE-OBJECT ,OAR>)
		      (ELSE
		       <TELL G"You can't see Rodrigues anywhere nearby." CR>)>)
	       (<P? (THROW GIVE) * RODRIGUES>
		<TELL
"He doesn't seem to have much use for the oar right now." CR>)
	       (<VERB? REPAIR>
		<TELL "That's beyond your abilities right now." CR>)>>

<ROOM PEBBLED-BEACH
      (LOC ROOMS)
      (DESC "Pebbled Beach")
      (SYNONYM BEACH)
      (ADJECTIVE PEBBLED)
      (LDESC
"The beach here consists of small, rounded pebbles.  To the south the
cliff rises behind a field of larger rocks.  Riding at anchor in the bay
is Toranaga's galley.")
      (SOUTH TO ROCKY-SHORE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL LG-GALLEY LG-CLIFF LG-SEA LG-LAND
              LG-BAY LG-RODRIGUES)
      (ACTION PEBBLED-BEACH-F)>

<ROUTINE SEARCH-PARTY-FOLLOWS ()
	 <MOVE ,YABU ,HERE>
	 <MOVE ,SEARCH-PARTY ,HERE>
	 <TELL
"Yabu sets a strong pace, which you are hard put to keep up with.  The other "
<GET ,NUMBERS <GETP ,SEARCH-PARTY ,P?COUNT>> " samurai watch you carefully." CR CR>>

<ROUTINE PEBBLED-BEACH-F (RARG)
	 <COND (<RARG? ENTER>
		<COND (<AND <EQUAL? ,OHERE ,IN-THE-SEA>
			    <IN? ,WINNER ,SKIFF>>
		       <FCLEAR ,SKIFF ,RMUNGBIT>
		       <MOVE ,SEARCH-PARTY ,HERE>
		       <TELL
"The rowers row the skiff east to the shore, jump out,
and pull it up on the beach." CR CR>)
		      (<EQUAL? ,OHERE ,ROCKY-SHORE>
		       <SEARCH-PARTY-FOLLOWS>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<AND <P? WALK P?SOUTH>
			    <FSET? ,ROCKY-SHORE ,TOUCHBIT>>
		       <YABU-PREVENTS>)
		      (<P? WALK P?NORTH>
		       <TELL
"\"No, Anjin-san,\" says Yabu.  He points south.  He knows as well as you
that that's where the body will be, if anywhere." CR>)
		      (<OR <P? FIND (RODRIGUES LG-RODRIGUES)>
			   <P? SEARCH GLOBAL-HERE>
			   <VERB? LOOK-DOWN>>
		       <TELL ,SEARCH-FORESHORE
G"There is no sign of Rodrigues." CR>)>)>>

<OBJECT LG-PATH
	(LOC LOCAL-GLOBALS)
	(SCENE S-VOYAGE)
	(DESC "path")
	(SYNONYM PATH FORESHORE SHORE)
	(FLAGS NDESCBIT)
	(ACTION LG-PATH-F)>

<ROUTINE LG-PATH-F ()
	 <COND (<VERB? FOLLOW>
		<TELL
"The path runs north and south.  " ,YOU-HAVE-TO G"specify a direction." CR>)>>

<OBJECT ROCK
	(DESC "rock")
	(SYNONYM ROCK STONE PEBBLE)
	(ADJECTIVE SMALL)
	(FLAGS TAKEBIT)>

<OBJECT LG-CLIFF
	(LOC LOCAL-GLOBALS)
	(OWNER YABU)
	(DESC "cliff")
	(SYNONYM CLIFF CLIFFS ROCK ROCKS CREVICE CLEFT GULLEY CAVE CAVES)
	(ADJECTIVE SHEER LOOSE HIDDEN)
	(FLAGS NDESCBIT TRYTAKEBIT TAKEBIT)
	(ACTION LG-CLIFF-F)>

<ROUTINE LG-CLIFF-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The cliff soars two hundred feet above you, and drops fifty feet to
the water below." CR>)
	       (<VERB? TAKE MOVE>
		<MOVE ,ROCK ,WINNER>
		<TELL
"You take one of the many rocks from the soaking ground." CR>)
	       (<VERB? CLIMB-DOWN CLIMB-FOO>
		<DO-WALK ,P?DOWN>
		<RTRUE>)
	       (<VERB? CLIMB-UP>
		<DO-WALK ,P?UP>
		<RTRUE>)
	       (<P? SEARCH>
		<PERFORM ,V?FIND ,LG-RODRIGUES>
		<RTRUE>)>>

<OBJECT SEARCH-PARTY
	(OWNER SEARCH-PARTY)
	(SCENE S-VOYAGE)
	(DESC "party of samurai")
	(SYNONYM SAMURAI GUARD GUARDS PARTY MEN)
	(ADJECTIVE SEARCH)
	(FLAGS PERSON JAPANESEBIT OPENBIT CONTBIT SEARCHBIT
	  PLURAL SCOREBIT)
	(COUNT 7)
	(DESCFCN SEARCH-PARTY-DESC)
	(GENERIC GENERIC-SAMURAI-F)
	(ACTION SEARCH-PARTY-F)>

<ROUTINE SEARCH-PARTY-DESC (RARG OBJ)
	 <COND (<RARG? OBJDESC?>
		<COND (<IN? ,SEARCH-PARTY ,SKIFF> <RFALSE>)
		      (ELSE <RTRUE>)>)
	       (<RARG? OBJDESC>
		<TELL
"There are " <GET ,NUMBERS <GETP ,SEARCH-PARTY ,P?COUNT>> " ">
		<COND (<HERE? ,CLIFF-PATH>
		       <COND (<IN? ,LOINCLOTH ,SEARCH-PARTY>
			      <TELL
"samurai here, stripped to their loincloths and">)
			     (<EQUAL? <GETP ,YABU-KIMONO ,P?COUNT> 8>
			      <TELL
"naked samurai here,">)
			     (ELSE
			      <TELL
"samurai in soaking wet kimonos here,">)>)
		      (ELSE
		       <TELL "samurai here,">)>
		<TELL " watching you intently.">)>>

<ROUTINE SEARCH-PARTY-F ("OPT" (RARG <>))
	 <COND (<RARG? SUBJ>
		<RFALSE>)
	       (<RARG? WINNER>
		<COND (<AND <P? (RAISE LOWER) YABU-KIMONO>
			    <IN? ,YABU-KIMONO ,SEARCH-PARTY>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,PRSA ,PRSO>
		       <RTRUE>)
		      (ELSE
		       <WAKARIMASEN>)>)
	       (<VERB? COUNT>
		<TELL
"There are " <GET ,NUMBERS <GETP ,SEARCH-PARTY ,P?COUNT>> " samurai here." CR>)
	       (<VERB? EXAMINE>
		<COND (<IN? ,LOINCLOTH ,PRSO>
		       <TELL
"The samurai are stripped to their loincloths." CR>)
		      (<EQUAL? <GETP ,YABU-KIMONO ,P?COUNT> 8>
		       <TELL
"They are naked." CR>)
		      (ELSE
		       <TELL
"They are dressed in rather wet kimonos." CR>)>)>>

<OBJECT PARTY-KIMONO
	(OWNER SEARCH-PARTY)
	(LOC SEARCH-PARTY)
	(DESC "kimonos")
	(SYNONYM KIMONOS CLOTHES)
	(ADJECTIVE SILK SOAKING WET)
	(FLAGS NOABIT DONT-ALL NDESCBIT TAKEBIT WEARABLE PLURAL)
	(GENERIC GENERIC-KIMONO-F)
	(ACTION PARTY-KIMONO-F)>

<ROUTINE GENERIC-KIMONO-F (R F)
	 <COND (<IN? ,YABU-KIMONO ,HERE>
		,YABU-KIMONO)
	       (ELSE ,PARTY-KIMONO)>>

<ROUTINE PARTY-KIMONO-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"These are uniform kimonos in a muddy brown color." CR>)
	       (<VERB? TAKE POINT RUB TEAR TIE>
		<COND (<AND <FSET? ,YABU-KIMONO ,RMUNGBIT>
			    <ACCESSIBLE? ,YABU-KIMONO>>
		       <COND (<IN? ,YABU-KIMONO ,HERE>
			      <MOVE ,YABU-KIMONO ,WINNER>)>
		       <PERFORM ,V?TIE ,YABU-KIMONO>
		       <RTRUE>)
		      (ELSE
		       <TELL
"No one seems to understand what you are trying to do." CR>)>)
	       (<VERB? TAKE>
		<TELL
"The samurai are reluctant to give up their kimonos." CR>)>>

<ROOM ROCKY-SHORE
      (LOC ROOMS)
      (DESC "Rocky Shore")
      (SYNONYM SHORE)
      (ADJECTIVE ROCKY)
      (LDESC
"Inland from the shore the pebbles become sea-smoothed rocks.  To the
south is a path leading along the cliffs and around the headland.  To
the north is the bay where the galley rides at anchor.")
      (NORTH TO PEBBLED-BEACH)
      (SOUTH TO CLIFF-PATH)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL LG-CLIFF LG-SEA LG-RODRIGUES)
      (ACTION ROCKY-SHORE-F)>

<ROUTINE ROCKY-SHORE-F (RARG)
	 <COND (<RARG? ENTER>
		<SEARCH-PARTY-FOLLOWS>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<AND <P? WALK P?SOUTH>
			    <FSET? ,CLIFF-PATH ,TOUCHBIT>>
		       <YABU-PREVENTS>)>)>>

<ROUTINE YABU-PREVENTS ()
	 <TELL
"\"No, Anjin-san,\" says Yabu.  It's clear he thinks you've wasted
enough time searching for the body." CR>>

<ROOM CLIFF-PATH
      (LOC ROOMS)
      (DESC "Cliff Path")
      (SYNONYM PATH)
      (ADJECTIVE CLIFF)
      (LDESC
"Above you the cliff soars two hundred feet.  The white-frothed sea is
fifty feet below.  All around are mountains, not a house or hut in the
whole bay area.  The path dips and rises along the cliff face, very
unsafe, the surface loose.")
      (NORTH TO ROCKY-SHORE)
      (SOUTH TO AROUND-HEADLAND)
      (DOWN TO LEDGE-1)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL LG-CLIFF LG-SEA LG-RODRIGUES LG-YABU)
      (ACTION CLIFF-PATH-F)>

<ROUTINE CLIFF-PATH-F (RARG)
	 <COND (<RARG? ENTER>
		<SEARCH-PARTY-FOLLOWS>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<AND <P? WALK P?SOUTH>
			    <FSET? ,LEDGE-4 ,SCOREBIT>
			    <FSET? ,AROUND-HEADLAND ,TOUCHBIT>>
		       <YABU-PREVENTS>)
		      (<AND <P? WALK (P?NORTH P?SOUTH)>
			    <NOT <FSET? ,LEDGE-4 ,SCOREBIT>>>
		       <TELL
"The samurai watch you like hawks, preventing you from leaving." CR>)
		      (<VERB? LEAP BOARD DIVE>
		       <TELL
"The samurai prevent you." CR>)
		      (<OR <P? FIND (RODRIGUES LG-RODRIGUES)>
			   <P? SEARCH GLOBAL-HERE>
			   <VERB? LOOK-DOWN>>
		       <COND (<FSET? ,LEDGE-4 ,SCOREBIT>
			      <TELL ,SEARCH-FORESHORE>
			      <COND (<AND <NOT <FSET? ,OAR ,SCOREBIT>>
					  <FSET? ,AROUND-HEADLAND ,TOUCHBIT>>
				     <DEQUEUE I-SEARCH>
				     <MOVE ,RODRIGUES ,LEDGE-4>
				     <FCLEAR ,RODRIGUES ,INVISIBLE>
				     <THIS-IS-IT ,LG-RODRIGUES>
				     <TELL "But halfway back along the
path, you see Rodrigues!  The body is caught in a cleft between two great
rocks, above the surf but washed by part of it.  One arm is still locked
to a broken oar which moves slightly with the ebb and flow." CR>
				     <SCORE-OBJECT ,LEDGE-4>)
				    (ELSE
				     <TELL
G"There is no sign of Rodrigues." CR>)>)
			     (<AND <FSET? ,LEDGE ,SCOREBIT>
				   ,YABU-RESIGNED?>
			      <PERFORM ,V?FIND ,LEDGE>
			      <RTRUE>)
			     (ELSE
			      <TELL
"You have already found him.  Is your memory that short?" CR>)>)
		      (<OR <P? POINT (RODRIGUES LG-RODRIGUES)>
			   <P? SHOW (RODRIGUES LG-RODRIGUES) YABU>>
		       <COND (<FSET? ,LEDGE-4 ,SCOREBIT>
			      <TELL
"You don't know where Rodrigues is." CR>)
			     (ELSE
			      <TELL
"Yabu peers over the cliff and finally sees Rodrigues.  He shrugs as if
to say, \"He's dead.\"  He doesn't seem inclined to do anything else." CR>)>)
		      (<P? (HELP TAKE WALK-TO)
			   (YABU RODRIGUES LG-RODRIGUES)>
		       <COND (<FSET? ,RODRIGUES ,INVISIBLE>
			      <RFALSE>)
			     (<AND <NOT <QUEUED? I-YABU-CLIMBS>>
				   <NOT <QUEUED? I-YABU-RETURNS>>>
			      <SETG YABU-CNT 0>
			      <QUEUE I-YABU-CLIMBS -1>
			      <TELL
"You start for the cliff edge, and immediately the samurai restrain you.  Yabu
shakes his head.  \""I"Iye!""\"|
|
You stare at Yabu, towering over him.  \"If you won't let me go, Yabu-san,
then send one of your men.  Or go yourself.  You!\"" CR>)
			     (<IN? ,YABU ,HERE>
			      <TELL
"You've hooked him!  He's preparing to climb!" CR>)
			     (ELSE
			      <TELL
"Yabu doesn't see you." CR>)>)
		      (<P? WALK DOWN>
		       <COND (<AND <NOT <FSET? ,RODRIGUES ,INVISIBLE>>
				   <NOT <QUEUED? I-YABU-CLIMBS>>
				   <NOT <QUEUED? I-YABU-RETURNS>>>
			      <PERFORM ,V?WALK-TO ,RODRIGUES>
			      <RTRUE>)
			     (<IN? ,YABU ,HERE>
			      <TELL
"Quickly, Yabu moves in your way and the samurai surround you.  \""I"Iye"",
Anjin-san,\" Yabu says." CR>)
			     (ELSE
			      <TELL
"The samurai prevent you from climbing down." CR>)>)
		      (<AND <VERB? THROW>
			    <NOT <PRSO? ,YABU-KIMONO>>
			    <EQUAL? <LOC ,YABU>
				    ,LEDGE-1 ,LEDGE-2
				    ,LEDGE-3 ,LEDGE-4>>
		       <REMOVE ,PRSO>
		       <TELL
"You throw " THE ,PRSO " but " HE/SHE ,PRSO " fall" S ,PRSO " unnoticed into
the water.">
		       <COND (<FSET? ,LEDGE ,SCOREBIT>
			      <TELL "The samurai murmur amongst
themselves.  Yabu has composed himself for death.  It is extremely bad
manners to
disturb him, as they can see no way for him to climb the cliff.">)>
		       <CRLF>)
		      (<AND <VERB? YELL YELL-AT ASK-FOR WAVE-AT POINT SHOW
				   CLIMB-DOWN>
			    <PRSO? <> YABU LG-YABU LEDGE SEARCH-PARTY
				   LG-RODRIGUES>
			    <PRSI? <> SEARCH-PARTY>>
		       <COND (<AND <NOT ,YABU-WARNED?>
				   <NOT <FSET? ,LEDGE ,SCOREBIT>>
				   <G=? <GETP ,YABU-KIMONO ,P?COUNT> 8>>
			      <SETG YABU-WARNED? T>
			      <PUTP ,SEARCH-PARTY ,P?COUNT
				    <- <GETP ,SEARCH-PARTY ,P?COUNT> 1>>
			      <DEQUEUE I-YABU-CLIMBS>
			      <SETG YABU-CNT 0>
			      <QUEUE I-YABU-RETURNS -1>
			      <TELL
"You shout, pointing at the ledge, pantomiming a man standing on it carrying
a burden:  Yabu carrying Rodrigues, standing above the waves, if only you
can get his attention somehow.  The samurai talk rapidly to each
other and then they too begin to shout.  There is still no movement from
Yabu.  He seems like a stone.|
|
One of the samurai speaks to the others briefly and they all nod and
bow.  He bows back.  Then, with a sudden screaming shout of \""I"Bansaiiii!""\"
he casts himself off the cliff and falls to his death.  Yabu comes violently
out of his trance, whirls around and scrambles up.  He follows the pointing
fingers and shouts of his men and sees the ledge!  Within seconds he
has scrambled up to it, dragging the unconscious Rodrigues behind him." CR>
			      <SCORE-OBJECT ,SEARCH-PARTY>)
			     (ELSE
			      <TELL
"You point, screaming at the top of your lungs.  The samurai stare at you,
but there is no other result." CR>)>)>)>>

<CONSTANT SEARCH-FORESHORE
"You search the foreshore, every crevice and cleft and gulley.  The spume
wind is gusting, tearing tears from your eyes.  ">

<OBJECT LEDGE
	(LOC CLIFF-PATH)
	(DESC "narrow ledge")
	(SYNONYM LEDGE)
	(ADJECTIVE TINY NARROW)
	(FLAGS NDESCBIT SCOREBIT)
	(ACTION LEDGE-F)>

<ROUTINE LEDGE-F ()
	 <COND (<AND <VERB? FIND>
		     ,YABU-RESIGNED?>
		<TELL
"You stick your head out over the cliff edge as far as you dare, while
the samurai hold your ankles for safety.  You begin to search as you
would at sea, quarter by quarter.  Using every part of your vision but
mostly the sides.  A complete sweep.  Nothing!|
|
Once more.  Nothing!|
|
Again.  What's that?  Just above the tide line?  Is it a crack in the
cliff?  You shift position.  Now you can see better:  there is clearly
a narrow ledge!" CR>
		<SCORE-OBJECT ,LEDGE>)
	       (<AND <VERB? EXAMINE>
		     ,YABU-RESIGNED?>
		<COND (<NOT <FSET? ,PRSO ,SCOREBIT>>
		       <TELL
"It's nearly a foot wide and still just accessible, the rocks between it
and Yabu just barely poking above the surf." CR>)
		      (ELSE
		       <TELL
"You don't see any ledges that would help Yabu." CR>)>)>>

<ROOM LEDGE-1
      (LOC ROOMS)
      (DESC "Ledge")
      (SYNONYM LEDGE)
      (UP TO CLIFF-PATH)
      (DOWN TO LEDGE-2)
      (FLAGS RLANDBIT ONBIT)>

<ROOM LEDGE-2
      (LOC ROOMS)
      (DESC "Ledge")
      (SYNONYM LEDGE)
      (UP TO LEDGE-1)
      (DOWN TO LEDGE-3)
      (FLAGS RLANDBIT ONBIT)>

<ROOM LEDGE-3
      (LOC ROOMS)
      (DESC "Ledge")
      (SYNONYM LEDGE)
      (UP TO LEDGE-2)
      (DOWN TO LEDGE-4)
      (FLAGS RLANDBIT ONBIT)>

<ROOM LEDGE-4
      (LOC ROOMS)
      (DESC "Ledge")
      (SYNONYM LEDGE)
      (UP TO LEDGE-3)
      (FLAGS RLANDBIT ONBIT SCOREBIT)>

<ROOM AROUND-HEADLAND
      (LOC ROOMS)
      (DESC "Around the Headland")
      (SYNONYM HEADLAND)
      (LDESC
"This side of the headland is in the lee of the wind, for which you
are very grateful.  Half a mile away a small fishing village nestles
on the white-frothed shore.")
      (NORTH TO CLIFF-PATH)
      (FLAGS RLANDBIT ONBIT)
      (ACTION AROUND-HEADLAND-F)
      (GLOBAL LG-CLIFF LG-SEA LG-RODRIGUES LG-YABU
       LG-VILLAGE)>

<ROUTINE AROUND-HEADLAND-F (RARG)
	 <COND (<RARG? ENTER>
		<SEARCH-PARTY-FOLLOWS>
		<COND (<NOT <QUEUED? I-SEARCH>>
		       <SETG YABU-CNT 0>
		       <QUEUE I-SEARCH -1>)>
		<RTRUE>)
	       (<RARG? BEG>
		<COND (<OR <P? FIND (RODRIGUES LG-RODRIGUES)>
			   <P? SEARCH GLOBAL-HERE>
			   <VERB? LOOK-DOWN>>
		       <TELL ,SEARCH-FORESHORE
G"There is no sign of Rodrigues.""  You realize that if the body is beyond
this point it is hidden or swallowed up or already carried out to
sea." CR>)>)>>

<ROUTINE I-SEARCH ()
	 <ZLINES ,YABU-CNT
		 (<PUTP ,SEARCH-PARTY ,P?COUNT
			<- <GETP ,SEARCH-PARTY ,P?COUNT> 2>>
		  <TELL CR
"Yabu motions to two of the samurai, who immediately bow and then lope
off toward the fishing village." CR>)
		 (<TELL CR
"Yabu wipes the rain off of his face, glances up at you, and motions for
you to return to the galley." CR>)
		 (DELAY
		  <COND (<BLACKTHORNE-DALLIES? ,AROUND-HEADLAND ,CLIFF-PATH>
			 <RTRUE>)>)
		 (<TELL CR
"Yabu takes a quick look around, anxious to return to the galley." CR>)
		 (DELAY
		  <COND (<BLACKTHORNE-DALLIES? ,CLIFF-PATH ,ROCKY-SHORE>
			 <RTRUE>)>)
		 (<TELL CR
"Yabu glances around impatiently, obviously anxious to return to the
galley." CR>)
		 (DELAY
		  <COND (<BLACKTHORNE-DALLIES? ,ROCKY-SHORE ,PEBBLED-BEACH>
			 <RTRUE>)>)
		 (<DEQUEUE I-SEARCH>
		  <TELL CR
"Quickly, Yabu orders you put in the skiff, and you are rowed back
to the galley.  You comply with ill grace, angry at your failure to
find Rodrigues." CR CR>
		  <FAILED-SCENE>)>>

<ROUTINE BLACKTHORNE-DALLIES? (RM NRM)
	 <COND (<IN? ,BLACKTHORNE .RM>
		<COND (<EQUAL? ,DELAY-CNT 1 2>
		       <TELL CR
"Yabu motions to you to return.  \""I"Isogi!""\" he yells." CR>
		       <RTRUE>)
		      (<EQUAL? ,DELAY-CNT 3>
		       <TELL CR
"Yabu signals to the samurai, barks a few words in Japanese, and
the samurai quickly subdue you and begin to carry you back." CR CR>
		       <MOVE ,YABU .NRM>
		       <MOVE ,SEARCH-PARTY .NRM>
		       <GOTO .NRM>
		       <RTRUE>)>)>>

<GLOBAL YABU-WARNED? <>>
<GLOBAL YABU-RESIGNED? <>>

<ROUTINE I-YABU-CLIMBS ()
	 <ZLINES ,YABU-CNT
		 (<PUTP ,SEARCH-PARTY ,P?COUNT 
			<- <GETP ,SEARCH-PARTY ,P?COUNT> 1>>
		  <TAKE-OFF ,SLIPPERS>
		  <TAKE-OFF ,YABU-KIMONO>
		  <TAKE-OFF ,YABU-SWORDS>
		  <TELL CR
"The wind tears around you, whining off the cliff face.  Yabu looks down,
weighing the climb and the falling light, and you know Yabu is hooked.  A
samurai begins to climb down but Yabu orders him back.|
|
Yabu gives orders to one of the samurai, pointing back toward the
beach.  The man runs off.|
|
Yabu kicks off his thong slippers.  He takes the swords out of his belt
and puts them safely under cover.  He barks some orders at one of the
samurai, then takes off his soaking kimono, and clad only in his loincloth,
goes to the cliff edge, testing it carefully with his toes and feet." CR>)
		 (<MOVE ,YABU ,LEDGE-2>
		  <COND (<NOT <MARGINAL-PIC ,P-CLIFF>>
			 <CRLF>)>
		  <TELL
"Yabu climbs down the side of the cliff with great skill.|
|
Suddenly, Yabu slips!  He grips an outcrop with his left hand, stopping
his fall.  He grinds his toes in a crevice, fighting for another hold,
but his left hand rips away.  His toes find a cleft and he hugs the
cliff desperately.  Then the toehold gives way!  He falls the last twenty
feet." CR>)
		 (<MOVE ,YABU ,LEDGE-3>
		  <TELL CR
"Yabu lands on his feet like a cat, and comes to rest in a wheezing
ball.  One ankle is twisted, but unbroken." CR>)
		 (<MOVE ,YABU ,LEDGE-4>
		  <TELL CR
"Yabu reaches Rodrigues, then shouts something.  ">
		  <COND (<FSET? ,RODRIGUES ,DEAD>
			 <TELL "He shakes his head, confirming that
Rodrigues has drowned." CR>
			 <FAILED-SCENE>
			 <RFATAL>)
			(ELSE
			 <PUTP ,SEARCH-PARTY ,P?COUNT
			       <- <GETP ,SEARCH-PARTY ,P?COUNT> 1>>
			 <TELL "He is signalling that
the pilot is still alive!  One of the samurai runs off toward the galley
to fetch a stretcher and a doctor.|
|
Yabu pulls Rodrigues up onto the rocks, out of the surf." CR>)>)
		 (<SETG YABU-RESIGNED? T>
		  <TELL CR
"Yabu scrambles up and winces at a shaft of pain from his ankle.  He
manages to climb a few feet up, but then stops, his eyes searching
the area diligently for a ledge or a crack within his reach.  He sees
no way to get further up the cliff." CR>)
		 (<TELL CR
"Yabu looks out to sea, then looks up at you briefly.  He composes himself
and sits down on his rocky perch.  With a sudden shock you realize that
he has resigned himself to death." CR>)
		 (DELAY
		  <COND (<AND <NOT ,YABU-WARNED?>
			      <L? ,DELAY-CNT 5>>
			 <TELL CR
"The tide is coming in fast, washing closer and closer to the
rock Yabu is perched on!" CR>
			 <RTRUE>)>)
		 (<TELL CR
"The tide continues to rise." CR>)
		 (DELAY
		  <COND (<AND <NOT ,YABU-WARNED?>
			      <L? ,DELAY-CNT 5>>
			 <TELL CR
"The tide is rising, more and more of Yabu's rock is covered." CR>
			 <RTRUE>)>) 
		 (<TELL CR
"The tide is now breaking over Yabu's rock.  He does not move." CR>)
		 (<DEQUEUE I-YABU-CLIMBS>
		  <TELL CR
"A huge comber crashes over the rock.  Yabu and Rodrigues are swept
away.  Rodrigues goes under almost immediately.  Yabu cannot swim.  He
thrashes briefly then goes under and you see him
no more.  Your feelings are torn.  You are glad to see the son of a whore
die, but you respect his courage." CR>
		  <FAILED-SCENE>
		  <RFATAL>)>>

<GLOBAL ROPE-LOWERED? <>>

<OBJECT YABU-KIMONO
	(OWNER YABU)
	(SDESC "kimono")
	(DESC "kimono")
	(SYNONYM KIMONO ROPE STRIP STRIPS CLOTHES)
	(ADJECTIVE SILK SOAKING)
	(FLAGS TAKEBIT WEARABLE SCOREBIT)
	(COUNT 0)
	(GENERIC GENERIC-KIMONO-F)
	(ACTION YABU-KIMONO-F)>

<ROUTINE YABU-KIMONO-F ("AUX" (ROPE? <GETP ,YABU-KIMONO ,P?COUNT>))
	 <COND (<AND <NOT <VERB? MAKE>>
		     <NOT .ROPE?>>
		<COND (<OR <NOUN-USED? ,PRSO ,W?ROPE>
			   <NOUN-USED? ,PRSI ,W?ROPE>>
		       <TELL "You can't see any rope here." CR>
		       <RTRUE>)>)>
	 <COND (<VERB? RUB>
		<TELL "It feels like silk." CR>)
	       (<VERB? WEAR>
		<COND (<OR .ROPE? <FSET? ,YABU-KIMONO ,RMUNGBIT>>
		       <TELL
"The kimono is no longer in any condition to wear!" CR>)
		      (<FSET? ,CLOTHES ,WEARBIT>
		       <TELL
"You're already wearing your own clothes." CR>)
		      (ELSE
		       <FSET ,YABU-KIMONO ,WEARBIT>
		       <TELL
"You put on Yabu's kimono.  It doesn't fit very well." CR>)>)
	       (<AND <VERB? CLIMB-FOO CLIMB-DOWN>
		     .ROPE?>
		<DO-WALK ,P?DOWN>
		<RTRUE>)
	       (<VERB? TEAR>
		<COND (<FSET? ,YABU-KIMONO ,WEARBIT>
		       <HAVE-TO-TAKE-OFF>)
		      (<NOT <FSET? ,YABU-KIMONO ,RMUNGBIT>>
		       <FSET ,YABU-KIMONO ,RMUNGBIT>
		       <TELL
"You tear the silk kimono into strips, testing them for strength.  The
silk is very strong." CR>)
		      (ELSE
		       <TELL
"If you tear the silk any more, it will be useless." CR>)>)
	       (<P? (TIE MAKE) YABU-KIMONO (YABU-KIMONO PARTY-KIMONO <> ROOMS)>
		<COND (<FSET? ,YABU-KIMONO ,RMUNGBIT>
		       <COND (<FSET? ,YABU-KIMONO ,SCOREBIT>
			      <REMOVE ,PARTY-KIMONO>
			      <MOVE ,LOINCLOTH ,SEARCH-PARTY>
			      <PUTP ,YABU-KIMONO ,P?SDESC "rope">
			      <PUTP ,YABU-KIMONO ,P?COUNT
				    <+ <GETP ,YABU-KIMONO ,P?COUNT> 5>>
			      <TELL
"You tie the strips together, making a rope.  The samurai emulate you,
removing their own kimonos and leaving them clad only in loincloths.  You
now have a rope of some length." CR>
			      <SCORE-OBJECT ,YABU-KIMONO>)
			     (ELSE
			      <TELL
"You have already made a rope of some length.  All the kimonos are now
part of it." CR>)>)
		      (<FSET? ,YABU-KIMONO ,WEARBIT>
		       <HAVE-TO-TAKE-OFF>)
		      (ELSE
		       <TELL
"You have succeeded in tying the kimono in knots." CR>)>)
	       (<P? UNTIE YABU-KIMONO>
		<COND (<FSET? ,YABU-KIMONO ,SCOREBIT>
		       <TELL
"You haven't tied it yet." CR>)
		      (ELSE
		       <TELL
"Your knots are too tight to untie." CR>)>)
	       (<AND <P? GIVE YABU-KIMONO SEARCH-PARTY>
		     .ROPE?>
		<COND (<NOT ,ROPE-LOWERED?>
		       <TELL
"You hand the rope over the samurai." CR CR>
		       <MOVE ,YABU-KIMONO ,SEARCH-PARTY>
		       <PERFORM ,V?LOWER ,YABU-KIMONO>
		       <RTRUE>)
		      (ELSE
		       <TELL
"They already are holding the rope." CR>)>)
	       (<AND <P? TIE YABU-KIMONO> .ROPE?>
		<COND (<PRSI? ,LG-CLIFF>
		       <TELL
"There are no good places here to tie the rope.  The rock is loose
and crumbly with no really large boulders." CR>)
		      (<PRSI? ,SEARCH-PARTY>
		       <TELL
"The samurai are more than strong enough to hold the rope without tying
it to them." CR>)
		      (<PRSI? ME CLOTHES>
		       <TELL
"Tying the rope to yourself won't give enough leverage if Yabu ever
reaches it." CR>)
		      (,PRSI
		       <TELL
"Tying the rope to " THE ,PRSI " isn't very helpful." CR>)>)
	       (<OR <VERB? LOWER>
		    <P? (THROW GIVE PUT) * (LG-YABU LG-CLIFF)>>
		<COND (,ROPE-LOWERED?
		       <TELL
"You can't lower the rope any further." CR>)
		      (<NOT .ROPE?>
		       <TELL
"You lower the kimono.  It's nowhere long enough to reach Yabu." CR>)
		      (ELSE
		       <COND (<IN? ,YABU-KIMONO ,SEARCH-PARTY>
			      <TELL
"You pantomime the action, and the samurai lower the rope towards Yabu.  ">)
			     (<IN? ,YABU-KIMONO ,WINNER>
			      <TELL
"With the help of the samurai, you lower the rope towards Yabu.  ">)
			     (ELSE
			      <TELL
"No one has the rope." CR>
			      <RTRUE>)>
		       <SETG ROPE-LOWERED? T>
		       <COND (<L? <GETP ,YABU-KIMONO ,P?COUNT> 8>
			      <TELL
"It's too short, about twenty feet too short." CR>)
			     (<NOT ,YABU-WARNED?>
			      <TELL
"It's just a little short.  If you could find some way for him to climb a
little higher, just a few feet, he could reach the rope.  But it's hopeless,
even if there were a way, because he's sitting quietly, composed and waiting
for death.  The fool won't even pay attention, and the rest of the search
party has given up too, believing he can't reach the rope, no matter
what.  Fools!  There must be a way!" CR>)
			     (ELSE
			      <TELL
"It's inches too short, but stretching and scrambling just a little
higher, Yabu reaches it!" CR>)>)>)
	       (<VERB? RAISE MOVE>
		<COND (,ROPE-LOWERED?
		       <COND (<QUEUED? I-YABU-RETURNS>
			      <TELL
"With Yabu clinging to it, you can't raise it." CR>)
			     (ELSE
			      <SETG ROPE-LOWERED? <>>
			      <COND (<IN? ,YABU-KIMONO ,SEARCH-PARTY>
				     <TELL
"You signal the search party, and they raise the rope." CR>)
				    (<IN? ,YABU-KIMONO ,WINNER>
				     <TELL
"You raise the rope." CR>)
				    (ELSE
				     <TELL
"No one is holding the rope." CR>)>)>)
		      (<NOT .ROPE?>
		       <TELL "You lift the kimono." CR>)
		      (ELSE
		       <TELL G"It already is." CR>)>)>>

<OBJECT SLIPPERS
	(DESC "slippers")
	(SYNONYM SLIPPERS SLIPPER)
	(ADJECTIVE THONG)
	(FLAGS TAKEBIT WEARABLE NOABIT PLURAL)>

<OBJECT LOINCLOTH
	(DESC "loincloth")
	(SYNONYM LOINCLOTH CLOTH CLOTHS)
	(ADJECTIVE LOIN)
	(FLAGS NDESCBIT TAKEBIT WEARABLE PLURAL SCOREBIT)
	(ACTION LOINCLOTH-F)>

<ROUTINE LOINCLOTH-F ()
	 <COND (<OR <VERB? POINT TAKE>
		    <P? TIE LOINCLOTH YABU-KIMONO>
		    <P? TIE YABU-KIMONO LOINCLOTH>>
		<REMOVE ,LOINCLOTH>
		<PUTP ,YABU-KIMONO ,P?COUNT 8>
		<TELL
"You point to the loincloths, and the samurai immediately understand.  They
remove them and tie them together, adding them to the rope.  It is
now significantly longer.">
		<COND (,ROPE-LOWERED?
		       <TELL
"The rope now reaches almost to Yabu.  If he could just ">
		       <COND (<QUEUED? I-YABU-RETURNS> <TELL "stretch">)
			     (ELSE <TELL "climb a little higher">)>
		       <TELL ", he might be able to reach it.">)>
		<CRLF>
		<SCORE-OBJECT ,LOINCLOTH>)>>

<OBJECT YABU-SWORDS
	(DESC "swords")
	(OWNER YABU)
	(SYNONYM SWORDS SWORD)
	(FLAGS TAKEBIT TRYTAKEBIT WEARABLE WEAPONBIT NOABIT PLURAL)
	(GENERIC GENERIC-SWORD-F)
	(ACTION YABU-SWORDS-F)>

<ROUTINE YABU-SWORDS-F ()
	 <COND (<VERB? TAKE THROW USE>
		<TELL
"The samurai won't let you take Yabu's swords.  A samurai's swords are his
most precious possession." CR>)>>

<ROUTINE I-YABU-RETURNS ()
	 <ZLINES ,YABU-CNT
		 (<TELL CR
"Yabu staggers up.  He half slides, half crawls, dragging the unconscious
Rodrigues with him through the surf-disturbed shallows to the bottom of
the cliff.  He finds the ledge.  It's barely a foot wide.  Painfully he
shoves Rodrigues onto it, almost losing him once, then hauls himself up." CR>)
		 (DELAY
		  <COND (<NOT ,ROPE-LOWERED?>
			 <COND (<G? ,DELAY-CNT 2>
				<SETG ROPE-LOWERED? T>
				<TELL CR
"The samurai lower the rope to Yabu." CR>
				<RTRUE>)
			       (ELSE
				<TELL CR
"The rope isn't lowered!  Yabu can't reach it, even from the ledge." CR>
				<RTRUE>)>)
			(<L? <GETP ,YABU-KIMONO ,P?COUNT> 8>
			 <TELL CR
"Yabu reaches for the rope, but it's twenty feet short." CR>
			 <RTRUE>)>)
		 (<MOVE ,YABU ,LEDGE-3>
		  <MOVE ,RODRIGUES ,LEDGE-3>
		  <TELL CR
"Yabu stretches for the rope, pulling himself partway up the cliff, carrying
Rodrigues.  Twice he loses the pilot, but each time Yabu drags him back.  His
position is precarious, but you can see that the bottom of the cliff is now
completely under water." CR>)
		 (<MOVE ,YABU ,GENERIC-OBJECTS>
		  <MOVE ,RODRIGUES ,GENERIC-OBJECTS>
		  <TELL CR
"For almost an hour Yabu sets himself against the sea and against his
failing body, and then, in the dusk, he reaches a wide ledge where he's safe
from the sea and he can rest and not hang from the makeshift, fraying rope.|
|
Just then, the samurai Yabu sent to the galley returns with coils of
strong rope.  They make a cradle and shin down the cliff with a skill that
you have never seen ashore.  Quickly Rodrigues is brought aloft, and then
Yabu.  You look at him.|
|
\"Thank you,\" you say finally, pointing at Rodrigues.  \"Thank you,
Yabu-san.\"  You bow.  That's for your courage, you black-eyed son of a
whore.|
|
Yabu bows back, stiffly.  But inside, he smiles." CR>
		  <NEXT-SCENE>)>>

<ROUTINE VOYAGE-AFTER-F ()
	 <TELL
"The rest of the voyage to Osaka is uneventful.|
|
Rodrigues is tended by a Japanese doctor with strange ideas, such as
keeping the air in the cabin fresh, but begins to recover anyway.|
|
\"Ah, Ingeles,\" he sighs.  \"If I live, it is because of a heretic and a
Japman.\"  Then he turns serious.  \"Japan's an upside-down
world.  They have a saying, that a man has a false heart in his mouth for
all the world to see, another in his breast to show his very special
friends and family, and the real one, the true one, the secret one,
which is never known to anyone except himself alone.  So never forget
they're six-faced and have three hearts!\"" CR>>

<END-SEGMENT>
