"The not quite stereo" by Zoltan Nagy

[
Feedback:
	Release 1:
		Kepten:
			https://gist.github.com/abesto/759b614c55a9de19f6c642609fe43eeb
		Zsol:
			https://gist.github.com/zsol/b9eaf92c21417ee7bec98e4ed76ba3ca
	Release 2:
		Zsol: 
			https://gist.github.com/zsol/1751fda2f4aee68308edba299f304daf

		
Want in:
	Karesz
	
TODO:
	Must have:
		After tutorial:
			Add splitter
			Two RCA jacks of the same cable can't go into the same thing :/
	Nice to have:
		time-based song switching. skip song?
		Explain the puzzle in "amusing"
]

The release number is 3.
The story headline is "A story of the Chaos of Cables".
The story creation year is 2016.

Include Plugs and Sockets by Sean Turner.
Include Smarter Parser by Aaron Reed.
Include Commonly Unimplemented by Aaron Reed.
Include Numbered Disambiguation Choices by Aaron Reed.

Chapter 1 - Prodecure

Use American dialect and the serial comma.

Section 1 - Jacks and sockets

An HDMI socket is a kind of PS-socket. The PS-type of an HDMI socket is "HDMI".
An HDMI plug is a kind of PS-plug. The PS-type of an HDMI plug is "HDMI".

A jack socket is a kind of PS-socket. The PS-type of a jack socket is "jack".
A jack plug is a kind of PS-plug. The PS-type of a jack plug is "jack".

An RCA socket is a kind of PS-socket. The PS-type of an RCA socket is "RCA".
An RCA plug is a kind of PS-plug. The PS-type of an RCA plug is "RCA".

An HD15 socket is a kind of PS-socket. The PS-type of an HD15 socket is "HD15".
An HD15 plug is a kind of PS-plug. The PS-type of an HD15 plug is "HD15".

Section 2 - Signal propagation

[
This section defines a simplistic algorithm for tracking audio signals through the system.
It makes the assumption that if we ask about something what level of signal it receives, then
signals only ever travel _towards_ it in the whole system. If that's not the case, then we'll
get inconsistent results.
]

[ Channels ]
A channel is a kind of value. Left channel and right channel are channels.

[ Connectors can be faulty ]
A PS-connector is either left-faulty, right-faulty, both-faulty, or not faulty. A PS-connector is usually not faulty.
To decide if (connector - a PS-connector) is faulty on (channel - a channel):
	if connector is both-faulty:
		yes;
	if connector is left-faulty and channel is left channel:
		yes;
	if connector is right-faulty and channel is right channel:
		yes;
	no.
	
To decide if (connector - a PS-connector) is not faulty on (channel - a channel):
	if connector is faulty on channel:
		no;
	else:
		yes.
	
[ Sometimes things are hard-wired to each other ]
Hard-wired relates things to each other. The verb to be hard-wired to means the hard-wired relation.

[ Debugging ]
conn-tracing is a truth state that varies. conn-tracing is false.

[ Basic signal passing rules ]
To decide what list of things is the things signaling (target - a thing) on (channel - a channel):
	let origins be a list of things;
	[ Hard-wired ]
	repeat with origin running through the things which are hard-wired to target:
		if conn-tracing is true, say "(Hard-wired: [origin] -> [target]) ";
		add origin to origins;
	[ Connected via plugs ]
	repeat with connector-one running through the PS-connectors which are part of the target:
		let connector-two be the attachment of connector-one;
		if connector-two is not nothing:
			let origin be the holder of connector-two;
			unless connector-one is faulty on channel, or connector-two is faulty on channel:
				if conn-tracing is true, say "(Connection: [origin] -> [connector-two] -> [connector-one] -> [target]) ";
				add origin to origins;
	decide on origins.

[ Helper around the signal passing rules ]		
To decide if (origin - a thing) signals (target - a thing) on (channel - a channel):
	let L be the things signaling target on channel;
	if origin is listed in L:
		yes;
	otherwise:
		no.

[ Signal level calculation along passed signal paths ]
To decide what number is the signal level (origin - a thing) propagates to (target - a thing) on (channel - a channel):
	if conn-tracing is true, say "[origin] -> [target]: ";
	unless origin signals target on channel:
		if conn-tracing is true, say "might not.";
		decide on 0;	
	let level be 0;
	repeat with loop running through the things signaling origin on channel:
		if conn-tracing is true, say "via [loop] ";
		if loop is not target:
			if conn-tracing is true, say "[the signal level loop propagates to origin on channel] ";
			increase the level by the signal level loop propagates to origin on channel;
		otherwise:
			if conn-tracing is true, say "0 because target ";
	if conn-tracing is true, say "finally [level].";
	decide on level.
	
