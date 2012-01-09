/*****
 STARBORN

 Copyright (c) 2010, 2011 by Juhana Leinonen.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

 Undum (c) I D Millington (http://undum.com).

*****/


undum.game.id = "3BD5EF90-2ADD-4D94-A8A4-CD24A774BC91";
undum.game.version = "1.0";

undum.game.buttons = {};


/**
 * Situations and actions - the game itself.
 */

undum.game.situations.intro = new undum.SimpleSituation( 
    vorple.html.p( "It's quiet, as always. I've turned the "
	+ vorple.html.link( './music', 'music', { "class": 'once' } )
	+ " off so that it doesn't bother my "
	+ vorple.html.link( "./cousin", 'cousin', { "class": 'once' } )
	+ "'s sleep. A long day of travel and " 
	+ vorple.html.link( './weightlessness', 'weightlessness', { "class": 'once' } )
	+ " has exhausted him." )
	+ vorple.html.p( "The door leads out to the "
	+ vorple.html.link( 'hallway', 'hallway' ) 
	+ "." 
	), {
	    actions: {
	        bed: vorple.html.p( "Kevin wanted to try the zero-g bed. It has a mattress and "
	            + "a blanket that's attached to both of the long sides which "
	            + "keeps you in place. My dad has told stories how he found it "
	            + "almost impossible to sleep in one for the first few nights, "
	            + "but Kevin fell asleep instantly." ),
	        cousin: vorple.html.p( "Kevin is my cousin. We were born a month apart, but "
	            + "he was born on Earth and I was born on board the "
                + vorple.html.link( './magellan', 'Magellan', { "class": 'once unique' } )
	            + " millions of kilometers away. "
	            + "He has never been in space before." )
	            + vorple.html.p( "We live on a different day rhythm so it would "
	            + "already be way past midnight at his home. That and my "
	            + "neverending questions about Earth have tired him up, so "
	            + "I let him sleep on my "
	            + vorple.html.link( './bed', 'bed', { "class": 'once' } )
	            + "." ),
	        epsilon: vorple.html.p( "The best thing about the Epsilon Eridani "
                + "system was that it was at least " 
                + vorple.html.tag( "em", "something" )
                + " new. Other than that, just some rocks and gas planets." ),
	        magellan: vorple.html.p( "Mom was pregnant when we left for "
	            + vorple.html.link( './epsilon', 'Epsilon Eridani', { "class": 'once' } )
	            + ". I was born when we were already far away from Earth. "
	            + "The Magellan has been my home and my prison ever since." ),
            music: vorple.html.p( "The computer has a comprehensive library "
                + "of movies, music, books and games. They have been just "
                + "about the only available entertainment on the "
                + vorple.html.link( './magellan', 'Magellan', { "class": 'once unique' } )
                + "." ),
	        weightlessness: vorple.html.p( "It does seem very limiting that "
                + "on Earth you can't just go wherever you want if there's "
	            + "something blocking your path. You are bound to a single "
	            + "direction. You can only use a single side of a room "
	            + "effectively, whereas here you can&mdash;and must&mdash;use every "
	            + "available surface to your advantage." )
	            + vorple.html.p( "There was a time when I considered gravity my "
	            + "nemesis that kept me from going home. Then I came to "
	            + "realize how insane it is to hate a force of nature and "
	            + "directed my energy to more tangible things." )
	    }
	}
);

undum.game.situations.myroom = new undum.SimpleSituation(
	vorple.html.tag( "h3", "My room" )
	+ vorple.html.p( "This is my room where I spend most of my time. My "
	+ vorple.html.link( './cousin', 'cousin', { "class": 'once' } )
	+ " is sleeping on my "
	+ vorple.html.link( './bed', 'bed', { "class": 'once' } )
	+ " peacefully." )
	+ vorple.html.p( "The door leads out to the "
	+ vorple.html.link( 'hallway', 'hallway' ) 
	+ "." ), {
	    /*
	     * The actions for this situation are the same as the intro's actions
	     * so we can copy the actions from the intro directly here.
	     */
    	actions: undum.game.situations.intro.actions
	}
);

