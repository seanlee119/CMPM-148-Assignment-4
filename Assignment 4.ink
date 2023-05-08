VAR strength = 0
VAR speed = 0
VAR intelligence = 0
VAR jump = 0
VAR height = 0
VAR character = ""
VAR world1 = false
VAR world2 = false
VAR world3 = false
-> character_selection
=== character_selection ===
Choose Your character
 + [Mario.........strength:5 speed:5 intelligence:7 jump:3 height:5]
    ~ strength = 5
    ~ speed = 5
    ~ intelligence = 7
    ~ jump = 5
    ~ height = 5
    ~ character = "Mario"
 + [Donkey Kong.........strength:7 speed:3 intelligence:5 jump:3 height:7]
    ~ strength = 7
    ~ speed = 3
    ~ intelligence = 5
    ~ jump = 3
    ~ height = 7
    ~ character = "Donkey_Kong"
 + [Kirby.........strength:5 speed:7 intelligence:3 jump:7 height:3]
    ~ strength = 5
    ~ speed = 7
    ~ intelligence = 3
    ~ jump = 7
    ~ height = 3
    ~ character = "Kirby"

- You chose {character}
    -> World_Selection
    
=== World_Selection ===
You are tasked to save the world but it starts with one world at a time.
Where will you go?
    + {world1 == false} [Mushroom Kingdom]
        -> Mushroom_Kingdom
    + {world2 == false} [Donkey Kong Island]
        -> Donkey_Kong_Island
    + {world3 == false} [DreamLand]
        -> DreamLand
    + {world1 == true} {world2 == true} {world3 == true} [There's more worlds out there. To be continued...]
        -> END
=== Mushroom_Kingdom ===
You arrive at the Mushroom Kingdom and you bump into a toad who alerts you of the current threat, Bowser. He has taken over the kingdom and it is your job to stop him and save Princess Peach. 
Where should you go first?
    + {intelligence <= 5 } [To the forest]
        -> forest
    + {intelligence <= 7} [To the rocky road]
        -> road
    + {intelligence <= 3} [To the volcano]
        -> volcano
    
= forest
You enter the dark forest and it soon becomes night. You hear unknown sounds around you. All of a sudden you see a set of glowing eyes in the distant. It's a goomba running straight at you!
    + [jump over the goomba]
        ++ {jump >= 7} You jumped over the goomba and the goomba ran past you.
            -> forestexit
        ++ {jump < 7} You tried jumping over the goomba but you couldn't jump high enough and the goomba runs over you. You died.
            ->character_selection
    + [punch the goomba]
        ++ {strength >= 7} You punched the goomba and it died.
            -> forestexit
        ++ {strength < 7} You tried punching the goomba but the punch was too weak and it ran over you. You died.
            -> character_selection
    + [run away]
        ++ {speed >= 7} You turn around and run as fast as you can away from the goomba. You weave and turn trying to loose the goomba and your speed allows you to lose it.
            -> forestexit
        ++ {speed < 7} You turn around and run as fast as you can away from the goomba. You weave and turn trying to loose the goomba but you are not fast enough and it runs over you. You died.
            -> character_selection
= forestexit
You proceed forward and out of the forest. The castle looms in front of you.
    + [proceed onwards towards the castle]
        ->castle
= road
{
 -character == "Mario":
 ~ jump += 2
}
You proceed onwards down the road. It is a peaceful hike with flowers and trees by your side. You pass by a village with toads who are very hospitable. They offer you food and a place to sleep. After a good night you continue on your journey. {character == "Mario": Before you leave they give you a parting gift. They give you a pair of shoes that make you jump higher.} 
    You say your farewells and continue on. You see the castle close ahead.
    ->castle
= volcano
You walk towards teh volcano as the temperature rises. You see fireballs popping in and out of the lava as you walk. As you aproach the volcano you see that you can go around the pit of the volcano.
    + [Jump up and around the volcano]
        ++ {jump >= 7} You jump effortlessly from edge to edge around the volcano and across.
        -> volcanoend
        ++ {jump < 7} You try jumping from one edge to another but you can't jump high enough and you fall to your death. You died.
        -> character_selection
    + [Climb up and around the volcano]
        ++ {height >= 7} You grab each edge and climb the mountain with no effort. You slide down the mountain once you reach the top.
        -> volcanoend
        ++ {height < 7} You try to grab each edge but once you almost get to the top you can't reach high enough and you fall to your death. You died. 
        -> character_selection
= volcanoend 
You reach the other side of the volcano and see the castle close by. The castle looms in front of you.
    + [proceed onwards towards the castle]
        ->castle
= castle
You enter the castle through the front door. You see Bowser next to Princess Peach in a cage. Bowser's minions run in front of you. What do you do?
    + [jump over them]
        ++ {jump >= 7} You jump over them and get to Bowser. 
            -> bowser   
        ++ {jump < 7} You try jumping over the horde but you fall short and get trampled by all of the minions. You died. 
            -> character_selection
    + [punch through them]
        ++ {strength >= 7} You punch your way through and get to Bowser.
            ->bowser
        ++ {strength < 7} You try punching your way through but you are not strong enough to do so. You get beat up by all of the minions. You died.
            -> character_selection
    + [run past them]
        ++ {speed >= 7} You run past them and get to Bowser.
            ->bowser
        ++ {speed < 7} You try running past them but you are not fast enough and the minions catch up and tackle you down. You died.
            -> character_selection
= bowser
You meet face to face with Bowser. Both of you are at the top of the castle with a big drop behind Bowser. He cackles and breathes a fireball at you. What do you do?
    + [jump over it]
        ++ {jump >= 7} You jump over the fireball and then on top of Bowser making him fall off the cliff and to his death. You free the princess and the world has been saved. Now where to?
            ~ world1 = true
            -> World_Selection
        ++ {jump < 7} You try to jump over the fireball but you can't jump high enough so you get burned to death. You died. 
            -> character_selection
    + [tank it]
        ++ {strength >= 7} You decide to face the fireball head on and you come out unscathed due to your natural strength. You walk up to Bowser and give him a strong and mighty punch. Defeating him and freeing the princess. The Mushroom Kingdom has now been saved. Now where to?
            ~ world1 = true
            -> World_Selection
        ++ {strength < 7} You try to tank the fireball but you get burn to death instead. You died. 
            -> character_selection
    + [dodge it] 
        ++ {speed >= 7} You react fast enough and you side step the fireball. You run as fast as you can up to Bowser before he can react and you push him off the cliff. He falls to his death. The princess and the Mushroom Kingdom has now been saved. Now where to?
            ~ world1 = true
            -> World_Selection
        ++ {speed < 7} You try to dodge the fireball but your reaction time isn't fast enough so you get burned. You died.
            -> character_selection
=== Donkey_Kong_Island ===
VAR coconut = false
VAR laps = 0
You arrive at Donkey Kong Island and meet up with Diddy Kong. He informs you that King K. Rool has taken over the Island once again. With your current strength you cannot beat him. You must obtain the Crystal Coconut. You strap up and get ready to save the island. 
        + [Let's go]
            -> start
= start
Where should you explore?
    + The beach
    You arrive at the beach and see possible places where the Crystal Coconut could be.
        ->beach
    + The jungle
    You enter the jungle and start exploring. 
        -> jungle
    + The village
    You head into the village and see many villagers. You should talk to them and see if you can get any information on where you can find the Cyrstal Coconut.
        -> village
    
= beach
Where should you look?
    + [under the big rock]
        You check under the rock but theres nothing there except a crab that runs away once it notices you.
        ->beach 
    + [in the cave]
        You go inside the cave. You hear water dripping as you walk deeper and deeper in the cave. As you reach the end of the cave you realize theres nothing there and a big wave crashes in the cave and pushes you back out.
        ->beach
    + [in the water]
        You go underwater and see a lot of fishes. The water is shallow so you see the bottom of the ocean the moment you look down. You look left and right but you don't see anything. You go back to the surface and onto the beach
        ->beach
    + [go back]
        ->start
= jungle
{
    -laps >= 10:
        You see a temple that you haven't seen before after the many laps.
        You head in the temple.
        -> temple
    }
Theres nothing more than trees, fruits, and bushes.
    + [keep on looking]
        ~ laps += 1
        -> jungle
    + [go back]
        -> start
= village
    * Dixie Kong
    {
    -character == "Donkey_Kong":
    Oh hey Donkey Kong, I forgot to give you a birthday gift this year so here's a banana that will make you faster. It was really expensive so hopefully you can forgive me. Oh the Cyrstal Coconut,
    ~ speed += 2
    }
    I've heard legends of the Cyrstal Coconut and the power it can give to the person who eats it. Diddy would always tell me that he would be the one to find it. Good luck!
        -> village
    * Cranky Kong
        No one has ever seen the Cyrstal Coconut. People who look would try over and over again but find nothing. Some person even tried looking around the jungle 9 times but found nothing. In order to find the Coconut you need to be persistent.
        -> village
    * Funky Kong
        Sup brooooo. It's kinda rad that your trying to look for the Cyrstal Coconut and save the island. Good luck dude and surfs up!
        -> village
    + [go back]
        ->start
= temple
You see a huge altar with the Crystal Coconut floating as it gleams in a single ray of sunlight. You walk up the altar and grab the Crystal Coconut and eat it. All of a sudden the temple shakes as it starts to collapse on itself. You hurry and runaway as you are strengthend by the Coconut. You are ready and you set out to go defeat King K. Rool.
    -> King
= King
You find and face King K. Rool. With this new strength you feel mighty and powerful. You walk up to him as you shine from the coconut. King K. Rool realizes that you have found and ate the legendary fruit and he cowers in fear. He asks for forgiveness. Do you spare him?
    + [yes]
    You spare him as long as he does not make any more trouble. He agrees and flees. You saved the island! Now where to?
        ~ world2 = true
        -> World_Selection
    + [no]
    You grab him by his collar and punch him as hard as you can and he gets sent flying into the atmosphere and sent to another planet. You saved the island! Now where to?
        ~ world2 = true
        -> World_Selection
=== DreamLand === 
VAR hp = 2
VAR turn = 0
You arrive at DreamLand and meet up with Bandana Waddle Dee. He informs you that King Dedede has taken over once again and locked up all the food in his vault. You must go stop him and unlock the vault. 
{
    -character == "Kirby":
    Before you leave Bandana Waddle Dee gives you gloves that will make you stronger.
    ~ strength += 2
    }
    You head toward the tower where King Dedede resides.
    The enterance of the tower has a passcode. What can this passcode be? (Next to the keypad you see a sticky note saying remeber to change the password to something you will for sure know.)
    -> tower
= tower
    +[hamburg3r]
        Thats the wrong password.
        -> tower
    +[st4r]
    Thats the wrong password.
        -> tower
    +[d3d3d3]
    It worked and you head inside.
    
    You go inside and see that the tower has 3 floors. You see King Dedede on the top floor as he laughs at you while eating a cake. You see the stairs at the end of the floor but theres a puzzle that you have to solve. It reads 
    "What kind of cup doesn't hold water?"
        -> tower1
    +[d93jd9]
    Thats the wrong password.
        -> tower
= tower1
    +[a cup that doesn't have a handle]
        That's not it.
        -> tower1
    +[a pot]
        That's not it.
        -> tower1
    +[a bowl with a hole]
        That's not it.
        -> tower1
    +[cupcake]
        That's it! The door opens to the next set of stairs to the second floor.
        
        Theres another puzzle but, this time its a math riddle.
        Which number is equivalent to 3^4/3^2?
        ->tower2
= tower2
    +[2]
        That's not it.
        -> tower2
    +[9]
        That's it! The door opens to the final floor of the tower. You see King Deded furious that you made it to the top. He drops his cake and picks up his hammer ready to fight.
        
        King Dedede runs at you with full speed ready to swing his hammer. What do you do?
        -> battle
    +[81]
        That's not it.
        -> tower2
    +[729]
        That's not it.
        -> tower2
= battle
    {hp==1:You think to yourself, you can't afford to get hit by another one.}
    {turn < 3 : He gets ready to do the same thing again and runs at you. What do you do?}
    +{hp<=0} 
        You died.
        -> character_selection
    +{turn>=3}{hp>0}
        King Dedede tires out and lays on the ground.
        -> kend
    +{hp>0}{turn<3}jump
        ++ {jump >= 7} You jumped over King Dedede as he hits the wall.
            ~ turn += 1
            -> battle
        ++ {jump < 7} You tried to jump over King Dedede but you get hit instead as the hammer pummels you to the wall. 
            ~ turn += 1
            ~ hp -= 1 
            -> battle
    +{hp>0}{turn<3}get ready to punch
        ++ {strength >= 7} You punch at the perfect time while he runs at you and send him flying toward the wall.
            ~ turn += 1
            -> battle
        ++ {strength < 7} You try to punch and counterattack but it fails as the hammer pummels you to the wall.
            ~ hp -= 1 
            ~ turn += 1
            -> battle
    +{hp>0}{turn<3}run
        ++ {speed >= 7} You run away as he runs toward you. Right as you get toward the wall you move out the way. He runs straight into the wall as he could not stop himself.
            ~ turn += 1
            -> battle
        ++ {speed < 7} You try to run away as he runs towards you, but he catches up and swings his hammer and hits you as it pummels you to the wall.
            ~ turn += 1
            ~ hp -= 1 
            -> battle
= kend 
You walk towards him and stand on top of him victorious. You spin and send him flying to a different planet. You unlock the vault with food and give it back to the people. You saved Dreamland! Now where to?
    ~ world3 = true
    -> World_Selection