To decide what number is the inbound signal level of (component - a thing) on (channel - a channel):
	let level be 0;
	repeat with loop running through the things signaling component on channel:
		increase level by the signal level loop propagates to component	on channel;
	decide on level.
	
[ Signal producers ]
A signal producer is a kind of thing. It has a number called the signal level.

To decide what number is the signal level (producer - a signal producer) propagates to (target - a thing) on (channel - a channel):
	if conn-tracing is true, say "producer [producer] -> target [target] on [channel]: ";
	if the producer signals the target on channel:
		if conn-tracing is true, say "[signal level of the producer].";
		decide on the signal level of the producer;
	if conn-tracing is true, say "might not.";
	decide on 0.
	
[ Switches generate signals for the first connected output they have (from a fixed list), and none for the others ]
A switch is a kind of thing. It has a list of things called the priority output list.

To decide what thing is the first connected component of (switch - a switch) on (channel - a channel):
	repeat with candidate running through the priority output list of the switch:
		if switch is hard-wired to candidate:
			decide on candidate;
		if candidate is socket-occupied, and candidate is not faulty on channel:
			decide on the holder of the attachment of the candidate.

To decide if (switch - a switch) signals (target - a thing) on (channel - a channel):
	let first-component be the first connected component of switch on channel;
	if target is first-component:
		yes;
	else:
		no.

Section 3 - Introspect signal propagation - Not for release

Measuring is an action applying to a thing.
Understand "measure [thing]" as measuring.
Carry out measuring a thing (called t):
	say "Inbound left: [inbound signal level of t on left channel][line break]Inbound right: [inbound signal level of t on right channel]."
	
Measuring it to is an action applying to two things.
Understand "measure [thing] to [thing]" as measuring it to.
Carry out measuring something (called a) to something (called b):
	say "Left: [signal level a propagates to b on left channel][line break]Right: [signal level a propagates to b on right channel]."
	
Section 4 - Speakers

A speaker is a kind of thing. A speaker is either channel-based or channel-agnostic. A speaker has a channel. A speaker is either enabled or disabled. A speaker is usually enabled.

To decide what number is the output level of (S - a speaker):
	if S is disabled:
		decide on 0;
	if S is channel-based:
		decide on the inbound signal level of S on the channel of S;
	otherwise:
		let L be the inbound signal level of S on the left channel;
		let R be the inbound signal level of S on the right channel;
		if L is greater than R:
			decide on L;
		otherwise:
			decide on R.

Instead of listening to a speaker (called S):
	let L be the output level of S;
	if L is 0:
		say "[The S] is mute.[run paragraph on] ";
	otherwise if 1 is greater than L:
		say "[The S] is hard to hear; there is sound coming out, but very quietly.[run paragraph on] ";
	otherwise if L is 1:
		say "[The S] is producing a clean, crisp sound.[run paragraph on] ";
	otherwise:
		say "[The S] is overly loud and distorted.[run paragraph on] "
	
Section 5 - Pre-release notes

When play begins:
	say "This is a not-even-alpha version of a game about cables and music. If you encounter frustration or confusion, this is not (yet) intended; please let me know.[line break]If you're playing this in an interpreter (not in-browser), please type 'transcript on' to create a recording of your session to be used for debugging any problems. Otherwise, please copy-paste the session into an e-mail. In either case, please send to abesto0@gmail.com, along with any feedback.[line break]If you get stuck, you can type 'hint' to get a hint. The first one is free: you can type 'hint' multiple times for increasingly spoilery hints.[paragraph break]";
	say "A note on talking to the game: due to limitations of the engine, some phrasings will work better for plugging things in than others. For best results, plug cables into objects (like 'plug HDMI cable into monitor'), or into specific sockets (like 'plug jack cable into headphone out')."


Chapter 2 - The Game

Section 1 - A few decisions

To decide if HDMI is connected:
	if the gray HDMI cable is inserted into the MacBook, and the gray HDMI cable is inserted into the Dell monitor:
		yes;
	otherwise:
		no.

Section 2 - Tutorial

Tutorial is a scene. Tutorial begins when play begins.