undum.game.situations.hallway = new undum.SimpleSituation(
    vorple.html.tag( 'h3', "Hallway" )
    + vorple.html.p( "I'm in the hallway outside "
    + vorple.html.link( 'myroom', 'my room' )
    + ". Further down the hallway are the "
    + vorple.html.link( './sickbay', 'sick bay', { "class": 'once' } )
    + " and the " 
    + vorple.html.link( 'exerciseroom', 'exercise room' )
    + ". Going the other way I can go to the "
    + vorple.html.link( 'dockingstation', 'docking station' )
    + " into which "
    + vorple.html.link( './magellan', 'the Magellan', { "class": 'once unique' } )
    + " is docked." ), {
        actions: {
            magellan: undum.game.situations.intro.actions.magellan,
            epsilon: undum.game.situations.intro.actions.epsilon,
            sickbay: vorple.html.p( "The sick bay is "
                + vorple.html.link( './strepke', 'Dr.&nbsp;Strepke', { "class": 'once' } )
                + "'s kingdom. I have no business there now, so I just stay "
                + "where I am." ),
            strepke: vorple.html.p( "Dr.&nbsp;Strepke says my body's immune system hasn't been "
                + "accustomed to Earth's "
                + vorple.html.link( './bacteria', 'bacteria', { "class": 'once'  } )
                + " and viruses. If I went down there I'd contact "
                + vorple.html.quote( "every disease known and unknown to man" )
                + ". I would have to wear an airtight protective suit "
                + "all the time." ),
            bacteria: vorple.html.p( 
                vorple.html.quote( "Mother Earth is much like the human body," )
                + " Dr.&nbsp;Strepke once said. "
                + vorple.html.quote( "It does everything in its power to "
                        + "protect what belongs there&mdash;and fights with "
                        + "all its fury against anything that doesn't." )
                + vorple.html.p( "Needless to say I have done my best to avoid "
                + "Dr.&nbsp;Strepke since then." )
            )
        }
    }
);

undum.game.situations.exerciseroom = new undum.Situation({
    /*
     * The description of this room is slightly different depending on whether
     * the reader has already taken the passport from the jacket pocket.
     * We need to make the description a function so that the situation will 
     * be re-evaluated every time this room is entered.
     */
    enter: function( character, system, from, to ) {
        var cardSticking = "";
        if( !character.sandbox.items.passportCarried ) {
            cardSticking = "A "
                + vorple.html.link( './card', 'card', { "class": 'once' } )
                + " is sticking out of its pocket.";
        }
        
        system.write( 
            vorple.html.tag( 'h3', 'Exercise room' )
            + vorple.html.p( "Nothing you do in "
            + vorple.html.link( './weightlessness', 'weightlessness', { "class": 'once unique' } )
            + " really requires any strength, so the crew of "
            + vorple.html.link( './magellan', 'the Magellan', { "class": 'once' } )
            + " use the "
            + vorple.html.link( './equipment', 'exercise equipment', { "class": 'once unique' } )
            + " to keep their muscles from deteriorating. In addition to all "
            + "the gym gadgets there's a full-body "
            + vorple.html.link( './mirror', 'mirror', { "class": 'once' } )
            + ". The exit leads back to the "
            + vorple.html.link( 'hallway', 'hallway' ) + "." )
            + vorple.html.p( "Kevin's "
            + vorple.html.link( './jacket', 'jacket', { "class": 'once' } )
            + " is floating around the room. "
            + cardSticking )
        );
    },
    act: function( character, system, action ) {
        switch( action ) {
        case "weightlessness": 
            system.write( undum.game.situations.intro.actions.weightlessness );
            break;
        case "magellan": 
            system.write( undum.game.situations.intro.actions.magellan );
            break;
        case "epsilon":
            system.write( undum.game.situations.intro.actions.epsilon );
        case "equipment": 
            system.write( 
                vorple.html.p( "I have to train as well. Twice as much "
                    + "as the others. I use the standard equipment and the "
                    + vorple.html.link( './trainer', 'walking trainer', { "class": 'once' } )
                    + ". People living on Earth are lucky enough to have gravity "
                    + "train their muscles automatically. I need to exercise "
                    + "actively to get any kind of muscle mass." )
                    + vorple.html.p( "It's of not much use, though. There is no "
                    + "training equipment for the " 
                    + vorple.html.link( './heart', 'heart', { "class": 'once' } )
                    + " muscle." 
                )
            );
            break;
        case "trainer": 
            system.write(
                vorple.html.p( "I have never learned to walk the natural "
                    + "way. Or even actually "+vorple.html.tag( "em", "walked" ) 
            		+ ". There's no need for it aboard "
                    + vorple.html.link( './magellan', 'the Magellan', { "class": 'once' } ),
            		+ ". You just float to wherever you want to go." )
            		+ vorple.html.p( "The walking trainer is a treadmill that has "
        	        + "a harness attached to vertical bars with elastic exercise "
        	        + "bands. The bands pull you towards the treadmill, simulating " 
            		+ "gravity. Mom made me practice every day when I was younger. "
            		+ "If I can never go to Earth anyway, why bother?" 
        		)
    		);
            break;
        case "heart": 
            system.write(
                vorple.html.p( "On Earth your heart has to fight against "
                    + "the gravity to keep blood flowing inside your body. In "
                    + "space it doesn't need to work nearly as hard. "
                    + "If you grow up in "
                    + vorple.html.link( './weightlessness', 'weightlessness', { "class": 'once unique' } ) 
                    + " the heart doesn't get the exercise and never grows "
                    + "very strong." )
                    + vorple.html.p( "They say my heart would fail if I ever went "
                    + "to Earth, but they are wrong. My heart will break if I "
                    + "never get home." 
                )
            );
            break;
        case "mirror": 
            var str = vorple.html.p( "The mirror is used to teach me how " 
            	+ "to walk properly. They make me look at myself while I "
            	+ "fumble on the treadmill." );
            
            if( character.sandbox.items.passportCarried ) {
                str += vorple.html.p( "Now that I look at myself, I " 
                	+ vorple.html.tag( "em", "do" ) + " look a lot like Kevin." );
            }
            
            system.write( str );
            break;
        case "jacket": 
            system.write(
                vorple.html.p( "Kevin wanted to try the exercise "
                    + "equipment and took the jacket off. It's an Earth jacket " 
                    + "and doesn't have the magnetic strips that would keep it "
                    + "in place, so it's floating freely around the room." 
                )
            );
            break;
        case "card": 
            character.sandbox.items.passportCarried = true;
            system.write( 
                vorple.html.p( "Looks like the card is Kevin's "
                    + "passport. It has a picture of him and his personal "
                    + "information on it." )
                    + vorple.html.p( "They say I and Kevin look very much "
            		+ "alike. Maybe there's something to it." )
                    + vorple.html.p( "I pull the card out from the pocket and "
                    + "take it with me." 
                ) 
            );
            break;
        }
    }
});

