"The not quite stereo" by Zoltan Nagy

[
Feedback:
	Kepten:
		https://gist.github.com/abesto/759b614c55a9de19f6c642609fe43eeb
	Zsol:
		https://gist.github.com/zsol/b9eaf92c21417ee7bec98e4ed76ba3ca

		
Want in:
	Karesz
	
TODO:
	time-based song switching. skip song?
]

The release number is 2.
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

Section 2 - Pre-release notes

When play begins:
	say "This is a not-even-alpha version of a game about cables and music. If you encounter frustration or confusion, this is not (yet) intended; please let me know.[line break]If you're playing this in an interpreter (not in-browser), please type 'transcript on' to create a recording of your session to be used for debugging any problems. Otherwise, please copy-paste the session into an e-mail. In either case, please send to abesto0@gmail.com, along with any feedback.[line break]If you get stuck, you can type 'hint' to get a hint. The first one is free: you can type 'hint' multiple times for increasingly spoilery hints.[paragraph break]";
	say "A note on talking to the game: due to limitations of the engine, some phrasings will work better for plugging things in than others. For best results, plug cables into objects (like 'plug HDMI cable into monitor'), or into specific sockets (like 'plug jack cable into headphone out'). For objects with hard-wired cables, try plugging in the object itself (like 'plug right speaker into left speaker')."


Chapter 2 - The Game

Section 1 - A few decisions

To decide if HDMI is connected:
	if the gray HDMI cable is inserted into the MacBook, and the gray HDMI cable is inserted into the Dell monitor:
		yes;
	otherwise:
		no.
		
To decide if screen is connected to subwoofer:
	if the jack cable is inserted into the monitor, and the jack cable is inserted into the subwoofer:
		yes;
	otherwise:
		no.
		
To decide if left speaker is connected:
	if the left speaker is inserted into the subwoofer, and the holder of the attachment of the bottom RCA socket is the left speaker:
		yes;
	otherwise:
		no.
		
To decide if the right speaker is connected:
	if the right speaker is inserted into the subwoofer:
		yes;
	otherwise:
		no.
		
Section 2 - Tutorial

Your Room is a room. "[if unvisited]Getting a proper speaker setup has been on your bucket list for a while now. This is not a purchase one makes lightly - it should provide you with quality entertainment for years to come. After researching your options and getting opinions from co-workers, you've now finally hauled the big box of sound home. You've just finished unpacking the speakers: the left and right satellite speakers are looking at you anxiously from the corners of the desk, and the subwoofer is firmly on the ground, already plugged into the power strip. You have the manual. You have the cables. It's time to get wiring.[else]It's the same room you've been living in for the last year or so. Right now, you're focused on a tiny corner of it: the part with a white table and a stereo system to set up.[end if]".

Here is a white desk. The white desk is scenery. Description of the white desk is "The previous tenants left this here; it's been holding up all your computery stuff ever since."

A MacBook is on the desk. "Your trusty MacBook sits patiently on the desk, with Spotify open, playing your weekly Discover playlist."
The description is "This model has both an hour and a stereo audio (small jack) output. A glance at the screen confirms Spotify is still playing."
The MacBook incorporates an HDMI socket called HDMI out.
The MacBook incorporates a jack socket called stereo out.

The left speaker is on the desk. Indefinite article is "the". The description is "It has a white THX logo on top. There's an RCA cable hard-wired into its back." It incorporates an RCA plug.

The right speaker is on the desk. Indefinite article is "the". The description is "It has a white THX logo on top. Two jack sockets are built into its side. There's  a tiny headphone pictogram above the top one, and a (similarly tiny) music note icon below the bottom one. There's an HD15 D-Sub cable hard-wired into its back. It looks just the same as a VGA cable, but the innards are quite different."
The right speaker incorporates a jack socket called headphone out.
The right speaker incorporates a jack socket called media in.
The right speaker incorporates an HD15 plug.

A Dell monitor is on the desk.
The description is "You always mean to get a bigger one, but one step at a time - for now, let's set up the stereo.
[if HDMI is connected]The display mirrors the display of your MacBook, with a maximized Spotify window.[otherwise]The display has a 'No Input' message moving around on it.[end if] On the back of the screen there's an HDMI input, and a small jack (output) socket. They're kind of hard to reach, but by now you can plug cables into them by touch."
The monitor incorporates an HDMI socket.
The monitor incorporates a jack socket called monitor stereo out.

The floor is here. It is scenery.
A box of cables is on the floor.
There is a gray HDMI cable in the box of cables. It incorporates two HDMI plugs.
There is a jack cable in the box. It incorporates two jack plugs.