Your Room is a room. "[if unvisited]Getting a proper speaker setup has been on your bucket list for a while now. This is not a purchase one makes lightly - it should provide you with quality entertainment for years to come. After researching your options and getting opinions from co-workers, you've now finally hauled the big box of sound home. You've just finished unpacking the speakers: the left and right satellite speakers are looking at you anxiously from the corners of the desk, and the subwoofer is firmly on the ground, already plugged into the power strip. You have the manual. You have the cables. It's time to get wiring.[else]It's the same room you've been living in for the last year or so. Right now, you're focused on a tiny corner of it: the part with a white table and a stereo system to set up.[end if]".

Here is a white desk. The white desk is scenery. Description of the white desk is "The previous tenants left this here; it's been holding up all your computery stuff ever since."

[ MacBook ]
A MacBook is on the desk. "Your trusty MacBook sits patiently on the desk, with Spotify open, playing your weekly Discover playlist."
The description is "This model has both an hour and a stereo audio (small jack) output. A glance at the screen confirms Spotify is still playing."

[ Producing signals from the MacBook ]
The audio card is a signal producer with signal level 1.
The MacBook is a switch. It is hard-wired to the audio card.

The MacBook incorporates an HDMI socket called HDMI out.
The MacBook incorporates a jack socket called stereo out.

[ MacBook speakers ]
The built-in speaker is a channel-agnostic speaker. It is part of the MacBook. It is hard-wired to the MacBook.

BlueTooth audio adapter is a thing. [ Needs to be here for the below list, rest of the definition in Debugging ]
The priority output list of the MacBook is {stereo out, HDMI out, BlueTooth audio adapter, built-in speaker}.

[ Left speaker ]
The left speaker is a channel-based speaker. The channel of the left speaker is the left channel. It is on the desk. Indefinite article is "the". The description is "It has a white THX logo on top. There's an RCA cable hard-wired into its back."
The left speaker RCA cable is a thing. It is part of the left speaker. It is hard-wired to the left speaker. It incorporates an RCA plug.

[ Right speaker ]
The right speaker is a channel-based speaker with channel right channel. It is on the desk. Indefinite article is "the". The description is "It has a white THX logo on top. Two jack sockets are built into its side. There's  a tiny headphone pictogram above the top one, and a (similarly tiny) music note icon below the bottom one. There's an HD15 D-Sub cable hard-wired into its back. It looks just the same as a VGA cable, but the innards are quite different."
The right speaker incorporates a jack socket called headphone out.
The right speaker incorporates a jack socket called media in.
The right speaker HD15 cable is part of the right speaker. It incorporates an HD15 plug called the hd15-plug. It is hard-wired to the right speaker.

[ This would ideally be implemented by the right speaker being a switch. Failed miserably, cheating. ]
Definition: the right speaker is disabled if headphone out is socket-occupied.
Definition: the left speaker is disabled if headphone out is socket-occupied.
Definition: the subwoofer is disabled if headphone out is socket-occupied.
Check plugging something into the headphone out:
	unless the noun is the headphones cable:
		say "Only the headphones cable should be plugged into the headphone out socket." instead.

[ Monitor ]
A Dell monitor is on the desk.
The description is "You always mean to get a bigger one, but one step at a time - for now, let's set up the stereo.
[if HDMI is connected]The display mirrors the display of your MacBook, with a maximized Spotify window.[otherwise]The display has a 'No Input' message moving around on it.[end if] On the back of the screen there's an HDMI input, and a small jack (output) socket. They're kind of hard to reach, but by now you can plug cables into them by touch."
The monitor incorporates an HDMI socket.
The monitor incorporates a jack socket called monitor stereo out.

