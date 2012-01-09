"Starborn" by Juhana Leinonen

[Copyright (C) 2010 Juhana Leinonen  <juhana dot if -at- nitku dot net>

Permission is hereby granted, free of charge, to any person obtaining a 
copy of this software and associated documentation files (the 'Software'), 
to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the 
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in 
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY 
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

----

CHANGELOG

Release 3 (2011-01-29)
---------

- Added many synonyms seen in the play data
- Changed the keyword that takes the player back inside Magellan from MAGELLAN to STARSHIP, which also fixes the bug where commanding MAGELLAN in some rooms would give a "which do you mean, Magellan or the Magellan" disambiguation prompt
- If the player types more than one word (and the command itself is not a valid keyword), the player is instructed to choose a single keyword only to advance. This hints the player towards the correct syntax in most cases where the player tries to use a standard IF command, and in cases where the player types more than one keyword at the same time.
- Every parser error now prints the same "that is not a keyword the story recognizes" to avoid unfitting error messages
- Changed two "change the command prompt to" phrases to "now the command prompt is" to avoid deprecated features
- Fixed a bug where PASSWORD would not show as a keyword the first time it was mentioned



Release 2 (2011-01-16)
---------

- Removed the status line
- Separated the connections from other keywords in the keyword listing
- Option to change the way keywords are displayed, an option to show available keywords after every turn and an option to turn the prompt off (mainly for people who play with a screen reader)
- Cover art
- Fixed a typo on the space station's name (Focault -> Foucault)


Release 1 (2011-01-08)
---------

- Initial release for the New Year's Speed competition.

]


Volume Technical


Chapter Extensions

