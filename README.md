# SB9600-CRC-Gen
Simple code to Generate the Motorola SB9600 Protocol CRC value for a packet.

What do you need this for? If you are messing around with any older Motorola radio gear and trying to figure out how to program the radio or control the radios without Motorola software you will need this to add to the end of each command. 

This code was an old Borland C++ Builder project I did. The problem was in trying to hack the Motorola SB9600 protocol you need this CRC. The method to generate it was unknown.

What is the SB9600 protocol used for? It's an odd protocol that Motorola used to communicate, connect and program many of their older communications systems. 


So while you can look at a serial protocol analyzer and see all the data it was difficult to generate commands since you always needed the CRC at the end of each.

A typical command was 5 Bytes, 4 + CRC

This generates the CRC

In addition it also generates a checksum for larger blocks as needed. Your best bet is to take the code and just compile it with a C compiler and check it against the EXE that is in this repository. Since I had spent a lot of time on it, I had a messed with the code generation in case someone decompiled my source. Otherwise have at it.

The CRC generate was reverse engineered from data generated by some radios communicating with software to program them. To make this useful you will need the SB9600 protocol specs which I don't have (sorry can't help). 