[ Subwoofer ]
The floor is here. It is scenery.
There is a subwoofer is a channel-agnostic speaker. It is on the floor. The description is "The central part of your brand-new 2.1 stereo system. A moderately sized speaker is staring you in the face from the front. Looking at it, you feel you won't ever turn the volume all the way up - the neighbors would go crazy, not to mention permanent hearing damage.[line break]On the back there are a bunch of sockets. The white and red RCA sockets on top have the label 'AUX'. Below them is a green jack socket with the pictogram of a little musical note next to it. Below that sits a large, vertical HD15 socket labeled 'Right speaker', and finally an RCA socket with 'Left speaker' written next to it."
It incorporates an RCA socket called white RCA socket. Instead of examining the white RCA socket, say "A female RCA connector on the subwoofer. The plastic rim of the socket is white. It's labelled 'AUX'. [They] [have] [if the attachment of the noun is nothing]nothing[else][the holder of the attachment of the noun][end if] plugged into it."
It incorporates an RCA socket called red RCA socket. Instead of examining the red RCA socket, say "A female RCA connector on the subwoofer. The plastic rim of the socket is red. It's labelled 'AUX'. [They] [have] [if the attachment of the noun is nothing]nothing[else][the holder of the attachment of the noun][end if] plugged into it."
It incorporates a jack socket called green jack socket. Instead of examining the green jack socket, say "A femal jack connector on the subwoofer. The rim of the socket is green. The pictogram of a musical note is next to it on the plastic cover. [They] [have] [if the attachment of the noun is nothing]nothing[else][the holder of the attachment of the noun][end if] plugged into it."
It incorporates an HD15 socket. Instead of examining the HD15 socket, say "A female HD15 connector. Looks a lot like a VGA connector, but is very different on the inside. The words 'Right speaker' are printed in white next to it in white. [They] [have] [if the attachment of the noun is nothing]nothing[else][the holder of the attachment of the noun][end if] plugged into it."
It incorporates an RCA socket called bottom RCA socket. Instead of examining the bottom RCA socket, say "A female RCA connector on the subwoofer. The plastic rim of the socket is black. The words 'Left speaker' are printed next to it in white. [They] [have] [if the attachment of the noun is nothing]nothing[else][the holder of the attachment of the noun][end if] plugged into it."

[ Cables ]
Here is a gray HDMI cable. It incorporates two HDMI plugs.
Here is a jack cable. It incorporates two jack plugs.