undum.game.situations.dockingstation = new undum.SimpleSituation(
    vorple.html.tag( 'h3', 'Docking station' )
    + vorple.html.p( "The "
    + vorple.html.link( './people', 'people', { "class": 'once' } )
    + " who inhabit the "
    + vorple.html.link( './foucault', 'space station', { "class": 'once' } )
    + " pass me by as they go about their daily chores. The "
    + vorple.html.link( 'shuttleport', 'shuttle port', { "class": 'once' } )
    + " is near the docking port that connects the "
    + vorple.html.link( 'hallway', 'hallway', { "class": 'once' } )
    + " to the space station. I could also go to the "
    + vorple.html.link( 'observatory', 'observatory', { "class": 'once' } )
    + "." ),
    {
        actions: {
            people: vorple.html.p( "Never before have I met a person I "
                + "wouldn't have known for my entire life. Returning to Earth "
                + "and meeting these new people was hard&mdash;I haven't had "
                + "any practice for such situations. I still find myself "
                + "shying away from social interaction with strangers." ),
            foucault: vorple.html.p( "The Foucault Space Station is the "
                + "largest of Earth-orbiting space stations. The Magellan has "
                + "been docked into it since we returned two weeks ago." )
        }
    }
);

undum.game.situations.observatory = new undum.SimpleSituation(
    vorple.html.tag( 'h3', 'Observatory' )
    + vorple.html.p( "Ever since we returned and docked to the "
    + vorple.html.link( './foucault', 'space station', { "class": 'once' } )
    + " this has been the place I've spent most of my time. A round "
    + vorple.html.link( './window', 'window', { "class": 'once' } )
    + " several meters wide shows a magnificent view of "
    + vorple.html.link( './earth', 'the Earth', { "class": 'once' } )
    + " as the station revolves around it." )
    + vorple.html.p( "The exit leads to the "
    + vorple.html.link( 'dockingstation', 'docking station' )
    + "." ),
    {
        actions: {
            foucault: undum.game.situations.dockingstation.actions.foucault,
            window: vorple.html.p( "There are "
                + vorple.html.link( './people', 'people', { "class": 'once' } )
                + " everywhere in the space station but they barely even "
                + "glance at the Earth as they go by. I've seen people on "
                + "their first visit up here to spend a few minutes looking at "
                + "it, but the regular staff doesn't even come here unless "
                + "they have to pass by to get to somewhere else. Do they "
                + "really not see its beauty? Or is it possible for it to lose "
                + "its wonderfulness over time? I find the idea impossible to "
                + "grasp."),
            earth: vorple.html.p( "The Earth. The shadow of the Sun is "
                + "passing by Europe and Africa. Clouds are gathering over "
                + "Asia, the Indian Ocean glitters in blue. It is an "
                + "awe-inspiring view, one that reveals new details every time "
                + "you look at it." )
                + vorple.html.p( "It's a completely different world on the "
                + "ground, of course. I've seen enough movies and videos to "
        		+ "know that. If looking at it from a thousand kilometers away "
        		+ "is like this, what would it be like on the ground?" )
        }
    }
);

