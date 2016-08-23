"The not quite stereo" by Zoltan Nagy

[
Wants to test:
	- Zsol
	- Dani?
]

Include Plugs and Sockets by Sean Turner.

Chapter 1 - Prodecure

Use American dialect and the serial comma.

An HDMI socket is a kind of PS-socket. The PS-type of an HDMI socket is "HDMI".
An HDMI plug is a kind of PS-plug. The PS-type of an HDMI plug is "HDMI".

A jack socket is a kind of PS-socket. The PS-type of a jack socket is "jack".
A jack plug is a kind of PS-plug. The PS-type of a jack plug is "jack".

An RCA socket is a kind of PS-socket. The PS-type of an RCA socket is "RCA".
An RCA plug is a kind of PS-plug. The PS-type of an RCA plug is "RCA".

An HD15 socket is a kind of PS-socket. The PS-type of an HD15 socket is "HD15".
An HD15 plug is a kind of PS-plug. The PS-type of an HD15 plug is "HD15".

Section 1 - Pre-release notes

When play begins:
	say "[line break]This is a not-even-alpha version of a game about cables and music. If you encounter frustration or confusion, this is not (yet) intended; please let me know.[line break]If you're playing this in an interpreter (not in-browser), please type 'transcript on' to create a recording of your session to be used for debugging any problems. Otherwise, please copy-paste the session into an e-mail. In either case, please send to abesto0@gmail.com, along with any feedback.[line break]If you get stuck, you can type 'hint' to get a hint. The first one is free: you can type 'hint' multiple times for increasingly spoilery hints.[paragraph break]"


Chapter 2 - The Game

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

Your Room is a room. "[if unvisited]Getting a proper speaker setup has been on your bucket list for a while now. This is not a purchase one makes lightly - it should provide you with quality entertainment for years to come. After researching your options and getting opinions from co-workers, you've now finally hauled the big box of sound home. You've just finished unpacking the speakers: the left and right satellite speakers are looking at you anxiously from the corners of the desk, and the subwoofer is firmly on the ground, already plugged into the power strip. You have the manual. You have the cables. It's time to get wiring.[else]It's the same room you've been living in for the last year or so. Right now, you're focused on a tiny corner of it: the part with a white table and a stereo system to set up.[end if]"

A MacBook is here. "Your trusty MacBook sits patiently on the desk, with Spotify open, playing your weekly Discover playlist."
The description is "This model has both an HDMI and a stereo audio (small jack) output. A glance at the screen confirms Spotify is still playing."
The MacBook incorporates an HDMI socket.
The MacBook incorporates a jack socket.

The left speaker is scenery. It is here. The description is "It has a white THX logo on top. There's an RCA cable hard-wired into its back." It incorporates an RCA plug.

The right speaker is scenery. It is here. The description is "It has a white THX logo on top. Two jack sockets are built into its side. There's  a tiny headphone pictogram above the top one, and a (similarly tiny) music note icon below the bottom one. There's an HD15 D-Sub cable hard-wired into its back. It looks just the same as a VGA cable, but the innards are quite different."
The right speaker incorporates a jack socket called headphone output.
The right speaker incorporates a jack socket called media input.
The right speaker incorporates an HD15 plug.

A Dell monitor is here. "Next to it is a relatively small Dell monitor."
The description is "You always mean to get a bigger one, but one step at a time - for now, let's set up the stereo.
[if HDMI is connected]The display mirrors the display of your MacBook, with a maximized Spotify window.[otherwise]The display has a 'No Input' message moving around on it.[end if] On the back of the screen there's an HDMI input, and a small jack (output) socket. They're kind of hard to reach, but by now you can plug cables into them by touch."
The monitor incorporates an HDMI socket.
The monitor incorporates a jack socket.

The floor is here. It is scenery.
A box of cables is on the floor.
There is a gray HDMI cable in the box of cables. It incorporates two HDMI plugs.
There is a jack cable in the box. It incorporates two jack plugs.

There is a subwoofer on the floor. The description is "The central part of your brand-new 2.1 stereo system. A moderately sized speaker is staring you in the face from the front. Looking at it, you feel you won't ever turn the volume all the way up - the neighbors would go crazy, not to mention permanent hearing damage.[line break]On the back there are a bunch of sockets. The white and red RCA sockets on top have the label 'AUX'. Below them is a green jack socket with the pictogram of a little musical note next to it. Below that sits a large, vertical HD15 socket labeled 'Right speaker', and finally an RCA socket with 'Left speaker' written next to it."
It incorporates an RCA socket called white RCA socket.
It incorporates an RCA socket called red RCA socket.
It incorporates a jack socket called green jack socket.
It incorporates an HD15 socket.
It incorporates an RCA socket called bottom RCA socket.

The player is holding the manual.
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
Carry out asking for help for the first time: say "This is an interactive fiction game. You control your avatar by typing commands like 'look', 'look at laptop', 'examine hdmi cable', and 'plug hdmi cable into subwoofer' (not something that will work, this last one). Your goal is wire up all the equipment in the room to get a working sound system."
Carry out asking for help for the second time: say "Remember how you have a manual? How about reading it? Maybe it'll give you some hints."
Carry out asking for help for the third time: say "I'm out of hints; the next time you ask for help, I'll just give you the solution. Seriously. So be careful what you ask for!"
Carry out asking for help at least four times: say "Alright, here goes.[line break]plug left speaker into bottom RCA socket[line break]plug right speaker into subwoofer[line break]plug HDMI cable into laptop[line break]plug HDMI cable into monitor[line break]plug jack cable into monitor[line break]plug jack cable into subwoofer".
		
test plug-all with "plug left speaker into bottom RCA socket / plug right speaker into subwoofer / plug hdmi cable into laptop / plug hdmi cable into screen / plug jack cable into screen / plug jack cable into subwoofer".
		
Section 2 - Debugging

Debugging is a scene.
Debugging begins when HDMI is connected and screen is connected to subwoofer and left speaker is connected and right speaker is connected.
When Debugging begins:
	say "It's done.[line break]You've connected all the wires, the system is alive. Clean, strong bass is pumping out the subwoofer, and the speakers on the desk give you the best listening of Korn you've had in a while. You sit back, close your eyes...[paragraph break]Then you turn your head to the left a bit, then to the right... Something's not right. It's like the stereo is not stereo after all. Only one speaker is blasting Korn, the other is just sitting there quietly. How can this be? It's a brand new system! It's time to do some debugging.";
	end the story saying "This concludes the tutorial. The rest of the game, to be implemented, will center on you trying to get the right speaker to work. Please don't forget to send send the transcript of your game, along with any feedback, to abesto0@gmail.com. Thanks for testing!"


Section 3 - Victory condition

Instead of listening, do nothing.
		
Every turn:
	unless the MacBook is attached:
		say "Music is playing from the built-in speakers of your MacBook. You can't hear most of the bass line.";		
	otherwise if the HDMI is connected and screen is connected to subwoofer and the left speaker is connected:
		say "It sounds like there is sound coming from only the left speaker.";
	otherwise:
		say "You don't hear any music at all."
		
Section 4 - Glossary

Understand "satellite" as speaker.
Understand "top jack socket" or "top stereo output" or "top stereo jacket" as headphone output.
Understand "laptop" as MacBook.
Understand "screen" or "display" as monitor.

Release along with an introductory postcard and an interpreter.
