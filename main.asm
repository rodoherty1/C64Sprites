v = $d000
SPRITE_ENABLE_REGISTER  = $D015
SPRITE0_COLOUR_REGISTER = $D027

JOYSTICK                = $DC00 

  lda #147
  jsr $ffd2
  
  ; lda #3
  ; sta $d020

  ; lda #0
  ; sta $d021

  lda #13 
  sta $07F8

  lda #1
  sta SPRITE_ENABLE_REGISTER
  sta SPRITE0_COLOUR_REGISTER

  ldx #62   ; Counter from 62 to 0 for each byte in the sprite (3 * 21 bytes in a sprite)
  lda #$FF  ; Enable all pixels in this particular sprite-byte

loop:
  sta 832,x ; (Bank0 * 16384) + (#13 * 64bytes) = $0832 ($0801-$9FFF is default basic area) 
  dex
  bpl loop

forever:
  lda #$ff
  cmp $d012
  bne forever

up:
  lda JOYSTICK
  and #1
  bne down
  dec spry
down:
  lda JOYSTICK
  and #2
  bne left
  inc spry
left:
  lda JOYSTICK
  and #4
  bne right
  dec sprx
  lda sprx
  cmp #$ff
  bne right
  dec sprx+1

right:
  lda JOYSTICK
  and #8
  bne button
  inc sprx
  bne button
  inc sprx+1

button:
  lda JOYSTICK
  and #16
  bne done
  inc $d020
done:
  lda sprx 
  sta v

  lda sprx+1
  sta SPRITE_ENABLE_REGISTER+1; Horrible

  lda spry
  sta v+1
  jmp forever

sprx: .byte 100,0
spry: .byte 100