undum.game.situations.shuttleport = new undum.SimpleSituation(
    vorple.html.tag( "h3", "Shuttle port" )
    + vorple.html.p( "I remember dad telling how complicated shuttle travel "
    + "used to be before they left Earth. You'd have to go through several "
    + "stages of health and security checks to make sure nothing goes wrong. "
    + "Now shuttle travel is so common all you need is to buy a ticket with "
    + "your passport and you're all set." )
    + vorple.html.p( "A corridor leads back to the "
    + vorple.html.link( 'dockingstation', 'docking station' )
    + " and a closed "
    + vorple.html.link( './airlock', 'airlock', { "class": 'once unique' } )
    + " leads inside the waiting area. There's a "
    + vorple.html.link( './ticketmachine', 'ticket machine', { "class": 'once' } )
    + " next to the airlock." ),
    {
        actions: {
            airlock: function( character, system, action ) {
                if( !character.sandbox.items.ticketBought ) {
                    system.write( vorple.html.p( 
                        "I need a ticket to enter the waiting area." 
                    ) );
                }
                else {
                	// move to the end scene
                	system.doLink( 'end' );
                }
            },
            ticketmachine: function( character, system, action ) {
                if( character.sandbox.items.ticketBought ) {
                    system.write( vorple.html.p( "I already have a ticket." ) );
                }
                else if( !character.sandbox.items.passportCarried ) {
                    system.write( vorple.html.p( "The ticket machine sells tickets "
                        + "to shuttles back to Earth. You need a passport to "
                        + "buy one." )
                        + vorple.html.p( "I have never had a passport, and I "
                        + "will never get one. Since I can't go to Earth "
                        + "there's no need to have one." ) );
                }
                else {
                    system.write( vorple.html.p( "The ticket machine sells tickets to "
                        + "shuttles back to Earth. There's a "
                        + vorple.html.link( './slot', 'slot', { "class": 'once' } )
                        + " where you insert your passport and it deducts the "
                        + "price from your account and uploads the ticket "
                        + "information into the card." ) );
                }
            },
            slot: function( character, system, action ) {
                character.sandbox.items.ticketBought = true;
                system.write( vorple.html.p( "I push the passport into the slot. "
                    + "The display indicates the purchase was successful and "
                    + "the machine pushes the card back out again and I take it." )
                    + vorple.html.p( "I could now open the "
                    + vorple.html.link( './airlock', 'airlock', { "class": 'once unique' } )
                    + " and enter the waiting area. My hands start shaking and "
                    + "sweating." ) );
            }
        }
    }
);