[extensions not bundled with Inform 7 are available at http://inform7.com/write/extensions ]
Include Basic Screen Effects by Emily Short.
Include Extended Banner by Stephen Granade.
Include Status Line Removal by Emily Short.


Chapter Bibliographic data

The release number is 3.
The story headline is "An interactive story".
The story genre is "Science Fiction".
The story creation year is 2011.
The story description is "The Magellan returned to Earth two weeks ago. I however can never go home."

Release along with cover art and the source text.


Part Disabled Standard Rules

[Purging the grammar in standard rules isn't necessary but it's easier to keep what we need instead of disable what we don't.]

Section Grammar (in place of Section SR4/10 - Grammar in Standard Rules by Graham Nelson)

Understand "score" as requesting the score.
Understand "quit" or "q" as quitting the game.
Understand "save" as saving the game.
Understand "restart" as restarting the game.
Understand "restore" as restoring the game.
Understand "verify" as verifying the story file.
Understand "version" and "about" and "info" and "credit" and "credits"  as requesting the story file version.
Understand "script" or "script on" or "transcript" or "transcript on" as switching the story
	transcript on.
Understand "script off" or "transcript off" as switching the story transcript off.


Chapter Startup rules

[turn off the banner and implicit looking when the play begins]
The display banner rule is not listed in the startup rulebook.
The initial room description rule is not listed in the startup rulebook.

Use no scoring.


Chapter Banner

The story rights statement is "Copyright (C) 2011 Juhana Leinonen  <[Juhana's email]>

Permission is hereby granted, free of charge, to any person obtaining a 
copy of this software and associated documentation files (the 'Software'), 
to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the 
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in 
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY 
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Cover art composed by Juhana Leinonen from images by NASA (Public Domain) and Suiseiseki (CC-BY-3.0, www.creativecommons.org/licenses/by/3.0) via Wikimedia Commons. Cover art license CC-BY-3.0.

[italic type]Starborn[roman type] latest version and source code available at http://code.google.com/p/starborn .[line break]"

[The email is obscured to fool spam harvesters]
To say Juhana's email:
	say "juhana";
	say dot;
	say "if";
	say "@nitku";
	say dot;
	say "net".
	
To say dot:
	say ".[run paragraph on]".
	

Last report requesting the story file version:
	say story rights statement.


Chapter Core keyword action

Choosing is an action applying to one visible thing.

Understand "[any active thing]" as choosing.

Invalid-choosing is an action applying to one topic.
Understand "[text]" as invalid-choosing.

Before doing something other than choosing or inactive-choosing or invalid-choosing:
	say "[bracket]That is not a keyword the story recognizes.[close bracket][line break]" instead.

Rule for printing a parser error:
	say "[bracket]That is not a keyword the story recognizes.[close bracket][line break]";
	rule succeeds.
	
Before invalid-choosing:
	if the number of words in the player's command is greater than 1:
		say "[bracket]Please type a single keyword to advance the story. [run paragraph on]";
		show available keywords;
		say close bracket;
		say line break;
	otherwise:
		say "[bracket]That is not a keyword the story recognizes.[close bracket][line break]";
	stop the action.
	
Inactive-choosing is an action applying to one visible thing.
Understand "[any inactive thing]" as inactive-choosing.

Instead of inactive-choosing:
	say "[bracket][Player's command in upper case] is not a valid keyword right now.[close bracket][line break]".
	
Last after choosing something:
	[turn persistent keywords into passive keywords and keep sticky keywords' status]
	now the noun is read;
	if the noun is sticky:
		do nothing;
	otherwise if the noun is persistent:
		now the noun is passive;
	otherwise:
		now the noun is disabled;
	continue the action.

Carry out choosing something that is not a connection (this is the describe the keyword rule):
	say the description of the noun;
	say line break.
	
Does the player mean choosing a passive thing:
	it is unlikely.
	

Chapter Looking around

[replaces the looking action]
To look around:
	say the description of the location;
	say line break.
	

Chapter Keyword properties

A keyword is a kind of thing.

A thing can be enabled or disabled. A thing is usually disabled.

Definition: a thing is active:
	["it is in the location" applies to backdrops; "location of it is the location" applies to e.g. carried things.]
	if it is enabled and (it is in the location or the location of it is the location), yes;
	no.
	
Definition: a thing is inactive:
	if it is active, no;
	yes.

[
STICKY: if a keyword is sticky it won't be disabled after it's first activated.
PERSISTENT: a persistent keyword will become passive after it's first activated.
PASSIVE: a passive keyword won't show as an active keyword but it can still be used.
READ: has the keyword been chosen previously.
]
A thing can be sticky. A thing is usually not sticky.
A thing can be persistent or throw-away. A thing is usually persistent.
A thing can be passive or non-passive. A thing is usually non-passive.
A thing can be read or unread. A thing is usually unread.
	

Chapter Available keywords

Listing available keywords is an action out of world.

Understand the command "l" as something new. [must disable the LOOK shortcut first]
Understand "list" and "l" and "look" and "keyword" and "keywords" and "topic" and "topics" and "help" as listing available keywords.
Understand "exit" and "out" and "go" and "leave" and "walk" and "back" as listing available keywords.
Understand "something" as listing available keywords.

Carry out listing available keywords:
	say bracket;
	show available keywords;
	say close bracket;
	say line break.
	
To show available keywords:
	let keyword-list be a list of things;
	let exit-list be a list of things;
	repeat with X running through list of active connections:
		if X is not passive:
			add X to the exit-list;
	repeat with X running through list of active things:
		if X is not passive and X is not listed in exit-list:
			add X to the keyword-list;
	if keyword-list is not empty:
		say "Available keywords: [keyword-list]";
		if exit-list is not empty:
			say ". [run paragraph on]";
	if exit-list is not empty:
		say "Available exits: [exit-list]";
		if keyword-list is not empty:
			say ".[run paragraph on]";
	if keyword-list is empty and exit-list is empty:
		[this should never happen because then the player would be stuck with nothing to do.]
		say "There are no available keywords at the moment.[run paragraph on]".
		

Chapter Printing the name of a thing

The keyword style is a number that varies. The keyword style is 1.

Rule for printing the name of a thing (called item):
	if the item is unread and the item is inactive and the item is disabled:
		now the item is enabled;
	if the item is active and the item is not passive:
		if the keyword style is:
			-- 1:
				say the printed name of the item in upper case;
			-- 2:
				say "[bold type][the printed name of the item][roman type]";
			-- 3:
				say "[bracket][the printed name of the item][close bracket]";
			-- 4:
				say "'[the printed name of the item]'";
			-- 5:
				say "*[the printed name of the item]*";
			-- 6:
				say "[the printed name of the item](*)";
			-- 7:
				say "kw:[the printed name of the item]";
			-- 8:
				say "[blue letters][the printed name of the item][default letters]";
			-- 9:
				say "[green letters][the printed name of the item][default letters]";
			-- 10:
				say "[red letters][the printed name of the item][default letters]";
			-- 11:
				say the printed name of the item;
	otherwise:
		say the printed name of the item.
		

Chapter Connections

A connection is a kind of backdrop. The printed name of a connection is usually "[destination]".
A connection is usually sticky. A connection is usually proper-named.
A connection has a room called destination.

Carry out choosing a connection:
	move the player to the destination of the noun, without printing a room description;
	look around.


Chapter Clarifications

[the clarifications look pretty stupid at times so it's better to just disable them]
Rule for clarifying the parser's choice:
	do nothing.


Chapter Settings

Showing options is an action out of world.

Understand "settings" and "setup" and "options" as showing options.

Carry out showing options:
	say "Type OPTION # to change the way keywords are displayed, where # is the number of your choice. Note that all interpreters do not display all options correctly, so choose the one that works best for you.
	
1. You can see a KEYWORD here.
[line break]2. You can see a [bold type]keyword[roman type] here.
[line break]3. You can see a [bracket]keyword[close bracket] here.
[line break]4. You can see a 'keyword' here.
[line break]5. You can see a *keyword* here.
[line break]6. You can see a keyword(*) here.
[line break]7. You can see a / keyword here.
[line break]8. You can see a [blue letters]keyword[default letters] here.
[line break]9. You can see a [green letters]keyword[default letters] here.
[line break]10. You can see a [red letters]keyword[default letters] here.

There are also some options for displaying the keywords during the story. Type:
[line break] - KEYWORDS REPEAT to display the list of available keywords at the end of every turn,
[line break] - KEYWORDS DEFAULT to stop repeating the keywords every turn,
[line break] - KEYWORDS OFF to turn the keyword  completely, also from the story text,
[line break] - PROMPT OFF to turn the prompt off (the > character at the beginning of the input line), or
[line break] - PROMPT ON to turn the prompt back on."


Setting keyword options is an action out of world applying to one number.

Understand "option [number]" as setting keyword options.

Check setting keyword options:
	if the number understood > 10 or the number understood < 1:
		say "[bracket]Please choose a number between 1 and 10.[close bracket][line break]" instead.
	
Carry out setting keyword options:
	now the keyword style is the number understood.
	
Report setting keyword options:
	say "Keyword style changed."
	

Display keywords every turn is a truth state that varies. Display keywords every turn is false.

Every turn when the display keywords every turn is true:
	try listing available keywords.


Setting display options to is an action out of world applying to one topic.

Understand "keywords [text]" as setting display options to.


Check setting display options to "repeat":
	now display keywords every turn is true;
	if the keyword style is 11:
		now the keyword style is 1;
	say "Settings changed.";
	stop the action.

Check setting display options to "default":
	now display keywords every turn is false;
	if the keyword style is 11:
		now the keyword style is 1;
	say "Settings changed.";
	stop the action.

Check setting display options to "off":
	now display keywords every turn is false;
	now the keyword style is 11;
	say "Settings changed.";
	stop the action.

Check setting display options to:
	[the program will use this if no other options are chosen]
	say "Unknown option. Please choose one of ALWAYS, STATUS, BOTH, DEFAULT or OFF." instead.
	

Setting the prompt off is an action out of world.
Setting the prompt on is an action out of world.
Understand "prompt off" as setting the prompt off.
Understand "prompt on" as setting the prompt on.

Carry out setting the prompt off:
	now the command prompt is "";
	say "Prompt turned off. Type PROMPT ON to turn it back on."

Carry out setting the prompt on:
	now the command prompt is ">";
	say "Prompt turned back on."


Chapter Input cleanup 

[typing just ? was relatively common. Removing it turns the command into empty input which gives the list of keywords. There's no harm in removing the question mark from all input.]
After reading a command (this is the remove question marks from player input rule):
	let T be indexed text;
	let T be the player's command;
	[the parser doesn't understand the command if it's blanked out at this point, so we'll change a lone ? into a "help"]
	if the player's command matches the regular expression "^\?":
		change the text of the player's command to "list";
	otherwise:
		replace the regular expression "\?" in T with "";
		change the text of the player's command to T.


Chapter Miscellaneous

Use no deprecated features.


Volume Story

Book Rooms

Part Rooms

my room is a room. "This is my room where I spend most of my time. [Cousin] is sleeping on my [bed] peacefully.

The door leads back out to the [hallway connection]."

The hallway is a room. "I'm in the hallway outside [my room connection]. Further down the hallway are [the sick bay] and [the exercise room connection]. Going the other way I can go to [the docking station connection] into which [the Magellan] is docked."

The exercise room is a room. "Nothing you do in [weightlessness] really requires any strength, so the crew of [the Magellan] use [the exercise equipment] to keep their muscles from deteriorating. In addition to all the gym gadgets there's a full-body [mirror].

Kevin's [jacket] is floating around the room[if the passport is in the exercise room]. A card is sticking out of its pocket[end if]."

The observatory is a room. "Ever since we returned and docked to [the space-station], this has been the place I've spent most of my time. A round [window] several meters wide shows a magnificent view of [the Earth] as the station revolves around it.

The exit leads to the [docking station connection]."

The docking station is a room. "The [space-station people] who inhabit the [space-station] pass me by as they go about their daily chores. The [shuttle port connection] is near the docking port that connects the [hallway connection] to the space station. I could also go to the [observatory connection]."

Understand "docking bay" and "dock" and "dockingstation" as the docking station. [SICK BAY is mentioned together with DOCKING STATION, so commanding DOCKING BAY was relatively common]

The shuttle port is a room. "I remember dad telling how complicated shuttle travel used to be before they left Earth. You'd have to go through several stages of health and security checks to make sure nothing goes wrong. Now shuttle travel is so common all you need is to buy a ticket with your passport and you're all set.

A corridor leads back to the [docking station connection] and a closed [airlock] leads inside the waiting area. There's [a ticket machine] next to the airlock."

Understand "shuttleport" as the shuttle port.

The space station area is a region. The docking station, the observatory and the shuttle port are in the space station area.
The starship area is a region. My room, hallway and exercise room are in the starship area.


Part Connections

The hallway connection is a connection. The destination of hallway connection is hallway.
The hallway connection is in my room, exercise room and docking station.
Understand "hall" and "corridor" and "hall way" as the hallway connection.
Understand "door" as the hallway connection when the location is my room.
Understand "starship" and "spaceship" and "space" and "ship" and "star" as the hallway connection when the location is in the space station area.
The printed name of the hallway connection is "[if the location is in the space station area]starship[otherwise]hallway[end if]".

Before choosing the hallway connection:
	if the location is the docking station:
		say "I go back to the Magellan.";
	otherwise:
		say "I push myself to speed and enter the hallway.";
	continue the action.


The my room connection is a connection. The destination of the my room connection is my room.
The my room connection is in the hallway.

Before choosing the my room connection:
	say "I push a plate to open the door and swing myself inside my room."

The exercise room connection is a connection. The destination of the exercise room connection is exercise room.
The exercise room connection is in the hallway.
Understand "gym" as the exercise room connection.
Understand "excercise" and "exersise" and "excersise" as the exercise room connection.

The docking station connection is a connection. The destination of the docking station connection is docking station.
The docking station connection is in the hallway, shuttle port and observatory.

Before choosing the docking station connection:
	if the location is the hallway:
		say "I navigate through Magellan's corridors through the docking station into the Foucault space station."

The observatory connection is a connection. The destination of the observatory connection is the observatory.
The observatory connection is in the docking station.

Before choosing the observatory connection:
	say "I follow [the space-station]'s corridors into the observatory."

The shuttle port connection is a connection. The destination of the shuttle port connection is the shuttle port. 
The shuttle port connection is in the docking station.


Book Things

Part The narrator

Yourself is enabled. The printed name of yourself is "me".

The description of the player is "Mom says I'm [italic type]starborn[roman type]--she says I'm special. Who ever said I want to be special?[if the player is carrying something][paragraph break]I have [a list of things carried by the player] with me.[end if]"

Understand the command "i" as something new.
Understand "i" and "starborn" as yourself.


Part Backdrops

Chapter Weightlessness

weightlessness is a backdrop. It is everywhere. The description is "It does seem very limiting that on Earth you can't just go wherever you want if there's something blocking your path. You are bound to a single direction. You can only use a single side of a room effectively, whereas here you can--and must--use every available surface to your advantage.

There was a time when I considered gravity my nemesis that kept me from going home. Then I came to realize how insane it is to hate a force of nature and directed my energy to more tangible things.".

Understand "gravity" and "weight" as weightlessness.
Understand "weighlessness" and "wieghtlessness" as weightlessness.


Chapter Magellan

The Magellan is a backdrop. It is in the starship area. It is disabled. The description is "Mom was pregnant when we left for [Epsilon Eridani]. I was born when we were already far away from Earth. The Magellan has been my home and my prison ever since."

Understand "starship/spaceship" and "star/space ship" and "ship" as the Magellan.
Understand "megellan" and "magellen" and "magella" as the Magellan.


Chapter Epsilon Eridani

Epsilon Eridani is a backdrop. It is in the starship area. It is disabled. It is proper-named. The description is "The best thing about the Epsilon Eridani system was that it was at least [italic type]something[roman type] new. Other than that, just some rocks and gas planets."

Understand "system" and "erdani" as Epsilon Eridani.


Chapter Space station

The space-station is a backdrop. It is in the space station area. The printed name is "Foucault". The description is "The Foucault Space Station is the largest of [Earth]-orbiting space stations. The Magellan has been docked into it since we returned two weeks ago."

Understand "foucault/focault/fss/foucalt/focualt/foucoult/foulcault/foucalut" and "space" and "station" as the space-station.


Chapter People

The space-station people are a backdrop. The printed name is "people". They are plural-named. They are in the space station area. The description is "Never before have I met a person I wouldn't have known for my entire life. Returning to Earth and meeting these new people was hard--I haven't had any practice for such situations. I still find myself shying away from social interaction with strangers."

Understand "other/others" and "stranger/strangers" and "person" as the space-station people.


Part My room

Chapter Cousin

The cousin is a man. He is in my room. The description is "Kevin is my cousin. We were born a month apart, but he was born on Earth and I was born on board the [Magellan] millions of kilometers away. He has never been in space before. 

We live on a different day rhythm so it would already be way past midnight at his home. That and my neverending questions about Earth have tired him up, so I let him sleep on my [bed]."

Understand "kevin" and "man" and "boy" as the cousin.
Understand "cousins" and "cousin's" as the cousin.

After choosing the cousin:
	now the printed name of the cousin is "Kevin";
	continue the action.


Chapter Bed

The bed is a keyword. It is in my room. The description of the bed is "Kevin wanted to try the zero-g bed. It has a mattress and a blanket that's attached to both of the long sides which keeps you in place. My dad has told stories how he found it almost impossible to sleep in one for the first few nights, but Kevin fell asleep instantly."


Chapter Music

music is a keyword. It is in my room.
Understand "quiet" as music.
Understand "computer" and "games" and "movies" as music.
The description of music is "The computer has a comprehensive library of movies, music, books and games. They have been just about the only available entertainment on the [Magellan].".


Part Hallway

Chapter Sick bay

The sick bay is a keyword. It is in hallway. The description is "The sick bay is [Doctor Strepke]'s kingdom. I have no business there now, so I just stay where I am."

Understand "sickbay" as the sick bay.


Chapter Dr Strepke

Doctor Strepke is a disabled keyword. It is proper-named. It is in hallway. The printed name of Strepke is "Dr. Strepke". The description of Strepke is "Dr. Strepke says my body's immune system hasn't been accustomed to Earth's [bacteria] and viruses. If I went down there I'd contact 'every disease known and unknown to man'. I would have to wear an airtight protective suit all the time."

Understand "dr" as Doctor Strepke. 
Understand "drstrepke" as Doctor Strepke. [it might look silly, but remember that punctuation is removed after "DR." so DR.STREPKE (without a space after the full stop) turns internally into DRSTREPKE.]
Understand "stepke" and "strepke's" and "strepkes" as Doctor Strepke.

After reading a command:
	let C be indexed text;
	let C be the player's command;
	replace the regular expression "dr\." in C with "dr";
	change the text of the player's command to C.


Chapter Bacteria

bacteria is a disabled keyword. It is proper-named. It is in hallway. The description is "'Mother Earth is much like the human body,' Dr. Strepke once said. 'It does everything in its power to protect what belongs there--and fights with all its fury against anything that doesn't.'

Needless to say I have done my best to avoid Dr. Strepke since then."


Part Exercise room

Chapter Jacket

The jacket is a sticky keyword. It is in exercise room. The description is "Kevin wanted to try the [exercise equipment] and took the jacket off. It's an Earth jacket and doesn't have the magnetic strips that would keep it in place, so it's floating freely around the room[if the passport is not handled].[paragraph break]A [passport] is sticking out the front pocket[end if]."

Understand "coat" as the jacket.
Understand "kevin's" as the jacket.

Before choosing the jacket for the first time:
	now the passport is in the exercise room;
	continue the action.


Chapter Passport

The passport is a keyword. It is sticky. The description is "[if the player is carrying the passport]I'm carrying with me Kevin's passport. It has a picture of him and his personal information on it.

They say I and Kevin look very much alike. Maybe there's something to it.[otherwise]Looks like the card is Kevin's [passport]. I pull it out from the pocket and take it with me."

The printed name of passport is "card". 
Understand "card" and "id" as the passport.
Understand "front" and "pocket" as the passport when the passport is in the exercise room.
Understand "kevin's" as the passport when the passport is carried by the player.

Before choosing the passport for the first time:
	now the printed name of the passport is "passport";
	now the indefinite article of the passport is "Kevin's";
	continue the action.

Last after choosing the passport for the first time:
	[make the jacket lose its stickiness]
	now the jacket is not sticky;
	now the jacket is passive;
	[show the passport once in the list of keywords after it's been taken]
	now the passport is not sticky;
	now the player is carrying the passport;
	continue the action.
	
Test passport with "hallway/exercise/jacket/card".


Chapter Exercise equipment

The exercise equipment is a keyword. It is in the exercise room. The description is "I have to train as well. Twice as much as the others. I use the standard equipment and [the walking trainer]. People living on Earth are lucky enough to have gravity train their muscles automatically. I need to exercise actively to get any kind of muscle mass.

It's of not much use, though. There is no training equipment for the [heart] muscle."

Understand "excercise" and "exersise" and "excersise" as the exercise equipment.


Chapter Heart

The heart is a disabled keyword. It is part of the player. The description is "On [Earth] your heart has to fight against the gravity to keep blood flowing inside your body. In space it doesn't need to work nearly as hard. If you grow up in [weightlessness] the heart doesn't get the exercise and never grows very strong.

They say my heart would fail if I ever went to Earth, but they are wrong. My heart will break if I never get home."

Understand "heart muscle" and "my heart" as the heart. 


Chapter Walking trainer

The walking trainer is a keyword. It is in the exercise room. The description is "I have never learned to walk the natural way. Or even actually [italic type]walked[roman type]. There's no need for it aboard [the Magellan]. You just float to wherever you want to go.

The walking trainer is a treadmill that has a harness attached to vertical bars with elastic exercise bands. The bands pull you towards the treadmill, simulating gravity. Mom made me practice every day when I was younger. If I can never go to Earth anyway, why bother?"

Understand "treadmill" as the walking trainer.


Chapter Mirror

The mirror is a keyword. It is in the exercise room. It is sticky. The description is "The mirror is used to teach me how to walk properly. They make me look at myself while I fumble on the treadmill.[if the player is carrying the passport and the passport is passive][paragraph break]Now that I look at myself, I [italic type]do[roman type] look a lot like Kevin.[end if]"

Last after choosing the mirror when the player is carrying the passport and the passport is passive:
	now the mirror is not sticky;
	now the mirror is passive.


Part Observatory

Chapter Earth

The Earth is a backdrop. It is in the observatory. The description is "The Earth. The shadow of the Sun is passing by Europe and Africa. Clouds are gathering over Asia, the Indian Ocean glitters in blue. It is an awe-inspiring view, one that reveals new details every time you look at it.

It's a completely different world on the ground, of course. I've seen enough movies and videos to know that. If looking at it from a thousand kilometers away is like this, what would it be like on the ground?"


Chapter Window

The window is a keyword. It is in the observatory. The description is "There are [space-station people] everywhere in the [space-station] but they barely even glance at the [Earth] as they go by. I've seen people on their first visit up here to spend a few minutes looking at it, but the regular staff doesn't even come here unless they have to pass by to get to somewhere else. Do they really not see its beauty? Or is it possible for it to lose its wonderfulness over time? I find the idea impossible to grasp."

Understand "view" as the window.

Test window with "hallway/docking station/observatory/window".


Part Shuttle port

Chapter Airlock

The airlock is a closed container in the shuttle port. It is sticky. The description is "I need a ticket to enter the waiting area."
Understand "waiting" and "area" as the airlock.


Chapter Ticket machine

The ticket machine is in the shuttle port. It is sticky. The description is "[if the ticket is bought]I already have a ticket.[otherwise if the player is carrying the passport]The ticket machine sells tickets to shuttles back to Earth. There's [a slot] where you insert your [passport] and it deducts the price from your account and uploads the ticket information into the card.[otherwise]The ticket machine sells tickets to shuttles back to Earth. You need a passport to buy one.

I have never had a passport, and I will never get one. Since I can't go to Earth there's no need to have one."


Chapter Slot

The slot is a keyword. It is sticky and disabled. It is in the shuttle port. The description is "I already have a ticket."

Instead of choosing the slot when the ticket is not bought:
	[we can safely (?) assume that the player is carrying the passport because the slot becomes activated only if the player has the passport]
	say "I push the passport into the slot. The display indicates the purchase was successful and the machine pushes the card back out again and I take it.
	
I could now open [the airlock] and enter the waiting area. My hands start shaking and sweating.";
	now the airlock is open;
	now the slot is not sticky;
	now the ticket machine is not sticky;
	now the slot is passive;
	now the ticket machine is passive.
	
Test ticket with "hallway/exercise room/jacket/card/hallway/docking station/shuttle port/machine/slot".


Book Scenes

Part Intro

First when play begins (this is the brief instructions rule):
	say "The story you are about to play uses a keyword interface. Whenever you see a word in upper case you can type it on the command prompt to advance the story. If you prefer a different way of showing the keywords, command SETUP to change the settings.
	
Whenever you wish to see the list of currently available keywords, type L or just press enter.[paragraph break]";
	pause the game.

When play begins (this is the new banner rule):
	say paragraph break;
	center "[bold type]STARBORN[roman type]";
	center "by Juhana Leinonen";
	say paragraph break;
	say paragraph break.

When play begins (this is the intro text rule):
	say "It's quiet, as always. I've turned the [music] off so that it doesn't bother my [cousin]'s sleep. A long day of travel and [weightlessness] has exhausted him.
	
The door leads out to the [hallway connection].".


Part Epilogue

Definition: the ticket is bought if the airlock is open.

Story ended is a truth state which varies. Story ended is false.

Instead of choosing the airlock when the ticket is bought:
	say "The airlock opens and I go through. I try to look as neutral as possible as the machines scan Kevin's passport. They let me through.";
	pause the game;
	say "The shuttle takes off and starts its descent. Soon I feel something I've never experienced before: gravity pulling me downwards to my seat.[paragraph break]";
	say "My heart is beating fast. I don't know if it's the excitement or if something is wrong. I start to feel increasing discomfort. The shuttle touches ground and I almost pass out.[paragraph break]";
	say "I manage to stumble out of the shuttle into the open air--and a wonderful, magnificent view of the Earth opens before me. It is everything I could have hoped for and more. A breath of air caresses my being and the Sun's warmth feels so soft. Actual atmosphere is so much gentler than Magellan's artificial environment.[paragraph break]";
	say "'Is everything allright, young man?' I hear someone ask. 'Yes,' I manage to whisper. It's hard to speak when you have to fight the pull of gravity with all the strength you have.[paragraph break]";
	say "A woman behind me catches me as I fall. She sounds hysterical, she's calling for the medical personnel. I see her face and the blue sky behind her.[paragraph break][line break]"; [not a bug: the last paragraph should be separated from the others.]
	say "My vision fades but I can still hear the people around me. They are saying that my heart is failing, but they are wrong. I have never felt more alive. I am home.";
	now story ended is true;
	now the command prompt is "";
	say paragraph break;
	center "[bold type]STARBORN[roman type]";
	say paragraph break;
	say paragraph break.

To say ending options:
	say "[bracket]Type UNDO, RESTART, RESTORE, VERSION or QUIT.[close bracket]".

After reading a command when story ended is true:
	if the player's command does not match "undo/restart/restore/version/quit/q":
		say ending options;
		reject the player's command;
	if the player's command matches "quit/q":
		stop game abruptly.

Rule for printing a parser error when the latest parser error is the I beg your pardon error:
	if the story ended is true:
		say ending options;
	otherwise:
		try listing available keywords.

Test ending with "test ticket/airlock".


Part Easter eggs

Understand "xyzzy" and "plugh" and "plover" as a mistake ( "[bracket]That is not a keyword the story recognizes. Fool.[close bracket]" ).

The books are in my room. They are passive and enabled. Understand "book" as the books. The description is "I do like to read. I've gone through every Jack Mills novel at least ten times."


Volume Debug - not for release

[Every turn:
	try listing available keywords.
≈]