There is a subwoofer on the floor. The description is "The central part of your brand-new 2.1 stereo system. A moderately sized speaker is staring you in the face from the front. Looking at it, you feel you won't ever turn the volume all the way up - the neighbors would go crazy, not to mention permanent hearing damage.[line break]On the back there are a bunch of sockets. The white and red RCA sockets on top have the label 'AUX'. Below them is a green jack socket with the pictogram of a little musical note next to it. Below that sits a large, vertical HD15 socket labeled 'Right speaker', and finally an RCA socket with 'Left speaker' written next to it."
It incorporates an RCA socket called white RCA socket. Instead of examining the white RCA socket, say "A female RCA connector on the subwoofer. The plastic rim of the socket is white. It's labelled 'AUX'."
It incorporates an RCA socket called red RCA socket. Instead of examining the red RCA socket, say "A female RCA connector on the subwoofer. The plastic rim of the socket is red. It's labelled 'AUX'."
It incorporates a jack socket called green jack socket. Instead of examining the green jack socket, say "A femal jack connector on the subwoofer. The rim of the socket is green. The pictogram of a musical note is next to it on the plastic cover."
It incorporates an HD15 socket. Instead of examining the HD15 socket, say "A female HD15 connector. Looks a lot like a VGA connector, but is very different on the inside. The words 'Right speaker' are printed in white next to it in white."
It incorporates an RCA socket called bottom RCA socket. Instead of examining the bottom RCA socket, say "A female RCA connector on the subwoofer. The plastic rim of the socket is black. The words 'Left speaker' are printed next to it in white."

The manual is on the desk.
Instead of examining the manual, say "A five-page pamphlet with lots of tiny letters. The only part that looks interesting is about how to wire up the stereo. There's a section detailing a desktop setup - surprisingly helpful.[paragraph break]1. Plug the RCA cable coming out the back of the left satellite speaker into the bottom RCA socket on the subwoofer, labelled 'left speaker'.[line break]2. Connect the HD15 cable coming out the back of the right satellite speaker to the subwoofer.[line break]3. Connect your laptop or desktop computer to your display via HDMI.[line break]4. Plug one end the provided jack-jack audio cable into the stereo output of your display.[line break]5. Plug the other end of the jack-jack audio cable into the jack socket on the subwoofer."

Instead of plugging a thing into the right speaker (this is the don't-plug-into-speaker rule):
	say "That doesn't sound right. Maybe you should read the manual."
Check plugging something (called P) into the something (called S) (this is the don't-plug-jack-into-laptop rule):
	if P is the jack cable, and S is the MacBook:
		say "That doesn't sound right. Maybe you should read the manual." instead.
	
After plugging the HDMI cable into a thing:
	if HDMI is connected:
		say "The screen of your laptop goes black. After a few seconds the display comes back to life, along with the external Dell monitor, which is now mirroring the display of the MacBook."
		
Asking for help is an action out of world. Understand "help", "hint", "hints" as asking for help.
Carry out asking for help for the first time: say "This is an interactive fiction game. You control your avatar by typing commands like 'look', 'look at laptop', 'examine hdmi cable', and 'plug jack cable into bottom RCA socket' (not something that will work, this last one). Your goal is wire up all the equipment in the room to get a working sound system."
Carry out asking for help for the second time: say "Remember how you have a manual? How about reading it? Maybe it'll give you some hints."
Carry out asking for help for the third time: say "I'm out of hints; the next time you ask for help, I'll just give you the solution. Seriously. So be careful what you ask for!"
Carry out asking for help at least four times: say "Alright, here goes.[line break]plug left speaker into bottom RCA socket[line break]plug right speaker into subwoofer[line break]plug HDMI cable into laptop[line break]plug HDMI cable into monitor[line break]plug jack cable into monitor[line break]plug jack cable into subwoofer".
		
test plug-all with "plug left speaker into bottom RCA socket / plug right speaker into subwoofer / plug hdmi cable into laptop / plug hdmi cable into screen / plug jack cable into screen / plug jack cable into subwoofer".
		
Section 3 - Debugging - the actual puzzle

Debugging is a scene.
Debugging begins when HDMI is connected and screen is connected to subwoofer and left speaker is connected and right speaker is connected.
When Debugging begins:
	say "It's done.[line break]You've connected all the wires, the system is alive. Clean, strong bass is pumping out the subwoofer, and the speakers on the desk give you the best listening of Korn you've had in a while. You sit back, close your eyes...[paragraph break]Then you turn your head to the left a bit, then to the right... Something's not right. It's like the stereo is not stereo after all. Only one speaker is blasting Korn, the other is just sitting there quietly. How can this be? It's a brand new system! It's time to do some debugging.";
	end the story saying "This concludes the tutorial. The rest of the game, to be implemented, will center on you trying to get the right speaker to work. Please don't forget to send send the transcript of your game, along with any feedback, to abesto0@gmail.com. Thanks for testing!"
	
Section 4 - Ambience

Spotify is scenery. It is in your room. The description is "Way more convinient than having to buy and switch CDs all the time, or maintaining a music collection manually. It even tells you what music to like based on data, magic, and maybe some guesswork. There may be a moral in here about how machine learning is making humans lazier, but who has time to think about that when you have cables to connect. It's playing your Discover Weekly playlist. Black Stone Cherry, Godsmack, Nine Lashes, Rise Against - the good stuff."

Section 5 - Victory condition

Instead of listening, do nothing.
		
Every turn:
	unless the MacBook is attached:
		say "Music is playing from the built-in speakers of your MacBook. You can't hear most of the bass line.";		
	otherwise if the HDMI is connected and screen is connected to subwoofer and the left speaker is connected:
		say "It sounds like there is sound coming from only the left speaker.";
	otherwise:
		say "You don't hear any music at all."
		
Section 6 - Glossary

Understand "satellite" as speaker.
Understand "jack out" as stereo out.
Understand "top jack socket" or "top stereo output" or "top stereo jacket" as headphone out.
Understand "laptop" as MacBook.
Understand "screen" or "display" as monitor.
Understand "table" as desk.

Release along with an introductory postcard, the introductory booklet, and an interpreter.