undum.game.situations.end = new undum.Situation({ 
    enter: function( character, system, from, to ) {
        system.write( vorple.html.p( "The airlock opens and I go through. "
            + "I try to look as neutral as possible as the machines "
            + "scan Kevin's passport. They let me through." )
            + vorple.html.tag( 'hr' )
            + vorple.html.p( "The shuttle takes off and starts its "
            + "descent. Soon I feel something I've never experienced "
            + "before: gravity pulling me downwards to my seat." )
            + vorple.html.p( "My heart is beating fast. I don't know "
            + "if it's the excitement or if something is wrong. "
            + "I start to feel increasing discomfort. The shuttle "
            + "touches ground and I almost pass out." )
            + vorple.html.p( "I manage to stumble out of the shuttle "
            + "into the open air&mdash;and a wonderful, magnificent "
            + "view of the Earth opens before me. It is everything I "
            + "could have hoped for and more. A breath of air caresses "
            + "my being and the Sun's warmth feels so soft. Actual "
            + "atmosphere is so much gentler than Magellan's "
            + "artificial environment." )
            + vorple.html.p( 
                vorple.html.quote( 
                    "Is everything allright, young man?"
                )
            + " I hear someone ask. "
            + vorple.html.quote( "Yes," )
            + " I manage to whisper. It's hard to speak when you have "
            + "to fight the pull of gravity with all the strength you "
            + "have." )
            + vorple.html.p( "A woman behind me catches me as I fall. "
            + "She sounds hysterical, she's calling for the medical "
            + "personnel. I see her face and the blue sky behind her." )
            + vorple.html.tag( 'hr' )
            + vorple.html.p( "My vision fades but I can still hear "
            + "the people around me. They are saying that my heart is "
            + "failing, but they are wrong. I have never felt more "
            + "alive. I am home." )
            + vorple.media.image( 
                'starborn.png', 
                { 
                    alt: "STARBORN",
                    id: 'endlogo'
                } 
            )
        );
        
        vorple.media.playMusic({ mp3: "light_touches.mp3", oga: "light_touches.ogg" });
        
        mapButtonGroup.disable();
    }
});


/* Defining the first situation */
undum.game.start = "intro";


var MapTile = function( content, onclick, options ) {
	this.status = 'hidden';

	this.init( content, onclick, options );
};
MapTile.inherits( vorple.button.Image );

MapTile.prototype.updateStatus = function( newStatus ) {
	this.status = newStatus;
	
	this.url = 'media/image/map/tile_'+this.status+'.png';
	$( '.'+this.idClass ).attr( 'src', this.url );
};

var defaultImage = 'map/tile_unvisited.png'; 
var map = {
	myroom: new MapTile( 
			'map/tile_current.png', 
			'myroom', 
			{ 
				style: 'left:40px; top:20px;',
				title: 'My room'
			} 
		),	
	hallway: new MapTile( 
			defaultImage, 
			'hallway', 
			{ 
				style: 'left:75px; top:80px;',
				title: 'Hallway'
			} 
		),	
	exerciseroom: new MapTile( 
			defaultImage, 
			'exerciseroom', 
			{ 
				style: 'left:120px; top:40px;',
				title: 'Exercise room'
			} 
		),
	dockingstation: new MapTile(
			defaultImage,
			'dockingstation',
			{ 
				style: 'left:75px; top:172px;',
				title: 'Docking station'
			}
		),
	observatory: new MapTile(
			defaultImage,
			'observatory',
			{
				style: 'left:133px; top:270px;',
				title: 'Observatory'
			}
		),
	shuttleport: new MapTile(
			defaultImage,
			'shuttleport',
			{ 
				style: 'left:0px; top:220px;',
				title: 'Shuttle port'
			}
		)
};


/**
 * The updateButtons() function makes sure the action buttons on the right
 * pane are kept up to date. The function is called in undum.game.afterAction()
 * and undum.game.afterEnter().  
 */
function updateButtons( previousRoom, currentRoom ) {
	// don't do anything except clear the buttons if we're at the end scene
	if( currentRoom === 'end' ) {
		actionButtonGroup.update([]);
		return;
	}
	
    var activeButtons = [];
    var connections = [];

    // because intro and myroom are the same situation
    // (in practice) we'll have intro behave as if it were 
    // the myroom situation
    if( previousRoom == 'intro' ) {
    	previousRoom = 'myroom';
    }
    
    if( currentRoom == 'intro' ) {
    	currentRoom = 'myroom';
    }

    var visibleButtons = [];

    // find each link inside the story content
    $( '#content a' ).each( function( index, link ) {
    	var $this = $( link ); 

    	// use the link's content as the name
        var name = $this.text();
        var href = $this.attr( 'href' );

    	// show the action links in the right hand pane.
    	// We can recognize them from them containing a / character.
    	if( href.indexOf( "/" ) > -1 ) {
    		if( $.inArray( href, visibleButtons ) === -1 ) {
    			activeButtons.push( new vorple.button.Link( name, href ) );
    			visibleButtons.push( href );
    		}
    	}
    	else {
    	    // build the map from the situation links
    		if( !mapButtonGroup.contains( map[ href ] ) ) {
    			mapButtonGroup.add( map[ href ] );
    		}
    		
   			map[ href ].enable();
    	}
    });
    
    actionButtonGroup.update( activeButtons );

    if( previousRoom && previousRoom in map ) {
    	map[ previousRoom ].updateStatus( 'visited' );
    	map[ previousRoom ].enable();
    }

    map[ currentRoom ].updateStatus( 'current' );
    map[ currentRoom ].disable();
}