[ Mono sockets ]
Bottom RCA socket is right-faulty.
[ White RCA socket is right-faulty. -- Except it's totally dead, see below. ]
Red RCA socket is left-faulty.

[ This is the problem the player will debug later on ]
Green jack socket is right-faulty.
White RCA socket is both-faulty.

[ The manual ]
The manual is on the desk.

Instead of examining the manual, say "A five-page pamphlet with lots of tiny letters. The only part that looks interesting is about how to wire up the stereo. There's a section detailing a desktop setup - surprisingly helpful.[paragraph break]1. Plug the RCA cable coming out the back of the left satellite speaker into the bottom RCA socket on the subwoofer, labelled 'left speaker'.[line break]2. Connect the HD15 cable coming out the back of the right satellite speaker to the subwoofer.[line break]3. Connect your laptop or desktop computer to your display via HDMI.[line break]4. Plug one end the provided jack-jack audio cable into the stereo output of your display.[line break]5. Plug the other end of the jack-jack audio cable into the jack socket on the subwoofer."

[ Disable stuff for the duration of the tutorial ]
Instead of plugging a thing into the right speaker (this is the don't-plug-into-speaker rule):
	if tutorial is happening:
		say "That doesn't sound right. Maybe you should read the manual." instead.
Check plugging something (called P) into the something (called S) (this is the don't-plug-jack-into-laptop rule):
	if tutorial is happening and P is the jack cable, and S is the MacBook:
		say "That doesn't sound right. Maybe you should read the manual." instead.	
		
[ Hints ]
Asking for help is an action out of world. Understand "help", "hint", "hints" as asking for help.
Carry out asking for help for the first time: say "This is an interactive fiction game. You control your avatar by typing commands like 'look', 'look at laptop', 'examine hdmi cable', and 'plug jack cable into bottom RCA socket' (not something that will work, this last one). Your goal is wire up all the equipment in the room to get a working sound system."
Carry out asking for help for the second time: say "Remember how you have a manual? How about reading it? Maybe it'll give you some hints."
Carry out asking for help for the third time: say "I'm out of hints; the next time you ask for help, I'll just give you the solution. Seriously. So be careful what you ask for!"
Carry out asking for help at least four times: say "Alright, here goes.[line break]plug left speaker into bottom RCA socket[line break]plug right speaker into subwoofer[line break]plug HDMI cable into laptop[line break]plug HDMI cable into monitor[line break]plug jack cable into monitor[line break]plug jack cable into subwoofer".
		
test plug-all with "plug left speaker RCA cable into bottom RCA socket / plug right speaker cable into subwoofer / plug hdmi cable into laptop / plug hdmi cable into screen / plug jack cable into screen / plug jack cable into subwoofer".
		
Section 3 - Debugging - the actual puzzle

Storage room is a room. [ Used to keep items until we move them into the playroom ]

[ BT adapter ]
The BlueTooth audio adapter is in the storage room.
The description of the BlueTooth audio adapter is "A tiny box you can use to play music without having to plug cables into your laptop. You can either 'connect bluetooth' or 'disconnect blootooth'. It has a jack output."
The BlueTooth adapter incorporates a jack socket.

Connecting BlueTooth is an action applying to nothing. Understand "connect bluetooth" as connecting bluetooth.
Carry out connecting bluetooth:
	now the BlueTooth audio adapter is hard-wired 	to the MacBook.
	
Disconnecting BlueTooth is an action applying to nothing. Understand "disconnect bluetooth" as disconnecting bluetooth.
Carry out disconnecting bluetooth:
	now the BlueTooth audio adapter is not hard-wired to the MacBook.

[ Headphones ]
The headphones are in the storage room. The headphones are wearable.
The left headphone speaker is a channel-based speaker with channel the left channel. It is part of the headphones. It is hard-wired to the headphones.
The right headphone speaker is a channel-based speaker with channel the right channel. It is part of the headphones. It is hard-wired to the headphones.

The cable of the headphones is a thing. It incorporates a jack plug. It is part of the headphones. It is hard-wired to the headphones.

Debugging is a scene. Tutorial ends when debugging begins.
Debugging begins when the output level of the subwoofer is 1, and the output level of the left speaker is 1, and the output level of the right speaker is 0.

[ RCA cable ]
The RCA-jack cable is in the storage room.
The red RCA end of the RCA-jack cable is an RCA plug. It is part of the RCA-jack cable.
The white RCA end of the RCA-jack cable is an RCA plug. It is part of the RCA-jack cable.
The RCA-jack cable incorporates a jack plug.

When Debugging begins:
	say "It's done.[line break]You've connected all the wires, the system is alive. Clean, strong bass is pumping out the subwoofer, and the speakers on the desk give you the best listening of Korn you've had in a while. You sit back, close your eyes...[paragraph break]Then you turn your head to the left a bit, then to the right... Something's not right. It's like the stereo is not stereo after all. Only one speaker is blasting Korn, the other is just sitting there quietly. How can this be? It's a brand new system![paragraph break]Alright, don't panic. You can do this. There must be a way to connect up things in a way that both speakers work. The manual obviously didn't work, so let's ignore that from now on. There are a lot of things that may be going wrong. It could be any cable. Maybe the display? You remember the guy you bought it from saying something was wrong with it. Or maybe the MacBook gave up in the end. It could be anything![paragraph break]You bring out a few more items from storage to help figure out what's wrong.";
	now the headphones are in your room;
	now the bluetooth audio adapter is in your room;
	now the RCA-jack cable is in your room.
		
Section 4 - Ambience

Spotify is scenery. It is in your room. The description is "Way more convinient than having to buy and switch CDs all the time, or maintaining a music collection manually. It even tells you what music to like based on data, magic, and maybe some guesswork. There may be a moral in here about how machine learning is making humans lazier, but who has time to think about that when you have cables to connect. It's playing your Discover Weekly playlist. Black Stone Cherry, Godsmack, Nine Lashes, Rise Against - the good stuff."

Report plugging the HDMI cable into something (this is the plugging-hdmi-cable rule):
	if HDMI is connected:
		say "The screen of your laptop goes black. After a few seconds the display comes back to life, along with the external Dell monitor, which is now mirroring the display of the MacBook."
		
The plugging-hdmi-cable rule is listed after the report-plugging it into rule in the report plugging it into rules.


Section 5 - Listening
		
Every turn:
	if the player is wearing the headphones:
		try listening to the left headphone speaker;
		try listening to the right headphone speaker;
		say "The headphones block out any outher sound.";
	otherwise:
		try listening to the built-in speaker;
		try listening to the subwoofer;
		try listening to the left speaker;
		try listening to the right speaker;
		say "[paragraph break]".
				
Section 6 - Glossary

Understand "satellite" as speaker.
Understand "jack out" as stereo out.
Understand "top jack socket" or "top stereo output" or "top stereo jacket" as headphone out.
Understand "laptop" as MacBook.
Understand "screen" or "display" as monitor.
Understand "table" as desk.
Understand "BT" as BlueTooth.
Understand "music receiver" as audio adapter.

Release along with an introductory postcard, the introductory booklet, and an interpreter.
