# C64 Sprites

6502 Assembly code from the video [Joystick controlled sprites in Assembly and Basic](https://www.youtube.com/watch?v=mOMc6kLkUrg)

## Screen memory and sprite notes

Screen size = 40 * 25 = 1000 bytes

But allocated screen memory = 1024 bytes

Last 24 bytes at the end of screen memory is unused.

*Last 8 bytes are used as sprite pointers.*

Screen memory starts at $400 (#1024)

$400 (Starting address) + 1024 bytes = $0800

*Location of the sprite pointers* = $0800 - last 8 bytes = *$07F8*