// tooltips that show which room each map tile represents
vorple.tooltip.enable( '#map img', { position: { type: 'fixed', my: 'bottom center', at: 'top center' } } );

undum.game.afterAction = function( character, system, situation, action ) {
    vorple.undum.afterActionTrigger( character, system, situation, action );
    updateButtons( null, situation );
    ifRecorder.undum.send( action );
};

undum.game.afterEnter = function( character, system, from, to ) {
    vorple.undum.afterEnterTrigger( character, system, from, to );
    updateButtons( from, to );
    ifRecorder.undum.send( to );
};

undum.game.enter = function( character, system, from, to ) {
    ifRecorder.undum.prepare( to );
};

undum.game.beforeAction = function( character, system, situation, action ) {
    ifRecorder.undum.prepare( action );
};

var actionButtonGroup;
var mapButtonGroup;

/* Initializing variables */
undum.game.init = function( character, system ) {
	actionButtonGroup = new vorple.button.Group( null, $( '#actionButtons' ) );
	mapButtonGroup = new vorple.button.Group( [ map.myroom, map.hallway ], $( '#map' ) );

	character.sandbox.items = {
        passportCarried: false,
        ticketBought: false
    };
    
    // All links are disposable...
    vorple.undum.settings.allDisposable = true;
    
    // ..except situations and a couple other exceptions.
    // Instead of listing situations by hand, we can
    // loop through each situation and automatically add them 
    // to the exceptions list.
    $.each( undum.game.situations, function( name, content ) {
        vorple.undum.settings.disposableExceptions.push( name );
    });
    
    // The other exceptions.
    vorple.undum.settings.disposableExceptions.push( 'mirror' );
    vorple.undum.settings.disposableExceptions.push( 'ticketmachine' );
    vorple.undum.settings.disposableExceptions.push( 'airlock' );
    
    // initialize Vorple
    vorple.core.init( system );

    // change the mute button's graphics if the story starts with 
    // sounds muted and preload the opposite image
    if( vorple.media.isMuted( 'music' ) ) {
		$( '#mute-button' ).attr( 'src', 'css/images/sound-off.png' ); 
	    vorple.media.preloadImage( './css/images/sound-on.png' );
    }
    else {
        vorple.media.preloadImage( './css/images/sound-off.png' );
    }

    // have the mute button toggle music and change its graphics when it does so
    $( '#mute-button' ).on( 'click', function() {
    	var muted = vorple.media.toggleMute( 'music' );
    	if( muted ) {
    		$( '#mute-button' ).attr( 'src', 'css/images/sound-off.png' ); 
    	}
    	else {
    		$( '#mute-button' ).attr( 'src', 'css/images/sound-on.png' ); 		
    	}
    });
    
    // start playing the intro music
    vorple.media.playMusic({ mp3: "slow_rotations.mp3", oga: "slow_rotations.ogg" });
    
    // display "how to play" popups
    vorple.tooltip.show(
    		'#map',
    		'Click on the map to move around',
    		{ 
    			delay: 8000,
    			position: {
    				my: 'bottom center',
    				at: 'top center'
    			}
			}
    );
    
    vorple.tooltip.show(
    		'#actionButtons',
    		'Click on the keywords to advance the story',
    		{
    			position: {
    				my: 'bottom center',
    				at: 'top center'
    			}
			}
    );
    
    // preload the finale picture
    vorple.media.preloadImage( 'starborn.png' );

    // initialize the transcript recorder
    ifRecorder.initialize( '../tools/server/save-sql.php' );
};
