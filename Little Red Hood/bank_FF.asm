.segment "BANK_FF"
.include "bank_ram.inc"
.include "bank_val.inc"
.org $8000  ; for listing file
; 0x000010-0x00800F

sub_8000:
C - - - - - 0x000010 00:8000: A2 00     LDX #$00
C - - - - - 0x000012 00:8002: BD 09 80  LDA tbl_8009_validate,X
C - - - - - 0x000015 00:8005: 9D 09 80  STA tbl_8009_validate,X
C - - - - - 0x000018 00:8008: 60        RTS

tbl_8009_validate:
- - - - - - 0x000019 00:8009: 6C        .byte $6C   ; 
- D 0 - - - 0x00001A 00:800A: 04        .byte $04   ; 

vec_800B_RESET:
C - - - - - 0x00001B 00:800B: 78        SEI
C - - - - - 0x00001C 00:800C: D8        CLD

bra_800D:
C - - - - - 0x00001D 00:800D: A2 FF     LDX #$FF
C - - - - - 0x00001F 00:800F: 9A        TXS
C - - - - - 0x000020 00:8010: A9 00     LDA #$00
C - - - - - 0x000022 00:8012: 8D 00 20  STA $2000
C - - - - - 0x000025 00:8015: 8D 01 20  STA $2001
C - - - - - 0x000028 00:8018: 20 62 80  JSR sub_8062
C - - - - - 0x00002B 00:801B: A9 00     LDA #$00
C - - - - - 0x00002D 00:801D: 85 00     STA ram_0000
C - - - - - 0x00002F 00:801F: 85 01     STA ram_0001
C - - - - - 0x000031 00:8021: A8        TAY

bra_8022:
C - - - - - 0x000032 00:8022: A9 00     LDA #$00

bra_8024:
C - - - - - 0x000034 00:8024: 91 00     STA (ram_0000),Y
C - - - - - 0x000036 00:8026: C8        INY
C - - - - - 0x000037 00:8027: D0 FB     BNE bra_8024
C - - - - - 0x000039 00:8029: E6 01     INC ram_0001
C - - - - - 0x00003B 00:802B: A5 01     LDA ram_0001
C - - - - - 0x00003D 00:802D: C9 08     CMP #$08
C - - - - - 0x00003F 00:802F: D0 F1     BNE bra_8022
C - - - - - 0x000041 00:8031: A9 CE     LDA #$CE
C - - - - - 0x000043 00:8033: 85 07     STA ram_0007
C - - - - - 0x000045 00:8035: A9 92     LDA #$92
C - - - - - 0x000047 00:8037: 85 06     STA ram_0006
C - - - - - 0x000049 00:8039: 20 A5 80  JSR sub_80A5
C - - - - - 0x00004C 00:803C: A9 02     LDA #$02
C - - - - - 0x00004E 00:803E: 8D 37 06  STA con_player_current_health
C - - - - - 0x000051 00:8041: A9 01     LDA #$01
C - - - - - 0x000053 00:8043: 85 04     STA ram_0004
C - - - - - 0x000055 00:8045: 20 00 80  JSR sub_8000
C - - - - - 0x000058 00:8048: A9 88     LDA #$88
C - - - - - 0x00005A 00:804A: 8D 00 20  STA $2000
C - - - - - 0x00005D 00:804D: 85 00     STA ram_0000
C - - - - - 0x00005F 00:804F: A9 FF     LDA #$FF
C - - - - - 0x000061 00:8051: 85 D2     STA ram_00D2
C - - - - - 0x000063 00:8053: 20 E6 87  JSR sub_87E6

loc_8056:
C D 0 - - - 0x000066 00:8056: A5 05     LDA ram_0005
C - - - - - 0x000068 00:8058: D0 B3     BNE bra_800D
C - - - - - 0x00006A 00:805A: E6 80     INC ram_0080
C - - - - - 0x00006C 00:805C: EE 51 06  INC ram_0651
C - - - - - 0x00006F 00:805F: 4C 56 80  JMP loc_8056

bra_8062:
sub_8062:
C - - - - - 0x000072 00:8062: AD 02 20  LDA $2002
C - - - - - 0x000075 00:8065: 29 80     AND #$80
C - - - - - 0x000077 00:8067: F0 F9     BEQ bra_8062
C - - - - - 0x000079 00:8069: 20 77 80  JSR sub_8077
C - - - - - 0x00007C 00:806C: 20 77 80  JSR sub_8077
C - - - - - 0x00007F 00:806F: A9 0C     LDA #$0C
C - - - - - 0x000081 00:8071: 8D 95 80  STA $8095
C - - - - - 0x000084 00:8074: 4C 96 80  JMP loc_8096

sub_8077:
C - - - - - 0x000087 00:8077: A9 08     LDA #$08
C - - - - - 0x000089 00:8079: 8D 94 80  STA $8094
C - - - - - 0x00008C 00:807C: 20 88 80  JSR sub_8088
C - - - - - 0x00008F 00:807F: A9 00     LDA #$00
C - - - - - 0x000091 00:8081: 8D 93 80  STA $8093
C - - - - - 0x000094 00:8084: 20 88 80  JSR sub_8088
C - - - - - 0x000097 00:8087: 60        RTS

sub_8088:
C - - - - - 0x000098 00:8088: A0 04     LDY #$04
C - - - - - 0x00009A 00:808A: A2 3A     LDX #$3A

bra_808C:
C - - - - - 0x00009C 00:808C: CA        DEX
C - - - - - 0x00009D 00:808D: D0 FD     BNE bra_808C
C - - - - - 0x00009F 00:808F: 88        DEY
C - - - - - 0x0000A0 00:8090: D0 FA     BNE bra_808C
C - - - - - 0x0000A2 00:8092: 60        RTS

tbl_8093:
- - - - - - 0x0000A3 00:8093: 00        .byte $00   ; Unused?
- - - - - - 0x0000A4 00:8094: 08        .byte $08   ; 
- - - - - - 0x0000A5 00:8095: 0C        .byte $0C   ; 

bra_8096:
loc_8096:
C D 0 - - - 0x0000A6 00:8096: AD 02 20  LDA $2002
C - - - - - 0x0000A9 00:8099: 10 FB     BPL bra_8096
C - - - - - 0x0000AB 00:809B: 60        RTS

tbl_809C_game_over_string:
@start:
- D 0 - - - 0x0000AC 00:809C: E0        .byte $E0, $DA, $E6, $DE, $FF, $E8, $DB, $DE, $EB	; GAME OVER
@end:
var_809C = @end - @start

sub_80A5:
C - - - - - 0x0000B5 00:80A5: A0 00     LDY #$00
C - - - - - 0x0000B7 00:80A7: A2 3F     LDX #$3F
C - - - - - 0x0000B9 00:80A9: A9 10     LDA #$10
C - - - - - 0x0000BB 00:80AB: 8E 06 20  STX $2006
C - - - - - 0x0000BE 00:80AE: 8D 06 20  STA $2006

bra_80B1:
C - - - - - 0x0000C1 00:80B1: B1 06     LDA (ram_0006),Y
C - - - - - 0x0000C3 00:80B3: 8D 07 20  STA $2007
C - - - - - 0x0000C6 00:80B6: C8        INY
C - - - - - 0x0000C7 00:80B7: C0 10     CPY #$10
C - - - - - 0x0000C9 00:80B9: D0 F6     BNE bra_80B1
C - - - - - 0x0000CB 00:80BB: 60        RTS

tbl_80BC_sprite_granma_greetings_1:
@start:
- D 0 - I - 0x0000CC 00:80BC: FF        .byte $FF, $F2, $F3, $FF   ;
- D 0 - I - 0x0000D0 00:80C0: F6        .byte $F6, $F5, $F4, $18   ; 
- D 0 - I - 0x0000D4 00:80C4: FD        .byte $FD, $F7, $F7, $17   ; 
- D 0 - I - 0x0000D8 00:80C8: FA        .byte $FA, $F9, $F8, $FC   ; 
@end:
var_80BC = @end - @start

tbl_80CC_sprite_granma_greetings_2:
@start:
- D 0 - I - 0x0000DC 00:80CC: 30        .byte $30, $F2, $F3, $56   ; 
- D 0 - I - 0x0000E0 00:80D0: 2F        .byte $2F, $F5, $F4, $55   ; 
- D 0 - I - 0x0000E4 00:80D4: FB        .byte $FB, $F7, $F7, $69   ; 
- D 0 - I - 0x0000E8 00:80D8: 6A        .byte $6A, $F9, $F8, $6B   ; 
@end:
var_80CC = @end - @start

sub_80DC_ending_scene_sprite_animation_01:
C - - - - - 0x0000EC 00:80DC: A5 9A     LDA ram_009A
C - - - - - 0x0000EE 00:80DE: 29 0F     AND #$0F
C - - - - - 0x0000F0 00:80E0: C9 08     CMP #$08
C - - - - - 0x0000F2 00:80E2: 90 1F     BCC bra_8103_ending_scene_sprite_animation_02
C - - - - - 0x0000F4 00:80E4: A9 5C     LDA #$5C			; sprite_little_red_hood_greeting_1_top_left
C - - - - - 0x0000F6 00:80E6: 8D 01 02  STA ram_0201
C - - - - - 0x0000F9 00:80E9: A9 25     LDA #$25			; sprite_little_red_hood_greeting_1_top_right
C - - - - - 0x0000FB 00:80EB: 8D 05 02  STA ram_0205
C - - - - - 0x0000FE 00:80EE: A9 5B     LDA #$5B			; sprite_little_red_hood_greeting_1_bottom_left
C - - - - - 0x000100 00:80F0: 8D 09 02  STA ram_0209
C - - - - - 0x000103 00:80F3: A9 26     LDA #$26			; sprite_little_red_hood_greeting_1_bottom_right
C - - - - - 0x000105 00:80F5: 8D 0D 02  STA ram_020D
C - - - - - 0x000108 00:80F8: A9 80     LDA #>tbl_80BC_sprite_granma_greetings_1
C - - - - - 0x00010A 00:80FA: 85 2F     STA ram_002F
C - - - - - 0x00010C 00:80FC: A9 BC     LDA #<tbl_80BC_sprite_granma_greetings_1
C - - - - - 0x00010E 00:80FE: 85 2E     STA ram_002E
C - - - - - 0x000110 00:8100: 4C 1F 81  JMP loc_811F_draw_sprite_in_ppu

bra_8103_ending_scene_sprite_animation_02:
C - - - - - 0x000113 00:8103: A9 05     LDA #$05			; sprite_little_red_hood_greeting_2_top_left (same as idle)
C - - - - - 0x000115 00:8105: 8D 01 02  STA ram_0201
C - - - - - 0x000118 00:8108: A9 08     LDA #$08			; sprite_little_red_hood_greeting_2_top_right
C - - - - - 0x00011A 00:810A: 8D 05 02  STA ram_0205
C - - - - - 0x00011D 00:810D: A9 06     LDA #$06			; sprite_little_red_hood_greeting_2_bottom_left
C - - - - - 0x00011F 00:810F: 8D 09 02  STA ram_0209
C - - - - - 0x000122 00:8112: A9 07     LDA #$07			; sprite_little_red_hood_greeting_2_bottom_right
C - - - - - 0x000124 00:8114: 8D 0D 02  STA ram_020D
C - - - - - 0x000127 00:8117: A9 80     LDA #>tbl_80CC_sprite_granma_greetings_2
C - - - - - 0x000129 00:8119: 85 2F     STA ram_002F
C - - - - - 0x00012B 00:811B: A9 CC     LDA #<tbl_80CC_sprite_granma_greetings_2
C - - - - - 0x00012D 00:811D: 85 2E     STA ram_002E

loc_811F_draw_sprite_in_ppu:
C D 0 - - - 0x00012F 00:811F: A0 00     LDY #$00
C - - - - - 0x000131 00:8121: A2 00     LDX #$00

bra_8123_draw_next_sprite:
C - - - - - 0x000133 00:8123: B1 2E     LDA (ram_002E),Y
C - - - - - 0x000135 00:8125: 9D 11 02  STA ram_0211,X
C - - - - - 0x000138 00:8128: E8        INX
C - - - - - 0x000139 00:8129: E8        INX
C - - - - - 0x00013A 00:812A: E8        INX
C - - - - - 0x00013B 00:812B: E8        INX
C - - - - - 0x00013C 00:812C: C8        INY
C - - - - - 0x00013D 00:812D: C0 10     CPY #var_80BC		; length 4x4=16 bytes
C - - - - - 0x00013F 00:812F: 90 F2     BCC bra_8123_draw_next_sprite
C - - - - - 0x000141 00:8131: 60        RTS

tbl_8132_ending_message_line_1:
@start:
- D 0 - - - 0x000142 00:8132: 4F        .byte $4F,$48,$34,$4D,$59,$66,$44,$45,$41,$52,$66,$4C,$49,$54,$54,$4C,$45,$66,$52,$45,$44,$66,$48,$4F,$4F,$44,$34	; OH!MY DEAR LITTLE RED HOOD!
@end:
var_8132 = @end - @start

tbl_814D_ending_message_line_2:
@start:
- D 0 - - - 0x00015D 00:814D: 54        .byte $54,$48,$41,$4E,$4B,$66,$59,$4F,$55,$66,$46,$4F,$52,$66,$59,$4F,$55,$52,$66,$43,$4F,$4D,$49,$4E,$47,$34   ; THANK YOU FOR YOUR COMING!
@end:
var_814D = @end - @start

sub_8167:
C - - - - - 0x000177 00:8167: A9 21     LDA #$21
C - - - - - 0x000179 00:8169: 8D 06 20  STA $2006
C - - - - - 0x00017C 00:816C: A9 03     LDA #$03
C - - - - - 0x00017E 00:816E: 8D 06 20  STA $2006
C - - - - - 0x000181 00:8171: A2 00     LDX #$00

bra_8173:
C - - - - - 0x000183 00:8173: BD 32 81  LDA tbl_8132_ending_message_line_1,X
C - - - - - 0x000186 00:8176: 18        CLC
C - - - - - 0x000187 00:8177: 69 99     ADC #$99
C - - - - - 0x000189 00:8179: 8D 07 20  STA $2007
C - - - - - 0x00018C 00:817C: E8        INX
C - - - - - 0x00018D 00:817D: E0 1B     CPX #var_8132		; message length
C - - - - - 0x00018F 00:817F: 90 F2     BCC bra_8173
C - - - - - 0x000191 00:8181: A9 21     LDA #$21
C - - - - - 0x000193 00:8183: 8D 06 20  STA $2006
C - - - - - 0x000196 00:8186: A9 43     LDA #$43
C - - - - - 0x000198 00:8188: 8D 06 20  STA $2006
C - - - - - 0x00019B 00:818B: A2 00     LDX #$00

bra_818D:
C - - - - - 0x00019D 00:818D: BD 4D 81  LDA tbl_814D_ending_message_line_2,X
C - - - - - 0x0001A0 00:8190: 18        CLC
C - - - - - 0x0001A1 00:8191: 69 99     ADC #$99
C - - - - - 0x0001A3 00:8193: 8D 07 20  STA $2007
C - - - - - 0x0001A6 00:8196: E8        INX
C - - - - - 0x0001A7 00:8197: E0 1A     CPX #var_814D      ; message length
C - - - - - 0x0001A9 00:8199: 90 F2     BCC bra_818D
C - - - - - 0x0001AB 00:819B: A9 21     LDA #$21
C - - - - - 0x0001AD 00:819D: 8D 06 20  STA $2006
C - - - - - 0x0001B0 00:81A0: A9 C8     LDA #$C8
C - - - - - 0x0001B2 00:81A2: 8D 06 20  STA $2006
C - - - - - 0x0001B5 00:81A5: A2 00     LDX #$00
C - - - - - 0x0001B7 00:81A7: A9 FF     LDA #$FF

bra_81A9:
C - - - - - 0x0001B9 00:81A9: 8D 07 20  STA $2007
C - - - - - 0x0001BC 00:81AC: E8        INX
C - - - - - 0x0001BD 00:81AD: E0 0C     CPX #$0C
C - - - - - 0x0001BF 00:81AF: 90 F8     BCC bra_81A9
C - - - - - 0x0001C1 00:81B1: A9 22     LDA #$22
C - - - - - 0x0001C3 00:81B3: 8D 06 20  STA $2006
C - - - - - 0x0001C6 00:81B6: A9 2A     LDA #$2A
C - - - - - 0x0001C8 00:81B8: 8D 06 20  STA $2006
C - - - - - 0x0001CB 00:81BB: A2 00     LDX #$00
C - - - - - 0x0001CD 00:81BD: A9 FF     LDA #$FF

bra_81BF:
C - - - - - 0x0001CF 00:81BF: 8D 07 20  STA $2007
C - - - - - 0x0001D2 00:81C2: E8        INX
C - - - - - 0x0001D3 00:81C3: E0 0C     CPX #$0C
C - - - - - 0x0001D5 00:81C5: 90 F8     BCC bra_81BF
C - - - - - 0x0001D7 00:81C7: 60        RTS

tbl_81C8_palette_life_left_counter:
@start1:
- D 0 - I - 0x0001D8 00:81C8: 2E        .byte $2E, $20, $25, $15, $2E, $2B, $2E, $3B, $2E, $00, $00, $00, $2E, $2B, $20, $25	;
@end1:
var_81C8 = @end1 - @start1

;game over string palette
@start2:
- D 0 - I - 0x0001E8 00:81D8: 2E        .byte $2E, $20, $25, $15, $2E, $2B, $2E, $3B, $2E, $00, $00, $00, $2E, $2B, $20, $25	;
@end2:
var_81D8 = var_81C8 + @end2 - @start2

; CPU jumps from $805C & $FFFA instruction
vec_81E8_NMI:
C - - - - - 0x0001F8 00:81E8: 48        PHA
C - - - - - 0x0001F9 00:81E9: 8A        TXA
C - - - - - 0x0001FA 00:81EA: 48        PHA
C - - - - - 0x0001FB 00:81EB: 98        TYA
C - - - - - 0x0001FC 00:81EC: 48        PHA
C - - - - - 0x0001FD 00:81ED: A5 00     LDA ram_0000
C - - - - - 0x0001FF 00:81EF: 09 08     ORA #$08
C - - - - - 0x000201 00:81F1: 85 00     STA ram_0000
C - - - - - 0x000203 00:81F3: 8D 00 20  STA $2000
C - - - - - 0x000206 00:81F6: EE FF 03  INC ram_03FF
C - - - - - 0x000209 00:81F9: AD FF 03  LDA ram_03FF
C - - - - - 0x00020C 00:81FC: C9 08     CMP #$08
C - - - - - 0x00020E 00:81FE: 90 0E     BCC bra_820E
C - - - - - 0x000210 00:8200: A9 00     LDA #$00
C - - - - - 0x000212 00:8202: 8D FF 03  STA ram_03FF
C - - - - - 0x000215 00:8205: A5 A2     LDA ram_00A2
C - - - - - 0x000217 00:8207: 49 80     EOR #$80
C - - - - - 0x000219 00:8209: 85 A2     STA ram_00A2
C - - - - - 0x00021B 00:820B: 4C 10 82  JMP loc_8210

bra_820E:
C - - - - - 0x00021E 00:820E: A5 A2     LDA ram_00A2

loc_8210:
C D 0 - - - 0x000220 00:8210: 8D 03 20  STA $2003
C - - - - - 0x000223 00:8213: A9 02     LDA #$02
C - - - - - 0x000225 00:8215: 8D 14 40  STA $4014
C - - - - - 0x000228 00:8218: AD 4D 06  LDA ram_064D
C - - - - - 0x00022B 00:821B: D0 03     BNE bra_8220
C - - - - - 0x00022D 00:821D: 4C BD 82  JMP loc_82BD

bra_8220:
C - - - - - 0x000230 00:8220: AD 4E 06  LDA ram_064E
C - - - - - 0x000233 00:8223: F0 0D     BEQ bra_8232
C - - - - - 0x000235 00:8225: 10 27     BPL bra_824E
C - - - - - 0x000237 00:8227: 20 DC 80  JSR sub_80DC_ending_scene_sprite_animation_01
C - - - - - 0x00023A 00:822A: EE 4F 06  INC ram_064F
C - - - - - 0x00023D 00:822D: F0 79     BEQ bra_82A8
C - - - - - 0x00023F 00:822F: 4C 6C 8B  JMP loc_8B6C

bra_8232:
C - - - - - 0x000242 00:8232: A9 01     LDA #$01
C - - - - - 0x000244 00:8234: 8D 4E 06  STA ram_064E
C - - - - - 0x000247 00:8237: 8D 8C 03  STA ram_038C
C - - - - - 0x00024A 00:823A: A9 00     LDA #$00
C - - - - - 0x00024C 00:823C: 8D 01 20  STA $2001
C - - - - - 0x00024F 00:823F: 8D 00 20  STA $2000
C - - - - - 0x000252 00:8242: 20 91 AB  JSR sub_AB91_check_and_change_level
C - - - - - 0x000255 00:8245: 20 67 81  JSR sub_8167
C - - - - - 0x000258 00:8248: 20 BD C2  JSR sub_C2BD
C - - - - - 0x00025B 00:824B: 4C 17 83  JMP loc_8317

bra_824E:
C - - - - - 0x00025E 00:824E: A5 9A     LDA ram_009A
C - - - - - 0x000260 00:8250: 29 0F     AND #$0F
C - - - - - 0x000262 00:8252: C9 08     CMP #$08
C - - - - - 0x000264 00:8254: 90 16     BCC bra_826C
C - - - - - 0x000266 00:8256: A9 3D     LDA #$3D			; Little_red_hood_walk_animation_01_top_left
C - - - - - 0x000268 00:8258: 8D 01 02  STA ram_0201
C - - - - - 0x00026B 00:825B: A9 58     LDA #$58			; Little_red_hood_walk_animation_01_top_right
C - - - - - 0x00026D 00:825D: 8D 05 02  STA ram_0205
C - - - - - 0x000270 00:8260: A9 3E     LDA #$3E			; Little_red_hood_walk_animation_01_bottom_left
C - - - - - 0x000272 00:8262: 8D 09 02  STA ram_0209
C - - - - - 0x000275 00:8265: A9 57     LDA #$57			; Little_red_hood_walk_animation_01_bottom_right
C - - - - - 0x000277 00:8267: 8D 0D 02  STA ram_020D
C - - - - - 0x00027A 00:826A: D0 14     BNE bra_8280

bra_826C:
C - - - - - 0x00027C 00:826C: A9 3D     LDA #$3D			; Little_red_hood_walk_animation_02_top_left
C - - - - - 0x00027E 00:826E: 8D 01 02  STA ram_0201
C - - - - - 0x000281 00:8271: A9 54     LDA #$54			; Little_red_hood_walk_animation_02_top_right
C - - - - - 0x000283 00:8273: 8D 05 02  STA ram_0205
C - - - - - 0x000286 00:8276: A9 3E     LDA #$3E			; Little_red_hood_walk_animation_02_bottom_left
C - - - - - 0x000288 00:8278: 8D 09 02  STA ram_0209
C - - - - - 0x00028B 00:827B: A9 53     LDA #$53			; Little_red_hood_walk_animation_02_bottom_right
C - - - - - 0x00028D 00:827D: 8D 0D 02  STA ram_020D

bra_8280:
C - - - - - 0x000290 00:8280: EE 03 02  INC ram_0203
C - - - - - 0x000293 00:8283: EE 07 02  INC ram_0207
C - - - - - 0x000296 00:8286: EE 0B 02  INC ram_020B
C - - - - - 0x000299 00:8289: EE 0F 02  INC ram_020F
C - - - - - 0x00029C 00:828C: AD 03 02  LDA ram_0203
C - - - - - 0x00029F 00:828F: C9 B0     CMP #$B0			; Stop point
C - - - - - 0x0002A1 00:8291: 90 12     BCC bra_82A5
C - - - - - 0x0002A3 00:8293: 8D 4E 06  STA ram_064E
C - - - - - 0x0002A6 00:8296: A2 00     LDX #$00
C - - - - - 0x0002A8 00:8298: A9 01     LDA #$01

bra_829A:
C - - - - - 0x0002AA 00:829A: 9D 12 02  STA ram_0212,X
C - - - - - 0x0002AD 00:829D: E8        INX
C - - - - - 0x0002AE 00:829E: E8        INX
C - - - - - 0x0002AF 00:829F: E8        INX
C - - - - - 0x0002B0 00:82A0: E8        INX
C - - - - - 0x0002B1 00:82A1: E0 40     CPX #$40
C - - - - - 0x0002B3 00:82A3: 90 F5     BCC bra_829A

bra_82A5:
C - - - - - 0x0002B5 00:82A5: 4C 6C 8B  JMP loc_8B6C

bra_82A8:
C - - - - - 0x0002B8 00:82A8: 20 AE 82  JSR sub_82AE
C - - - - - 0x0002BB 00:82AB: 4C 6C 8B  JMP loc_8B6C

sub_82AE:
C - - - - - 0x0002BE 00:82AE: AD 42 06  LDA ram_0642
C - - - - - 0x0002C1 00:82B1: F0 05     BEQ bra_82B8
- - - - - - 0x0002C3 00:82B3: AD 3B 06  LDA ram_063B
- - - - - - 0x0002C6 00:82B6: F0 04     BEQ bra_82BC_RTS

bra_82B8:
C - - - - - 0x0002C8 00:82B8: A9 01     LDA #$01
C - - - - - 0x0002CA 00:82BA: 85 05     STA ram_0005

bra_82BC_RTS:
C - - - - - 0x0002CC 00:82BC: 60        RTS

loc_82BD:
C D 0 - - - 0x0002CD 00:82BD: AD 4B 06  LDA ram_064B
C - - - - - 0x0002D0 00:82C0: F0 73     BEQ bra_8335
C - - - - - 0x0002D2 00:82C2: EE 4B 06  INC ram_064B
C - - - - - 0x0002D5 00:82C5: F0 64     BEQ bra_832B
C - - - - - 0x0002D7 00:82C7: AD 4C 06  LDA ram_064C
C - - - - - 0x0002DA 00:82CA: D0 4B     BNE bra_8317
C - - - - - 0x0002DC 00:82CC: A9 01     LDA #$01
C - - - - - 0x0002DE 00:82CE: 8D 4C 06  STA ram_064C
C - - - - - 0x0002E1 00:82D1: A9 00     LDA #$00
C - - - - - 0x0002E3 00:82D3: 8D 01 20  STA $2001
C - - - - - 0x0002E6 00:82D6: 8D 00 20  STA $2000
C - - - - - 0x0002E9 00:82D9: 20 E6 87  JSR sub_87E6
C - - - - - 0x0002EC 00:82DC: A9 81     LDA #>tbl_81C8_palette_life_left_counter
C - - - - - 0x0002EE 00:82DE: 85 07     STA ram_0007
C - - - - - 0x0002F0 00:82E0: A9 C8     LDA #<tbl_81C8_palette_life_left_counter
C - - - - - 0x0002F2 00:82E2: 85 06     STA ram_0006
C - - - - - 0x0002F4 00:82E4: A0 00     LDY #$00
C - - - - - 0x0002F6 00:82E6: A2 3F     LDX #$3F
C - - - - - 0x0002F8 00:82E8: A9 00     LDA #$00
C - - - - - 0x0002FA 00:82EA: 8E 06 20  STX $2006
C - - - - - 0x0002FD 00:82ED: 8D 06 20  STA $2006

bra_82F0:
C - - - - - 0x000300 00:82F0: B1 06     LDA (ram_0006),Y
C - - - - - 0x000302 00:82F2: 8D 07 20  STA $2007
C - - - - - 0x000305 00:82F5: C8        INY
C - - - - - 0x000306 00:82F6: C0 20     CPY #var_81D8
C - - - - - 0x000308 00:82F8: 90 F6     BCC bra_82F0
C - - - - - 0x00030A 00:82FA: 20 F7 BF  JSR sub_BFF7
C - - - - - 0x00030D 00:82FD: 20 D0 BE  JSR sub_BED0
C - - - - - 0x000310 00:8300: A2 00     LDX #$00
C - - - - - 0x000312 00:8302: A9 21     LDA #$21
C - - - - - 0x000314 00:8304: 8D 06 20  STA $2006
C - - - - - 0x000317 00:8307: A9 8C     LDA #$8C
C - - - - - 0x000319 00:8309: 8D 06 20  STA $2006

bra_830C_write_game_over:
C - - - - - 0x00031C 00:830C: BD 9C 80  LDA tbl_809C_game_over_string,X
C - - - - - 0x00031F 00:830F: 8D 07 20  STA $2007
C - - - - - 0x000322 00:8312: E8        INX
C - - - - - 0x000323 00:8313: E0 09     CPX #var_809C
C - - - - - 0x000325 00:8315: 90 F5     BCC bra_830C_write_game_over

bra_8317:
loc_8317:
C D 0 - - - 0x000327 00:8317: A9 1E     LDA #$1E
C - - - - - 0x000329 00:8319: 8D 01 20  STA $2001
C - - - - - 0x00032C 00:831C: 85 01     STA ram_0001
C - - - - - 0x00032E 00:831E: A9 88     LDA #$88
C - - - - - 0x000330 00:8320: 85 00     STA ram_0000
C - - - - - 0x000332 00:8322: 8D 00 20  STA $2000
C - - - - - 0x000335 00:8325: 20 A6 AC  JSR sub_ACA6
C - - - - - 0x000338 00:8328: 4C 6C 8B  JMP loc_8B6C

bra_832B:
C - - - - - 0x00033B 00:832B: 20 AE 82  JSR sub_82AE
C - - - - - 0x00033E 00:832E: A9 00     LDA #$00
C - - - - - 0x000340 00:8330: 8D 4C 06  STA ram_064C
C - - - - - 0x000343 00:8333: F0 E2     BEQ bra_8317

bra_8335:
C - - - - - 0x000345 00:8335: 20 0D 99  JSR sub_990D
C - - - - - 0x000348 00:8338: 90 03     BCC bra_833D
C - - - - - 0x00034A 00:833A: 4C 6C 8B  JMP loc_8B6C

bra_833D:
C - - - - - 0x00034D 00:833D: AD 38 06  LDA ram_0638
C - - - - - 0x000350 00:8340: F0 14     BEQ bra_8356
C - - - - - 0x000352 00:8342: A5 18     LDA ram_0018
C - - - - - 0x000354 00:8344: F0 0D     BEQ bra_8353
C - - - - - 0x000356 00:8346: AD 15 03  LDA ram_0315
C - - - - - 0x000359 00:8349: F0 08     BEQ bra_8353
C - - - - - 0x00035B 00:834B: A9 00     LDA #$00
C - - - - - 0x00035D 00:834D: 8D 15 03  STA ram_0315
C - - - - - 0x000360 00:8350: 20 67 B1  JSR sub_B167

bra_8353:
C - - - - - 0x000363 00:8353: 4C 0C 84  JMP loc_840C

bra_8356:
C - - - - - 0x000366 00:8356: A5 97     LDA ram_0097
C - - - - - 0x000368 00:8358: D0 7B     BNE bra_83D5
C - - - - - 0x00036A 00:835A: A5 04     LDA ram_0004
C - - - - - 0x00036C 00:835C: F0 35     BEQ bra_8393
C - - - - - 0x00036E 00:835E: A9 00     LDA #$00
C - - - - - 0x000370 00:8360: 85 14     STA ram_0014
C - - - - - 0x000372 00:8362: 85 03     STA ram_0003
C - - - - - 0x000374 00:8364: A9 01     LDA #$01
C - - - - - 0x000376 00:8366: 85 4F     STA ram_004F
C - - - - - 0x000378 00:8368: 20 D0 BE  JSR sub_BED0
C - - - - - 0x00037B 00:836B: 20 FA B4  JSR sub_B4FA
C - - - - - 0x00037E 00:836E: 20 15 C0  JSR sub_C015
C - - - - - 0x000381 00:8371: A9 00     LDA #$00
C - - - - - 0x000383 00:8373: 85 4F     STA ram_004F
C - - - - - 0x000385 00:8375: A9 23     LDA #$23
C - - - - - 0x000387 00:8377: 8D 8A 03  STA ram_038A
C - - - - - 0x00038A 00:837A: A9 07     LDA #$07
C - - - - - 0x00038C 00:837C: 8D 2D 03  STA ram_032D
C - - - - - 0x00038F 00:837F: 20 F0 B3  JSR sub_B3F0
C - - - - - 0x000392 00:8382: 20 A0 AC  JSR sub_ACA0
C - - - - - 0x000395 00:8385: AD 87 03  LDA ram_0387
C - - - - - 0x000398 00:8388: F0 03     BEQ bra_838D
- - - - - - 0x00039A 00:838A: 4C 00 30  JMP $3000  			; ???

bra_838D:
C - - - - - 0x00039D 00:838D: EE 3C 06  INC con_p1_current_level
C - - - - - 0x0003A0 00:8390: EE 3D 06  INC con_p2_current_level

bra_8393:
C - - - - - 0x0003A3 00:8393: A5 98     LDA ram_0098
C - - - - - 0x0003A5 00:8395: F0 07     BEQ bra_839E
C - - - - - 0x0003A7 00:8397: A9 00     LDA #$00
C - - - - - 0x0003A9 00:8399: 85 98     STA ram_0098
C - - - - - 0x0003AB 00:839B: 20 E6 B4  JSR sub_B4E6

bra_839E:
C - - - - - 0x0003AE 00:839E: A5 29     LDA ram_0029
C - - - - - 0x0003B0 00:83A0: D0 51     BNE bra_83F3
C - - - - - 0x0003B2 00:83A2: 20 38 B4  JSR sub_B438
C - - - - - 0x0003B5 00:83A5: A5 5A     LDA ram_005A
C - - - - - 0x0003B7 00:83A7: F0 03     BEQ bra_83AC
C - - - - - 0x0003B9 00:83A9: 20 87 B4  JSR sub_B487

bra_83AC:
C - - - - - 0x0003BC 00:83AC: A5 81     LDA ram_0081
C - - - - - 0x0003BE 00:83AE: F0 03     BEQ bra_83B3
C - - - - - 0x0003C0 00:83B0: 20 C9 B3  JSR sub_B3C9

bra_83B3:
C - - - - - 0x0003C3 00:83B3: A5 97     LDA ram_0097
C - - - - - 0x0003C5 00:83B5: D0 03     BNE bra_83BA
C - - - - - 0x0003C7 00:83B7: 4C 18 8B  JMP loc_8B18

bra_83BA:
C - - - - - 0x0003CA 00:83BA: A9 00     LDA #$00
C - - - - - 0x0003CC 00:83BC: 85 14     STA ram_0014
C - - - - - 0x0003CE 00:83BE: 85 03     STA ram_0003
C - - - - - 0x0003D0 00:83C0: 20 FA B4  JSR sub_B4FA
C - - - - - 0x0003D3 00:83C3: 20 D0 BE  JSR sub_BED0
C - - - - - 0x0003D6 00:83C6: 20 15 C0  JSR sub_C015
C - - - - - 0x0003D9 00:83C9: A9 01     LDA #$01
C - - - - - 0x0003DB 00:83CB: 85 14     STA ram_0014
C - - - - - 0x0003DD 00:83CD: 85 03     STA ram_0003
C - - - - - 0x0003DF 00:83CF: 20 FA B4  JSR sub_B4FA
C - - - - - 0x0003E2 00:83D2: 20 A0 AC  JSR sub_ACA0

bra_83D5:
C - - - - - 0x0003E5 00:83D5: 20 DC B0  JSR sub_B0DC
C - - - - - 0x0003E8 00:83D8: A5 7C     LDA ram_007C
C - - - - - 0x0003EA 00:83DA: C9 0E     CMP #$0E
C - - - - - 0x0003EC 00:83DC: F0 0E     BEQ bra_83EC
C - - - - - 0x0003EE 00:83DE: A5 29     LDA ram_0029
C - - - - - 0x0003F0 00:83E0: D0 03     BNE bra_83E5
C - - - - - 0x0003F2 00:83E2: 4C 78 84  JMP loc_8478

bra_83E5:
- - - - - - 0x0003F5 00:83E5: A5 19     LDA ram_0019
- - - - - - 0x0003F7 00:83E7: F0 03     BEQ bra_83EC
- - - - - - 0x0003F9 00:83E9: 4C 8A 8A  JMP loc_8A8A

bra_83EC:
C - - - - - 0x0003FC 00:83EC: A9 01     LDA #$01
C - - - - - 0x0003FE 00:83EE: 85 05     STA ram_0005
C - - - - - 0x000400 00:83F0: 4C 18 8B  JMP loc_8B18

bra_83F3:
C - - - - - 0x000403 00:83F3: A9 00     LDA #$00
C - - - - - 0x000405 00:83F5: 85 81     STA ram_0081
C - - - - - 0x000407 00:83F7: A9 01     LDA #$01
C - - - - - 0x000409 00:83F9: 8D 38 06  STA ram_0638
C - - - - - 0x00040C 00:83FC: 8D 50 03  STA ram_0350
C - - - - - 0x00040F 00:83FF: 85 04     STA ram_0004
C - - - - - 0x000411 00:8401: A9 00     LDA #$00
C - - - - - 0x000413 00:8403: 85 7B     STA ram_007B
C - - - - - 0x000415 00:8405: 85 7C     STA ram_007C
C - - - - - 0x000417 00:8407: 85 29     STA ram_0029
C - - - - - 0x000419 00:8409: 4C 36 8B  JMP loc_8B36

loc_840C:
C D 0 - - - 0x00041C 00:840C: A5 29     LDA ram_0029
C - - - - - 0x00041E 00:840E: F0 15     BEQ bra_8425
- - - - - - 0x000420 00:8410: A9 00     LDA #$00
- - - - - - 0x000422 00:8412: 85 29     STA ram_0029
- - - - - - 0x000424 00:8414: A5 02     LDA ram_0002
- - - - - - 0x000426 00:8416: 49 01     EOR #$01
- - - - - - 0x000428 00:8418: 85 02     STA ram_0002
- - - - - - 0x00042A 00:841A: F0 06     BEQ bra_8422
- - - - - - 0x00042C 00:841C: 20 E6 87  JSR sub_87E6
- - - - - - 0x00042F 00:841F: 4C 18 8B  JMP loc_8B18

bra_8422:
- - - - - - 0x000432 00:8422: 20 34 C3  JSR sub_C334

bra_8425:
C - - - - - 0x000435 00:8425: A5 02     LDA ram_0002
C - - - - - 0x000437 00:8427: F0 03     BEQ bra_842C
- - - - - - 0x000439 00:8429: 4C 18 8B  JMP loc_8B18

bra_842C:
C - - - - - 0x00043C 00:842C: A5 04     LDA ram_0004
C - - - - - 0x00043E 00:842E: F0 48     BEQ bra_8478
C - - - - - 0x000440 00:8430: A9 00     LDA #$00
C - - - - - 0x000442 00:8432: 85 14     STA ram_0014
C - - - - - 0x000444 00:8434: 85 03     STA ram_0003
C - - - - - 0x000446 00:8436: 20 FA B4  JSR sub_B4FA
C - - - - - 0x000449 00:8439: 20 D0 BE  JSR sub_BED0
C - - - - - 0x00044C 00:843C: 20 15 C0  JSR sub_C015
C - - - - - 0x00044F 00:843F: A9 01     LDA #$01
C - - - - - 0x000451 00:8441: 85 14     STA ram_0014
C - - - - - 0x000453 00:8443: 85 03     STA ram_0003
C - - - - - 0x000455 00:8445: 20 FA B4  JSR sub_B4FA
C - - - - - 0x000458 00:8448: A9 00     LDA #$00
C - - - - - 0x00045A 00:844A: 85 03     STA ram_0003
C - - - - - 0x00045C 00:844C: AD 36 06  LDA ram_0636
C - - - - - 0x00045F 00:844F: F0 13     BEQ bra_8464
C - - - - - 0x000461 00:8451: 20 89 97  JSR sub_9789
C - - - - - 0x000464 00:8454: AD 39 06  LDA con_player_key	
C - - - - - 0x000467 00:8457: F0 0B     BEQ bra_8464
C - - - - - 0x000469 00:8459: A9 01     LDA #$01
C - - - - - 0x00046B 00:845B: 85 86     STA ram_0086
C - - - - - 0x00046D 00:845D: A9 79     LDA #$79				; key icon in status bar
C - - - - - 0x00046F 00:845F: 85 78     STA ram_0078
C - - - - - 0x000471 00:8461: 20 42 97  JSR sub_9742

bra_8464:
C - - - - - 0x000474 00:8464: AE 3B 06  LDX ram_063B
C - - - - - 0x000477 00:8467: A9 00     LDA #$00	
C - - - - - 0x000479 00:8469: 8D 36 06  STA ram_0636			; 
C - - - - - 0x00047C 00:846C: 8D 39 06  STA con_player_key		; restart key flag to false
C - - - - - 0x00047F 00:846F: 9D 2D 06  STA ram_062D,X
C - - - - - 0x000482 00:8472: 20 A0 AC  JSR sub_ACA0
C - - - - - 0x000485 00:8475: 20 75 B3  JSR sub_B375

bra_8478:
loc_8478:
C D 0 - - - 0x000488 00:8478: A5 CC     LDA ram_00CC
C - - - - - 0x00048A 00:847A: D0 08     BNE bra_8484
C - - - - - 0x00048C 00:847C: AD 45 06  LDA ram_0645
C - - - - - 0x00048F 00:847F: F0 03     BEQ bra_8484
C - - - - - 0x000491 00:8481: 20 95 C8  JSR sub_C895

bra_8484:
C - - - - - 0x000494 00:8484: A5 8B     LDA ram_008B
C - - - - - 0x000496 00:8486: F0 06     BEQ bra_848E
C - - - - - 0x000498 00:8488: 20 BA A1  JSR sub_A1BA
C - - - - - 0x00049B 00:848B: 4C 33 8B  JMP loc_8B33

bra_848E:
C - - - - - 0x00049E 00:848E: A5 83     LDA ram_0083
C - - - - - 0x0004A0 00:8490: F0 06     BEQ bra_8498
C - - - - - 0x0004A2 00:8492: 20 79 A2  JSR sub_A279
C - - - - - 0x0004A5 00:8495: 4C 33 8B  JMP loc_8B33

bra_8498:
C - - - - - 0x0004A8 00:8498: AD 2F 03  LDA ram_032F
C - - - - - 0x0004AB 00:849B: F0 06     BEQ bra_84A3
C - - - - - 0x0004AD 00:849D: 20 A0 A2  JSR sub_A2A0
C - - - - - 0x0004B0 00:84A0: 4C 33 8B  JMP loc_8B33

bra_84A3:
C - - - - - 0x0004B3 00:84A3: AD 30 03  LDA ram_0330
C - - - - - 0x0004B6 00:84A6: F0 06     BEQ bra_84AE
C - - - - - 0x0004B8 00:84A8: 20 52 A3  JSR sub_A352
C - - - - - 0x0004BB 00:84AB: 4C 18 8B  JMP loc_8B18

bra_84AE:
C - - - - - 0x0004BE 00:84AE: AD 31 03  LDA ram_0331
C - - - - - 0x0004C1 00:84B1: F0 08     BEQ bra_84BB
C - - - - - 0x0004C3 00:84B3: A9 00     LDA #$00
C - - - - - 0x0004C5 00:84B5: 8D 31 03  STA ram_0331
C - - - - - 0x0004C8 00:84B8: 4C 5E 88  JMP loc_885E

bra_84BB:
C - - - - - 0x0004CB 00:84BB: AD 8C 03  LDA ram_038C
C - - - - - 0x0004CE 00:84BE: F0 2E     BEQ bra_84EE
C - - - - - 0x0004D0 00:84C0: A9 01     LDA #$01
C - - - - - 0x0004D2 00:84C2: 85 86     STA ram_0086
C - - - - - 0x0004D4 00:84C4: A9 59     LDA #$59						; invincible potion icon in status bar
C - - - - - 0x0004D6 00:84C6: 85 78     STA ram_0078
C - - - - - 0x0004D8 00:84C8: 20 42 97  JSR sub_9742

bra_84CB:
C - - - - - 0x0004DB 00:84CB: AD 37 06  LDA con_player_current_health
C - - - - - 0x0004DE 00:84CE: C9 02     CMP #$02
C - - - - - 0x0004E0 00:84D0: B0 10     BCS bra_84E2
C - - - - - 0x0004E2 00:84D2: EE 37 06  INC con_player_current_health
C - - - - - 0x0004E5 00:84D5: AD 37 06  LDA con_player_current_health
C - - - - - 0x0004E8 00:84D8: 0A        ASL
C - - - - - 0x0004E9 00:84D9: 0A        ASL
C - - - - - 0x0004EA 00:84DA: A8        TAY
C - - - - - 0x0004EB 00:84DB: A9 10     LDA #$10
C - - - - - 0x0004ED 00:84DD: 99 50 02  STA ram_0250,Y
C - - - - - 0x0004F0 00:84E0: D0 E9     BNE bra_84CB

bra_84E2:
C - - - - - 0x0004F2 00:84E2: 20 BD 97  JSR sub_97BD
C - - - - - 0x0004F5 00:84E5: 20 91 AB  JSR sub_AB91_check_and_change_level
C - - - - - 0x0004F8 00:84E8: 20 E6 87  JSR sub_87E6
C - - - - - 0x0004FB 00:84EB: 4C 18 8B  JMP loc_8B18

bra_84EE:
C - - - - - 0x0004FE 00:84EE: AD 8E 03  LDA ram_038E
C - - - - - 0x000501 00:84F1: F0 06     BEQ bra_84F9
C - - - - - 0x000503 00:84F3: 20 51 AD  JSR sub_AD51
C - - - - - 0x000506 00:84F6: 4C 18 8B  JMP loc_8B18

bra_84F9:
C - - - - - 0x000509 00:84F9: AD 36 06  LDA ram_0636
C - - - - - 0x00050C 00:84FC: F0 22     BEQ bra_8520
C - - - - - 0x00050E 00:84FE: AE 3B 06  LDX ram_063B
C - - - - - 0x000511 00:8501: FE 3C 06  INC con_p1_current_level,X
C - - - - - 0x000514 00:8504: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x000517 00:8507: C9 05     CMP #$05
C - - - - - 0x000519 00:8509: D0 07     BNE bra_8512
C - - - - - 0x00051B 00:850B: A9 01     LDA #$01
C - - - - - 0x00051D 00:850D: 8D 45 06  STA ram_0645
C - - - - - 0x000520 00:8510: D0 05     BNE bra_8517

bra_8512:
C - - - - - 0x000522 00:8512: A9 00     LDA #$00
C - - - - - 0x000524 00:8514: 8D 45 06  STA ram_0645

bra_8517:
C - - - - - 0x000527 00:8517: 20 69 95  JSR sub_9569
C - - - - - 0x00052A 00:851A: 20 34 C3  JSR sub_C334
C - - - - - 0x00052D 00:851D: 4C 36 8B  JMP loc_8B36

bra_8520:
C - - - - - 0x000530 00:8520: 20 BB B2  JSR sub_B2BB
C - - - - - 0x000533 00:8523: A5 16     LDA ram_0016
C - - - - - 0x000535 00:8525: 8D 05 20  STA $2005
C - - - - - 0x000538 00:8528: A5 17     LDA ram_0017
C - - - - - 0x00053A 00:852A: 8D 05 20  STA $2005
C - - - - - 0x00053D 00:852D: AD 3D 03  LDA ram_033D
C - - - - - 0x000540 00:8530: F0 11     BEQ bra_8543
C - - - - - 0x000542 00:8532: A5 81     LDA ram_0081
C - - - - - 0x000544 00:8534: D0 0D     BNE bra_8543
C - - - - - 0x000546 00:8536: A9 01     LDA #$01
C - - - - - 0x000548 00:8538: 8D 4B 06  STA ram_064B
C - - - - - 0x00054B 00:853B: A9 00     LDA #$00
C - - - - - 0x00054D 00:853D: 8D 3D 03  STA ram_033D
C - - - - - 0x000550 00:8540: 4C 36 8B  JMP loc_8B36

bra_8543:
C - - - - - 0x000553 00:8543: A5 CF     LDA ram_00CF
C - - - - - 0x000555 00:8545: F0 34     BEQ bra_857B
C - - - - - 0x000557 00:8547: A5 7B     LDA ram_007B
C - - - - - 0x000559 00:8549: 29 03     AND #$03
C - - - - - 0x00055B 00:854B: D0 04     BNE bra_8551
C - - - - - 0x00055D 00:854D: A9 03     LDA #$03
C - - - - - 0x00055F 00:854F: 85 D2     STA ram_00D2

bra_8551:
C - - - - - 0x000561 00:8551: A5 81     LDA ram_0081
C - - - - - 0x000563 00:8553: D0 26     BNE bra_857B
C - - - - - 0x000565 00:8555: AD 42 06  LDA ram_0642
C - - - - - 0x000568 00:8558: F0 08     BEQ bra_8562
C - - - - - 0x00056A 00:855A: AD 3B 06  LDA ram_063B
C - - - - - 0x00056D 00:855D: 49 01     EOR #$01
C - - - - - 0x00056F 00:855F: 8D 3B 06  STA ram_063B

bra_8562:
C - - - - - 0x000572 00:8562: 20 69 95  JSR sub_9569
C - - - - - 0x000575 00:8565: A9 00     LDA #$00
C - - - - - 0x000577 00:8567: 8D 40 06  STA ram_0640
C - - - - - 0x00057A 00:856A: 8D 41 06  STA ram_0641
C - - - - - 0x00057D 00:856D: 8D 39 06  STA con_player_key	
C - - - - - 0x000580 00:8570: A9 02     LDA #$02
C - - - - - 0x000582 00:8572: 8D 37 06  STA con_player_current_health
C - - - - - 0x000585 00:8575: 8D 50 03  STA ram_0350
C - - - - - 0x000588 00:8578: 4C 36 8B  JMP loc_8B36

bra_857B:
C - - - - - 0x00058B 00:857B: A5 CC     LDA ram_00CC
C - - - - - 0x00058D 00:857D: F0 5F     BEQ bra_85DE
C - - - - - 0x00058F 00:857F: A5 CD     LDA ram_00CD
C - - - - - 0x000591 00:8581: D0 54     BNE bra_85D7
C - - - - - 0x000593 00:8583: A9 00     LDA #$00
C - - - - - 0x000595 00:8585: 8D 86 05  STA ram_0586
C - - - - - 0x000598 00:8588: 8D 33 03  STA ram_0333
C - - - - - 0x00059B 00:858B: 8D 34 03  STA con_item_invincible_potion_timer
C - - - - - 0x00059E 00:858E: 85 C8     STA ram_00C8
C - - - - - 0x0005A0 00:8590: 8D 16 03  STA ram_0316
C - - - - - 0x0005A3 00:8593: 85 24     STA ram_0024
C - - - - - 0x0005A5 00:8595: 85 4C     STA ram_004C
C - - - - - 0x0005A7 00:8597: AD 45 06  LDA ram_0645
C - - - - - 0x0005AA 00:859A: F0 0B     BEQ bra_85A7
C - - - - - 0x0005AC 00:859C: A9 95     LDA #>tbl_951A_spr_littlehood_swim_death
C - - - - - 0x0005AE 00:859E: 85 46     STA ram_0046
C - - - - - 0x0005B0 00:85A0: A9 1A     LDA #<tbl_951A_spr_littlehood_swim_death
C - - - - - 0x0005B2 00:85A2: 85 45     STA ram_0045
C - - - - - 0x0005B4 00:85A4: 4C AF 85  JMP loc_85AF

bra_85A7:
C - - - - - 0x0005B7 00:85A7: A9 94     LDA #>tbl_945A_spr_littlehood_death
C - - - - - 0x0005B9 00:85A9: 85 46     STA ram_0046
C - - - - - 0x0005BB 00:85AB: A9 5A     LDA #<tbl_945A_spr_littlehood_death
C - - - - - 0x0005BD 00:85AD: 85 45     STA ram_0045

loc_85AF:
C D 0 - - - 0x0005BF 00:85AF: A5 2C     LDA con_player_position_x
C - - - - - 0x0005C1 00:85B1: 85 4E     STA ram_004E
C - - - - - 0x0005C3 00:85B3: A5 2D     LDA con_player_position_y
C - - - - - 0x0005C5 00:85B5: 85 4D     STA ram_004D
C - - - - - 0x0005C7 00:85B7: 20 CE C0  JSR sub_C0CE
C - - - - - 0x0005CA 00:85BA: A9 01     LDA #$01
C - - - - - 0x0005CC 00:85BC: 85 CD     STA ram_00CD
C - - - - - 0x0005CE 00:85BE: 85 81     STA ram_0081
C - - - - - 0x0005D0 00:85C0: A9 F0     LDA #$F0
C - - - - - 0x0005D2 00:85C2: 8D 31 06  STA ram_0631
C - - - - - 0x0005D5 00:85C5: AE 3B 06  LDX ram_063B
C - - - - - 0x0005D8 00:85C8: FE 3E 06  INC ram_063E,X
C - - - - - 0x0005DB 00:85CB: BD 3E 06  LDA ram_063E,X
C - - - - - 0x0005DE 00:85CE: C9 04     CMP #$04
C - - - - - 0x0005E0 00:85D0: D0 05     BNE bra_85D7
C - - - - - 0x0005E2 00:85D2: A9 01     LDA #$01
C - - - - - 0x0005E4 00:85D4: 8D 3D 03  STA ram_033D

bra_85D7:
C - - - - - 0x0005E7 00:85D7: A9 01     LDA #$01
C - - - - - 0x0005E9 00:85D9: 85 CF     STA ram_00CF
C - - - - - 0x0005EB 00:85DB: 4C BD 8A  JMP loc_8ABD

bra_85DE:
C - - - - - 0x0005EE 00:85DE: A5 CB     LDA ram_00CB
C - - - - - 0x0005F0 00:85E0: F0 2A     BEQ bra_860C
C - - - - - 0x0005F2 00:85E2: A9 00     LDA #$00
C - - - - - 0x0005F4 00:85E4: 85 CB     STA ram_00CB
C - - - - - 0x0005F6 00:85E6: A5 81     LDA ram_0081
C - - - - - 0x0005F8 00:85E8: D0 22     BNE bra_860C
C - - - - - 0x0005FA 00:85EA: A9 01     LDA #$01
C - - - - - 0x0005FC 00:85EC: 85 81     STA ram_0081
C - - - - - 0x0005FE 00:85EE: A9 F0     LDA #$F0
C - - - - - 0x000600 00:85F0: 8D 31 06  STA ram_0631
C - - - - - 0x000603 00:85F3: AD 37 06  LDA con_player_current_health
C - - - - - 0x000606 00:85F6: 0A        ASL
C - - - - - 0x000607 00:85F7: 0A        ASL
C - - - - - 0x000608 00:85F8: A8        TAY
C - - - - - 0x000609 00:85F9: A9 F8     LDA #$F8
C - - - - - 0x00060B 00:85FB: 99 50 02  STA ram_0250,Y
C - - - - - 0x00060E 00:85FE: CE 37 06  DEC con_player_current_health
C - - - - - 0x000611 00:8601: AD 37 06  LDA con_player_current_health
C - - - - - 0x000614 00:8604: C9 FF     CMP #$FF
C - - - - - 0x000616 00:8606: D0 04     BNE bra_860C
C - - - - - 0x000618 00:8608: A9 01     LDA #$01
C - - - - - 0x00061A 00:860A: 85 CC     STA ram_00CC

bra_860C:
C - - - - - 0x00061C 00:860C: A5 CA     LDA ram_00CA
C - - - - - 0x00061E 00:860E: F0 26     BEQ bra_8636
C - - - - - 0x000620 00:8610: A9 00     LDA #$00
C - - - - - 0x000622 00:8612: 85 CA     STA ram_00CA

loc_8614_check_health:
C D 0 - - - 0x000624 00:8614: AD 37 06  LDA con_player_current_health		; Load player health
C - - - - - 0x000627 00:8617: C9 05     CMP #$05							; Compare if player has max health
C - - - - - 0x000629 00:8619: D0 06     BNE bra_8621_increase_max_health	; If not
C - - - - - 0x00062B 00:861B: A9 00     LDA #$00
C - - - - - 0x00062D 00:861D: 85 CE     STA ram_00CE
C - - - - - 0x00062F 00:861F: F0 15     BEQ bra_8636

bra_8621_increase_max_health:
C - - - - - 0x000631 00:8621: EE 37 06  INC con_player_current_health		; Increment health 1 hearth
C - - - - - 0x000634 00:8624: AD 37 06  LDA con_player_current_health
C - - - - - 0x000637 00:8627: 0A        ASL
C - - - - - 0x000638 00:8628: 0A        ASL
C - - - - - 0x000639 00:8629: A8        TAY
C - - - - - 0x00063A 00:862A: A9 10     LDA #$10
C - - - - - 0x00063C 00:862C: 99 50 02  STA ram_0250,Y
C - - - - - 0x00063F 00:862F: A5 CE     LDA ram_00CE
C - - - - - 0x000641 00:8631: F0 03     BEQ bra_8636
C - - - - - 0x000643 00:8633: 4C 14 86  JMP loc_8614_check_health

bra_8636:
C - - - - - 0x000646 00:8636: A5 12     LDA ram_0012
C - - - - - 0x000648 00:8638: D0 03     BNE bra_863D
C - - - - - 0x00064A 00:863A: 4C 8F 86  JMP loc_868F

bra_863D:
C - - - - - 0x00064D 00:863D: 20 DB B1  JSR sub_B1DB
C - - - - - 0x000650 00:8640: A9 00     LDA #$00
C - - - - - 0x000652 00:8642: 85 14     STA ram_0014
C - - - - - 0x000654 00:8644: 85 12     STA ram_0012
C - - - - - 0x000656 00:8646: A9 01     LDA #$01
C - - - - - 0x000658 00:8648: 85 15     STA ram_0015
C - - - - - 0x00065A 00:864A: 8D 15 03  STA ram_0315
C - - - - - 0x00065D 00:864D: 85 18     STA ram_0018
C - - - - - 0x00065F 00:864F: 8D 1A 03  STA con_store_selected_item_id 
C - - - - - 0x000662 00:8652: 85 32     STA ram_0032
C - - - - - 0x000664 00:8654: A9 02     LDA #$02
C - - - - - 0x000666 00:8656: 85 03     STA ram_0003
C - - - - - 0x000668 00:8658: 85 33     STA ram_0033
C - - - - - 0x00066A 00:865A: 20 FA B4  JSR sub_B4FA
C - - - - - 0x00066D 00:865D: A9 01     LDA #$01
C - - - - - 0x00066F 00:865F: 85 03     STA ram_0003
C - - - - - 0x000671 00:8661: 20 D0 BE  JSR sub_BED0
C - - - - - 0x000674 00:8664: 20 15 C0  JSR sub_C015
C - - - - - 0x000677 00:8667: 20 E6 87  JSR sub_87E6
C - - - - - 0x00067A 00:866A: A9 92     LDA #$92
C - - - - - 0x00067C 00:866C: 8D 78 02  STA ram_0278
C - - - - - 0x00067F 00:866F: A9 61     LDA #$61
C - - - - - 0x000681 00:8671: 8D 79 02  STA ram_0279
C - - - - - 0x000684 00:8674: A9 01     LDA #$01
C - - - - - 0x000686 00:8676: 8D 7A 02  STA ram_027A
C - - - - - 0x000689 00:8679: A9 A0     LDA #$A0
C - - - - - 0x00068B 00:867B: 8D 7B 02  STA ram_027B
C - - - - - 0x00068E 00:867E: A9 01     LDA #$01
C - - - - - 0x000690 00:8680: 85 63     STA ram_0063
C - - - - - 0x000692 00:8682: 20 89 97  JSR sub_9789
C - - - - - 0x000695 00:8685: A9 00     LDA #$00
C - - - - - 0x000697 00:8687: 8D 39 03  STA con_item_slingshot_proyectile_distance
C - - - - - 0x00069A 00:868A: 85 15     STA ram_0015
C - - - - - 0x00069C 00:868C: 4C D0 88  JMP loc_88D0

loc_868F:
C D 0 - - - 0x00069F 00:868F: 20 DB B5  JSR sub_B5DB
C - - - - - 0x0006A2 00:8692: A5 18     LDA ram_0018
C - - - - - 0x0006A4 00:8694: D0 03     BNE bra_8699
C - - - - - 0x0006A6 00:8696: 4C 94 87  JMP loc_8794

bra_8699:
C - - - - - 0x0006A9 00:8699: 20 51 98  JSR sub_9851
C - - - - - 0x0006AC 00:869C: AD 14 03  LDA ram_0314
C - - - - - 0x0006AF 00:869F: F0 3F     BEQ bra_86E0
C - - - - - 0x0006B1 00:86A1: A9 06     LDA #$06
C - - - - - 0x0006B3 00:86A3: 85 D2     STA ram_00D2
C - - - - - 0x0006B5 00:86A5: A9 00     LDA #$00
C - - - - - 0x0006B7 00:86A7: 8D 14 03  STA ram_0314
C - - - - - 0x0006BA 00:86AA: AD 1A 03  LDA con_store_selected_item_id 
C - - - - - 0x0006BD 00:86AD: C9 01     CMP #$01
C - - - - - 0x0006BF 00:86AF: D0 07     BNE bra_86B8
C - - - - - 0x0006C1 00:86B1: A9 01     LDA #$01
C - - - - - 0x0006C3 00:86B3: 8D 17 03  STA ram_0317
C - - - - - 0x0006C6 00:86B6: D0 09     BNE bra_86C1

bra_86B8:
C - - - - - 0x0006C8 00:86B8: C9 03     CMP #$03
C - - - - - 0x0006CA 00:86BA: D0 05     BNE bra_86C1
C - - - - - 0x0006CC 00:86BC: A9 00     LDA #$00
C - - - - - 0x0006CE 00:86BE: 8D 17 03  STA ram_0317

bra_86C1:
C - - - - - 0x0006D1 00:86C1: AD 17 03  LDA ram_0317
C - - - - - 0x0006D4 00:86C4: F0 0E     BEQ bra_86D4
C - - - - - 0x0006D6 00:86C6: EE 1A 03  INC con_store_selected_item_id 
C - - - - - 0x0006D9 00:86C9: AD 2B 02  LDA ram_022B
C - - - - - 0x0006DC 00:86CC: 18        CLC
C - - - - - 0x0006DD 00:86CD: 69 30     ADC #$30
C - - - - - 0x0006DF 00:86CF: 8D 2B 02  STA ram_022B
C - - - - - 0x0006E2 00:86D2: D0 0C     BNE bra_86E0

bra_86D4:
C - - - - - 0x0006E4 00:86D4: CE 1A 03  DEC con_store_selected_item_id 
C - - - - - 0x0006E7 00:86D7: AD 2B 02  LDA ram_022B
C - - - - - 0x0006EA 00:86DA: 38        SEC
C - - - - - 0x0006EB 00:86DB: E9 30     SBC #$30
C - - - - - 0x0006ED 00:86DD: 8D 2B 02  STA ram_022B

bra_86E0:
C - - - - - 0x0006F0 00:86E0: 20 6B 98  JSR sub_986B
C - - - - - 0x0006F3 00:86E3: AD 1B 03  LDA ram_031B
C - - - - - 0x0006F6 00:86E6: D0 03     BNE bra_86EB_store_buy_item
C - - - - - 0x0006F8 00:86E8: 4C 94 87  JMP loc_8794

bra_86EB_store_buy_item:
C - - - - - 0x0006FB 00:86EB: A9 00     LDA #$00
C - - - - - 0x0006FD 00:86ED: 8D 1B 03  STA ram_031B
C - - - - - 0x000700 00:86F0: A9 06     LDA #$06
C - - - - - 0x000702 00:86F2: 85 D2     STA ram_00D2
C - - - - - 0x000704 00:86F4: AE 3B 06  LDX ram_063B
C - - - - - 0x000707 00:86F7: AD 1A 03  LDA con_store_selected_item_id 		; store selected item ID (01=invincible potion, 02=max health, 03=slingshot)
C - - - - - 0x00070A 00:86FA: C9 01     CMP #$01
C - - - - - 0x00070C 00:86FC: D0 36     BNE bra_8734
C - - - - - 0x00070E 00:86FE: AD 16 03  LDA ram_0316
C - - - - - 0x000711 00:8701: D0 2E     BNE bra_8731
C - - - - - 0x000713 00:8703: AD 4D 02  LDA ram_024D
C - - - - - 0x000716 00:8706: C9 7D     CMP #$7D
C - - - - - 0x000718 00:8708: D0 27     BNE bra_8731
C - - - - - 0x00071A 00:870A: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x00071D 00:870D: C9 0F     CMP #$0F
C - - - - - 0x00071F 00:870F: 90 20     BCC bra_8731
C - - - - - 0x000721 00:8711: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x000724 00:8714: 38        SEC
C - - - - - 0x000725 00:8715: E9 0F     SBC #$0F							; invincible potion cost $1500
C - - - - - 0x000727 00:8717: 9D 33 06  STA con_player_current_money,X		; subtract from player current money
C - - - - - 0x00072A 00:871A: A9 01     LDA #$01
C - - - - - 0x00072C 00:871C: 85 67     STA ram_0067
C - - - - - 0x00072E 00:871E: 8D 15 03  STA ram_0315
C - - - - - 0x000731 00:8721: 8D 16 03  STA ram_0316
C - - - - - 0x000734 00:8724: 85 B5     STA ram_00B5
C - - - - - 0x000736 00:8726: A9 59     LDA #$59							; invincible potion icon in status bar
C - - - - - 0x000738 00:8728: 85 78     STA ram_0078
C - - - - - 0x00073A 00:872A: A9 01     LDA #$01
C - - - - - 0x00073C 00:872C: 85 90     STA ram_0090
C - - - - - 0x00073E 00:872E: 20 00 97  JSR sub_9700

bra_8731:
C - - - - - 0x000741 00:8731: 4C 18 8B  JMP loc_8B18

bra_8734:
C - - - - - 0x000744 00:8734: C9 02     CMP #$02
C - - - - - 0x000746 00:8736: D0 24     BNE bra_875C
C - - - - - 0x000748 00:8738: AD 64 02  LDA ram_0264
C - - - - - 0x00074B 00:873B: C9 F8     CMP #$F8
C - - - - - 0x00074D 00:873D: D0 F2     BNE bra_8731
C - - - - - 0x00074F 00:873F: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x000752 00:8742: C9 14     CMP #$14
C - - - - - 0x000754 00:8744: 90 EB     BCC bra_8731
C - - - - - 0x000756 00:8746: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x000759 00:8749: 38        SEC
C - - - - - 0x00075A 00:874A: E9 14     SBC #$14							; max health cost $2000
C - - - - - 0x00075C 00:874C: 9D 33 06  STA con_player_current_money,X		; subtract from player current money
C - - - - - 0x00075F 00:874F: A9 01     LDA #$01
C - - - - - 0x000761 00:8751: 8D 15 03  STA ram_0315
C - - - - - 0x000764 00:8754: 85 CA     STA ram_00CA
C - - - - - 0x000766 00:8756: 85 B5     STA ram_00B5
C - - - - - 0x000768 00:8758: 85 CE     STA ram_00CE
C - - - - - 0x00076A 00:875A: D0 D5     BNE bra_8731

bra_875C:
C - - - - - 0x00076C 00:875C: C9 03     CMP #$03
C - - - - - 0x00076E 00:875E: D0 D1     BNE bra_8731						; If not any of them, return (Protection?)
C - - - - - 0x000770 00:8760: AD 4D 02  LDA ram_024D
C - - - - - 0x000773 00:8763: C9 7D     CMP #$7D
C - - - - - 0x000775 00:8765: D0 CA     BNE bra_8731
C - - - - - 0x000777 00:8767: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x00077A 00:876A: C9 0A     CMP #$0A
C - - - - - 0x00077C 00:876C: 90 C3     BCC bra_8731
C - - - - - 0x00077E 00:876E: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x000781 00:8771: 38        SEC
C - - - - - 0x000782 00:8772: E9 0A     SBC #$0A							; slingshot cost $1000
C - - - - - 0x000784 00:8774: 9D 33 06  STA con_player_current_money,X 		; subtract from player current money
C - - - - - 0x000787 00:8777: A9 01     LDA #$01
C - - - - - 0x000789 00:8779: 8D 15 03  STA ram_0315
C - - - - - 0x00078C 00:877C: 85 B5     STA ram_00B5
C - - - - - 0x00078E 00:877E: 85 67     STA ram_0067
C - - - - - 0x000790 00:8780: EE 41 06  INC ram_0641
C - - - - - 0x000793 00:8783: A9 5A     LDA #$5A							; slingshot icon in status bar
C - - - - - 0x000795 00:8785: 85 78     STA ram_0078
C - - - - - 0x000797 00:8787: A9 01     LDA #$01
C - - - - - 0x000799 00:8789: 85 90     STA ram_0090
C - - - - - 0x00079B 00:878B: 8D 40 06  STA ram_0640
C - - - - - 0x00079E 00:878E: 20 00 97  JSR sub_9700
C - - - - - 0x0007A1 00:8791: 4C 18 8B  JMP loc_8B18

loc_8794:
C D 0 - - - 0x0007A4 00:8794: A5 70     LDA ram_0070
C - - - - - 0x0007A6 00:8796: D0 03     BNE bra_879B
C - - - - - 0x0007A8 00:8798: 4C DE 87  JMP loc_87DE

bra_879B:
C - - - - - 0x0007AB 00:879B: 20 BD 97  JSR sub_97BD
C - - - - - 0x0007AE 00:879E: A9 00     LDA #$00
C - - - - - 0x0007B0 00:87A0: 85 14     STA ram_0014
C - - - - - 0x0007B2 00:87A2: 85 70     STA ram_0070
C - - - - - 0x0007B4 00:87A4: 85 AD     STA ram_00AD
C - - - - - 0x0007B6 00:87A6: 85 B5     STA ram_00B5
C - - - - - 0x0007B8 00:87A8: 85 B4     STA ram_00B4
C - - - - - 0x0007BA 00:87AA: 85 03     STA ram_0003
C - - - - - 0x0007BC 00:87AC: 8D 17 03  STA ram_0317
C - - - - - 0x0007BF 00:87AF: 20 D0 BE  JSR sub_BED0
C - - - - - 0x0007C2 00:87B2: 20 FA B4  JSR sub_B4FA
C - - - - - 0x0007C5 00:87B5: 20 34 C3  JSR sub_C334
C - - - - - 0x0007C8 00:87B8: 20 4C B2  JSR sub_B24C
C - - - - - 0x0007CB 00:87BB: AD 39 06  LDA con_player_key	
C - - - - - 0x0007CE 00:87BE: F0 0C     BEQ bra_87CC
C - - - - - 0x0007D0 00:87C0: A4 BB     LDY ram_00BB
C - - - - - 0x0007D2 00:87C2: F0 08     BEQ bra_87CC
- - - - - - 0x0007D4 00:87C4: A9 F8     LDA #$F8
- - - - - - 0x0007D6 00:87C6: 99 68 02  STA ram_0268,Y
- - - - - - 0x0007D9 00:87C9: 99 6C 02  STA ram_026C,Y

bra_87CC:
C - - - - - 0x0007DC 00:87CC: A9 00     LDA #$00
C - - - - - 0x0007DE 00:87CE: 85 18     STA ram_0018
C - - - - - 0x0007E0 00:87D0: 85 7C     STA ram_007C
C - - - - - 0x0007E2 00:87D2: 85 7B     STA ram_007B
C - - - - - 0x0007E4 00:87D4: 85 50     STA ram_0050
C - - - - - 0x0007E6 00:87D6: 85 63     STA ram_0063
C - - - - - 0x0007E8 00:87D8: 20 75 B3  JSR sub_B375
C - - - - - 0x0007EB 00:87DB: 4C 36 8B  JMP loc_8B36

loc_87DE:
C D 0 - - - 0x0007EE 00:87DE: AD 23 03  LDA ram_0323
C - - - - - 0x0007F1 00:87E1: D0 0C     BNE bra_87EF
C - - - - - 0x0007F3 00:87E3: 4C 49 88  JMP loc_8849

sub_87E6:
C - - - - - 0x0007F6 00:87E6: A9 00     LDA #$00
C - - - - - 0x0007F8 00:87E8: 8D 15 40  STA $4015
C - - - - - 0x0007FB 00:87EB: 8D 82 06  STA ram_0682
C - - - - - 0x0007FE 00:87EE: 60        RTS

bra_87EF:
C - - - - - 0x0007FF 00:87EF: 20 DB B1  JSR sub_B1DB
C - - - - - 0x000802 00:87F2: A9 00     LDA #$00
C - - - - - 0x000804 00:87F4: 8D 23 03  STA ram_0323
C - - - - - 0x000807 00:87F7: 85 14     STA ram_0014
C - - - - - 0x000809 00:87F9: A9 01     LDA #$01
C - - - - - 0x00080B 00:87FB: 85 91     STA ram_0091
C - - - - - 0x00080D 00:87FD: 8D 29 03  STA ram_0329
C - - - - - 0x000810 00:8800: 8D 20 03  STA ram_0320
C - - - - - 0x000813 00:8803: 85 32     STA ram_0032
C - - - - - 0x000815 00:8805: A5 33     LDA ram_0033
C - - - - - 0x000817 00:8807: 85 03     STA ram_0003
C - - - - - 0x000819 00:8809: 20 FA B4  JSR sub_B4FA
C - - - - - 0x00081C 00:880C: 20 D0 BE  JSR sub_BED0
C - - - - - 0x00081F 00:880F: 20 A3 C6  JSR sub_C6A3
C - - - - - 0x000822 00:8812: A9 02     LDA #$02
C - - - - - 0x000824 00:8814: 85 03     STA ram_0003
C - - - - - 0x000826 00:8816: 20 15 C0  JSR sub_C015
C - - - - - 0x000829 00:8819: 20 89 97  JSR sub_9789
C - - - - - 0x00082C 00:881C: 20 E6 87  JSR sub_87E6
C - - - - - 0x00082F 00:881F: A9 01     LDA #$01
C - - - - - 0x000831 00:8821: 8D 2A 03  STA ram_032A
C - - - - - 0x000834 00:8824: AD 10 02  LDA ram_0210
C - - - - - 0x000837 00:8827: 8D 2C 03  STA ram_032C
C - - - - - 0x00083A 00:882A: AD 13 02  LDA ram_0213
C - - - - - 0x00083D 00:882D: 8D 2B 03  STA ram_032B
C - - - - - 0x000840 00:8830: A9 00     LDA #$00
C - - - - - 0x000842 00:8832: 85 91     STA ram_0091
C - - - - - 0x000844 00:8834: A9 08     LDA #$08
C - - - - - 0x000846 00:8836: 85 DB     STA ram_00DB
C - - - - - 0x000848 00:8838: AD 2B 03  LDA ram_032B
C - - - - - 0x00084B 00:883B: 85 F0     STA ram_00F0
C - - - - - 0x00084D 00:883D: AD 2C 03  LDA ram_032C
C - - - - - 0x000850 00:8840: 85 F1     STA ram_00F1
C - - - - - 0x000852 00:8842: A9 01     LDA #$01
C - - - - - 0x000854 00:8844: 85 F5     STA ram_00F5
C - - - - - 0x000856 00:8846: 4C C7 88  JMP loc_88C7

loc_8849:
C D 0 - - - 0x000859 00:8849: AD 1F 03  LDA ram_031F
C - - - - - 0x00085C 00:884C: D0 03     BNE bra_8851
C - - - - - 0x00085E 00:884E: 4C 96 88  JMP loc_8896

bra_8851:
C - - - - - 0x000861 00:8851: A9 00     LDA #$00
C - - - - - 0x000863 00:8853: 8D 1F 03  STA ram_031F
C - - - - - 0x000866 00:8856: 8D 27 03  STA ram_0327
C - - - - - 0x000869 00:8859: 85 4B     STA ram_004B
C - - - - - 0x00086B 00:885B: 8D 29 03  STA ram_0329

loc_885E:
C D 0 - - - 0x00086E 00:885E: 85 14     STA ram_0014
C - - - - - 0x000870 00:8860: 85 03     STA ram_0003
C - - - - - 0x000872 00:8862: 85 32     STA ram_0032
C - - - - - 0x000874 00:8864: 20 BD 97  JSR sub_97BD
C - - - - - 0x000877 00:8867: 20 D0 BE  JSR sub_BED0
C - - - - - 0x00087A 00:886A: 20 FA B4  JSR sub_B4FA
C - - - - - 0x00087D 00:886D: 20 4C B2  JSR sub_B24C
C - - - - - 0x000880 00:8870: A2 C0     LDX #$C0
C - - - - - 0x000882 00:8872: 20 53 A8  JSR sub_A853
C - - - - - 0x000885 00:8875: 20 34 C3  JSR sub_C334
C - - - - - 0x000888 00:8878: A9 20     LDA #$20
C - - - - - 0x00088A 00:887A: 8D 40 02  STA ram_0240
C - - - - - 0x00088D 00:887D: 8D 44 02  STA ram_0244
C - - - - - 0x000890 00:8880: 8D 48 02  STA ram_0248
C - - - - - 0x000893 00:8883: 8D 4C 02  STA ram_024C
C - - - - - 0x000896 00:8886: A9 00     LDA #$00
C - - - - - 0x000898 00:8888: 85 1C     STA ram_001C
C - - - - - 0x00089A 00:888A: 85 7C     STA ram_007C
C - - - - - 0x00089C 00:888C: 85 7B     STA ram_007B
C - - - - - 0x00089E 00:888E: 85 50     STA ram_0050
C - - - - - 0x0008A0 00:8890: 20 75 B3  JSR sub_B375
C - - - - - 0x0008A3 00:8893: 4C 36 8B  JMP loc_8B36

loc_8896:
C D 0 - - - 0x0008A6 00:8896: A5 E4     LDA ram_00E4
C - - - - - 0x0008A8 00:8898: F0 5F     BEQ bra_88F9
C - - - - - 0x0008AA 00:889A: A9 00     LDA #$00
C - - - - - 0x0008AC 00:889C: 85 14     STA ram_0014
C - - - - - 0x0008AE 00:889E: A9 01     LDA #$01
C - - - - - 0x0008B0 00:88A0: 85 6F     STA ram_006F
C - - - - - 0x0008B2 00:88A2: 8D 2F 03  STA ram_032F
C - - - - - 0x0008B5 00:88A5: 85 32     STA ram_0032
C - - - - - 0x0008B7 00:88A7: A9 04     LDA #$04
C - - - - - 0x0008B9 00:88A9: 85 03     STA ram_0003
C - - - - - 0x0008BB 00:88AB: 20 FA B4  JSR sub_B4FA
C - - - - - 0x0008BE 00:88AE: 20 D0 BE  JSR sub_BED0
C - - - - - 0x0008C1 00:88B1: A9 03     LDA #$03
C - - - - - 0x0008C3 00:88B3: 85 03     STA ram_0003
C - - - - - 0x0008C5 00:88B5: 85 33     STA ram_0033
C - - - - - 0x0008C7 00:88B7: 20 15 C0  JSR sub_C015
C - - - - - 0x0008CA 00:88BA: 20 89 97  JSR sub_9789
C - - - - - 0x0008CD 00:88BD: A9 00     LDA #$00
C - - - - - 0x0008CF 00:88BF: 85 6F     STA ram_006F
C - - - - - 0x0008D1 00:88C1: 85 E4     STA ram_00E4
C - - - - - 0x0008D3 00:88C3: 85 DE     STA ram_00DE
C - - - - - 0x0008D5 00:88C5: 85 D6     STA ram_00D6

loc_88C7:
C D 0 - - - 0x0008D7 00:88C7: A2 40     LDX #$40
C - - - - - 0x0008D9 00:88C9: 20 53 A8  JSR sub_A853
C - - - - - 0x0008DC 00:88CC: A9 00     LDA #$00
C - - - - - 0x0008DE 00:88CE: 85 5B     STA ram_005B

loc_88D0:
C D 0 - - - 0x0008E0 00:88D0: 8D 36 03  STA ram_0336
C - - - - - 0x0008E3 00:88D3: 8D 39 03  STA con_item_slingshot_proyectile_distance
C - - - - - 0x0008E6 00:88D6: 8D 34 03  STA con_item_invincible_potion_timer
C - - - - - 0x0008E9 00:88D9: 8D 33 03  STA ram_0333
C - - - - - 0x0008EC 00:88DC: 85 C8     STA ram_00C8
C - - - - - 0x0008EE 00:88DE: 8D 16 03  STA ram_0316
C - - - - - 0x0008F1 00:88E1: 85 1C     STA ram_001C
C - - - - - 0x0008F3 00:88E3: 85 81     STA ram_0081
C - - - - - 0x0008F5 00:88E5: A9 01     LDA #$01
C - - - - - 0x0008F7 00:88E7: 85 86     STA ram_0086
C - - - - - 0x0008F9 00:88E9: A9 59     LDA #$59						; invincible potion icon in status bar
C - - - - - 0x0008FB 00:88EB: 85 78     STA ram_0078
C - - - - - 0x0008FD 00:88ED: 20 42 97  JSR sub_9742
C - - - - - 0x000900 00:88F0: 20 A0 AC  JSR sub_ACA0
C - - - - - 0x000903 00:88F3: 20 E6 87  JSR sub_87E6
C - - - - - 0x000906 00:88F6: 4C 18 8B  JMP loc_8B18

bra_88F9:
C - - - - - 0x000909 00:88F9: 20 B0 9D  JSR sub_9DB0
C - - - - - 0x00090C 00:88FC: 20 79 9D  JSR sub_9D79
C - - - - - 0x00090F 00:88FF: A5 9E     LDA ram_009E
C - - - - - 0x000911 00:8901: D0 03     BNE bra_8906
C - - - - - 0x000913 00:8903: 4C CE 89  JMP loc_89CE

bra_8906:
C - - - - - 0x000916 00:8906: 20 16 AB  JSR sub_AB16
C - - - - - 0x000919 00:8909: A5 A0     LDA ram_00A0
C - - - - - 0x00091B 00:890B: C9 08     CMP #$08
C - - - - - 0x00091D 00:890D: F0 05     BEQ bra_8914
C - - - - - 0x00091F 00:890F: E6 A0     INC ram_00A0
C - - - - - 0x000921 00:8911: 4C BD 8A  JMP loc_8ABD

bra_8914:
C - - - - - 0x000924 00:8914: A9 00     LDA #$00
C - - - - - 0x000926 00:8916: 85 A0     STA ram_00A0
C - - - - - 0x000928 00:8918: 20 AA 9C  JSR sub_9CAA
C - - - - - 0x00092B 00:891B: A9 00     LDA #$00
C - - - - - 0x00092D 00:891D: 85 C5     STA ram_00C5
C - - - - - 0x00092F 00:891F: 8D 3C 03  STA ram_033C
C - - - - - 0x000932 00:8922: A5 57     LDA con_player_is_facing_up
C - - - - - 0x000934 00:8924: F0 03     BEQ bra_8929

bra_8926:
C - - - - - 0x000936 00:8926: 4C 7E 89  JMP loc_897E

bra_8929:
C - - - - - 0x000939 00:8929: AD 84 03  LDA ram_0384
C - - - - - 0x00093C 00:892C: 0D 20 03  ORA ram_0320
C - - - - - 0x00093F 00:892F: 05 18     ORA ram_0018
C - - - - - 0x000941 00:8931: 05 6F     ORA ram_006F
C - - - - - 0x000943 00:8933: D0 F1     BNE bra_8926
C - - - - - 0x000945 00:8935: A5 2C     LDA con_player_position_x
C - - - - - 0x000947 00:8937: CD D3 02  CMP ram_02D3
C - - - - - 0x00094A 00:893A: F0 EA     BEQ bra_8926
C - - - - - 0x00094C 00:893C: 20 F5 B6  JSR sub_B6F5
C - - - - - 0x00094F 00:893F: 20 0C 8C  JSR sub_8C0C
C - - - - - 0x000952 00:8942: A5 E3     LDA ram_00E3
C - - - - - 0x000954 00:8944: F0 38     BEQ bra_897E
C - - - - - 0x000956 00:8946: AD 03 02  LDA ram_0203
C - - - - - 0x000959 00:8949: 18        CLC
C - - - - - 0x00095A 00:894A: 65 16     ADC ram_0016
C - - - - - 0x00095C 00:894C: 4A        LSR
C - - - - - 0x00095D 00:894D: 4A        LSR
C - - - - - 0x00095E 00:894E: 4A        LSR
C - - - - - 0x00095F 00:894F: 4A        LSR
C - - - - - 0x000960 00:8950: 85 0F     STA ram_000F
C - - - - - 0x000962 00:8952: A5 2D     LDA con_player_position_y
C - - - - - 0x000964 00:8954: 29 0F     AND #$0F
C - - - - - 0x000966 00:8956: F0 0B     BEQ bra_8963
C - - - - - 0x000968 00:8958: C9 08     CMP #$08
C - - - - - 0x00096A 00:895A: 90 22     BCC bra_897E
C - - - - - 0x00096C 00:895C: A5 2D     LDA con_player_position_y
C - - - - - 0x00096E 00:895E: 29 F0     AND #$F0
C - - - - - 0x000970 00:8960: 4C 68 89  JMP loc_8968

bra_8963:
C - - - - - 0x000973 00:8963: A5 2D     LDA con_player_position_y
C - - - - - 0x000975 00:8965: 38        SEC
C - - - - - 0x000976 00:8966: E9 10     SBC #$10

loc_8968:
C D 0 - - - 0x000978 00:8968: 18        CLC
C - - - - - 0x000979 00:8969: 65 0F     ADC ram_000F
C - - - - - 0x00097B 00:896B: AA        TAX
C - - - - - 0x00097C 00:896C: 20 F2 C7  JSR sub_C7F2
C - - - - - 0x00097F 00:896F: 20 37 8C  JSR sub_8C37
C - - - - - 0x000982 00:8972: A5 0F     LDA ram_000F
C - - - - - 0x000984 00:8974: 90 08     BCC bra_897E
C - - - - - 0x000986 00:8976: A9 01     LDA #$01
C - - - - - 0x000988 00:8978: 8D 84 03  STA ram_0384
C - - - - - 0x00098B 00:897B: 20 87 9F  JSR sub_9F87

bra_897E:
loc_897E:
C D 0 - - - 0x00098E 00:897E: A9 00     LDA #$00
C - - - - - 0x000990 00:8980: 85 9E     STA ram_009E
C - - - - - 0x000992 00:8982: A5 56     LDA con_player_is_facing_right
C - - - - - 0x000994 00:8984: D0 0A     BNE bra_8990
C - - - - - 0x000996 00:8986: A5 55     LDA con_player_is_facing_left
C - - - - - 0x000998 00:8988: F0 14     BEQ bra_899E
C - - - - - 0x00099A 00:898A: A9 01     LDA #$01
C - - - - - 0x00099C 00:898C: 85 4C     STA ram_004C
C - - - - - 0x00099E 00:898E: D0 04     BNE bra_8994

bra_8990:
C - - - - - 0x0009A0 00:8990: A9 00     LDA #$00
C - - - - - 0x0009A2 00:8992: 85 4C     STA ram_004C

bra_8994:
C - - - - - 0x0009A4 00:8994: A9 94     LDA #$94
C - - - - - 0x0009A6 00:8996: 85 46     STA ram_0046
C - - - - - 0x0009A8 00:8998: A9 1B     LDA #$1B
C - - - - - 0x0009AA 00:899A: 85 45     STA ram_0045
C - - - - - 0x0009AC 00:899C: D0 1E     BNE bra_89BC

bra_899E:
C - - - - - 0x0009AE 00:899E: A5 57     LDA con_player_is_facing_up
C - - - - - 0x0009B0 00:89A0: F0 0E     BEQ bra_89B0
C - - - - - 0x0009B2 00:89A2: A9 94     LDA #$94
C - - - - - 0x0009B4 00:89A4: 85 46     STA ram_0046
C - - - - - 0x0009B6 00:89A6: A9 45     LDA #$45
C - - - - - 0x0009B8 00:89A8: 85 45     STA ram_0045
C - - - - - 0x0009BA 00:89AA: A9 00     LDA #$00
C - - - - - 0x0009BC 00:89AC: 85 4C     STA ram_004C
C - - - - - 0x0009BE 00:89AE: F0 0C     BEQ bra_89BC

bra_89B0:
C - - - - - 0x0009C0 00:89B0: A9 94     LDA #$94
C - - - - - 0x0009C2 00:89B2: 85 46     STA ram_0046
C - - - - - 0x0009C4 00:89B4: A9 30     LDA #$30
C - - - - - 0x0009C6 00:89B6: 85 45     STA ram_0045
C - - - - - 0x0009C8 00:89B8: A9 00     LDA #$00
C - - - - - 0x0009CA 00:89BA: 85 4C     STA ram_004C

bra_89BC:
C - - - - - 0x0009CC 00:89BC: A9 00     LDA #$00
C - - - - - 0x0009CE 00:89BE: 85 24     STA ram_0024
C - - - - - 0x0009D0 00:89C0: A5 2C     LDA con_player_position_x
C - - - - - 0x0009D2 00:89C2: 85 4E     STA ram_004E
C - - - - - 0x0009D4 00:89C4: A5 2D     LDA con_player_position_y
C - - - - - 0x0009D6 00:89C6: 85 4D     STA ram_004D
C - - - - - 0x0009D8 00:89C8: 20 CE C0  JSR sub_C0CE
C - - - - - 0x0009DB 00:89CB: 4C BD 8A  JMP loc_8ABD

loc_89CE:
C D 0 - - - 0x0009DE 00:89CE: 20 06 9C  JSR sub_9C06
C - - - - - 0x0009E1 00:89D1: A5 A8     LDA ram_00A8
C - - - - - 0x0009E3 00:89D3: D0 03     BNE bra_89D8
C - - - - - 0x0009E5 00:89D5: 4C 8A 8A  JMP loc_8A8A

bra_89D8:
C - - - - - 0x0009E8 00:89D8: AD 40 06  LDA ram_0640
C - - - - - 0x0009EB 00:89DB: F0 0E     BEQ bra_89EB
C - - - - - 0x0009ED 00:89DD: A9 00     LDA #$00
C - - - - - 0x0009EF 00:89DF: 85 A8     STA ram_00A8
C - - - - - 0x0009F1 00:89E1: A9 02     LDA #$02
C - - - - - 0x0009F3 00:89E3: 85 D2     STA ram_00D2
C - - - - - 0x0009F5 00:89E5: 20 2D 9B  JSR sub_9B2D
C - - - - - 0x0009F8 00:89E8: 4C BD 8A  JMP loc_8ABD

bra_89EB:
C - - - - - 0x0009FB 00:89EB: 20 16 AB  JSR sub_AB16
C - - - - - 0x0009FE 00:89EE: 20 62 A8  JSR sub_A862
C - - - - - 0x000A01 00:89F1: A5 A0     LDA ram_00A0
C - - - - - 0x000A03 00:89F3: F0 07     BEQ bra_89FC
C - - - - - 0x000A05 00:89F5: A9 02     LDA #$02
C - - - - - 0x000A07 00:89F7: 85 D2     STA ram_00D2
C - - - - - 0x000A09 00:89F9: 4C BD 8A  JMP loc_8ABD

bra_89FC:
C - - - - - 0x000A0C 00:89FC: A9 00     LDA #$00
C - - - - - 0x000A0E 00:89FE: 85 A0     STA ram_00A0
C - - - - - 0x000A10 00:8A00: 85 E8     STA ram_00E8
C - - - - - 0x000A12 00:8A02: 85 A8     STA ram_00A8
C - - - - - 0x000A14 00:8A04: 85 A5     STA ram_00A5
C - - - - - 0x000A16 00:8A06: 85 A6     STA ram_00A6
C - - - - - 0x000A18 00:8A08: 85 9F     STA ram_009F
C - - - - - 0x000A1A 00:8A0A: 85 38     STA ram_0038
C - - - - - 0x000A1C 00:8A0C: A9 01     LDA #$01
C - - - - - 0x000A1E 00:8A0E: 85 41     STA ram_0041
C - - - - - 0x000A20 00:8A10: A9 04     LDA #$04
C - - - - - 0x000A22 00:8A12: 85 1C     STA ram_001C
C - - - - - 0x000A24 00:8A14: 20 EC B6  JSR sub_B6EC
C - - - - - 0x000A27 00:8A17: A5 38     LDA ram_0038
C - - - - - 0x000A29 00:8A19: F0 1F     BEQ bra_8A3A
C - - - - - 0x000A2B 00:8A1B: A5 2D     LDA con_player_position_y
C - - - - - 0x000A2D 00:8A1D: 29 F0     AND #$F0
C - - - - - 0x000A2F 00:8A1F: 85 2D     STA con_player_position_y
C - - - - - 0x000A31 00:8A21: 8D 00 02  STA ram_0200
C - - - - - 0x000A34 00:8A24: 8D 08 02  STA ram_0208
C - - - - - 0x000A37 00:8A27: A5 2D     LDA con_player_position_y
C - - - - - 0x000A39 00:8A29: 18        CLC
C - - - - - 0x000A3A 00:8A2A: 69 08     ADC #$08
C - - - - - 0x000A3C 00:8A2C: 8D 04 02  STA ram_0204
C - - - - - 0x000A3F 00:8A2F: 8D 0C 02  STA ram_020C
C - - - - - 0x000A42 00:8A32: A9 00     LDA #$00
C - - - - - 0x000A44 00:8A34: 85 FE     STA ram_00FE
C - - - - - 0x000A46 00:8A36: 85 FF     STA ram_00FF
C - - - - - 0x000A48 00:8A38: D0 43     BNE bra_8A7D

bra_8A3A:
C - - - - - 0x000A4A 00:8A3A: 20 33 9A  JSR sub_9A33
C - - - - - 0x000A4D 00:8A3D: A5 FE     LDA ram_00FE
C - - - - - 0x000A4F 00:8A3F: D0 06     BNE bra_8A47
C - - - - - 0x000A51 00:8A41: A5 FF     LDA ram_00FF
C - - - - - 0x000A53 00:8A43: D0 1E     BNE bra_8A63
C - - - - - 0x000A55 00:8A45: F0 36     BEQ bra_8A7D

bra_8A47:
C - - - - - 0x000A57 00:8A47: AD E0 02  LDA ram_02E0
C - - - - - 0x000A5A 00:8A4A: 38        SEC
C - - - - - 0x000A5B 00:8A4B: E9 0E     SBC #$0E
C - - - - - 0x000A5D 00:8A4D: 85 2D     STA con_player_position_y
C - - - - - 0x000A5F 00:8A4F: 8D 00 02  STA ram_0200
C - - - - - 0x000A62 00:8A52: 8D 08 02  STA ram_0208
C - - - - - 0x000A65 00:8A55: AD E0 02  LDA ram_02E0
C - - - - - 0x000A68 00:8A58: 38        SEC
C - - - - - 0x000A69 00:8A59: E9 06     SBC #$06
C - - - - - 0x000A6B 00:8A5B: 8D 04 02  STA ram_0204
C - - - - - 0x000A6E 00:8A5E: 8D 0C 02  STA ram_020C
C - - - - - 0x000A71 00:8A61: D0 1A     BNE bra_8A7D

bra_8A63:
- - - - - - 0x000A73 00:8A63: AD F0 02  LDA ram_02F0
- - - - - - 0x000A76 00:8A66: 38        SEC
- - - - - - 0x000A77 00:8A67: E9 0E     SBC #$0E
- - - - - - 0x000A79 00:8A69: 85 2D     STA con_player_position_y
- - - - - - 0x000A7B 00:8A6B: 8D 00 02  STA ram_0200
- - - - - - 0x000A7E 00:8A6E: 8D 08 02  STA ram_0208
- - - - - - 0x000A81 00:8A71: AD F0 02  LDA ram_02F0
- - - - - - 0x000A84 00:8A74: 38        SEC
- - - - - - 0x000A85 00:8A75: E9 06     SBC #$06
- - - - - - 0x000A87 00:8A77: 8D 04 02  STA ram_0204
- - - - - - 0x000A8A 00:8A7A: 8D 0C 02  STA ram_020C

bra_8A7D:
C - - - - - 0x000A8D 00:8A7D: A9 00     LDA #$00
C - - - - - 0x000A8F 00:8A7F: 85 4B     STA ram_004B
C - - - - - 0x000A91 00:8A81: 85 1C     STA ram_001C
C - - - - - 0x000A93 00:8A83: 85 E7     STA ram_00E7
C - - - - - 0x000A95 00:8A85: 85 A7     STA ram_00A7
C - - - - - 0x000A97 00:8A87: 4C 7E 89  JMP loc_897E

loc_8A8A:
C D 0 - - - 0x000A9A 00:8A8A: AD 45 06  LDA ram_0645
C - - - - - 0x000A9D 00:8A8D: F0 03     BEQ bra_8A92
C - - - - - 0x000A9F 00:8A8F: 4C 2A 8B  JMP loc_8B2A

bra_8A92:
C - - - - - 0x000AA2 00:8A92: 20 BA 96  JSR sub_96BA
C - - - - - 0x000AA5 00:8A95: 20 8D BA  JSR sub_BA8D
C - - - - - 0x000AA8 00:8A98: 20 81 BE  JSR sub_BE81
C - - - - - 0x000AAB 00:8A9B: 20 EC B6  JSR sub_B6EC
C - - - - - 0x000AAE 00:8A9E: 20 1C B6  JSR sub_B61C
C - - - - - 0x000AB1 00:8AA1: 20 8C B5  JSR sub_B58C
C - - - - - 0x000AB4 00:8AA4: 20 CB C2  JSR sub_C2CB
C - - - - - 0x000AB7 00:8AA7: 20 6F C1  JSR sub_C16F
C - - - - - 0x000ABA 00:8AAA: 20 56 C1  JSR sub_C156
C - - - - - 0x000ABD 00:8AAD: A5 18     LDA ram_0018
C - - - - - 0x000ABF 00:8AAF: F0 03     BEQ bra_8AB4
C - - - - - 0x000AC1 00:8AB1: 4C 18 8B  JMP loc_8B18

bra_8AB4:
C - - - - - 0x000AC4 00:8AB4: 20 33 9A  JSR sub_9A33
C - - - - - 0x000AC7 00:8AB7: 20 92 9C  JSR sub_9C92
C - - - - - 0x000ACA 00:8ABA: 20 1B 9A  JSR sub_9A1B

loc_8ABD:
C D 0 - - - 0x000ACD 00:8ABD: 20 7D B3  JSR sub_B37D
C - - - - - 0x000AD0 00:8AC0: AD 16 03  LDA ram_0316
C - - - - - 0x000AD3 00:8AC3: F0 03     BEQ bra_8AC8
C - - - - - 0x000AD5 00:8AC5: 20 29 B3  JSR sub_B329

bra_8AC8:
C - - - - - 0x000AD8 00:8AC8: AD 20 03  LDA ram_0320
C - - - - - 0x000ADB 00:8ACB: 0D 45 06  ORA ram_0645
C - - - - - 0x000ADE 00:8ACE: D0 45     BNE bra_8B15
C - - - - - 0x000AE0 00:8AD0: 20 3F B1  JSR sub_B13F
C - - - - - 0x000AE3 00:8AD3: 20 93 AF  JSR sub_AF93
C - - - - - 0x000AE6 00:8AD6: 20 57 8C  JSR sub_8C57
C - - - - - 0x000AE9 00:8AD9: 20 7D 95  JSR sub_957D
C - - - - - 0x000AEC 00:8ADC: 20 A0 BA  JSR sub_BAA0
C - - - - - 0x000AEF 00:8ADF: 20 AC AE  JSR sub_AEAC
C - - - - - 0x000AF2 00:8AE2: 20 B7 BA  JSR sub_BAB7
C - - - - - 0x000AF5 00:8AE5: 20 0A A0  JSR sub_A00A
C - - - - - 0x000AF8 00:8AE8: 20 AF AC  JSR sub_ACAF
C - - - - - 0x000AFB 00:8AEB: 20 F1 9F  JSR sub_9FF1
C - - - - - 0x000AFE 00:8AEE: 20 C3 9F  JSR sub_9FC3
C - - - - - 0x000B01 00:8AF1: 20 85 98  JSR sub_9885
C - - - - - 0x000B04 00:8AF4: 20 A9 98  JSR sub_98A9
C - - - - - 0x000B07 00:8AF7: 20 80 A3  JSR sub_A380
C - - - - - 0x000B0A 00:8AFA: 20 C5 98  JSR sub_98C5
C - - - - - 0x000B0D 00:8AFD: 20 B7 AD  JSR sub_ADB7
C - - - - - 0x000B10 00:8B00: 20 1C AE  JSR sub_AE1C
C - - - - - 0x000B13 00:8B03: 20 55 AE  JSR sub_AE55
C - - - - - 0x000B16 00:8B06: 20 36 AE  JSR sub_AE36
C - - - - - 0x000B19 00:8B09: 20 C9 AC  JSR sub_ACC9
C - - - - - 0x000B1C 00:8B0C: 20 ED A4  JSR sub_A4ED
C - - - - - 0x000B1F 00:8B0F: A9 00     LDA #$00
C - - - - - 0x000B21 00:8B11: 85 73     STA ram_0073
C - - - - - 0x000B23 00:8B13: 85 74     STA ram_0074

bra_8B15:
C - - - - - 0x000B25 00:8B15: 20 7D A4  JSR sub_A47D

loc_8B18:
C D 0 - - - 0x000B28 00:8B18: 20 F6 B9  JSR sub_B9F6
C - - - - - 0x000B2B 00:8B1B: 20 F1 97  JSR sub_97F1
C - - - - - 0x000B2E 00:8B1E: 20 EB 96  JSR sub_96EB
C - - - - - 0x000B31 00:8B21: 20 68 AB  JSR sub_AB68
C - - - - - 0x000B34 00:8B24: 20 5F A4  JSR sub_A45F
C - - - - - 0x000B37 00:8B27: 20 F3 98  JSR sub_98F3

loc_8B2A:
C D 0 - - - 0x000B3A 00:8B2A: 20 33 96  JSR sub_9633
C - - - - - 0x000B3D 00:8B2D: 20 1D 96  JSR sub_961D
C - - - - - 0x000B40 00:8B30: 20 07 96  JSR sub_9607

loc_8B33:
C D 0 - - - 0x000B43 00:8B33: 20 73 B5  JSR sub_B573

loc_8B36:
C D 0 - - - 0x000B46 00:8B36: 20 F9 99  JSR sub_99F9
C - - - - - 0x000B49 00:8B39: AD 42 06  LDA ram_0642
C - - - - - 0x000B4C 00:8B3C: F0 0D     BEQ bra_8B4B
C - - - - - 0x000B4E 00:8B3E: AD 3B 06  LDA ram_063B
C - - - - - 0x000B51 00:8B41: F0 08     BEQ bra_8B4B
C - - - - - 0x000B53 00:8B43: A5 1C     LDA ram_001C
C - - - - - 0x000B55 00:8B45: 29 10     AND #$10
C - - - - - 0x000B57 00:8B47: 05 1D     ORA ram_001D
C - - - - - 0x000B59 00:8B49: 85 1C     STA ram_001C

bra_8B4B:
C - - - - - 0x000B5B 00:8B4B: 20 00 97  JSR sub_9700
C - - - - - 0x000B5E 00:8B4E: 20 88 C6  JSR sub_C688
C - - - - - 0x000B61 00:8B51: 20 9C C3  JSR sub_C39C
C - - - - - 0x000B64 00:8B54: 20 4A C5  JSR sub_C54A
C - - - - - 0x000B67 00:8B57: A5 00     LDA ram_0000
C - - - - - 0x000B69 00:8B59: 09 80     ORA #$80
C - - - - - 0x000B6B 00:8B5B: 85 00     STA ram_0000
C - - - - - 0x000B6D 00:8B5D: 8D 00 20  STA $2000
C - - - - - 0x000B70 00:8B60: A5 01     LDA ram_0001
C - - - - - 0x000B72 00:8B62: 09 1E     ORA #$1E
C - - - - - 0x000B74 00:8B64: 8D 01 20  STA $2001
C - - - - - 0x000B77 00:8B67: 85 01     STA ram_0001
C - - - - - 0x000B79 00:8B69: 20 46 C8  JSR sub_C846

loc_8B6C:
C D 0 - - - 0x000B7C 00:8B6C: E6 9A     INC ram_009A
C - - - - - 0x000B7E 00:8B6E: 68        PLA
C - - - - - 0x000B7F 00:8B6F: A8        TAY
C - - - - - 0x000B80 00:8B70: 68        PLA
C - - - - - 0x000B81 00:8B71: AA        TAX
C - - - - - 0x000B82 00:8B72: 68        PLA
C - - - - - 0x000B83 00:8B73: 40        RTI

bra_8B74:
- - - - - - 0x000B84 00:8B74: AD 38 06  LDA ram_0638
- - - - - - 0x000B87 00:8B77: D0 49     BNE bra_8BC2
- - - - - - 0x000B89 00:8B79: A5 1C     LDA ram_001C
- - - - - - 0x000B8B 00:8B7B: 29 08     AND #$08
- - - - - - 0x000B8D 00:8B7D: F0 2B     BEQ bra_8BAA
- - - - - - 0x000B8F 00:8B7F: AD 3E 03  LDA ram_033E
- - - - - - 0x000B92 00:8B82: D0 25     BNE bra_8BA9_RTS
- - - - - - 0x000B94 00:8B84: EE 3C 06  INC con_p1_current_level
- - - - - - 0x000B97 00:8B87: AD 3C 06  LDA con_p1_current_level
- - - - - - 0x000B9A 00:8B8A: C9 0B     CMP #$0B 					; if stage under level 12
- - - - - - 0x000B9C 00:8B8C: 90 05     BCC bra_8B93
- - - - - - 0x000B9E 00:8B8E: A9 01     LDA #$01
- - - - - - 0x000BA0 00:8B90: 8D 3C 06  STA con_p1_current_level

bra_8B93:
- - - - - - 0x000BA3 00:8B93: A9 01     LDA #$01
- - - - - - 0x000BA5 00:8B95: 8D 3E 03  STA ram_033E
- - - - - - 0x000BA8 00:8B98: A2 00     LDX #$00
- - - - - - 0x000BAA 00:8B9A: 9D 80 02  STA ram_0280,X
- - - - - - 0x000BAD 00:8B9D: E8        INX
- - - - - - 0x000BAE 00:8B9E: E0 04     CPX #$04
- - - - - - 0x000BB0 00:8BA0: AE 3C 06  LDX con_p1_current_level
- - - - - - 0x000BB3 00:8BA3: BD CD 8B  LDA tbl_8BCD_level_select,X
- - - - - - 0x000BB6 00:8BA6: 8D 81 02  STA ram_0281

bra_8BA9_RTS:
- - - - - - 0x000BB9 00:8BA9: 60        RTS

bra_8BAA:
- - - - - - 0x000BBA 00:8BAA: A9 00     LDA #$00
- - - - - - 0x000BBC 00:8BAC: 8D 3E 03  STA ram_033E
- - - - - - 0x000BBF 00:8BAF: AD 3C 06  LDA con_p1_current_level
- - - - - - 0x000BC2 00:8BB2: C9 05     CMP #$05
- - - - - - 0x000BC4 00:8BB4: D0 06     BNE bra_8BBC
- - - - - - 0x000BC6 00:8BB6: A9 01     LDA #$01
- - - - - - 0x000BC8 00:8BB8: 8D 45 06  STA ram_0645
- - - - - - 0x000BCB 00:8BBB: 60        RTS

bra_8BBC:
- - - - - - 0x000BCC 00:8BBC: A9 00     LDA #$00
- - - - - - 0x000BCE 00:8BBE: 8D 45 06  STA ram_0645
- - - - - - 0x000BD1 00:8BC1: 60        RTS

bra_8BC2:
- - - - - - 0x000BD2 00:8BC2: A5 1C     LDA ram_001C
- - - - - - 0x000BD4 00:8BC4: 29 20     AND #$20
- - - - - - 0x000BD6 00:8BC6: F0 E2     BEQ bra_8BAA
- - - - - - 0x000BD8 00:8BC8: A9 01     LDA #$01
- - - - - - 0x000BDA 00:8BCA: 85 05     STA ram_0005
- - - - - - 0x000BDC 00:8BCC: 60        RTS

tbl_8BCD_level_select:
- - - - - - 0x000BDD 00:8BCD: D0        .byte $D0   ; <0>
- - - - - - 0x000BDE 00:8BCE: D1        .byte $D1   ; <1>
- - - - - - 0x000BDF 00:8BCF: D2        .byte $D2   ; <2>
- - - - - - 0x000BE0 00:8BD0: D3        .byte $D3   ; <3>
- - - - - - 0x000BE1 00:8BD1: D4        .byte $D4   ; <4>
- - - - - - 0x000BE2 00:8BD2: D5        .byte $D5   ; <5>
- - - - - - 0x000BE3 00:8BD3: D6        .byte $D6   ; <6>
- - - - - - 0x000BE4 00:8BD4: D7        .byte $D7   ; <7>
- - - - - - 0x000BE5 00:8BD5: D8        .byte $D8   ; <8>
- - - - - - 0x000BE6 00:8BD6: D9        .byte $D9   ; <9>
- - - - - - 0x000BE7 00:8BD7: DA        .byte $DA   ; <A>

tbl_8BD8_drop_items_table:
- - - - - - 0x000BE8 00:8BD8: EE 8B     .word tbl_8BEE_items_stage_01  ; main_screen unused setted as stage 01
- D 0 - - - 0x000BEA 00:8BDA: EE 8B     .word tbl_8BEE_items_stage_01
- D 0 - - - 0x000BEC 00:8BDC: F1 8B     .word tbl_8BF1_items_stage_02
- D 0 - - - 0x000BEE 00:8BDE: F5 8B     .word tbl_8BF5_items_stage_03
- D 0 - - - 0x000BF0 00:8BE0: FA 8B     .word tbl_8BFA_items_stage_04
- - - - - - 0x000BF2 00:8BE2: FE 8B     .word tbl_8BFE_items_stage_05
- D 0 - - - 0x000BF4 00:8BE4: FF 8B     .word tbl_8BFF_items_stage_06
- D 0 - - - 0x000BF6 00:8BE6: 02 8C     .word tbl_8C02_items_stage_07
- D 0 - - - 0x000BF8 00:8BE8: 05 8C     .word tbl_8C05_items_stage_08
- D 0 - - - 0x000BFA 00:8BEA: 08 8C     .word tbl_8C08_items_stage_09
- D 0 - - - 0x000BFC 00:8BEC: 0A 8C     .word tbl_8C0A_items_stage_0A

tbl_8BEE_items_stage_01:
- D 0 - I - 0x000BFE 00:8BEE: 92        .byte $92, $D7, $FF	; 

tbl_8BF1_items_stage_02:
- D 0 - I - 0x000C01 00:8BF1: 92        .byte $92, $D7, $89, $FF	; 

tbl_8BF5_items_stage_03:
- D 0 - I - 0x000C05 00:8BF5: BC        .byte $BC, $B5, $BE, $D3, $FF	; 

tbl_8BFA_items_stage_04:
- D 0 - I - 0x000C0A 00:8BFA: B9        .byte $B9, $D3, $CD, $FF	; 

tbl_8BFE_items_stage_05:
- - - - - - 0x000C0E 00:8BFE: FF        .byte $FF	; 

tbl_8BFF_items_stage_06:
- D 0 - I - 0x000C0F 00:8BFF: 89        .byte $89, $D4, $FF	;

tbl_8C02_items_stage_07: 
- D 0 - I - 0x000C12 00:8C02: 4A        .byte $4A, $FA, $FF	; 

tbl_8C05_items_stage_08:
- D 0 - I - 0x000C15 00:8C05: 78        .byte $78, $7B, $FF   ; 

tbl_8C08_items_stage_09:
- D 0 - I - 0x000C18 00:8C08: 8C        .byte $8C, $FF   ; 

tbl_8C0A_items_stage_0A:
- D 0 - I - 0x000C1A 00:8C0A: 8C        .byte $8C, $FF   ; 

sub_8C0C:
C - - - - - 0x000C1C 00:8C0C: AE 3B 06  LDX ram_063B
C - - - - - 0x000C1F 00:8C0F: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x000C22 00:8C12: 0A        ASL
C - - - - - 0x000C23 00:8C13: AA        TAX
C - - - - - 0x000C24 00:8C14: BD D8 8B  LDA tbl_8BD8_drop_items_table,X
C - - - - - 0x000C27 00:8C17: 85 E9     STA ram_00E9
C - - - - - 0x000C29 00:8C19: BD D9 8B  LDA tbl_8BD8_drop_items_table+1,X
C - - - - - 0x000C2C 00:8C1C: 85 EA     STA ram_00EA
C - - - - - 0x000C2E 00:8C1E: A0 00     LDY #$00
C - - - - - 0x000C30 00:8C20: 84 E3     STY ram_00E3

loc_8C22:
C D 0 - - - 0x000C32 00:8C22: B1 E9     LDA (ram_00E9),Y
C - - - - - 0x000C34 00:8C24: C9 FF     CMP #$FF
C - - - - - 0x000C36 00:8C26: F0 0E     BEQ bra_8C36_RTS
C - - - - - 0x000C38 00:8C28: C5 88     CMP ram_0088
C - - - - - 0x000C3A 00:8C2A: D0 06     BNE bra_8C32
C - - - - - 0x000C3C 00:8C2C: E6 E3     INC ram_00E3
C - - - - - 0x000C3E 00:8C2E: A9 07     LDA #$07
C - - - - - 0x000C40 00:8C30: 85 D2     STA ram_00D2

bra_8C32:
C - - - - - 0x000C42 00:8C32: C8        INY
C - - - - - 0x000C43 00:8C33: 4C 22 8C  JMP loc_8C22

bra_8C36_RTS:
C - - - - - 0x000C46 00:8C36: 60        RTS

sub_8C37:
C - - - - - 0x000C47 00:8C37: AE 3B 06  LDX ram_063B
C - - - - - 0x000C4A 00:8C3A: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x000C4D 00:8C3D: C9 07     CMP #$07
C - - - - - 0x000C4F 00:8C3F: 90 08     BCC bra_8C49
C - - - - - 0x000C51 00:8C41: A5 0F     LDA ram_000F
C - - - - - 0x000C53 00:8C43: C9 D0     CMP #$D0
C - - - - - 0x000C55 00:8C45: D0 08     BNE bra_8C4F

bra_8C47:
C - - - - - 0x000C57 00:8C47: 38        SEC
C - - - - - 0x000C58 00:8C48: 60        RTS

bra_8C49:
C - - - - - 0x000C59 00:8C49: A5 0F     LDA ram_000F
C - - - - - 0x000C5B 00:8C4B: C9 CE     CMP #$CE
C - - - - - 0x000C5D 00:8C4D: F0 F8     BEQ bra_8C47

bra_8C4F:
C - - - - - 0x000C5F 00:8C4F: 18        CLC
C - - - - - 0x000C60 00:8C50: 60        RTS

bra_8C51:
C - - - - - 0x000C61 00:8C51: A9 00     LDA #$00
C - - - - - 0x000C63 00:8C53: 8D 30 06  STA ram_0630

bra_8C56_RTS:
C - - - - - 0x000C66 00:8C56: 60        RTS

sub_8C57:
C - - - - - 0x000C67 00:8C57: AE 3B 06  LDX ram_063B
C - - - - - 0x000C6A 00:8C5A: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x000C6D 00:8C5D: C9 02     CMP #$02
C - - - - - 0x000C6F 00:8C5F: F0 04     BEQ bra_8C65
C - - - - - 0x000C71 00:8C61: C9 09     CMP #$09
C - - - - - 0x000C73 00:8C63: D0 EC     BNE bra_8C51

bra_8C65:
C - - - - - 0x000C75 00:8C65: A9 01     LDA #$01
C - - - - - 0x000C77 00:8C67: 8D 30 06  STA ram_0630
C - - - - - 0x000C7A 00:8C6A: AD 4A 03  LDA ram_034A
C - - - - - 0x000C7D 00:8C6D: D0 18     BNE bra_8C87
C - - - - - 0x000C7F 00:8C6F: A5 16     LDA ram_0016
C - - - - - 0x000C81 00:8C71: C9 C0     CMP #$C0
C - - - - - 0x000C83 00:8C73: 90 E1     BCC bra_8C56_RTS
C - - - - - 0x000C85 00:8C75: AD 4A 03  LDA ram_034A
C - - - - - 0x000C88 00:8C78: D0 0D     BNE bra_8C87
C - - - - - 0x000C8A 00:8C7A: A9 30     LDA #$30
C - - - - - 0x000C8C 00:8C7C: 8D E0 02  STA ram_02E0
C - - - - - 0x000C8F 00:8C7F: A9 E0     LDA #$E0
C - - - - - 0x000C91 00:8C81: 8D E3 02  STA ram_02E3
C - - - - - 0x000C94 00:8C84: 8D 4A 03  STA ram_034A

bra_8C87:
C - - - - - 0x000C97 00:8C87: AE 3B 06  LDX ram_063B
C - - - - - 0x000C9A 00:8C8A: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x000C9D 00:8C8D: C9 02     CMP #$02								;
C - - - - - 0x000C9F 00:8C8F: F0 1E     BEQ bra_8CAF 							; If level 2
C - - - - - 0x000CA1 00:8C91: A5 9A     LDA ram_009A
C - - - - - 0x000CA3 00:8C93: 29 0F     AND #$0F
C - - - - - 0x000CA5 00:8C95: C9 08     CMP #$08								;
C - - - - - 0x000CA7 00:8C97: 90 0B     BCC bra_8CA4							; If level 8
C - - - - - 0x000CA9 00:8C99: A9 95     LDA #>tbl_9537_spr_grizzly_bear_move_01
C - - - - - 0x000CAB 00:8C9B: 85 46     STA ram_0046
C - - - - - 0x000CAD 00:8C9D: A9 37     LDA #<tbl_9537_spr_grizzly_bear_move_01
C - - - - - 0x000CAF 00:8C9F: 85 45     STA ram_0045
C - - - - - 0x000CB1 00:8CA1: 4C CA 8C  JMP loc_8CCA

bra_8CA4:
C - - - - - 0x000CB4 00:8CA4: A9 95     LDA #>tbl_9542_spr_grizzly_bear_move_02
C - - - - - 0x000CB6 00:8CA6: 85 46     STA ram_0046
C - - - - - 0x000CB8 00:8CA8: A9 42     LDA #<tbl_9542_spr_grizzly_bear_move_02
C - - - - - 0x000CBA 00:8CAA: 85 45     STA ram_0045
C - - - - - 0x000CBC 00:8CAC: 4C CA 8C  JMP loc_8CCA

bra_8CAF:
C - - - - - 0x000CBF 00:8CAF: A5 9A     LDA ram_009A
C - - - - - 0x000CC1 00:8CB1: 29 0F     AND #$0F
C - - - - - 0x000CC3 00:8CB3: C9 08     CMP #$08
C - - - - - 0x000CC5 00:8CB5: 90 0B     BCC bra_8CC2
C - - - - - 0x000CC7 00:8CB7: A9 95     LDA #>tbl_9521_spr_black_bear_move_01
C - - - - - 0x000CC9 00:8CB9: 85 46     STA ram_0046
C - - - - - 0x000CCB 00:8CBB: A9 21     LDA #<tbl_9521_spr_black_bear_move_01
C - - - - - 0x000CCD 00:8CBD: 85 45     STA ram_0045
C - - - - - 0x000CCF 00:8CBF: 4C CA 8C  JMP loc_8CCA

bra_8CC2:
C - - - - - 0x000CD2 00:8CC2: A9 95     LDA #>tbl_952C_spr_black_bear_move_02
C - - - - - 0x000CD4 00:8CC4: 85 46     STA ram_0046
C - - - - - 0x000CD6 00:8CC6: A9 2C     LDA #<tbl_952C_spr_black_bear_move_02
C - - - - - 0x000CD8 00:8CC8: 85 45     STA ram_0045

loc_8CCA:
C D 0 - - - 0x000CDA 00:8CCA: AD E0 02  LDA ram_02E0
C - - - - - 0x000CDD 00:8CCD: 85 4D     STA ram_004D
C - - - - - 0x000CDF 00:8CCF: A5 9A     LDA ram_009A
C - - - - - 0x000CE1 00:8CD1: 29 01     AND #$01
C - - - - - 0x000CE3 00:8CD3: F0 25     BEQ bra_8CFA
C - - - - - 0x000CE5 00:8CD5: AD 47 06  LDA ram_0647
C - - - - - 0x000CE8 00:8CD8: D0 11     BNE bra_8CEB
C - - - - - 0x000CEA 00:8CDA: EE E3 02  INC ram_02E3
C - - - - - 0x000CED 00:8CDD: AD E3 02  LDA ram_02E3
C - - - - - 0x000CF0 00:8CE0: C9 E0     CMP #$E0
C - - - - - 0x000CF2 00:8CE2: 90 16     BCC bra_8CFA
C - - - - - 0x000CF4 00:8CE4: A9 01     LDA #$01
C - - - - - 0x000CF6 00:8CE6: 8D 47 06  STA ram_0647
C - - - - - 0x000CF9 00:8CE9: D0 0F     BNE bra_8CFA

bra_8CEB:
C - - - - - 0x000CFB 00:8CEB: CE E3 02  DEC ram_02E3
C - - - - - 0x000CFE 00:8CEE: AD E3 02  LDA ram_02E3
C - - - - - 0x000D01 00:8CF1: C9 B0     CMP #$B0
C - - - - - 0x000D03 00:8CF3: B0 05     BCS bra_8CFA
C - - - - - 0x000D05 00:8CF5: A9 00     LDA #$00
C - - - - - 0x000D07 00:8CF7: 8D 47 06  STA ram_0647

bra_8CFA:
C - - - - - 0x000D0A 00:8CFA: AD E3 02  LDA ram_02E3
C - - - - - 0x000D0D 00:8CFD: 85 4E     STA ram_004E
C - - - - - 0x000D0F 00:8CFF: C9 F0     CMP #$F0
C - - - - - 0x000D11 00:8D01: 90 10     BCC bra_8D13
C - - - - - 0x000D13 00:8D03: A2 E0     LDX #$E0
C - - - - - 0x000D15 00:8D05: 20 53 A8  JSR sub_A853
C - - - - - 0x000D18 00:8D08: A2 F0     LDX #$F0
C - - - - - 0x000D1A 00:8D0A: 20 53 A8  JSR sub_A853
C - - - - - 0x000D1D 00:8D0D: A9 00     LDA #$00
C - - - - - 0x000D1F 00:8D0F: 8D 4A 03  STA ram_034A
C - - - - - 0x000D22 00:8D12: 60        RTS

bra_8D13:
C - - - - - 0x000D23 00:8D13: A9 38     LDA #$38
C - - - - - 0x000D25 00:8D15: 85 24     STA ram_0024
C - - - - - 0x000D27 00:8D17: 20 CE C0  JSR sub_C0CE
C - - - - - 0x000D2A 00:8D1A: A0 00     LDY #$00
C - - - - - 0x000D2C 00:8D1C: 20 21 8D  JSR sub_8D21
C - - - - - 0x000D2F 00:8D1F: A0 08     LDY #$08

sub_8D21:
C - - - - - 0x000D31 00:8D21: B9 E0 02  LDA ram_02E0,Y
C - - - - - 0x000D34 00:8D24: 85 4D     STA ram_004D
C - - - - - 0x000D36 00:8D26: B9 E3 02  LDA ram_02E3,Y
C - - - - - 0x000D39 00:8D29: 85 4E     STA ram_004E
C - - - - - 0x000D3B 00:8D2B: 20 55 96  JSR sub_9655
C - - - - - 0x000D3E 00:8D2E: A5 CB     LDA ram_00CB
C - - - - - 0x000D40 00:8D30: F0 04     BEQ bra_8D36_RTS
C - - - - - 0x000D42 00:8D32: A9 01     LDA #$01
C - - - - - 0x000D44 00:8D34: 85 CC     STA ram_00CC

bra_8D36_RTS:
C - - - - - 0x000D46 00:8D36: 60        RTS

tbl_8D37_sprites_initial_position_table:
- D 0 - - - 0x000D47 00:8D37: 4D 8D     .word tbl_8D4D_main_screen_sprites_table
- D 0 - - - 0x000D49 00:8D39: 4F 8D     .word tbl_8D4F_stage_01_sprites_table
- D 0 - - - 0x000D4B 00:8D3B: 57 8D     .word tbl_8D57_stage_02_sprites_table
- D 0 - - - 0x000D4D 00:8D3D: 5F 8D     .word tbl_8D5F_stage_03_sprites_table
- D 0 - - - 0x000D4F 00:8D3F: 67 8D     .word tbl_8D67_stage_04_sprites_table
- D 0 - - - 0x000D51 00:8D41: 6F 8D     .word tbl_8D6F_stage_05_sprites_table
- D 0 - - - 0x000D53 00:8D43: 71 8D     .word tbl_8D71_stage_06_sprites_table
- D 0 - - - 0x000D55 00:8D45: 79 8D     .word tbl_8D79_stage_07_sprites_table
- D 0 - - - 0x000D57 00:8D47: 81 8D     .word tbl_8D81_stage_08_sprites_table
- D 0 - - - 0x000D59 00:8D49: 89 8D     .word tbl_8D89_stage_09_sprites_table
- D 0 - - - 0x000D5B 00:8D4B: 91 8D     .word tbl_8D91_stage_0A_sprites_table

tbl_8D4D_main_screen_sprites_table:
- D 0 - I - 0x000D5D 00:8D4D: 7C 8E     .word tbl_8E7C_main_screen_sprites_position

tbl_8D4F_stage_01_sprites_table:
- D 0 - I - 0x000D5F 00:8D4F: 89 8E     .word tbl_8E89_stage_01_sprites_position
- D 0 - I - 0x000D61 00:8D51: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D63 00:8D53: AD 91     .word tbl_91AD_sub_01_sprites_position
- D 0 - I - 0x000D65 00:8D55: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D57_stage_02_sprites_table:
- D 0 - I - 0x000D67 00:8D57: D6 8E     .word tbl_8ED6_stage_02_sprites_position
- D 0 - I - 0x000D69 00:8D59: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D6B 00:8D5B: BA 91     .word tbl_91BA_sub_02_sprites_position
- D 0 - I - 0x000D6D 00:8D5D: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D5F_stage_03_sprites_table:
- D 0 - I - 0x000D6F 00:8D5F: 23 8F     .word tbl_8F23_stage_03_sprites_position
- D 0 - I - 0x000D71 00:8D61: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D73 00:8D63: C7 91     .word tbl_91C7_sub_03_sprites_position
- D 0 - I - 0x000D75 00:8D65: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D67_stage_04_sprites_table:
- D 0 - I - 0x000D77 00:8D67: 78 8F     .word tbl_8F78_stage_04_sprites_position
- D 0 - I - 0x000D79 00:8D69: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D7B 00:8D6B: D4 91     .word tbl_91D4_sub_04_sprites_position
- - - - - - 0x000D7D 00:8D6D: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D6F_stage_05_sprites_table:
- D 0 - I - 0x000D7F 00:8D6F: C5 8F     .word tbl_8FC5_stage_05_sprites_position

tbl_8D71_stage_06_sprites_table:
- D 0 - I - 0x000D81 00:8D71: F2 8F     .word tbl_8FF2_stage_06_sprites_position
- D 0 - I - 0x000D83 00:8D73: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D85 00:8D75: E1 91     .word tbl_91E1_sub_06_sprites_position
- D 0 - I - 0x000D87 00:8D77: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D79_stage_07_sprites_table:
- D 0 - I - 0x000D89 00:8D79: 3F 90     .word tbl_903F_stage_07_sprites_position
- D 0 - I - 0x000D8B 00:8D7B: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D8D 00:8D7D: EE 91     .word tbl_91EE_sub_07_sprites_position
- - - - - - 0x000D8F 00:8D7F: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D81_stage_08_sprites_table:
- D 0 - I - 0x000D91 00:8D81: 8C 90     .word tbl_908C_stage_08_sprites_position
- D 0 - I - 0x000D93 00:8D83: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000D95 00:8D85: FB 91     .word tbl_91FB_sub_08_sprites_position
- D 0 - I - 0x000D97 00:8D87: 88 91     .word tbl_9188_sky_sprites_position


tbl_8D89_stage_09_sprites_table:
- D 0 - I - 0x000D99 00:8D89: D9 90     .word tbl_90D9_stage_09_sprites_position
- - - - - - 0x000D9B 00:8D8B: 73 91     .word tbl_9173_shop_sprites_position
- - - - - - 0x000D9D 00:8D8D: 08 92     .word tbl_9208_sub_09_sprites_position
- - - - - - 0x000D9F 00:8D8F: 88 91     .word tbl_9188_sky_sprites_position

tbl_8D91_stage_0A_sprites_table:
- D 0 - I - 0x000DA1 00:8D91: 26 91     .word tbl_9126_stage_0A_sprites_position
- D 0 - I - 0x000DA3 00:8D93: 73 91     .word tbl_9173_shop_sprites_position
- D 0 - I - 0x000DA5 00:8D95: 15 92     .word tbl_9215_sub_0A_sprites_position
- D 0 - I - 0x000DA7 00:8D97: 88 91     .word tbl_9188_sky_sprites_position

; I do know what it exactly doing this table
tbl_8D99_table:
- - - - - - 0x000DA9 00:8D99: DF 8D     .word tbl_8DDF_main_screen_table
- D 0 - - - 0x000DAB 00:8D9B: E0 8D     .word tbl_8DE0_stage_01_table
- D 0 - - - 0x000DAD 00:8D9D: EB 8D     .word tbl_8DEB_stage_02_table
- D 0 - - - 0x000DAF 00:8D9F: F6 8D     .word tbl_8DF6_stage_03_table
- D 0 - - - 0x000DB1 00:8DA1: 01 8E     .word tbl_8E01_stage_04_table
- - - - - - 0x000DB3 00:8DA3: 0C 8E     .word tbl_8E0C_stage_05_table
- D 0 - - - 0x000DB5 00:8DA5: 0D 8E     .word tbl_8E0D_stage_06_table
- D 0 - - - 0x000DB7 00:8DA7: 18 8E     .word tbl_8E18_stage_07_table
- D 0 - - - 0x000DB9 00:8DA9: 23 8E     .word tbl_8E23_stage_08_table
- D 0 - - - 0x000DBB 00:8DAB: 2E 8E     .word tbl_8E2E_stage_09_table
- D 0 - - - 0x000DBD 00:8DAD: 39 8E     .word tbl_8E39_stage_0A_table

tbl_8DAF_stage_fruit_table:
- - - - - - 0x000DBF 00:8DAF: C5 8D     .word tbl_8DC5_spr_no_fruit				; main_screen not used
- D 0 - - - 0x000DC1 00:8DB1: E6 94     .word tbl_94E6_spr_fruit_cherry 		; stage 01
- D 0 - - - 0x000DC3 00:8DB3: 54 95     .word tbl_9554_spr_fruit_grape			; stage 02
- D 0 - - - 0x000DC5 00:8DB5: 5B 95     .word tbl_955B_spr_fruit_melon			; stage 03
- D 0 - - - 0x000DC7 00:8DB7: 62 95     .word tbl_9562_spr_fruit_pineapple		; stage 04
- - - - - - 0x000DC9 00:8DB9: E6 94     .word tbl_94E6_spr_fruit_cherry			; stage 05 not used
- D 0 - - - 0x000DCB 00:8DBB: 54 95     .word tbl_9554_spr_fruit_grape			; stage 06
- D 0 - - - 0x000DCD 00:8DBD: 5B 95     .word tbl_955B_spr_fruit_melon			; stage 07
- D 0 - - - 0x000DCF 00:8DBF: 62 95     .word tbl_9562_spr_fruit_pineapple		; stage 08
- D 0 - - - 0x000DD1 00:8DC1: E6 94     .word tbl_94E6_spr_fruit_cherry			; stage 09
- D 0 - - - 0x000DD3 00:8DC3: 54 95     .word tbl_9554_spr_fruit_grape			; stage 0A

tbl_8DC5_spr_no_fruit:
- D 0 - - - 0x000DD5 00:8DC5: 08        .byte $08,$10,$28,$30 ; Loaded from instruccion $A52C

; I do know what it exactly doing this table
tbl_8DC9_table:
- - - - - - 0x000DD9 00:8DC9: 44 8E     .word tbl_8E44_main_screen_table
- D 0 - - - 0x000DDB 00:8DCB: 45 8E     .word tbl_8E45_stage_01_table
- D 0 - - - 0x000DDD 00:8DCD: 4B 8E     .word tbl_8E4B_stage_02_table
- D 0 - - - 0x000DDF 00:8DCF: 51 8E     .word tbl_8E51_stage_03_table
- D 0 - - - 0x000DE1 00:8DD1: 57 8E     .word tbl_8E57_stage_04_table
- - - - - - 0x000DE3 00:8DD3: 5D 8E     .word tbl_8E5D_stage_05_table
- D 0 - - - 0x000DE5 00:8DD5: 5E 8E     .word tbl_8E5E_stage_06_table
- D 0 - - - 0x000DE7 00:8DD7: 64 8E     .word tbl_8E64_stage_07_table
- D 0 - - - 0x000DE9 00:8DD9: 6A 8E     .word tbl_8E6A_stage_08_table
- D 0 - - - 0x000DEB 00:8DDB: 70 8E     .word tbl_8E70_stage_09_table
- D 0 - - - 0x000DED 00:8DDD: 76 8E     .word tbl_8E76_stage_0A_table

tbl_8DDF_main_screen_table:
- - - - - - 0x000DEF 00:8DDF: FF        .byte $FF   ;

tbl_8DE0_stage_01_table:
- D 0 - I - 0x000DF0 00:8DE0: 60        .byte $60,$68,$88,$90,$80,$88,$D8,$E0,$D0,$D8,$FF   ; 

tbl_8DEB_stage_02_table:
- D 0 - I - 0x000DFB 00:8DEB: 30        .byte $30,$38,$78,$80,$A0,$A8,$C8,$D0,$E0,$E8,$FF   ; 

tbl_8DF6_stage_03_table:
- D 0 - I - 0x000E06 00:8DF6: 30        .byte $30,$38,$58,$60,$70,$78,$A8,$B0,$C0,$C8,$FF   ; 

tbl_8E01_stage_04_table:
- D 0 - I - 0x000E11 00:8E01: 50        .byte $50,$58,$68,$70,$80,$88,$A8,$B0,$E0,$E8,$FF   ; 

tbl_8E0C_stage_05_table:
- - - - - - 0x000E1C 00:8E0C: FF        .byte $FF   ; 

tbl_8E0D_stage_06_table:
- D 0 - I - 0x000E1D 00:8E0D: 50        .byte $50,$58,$78,$80,$80,$88,$A8,$B0,$B0,$B8,$FF   ; 

tbl_8E18_stage_07_table:
- D 0 - I - 0x000E28 00:8E18: 30        .byte $30,$38,$68,$70,$90,$98,$D8,$E0,$E0,$E8,$FF   ; 

tbl_8E23_stage_08_table:
- D 0 - I - 0x000E33 00:8E23: 50        .byte $50,$58,$88,$90,$A0,$A8,$C8,$D0,$E0,$E8,$FF   ; 

tbl_8E2E_stage_09_table:
- D 0 - I - 0x000E3E 00:8E2E: 30        .byte $30,$38,$58,$60,$90,$98,$A8,$B0,$B0,$B8,$FF   ; 

tbl_8E39_stage_0A_table:
- D 0 - I - 0x000E49 00:8E39: 30        .byte $30,$38,$68,$70,$80,$88,$98,$A0,$E0,$E8,$FF   ; 

tbl_8E44_main_screen_table:
- - - - - - 0x000E54 00:8E44: 00        .byte $00   ; 

tbl_8E45_stage_01_table:
- D 0 - I - 0x000E55 00:8E45: 00        .byte $00,$80,$D0,$80,$F0,$D0   ; 

tbl_8E4B_stage_02_table:
- D 0 - I - 0x000E5B 00:8E4B: 00        .byte $00,$80,$A0,$80,$FF,$B0   ; 

tbl_8E51_stage_03_table:
- D 0 - I - 0x000E61 00:8E51: 00        .byte $00,$80,$B0,$80,$FF,$A0   ; 

tbl_8E57_stage_04_table:
- D 0 - I - 0x000E67 00:8E57: 00        .byte $00,$80,$D0,$80,$D0,$B0   ; 

tbl_8E5D_stage_05_table:
- - - - - - 0x000E6D 00:8E5D: 00        .byte $00   ; 

tbl_8E5E_stage_06_table:
- D 0 - I - 0x000E6E 00:8E5E: 00        .byte $00,$80,$D0,$80,$FF,$A0   ; 

tbl_8E64_stage_07_table:
- D 0 - I - 0x000E74 00:8E64: 00        .byte $00,$80,$B0,$80,$FF,$90   ; 

tbl_8E6A_stage_08_table:
- D 0 - I - 0x000E7A 00:8E6A: 00        .byte $00,$40,$C0,$40,$FF,$C0   ; 

tbl_8E70_stage_09_table:
- D 0 - I - 0x000E80 00:8E70: 00        .byte $00,$80,$C0,$80,$FF,$B0   ; 

tbl_8E76_stage_0A_table:
- D 0 - I - 0x000E86 00:8E76: 00        .byte $00,$80,$A0,$80,$FF,$C0   ; 

tbl_8E7C_main_screen_sprites_position:
- D 0 - I - 0x000E8C 00:8E7C: 00        .byte $00,$00,$10,$30,$04,$01,$E0,$30,$08,$00,$40,$90,$FF ;

tbl_8E89_stage_01_sprites_position:
- D 0 - I - 0x000E99 00:8E89: 00        .byte $00,$00,$10,$B0,$04,$00,$60,$C0,$08,$00,$B0,$90,$0C,$01,$60,$60 ;
- D 0 - I - 0x000EA9 00:8E99: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x000EB9 00:8EA9: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x000EC9 00:8EB9: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$60,$B0,$1C,$00,$80,$90 ;
- D 0 - I - 0x000ED9 00:8EC9: 1E        .byte $1E,$00,$80,$70,$20,$00,$D0,$C0,$22,$00,$D0,$A0,$FF ;

tbl_8ED6_stage_02_sprites_position:
- D 0 - I - 0x000EE6 00:8ED6: 00        .byte $00,$00,$10,$80,$04,$00,$70,$C0,$08,$00,$50,$50,$0C,$01,$E0,$70 ;
- D 0 - I - 0x000EF6 00:8EE6: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x000F06 00:8EF6: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x000F16 00:8F06: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$30,$60,$1C,$00,$70,$60 ;
- D 0 - I - 0x000F26 00:8F16: 1E        .byte $1E,$00,$A0,$C0,$20,$00,$C0,$B0,$22,$00,$E0,$40,$FF ;

tbl_8F23_stage_03_sprites_position:
- D 0 - I - 0x000F33 00:8F23: 00        .byte $00,$00,$30,$A0,$04,$00,$70,$B0,$08,$00,$C0,$60,$0C,$01,$C0,$A0 ;
- D 0 - I - 0x000F43 00:8F33: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x000F53 00:8F43: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x000F63 00:8F53: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$30,$60,$1C,$00,$50,$90 ;
- D 0 - I - 0x000F73 00:8F63: 1E        .byte $1E,$00,$70,$90,$20,$00,$A0,$D0,$22,$00,$C0,$C0,$38,$00,$00,$60 ;
- D 0 - I - 0x000F83 00:8F73: 3C        .byte $3C,$00,$20,$E0,$FF ;

tbl_8F78_stage_04_sprites_position:
- D 0 - I - 0x000F88 00:8F78: 00        .byte $00,$00,$10,$80,$04,$00,$70,$C0,$08,$00,$60,$50,$0C,$01,$C0,$50 ;
- D 0 - I - 0x000F98 00:8F88: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x000FA8 00:8F98: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x000FB8 00:8FA8: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$50,$B0,$1C,$00,$60,$60 ;
- D 0 - I - 0x000FC8 00:8FB8: 1E        .byte $1E,$00,$90,$90,$20,$00,$A0,$C0,$22,$00,$E0,$50,$FF ;

tbl_8FC5_stage_05_sprites_position:
- D 0 - I - 0x000FD5 00:8FC5: 00        .byte $00,$00,$20,$30,$10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20 ;
- D 0 - I - 0x000FE5 00:8FD5: 13        .byte $13,$00,$38,$20,$14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10 ;
- D 0 - I - 0x000FF5 00:8FE5: 17        .byte $17,$00,$3E,$F8,$18,$00,$48,$F8,$19,$00,$52,$F8,$FF ;

tbl_8FF2_stage_06_sprites_position:
- D 0 - I - 0x001002 00:8FF2: 00        .byte $00,$00,$10,$90,$04,$00,$70,$C0,$08,$00,$60,$60,$0C,$01,$D0,$80 ;
- D 0 - I - 0x001012 00:9002: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x001022 00:9012: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x001032 00:9022: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$50,$C0,$1C,$00,$70,$60 ;
- D 0 - I - 0x001042 00:9032: 1E        .byte $1E,$00,$80,$40,$20,$00,$A0,$C0,$22,$00,$B0,$90,$FF ;

tbl_903F_stage_07_sprites_position:
- D 0 - I - 0x00104F 00:903F: 00        .byte $00,$00,$10,$80,$04,$00,$50,$D0,$08,$00,$50,$50,$0C,$01,$D0,$80 ;
- D 0 - I - 0x00105F 00:904F: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x00106F 00:905F: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x00107F 00:906F: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$30,$50,$1C,$00,$60,$60 ;
- D 0 - I - 0x00108F 00:907F: 1E        .byte $1E,$00,$90,$A0,$20,$00,$D0,$A0,$22,$00,$E0,$90,$FF ;

tbl_908C_stage_08_sprites_position:
- D 0 - I - 0x00109C 00:908C: 00        .byte $00,$00,$30,$90,$04,$00,$50,$40,$08,$00,$A0,$A0,$0C,$01,$D0,$50 ;
- D 0 - I - 0x0010AC 00:909C: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x0010BC 00:90AC: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x0010CC 00:90BC: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$50,$D0,$1C,$00,$80,$60 ;
- D 0 - I - 0x0010DC 00:90CC: 1E        .byte $1E,$00,$A0,$70,$20,$00,$C0,$90,$22,$00,$E0,$40,$FF ;

tbl_90D9_stage_09_sprites_position:
- D 0 - I - 0x0010E9 00:90D9: 00        .byte $00,$00,$20,$80,$04,$00,$50,$C0,$08,$00,$80,$40,$0C,$01,$B0,$80 ;
- D 0 - I - 0x0010F9 00:90E9: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x001109 00:90F9: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x001119 00:9109: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$30,$A0,$1C,$00,$50,$50 ;
- D 0 - I - 0x001129 00:9119: 1E        .byte $1E,$00,$90,$40,$20,$00,$A0,$B0,$22,$00,$B0,$D0,$FF ;

tbl_9126_stage_0A_sprites_position:
- D 0 - I - 0x001136 00:9126: 00        .byte $00,$00,$70,$30,$04,$00,$60,$60,$08,$00,$90,$B0,$0C,$01,$D0,$90 ;
- D 0 - I - 0x001146 00:9136: 10        .byte $10,$00,$20,$20,$11,$00,$28,$20,$12,$00,$30,$20,$13,$00,$38,$20 ;
- D 0 - I - 0x001156 00:9146: 14        .byte $14,$00,$20,$10,$15,$00,$2A,$10,$16,$00,$34,$10,$17,$00,$3E,$F8 ;
- D 0 - I - 0x001166 00:9156: 18        .byte $18,$00,$48,$F8,$19,$00,$52,$F8,$1A,$00,$30,$C0,$1C,$00,$60,$50 ;
- D 0 - I - 0x001176 00:9166: 1E        .byte $1E,$00,$80,$60,$20,$00,$90,$A0,$22,$00,$E0,$B0,$FF ;

tbl_9173_shop_sprites_position:
- D 0 - I - 0x001183 00:9173: 00        .byte $00,$00,$40,$C0,$04,$00,$80,$78,$0A,$00,$38,$B0,$0B,$00,$48,$8A ;
- D 0 - I - 0x001193 00:9183: 1A        .byte $1A,$00,$70,$8A,$FF ;
 
tbl_9188_sky_sprites_position:
- D 0 - I - 0x001198 00:9188: 00        .byte $00,$00,$30,$F0,$1A,$00,$40,$58,$1C,$00,$70,$38,$1E,$00,$90,$38 ;
- D 0 - I - 0x0011A8 00:9198: 20        .byte $20,$00,$B0,$38,$22,$00,$10,$A8,$24,$00,$B0,$88,$26,$00,$D0,$88 ;
- D 0 - I - 0x0011B8 00:91A8: 28        .byte $28,$00,$30,$A8,$FF ;

tbl_91AD_sub_01_sprites_position:
- D 0 - I - 0x0011BD 00:91AD: 00        .byte $00,$00,$10,$B0,$04,$00,$B0,$B0,$30,$00,$10,$C0,$FF ;

tbl_91BA_sub_02_sprites_position:
- D 0 - I - 0x0011CA 00:91BA: 00        .byte $00,$00,$10,$C0,$04,$00,$B0,$C0,$30,$00,$10,$D0,$FF ;

tbl_91C7_sub_03_sprites_position:
- D 0 - I - 0x0011D7 00:91C7: 00        .byte $00,$00,$40,$D0,$04,$00,$60,$A0,$30,$00,$30,$D0,$FF ;

tbl_91D4_sub_04_sprites_position:
- D 0 - I - 0x0011E4 00:91D4: 00        .byte $00,$00,$20,$B0,$04,$00,$C0,$C0,$30,$00,$20,$C0,$FF ;

tbl_91E1_sub_06_sprites_position:
- D 0 - I - 0x0011F1 00:91E1: 00        .byte $00,$00,$10,$C0,$04,$00,$70,$60,$30,$00,$10,$D0,$FF ;

tbl_91EE_sub_07_sprites_position:
- D 0 - I - 0x0011FE 00:91EE: 00        .byte $00,$00,$10,$B0,$04,$00,$C0,$C0,$30,$00,$10,$C0,$FF ;

tbl_91FB_sub_08_sprites_position:
- D 0 - I - 0x00120B 00:91FB: 00        .byte $00,$00,$30,$C0,$04,$00,$B0,$90,$30,$00,$30,$D0,$FF ;

tbl_9208_sub_09_sprites_position:
- - - - - - 0x001218 00:9208: 00        .byte $00,$00,$30,$C0,$04,$00,$B0,$A0,$30,$00,$30,$D0,$FF ;

tbl_9215_sub_0A_sprites_position:
- D 0 - I - 0x001225 00:9215: 00        .byte $00,$00,$20,$C0,$04,$00,$B0,$C0,$30,$00,$20,$D0,$FF ;

tbl_9222:
- - - - - - 0x001232 00:9222: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x001237 00:9227: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x00123C 00:922C: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x001241 00:9231: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x001246 00:9236: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x00124B 00:923B: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x001250 00:9240: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x001255 00:9245: 04        .byte $04,$00,$70,$90,$FF ; Unused?
- - - - - - 0x00125A 00:924A: 04        .byte $04,$00,$70,$90,$FF ; Unused?

;???
tbl_924F:
- D 0 - - - 0x00125F 00:924F: 68 BD     .word $BD68
- D 0 - - - 0x001261 00:9251: 68 BD     .word $BD68
- D 0 - - - 0x001263 00:9253: 68 BD     .word $BD68
- D 0 - - - 0x001265 00:9255: 96 BD     .word $BD96
- - - - - - 0x001267 00:9257: 96 BD     .word $BD96
- D 0 - - - 0x001269 00:9259: 96 BD     .word $BD96
- D 0 - - - 0x00126B 00:925B: CC BD     .word $BDCC
- D 0 - - - 0x00126D 00:925D: CC BD     .word $BDCC
- D 0 - - - 0x00126F 00:925F: CC BD     .word $BDCC
- D 0 - - - 0x001271 00:9261: CC BD     .word $BDCC

tbl_9263_river_wave_effect_palettes:
- D 0 - - - 0x001273 00:9263: 69 92     .word tbl_9269_wave_effect_palette_01
- D 0 - - - 0x001275 00:9265: 6D 92     .word tbl_926D_wave_effect_palette_02
- D 0 - - - 0x001277 00:9267: 71 92     .word tbl_9271_wave_effect_palette_03

tbl_9269_wave_effect_palette_01:
- D 0 - I - 0x001279 00:9269: 3D        .byte $3D,$1C,$20,$2C   ; 

tbl_926D_wave_effect_palette_02:
- D 0 - I - 0x00127D 00:926D: 3D        .byte $3D,$2C,$1C,$20   ; 

tbl_9271_wave_effect_palette_03:
- D 0 - I - 0x001281 00:9271: 3D        .byte $3D,$20,$2C,$1C   ; 

tbl_9275_string_world_x:
- - - - - - 0x001285 00:9275: 87 92     .word tbl_9287_string_2
- D 0 - - - 0x001287 00:9277: 87 92     .word tbl_9287_string_2
- D 0 - - - 0x001289 00:9279: 88 92     .word tbl_9288_string_3
- D 0 - - - 0x00128B 00:927B: 89 92     .word tbl_9289_string_4
- D 0 - - - 0x00128D 00:927D: 8A 92     .word tbl_928A_string_5
- D 0 - - - 0x00128F 00:927F: 8B 92     .word tbl_928B_string_6
- D 0 - - - 0x001291 00:9281: 8C 92     .word tbl_928C_string_7
- D 0 - - - 0x001293 00:9283: 8D 92     .word tbl_928D_string_8
- D 0 - - - 0x001295 00:9285: 8E 92     .word tbl_928E_string_9

tbl_9287_string_2:
- D 0 - I - 0x001297 00:9287: D2        .byte $D2   ; <2>

tbl_9288_string_3:
- D 0 - I - 0x001298 00:9288: D3        .byte $D3   ; <3>

tbl_9289_string_4:
- D 0 - I - 0x001299 00:9289: D4        .byte $D4   ; <4>

tbl_928A_string_5:
- D 0 - I - 0x00129A 00:928A: D5        .byte $D5   ; <5>

tbl_928B_string_6:
- D 0 - I - 0x00129B 00:928B: D6        .byte $D6   ; <6>

tbl_928C_string_7:
- D 0 - I - 0x00129C 00:928C: D7        .byte $D7   ; <7>

tbl_928D_string_8:
- D 0 - I - 0x00129D 00:928D: D8        .byte $D8   ; <8>

tbl_928E_string_9:
- D 0 - I - 0x00129E 00:928E: D9        .byte $D9   ; <9>

tbl_928F_change_level_background_tree_type:
- - - - - - 0x00129F 00:928F: A5 92     .word tbl_92A5_forest_tree_1	; UNUSED
- D 0 - - - 0x0012A1 00:9291: B5 92     .word tbl_92B5_palm_tree_1		; stage 02
- D 0 - - - 0x0012A3 00:9293: A5 92     .word tbl_92A5_forest_tree_1	; stage 03
- D 0 - - - 0x0012A5 00:9295: A5 92     .word tbl_92A5_forest_tree_1	; stage 04
- D 0 - - - 0x0012A7 00:9297: B5 92     .word tbl_92B5_palm_tree_1		; stage 05
- D 0 - - - 0x0012A9 00:9299: C5 92     .word tbl_92C5_palm_tree_2		; stage 06
- D 0 - - - 0x0012AB 00:929B: A5 92     .word tbl_92A5_forest_tree_1 	; stage 07
- D 0 - - - 0x0012AD 00:929D: D5 92     .word tbl_92D5_forest_tree_2	; stage 08
- D 0 - - - 0x0012AF 00:929F: E5 92     .word tbl_92E5_forrest_tree_3	; stage 09
- D 0 - - - 0x0012B1 00:92A1: E5 92     .word tbl_92E5_forrest_tree_3	; stage 0A
- D 0 - - - 0x0012B3 00:92A3: A5 92     .word tbl_92A5_forest_tree_1	; stage 01

tbl_92A5_forest_tree_1:
- D 0 - I - 0x0012B5 00:92A5: 3B        .byte $3B,$3C,$3C,$3D,$3F,$3C,$40,$3E,$FF,$41,$42,$FF,$FF,$43,$44,$FF ;

tbl_92B5_palm_tree_1:
- D 0 - I - 0x0012C5 00:92B5: 23        .byte $23,$21,$1D,$1E,$24,$22,$20,$1F,$FF,$25,$26,$FF,$FF,$39,$3A,$FF ;

tbl_92C5_palm_tree_2:
- D 0 - I - 0x0012D5 00:92C5: 4C        .byte $4C,$4D,$4E,$4F,$53,$52,$51,$50,$FF,$25,$26,$FF,$FF,$39,$3A,$FF ;

tbl_92D5_forest_tree_2:
- D 0 - I - 0x0012E5 00:92D5: FF        .byte $FF,$6D,$6E,$FF,$FF,$70,$6F,$FF,$FF,$71,$72,$FF,$FF,$73,$74,$FF ;

tbl_92E5_forrest_tree_3:
- D 0 - I - 0x0012F5 00:92E5: FF        .byte $FF,$77,$78,$FF,$FF,$7A,$79,$FF,$FF,$7B,$7C,$FF,$FF,$73,$74,$FF ;

tbl_92F5_sprites_table:
- D 0 - - - 0x001305 00:92F5: 0B 93     .word tbl_930B_main_screen_sprites
- D 0 - - - 0x001307 00:92F7: 0D 93     .word tbl_930D_stage_01_sprites
- D 0 - - - 0x001309 00:92F9: 15 93     .word tbl_9315_stage_02_sprites
- D 0 - - - 0x00130B 00:92FB: 1D 93     .word tbl_931D_stage_03_sprites
- D 0 - - - 0x00130D 00:92FD: 25 93     .word tbl_9325_stage_04_sprites
- D 0 - - - 0x00130F 00:92FF: 2D 93     .word tbl_932D_stage_05_sprites
- D 0 - - - 0x001311 00:9301: 2F 93     .word tbl_932F_stage_06_sprites
- D 0 - - - 0x001313 00:9303: 37 93     .word tbl_9337_stage_07_sprites
- D 0 - - - 0x001315 00:9305: 3F 93     .word tbl_933F_stage_08_sprites
- D 0 - - - 0x001317 00:9307: 47 93     .word tbl_9347_stage_09_sprites
- D 0 - - - 0x001319 00:9309: 4F 93     .word tbl_934F_stage_0A_sprites

tbl_930B_main_screen_sprites:
- D 0 - I - 0x00131B 00:930B: 57 93     .word tbl_9357_main_screen_secuence

tbl_930D_stage_01_sprites:
- D 0 - I - 0x00131D 00:930D: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x00131F 00:930F: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001321 00:9311: DF 93     .word tbl_93DF_move_animations_presets
- D 0 - I - 0x001323 00:9313: CD 93     .word tbl_93CD_sky_presets

tbl_9315_stage_02_sprites:
- D 0 - I - 0x001325 00:9315: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x001327 00:9317: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001329 00:9319: DF 93     .word tbl_93DF_move_animations_presets
- D 0 - I - 0x00132B 00:931B: CD 93     .word tbl_93CD_sky_presets

tbl_931D_stage_03_sprites:
- D 0 - I - 0x00132D 00:931D: 83 93     .word tbl_9383_stage_3_presets
- D 0 - I - 0x00132F 00:931F: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001331 00:9321: DF 93     .word tbl_93DF_move_animations_presets
- D 0 - I - 0x001333 00:9323: CD 93     .word tbl_93CD_sky_presets

tbl_9325_stage_04_sprites:
- D 0 - I - 0x001335 00:9325: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x001337 00:9327: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001339 00:9329: DF 93     .word tbl_93DF_move_animations_presets
- - - - - - 0x00133B 00:932B: CD 93     .word tbl_93CD_sky_presets

tbl_932D_stage_05_sprites:
- D 0 - I - 0x00133D 00:932D: AD 93     .word tbl_93AD_default_presets ; Aquatic level

tbl_932F_stage_06_sprites:
- D 0 - I - 0x00133F 00:932F: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x001341 00:9331: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001343 00:9333: DF 93     .word tbl_93DF_move_animations_presets
- D 0 - I - 0x001345 00:9335: CD 93     .word tbl_93CD_sky_presets

tbl_9337_stage_07_sprites:
- D 0 - I - 0x001347 00:9337: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x001349 00:9339: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x00134B 00:933B: DF 93     .word tbl_93DF_move_animations_presets
- - - - - - 0x00134D 00:933D: CD 93     .word tbl_93CD_sky_presets

tbl_933F_stage_08_sprites:
- D 0 - I - 0x00134F 00:933F: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x001351 00:9341: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001353 00:9343: DF 93     .word tbl_93DF_move_animations_presets
- D 0 - I - 0x001355 00:9345: CD 93     .word tbl_93CD_sky_presets

tbl_9347_stage_09_sprites:
- D 0 - I - 0x001357 00:9347: 5D 93     .word tbl_935D_stage_default_presets
- - - - - - 0x001359 00:9349: C3 93     .word tbl_93C3_shop_presets
- - - - - - 0x00135B 00:934B: DF 93     .word tbl_93DF_move_animations_presets
- - - - - - 0x00135D 00:934D: CD 93     .word tbl_93CD_sky_presets

tbl_934F_stage_0A_sprites:
- D 0 - I - 0x00135F 00:934F: 5D 93     .word tbl_935D_stage_default_presets
- D 0 - I - 0x001361 00:9351: C3 93     .word tbl_93C3_shop_presets
- D 0 - I - 0x001363 00:9353: DF 93     .word tbl_93DF_move_animations_presets
- D 0 - I - 0x001365 00:9355: CD 93     .word tbl_93CD_sky_presets

tbl_9357_main_screen_secuence:
- D 0 - I - 0x001367 00:9357: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x001369 00:9359: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x00136B 00:935B: AE 94     .word tbl_94AE_spr_hud_life

tbl_935D_stage_default_presets:
- D 0 - I - 0x00136D 00:935D: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x00136F 00:935F: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x001371 00:9361: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x001373 00:9363: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x001375 00:9365: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x001377 00:9367: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x001379 00:9369: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x00137B 00:936B: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x00137D 00:936D: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x00137F 00:936F: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x001381 00:9371: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x001383 00:9373: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x001385 00:9375: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x001387 00:9377: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x001389 00:9379: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x00138B 00:937B: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x00138D 00:937D: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x00138F 00:937F: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x001391 00:9381: 88 94     .word tbl_9488_spr_rock

tbl_9383_stage_3_presets:
- D 0 - I - 0x001393 00:9383: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x001395 00:9385: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x001397 00:9387: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x001399 00:9389: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x00139B 00:938B: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x00139D 00:938D: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x00139F 00:938F: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x0013A1 00:9391: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x0013A3 00:9393: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013A5 00:9395: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013A7 00:9397: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013A9 00:9399: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013AB 00:939B: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013AD 00:939D: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013AF 00:939F: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x0013B1 00:93A1: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x0013B3 00:93A3: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x0013B5 00:93A5: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x0013B7 00:93A7: 88 94     .word tbl_9488_spr_rock
- D 0 - I - 0x0013B9 00:93A9: C0 94     .word tbl_94C0_spr_turtle_face_down
- D 0 - I - 0x0013BB 00:93AB: C7 94     .word tbl_94C7_spr_turtle_face_up

tbl_93AD_default_presets:
- D 0 - I - 0x0013BD 00:93AD: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x0013BF 00:93AF: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x0013C1 00:93B1: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x0013C3 00:93B3: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x0013C5 00:93B5: 02 95     .word tbl_9502_spr_hud_item_slot
- D 0 - I - 0x0013C7 00:93B7: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013C9 00:93B9: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013CB 00:93BB: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013CD 00:93BD: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013CF 00:93BF: AE 94     .word tbl_94AE_spr_hud_life
- D 0 - I - 0x0013D1 00:93C1: AE 94     .word tbl_94AE_spr_hud_life

tbl_93C3_shop_presets:
- D 0 - I - 0x0013D3 00:93C3: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x0013D5 00:93C5: 61 94     .word tbl_9461_spr_seller_idle
- D 0 - I - 0x0013D7 00:93C7: 16 95     .word tbl_9516_spr_shop_item_selected
- D 0 - I - 0x0013D9 00:93C9: F4 94     .word tbl_94F4_spr_item_invincible_potion
- D 0 - I - 0x0013DB 00:93CB: FB 94     .word tbl_94FB_spr_item_max_health

tbl_93CD_sky_presets:
- D 0 - I - 0x0013DD 00:93CD: 0B 95     .word tbl_950B_spr_littlehood_balloon
- D 0 - I - 0x0013DF 00:93CF: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013E1 00:93D1: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013E3 00:93D3: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013E5 00:93D5: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013E7 00:93D7: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013E9 00:93D9: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013EB 00:93DB: 9B 94     .word tbl_949B_spr_item_crown
- D 0 - I - 0x0013ED 00:93DD: 9B 94     .word tbl_949B_spr_item_crown

tbl_93DF_move_animations_presets:
- D 0 - I - 0x0013EF 00:93DF: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x0013F1 00:93E1: CE 94     .word tbl_94CE_spr_snake_02
- D 0 - I - 0x0013F3 00:93E3: ED 94     .word tbl_94ED_spr_stairs
- D 0 - I - 0x0013F5 00:93E5: 1B 94     .word tbl_941B_spr_littlehood_idle_side
- D 0 - I - 0x0013F7 00:93E7: 22 94     .word tbl_9422_spr_littlehood_walk_side_01
- D 0 - I - 0x0013F9 00:93E9: 29 94     .word tbl_9429_spr_littlehood_walk_side_02
- D 0 - I - 0x0013FB 00:93EB: 45 94     .word tbl_9445_spr_littlehood_idle_up
- D 0 - I - 0x0013FD 00:93ED: 4C 94     .word tbl_944C_spr_littlehood_walk_up_01
- D 0 - I - 0x0013FF 00:93EF: 53 94     .word tbl_9453_spr_littlehood_walk_up_02
- D 0 - I - 0x001401 00:93F1: 30 94     .word tbl_9430_spr_littlehood_idle_down
- D 0 - I - 0x001403 00:93F3: 37 94     .word tbl_9437_spr_littlehood_walk_down_01
- D 0 - I - 0x001405 00:93F5: 3E 94     .word tbl_943E_spr_littlehood_walk_down_02
- D 0 - I - 0x001407 00:93F7: A7 94     .word tbl_94A7_spr_goblin_move_02
- D 0 - I - 0x001409 00:93F9: A0 94     .word tbl_94A0_spr_goblin_move_01
- D 0 - I - 0x00140B 00:93FB: A7 94     .word tbl_94A7_spr_goblin_move_02
- D 0 - I - 0x00140D 00:93FD: CE 94     .word tbl_94CE_spr_snake_02
- D 0 - I - 0x00140F 00:93FF: 94 94     .word tbl_9494_spr_snake_01
- D 0 - I - 0x001411 00:9401: CE 94     .word tbl_94CE_spr_snake_02
- D 0 - I - 0x001413 00:9403: D5 94     .word tbl_94D5_spr_scorpion_01
- D 0 - I - 0x001415 00:9405: DA 94     .word tbl_94DA_spr_scorpion_02
- D 0 - I - 0x001417 00:9407: D5 94     .word tbl_94D5_spr_scorpion_01
- D 0 - I - 0x001419 00:9409: 8D 94     .word tbl_948D_spr_dog_01
- D 0 - I - 0x00141B 00:940B: DF 94     .word tbl_94DF_spr_dog_02
- D 0 - I - 0x00141D 00:940D: 8D 94     .word tbl_948D_spr_dog_01
- - - - - - 0x00141F 00:940F: CE 94     .word tbl_94CE_spr_snake_02
- D 0 - I - 0x001421 00:9411: 94 94     .word tbl_9494_spr_snake_01
- D 0 - I - 0x001423 00:9413: CE 94     .word tbl_94CE_spr_snake_02
- D 0 - I - 0x001425 00:9415: B9 94     .word tbl_94B9_spr_porcupine_01
- D 0 - I - 0x001427 00:9417: 4D 95     .word tbl_954D_spr_porcupine_02
- D 0 - I - 0x001429 00:9419: B9 94     .word tbl_94B9_spr_porcupine_01

tbl_941B_spr_littlehood_idle_side:
- D 0 - I - 0x00142B 00:941B: 02        .byte $02,$02,$01,$3D,$3E,$40,$3F   ; 

tbl_9422_spr_littlehood_walk_side_01:
- D 0 - I - 0x001432 00:9422: 02        .byte $02,$02,$01,$3D,$3E,$54,$53   ; 

tbl_9429_spr_littlehood_walk_side_02:
- D 0 - I - 0x001439 00:9429: 02        .byte $02,$02,$01,$3D,$3E,$58,$57   ; 

tbl_9430_spr_littlehood_idle_down:
- D 0 - I - 0x001440 00:9430: 02        .byte $02,$02,$01,$05,$06,$08,$07   ; 

tbl_9437_spr_littlehood_walk_down_01:
- D 0 - I - 0x001447 00:9437: 02        .byte $02,$02,$01,$05,$06,$3C,$3B   ; 

tbl_943E_spr_littlehood_walk_down_02:
- D 0 - I - 0x00144E 00:943E: 02        .byte $02,$02,$01,$05,$06,$48,$47   ; 

tbl_9445_spr_littlehood_idle_up:
- D 0 - I - 0x001455 00:9445: 02        .byte $02,$02,$01,$1D,$1E,$20,$1F   ; 

tbl_944C_spr_littlehood_walk_up_01:
- D 0 - I - 0x00145C 00:944C: 02        .byte $02,$02,$01,$1D,$1E,$4C,$4B   ; 

tbl_9453_spr_littlehood_walk_up_02:
- D 0 - I - 0x001463 00:9453: 02        .byte $02,$02,$01,$1D,$1E,$50,$4F   ; 

tbl_945A_spr_littlehood_death:
- D 0 - I - 0x00146A 00:945A: 02        .byte $02,$02,$01,$39,$3A,$45,$46   ; 

tbl_9461_spr_seller_idle:
- D 0 - I - 0x001471 00:9461: 02        .byte $02,$03,$01,$9B,$9C,$77,$78,$A5,$A6   ; 

tbl_946A_spr_seller_greetings:
- D 0 - I - 0x00147A 00:946A: 02        .byte $02,$03,$01,$AA,$AB,$AD,$AC,$16,$00   ; 

tbl_9473_spr_littlehood_kick_side:
- D 0 - I - 0x001483 00:9473: 02        .byte $02,$02,$01,$3D,$3E,$AE,$AF   ; 

tbl_947A_spr_littlehood_kick_up:
- D 0 - I - 0x00148A 00:947A: 02        .byte $02,$02,$01,$1D,$1E,$B2,$B3   ; 

tbl_9481_spr_littlehood_kick_down:
- D 0 - I - 0x001491 00:9481: 02        .byte $02,$02,$01,$05,$06,$B0,$B1   ; 

tbl_9488_spr_rock:
- D 0 - I - 0x001498 00:9488: 02        .byte $02,$01,$02,$74,$7B   ; 

tbl_948D_spr_dog_01:
- D 0 - I - 0x00149D 00:948D: 02        .byte $02,$02,$20,$5D,$5E,$60,$5F   ; 

tbl_9494_spr_snake_01:
- D 0 - I - 0x0014A4 00:9494: 02        .byte $02,$02,$21,$C4,$C5,$C6,$FF   ; 

tbl_949B_spr_item_crown:
- D 0 - I - 0x0014AB 00:949B: 02        .byte $02,$01,$02,$A9,$A8  ; 

tbl_94A0_spr_goblin_move_01:
- D 0 - I - 0x0014B0 00:94A0: 02        .byte $02,$02,$00,$21,$22,$38,$37   ; 

tbl_94A7_spr_goblin_move_02:
- D 0 - I - 0x0014B7 00:94A7: 02        .byte $02,$02,$00,$21,$22,$44,$43   ; 

tbl_94AE_spr_hud_life:
- D 0 - I - 0x0014BE 00:94AE: 01        .byte $01,$01,$01,$15   ; 

tbl_94B2_spr_balloon:
- D 0 - I - 0x0014C2 00:94B2: 02        .byte $02,$02,$01,$62,$6F,$73,$70   ; 

tbl_94B9_spr_porcupine_01:
- D 0 - I - 0x0014C9 00:94B9: 02        .byte $02,$02,$20,$7F,$80,$82,$81   ; 

tbl_94C0_spr_turtle_face_down:
- D 0 - I - 0x0014D0 00:94C0: 02        .byte $02,$02,$03,$1C,$1B,$27,$28   ; 

tbl_94C7_spr_turtle_face_up:
- D 0 - I - 0x0014D7 00:94C7: 02        .byte $02,$02,$03,$76,$75,$2C,$2B   ; 

tbl_94CE_spr_snake_02:
- D 0 - I - 0x0014DE 00:94CE: 02        .byte $02,$02,$21,$C8,$C9,$C6,$FF   ; 

tbl_94D5_spr_scorpion_01:
- D 0 - I - 0x0014E5 00:94D5: 02        .byte $02,$01,$21,$DF,$EA   ; 

tbl_94DA_spr_scorpion_02:
- D 0 - I - 0x0014EA 00:94DA: 02        .byte $02,$01,$21,$E9,$EA   ; 

tbl_94DF_spr_dog_02:
- D 0 - I - 0x0014EF 00:94DF: 02        .byte $02,$02,$20,$5D,$5E,$64,$63   ; 

tbl_94E6_spr_fruit_cherry:
- D 0 - I - 0x0014F6 00:94E6: 02        .byte $02,$02,$01,$89,$FF,$8E,$8D   ; 

tbl_94ED_spr_stairs:
- D 0 - I - 0x0014FD 00:94ED: 02        .byte $02,$02,$01,$87,$8B,$8F,$8C   ; 

tbl_94F4_spr_item_invincible_potion:
- D 0 - I - 0x001504 00:94F4: 02        .byte $02,$02,$00,$93,$FF,$94,$FF   ; 

tbl_94FB_spr_item_max_health:
- D 0 - I - 0x00150B 00:94FB: 02        .byte $02,$02,$01,$FF,$68,$B5,$02   ; 

tbl_9502_spr_hud_item_slot:
- D 0 - I - 0x001512 00:9502: 01        .byte $01,$01,$00,$7D   ; 

; Probably used this 3 bytes as header for candy item but discarted	
- - - - - - 0x001516 00:9506: 02        .byte $02,$01,$00   ; Unused

tbl_9509_spr_item_candy:
- D 0 - I - 0x001519 00:9509: BA        .byte $BA,$BB   ; Loaded via instruction $C775 (high byte) & $C779 (low byte)

tbl_950B_spr_littlehood_balloon:
- D 0 - I - 0x00151B 00:950B: 02        .byte $02,$04,$01,$62,$6F,$73,$70,$05,$7C,$08,$88   ; 

tbl_9516_spr_shop_item_selected:
- D 0 - I - 0x001526 00:9516: 01        .byte $01,$01,$01,$7A   ; 

tbl_951A_spr_littlehood_swim_death:
- D 0 - I - 0x00152A 00:951A: 02        .byte $02,$02,$01,$35,$36,$41,$42   ; 

tbl_9521_spr_black_bear_move_01:
- D 0 - I - 0x001531 00:9521: 02        .byte $02,$04,$00,$D3,$D4,$D6,$D5,$D7,$D8,$DA,$DB   ; 

tbl_952C_spr_black_bear_move_02:
- D 0 - I - 0x00153C 00:952C: 02        .byte $02,$04,$00,$D3,$D4,$D6,$D5,$DB,$DC,$DE,$DD   ; 

tbl_9537_spr_grizzly_bear_move_01:
- D 0 - I - 0x001547 00:9537: 02        .byte $02,$04,$02,$E1,$E2,$E4,$E3,$E5,$E6,$E7,$E8   ; 

tbl_9542_spr_grizzly_bear_move_02:
- D 0 - I - 0x001552 00:9542: 02        .byte $02,$04,$02,$E1,$E2,$9E,$9D,$B7,$B6,$B4,$B8   ; 

tbl_954D_spr_porcupine_02:
- D 0 - I - 0x00155D 00:954D: 02        .byte $02,$02,$20,$7F,$80,$86,$85   ; 

tbl_9554_spr_fruit_grape:
- D 0 - I - 0x001564 00:9554: 02        .byte $02,$02,$00,$96,$95,$9A,$99   ; 

tbl_955B_spr_fruit_melon:
- D 0 - I - 0x00156B 00:955B: 02        .byte $02,$02,$02,$0D,$0E,$10,$0F   ; 

tbl_9562_spr_fruit_pineapple:
- D 0 - I - 0x001572 00:9562: 02        .byte $02,$02,$02,$33,$67,$65,$66   ; 

sub_9569:
C - - - - - 0x001579 00:9569: A2 02     LDX #$02
C - - - - - 0x00157B 00:956B: A9 00     LDA #$00

bra_956D:
C - - - - - 0x00157D 00:956D: 95 00     STA ram_0000,X
C - - - - - 0x00157F 00:956F: E8        INX
C - - - - - 0x001580 00:9570: D0 FB     BNE bra_956D

bra_9572:
C - - - - - 0x001582 00:9572: 9D 00 03  STA ram_0300,X
C - - - - - 0x001585 00:9575: E8        INX
C - - - - - 0x001586 00:9576: D0 FA     BNE bra_9572
C - - - - - 0x001588 00:9578: A9 01     LDA #$01
C - - - - - 0x00158A 00:957A: 85 04     STA ram_0004

bra_957C_RTS:
C - - - - - 0x00158C 00:957C: 60        RTS

sub_957D:
C - - - - - 0x00158D 00:957D: AD 39 06  LDA con_player_key	
C - - - - - 0x001590 00:9580: D0 FA     BNE bra_957C_RTS
C - - - - - 0x001592 00:9582: AD 30 06  LDA ram_0630
C - - - - - 0x001595 00:9585: F0 F5     BEQ bra_957C_RTS
C - - - - - 0x001597 00:9587: AD 2F 06  LDA ram_062F
C - - - - - 0x00159A 00:958A: D0 26     BNE bra_95B2
C - - - - - 0x00159C 00:958C: A5 16     LDA ram_0016
C - - - - - 0x00159E 00:958E: C9 FF     CMP #$FF
C - - - - - 0x0015A0 00:9590: D0 EA     BNE bra_957C_RTS
C - - - - - 0x0015A2 00:9592: A2 00     LDX #$00

bra_9594:
C - - - - - 0x0015A4 00:9594: BD 68 02  LDA ram_0268,X
C - - - - - 0x0015A7 00:9597: C9 F0     CMP #$F0
C - - - - - 0x0015A9 00:9599: B0 0A     BCS bra_95A5

bra_959B:
- - - - - - 0x0015AB 00:959B: 8A        TXA
- - - - - - 0x0015AC 00:959C: 18        CLC
- - - - - - 0x0015AD 00:959D: 69 08     ADC #$08
- - - - - - 0x0015AF 00:959F: AA        TAX
- - - - - - 0x0015B0 00:95A0: E0 28     CPX #$28
- - - - - - 0x0015B2 00:95A2: 90 F0     BCC bra_9594
- - - - - - 0x0015B4 00:95A4: 60        RTS

bra_95A5:
C - - - - - 0x0015B5 00:95A5: BD 69 02  LDA ram_0269,X
C - - - - - 0x0015B8 00:95A8: C9 74     CMP #$74
C - - - - - 0x0015BA 00:95AA: F0 EF     BEQ bra_959B
C - - - - - 0x0015BC 00:95AC: 86 BB     STX ram_00BB
C - - - - - 0x0015BE 00:95AE: 8D 2F 06  STA ram_062F
C - - - - - 0x0015C1 00:95B1: 60        RTS

bra_95B2:
C - - - - - 0x0015C2 00:95B2: A5 16     LDA ram_0016
C - - - - - 0x0015C4 00:95B4: C9 FF     CMP #$FF
C - - - - - 0x0015C6 00:95B6: B0 18     BCS bra_95D0
C - - - - - 0x0015C8 00:95B8: A4 BB     LDY ram_00BB
C - - - - - 0x0015CA 00:95BA: A9 FF     LDA #$FF
C - - - - - 0x0015CC 00:95BC: 99 69 02  STA ram_0269,Y
C - - - - - 0x0015CF 00:95BF: 99 6D 02  STA ram_026D,Y
C - - - - - 0x0015D2 00:95C2: A9 F8     LDA #$F8
C - - - - - 0x0015D4 00:95C4: 99 68 02  STA ram_0268,Y
C - - - - - 0x0015D7 00:95C7: 99 6C 02  STA ram_026C,Y
C - - - - - 0x0015DA 00:95CA: A9 00     LDA #$00
C - - - - - 0x0015DC 00:95CC: 8D 2F 06  STA ram_062F
C - - - - - 0x0015DF 00:95CF: 60        RTS

bra_95D0:
C - - - - - 0x0015E0 00:95D0: A5 BB     LDA ram_00BB
C - - - - - 0x0015E2 00:95D2: 4A        LSR
C - - - - - 0x0015E3 00:95D3: 4A        LSR
C - - - - - 0x0015E4 00:95D4: 18        CLC
C - - - - - 0x0015E5 00:95D5: 69 1A     ADC #$1A
C - - - - - 0x0015E7 00:95D7: 85 24     STA ram_0024
C - - - - - 0x0015E9 00:95D9: A5 D3     LDA ram_00D3
C - - - - - 0x0015EB 00:95DB: D0 04     BNE bra_95E1
C - - - - - 0x0015ED 00:95DD: A9 01     LDA #$01
C - - - - - 0x0015EF 00:95DF: 85 D3     STA ram_00D3

bra_95E1:
C - - - - - 0x0015F1 00:95E1: A9 C7     LDA #$C7
C - - - - - 0x0015F3 00:95E3: 85 46     STA ram_0046
C - - - - - 0x0015F5 00:95E5: A9 ED     LDA #$ED
C - - - - - 0x0015F7 00:95E7: 85 45     STA ram_0045
C - - - - - 0x0015F9 00:95E9: A9 00     LDA #$00
C - - - - - 0x0015FB 00:95EB: 85 4C     STA ram_004C
C - - - - - 0x0015FD 00:95ED: A9 28     LDA #$28
C - - - - - 0x0015FF 00:95EF: 85 4D     STA ram_004D
C - - - - - 0x001601 00:95F1: AE 3B 06  LDX ram_063B
C - - - - - 0x001604 00:95F4: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x001607 00:95F7: C9 02     CMP #$02
C - - - - - 0x001609 00:95F9: D0 04     BNE bra_95FF
C - - - - - 0x00160B 00:95FB: A9 C8     LDA #$C8
C - - - - - 0x00160D 00:95FD: D0 02     BNE bra_9601

bra_95FF:
C - - - - - 0x00160F 00:95FF: A9 B8     LDA #$B8

bra_9601:
C - - - - - 0x001611 00:9601: 85 4E     STA ram_004E
C - - - - - 0x001613 00:9603: 20 CE C0  JSR sub_C0CE
C - - - - - 0x001616 00:9606: 60        RTS

sub_9607:
C - - - - - 0x001617 00:9607: A5 1C     LDA ram_001C
C - - - - - 0x001619 00:9609: 29 20     AND #$20
C - - - - - 0x00161B 00:960B: F0 0B     BEQ bra_9618
C - - - - - 0x00161D 00:960D: A5 99     LDA ram_0099
C - - - - - 0x00161F 00:960F: D0 0B     BNE bra_961C_RTS
C - - - - - 0x001621 00:9611: A9 01     LDA #$01
C - - - - - 0x001623 00:9613: 85 99     STA ram_0099
C - - - - - 0x001625 00:9615: 85 98     STA ram_0098
C - - - - - 0x001627 00:9617: 60        RTS

bra_9618:
C - - - - - 0x001628 00:9618: A9 00     LDA #$00
C - - - - - 0x00162A 00:961A: 85 99     STA ram_0099

bra_961C_RTS:
C - - - - - 0x00162C 00:961C: 60        RTS

sub_961D:
C - - - - - 0x00162D 00:961D: A5 1C     LDA ram_001C
C - - - - - 0x00162F 00:961F: 29 10     AND #$10
C - - - - - 0x001631 00:9621: F0 0B     BEQ bra_962E
C - - - - - 0x001633 00:9623: A5 19     LDA ram_0019
C - - - - - 0x001635 00:9625: D0 0B     BNE bra_9632_RTS
C - - - - - 0x001637 00:9627: A9 01     LDA #$01
C - - - - - 0x001639 00:9629: 85 19     STA ram_0019
C - - - - - 0x00163B 00:962B: 85 29     STA ram_0029
C - - - - - 0x00163D 00:962D: 60        RTS

bra_962E:
C - - - - - 0x00163E 00:962E: A9 00     LDA #$00
C - - - - - 0x001640 00:9630: 85 19     STA ram_0019

bra_9632_RTS:
C - - - - - 0x001642 00:9632: 60        RTS

sub_9633:
C - - - - - 0x001643 00:9633: A9 01     LDA #$01
C - - - - - 0x001645 00:9635: 8D 16 40  STA $4016
C - - - - - 0x001648 00:9638: 4A        LSR
C - - - - - 0x001649 00:9639: AA        TAX
C - - - - - 0x00164A 00:963A: 8D 16 40  STA $4016
C - - - - - 0x00164D 00:963D: 20 41 96  JSR sub_9641
C - - - - - 0x001650 00:9640: E8        INX

sub_9641:
C - - - - - 0x001651 00:9641: A0 08     LDY #$08

bra_9643:
C - - - - - 0x001653 00:9643: 48        PHA
C - - - - - 0x001654 00:9644: BD 16 40  LDA $4016,X
C - - - - - 0x001657 00:9647: 85 1B     STA ram_001B
C - - - - - 0x001659 00:9649: 4A        LSR
C - - - - - 0x00165A 00:964A: 05 1B     ORA ram_001B
C - - - - - 0x00165C 00:964C: 4A        LSR
C - - - - - 0x00165D 00:964D: 68        PLA
C - - - - - 0x00165E 00:964E: 2A        ROL
C - - - - - 0x00165F 00:964F: 88        DEY
C - - - - - 0x001660 00:9650: D0 F1     BNE bra_9643
C - - - - - 0x001662 00:9652: 95 1C     STA ram_001C,X
C - - - - - 0x001664 00:9654: 60        RTS

sub_9655:
C - - - - - 0x001665 00:9655: A5 4E     LDA ram_004E
C - - - - - 0x001667 00:9657: 18        CLC
C - - - - - 0x001668 00:9658: 69 08     ADC #$08
C - - - - - 0x00166A 00:965A: 85 BC     STA ram_00BC
C - - - - - 0x00166C 00:965C: A5 4D     LDA ram_004D
C - - - - - 0x00166E 00:965E: 18        CLC
C - - - - - 0x00166F 00:965F: 69 08     ADC #$08
C - - - - - 0x001671 00:9661: 85 BD     STA ram_00BD
C - - - - - 0x001673 00:9663: A5 2C     LDA con_player_position_x
C - - - - - 0x001675 00:9665: 18        CLC
C - - - - - 0x001676 00:9666: 69 08     ADC #$08
C - - - - - 0x001678 00:9668: 85 C6     STA ram_00C6
C - - - - - 0x00167A 00:966A: A5 2D     LDA con_player_position_y
C - - - - - 0x00167C 00:966C: 18        CLC
C - - - - - 0x00167D 00:966D: 69 08     ADC #$08
C - - - - - 0x00167F 00:966F: 85 C7     STA ram_00C7
C - - - - - 0x001681 00:9671: A5 BC     LDA ram_00BC
C - - - - - 0x001683 00:9673: C5 C6     CMP ram_00C6
C - - - - - 0x001685 00:9675: B0 0C     BCS bra_9683
C - - - - - 0x001687 00:9677: A5 C6     LDA ram_00C6
C - - - - - 0x001689 00:9679: 38        SEC
C - - - - - 0x00168A 00:967A: E5 BC     SBC ram_00BC
C - - - - - 0x00168C 00:967C: C9 08     CMP #$08
C - - - - - 0x00168E 00:967E: F0 0F     BEQ bra_968F
C - - - - - 0x001690 00:9680: 90 0D     BCC bra_968F
C - - - - - 0x001692 00:9682: 60        RTS

bra_9683:
C - - - - - 0x001693 00:9683: A5 BC     LDA ram_00BC
C - - - - - 0x001695 00:9685: 38        SEC
C - - - - - 0x001696 00:9686: E5 C6     SBC ram_00C6
C - - - - - 0x001698 00:9688: C9 08     CMP #$08
C - - - - - 0x00169A 00:968A: F0 03     BEQ bra_968F
C - - - - - 0x00169C 00:968C: 90 01     BCC bra_968F
C - - - - - 0x00169E 00:968E: 60        RTS

bra_968F:
C - - - - - 0x00169F 00:968F: A5 BD     LDA ram_00BD
C - - - - - 0x0016A1 00:9691: C5 C7     CMP ram_00C7
C - - - - - 0x0016A3 00:9693: B0 0C     BCS bra_96A1
C - - - - - 0x0016A5 00:9695: A5 C7     LDA ram_00C7
C - - - - - 0x0016A7 00:9697: 38        SEC
C - - - - - 0x0016A8 00:9698: E5 BD     SBC ram_00BD
C - - - - - 0x0016AA 00:969A: C9 08     CMP #$08
C - - - - - 0x0016AC 00:969C: F0 0F     BEQ bra_96AD
C - - - - - 0x0016AE 00:969E: 90 0D     BCC bra_96AD
C - - - - - 0x0016B0 00:96A0: 60        RTS

bra_96A1:
C - - - - - 0x0016B1 00:96A1: A5 BD     LDA ram_00BD
C - - - - - 0x0016B3 00:96A3: 38        SEC
C - - - - - 0x0016B4 00:96A4: E5 C7     SBC ram_00C7
C - - - - - 0x0016B6 00:96A6: C9 08     CMP #$08
C - - - - - 0x0016B8 00:96A8: F0 03     BEQ bra_96AD
C - - - - - 0x0016BA 00:96AA: 90 01     BCC bra_96AD
C - - - - - 0x0016BC 00:96AC: 60        RTS

bra_96AD:
C - - - - - 0x0016BD 00:96AD: A5 81     LDA ram_0081
C - - - - - 0x0016BF 00:96AF: D0 08     BNE bra_96B9_RTS
C - - - - - 0x0016C1 00:96B1: A9 01     LDA #$01
C - - - - - 0x0016C3 00:96B3: 85 D2     STA ram_00D2
C - - - - - 0x0016C5 00:96B5: A9 01     LDA #$01
C - - - - - 0x0016C7 00:96B7: 85 CB     STA ram_00CB

bra_96B9_RTS:
C - - - - - 0x0016C9 00:96B9: 60        RTS

sub_96BA:
C - - - - - 0x0016CA 00:96BA: AE 3B 06  LDX ram_063B
C - - - - - 0x0016CD 00:96BD: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x0016D0 00:96C0: C9 03     CMP #$03
C - - - - - 0x0016D2 00:96C2: F0 0D     BEQ bra_96D1
C - - - - - 0x0016D4 00:96C4: C9 04     CMP #$04
C - - - - - 0x0016D6 00:96C6: F0 09     BEQ bra_96D1
C - - - - - 0x0016D8 00:96C8: C9 02     CMP #$02
C - - - - - 0x0016DA 00:96CA: F0 18     BEQ bra_96E4
C - - - - - 0x0016DC 00:96CC: C9 0A     CMP #$0A
C - - - - - 0x0016DE 00:96CE: F0 14     BEQ bra_96E4
C - - - - - 0x0016E0 00:96D0: 60        RTS

bra_96D1:
C - - - - - 0x0016E1 00:96D1: AD 20 03  LDA ram_0320
C - - - - - 0x0016E4 00:96D4: D0 09     BNE bra_96DF
C - - - - - 0x0016E6 00:96D6: A5 18     LDA ram_0018
C - - - - - 0x0016E8 00:96D8: D0 05     BNE bra_96DF

bra_96DA:
C - - - - - 0x0016EA 00:96DA: A9 01     LDA #$01
C - - - - - 0x0016EC 00:96DC: 85 13     STA ram_0013
C - - - - - 0x0016EE 00:96DE: 60        RTS

bra_96DF:
C - - - - - 0x0016EF 00:96DF: A9 00     LDA #$00
C - - - - - 0x0016F1 00:96E1: 85 13     STA ram_0013
C - - - - - 0x0016F3 00:96E3: 60        RTS

bra_96E4:
C - - - - - 0x0016F4 00:96E4: AD 20 03  LDA ram_0320
C - - - - - 0x0016F7 00:96E7: F0 F6     BEQ bra_96DF
C - - - - - 0x0016F9 00:96E9: D0 EF     BNE bra_96DA

sub_96EB:
C - - - - - 0x0016FB 00:96EB: A5 18     LDA ram_0018
C - - - - - 0x0016FD 00:96ED: F0 10     BEQ bra_96FF_RTS
C - - - - - 0x0016FF 00:96EF: A5 2D     LDA con_player_position_y
C - - - - - 0x001701 00:96F1: C9 D8     CMP #$D8
C - - - - - 0x001703 00:96F3: D0 0A     BNE bra_96FF_RTS
C - - - - - 0x001705 00:96F5: A9 01     LDA #$01
C - - - - - 0x001707 00:96F7: 85 70     STA ram_0070
C - - - - - 0x001709 00:96F9: A9 00     LDA #$00
C - - - - - 0x00170B 00:96FB: 85 18     STA ram_0018
C - - - - - 0x00170D 00:96FD: 85 32     STA ram_0032

bra_96FF_RTS:
C - - - - - 0x00170F 00:96FF: 60        RTS

sub_9700:
C - - - - - 0x001710 00:9700: A5 67     LDA ram_0067
C - - - - - 0x001712 00:9702: D0 01     BNE bra_9705
C - - - - - 0x001714 00:9704: 60        RTS

bra_9705:
C - - - - - 0x001715 00:9705: A9 00     LDA #$00
C - - - - - 0x001717 00:9707: 85 67     STA ram_0067
C - - - - - 0x001719 00:9709: A0 00     LDY #$00

bra_970B:
C - - - - - 0x00171B 00:970B: 98        TYA
C - - - - - 0x00171C 00:970C: C9 10     CMP #$10
C - - - - - 0x00171E 00:970E: F0 31     BEQ bra_9741_RTS
C - - - - - 0x001720 00:9710: B9 41 02  LDA ram_0241,Y
C - - - - - 0x001723 00:9713: C9 7D     CMP #$7D
C - - - - - 0x001725 00:9715: F0 06     BEQ bra_971D
C - - - - - 0x001727 00:9717: C8        INY
C - - - - - 0x001728 00:9718: C8        INY
C - - - - - 0x001729 00:9719: C8        INY
C - - - - - 0x00172A 00:971A: C8        INY
C - - - - - 0x00172B 00:971B: D0 EE     BNE bra_970B

bra_971D:
C - - - - - 0x00172D 00:971D: A5 78     LDA ram_0078
C - - - - - 0x00172F 00:971F: 99 41 02  STA ram_0241,Y
C - - - - - 0x001732 00:9722: A5 90     LDA ram_0090
C - - - - - 0x001734 00:9724: 99 42 02  STA ram_0242,Y
C - - - - - 0x001737 00:9727: A9 00     LDA #$00
C - - - - - 0x001739 00:9729: 85 78     STA ram_0078
C - - - - - 0x00173B 00:972B: 85 90     STA ram_0090
C - - - - - 0x00173D 00:972D: 98        TYA
C - - - - - 0x00173E 00:972E: D0 07     BNE bra_9737
C - - - - - 0x001740 00:9730: A9 20     LDA #$20
C - - - - - 0x001742 00:9732: 99 43 02  STA ram_0243,Y
C - - - - - 0x001745 00:9735: D0 0A     BNE bra_9741_RTS

bra_9737:
C - - - - - 0x001747 00:9737: 88        DEY
C - - - - - 0x001748 00:9738: B9 40 02  LDA ram_0240,Y
C - - - - - 0x00174B 00:973B: 18        CLC
C - - - - - 0x00174C 00:973C: 69 08     ADC #$08
C - - - - - 0x00174E 00:973E: 99 44 02  STA ram_0244,Y

bra_9741_RTS:
C - - - - - 0x001751 00:9741: 60        RTS

sub_9742:
C - - - - - 0x001752 00:9742: A5 86     LDA ram_0086
C - - - - - 0x001754 00:9744: D0 01     BNE bra_9747

bra_9746_RTS:
C - - - - - 0x001756 00:9746: 60        RTS

bra_9747:
C - - - - - 0x001757 00:9747: A9 00     LDA #$00
C - - - - - 0x001759 00:9749: 85 86     STA ram_0086
C - - - - - 0x00175B 00:974B: A0 00     LDY #$00

bra_974D:
C - - - - - 0x00175D 00:974D: 98        TYA
C - - - - - 0x00175E 00:974E: C9 10     CMP #$10
C - - - - - 0x001760 00:9750: F0 F4     BEQ bra_9746_RTS
C - - - - - 0x001762 00:9752: A5 78     LDA ram_0078
C - - - - - 0x001764 00:9754: D9 41 02  CMP ram_0241,Y
C - - - - - 0x001767 00:9757: F0 06     BEQ bra_975F
C - - - - - 0x001769 00:9759: C8        INY
C - - - - - 0x00176A 00:975A: C8        INY
C - - - - - 0x00176B 00:975B: C8        INY
C - - - - - 0x00176C 00:975C: C8        INY
C - - - - - 0x00176D 00:975D: D0 EE     BNE bra_974D

bra_975F:
C - - - - - 0x00176F 00:975F: 98        TYA
C - - - - - 0x001770 00:9760: 85 8C     STA ram_008C

bra_9762:
C - - - - - 0x001772 00:9762: C8        INY
C - - - - - 0x001773 00:9763: C8        INY
C - - - - - 0x001774 00:9764: C8        INY
C - - - - - 0x001775 00:9765: C8        INY
C - - - - - 0x001776 00:9766: 98        TYA
C - - - - - 0x001777 00:9767: C9 10     CMP #$10
C - - - - - 0x001779 00:9769: F0 07     BEQ bra_9772
C - - - - - 0x00177B 00:976B: B9 41 02  LDA ram_0241,Y
C - - - - - 0x00177E 00:976E: C9 7D     CMP #$7D
C - - - - - 0x001780 00:9770: D0 09     BNE bra_977B

bra_9772:
C - - - - - 0x001782 00:9772: A5 8C     LDA ram_008C
C - - - - - 0x001784 00:9774: AA        TAX
C - - - - - 0x001785 00:9775: A9 7D     LDA #$7D
C - - - - - 0x001787 00:9777: 9D 41 02  STA ram_0241,X
C - - - - - 0x00178A 00:977A: 60        RTS

bra_977B:
- - - - - - 0x00178B 00:977B: A5 8C     LDA ram_008C
- - - - - - 0x00178D 00:977D: AA        TAX
- - - - - - 0x00178E 00:977E: B9 41 02  LDA ram_0241,Y
- - - - - - 0x001791 00:9781: 9D 41 02  STA ram_0241,X
- - - - - - 0x001794 00:9784: 98        TYA
- - - - - - 0x001795 00:9785: 85 8C     STA ram_008C
- - - - - - 0x001797 00:9787: D0 D9     BNE bra_9762

sub_9789:
C - - - - - 0x001799 00:9789: A9 0A     LDA #$0A
C - - - - - 0x00179B 00:978B: 85 C5     STA ram_00C5
C - - - - - 0x00179D 00:978D: A2 00     LDX #$00
C - - - - - 0x00179F 00:978F: A0 00     LDY #$00

loc_9791:
C D 0 - - - 0x0017A1 00:9791: A5 C5     LDA ram_00C5
C - - - - - 0x0017A3 00:9793: C9 00     CMP #$00
C - - - - - 0x0017A5 00:9795: F0 25     BEQ bra_97BC_RTS
C - - - - - 0x0017A7 00:9797: BD 04 04  LDA ram_0404,X
C - - - - - 0x0017AA 00:979A: 99 40 02  STA ram_0240,Y
C - - - - - 0x0017AD 00:979D: E8        INX
C - - - - - 0x0017AE 00:979E: BD 04 04  LDA ram_0404,X
C - - - - - 0x0017B1 00:97A1: 99 41 02  STA ram_0241,Y
C - - - - - 0x0017B4 00:97A4: E8        INX
C - - - - - 0x0017B5 00:97A5: BD 04 04  LDA ram_0404,X
C - - - - - 0x0017B8 00:97A8: 99 42 02  STA ram_0242,Y
C - - - - - 0x0017BB 00:97AB: E8        INX
C - - - - - 0x0017BC 00:97AC: BD 04 04  LDA ram_0404,X
C - - - - - 0x0017BF 00:97AF: 99 43 02  STA ram_0243,Y
C - - - - - 0x0017C2 00:97B2: E8        INX
C - - - - - 0x0017C3 00:97B3: C8        INY
C - - - - - 0x0017C4 00:97B4: C8        INY
C - - - - - 0x0017C5 00:97B5: C8        INY
C - - - - - 0x0017C6 00:97B6: C8        INY
C - - - - - 0x0017C7 00:97B7: C6 C5     DEC ram_00C5
C - - - - - 0x0017C9 00:97B9: 4C 91 97  JMP loc_9791

bra_97BC_RTS:
C - - - - - 0x0017CC 00:97BC: 60        RTS

sub_97BD:
C - - - - - 0x0017CD 00:97BD: A9 0A     LDA #$0A
C - - - - - 0x0017CF 00:97BF: 85 C5     STA ram_00C5
C - - - - - 0x0017D1 00:97C1: A2 00     LDX #$00
C - - - - - 0x0017D3 00:97C3: A0 00     LDY #$00

loc_97C5:
C D 0 - - - 0x0017D5 00:97C5: A5 C5     LDA ram_00C5
C - - - - - 0x0017D7 00:97C7: C9 00     CMP #$00
C - - - - - 0x0017D9 00:97C9: F0 25     BEQ bra_97F0_RTS
C - - - - - 0x0017DB 00:97CB: BD 40 02  LDA ram_0240,X
C - - - - - 0x0017DE 00:97CE: 99 04 04  STA ram_0404,Y
C - - - - - 0x0017E1 00:97D1: C8        INY
C - - - - - 0x0017E2 00:97D2: BD 41 02  LDA ram_0241,X
C - - - - - 0x0017E5 00:97D5: 99 04 04  STA ram_0404,Y
C - - - - - 0x0017E8 00:97D8: C8        INY
C - - - - - 0x0017E9 00:97D9: BD 42 02  LDA ram_0242,X
C - - - - - 0x0017EC 00:97DC: 99 04 04  STA ram_0404,Y
C - - - - - 0x0017EF 00:97DF: C8        INY
C - - - - - 0x0017F0 00:97E0: BD 43 02  LDA ram_0243,X
C - - - - - 0x0017F3 00:97E3: 99 04 04  STA ram_0404,Y
C - - - - - 0x0017F6 00:97E6: C8        INY
C - - - - - 0x0017F7 00:97E7: E8        INX
C - - - - - 0x0017F8 00:97E8: E8        INX
C - - - - - 0x0017F9 00:97E9: E8        INX
C - - - - - 0x0017FA 00:97EA: E8        INX
C - - - - - 0x0017FB 00:97EB: C6 C5     DEC ram_00C5
C - - - - - 0x0017FD 00:97ED: 4C C5 97  JMP loc_97C5

bra_97F0_RTS:
C - - - - - 0x001800 00:97F0: 60        RTS

sub_97F1:
C - - - - - 0x001801 00:97F1: A5 1C     LDA ram_001C
C - - - - - 0x001803 00:97F3: 29 08     AND #$08
C - - - - - 0x001805 00:97F5: F0 F9     BEQ bra_97F0_RTS
C - - - - - 0x001807 00:97F7: A5 A8     LDA ram_00A8
C - - - - - 0x001809 00:97F9: 0D 20 03  ORA ram_0320
C - - - - - 0x00180C 00:97FC: 05 18     ORA ram_0018
C - - - - - 0x00180E 00:97FE: 0D 30 03  ORA ram_0330
C - - - - - 0x001811 00:9801: D0 4D     BNE bra_9850_RTS
C - - - - - 0x001813 00:9803: A5 2C     LDA con_player_position_x
C - - - - - 0x001815 00:9805: 18        CLC
C - - - - - 0x001816 00:9806: 65 16     ADC ram_0016
C - - - - - 0x001818 00:9808: 85 C6     STA ram_00C6
C - - - - - 0x00181A 00:980A: A5 2D     LDA con_player_position_y
C - - - - - 0x00181C 00:980C: 85 C7     STA ram_00C7
C - - - - - 0x00181E 00:980E: AE 3B 06  LDX ram_063B
C - - - - - 0x001821 00:9811: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x001824 00:9814: 0A        ASL
C - - - - - 0x001825 00:9815: AA        TAX
C - - - - - 0x001826 00:9816: BD B2 CE  LDA tbl_CEB2_waypoints_table,X
C - - - - - 0x001829 00:9819: 85 30     STA ram_0030
C - - - - - 0x00182B 00:981B: BD B3 CE  LDA tbl_CEB2_waypoints_table+1,X
C - - - - - 0x00182E 00:981E: 85 31     STA ram_0031
C - - - - - 0x001830 00:9820: A0 00     LDY #$00

loc_9822:
C D 0 - - - 0x001832 00:9822: B1 30     LDA (ram_0030),Y
C - - - - - 0x001834 00:9824: C9 FF     CMP #$FF
C - - - - - 0x001836 00:9826: F0 28     BEQ bra_9850_RTS
C - - - - - 0x001838 00:9828: 85 96     STA ram_0096
C - - - - - 0x00183A 00:982A: C5 C6     CMP ram_00C6
C - - - - - 0x00183C 00:982C: B0 08     BCS bra_9836
C - - - - - 0x00183E 00:982E: A5 C6     LDA ram_00C6
C - - - - - 0x001840 00:9830: 38        SEC
C - - - - - 0x001841 00:9831: E5 96     SBC ram_0096
C - - - - - 0x001843 00:9833: 4C 39 98  JMP loc_9839

bra_9836:
C - - - - - 0x001846 00:9836: 38        SEC
C - - - - - 0x001847 00:9837: E5 C6     SBC ram_00C6

loc_9839:
C D 0 - - - 0x001849 00:9839: C9 04     CMP #$04
C - - - - - 0x00184B 00:983B: B0 0E     BCS bra_984B
C - - - - - 0x00184D 00:983D: C8        INY
C - - - - - 0x00184E 00:983E: B1 30     LDA (ram_0030),Y
C - - - - - 0x001850 00:9840: C5 C7     CMP ram_00C7
C - - - - - 0x001852 00:9842: 90 08     BCC bra_984C
C - - - - - 0x001854 00:9844: A9 01     LDA #$01
C - - - - - 0x001856 00:9846: 85 12     STA ram_0012
C - - - - - 0x001858 00:9848: 85 18     STA ram_0018
C - - - - - 0x00185A 00:984A: 60        RTS

bra_984B:
C - - - - - 0x00185B 00:984B: C8        INY

bra_984C:
C - - - - - 0x00185C 00:984C: C8        INY
C - - - - - 0x00185D 00:984D: 4C 22 98  JMP loc_9822

bra_9850_RTS:
C - - - - - 0x001860 00:9850: 60        RTS

sub_9851:
C - - - - - 0x001861 00:9851: A5 1C     LDA ram_001C
C - - - - - 0x001863 00:9853: 29 40     AND #$40
C - - - - - 0x001865 00:9855: F0 0E     BEQ bra_9865
C - - - - - 0x001867 00:9857: AD 18 03  LDA ram_0318
C - - - - - 0x00186A 00:985A: D0 0E     BNE bra_986A_RTS
C - - - - - 0x00186C 00:985C: A9 01     LDA #$01
C - - - - - 0x00186E 00:985E: 8D 18 03  STA ram_0318
C - - - - - 0x001871 00:9861: 8D 14 03  STA ram_0314
C - - - - - 0x001874 00:9864: 60        RTS

bra_9865:
C - - - - - 0x001875 00:9865: A9 00     LDA #$00
C - - - - - 0x001877 00:9867: 8D 18 03  STA ram_0318

bra_986A_RTS:
C - - - - - 0x00187A 00:986A: 60        RTS

sub_986B:
C - - - - - 0x00187B 00:986B: A5 1C     LDA ram_001C
C - - - - - 0x00187D 00:986D: 29 80     AND #$80
C - - - - - 0x00187F 00:986F: F0 0E     BEQ bra_987F
C - - - - - 0x001881 00:9871: AD 19 03  LDA ram_0319
C - - - - - 0x001884 00:9874: D0 0E     BNE bra_9884_RTS
C - - - - - 0x001886 00:9876: A9 01     LDA #$01
C - - - - - 0x001888 00:9878: 8D 19 03  STA ram_0319
C - - - - - 0x00188B 00:987B: 8D 1B 03  STA ram_031B
C - - - - - 0x00188E 00:987E: 60        RTS

bra_987F:
C - - - - - 0x00188F 00:987F: A9 00     LDA #$00
C - - - - - 0x001891 00:9881: 8D 19 03  STA ram_0319

bra_9884_RTS:
C - - - - - 0x001894 00:9884: 60        RTS

sub_9885:
C - - - - - 0x001895 00:9885: AD 89 03  LDA ram_0389
C - - - - - 0x001898 00:9888: D0 1E     BNE bra_98A8_RTS
C - - - - - 0x00189A 00:988A: AE 3B 06  LDX ram_063B
C - - - - - 0x00189D 00:988D: BD 2D 06  LDA con_p1_current_fruits,X 	; fruit counter player 1
C - - - - - 0x0018A0 00:9890: C9 0C     CMP #$0C 						; 12 fruit to unlock key
C - - - - - 0x0018A2 00:9892: B0 01     BCS bra_9895
C - - - - - 0x0018A4 00:9894: 60        RTS

bra_9895:
C - - - - - 0x0018A5 00:9895: AD 39 06  LDA con_player_key				; key flag
C - - - - - 0x0018A8 00:9898: F0 0E     BEQ bra_98A8_RTS
C - - - - - 0x0018AA 00:989A: A9 01     LDA #$01
C - - - - - 0x0018AC 00:989C: 8D 88 03  STA ram_0388
C - - - - - 0x0018AF 00:989F: 8D 89 03  STA ram_0389
C - - - - - 0x0018B2 00:98A2: 8D 27 03  STA ram_0327
C - - - - - 0x0018B5 00:98A5: 8D 28 03  STA ram_0328

bra_98A8_RTS:
C - - - - - 0x0018B8 00:98A8: 60        RTS

sub_98A9:
C - - - - - 0x0018B9 00:98A9: AD 88 03  LDA ram_0388
C - - - - - 0x0018BC 00:98AC: F0 16     BEQ bra_98C4_RTS
C - - - - - 0x0018BE 00:98AE: AD C0 02  LDA ram_02C0
C - - - - - 0x0018C1 00:98B1: C9 F8     CMP #$F8
C - - - - - 0x0018C3 00:98B3: F0 07     BEQ bra_98BC
- - - - - - 0x0018C5 00:98B5: A9 01     LDA #$01
- - - - - - 0x0018C7 00:98B7: 85 D9     STA ram_00D9
- - - - - - 0x0018C9 00:98B9: 8D 21 03  STA ram_0321

bra_98BC:
C - - - - - 0x0018CC 00:98BC: A9 00     LDA #$00
C - - - - - 0x0018CE 00:98BE: 8D 8B 03  STA ram_038B
C - - - - - 0x0018D1 00:98C1: 8D 88 03  STA ram_0388

bra_98C4_RTS:
C - - - - - 0x0018D4 00:98C4: 60        RTS

sub_98C5:
C - - - - - 0x0018D5 00:98C5: AD 27 03  LDA ram_0327
C - - - - - 0x0018D8 00:98C8: F0 01     BEQ bra_98CB
C - - - - - 0x0018DA 00:98CA: 60        RTS

bra_98CB:
C - - - - - 0x0018DB 00:98CB: A5 7C     LDA ram_007C
C - - - - - 0x0018DD 00:98CD: C9 0B     CMP #$0B
C - - - - - 0x0018DF 00:98CF: D0 0C     BNE bra_98DD_RTS
C - - - - - 0x0018E1 00:98D1: A5 7B     LDA ram_007B
C - - - - - 0x0018E3 00:98D3: D0 08     BNE bra_98DD_RTS
C - - - - - 0x0018E5 00:98D5: A9 01     LDA #$01
C - - - - - 0x0018E7 00:98D7: 8D 22 03  STA ram_0322
C - - - - - 0x0018EA 00:98DA: 8D 21 03  STA ram_0321

bra_98DD_RTS:
C - - - - - 0x0018ED 00:98DD: 60        RTS

bra_98DE:
- - - - - - 0x0018EE 00:98DE: C9 30     CMP #$30
- - - - - - 0x0018F0 00:98E0: D0 FB     BNE bra_98DD_RTS
- - - - - - 0x0018F2 00:98E2: A5 7B     LDA ram_007B
- - - - - - 0x0018F4 00:98E4: D0 F7     BNE bra_98DD_RTS
- - - - - - 0x0018F6 00:98E6: A9 00     LDA #$00
- - - - - - 0x0018F8 00:98E8: 8D 8B 03  STA ram_038B
- - - - - - 0x0018FB 00:98EB: A9 01     LDA #$01
- - - - - - 0x0018FD 00:98ED: 85 D9     STA ram_00D9
- - - - - - 0x0018FF 00:98EF: 8D 21 03  STA ram_0321
- - - - - - 0x001902 00:98F2: 60        RTS

sub_98F3:
C - - - - - 0x001903 00:98F3: AE 3B 06  LDX ram_063B
C - - - - - 0x001906 00:98F6: BD 33 06  LDA con_player_current_money,X		; load current money
C - - - - - 0x001909 00:98F9: C9 32     CMP #$32			
C - - - - - 0x00190B 00:98FB: 90 0F     BCC bra_990C_RTS					; if money > $31 ($4900)
C - - - - - 0x00190D 00:98FD: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x001910 00:9900: 38        SEC
C - - - - - 0x001911 00:9901: E9 32     SBC #$32				
C - - - - - 0x001913 00:9903: 9D 33 06  STA con_player_current_money,X		; restart money to $0 (bullshit!)
C - - - - - 0x001916 00:9906: CE 3E 06  DEC ram_063E
C - - - - - 0x001919 00:9909: CE 3F 06  DEC ram_063F

bra_990C_RTS:
C - - - - - 0x00191C 00:990C: 60        RTS

sub_990D:
C - - - - - 0x00191D 00:990D: AD 50 03  LDA ram_0350
C - - - - - 0x001920 00:9910: D0 02     BNE bra_9914
C - - - - - 0x001922 00:9912: 18        CLC
C - - - - - 0x001923 00:9913: 60        RTS

bra_9914:
C - - - - - 0x001924 00:9914: A2 06     LDX #$06
C - - - - - 0x001926 00:9916: A9 0F     LDA #$0F
C - - - - - 0x001928 00:9918: 9D 00 20  STA $2000,X
C - - - - - 0x00192B 00:991B: A9 73     LDA #$73
C - - - - - 0x00192D 00:991D: 9D 00 20  STA $2000,X
C - - - - - 0x001930 00:9920: BD 01 20  LDA $2001,X
C - - - - - 0x001933 00:9923: BD 01 20  LDA $2001,X
C - - - - - 0x001936 00:9926: 8D 56 04  STA ram_0456
C - - - - - 0x001939 00:9929: A9 0F     LDA #$0F
C - - - - - 0x00193B 00:992B: 9D 00 20  STA $2000,X
C - - - - - 0x00193E 00:992E: A9 7B     LDA #$7B
C - - - - - 0x001940 00:9930: 9D 00 20  STA $2000,X
C - - - - - 0x001943 00:9933: BD 01 20  LDA $2001,X
C - - - - - 0x001946 00:9936: BD 01 20  LDA $2001,X
C - - - - - 0x001949 00:9939: 8D 57 04  STA ram_0457
C - - - - - 0x00194C 00:993C: EE 51 03  INC ram_0351
C - - - - - 0x00194F 00:993F: AD 51 03  LDA ram_0351
C - - - - - 0x001952 00:9942: C9 70     CMP #$70
C - - - - - 0x001954 00:9944: 90 03     BCC bra_9949
C - - - - - 0x001956 00:9946: 4C E9 99  JMP loc_99E9

bra_9949:
C - - - - - 0x001959 00:9949: AD 52 03  LDA ram_0352
C - - - - - 0x00195C 00:994C: F0 03     BEQ bra_9951
C - - - - - 0x00195E 00:994E: 4C D6 99  JMP loc_99D6

bra_9951:
C - - - - - 0x001961 00:9951: A9 01     LDA #$01
C - - - - - 0x001963 00:9953: 8D 52 03  STA ram_0352
C - - - - - 0x001966 00:9956: A9 00     LDA #$00
C - - - - - 0x001968 00:9958: 8D 01 20  STA $2001
C - - - - - 0x00196B 00:995B: 8D 00 20  STA $2000
C - - - - - 0x00196E 00:995E: 20 E6 87  JSR sub_87E6
C - - - - - 0x001971 00:9961: 20 D8 C2  JSR sub_C2D8
C - - - - - 0x001974 00:9964: A9 81     LDA #>tbl_81C8_palette_life_left_counter
C - - - - - 0x001976 00:9966: 85 07     STA ram_0007
C - - - - - 0x001978 00:9968: A9 C8     LDA #<tbl_81C8_palette_life_left_counter
C - - - - - 0x00197A 00:996A: 85 06     STA ram_0006
C - - - - - 0x00197C 00:996C: A0 00     LDY #$00
C - - - - - 0x00197E 00:996E: A2 3F     LDX #$3F
C - - - - - 0x001980 00:9970: A9 00     LDA #$00
C - - - - - 0x001982 00:9972: 8E 06 20  STX $2006
C - - - - - 0x001985 00:9975: 8D 06 20  STA $2006

bra_9978_load_palette:
C - - - - - 0x001988 00:9978: B1 06     LDA (ram_0006),Y			
C - - - - - 0x00198A 00:997A: 8D 07 20  STA $2007
C - - - - - 0x00198D 00:997D: C8        INY
C - - - - - 0x00198E 00:997E: C0 10     CPY #var_81C8
C - - - - - 0x001990 00:9980: 90 F6     BCC bra_9978_load_palette
C - - - - - 0x001992 00:9982: 20 F7 BF  JSR sub_BFF7
C - - - - - 0x001995 00:9985: 20 D0 BE  JSR sub_BED0
C - - - - - 0x001998 00:9988: A9 60     LDA #$60
C - - - - - 0x00199A 00:998A: 85 4E     STA ram_004E
C - - - - - 0x00199C 00:998C: A9 80     LDA #$80
C - - - - - 0x00199E 00:998E: 85 4D     STA ram_004D
C - - - - - 0x0019A0 00:9990: A9 00     LDA #$00
C - - - - - 0x0019A2 00:9992: 85 4C     STA ram_004C
C - - - - - 0x0019A4 00:9994: 85 24     STA ram_0024
C - - - - - 0x0019A6 00:9996: A9 94     LDA #$94
C - - - - - 0x0019A8 00:9998: 85 46     STA ram_0046
C - - - - - 0x0019AA 00:999A: A9 30     LDA #$30
C - - - - - 0x0019AC 00:999C: 85 45     STA ram_0045
C - - - - - 0x0019AE 00:999E: 20 CE C0  JSR sub_C0CE
C - - - - - 0x0019B1 00:99A1: A9 87     LDA #$87
C - - - - - 0x0019B3 00:99A3: 8D 10 02  STA ram_0210
C - - - - - 0x0019B6 00:99A6: A9 7C     LDA #$7C
C - - - - - 0x0019B8 00:99A8: 8D 13 02  STA ram_0213
C - - - - - 0x0019BB 00:99AB: A9 D0     LDA #$D0
C - - - - - 0x0019BD 00:99AD: 8D 11 02  STA ram_0211
C - - - - - 0x0019C0 00:99B0: A9 02     LDA #$02
C - - - - - 0x0019C2 00:99B2: 8D 12 02  STA ram_0212
C - - - - - 0x0019C5 00:99B5: AE 3B 06  LDX ram_063B
C - - - - - 0x0019C8 00:99B8: A9 03     LDA #$03
C - - - - - 0x0019CA 00:99BA: 38        SEC
C - - - - - 0x0019CB 00:99BB: FD 3E 06  SBC ram_063E,X
C - - - - - 0x0019CE 00:99BE: 18        CLC
C - - - - - 0x0019CF 00:99BF: 69 D0     ADC #$D0
C - - - - - 0x0019D1 00:99C1: 8D 53 03  STA ram_0353
C - - - - - 0x0019D4 00:99C4: A2 00     LDX #$00
C - - - - - 0x0019D6 00:99C6: A9 22     LDA #$22
C - - - - - 0x0019D8 00:99C8: 8D 06 20  STA $2006
C - - - - - 0x0019DB 00:99CB: A9 32     LDA #$32
C - - - - - 0x0019DD 00:99CD: 8D 06 20  STA $2006
C - - - - - 0x0019E0 00:99D0: AD 53 03  LDA ram_0353
C - - - - - 0x0019E3 00:99D3: 8D 07 20  STA $2007

loc_99D6:
C D 0 - - - 0x0019E6 00:99D6: A9 1E     LDA #$1E
C - - - - - 0x0019E8 00:99D8: 8D 01 20  STA $2001
C - - - - - 0x0019EB 00:99DB: 85 01     STA ram_0001
C - - - - - 0x0019ED 00:99DD: A9 88     LDA #$88
C - - - - - 0x0019EF 00:99DF: 85 00     STA ram_0000
C - - - - - 0x0019F1 00:99E1: 8D 00 20  STA $2000
C - - - - - 0x0019F4 00:99E4: 20 A6 AC  JSR sub_ACA6
C - - - - - 0x0019F7 00:99E7: 38        SEC
C - - - - - 0x0019F8 00:99E8: 60        RTS

loc_99E9:
C D 0 - - - 0x0019F9 00:99E9: A9 00     LDA #$00
C - - - - - 0x0019FB 00:99EB: 8D 50 03  STA ram_0350
C - - - - - 0x0019FE 00:99EE: 8D 51 03  STA ram_0351
C - - - - - 0x001A01 00:99F1: 8D 52 03  STA ram_0352
C - - - - - 0x001A04 00:99F4: 20 34 C3  JSR sub_C334
C - - - - - 0x001A07 00:99F7: 18        CLC
C - - - - - 0x001A08 00:99F8: 60        RTS

sub_99F9:
C - - - - - 0x001A09 00:99F9: AE 3B 06  LDX ram_063B
C - - - - - 0x001A0C 00:99FC: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x001A0F 00:99FF: C9 0B     CMP #$0B
C - - - - - 0x001A11 00:9A01: 90 17     BCC bra_9A1A_RTS
- - - - - - 0x001A13 00:9A03: AD 42 06  LDA ram_0642
- - - - - - 0x001A16 00:9A06: F0 0E     BEQ bra_9A16
- - - - - - 0x001A18 00:9A08: AD 3B 06  LDA ram_063B
- - - - - - 0x001A1B 00:9A0B: D0 09     BNE bra_9A16
- - - - - - 0x001A1D 00:9A0D: AD 3B 06  LDA ram_063B
- - - - - - 0x001A20 00:9A10: 49 01     EOR #$01
- - - - - - 0x001A22 00:9A12: 8D 3B 06  STA ram_063B
- - - - - - 0x001A25 00:9A15: 60        RTS

bra_9A16:
- - - - - - 0x001A26 00:9A16: A9 01     LDA #$01
- - - - - - 0x001A28 00:9A18: 85 05     STA ram_0005

bra_9A1A_RTS:
C - - - - - 0x001A2A 00:9A1A: 60        RTS

sub_9A1B:
C - - - - - 0x001A2B 00:9A1B: A5 1C     LDA ram_001C
C - - - - - 0x001A2D 00:9A1D: 29 40     AND #$40
C - - - - - 0x001A2F 00:9A1F: F0 0D     BEQ bra_9A2E
C - - - - - 0x001A31 00:9A21: A5 A9     LDA ram_00A9
C - - - - - 0x001A33 00:9A23: D0 0D     BNE bra_9A32_RTS
C - - - - - 0x001A35 00:9A25: A9 01     LDA #$01
C - - - - - 0x001A37 00:9A27: 85 A9     STA ram_00A9
C - - - - - 0x001A39 00:9A29: 85 A8     STA ram_00A8
C - - - - - 0x001A3B 00:9A2B: 85 9F     STA ram_009F
C - - - - - 0x001A3D 00:9A2D: 60        RTS

bra_9A2E:
C - - - - - 0x001A3E 00:9A2E: A9 00     LDA #$00
C - - - - - 0x001A40 00:9A30: 85 A9     STA ram_00A9

bra_9A32_RTS:
C - - - - - 0x001A42 00:9A32: 60        RTS

sub_9A33:
C - - - - - 0x001A43 00:9A33: AE 3B 06  LDX ram_063B
C - - - - - 0x001A46 00:9A36: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x001A49 00:9A39: C9 03     CMP #$03
C - - - - - 0x001A4B 00:9A3B: F0 0F     BEQ bra_9A4C
C - - - - - 0x001A4D 00:9A3D: C9 04     CMP #$04
C - - - - - 0x001A4F 00:9A3F: D0 19     BNE bra_9A5A_RTS
C - - - - - 0x001A51 00:9A41: A5 16     LDA ram_0016
C - - - - - 0x001A53 00:9A43: C9 FF     CMP #$FF
C - - - - - 0x001A55 00:9A45: D0 13     BNE bra_9A5A_RTS
C - - - - - 0x001A57 00:9A47: A2 08     LDX #$08
C - - - - - 0x001A59 00:9A49: 4C C7 9A  JMP loc_9AC7

bra_9A4C:
C - - - - - 0x001A5C 00:9A4C: AD 20 03  LDA ram_0320
C - - - - - 0x001A5F 00:9A4F: D0 09     BNE bra_9A5A_RTS
C - - - - - 0x001A61 00:9A51: A5 18     LDA ram_0018
C - - - - - 0x001A63 00:9A53: D0 05     BNE bra_9A5A_RTS
C - - - - - 0x001A65 00:9A55: AD 30 03  LDA ram_0330
C - - - - - 0x001A68 00:9A58: F0 01     BEQ bra_9A5B

bra_9A5A_RTS:
C - - - - - 0x001A6A 00:9A5A: 60        RTS

bra_9A5B:
C - - - - - 0x001A6B 00:9A5B: A5 16     LDA ram_0016
C - - - - - 0x001A6D 00:9A5D: C9 5F     CMP #$5F
C - - - - - 0x001A6F 00:9A5F: 90 F9     BCC bra_9A5A_RTS
C - - - - - 0x001A71 00:9A61: C9 C1     CMP #$C1
C - - - - - 0x001A73 00:9A63: B0 F5     BCS bra_9A5A_RTS
C - - - - - 0x001A75 00:9A65: A5 2C     LDA con_player_position_x
C - - - - - 0x001A77 00:9A67: CD E3 02  CMP ram_02E3
C - - - - - 0x001A7A 00:9A6A: B0 1B     BCS bra_9A87
C - - - - - 0x001A7C 00:9A6C: AD E3 02  LDA ram_02E3
C - - - - - 0x001A7F 00:9A6F: 38        SEC
C - - - - - 0x001A80 00:9A70: E5 2C     SBC con_player_position_x
C - - - - - 0x001A82 00:9A72: C9 04     CMP #$04
C - - - - - 0x001A84 00:9A74: B0 49     BCS bra_9ABF

loc_9A76:
C D 0 - - - 0x001A86 00:9A76: AD E0 02  LDA ram_02E0
C - - - - - 0x001A89 00:9A79: 38        SEC
C - - - - - 0x001A8A 00:9A7A: E5 2D     SBC con_player_position_y
C - - - - - 0x001A8C 00:9A7C: 90 41     BCC bra_9ABF
C - - - - - 0x001A8E 00:9A7E: C9 10     CMP #$10
C - - - - - 0x001A90 00:9A80: B0 3D     BCS bra_9ABF
C - - - - - 0x001A92 00:9A82: A9 01     LDA #$01
C - - - - - 0x001A94 00:9A84: 85 FE     STA ram_00FE
C - - - - - 0x001A96 00:9A86: 60        RTS

bra_9A87:
C - - - - - 0x001A97 00:9A87: 38        SEC
C - - - - - 0x001A98 00:9A88: ED E3 02  SBC ram_02E3
C - - - - - 0x001A9B 00:9A8B: C9 0E     CMP #$0E
C - - - - - 0x001A9D 00:9A8D: B0 03     BCS bra_9A92
C - - - - - 0x001A9F 00:9A8F: 4C 76 9A  JMP loc_9A76

bra_9A92:
C - - - - - 0x001AA2 00:9A92: A5 2C     LDA con_player_position_x
C - - - - - 0x001AA4 00:9A94: CD F3 02  CMP ram_02F3
C - - - - - 0x001AA7 00:9A97: B0 1B     BCS bra_9AB4
C - - - - - 0x001AA9 00:9A99: AD F3 02  LDA ram_02F3
C - - - - - 0x001AAC 00:9A9C: 38        SEC
C - - - - - 0x001AAD 00:9A9D: E5 2C     SBC con_player_position_x
C - - - - - 0x001AAF 00:9A9F: C9 0E     CMP #$0E
C - - - - - 0x001AB1 00:9AA1: B0 1C     BCS bra_9ABF

loc_9AA3:
C D 0 - - - 0x001AB3 00:9AA3: AD F0 02  LDA ram_02F0
C - - - - - 0x001AB6 00:9AA6: 38        SEC
C - - - - - 0x001AB7 00:9AA7: E5 2D     SBC con_player_position_y
C - - - - - 0x001AB9 00:9AA9: 90 14     BCC bra_9ABF
- - - - - - 0x001ABB 00:9AAB: C9 10     CMP #$10
- - - - - - 0x001ABD 00:9AAD: B0 10     BCS bra_9ABF
- - - - - - 0x001ABF 00:9AAF: A9 01     LDA #$01
- - - - - - 0x001AC1 00:9AB1: 85 FF     STA ram_00FF
- - - - - - 0x001AC3 00:9AB3: 60        RTS

bra_9AB4:
C - - - - - 0x001AC4 00:9AB4: 38        SEC
C - - - - - 0x001AC5 00:9AB5: ED F3 02  SBC ram_02F3
C - - - - - 0x001AC8 00:9AB8: C9 04     CMP #$04
C - - - - - 0x001ACA 00:9ABA: B0 03     BCS bra_9ABF
C - - - - - 0x001ACC 00:9ABC: 4C A3 9A  JMP loc_9AA3

bra_9ABF:
C - - - - - 0x001ACF 00:9ABF: A9 00     LDA #$00
C - - - - - 0x001AD1 00:9AC1: 85 FE     STA ram_00FE
C - - - - - 0x001AD3 00:9AC3: 85 FF     STA ram_00FF
C - - - - - 0x001AD5 00:9AC5: A2 06     LDX #$06

loc_9AC7:
C D 0 - - - 0x001AD7 00:9AC7: BD FC CB  LDA tbl_CBFC_stages_tilemaps_table,X
C - - - - - 0x001ADA 00:9ACA: 85 7D     STA ram_007D
C - - - - - 0x001ADC 00:9ACC: BD FD CB  LDA tbl_CBFC_stages_tilemaps_table+1,X
C - - - - - 0x001ADF 00:9ACF: 85 7E     STA ram_007E
C - - - - - 0x001AE1 00:9AD1: A5 2C     LDA con_player_position_x
C - - - - - 0x001AE3 00:9AD3: 18        CLC
C - - - - - 0x001AE4 00:9AD4: 65 16     ADC ram_0016
C - - - - - 0x001AE6 00:9AD6: 18        CLC
C - - - - - 0x001AE7 00:9AD7: 69 04     ADC #$04
C - - - - - 0x001AE9 00:9AD9: 85 34     STA ram_0034
C - - - - - 0x001AEB 00:9ADB: A0 02     LDY #$02
C - - - - - 0x001AED 00:9ADD: B1 7D     LDA (ram_007D),Y
C - - - - - 0x001AEF 00:9ADF: 85 08     STA ram_0008
C - - - - - 0x001AF1 00:9AE1: C8        INY
C - - - - - 0x001AF2 00:9AE2: B1 7D     LDA (ram_007D),Y
C - - - - - 0x001AF4 00:9AE4: 85 09     STA ram_0009
C - - - - - 0x001AF6 00:9AE6: A5 2D     LDA con_player_position_y
C - - - - - 0x001AF8 00:9AE8: 18        CLC
C - - - - - 0x001AF9 00:9AE9: 69 10     ADC #$10
C - - - - - 0x001AFB 00:9AEB: 85 35     STA ram_0035
C - - - - - 0x001AFD 00:9AED: 85 40     STA ram_0040
C - - - - - 0x001AFF 00:9AEF: A9 07     LDA #$07
C - - - - - 0x001B01 00:9AF1: 18        CLC
C - - - - - 0x001B02 00:9AF2: 65 34     ADC ram_0034
C - - - - - 0x001B04 00:9AF4: 85 3F     STA ram_003F

loc_9AF6:
C D 0 - - - 0x001B06 00:9AF6: A5 34     LDA ram_0034
C - - - - - 0x001B08 00:9AF8: 4A        LSR
C - - - - - 0x001B09 00:9AF9: 4A        LSR
C - - - - - 0x001B0A 00:9AFA: 4A        LSR
C - - - - - 0x001B0B 00:9AFB: 4A        LSR
C - - - - - 0x001B0C 00:9AFC: 85 36     STA ram_0036
C - - - - - 0x001B0E 00:9AFE: A5 35     LDA ram_0035
C - - - - - 0x001B10 00:9B00: 29 F0     AND #$F0
C - - - - - 0x001B12 00:9B02: 18        CLC
C - - - - - 0x001B13 00:9B03: 65 36     ADC ram_0036
C - - - - - 0x001B15 00:9B05: A8        TAY
C - - - - - 0x001B16 00:9B06: B1 08     LDA (ram_0008),Y
C - - - - - 0x001B18 00:9B08: C9 02     CMP #$02
C - - - - - 0x001B1A 00:9B0A: F0 05     BEQ bra_9B11
C - - - - - 0x001B1C 00:9B0C: A9 00     LDA #$00
C - - - - - 0x001B1E 00:9B0E: 85 42     STA ram_0042
C - - - - - 0x001B20 00:9B10: 60        RTS

bra_9B11:
C - - - - - 0x001B21 00:9B11: A5 42     LDA ram_0042
C - - - - - 0x001B23 00:9B13: D0 0F     BNE bra_9B24
C - - - - - 0x001B25 00:9B15: A5 3F     LDA ram_003F
C - - - - - 0x001B27 00:9B17: 85 34     STA ram_0034
C - - - - - 0x001B29 00:9B19: A5 40     LDA ram_0040
C - - - - - 0x001B2B 00:9B1B: 85 35     STA ram_0035
C - - - - - 0x001B2D 00:9B1D: A9 01     LDA #$01
C - - - - - 0x001B2F 00:9B1F: 85 42     STA ram_0042
C - - - - - 0x001B31 00:9B21: 4C F6 9A  JMP loc_9AF6

bra_9B24:
C - - - - - 0x001B34 00:9B24: A9 01     LDA #$01
C - - - - - 0x001B36 00:9B26: 85 CC     STA ram_00CC
C - - - - - 0x001B38 00:9B28: A9 00     LDA #$00
C - - - - - 0x001B3A 00:9B2A: 85 42     STA ram_0042
C - - - - - 0x001B3C 00:9B2C: 60        RTS

sub_9B2D:
loc_9B2D:
C D 0 - - - 0x001B3D 00:9B2D: AD 41 06  LDA ram_0641
C - - - - - 0x001B40 00:9B30: D0 06     BNE bra_9B38
C - - - - - 0x001B42 00:9B32: A9 00     LDA #$00
C - - - - - 0x001B44 00:9B34: 8D 40 06  STA ram_0640

bra_9B37_RTS:
C - - - - - 0x001B47 00:9B37: 60        RTS

bra_9B38:
C - - - - - 0x001B48 00:9B38: AD 36 03  LDA ram_0336
C - - - - - 0x001B4B 00:9B3B: D0 FA     BNE bra_9B37_RTS
C - - - - - 0x001B4D 00:9B3D: AD 38 03  LDA con_player_current_slingshot_proyectiles
C - - - - - 0x001B50 00:9B40: C9 05     CMP #$05					; Max proyectiles per slingshot
C - - - - - 0x001B52 00:9B42: D0 16     BNE bra_9B5A
C - - - - - 0x001B54 00:9B44: A9 00     LDA #$00
C - - - - - 0x001B56 00:9B46: 8D 38 03  STA con_player_current_slingshot_proyectiles
C - - - - - 0x001B59 00:9B49: CE 41 06  DEC ram_0641
C - - - - - 0x001B5C 00:9B4C: A9 01     LDA #$01
C - - - - - 0x001B5E 00:9B4E: 85 86     STA ram_0086
C - - - - - 0x001B60 00:9B50: A9 5A     LDA #$5A					; slingshot icon in status bar
C - - - - - 0x001B62 00:9B52: 85 78     STA ram_0078
C - - - - - 0x001B64 00:9B54: 20 42 97  JSR sub_9742
C - - - - - 0x001B67 00:9B57: 4C 2D 9B  JMP loc_9B2D

bra_9B5A:
C - - - - - 0x001B6A 00:9B5A: A2 00     LDX #$00

loc_9B5C:
C D 0 - - - 0x001B6C 00:9B5C: E0 54     CPX #$54
C - - - - - 0x001B6E 00:9B5E: 90 06     BCC bra_9B66
- - - - - - 0x001B70 00:9B60: A9 00     LDA #$00
- - - - - - 0x001B72 00:9B62: 8D 40 06  STA ram_0640
- - - - - - 0x001B75 00:9B65: 60        RTS

bra_9B66:
C - - - - - 0x001B76 00:9B66: BD 90 02  LDA ram_0290,X
C - - - - - 0x001B79 00:9B69: C9 F8     CMP #$F8
C - - - - - 0x001B7B 00:9B6B: B0 07     BCS bra_9B74_slingshot_proyectile_right
C - - - - - 0x001B7D 00:9B6D: E8        INX
C - - - - - 0x001B7E 00:9B6E: E8        INX
C - - - - - 0x001B7F 00:9B6F: E8        INX
C - - - - - 0x001B80 00:9B70: E8        INX
C - - - - - 0x001B81 00:9B71: 4C 5C 9B  JMP loc_9B5C

bra_9B74_slingshot_proyectile_right:
C - - - - - 0x001B84 00:9B74: 8E 3A 03  STX ram_033A
C - - - - - 0x001B87 00:9B77: A5 56     LDA con_player_is_facing_right
C - - - - - 0x001B89 00:9B79: F0 1F     BEQ bra_9B9A_slingshot_proyectile_left
C - - - - - 0x001B8B 00:9B7B: A5 2C     LDA con_player_position_x
C - - - - - 0x001B8D 00:9B7D: 18        CLC
C - - - - - 0x001B8E 00:9B7E: 69 10     ADC #$10
C - - - - - 0x001B90 00:9B80: 9D 93 02  STA ram_0293,X
C - - - - - 0x001B93 00:9B83: A5 2D     LDA con_player_position_y
C - - - - - 0x001B95 00:9B85: 18        CLC
C - - - - - 0x001B96 00:9B86: 69 08     ADC #$08
C - - - - - 0x001B98 00:9B88: 9D 90 02  STA ram_0290,X
C - - - - - 0x001B9B 00:9B8B: A9 61     LDA #$61			; Slingshot proyectile tile (horizontal position)
C - - - - - 0x001B9D 00:9B8D: 9D 91 02  STA ram_0291,X
C - - - - - 0x001BA0 00:9B90: A9 01     LDA #$01			;
C - - - - - 0x001BA2 00:9B92: 9D 92 02  STA ram_0292,X		; Slingshot low byte = palette, high byte = mirroring flag
C - - - - - 0x001BA5 00:9B95: 8D 3B 03  STA con_item_slingshot_proyectile_direction		; Slingshot proyectile direction 01=right
C - - - - - 0x001BA8 00:9B98: D0 63     BNE bra_9BFD_increment_proyectile_counter

bra_9B9A_slingshot_proyectile_left:
C - - - - - 0x001BAA 00:9B9A: A5 55     LDA con_player_is_facing_left
C - - - - - 0x001BAC 00:9B9C: F0 1E     BEQ bra_9BBC_slingshot_proyectile_up
C - - - - - 0x001BAE 00:9B9E: A5 2D     LDA con_player_position_y
C - - - - - 0x001BB0 00:9BA0: 18        CLC
C - - - - - 0x001BB1 00:9BA1: 69 08     ADC #$08
C - - - - - 0x001BB3 00:9BA3: 9D 90 02  STA ram_0290,X
C - - - - - 0x001BB6 00:9BA6: A5 2C     LDA con_player_position_x
C - - - - - 0x001BB8 00:9BA8: 9D 93 02  STA ram_0293,X
C - - - - - 0x001BBB 00:9BAB: A9 61     LDA #$61			; Slingshot proyectile tile (horizontal position)
C - - - - - 0x001BBD 00:9BAD: 9D 91 02  STA ram_0291,X
C - - - - - 0x001BC0 00:9BB0: A9 41     LDA #$41
C - - - - - 0x001BC2 00:9BB2: 9D 92 02  STA ram_0292,X		; Slingshot low byte = palette, high byte = mirroring flag
C - - - - - 0x001BC5 00:9BB5: A9 03     LDA #$03
C - - - - - 0x001BC7 00:9BB7: 8D 3B 03  STA con_item_slingshot_proyectile_direction		; Slingshot proyectile direction 03=left
C - - - - - 0x001BCA 00:9BBA: D0 41     BNE bra_9BFD_increment_proyectile_counter

bra_9BBC_slingshot_proyectile_up:
C - - - - - 0x001BCC 00:9BBC: A5 57     LDA con_player_is_facing_up
C - - - - - 0x001BCE 00:9BBE: F0 1E     BEQ bra_9BDE_slingshot_proyectile_down
C - - - - - 0x001BD0 00:9BC0: A5 2D     LDA con_player_position_y
C - - - - - 0x001BD2 00:9BC2: 9D 90 02  STA ram_0290,X
C - - - - - 0x001BD5 00:9BC5: A5 2C     LDA con_player_position_x
C - - - - - 0x001BD7 00:9BC7: 18        CLC
C - - - - - 0x001BD8 00:9BC8: 69 08     ADC #$08
C - - - - - 0x001BDA 00:9BCA: 9D 93 02  STA ram_0293,X
C - - - - - 0x001BDD 00:9BCD: A9 B9     LDA #$B9			; Slingshot proyectile tile (vertical position)
C - - - - - 0x001BDF 00:9BCF: 9D 91 02  STA ram_0291,X
C - - - - - 0x001BE2 00:9BD2: A9 01     LDA #$01
C - - - - - 0x001BE4 00:9BD4: 9D 92 02  STA ram_0292,X		; Slingshot low byte = palette, high byte = mirroring flag
C - - - - - 0x001BE7 00:9BD7: A9 02     LDA #$02
C - - - - - 0x001BE9 00:9BD9: 8D 3B 03  STA con_item_slingshot_proyectile_direction		; Slingshot proyectile direction 02=up
C - - - - - 0x001BEC 00:9BDC: D0 1F     BNE bra_9BFD_increment_proyectile_counter

bra_9BDE_slingshot_proyectile_down:
C - - - - - 0x001BEE 00:9BDE: A5 2C     LDA con_player_position_x
C - - - - - 0x001BF0 00:9BE0: 18        CLC
C - - - - - 0x001BF1 00:9BE1: 69 08     ADC #$08
C - - - - - 0x001BF3 00:9BE3: 9D 93 02  STA ram_0293,X
C - - - - - 0x001BF6 00:9BE6: A5 2D     LDA con_player_position_y
C - - - - - 0x001BF8 00:9BE8: 18        CLC
C - - - - - 0x001BF9 00:9BE9: 69 10     ADC #$10
C - - - - - 0x001BFB 00:9BEB: 9D 90 02  STA ram_0290,X
C - - - - - 0x001BFE 00:9BEE: A9 B9     LDA #$B9			; Slingshot proyectile tile (vertical position)
C - - - - - 0x001C00 00:9BF0: 9D 91 02  STA ram_0291,X
C - - - - - 0x001C03 00:9BF3: A9 81     LDA #$81
C - - - - - 0x001C05 00:9BF5: 9D 92 02  STA ram_0292,X		; Slingshot low byte = palette, high byte = mirroring flag
C - - - - - 0x001C08 00:9BF8: A9 04     LDA #$04
C - - - - - 0x001C0A 00:9BFA: 8D 3B 03  STA con_item_slingshot_proyectile_direction   ; Slingshot proyectile direction 04=down

bra_9BFD_increment_proyectile_counter:
C - - - - - 0x001C0D 00:9BFD: EE 38 03  INC con_player_current_slingshot_proyectiles   ; Increment in 1 every proyectile shot
C - - - - - 0x001C10 00:9C00: A9 01     LDA #$01
C - - - - - 0x001C12 00:9C02: 8D 36 03  STA ram_0336
C - - - - - 0x001C15 00:9C05: 60        RTS

sub_9C06:
C - - - - - 0x001C16 00:9C06: AD 36 03  LDA ram_0336
C - - - - - 0x001C19 00:9C09: D0 01     BNE bra_9C0C
C - - - - - 0x001C1B 00:9C0B: 60        RTS

bra_9C0C:
C - - - - - 0x001C1C 00:9C0C: AC 3A 03  LDY ram_033A
C - - - - - 0x001C1F 00:9C0F: B9 90 02  LDA ram_0290,Y
C - - - - - 0x001C22 00:9C12: C9 F0     CMP #$F0
C - - - - - 0x001C24 00:9C14: 90 11     BCC bra_9C27

bra_9C16:
C - - - - - 0x001C26 00:9C16: A9 F8     LDA #$F8
C - - - - - 0x001C28 00:9C18: 99 90 02  STA ram_0290,Y
C - - - - - 0x001C2B 00:9C1B: A9 00     LDA #$00
C - - - - - 0x001C2D 00:9C1D: 8D 36 03  STA ram_0336
C - - - - - 0x001C30 00:9C20: 8D 3B 03  STA con_item_slingshot_proyectile_direction
C - - - - - 0x001C33 00:9C23: 8D 39 03  STA con_item_slingshot_proyectile_distance
C - - - - - 0x001C36 00:9C26: 60        RTS

bra_9C27:
C - - - - - 0x001C37 00:9C27: B9 93 02  LDA ram_0293,Y
C - - - - - 0x001C3A 00:9C2A: C9 F8     CMP #$F8
C - - - - - 0x001C3C 00:9C2C: B0 E8     BCS bra_9C16
C - - - - - 0x001C3E 00:9C2E: AD 39 03  LDA con_item_slingshot_proyectile_distance
C - - - - - 0x001C41 00:9C31: C9 20     CMP #$20						; Max distance proyectile
C - - - - - 0x001C43 00:9C33: B0 E1     BCS bra_9C16
C - - - - - 0x001C45 00:9C35: B9 90 02  LDA ram_0290,Y
C - - - - - 0x001C48 00:9C38: 38        SEC
C - - - - - 0x001C49 00:9C39: E9 04     SBC #$04
C - - - - - 0x001C4B 00:9C3B: 85 4D     STA ram_004D
C - - - - - 0x001C4D 00:9C3D: B9 93 02  LDA ram_0293,Y
C - - - - - 0x001C50 00:9C40: 38        SEC
C - - - - - 0x001C51 00:9C41: E9 04     SBC #$04
C - - - - - 0x001C53 00:9C43: 85 4E     STA ram_004E
C - - - - - 0x001C55 00:9C45: A9 00     LDA #$00
C - - - - - 0x001C57 00:9C47: 85 BE     STA ram_00BE
C - - - - - 0x001C59 00:9C49: 20 37 A7  JSR sub_A737
C - - - - - 0x001C5C 00:9C4C: A5 BE     LDA ram_00BE
C - - - - - 0x001C5E 00:9C4E: D0 C6     BNE bra_9C16
C - - - - - 0x001C60 00:9C50: AC 3A 03  LDY ram_033A
C - - - - - 0x001C63 00:9C53: AD 3B 03  LDA con_item_slingshot_proyectile_direction
C - - - - - 0x001C66 00:9C56: C9 01     CMP #$01
C - - - - - 0x001C68 00:9C58: D0 0C     BNE bra_9C66
C - - - - - 0x001C6A 00:9C5A: B9 93 02  LDA ram_0293,Y
C - - - - - 0x001C6D 00:9C5D: 18        CLC
C - - - - - 0x001C6E 00:9C5E: 69 03     ADC #$03
C - - - - - 0x001C70 00:9C60: 99 93 02  STA ram_0293,Y
C - - - - - 0x001C73 00:9C63: 4C 8E 9C  JMP loc_9C8E

bra_9C66:
C - - - - - 0x001C76 00:9C66: C9 02     CMP #$02
C - - - - - 0x001C78 00:9C68: D0 0C     BNE bra_9C76
C - - - - - 0x001C7A 00:9C6A: B9 90 02  LDA ram_0290,Y
C - - - - - 0x001C7D 00:9C6D: 38        SEC
C - - - - - 0x001C7E 00:9C6E: E9 03     SBC #$03
C - - - - - 0x001C80 00:9C70: 99 90 02  STA ram_0290,Y
C - - - - - 0x001C83 00:9C73: 4C 8E 9C  JMP loc_9C8E

bra_9C76:
C - - - - - 0x001C86 00:9C76: C9 03     CMP #$03
C - - - - - 0x001C88 00:9C78: D0 0B     BNE bra_9C85
C - - - - - 0x001C8A 00:9C7A: B9 93 02  LDA ram_0293,Y
C - - - - - 0x001C8D 00:9C7D: 38        SEC
C - - - - - 0x001C8E 00:9C7E: E9 03     SBC #$03
C - - - - - 0x001C90 00:9C80: 99 93 02  STA ram_0293,Y
C - - - - - 0x001C93 00:9C83: D0 09     BNE bra_9C8E

bra_9C85:
C - - - - - 0x001C95 00:9C85: B9 90 02  LDA ram_0290,Y
C - - - - - 0x001C98 00:9C88: 18        CLC
C - - - - - 0x001C99 00:9C89: 69 03     ADC #$03
C - - - - - 0x001C9B 00:9C8B: 99 90 02  STA ram_0290,Y

bra_9C8E:
loc_9C8E:
C D 0 - - - 0x001C9E 00:9C8E: EE 39 03  INC con_item_slingshot_proyectile_distance
C - - - - - 0x001CA1 00:9C91: 60        RTS

sub_9C92:
C - - - - - 0x001CA2 00:9C92: A5 1C     LDA ram_001C
C - - - - - 0x001CA4 00:9C94: 29 80     AND #$80
C - - - - - 0x001CA6 00:9C96: F0 0D     BEQ bra_9CA5
C - - - - - 0x001CA8 00:9C98: A5 A1     LDA ram_00A1
C - - - - - 0x001CAA 00:9C9A: D0 0D     BNE bra_9CA9_RTS
C - - - - - 0x001CAC 00:9C9C: A9 01     LDA #$01
C - - - - - 0x001CAE 00:9C9E: 85 A1     STA ram_00A1
C - - - - - 0x001CB0 00:9CA0: 85 9E     STA ram_009E
C - - - - - 0x001CB2 00:9CA2: 85 9F     STA ram_009F
C - - - - - 0x001CB4 00:9CA4: 60        RTS

bra_9CA5:
C - - - - - 0x001CB5 00:9CA5: A9 00     LDA #$00
C - - - - - 0x001CB7 00:9CA7: 85 A1     STA ram_00A1

bra_9CA9_RTS:
C - - - - - 0x001CB9 00:9CA9: 60        RTS

sub_9CAA:
C - - - - - 0x001CBA 00:9CAA: A5 56     LDA con_player_is_facing_right
C - - - - - 0x001CBC 00:9CAC: D0 03     BNE bra_9CB1
C - - - - - 0x001CBE 00:9CAE: 4C 11 9D  JMP loc_9D11

bra_9CB1:
C - - - - - 0x001CC1 00:9CB1: A5 2C     LDA con_player_position_x
C - - - - - 0x001CC3 00:9CB3: 18        CLC
C - - - - - 0x001CC4 00:9CB4: 69 10     ADC #$10
C - - - - - 0x001CC6 00:9CB6: 85 C6     STA ram_00C6

loc_9CB8:
C D 0 - - - 0x001CC8 00:9CB8: A5 2D     LDA con_player_position_y
C - - - - - 0x001CCA 00:9CBA: 85 C7     STA ram_00C7
C - - - - - 0x001CCC 00:9CBC: A9 00     LDA #$00
C - - - - - 0x001CCE 00:9CBE: 85 C5     STA ram_00C5
C - - - - - 0x001CD0 00:9CC0: A8        TAY

bra_9CC1:
C - - - - - 0x001CD1 00:9CC1: A5 C5     LDA ram_00C5
C - - - - - 0x001CD3 00:9CC3: C9 05     CMP #$05
C - - - - - 0x001CD5 00:9CC5: D0 01     BNE bra_9CC8
C - - - - - 0x001CD7 00:9CC7: 60        RTS

bra_9CC8:
C - - - - - 0x001CD8 00:9CC8: B9 68 02  LDA ram_0268,Y
C - - - - - 0x001CDB 00:9CCB: C5 C7     CMP ram_00C7
C - - - - - 0x001CDD 00:9CCD: B0 02     BCS bra_9CD1
C - - - - - 0x001CDF 00:9CCF: 90 10     BCC bra_9CE1

bra_9CD1:
C - - - - - 0x001CE1 00:9CD1: B9 68 02  LDA ram_0268,Y
C - - - - - 0x001CE4 00:9CD4: 38        SEC
C - - - - - 0x001CE5 00:9CD5: E5 C7     SBC ram_00C7
C - - - - - 0x001CE7 00:9CD7: C9 04     CMP #$04
C - - - - - 0x001CE9 00:9CD9: 90 06     BCC bra_9CE1
C - - - - - 0x001CEB 00:9CDB: C9 0F     CMP #$0F
C - - - - - 0x001CED 00:9CDD: F0 0B     BEQ bra_9CEA
C - - - - - 0x001CEF 00:9CDF: 90 09     BCC bra_9CEA

bra_9CE1:
C - - - - - 0x001CF1 00:9CE1: 98        TYA
C - - - - - 0x001CF2 00:9CE2: 18        CLC
C - - - - - 0x001CF3 00:9CE3: 69 08     ADC #$08
C - - - - - 0x001CF5 00:9CE5: A8        TAY
C - - - - - 0x001CF6 00:9CE6: E6 C5     INC ram_00C5
C - - - - - 0x001CF8 00:9CE8: D0 D7     BNE bra_9CC1

bra_9CEA:
C - - - - - 0x001CFA 00:9CEA: A5 C6     LDA ram_00C6
C - - - - - 0x001CFC 00:9CEC: D9 6B 02  CMP ram_026B,Y
C - - - - - 0x001CFF 00:9CEF: D0 F0     BNE bra_9CE1
C - - - - - 0x001D01 00:9CF1: B9 69 02  LDA ram_0269,Y
C - - - - - 0x001D04 00:9CF4: C9 74     CMP #$74
C - - - - - 0x001D06 00:9CF6: D0 E9     BNE bra_9CE1

loc_9CF8:
C D 0 - - - 0x001D08 00:9CF8: A9 04     LDA #$04
C - - - - - 0x001D0A 00:9CFA: 85 D2     STA ram_00D2
C - - - - - 0x001D0C 00:9CFC: 85 8F     STA ram_008F
C - - - - - 0x001D0E 00:9CFE: 98        TYA
C - - - - - 0x001D0F 00:9CFF: 85 F8     STA ram_00F8
C - - - - - 0x001D11 00:9D01: A9 34     LDA #$34
C - - - - - 0x001D13 00:9D03: 99 69 02  STA ram_0269,Y
C - - - - - 0x001D16 00:9D06: A9 03     LDA #$03
C - - - - - 0x001D18 00:9D08: 99 6A 02  STA ram_026A,Y
C - - - - - 0x001D1B 00:9D0B: A9 FF     LDA #$FF
C - - - - - 0x001D1D 00:9D0D: 99 6D 02  STA ram_026D,Y
C - - - - - 0x001D20 00:9D10: 60        RTS

loc_9D11:
C D 0 - - - 0x001D21 00:9D11: A5 55     LDA con_player_is_facing_left
C - - - - - 0x001D23 00:9D13: F0 0A     BEQ bra_9D1F
C - - - - - 0x001D25 00:9D15: A5 2C     LDA con_player_position_x
C - - - - - 0x001D27 00:9D17: 38        SEC
C - - - - - 0x001D28 00:9D18: E9 10     SBC #$10
C - - - - - 0x001D2A 00:9D1A: 85 C6     STA ram_00C6
C - - - - - 0x001D2C 00:9D1C: 4C B8 9C  JMP loc_9CB8

bra_9D1F:
C - - - - - 0x001D2F 00:9D1F: A5 57     LDA con_player_is_facing_up
C - - - - - 0x001D31 00:9D21: F0 48     BEQ bra_9D6B
C - - - - - 0x001D33 00:9D23: A5 2C     LDA con_player_position_x
C - - - - - 0x001D35 00:9D25: 85 C6     STA ram_00C6
C - - - - - 0x001D37 00:9D27: A5 2D     LDA con_player_position_y
C - - - - - 0x001D39 00:9D29: 85 C7     STA ram_00C7

loc_9D2B:
C D 0 - - - 0x001D3B 00:9D2B: A9 00     LDA #$00
C - - - - - 0x001D3D 00:9D2D: 85 C5     STA ram_00C5
C - - - - - 0x001D3F 00:9D2F: A8        TAY

bra_9D30:
C - - - - - 0x001D40 00:9D30: A5 C5     LDA ram_00C5
C - - - - - 0x001D42 00:9D32: C9 05     CMP #$05
C - - - - - 0x001D44 00:9D34: D0 01     BNE bra_9D37
C - - - - - 0x001D46 00:9D36: 60        RTS

bra_9D37:
C - - - - - 0x001D47 00:9D37: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x001D4A 00:9D3A: C5 C6     CMP ram_00C6
C - - - - - 0x001D4C 00:9D3C: B0 09     BCS bra_9D47
C - - - - - 0x001D4E 00:9D3E: A5 C6     LDA ram_00C6
C - - - - - 0x001D50 00:9D40: 38        SEC
C - - - - - 0x001D51 00:9D41: F9 6B 02  SBC ram_026B,Y
C - - - - - 0x001D54 00:9D44: 4C 4D 9D  JMP loc_9D4D

bra_9D47:
C - - - - - 0x001D57 00:9D47: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x001D5A 00:9D4A: 38        SEC
C - - - - - 0x001D5B 00:9D4B: E5 C6     SBC ram_00C6

loc_9D4D:
C D 0 - - - 0x001D5D 00:9D4D: C9 0C     CMP #$0C
C - - - - - 0x001D5F 00:9D4F: 90 09     BCC bra_9D5A

bra_9D51:
C - - - - - 0x001D61 00:9D51: 98        TYA
C - - - - - 0x001D62 00:9D52: 18        CLC
C - - - - - 0x001D63 00:9D53: 69 08     ADC #$08
C - - - - - 0x001D65 00:9D55: A8        TAY
C - - - - - 0x001D66 00:9D56: E6 C5     INC ram_00C5
C - - - - - 0x001D68 00:9D58: D0 D6     BNE bra_9D30

bra_9D5A:
C - - - - - 0x001D6A 00:9D5A: A5 C7     LDA ram_00C7
C - - - - - 0x001D6C 00:9D5C: D9 68 02  CMP ram_0268,Y
C - - - - - 0x001D6F 00:9D5F: D0 F0     BNE bra_9D51
C - - - - - 0x001D71 00:9D61: B9 69 02  LDA ram_0269,Y
C - - - - - 0x001D74 00:9D64: C9 74     CMP #$74
C - - - - - 0x001D76 00:9D66: D0 E9     BNE bra_9D51
C - - - - - 0x001D78 00:9D68: 4C F8 9C  JMP loc_9CF8

bra_9D6B:
C - - - - - 0x001D7B 00:9D6B: A5 2D     LDA con_player_position_y
C - - - - - 0x001D7D 00:9D6D: 18        CLC
C - - - - - 0x001D7E 00:9D6E: 69 10     ADC #$10
C - - - - - 0x001D80 00:9D70: 85 C7     STA ram_00C7
C - - - - - 0x001D82 00:9D72: A5 2C     LDA con_player_position_x
C - - - - - 0x001D84 00:9D74: 85 C6     STA ram_00C6
C - - - - - 0x001D86 00:9D76: 4C 2B 9D  JMP loc_9D2B

sub_9D79:
C - - - - - 0x001D89 00:9D79: A5 8F     LDA ram_008F
C - - - - - 0x001D8B 00:9D7B: D0 01     BNE bra_9D7E
C - - - - - 0x001D8D 00:9D7D: 60        RTS

bra_9D7E:
C - - - - - 0x001D8E 00:9D7E: A5 F8     LDA ram_00F8
C - - - - - 0x001D90 00:9D80: AA        TAX
C - - - - - 0x001D91 00:9D81: A5 FC     LDA ram_00FC
C - - - - - 0x001D93 00:9D83: D0 13     BNE bra_9D98
C - - - - - 0x001D95 00:9D85: AD 4E 03  LDA ram_034E
C - - - - - 0x001D98 00:9D88: C9 10     CMP #$10
C - - - - - 0x001D9A 00:9D8A: F0 07     BEQ bra_9D93
C - - - - - 0x001D9C 00:9D8C: DE 68 02  DEC ram_0268,X
C - - - - - 0x001D9F 00:9D8F: EE 4E 03  INC ram_034E
C - - - - - 0x001DA2 00:9D92: 60        RTS

bra_9D93:
C - - - - - 0x001DA3 00:9D93: A9 01     LDA #$01
C - - - - - 0x001DA5 00:9D95: 85 FC     STA ram_00FC
C - - - - - 0x001DA7 00:9D97: 60        RTS

bra_9D98:
C - - - - - 0x001DA8 00:9D98: AD 4E 03  LDA ram_034E
C - - - - - 0x001DAB 00:9D9B: F0 07     BEQ bra_9DA4
C - - - - - 0x001DAD 00:9D9D: FE 68 02  INC ram_0268,X
C - - - - - 0x001DB0 00:9DA0: CE 4E 03  DEC ram_034E
C - - - - - 0x001DB3 00:9DA3: 60        RTS

bra_9DA4:
C - - - - - 0x001DB4 00:9DA4: A9 00     LDA #$00
C - - - - - 0x001DB6 00:9DA6: 85 FC     STA ram_00FC
C - - - - - 0x001DB8 00:9DA8: 85 8F     STA ram_008F
C - - - - - 0x001DBA 00:9DAA: A9 01     LDA #$01
C - - - - - 0x001DBC 00:9DAC: 8D 4F 03  STA ram_034F
C - - - - - 0x001DBF 00:9DAF: 60        RTS

sub_9DB0:
C - - - - - 0x001DC0 00:9DB0: AD 4F 03  LDA ram_034F
C - - - - - 0x001DC3 00:9DB3: D0 01     BNE bra_9DB6
C - - - - - 0x001DC5 00:9DB5: 60        RTS

bra_9DB6:
C - - - - - 0x001DC6 00:9DB6: A9 00     LDA #$00
C - - - - - 0x001DC8 00:9DB8: 8D 4F 03  STA ram_034F
C - - - - - 0x001DCB 00:9DBB: E6 F9     INC ram_00F9
C - - - - - 0x001DCD 00:9DBD: AD 51 06  LDA ram_0651
C - - - - - 0x001DD0 00:9DC0: 29 0F     AND #$0F
C - - - - - 0x001DD2 00:9DC2: AA        TAX
C - - - - - 0x001DD3 00:9DC3: BD 77 9F  LDA tbl_9F77_item_drop_list,X
C - - - - - 0x001DD6 00:9DC6: 85 D4     STA ram_00D4
C - - - - - 0x001DD8 00:9DC8: A5 F8     LDA ram_00F8
C - - - - - 0x001DDA 00:9DCA: A8        TAY

loc_9DCB:
C D 0 - - - 0x001DDB 00:9DCB: A5 D4     LDA ram_00D4
C - - - - - 0x001DDD 00:9DCD: C9 08     CMP #$08
C - - - - - 0x001DDF 00:9DCF: D0 04     BNE bra_9DD5
- - - - - - 0x001DE1 00:9DD1: A9 00     LDA #$00
- - - - - - 0x001DE3 00:9DD3: 85 D4     STA ram_00D4

bra_9DD5:
C - - - - - 0x001DE5 00:9DD5: A5 D4     LDA ram_00D4
C - - - - - 0x001DE7 00:9DD7: C9 00     CMP #$00
C - - - - - 0x001DE9 00:9DD9: D0 15     BNE bra_9DF0
C - - - - - 0x001DEB 00:9DDB: A9 A9     LDA #$A9
C - - - - - 0x001DED 00:9DDD: 99 69 02  STA ram_0269,Y
C - - - - - 0x001DF0 00:9DE0: A9 A8     LDA #$A8
C - - - - - 0x001DF2 00:9DE2: 99 6D 02  STA ram_026D,Y
C - - - - - 0x001DF5 00:9DE5: A9 02     LDA #$02
C - - - - - 0x001DF7 00:9DE7: 99 6A 02  STA ram_026A,Y
C - - - - - 0x001DFA 00:9DEA: 99 6E 02  STA ram_026E,Y
C - - - - - 0x001DFD 00:9DED: 4C 6C 9F  JMP loc_9F6C

bra_9DF0:
C - - - - - 0x001E00 00:9DF0: C9 01     CMP #$01
C - - - - - 0x001E02 00:9DF2: F0 19     BEQ bra_9E0D
C - - - - - 0x001E04 00:9DF4: C9 07     CMP #$07
C - - - - - 0x001E06 00:9DF6: D0 1A     BNE bra_9E12
C - - - - - 0x001E08 00:9DF8: A9 BA     LDA #$BA
C - - - - - 0x001E0A 00:9DFA: 99 69 02  STA ram_0269,Y
C - - - - - 0x001E0D 00:9DFD: A9 BB     LDA #$BB
C - - - - - 0x001E0F 00:9DFF: 99 6D 02  STA ram_026D,Y
C - - - - - 0x001E12 00:9E02: A9 00     LDA #$00
C - - - - - 0x001E14 00:9E04: 99 6A 02  STA ram_026A,Y
C - - - - - 0x001E17 00:9E07: 99 6E 02  STA ram_026E,Y
C - - - - - 0x001E1A 00:9E0A: 4C 6C 9F  JMP loc_9F6C

bra_9E0D:
- - - - - - 0x001E1D 00:9E0D: E6 D4     INC ram_00D4
- - - - - - 0x001E1F 00:9E0F: 4C CB 9D  JMP loc_9DCB

bra_9E12:
C - - - - - 0x001E22 00:9E12: C9 02     CMP #$02
C - - - - - 0x001E24 00:9E14: F0 03     BEQ bra_9E19
C - - - - - 0x001E26 00:9E16: 4C 06 9F  JMP loc_9F06

bra_9E19:
C - - - - - 0x001E29 00:9E19: A5 D8     LDA ram_00D8
C - - - - - 0x001E2B 00:9E1B: F0 05     BEQ bra_9E22
- - - - - - 0x001E2D 00:9E1D: E6 D4     INC ram_00D4
- - - - - - 0x001E2F 00:9E1F: 4C CB 9D  JMP loc_9DCB

bra_9E22:
loc_9E22:
C D 0 - - - 0x001E32 00:9E22: A2 00     LDX #$00
C - - - - - 0x001E34 00:9E24: A9 00     LDA #$00
C - - - - - 0x001E36 00:9E26: 8D 3C 03  STA ram_033C

bra_9E29:
C - - - - - 0x001E39 00:9E29: AD 3C 03  LDA ram_033C
C - - - - - 0x001E3C 00:9E2C: C9 04     CMP #$04
C - - - - - 0x001E3E 00:9E2E: F0 29     BEQ bra_9E59
C - - - - - 0x001E40 00:9E30: 8A        TXA
C - - - - - 0x001E41 00:9E31: C9 30     CMP #$30
C - - - - - 0x001E43 00:9E33: D0 07     BNE bra_9E3C
- - - - - - 0x001E45 00:9E35: A9 00     LDA #$00
- - - - - - 0x001E47 00:9E37: 85 D4     STA ram_00D4
- - - - - - 0x001E49 00:9E39: 4C CB 9D  JMP loc_9DCB

bra_9E3C:
C - - - - - 0x001E4C 00:9E3C: BD 90 02  LDA ram_0290,X
C - - - - - 0x001E4F 00:9E3F: C9 F8     CMP #$F8
C - - - - - 0x001E51 00:9E41: F0 0C     BEQ bra_9E4F
C - - - - - 0x001E53 00:9E43: 8A        TXA
C - - - - - 0x001E54 00:9E44: 18        CLC
C - - - - - 0x001E55 00:9E45: 69 04     ADC #$04
C - - - - - 0x001E57 00:9E47: AA        TAX
C - - - - - 0x001E58 00:9E48: A9 00     LDA #$00
C - - - - - 0x001E5A 00:9E4A: 8D 3C 03  STA ram_033C
C - - - - - 0x001E5D 00:9E4D: F0 DA     BEQ bra_9E29

bra_9E4F:
C - - - - - 0x001E5F 00:9E4F: 8A        TXA
C - - - - - 0x001E60 00:9E50: 18        CLC
C - - - - - 0x001E61 00:9E51: 69 04     ADC #$04
C - - - - - 0x001E63 00:9E53: AA        TAX
C - - - - - 0x001E64 00:9E54: EE 3C 03  INC ram_033C
C - - - - - 0x001E67 00:9E57: D0 D0     BNE bra_9E29

bra_9E59:
C - - - - - 0x001E69 00:9E59: A9 00     LDA #$00
C - - - - - 0x001E6B 00:9E5B: 8D 3C 03  STA ram_033C
C - - - - - 0x001E6E 00:9E5E: 85 4C     STA ram_004C
C - - - - - 0x001E70 00:9E60: A9 01     LDA #$01
C - - - - - 0x001E72 00:9E62: 85 2B     STA ram_002B
C - - - - - 0x001E74 00:9E64: B9 68 02  LDA ram_0268,Y
C - - - - - 0x001E77 00:9E67: 85 4D     STA ram_004D
C - - - - - 0x001E79 00:9E69: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x001E7C 00:9E6C: 85 4E     STA ram_004E
C - - - - - 0x001E7E 00:9E6E: A9 F8     LDA #$F8
C - - - - - 0x001E80 00:9E70: 99 68 02  STA ram_0268,Y
C - - - - - 0x001E83 00:9E73: 99 6C 02  STA ram_026C,Y
C - - - - - 0x001E86 00:9E76: A9 FF     LDA #$FF
C - - - - - 0x001E88 00:9E78: 99 69 02  STA ram_0269,Y
C - - - - - 0x001E8B 00:9E7B: 99 6D 02  STA ram_026D,Y
C - - - - - 0x001E8E 00:9E7E: 8A        TXA
C - - - - - 0x001E8F 00:9E7F: 4A        LSR
C - - - - - 0x001E90 00:9E80: 4A        LSR
C - - - - - 0x001E91 00:9E81: 18        CLC
C - - - - - 0x001E92 00:9E82: 69 20     ADC #$20
C - - - - - 0x001E94 00:9E84: 85 24     STA ram_0024
C - - - - - 0x001E96 00:9E86: A5 D4     LDA ram_00D4
C - - - - - 0x001E98 00:9E88: C9 02     CMP #$02
C - - - - - 0x001E9A 00:9E8A: D0 1C     BNE bra_9EA8
C - - - - - 0x001E9C 00:9E8C: A9 01     LDA #$01
C - - - - - 0x001E9E 00:9E8E: 85 D8     STA ram_00D8
C - - - - - 0x001EA0 00:9E90: 85 F4     STA ram_00F4
C - - - - - 0x001EA2 00:9E92: A5 4E     LDA ram_004E
C - - - - - 0x001EA4 00:9E94: 85 EE     STA ram_00EE
C - - - - - 0x001EA6 00:9E96: A5 4D     LDA ram_004D
C - - - - - 0x001EA8 00:9E98: 85 EF     STA ram_00EF
C - - - - - 0x001EAA 00:9E9A: A5 24     LDA ram_0024
C - - - - - 0x001EAC 00:9E9C: 85 DA     STA ram_00DA
C - - - - - 0x001EAE 00:9E9E: A9 8D     LDA #$8D
C - - - - - 0x001EB0 00:9EA0: 85 45     STA ram_0045
C - - - - - 0x001EB2 00:9EA2: A9 94     LDA #$94
C - - - - - 0x001EB4 00:9EA4: 85 46     STA ram_0046
C - - - - - 0x001EB6 00:9EA6: D0 58     BNE bra_9F00

bra_9EA8:
C - - - - - 0x001EB8 00:9EA8: C9 04     CMP #$04
C - - - - - 0x001EBA 00:9EAA: D0 1C     BNE bra_9EC8
C - - - - - 0x001EBC 00:9EAC: A9 01     LDA #$01
C - - - - - 0x001EBE 00:9EAE: 85 D7     STA ram_00D7
C - - - - - 0x001EC0 00:9EB0: 85 F6     STA ram_00F6
C - - - - - 0x001EC2 00:9EB2: A5 4E     LDA ram_004E
C - - - - - 0x001EC4 00:9EB4: 85 EC     STA ram_00EC
C - - - - - 0x001EC6 00:9EB6: A5 4D     LDA ram_004D
C - - - - - 0x001EC8 00:9EB8: 85 ED     STA ram_00ED
C - - - - - 0x001ECA 00:9EBA: A5 24     LDA ram_0024
C - - - - - 0x001ECC 00:9EBC: 85 DD     STA ram_00DD
C - - - - - 0x001ECE 00:9EBE: A9 94     LDA #$94
C - - - - - 0x001ED0 00:9EC0: 85 45     STA ram_0045
C - - - - - 0x001ED2 00:9EC2: A9 94     LDA #$94
C - - - - - 0x001ED4 00:9EC4: 85 46     STA ram_0046
C - - - - - 0x001ED6 00:9EC6: D0 38     BNE bra_9F00

bra_9EC8:
C - - - - - 0x001ED8 00:9EC8: C9 05     CMP #$05
C - - - - - 0x001EDA 00:9ECA: D0 1A     BNE bra_9EE6
C - - - - - 0x001EDC 00:9ECC: A5 24     LDA ram_0024
C - - - - - 0x001EDE 00:9ECE: 8D 32 03  STA ram_0332
C - - - - - 0x001EE1 00:9ED1: A5 4E     LDA ram_004E
C - - - - - 0x001EE3 00:9ED3: 85 DE     STA ram_00DE
C - - - - - 0x001EE5 00:9ED5: 8A        TXA
C - - - - - 0x001EE6 00:9ED6: 85 DC     STA ram_00DC
C - - - - - 0x001EE8 00:9ED8: A9 01     LDA #$01
C - - - - - 0x001EEA 00:9EDA: 85 D6     STA ram_00D6
C - - - - - 0x001EEC 00:9EDC: A9 B2     LDA #<tbl_94B2_spr_balloon
C - - - - - 0x001EEE 00:9EDE: 85 45     STA ram_0045
C - - - - - 0x001EF0 00:9EE0: A9 94     LDA #>tbl_94B2_spr_balloon
C - - - - - 0x001EF2 00:9EE2: 85 46     STA ram_0046
C - - - - - 0x001EF4 00:9EE4: D0 1A     BNE bra_9F00

bra_9EE6:
C - - - - - 0x001EF6 00:9EE6: A9 B9     LDA #$B9
C - - - - - 0x001EF8 00:9EE8: 85 45     STA ram_0045
C - - - - - 0x001EFA 00:9EEA: A9 94     LDA #$94
C - - - - - 0x001EFC 00:9EEC: 85 46     STA ram_0046
C - - - - - 0x001EFE 00:9EEE: A5 4E     LDA ram_004E
C - - - - - 0x001F00 00:9EF0: 85 F0     STA ram_00F0
C - - - - - 0x001F02 00:9EF2: A5 4D     LDA ram_004D
C - - - - - 0x001F04 00:9EF4: 85 F1     STA ram_00F1
C - - - - - 0x001F06 00:9EF6: A5 24     LDA ram_0024
C - - - - - 0x001F08 00:9EF8: 85 DB     STA ram_00DB
C - - - - - 0x001F0A 00:9EFA: A9 01     LDA #$01
C - - - - - 0x001F0C 00:9EFC: 85 D5     STA ram_00D5
C - - - - - 0x001F0E 00:9EFE: 85 F5     STA ram_00F5

bra_9F00:
C - - - - - 0x001F10 00:9F00: 20 C7 C0  JSR sub_C0C7
C - - - - - 0x001F13 00:9F03: 4C 6C 9F  JMP loc_9F6C

loc_9F06:
C D 0 - - - 0x001F16 00:9F06: C9 03     CMP #$03
C - - - - - 0x001F18 00:9F08: D0 36     BNE bra_9F40
C - - - - - 0x001F1A 00:9F0A: A5 E0     LDA ram_00E0
C - - - - - 0x001F1C 00:9F0C: F0 05     BEQ bra_9F13
C - - - - - 0x001F1E 00:9F0E: E6 D4     INC ram_00D4
C - - - - - 0x001F20 00:9F10: 4C CB 9D  JMP loc_9DCB

bra_9F13:
C - - - - - 0x001F23 00:9F13: 98        TYA
C - - - - - 0x001F24 00:9F14: 4A        LSR
C - - - - - 0x001F25 00:9F15: 4A        LSR
C - - - - - 0x001F26 00:9F16: 18        CLC
C - - - - - 0x001F27 00:9F17: 69 1A     ADC #$1A
C - - - - - 0x001F29 00:9F19: 85 7A     STA ram_007A
C - - - - - 0x001F2B 00:9F1B: A9 DF     LDA #$DF
C - - - - - 0x001F2D 00:9F1D: 99 69 02  STA ram_0269,Y
C - - - - - 0x001F30 00:9F20: A9 01     LDA #$01
C - - - - - 0x001F32 00:9F22: 99 6A 02  STA ram_026A,Y
C - - - - - 0x001F35 00:9F25: 99 6E 02  STA ram_026E,Y
C - - - - - 0x001F38 00:9F28: 85 E0     STA ram_00E0
C - - - - - 0x001F3A 00:9F2A: 85 FD     STA ram_00FD
C - - - - - 0x001F3C 00:9F2C: A9 EA     LDA #$EA
C - - - - - 0x001F3E 00:9F2E: 99 6D 02  STA ram_026D,Y
C - - - - - 0x001F41 00:9F31: B9 68 02  LDA ram_0268,Y
C - - - - - 0x001F44 00:9F34: 8D 1E 03  STA ram_031E
C - - - - - 0x001F47 00:9F37: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x001F4A 00:9F3A: 8D 1D 03  STA ram_031D
C - - - - - 0x001F4D 00:9F3D: 4C 6C 9F  JMP loc_9F6C

bra_9F40:
C - - - - - 0x001F50 00:9F40: C9 04     CMP #$04
C - - - - - 0x001F52 00:9F42: D0 0C     BNE bra_9F50
C - - - - - 0x001F54 00:9F44: A5 D7     LDA ram_00D7
C - - - - - 0x001F56 00:9F46: D0 03     BNE bra_9F4B
C - - - - - 0x001F58 00:9F48: 4C 22 9E  JMP loc_9E22

bra_9F4B:
- - - - - - 0x001F5B 00:9F4B: E6 D4     INC ram_00D4
- - - - - - 0x001F5D 00:9F4D: 4C CB 9D  JMP loc_9DCB

bra_9F50:
C - - - - - 0x001F60 00:9F50: C9 05     CMP #$05
C - - - - - 0x001F62 00:9F52: D0 0C     BNE bra_9F60
C - - - - - 0x001F64 00:9F54: A5 D6     LDA ram_00D6
C - - - - - 0x001F66 00:9F56: D0 03     BNE bra_9F5B
C - - - - - 0x001F68 00:9F58: 4C 22 9E  JMP loc_9E22

bra_9F5B:
- - - - - - 0x001F6B 00:9F5B: E6 D4     INC ram_00D4
- - - - - - 0x001F6D 00:9F5D: 4C CB 9D  JMP loc_9DCB

bra_9F60:
C - - - - - 0x001F70 00:9F60: A5 D5     LDA ram_00D5
C - - - - - 0x001F72 00:9F62: D0 03     BNE bra_9F67
C - - - - - 0x001F74 00:9F64: 4C 22 9E  JMP loc_9E22

bra_9F67:
C - - - - - 0x001F77 00:9F67: E6 D4     INC ram_00D4
C - - - - - 0x001F79 00:9F69: 4C CB 9D  JMP loc_9DCB

loc_9F6C:
C D 0 - - - 0x001F7C 00:9F6C: A9 00     LDA #$00
C - - - - - 0x001F7E 00:9F6E: 8D 48 06  STA ram_0648
C - - - - - 0x001F81 00:9F71: 8D 49 06  STA ram_0649
C - - - - - 0x001F84 00:9F74: 85 FA     STA ram_00FA
C - - - - - 0x001F86 00:9F76: 60        RTS

;=============
; ITEM RATIOS
;=============
; Crown: 	 25%
; Balloon:   18.75%
; Dog: 		 12.5%
; Snake: 	 12.5%
; Porcupine: 12.5%
; Candy:	 12.5%
; Scorpion:  6.25%

tbl_9F77_item_drop_list:
- D 0 - - - 0x001F87 00:9F77: 00        .byte $00   ; item: crown
- D 0 - - - 0x001F88 00:9F78: 00        .byte $00   ; item: crown
- D 0 - - - 0x001F89 00:9F79: 02        .byte $02   ; item: dog
- D 0 - - - 0x001F8A 00:9F7A: 03        .byte $03   ; item: scorpion
- D 0 - - - 0x001F8B 00:9F7B: 04        .byte $04   ; item: snake
- D 0 - - - 0x001F8C 00:9F7C: 05        .byte $05   ; item: balloon
- D 0 - - - 0x001F8D 00:9F7D: 06        .byte $06   ; item: porcupine
- D 0 - - - 0x001F8E 00:9F7E: 07        .byte $07   ; item: candy
- D 0 - - - 0x001F8F 00:9F7F: 00        .byte $00   ; item: crown 
- D 0 - - - 0x001F90 00:9F80: 05        .byte $05   ; item: balloon
- D 0 - - - 0x001F91 00:9F81: 02        .byte $02   ; item: dog
- D 0 - - - 0x001F92 00:9F82: 00        .byte $00   ; item: crown 
- D 0 - - - 0x001F93 00:9F83: 04        .byte $04   ; item: snake 
- D 0 - - - 0x001F94 00:9F84: 05        .byte $05   ; item: balloon 
- D 0 - - - 0x001F95 00:9F85: 06        .byte $06   ; item: porcupine 
- D 0 - - - 0x001F96 00:9F86: 07        .byte $07   ; item: candy

sub_9F87:
C - - - - - 0x001F97 00:9F87: AD 84 03  LDA ram_0384
C - - - - - 0x001F9A 00:9F8A: D0 01     BNE bra_9F8D
- - - - - - 0x001F9C 00:9F8C: 60        RTS
bra_9F8D:
C - - - - - 0x001F9D 00:9F8D: A5 2C     LDA con_player_position_x
C - - - - - 0x001F9F 00:9F8F: 85 4E     STA ram_004E
C - - - - - 0x001FA1 00:9F91: A5 2D     LDA con_player_position_y
C - - - - - 0x001FA3 00:9F93: 29 0F     AND #$0F
C - - - - - 0x001FA5 00:9F95: F0 07     BEQ bra_9F9E
C - - - - - 0x001FA7 00:9F97: A5 2D     LDA con_player_position_y
C - - - - - 0x001FA9 00:9F99: 29 F0     AND #$F0
C - - - - - 0x001FAB 00:9F9B: 4C A3 9F  JMP loc_9FA3
bra_9F9E:
C - - - - - 0x001FAE 00:9F9E: A5 2D     LDA con_player_position_y
C - - - - - 0x001FB0 00:9FA0: 38        SEC
C - - - - - 0x001FB1 00:9FA1: E9 10     SBC #$10

loc_9FA3:
C D 0 - - - 0x001FB3 00:9FA3: 85 4D     STA ram_004D
C - - - - - 0x001FB5 00:9FA5: A9 00     LDA #$00
C - - - - - 0x001FB7 00:9FA7: 85 4C     STA ram_004C
C - - - - - 0x001FB9 00:9FA9: A9 34     LDA #$34
C - - - - - 0x001FBB 00:9FAB: 85 24     STA ram_0024
C - - - - - 0x001FBD 00:9FAD: AE 3B 06  LDX ram_063B
C - - - - - 0x001FC0 00:9FB0: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x001FC3 00:9FB3: 0A        ASL
C - - - - - 0x001FC4 00:9FB4: AA        TAX
C - - - - - 0x001FC5 00:9FB5: BD AF 8D  LDA tbl_8DAF_stage_fruit_table,X
C - - - - - 0x001FC8 00:9FB8: 85 45     STA ram_0045
C - - - - - 0x001FCA 00:9FBA: BD B0 8D  LDA tbl_8DAF_stage_fruit_table+1,X
C - - - - - 0x001FCD 00:9FBD: 85 46     STA ram_0046
C - - - - - 0x001FCF 00:9FBF: 20 CE C0  JSR sub_C0CE
C - - - - - 0x001FD2 00:9FC2: 60        RTS

sub_9FC3:
C - - - - - 0x001FD3 00:9FC3: AD 84 03  LDA ram_0384
C - - - - - 0x001FD6 00:9FC6: D0 01     BNE bra_9FC9
C - - - - - 0x001FD8 00:9FC8: 60        RTS

bra_9FC9:
C - - - - - 0x001FD9 00:9FC9: AD DC 02  LDA ram_02DC
C - - - - - 0x001FDC 00:9FCC: 85 4D     STA ram_004D
C - - - - - 0x001FDE 00:9FCE: AD DF 02  LDA ram_02DF
C - - - - - 0x001FE1 00:9FD1: 85 4E     STA ram_004E
C - - - - - 0x001FE3 00:9FD3: A9 08     LDA #$08
C - - - - - 0x001FE5 00:9FD5: 85 0E     STA ram_000E
C - - - - - 0x001FE7 00:9FD7: 20 27 A4  JSR sub_A427
C - - - - - 0x001FEA 00:9FDA: 90 14     BCC bra_9FF0_RTS
C - - - - - 0x001FEC 00:9FDC: A9 00     LDA #$00
C - - - - - 0x001FEE 00:9FDE: 8D 84 03  STA ram_0384
C - - - - - 0x001FF1 00:9FE1: AE 3B 06  LDX ram_063B
C - - - - - 0x001FF4 00:9FE4: FE 2D 06  INC ram_062D,X

bra_9FE7:
C - - - - - 0x001FF7 00:9FE7: A9 00     LDA #$00
C - - - - - 0x001FF9 00:9FE9: 85 D2     STA ram_00D2
C - - - - - 0x001FFB 00:9FEB: A2 D0     LDX #$D0
C - - - - - 0x001FFD 00:9FED: 20 53 A8  JSR sub_A853

bra_9FF0_RTS:
C - - - - - 0x002000 00:9FF0: 60        RTS

sub_9FF1:
C - - - - - 0x002001 00:9FF1: AD 84 03  LDA ram_0384
C - - - - - 0x002004 00:9FF4: D0 01     BNE bra_9FF7
C - - - - - 0x002006 00:9FF6: 60        RTS

bra_9FF7:
C - - - - - 0x002007 00:9FF7: AD D3 02  LDA ram_02D3
C - - - - - 0x00200A 00:9FFA: C9 F8     CMP #$F8
C - - - - - 0x00200C 00:9FFC: D0 07     BNE bra_A005

bra_9FFE:
- - - - - - 0x00200E 00:9FFE: A9 00     LDA #$00
- - - - - - 0x002010 00:A000: 8D 84 03  STA ram_0384
- - - - - - 0x002013 00:A003: F0 E2     BEQ bra_9FE7

bra_A005:
C - - - - - 0x002015 00:A005: C9 F0     CMP #$F0
C - - - - - 0x002017 00:A007: F0 F5     BEQ bra_9FFE
C - - - - - 0x002019 00:A009: 60        RTS

sub_A00A:
C - - - - - 0x00201A 00:A00A: A5 D8     LDA ram_00D8
C - - - - - 0x00201C 00:A00C: 05 E0     ORA ram_00E0
C - - - - - 0x00201E 00:A00E: 05 D7     ORA ram_00D7
C - - - - - 0x002020 00:A010: 05 D5     ORA ram_00D5
C - - - - - 0x002022 00:A012: F0 24     BEQ bra_A038_RTS
C - - - - - 0x002024 00:A014: A5 73     LDA ram_0073
C - - - - - 0x002026 00:A016: F0 09     BEQ bra_A021
C - - - - - 0x002028 00:A018: C6 EE     DEC ram_00EE
C - - - - - 0x00202A 00:A01A: C6 EC     DEC ram_00EC
C - - - - - 0x00202C 00:A01C: C6 F0     DEC ram_00F0
C - - - - - 0x00202E 00:A01E: CE 1D 03  DEC ram_031D

bra_A021:
C - - - - - 0x002031 00:A021: A5 74     LDA ram_0074
C - - - - - 0x002033 00:A023: F0 09     BEQ bra_A02E
C - - - - - 0x002035 00:A025: E6 EE     INC ram_00EE
C - - - - - 0x002037 00:A027: E6 EC     INC ram_00EC
C - - - - - 0x002039 00:A029: E6 F0     INC ram_00F0
C - - - - - 0x00203B 00:A02B: EE 1D 03  INC ram_031D

bra_A02E:
C - - - - - 0x00203E 00:A02E: AD 49 06  LDA ram_0649
C - - - - - 0x002041 00:A031: C9 20     CMP #$20
C - - - - - 0x002043 00:A033: B0 04     BCS bra_A039
C - - - - - 0x002045 00:A035: EE 49 06  INC ram_0649

bra_A038_RTS:
C - - - - - 0x002048 00:A038: 60        RTS

bra_A039:
C - - - - - 0x002049 00:A039: 20 46 A0  JSR sub_A046
C - - - - - 0x00204C 00:A03C: 20 FB A0  JSR sub_A0FB
C - - - - - 0x00204F 00:A03F: 20 60 A1  JSR sub_A160
C - - - - - 0x002052 00:A042: 20 A0 A0  JSR sub_A0A0
C - - - - - 0x002055 00:A045: 60        RTS

sub_A046:
C - - - - - 0x002056 00:A046: A5 D5     LDA ram_00D5
C - - - - - 0x002058 00:A048: F0 EE     BEQ bra_A038_RTS
C - - - - - 0x00205A 00:A04A: A5 7B     LDA ram_007B
C - - - - - 0x00205C 00:A04C: 29 01     AND #$01
C - - - - - 0x00205E 00:A04E: F0 E8     BEQ bra_A038_RTS

sub_A050:
C - - - - - 0x002060 00:A050: A5 F5     LDA ram_00F5
C - - - - - 0x002062 00:A052: 85 6A     STA ram_006A
C - - - - - 0x002064 00:A054: A5 F0     LDA ram_00F0
C - - - - - 0x002066 00:A056: 85 71     STA ram_0071
C - - - - - 0x002068 00:A058: A5 F1     LDA ram_00F1
C - - - - - 0x00206A 00:A05A: 85 72     STA ram_0072
C - - - - - 0x00206C 00:A05C: A5 DB     LDA ram_00DB
C - - - - - 0x00206E 00:A05E: 85 24     STA ram_0024
C - - - - - 0x002070 00:A060: A9 15     LDA #$15
C - - - - - 0x002072 00:A062: 85 52     STA ram_0052
C - - - - - 0x002074 00:A064: A9 94     LDA #$94
C - - - - - 0x002076 00:A066: 85 53     STA ram_0053
C - - - - - 0x002078 00:A068: A9 01     LDA #$01
C - - - - - 0x00207A 00:A06A: 85 54     STA ram_0054
C - - - - - 0x00207C 00:A06C: 20 CF BC  JSR sub_BCCF
C - - - - - 0x00207F 00:A06F: A5 4E     LDA ram_004E
C - - - - - 0x002081 00:A071: 85 F0     STA ram_00F0
C - - - - - 0x002083 00:A073: A5 4D     LDA ram_004D
C - - - - - 0x002085 00:A075: 85 F1     STA ram_00F1
C - - - - - 0x002087 00:A077: A5 6A     LDA ram_006A
C - - - - - 0x002089 00:A079: 85 F5     STA ram_00F5
C - - - - - 0x00208B 00:A07B: A5 F0     LDA ram_00F0
C - - - - - 0x00208D 00:A07D: C9 F0     CMP #$F0
C - - - - - 0x00208F 00:A07F: 90 0C     BCC bra_A08D
C - - - - - 0x002091 00:A081: A9 03     LDA #$03
C - - - - - 0x002093 00:A083: 85 F5     STA ram_00F5
C - - - - - 0x002095 00:A085: A5 F0     LDA ram_00F0
C - - - - - 0x002097 00:A087: 29 F0     AND #$F0
C - - - - - 0x002099 00:A089: 85 F0     STA ram_00F0
C - - - - - 0x00209B 00:A08B: D0 0C     BNE bra_A099

bra_A08D:
C - - - - - 0x00209D 00:A08D: C9 03     CMP #$03
C - - - - - 0x00209F 00:A08F: B0 0E     BCS bra_A09F_RTS
C - - - - - 0x0020A1 00:A091: A9 01     LDA #$01
C - - - - - 0x0020A3 00:A093: 85 F5     STA ram_00F5
C - - - - - 0x0020A5 00:A095: A9 03     LDA #$03
C - - - - - 0x0020A7 00:A097: 85 F0     STA ram_00F0

bra_A099:
C - - - - - 0x0020A9 00:A099: A5 F1     LDA ram_00F1
C - - - - - 0x0020AB 00:A09B: 29 F0     AND #$F0
C - - - - - 0x0020AD 00:A09D: 85 F1     STA ram_00F1

bra_A09F_RTS:
C - - - - - 0x0020AF 00:A09F: 60        RTS

sub_A0A0:
C - - - - - 0x0020B0 00:A0A0: A5 D7     LDA ram_00D7
C - - - - - 0x0020B2 00:A0A2: D0 01     BNE bra_A0A5

bra_A0A4_RTS:
C - - - - - 0x0020B4 00:A0A4: 60        RTS

bra_A0A5:
C - - - - - 0x0020B5 00:A0A5: A5 7B     LDA ram_007B
C - - - - - 0x0020B7 00:A0A7: 29 01     AND #$01
C - - - - - 0x0020B9 00:A0A9: F0 F9     BEQ bra_A0A4_RTS
C - - - - - 0x0020BB 00:A0AB: A5 F6     LDA ram_00F6
C - - - - - 0x0020BD 00:A0AD: 85 6A     STA ram_006A
C - - - - - 0x0020BF 00:A0AF: A5 EC     LDA ram_00EC
C - - - - - 0x0020C1 00:A0B1: 85 71     STA ram_0071
C - - - - - 0x0020C3 00:A0B3: A5 ED     LDA ram_00ED
C - - - - - 0x0020C5 00:A0B5: 85 72     STA ram_0072
C - - - - - 0x0020C7 00:A0B7: A5 DD     LDA ram_00DD
C - - - - - 0x0020C9 00:A0B9: 85 24     STA ram_0024
C - - - - - 0x0020CB 00:A0BB: A9 FD     LDA #$FD
C - - - - - 0x0020CD 00:A0BD: 85 52     STA ram_0052
C - - - - - 0x0020CF 00:A0BF: A9 93     LDA #$93
C - - - - - 0x0020D1 00:A0C1: 85 53     STA ram_0053
C - - - - - 0x0020D3 00:A0C3: A9 01     LDA #$01
C - - - - - 0x0020D5 00:A0C5: 85 54     STA ram_0054
C - - - - - 0x0020D7 00:A0C7: 20 CF BC  JSR sub_BCCF
C - - - - - 0x0020DA 00:A0CA: A5 4E     LDA ram_004E
C - - - - - 0x0020DC 00:A0CC: 85 EC     STA ram_00EC
C - - - - - 0x0020DE 00:A0CE: A5 4D     LDA ram_004D
C - - - - - 0x0020E0 00:A0D0: 85 ED     STA ram_00ED
C - - - - - 0x0020E2 00:A0D2: A5 6A     LDA ram_006A
C - - - - - 0x0020E4 00:A0D4: 85 F6     STA ram_00F6
C - - - - - 0x0020E6 00:A0D6: A5 EC     LDA ram_00EC
C - - - - - 0x0020E8 00:A0D8: C9 F0     CMP #$F0
C - - - - - 0x0020EA 00:A0DA: 90 0C     BCC bra_A0E8
C - - - - - 0x0020EC 00:A0DC: A9 03     LDA #$03
C - - - - - 0x0020EE 00:A0DE: 85 F6     STA ram_00F6
C - - - - - 0x0020F0 00:A0E0: A5 EC     LDA ram_00EC
C - - - - - 0x0020F2 00:A0E2: 29 F0     AND #$F0
C - - - - - 0x0020F4 00:A0E4: 85 EC     STA ram_00EC
C - - - - - 0x0020F6 00:A0E6: D0 0C     BNE bra_A0F4

bra_A0E8:
C - - - - - 0x0020F8 00:A0E8: C9 03     CMP #$03
C - - - - - 0x0020FA 00:A0EA: B0 0E     BCS bra_A0FA_RTS
C - - - - - 0x0020FC 00:A0EC: A9 01     LDA #$01
C - - - - - 0x0020FE 00:A0EE: 85 F6     STA ram_00F6
C - - - - - 0x002100 00:A0F0: A9 03     LDA #$03
C - - - - - 0x002102 00:A0F2: 85 EC     STA ram_00EC

bra_A0F4:
C - - - - - 0x002104 00:A0F4: A5 ED     LDA ram_00ED
C - - - - - 0x002106 00:A0F6: 29 F0     AND #$F0
C - - - - - 0x002108 00:A0F8: 85 ED     STA ram_00ED

bra_A0FA_RTS:
C - - - - - 0x00210A 00:A0FA: 60        RTS

sub_A0FB:
C - - - - - 0x00210B 00:A0FB: A5 E0     LDA ram_00E0
C - - - - - 0x00210D 00:A0FD: D0 01     BNE bra_A100

bra_A0FF_RTS:
C - - - - - 0x00210F 00:A0FF: 60        RTS

bra_A100:
C - - - - - 0x002110 00:A100: A5 7B     LDA ram_007B
C - - - - - 0x002112 00:A102: 29 01     AND #$01
C - - - - - 0x002114 00:A104: F0 F9     BEQ bra_A0FF_RTS
C - - - - - 0x002116 00:A106: A5 FD     LDA ram_00FD
C - - - - - 0x002118 00:A108: 85 6A     STA ram_006A
C - - - - - 0x00211A 00:A10A: AD 1D 03  LDA ram_031D
C - - - - - 0x00211D 00:A10D: 85 71     STA ram_0071
C - - - - - 0x00211F 00:A10F: AD 1E 03  LDA ram_031E
C - - - - - 0x002122 00:A112: 85 72     STA ram_0072
C - - - - - 0x002124 00:A114: A5 7A     LDA ram_007A
C - - - - - 0x002126 00:A116: 85 24     STA ram_0024
C - - - - - 0x002128 00:A118: A9 03     LDA #$03
C - - - - - 0x00212A 00:A11A: 85 52     STA ram_0052
C - - - - - 0x00212C 00:A11C: A9 94     LDA #$94
C - - - - - 0x00212E 00:A11E: 85 53     STA ram_0053
C - - - - - 0x002130 00:A120: A9 01     LDA #$01
C - - - - - 0x002132 00:A122: 85 54     STA ram_0054
C - - - - - 0x002134 00:A124: 20 CF BC  JSR sub_BCCF
C - - - - - 0x002137 00:A127: A5 4E     LDA ram_004E
C - - - - - 0x002139 00:A129: 8D 1D 03  STA ram_031D
C - - - - - 0x00213C 00:A12C: A5 4D     LDA ram_004D
C - - - - - 0x00213E 00:A12E: 8D 1E 03  STA ram_031E
C - - - - - 0x002141 00:A131: A5 6A     LDA ram_006A
C - - - - - 0x002143 00:A133: 85 FD     STA ram_00FD
C - - - - - 0x002145 00:A135: AD 1D 03  LDA ram_031D
C - - - - - 0x002148 00:A138: C9 F0     CMP #$F0
C - - - - - 0x00214A 00:A13A: 90 0E     BCC bra_A14A
C - - - - - 0x00214C 00:A13C: A9 03     LDA #$03
C - - - - - 0x00214E 00:A13E: 85 FD     STA ram_00FD
C - - - - - 0x002150 00:A140: AD 1D 03  LDA ram_031D
C - - - - - 0x002153 00:A143: 29 F0     AND #$F0
C - - - - - 0x002155 00:A145: 8D 1D 03  STA ram_031D
C - - - - - 0x002158 00:A148: D0 0D     BNE bra_A157

bra_A14A:
C - - - - - 0x00215A 00:A14A: C9 03     CMP #$03
C - - - - - 0x00215C 00:A14C: B0 11     BCS bra_A15F_RTS
C - - - - - 0x00215E 00:A14E: A9 01     LDA #$01
C - - - - - 0x002160 00:A150: 85 FD     STA ram_00FD
C - - - - - 0x002162 00:A152: A9 03     LDA #$03
C - - - - - 0x002164 00:A154: 8D 1D 03  STA ram_031D

bra_A157:
C - - - - - 0x002167 00:A157: AD 1E 03  LDA ram_031E
C - - - - - 0x00216A 00:A15A: 29 F0     AND #$F0
C - - - - - 0x00216C 00:A15C: 8D 1E 03  STA ram_031E

bra_A15F_RTS:
C - - - - - 0x00216F 00:A15F: 60        RTS

sub_A160:
C - - - - - 0x002170 00:A160: A5 D8     LDA ram_00D8
C - - - - - 0x002172 00:A162: D0 01     BNE bra_A165

bra_A164_RTS:
C - - - - - 0x002174 00:A164: 60        RTS

bra_A165:
C - - - - - 0x002175 00:A165: A5 9A     LDA ram_009A
C - - - - - 0x002177 00:A167: 29 01     AND #$01
C - - - - - 0x002179 00:A169: F0 F9     BEQ bra_A164_RTS
C - - - - - 0x00217B 00:A16B: A5 F4     LDA ram_00F4
C - - - - - 0x00217D 00:A16D: 85 6A     STA ram_006A
C - - - - - 0x00217F 00:A16F: A5 EE     LDA ram_00EE
C - - - - - 0x002181 00:A171: 85 71     STA ram_0071
C - - - - - 0x002183 00:A173: 85 68     STA ram_0068
C - - - - - 0x002185 00:A175: A5 EF     LDA ram_00EF
C - - - - - 0x002187 00:A177: 85 72     STA ram_0072
C - - - - - 0x002189 00:A179: 85 69     STA ram_0069
C - - - - - 0x00218B 00:A17B: A5 DA     LDA ram_00DA
C - - - - - 0x00218D 00:A17D: 85 24     STA ram_0024
C - - - - - 0x00218F 00:A17F: A9 09     LDA #$09
C - - - - - 0x002191 00:A181: 85 52     STA ram_0052
C - - - - - 0x002193 00:A183: A9 94     LDA #$94
C - - - - - 0x002195 00:A185: 85 53     STA ram_0053
C - - - - - 0x002197 00:A187: A9 01     LDA #$01
C - - - - - 0x002199 00:A189: 85 54     STA ram_0054
C - - - - - 0x00219B 00:A18B: A9 01     LDA #$01
C - - - - - 0x00219D 00:A18D: 8D 4C 03  STA ram_034C
C - - - - - 0x0021A0 00:A190: 20 CF BC  JSR sub_BCCF
C - - - - - 0x0021A3 00:A193: A9 00     LDA #$00
C - - - - - 0x0021A5 00:A195: 8D 4C 03  STA ram_034C
C - - - - - 0x0021A8 00:A198: A5 4E     LDA ram_004E
C - - - - - 0x0021AA 00:A19A: 85 EE     STA ram_00EE
C - - - - - 0x0021AC 00:A19C: A5 4D     LDA ram_004D
C - - - - - 0x0021AE 00:A19E: 85 EF     STA ram_00EF
C - - - - - 0x0021B0 00:A1A0: A5 6A     LDA ram_006A
C - - - - - 0x0021B2 00:A1A2: 85 F4     STA ram_00F4
C - - - - - 0x0021B4 00:A1A4: A5 DA     LDA ram_00DA
C - - - - - 0x0021B6 00:A1A6: 0A        ASL
C - - - - - 0x0021B7 00:A1A7: 0A        ASL
C - - - - - 0x0021B8 00:A1A8: AA        TAX
C - - - - - 0x0021B9 00:A1A9: A5 EE     LDA ram_00EE
C - - - - - 0x0021BB 00:A1AB: C9 F0     CMP #$F0
C - - - - - 0x0021BD 00:A1AD: 90 0A     BCC bra_A1B9_RTS
C - - - - - 0x0021BF 00:A1AF: 20 53 A8  JSR sub_A853
C - - - - - 0x0021C2 00:A1B2: A9 00     LDA #$00
C - - - - - 0x0021C4 00:A1B4: 85 D8     STA ram_00D8
C - - - - - 0x0021C6 00:A1B6: 8D 80 03  STA ram_0380

bra_A1B9_RTS:
C - - - - - 0x0021C9 00:A1B9: 60        RTS

sub_A1BA:
C - - - - - 0x0021CA 00:A1BA: E6 8A     INC ram_008A
C - - - - - 0x0021CC 00:A1BC: A5 85     LDA ram_0085
C - - - - - 0x0021CE 00:A1BE: C9 03     CMP #$03
C - - - - - 0x0021D0 00:A1C0: 90 51     BCC bra_A213
C - - - - - 0x0021D2 00:A1C2: A9 00     LDA #$00
C - - - - - 0x0021D4 00:A1C4: 85 85     STA ram_0085
C - - - - - 0x0021D6 00:A1C6: 85 89     STA ram_0089
C - - - - - 0x0021D8 00:A1C8: 85 8A     STA ram_008A
C - - - - - 0x0021DA 00:A1CA: 85 8B     STA ram_008B
C - - - - - 0x0021DC 00:A1CC: AD 20 03  LDA ram_0320
C - - - - - 0x0021DF 00:A1CF: F0 15     BEQ bra_A1E6
C - - - - - 0x0021E1 00:A1D1: A9 00     LDA #$00
C - - - - - 0x0021E3 00:A1D3: 8D 8B 03  STA ram_038B
C - - - - - 0x0021E6 00:A1D6: AD 89 03  LDA ram_0389
C - - - - - 0x0021E9 00:A1D9: D0 DE     BNE bra_A1B9_RTS
C - - - - - 0x0021EB 00:A1DB: A9 01     LDA #$01
C - - - - - 0x0021ED 00:A1DD: 8D 1F 03  STA ram_031F
C - - - - - 0x0021F0 00:A1E0: A9 00     LDA #$00
C - - - - - 0x0021F2 00:A1E2: 8D 20 03  STA ram_0320
C - - - - - 0x0021F5 00:A1E5: 60        RTS

bra_A1E6:
C - - - - - 0x0021F6 00:A1E6: AD 89 03  LDA ram_0389
C - - - - - 0x0021F9 00:A1E9: D0 12     BNE bra_A1FD
C - - - - - 0x0021FB 00:A1EB: A9 01     LDA #$01
C - - - - - 0x0021FD 00:A1ED: 8D 23 03  STA ram_0323
C - - - - - 0x002200 00:A1F0: 8D 4A 06  STA ram_064A
C - - - - - 0x002203 00:A1F3: A9 03     LDA #$03
C - - - - - 0x002205 00:A1F5: 85 33     STA ram_0033
C - - - - - 0x002207 00:A1F7: A2 C0     LDX #$C0
C - - - - - 0x002209 00:A1F9: 20 53 A8  JSR sub_A853
C - - - - - 0x00220C 00:A1FC: 60        RTS

bra_A1FD:
C - - - - - 0x00220D 00:A1FD: AE 3B 06  LDX ram_063B
C - - - - - 0x002210 00:A200: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x002213 00:A203: C9 0A     CMP #$0A
C - - - - - 0x002215 00:A205: B0 06     BCS bra_A20D
C - - - - - 0x002217 00:A207: A9 01     LDA #$01
C - - - - - 0x002219 00:A209: 8D 8C 03  STA ram_038C
C - - - - - 0x00221C 00:A20C: 60        RTS

bra_A20D:
C - - - - - 0x00221D 00:A20D: A9 01     LDA #$01
C - - - - - 0x00221F 00:A20F: 8D 4D 06  STA ram_064D

bra_A212_RTS:
C - - - - - 0x002222 00:A212: 60        RTS

bra_A213:
C - - - - - 0x002223 00:A213: A5 8A     LDA ram_008A
C - - - - - 0x002225 00:A215: CD 0A 80  CMP $800A
C - - - - - 0x002228 00:A218: 90 F8     BCC bra_A212_RTS
C - - - - - 0x00222A 00:A21A: A5 2D     LDA con_player_position_y
C - - - - - 0x00222C 00:A21C: 85 4D     STA ram_004D
C - - - - - 0x00222E 00:A21E: A5 2C     LDA con_player_position_x
C - - - - - 0x002230 00:A220: 85 4E     STA ram_004E
C - - - - - 0x002232 00:A222: A9 00     LDA #$00
C - - - - - 0x002234 00:A224: 85 24     STA ram_0024
C - - - - - 0x002236 00:A226: A9 00     LDA #$00
C - - - - - 0x002238 00:A228: 85 8A     STA ram_008A
C - - - - - 0x00223A 00:A22A: E6 89     INC ram_0089
C - - - - - 0x00223C 00:A22C: A5 89     LDA ram_0089
C - - - - - 0x00223E 00:A22E: C9 01     CMP #$01
C - - - - - 0x002240 00:A230: F0 1B     BEQ bra_A24D
C - - - - - 0x002242 00:A232: C9 02     CMP #$02
C - - - - - 0x002244 00:A234: F0 25     BEQ bra_A25B
C - - - - - 0x002246 00:A236: C9 03     CMP #$03
C - - - - - 0x002248 00:A238: F0 2F     BEQ bra_A269
C - - - - - 0x00224A 00:A23A: E6 85     INC ram_0085
C - - - - - 0x00224C 00:A23C: A9 00     LDA #$00
C - - - - - 0x00224E 00:A23E: 85 89     STA ram_0089
C - - - - - 0x002250 00:A240: 85 4C     STA ram_004C
C - - - - - 0x002252 00:A242: A9 94     LDA #$94
C - - - - - 0x002254 00:A244: 85 46     STA ram_0046
C - - - - - 0x002256 00:A246: A9 45     LDA #$45
C - - - - - 0x002258 00:A248: 85 45     STA ram_0045
C - - - - - 0x00225A 00:A24A: 4C 75 A2  JMP loc_A275

bra_A24D:
C - - - - - 0x00225D 00:A24D: A9 94     LDA #$94
C - - - - - 0x00225F 00:A24F: 85 46     STA ram_0046
C - - - - - 0x002261 00:A251: A9 30     LDA #$30
C - - - - - 0x002263 00:A253: 85 45     STA ram_0045
C - - - - - 0x002265 00:A255: A9 00     LDA #$00
C - - - - - 0x002267 00:A257: 85 4C     STA ram_004C
C - - - - - 0x002269 00:A259: F0 1A     BEQ bra_A275

bra_A25B:
C - - - - - 0x00226B 00:A25B: A9 94     LDA #$94
C - - - - - 0x00226D 00:A25D: 85 46     STA ram_0046
C - - - - - 0x00226F 00:A25F: A9 1B     LDA #$1B
C - - - - - 0x002271 00:A261: 85 45     STA ram_0045
C - - - - - 0x002273 00:A263: A9 01     LDA #$01
C - - - - - 0x002275 00:A265: 85 4C     STA ram_004C
C - - - - - 0x002277 00:A267: D0 0C     BNE bra_A275

bra_A269:
C - - - - - 0x002279 00:A269: A9 94     LDA #$94
C - - - - - 0x00227B 00:A26B: 85 46     STA ram_0046
C - - - - - 0x00227D 00:A26D: A9 30     LDA #$30
C - - - - - 0x00227F 00:A26F: 85 45     STA ram_0045
C - - - - - 0x002281 00:A271: A9 00     LDA #$00
C - - - - - 0x002283 00:A273: 85 4C     STA ram_004C

bra_A275:
loc_A275:
C D 1 - - - 0x002285 00:A275: 20 CE C0  JSR sub_C0CE
C - - - - - 0x002288 00:A278: 60        RTS

sub_A279:
C - - - - - 0x002289 00:A279: A5 7B     LDA ram_007B
C - - - - - 0x00228B 00:A27B: 29 01     AND #$01
C - - - - - 0x00228D 00:A27D: F0 0F     BEQ bra_A28E_RTS
C - - - - - 0x00228F 00:A27F: AD C0 02  LDA ram_02C0
C - - - - - 0x002292 00:A282: C9 10     CMP #$10
C - - - - - 0x002294 00:A284: B0 09     BCS bra_A28F
C - - - - - 0x002296 00:A286: A9 01     LDA #$01
C - - - - - 0x002298 00:A288: 85 E4     STA ram_00E4
C - - - - - 0x00229A 00:A28A: A9 00     LDA #$00
C - - - - - 0x00229C 00:A28C: 85 83     STA ram_0083

bra_A28E_RTS:
C - - - - - 0x00229E 00:A28E: 60        RTS

bra_A28F:
C - - - - - 0x00229F 00:A28F: A2 00     LDX #$00
C - - - - - 0x0022A1 00:A291: A0 00     LDY #$00

bra_A293:
C - - - - - 0x0022A3 00:A293: DE C0 02  DEC ram_02C0,X
C - - - - - 0x0022A6 00:A296: E8        INX
C - - - - - 0x0022A7 00:A297: E8        INX
C - - - - - 0x0022A8 00:A298: E8        INX
C - - - - - 0x0022A9 00:A299: E8        INX
C - - - - - 0x0022AA 00:A29A: C8        INY
C - - - - - 0x0022AB 00:A29B: C0 08     CPY #$08
C - - - - - 0x0022AD 00:A29D: 90 F4     BCC bra_A293
C - - - - - 0x0022AF 00:A29F: 60        RTS

sub_A2A0:
C - - - - - 0x0022B0 00:A2A0: A5 7B     LDA ram_007B
C - - - - - 0x0022B2 00:A2A2: 29 01     AND #$01
C - - - - - 0x0022B4 00:A2A4: F0 02     BEQ bra_A2A8
C - - - - - 0x0022B6 00:A2A6: C6 2D     DEC con_player_position_y

bra_A2A8:
C - - - - - 0x0022B8 00:A2A8: A5 2D     LDA con_player_position_y
C - - - - - 0x0022BA 00:A2AA: 85 4D     STA ram_004D
C - - - - - 0x0022BC 00:A2AC: A5 2C     LDA con_player_position_x
C - - - - - 0x0022BE 00:A2AE: 85 4E     STA ram_004E
C - - - - - 0x0022C0 00:A2B0: A9 00     LDA #$00
C - - - - - 0x0022C2 00:A2B2: 85 4C     STA ram_004C
C - - - - - 0x0022C4 00:A2B4: 85 24     STA ram_0024
C - - - - - 0x0022C6 00:A2B6: A9 0B     LDA #$0B
C - - - - - 0x0022C8 00:A2B8: 85 45     STA ram_0045
C - - - - - 0x0022CA 00:A2BA: A9 95     LDA #$95
C - - - - - 0x0022CC 00:A2BC: 85 46     STA ram_0046
C - - - - - 0x0022CE 00:A2BE: 20 CE C0  JSR sub_C0CE
C - - - - - 0x0022D1 00:A2C1: A5 2D     LDA con_player_position_y
C - - - - - 0x0022D3 00:A2C3: C9 E8     CMP #$E8
C - - - - - 0x0022D5 00:A2C5: 90 0D     BCC bra_A2D4
C - - - - - 0x0022D7 00:A2C7: A9 F8     LDA #$F8
C - - - - - 0x0022D9 00:A2C9: A2 00     LDX #$00
C - - - - - 0x0022DB 00:A2CB: 20 53 A8  JSR sub_A853
C - - - - - 0x0022DE 00:A2CE: A2 10     LDX #$10
C - - - - - 0x0022E0 00:A2D0: 20 53 A8  JSR sub_A853
C - - - - - 0x0022E3 00:A2D3: 60        RTS

bra_A2D4:
C - - - - - 0x0022E4 00:A2D4: C9 E0     CMP #$E0
C - - - - - 0x0022E6 00:A2D6: 90 15     BCC bra_A2ED
C - - - - - 0x0022E8 00:A2D8: A9 F8     LDA #$F8
C - - - - - 0x0022EA 00:A2DA: 8D 04 02  STA ram_0204
C - - - - - 0x0022ED 00:A2DD: 8D 08 02  STA ram_0208
C - - - - - 0x0022F0 00:A2E0: 8D 0C 02  STA ram_020C
C - - - - - 0x0022F3 00:A2E3: 8D 14 02  STA ram_0214
C - - - - - 0x0022F6 00:A2E6: 8D 18 02  STA ram_0218
C - - - - - 0x0022F9 00:A2E9: 8D 1C 02  STA ram_021C
C - - - - - 0x0022FC 00:A2EC: 60        RTS

bra_A2ED:
C - - - - - 0x0022FD 00:A2ED: C9 D8     CMP #$D8
C - - - - - 0x0022FF 00:A2EF: 90 0F     BCC bra_A300
C - - - - - 0x002301 00:A2F1: A9 F8     LDA #$F8
C - - - - - 0x002303 00:A2F3: 8D 08 02  STA ram_0208
C - - - - - 0x002306 00:A2F6: 8D 0C 02  STA ram_020C
C - - - - - 0x002309 00:A2F9: 8D 18 02  STA ram_0218
C - - - - - 0x00230C 00:A2FC: 8D 1C 02  STA ram_021C
C - - - - - 0x00230F 00:A2FF: 60        RTS

bra_A300:
C - - - - - 0x002310 00:A300: C9 D0     CMP #$D0
C - - - - - 0x002312 00:A302: 90 09     BCC bra_A30D
C - - - - - 0x002314 00:A304: A9 F8     LDA #$F8
C - - - - - 0x002316 00:A306: 8D 0C 02  STA ram_020C
C - - - - - 0x002319 00:A309: 8D 1C 02  STA ram_021C
C - - - - - 0x00231C 00:A30C: 60        RTS
bra_A30D:
C - - - - - 0x00231D 00:A30D: C9 A0     CMP #$A0
C - - - - - 0x00231F 00:A30F: D0 0E     BNE bra_A31F_RTS
C - - - - - 0x002321 00:A311: A9 00     LDA #$00
C - - - - - 0x002323 00:A313: 8D 2F 03  STA ram_032F
C - - - - - 0x002326 00:A316: 85 7B     STA ram_007B
C - - - - - 0x002328 00:A318: 85 7C     STA ram_007C
C - - - - - 0x00232A 00:A31A: A9 01     LDA #$01
C - - - - - 0x00232C 00:A31C: 8D 30 03  STA ram_0330

bra_A31F_RTS:
C - - - - - 0x00232F 00:A31F: 60        RTS

sub_A320:
C - - - - - 0x002330 00:A320: A5 9E     LDA ram_009E
C - - - - - 0x002332 00:A322: F0 11     BEQ bra_A335
C - - - - - 0x002334 00:A324: A9 00     LDA #$00
C - - - - - 0x002336 00:A326: 85 9E     STA ram_009E
C - - - - - 0x002338 00:A328: A5 2D     LDA con_player_position_y
C - - - - - 0x00233A 00:A32A: C9 F8     CMP #$F8
C - - - - - 0x00233C 00:A32C: B0 07     BCS bra_A335
C - - - - - 0x00233E 00:A32E: A5 2D     LDA con_player_position_y
C - - - - - 0x002340 00:A330: 38        SEC
C - - - - - 0x002341 00:A331: E9 0A     SBC #$0A
C - - - - - 0x002343 00:A333: 85 2D     STA con_player_position_y

bra_A335:
C - - - - - 0x002345 00:A335: A5 1C     LDA ram_001C
C - - - - - 0x002347 00:A337: 29 01     AND #$01
C - - - - - 0x002349 00:A339: F0 08     BEQ bra_A343
C - - - - - 0x00234B 00:A33B: A5 2C     LDA con_player_position_x
C - - - - - 0x00234D 00:A33D: C9 F0     CMP #$F0
C - - - - - 0x00234F 00:A33F: F0 02     BEQ bra_A343
C - - - - - 0x002351 00:A341: E6 2C     INC con_player_position_x

bra_A343:
C - - - - - 0x002353 00:A343: A5 1C     LDA ram_001C
C - - - - - 0x002355 00:A345: 29 02     AND #$02
C - - - - - 0x002357 00:A347: F0 08     BEQ bra_A351_RTS
C - - - - - 0x002359 00:A349: A5 2C     LDA con_player_position_x
C - - - - - 0x00235B 00:A34B: C9 00     CMP #$00
C - - - - - 0x00235D 00:A34D: F0 02     BEQ bra_A351_RTS
C - - - - - 0x00235F 00:A34F: C6 2C     DEC con_player_position_x

bra_A351_RTS:
C - - - - - 0x002361 00:A351: 60        RTS

sub_A352:
C - - - - - 0x002362 00:A352: A5 7B     LDA ram_007B
C - - - - - 0x002364 00:A354: 29 01     AND #$01
C - - - - - 0x002366 00:A356: D0 08     BNE bra_A360
C - - - - - 0x002368 00:A358: A5 2D     LDA con_player_position_y
C - - - - - 0x00236A 00:A35A: C9 E0     CMP #$E0
C - - - - - 0x00236C 00:A35C: F0 02     BEQ bra_A360
C - - - - - 0x00236E 00:A35E: E6 2D     INC con_player_position_y

bra_A360:
C - - - - - 0x002370 00:A360: 20 92 9C  JSR sub_9C92
C - - - - - 0x002373 00:A363: 20 20 A3  JSR sub_A320
C - - - - - 0x002376 00:A366: A5 2D     LDA con_player_position_y
C - - - - - 0x002378 00:A368: 85 4D     STA ram_004D
C - - - - - 0x00237A 00:A36A: A5 2C     LDA con_player_position_x
C - - - - - 0x00237C 00:A36C: 85 4E     STA ram_004E
C - - - - - 0x00237E 00:A36E: A9 00     LDA #$00
C - - - - - 0x002380 00:A370: 85 4C     STA ram_004C
C - - - - - 0x002382 00:A372: 85 24     STA ram_0024
C - - - - - 0x002384 00:A374: A9 0B     LDA #$0B
C - - - - - 0x002386 00:A376: 85 45     STA ram_0045
C - - - - - 0x002388 00:A378: A9 95     LDA #$95
C - - - - - 0x00238A 00:A37A: 85 46     STA ram_0046
C - - - - - 0x00238C 00:A37C: 20 CE C0  JSR sub_C0CE
C - - - - - 0x00238F 00:A37F: 60        RTS

sub_A380:
C - - - - - 0x002390 00:A380: AD 48 06  LDA ram_0648
C - - - - - 0x002393 00:A383: C9 08     CMP #$08
C - - - - - 0x002395 00:A385: B0 04     BCS bra_A38B
C - - - - - 0x002397 00:A387: EE 48 06  INC ram_0648
C - - - - - 0x00239A 00:A38A: 60        RTS

bra_A38B:
C - - - - - 0x00239B 00:A38B: 20 7F B9  JSR sub_B97F
C - - - - - 0x00239E 00:A38E: A5 D6     LDA ram_00D6
C - - - - - 0x0023A0 00:A390: F0 5A     BEQ bra_A3EC
C - - - - - 0x0023A2 00:A392: AD 32 03  LDA ram_0332
C - - - - - 0x0023A5 00:A395: 0A        ASL
C - - - - - 0x0023A6 00:A396: 0A        ASL
C - - - - - 0x0023A7 00:A397: A8        TAY
C - - - - - 0x0023A8 00:A398: 85 0F     STA ram_000F
C - - - - - 0x0023AA 00:A39A: B9 0C 02  LDA ram_020C,Y
C - - - - - 0x0023AD 00:A39D: 85 4D     STA ram_004D
C - - - - - 0x0023AF 00:A39F: B9 0F 02  LDA ram_020F,Y
C - - - - - 0x0023B2 00:A3A2: 85 4E     STA ram_004E
C - - - - - 0x0023B4 00:A3A4: A9 0C     LDA #$0C
C - - - - - 0x0023B6 00:A3A6: 85 0E     STA ram_000E
C - - - - - 0x0023B8 00:A3A8: 20 27 A4  JSR sub_A427
C - - - - - 0x0023BB 00:A3AB: 90 3F     BCC bra_A3EC
C - - - - - 0x0023BD 00:A3AD: A5 2C     LDA con_player_position_x
C - - - - - 0x0023BF 00:A3AF: 85 4E     STA ram_004E
C - - - - - 0x0023C1 00:A3B1: A5 2D     LDA con_player_position_y
C - - - - - 0x0023C3 00:A3B3: 85 4D     STA ram_004D
C - - - - - 0x0023C5 00:A3B5: A5 0F     LDA ram_000F
C - - - - - 0x0023C7 00:A3B7: AA        TAX
C - - - - - 0x0023C8 00:A3B8: 20 53 A8  JSR sub_A853
C - - - - - 0x0023CB 00:A3BB: 20 DB B1  JSR sub_B1DB
C - - - - - 0x0023CE 00:A3BE: A9 00     LDA #$00
C - - - - - 0x0023D0 00:A3C0: 85 4C     STA ram_004C
C - - - - - 0x0023D2 00:A3C2: A9 01     LDA #$01
C - - - - - 0x0023D4 00:A3C4: 85 2B     STA ram_002B
C - - - - - 0x0023D6 00:A3C6: A9 30     LDA #$30
C - - - - - 0x0023D8 00:A3C8: 85 24     STA ram_0024
C - - - - - 0x0023DA 00:A3CA: A9 95     LDA #$95
C - - - - - 0x0023DC 00:A3CC: 85 46     STA ram_0046
C - - - - - 0x0023DE 00:A3CE: A9 0B     LDA #$0B
C - - - - - 0x0023E0 00:A3D0: 85 45     STA ram_0045
C - - - - - 0x0023E2 00:A3D2: 20 C7 C0  JSR sub_C0C7
C - - - - - 0x0023E5 00:A3D5: A9 00     LDA #$00
C - - - - - 0x0023E7 00:A3D7: 8D 84 03  STA ram_0384
C - - - - - 0x0023EA 00:A3DA: 8D 27 03  STA ram_0327
C - - - - - 0x0023ED 00:A3DD: 8D 89 03  STA ram_0389
C - - - - - 0x0023F0 00:A3E0: 85 D2     STA ram_00D2
C - - - - - 0x0023F2 00:A3E2: A9 01     LDA #$01
C - - - - - 0x0023F4 00:A3E4: 85 83     STA ram_0083
C - - - - - 0x0023F6 00:A3E6: A2 00     LDX #$00
C - - - - - 0x0023F8 00:A3E8: 20 53 A8  JSR sub_A853

bra_A3EB_RTS:
C - - - - - 0x0023FB 00:A3EB: 60        RTS

bra_A3EC:
C - - - - - 0x0023FC 00:A3EC: AD 8B 03  LDA ram_038B
C - - - - - 0x0023FF 00:A3EF: F0 FA     BEQ bra_A3EB_RTS
C - - - - - 0x002401 00:A3F1: A5 83     LDA ram_0083
C - - - - - 0x002403 00:A3F3: 05 97     ORA ram_0097
C - - - - - 0x002405 00:A3F5: 05 A8     ORA ram_00A8
C - - - - - 0x002407 00:A3F7: 0D 21 03  ORA ram_0321
C - - - - - 0x00240A 00:A3FA: D0 EF     BNE bra_A3EB_RTS
C - - - - - 0x00240C 00:A3FC: AD CC 02  LDA ram_02CC
C - - - - - 0x00240F 00:A3FF: 85 4D     STA ram_004D
C - - - - - 0x002411 00:A401: AD CF 02  LDA ram_02CF
C - - - - - 0x002414 00:A404: 85 4E     STA ram_004E
C - - - - - 0x002416 00:A406: A9 05     LDA #$05
C - - - - - 0x002418 00:A408: 85 0E     STA ram_000E
C - - - - - 0x00241A 00:A40A: 20 27 A4  JSR sub_A427
C - - - - - 0x00241D 00:A40D: 90 DC     BCC bra_A3EB_RTS
C - - - - - 0x00241F 00:A40F: A9 00     LDA #$00
C - - - - - 0x002421 00:A411: 8D 8B 03  STA ram_038B
C - - - - - 0x002424 00:A414: A9 01     LDA #$01
C - - - - - 0x002426 00:A416: 85 8B     STA ram_008B
C - - - - - 0x002428 00:A418: 60        RTS

sub_A419:
C - - - - - 0x002429 00:A419: B9 6C 02  LDA ram_026C,Y
C - - - - - 0x00242C 00:A41C: 85 4D     STA ram_004D
C - - - - - 0x00242E 00:A41E: B9 6F 02  LDA ram_026F,Y
C - - - - - 0x002431 00:A421: 85 4E     STA ram_004E
C - - - - - 0x002433 00:A423: A9 0C     LDA #$0C
C - - - - - 0x002435 00:A425: 85 0E     STA ram_000E

sub_A427:
C - - - - - 0x002437 00:A427: AD 0C 02  LDA ram_020C
C - - - - - 0x00243A 00:A42A: 38        SEC
C - - - - - 0x00243B 00:A42B: E5 4D     SBC ram_004D
C - - - - - 0x00243D 00:A42D: 90 06     BCC bra_A435

loc_A42F:
C D 1 - - - 0x00243F 00:A42F: C5 0E     CMP ram_000E
C - - - - - 0x002441 00:A431: B0 2A     BCS bra_A45D
C - - - - - 0x002443 00:A433: 90 0A     BCC bra_A43F

bra_A435:
C - - - - - 0x002445 00:A435: 85 E3     STA ram_00E3
C - - - - - 0x002447 00:A437: A9 FF     LDA #$FF
C - - - - - 0x002449 00:A439: 38        SEC
C - - - - - 0x00244A 00:A43A: E5 E3     SBC ram_00E3
C - - - - - 0x00244C 00:A43C: 4C 2F A4  JMP loc_A42F

bra_A43F:
C - - - - - 0x00244F 00:A43F: AD 0F 02  LDA ram_020F
C - - - - - 0x002452 00:A442: 38        SEC
C - - - - - 0x002453 00:A443: E5 4E     SBC ram_004E
C - - - - - 0x002455 00:A445: 90 06     BCC bra_A44D

loc_A447:
C D 1 - - - 0x002457 00:A447: C5 0E     CMP ram_000E
C - - - - - 0x002459 00:A449: B0 12     BCS bra_A45D
C - - - - - 0x00245B 00:A44B: 90 0A     BCC bra_A457

bra_A44D:
C - - - - - 0x00245D 00:A44D: 85 E3     STA ram_00E3
C - - - - - 0x00245F 00:A44F: A9 FF     LDA #$FF
C - - - - - 0x002461 00:A451: 38        SEC
C - - - - - 0x002462 00:A452: E5 E3     SBC ram_00E3
C - - - - - 0x002464 00:A454: 4C 47 A4  JMP loc_A447

bra_A457:
C - - - - - 0x002467 00:A457: A9 00     LDA #$00
C - - - - - 0x002469 00:A459: 85 D2     STA ram_00D2
C - - - - - 0x00246B 00:A45B: 38        SEC
C - - - - - 0x00246C 00:A45C: 60        RTS

bra_A45D:
C - - - - - 0x00246D 00:A45D: 18        CLC
C - - - - - 0x00246E 00:A45E: 60        RTS

sub_A45F:
C - - - - - 0x00246F 00:A45F: AD 30 03  LDA ram_0330
C - - - - - 0x002472 00:A462: D0 01     BNE bra_A465
C - - - - - 0x002474 00:A464: 60        RTS

bra_A465:
C - - - - - 0x002475 00:A465: A5 7C     LDA ram_007C
C - - - - - 0x002477 00:A467: C9 06     CMP #$06
C - - - - - 0x002479 00:A469: D0 0B     BNE bra_A476

bra_A46B:
C - - - - - 0x00247B 00:A46B: A9 00     LDA #$00
C - - - - - 0x00247D 00:A46D: 8D 30 03  STA ram_0330
C - - - - - 0x002480 00:A470: A9 01     LDA #$01
C - - - - - 0x002482 00:A472: 8D 31 03  STA ram_0331
C - - - - - 0x002485 00:A475: 60        RTS

bra_A476:
C - - - - - 0x002486 00:A476: A5 2D     LDA con_player_position_y
C - - - - - 0x002488 00:A478: C9 E0     CMP #$E0
C - - - - - 0x00248A 00:A47A: F0 EF     BEQ bra_A46B
C - - - - - 0x00248C 00:A47C: 60        RTS

sub_A47D:
C - - - - - 0x00248D 00:A47D: AD 29 03  LDA ram_0329
C - - - - - 0x002490 00:A480: D0 01     BNE bra_A483

bra_A482_RTS:
C - - - - - 0x002492 00:A482: 60        RTS

bra_A483:
C - - - - - 0x002493 00:A483: E6 5B     INC ram_005B
C - - - - - 0x002495 00:A485: A5 5B     LDA ram_005B
C - - - - - 0x002497 00:A487: C9 08     CMP #$08
C - - - - - 0x002499 00:A489: D0 07     BNE bra_A492
C - - - - - 0x00249B 00:A48B: A9 01     LDA #$01
C - - - - - 0x00249D 00:A48D: 8D 35 06  STA ram_0635
C - - - - - 0x0024A0 00:A490: D0 0D     BNE bra_A49F

bra_A492:
C - - - - - 0x0024A2 00:A492: C9 10     CMP #$10
C - - - - - 0x0024A4 00:A494: D0 09     BNE bra_A49F
C - - - - - 0x0024A6 00:A496: A9 02     LDA #$02
C - - - - - 0x0024A8 00:A498: 8D 35 06  STA ram_0635
C - - - - - 0x0024AB 00:A49B: A9 00     LDA #$00
C - - - - - 0x0024AD 00:A49D: 85 5B     STA ram_005B

bra_A49F:
C - - - - - 0x0024AF 00:A49F: AD 35 06  LDA ram_0635
C - - - - - 0x0024B2 00:A4A2: 85 51     STA ram_0051
C - - - - - 0x0024B4 00:A4A4: A9 00     LDA #$00
C - - - - - 0x0024B6 00:A4A6: 8D 29 03  STA ram_0329
C - - - - - 0x0024B9 00:A4A9: 20 50 A0  JSR sub_A050
C - - - - - 0x0024BC 00:A4AC: A9 01     LDA #$01
C - - - - - 0x0024BE 00:A4AE: 8D 29 03  STA ram_0329
C - - - - - 0x0024C1 00:A4B1: A5 9A     LDA ram_009A
C - - - - - 0x0024C3 00:A4B3: 29 01     AND #$01
C - - - - - 0x0024C5 00:A4B5: D0 CB     BNE bra_A482_RTS
C - - - - - 0x0024C7 00:A4B7: AD 2A 03  LDA ram_032A
C - - - - - 0x0024CA 00:A4BA: 85 6A     STA ram_006A
C - - - - - 0x0024CC 00:A4BC: AD 2B 03  LDA ram_032B
C - - - - - 0x0024CF 00:A4BF: 85 71     STA ram_0071
C - - - - - 0x0024D1 00:A4C1: 85 68     STA ram_0068
C - - - - - 0x0024D3 00:A4C3: AD 2C 03  LDA ram_032C
C - - - - - 0x0024D6 00:A4C6: 85 72     STA ram_0072
C - - - - - 0x0024D8 00:A4C8: 85 69     STA ram_0069
C - - - - - 0x0024DA 00:A4CA: A9 04     LDA #$04
C - - - - - 0x0024DC 00:A4CC: 85 24     STA ram_0024
C - - - - - 0x0024DE 00:A4CE: A9 0F     LDA #$0F
C - - - - - 0x0024E0 00:A4D0: 85 52     STA ram_0052
C - - - - - 0x0024E2 00:A4D2: A9 94     LDA #$94
C - - - - - 0x0024E4 00:A4D4: 85 53     STA ram_0053
C - - - - - 0x0024E6 00:A4D6: A9 01     LDA #$01
C - - - - - 0x0024E8 00:A4D8: 85 54     STA ram_0054
C - - - - - 0x0024EA 00:A4DA: 20 CF BC  JSR sub_BCCF
C - - - - - 0x0024ED 00:A4DD: A5 4E     LDA ram_004E
C - - - - - 0x0024EF 00:A4DF: 8D 2B 03  STA ram_032B
C - - - - - 0x0024F2 00:A4E2: A5 4D     LDA ram_004D
C - - - - - 0x0024F4 00:A4E4: 8D 2C 03  STA ram_032C
C - - - - - 0x0024F7 00:A4E7: A5 6A     LDA ram_006A
C - - - - - 0x0024F9 00:A4E9: 8D 2A 03  STA ram_032A
C - - - - - 0x0024FC 00:A4EC: 60        RTS

sub_A4ED:
C - - - - - 0x0024FD 00:A4ED: AE 3B 06  LDX ram_063B
C - - - - - 0x002500 00:A4F0: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x002503 00:A4F3: C9 03     CMP #$03
C - - - - - 0x002505 00:A4F5: D0 06     BNE bra_A4FD_RTS
C - - - - - 0x002507 00:A4F7: A5 7B     LDA ram_007B
C - - - - - 0x002509 00:A4F9: 29 01     AND #$01
C - - - - - 0x00250B 00:A4FB: F0 01     BEQ bra_A4FE

bra_A4FD_RTS:
C - - - - - 0x00250D 00:A4FD: 60        RTS

bra_A4FE:
C - - - - - 0x00250E 00:A4FE: A9 00     LDA #$00
C - - - - - 0x002510 00:A500: 85 4B     STA ram_004B
C - - - - - 0x002512 00:A502: A0 00     LDY #$00

loc_A504:
C D 1 - - - 0x002514 00:A504: A5 4B     LDA ram_004B
C - - - - - 0x002516 00:A506: C9 04     CMP #$04
C - - - - - 0x002518 00:A508: D0 21     BNE bra_A52B
C - - - - - 0x00251A 00:A50A: A5 FE     LDA ram_00FE
C - - - - - 0x00251C 00:A50C: F0 12     BEQ bra_A520
C - - - - - 0x00251E 00:A50E: A5 79     LDA ram_0079
C - - - - - 0x002520 00:A510: D0 07     BNE bra_A519

loc_A512:
C - - - - - 0x002522 00:A512: E6 2D     INC con_player_position_y
C - - - - - 0x002524 00:A514: E6 3D     INC ram_003D
C - - - - - 0x002526 00:A516: C6 3E     DEC ram_003E
C - - - - - 0x002528 00:A518: 60        RTS

bra_A519:
C - - - - - 0x002529 00:A519: C6 2D     DEC con_player_position_y
C - - - - - 0x00252B 00:A51B: E6 3E     INC ram_003E
C - - - - - 0x00252D 00:A51D: C6 3D     DEC ram_003D

bra_A51F_RTS:
C - - - - - 0x00252F 00:A51F: 60        RTS

bra_A520:
C - - - - - 0x002530 00:A520: A5 FF     LDA ram_00FF
C - - - - - 0x002532 00:A522: F0 FB     BEQ bra_A51F_RTS
- - - - - - 0x002534 00:A524: A5 E6     LDA ram_00E6
- - - - - - 0x002536 00:A526: D0 F1     BNE bra_A519
- - - - - - 0x002538 00:A528: 4C 12 A5  JMP loc_A512

bra_A52B:
C - - - - - 0x00253B 00:A52B: AA        TAX
C - - - - - 0x00253C 00:A52C: BD C5 8D  LDA tbl_8DC5_spr_no_fruit,X
C - - - - - 0x00253F 00:A52F: C5 16     CMP ram_0016
C - - - - - 0x002541 00:A531: B0 03     BCS bra_A536
C - - - - - 0x002543 00:A533: 4C 41 A6  JMP loc_A641

bra_A536:
C - - - - - 0x002546 00:A536: 98        TYA
C - - - - - 0x002547 00:A537: 0A        ASL
C - - - - - 0x002548 00:A538: 0A        ASL
C - - - - - 0x002549 00:A539: AA        TAX
C - - - - - 0x00254A 00:A53A: BD E0 02  LDA ram_02E0,X
C - - - - - 0x00254D 00:A53D: C9 F8     CMP #$F8
C - - - - - 0x00254F 00:A53F: D0 03     BNE bra_A544
C - - - - - 0x002551 00:A541: 4C CC A5  JMP loc_A5CC

bra_A544:
C - - - - - 0x002554 00:A544: 99 50 05  STA ram_0550,Y
C - - - - - 0x002557 00:A547: B9 50 05  LDA ram_0550,Y
C - - - - - 0x00255A 00:A54A: C9 E0     CMP #$E0
C - - - - - 0x00255C 00:A54C: F0 15     BEQ bra_A563
C - - - - - 0x00255E 00:A54E: C9 60     CMP #$60
C - - - - - 0x002560 00:A550: D0 20     BNE bra_A572
C - - - - - 0x002562 00:A552: 8A        TXA
C - - - - - 0x002563 00:A553: C9 10     CMP #$10
C - - - - - 0x002565 00:A555: B0 06     BCS bra_A55D
C - - - - - 0x002567 00:A557: A9 00     LDA #$00
C - - - - - 0x002569 00:A559: 85 79     STA ram_0079
C - - - - - 0x00256B 00:A55B: F0 15     BEQ bra_A572

bra_A55D:
- - - - - - 0x00256D 00:A55D: A9 00     LDA #$00
- - - - - - 0x00256F 00:A55F: 85 E6     STA ram_00E6
- - - - - - 0x002571 00:A561: F0 0F     BEQ bra_A572

bra_A563:
C - - - - - 0x002573 00:A563: 8A        TXA
C - - - - - 0x002574 00:A564: C9 10     CMP #$10
C - - - - - 0x002576 00:A566: B0 06     BCS bra_A56E
- - - - - - 0x002578 00:A568: A9 01     LDA #$01
- - - - - - 0x00257A 00:A56A: 85 79     STA ram_0079
- - - - - - 0x00257C 00:A56C: D0 04     BNE bra_A572

bra_A56E:
C - - - - - 0x00257E 00:A56E: A9 01     LDA #$01
C - - - - - 0x002580 00:A570: 85 E6     STA ram_00E6

bra_A572:
C - - - - - 0x002582 00:A572: 8A        TXA
C - - - - - 0x002583 00:A573: C9 10     CMP #$10
C - - - - - 0x002585 00:A575: B0 06     BCS bra_A57D
C - - - - - 0x002587 00:A577: A5 79     LDA ram_0079
C - - - - - 0x002589 00:A579: D0 11     BNE bra_A58C
C - - - - - 0x00258B 00:A57B: F0 04     BEQ bra_A581

bra_A57D:
C - - - - - 0x00258D 00:A57D: A5 E6     LDA ram_00E6
C - - - - - 0x00258F 00:A57F: D0 0B     BNE bra_A58C

bra_A581:
C - - - - - 0x002591 00:A581: B9 50 05  LDA ram_0550,Y
C - - - - - 0x002594 00:A584: 18        CLC
C - - - - - 0x002595 00:A585: 69 01     ADC #$01
C - - - - - 0x002597 00:A587: 99 50 05  STA ram_0550,Y
C - - - - - 0x00259A 00:A58A: D0 09     BNE bra_A595

bra_A58C:
C - - - - - 0x00259C 00:A58C: B9 50 05  LDA ram_0550,Y
C - - - - - 0x00259F 00:A58F: 38        SEC
C - - - - - 0x0025A0 00:A590: E9 01     SBC #$01
C - - - - - 0x0025A2 00:A592: 99 50 05  STA ram_0550,Y

bra_A595:
C - - - - - 0x0025A5 00:A595: A9 F8     LDA #$F8
C - - - - - 0x0025A7 00:A597: 9D E0 02  STA ram_02E0,X
C - - - - - 0x0025AA 00:A59A: C8        INY
C - - - - - 0x0025AB 00:A59B: BD E4 02  LDA ram_02E4,X
C - - - - - 0x0025AE 00:A59E: 99 50 05  STA ram_0550,Y
C - - - - - 0x0025B1 00:A5A1: 8A        TXA
C - - - - - 0x0025B2 00:A5A2: C9 10     CMP #$10
C - - - - - 0x0025B4 00:A5A4: B0 06     BCS bra_A5AC
C - - - - - 0x0025B6 00:A5A6: A5 79     LDA ram_0079
C - - - - - 0x0025B8 00:A5A8: D0 11     BNE bra_A5BB
C - - - - - 0x0025BA 00:A5AA: F0 04     BEQ bra_A5B0

bra_A5AC:
C - - - - - 0x0025BC 00:A5AC: A5 E6     LDA ram_00E6
C - - - - - 0x0025BE 00:A5AE: D0 0B     BNE bra_A5BB

bra_A5B0:
C - - - - - 0x0025C0 00:A5B0: B9 50 05  LDA ram_0550,Y
C - - - - - 0x0025C3 00:A5B3: 18        CLC
C - - - - - 0x0025C4 00:A5B4: 69 01     ADC #$01
C - - - - - 0x0025C6 00:A5B6: 99 50 05  STA ram_0550,Y
C - - - - - 0x0025C9 00:A5B9: D0 09     BNE bra_A5C4

bra_A5BB:
C - - - - - 0x0025CB 00:A5BB: B9 50 05  LDA ram_0550,Y
C - - - - - 0x0025CE 00:A5BE: 38        SEC
C - - - - - 0x0025CF 00:A5BF: E9 01     SBC #$01
C - - - - - 0x0025D1 00:A5C1: 99 50 05  STA ram_0550,Y

bra_A5C4:
C - - - - - 0x0025D4 00:A5C4: A9 F8     LDA #$F8
C - - - - - 0x0025D6 00:A5C6: 9D E4 02  STA ram_02E4,X
C - - - - - 0x0025D9 00:A5C9: 4C C3 A6  JMP loc_A6C3

loc_A5CC:
C D 1 - - - 0x0025DC 00:A5CC: B9 50 05  LDA ram_0550,Y
C - - - - - 0x0025DF 00:A5CF: C9 E0     CMP #$E0
C - - - - - 0x0025E1 00:A5D1: F0 15     BEQ bra_A5E8
C - - - - - 0x0025E3 00:A5D3: C9 60     CMP #$60
C - - - - - 0x0025E5 00:A5D5: D0 20     BNE bra_A5F7
C - - - - - 0x0025E7 00:A5D7: 8A        TXA
C - - - - - 0x0025E8 00:A5D8: C9 10     CMP #$10
C - - - - - 0x0025EA 00:A5DA: B0 06     BCS bra_A5E2
C - - - - - 0x0025EC 00:A5DC: A9 00     LDA #$00
C - - - - - 0x0025EE 00:A5DE: 85 79     STA ram_0079
C - - - - - 0x0025F0 00:A5E0: F0 15     BEQ bra_A5F7

bra_A5E2:
C - - - - - 0x0025F2 00:A5E2: A9 00     LDA #$00
C - - - - - 0x0025F4 00:A5E4: 85 E6     STA ram_00E6
C - - - - - 0x0025F6 00:A5E6: F0 0F     BEQ bra_A5F7

bra_A5E8:
C - - - - - 0x0025F8 00:A5E8: 8A        TXA
C - - - - - 0x0025F9 00:A5E9: C9 10     CMP #$10
C - - - - - 0x0025FB 00:A5EB: B0 06     BCS bra_A5F3
C - - - - - 0x0025FD 00:A5ED: A9 01     LDA #$01
C - - - - - 0x0025FF 00:A5EF: 85 79     STA ram_0079
C - - - - - 0x002601 00:A5F1: D0 04     BNE bra_A5F7

bra_A5F3:
C - - - - - 0x002603 00:A5F3: A9 01     LDA #$01
C - - - - - 0x002605 00:A5F5: 85 E6     STA ram_00E6
bra_A5F7:
C - - - - - 0x002607 00:A5F7: 8A        TXA
C - - - - - 0x002608 00:A5F8: C9 10     CMP #$10
C - - - - - 0x00260A 00:A5FA: B0 06     BCS bra_A602
C - - - - - 0x00260C 00:A5FC: A5 79     LDA ram_0079
C - - - - - 0x00260E 00:A5FE: D0 11     BNE bra_A611
C - - - - - 0x002610 00:A600: F0 04     BEQ bra_A606

bra_A602:
C - - - - - 0x002612 00:A602: A5 E6     LDA ram_00E6
C - - - - - 0x002614 00:A604: D0 0B     BNE bra_A611

bra_A606:
C - - - - - 0x002616 00:A606: B9 50 05  LDA ram_0550,Y
C - - - - - 0x002619 00:A609: 18        CLC
C - - - - - 0x00261A 00:A60A: 69 01     ADC #$01
C - - - - - 0x00261C 00:A60C: 99 50 05  STA ram_0550,Y
C - - - - - 0x00261F 00:A60F: D0 09     BNE bra_A61A

bra_A611:
C - - - - - 0x002621 00:A611: B9 50 05  LDA ram_0550,Y
C - - - - - 0x002624 00:A614: 38        SEC
C - - - - - 0x002625 00:A615: E9 01     SBC #$01
C - - - - - 0x002627 00:A617: 99 50 05  STA ram_0550,Y

bra_A61A:
C - - - - - 0x00262A 00:A61A: C8        INY
C - - - - - 0x00262B 00:A61B: 8A        TXA
C - - - - - 0x00262C 00:A61C: C9 10     CMP #$10
C - - - - - 0x00262E 00:A61E: B0 06     BCS bra_A626
C - - - - - 0x002630 00:A620: A5 79     LDA ram_0079
C - - - - - 0x002632 00:A622: D0 11     BNE bra_A635
C - - - - - 0x002634 00:A624: F0 04     BEQ bra_A62A

bra_A626:
C - - - - - 0x002636 00:A626: A5 E6     LDA ram_00E6
C - - - - - 0x002638 00:A628: D0 0B     BNE bra_A635

bra_A62A:
C - - - - - 0x00263A 00:A62A: B9 50 05  LDA ram_0550,Y
C - - - - - 0x00263D 00:A62D: 18        CLC
C - - - - - 0x00263E 00:A62E: 69 01     ADC #$01
C - - - - - 0x002640 00:A630: 99 50 05  STA ram_0550,Y
C - - - - - 0x002643 00:A633: D0 09     BNE bra_A63E

bra_A635:
C - - - - - 0x002645 00:A635: B9 50 05  LDA ram_0550,Y
C - - - - - 0x002648 00:A638: 38        SEC
C - - - - - 0x002649 00:A639: E9 01     SBC #$01
C - - - - - 0x00264B 00:A63B: 99 50 05  STA ram_0550,Y

bra_A63E:
C - - - - - 0x00264E 00:A63E: 4C C3 A6  JMP loc_A6C3

loc_A641:
C D 1 - - - 0x002651 00:A641: 98        TYA
C - - - - - 0x002652 00:A642: 0A        ASL
C - - - - - 0x002653 00:A643: 0A        ASL
C - - - - - 0x002654 00:A644: AA        TAX
C - - - - - 0x002655 00:A645: B9 50 05  LDA ram_0550,Y
C - - - - - 0x002658 00:A648: C9 E0     CMP #$E0
C - - - - - 0x00265A 00:A64A: F0 15     BEQ bra_A661
C - - - - - 0x00265C 00:A64C: C9 60     CMP #$60
C - - - - - 0x00265E 00:A64E: D0 20     BNE bra_A670
C - - - - - 0x002660 00:A650: 8A        TXA
C - - - - - 0x002661 00:A651: C9 10     CMP #$10
C - - - - - 0x002663 00:A653: B0 06     BCS bra_A65B
C - - - - - 0x002665 00:A655: A9 00     LDA #$00
C - - - - - 0x002667 00:A657: 85 79     STA ram_0079
C - - - - - 0x002669 00:A659: F0 15     BEQ bra_A670

bra_A65B:
C - - - - - 0x00266B 00:A65B: A9 00     LDA #$00
C - - - - - 0x00266D 00:A65D: 85 E6     STA ram_00E6
C - - - - - 0x00266F 00:A65F: F0 0F     BEQ bra_A670

bra_A661:
C - - - - - 0x002671 00:A661: 8A        TXA
C - - - - - 0x002672 00:A662: C9 10     CMP #$10
C - - - - - 0x002674 00:A664: B0 06     BCS bra_A66C
C - - - - - 0x002676 00:A666: A9 01     LDA #$01
C - - - - - 0x002678 00:A668: 85 79     STA ram_0079
C - - - - - 0x00267A 00:A66A: D0 04     BNE bra_A670

bra_A66C:
C - - - - - 0x00267C 00:A66C: A9 01     LDA #$01
C - - - - - 0x00267E 00:A66E: 85 E6     STA ram_00E6

bra_A670:
C - - - - - 0x002680 00:A670: 8A        TXA
C - - - - - 0x002681 00:A671: C9 10     CMP #$10
C - - - - - 0x002683 00:A673: B0 06     BCS bra_A67B
C - - - - - 0x002685 00:A675: A5 79     LDA ram_0079
C - - - - - 0x002687 00:A677: D0 14     BNE bra_A68D
C - - - - - 0x002689 00:A679: F0 04     BEQ bra_A67F

bra_A67B:
C - - - - - 0x00268B 00:A67B: A5 E6     LDA ram_00E6
C - - - - - 0x00268D 00:A67D: D0 0E     BNE bra_A68D

bra_A67F:
C - - - - - 0x00268F 00:A67F: B9 50 05  LDA ram_0550,Y
C - - - - - 0x002692 00:A682: 18        CLC
C - - - - - 0x002693 00:A683: 69 01     ADC #$01
C - - - - - 0x002695 00:A685: 99 50 05  STA ram_0550,Y
C - - - - - 0x002698 00:A688: 9D E0 02  STA ram_02E0,X
C - - - - - 0x00269B 00:A68B: D0 0C     BNE bra_A699

bra_A68D:
C - - - - - 0x00269D 00:A68D: B9 50 05  LDA ram_0550,Y
C - - - - - 0x0026A0 00:A690: 38        SEC
C - - - - - 0x0026A1 00:A691: E9 01     SBC #$01
C - - - - - 0x0026A3 00:A693: 99 50 05  STA ram_0550,Y
C - - - - - 0x0026A6 00:A696: 9D E0 02  STA ram_02E0,X

bra_A699:
C - - - - - 0x0026A9 00:A699: C8        INY
C - - - - - 0x0026AA 00:A69A: 8A        TXA
C - - - - - 0x0026AB 00:A69B: C9 10     CMP #$10
C - - - - - 0x0026AD 00:A69D: B0 06     BCS bra_A6A5
C - - - - - 0x0026AF 00:A69F: A5 79     LDA ram_0079
C - - - - - 0x0026B1 00:A6A1: D0 14     BNE bra_A6B7
C - - - - - 0x0026B3 00:A6A3: F0 04     BEQ bra_A6A9

bra_A6A5:
C - - - - - 0x0026B5 00:A6A5: A5 E6     LDA ram_00E6
C - - - - - 0x0026B7 00:A6A7: D0 0E     BNE bra_A6B7

bra_A6A9:
C - - - - - 0x0026B9 00:A6A9: B9 50 05  LDA ram_0550,Y
C - - - - - 0x0026BC 00:A6AC: 18        CLC
C - - - - - 0x0026BD 00:A6AD: 69 01     ADC #$01
C - - - - - 0x0026BF 00:A6AF: 99 50 05  STA ram_0550,Y
C - - - - - 0x0026C2 00:A6B2: 9D E4 02  STA ram_02E4,X
C - - - - - 0x0026C5 00:A6B5: D0 0C     BNE bra_A6C3

bra_A6B7:
C - - - - - 0x0026C7 00:A6B7: B9 50 05  LDA ram_0550,Y
C - - - - - 0x0026CA 00:A6BA: 38        SEC
C - - - - - 0x0026CB 00:A6BB: E9 01     SBC #$01
C - - - - - 0x0026CD 00:A6BD: 99 50 05  STA ram_0550,Y
C - - - - - 0x0026D0 00:A6C0: 9D E4 02  STA ram_02E4,X

bra_A6C3:
loc_A6C3:
C D 1 - - - 0x0026D3 00:A6C3: A5 4B     LDA ram_004B
C - - - - - 0x0026D5 00:A6C5: 29 01     AND #$01
C - - - - - 0x0026D7 00:A6C7: D0 37     BNE bra_A700
C - - - - - 0x0026D9 00:A6C9: 8A        TXA
C - - - - - 0x0026DA 00:A6CA: C9 10     CMP #$10
C - - - - - 0x0026DC 00:A6CC: B0 06     BCS bra_A6D4
C - - - - - 0x0026DE 00:A6CE: A5 79     LDA ram_0079
C - - - - - 0x0026E0 00:A6D0: D0 18     BNE bra_A6EA
C - - - - - 0x0026E2 00:A6D2: F0 04     BEQ bra_A6D8

bra_A6D4:
C - - - - - 0x0026E4 00:A6D4: A5 E6     LDA ram_00E6
C - - - - - 0x0026E6 00:A6D6: D0 12     BNE bra_A6EA
bra_A6D8:
C - - - - - 0x0026E8 00:A6D8: A5 4B     LDA ram_004B
C - - - - - 0x0026EA 00:A6DA: 0A        ASL
C - - - - - 0x0026EB 00:A6DB: 0A        ASL
C - - - - - 0x0026EC 00:A6DC: 0A        ASL
C - - - - - 0x0026ED 00:A6DD: AA        TAX
C - - - - - 0x0026EE 00:A6DE: A9 1C     LDA #$1C
C - - - - - 0x0026F0 00:A6E0: 9D E1 02  STA ram_02E1,X
C - - - - - 0x0026F3 00:A6E3: A9 27     LDA #$27
C - - - - - 0x0026F5 00:A6E5: 9D E5 02  STA ram_02E5,X
C - - - - - 0x0026F8 00:A6E8: D0 10     BNE bra_A6FA

bra_A6EA:
C - - - - - 0x0026FA 00:A6EA: A5 4B     LDA ram_004B
C - - - - - 0x0026FC 00:A6EC: 0A        ASL
C - - - - - 0x0026FD 00:A6ED: 0A        ASL
C - - - - - 0x0026FE 00:A6EE: 0A        ASL
C - - - - - 0x0026FF 00:A6EF: AA        TAX
C - - - - - 0x002700 00:A6F0: A9 76     LDA #$76
C - - - - - 0x002702 00:A6F2: 9D E1 02  STA ram_02E1,X
C - - - - - 0x002705 00:A6F5: A9 2C     LDA #$2C
C - - - - - 0x002707 00:A6F7: 9D E5 02  STA ram_02E5,X

bra_A6FA:
C - - - - - 0x00270A 00:A6FA: C8        INY
C - - - - - 0x00270B 00:A6FB: E6 4B     INC ram_004B
C - - - - - 0x00270D 00:A6FD: 4C 04 A5  JMP loc_A504

bra_A700:
C - - - - - 0x002710 00:A700: 8A        TXA
C - - - - - 0x002711 00:A701: C9 10     CMP #$10
C - - - - - 0x002713 00:A703: B0 06     BCS bra_A70B
C - - - - - 0x002715 00:A705: A5 79     LDA ram_0079
C - - - - - 0x002717 00:A707: D0 18     BNE bra_A721
C - - - - - 0x002719 00:A709: F0 04     BEQ bra_A70F

bra_A70B:
C - - - - - 0x00271B 00:A70B: A5 E6     LDA ram_00E6
C - - - - - 0x00271D 00:A70D: D0 12     BNE bra_A721

bra_A70F:
C - - - - - 0x00271F 00:A70F: A5 4B     LDA ram_004B
C - - - - - 0x002721 00:A711: 0A        ASL
C - - - - - 0x002722 00:A712: 0A        ASL
C - - - - - 0x002723 00:A713: 0A        ASL
C - - - - - 0x002724 00:A714: AA        TAX
C - - - - - 0x002725 00:A715: A9 1B     LDA #$1B
C - - - - - 0x002727 00:A717: 9D E1 02  STA ram_02E1,X
C - - - - - 0x00272A 00:A71A: A9 28     LDA #$28
C - - - - - 0x00272C 00:A71C: 9D E5 02  STA ram_02E5,X
C - - - - - 0x00272F 00:A71F: D0 10     BNE bra_A731

bra_A721:
C - - - - - 0x002731 00:A721: A5 4B     LDA ram_004B
C - - - - - 0x002733 00:A723: 0A        ASL
C - - - - - 0x002734 00:A724: 0A        ASL
C - - - - - 0x002735 00:A725: 0A        ASL
C - - - - - 0x002736 00:A726: AA        TAX
C - - - - - 0x002737 00:A727: A9 75     LDA #$75
C - - - - - 0x002739 00:A729: 9D E1 02  STA ram_02E1,X
C - - - - - 0x00273C 00:A72C: A9 2B     LDA #$2B
C - - - - - 0x00273E 00:A72E: 9D E5 02  STA ram_02E5,X

bra_A731:
C - - - - - 0x002741 00:A731: C8        INY
C - - - - - 0x002742 00:A732: E6 4B     INC ram_004B
C - - - - - 0x002744 00:A734: 4C 04 A5  JMP loc_A504

sub_A737:
C - - - - - 0x002747 00:A737: A5 4E     LDA ram_004E
C - - - - - 0x002749 00:A739: 18        CLC
C - - - - - 0x00274A 00:A73A: 69 08     ADC #$08
C - - - - - 0x00274C 00:A73C: 85 BC     STA ram_00BC
C - - - - - 0x00274E 00:A73E: A5 4D     LDA ram_004D
C - - - - - 0x002750 00:A740: 18        CLC
C - - - - - 0x002751 00:A741: 69 08     ADC #$08
C - - - - - 0x002753 00:A743: 85 BD     STA ram_00BD
C - - - - - 0x002755 00:A745: A5 AA     LDA ram_00AA
C - - - - - 0x002757 00:A747: D0 51     BNE bra_A79A
C - - - - - 0x002759 00:A749: A5 60     LDA ram_0060
C - - - - - 0x00275B 00:A74B: 18        CLC
C - - - - - 0x00275C 00:A74C: 69 08     ADC #$08
C - - - - - 0x00275E 00:A74E: 85 C6     STA ram_00C6
C - - - - - 0x002760 00:A750: A5 64     LDA ram_0064
C - - - - - 0x002762 00:A752: 18        CLC
C - - - - - 0x002763 00:A753: 69 08     ADC #$08
C - - - - - 0x002765 00:A755: 85 C7     STA ram_00C7
C - - - - - 0x002767 00:A757: A5 BC     LDA ram_00BC
C - - - - - 0x002769 00:A759: C5 C6     CMP ram_00C6
C - - - - - 0x00276B 00:A75B: B0 0B     BCS bra_A768
C - - - - - 0x00276D 00:A75D: A5 C6     LDA ram_00C6
C - - - - - 0x00276F 00:A75F: 38        SEC
C - - - - - 0x002770 00:A760: E5 BC     SBC ram_00BC
C - - - - - 0x002772 00:A762: C9 08     CMP #$08
C - - - - - 0x002774 00:A764: 90 0E     BCC bra_A774
C - - - - - 0x002776 00:A766: B0 32     BCS bra_A79A

bra_A768:
C - - - - - 0x002778 00:A768: A5 BC     LDA ram_00BC
C - - - - - 0x00277A 00:A76A: 38        SEC
C - - - - - 0x00277B 00:A76B: E5 C6     SBC ram_00C6
C - - - - - 0x00277D 00:A76D: C9 08     CMP #$08
C - - - - - 0x00277F 00:A76F: 90 03     BCC bra_A774
C - - - - - 0x002781 00:A771: 4C 9A A7  JMP loc_A79A

bra_A774:
C - - - - - 0x002784 00:A774: A5 BD     LDA ram_00BD
C - - - - - 0x002786 00:A776: C5 C7     CMP ram_00C7
C - - - - - 0x002788 00:A778: B0 0B     BCS bra_A785
C - - - - - 0x00278A 00:A77A: A5 C7     LDA ram_00C7
C - - - - - 0x00278C 00:A77C: 38        SEC
C - - - - - 0x00278D 00:A77D: E5 BD     SBC ram_00BD
C - - - - - 0x00278F 00:A77F: C9 08     CMP #$08
C - - - - - 0x002791 00:A781: 90 0E     BCC bra_A791
C - - - - - 0x002793 00:A783: B0 15     BCS bra_A79A

bra_A785:
C - - - - - 0x002795 00:A785: A5 BD     LDA ram_00BD
C - - - - - 0x002797 00:A787: 38        SEC
C - - - - - 0x002798 00:A788: E5 C7     SBC ram_00C7
C - - - - - 0x00279A 00:A78A: C9 08     CMP #$08
C - - - - - 0x00279C 00:A78C: 90 03     BCC bra_A791
C - - - - - 0x00279E 00:A78E: 4C 9A A7  JMP loc_A79A

bra_A791:
C - - - - - 0x0027A1 00:A791: A9 01     LDA #$01
C - - - - - 0x0027A3 00:A793: 85 AA     STA ram_00AA
C - - - - - 0x0027A5 00:A795: A2 10     LDX #$10
C - - - - - 0x0027A7 00:A797: 4C 4C A8  JMP loc_A84C

bra_A79A:
loc_A79A:
C D 1 - - - 0x0027AA 00:A79A: A5 AB     LDA ram_00AB
C - - - - - 0x0027AC 00:A79C: D0 5A     BNE bra_A7F8
C - - - - - 0x0027AE 00:A79E: A5 61     LDA ram_0061
C - - - - - 0x0027B0 00:A7A0: 18        CLC
C - - - - - 0x0027B1 00:A7A1: 69 08     ADC #$08
C - - - - - 0x0027B3 00:A7A3: 85 C6     STA ram_00C6
C - - - - - 0x0027B5 00:A7A5: A5 65     LDA ram_0065
C - - - - - 0x0027B7 00:A7A7: 18        CLC
C - - - - - 0x0027B8 00:A7A8: 69 08     ADC #$08
C - - - - - 0x0027BA 00:A7AA: 85 C7     STA ram_00C7
C - - - - - 0x0027BC 00:A7AC: A5 BC     LDA ram_00BC
C - - - - - 0x0027BE 00:A7AE: C5 C6     CMP ram_00C6
C - - - - - 0x0027C0 00:A7B0: B0 0E     BCS bra_A7C0
C - - - - - 0x0027C2 00:A7B2: A5 C6     LDA ram_00C6
C - - - - - 0x0027C4 00:A7B4: 38        SEC
C - - - - - 0x0027C5 00:A7B5: E5 BC     SBC ram_00BC
C - - - - - 0x0027C7 00:A7B7: C9 08     CMP #$08
C - - - - - 0x0027C9 00:A7B9: F0 13     BEQ bra_A7CE
C - - - - - 0x0027CB 00:A7BB: 90 11     BCC bra_A7CE
C - - - - - 0x0027CD 00:A7BD: 4C F8 A7  JMP loc_A7F8

bra_A7C0:
C - - - - - 0x0027D0 00:A7C0: A5 BC     LDA ram_00BC
C - - - - - 0x0027D2 00:A7C2: 38        SEC
C - - - - - 0x0027D3 00:A7C3: E5 C6     SBC ram_00C6
C - - - - - 0x0027D5 00:A7C5: C9 08     CMP #$08
C - - - - - 0x0027D7 00:A7C7: F0 05     BEQ bra_A7CE
C - - - - - 0x0027D9 00:A7C9: 90 03     BCC bra_A7CE
C - - - - - 0x0027DB 00:A7CB: 4C F8 A7  JMP loc_A7F8

bra_A7CE:
C - - - - - 0x0027DE 00:A7CE: A5 BD     LDA ram_00BD
C - - - - - 0x0027E0 00:A7D0: C5 C7     CMP ram_00C7
C - - - - - 0x0027E2 00:A7D2: B0 0E     BCS bra_A7E2
C - - - - - 0x0027E4 00:A7D4: A5 C7     LDA ram_00C7
C - - - - - 0x0027E6 00:A7D6: 38        SEC
C - - - - - 0x0027E7 00:A7D7: E5 BD     SBC ram_00BD
C - - - - - 0x0027E9 00:A7D9: C9 08     CMP #$08
C - - - - - 0x0027EB 00:A7DB: F0 13     BEQ bra_A7F0
C - - - - - 0x0027ED 00:A7DD: 90 11     BCC bra_A7F0
C - - - - - 0x0027EF 00:A7DF: 4C F8 A7  JMP loc_A7F8

bra_A7E2:
C - - - - - 0x0027F2 00:A7E2: A5 BD     LDA ram_00BD
C - - - - - 0x0027F4 00:A7E4: 38        SEC
C - - - - - 0x0027F5 00:A7E5: E5 C7     SBC ram_00C7
C - - - - - 0x0027F7 00:A7E7: C9 08     CMP #$08
C - - - - - 0x0027F9 00:A7E9: F0 05     BEQ bra_A7F0
C - - - - - 0x0027FB 00:A7EB: 90 03     BCC bra_A7F0
C - - - - - 0x0027FD 00:A7ED: 4C F8 A7  JMP loc_A7F8

bra_A7F0:
C - - - - - 0x002800 00:A7F0: A9 01     LDA #$01
C - - - - - 0x002802 00:A7F2: 85 AB     STA ram_00AB
C - - - - - 0x002804 00:A7F4: A2 20     LDX #$20
C - - - - - 0x002806 00:A7F6: D0 54     BNE bra_A84C

bra_A7F8:
loc_A7F8:
C D 1 - - - 0x002808 00:A7F8: A5 AC     LDA ram_00AC
C - - - - - 0x00280A 00:A7FA: D0 1F     BNE bra_A81B_RTS
C - - - - - 0x00280C 00:A7FC: A5 62     LDA ram_0062
C - - - - - 0x00280E 00:A7FE: 18        CLC
C - - - - - 0x00280F 00:A7FF: 69 08     ADC #$08
C - - - - - 0x002811 00:A801: 85 C6     STA ram_00C6
C - - - - - 0x002813 00:A803: A5 66     LDA ram_0066
C - - - - - 0x002815 00:A805: 18        CLC
C - - - - - 0x002816 00:A806: 69 08     ADC #$08
C - - - - - 0x002818 00:A808: 85 C7     STA ram_00C7
C - - - - - 0x00281A 00:A80A: A5 BC     LDA ram_00BC
C - - - - - 0x00281C 00:A80C: C5 C6     CMP ram_00C6
C - - - - - 0x00281E 00:A80E: B0 0C     BCS bra_A81C
C - - - - - 0x002820 00:A810: A5 C6     LDA ram_00C6
C - - - - - 0x002822 00:A812: 38        SEC
C - - - - - 0x002823 00:A813: E5 BC     SBC ram_00BC
C - - - - - 0x002825 00:A815: C9 08     CMP #$08
C - - - - - 0x002827 00:A817: F0 0F     BEQ bra_A828
C - - - - - 0x002829 00:A819: 90 0D     BCC bra_A828

bra_A81B_RTS:
C - - - - - 0x00282B 00:A81B: 60        RTS

bra_A81C:
C - - - - - 0x00282C 00:A81C: A5 BC     LDA ram_00BC
C - - - - - 0x00282E 00:A81E: 38        SEC
C - - - - - 0x00282F 00:A81F: E5 C6     SBC ram_00C6
C - - - - - 0x002831 00:A821: C9 08     CMP #$08
C - - - - - 0x002833 00:A823: F0 03     BEQ bra_A828
C - - - - - 0x002835 00:A825: 90 01     BCC bra_A828
C - - - - - 0x002837 00:A827: 60        RTS

bra_A828:
C - - - - - 0x002838 00:A828: A5 BD     LDA ram_00BD
C - - - - - 0x00283A 00:A82A: C5 C7     CMP ram_00C7
C - - - - - 0x00283C 00:A82C: B0 0C     BCS bra_A83A
C - - - - - 0x00283E 00:A82E: A5 C7     LDA ram_00C7
C - - - - - 0x002840 00:A830: 38        SEC
C - - - - - 0x002841 00:A831: E5 BD     SBC ram_00BD
C - - - - - 0x002843 00:A833: C9 08     CMP #$08
C - - - - - 0x002845 00:A835: F0 0F     BEQ bra_A846
C - - - - - 0x002847 00:A837: 90 0D     BCC bra_A846
C - - - - - 0x002849 00:A839: 60        RTS

bra_A83A:
C - - - - - 0x00284A 00:A83A: A5 BD     LDA ram_00BD
C - - - - - 0x00284C 00:A83C: 38        SEC
C - - - - - 0x00284D 00:A83D: E5 C7     SBC ram_00C7
C - - - - - 0x00284F 00:A83F: C9 08     CMP #$08
C - - - - - 0x002851 00:A841: F0 03     BEQ bra_A846
C - - - - - 0x002853 00:A843: 90 01     BCC bra_A846
C - - - - - 0x002855 00:A845: 60        RTS

bra_A846:
C - - - - - 0x002856 00:A846: A9 01     LDA #$01
C - - - - - 0x002858 00:A848: 85 AC     STA ram_00AC
C - - - - - 0x00285A 00:A84A: A2 30     LDX #$30

bra_A84C:
loc_A84C:
C D 1 - - - 0x00285C 00:A84C: A9 F8     LDA #$F8
C - - - - - 0x00285E 00:A84E: 8D 43 06  STA ram_0643
C - - - - - 0x002861 00:A851: 85 BE     STA ram_00BE

sub_A853:
C - - - - - 0x002863 00:A853: A9 F8     LDA #$F8
C - - - - - 0x002865 00:A855: 9D 00 02  STA ram_0200,X
C - - - - - 0x002868 00:A858: 9D 04 02  STA ram_0204,X
C - - - - - 0x00286B 00:A85B: 9D 08 02  STA ram_0208,X
C - - - - - 0x00286E 00:A85E: 9D 0C 02  STA ram_020C,X
C - - - - - 0x002871 00:A861: 60        RTS

sub_A862:
C - - - - - 0x002872 00:A862: A5 56     LDA con_player_is_facing_right
C - - - - - 0x002874 00:A864: D0 03     BNE bra_A869
C - - - - - 0x002876 00:A866: 4C 7E A9  JMP loc_A97E

bra_A869:
C - - - - - 0x002879 00:A869: A5 A6     LDA ram_00A6
C - - - - - 0x00287B 00:A86B: F0 03     BEQ bra_A870
C - - - - - 0x00287D 00:A86D: 4C F4 A8  JMP loc_A8F4

bra_A870:
C - - - - - 0x002880 00:A870: A5 A0     LDA ram_00A0
C - - - - - 0x002882 00:A872: C9 10     CMP #$10
C - - - - - 0x002884 00:A874: D0 05     BNE bra_A87B
C - - - - - 0x002886 00:A876: A9 01     LDA #$01
C - - - - - 0x002888 00:A878: 85 A6     STA ram_00A6
C - - - - - 0x00288A 00:A87A: 60        RTS

bra_A87B:
C - - - - - 0x00288B 00:A87B: A9 01     LDA #$01
C - - - - - 0x00288D 00:A87D: 85 41     STA ram_0041
C - - - - - 0x00288F 00:A87F: 85 1C     STA ram_001C
C - - - - - 0x002891 00:A881: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002894 00:A884: A5 38     LDA ram_0038
C - - - - - 0x002896 00:A886: F0 05     BEQ bra_A88D
C - - - - - 0x002898 00:A888: A9 01     LDA #$01
C - - - - - 0x00289A 00:A88A: 85 A6     STA ram_00A6
C - - - - - 0x00289C 00:A88C: 60        RTS

bra_A88D:
C - - - - - 0x00289D 00:A88D: A5 2C     LDA con_player_position_x
C - - - - - 0x00289F 00:A88F: C9 F0     CMP #$F0
C - - - - - 0x0028A1 00:A891: D0 07     BNE bra_A89A
- - - - - - 0x0028A3 00:A893: A9 01     LDA #$01
- - - - - - 0x0028A5 00:A895: 85 A6     STA ram_00A6
- - - - - - 0x0028A7 00:A897: 85 A5     STA ram_00A5
- - - - - - 0x0028A9 00:A899: 60        RTS

bra_A89A:
C - - - - - 0x0028AA 00:A89A: C9 80     CMP #$80
C - - - - - 0x0028AC 00:A89C: D0 1D     BNE bra_A8BB
C - - - - - 0x0028AE 00:A89E: AD 20 03  LDA ram_0320
C - - - - - 0x0028B1 00:A8A1: D0 18     BNE bra_A8BB
C - - - - - 0x0028B3 00:A8A3: A5 16     LDA ram_0016
C - - - - - 0x0028B5 00:A8A5: C9 FF     CMP #$FF
C - - - - - 0x0028B7 00:A8A7: F0 12     BEQ bra_A8BB
C - - - - - 0x0028B9 00:A8A9: E6 16     INC ram_0016
C - - - - - 0x0028BB 00:A8AB: C6 60     DEC ram_0060
C - - - - - 0x0028BD 00:A8AD: C6 61     DEC ram_0061
C - - - - - 0x0028BF 00:A8AF: C6 62     DEC ram_0062
C - - - - - 0x0028C1 00:A8B1: A9 00     LDA #$00
C - - - - - 0x0028C3 00:A8B3: 85 74     STA ram_0074
C - - - - - 0x0028C5 00:A8B5: A9 01     LDA #$01
C - - - - - 0x0028C7 00:A8B7: 85 73     STA ram_0073
C - - - - - 0x0028C9 00:A8B9: D0 06     BNE bra_A8C1

bra_A8BB:
C - - - - - 0x0028CB 00:A8BB: E6 2C     INC con_player_position_x
C - - - - - 0x0028CD 00:A8BD: A9 00     LDA #$00
C - - - - - 0x0028CF 00:A8BF: 85 73     STA ram_0073

bra_A8C1:
C - - - - - 0x0028D1 00:A8C1: C6 2D     DEC con_player_position_y
C - - - - - 0x0028D3 00:A8C3: C6 2D     DEC con_player_position_y
C - - - - - 0x0028D5 00:A8C5: E6 E7     INC ram_00E7
C - - - - - 0x0028D7 00:A8C7: E6 E7     INC ram_00E7
C - - - - - 0x0028D9 00:A8C9: E6 A0     INC ram_00A0
C - - - - - 0x0028DB 00:A8CB: E6 A7     INC ram_00A7

loc_A8CD:
C D 1 - - - 0x0028DD 00:A8CD: A5 2C     LDA con_player_position_x
C - - - - - 0x0028DF 00:A8CF: 8D 03 02  STA ram_0203
C - - - - - 0x0028E2 00:A8D2: 8D 07 02  STA ram_0207
C - - - - - 0x0028E5 00:A8D5: A5 2D     LDA con_player_position_y
C - - - - - 0x0028E7 00:A8D7: 8D 00 02  STA ram_0200
C - - - - - 0x0028EA 00:A8DA: 8D 08 02  STA ram_0208
C - - - - - 0x0028ED 00:A8DD: A5 2C     LDA con_player_position_x
C - - - - - 0x0028EF 00:A8DF: 18        CLC
C - - - - - 0x0028F0 00:A8E0: 69 08     ADC #$08
C - - - - - 0x0028F2 00:A8E2: 8D 0B 02  STA ram_020B
C - - - - - 0x0028F5 00:A8E5: 8D 0F 02  STA ram_020F
C - - - - - 0x0028F8 00:A8E8: A5 2D     LDA con_player_position_y
C - - - - - 0x0028FA 00:A8EA: 18        CLC
C - - - - - 0x0028FB 00:A8EB: 69 08     ADC #$08
C - - - - - 0x0028FD 00:A8ED: 8D 04 02  STA ram_0204
C - - - - - 0x002900 00:A8F0: 8D 0C 02  STA ram_020C
C - - - - - 0x002903 00:A8F3: 60        RTS

loc_A8F4:
C D 1 - - - 0x002904 00:A8F4: A5 38     LDA ram_0038
C - - - - - 0x002906 00:A8F6: D0 04     BNE bra_A8FC
C - - - - - 0x002908 00:A8F8: A5 A5     LDA ram_00A5
C - - - - - 0x00290A 00:A8FA: F0 2D     BEQ bra_A929

bra_A8FC:
C - - - - - 0x00290C 00:A8FC: A5 A7     LDA ram_00A7
C - - - - - 0x00290E 00:A8FE: C9 10     CMP #$10
C - - - - - 0x002910 00:A900: 90 1A     BCC bra_A91C
C - - - - - 0x002912 00:A902: A5 E8     LDA ram_00E8
C - - - - - 0x002914 00:A904: D0 16     BNE bra_A91C
C - - - - - 0x002916 00:A906: A9 01     LDA #$01
C - - - - - 0x002918 00:A908: 85 E8     STA ram_00E8
C - - - - - 0x00291A 00:A90A: 85 41     STA ram_0041
C - - - - - 0x00291C 00:A90C: A9 04     LDA #$04
C - - - - - 0x00291E 00:A90E: 85 1C     STA ram_001C
C - - - - - 0x002920 00:A910: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002923 00:A913: A5 38     LDA ram_0038
C - - - - - 0x002925 00:A915: F0 05     BEQ bra_A91C
- - - - - - 0x002927 00:A917: A9 00     LDA #$00
- - - - - - 0x002929 00:A919: 85 A0     STA ram_00A0
- - - - - - 0x00292B 00:A91B: 60        RTS

bra_A91C:
C - - - - - 0x00292C 00:A91C: E6 2D     INC con_player_position_y
C - - - - - 0x00292E 00:A91E: E6 2D     INC con_player_position_y
C - - - - - 0x002930 00:A920: C6 E7     DEC ram_00E7
C - - - - - 0x002932 00:A922: C6 E7     DEC ram_00E7
C - - - - - 0x002934 00:A924: C6 A0     DEC ram_00A0
C - - - - - 0x002936 00:A926: 4C CD A8  JMP loc_A8CD

bra_A929:
C - - - - - 0x002939 00:A929: A9 01     LDA #$01
C - - - - - 0x00293B 00:A92B: 85 41     STA ram_0041
C - - - - - 0x00293D 00:A92D: 85 1C     STA ram_001C
C - - - - - 0x00293F 00:A92F: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002942 00:A932: A5 38     LDA ram_0038
C - - - - - 0x002944 00:A934: F0 05     BEQ bra_A93B
C - - - - - 0x002946 00:A936: A9 01     LDA #$01
C - - - - - 0x002948 00:A938: 85 A6     STA ram_00A6
C - - - - - 0x00294A 00:A93A: 60        RTS

bra_A93B:
C - - - - - 0x00294B 00:A93B: A5 2C     LDA con_player_position_x
C - - - - - 0x00294D 00:A93D: C9 C0     CMP #$C0
C - - - - - 0x00294F 00:A93F: D0 07     BNE bra_A948
- - - - - - 0x002951 00:A941: A9 01     LDA #$01
- - - - - - 0x002953 00:A943: 85 A6     STA ram_00A6
- - - - - - 0x002955 00:A945: 85 A5     STA ram_00A5
- - - - - - 0x002957 00:A947: 60        RTS

bra_A948:
C - - - - - 0x002958 00:A948: C9 80     CMP #$80
C - - - - - 0x00295A 00:A94A: D0 1D     BNE bra_A969
C - - - - - 0x00295C 00:A94C: AD 20 03  LDA ram_0320
C - - - - - 0x00295F 00:A94F: D0 18     BNE bra_A969
C - - - - - 0x002961 00:A951: A5 16     LDA ram_0016
C - - - - - 0x002963 00:A953: C9 FF     CMP #$FF
C - - - - - 0x002965 00:A955: F0 12     BEQ bra_A969
C - - - - - 0x002967 00:A957: E6 16     INC ram_0016
C - - - - - 0x002969 00:A959: C6 60     DEC ram_0060
C - - - - - 0x00296B 00:A95B: C6 61     DEC ram_0061
C - - - - - 0x00296D 00:A95D: C6 62     DEC ram_0062
C - - - - - 0x00296F 00:A95F: A9 00     LDA #$00
C - - - - - 0x002971 00:A961: 85 74     STA ram_0074
C - - - - - 0x002973 00:A963: A9 01     LDA #$01
C - - - - - 0x002975 00:A965: 85 73     STA ram_0073
C - - - - - 0x002977 00:A967: D0 06     BNE bra_A96F

bra_A969:
C - - - - - 0x002979 00:A969: E6 2C     INC con_player_position_x
C - - - - - 0x00297B 00:A96B: A9 00     LDA #$00
C - - - - - 0x00297D 00:A96D: 85 73     STA ram_0073

bra_A96F:
C - - - - - 0x00297F 00:A96F: E6 2D     INC con_player_position_y
C - - - - - 0x002981 00:A971: E6 2D     INC con_player_position_y
C - - - - - 0x002983 00:A973: C6 E7     DEC ram_00E7
C - - - - - 0x002985 00:A975: C6 E7     DEC ram_00E7
C - - - - - 0x002987 00:A977: C6 A0     DEC ram_00A0
C - - - - - 0x002989 00:A979: E6 A7     INC ram_00A7
C - - - - - 0x00298B 00:A97B: 4C CD A8  JMP loc_A8CD

loc_A97E:
C D 1 - - - 0x00298E 00:A97E: A5 55     LDA con_player_is_facing_left
C - - - - - 0x002990 00:A980: D0 03     BNE bra_A985
C - - - - - 0x002992 00:A982: 4C 77 AA  JMP loc_AA77

bra_A985:
C - - - - - 0x002995 00:A985: A5 A6     LDA ram_00A6
C - - - - - 0x002997 00:A987: D0 62     BNE bra_A9EB
C - - - - - 0x002999 00:A989: A5 A0     LDA ram_00A0
C - - - - - 0x00299B 00:A98B: C9 10     CMP #$10
C - - - - - 0x00299D 00:A98D: D0 05     BNE bra_A994
C - - - - - 0x00299F 00:A98F: A9 01     LDA #$01
C - - - - - 0x0029A1 00:A991: 85 A6     STA ram_00A6
C - - - - - 0x0029A3 00:A993: 60        RTS

bra_A994:
C - - - - - 0x0029A4 00:A994: A9 01     LDA #$01
C - - - - - 0x0029A6 00:A996: 85 41     STA ram_0041
C - - - - - 0x0029A8 00:A998: A9 02     LDA #$02
C - - - - - 0x0029AA 00:A99A: 85 1C     STA ram_001C
C - - - - - 0x0029AC 00:A99C: 20 EC B6  JSR sub_B6EC
C - - - - - 0x0029AF 00:A99F: A5 38     LDA ram_0038
C - - - - - 0x0029B1 00:A9A1: F0 05     BEQ bra_A9A8
C - - - - - 0x0029B3 00:A9A3: A9 01     LDA #$01
C - - - - - 0x0029B5 00:A9A5: 85 A6     STA ram_00A6
C - - - - - 0x0029B7 00:A9A7: 60        RTS

bra_A9A8:
C - - - - - 0x0029B8 00:A9A8: A5 2C     LDA con_player_position_x
C - - - - - 0x0029BA 00:A9AA: C9 00     CMP #$00
C - - - - - 0x0029BC 00:A9AC: D0 07     BNE bra_A9B5
- - - - - - 0x0029BE 00:A9AE: A9 01     LDA #$01
- - - - - - 0x0029C0 00:A9B0: 85 A6     STA ram_00A6
- - - - - - 0x0029C2 00:A9B2: 85 A5     STA ram_00A5
- - - - - - 0x0029C4 00:A9B4: 60        RTS

bra_A9B5:
C - - - - - 0x0029C5 00:A9B5: C9 80     CMP #$80
C - - - - - 0x0029C7 00:A9B7: D0 1D     BNE bra_A9D6
C - - - - - 0x0029C9 00:A9B9: AD 20 03  LDA ram_0320
C - - - - - 0x0029CC 00:A9BC: D0 18     BNE bra_A9D6
C - - - - - 0x0029CE 00:A9BE: A5 16     LDA ram_0016
C - - - - - 0x0029D0 00:A9C0: C9 00     CMP #$00
C - - - - - 0x0029D2 00:A9C2: F0 12     BEQ bra_A9D6
C - - - - - 0x0029D4 00:A9C4: C6 16     DEC ram_0016
C - - - - - 0x0029D6 00:A9C6: E6 60     INC ram_0060
C - - - - - 0x0029D8 00:A9C8: E6 61     INC ram_0061
C - - - - - 0x0029DA 00:A9CA: E6 62     INC ram_0062
C - - - - - 0x0029DC 00:A9CC: A9 01     LDA #$01
C - - - - - 0x0029DE 00:A9CE: 85 74     STA ram_0074
C - - - - - 0x0029E0 00:A9D0: A9 00     LDA #$00
C - - - - - 0x0029E2 00:A9D2: 85 73     STA ram_0073
C - - - - - 0x0029E4 00:A9D4: F0 06     BEQ bra_A9DC

bra_A9D6:
C - - - - - 0x0029E6 00:A9D6: C6 2C     DEC con_player_position_x
C - - - - - 0x0029E8 00:A9D8: A9 00     LDA #$00
C - - - - - 0x0029EA 00:A9DA: 85 74     STA ram_0074

bra_A9DC:
C - - - - - 0x0029EC 00:A9DC: C6 2D     DEC con_player_position_y
C - - - - - 0x0029EE 00:A9DE: C6 2D     DEC con_player_position_y
C - - - - - 0x0029F0 00:A9E0: E6 E7     INC ram_00E7
C - - - - - 0x0029F2 00:A9E2: E6 E7     INC ram_00E7
C - - - - - 0x0029F4 00:A9E4: E6 A0     INC ram_00A0
C - - - - - 0x0029F6 00:A9E6: E6 A7     INC ram_00A7
C - - - - - 0x0029F8 00:A9E8: 4C CD A8  JMP loc_A8CD

bra_A9EB:
C - - - - - 0x0029FB 00:A9EB: A5 38     LDA ram_0038
C - - - - - 0x0029FD 00:A9ED: D0 04     BNE bra_A9F3
C - - - - - 0x0029FF 00:A9EF: A5 A5     LDA ram_00A5
C - - - - - 0x002A01 00:A9F1: F0 2D     BEQ bra_AA20

bra_A9F3:
C - - - - - 0x002A03 00:A9F3: A5 A7     LDA ram_00A7
C - - - - - 0x002A05 00:A9F5: C9 10     CMP #$10
C - - - - - 0x002A07 00:A9F7: 90 1A     BCC bra_AA13
C - - - - - 0x002A09 00:A9F9: A5 E8     LDA ram_00E8
C - - - - - 0x002A0B 00:A9FB: D0 16     BNE bra_AA13
C - - - - - 0x002A0D 00:A9FD: A9 01     LDA #$01
C - - - - - 0x002A0F 00:A9FF: 85 E8     STA ram_00E8
C - - - - - 0x002A11 00:AA01: 85 41     STA ram_0041
C - - - - - 0x002A13 00:AA03: A9 04     LDA #$04
C - - - - - 0x002A15 00:AA05: 85 1C     STA ram_001C
C - - - - - 0x002A17 00:AA07: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002A1A 00:AA0A: A5 38     LDA ram_0038
C - - - - - 0x002A1C 00:AA0C: F0 05     BEQ bra_AA13
- - - - - - 0x002A1E 00:AA0E: A9 00     LDA #$00
- - - - - - 0x002A20 00:AA10: 85 A0     STA ram_00A0
- - - - - - 0x002A22 00:AA12: 60        RTS

bra_AA13:
C - - - - - 0x002A23 00:AA13: E6 2D     INC con_player_position_y
C - - - - - 0x002A25 00:AA15: E6 2D     INC con_player_position_y
C - - - - - 0x002A27 00:AA17: C6 E7     DEC ram_00E7
C - - - - - 0x002A29 00:AA19: C6 E7     DEC ram_00E7
C - - - - - 0x002A2B 00:AA1B: C6 A0     DEC ram_00A0
C - - - - - 0x002A2D 00:AA1D: 4C CD A8  JMP loc_A8CD

bra_AA20:
C - - - - - 0x002A30 00:AA20: A9 01     LDA #$01
C - - - - - 0x002A32 00:AA22: 85 41     STA ram_0041
C - - - - - 0x002A34 00:AA24: A9 02     LDA #$02
C - - - - - 0x002A36 00:AA26: 85 1C     STA ram_001C
C - - - - - 0x002A38 00:AA28: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002A3B 00:AA2B: A5 38     LDA ram_0038
C - - - - - 0x002A3D 00:AA2D: F0 05     BEQ bra_AA34
C - - - - - 0x002A3F 00:AA2F: A9 01     LDA #$01
C - - - - - 0x002A41 00:AA31: 85 A6     STA ram_00A6
C - - - - - 0x002A43 00:AA33: 60        RTS

bra_AA34:
C - - - - - 0x002A44 00:AA34: A5 2C     LDA con_player_position_x
C - - - - - 0x002A46 00:AA36: C9 00     CMP #$00
C - - - - - 0x002A48 00:AA38: D0 07     BNE bra_AA41
- - - - - - 0x002A4A 00:AA3A: A9 01     LDA #$01
- - - - - - 0x002A4C 00:AA3C: 85 A6     STA ram_00A6
- - - - - - 0x002A4E 00:AA3E: 85 A5     STA ram_00A5
- - - - - - 0x002A50 00:AA40: 60        RTS

bra_AA41:
C - - - - - 0x002A51 00:AA41: C9 80     CMP #$80
C - - - - - 0x002A53 00:AA43: D0 1D     BNE bra_AA62
C - - - - - 0x002A55 00:AA45: AD 20 03  LDA ram_0320
C - - - - - 0x002A58 00:AA48: D0 18     BNE bra_AA62
C - - - - - 0x002A5A 00:AA4A: A5 16     LDA ram_0016
C - - - - - 0x002A5C 00:AA4C: C9 00     CMP #$00
C - - - - - 0x002A5E 00:AA4E: F0 12     BEQ bra_AA62
C - - - - - 0x002A60 00:AA50: C6 16     DEC ram_0016
C - - - - - 0x002A62 00:AA52: E6 60     INC ram_0060
C - - - - - 0x002A64 00:AA54: E6 61     INC ram_0061
C - - - - - 0x002A66 00:AA56: E6 62     INC ram_0062
C - - - - - 0x002A68 00:AA58: A9 01     LDA #$01
C - - - - - 0x002A6A 00:AA5A: 85 74     STA ram_0074
C - - - - - 0x002A6C 00:AA5C: A9 00     LDA #$00
C - - - - - 0x002A6E 00:AA5E: 85 73     STA ram_0073
C - - - - - 0x002A70 00:AA60: F0 06     BEQ bra_AA68

bra_AA62:
C - - - - - 0x002A72 00:AA62: C6 2C     DEC con_player_position_x
C - - - - - 0x002A74 00:AA64: A9 00     LDA #$00
C - - - - - 0x002A76 00:AA66: 85 74     STA ram_0074

bra_AA68:
C - - - - - 0x002A78 00:AA68: E6 2D     INC con_player_position_y
C - - - - - 0x002A7A 00:AA6A: E6 2D     INC con_player_position_y
C - - - - - 0x002A7C 00:AA6C: C6 E7     DEC ram_00E7
C - - - - - 0x002A7E 00:AA6E: C6 E7     DEC ram_00E7
C - - - - - 0x002A80 00:AA70: C6 A0     DEC ram_00A0
C - - - - - 0x002A82 00:AA72: E6 A7     INC ram_00A7
C - - - - - 0x002A84 00:AA74: 4C CD A8  JMP loc_A8CD

loc_AA77:
C D 1 - - - 0x002A87 00:AA77: A5 57     LDA con_player_is_facing_up
C - - - - - 0x002A89 00:AA79: D0 03     BNE bra_AA7E
C - - - - - 0x002A8B 00:AA7B: 4C D2 AA  JMP loc_AAD2

bra_AA7E:
C - - - - - 0x002A8E 00:AA7E: A5 A6     LDA ram_00A6
C - - - - - 0x002A90 00:AA80: D0 31     BNE bra_AAB3
C - - - - - 0x002A92 00:AA82: A5 A0     LDA ram_00A0
C - - - - - 0x002A94 00:AA84: C9 20     CMP #$20
C - - - - - 0x002A96 00:AA86: D0 05     BNE bra_AA8D
C - - - - - 0x002A98 00:AA88: A9 01     LDA #$01
C - - - - - 0x002A9A 00:AA8A: 85 A6     STA ram_00A6
C - - - - - 0x002A9C 00:AA8C: 60        RTS

bra_AA8D:
C - - - - - 0x002A9D 00:AA8D: A9 01     LDA #$01
C - - - - - 0x002A9F 00:AA8F: 85 41     STA ram_0041
C - - - - - 0x002AA1 00:AA91: A9 08     LDA #$08
C - - - - - 0x002AA3 00:AA93: 85 1C     STA ram_001C
C - - - - - 0x002AA5 00:AA95: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002AA8 00:AA98: A5 38     LDA ram_0038
C - - - - - 0x002AAA 00:AA9A: F0 05     BEQ bra_AAA1
C - - - - - 0x002AAC 00:AA9C: A9 01     LDA #$01
C - - - - - 0x002AAE 00:AA9E: 85 A6     STA ram_00A6
C - - - - - 0x002AB0 00:AAA0: 60        RTS

bra_AAA1:
C - - - - - 0x002AB1 00:AAA1: A5 2D     LDA con_player_position_y
C - - - - - 0x002AB3 00:AAA3: D0 05     BNE bra_AAAA
- - - - - - 0x002AB5 00:AAA5: A9 01     LDA #$01
- - - - - - 0x002AB7 00:AAA7: 85 A6     STA ram_00A6
- - - - - - 0x002AB9 00:AAA9: 60        RTS

bra_AAAA:
C - - - - - 0x002ABA 00:AAAA: C6 2D     DEC con_player_position_y
C - - - - - 0x002ABC 00:AAAC: E6 A7     INC ram_00A7
C - - - - - 0x002ABE 00:AAAE: E6 A0     INC ram_00A0
C - - - - - 0x002AC0 00:AAB0: 4C CD A8  JMP loc_A8CD

bra_AAB3:
C - - - - - 0x002AC3 00:AAB3: A5 A0     LDA ram_00A0
C - - - - - 0x002AC5 00:AAB5: C9 10     CMP #$10
C - - - - - 0x002AC7 00:AAB7: B0 09     BCS bra_AAC2
- - - - - - 0x002AC9 00:AAB9: E6 2D     INC con_player_position_y
- - - - - - 0x002ACB 00:AABB: C6 A7     DEC ram_00A7
- - - - - - 0x002ACD 00:AABD: C6 A0     DEC ram_00A0
- - - - - - 0x002ACF 00:AABF: 4C CD A8  JMP loc_A8CD

bra_AAC2:
C - - - - - 0x002AD2 00:AAC2: F0 09     BEQ bra_AACD
C - - - - - 0x002AD4 00:AAC4: C6 A0     DEC ram_00A0
C - - - - - 0x002AD6 00:AAC6: E6 2D     INC con_player_position_y
C - - - - - 0x002AD8 00:AAC8: C6 A7     DEC ram_00A7
C - - - - - 0x002ADA 00:AACA: 4C CD A8  JMP loc_A8CD

bra_AACD:
C - - - - - 0x002ADD 00:AACD: A9 00     LDA #$00
C - - - - - 0x002ADF 00:AACF: 85 A0     STA ram_00A0
C - - - - - 0x002AE1 00:AAD1: 60        RTS

loc_AAD2:
C D 1 - - - 0x002AE2 00:AAD2: A5 A6     LDA ram_00A6
C - - - - - 0x002AE4 00:AAD4: D0 16     BNE bra_AAEC
C - - - - - 0x002AE6 00:AAD6: A5 A0     LDA ram_00A0
C - - - - - 0x002AE8 00:AAD8: C9 10     CMP #$10
C - - - - - 0x002AEA 00:AADA: D0 09     BNE bra_AAE5
C - - - - - 0x002AEC 00:AADC: A9 20     LDA #$20
C - - - - - 0x002AEE 00:AADE: 85 A0     STA ram_00A0
C - - - - - 0x002AF0 00:AAE0: A9 01     LDA #$01
C - - - - - 0x002AF2 00:AAE2: 85 A6     STA ram_00A6
C - - - - - 0x002AF4 00:AAE4: 60        RTS

bra_AAE5:
C - - - - - 0x002AF5 00:AAE5: E6 A0     INC ram_00A0
C - - - - - 0x002AF7 00:AAE7: C6 2D     DEC con_player_position_y
C - - - - - 0x002AF9 00:AAE9: 4C CD A8  JMP loc_A8CD

bra_AAEC:
C - - - - - 0x002AFC 00:AAEC: A5 A0     LDA ram_00A0
C - - - - - 0x002AFE 00:AAEE: C9 11     CMP #$11
C - - - - - 0x002B00 00:AAF0: B0 1D     BCS bra_AB0F
C - - - - - 0x002B02 00:AAF2: A9 01     LDA #$01
C - - - - - 0x002B04 00:AAF4: 85 41     STA ram_0041
C - - - - - 0x002B06 00:AAF6: A9 04     LDA #$04
C - - - - - 0x002B08 00:AAF8: 85 1C     STA ram_001C
C - - - - - 0x002B0A 00:AAFA: 20 EC B6  JSR sub_B6EC
C - - - - - 0x002B0D 00:AAFD: A5 38     LDA ram_0038
C - - - - - 0x002B0F 00:AAFF: F0 05     BEQ bra_AB06
C - - - - - 0x002B11 00:AB01: A9 00     LDA #$00
C - - - - - 0x002B13 00:AB03: 85 A0     STA ram_00A0
C - - - - - 0x002B15 00:AB05: 60        RTS

bra_AB06:
C - - - - - 0x002B16 00:AB06: E6 2D     INC con_player_position_y
C - - - - - 0x002B18 00:AB08: E6 A7     INC ram_00A7
C - - - - - 0x002B1A 00:AB0A: C6 A0     DEC ram_00A0
C - - - - - 0x002B1C 00:AB0C: 4C CD A8  JMP loc_A8CD

bra_AB0F:
C - - - - - 0x002B1F 00:AB0F: C6 A0     DEC ram_00A0
C - - - - - 0x002B21 00:AB11: E6 2D     INC con_player_position_y
C - - - - - 0x002B23 00:AB13: 4C CD A8  JMP loc_A8CD

sub_AB16:
C - - - - - 0x002B26 00:AB16: A5 9F     LDA ram_009F
C - - - - - 0x002B28 00:AB18: F0 4D     BEQ bra_AB67_RTS
C - - - - - 0x002B2A 00:AB1A: A9 00     LDA #$00
C - - - - - 0x002B2C 00:AB1C: 85 9F     STA ram_009F
C - - - - - 0x002B2E 00:AB1E: A5 56     LDA con_player_is_facing_right
C - - - - - 0x002B30 00:AB20: D0 0A     BNE bra_AB2C
C - - - - - 0x002B32 00:AB22: A5 55     LDA con_player_is_facing_left
C - - - - - 0x002B34 00:AB24: F0 14     BEQ bra_AB3A
C - - - - - 0x002B36 00:AB26: A9 01     LDA #$01
C - - - - - 0x002B38 00:AB28: 85 4C     STA ram_004C
C - - - - - 0x002B3A 00:AB2A: D0 04     BNE bra_AB30

bra_AB2C:
C - - - - - 0x002B3C 00:AB2C: A9 00     LDA #$00
C - - - - - 0x002B3E 00:AB2E: 85 4C     STA ram_004C

bra_AB30:
C - - - - - 0x002B40 00:AB30: A9 94     LDA #>tbl_9473_spr_littlehood_kick_side		
C - - - - - 0x002B42 00:AB32: 85 46     STA ram_0046
C - - - - - 0x002B44 00:AB34: A9 73     LDA #<tbl_9473_spr_littlehood_kick_side		
C - - - - - 0x002B46 00:AB36: 85 45     STA ram_0045
C - - - - - 0x002B48 00:AB38: D0 1E     BNE bra_AB58

bra_AB3A:
C - - - - - 0x002B4A 00:AB3A: A5 57     LDA con_player_is_facing_up
C - - - - - 0x002B4C 00:AB3C: F0 0E     BEQ bra_AB4C
C - - - - - 0x002B4E 00:AB3E: A9 94     LDA #>tbl_947A_spr_littlehood_kick_up
C - - - - - 0x002B50 00:AB40: 85 46     STA ram_0046
C - - - - - 0x002B52 00:AB42: A9 7A     LDA #<tbl_947A_spr_littlehood_kick_up
C - - - - - 0x002B54 00:AB44: 85 45     STA ram_0045
C - - - - - 0x002B56 00:AB46: A9 00     LDA #$00
C - - - - - 0x002B58 00:AB48: 85 4C     STA ram_004C
C - - - - - 0x002B5A 00:AB4A: F0 0C     BEQ bra_AB58

bra_AB4C:
C - - - - - 0x002B5C 00:AB4C: A9 94     LDA #>tbl_9481_spr_littlehood_kick_down
C - - - - - 0x002B5E 00:AB4E: 85 46     STA ram_0046
C - - - - - 0x002B60 00:AB50: A9 81     LDA #<tbl_9481_spr_littlehood_kick_down
C - - - - - 0x002B62 00:AB52: 85 45     STA ram_0045
C - - - - - 0x002B64 00:AB54: A9 00     LDA #$00
C - - - - - 0x002B66 00:AB56: 85 4C     STA ram_004C

bra_AB58:
C - - - - - 0x002B68 00:AB58: A9 00     LDA #$00
C - - - - - 0x002B6A 00:AB5A: 85 24     STA ram_0024
C - - - - - 0x002B6C 00:AB5C: A5 2C     LDA con_player_position_x
C - - - - - 0x002B6E 00:AB5E: 85 4E     STA ram_004E
C - - - - - 0x002B70 00:AB60: A5 2D     LDA con_player_position_y
C - - - - - 0x002B72 00:AB62: 85 4D     STA ram_004D
C - - - - - 0x002B74 00:AB64: 20 CE C0  JSR sub_C0CE

bra_AB67_RTS:
C - - - - - 0x002B77 00:AB67: 60        RTS

sub_AB68:
C - - - - - 0x002B78 00:AB68: AD 20 03  LDA ram_0320
C - - - - - 0x002B7B 00:AB6B: D0 01     BNE bra_AB6E
C - - - - - 0x002B7D 00:AB6D: 60        RTS

bra_AB6E:
C - - - - - 0x002B7E 00:AB6E: AD 4A 06  LDA ram_064A
C - - - - - 0x002B81 00:AB71: C9 50     CMP #$50
C - - - - - 0x002B83 00:AB73: B0 04     BCS bra_AB79
C - - - - - 0x002B85 00:AB75: EE 4A 06  INC ram_064A
C - - - - - 0x002B88 00:AB78: 60        RTS

bra_AB79:
C - - - - - 0x002B89 00:AB79: AD CC 02  LDA ram_02CC
C - - - - - 0x002B8C 00:AB7C: 85 4D     STA ram_004D
C - - - - - 0x002B8E 00:AB7E: AD CF 02  LDA ram_02CF
C - - - - - 0x002B91 00:AB81: 85 4E     STA ram_004E
C - - - - - 0x002B93 00:AB83: A9 05     LDA #$05
C - - - - - 0x002B95 00:AB85: 85 0E     STA ram_000E
C - - - - - 0x002B97 00:AB87: 20 27 A4  JSR sub_A427
C - - - - - 0x002B9A 00:AB8A: 90 04     BCC bra_AB90_RTS
C - - - - - 0x002B9C 00:AB8C: A9 01     LDA #$01
C - - - - - 0x002B9E 00:AB8E: 85 8B     STA ram_008B

bra_AB90_RTS:
C - - - - - 0x002BA0 00:AB90: 60        RTS

sub_AB91_check_and_change_level:
C - - - - - 0x002BA1 00:AB91: A2 56     LDX #$56
C - - - - - 0x002BA3 00:AB93: BD 00 04  LDA ram_0400,X
C - - - - - 0x002BA6 00:AB96: C9 7E     CMP #$7E
C - - - - - 0x002BA8 00:AB98: F0 03     BEQ bra_AB9D_change_level_screen
- - - - - - 0x002BAA 00:AB9A: 4C 0B 80  JMP vec_800B_RESET					; if error encounter reset game 

bra_AB9D_change_level_screen:
C - - - - - 0x002BAD 00:AB9D: A9 00     LDA #$00
C - - - - - 0x002BAF 00:AB9F: 8D 01 20  STA $2001
C - - - - - 0x002BB2 00:ABA2: 85 01     STA ram_0001
C - - - - - 0x002BB4 00:ABA4: 85 14     STA ram_0014
C - - - - - 0x002BB6 00:ABA6: A5 00     LDA ram_0000
C - - - - - 0x002BB8 00:ABA8: 29 7F     AND #$7F
C - - - - - 0x002BBA 00:ABAA: 8D 00 20  STA $2000
C - - - - - 0x002BBD 00:ABAD: 85 00     STA ram_0000
C - - - - - 0x002BBF 00:ABAF: 20 D0 BE  JSR sub_BED0
C - - - - - 0x002BC2 00:ABB2: A9 62     LDA #<tbl_CD62_change_level_screen_palette
C - - - - - 0x002BC4 00:ABB4: 85 06     STA ram_0006
C - - - - - 0x002BC6 00:ABB6: A9 CD     LDA #>tbl_CD62_change_level_screen_palette
C - - - - - 0x002BC8 00:ABB8: 85 07     STA ram_0007
C - - - - - 0x002BCA 00:ABBA: 20 DE BE  JSR sub_BEDE
C - - - - - 0x002BCD 00:ABBD: A9 E3     LDA #<tbl_F2E3_change_level_screen_tilemap_attributes
C - - - - - 0x002BCF 00:ABBF: 85 10     STA ram_0010
C - - - - - 0x002BD1 00:ABC1: A9 F2     LDA #>tbl_F2E3_change_level_screen_tilemap_attributes
C - - - - - 0x002BD3 00:ABC3: 85 11     STA ram_0011
C - - - - - 0x002BD5 00:ABC5: 20 D4 BF  JSR sub_BFD4
C - - - - - 0x002BD8 00:ABC8: 20 F5 BE  JSR sub_BEF5_build_screen
C - - - - - 0x002BDB 00:ABCB: A9 00     LDA #$00
C - - - - - 0x002BDD 00:ABCD: 8D 8C 03  STA ram_038C
C - - - - - 0x002BE0 00:ABD0: AE 3B 06  LDX ram_063B
C - - - - - 0x002BE3 00:ABD3: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x002BE6 00:ABD6: C9 09     CMP #$09							; if is stage 09
C - - - - - 0x002BE8 00:ABD8: D0 16     BNE bra_ABF0_write_stage_number
C - - - - - 0x002BEA 00:ABDA: A9 22     LDA #$22
C - - - - - 0x002BEC 00:ABDC: 8D 06 20  STA $2006
C - - - - - 0x002BEF 00:ABDF: A9 30     LDA #$30
C - - - - - 0x002BF1 00:ABE1: 8D 06 20  STA $2006
C - - - - - 0x002BF4 00:ABE4: A9 D1     LDA #$D1							; <01>
C - - - - - 0x002BF6 00:ABE6: 8D 07 20  STA $2007							;
C - - - - - 0x002BF9 00:ABE9: A9 D0     LDA #$D0							; <00>
C - - - - - 0x002BFB 00:ABEB: 8D 07 20  STA $2007							; write <10>
C - - - - - 0x002BFE 00:ABEE: D0 1D     BNE bra_AC0D_select_tree_type_change_level_screen

bra_ABF0_write_stage_number:
C - - - - - 0x002C00 00:ABF0: 0A        ASL
C - - - - - 0x002C01 00:ABF1: AA        TAX
C - - - - - 0x002C02 00:ABF2: BD 75 92  LDA tbl_9275_string_world_x,X
C - - - - - 0x002C05 00:ABF5: 85 2E     STA ram_002E
C - - - - - 0x002C07 00:ABF7: BD 76 92  LDA tbl_9275_string_world_x+1,X
C - - - - - 0x002C0A 00:ABFA: 85 2F     STA ram_002F
C - - - - - 0x002C0C 00:ABFC: A9 22     LDA #$22
C - - - - - 0x002C0E 00:ABFE: 8D 06 20  STA $2006
C - - - - - 0x002C11 00:AC01: A9 30     LDA #$30
C - - - - - 0x002C13 00:AC03: 8D 06 20  STA $2006
C - - - - - 0x002C16 00:AC06: A0 00     LDY #$00
C - - - - - 0x002C18 00:AC08: B1 2E     LDA (ram_002E),Y
C - - - - - 0x002C1A 00:AC0A: 8D 07 20  STA $2007

bra_AC0D_select_tree_type_change_level_screen:
C - - - - - 0x002C1D 00:AC0D: AE 3B 06  LDX ram_063B
C - - - - - 0x002C20 00:AC10: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x002C23 00:AC13: 0A        ASL
C - - - - - 0x002C24 00:AC14: AA        TAX
C - - - - - 0x002C25 00:AC15: BD 8F 92  LDA tbl_928F_change_level_background_tree_type,X
C - - - - - 0x002C28 00:AC18: 85 2E     STA ram_002E
C - - - - - 0x002C2A 00:AC1A: BD 90 92  LDA tbl_928F_change_level_background_tree_type+1,X
C - - - - - 0x002C2D 00:AC1D: 85 2F     STA ram_002F
C - - - - - 0x002C2F 00:AC1F: A9 22     LDA #$22
C - - - - - 0x002C31 00:AC21: 85 0D     STA ram_000D
C - - - - - 0x002C33 00:AC23: A9 C6     LDA #$C6
C - - - - - 0x002C35 00:AC25: 85 0C     STA ram_000C

bra_AC27:
C - - - - - 0x002C37 00:AC27: A0 00     LDY #$00
C - - - - - 0x002C39 00:AC29: A2 03     LDX #$03

bra_AC2B:
loc_AC2B:
C D 1 - - - 0x002C3B 00:AC2B: A5 0D     LDA ram_000D
C - - - - - 0x002C3D 00:AC2D: 8D 06 20  STA $2006
C - - - - - 0x002C40 00:AC30: A5 0C     LDA ram_000C
C - - - - - 0x002C42 00:AC32: 8D 06 20  STA $2006

bra_AC35:
C - - - - - 0x002C45 00:AC35: B1 2E     LDA (ram_002E),Y
C - - - - - 0x002C47 00:AC37: 8D 07 20  STA $2007
C - - - - - 0x002C4A 00:AC3A: C8        INY
C - - - - - 0x002C4B 00:AC3B: 98        TYA
C - - - - - 0x002C4C 00:AC3C: 29 03     AND #$03
C - - - - - 0x002C4E 00:AC3E: D0 F5     BNE bra_AC35
C - - - - - 0x002C50 00:AC40: CA        DEX
C - - - - - 0x002C51 00:AC41: 30 10     BMI bra_AC53
C - - - - - 0x002C53 00:AC43: A5 0C     LDA ram_000C
C - - - - - 0x002C55 00:AC45: 18        CLC
C - - - - - 0x002C56 00:AC46: 69 20     ADC #$20
C - - - - - 0x002C58 00:AC48: 85 0C     STA ram_000C
C - - - - - 0x002C5A 00:AC4A: 90 DF     BCC bra_AC2B
C - - - - - 0x002C5C 00:AC4C: 85 0C     STA ram_000C
C - - - - - 0x002C5E 00:AC4E: E6 0D     INC ram_000D
C - - - - - 0x002C60 00:AC50: 4C 2B AC  JMP loc_AC2B

bra_AC53:
C - - - - - 0x002C63 00:AC53: AD 8D 03  LDA ram_038D
C - - - - - 0x002C66 00:AC56: D0 0F     BNE bra_AC67
C - - - - - 0x002C68 00:AC58: A9 01     LDA #$01
C - - - - - 0x002C6A 00:AC5A: 8D 8D 03  STA ram_038D
C - - - - - 0x002C6D 00:AC5D: A9 22     LDA #$22
C - - - - - 0x002C6F 00:AC5F: 85 0D     STA ram_000D
C - - - - - 0x002C71 00:AC61: A9 D2     LDA #$D2
C - - - - - 0x002C73 00:AC63: 85 0C     STA ram_000C
C - - - - - 0x002C75 00:AC65: D0 C0     BNE bra_AC27

bra_AC67:
loc_AC67:
C - - - - - 0x002C77 00:AC67: A9 01     LDA #$01
C - - - - - 0x002C79 00:AC69: 8D 8E 03  STA ram_038E
C - - - - - 0x002C7C 00:AC6C: A9 00     LDA #$00
C - - - - - 0x002C7E 00:AC6E: 8D 8D 03  STA ram_038D
C - - - - - 0x002C81 00:AC71: 85 5B     STA ram_005B
C - - - - - 0x002C83 00:AC73: A2 50     LDX #$50
C - - - - - 0x002C85 00:AC75: BD 07 04  LDA ram_0407,X
C - - - - - 0x002C88 00:AC78: C9 01     CMP #$01
C - - - - - 0x002C8A 00:AC7A: F0 03     BEQ bra_AC7F
- - - - - - 0x002C8C 00:AC7C: 4C 67 AC  JMP loc_AC67

bra_AC7F:
C - - - - - 0x002C8F 00:AC7F: 20 A0 AC  JSR sub_ACA0
C - - - - - 0x002C92 00:AC82: A9 C0     LDA #$C0
C - - - - - 0x002C94 00:AC84: 85 4D     STA ram_004D
C - - - - - 0x002C96 00:AC86: 85 2D     STA con_player_position_y
C - - - - - 0x002C98 00:AC88: A9 20     LDA #$20
C - - - - - 0x002C9A 00:AC8A: 85 4E     STA ram_004E
C - - - - - 0x002C9C 00:AC8C: 85 2C     STA con_player_position_x
C - - - - - 0x002C9E 00:AC8E: A9 00     LDA #$00
C - - - - - 0x002CA0 00:AC90: 85 24     STA ram_0024
C - - - - - 0x002CA2 00:AC92: 85 4C     STA ram_004C
C - - - - - 0x002CA4 00:AC94: A9 1B     LDA #$1B
C - - - - - 0x002CA6 00:AC96: 85 45     STA ram_0045
C - - - - - 0x002CA8 00:AC98: A9 94     LDA #$94
C - - - - - 0x002CAA 00:AC9A: 85 46     STA ram_0046
C - - - - - 0x002CAC 00:AC9C: 20 CE C0  JSR sub_C0CE
C - - - - - 0x002CAF 00:AC9F: 60        RTS

sub_ACA0:
C - - - - - 0x002CB0 00:ACA0: A9 00     LDA #$00
C - - - - - 0x002CB2 00:ACA2: 85 16     STA ram_0016
C - - - - - 0x002CB4 00:ACA4: 85 17     STA ram_0017

sub_ACA6:
C - - - - - 0x002CB6 00:ACA6: A9 00     LDA #$00
C - - - - - 0x002CB8 00:ACA8: 8D 05 20  STA $2005
C - - - - - 0x002CBB 00:ACAB: 8D 05 20  STA $2005
C - - - - - 0x002CBE 00:ACAE: 60        RTS

sub_ACAF:
C - - - - - 0x002CBF 00:ACAF: A5 D6     LDA ram_00D6
C - - - - - 0x002CC1 00:ACB1: D0 01     BNE bra_ACB4
C - - - - - 0x002CC3 00:ACB3: 60        RTS

bra_ACB4:
C - - - - - 0x002CC4 00:ACB4: AD 32 03  LDA ram_0332
C - - - - - 0x002CC7 00:ACB7: 0A        ASL
C - - - - - 0x002CC8 00:ACB8: 0A        ASL
C - - - - - 0x002CC9 00:ACB9: AA        TAX
C - - - - - 0x002CCA 00:ACBA: BD 03 02  LDA ram_0203,X
C - - - - - 0x002CCD 00:ACBD: C9 F1     CMP #$F1
C - - - - - 0x002CCF 00:ACBF: 90 07     BCC bra_ACC8_RTS
C - - - - - 0x002CD1 00:ACC1: 20 53 A8  JSR sub_A853
C - - - - - 0x002CD4 00:ACC4: A9 00     LDA #$00
C - - - - - 0x002CD6 00:ACC6: 85 D6     STA ram_00D6

bra_ACC8_RTS:
C - - - - - 0x002CD8 00:ACC8: 60        RTS

sub_ACC9:
C - - - - - 0x002CD9 00:ACC9: AD 8B 03  LDA ram_038B
C - - - - - 0x002CDC 00:ACCC: D0 01     BNE bra_ACCF
C - - - - - 0x002CDE 00:ACCE: 60        RTS

bra_ACCF:
C - - - - - 0x002CDF 00:ACCF: A5 73     LDA ram_0073
C - - - - - 0x002CE1 00:ACD1: F0 06     BEQ bra_ACD9
C - - - - - 0x002CE3 00:ACD3: CE 8F 03  DEC ram_038F
C - - - - - 0x002CE6 00:ACD6: 4C E0 AC  JMP loc_ACE0

bra_ACD9:
C - - - - - 0x002CE9 00:ACD9: A5 74     LDA ram_0074
C - - - - - 0x002CEB 00:ACDB: F0 03     BEQ bra_ACE0
C - - - - - 0x002CED 00:ACDD: EE 8F 03  INC ram_038F

bra_ACE0:
loc_ACE0:
C D 1 - - - 0x002CF0 00:ACE0: A5 74     LDA ram_0074
C - - - - - 0x002CF2 00:ACE2: F0 34     BEQ bra_AD18
C - - - - - 0x002CF4 00:ACE4: AD 8F 03  LDA ram_038F
C - - - - - 0x002CF7 00:ACE7: C9 F0     CMP #$F0
C - - - - - 0x002CF9 00:ACE9: 90 2C     BCC bra_AD17_RTS
C - - - - - 0x002CFB 00:ACEB: AD C8 02  LDA ram_02C8
C - - - - - 0x002CFE 00:ACEE: C9 F8     CMP #$F8
C - - - - - 0x002D00 00:ACF0: F0 25     BEQ bra_AD17_RTS
C - - - - - 0x002D02 00:ACF2: 8D 12 03  STA ram_0312
C - - - - - 0x002D05 00:ACF5: AD CC 02  LDA ram_02CC
C - - - - - 0x002D08 00:ACF8: 8D 13 03  STA ram_0313
C - - - - - 0x002D0B 00:ACFB: A9 F8     LDA #$F8
C - - - - - 0x002D0D 00:ACFD: 8D C8 02  STA ram_02C8
C - - - - - 0x002D10 00:AD00: 8D CC 02  STA ram_02CC
C - - - - - 0x002D13 00:AD03: AD C0 02  LDA ram_02C0
C - - - - - 0x002D16 00:AD06: 8D 10 03  STA ram_0310
C - - - - - 0x002D19 00:AD09: AD C4 02  LDA ram_02C4
C - - - - - 0x002D1C 00:AD0C: 8D 11 03  STA ram_0311
C - - - - - 0x002D1F 00:AD0F: A9 F8     LDA #$F8
C - - - - - 0x002D21 00:AD11: 8D C0 02  STA ram_02C0
C - - - - - 0x002D24 00:AD14: 8D C4 02  STA ram_02C4

bra_AD17_RTS:
C - - - - - 0x002D27 00:AD17: 60        RTS

bra_AD18:
C - - - - - 0x002D28 00:AD18: A5 73     LDA ram_0073
C - - - - - 0x002D2A 00:AD1A: F0 FB     BEQ bra_AD17_RTS
C - - - - - 0x002D2C 00:AD1C: AD 8F 03  LDA ram_038F
C - - - - - 0x002D2F 00:AD1F: C9 EF     CMP #$EF
C - - - - - 0x002D31 00:AD21: 90 F4     BCC bra_AD17_RTS
C - - - - - 0x002D33 00:AD23: C9 F8     CMP #$F8
C - - - - - 0x002D35 00:AD25: B0 F0     BCS bra_AD17_RTS
C - - - - - 0x002D37 00:AD27: AD 10 03  LDA ram_0310
C - - - - - 0x002D3A 00:AD2A: F0 EB     BEQ bra_AD17_RTS
C - - - - - 0x002D3C 00:AD2C: 8D C0 02  STA ram_02C0
C - - - - - 0x002D3F 00:AD2F: AD 11 03  LDA ram_0311
C - - - - - 0x002D42 00:AD32: 8D C4 02  STA ram_02C4
C - - - - - 0x002D45 00:AD35: AD 12 03  LDA ram_0312
C - - - - - 0x002D48 00:AD38: 8D C8 02  STA ram_02C8
C - - - - - 0x002D4B 00:AD3B: AD 13 03  LDA ram_0313
C - - - - - 0x002D4E 00:AD3E: 8D CC 02  STA ram_02CC
C - - - - - 0x002D51 00:AD41: A9 00     LDA #$00
C - - - - - 0x002D53 00:AD43: 8D 10 03  STA ram_0310
C - - - - - 0x002D56 00:AD46: 8D 11 03  STA ram_0311
C - - - - - 0x002D59 00:AD49: 8D 12 03  STA ram_0312
C - - - - - 0x002D5C 00:AD4C: 8D 13 03  STA ram_0313
C - - - - - 0x002D5F 00:AD4F: 60        RTS
- - - - - - 0x002D60 00:AD50: 60        RTS					; ???

sub_AD51:
C - - - - - 0x002D61 00:AD51: A5 5F     LDA ram_005F
C - - - - - 0x002D63 00:AD53: D0 11     BNE bra_AD66
C - - - - - 0x002D65 00:AD55: E6 F3     INC ram_00F3
C - - - - - 0x002D67 00:AD57: A5 F3     LDA ram_00F3
C - - - - - 0x002D69 00:AD59: C9 20     CMP #$20
C - - - - - 0x002D6B 00:AD5B: D0 08     BNE bra_AD65_RTS
C - - - - - 0x002D6D 00:AD5D: A9 01     LDA #$01
C - - - - - 0x002D6F 00:AD5F: 85 5F     STA ram_005F
C - - - - - 0x002D71 00:AD61: A9 00     LDA #$00
C - - - - - 0x002D73 00:AD63: 85 F3     STA ram_00F3

bra_AD65_RTS:
C - - - - - 0x002D75 00:AD65: 60        RTS

bra_AD66:
C - - - - - 0x002D76 00:AD66: E6 5B     INC ram_005B
C - - - - - 0x002D78 00:AD68: A5 5B     LDA ram_005B
C - - - - - 0x002D7A 00:AD6A: C9 08     CMP #$08
C - - - - - 0x002D7C 00:AD6C: D0 06     BNE bra_AD74
C - - - - - 0x002D7E 00:AD6E: A9 01     LDA #$01
C - - - - - 0x002D80 00:AD70: 85 51     STA ram_0051
C - - - - - 0x002D82 00:AD72: D0 0C     BNE bra_AD80

bra_AD74:
C - - - - - 0x002D84 00:AD74: C9 10     CMP #$10
C - - - - - 0x002D86 00:AD76: D0 08     BNE bra_AD80
C - - - - - 0x002D88 00:AD78: A9 02     LDA #$02
C - - - - - 0x002D8A 00:AD7A: 85 51     STA ram_0051
C - - - - - 0x002D8C 00:AD7C: A9 00     LDA #$00
C - - - - - 0x002D8E 00:AD7E: 85 5B     STA ram_005B

bra_AD80:
C - - - - - 0x002D90 00:AD80: A9 01     LDA #$01
C - - - - - 0x002D92 00:AD82: 85 54     STA ram_0054
C - - - - - 0x002D94 00:AD84: 85 2B     STA ram_002B
C - - - - - 0x002D96 00:AD86: E6 2C     INC con_player_position_x
C - - - - - 0x002D98 00:AD88: A5 2C     LDA con_player_position_x
C - - - - - 0x002D9A 00:AD8A: 85 4E     STA ram_004E
C - - - - - 0x002D9C 00:AD8C: A5 2D     LDA con_player_position_y
C - - - - - 0x002D9E 00:AD8E: 85 4D     STA ram_004D
C - - - - - 0x002DA0 00:AD90: A9 00     LDA #$00
C - - - - - 0x002DA2 00:AD92: 85 24     STA ram_0024
C - - - - - 0x002DA4 00:AD94: 85 4C     STA ram_004C
C - - - - - 0x002DA6 00:AD96: A9 E5     LDA #$E5
C - - - - - 0x002DA8 00:AD98: 85 52     STA ram_0052
C - - - - - 0x002DAA 00:AD9A: A9 93     LDA #$93
C - - - - - 0x002DAC 00:AD9C: 85 53     STA ram_0053
C - - - - - 0x002DAE 00:AD9E: 20 56 C1  JSR sub_C156
C - - - - - 0x002DB1 00:ADA1: A5 2C     LDA con_player_position_x
C - - - - - 0x002DB3 00:ADA3: C9 F0     CMP #$F0
C - - - - - 0x002DB5 00:ADA5: D0 0F     BNE bra_ADB6_RTS
C - - - - - 0x002DB7 00:ADA7: A9 00     LDA #$00
C - - - - - 0x002DB9 00:ADA9: 8D 8E 03  STA ram_038E
C - - - - - 0x002DBC 00:ADAC: 85 5F     STA ram_005F
C - - - - - 0x002DBE 00:ADAE: A9 01     LDA #$01
C - - - - - 0x002DC0 00:ADB0: 8D 36 06  STA ram_0636
C - - - - - 0x002DC3 00:ADB3: 8D 50 03  STA ram_0350

bra_ADB6_RTS:
C - - - - - 0x002DC6 00:ADB6: 60        RTS

sub_ADB7:
C - - - - - 0x002DC7 00:ADB7: AD 21 03  LDA ram_0321
C - - - - - 0x002DCA 00:ADBA: D0 01     BNE bra_ADBD
C - - - - - 0x002DCC 00:ADBC: 60        RTS

bra_ADBD:
C - - - - - 0x002DCD 00:ADBD: AD 24 03  LDA ram_0324
C - - - - - 0x002DD0 00:ADC0: C9 03     CMP #$03
C - - - - - 0x002DD2 00:ADC2: D0 23     BNE bra_ADE7
C - - - - - 0x002DD4 00:ADC4: AD 89 03  LDA ram_0389
C - - - - - 0x002DD7 00:ADC7: F0 04     BEQ bra_ADCD
C - - - - - 0x002DD9 00:ADC9: A9 02     LDA #$02
C - - - - - 0x002DDB 00:ADCB: D0 02     BNE bra_ADCF

bra_ADCD:
C - - - - - 0x002DDD 00:ADCD: A9 01     LDA #$01

bra_ADCF:
C - - - - - 0x002DDF 00:ADCF: 8D C2 02  STA ram_02C2
C - - - - - 0x002DE2 00:ADD2: 8D C6 02  STA ram_02C6
C - - - - - 0x002DE5 00:ADD5: 8D CA 02  STA ram_02CA
C - - - - - 0x002DE8 00:ADD8: 8D CE 02  STA ram_02CE
C - - - - - 0x002DEB 00:ADDB: A9 00     LDA #$00
C - - - - - 0x002DED 00:ADDD: 8D 24 03  STA ram_0324
C - - - - - 0x002DF0 00:ADE0: 8D 21 03  STA ram_0321
C - - - - - 0x002DF3 00:ADE3: 8D 25 03  STA ram_0325
C - - - - - 0x002DF6 00:ADE6: 60        RTS

bra_ADE7:
C - - - - - 0x002DF7 00:ADE7: AD 25 03  LDA ram_0325
C - - - - - 0x002DFA 00:ADEA: C9 08     CMP #$08
C - - - - - 0x002DFC 00:ADEC: D0 12     BNE bra_AE00
C - - - - - 0x002DFE 00:ADEE: A9 02     LDA #$02
C - - - - - 0x002E00 00:ADF0: 8D C2 02  STA ram_02C2
C - - - - - 0x002E03 00:ADF3: 8D C6 02  STA ram_02C6
C - - - - - 0x002E06 00:ADF6: 8D CA 02  STA ram_02CA
C - - - - - 0x002E09 00:ADF9: 8D CE 02  STA ram_02CE

bra_ADFC:
C - - - - - 0x002E0C 00:ADFC: EE 25 03  INC ram_0325
C - - - - - 0x002E0F 00:ADFF: 60        RTS

bra_AE00:
C - - - - - 0x002E10 00:AE00: C9 10     CMP #$10
C - - - - - 0x002E12 00:AE02: D0 F8     BNE bra_ADFC
C - - - - - 0x002E14 00:AE04: A9 00     LDA #$00
C - - - - - 0x002E16 00:AE06: 8D 25 03  STA ram_0325
C - - - - - 0x002E19 00:AE09: A9 01     LDA #$01
C - - - - - 0x002E1B 00:AE0B: 8D C2 02  STA ram_02C2
C - - - - - 0x002E1E 00:AE0E: 8D C6 02  STA ram_02C6
C - - - - - 0x002E21 00:AE11: 8D CA 02  STA ram_02CA
C - - - - - 0x002E24 00:AE14: 8D CE 02  STA ram_02CE
C - - - - - 0x002E27 00:AE17: EE 24 03  INC ram_0324
C - - - - - 0x002E2A 00:AE1A: D0 E0     BNE bra_ADFC

sub_AE1C:
C - - - - - 0x002E2C 00:AE1C: A5 D9     LDA ram_00D9
C - - - - - 0x002E2E 00:AE1E: F0 05     BEQ bra_AE25_RTS
- - - - - - 0x002E30 00:AE20: AD 21 03  LDA ram_0321
- - - - - - 0x002E33 00:AE23: F0 01     BEQ bra_AE26

bra_AE25_RTS:
C - - - - - 0x002E35 00:AE25: 60        RTS

bra_AE26:
- - - - - - 0x002E36 00:AE26: A2 C0     LDX #$C0
- - - - - - 0x002E38 00:AE28: 20 53 A8  JSR sub_A853
- - - - - - 0x002E3B 00:AE2B: A9 00     LDA #$00
- - - - - - 0x002E3D 00:AE2D: 8D 8B 03  STA ram_038B
- - - - - - 0x002E40 00:AE30: 8D 8F 03  STA ram_038F
- - - - - - 0x002E43 00:AE33: 85 D9     STA ram_00D9
- - - - - - 0x002E45 00:AE35: 60        RTS

sub_AE36:
C - - - - - 0x002E46 00:AE36: AD 28 03  LDA ram_0328
C - - - - - 0x002E49 00:AE39: D0 01     BNE bra_AE3C
C - - - - - 0x002E4B 00:AE3B: 60        RTS

bra_AE3C:
C - - - - - 0x002E4C 00:AE3C: AD 26 03  LDA ram_0326
C - - - - - 0x002E4F 00:AE3F: C9 60     CMP #$60
C - - - - - 0x002E51 00:AE41: D0 0E     BNE bra_AE51
C - - - - - 0x002E53 00:AE43: A9 00     LDA #$00
C - - - - - 0x002E55 00:AE45: 8D 26 03  STA ram_0326
C - - - - - 0x002E58 00:AE48: 8D 28 03  STA ram_0328
C - - - - - 0x002E5B 00:AE4B: A9 01     LDA #$01
C - - - - - 0x002E5D 00:AE4D: 8D 22 03  STA ram_0322
C - - - - - 0x002E60 00:AE50: 60        RTS

bra_AE51:
C - - - - - 0x002E61 00:AE51: EE 26 03  INC ram_0326
C - - - - - 0x002E64 00:AE54: 60        RTS

sub_AE55:
C - - - - - 0x002E65 00:AE55: AD 22 03  LDA ram_0322
C - - - - - 0x002E68 00:AE58: D0 01     BNE bra_AE5B
C - - - - - 0x002E6A 00:AE5A: 60        RTS

bra_AE5B:
C - - - - - 0x002E6B 00:AE5B: A6 80     LDX ram_0080
C - - - - - 0x002E6D 00:AE5D: 20 F2 C7  JSR sub_C7F2
C - - - - - 0x002E70 00:AE60: 20 37 8C  JSR sub_8C37
C - - - - - 0x002E73 00:AE63: 90 46     BCC bra_AEAB_RTS
C - - - - - 0x002E75 00:AE65: A5 16     LDA ram_0016
C - - - - - 0x002E77 00:AE67: C9 80     CMP #$80
C - - - - - 0x002E79 00:AE69: 90 40     BCC bra_AEAB_RTS
C - - - - - 0x002E7B 00:AE6B: A5 80     LDA ram_0080
C - - - - - 0x002E7D 00:AE6D: 29 0F     AND #$0F
C - - - - - 0x002E7F 00:AE6F: 0A        ASL
C - - - - - 0x002E80 00:AE70: 0A        ASL
C - - - - - 0x002E81 00:AE71: 0A        ASL
C - - - - - 0x002E82 00:AE72: 0A        ASL
C - - - - - 0x002E83 00:AE73: 85 E2     STA ram_00E2
C - - - - - 0x002E85 00:AE75: 18        CLC
C - - - - - 0x002E86 00:AE76: 65 16     ADC ram_0016
C - - - - - 0x002E88 00:AE78: B0 31     BCS bra_AEAB_RTS
C - - - - - 0x002E8A 00:AE7A: A9 FF     LDA #$FF
C - - - - - 0x002E8C 00:AE7C: 38        SEC
C - - - - - 0x002E8D 00:AE7D: E5 16     SBC ram_0016
C - - - - - 0x002E8F 00:AE7F: 18        CLC
C - - - - - 0x002E90 00:AE80: 65 E2     ADC ram_00E2
C - - - - - 0x002E92 00:AE82: 85 4E     STA ram_004E
C - - - - - 0x002E94 00:AE84: 8D 8F 03  STA ram_038F
C - - - - - 0x002E97 00:AE87: A5 80     LDA ram_0080
C - - - - - 0x002E99 00:AE89: 29 F0     AND #$F0
C - - - - - 0x002E9B 00:AE8B: 85 4D     STA ram_004D
C - - - - - 0x002E9D 00:AE8D: A9 00     LDA #$00
C - - - - - 0x002E9F 00:AE8F: 85 4C     STA ram_004C
C - - - - - 0x002EA1 00:AE91: 8D 22 03  STA ram_0322
C - - - - - 0x002EA4 00:AE94: A9 30     LDA #$30
C - - - - - 0x002EA6 00:AE96: 85 24     STA ram_0024
C - - - - - 0x002EA8 00:AE98: A9 ED     LDA #<tbl_94ED_spr_stairs
C - - - - - 0x002EAA 00:AE9A: 85 45     STA ram_0045
C - - - - - 0x002EAC 00:AE9C: A9 94     LDA #>tbl_94ED_spr_stairs
C - - - - - 0x002EAE 00:AE9E: 85 46     STA ram_0046
C - - - - - 0x002EB0 00:AEA0: 20 CE C0  JSR sub_C0CE
C - - - - - 0x002EB3 00:AEA3: A9 01     LDA #$01
C - - - - - 0x002EB5 00:AEA5: 8D 8B 03  STA ram_038B
C - - - - - 0x002EB8 00:AEA8: 8D 21 03  STA ram_0321

bra_AEAB_RTS:
C - - - - - 0x002EBB 00:AEAB: 60        RTS

sub_AEAC:
C - - - - - 0x002EBC 00:AEAC: AD 43 06  LDA ram_0643
C - - - - - 0x002EBF 00:AEAF: F0 11     BEQ bra_AEC2_RTS
C - - - - - 0x002EC1 00:AEB1: A5 AA     LDA ram_00AA
C - - - - - 0x002EC3 00:AEB3: D0 0E     BNE bra_AEC3
C - - - - - 0x002EC5 00:AEB5: A5 AB     LDA ram_00AB
C - - - - - 0x002EC7 00:AEB7: D0 0A     BNE bra_AEC3
C - - - - - 0x002EC9 00:AEB9: A5 AC     LDA ram_00AC
C - - - - - 0x002ECB 00:AEBB: D0 06     BNE bra_AEC3
C - - - - - 0x002ECD 00:AEBD: A9 00     LDA #$00
C - - - - - 0x002ECF 00:AEBF: 8D 43 06  STA ram_0643

bra_AEC2_RTS:
C - - - - - 0x002ED2 00:AEC2: 60        RTS

bra_AEC3:
C - - - - - 0x002ED3 00:AEC3: AE 3B 06  LDX ram_063B
C - - - - - 0x002ED6 00:AEC6: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x002ED9 00:AEC9: 0A        ASL
C - - - - - 0x002EDA 00:AECA: AA        TAX
C - - - - - 0x002EDB 00:AECB: BD C9 8D  LDA tbl_8DC9_table,X
C - - - - - 0x002EDE 00:AECE: 85 C1     STA ram_00C1
C - - - - - 0x002EE0 00:AED0: BD CA 8D  LDA tbl_8DC9_table+1,X
C - - - - - 0x002EE3 00:AED3: 85 C2     STA ram_00C2
C - - - - - 0x002EE5 00:AED5: A0 00     LDY #$00
C - - - - - 0x002EE7 00:AED7: B1 C1     LDA (ram_00C1),Y
C - - - - - 0x002EE9 00:AED9: C5 16     CMP ram_0016
C - - - - - 0x002EEB 00:AEDB: B0 14     BCS bra_AEF1
C - - - - - 0x002EED 00:AEDD: C8        INY
C - - - - - 0x002EEE 00:AEDE: B1 C1     LDA (ram_00C1),Y
C - - - - - 0x002EF0 00:AEE0: C5 16     CMP ram_0016
C - - - - - 0x002EF2 00:AEE2: 90 0E     BCC bra_AEF2
C - - - - - 0x002EF4 00:AEE4: C8        INY
C - - - - - 0x002EF5 00:AEE5: B1 C1     LDA (ram_00C1),Y
C - - - - - 0x002EF7 00:AEE7: 85 C4     STA ram_00C4
C - - - - - 0x002EF9 00:AEE9: A9 01     LDA #$01
C - - - - - 0x002EFB 00:AEEB: 85 B6     STA ram_00B6
C - - - - - 0x002EFD 00:AEED: 85 C3     STA ram_00C3
C - - - - - 0x002EFF 00:AEEF: D0 1F     BNE bra_AF10

bra_AEF1:
C - - - - - 0x002F01 00:AEF1: C8        INY

bra_AEF2:
C - - - - - 0x002F02 00:AEF2: C8        INY
C - - - - - 0x002F03 00:AEF3: C8        INY
C - - - - - 0x002F04 00:AEF4: B1 C1     LDA (ram_00C1),Y
C - - - - - 0x002F06 00:AEF6: C5 16     CMP ram_0016
C - - - - - 0x002F08 00:AEF8: 90 01     BCC bra_AEFB
C - - - - - 0x002F0A 00:AEFA: 60        RTS

bra_AEFB:
C - - - - - 0x002F0B 00:AEFB: C8        INY
C - - - - - 0x002F0C 00:AEFC: B1 C1     LDA (ram_00C1),Y
C - - - - - 0x002F0E 00:AEFE: C5 16     CMP ram_0016
C - - - - - 0x002F10 00:AF00: B0 01     BCS bra_AF03
C - - - - - 0x002F12 00:AF02: 60        RTS

bra_AF03:
C - - - - - 0x002F13 00:AF03: C8        INY
C - - - - - 0x002F14 00:AF04: B1 C1     LDA (ram_00C1),Y
C - - - - - 0x002F16 00:AF06: 85 C4     STA ram_00C4
C - - - - - 0x002F18 00:AF08: A9 01     LDA #$01
C - - - - - 0x002F1A 00:AF0A: 85 B7     STA ram_00B7
C - - - - - 0x002F1C 00:AF0C: A9 03     LDA #$03
C - - - - - 0x002F1E 00:AF0E: 85 C3     STA ram_00C3

bra_AF10:
C - - - - - 0x002F20 00:AF10: A5 AA     LDA ram_00AA
C - - - - - 0x002F22 00:AF12: F0 28     BEQ bra_AF3C
C - - - - - 0x002F24 00:AF14: A9 00     LDA #$00
C - - - - - 0x002F26 00:AF16: 85 AA     STA ram_00AA
C - - - - - 0x002F28 00:AF18: 85 B8     STA ram_00B8
C - - - - - 0x002F2A 00:AF1A: A5 C4     LDA ram_00C4
C - - - - - 0x002F2C 00:AF1C: 85 64     STA ram_0064
C - - - - - 0x002F2E 00:AF1E: A9 F8     LDA #$F8
C - - - - - 0x002F30 00:AF20: 85 60     STA ram_0060
C - - - - - 0x002F32 00:AF22: A5 C3     LDA ram_00C3
C - - - - - 0x002F34 00:AF24: 85 5C     STA ram_005C
C - - - - - 0x002F36 00:AF26: A5 B6     LDA ram_00B6
C - - - - - 0x002F38 00:AF28: F0 09     BEQ bra_AF33
C - - - - - 0x002F3A 00:AF2A: A5 B6     LDA ram_00B6
C - - - - - 0x002F3C 00:AF2C: 85 B1     STA ram_00B1
C - - - - - 0x002F3E 00:AF2E: A9 00     LDA #$00
C - - - - - 0x002F40 00:AF30: 85 B6     STA ram_00B6
C - - - - - 0x002F42 00:AF32: 60        RTS

bra_AF33:
C - - - - - 0x002F43 00:AF33: A5 B7     LDA ram_00B7
C - - - - - 0x002F45 00:AF35: 85 AE     STA ram_00AE
C - - - - - 0x002F47 00:AF37: A9 00     LDA #$00
C - - - - - 0x002F49 00:AF39: 85 B7     STA ram_00B7
C - - - - - 0x002F4B 00:AF3B: 60        RTS

bra_AF3C:
C - - - - - 0x002F4C 00:AF3C: A5 AB     LDA ram_00AB
C - - - - - 0x002F4E 00:AF3E: F0 2A     BEQ bra_AF6A
C - - - - - 0x002F50 00:AF40: A9 00     LDA #$00
C - - - - - 0x002F52 00:AF42: 85 B9     STA ram_00B9
C - - - - - 0x002F54 00:AF44: 85 AB     STA ram_00AB
C - - - - - 0x002F56 00:AF46: A5 C4     LDA ram_00C4
C - - - - - 0x002F58 00:AF48: 85 65     STA ram_0065
C - - - - - 0x002F5A 00:AF4A: A9 F8     LDA #$F8
C - - - - - 0x002F5C 00:AF4C: 85 61     STA ram_0061
C - - - - - 0x002F5E 00:AF4E: A5 C3     LDA ram_00C3
C - - - - - 0x002F60 00:AF50: 85 5D     STA ram_005D
C - - - - - 0x002F62 00:AF52: A5 B6     LDA ram_00B6
C - - - - - 0x002F64 00:AF54: F0 0A     BEQ bra_AF60
C - - - - - 0x002F66 00:AF56: A5 B6     LDA ram_00B6
C - - - - - 0x002F68 00:AF58: 85 B2     STA ram_00B2
C - - - - - 0x002F6A 00:AF5A: A9 00     LDA #$00
C - - - - - 0x002F6C 00:AF5C: 85 B6     STA ram_00B6
C - - - - - 0x002F6E 00:AF5E: F0 32     BEQ bra_AF92_RTS

bra_AF60:
C - - - - - 0x002F70 00:AF60: A5 B7     LDA ram_00B7
C - - - - - 0x002F72 00:AF62: 85 AF     STA ram_00AF
C - - - - - 0x002F74 00:AF64: A9 00     LDA #$00
C - - - - - 0x002F76 00:AF66: 85 B7     STA ram_00B7
C - - - - - 0x002F78 00:AF68: F0 28     BEQ bra_AF92_RTS

bra_AF6A:
C - - - - - 0x002F7A 00:AF6A: A9 00     LDA #$00
C - - - - - 0x002F7C 00:AF6C: 85 BA     STA ram_00BA
C - - - - - 0x002F7E 00:AF6E: 85 AC     STA ram_00AC
C - - - - - 0x002F80 00:AF70: A5 C4     LDA ram_00C4
C - - - - - 0x002F82 00:AF72: 85 66     STA ram_0066
C - - - - - 0x002F84 00:AF74: A9 F8     LDA #$F8
C - - - - - 0x002F86 00:AF76: 85 62     STA ram_0062
C - - - - - 0x002F88 00:AF78: A5 C3     LDA ram_00C3
C - - - - - 0x002F8A 00:AF7A: 85 5E     STA ram_005E
C - - - - - 0x002F8C 00:AF7C: A5 B6     LDA ram_00B6
C - - - - - 0x002F8E 00:AF7E: F0 0A     BEQ bra_AF8A
C - - - - - 0x002F90 00:AF80: A5 B6     LDA ram_00B6
C - - - - - 0x002F92 00:AF82: 85 B3     STA ram_00B3
C - - - - - 0x002F94 00:AF84: A9 00     LDA #$00
C - - - - - 0x002F96 00:AF86: 85 B6     STA ram_00B6
C - - - - - 0x002F98 00:AF88: F0 08     BEQ bra_AF92_RTS

bra_AF8A:
C - - - - - 0x002F9A 00:AF8A: A5 B7     LDA ram_00B7
C - - - - - 0x002F9C 00:AF8C: 85 B0     STA ram_00B0
C - - - - - 0x002F9E 00:AF8E: A9 00     LDA #$00
C - - - - - 0x002FA0 00:AF90: 85 B7     STA ram_00B7

bra_AF92_RTS:
C - - - - - 0x002FA2 00:AF92: 60        RTS

sub_AF93:
C - - - - - 0x002FA3 00:AF93: AE 3B 06  LDX ram_063B
C - - - - - 0x002FA6 00:AF96: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x002FA9 00:AF99: 0A        ASL
C - - - - - 0x002FAA 00:AF9A: AA        TAX
C - - - - - 0x002FAB 00:AF9B: BD 99 8D  LDA tbl_8D99_table,X
C - - - - - 0x002FAE 00:AF9E: 85 BF     STA ram_00BF
C - - - - - 0x002FB0 00:AFA0: BD 9A 8D  LDA tbl_8D99_table+1,X
C - - - - - 0x002FB3 00:AFA3: 85 C0     STA ram_00C0
C - - - - - 0x002FB5 00:AFA5: A0 00     LDY #$00

loc_AFA7:
C D 1 - - - 0x002FB7 00:AFA7: B1 BF     LDA (ram_00BF),Y
C - - - - - 0x002FB9 00:AFA9: C5 16     CMP ram_0016
C - - - - - 0x002FBB 00:AFAB: F0 25     BEQ bra_AFD2
C - - - - - 0x002FBD 00:AFAD: 38        SEC
C - - - - - 0x002FBE 00:AFAE: E9 01     SBC #$01
C - - - - - 0x002FC0 00:AFB0: C5 16     CMP ram_0016
C - - - - - 0x002FC2 00:AFB2: D0 41     BNE bra_AFF5
C - - - - - 0x002FC4 00:AFB4: A5 74     LDA ram_0074
C - - - - - 0x002FC6 00:AFB6: F0 19     BEQ bra_AFD1_RTS
C - - - - - 0x002FC8 00:AFB8: 98        TYA
C - - - - - 0x002FC9 00:AFB9: 0A        ASL
C - - - - - 0x002FCA 00:AFBA: 0A        ASL
C - - - - - 0x002FCB 00:AFBB: AA        TAX
C - - - - - 0x002FCC 00:AFBC: BD 69 02  LDA ram_0269,X
C - - - - - 0x002FCF 00:AFBF: C9 74     CMP #$74
C - - - - - 0x002FD1 00:AFC1: F0 08     BEQ bra_AFCB
C - - - - - 0x002FD3 00:AFC3: C9 A9     CMP #$A9
C - - - - - 0x002FD5 00:AFC5: F0 04     BEQ bra_AFCB
C - - - - - 0x002FD7 00:AFC7: C9 BA     CMP #$BA
C - - - - - 0x002FD9 00:AFC9: D0 06     BNE bra_AFD1_RTS

bra_AFCB:
C - - - - - 0x002FDB 00:AFCB: B9 00 05  LDA ram_0500,Y
C - - - - - 0x002FDE 00:AFCE: 9D 68 02  STA ram_0268,X

bra_AFD1_RTS:
C - - - - - 0x002FE1 00:AFD1: 60        RTS

bra_AFD2:
C - - - - - 0x002FE2 00:AFD2: A5 73     LDA ram_0073
C - - - - - 0x002FE4 00:AFD4: F0 FB     BEQ bra_AFD1_RTS
C - - - - - 0x002FE6 00:AFD6: 98        TYA
C - - - - - 0x002FE7 00:AFD7: 0A        ASL
C - - - - - 0x002FE8 00:AFD8: 0A        ASL
C - - - - - 0x002FE9 00:AFD9: AA        TAX
C - - - - - 0x002FEA 00:AFDA: BD 69 02  LDA ram_0269,X
C - - - - - 0x002FED 00:AFDD: C9 74     CMP #$74
C - - - - - 0x002FEF 00:AFDF: F0 08     BEQ bra_AFE9
C - - - - - 0x002FF1 00:AFE1: C9 A9     CMP #$A9
C - - - - - 0x002FF3 00:AFE3: F0 04     BEQ bra_AFE9
C - - - - - 0x002FF5 00:AFE5: C9 BA     CMP #$BA
C - - - - - 0x002FF7 00:AFE7: D0 0B     BNE bra_AFF4_RTS

bra_AFE9:
C - - - - - 0x002FF9 00:AFE9: BD 68 02  LDA ram_0268,X
C - - - - - 0x002FFC 00:AFEC: 99 00 05  STA ram_0500,Y
C - - - - - 0x002FFF 00:AFEF: A9 F8     LDA #$F8
C - - - - - 0x003001 00:AFF1: 9D 68 02  STA ram_0268,X

bra_AFF4_RTS:
C - - - - - 0x003004 00:AFF4: 60        RTS

bra_AFF5:
C - - - - - 0x003005 00:AFF5: C8        INY
C - - - - - 0x003006 00:AFF6: B1 BF     LDA (ram_00BF),Y
C - - - - - 0x003008 00:AFF8: C5 16     CMP ram_0016
C - - - - - 0x00300A 00:AFFA: F0 25     BEQ bra_B021
C - - - - - 0x00300C 00:AFFC: 38        SEC
C - - - - - 0x00300D 00:AFFD: E9 01     SBC #$01
C - - - - - 0x00300F 00:AFFF: C5 16     CMP ram_0016
C - - - - - 0x003011 00:B001: D0 41     BNE bra_B044
C - - - - - 0x003013 00:B003: A5 74     LDA ram_0074
C - - - - - 0x003015 00:B005: F0 19     BEQ bra_B020_RTS
C - - - - - 0x003017 00:B007: 98        TYA
C - - - - - 0x003018 00:B008: 0A        ASL
C - - - - - 0x003019 00:B009: 0A        ASL
C - - - - - 0x00301A 00:B00A: AA        TAX
C - - - - - 0x00301B 00:B00B: BD 69 02  LDA ram_0269,X
C - - - - - 0x00301E 00:B00E: C9 7B     CMP #$7B
C - - - - - 0x003020 00:B010: F0 08     BEQ bra_B01A
C - - - - - 0x003022 00:B012: C9 A8     CMP #$A8
C - - - - - 0x003024 00:B014: F0 04     BEQ bra_B01A
C - - - - - 0x003026 00:B016: C9 BB     CMP #$BB
C - - - - - 0x003028 00:B018: D0 06     BNE bra_B020_RTS

bra_B01A:
C - - - - - 0x00302A 00:B01A: B9 00 05  LDA ram_0500,Y
C - - - - - 0x00302D 00:B01D: 9D 68 02  STA ram_0268,X

bra_B020_RTS:
C - - - - - 0x003030 00:B020: 60        RTS

bra_B021:
C - - - - - 0x003031 00:B021: A5 73     LDA ram_0073
C - - - - - 0x003033 00:B023: F0 FB     BEQ bra_B020_RTS
C - - - - - 0x003035 00:B025: 98        TYA
C - - - - - 0x003036 00:B026: 0A        ASL
C - - - - - 0x003037 00:B027: 0A        ASL
C - - - - - 0x003038 00:B028: AA        TAX
C - - - - - 0x003039 00:B029: BD 69 02  LDA ram_0269,X
C - - - - - 0x00303C 00:B02C: C9 7B     CMP #$7B
C - - - - - 0x00303E 00:B02E: F0 08     BEQ bra_B038
C - - - - - 0x003040 00:B030: C9 A8     CMP #$A8
C - - - - - 0x003042 00:B032: F0 04     BEQ bra_B038
C - - - - - 0x003044 00:B034: C9 BB     CMP #$BB
C - - - - - 0x003046 00:B036: D0 0B     BNE bra_B043_RTS

bra_B038:
C - - - - - 0x003048 00:B038: BD 68 02  LDA ram_0268,X
C - - - - - 0x00304B 00:B03B: 99 00 05  STA ram_0500,Y
C - - - - - 0x00304E 00:B03E: A9 F8     LDA #$F8
C - - - - - 0x003050 00:B040: 9D 68 02  STA ram_0268,X

bra_B043_RTS:
C - - - - - 0x003053 00:B043: 60        RTS

bra_B044:
C - - - - - 0x003054 00:B044: C8        INY
C - - - - - 0x003055 00:B045: B1 BF     LDA (ram_00BF),Y
C - - - - - 0x003057 00:B047: C9 FF     CMP #$FF
C - - - - - 0x003059 00:B049: D0 01     BNE bra_B04C
C - - - - - 0x00305B 00:B04B: 60        RTS

bra_B04C:
C - - - - - 0x00305C 00:B04C: C5 16     CMP ram_0016
C - - - - - 0x00305E 00:B04E: 90 24     BCC bra_B074
C - - - - - 0x003060 00:B050: 98        TYA
C - - - - - 0x003061 00:B051: 0A        ASL
C - - - - - 0x003062 00:B052: 0A        ASL
C - - - - - 0x003063 00:B053: AA        TAX
C - - - - - 0x003064 00:B054: BD 69 02  LDA ram_0269,X
C - - - - - 0x003067 00:B057: C9 74     CMP #$74
C - - - - - 0x003069 00:B059: F0 08     BEQ bra_B063
C - - - - - 0x00306B 00:B05B: C9 A9     CMP #$A9
C - - - - - 0x00306D 00:B05D: F0 04     BEQ bra_B063
C - - - - - 0x00306F 00:B05F: C9 BA     CMP #$BA
C - - - - - 0x003071 00:B061: D0 2A     BNE bra_B08D

bra_B063:
C - - - - - 0x003073 00:B063: BD 68 02  LDA ram_0268,X
C - - - - - 0x003076 00:B066: C9 F8     CMP #$F8
C - - - - - 0x003078 00:B068: F0 23     BEQ bra_B08D
C - - - - - 0x00307A 00:B06A: 99 00 05  STA ram_0500,Y
C - - - - - 0x00307D 00:B06D: A9 F8     LDA #$F8
C - - - - - 0x00307F 00:B06F: 9D 68 02  STA ram_0268,X
C - - - - - 0x003082 00:B072: D0 19     BNE bra_B08D

bra_B074:
C - - - - - 0x003084 00:B074: 98        TYA
C - - - - - 0x003085 00:B075: 0A        ASL
C - - - - - 0x003086 00:B076: 0A        ASL
C - - - - - 0x003087 00:B077: AA        TAX
C - - - - - 0x003088 00:B078: BD 69 02  LDA ram_0269,X
C - - - - - 0x00308B 00:B07B: C9 74     CMP #$74
C - - - - - 0x00308D 00:B07D: F0 08     BEQ bra_B087
C - - - - - 0x00308F 00:B07F: C9 A9     CMP #$A9
C - - - - - 0x003091 00:B081: F0 04     BEQ bra_B087
C - - - - - 0x003093 00:B083: C9 BA     CMP #$BA
C - - - - - 0x003095 00:B085: D0 06     BNE bra_B08D

bra_B087:
C - - - - - 0x003097 00:B087: B9 00 05  LDA ram_0500,Y
C - - - - - 0x00309A 00:B08A: 9D 68 02  STA ram_0268,X

bra_B08D:
C - - - - - 0x00309D 00:B08D: C8        INY
C - - - - - 0x00309E 00:B08E: B1 BF     LDA (ram_00BF),Y
C - - - - - 0x0030A0 00:B090: C5 16     CMP ram_0016
C - - - - - 0x0030A2 00:B092: 90 24     BCC bra_B0B8
C - - - - - 0x0030A4 00:B094: 98        TYA
C - - - - - 0x0030A5 00:B095: 0A        ASL
C - - - - - 0x0030A6 00:B096: 0A        ASL
C - - - - - 0x0030A7 00:B097: AA        TAX
C - - - - - 0x0030A8 00:B098: BD 69 02  LDA ram_0269,X
C - - - - - 0x0030AB 00:B09B: C9 7B     CMP #$7B
C - - - - - 0x0030AD 00:B09D: F0 08     BEQ bra_B0A7
C - - - - - 0x0030AF 00:B09F: C9 A8     CMP #$A8
C - - - - - 0x0030B1 00:B0A1: F0 04     BEQ bra_B0A7
C - - - - - 0x0030B3 00:B0A3: C9 BB     CMP #$BB
C - - - - - 0x0030B5 00:B0A5: D0 2A     BNE bra_B0D1

bra_B0A7:
C - - - - - 0x0030B7 00:B0A7: BD 68 02  LDA ram_0268,X
C - - - - - 0x0030BA 00:B0AA: C9 F8     CMP #$F8
C - - - - - 0x0030BC 00:B0AC: F0 23     BEQ bra_B0D1
C - - - - - 0x0030BE 00:B0AE: 99 00 05  STA ram_0500,Y
C - - - - - 0x0030C1 00:B0B1: A9 F8     LDA #$F8
C - - - - - 0x0030C3 00:B0B3: 9D 68 02  STA ram_0268,X
C - - - - - 0x0030C6 00:B0B6: D0 19     BNE bra_B0D1

bra_B0B8:
C - - - - - 0x0030C8 00:B0B8: 98        TYA
C - - - - - 0x0030C9 00:B0B9: 0A        ASL
C - - - - - 0x0030CA 00:B0BA: 0A        ASL
C - - - - - 0x0030CB 00:B0BB: AA        TAX
C - - - - - 0x0030CC 00:B0BC: BD 69 02  LDA ram_0269,X
C - - - - - 0x0030CF 00:B0BF: C9 7B     CMP #$7B
C - - - - - 0x0030D1 00:B0C1: F0 08     BEQ bra_B0CB
C - - - - - 0x0030D3 00:B0C3: C9 A8     CMP #$A8
C - - - - - 0x0030D5 00:B0C5: F0 04     BEQ bra_B0CB
C - - - - - 0x0030D7 00:B0C7: C9 BB     CMP #$BB
C - - - - - 0x0030D9 00:B0C9: D0 06     BNE bra_B0D1

bra_B0CB:
C - - - - - 0x0030DB 00:B0CB: B9 00 05  LDA ram_0500,Y
C - - - - - 0x0030DE 00:B0CE: 9D 68 02  STA ram_0268,X

bra_B0D1:
C - - - - - 0x0030E1 00:B0D1: C8        INY
C - - - - - 0x0030E2 00:B0D2: B1 BF     LDA (ram_00BF),Y
C - - - - - 0x0030E4 00:B0D4: C9 FF     CMP #$FF
C - - - - - 0x0030E6 00:B0D6: F0 03     BEQ bra_B0DB_RTS
C - - - - - 0x0030E8 00:B0D8: 4C A7 AF  JMP loc_AFA7

bra_B0DB_RTS:
- - - - - - 0x0030EB 00:B0DB: 60        RTS

sub_B0DC:
C - - - - - 0x0030EC 00:B0DC: A5 97     LDA ram_0097
C - - - - - 0x0030EE 00:B0DE: F0 1B     BEQ bra_B0FB_RTS
C - - - - - 0x0030F0 00:B0E0: AD 54 03  LDA ram_0354
C - - - - - 0x0030F3 00:B0E3: D0 17     BNE bra_B0FC
C - - - - - 0x0030F5 00:B0E5: A5 EB     LDA ram_00EB
C - - - - - 0x0030F7 00:B0E7: F0 0B     BEQ bra_B0F4
C - - - - - 0x0030F9 00:B0E9: A9 00     LDA #$00
C - - - - - 0x0030FB 00:B0EB: 85 EB     STA ram_00EB
C - - - - - 0x0030FD 00:B0ED: A9 01     LDA #$01
C - - - - - 0x0030FF 00:B0EF: 85 9E     STA ram_009E
C - - - - - 0x003101 00:B0F1: 8D 54 03  STA ram_0354

bra_B0F4:
C - - - - - 0x003104 00:B0F4: A9 01     LDA #$01
C - - - - - 0x003106 00:B0F6: 85 1C     STA ram_001C
C - - - - - 0x003108 00:B0F8: 8D 4B 03  STA ram_034B

bra_B0FB_RTS:
C - - - - - 0x00310B 00:B0FB: 60        RTS

bra_B0FC:
C - - - - - 0x00310C 00:B0FC: AD 55 03  LDA ram_0355
C - - - - - 0x00310F 00:B0FF: D0 18     BNE bra_B119
C - - - - - 0x003111 00:B101: A5 7C     LDA ram_007C
C - - - - - 0x003113 00:B103: C9 02     CMP #$02
C - - - - - 0x003115 00:B105: D0 0C     BNE bra_B113
C - - - - - 0x003117 00:B107: A9 00     LDA #$00
C - - - - - 0x003119 00:B109: 85 EB     STA ram_00EB
C - - - - - 0x00311B 00:B10B: A9 08     LDA #$08
C - - - - - 0x00311D 00:B10D: 8D 4B 03  STA ram_034B
C - - - - - 0x003120 00:B110: 8D 55 03  STA ram_0355

bra_B113:
C - - - - - 0x003123 00:B113: AD 4B 03  LDA ram_034B
C - - - - - 0x003126 00:B116: 85 1C     STA ram_001C
C - - - - - 0x003128 00:B118: 60        RTS

bra_B119:
C - - - - - 0x003129 00:B119: A5 7C     LDA ram_007C
C - - - - - 0x00312B 00:B11B: C9 05     CMP #$05
C - - - - - 0x00312D 00:B11D: F0 04     BEQ bra_B123
C - - - - - 0x00312F 00:B11F: C9 09     CMP #$09
C - - - - - 0x003131 00:B121: D0 08     BNE bra_B12B

bra_B123:
C - - - - - 0x003133 00:B123: A5 7B     LDA ram_007B
C - - - - - 0x003135 00:B125: D0 04     BNE bra_B12B
C - - - - - 0x003137 00:B127: A9 01     LDA #$01
C - - - - - 0x003139 00:B129: 85 A8     STA ram_00A8

bra_B12B:
C - - - - - 0x00313B 00:B12B: A5 EB     LDA ram_00EB
C - - - - - 0x00313D 00:B12D: F0 0A     BEQ bra_B139
C - - - - - 0x00313F 00:B12F: A9 00     LDA #$00
C - - - - - 0x003141 00:B131: 85 EB     STA ram_00EB
C - - - - - 0x003143 00:B133: 20 89 BC  JSR sub_BC89
C - - - - - 0x003146 00:B136: 8D 4B 03  STA ram_034B

bra_B139:
C - - - - - 0x003149 00:B139: AD 4B 03  LDA ram_034B
C - - - - - 0x00314C 00:B13C: 85 1C     STA ram_001C
C - - - - - 0x00314E 00:B13E: 60        RTS

sub_B13F:
C - - - - - 0x00314F 00:B13F: A5 73     LDA ram_0073
C - - - - - 0x003151 00:B141: F0 04     BEQ bra_B147
C - - - - - 0x003153 00:B143: 85 0F     STA ram_000F
C - - - - - 0x003155 00:B145: D0 08     BNE bra_B14F

bra_B147:
C - - - - - 0x003157 00:B147: A5 74     LDA ram_0074
C - - - - - 0x003159 00:B149: F0 1B     BEQ bra_B166_RTS
C - - - - - 0x00315B 00:B14B: A9 00     LDA #$00
C - - - - - 0x00315D 00:B14D: 85 0F     STA ram_000F

bra_B14F:
C - - - - - 0x00315F 00:B14F: A2 00     LDX #$00

bra_B151:
C - - - - - 0x003161 00:B151: A5 0F     LDA ram_000F
C - - - - - 0x003163 00:B153: D0 06     BNE bra_B15B
C - - - - - 0x003165 00:B155: FE 6B 02  INC ram_026B,X
C - - - - - 0x003168 00:B158: 4C 5E B1  JMP loc_B15E

bra_B15B:
C - - - - - 0x00316B 00:B15B: DE 6B 02  DEC ram_026B,X

loc_B15E:
C D 1 - - - 0x00316E 00:B15E: E8        INX
C - - - - - 0x00316F 00:B15F: E8        INX
C - - - - - 0x003170 00:B160: E8        INX
C - - - - - 0x003171 00:B161: E8        INX
C - - - - - 0x003172 00:B162: E0 98     CPX #$98
C - - - - - 0x003174 00:B164: 90 EB     BCC bra_B151

bra_B166_RTS:
C - - - - - 0x003176 00:B166: 60        RTS

sub_B167:
C - - - - - 0x003177 00:B167: A0 05     LDY #$05
C - - - - - 0x003179 00:B169: A9 20     LDA #$20
C - - - - - 0x00317B 00:B16B: 8D 06 20  STA $2006
C - - - - - 0x00317E 00:B16E: A9 4E     LDA #$4E
C - - - - - 0x003180 00:B170: 8D 06 20  STA $2006

bra_B173:
C - - - - - 0x003183 00:B173: A9 16     LDA #$16
C - - - - - 0x003185 00:B175: 8D 07 20  STA $2007
C - - - - - 0x003188 00:B178: 88        DEY
C - - - - - 0x003189 00:B179: 98        TYA
C - - - - - 0x00318A 00:B17A: D0 F7     BNE bra_B173
C - - - - - 0x00318C 00:B17C: AE 3B 06  LDX ram_063B
C - - - - - 0x00318F 00:B17F: BD 33 06  LDA con_player_current_money,X
C - - - - - 0x003192 00:B182: 8D 1C 03  STA ram_031C
C - - - - - 0x003195 00:B185: A9 00     LDA #$00
C - - - - - 0x003197 00:B187: 85 3C     STA ram_003C
C - - - - - 0x003199 00:B189: A0 05     LDY #$05

bra_B18B:
C - - - - - 0x00319B 00:B18B: AD 1C 03  LDA ram_031C
C - - - - - 0x00319E 00:B18E: C9 0A     CMP #$0A
C - - - - - 0x0031A0 00:B190: 90 0A     BCC bra_B19C
C - - - - - 0x0031A2 00:B192: 38        SEC
C - - - - - 0x0031A3 00:B193: E9 0A     SBC #$0A
C - - - - - 0x0031A5 00:B195: 8D 1C 03  STA ram_031C
C - - - - - 0x0031A8 00:B198: E6 3C     INC ram_003C
C - - - - - 0x0031AA 00:B19A: D0 EF     BNE bra_B18B

bra_B19C:
C - - - - - 0x0031AC 00:B19C: AD 1C 03  LDA ram_031C
C - - - - - 0x0031AF 00:B19F: 18        CLC
C - - - - - 0x0031B0 00:B1A0: 69 D0     ADC #$D0
C - - - - - 0x0031B2 00:B1A2: 99 30 05  STA ram_0530,Y
C - - - - - 0x0031B5 00:B1A5: A5 3C     LDA ram_003C
C - - - - - 0x0031B7 00:B1A7: F0 0C     BEQ bra_B1B5
C - - - - - 0x0031B9 00:B1A9: A5 3C     LDA ram_003C
C - - - - - 0x0031BB 00:B1AB: 8D 1C 03  STA ram_031C
C - - - - - 0x0031BE 00:B1AE: 88        DEY
C - - - - - 0x0031BF 00:B1AF: A9 00     LDA #$00
C - - - - - 0x0031C1 00:B1B1: 85 3C     STA ram_003C
C - - - - - 0x0031C3 00:B1B3: F0 D6     BEQ bra_B18B

bra_B1B5:
C - - - - - 0x0031C5 00:B1B5: A9 20     LDA #$20
C - - - - - 0x0031C7 00:B1B7: 8D 06 20  STA $2006
C - - - - - 0x0031CA 00:B1BA: A9 4E     LDA #$4E
C - - - - - 0x0031CC 00:B1BC: 8D 06 20  STA $2006

bra_B1BF:
C - - - - - 0x0031CF 00:B1BF: 98        TYA
C - - - - - 0x0031D0 00:B1C0: C9 06     CMP #$06
C - - - - - 0x0031D2 00:B1C2: F0 09     BEQ bra_B1CD
C - - - - - 0x0031D4 00:B1C4: B9 30 05  LDA ram_0530,Y
C - - - - - 0x0031D7 00:B1C7: 8D 07 20  STA $2007
C - - - - - 0x0031DA 00:B1CA: C8        INY
C - - - - - 0x0031DB 00:B1CB: D0 F2     BNE bra_B1BF

bra_B1CD:
C - - - - - 0x0031DD 00:B1CD: A9 D0     LDA #$D0
C - - - - - 0x0031DF 00:B1CF: 8D 07 20  STA $2007
C - - - - - 0x0031E2 00:B1D2: A9 D0     LDA #$D0
C - - - - - 0x0031E4 00:B1D4: 8D 07 20  STA $2007
C - - - - - 0x0031E7 00:B1D7: 20 A6 AC  JSR sub_ACA6
C - - - - - 0x0031EA 00:B1DA: 60        RTS

sub_B1DB:
C - - - - - 0x0031EB 00:B1DB: A2 00     LDX #$00

bra_B1DD:
C - - - - - 0x0031ED 00:B1DD: BD 00 02  LDA ram_0200,X
C - - - - - 0x0031F0 00:B1E0: 9D 00 07  STA ram_0700,X
C - - - - - 0x0031F3 00:B1E3: E8        INX
C - - - - - 0x0031F4 00:B1E4: D0 F7     BNE bra_B1DD
C - - - - - 0x0031F6 00:B1E6: A5 16     LDA ram_0016
C - - - - - 0x0031F8 00:B1E8: 8D 00 04  STA ram_0400
C - - - - - 0x0031FB 00:B1EB: A5 17     LDA ram_0017
C - - - - - 0x0031FD 00:B1ED: 8D 01 04  STA ram_0401
C - - - - - 0x003200 00:B1F0: A9 00     LDA #$00
C - - - - - 0x003202 00:B1F2: 8D 02 04  STA ram_0402
C - - - - - 0x003205 00:B1F5: A9 00     LDA #$00
C - - - - - 0x003207 00:B1F7: 8D 03 04  STA ram_0403
C - - - - - 0x00320A 00:B1FA: 20 BD 97  JSR sub_97BD
C - - - - - 0x00320D 00:B1FD: A9 05     LDA #$05
C - - - - - 0x00320F 00:B1FF: 85 C5     STA ram_00C5
C - - - - - 0x003211 00:B201: A2 00     LDX #$00

loc_B203:
C D 1 - - - 0x003213 00:B203: A5 C5     LDA ram_00C5
C - - - - - 0x003215 00:B205: F0 15     BEQ bra_B21C
C - - - - - 0x003217 00:B207: BD 00 05  LDA ram_0500,X
C - - - - - 0x00321A 00:B20A: 99 04 04  STA ram_0404,Y
C - - - - - 0x00321D 00:B20D: C8        INY
C - - - - - 0x00321E 00:B20E: BD 01 05  LDA ram_0501,X
C - - - - - 0x003221 00:B211: 99 04 04  STA ram_0404,Y
C - - - - - 0x003224 00:B214: C8        INY
C - - - - - 0x003225 00:B215: E8        INX
C - - - - - 0x003226 00:B216: E8        INX
C - - - - - 0x003227 00:B217: C6 C5     DEC ram_00C5
C - - - - - 0x003229 00:B219: 4C 03 B2  JMP loc_B203

bra_B21C:
C - - - - - 0x00322C 00:B21C: A5 2D     LDA con_player_position_y
C - - - - - 0x00322E 00:B21E: 99 04 04  STA ram_0404,Y
C - - - - - 0x003231 00:B221: C8        INY
C - - - - - 0x003232 00:B222: A5 2C     LDA con_player_position_x
C - - - - - 0x003234 00:B224: 99 04 04  STA ram_0404,Y
C - - - - - 0x003237 00:B227: A5 D5     LDA ram_00D5
C - - - - - 0x003239 00:B229: F0 20     BEQ bra_B24B_RTS
C - - - - - 0x00323B 00:B22B: C8        INY
C - - - - - 0x00323C 00:B22C: A5 F5     LDA ram_00F5
C - - - - - 0x00323E 00:B22E: 99 04 04  STA ram_0404,Y
C - - - - - 0x003241 00:B231: C8        INY
C - - - - - 0x003242 00:B232: A5 F0     LDA ram_00F0
C - - - - - 0x003244 00:B234: 99 04 04  STA ram_0404,Y
C - - - - - 0x003247 00:B237: C8        INY
C - - - - - 0x003248 00:B238: A5 F1     LDA ram_00F1
C - - - - - 0x00324A 00:B23A: 99 04 04  STA ram_0404,Y
C - - - - - 0x00324D 00:B23D: C8        INY
C - - - - - 0x00324E 00:B23E: A5 DB     LDA ram_00DB
C - - - - - 0x003250 00:B240: 99 04 04  STA ram_0404,Y
C - - - - - 0x003253 00:B243: A9 00     LDA #$00
C - - - - - 0x003255 00:B245: 85 7B     STA ram_007B
C - - - - - 0x003257 00:B247: 85 7C     STA ram_007C
C - - - - - 0x003259 00:B249: 85 50     STA ram_0050

bra_B24B_RTS:
C - - - - - 0x00325B 00:B24B: 60        RTS

sub_B24C:
C - - - - - 0x00325C 00:B24C: A2 00     LDX #$00

bra_B24E:
C - - - - - 0x00325E 00:B24E: BD 00 07  LDA ram_0700,X
C - - - - - 0x003261 00:B251: 9D 00 02  STA ram_0200,X
C - - - - - 0x003264 00:B254: E8        INX
C - - - - - 0x003265 00:B255: D0 F7     BNE bra_B24E
C - - - - - 0x003267 00:B257: AD 00 04  LDA ram_0400
C - - - - - 0x00326A 00:B25A: 85 16     STA ram_0016
C - - - - - 0x00326C 00:B25C: 8D 05 20  STA $2005
C - - - - - 0x00326F 00:B25F: AD 01 04  LDA ram_0401
C - - - - - 0x003272 00:B262: 85 17     STA ram_0017
C - - - - - 0x003274 00:B264: 8D 05 20  STA $2005
C - - - - - 0x003277 00:B267: AD 02 04  LDA ram_0402
C - - - - - 0x00327A 00:B26A: 85 74     STA ram_0074
C - - - - - 0x00327C 00:B26C: AD 03 04  LDA ram_0403
C - - - - - 0x00327F 00:B26F: 85 73     STA ram_0073
C - - - - - 0x003281 00:B271: 20 89 97  JSR sub_9789
C - - - - - 0x003284 00:B274: A9 05     LDA #$05
C - - - - - 0x003286 00:B276: 85 C5     STA ram_00C5
C - - - - - 0x003288 00:B278: A0 00     LDY #$00

loc_B27A:
C D 1 - - - 0x00328A 00:B27A: A5 C5     LDA ram_00C5
C - - - - - 0x00328C 00:B27C: F0 15     BEQ bra_B293
C - - - - - 0x00328E 00:B27E: BD 04 04  LDA ram_0404,X
C - - - - - 0x003291 00:B281: 99 00 05  STA ram_0500,Y
C - - - - - 0x003294 00:B284: E8        INX
C - - - - - 0x003295 00:B285: BD 04 04  LDA ram_0404,X
C - - - - - 0x003298 00:B288: 99 01 05  STA ram_0501,Y
C - - - - - 0x00329B 00:B28B: E8        INX
C - - - - - 0x00329C 00:B28C: C8        INY
C - - - - - 0x00329D 00:B28D: C8        INY
C - - - - - 0x00329E 00:B28E: C6 C5     DEC ram_00C5
C - - - - - 0x0032A0 00:B290: 4C 7A B2  JMP loc_B27A

bra_B293:
C - - - - - 0x0032A3 00:B293: BD 04 04  LDA ram_0404,X
C - - - - - 0x0032A6 00:B296: 85 2D     STA con_player_position_y
C - - - - - 0x0032A8 00:B298: E8        INX
C - - - - - 0x0032A9 00:B299: BD 04 04  LDA ram_0404,X
C - - - - - 0x0032AC 00:B29C: 85 2C     STA con_player_position_x
C - - - - - 0x0032AE 00:B29E: A5 D5     LDA ram_00D5
C - - - - - 0x0032B0 00:B2A0: F0 18     BEQ bra_B2BA_RTS
C - - - - - 0x0032B2 00:B2A2: E8        INX
C - - - - - 0x0032B3 00:B2A3: BD 04 04  LDA ram_0404,X
C - - - - - 0x0032B6 00:B2A6: 85 F5     STA ram_00F5
C - - - - - 0x0032B8 00:B2A8: E8        INX
C - - - - - 0x0032B9 00:B2A9: BD 04 04  LDA ram_0404,X
C - - - - - 0x0032BC 00:B2AC: 85 F0     STA ram_00F0
C - - - - - 0x0032BE 00:B2AE: E8        INX
C - - - - - 0x0032BF 00:B2AF: BD 04 04  LDA ram_0404,X
C - - - - - 0x0032C2 00:B2B2: 85 F1     STA ram_00F1
C - - - - - 0x0032C4 00:B2B4: E8        INX
C - - - - - 0x0032C5 00:B2B5: BD 04 04  LDA ram_0404,X
C - - - - - 0x0032C8 00:B2B8: 85 DB     STA ram_00DB

bra_B2BA_RTS:
C - - - - - 0x0032CA 00:B2BA: 60        RTS

sub_B2BB:
C - - - - - 0x0032CB 00:B2BB: A5 13     LDA ram_0013
C - - - - - 0x0032CD 00:B2BD: D0 01     BNE bra_B2C0

bra_B2BF_RTS:
C - - - - - 0x0032CF 00:B2BF: 60        RTS

bra_B2C0:
C - - - - - 0x0032D0 00:B2C0: A5 7B     LDA ram_007B
C - - - - - 0x0032D2 00:B2C2: C9 1E     CMP #$1E
C - - - - - 0x0032D4 00:B2C4: D0 F9     BNE bra_B2BF_RTS
C - - - - - 0x0032D6 00:B2C6: AE 3B 06  LDX ram_063B
C - - - - - 0x0032D9 00:B2C9: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x0032DC 00:B2CC: C9 03     CMP #$03
C - - - - - 0x0032DE 00:B2CE: F0 0D     BEQ bra_B2DD
C - - - - - 0x0032E0 00:B2D0: C9 04     CMP #$04
C - - - - - 0x0032E2 00:B2D2: F0 09     BEQ bra_B2DD
C - - - - - 0x0032E4 00:B2D4: C9 0A     CMP #$0A
C - - - - - 0x0032E6 00:B2D6: F0 05     BEQ bra_B2DD
C - - - - - 0x0032E8 00:B2D8: C9 02     CMP #$02
C - - - - - 0x0032EA 00:B2DA: F0 01     BEQ bra_B2DD
- - - - - - 0x0032EC 00:B2DC: 60        RTS					; never happen?

bra_B2DD:
C - - - - - 0x0032ED 00:B2DD: AD 32 06  LDA ram_0632
C - - - - - 0x0032F0 00:B2E0: 0A        ASL
C - - - - - 0x0032F1 00:B2E1: AA        TAX
C - - - - - 0x0032F2 00:B2E2: BD 63 92  LDA tbl_9263_river_wave_effect_palettes,X
C - - - - - 0x0032F5 00:B2E5: 85 06     STA ram_0006
C - - - - - 0x0032F7 00:B2E7: BD 64 92  LDA tbl_9263_river_wave_effect_palettes+1,X
C - - - - - 0x0032FA 00:B2EA: 85 07     STA ram_0007
C - - - - - 0x0032FC 00:B2EC: EE 32 06  INC ram_0632
C - - - - - 0x0032FF 00:B2EF: AD 32 06  LDA ram_0632
C - - - - - 0x003302 00:B2F2: C9 03     CMP #$03
C - - - - - 0x003304 00:B2F4: 90 05     BCC bra_B2FB
C - - - - - 0x003306 00:B2F6: A9 00     LDA #$00
C - - - - - 0x003308 00:B2F8: 8D 32 06  STA ram_0632

bra_B2FB:
C - - - - - 0x00330B 00:B2FB: A5 01     LDA ram_0001
C - - - - - 0x00330D 00:B2FD: 29 E7     AND #$E7
C - - - - - 0x00330F 00:B2FF: 8D 01 20  STA $2001
C - - - - - 0x003312 00:B302: 85 01     STA ram_0001
C - - - - - 0x003314 00:B304: A0 00     LDY #$00
C - - - - - 0x003316 00:B306: A2 3F     LDX #$3F
C - - - - - 0x003318 00:B308: A9 0C     LDA #$0C
C - - - - - 0x00331A 00:B30A: 8E 06 20  STX $2006
C - - - - - 0x00331D 00:B30D: 8D 06 20  STA $2006

bra_B310:
C - - - - - 0x003320 00:B310: B1 06     LDA (ram_0006),Y
C - - - - - 0x003322 00:B312: 8D 07 20  STA $2007
C - - - - - 0x003325 00:B315: C8        INY
C - - - - - 0x003326 00:B316: C0 04     CPY #$04			; 4 bytes palette
C - - - - - 0x003328 00:B318: D0 F6     BNE bra_B310
C - - - - - 0x00332A 00:B31A: A5 01     LDA ram_0001
C - - - - - 0x00332C 00:B31C: 09 1E     ORA #$1E
C - - - - - 0x00332E 00:B31E: 8D 01 20  STA $2001
C - - - - - 0x003331 00:B321: 85 01     STA ram_0001
C - - - - - 0x003333 00:B323: A5 00     LDA ram_0000
C - - - - - 0x003335 00:B325: 8D 00 20  STA $2000
C - - - - - 0x003338 00:B328: 60        RTS

sub_B329:
C - - - - - 0x003339 00:B329: AD 16 03  LDA ram_0316
C - - - - - 0x00333C 00:B32C: F0 04     BEQ bra_B332
C - - - - - 0x00333E 00:B32E: A5 18     LDA ram_0018
C - - - - - 0x003340 00:B330: F0 01     BEQ bra_B333

bra_B332:
- - - - - - 0x003342 00:B332: 60        RTS

bra_B333:
C - - - - - 0x003343 00:B333: AD 34 03  LDA con_item_invincible_potion_timer
C - - - - - 0x003346 00:B336: C9 30     CMP #$30				; Max time invincible potion
C - - - - - 0x003348 00:B338: 90 25     BCC bra_B35F
C - - - - - 0x00334A 00:B33A: A9 00     LDA #$00
C - - - - - 0x00334C 00:B33C: 8D 34 03  STA con_item_invincible_potion_timer
C - - - - - 0x00334F 00:B33F: 85 C8     STA ram_00C8
C - - - - - 0x003351 00:B341: 8D 16 03  STA ram_0316
C - - - - - 0x003354 00:B344: 8D 33 03  STA ram_0333
C - - - - - 0x003357 00:B347: A9 01     LDA #$01
C - - - - - 0x003359 00:B349: 85 86     STA ram_0086
C - - - - - 0x00335B 00:B34B: 8D 02 02  STA ram_0202
C - - - - - 0x00335E 00:B34E: 8D 06 02  STA ram_0206
C - - - - - 0x003361 00:B351: 8D 0A 02  STA ram_020A
C - - - - - 0x003364 00:B354: 8D 0E 02  STA ram_020E
C - - - - - 0x003367 00:B357: A9 59     LDA #$59						; invincible potion icon in status bar
C - - - - - 0x003369 00:B359: 85 78     STA ram_0078
C - - - - - 0x00336B 00:B35B: 20 42 97  JSR sub_9742
C - - - - - 0x00336E 00:B35E: 60        RTS

bra_B35F:
C - - - - - 0x00336F 00:B35F: A9 02     LDA #$02
C - - - - - 0x003371 00:B361: 8D 33 03  STA ram_0333
C - - - - - 0x003374 00:B364: 20 81 B3  JSR sub_B381
C - - - - - 0x003377 00:B367: A5 5B     LDA ram_005B
C - - - - - 0x003379 00:B369: C9 08     CMP #$08
C - - - - - 0x00337B 00:B36B: D0 07     BNE bra_B374_RTS
C - - - - - 0x00337D 00:B36D: A9 05     LDA #$05
C - - - - - 0x00337F 00:B36F: 85 D2     STA ram_00D2
C - - - - - 0x003381 00:B371: EE 34 03  INC con_item_invincible_potion_timer		; Increment invincible potion timer

bra_B374_RTS:
C - - - - - 0x003384 00:B374: 60        RTS

sub_B375:
C - - - - - 0x003385 00:B375: A9 60     LDA #$60
C - - - - - 0x003387 00:B377: 8D 31 06  STA ram_0631
C - - - - - 0x00338A 00:B37A: 85 81     STA ram_0081
C - - - - - 0x00338C 00:B37C: 60        RTS

sub_B37D:
C - - - - - 0x00338D 00:B37D: A5 81     LDA ram_0081
C - - - - - 0x00338F 00:B37F: F0 F3     BEQ bra_B374_RTS

sub_B381:
C - - - - - 0x003391 00:B381: A5 9A     LDA ram_009A
C - - - - - 0x003393 00:B383: 29 0F     AND #$0F
C - - - - - 0x003395 00:B385: C9 08     CMP #$08
C - - - - - 0x003397 00:B387: B0 17     BCS bra_B3A0
C - - - - - 0x003399 00:B389: AD 02 02  LDA ram_0202
C - - - - - 0x00339C 00:B38C: 29 FE     AND #$FE
C - - - - - 0x00339E 00:B38E: 0D 33 03  ORA ram_0333
C - - - - - 0x0033A1 00:B391: 8D 02 02  STA ram_0202
C - - - - - 0x0033A4 00:B394: 8D 06 02  STA ram_0206
C - - - - - 0x0033A7 00:B397: 8D 0A 02  STA ram_020A
C - - - - - 0x0033AA 00:B39A: 8D 0E 02  STA ram_020E
C - - - - - 0x0033AD 00:B39D: 4C B4 B3  JMP loc_B3B4

bra_B3A0:
C - - - - - 0x0033B0 00:B3A0: AD 02 02  LDA ram_0202
C - - - - - 0x0033B3 00:B3A3: 09 01     ORA #$01
C - - - - - 0x0033B5 00:B3A5: 0D 33 03  ORA ram_0333
C - - - - - 0x0033B8 00:B3A8: 8D 02 02  STA ram_0202
C - - - - - 0x0033BB 00:B3AB: 8D 06 02  STA ram_0206
C - - - - - 0x0033BE 00:B3AE: 8D 0A 02  STA ram_020A
C - - - - - 0x0033C1 00:B3B1: 8D 0E 02  STA ram_020E

loc_B3B4:
C D 1 - - - 0x0033C4 00:B3B4: A5 C8     LDA ram_00C8
C - - - - - 0x0033C6 00:B3B6: CD 31 06  CMP ram_0631
C - - - - - 0x0033C9 00:B3B9: 90 0B     BCC bra_B3C6
C - - - - - 0x0033CB 00:B3BB: A9 00     LDA #$00
C - - - - - 0x0033CD 00:B3BD: 85 C8     STA ram_00C8
C - - - - - 0x0033CF 00:B3BF: 85 CC     STA ram_00CC
C - - - - - 0x0033D1 00:B3C1: 85 CD     STA ram_00CD
C - - - - - 0x0033D3 00:B3C3: 85 81     STA ram_0081
C - - - - - 0x0033D5 00:B3C5: 60        RTS

bra_B3C6:
C - - - - - 0x0033D6 00:B3C6: E6 C8     INC ram_00C8
C - - - - - 0x0033D8 00:B3C8: 60        RTS

sub_B3C9:
C - - - - - 0x0033D9 00:B3C9: A5 81     LDA ram_0081
C - - - - - 0x0033DB 00:B3CB: F0 22     BEQ bra_B3EF_RTS
C - - - - - 0x0033DD 00:B3CD: E6 5B     INC ram_005B
C - - - - - 0x0033DF 00:B3CF: A5 5B     LDA ram_005B
C - - - - - 0x0033E1 00:B3D1: C9 08     CMP #$08
C - - - - - 0x0033E3 00:B3D3: D0 04     BNE bra_B3D9
C - - - - - 0x0033E5 00:B3D5: A9 02     LDA #$02
C - - - - - 0x0033E7 00:B3D7: D0 0A     BNE bra_B3E3

bra_B3D9:
C - - - - - 0x0033E9 00:B3D9: C9 10     CMP #$10
C - - - - - 0x0033EB 00:B3DB: D0 12     BNE bra_B3EF_RTS
C - - - - - 0x0033ED 00:B3DD: A9 00     LDA #$00
C - - - - - 0x0033EF 00:B3DF: 85 5B     STA ram_005B
C - - - - - 0x0033F1 00:B3E1: A9 01     LDA #$01

bra_B3E3:
C - - - - - 0x0033F3 00:B3E3: 8D 02 02  STA ram_0202
C - - - - - 0x0033F6 00:B3E6: 8D 06 02  STA ram_0206
C - - - - - 0x0033F9 00:B3E9: 8D 0A 02  STA ram_020A
C - - - - - 0x0033FC 00:B3EC: 8D 0E 02  STA ram_020E

bra_B3EF_RTS:
C - - - - - 0x0033FF 00:B3EF: 60        RTS

sub_B3F0:
C - - - - - 0x003400 00:B3F0: A2 00     LDX #$00

bra_B3F2:
C - - - - - 0x003402 00:B3F2: AD 8A 03  LDA ram_038A
C - - - - - 0x003405 00:B3F5: 8D 06 20  STA $2006
C - - - - - 0x003408 00:B3F8: AD 2D 03  LDA ram_032D
C - - - - - 0x00340B 00:B3FB: 8D 06 20  STA $2006
C - - - - - 0x00340E 00:B3FE: A0 00     LDY #$00
C - - - - - 0x003410 00:B400: AD 07 20  LDA $2007

bra_B403:
C - - - - - 0x003413 00:B403: AD 07 20  LDA $2007
C - - - - - 0x003416 00:B406: DD 2F B4  CMP tbl_B42F_validate,X
C - - - - - 0x003419 00:B409: D0 1E     BNE bra_B429
C - - - - - 0x00341B 00:B40B: E8        INX
C - - - - - 0x00341C 00:B40C: C8        INY
C - - - - - 0x00341D 00:B40D: C0 03     CPY #$03
C - - - - - 0x00341F 00:B40F: 90 F2     BCC bra_B403
C - - - - - 0x003421 00:B411: AD 2D 03  LDA ram_032D
C - - - - - 0x003424 00:B414: 18        CLC
C - - - - - 0x003425 00:B415: 69 20     ADC #$20
C - - - - - 0x003427 00:B417: 8D 2D 03  STA ram_032D
C - - - - - 0x00342A 00:B41A: 90 03     BCC bra_B41F
- - - - - - 0x00342C 00:B41C: EE 8A 03  INC ram_038A

bra_B41F:
C - - - - - 0x00342F 00:B41F: E0 09     CPX #var_B42F_validate
C - - - - - 0x003431 00:B421: 90 CF     BCC bra_B3F2
C - - - - - 0x003433 00:B423: A9 00     LDA #$00
C - - - - - 0x003435 00:B425: 8D 87 03  STA ram_0387
C - - - - - 0x003438 00:B428: 60        RTS

bra_B429:
- - - - - - 0x003439 00:B429: A9 01     LDA #$01
- - - - - - 0x00343B 00:B42B: 8D 87 03  STA ram_0387
- - - - - - 0x00343E 00:B42E: 60        RTS

tbl_B42F_validate:
@start:
- D 1 - - - 0x00343F 00:B42F: F4        .byte $F4,$F5,$F6   ; 
- D 1 - - - 0x003442 00:B432: F7        .byte $F7,$F8,$F9   ; 
- D 1 - - - 0x003445 00:B435: FA        .byte $FA,$FB,$FC   ; 
@end:
var_B42F_validate = @end - @start

sub_B438:
C - - - - - 0x003448 00:B438: A5 7C     LDA ram_007C
C - - - - - 0x00344A 00:B43A: C9 04     CMP #$04
C - - - - - 0x00344C 00:B43C: D0 06     BNE bra_B444
C - - - - - 0x00344E 00:B43E: A9 01     LDA #$01
C - - - - - 0x003450 00:B440: 85 5A     STA ram_005A
C - - - - - 0x003452 00:B442: D0 42     BNE bra_B486_RTS

bra_B444:
C - - - - - 0x003454 00:B444: C9 05     CMP #$05
C - - - - - 0x003456 00:B446: D0 2A     BNE bra_B472
C - - - - - 0x003458 00:B448: A5 7B     LDA ram_007B
C - - - - - 0x00345A 00:B44A: C9 26     CMP #$26
C - - - - - 0x00345C 00:B44C: D0 38     BNE bra_B486_RTS
C - - - - - 0x00345E 00:B44E: A9 00     LDA #$00
C - - - - - 0x003460 00:B450: 85 5A     STA ram_005A
C - - - - - 0x003462 00:B452: 85 5B     STA ram_005B
C - - - - - 0x003464 00:B454: 85 24     STA ram_0024
C - - - - - 0x003466 00:B456: 85 4C     STA ram_004C
C - - - - - 0x003468 00:B458: A9 94     LDA #>tbl_945A_spr_littlehood_death
C - - - - - 0x00346A 00:B45A: 85 46     STA ram_0046
C - - - - - 0x00346C 00:B45C: A9 5A     LDA #<tbl_945A_spr_littlehood_death
C - - - - - 0x00346E 00:B45E: 85 45     STA ram_0045
C - - - - - 0x003470 00:B460: A5 2C     LDA con_player_position_x
C - - - - - 0x003472 00:B462: 85 4E     STA ram_004E
C - - - - - 0x003474 00:B464: A5 2D     LDA con_player_position_y
C - - - - - 0x003476 00:B466: 85 4D     STA ram_004D
C - - - - - 0x003478 00:B468: A9 01     LDA #$01
C - - - - - 0x00347A 00:B46A: 85 81     STA ram_0081
C - - - - - 0x00347C 00:B46C: 20 CE C0  JSR sub_C0CE
C - - - - - 0x00347F 00:B46F: 4C 86 B4  JMP loc_B486_RTS

bra_B472:
C - - - - - 0x003482 00:B472: C9 09     CMP #$09
C - - - - - 0x003484 00:B474: D0 10     BNE bra_B486_RTS
C - - - - - 0x003486 00:B476: A9 01     LDA #$01
C - - - - - 0x003488 00:B478: 85 97     STA ram_0097
C - - - - - 0x00348A 00:B47A: A9 00     LDA #$00
C - - - - - 0x00348C 00:B47C: 85 81     STA ram_0081
C - - - - - 0x00348E 00:B47E: 85 51     STA ram_0051
C - - - - - 0x003490 00:B480: 85 5B     STA ram_005B
C - - - - - 0x003492 00:B482: 85 7C     STA ram_007C
C - - - - - 0x003494 00:B484: 85 7B     STA ram_007B

bra_B486_RTS:
loc_B486_RTS:
C D 1 - - - 0x003496 00:B486: 60        RTS

sub_B487:
C - - - - - 0x003497 00:B487: A5 5A     LDA ram_005A
C - - - - - 0x003499 00:B489: F0 5A     BEQ bra_B4E5_RTS
C - - - - - 0x00349B 00:B48B: E6 5B     INC ram_005B
C - - - - - 0x00349D 00:B48D: A5 5B     LDA ram_005B
C - - - - - 0x00349F 00:B48F: C9 08     CMP #$08
C - - - - - 0x0034A1 00:B491: D0 06     BNE bra_B499
C - - - - - 0x0034A3 00:B493: A9 01     LDA #$01
C - - - - - 0x0034A5 00:B495: 85 51     STA ram_0051
C - - - - - 0x0034A7 00:B497: D0 0C     BNE bra_B4A5

bra_B499:
C - - - - - 0x0034A9 00:B499: C9 10     CMP #$10
C - - - - - 0x0034AB 00:B49B: D0 08     BNE bra_B4A5
C - - - - - 0x0034AD 00:B49D: A9 02     LDA #$02
C - - - - - 0x0034AF 00:B49F: 85 51     STA ram_0051
C - - - - - 0x0034B1 00:B4A1: A9 00     LDA #$00
C - - - - - 0x0034B3 00:B4A3: 85 5B     STA ram_005B

bra_B4A5:
C - - - - - 0x0034B5 00:B4A5: A9 01     LDA #$01
C - - - - - 0x0034B7 00:B4A7: 85 54     STA ram_0054
C - - - - - 0x0034B9 00:B4A9: 85 2B     STA ram_002B
C - - - - - 0x0034BB 00:B4AB: E6 2C     INC con_player_position_x
C - - - - - 0x0034BD 00:B4AD: A5 2C     LDA con_player_position_x
C - - - - - 0x0034BF 00:B4AF: 85 4E     STA ram_004E
C - - - - - 0x0034C1 00:B4B1: A5 2D     LDA con_player_position_y
C - - - - - 0x0034C3 00:B4B3: 85 4D     STA ram_004D
C - - - - - 0x0034C5 00:B4B5: A9 00     LDA #$00
C - - - - - 0x0034C7 00:B4B7: 85 24     STA ram_0024
C - - - - - 0x0034C9 00:B4B9: 85 4C     STA ram_004C
C - - - - - 0x0034CB 00:B4BB: A9 E5     LDA #$E5
C - - - - - 0x0034CD 00:B4BD: 85 52     STA ram_0052
C - - - - - 0x0034CF 00:B4BF: A9 93     LDA #$93
C - - - - - 0x0034D1 00:B4C1: 85 53     STA ram_0053
C - - - - - 0x0034D3 00:B4C3: 20 56 C1  JSR sub_C156
C - - - - - 0x0034D6 00:B4C6: C6 60     DEC ram_0060
C - - - - - 0x0034D8 00:B4C8: A5 60     LDA ram_0060
C - - - - - 0x0034DA 00:B4CA: 85 4E     STA ram_004E
C - - - - - 0x0034DC 00:B4CC: A5 64     LDA ram_0064
C - - - - - 0x0034DE 00:B4CE: 85 4D     STA ram_004D
C - - - - - 0x0034E0 00:B4D0: A9 04     LDA #$04
C - - - - - 0x0034E2 00:B4D2: 85 24     STA ram_0024
C - - - - - 0x0034E4 00:B4D4: A9 01     LDA #$01
C - - - - - 0x0034E6 00:B4D6: 85 4C     STA ram_004C
C - - - - - 0x0034E8 00:B4D8: 85 54     STA ram_0054
C - - - - - 0x0034EA 00:B4DA: A9 F7     LDA #$F7
C - - - - - 0x0034EC 00:B4DC: 85 52     STA ram_0052
C - - - - - 0x0034EE 00:B4DE: A9 93     LDA #$93
C - - - - - 0x0034F0 00:B4E0: 85 53     STA ram_0053
C - - - - - 0x0034F2 00:B4E2: 20 56 C1  JSR sub_C156

bra_B4E5_RTS:
C - - - - - 0x0034F5 00:B4E5: 60        RTS

sub_B4E6:
C - - - - - 0x0034F6 00:B4E6: AD 42 06  LDA ram_0642
C - - - - - 0x0034F9 00:B4E9: 49 01     EOR #$01
C - - - - - 0x0034FB 00:B4EB: 8D 42 06  STA ram_0642
C - - - - - 0x0034FE 00:B4EE: D0 04     BNE bra_B4F4
C - - - - - 0x003500 00:B4F0: A9 90     LDA #$90
C - - - - - 0x003502 00:B4F2: D0 02     BNE bra_B4F6

bra_B4F4:
C - - - - - 0x003504 00:B4F4: A9 A8     LDA #$A8

bra_B4F6:
C - - - - - 0x003506 00:B4F6: 8D 20 02  STA ram_0220
C - - - - - 0x003509 00:B4F9: 60        RTS

sub_B4FA:
C - - - - - 0x00350A 00:B4FA: A9 00     LDA #$00
C - - - - - 0x00350C 00:B4FC: 85 04     STA ram_0004
C - - - - - 0x00350E 00:B4FE: 8D 01 20  STA $2001
C - - - - - 0x003511 00:B501: 85 01     STA ram_0001
C - - - - - 0x003513 00:B503: A5 00     LDA ram_0000
C - - - - - 0x003515 00:B505: 29 7F     AND #$7F
C - - - - - 0x003517 00:B507: 8D 00 20  STA $2000
C - - - - - 0x00351A 00:B50A: 85 00     STA ram_0000
C - - - - - 0x00351C 00:B50C: AE 3B 06  LDX ram_063B
C - - - - - 0x00351F 00:B50F: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003522 00:B512: 0A        ASL
C - - - - - 0x003523 00:B513: AA        TAX
C - - - - - 0x003524 00:B514: BD D0 CB  LDA tbl_CBD0_stages_palettes_table,X
C - - - - - 0x003527 00:B517: 85 7D     STA ram_007D
C - - - - - 0x003529 00:B519: BD D1 CB  LDA tbl_CBD0_stages_palettes_table+1,X
C - - - - - 0x00352C 00:B51C: 85 7E     STA ram_007E
C - - - - - 0x00352E 00:B51E: A5 03     LDA ram_0003
C - - - - - 0x003530 00:B520: 0A        ASL
C - - - - - 0x003531 00:B521: A8        TAY
C - - - - - 0x003532 00:B522: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003534 00:B524: 85 06     STA ram_0006
C - - - - - 0x003536 00:B526: C8        INY
C - - - - - 0x003537 00:B527: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003539 00:B529: 85 07     STA ram_0007
C - - - - - 0x00353B 00:B52B: 20 DE BE  JSR sub_BEDE
C - - - - - 0x00353E 00:B52E: AE 3B 06  LDX ram_063B
C - - - - - 0x003541 00:B531: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003544 00:B534: 0A        ASL
C - - - - - 0x003545 00:B535: AA        TAX
C - - - - - 0x003546 00:B536: BD E6 CB  LDA tbl_CBE6_stages_tilemaps_attributes_table,X
C - - - - - 0x003549 00:B539: 85 7D     STA ram_007D
C - - - - - 0x00354B 00:B53B: BD E7 CB  LDA tbl_CBE6_stages_tilemaps_attributes_table+1,X
C - - - - - 0x00354E 00:B53E: 85 7E     STA ram_007E
C - - - - - 0x003550 00:B540: A5 03     LDA ram_0003
C - - - - - 0x003552 00:B542: 0A        ASL
C - - - - - 0x003553 00:B543: A8        TAY
C - - - - - 0x003554 00:B544: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003556 00:B546: 85 10     STA ram_0010
C - - - - - 0x003558 00:B548: C8        INY
C - - - - - 0x003559 00:B549: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00355B 00:B54B: 85 11     STA ram_0011
C - - - - - 0x00355D 00:B54D: 20 D4 BF  JSR sub_BFD4
C - - - - - 0x003560 00:B550: AE 3B 06  LDX ram_063B
C - - - - - 0x003563 00:B553: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003566 00:B556: 0A        ASL
C - - - - - 0x003567 00:B557: AA        TAX
C - - - - - 0x003568 00:B558: BD FC CB  LDA tbl_CBFC_stages_tilemaps_table,X
C - - - - - 0x00356B 00:B55B: 85 7D     STA ram_007D
C - - - - - 0x00356D 00:B55D: BD FD CB  LDA tbl_CBFC_stages_tilemaps_table+1,X
C - - - - - 0x003570 00:B560: 85 7E     STA ram_007E
C - - - - - 0x003572 00:B562: A5 03     LDA ram_0003
C - - - - - 0x003574 00:B564: 0A        ASL
C - - - - - 0x003575 00:B565: A8        TAY
C - - - - - 0x003576 00:B566: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003578 00:B568: 85 08     STA ram_0008
C - - - - - 0x00357A 00:B56A: C8        INY
C - - - - - 0x00357B 00:B56B: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00357D 00:B56D: 85 09     STA ram_0009
C - - - - - 0x00357F 00:B56F: 20 F5 BE  JSR sub_BEF5_build_screen
C - - - - - 0x003582 00:B572: 60        RTS

sub_B573:
C - - - - - 0x003583 00:B573: E6 7B     INC ram_007B
C - - - - - 0x003585 00:B575: A5 7B     LDA ram_007B
C - - - - - 0x003587 00:B577: C9 3C     CMP #$3C
C - - - - - 0x003589 00:B579: D0 10     BNE bra_B58B_RTS
C - - - - - 0x00358B 00:B57B: A9 00     LDA #$00
C - - - - - 0x00358D 00:B57D: 85 7B     STA ram_007B
C - - - - - 0x00358F 00:B57F: E6 7C     INC ram_007C
C - - - - - 0x003591 00:B581: A5 7C     LDA ram_007C
C - - - - - 0x003593 00:B583: C9 3C     CMP #$3C
C - - - - - 0x003595 00:B585: D0 04     BNE bra_B58B_RTS
C - - - - - 0x003597 00:B587: A9 00     LDA #$00
C - - - - - 0x003599 00:B589: 85 7C     STA ram_007C

bra_B58B_RTS:
C - - - - - 0x00359B 00:B58B: 60        RTS

sub_B58C:
C - - - - - 0x00359C 00:B58C: A5 27     LDA ram_0027
C - - - - - 0x00359E 00:B58E: F0 28     BEQ bra_B5B8_RTS
C - - - - - 0x0035A0 00:B590: A5 1C     LDA ram_001C
C - - - - - 0x0035A2 00:B592: 29 01     AND #$01
C - - - - - 0x0035A4 00:B594: F0 23     BEQ bra_B5B9
C - - - - - 0x0035A6 00:B596: A4 16     LDY ram_0016
C - - - - - 0x0035A8 00:B598: C8        INY
C - - - - - 0x0035A9 00:B599: D0 0B     BNE bra_B5A6
C - - - - - 0x0035AB 00:B59B: E6 2C     INC con_player_position_x
C - - - - - 0x0035AD 00:B59D: A9 01     LDA #$01
C - - - - - 0x0035AF 00:B59F: 85 28     STA ram_0028
C - - - - - 0x0035B1 00:B5A1: 85 2B     STA ram_002B
C - - - - - 0x0035B3 00:B5A3: 4C B4 B5  JMP loc_B5B4

bra_B5A6:
C - - - - - 0x0035B6 00:B5A6: E6 16     INC ram_0016
C - - - - - 0x0035B8 00:B5A8: C6 60     DEC ram_0060
C - - - - - 0x0035BA 00:B5AA: C6 61     DEC ram_0061
C - - - - - 0x0035BC 00:B5AC: C6 62     DEC ram_0062
C - - - - - 0x0035BE 00:B5AE: A9 01     LDA #$01
C - - - - - 0x0035C0 00:B5B0: 85 73     STA ram_0073
C - - - - - 0x0035C2 00:B5B2: 85 2B     STA ram_002B

loc_B5B4:
C D 1 - - - 0x0035C4 00:B5B4: A9 00     LDA #$00
C - - - - - 0x0035C6 00:B5B6: 85 27     STA ram_0027

bra_B5B8_RTS:
C - - - - - 0x0035C8 00:B5B8: 60        RTS

bra_B5B9:
C - - - - - 0x0035C9 00:B5B9: A4 16     LDY ram_0016
C - - - - - 0x0035CB 00:B5BB: D0 0B     BNE bra_B5C8
C - - - - - 0x0035CD 00:B5BD: C6 2C     DEC con_player_position_x
C - - - - - 0x0035CF 00:B5BF: A9 01     LDA #$01
C - - - - - 0x0035D1 00:B5C1: 85 2A     STA ram_002A
C - - - - - 0x0035D3 00:B5C3: 85 2B     STA ram_002B
C - - - - - 0x0035D5 00:B5C5: 4C D6 B5  JMP loc_B5D6

bra_B5C8:
C - - - - - 0x0035D8 00:B5C8: C6 16     DEC ram_0016
C - - - - - 0x0035DA 00:B5CA: E6 60     INC ram_0060
C - - - - - 0x0035DC 00:B5CC: E6 61     INC ram_0061
C - - - - - 0x0035DE 00:B5CE: E6 62     INC ram_0062
C - - - - - 0x0035E0 00:B5D0: A9 01     LDA #$01
C - - - - - 0x0035E2 00:B5D2: 85 74     STA ram_0074
C - - - - - 0x0035E4 00:B5D4: 85 2B     STA ram_002B

loc_B5D6:
C D 1 - - - 0x0035E6 00:B5D6: A9 00     LDA #$00
C - - - - - 0x0035E8 00:B5D8: 85 27     STA ram_0027
C - - - - - 0x0035EA 00:B5DA: 60        RTS

sub_B5DB:
C - - - - - 0x0035EB 00:B5DB: A5 B5     LDA ram_00B5
C - - - - - 0x0035ED 00:B5DD: D0 01     BNE bra_B5E0
C - - - - - 0x0035EF 00:B5DF: 60        RTS

bra_B5E0:
C - - - - - 0x0035F0 00:B5E0: A5 AD     LDA ram_00AD
C - - - - - 0x0035F2 00:B5E2: C9 10     CMP #$10
C - - - - - 0x0035F4 00:B5E4: D0 33     BNE bra_B619
C - - - - - 0x0035F6 00:B5E6: A9 00     LDA #$00
C - - - - - 0x0035F8 00:B5E8: 85 AD     STA ram_00AD
C - - - - - 0x0035FA 00:B5EA: A5 B4     LDA ram_00B4
C - - - - - 0x0035FC 00:B5EC: 49 01     EOR #$01
C - - - - - 0x0035FE 00:B5EE: 85 B4     STA ram_00B4
C - - - - - 0x003600 00:B5F0: A5 B4     LDA ram_00B4
C - - - - - 0x003602 00:B5F2: D0 0A     BNE bra_B5FE
C - - - - - 0x003604 00:B5F4: A9 61     LDA #<tbl_9461_spr_seller_idle
C - - - - - 0x003606 00:B5F6: 85 45     STA ram_0045
C - - - - - 0x003608 00:B5F8: A9 94     LDA #>tbl_9461_spr_seller_idle
C - - - - - 0x00360A 00:B5FA: 85 46     STA ram_0046
C - - - - - 0x00360C 00:B5FC: D0 08     BNE bra_B606

bra_B5FE:
C - - - - - 0x00360E 00:B5FE: A9 6A     LDA #<tbl_946A_spr_seller_greetings
C - - - - - 0x003610 00:B600: 85 45     STA ram_0045
C - - - - - 0x003612 00:B602: A9 94     LDA #>tbl_946A_spr_seller_greetings
C - - - - - 0x003614 00:B604: 85 46     STA ram_0046

bra_B606:
C - - - - - 0x003616 00:B606: A9 00     LDA #$00
C - - - - - 0x003618 00:B608: 85 4C     STA ram_004C
C - - - - - 0x00361A 00:B60A: A9 04     LDA #$04
C - - - - - 0x00361C 00:B60C: 85 24     STA ram_0024
C - - - - - 0x00361E 00:B60E: A9 80     LDA #$80
C - - - - - 0x003620 00:B610: 85 4E     STA ram_004E
C - - - - - 0x003622 00:B612: A9 78     LDA #$78
C - - - - - 0x003624 00:B614: 85 4D     STA ram_004D
C - - - - - 0x003626 00:B616: 20 CE C0  JSR sub_C0CE

bra_B619:
C - - - - - 0x003629 00:B619: E6 AD     INC ram_00AD
C - - - - - 0x00362B 00:B61B: 60        RTS

sub_B61C:
C - - - - - 0x00362C 00:B61C: A5 38     LDA ram_0038
C - - - - - 0x00362E 00:B61E: D0 43     BNE bra_B663
C - - - - - 0x003630 00:B620: A9 00     LDA #$00
C - - - - - 0x003632 00:B622: 85 2B     STA ram_002B
C - - - - - 0x003634 00:B624: A5 1C     LDA ram_001C
C - - - - - 0x003636 00:B626: 29 01     AND #$01
C - - - - - 0x003638 00:B628: F0 3E     BEQ bra_B668
C - - - - - 0x00363A 00:B62A: A5 32     LDA ram_0032
C - - - - - 0x00363C 00:B62C: D0 0A     BNE bra_B638
C - - - - - 0x00363E 00:B62E: A5 28     LDA ram_0028
C - - - - - 0x003640 00:B630: D0 1D     BNE bra_B64F
C - - - - - 0x003642 00:B632: A5 2C     LDA con_player_position_x
C - - - - - 0x003644 00:B634: C9 80     CMP #$80
C - - - - - 0x003646 00:B636: B0 0D     BCS bra_B645

bra_B638:
C - - - - - 0x003648 00:B638: E6 2C     INC con_player_position_x
C - - - - - 0x00364A 00:B63A: A9 01     LDA #$01
C - - - - - 0x00364C 00:B63C: 85 2B     STA ram_002B
C - - - - - 0x00364E 00:B63E: A9 00     LDA #$00
C - - - - - 0x003650 00:B640: 85 2A     STA ram_002A
C - - - - - 0x003652 00:B642: 4C 63 B6  JMP loc_B663

bra_B645:
C - - - - - 0x003655 00:B645: A9 00     LDA #$00
C - - - - - 0x003657 00:B647: 85 2A     STA ram_002A
C - - - - - 0x003659 00:B649: A9 01     LDA #$01
C - - - - - 0x00365B 00:B64B: 85 27     STA ram_0027
C - - - - - 0x00365D 00:B64D: D0 14     BNE bra_B663

bra_B64F:
C - - - - - 0x00365F 00:B64F: A5 2C     LDA con_player_position_x
C - - - - - 0x003661 00:B651: C9 F1     CMP #$F1
C - - - - - 0x003663 00:B653: 90 08     BCC bra_B65D
C - - - - - 0x003665 00:B655: A9 00     LDA #$00
C - - - - - 0x003667 00:B657: 85 2B     STA ram_002B
C - - - - - 0x003669 00:B659: 85 27     STA ram_0027
C - - - - - 0x00366B 00:B65B: F0 06     BEQ bra_B663

bra_B65D:
C - - - - - 0x00366D 00:B65D: E6 2C     INC con_player_position_x
C - - - - - 0x00366F 00:B65F: A9 01     LDA #$01
C - - - - - 0x003671 00:B661: 85 2B     STA ram_002B

bra_B663:
loc_B663:
C D 1 - - - 0x003673 00:B663: A9 00     LDA #$00
C - - - - - 0x003675 00:B665: 85 38     STA ram_0038
C - - - - - 0x003677 00:B667: 60        RTS

bra_B668:
C - - - - - 0x003678 00:B668: A5 1C     LDA ram_001C
C - - - - - 0x00367A 00:B66A: 29 02     AND #$02
C - - - - - 0x00367C 00:B66C: F0 43     BEQ bra_B6B1
C - - - - - 0x00367E 00:B66E: A5 32     LDA ram_0032
C - - - - - 0x003680 00:B670: D0 0A     BNE bra_B67C
C - - - - - 0x003682 00:B672: A5 2A     LDA ram_002A
C - - - - - 0x003684 00:B674: D0 1D     BNE bra_B693
C - - - - - 0x003686 00:B676: A9 80     LDA #$80
C - - - - - 0x003688 00:B678: C5 2C     CMP con_player_position_x
C - - - - - 0x00368A 00:B67A: B0 0D     BCS bra_B689

bra_B67C:
C - - - - - 0x00368C 00:B67C: C6 2C     DEC con_player_position_x
C - - - - - 0x00368E 00:B67E: A9 01     LDA #$01
C - - - - - 0x003690 00:B680: 85 2B     STA ram_002B
C - - - - - 0x003692 00:B682: A9 00     LDA #$00
C - - - - - 0x003694 00:B684: 85 28     STA ram_0028
C - - - - - 0x003696 00:B686: 4C AC B6  JMP loc_B6AC

bra_B689:
C - - - - - 0x003699 00:B689: A9 00     LDA #$00
C - - - - - 0x00369B 00:B68B: 85 28     STA ram_0028
C - - - - - 0x00369D 00:B68D: A9 01     LDA #$01
C - - - - - 0x00369F 00:B68F: 85 27     STA ram_0027
C - - - - - 0x0036A1 00:B691: D0 19     BNE bra_B6AC

bra_B693:
C - - - - - 0x0036A3 00:B693: A5 2C     LDA con_player_position_x
C - - - - - 0x0036A5 00:B695: D0 06     BNE bra_B69D
C - - - - - 0x0036A7 00:B697: A9 01     LDA #$01
C - - - - - 0x0036A9 00:B699: 85 EB     STA ram_00EB
C - - - - - 0x0036AB 00:B69B: D0 09     BNE bra_B6A6

bra_B69D:
C - - - - - 0x0036AD 00:B69D: C6 2C     DEC con_player_position_x
C - - - - - 0x0036AF 00:B69F: A9 01     LDA #$01
C - - - - - 0x0036B1 00:B6A1: 85 2B     STA ram_002B
C - - - - - 0x0036B3 00:B6A3: 4C AC B6  JMP loc_B6AC

bra_B6A6:
C - - - - - 0x0036B6 00:B6A6: A9 00     LDA #$00
C - - - - - 0x0036B8 00:B6A8: 85 27     STA ram_0027
C - - - - - 0x0036BA 00:B6AA: 85 2B     STA ram_002B

bra_B6AC:
loc_B6AC:
C D 1 - - - 0x0036BC 00:B6AC: A9 00     LDA #$00
C - - - - - 0x0036BE 00:B6AE: 85 38     STA ram_0038

bra_B6B0_RTS:
C - - - - - 0x0036C0 00:B6B0: 60        RTS

bra_B6B1:
C - - - - - 0x0036C1 00:B6B1: AE 3B 06  LDX ram_063B
C - - - - - 0x0036C4 00:B6B4: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x0036C7 00:B6B7: C9 05     CMP #$05
C - - - - - 0x0036C9 00:B6B9: F0 F5     BEQ bra_B6B0_RTS
C - - - - - 0x0036CB 00:B6BB: A5 1C     LDA ram_001C
C - - - - - 0x0036CD 00:B6BD: 29 08     AND #$08
C - - - - - 0x0036CF 00:B6BF: F0 16     BEQ bra_B6D7
C - - - - - 0x0036D1 00:B6C1: A5 2D     LDA con_player_position_y
C - - - - - 0x0036D3 00:B6C3: F0 09     BEQ bra_B6CE
C - - - - - 0x0036D5 00:B6C5: C6 2D     DEC con_player_position_y
C - - - - - 0x0036D7 00:B6C7: A9 01     LDA #$01
C - - - - - 0x0036D9 00:B6C9: 85 2B     STA ram_002B
C - - - - - 0x0036DB 00:B6CB: 4C AC B6  JMP loc_B6AC

bra_B6CE:
C - - - - - 0x0036DE 00:B6CE: A9 00     LDA #$00
C - - - - - 0x0036E0 00:B6D0: 85 27     STA ram_0027
C - - - - - 0x0036E2 00:B6D2: 85 2B     STA ram_002B
C - - - - - 0x0036E4 00:B6D4: 85 38     STA ram_0038
C - - - - - 0x0036E6 00:B6D6: 60        RTS

bra_B6D7:
C - - - - - 0x0036E7 00:B6D7: A5 1C     LDA ram_001C
C - - - - - 0x0036E9 00:B6D9: 29 04     AND #$04
C - - - - - 0x0036EB 00:B6DB: F0 F1     BEQ bra_B6CE
C - - - - - 0x0036ED 00:B6DD: A5 2D     LDA con_player_position_y
C - - - - - 0x0036EF 00:B6DF: C9 F0     CMP #$F0
C - - - - - 0x0036F1 00:B6E1: B0 EB     BCS bra_B6CE
C - - - - - 0x0036F3 00:B6E3: E6 2D     INC con_player_position_y
C - - - - - 0x0036F5 00:B6E5: A9 01     LDA #$01
C - - - - - 0x0036F7 00:B6E7: 85 2B     STA ram_002B
C - - - - - 0x0036F9 00:B6E9: 4C AC B6  JMP loc_B6AC

sub_B6EC:
C - - - - - 0x0036FC 00:B6EC: A5 41     LDA ram_0041
C - - - - - 0x0036FE 00:B6EE: D0 01     BNE bra_B6F1
C - - - - - 0x003700 00:B6F0: 60        RTS

bra_B6F1:
C - - - - - 0x003701 00:B6F1: A9 00     LDA #$00
C - - - - - 0x003703 00:B6F3: 85 41     STA ram_0041

sub_B6F5:
C - - - - - 0x003705 00:B6F5: AE 3B 06  LDX ram_063B
C - - - - - 0x003708 00:B6F8: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x00370B 00:B6FB: 0A        ASL
C - - - - - 0x00370C 00:B6FC: AA        TAX
C - - - - - 0x00370D 00:B6FD: BD FC CB  LDA tbl_CBFC_stages_tilemaps_table,X
C - - - - - 0x003710 00:B700: 85 7D     STA ram_007D
C - - - - - 0x003712 00:B702: BD FD CB  LDA tbl_CBFC_stages_tilemaps_table+1,X
C - - - - - 0x003715 00:B705: 85 7E     STA ram_007E
C - - - - - 0x003717 00:B707: A5 18     LDA ram_0018
C - - - - - 0x003719 00:B709: D0 05     BNE bra_B710
C - - - - - 0x00371B 00:B70B: AD 20 03  LDA ram_0320
C - - - - - 0x00371E 00:B70E: F0 14     BEQ bra_B724

bra_B710:
C - - - - - 0x003720 00:B710: A5 03     LDA ram_0003
C - - - - - 0x003722 00:B712: 0A        ASL
C - - - - - 0x003723 00:B713: A8        TAY
C - - - - - 0x003724 00:B714: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003726 00:B716: 85 08     STA ram_0008
C - - - - - 0x003728 00:B718: C8        INY
C - - - - - 0x003729 00:B719: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00372B 00:B71B: 85 09     STA ram_0009
C - - - - - 0x00372D 00:B71D: A5 2C     LDA con_player_position_x
C - - - - - 0x00372F 00:B71F: 85 34     STA ram_0034
C - - - - - 0x003731 00:B721: 4C 7A B7  JMP loc_B77A

bra_B724:
C - - - - - 0x003734 00:B724: A5 2C     LDA con_player_position_x
C - - - - - 0x003736 00:B726: C9 80     CMP #$80
C - - - - - 0x003738 00:B728: D0 29     BNE bra_B753
C - - - - - 0x00373A 00:B72A: A5 2C     LDA con_player_position_x
C - - - - - 0x00373C 00:B72C: 18        CLC
C - - - - - 0x00373D 00:B72D: 65 16     ADC ram_0016
C - - - - - 0x00373F 00:B72F: 85 34     STA ram_0034
C - - - - - 0x003741 00:B731: B0 0E     BCS bra_B741
C - - - - - 0x003743 00:B733: A5 03     LDA ram_0003
C - - - - - 0x003745 00:B735: A8        TAY
C - - - - - 0x003746 00:B736: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003748 00:B738: 85 08     STA ram_0008
C - - - - - 0x00374A 00:B73A: C8        INY
C - - - - - 0x00374B 00:B73B: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00374D 00:B73D: 85 09     STA ram_0009
C - - - - - 0x00374F 00:B73F: D0 39     BNE bra_B77A

bra_B741:
C - - - - - 0x003751 00:B741: A5 03     LDA ram_0003
C - - - - - 0x003753 00:B743: 18        CLC
C - - - - - 0x003754 00:B744: 69 01     ADC #$01
C - - - - - 0x003756 00:B746: 0A        ASL
C - - - - - 0x003757 00:B747: A8        TAY
C - - - - - 0x003758 00:B748: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00375A 00:B74A: 85 08     STA ram_0008
C - - - - - 0x00375C 00:B74C: C8        INY
C - - - - - 0x00375D 00:B74D: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00375F 00:B74F: 85 09     STA ram_0009
C - - - - - 0x003761 00:B751: D0 27     BNE bra_B77A

bra_B753:
C - - - - - 0x003763 00:B753: B0 11     BCS bra_B766
C - - - - - 0x003765 00:B755: 85 34     STA ram_0034
C - - - - - 0x003767 00:B757: A5 03     LDA ram_0003
C - - - - - 0x003769 00:B759: 0A        ASL
C - - - - - 0x00376A 00:B75A: A8        TAY
C - - - - - 0x00376B 00:B75B: B1 7D     LDA (ram_007D),Y
C - - - - - 0x00376D 00:B75D: 85 08     STA ram_0008
C - - - - - 0x00376F 00:B75F: C8        INY
C - - - - - 0x003770 00:B760: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003772 00:B762: 85 09     STA ram_0009
C - - - - - 0x003774 00:B764: D0 14     BNE bra_B77A

bra_B766:
C - - - - - 0x003776 00:B766: 85 34     STA ram_0034
C - - - - - 0x003778 00:B768: C6 34     DEC ram_0034
C - - - - - 0x00377A 00:B76A: A5 03     LDA ram_0003
C - - - - - 0x00377C 00:B76C: 18        CLC
C - - - - - 0x00377D 00:B76D: 69 01     ADC #$01
C - - - - - 0x00377F 00:B76F: 0A        ASL
C - - - - - 0x003780 00:B770: A8        TAY
C - - - - - 0x003781 00:B771: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003783 00:B773: 85 08     STA ram_0008
C - - - - - 0x003785 00:B775: C8        INY
C - - - - - 0x003786 00:B776: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003788 00:B778: 85 09     STA ram_0009

bra_B77A:
loc_B77A:
C D 1 - - - 0x00378A 00:B77A: A5 2D     LDA con_player_position_y
C - - - - - 0x00378C 00:B77C: 18        CLC
C - - - - - 0x00378D 00:B77D: 69 0F     ADC #$0F
C - - - - - 0x00378F 00:B77F: 85 35     STA ram_0035
C - - - - - 0x003791 00:B781: A5 1C     LDA ram_001C
C - - - - - 0x003793 00:B783: 29 01     AND #$01
C - - - - - 0x003795 00:B785: F0 2E     BEQ bra_B7B5
C - - - - - 0x003797 00:B787: A9 10     LDA #$10
C - - - - - 0x003799 00:B789: 18        CLC
C - - - - - 0x00379A 00:B78A: 65 34     ADC ram_0034
C - - - - - 0x00379C 00:B78C: 85 34     STA ram_0034
C - - - - - 0x00379E 00:B78E: 85 3F     STA ram_003F
C - - - - - 0x0037A0 00:B790: A5 35     LDA ram_0035
C - - - - - 0x0037A2 00:B792: 38        SEC
C - - - - - 0x0037A3 00:B793: E9 07     SBC #$07
C - - - - - 0x0037A5 00:B795: 85 40     STA ram_0040
C - - - - - 0x0037A7 00:B797: A5 34     LDA ram_0034
C - - - - - 0x0037A9 00:B799: C9 10     CMP #$10
C - - - - - 0x0037AB 00:B79B: 90 03     BCC bra_B7A0
C - - - - - 0x0037AD 00:B79D: 4C 17 B8  JMP loc_B817

bra_B7A0:
C - - - - - 0x0037B0 00:B7A0: A5 03     LDA ram_0003
C - - - - - 0x0037B2 00:B7A2: 18        CLC
C - - - - - 0x0037B3 00:B7A3: 69 01     ADC #$01
C - - - - - 0x0037B5 00:B7A5: 0A        ASL
C - - - - - 0x0037B6 00:B7A6: A8        TAY
C - - - - - 0x0037B7 00:B7A7: B1 7D     LDA (ram_007D),Y
C - - - - - 0x0037B9 00:B7A9: 85 08     STA ram_0008
C - - - - - 0x0037BB 00:B7AB: C8        INY
C - - - - - 0x0037BC 00:B7AC: B1 7D     LDA (ram_007D),Y
C - - - - - 0x0037BE 00:B7AE: 85 09     STA ram_0009
C - - - - - 0x0037C0 00:B7B0: F0 03     BEQ bra_B7B5
C - - - - - 0x0037C2 00:B7B2: 4C 17 B8  JMP loc_B817

bra_B7B5:
C - - - - - 0x0037C5 00:B7B5: A5 1C     LDA ram_001C
C - - - - - 0x0037C7 00:B7B7: 29 02     AND #$02
C - - - - - 0x0037C9 00:B7B9: F0 22     BEQ bra_B7DD
C - - - - - 0x0037CB 00:B7BB: C6 34     DEC ram_0034
C - - - - - 0x0037CD 00:B7BD: A5 34     LDA ram_0034
C - - - - - 0x0037CF 00:B7BF: 85 3F     STA ram_003F
C - - - - - 0x0037D1 00:B7C1: A5 35     LDA ram_0035
C - - - - - 0x0037D3 00:B7C3: 38        SEC
C - - - - - 0x0037D4 00:B7C4: E9 07     SBC #$07
C - - - - - 0x0037D6 00:B7C6: 85 40     STA ram_0040
C - - - - - 0x0037D8 00:B7C8: A5 34     LDA ram_0034
C - - - - - 0x0037DA 00:B7CA: C9 FF     CMP #$FF
C - - - - - 0x0037DC 00:B7CC: D0 49     BNE bra_B817
C - - - - - 0x0037DE 00:B7CE: A5 03     LDA ram_0003
C - - - - - 0x0037E0 00:B7D0: 0A        ASL
C - - - - - 0x0037E1 00:B7D1: A8        TAY
C - - - - - 0x0037E2 00:B7D2: B1 7D     LDA (ram_007D),Y
C - - - - - 0x0037E4 00:B7D4: 85 08     STA ram_0008
C - - - - - 0x0037E6 00:B7D6: C8        INY
C - - - - - 0x0037E7 00:B7D7: B1 7D     LDA (ram_007D),Y
C - - - - - 0x0037E9 00:B7D9: 85 09     STA ram_0009
C - - - - - 0x0037EB 00:B7DB: D0 3A     BNE bra_B817

bra_B7DD:
C - - - - - 0x0037ED 00:B7DD: A5 1C     LDA ram_001C
C - - - - - 0x0037EF 00:B7DF: 29 08     AND #$08
C - - - - - 0x0037F1 00:B7E1: F0 18     BEQ bra_B7FB
C - - - - - 0x0037F3 00:B7E3: A5 35     LDA ram_0035
C - - - - - 0x0037F5 00:B7E5: 38        SEC
C - - - - - 0x0037F6 00:B7E6: E9 08     SBC #$08
C - - - - - 0x0037F8 00:B7E8: 85 35     STA ram_0035
C - - - - - 0x0037FA 00:B7EA: 85 40     STA ram_0040
C - - - - - 0x0037FC 00:B7EC: A9 0F     LDA #$0F
C - - - - - 0x0037FE 00:B7EE: 18        CLC
C - - - - - 0x0037FF 00:B7EF: 65 34     ADC ram_0034
C - - - - - 0x003801 00:B7F1: 85 3F     STA ram_003F
C - - - - - 0x003803 00:B7F3: 90 04     BCC bra_B7F9
C - - - - - 0x003805 00:B7F5: A9 01     LDA #$01
C - - - - - 0x003807 00:B7F7: 85 3B     STA ram_003B

bra_B7F9:
C - - - - - 0x003809 00:B7F9: D0 1C     BNE bra_B817

bra_B7FB:
C - - - - - 0x00380B 00:B7FB: A5 1C     LDA ram_001C
C - - - - - 0x00380D 00:B7FD: 29 04     AND #$04
C - - - - - 0x00380F 00:B7FF: D0 03     BNE bra_B804
C - - - - - 0x003811 00:B801: 4C B2 B8  JMP loc_B8B2_RTS

bra_B804:
C - - - - - 0x003814 00:B804: E6 35     INC ram_0035
C - - - - - 0x003816 00:B806: A5 35     LDA ram_0035
C - - - - - 0x003818 00:B808: 85 40     STA ram_0040
C - - - - - 0x00381A 00:B80A: A9 0F     LDA #$0F
C - - - - - 0x00381C 00:B80C: 18        CLC
C - - - - - 0x00381D 00:B80D: 65 34     ADC ram_0034
C - - - - - 0x00381F 00:B80F: 85 3F     STA ram_003F
C - - - - - 0x003821 00:B811: 90 04     BCC bra_B817
C - - - - - 0x003823 00:B813: A9 01     LDA #$01
C - - - - - 0x003825 00:B815: 85 3B     STA ram_003B

bra_B817:
loc_B817:
C D 1 - - - 0x003827 00:B817: A5 34     LDA ram_0034
C - - - - - 0x003829 00:B819: 4A        LSR
C - - - - - 0x00382A 00:B81A: 4A        LSR
C - - - - - 0x00382B 00:B81B: 4A        LSR
C - - - - - 0x00382C 00:B81C: 4A        LSR
C - - - - - 0x00382D 00:B81D: 85 36     STA ram_0036
C - - - - - 0x00382F 00:B81F: A5 35     LDA ram_0035
C - - - - - 0x003831 00:B821: 29 F0     AND #$F0
C - - - - - 0x003833 00:B823: 18        CLC
C - - - - - 0x003834 00:B824: 65 36     ADC ram_0036
C - - - - - 0x003836 00:B826: A8        TAY
C - - - - - 0x003837 00:B827: B1 08     LDA (ram_0008),Y
C - - - - - 0x003839 00:B829: 85 88     STA ram_0088
C - - - - - 0x00383B 00:B82B: 20 B3 B8  JSR sub_B8B3
C - - - - - 0x00383E 00:B82E: A5 E1     LDA ram_00E1
C - - - - - 0x003840 00:B830: D0 21     BNE bra_B853
C - - - - - 0x003842 00:B832: AD 20 03  LDA ram_0320
C - - - - - 0x003845 00:B835: D0 3A     BNE bra_B871
C - - - - - 0x003847 00:B837: A5 18     LDA ram_0018
C - - - - - 0x003849 00:B839: D0 25     BNE bra_B860
C - - - - - 0x00384B 00:B83B: A5 6F     LDA ram_006F
C - - - - - 0x00384D 00:B83D: D0 21     BNE bra_B860
C - - - - - 0x00384F 00:B83F: AE 3B 06  LDX ram_063B
C - - - - - 0x003852 00:B842: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003855 00:B845: C9 07     CMP #$07
C - - - - - 0x003857 00:B847: B0 17     BCS bra_B860
C - - - - - 0x003859 00:B849: A5 88     LDA ram_0088
C - - - - - 0x00385B 00:B84B: C9 CE     CMP #$CE
C - - - - - 0x00385D 00:B84D: F0 32     BEQ bra_B881
C - - - - - 0x00385F 00:B84F: C9 02     CMP #$02
C - - - - - 0x003861 00:B851: F0 2E     BEQ bra_B881

bra_B853:
C - - - - - 0x003863 00:B853: A9 01     LDA #$01
C - - - - - 0x003865 00:B855: 85 38     STA ram_0038
C - - - - - 0x003867 00:B857: 85 EB     STA ram_00EB
C - - - - - 0x003869 00:B859: A9 00     LDA #$00
C - - - - - 0x00386B 00:B85B: 85 42     STA ram_0042
C - - - - - 0x00386D 00:B85D: 4C B2 B8  JMP loc_B8B2_RTS

bra_B860:
C - - - - - 0x003870 00:B860: A5 88     LDA ram_0088
C - - - - - 0x003872 00:B862: C9 D0     CMP #$D0
C - - - - - 0x003874 00:B864: F0 1B     BEQ bra_B881
C - - - - - 0x003876 00:B866: A9 01     LDA #$01
C - - - - - 0x003878 00:B868: 85 38     STA ram_0038
C - - - - - 0x00387A 00:B86A: A9 00     LDA #$00
C - - - - - 0x00387C 00:B86C: 85 42     STA ram_0042
C - - - - - 0x00387E 00:B86E: 4C B2 B8  JMP loc_B8B2_RTS

bra_B871:
C - - - - - 0x003881 00:B871: A5 88     LDA ram_0088
C - - - - - 0x003883 00:B873: C9 8C     CMP #$8C
C - - - - - 0x003885 00:B875: F0 0A     BEQ bra_B881
C - - - - - 0x003887 00:B877: A9 01     LDA #$01
C - - - - - 0x003889 00:B879: 85 38     STA ram_0038
C - - - - - 0x00388B 00:B87B: A9 00     LDA #$00
C - - - - - 0x00388D 00:B87D: 85 42     STA ram_0042
C - - - - - 0x00388F 00:B87F: F0 31     BEQ bra_B8B2_RTS

bra_B881:
C - - - - - 0x003891 00:B881: A5 42     LDA ram_0042
C - - - - - 0x003893 00:B883: D0 27     BNE bra_B8AC
C - - - - - 0x003895 00:B885: A5 3B     LDA ram_003B
C - - - - - 0x003897 00:B887: F0 10     BEQ bra_B899
C - - - - - 0x003899 00:B889: A5 03     LDA ram_0003
C - - - - - 0x00389B 00:B88B: 18        CLC
C - - - - - 0x00389C 00:B88C: 69 01     ADC #$01
C - - - - - 0x00389E 00:B88E: 0A        ASL
C - - - - - 0x00389F 00:B88F: A8        TAY
C - - - - - 0x0038A0 00:B890: B1 7D     LDA (ram_007D),Y
C - - - - - 0x0038A2 00:B892: 85 08     STA ram_0008
C - - - - - 0x0038A4 00:B894: C8        INY
C - - - - - 0x0038A5 00:B895: B1 7D     LDA (ram_007D),Y
C - - - - - 0x0038A7 00:B897: 85 09     STA ram_0009

bra_B899:
C - - - - - 0x0038A9 00:B899: A5 3F     LDA ram_003F
C - - - - - 0x0038AB 00:B89B: 85 34     STA ram_0034
C - - - - - 0x0038AD 00:B89D: A5 40     LDA ram_0040
C - - - - - 0x0038AF 00:B89F: 85 35     STA ram_0035
C - - - - - 0x0038B1 00:B8A1: A9 00     LDA #$00
C - - - - - 0x0038B3 00:B8A3: 85 3B     STA ram_003B
C - - - - - 0x0038B5 00:B8A5: A9 01     LDA #$01
C - - - - - 0x0038B7 00:B8A7: 85 42     STA ram_0042
C - - - - - 0x0038B9 00:B8A9: 4C 17 B8  JMP loc_B817

bra_B8AC:
C - - - - - 0x0038BC 00:B8AC: A9 00     LDA #$00
C - - - - - 0x0038BE 00:B8AE: 85 38     STA ram_0038
C - - - - - 0x0038C0 00:B8B0: 85 42     STA ram_0042

bra_B8B2_RTS:
loc_B8B2_RTS:
C D 1 - - - 0x0038C2 00:B8B2: 60        RTS

sub_B8B3:
C - - - - - 0x0038C3 00:B8B3: A5 1C     LDA ram_001C
C - - - - - 0x0038C5 00:B8B5: 29 01     AND #$01
C - - - - - 0x0038C7 00:B8B7: F0 0A     BEQ bra_B8C3
C - - - - - 0x0038C9 00:B8B9: A5 2C     LDA con_player_position_x
C - - - - - 0x0038CB 00:B8BB: 18        CLC
C - - - - - 0x0038CC 00:B8BC: 69 10     ADC #$10
C - - - - - 0x0038CE 00:B8BE: 85 C6     STA ram_00C6
C - - - - - 0x0038D0 00:B8C0: 4C D3 B8  JMP loc_B8D3

bra_B8C3:
C - - - - - 0x0038D3 00:B8C3: A5 1C     LDA ram_001C
C - - - - - 0x0038D5 00:B8C5: 29 02     AND #$02
C - - - - - 0x0038D7 00:B8C7: D0 03     BNE bra_B8CC
C - - - - - 0x0038D9 00:B8C9: 4C 1F B9  JMP loc_B91F

bra_B8CC:
C - - - - - 0x0038DC 00:B8CC: A5 2C     LDA con_player_position_x
C - - - - - 0x0038DE 00:B8CE: 38        SEC
C - - - - - 0x0038DF 00:B8CF: E9 10     SBC #$10
C - - - - - 0x0038E1 00:B8D1: 85 C6     STA ram_00C6

loc_B8D3:
C D 1 - - - 0x0038E3 00:B8D3: A5 2D     LDA con_player_position_y
C - - - - - 0x0038E5 00:B8D5: 85 C7     STA ram_00C7
C - - - - - 0x0038E7 00:B8D7: A9 00     LDA #$00
C - - - - - 0x0038E9 00:B8D9: 85 C5     STA ram_00C5
C - - - - - 0x0038EB 00:B8DB: A8        TAY

bra_B8DC:
C - - - - - 0x0038EC 00:B8DC: A5 C5     LDA ram_00C5
C - - - - - 0x0038EE 00:B8DE: C9 05     CMP #$05
C - - - - - 0x0038F0 00:B8E0: D0 03     BNE bra_B8E5
C - - - - - 0x0038F2 00:B8E2: 4C 1A B9  JMP loc_B91A

bra_B8E5:
C - - - - - 0x0038F5 00:B8E5: B9 68 02  LDA ram_0268,Y
C - - - - - 0x0038F8 00:B8E8: C5 C7     CMP ram_00C7
C - - - - - 0x0038FA 00:B8EA: B0 02     BCS bra_B8EE
C - - - - - 0x0038FC 00:B8EC: 90 10     BCC bra_B8FE

bra_B8EE:
C - - - - - 0x0038FE 00:B8EE: B9 68 02  LDA ram_0268,Y
C - - - - - 0x003901 00:B8F1: 38        SEC
C - - - - - 0x003902 00:B8F2: E5 C7     SBC ram_00C7
C - - - - - 0x003904 00:B8F4: C9 01     CMP #$01
C - - - - - 0x003906 00:B8F6: 90 06     BCC bra_B8FE
C - - - - - 0x003908 00:B8F8: C9 0F     CMP #$0F
C - - - - - 0x00390A 00:B8FA: F0 0B     BEQ bra_B907
C - - - - - 0x00390C 00:B8FC: 90 09     BCC bra_B907

bra_B8FE:
C - - - - - 0x00390E 00:B8FE: 98        TYA
C - - - - - 0x00390F 00:B8FF: 18        CLC
C - - - - - 0x003910 00:B900: 69 08     ADC #$08
C - - - - - 0x003912 00:B902: A8        TAY
C - - - - - 0x003913 00:B903: E6 C5     INC ram_00C5
C - - - - - 0x003915 00:B905: D0 D5     BNE bra_B8DC

bra_B907:
C - - - - - 0x003917 00:B907: A5 C6     LDA ram_00C6
C - - - - - 0x003919 00:B909: D9 6B 02  CMP ram_026B,Y
C - - - - - 0x00391C 00:B90C: D0 F0     BNE bra_B8FE
C - - - - - 0x00391E 00:B90E: B9 69 02  LDA ram_0269,Y
C - - - - - 0x003921 00:B911: C9 74     CMP #$74
C - - - - - 0x003923 00:B913: D0 05     BNE bra_B91A
C - - - - - 0x003925 00:B915: A9 01     LDA #$01
C - - - - - 0x003927 00:B917: 85 E1     STA ram_00E1
C - - - - - 0x003929 00:B919: 60        RTS

bra_B91A:
loc_B91A:
C D 1 - - - 0x00392A 00:B91A: A9 00     LDA #$00
C - - - - - 0x00392C 00:B91C: 85 E1     STA ram_00E1
C - - - - - 0x00392E 00:B91E: 60        RTS

loc_B91F:
C D 1 - - - 0x00392F 00:B91F: A5 1C     LDA ram_001C
C - - - - - 0x003931 00:B921: 29 08     AND #$08
C - - - - - 0x003933 00:B923: F0 4C     BEQ bra_B971
C - - - - - 0x003935 00:B925: A5 2C     LDA con_player_position_x
C - - - - - 0x003937 00:B927: 85 C6     STA ram_00C6
C - - - - - 0x003939 00:B929: A5 2D     LDA con_player_position_y
C - - - - - 0x00393B 00:B92B: 85 C7     STA ram_00C7

loc_B92D:
C D 1 - - - 0x00393D 00:B92D: A9 00     LDA #$00
C - - - - - 0x00393F 00:B92F: 85 C5     STA ram_00C5
C - - - - - 0x003941 00:B931: A8        TAY

bra_B932:
C - - - - - 0x003942 00:B932: A5 C5     LDA ram_00C5
C - - - - - 0x003944 00:B934: C9 05     CMP #$05
C - - - - - 0x003946 00:B936: D0 03     BNE bra_B93B
C - - - - - 0x003948 00:B938: 4C 1A B9  JMP loc_B91A

bra_B93B:
C - - - - - 0x00394B 00:B93B: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x00394E 00:B93E: C5 C6     CMP ram_00C6
C - - - - - 0x003950 00:B940: B0 09     BCS bra_B94B
C - - - - - 0x003952 00:B942: A5 C6     LDA ram_00C6
C - - - - - 0x003954 00:B944: 38        SEC
C - - - - - 0x003955 00:B945: F9 6B 02  SBC ram_026B,Y
C - - - - - 0x003958 00:B948: 4C 51 B9  JMP loc_B951

bra_B94B:
C - - - - - 0x00395B 00:B94B: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x00395E 00:B94E: 38        SEC
C - - - - - 0x00395F 00:B94F: E5 C6     SBC ram_00C6

loc_B951:
C D 1 - - - 0x003961 00:B951: C9 10     CMP #$10
C - - - - - 0x003963 00:B953: 90 09     BCC bra_B95E

bra_B955:
C - - - - - 0x003965 00:B955: 98        TYA
C - - - - - 0x003966 00:B956: 18        CLC
C - - - - - 0x003967 00:B957: 69 08     ADC #$08
C - - - - - 0x003969 00:B959: A8        TAY
C - - - - - 0x00396A 00:B95A: E6 C5     INC ram_00C5
C - - - - - 0x00396C 00:B95C: D0 D4     BNE bra_B932

bra_B95E:
C - - - - - 0x00396E 00:B95E: A5 C7     LDA ram_00C7
C - - - - - 0x003970 00:B960: D9 68 02  CMP ram_0268,Y
C - - - - - 0x003973 00:B963: D0 F0     BNE bra_B955
C - - - - - 0x003975 00:B965: B9 69 02  LDA ram_0269,Y
C - - - - - 0x003978 00:B968: C9 74     CMP #$74
C - - - - - 0x00397A 00:B96A: D0 AE     BNE bra_B91A
C - - - - - 0x00397C 00:B96C: A9 01     LDA #$01
C - - - - - 0x00397E 00:B96E: 85 E1     STA ram_00E1
C - - - - - 0x003980 00:B970: 60        RTS

bra_B971:
C - - - - - 0x003981 00:B971: A5 2D     LDA con_player_position_y
C - - - - - 0x003983 00:B973: 18        CLC
C - - - - - 0x003984 00:B974: 69 10     ADC #$10
C - - - - - 0x003986 00:B976: 85 C7     STA ram_00C7
C - - - - - 0x003988 00:B978: A5 2C     LDA con_player_position_x
C - - - - - 0x00398A 00:B97A: 85 C6     STA ram_00C6
C - - - - - 0x00398C 00:B97C: 4C 2D B9  JMP loc_B92D

sub_B97F:
C - - - - - 0x00398F 00:B97F: A0 00     LDY #$00

bra_B981:
C - - - - - 0x003991 00:B981: B9 69 02  LDA ram_0269,Y
C - - - - - 0x003994 00:B984: C9 A9     CMP #$A9
C - - - - - 0x003996 00:B986: D0 1C     BNE bra_B9A4
C - - - - - 0x003998 00:B988: 20 19 A4  JSR sub_A419
C - - - - - 0x00399B 00:B98B: 90 5F     BCC bra_B9EC
C - - - - - 0x00399D 00:B98D: AE 3B 06  LDX ram_063B
C - - - - - 0x0039A0 00:B990: FE 33 06  INC con_player_current_money,X 	; increment money at collect crowns

bra_B993:
loc_B993:
C D 1 - - - 0x0039A3 00:B993: A9 F8     LDA #$F8
C - - - - - 0x0039A5 00:B995: 99 68 02  STA ram_0268,Y
C - - - - - 0x0039A8 00:B998: 99 6C 02  STA ram_026C,Y
C - - - - - 0x0039AB 00:B99B: A9 FF     LDA #$FF
C - - - - - 0x0039AD 00:B99D: 99 69 02  STA ram_0269,Y
C - - - - - 0x0039B0 00:B9A0: 99 6D 02  STA ram_026D,Y

bra_B9A3_RTS:
C - - - - - 0x0039B3 00:B9A3: 60        RTS

bra_B9A4:
C - - - - - 0x0039B4 00:B9A4: C9 C3     CMP #$C3
C - - - - - 0x0039B6 00:B9A6: D0 34     BNE bra_B9DC
C - - - - - 0x0039B8 00:B9A8: 20 19 A4  JSR sub_A419
C - - - - - 0x0039BB 00:B9AB: 90 3F     BCC bra_B9EC

sub_B9AD:
C - - - - - 0x0039BD 00:B9AD: A9 01     LDA #$01
C - - - - - 0x0039BF 00:B9AF: 85 D3     STA ram_00D3
C - - - - - 0x0039C1 00:B9B1: AD 39 06  LDA con_player_key		; check key status
C - - - - - 0x0039C4 00:B9B4: D0 ED     BNE bra_B9A3_RTS		; if you have key return
C - - - - - 0x0039C6 00:B9B6: A9 01     LDA #$01				; if not
C - - - - - 0x0039C8 00:B9B8: 8D 39 06  STA con_player_key		; update key status true
C - - - - - 0x0039CB 00:B9BB: 85 67     STA ram_0067
C - - - - - 0x0039CD 00:B9BD: A9 79     LDA #$79				; key icon in status bar
C - - - - - 0x0039CF 00:B9BF: 85 78     STA ram_0078
C - - - - - 0x0039D1 00:B9C1: A9 01     LDA #$01
C - - - - - 0x0039D3 00:B9C3: 85 90     STA ram_0090
C - - - - - 0x0039D5 00:B9C5: AD 20 03  LDA ram_0320
C - - - - - 0x0039D8 00:B9C8: D0 C9     BNE bra_B993
C - - - - - 0x0039DA 00:B9CA: 84 E3     STY ram_00E3
C - - - - - 0x0039DC 00:B9CC: 20 00 97  JSR sub_9700
C - - - - - 0x0039DF 00:B9CF: A4 E3     LDY ram_00E3
C - - - - - 0x0039E1 00:B9D1: A9 FF     LDA #$FF
C - - - - - 0x0039E3 00:B9D3: 99 69 02  STA ram_0269,Y
C - - - - - 0x0039E6 00:B9D6: 99 6D 02  STA ram_026D,Y
C - - - - - 0x0039E9 00:B9D9: 4C 93 B9  JMP loc_B993

bra_B9DC:
C - - - - - 0x0039EC 00:B9DC: C9 BA     CMP #$BA
C - - - - - 0x0039EE 00:B9DE: D0 0C     BNE bra_B9EC
C - - - - - 0x0039F0 00:B9E0: 20 19 A4  JSR sub_A419
C - - - - - 0x0039F3 00:B9E3: 90 07     BCC bra_B9EC
C - - - - - 0x0039F5 00:B9E5: A9 01     LDA #$01
C - - - - - 0x0039F7 00:B9E7: 85 CA     STA ram_00CA
C - - - - - 0x0039F9 00:B9E9: D0 A8     BNE bra_B993
- - - - - - 0x0039FB 00:B9EB: 60        RTS

bra_B9EC:
C - - - - - 0x0039FC 00:B9EC: 98        TYA
C - - - - - 0x0039FD 00:B9ED: 18        CLC
C - - - - - 0x0039FE 00:B9EE: 69 08     ADC #$08
C - - - - - 0x003A00 00:B9F0: A8        TAY
C - - - - - 0x003A01 00:B9F1: C0 28     CPY #$28
C - - - - - 0x003A03 00:B9F3: 90 8C     BCC bra_B981
C - - - - - 0x003A05 00:B9F5: 60        RTS

sub_B9F6:
C - - - - - 0x003A06 00:B9F6: AD 20 03  LDA ram_0320
C - - - - - 0x003A09 00:B9F9: 0D 30 03  ORA ram_0330
C - - - - - 0x003A0C 00:B9FC: D0 01     BNE bra_B9FF
C - - - - - 0x003A0E 00:B9FE: 60        RTS

bra_B9FF:
C - - - - - 0x003A0F 00:B9FF: A5 2C     LDA con_player_position_x
C - - - - - 0x003A11 00:BA01: 18        CLC
C - - - - - 0x003A12 00:BA02: 69 08     ADC #$08
C - - - - - 0x003A14 00:BA04: 85 C6     STA ram_00C6
C - - - - - 0x003A16 00:BA06: A5 2D     LDA con_player_position_y
C - - - - - 0x003A18 00:BA08: 18        CLC
C - - - - - 0x003A19 00:BA09: 69 08     ADC #$08
C - - - - - 0x003A1B 00:BA0B: 85 C7     STA ram_00C7
C - - - - - 0x003A1D 00:BA0D: A9 00     LDA #$00
C - - - - - 0x003A1F 00:BA0F: 85 C5     STA ram_00C5
C - - - - - 0x003A21 00:BA11: A8        TAY

bra_BA12:
C - - - - - 0x003A22 00:BA12: A5 C5     LDA ram_00C5
C - - - - - 0x003A24 00:BA14: C9 08     CMP #$08
C - - - - - 0x003A26 00:BA16: F0 5C     BEQ bra_BA74_RTS
C - - - - - 0x003A28 00:BA18: B9 68 02  LDA ram_0268,Y
C - - - - - 0x003A2B 00:BA1B: 18        CLC
C - - - - - 0x003A2C 00:BA1C: 69 04     ADC #$04
C - - - - - 0x003A2E 00:BA1E: 85 48     STA ram_0048
C - - - - - 0x003A30 00:BA20: C5 C7     CMP ram_00C7
C - - - - - 0x003A32 00:BA22: 90 10     BCC bra_BA34
C - - - - - 0x003A34 00:BA24: 38        SEC
C - - - - - 0x003A35 00:BA25: E5 C7     SBC ram_00C7
C - - - - - 0x003A37 00:BA27: C9 0C     CMP #$0C
C - - - - - 0x003A39 00:BA29: 90 12     BCC bra_BA3D

bra_BA2B:
C - - - - - 0x003A3B 00:BA2B: 98        TYA
C - - - - - 0x003A3C 00:BA2C: 18        CLC
C - - - - - 0x003A3D 00:BA2D: 69 08     ADC #$08
C - - - - - 0x003A3F 00:BA2F: A8        TAY
C - - - - - 0x003A40 00:BA30: E6 C5     INC ram_00C5
C - - - - - 0x003A42 00:BA32: D0 DE     BNE bra_BA12

bra_BA34:
C - - - - - 0x003A44 00:BA34: A5 C7     LDA ram_00C7
C - - - - - 0x003A46 00:BA36: 38        SEC
C - - - - - 0x003A47 00:BA37: E5 48     SBC ram_0048
C - - - - - 0x003A49 00:BA39: C9 0C     CMP #$0C
C - - - - - 0x003A4B 00:BA3B: B0 EE     BCS bra_BA2B

bra_BA3D:
C - - - - - 0x003A4D 00:BA3D: B9 6B 02  LDA ram_026B,Y
C - - - - - 0x003A50 00:BA40: 18        CLC
C - - - - - 0x003A51 00:BA41: 69 08     ADC #$08
C - - - - - 0x003A53 00:BA43: 85 96     STA ram_0096
C - - - - - 0x003A55 00:BA45: C5 C6     CMP ram_00C6
C - - - - - 0x003A57 00:BA47: B0 0B     BCS bra_BA54
C - - - - - 0x003A59 00:BA49: A5 C6     LDA ram_00C6
C - - - - - 0x003A5B 00:BA4B: 38        SEC
C - - - - - 0x003A5C 00:BA4C: E5 96     SBC ram_0096
C - - - - - 0x003A5E 00:BA4E: C9 0C     CMP #$0C
C - - - - - 0x003A60 00:BA50: B0 D9     BCS bra_BA2B
C - - - - - 0x003A62 00:BA52: 90 07     BCC bra_BA5B

bra_BA54:
C - - - - - 0x003A64 00:BA54: 38        SEC
C - - - - - 0x003A65 00:BA55: E5 C6     SBC ram_00C6
C - - - - - 0x003A67 00:BA57: C9 0C     CMP #$0C
C - - - - - 0x003A69 00:BA59: B0 D0     BCS bra_BA2B

bra_BA5B:
C - - - - - 0x003A6B 00:BA5B: A9 00     LDA #$00
C - - - - - 0x003A6D 00:BA5D: 85 D2     STA ram_00D2
C - - - - - 0x003A6F 00:BA5F: B9 69 02  LDA ram_0269,Y
C - - - - - 0x003A72 00:BA62: C9 A9     CMP #$A9
C - - - - - 0x003A74 00:BA64: D0 0F     BNE bra_BA75
C - - - - - 0x003A76 00:BA66: AE 3B 06  LDX ram_063B
C - - - - - 0x003A79 00:BA69: FE 33 06  INC con_player_current_money,X
C - - - - - 0x003A7C 00:BA6C: A9 F8     LDA #$F8
C - - - - - 0x003A7E 00:BA6E: 99 68 02  STA ram_0268,Y
C - - - - - 0x003A81 00:BA71: 99 6C 02  STA ram_026C,Y

bra_BA74_RTS:
C - - - - - 0x003A84 00:BA74: 60        RTS

bra_BA75:
C - - - - - 0x003A85 00:BA75: C9 C3     CMP #$C3		; key ID
C - - - - - 0x003A87 00:BA77: F0 10     BEQ bra_BA89 	; goto unlock next level stairs
C - - - - - 0x003A89 00:BA79: EE 83 03  INC ram_0383
C - - - - - 0x003A8C 00:BA7C: A9 F8     LDA #$F8
C - - - - - 0x003A8E 00:BA7E: 99 68 02  STA ram_0268,Y
C - - - - - 0x003A91 00:BA81: 99 6C 02  STA ram_026C,Y
C - - - - - 0x003A94 00:BA84: A9 01     LDA #$01
C - - - - - 0x003A96 00:BA86: 85 CA     STA ram_00CA
C - - - - - 0x003A98 00:BA88: 60        RTS

bra_BA89:
C - - - - - 0x003A99 00:BA89: 20 AD B9  JSR sub_B9AD
C - - - - - 0x003A9C 00:BA8C: 60        RTS

sub_BA8D:
C - - - - - 0x003A9D 00:BA8D: A5 18     LDA ram_0018
C - - - - - 0x003A9F 00:BA8F: D0 05     BNE bra_BA96
C - - - - - 0x003AA1 00:BA91: AD 20 03  LDA ram_0320
C - - - - - 0x003AA4 00:BA94: F0 05     BEQ bra_BA9B

bra_BA96:
C - - - - - 0x003AA6 00:BA96: A5 33     LDA ram_0033
C - - - - - 0x003AA8 00:BA98: 85 03     STA ram_0003
C - - - - - 0x003AAA 00:BA9A: 60        RTS

bra_BA9B:
C - - - - - 0x003AAB 00:BA9B: A9 00     LDA #$00
C - - - - - 0x003AAD 00:BA9D: 85 03     STA ram_0003
C - - - - - 0x003AAF 00:BA9F: 60        RTS

sub_BAA0:
C - - - - - 0x003AB0 00:BAA0: AE 3B 06  LDX ram_063B
C - - - - - 0x003AB3 00:BAA3: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003AB6 00:BAA6: 85 92     STA ram_0092
C - - - - - 0x003AB8 00:BAA8: C6 92     DEC ram_0092
C - - - - - 0x003ABA 00:BAAA: A5 92     LDA ram_0092
C - - - - - 0x003ABC 00:BAAC: 0A        ASL
C - - - - - 0x003ABD 00:BAAD: AA        TAX
C - - - - - 0x003ABE 00:BAAE: BD 50 92  LDA tbl_924F+1,X
C - - - - - 0x003AC1 00:BAB1: 48        PHA
C - - - - - 0x003AC2 00:BAB2: BD 4F 92  LDA tbl_924F,X
C - - - - - 0x003AC5 00:BAB5: 48        PHA

bra_BAB6_RTS:
C - - - - - 0x003AC6 00:BAB6: 60        RTS

sub_BAB7:
C - - - - - 0x003AC7 00:BAB7: AE 3B 06  LDX ram_063B
C - - - - - 0x003ACA 00:BABA: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003ACD 00:BABD: A5 9A     LDA ram_009A
C - - - - - 0x003ACF 00:BABF: 29 0F     AND #$0F
C - - - - - 0x003AD1 00:BAC1: C9 08     CMP #$08
C - - - - - 0x003AD3 00:BAC3: F0 F1     BEQ bra_BAB6_RTS
C - - - - - 0x003AD5 00:BAC5: C9 0F     CMP #$0F
C - - - - - 0x003AD7 00:BAC7: F0 ED     BEQ bra_BAB6_RTS
C - - - - - 0x003AD9 00:BAC9: E6 5B     INC ram_005B
C - - - - - 0x003ADB 00:BACB: A5 5B     LDA ram_005B
C - - - - - 0x003ADD 00:BACD: C9 08     CMP #$08
C - - - - - 0x003ADF 00:BACF: D0 07     BNE bra_BAD8
C - - - - - 0x003AE1 00:BAD1: A9 01     LDA #$01
C - - - - - 0x003AE3 00:BAD3: 8D 35 06  STA ram_0635
C - - - - - 0x003AE6 00:BAD6: D0 0D     BNE bra_BAE5

bra_BAD8:
C - - - - - 0x003AE8 00:BAD8: C9 10     CMP #$10
C - - - - - 0x003AEA 00:BADA: D0 09     BNE bra_BAE5
C - - - - - 0x003AEC 00:BADC: A9 02     LDA #$02
C - - - - - 0x003AEE 00:BADE: 8D 35 06  STA ram_0635
C - - - - - 0x003AF1 00:BAE1: A9 00     LDA #$00
C - - - - - 0x003AF3 00:BAE3: 85 5B     STA ram_005B

bra_BAE5:
C - - - - - 0x003AF5 00:BAE5: AD 35 06  LDA ram_0635
C - - - - - 0x003AF8 00:BAE8: 85 51     STA ram_0051
C - - - - - 0x003AFA 00:BAEA: A2 00     LDX #$00
C - - - - - 0x003AFC 00:BAEC: 20 F6 BA  JSR sub_BAF6
C - - - - - 0x003AFF 00:BAEF: A2 01     LDX #$01
C - - - - - 0x003B01 00:BAF1: 20 F6 BA  JSR sub_BAF6
C - - - - - 0x003B04 00:BAF4: A2 02     LDX #$02

sub_BAF6:
C - - - - - 0x003B06 00:BAF6: 86 E2     STX ram_00E2
C - - - - - 0x003B08 00:BAF8: B5 AA     LDA ram_00AA,X
C - - - - - 0x003B0A 00:BAFA: D0 35     BNE bra_BB31_RTS
C - - - - - 0x003B0C 00:BAFC: B5 B8     LDA ram_00B8,X
C - - - - - 0x003B0E 00:BAFE: 85 8D     STA ram_008D
C - - - - - 0x003B10 00:BB00: B5 5C     LDA ram_005C,X
C - - - - - 0x003B12 00:BB02: 85 6A     STA ram_006A
C - - - - - 0x003B14 00:BB04: B5 60     LDA ram_0060,X
C - - - - - 0x003B16 00:BB06: 85 71     STA ram_0071
C - - - - - 0x003B18 00:BB08: B5 64     LDA ram_0064,X
C - - - - - 0x003B1A 00:BB0A: 85 72     STA ram_0072
C - - - - - 0x003B1C 00:BB0C: B5 75     LDA ram_0075,X
C - - - - - 0x003B1E 00:BB0E: 85 8E     STA ram_008E
C - - - - - 0x003B20 00:BB10: A9 F7     LDA #$F7
C - - - - - 0x003B22 00:BB12: 85 52     STA ram_0052
C - - - - - 0x003B24 00:BB14: A9 93     LDA #$93
C - - - - - 0x003B26 00:BB16: 85 53     STA ram_0053
C - - - - - 0x003B28 00:BB18: 8A        TXA
C - - - - - 0x003B29 00:BB19: 0A        ASL
C - - - - - 0x003B2A 00:BB1A: 0A        ASL
C - - - - - 0x003B2B 00:BB1B: 18        CLC
C - - - - - 0x003B2C 00:BB1C: 69 04     ADC #$04
C - - - - - 0x003B2E 00:BB1E: 85 24     STA ram_0024
C - - - - - 0x003B30 00:BB20: A9 01     LDA #$01
C - - - - - 0x003B32 00:BB22: 85 54     STA ram_0054
C - - - - - 0x003B34 00:BB24: 20 3D BB  JSR sub_BB3D
C - - - - - 0x003B37 00:BB27: A6 E2     LDX ram_00E2
C - - - - - 0x003B39 00:BB29: A5 8D     LDA ram_008D
C - - - - - 0x003B3B 00:BB2B: 95 B8     STA ram_00B8,X
C - - - - - 0x003B3D 00:BB2D: A5 6A     LDA ram_006A
C - - - - - 0x003B3F 00:BB2F: 95 5C     STA ram_005C,X

bra_BB31_RTS:
C - - - - - 0x003B41 00:BB31: 60        RTS

sub_BB32:
C - - - - - 0x003B42 00:BB32: 8A        TXA
C - - - - - 0x003B43 00:BB33: 0A        ASL
C - - - - - 0x003B44 00:BB34: 0A        ASL
C - - - - - 0x003B45 00:BB35: 0A        ASL
C - - - - - 0x003B46 00:BB36: 0A        ASL
C - - - - - 0x003B47 00:BB37: 18        CLC
C - - - - - 0x003B48 00:BB38: 69 10     ADC #$10
C - - - - - 0x003B4A 00:BB3A: 85 E3     STA ram_00E3
C - - - - - 0x003B4C 00:BB3C: 60        RTS

sub_BB3D:
C - - - - - 0x003B4D 00:BB3D: 20 32 BB  JSR sub_BB32
C - - - - - 0x003B50 00:BB40: 20 24 BD  JSR sub_BD24
C - - - - - 0x003B53 00:BB43: A6 E2     LDX ram_00E2
C - - - - - 0x003B55 00:BB45: A5 4E     LDA ram_004E
C - - - - - 0x003B57 00:BB47: 95 60     STA ram_0060,X
C - - - - - 0x003B59 00:BB49: A5 4D     LDA ram_004D
C - - - - - 0x003B5B 00:BB4B: 95 64     STA ram_0064,X
C - - - - - 0x003B5D 00:BB4D: B5 60     LDA ram_0060,X
C - - - - - 0x003B5F 00:BB4F: C9 F8     CMP #$F8
C - - - - - 0x003B61 00:BB51: D0 08     BNE bra_BB5B
C - - - - - 0x003B63 00:BB53: B5 B1     LDA ram_00B1,X
C - - - - - 0x003B65 00:BB55: D0 04     BNE bra_BB5B
C - - - - - 0x003B67 00:BB57: B5 AE     LDA ram_00AE,X
C - - - - - 0x003B69 00:BB59: F0 12     BEQ bra_BB6D

bra_BB5B:
C - - - - - 0x003B6B 00:BB5B: B5 60     LDA ram_0060,X
C - - - - - 0x003B6D 00:BB5D: C9 F7     CMP #$F7
C - - - - - 0x003B6F 00:BB5F: 90 1C     BCC bra_BB7D
C - - - - - 0x003B71 00:BB61: C9 F9     CMP #$F9
C - - - - - 0x003B73 00:BB63: B0 2E     BCS bra_BB93
C - - - - - 0x003B75 00:BB65: B5 B1     LDA ram_00B1,X
C - - - - - 0x003B77 00:BB67: D0 30     BNE bra_BB99
C - - - - - 0x003B79 00:BB69: B5 AE     LDA ram_00AE,X
C - - - - - 0x003B7B 00:BB6B: D0 1A     BNE bra_BB87

bra_BB6D:
C - - - - - 0x003B7D 00:BB6D: A6 E3     LDX ram_00E3
C - - - - - 0x003B7F 00:BB6F: 20 53 A8  JSR sub_A853
C - - - - - 0x003B82 00:BB72: A6 E2     LDX ram_00E2
C - - - - - 0x003B84 00:BB74: A9 01     LDA #$01
C - - - - - 0x003B86 00:BB76: 95 AA     STA ram_00AA,X
C - - - - - 0x003B88 00:BB78: 8D 43 06  STA ram_0643
C - - - - - 0x003B8B 00:BB7B: D0 26     BNE bra_BBA3_RTS

bra_BB7D:
C - - - - - 0x003B8D 00:BB7D: C9 F0     CMP #$F0
C - - - - - 0x003B8F 00:BB7F: 90 22     BCC bra_BBA3_RTS
C - - - - - 0x003B91 00:BB81: A9 00     LDA #$00
C - - - - - 0x003B93 00:BB83: 95 B1     STA ram_00B1,X
C - - - - - 0x003B95 00:BB85: 95 AE     STA ram_00AE,X

bra_BB87:
C - - - - - 0x003B97 00:BB87: A4 E3     LDY ram_00E3
C - - - - - 0x003B99 00:BB89: A9 F8     LDA #$F8
C - - - - - 0x003B9B 00:BB8B: 99 08 02  STA ram_0208,Y
C - - - - - 0x003B9E 00:BB8E: 99 0C 02  STA ram_020C,Y
C - - - - - 0x003BA1 00:BB91: D0 10     BNE bra_BBA3_RTS

bra_BB93:
C - - - - - 0x003BA3 00:BB93: A9 00     LDA #$00
C - - - - - 0x003BA5 00:BB95: 95 B1     STA ram_00B1,X
C - - - - - 0x003BA7 00:BB97: 95 AE     STA ram_00AE,X

bra_BB99:
C - - - - - 0x003BA9 00:BB99: A4 E3     LDY ram_00E3
C - - - - - 0x003BAB 00:BB9B: A9 F8     LDA #$F8
C - - - - - 0x003BAD 00:BB9D: 99 00 02  STA ram_0200,Y
C - - - - - 0x003BB0 00:BBA0: 99 04 02  STA ram_0204,Y

bra_BBA3_RTS:
C - - - - - 0x003BB3 00:BBA3: 60        RTS

sub_BBA4:
C - - - - - 0x003BB4 00:BBA4: A9 00     LDA #$00
C - - - - - 0x003BB6 00:BBA6: 85 82     STA ram_0082
C - - - - - 0x003BB8 00:BBA8: A5 71     LDA ram_0071
C - - - - - 0x003BBA 00:BBAA: 18        CLC
C - - - - - 0x003BBB 00:BBAB: 65 16     ADC ram_0016
C - - - - - 0x003BBD 00:BBAD: 85 6D     STA ram_006D
C - - - - - 0x003BBF 00:BBAF: B0 10     BCS bra_BBC1
C - - - - - 0x003BC1 00:BBB1: A5 03     LDA ram_0003
C - - - - - 0x003BC3 00:BBB3: 0A        ASL
C - - - - - 0x003BC4 00:BBB4: A8        TAY
C - - - - - 0x003BC5 00:BBB5: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003BC7 00:BBB7: 85 08     STA ram_0008
C - - - - - 0x003BC9 00:BBB9: C8        INY
C - - - - - 0x003BCA 00:BBBA: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003BCC 00:BBBC: 85 09     STA ram_0009
C - - - - - 0x003BCE 00:BBBE: 4C D1 BB  JMP loc_BBD1

bra_BBC1:
C - - - - - 0x003BD1 00:BBC1: A5 03     LDA ram_0003
C - - - - - 0x003BD3 00:BBC3: 18        CLC
C - - - - - 0x003BD4 00:BBC4: 69 01     ADC #$01
C - - - - - 0x003BD6 00:BBC6: 0A        ASL
C - - - - - 0x003BD7 00:BBC7: A8        TAY
C - - - - - 0x003BD8 00:BBC8: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003BDA 00:BBCA: 85 08     STA ram_0008
C - - - - - 0x003BDC 00:BBCC: C8        INY
C - - - - - 0x003BDD 00:BBCD: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003BDF 00:BBCF: 85 09     STA ram_0009

loc_BBD1:
C D 1 - - - 0x003BE1 00:BBD1: A5 72     LDA ram_0072
C - - - - - 0x003BE3 00:BBD3: 85 6E     STA ram_006E
C - - - - - 0x003BE5 00:BBD5: A5 6D     LDA ram_006D
C - - - - - 0x003BE7 00:BBD7: 29 F0     AND #$F0
C - - - - - 0x003BE9 00:BBD9: 85 6D     STA ram_006D
C - - - - - 0x003BEB 00:BBDB: A5 6E     LDA ram_006E
C - - - - - 0x003BED 00:BBDD: 29 F0     AND #$F0
C - - - - - 0x003BEF 00:BBDF: 85 6E     STA ram_006E
C - - - - - 0x003BF1 00:BBE1: A5 6A     LDA ram_006A
C - - - - - 0x003BF3 00:BBE3: C9 01     CMP #$01
C - - - - - 0x003BF5 00:BBE5: D0 1B     BNE bra_BC02
C - - - - - 0x003BF7 00:BBE7: A9 10     LDA #$10
C - - - - - 0x003BF9 00:BBE9: 18        CLC
C - - - - - 0x003BFA 00:BBEA: 65 6D     ADC ram_006D
C - - - - - 0x003BFC 00:BBEC: 85 6D     STA ram_006D
C - - - - - 0x003BFE 00:BBEE: D0 44     BNE bra_BC34
C - - - - - 0x003C00 00:BBF0: A5 03     LDA ram_0003
C - - - - - 0x003C02 00:BBF2: 18        CLC
C - - - - - 0x003C03 00:BBF3: 69 01     ADC #$01
C - - - - - 0x003C05 00:BBF5: 0A        ASL
C - - - - - 0x003C06 00:BBF6: A8        TAY
C - - - - - 0x003C07 00:BBF7: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003C09 00:BBF9: 85 08     STA ram_0008
C - - - - - 0x003C0B 00:BBFB: C8        INY
C - - - - - 0x003C0C 00:BBFC: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003C0E 00:BBFE: 85 09     STA ram_0009
C - - - - - 0x003C10 00:BC00: D0 32     BNE bra_BC34

bra_BC02:
C - - - - - 0x003C12 00:BC02: C9 03     CMP #$03
C - - - - - 0x003C14 00:BC04: D0 17     BNE bra_BC1D
C - - - - - 0x003C16 00:BC06: C6 6D     DEC ram_006D
C - - - - - 0x003C18 00:BC08: A5 6D     LDA ram_006D
C - - - - - 0x003C1A 00:BC0A: C9 FF     CMP #$FF
C - - - - - 0x003C1C 00:BC0C: D0 26     BNE bra_BC34
C - - - - - 0x003C1E 00:BC0E: A5 03     LDA ram_0003
C - - - - - 0x003C20 00:BC10: 0A        ASL
C - - - - - 0x003C21 00:BC11: A8        TAY
C - - - - - 0x003C22 00:BC12: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003C24 00:BC14: 85 08     STA ram_0008
C - - - - - 0x003C26 00:BC16: C8        INY
C - - - - - 0x003C27 00:BC17: B1 7D     LDA (ram_007D),Y
C - - - - - 0x003C29 00:BC19: 85 09     STA ram_0009
C - - - - - 0x003C2B 00:BC1B: D0 17     BNE bra_BC34

bra_BC1D:
C - - - - - 0x003C2D 00:BC1D: C9 02     CMP #$02
C - - - - - 0x003C2F 00:BC1F: D0 05     BNE bra_BC26
C - - - - - 0x003C31 00:BC21: C6 6E     DEC ram_006E
C - - - - - 0x003C33 00:BC23: 4C 34 BC  JMP loc_BC34

bra_BC26:
C - - - - - 0x003C36 00:BC26: C9 04     CMP #$04
C - - - - - 0x003C38 00:BC28: F0 03     BEQ bra_BC2D
- - - - - - 0x003C3A 00:BC2A: 4C 88 BC  JMP loc_BC88_RTS

bra_BC2D:
C - - - - - 0x003C3D 00:BC2D: A5 6E     LDA ram_006E
C - - - - - 0x003C3F 00:BC2F: 18        CLC
C - - - - - 0x003C40 00:BC30: 69 10     ADC #$10
C - - - - - 0x003C42 00:BC32: 85 6E     STA ram_006E

bra_BC34:
loc_BC34:
C D 1 - - - 0x003C44 00:BC34: A5 6D     LDA ram_006D
C - - - - - 0x003C46 00:BC36: 4A        LSR
C - - - - - 0x003C47 00:BC37: 4A        LSR
C - - - - - 0x003C48 00:BC38: 4A        LSR
C - - - - - 0x003C49 00:BC39: 4A        LSR
C - - - - - 0x003C4A 00:BC3A: 85 36     STA ram_0036
C - - - - - 0x003C4C 00:BC3C: A5 6E     LDA ram_006E
C - - - - - 0x003C4E 00:BC3E: 29 F0     AND #$F0
C - - - - - 0x003C50 00:BC40: 18        CLC
C - - - - - 0x003C51 00:BC41: 65 36     ADC ram_0036
C - - - - - 0x003C53 00:BC43: A8        TAY
C - - - - - 0x003C54 00:BC44: B1 08     LDA (ram_0008),Y
C - - - - - 0x003C56 00:BC46: 8D 86 03  STA ram_0386
C - - - - - 0x003C59 00:BC49: AD 20 03  LDA ram_0320
C - - - - - 0x003C5C 00:BC4C: D0 2A     BNE bra_BC78
C - - - - - 0x003C5E 00:BC4E: A5 18     LDA ram_0018
C - - - - - 0x003C60 00:BC50: D0 1A     BNE bra_BC6C
C - - - - - 0x003C62 00:BC52: A5 6F     LDA ram_006F
C - - - - - 0x003C64 00:BC54: D0 16     BNE bra_BC6C
C - - - - - 0x003C66 00:BC56: AE 3B 06  LDX ram_063B
C - - - - - 0x003C69 00:BC59: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003C6C 00:BC5C: C9 07     CMP #$07
C - - - - - 0x003C6E 00:BC5E: B0 0C     BCS bra_BC6C
C - - - - - 0x003C70 00:BC60: AD 86 03  LDA ram_0386
C - - - - - 0x003C73 00:BC63: C9 CE     CMP #$CE
C - - - - - 0x003C75 00:BC65: F0 1D     BEQ bra_BC84
C - - - - - 0x003C77 00:BC67: A9 01     LDA #$01
C - - - - - 0x003C79 00:BC69: 85 82     STA ram_0082
C - - - - - 0x003C7B 00:BC6B: 60        RTS

bra_BC6C:
C - - - - - 0x003C7C 00:BC6C: AD 86 03  LDA ram_0386
C - - - - - 0x003C7F 00:BC6F: C9 D0     CMP #$D0
C - - - - - 0x003C81 00:BC71: F0 11     BEQ bra_BC84
C - - - - - 0x003C83 00:BC73: A9 01     LDA #$01
C - - - - - 0x003C85 00:BC75: 85 82     STA ram_0082
C - - - - - 0x003C87 00:BC77: 60        RTS

bra_BC78:
C - - - - - 0x003C88 00:BC78: AD 86 03  LDA ram_0386
C - - - - - 0x003C8B 00:BC7B: C9 8C     CMP #$8C
C - - - - - 0x003C8D 00:BC7D: F0 05     BEQ bra_BC84
C - - - - - 0x003C8F 00:BC7F: A9 01     LDA #$01
C - - - - - 0x003C91 00:BC81: 85 82     STA ram_0082
C - - - - - 0x003C93 00:BC83: 60        RTS

bra_BC84:
C - - - - - 0x003C94 00:BC84: A9 00     LDA #$00
C - - - - - 0x003C96 00:BC86: 85 82     STA ram_0082

loc_BC88_RTS:
C - - - - - 0x003C98 00:BC88: 60        RTS

sub_BC89:
C - - - - - 0x003C99 00:BC89: A5 80     LDA ram_0080
C - - - - - 0x003C9B 00:BC8B: 29 03     AND #$03
C - - - - - 0x003C9D 00:BC8D: 85 87     STA ram_0087
C - - - - - 0x003C9F 00:BC8F: E6 87     INC ram_0087
C - - - - - 0x003CA1 00:BC91: A5 87     LDA ram_0087
C - - - - - 0x003CA3 00:BC93: 60        RTS

sub_BC94:
C - - - - - 0x003CA4 00:BC94: A5 82     LDA ram_0082
C - - - - - 0x003CA6 00:BC96: D0 2F     BNE bra_BCC7
C - - - - - 0x003CA8 00:BC98: A5 6A     LDA ram_006A
C - - - - - 0x003CAA 00:BC9A: C9 01     CMP #$01
C - - - - - 0x003CAC 00:BC9C: D0 09     BNE bra_BCA7
C - - - - - 0x003CAE 00:BC9E: A9 00     LDA #$00
C - - - - - 0x003CB0 00:BCA0: 85 4C     STA ram_004C
C - - - - - 0x003CB2 00:BCA2: E6 4E     INC ram_004E
C - - - - - 0x003CB4 00:BCA4: 4C C7 BC  JMP loc_BCC7

bra_BCA7:
C - - - - - 0x003CB7 00:BCA7: C9 03     CMP #$03
C - - - - - 0x003CB9 00:BCA9: D0 09     BNE bra_BCB4
C - - - - - 0x003CBB 00:BCAB: A9 01     LDA #$01
C - - - - - 0x003CBD 00:BCAD: 85 4C     STA ram_004C
C - - - - - 0x003CBF 00:BCAF: C6 4E     DEC ram_004E
C - - - - - 0x003CC1 00:BCB1: 4C C7 BC  JMP loc_BCC7

bra_BCB4:
C - - - - - 0x003CC4 00:BCB4: C9 02     CMP #$02
C - - - - - 0x003CC6 00:BCB6: D0 09     BNE bra_BCC1
C - - - - - 0x003CC8 00:BCB8: A9 00     LDA #$00
C - - - - - 0x003CCA 00:BCBA: 85 4C     STA ram_004C
C - - - - - 0x003CCC 00:BCBC: C6 4D     DEC ram_004D
C - - - - - 0x003CCE 00:BCBE: 4C C7 BC  JMP loc_BCC7

bra_BCC1:
C - - - - - 0x003CD1 00:BCC1: A9 01     LDA #$01
C - - - - - 0x003CD3 00:BCC3: 85 4C     STA ram_004C
C - - - - - 0x003CD5 00:BCC5: E6 4D     INC ram_004D

bra_BCC7:
loc_BCC7:
C D 1 - - - 0x003CD7 00:BCC7: A9 01     LDA #$01
C - - - - - 0x003CD9 00:BCC9: 85 2B     STA ram_002B
C - - - - - 0x003CDB 00:BCCB: 20 56 C1  JSR sub_C156
C - - - - - 0x003CDE 00:BCCE: 60        RTS

sub_BCCF:
C - - - - - 0x003CDF 00:BCCF: A9 00     LDA #$00
C - - - - - 0x003CE1 00:BCD1: 85 82     STA ram_0082
C - - - - - 0x003CE3 00:BCD3: A5 71     LDA ram_0071
C - - - - - 0x003CE5 00:BCD5: 18        CLC
C - - - - - 0x003CE6 00:BCD6: 65 16     ADC ram_0016
C - - - - - 0x003CE8 00:BCD8: 29 0F     AND #$0F
C - - - - - 0x003CEA 00:BCDA: D0 20     BNE bra_BCFC
C - - - - - 0x003CEC 00:BCDC: A5 72     LDA ram_0072
C - - - - - 0x003CEE 00:BCDE: 29 0F     AND #$0F
C - - - - - 0x003CF0 00:BCE0: D0 1A     BNE bra_BCFC
C - - - - - 0x003CF2 00:BCE2: AD 4C 03  LDA ram_034C
C - - - - - 0x003CF5 00:BCE5: 0D 29 03  ORA ram_0329
C - - - - - 0x003CF8 00:BCE8: F0 0F     BEQ bra_BCF9
C - - - - - 0x003CFA 00:BCEA: A5 F7     LDA ram_00F7
C - - - - - 0x003CFC 00:BCEC: C9 02     CMP #$02
C - - - - - 0x003CFE 00:BCEE: D0 07     BNE bra_BCF7
C - - - - - 0x003D00 00:BCF0: A9 00     LDA #$00
C - - - - - 0x003D02 00:BCF2: 85 F7     STA ram_00F7
C - - - - - 0x003D04 00:BCF4: 20 0D BE  JSR sub_BE0D

bra_BCF7:
C - - - - - 0x003D07 00:BCF7: E6 F7     INC ram_00F7

bra_BCF9:
C - - - - - 0x003D09 00:BCF9: 20 A4 BB  JSR sub_BBA4

bra_BCFC:
C - - - - - 0x003D0C 00:BCFC: A5 71     LDA ram_0071
C - - - - - 0x003D0E 00:BCFE: 85 4E     STA ram_004E
C - - - - - 0x003D10 00:BD00: A5 72     LDA ram_0072
C - - - - - 0x003D12 00:BD02: 85 4D     STA ram_004D
C - - - - - 0x003D14 00:BD04: 20 94 BC  JSR sub_BC94
C - - - - - 0x003D17 00:BD07: AD 16 03  LDA ram_0316
C - - - - - 0x003D1A 00:BD0A: D0 0E     BNE bra_BD1A
C - - - - - 0x003D1C 00:BD0C: AD 4C 03  LDA ram_034C
C - - - - - 0x003D1F 00:BD0F: F0 06     BEQ bra_BD17
C - - - - - 0x003D21 00:BD11: 20 37 A7  JSR sub_A737
C - - - - - 0x003D24 00:BD14: 4C 1A BD  JMP loc_BD1A

bra_BD17:
C - - - - - 0x003D27 00:BD17: 20 55 96  JSR sub_9655

bra_BD1A:
loc_BD1A:
C D 1 - - - 0x003D2A 00:BD1A: A5 82     LDA ram_0082
C - - - - - 0x003D2C 00:BD1C: F0 05     BEQ bra_BD23_RTS
C - - - - - 0x003D2E 00:BD1E: 20 89 BC  JSR sub_BC89
C - - - - - 0x003D31 00:BD21: 85 6A     STA ram_006A

bra_BD23_RTS:
C - - - - - 0x003D33 00:BD23: 60        RTS

sub_BD24:
C - - - - - 0x003D34 00:BD24: A9 00     LDA #$00
C - - - - - 0x003D36 00:BD26: 85 82     STA ram_0082
C - - - - - 0x003D38 00:BD28: A5 71     LDA ram_0071
C - - - - - 0x003D3A 00:BD2A: 18        CLC
C - - - - - 0x003D3B 00:BD2B: 65 16     ADC ram_0016
C - - - - - 0x003D3D 00:BD2D: 29 0F     AND #$0F
C - - - - - 0x003D3F 00:BD2F: D0 19     BNE bra_BD4A
C - - - - - 0x003D41 00:BD31: A5 72     LDA ram_0072
C - - - - - 0x003D43 00:BD33: 29 0F     AND #$0F
C - - - - - 0x003D45 00:BD35: D0 13     BNE bra_BD4A
C - - - - - 0x003D47 00:BD37: A5 8D     LDA ram_008D
C - - - - - 0x003D49 00:BD39: C9 04     CMP #$04
C - - - - - 0x003D4B 00:BD3B: D0 08     BNE bra_BD45
C - - - - - 0x003D4D 00:BD3D: A9 00     LDA #$00
C - - - - - 0x003D4F 00:BD3F: 85 8D     STA ram_008D
C - - - - - 0x003D51 00:BD41: A5 8E     LDA ram_008E
C - - - - - 0x003D53 00:BD43: 85 6A     STA ram_006A

bra_BD45:
C - - - - - 0x003D55 00:BD45: E6 8D     INC ram_008D
C - - - - - 0x003D57 00:BD47: 20 A4 BB  JSR sub_BBA4

bra_BD4A:
C - - - - - 0x003D5A 00:BD4A: A5 71     LDA ram_0071
C - - - - - 0x003D5C 00:BD4C: 85 4E     STA ram_004E
C - - - - - 0x003D5E 00:BD4E: A5 72     LDA ram_0072
C - - - - - 0x003D60 00:BD50: 85 4D     STA ram_004D
C - - - - - 0x003D62 00:BD52: 20 94 BC  JSR sub_BC94
C - - - - - 0x003D65 00:BD55: AD 16 03  LDA ram_0316
C - - - - - 0x003D68 00:BD58: 05 A8     ORA ram_00A8
C - - - - - 0x003D6A 00:BD5A: D0 03     BNE bra_BD5F
C - - - - - 0x003D6C 00:BD5C: 20 55 96  JSR sub_9655

bra_BD5F:
C - - - - - 0x003D6F 00:BD5F: A5 82     LDA ram_0082
C - - - - - 0x003D71 00:BD61: F0 05     BEQ bra_BD68_RTS
C - - - - - 0x003D73 00:BD63: 20 89 BC  JSR sub_BC89
C - - - - - 0x003D76 00:BD66: 85 6A     STA ram_006A

bra_BD68_RTS:
C - - - - - 0x003D78 00:BD68: 60        RTS
C - - - - - 0x003D79 00:BD69: A5 7B     LDA ram_007B
C - - - - - 0x003D7B 00:BD6B: 29 0F     AND #$0F
C - - - - - 0x003D7D 00:BD6D: C9 02     CMP #$02
C - - - - - 0x003D7F 00:BD6F: D0 10     BNE bra_BD81
C - - - - - 0x003D81 00:BD71: A5 60     LDA ram_0060
C - - - - - 0x003D83 00:BD73: 85 68     STA ram_0068
C - - - - - 0x003D85 00:BD75: A5 64     LDA ram_0064
C - - - - - 0x003D87 00:BD77: 85 69     STA ram_0069
C - - - - - 0x003D89 00:BD79: 20 0D BE  JSR sub_BE0D
C - - - - - 0x003D8C 00:BD7C: A5 6A     LDA ram_006A
C - - - - - 0x003D8E 00:BD7E: 85 75     STA ram_0075
C - - - - - 0x003D90 00:BD80: 60        RTS

bra_BD81:
C - - - - - 0x003D91 00:BD81: C9 04     CMP #$04
C - - - - - 0x003D93 00:BD83: D0 06     BNE bra_BD8B
C - - - - - 0x003D95 00:BD85: 20 89 BC  JSR sub_BC89
C - - - - - 0x003D98 00:BD88: 85 76     STA ram_0076
C - - - - - 0x003D9A 00:BD8A: 60        RTS

bra_BD8B:
C - - - - - 0x003D9B 00:BD8B: C9 06     CMP #$06
C - - - - - 0x003D9D 00:BD8D: D0 07     BNE bra_BD96_RTS
C - - - - - 0x003D9F 00:BD8F: 20 89 BC  JSR sub_BC89
C - - - - - 0x003DA2 00:BD92: A5 6A     LDA ram_006A
C - - - - - 0x003DA4 00:BD94: 85 77     STA ram_0077

bra_BD96_RTS:
C - - - - - 0x003DA6 00:BD96: 60        RTS
C - - - - - 0x003DA7 00:BD97: A5 7B     LDA ram_007B
C - - - - - 0x003DA9 00:BD99: 29 0F     AND #$0F
C - - - - - 0x003DAB 00:BD9B: C9 02     CMP #$02
C - - - - - 0x003DAD 00:BD9D: D0 06     BNE bra_BDA5
C - - - - - 0x003DAF 00:BD9F: 20 89 BC  JSR sub_BC89
C - - - - - 0x003DB2 00:BDA2: 85 75     STA ram_0075
C - - - - - 0x003DB4 00:BDA4: 60        RTS

bra_BDA5:
C - - - - - 0x003DB5 00:BDA5: C9 04     CMP #$04
C - - - - - 0x003DB7 00:BDA7: D0 10     BNE bra_BDB9
C - - - - - 0x003DB9 00:BDA9: A5 61     LDA ram_0061
C - - - - - 0x003DBB 00:BDAB: 85 68     STA ram_0068
C - - - - - 0x003DBD 00:BDAD: A5 65     LDA ram_0065
C - - - - - 0x003DBF 00:BDAF: 85 69     STA ram_0069
C - - - - - 0x003DC1 00:BDB1: 20 0D BE  JSR sub_BE0D
C - - - - - 0x003DC4 00:BDB4: A5 6A     LDA ram_006A
C - - - - - 0x003DC6 00:BDB6: 85 76     STA ram_0076
C - - - - - 0x003DC8 00:BDB8: 60        RTS

bra_BDB9:
C - - - - - 0x003DC9 00:BDB9: C9 06     CMP #$06
C - - - - - 0x003DCB 00:BDBB: D0 0F     BNE bra_BDCC_RTS
C - - - - - 0x003DCD 00:BDBD: A5 62     LDA ram_0062
C - - - - - 0x003DCF 00:BDBF: 85 68     STA ram_0068
C - - - - - 0x003DD1 00:BDC1: A5 66     LDA ram_0066
C - - - - - 0x003DD3 00:BDC3: 85 69     STA ram_0069
C - - - - - 0x003DD5 00:BDC5: 20 0D BE  JSR sub_BE0D
C - - - - - 0x003DD8 00:BDC8: A5 6A     LDA ram_006A
C - - - - - 0x003DDA 00:BDCA: 85 77     STA ram_0077

bra_BDCC_RTS:
C - - - - - 0x003DDC 00:BDCC: 60        RTS
C - - - - - 0x003DDD 00:BDCD: A5 7B     LDA ram_007B
C - - - - - 0x003DDF 00:BDCF: 29 0F     AND #$0F
C - - - - - 0x003DE1 00:BDD1: C9 02     CMP #$02
C - - - - - 0x003DE3 00:BDD3: D0 10     BNE bra_BDE5
C - - - - - 0x003DE5 00:BDD5: A5 60     LDA ram_0060
C - - - - - 0x003DE7 00:BDD7: 85 68     STA ram_0068
C - - - - - 0x003DE9 00:BDD9: A5 64     LDA ram_0064
C - - - - - 0x003DEB 00:BDDB: 85 69     STA ram_0069
C - - - - - 0x003DED 00:BDDD: 20 0D BE  JSR sub_BE0D
C - - - - - 0x003DF0 00:BDE0: A5 6A     LDA ram_006A
C - - - - - 0x003DF2 00:BDE2: 85 75     STA ram_0075
C - - - - - 0x003DF4 00:BDE4: 60        RTS

bra_BDE5:
C - - - - - 0x003DF5 00:BDE5: C9 04     CMP #$04
C - - - - - 0x003DF7 00:BDE7: D0 10     BNE bra_BDF9
C - - - - - 0x003DF9 00:BDE9: A5 61     LDA ram_0061
C - - - - - 0x003DFB 00:BDEB: 85 68     STA ram_0068
C - - - - - 0x003DFD 00:BDED: A5 65     LDA ram_0065
C - - - - - 0x003DFF 00:BDEF: 85 69     STA ram_0069
C - - - - - 0x003E01 00:BDF1: 20 0D BE  JSR sub_BE0D
C - - - - - 0x003E04 00:BDF4: A5 6A     LDA ram_006A
C - - - - - 0x003E06 00:BDF6: 85 76     STA ram_0076
C - - - - - 0x003E08 00:BDF8: 60        RTS

bra_BDF9:
C - - - - - 0x003E09 00:BDF9: C9 06     CMP #$06
C - - - - - 0x003E0B 00:BDFB: D0 0F     BNE bra_BE0C_RTS
C - - - - - 0x003E0D 00:BDFD: A5 62     LDA ram_0062
C - - - - - 0x003E0F 00:BDFF: 85 68     STA ram_0068
C - - - - - 0x003E11 00:BE01: A5 66     LDA ram_0066
C - - - - - 0x003E13 00:BE03: 85 69     STA ram_0069
C - - - - - 0x003E15 00:BE05: 20 0D BE  JSR sub_BE0D
C - - - - - 0x003E18 00:BE08: A5 6A     LDA ram_006A
C - - - - - 0x003E1A 00:BE0A: 85 77     STA ram_0077

bra_BE0C_RTS:
C - - - - - 0x003E1C 00:BE0C: 60        RTS

sub_BE0D:
C - - - - - 0x003E1D 00:BE0D: A5 68     LDA ram_0068
C - - - - - 0x003E1F 00:BE0F: 38        SEC
C - - - - - 0x003E20 00:BE10: E5 2C     SBC con_player_position_x
C - - - - - 0x003E22 00:BE12: 30 32     BMI bra_BE46
C - - - - - 0x003E24 00:BE14: 85 6B     STA ram_006B
C - - - - - 0x003E26 00:BE16: A5 69     LDA ram_0069
C - - - - - 0x003E28 00:BE18: 38        SEC
C - - - - - 0x003E29 00:BE19: E5 2D     SBC con_player_position_y
C - - - - - 0x003E2B 00:BE1B: 30 12     BMI bra_BE2F
C - - - - - 0x003E2D 00:BE1D: 85 6C     STA ram_006C
C - - - - - 0x003E2F 00:BE1F: A5 6B     LDA ram_006B
C - - - - - 0x003E31 00:BE21: C5 6C     CMP ram_006C
C - - - - - 0x003E33 00:BE23: B0 05     BCS bra_BE2A
C - - - - - 0x003E35 00:BE25: A9 02     LDA #$02
C - - - - - 0x003E37 00:BE27: 85 6A     STA ram_006A
C - - - - - 0x003E39 00:BE29: 60        RTS

bra_BE2A:
C - - - - - 0x003E3A 00:BE2A: A9 03     LDA #$03
C - - - - - 0x003E3C 00:BE2C: 85 6A     STA ram_006A
C - - - - - 0x003E3E 00:BE2E: 60        RTS

bra_BE2F:
C - - - - - 0x003E3F 00:BE2F: 85 6C     STA ram_006C
C - - - - - 0x003E41 00:BE31: A9 00     LDA #$00
C - - - - - 0x003E43 00:BE33: 38        SEC
C - - - - - 0x003E44 00:BE34: E5 6C     SBC ram_006C
C - - - - - 0x003E46 00:BE36: A5 6B     LDA ram_006B
C - - - - - 0x003E48 00:BE38: C5 6C     CMP ram_006C
C - - - - - 0x003E4A 00:BE3A: B0 05     BCS bra_BE41
C - - - - - 0x003E4C 00:BE3C: A9 04     LDA #$04
C - - - - - 0x003E4E 00:BE3E: 85 6A     STA ram_006A
C - - - - - 0x003E50 00:BE40: 60        RTS

bra_BE41:
- - - - - - 0x003E51 00:BE41: A9 03     LDA #$03
- - - - - - 0x003E53 00:BE43: 85 6A     STA ram_006A
- - - - - - 0x003E55 00:BE45: 60        RTS

bra_BE46:
C - - - - - 0x003E56 00:BE46: 85 6B     STA ram_006B
C - - - - - 0x003E58 00:BE48: A9 00     LDA #$00
C - - - - - 0x003E5A 00:BE4A: 38        SEC
C - - - - - 0x003E5B 00:BE4B: E5 6B     SBC ram_006B
C - - - - - 0x003E5D 00:BE4D: 85 6B     STA ram_006B
C - - - - - 0x003E5F 00:BE4F: A5 69     LDA ram_0069
C - - - - - 0x003E61 00:BE51: 38        SEC
C - - - - - 0x003E62 00:BE52: E5 2D     SBC con_player_position_y
C - - - - - 0x003E64 00:BE54: 30 12     BMI bra_BE68
C - - - - - 0x003E66 00:BE56: 85 6C     STA ram_006C
C - - - - - 0x003E68 00:BE58: A5 6B     LDA ram_006B
C - - - - - 0x003E6A 00:BE5A: C5 6C     CMP ram_006C
C - - - - - 0x003E6C 00:BE5C: B0 05     BCS bra_BE63
C - - - - - 0x003E6E 00:BE5E: A9 02     LDA #$02
C - - - - - 0x003E70 00:BE60: 85 6A     STA ram_006A
C - - - - - 0x003E72 00:BE62: 60        RTS

bra_BE63:
C - - - - - 0x003E73 00:BE63: A9 01     LDA #$01
C - - - - - 0x003E75 00:BE65: 85 6A     STA ram_006A
C - - - - - 0x003E77 00:BE67: 60        RTS

bra_BE68:
C - - - - - 0x003E78 00:BE68: 85 6C     STA ram_006C
C - - - - - 0x003E7A 00:BE6A: A9 00     LDA #$00
C - - - - - 0x003E7C 00:BE6C: 38        SEC
C - - - - - 0x003E7D 00:BE6D: E5 6C     SBC ram_006C
C - - - - - 0x003E7F 00:BE6F: 85 6C     STA ram_006C
C - - - - - 0x003E81 00:BE71: A5 6B     LDA ram_006B
C - - - - - 0x003E83 00:BE73: C5 6C     CMP ram_006C
C - - - - - 0x003E85 00:BE75: B0 05     BCS bra_BE7C
C - - - - - 0x003E87 00:BE77: A9 04     LDA #$04
C - - - - - 0x003E89 00:BE79: 85 6A     STA ram_006A
C - - - - - 0x003E8B 00:BE7B: 60        RTS

bra_BE7C:
C - - - - - 0x003E8C 00:BE7C: A9 01     LDA #$01
C - - - - - 0x003E8E 00:BE7E: 85 6A     STA ram_006A
C - - - - - 0x003E90 00:BE80: 60        RTS

sub_BE81:
C - - - - - 0x003E91 00:BE81: A5 2C     LDA con_player_position_x
C - - - - - 0x003E93 00:BE83: 18        CLC
C - - - - - 0x003E94 00:BE84: 65 16     ADC ram_0016
C - - - - - 0x003E96 00:BE86: 29 0F     AND #$0F
C - - - - - 0x003E98 00:BE88: 85 39     STA ram_0039
C - - - - - 0x003E9A 00:BE8A: A5 2D     LDA con_player_position_y
C - - - - - 0x003E9C 00:BE8C: 29 0F     AND #$0F
C - - - - - 0x003E9E 00:BE8E: 85 4B     STA ram_004B
C - - - - - 0x003EA0 00:BE90: A5 4B     LDA ram_004B
C - - - - - 0x003EA2 00:BE92: C9 08     CMP #$08
C - - - - - 0x003EA4 00:BE94: B0 05     BCS bra_BE9B

loc_BE96:
C D 1 - - - 0x003EA6 00:BE96: 85 3D     STA ram_003D
C - - - - - 0x003EA8 00:BE98: 4C A1 BE  JMP loc_BEA1

bra_BE9B:
C - - - - - 0x003EAB 00:BE9B: 38        SEC
C - - - - - 0x003EAC 00:BE9C: E9 08     SBC #$08
C - - - - - 0x003EAE 00:BE9E: 4C 96 BE  JMP loc_BE96

loc_BEA1:
C D 1 - - - 0x003EB1 00:BEA1: A5 1C     LDA ram_001C
C - - - - - 0x003EB3 00:BEA3: 29 01     AND #$01
C - - - - - 0x003EB5 00:BEA5: F0 0B     BEQ bra_BEB2

bra_BEA7:
C - - - - - 0x003EB7 00:BEA7: A5 39     LDA ram_0039
C - - - - - 0x003EB9 00:BEA9: C9 00     CMP #$00
C - - - - - 0x003EBB 00:BEAB: D0 04     BNE bra_BEB1_RTS
C - - - - - 0x003EBD 00:BEAD: A9 01     LDA #$01
C - - - - - 0x003EBF 00:BEAF: 85 41     STA ram_0041

bra_BEB1_RTS:
C - - - - - 0x003EC1 00:BEB1: 60        RTS

bra_BEB2:
C - - - - - 0x003EC2 00:BEB2: A5 1C     LDA ram_001C
C - - - - - 0x003EC4 00:BEB4: 29 02     AND #$02
C - - - - - 0x003EC6 00:BEB6: D0 EF     BNE bra_BEA7
C - - - - - 0x003EC8 00:BEB8: A5 1C     LDA ram_001C
C - - - - - 0x003ECA 00:BEBA: 29 08     AND #$08
C - - - - - 0x003ECC 00:BEBC: F0 0B     BEQ bra_BEC9

bra_BEBE:
C - - - - - 0x003ECE 00:BEBE: A5 3D     LDA ram_003D
C - - - - - 0x003ED0 00:BEC0: C9 00     CMP #$00
C - - - - - 0x003ED2 00:BEC2: D0 ED     BNE bra_BEB1_RTS
C - - - - - 0x003ED4 00:BEC4: A9 01     LDA #$01
C - - - - - 0x003ED6 00:BEC6: 85 41     STA ram_0041
C - - - - - 0x003ED8 00:BEC8: 60        RTS

bra_BEC9:
C - - - - - 0x003ED9 00:BEC9: A5 1C     LDA ram_001C
C - - - - - 0x003EDB 00:BECB: 29 04     AND #$04
C - - - - - 0x003EDD 00:BECD: D0 EF     BNE bra_BEBE
C - - - - - 0x003EDF 00:BECF: 60        RTS

sub_BED0:
C - - - - - 0x003EE0 00:BED0: A2 00     LDX #$00
C - - - - - 0x003EE2 00:BED2: A9 F8     LDA #$F8

bra_BED4:
C - - - - - 0x003EE4 00:BED4: 9D 00 02  STA ram_0200,X
C - - - - - 0x003EE7 00:BED7: E8        INX
C - - - - - 0x003EE8 00:BED8: E8        INX
C - - - - - 0x003EE9 00:BED9: E8        INX
C - - - - - 0x003EEA 00:BEDA: E8        INX
C - - - - - 0x003EEB 00:BEDB: D0 F7     BNE bra_BED4
C - - - - - 0x003EED 00:BEDD: 60        RTS

sub_BEDE:
C - - - - - 0x003EEE 00:BEDE: A0 00     LDY #$00
C - - - - - 0x003EF0 00:BEE0: A2 3F     LDX #$3F
C - - - - - 0x003EF2 00:BEE2: A9 00     LDA #$00
C - - - - - 0x003EF4 00:BEE4: 8E 06 20  STX $2006
C - - - - - 0x003EF7 00:BEE7: 8D 06 20  STA $2006

bra_BEEA:
C - - - - - 0x003EFA 00:BEEA: B1 06     LDA (ram_0006),Y
C - - - - - 0x003EFC 00:BEEC: 8D 07 20  STA $2007
C - - - - - 0x003EFF 00:BEEF: C8        INY
C - - - - - 0x003F00 00:BEF0: C0 10     CPY #$10
C - - - - - 0x003F02 00:BEF2: D0 F6     BNE bra_BEEA
C - - - - - 0x003F04 00:BEF4: 60        RTS

sub_BEF5_build_screen:
C - - - - - 0x003F05 00:BEF5: A0 00     LDY #$00			; reset Y
C - - - - - 0x003F07 00:BEF7: A9 00     LDA #$00			; meta-tiles columns 
C - - - - - 0x003F09 00:BEF9: 85 0A     STA ram_000A
C - - - - - 0x003F0B 00:BEFB: A5 14     LDA ram_0014		; load current nametable
C - - - - - 0x003F0D 00:BEFD: D0 04     BNE bra_BF03_write_PPU_2400
C - - - - - 0x003F0F 00:BEFF: A9 20     LDA #$20			; use $2000 PPU
C - - - - - 0x003F11 00:BF01: D0 02     BNE bra_BF05_write_PPU_2000

bra_BF03_write_PPU_2400:
C - - - - - 0x003F13 00:BF03: A9 24     LDA #$24			; use $2400 PPU

bra_BF05_write_PPU_2000:
C - - - - - 0x003F15 00:BF05: 85 0D     STA ram_000D		; high byte PPU
C - - - - - 0x003F17 00:BF07: A9 00     LDA #$00
C - - - - - 0x003F19 00:BF09: 85 0C     STA ram_000C		; low byte PPU
C - - - - - 0x003F1B 00:BF0B: 85 0B     STA ram_000B		; meta-tiles row

loc_BF0D_next_meta_tile:
C D 1 - - - 0x003F1D 00:BF0D: AD 8C 03  LDA ram_038C
C - - - - - 0x003F20 00:BF10: F0 13     BEQ bra_BF25_use_meta_tiles_table_03
C - - - - - 0x003F22 00:BF12: A9 F9     LDA #>tbl_F983_meta_tiles_table_02
C - - - - - 0x003F24 00:BF14: 85 2F     STA ram_002F
C - - - - - 0x003F26 00:BF16: A9 83     LDA #<tbl_F983_meta_tiles_table_02
C - - - - - 0x003F28 00:BF18: 85 2E     STA ram_002E
C - - - - - 0x003F2A 00:BF1A: A9 83     LDA #$83
C - - - - - 0x003F2C 00:BF1C: 85 08     STA ram_0008
C - - - - - 0x003F2E 00:BF1E: A9 E4     LDA #$E4
C - - - - - 0x003F30 00:BF20: 85 09     STA ram_0009
C - - - - - 0x003F32 00:BF22: 4C 5D BF  JMP loc_BF5D_load_meta_tile

bra_BF25_use_meta_tiles_table_03:
C - - - - - 0x003F35 00:BF25: A5 91     LDA ram_0091
C - - - - - 0x003F37 00:BF27: F0 0B     BEQ bra_BF34
C - - - - - 0x003F39 00:BF29: A9 FD     LDA #>tbl_FD83_meta_tiles_table_03
C - - - - - 0x003F3B 00:BF2B: 85 2F     STA ram_002F
C - - - - - 0x003F3D 00:BF2D: A9 83     LDA #<tbl_FD83_meta_tiles_table_03
C - - - - - 0x003F3F 00:BF2F: 85 2E     STA ram_002E
C - - - - - 0x003F41 00:BF31: 4C 5D BF  JMP loc_BF5D_load_meta_tile

bra_BF34:
C - - - - - 0x003F44 00:BF34: A5 15     LDA ram_0015
C - - - - - 0x003F46 00:BF36: D0 12     BNE bra_BF4A_use_meta_tiles_table_02
C - - - - - 0x003F48 00:BF38: A5 4F     LDA ram_004F
C - - - - - 0x003F4A 00:BF3A: D0 0E     BNE bra_BF4A_use_meta_tiles_table_02
C - - - - - 0x003F4C 00:BF3C: A5 6F     LDA ram_006F
C - - - - - 0x003F4E 00:BF3E: D0 0A     BNE bra_BF4A_use_meta_tiles_table_02
C - - - - - 0x003F50 00:BF40: AE 3B 06  LDX ram_063B
C - - - - - 0x003F53 00:BF43: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x003F56 00:BF46: C9 07     CMP #$07
C - - - - - 0x003F58 00:BF48: 90 0B     BCC bra_BF55_use_meta_tiles_table_01  ; if level < 7 use meta_tiles_table_01

bra_BF4A_use_meta_tiles_table_02:
C - - - - - 0x003F5A 00:BF4A: A9 F9     LDA #>tbl_F983_meta_tiles_table_02
C - - - - - 0x003F5C 00:BF4C: 85 2F     STA ram_002F
C - - - - - 0x003F5E 00:BF4E: A9 83     LDA #<tbl_F983_meta_tiles_table_02
C - - - - - 0x003F60 00:BF50: 85 2E     STA ram_002E
C - - - - - 0x003F62 00:BF52: 4C 5D BF  JMP loc_BF5D_load_meta_tile

bra_BF55_use_meta_tiles_table_01:
C - - - - - 0x003F65 00:BF55: A9 F6     LDA #>tbl_F623_meta_tiles_table_01
C - - - - - 0x003F67 00:BF57: 85 2F     STA ram_002F
C - - - - - 0x003F69 00:BF59: A9 23     LDA #<tbl_F623_meta_tiles_table_01
C - - - - - 0x003F6B 00:BF5B: 85 2E     STA ram_002E

loc_BF5D_load_meta_tile:
C D 1 - - - 0x003F6D 00:BF5D: A5 0D     LDA ram_000D
C - - - - - 0x003F6F 00:BF5F: 8D 06 20  STA $2006
C - - - - - 0x003F72 00:BF62: A5 0C     LDA ram_000C
C - - - - - 0x003F74 00:BF64: 8D 06 20  STA $2006
C - - - - - 0x003F77 00:BF67: B1 08     LDA (ram_0008),Y
C - - - - - 0x003F79 00:BF69: 84 0E     STY ram_000E
C - - - - - 0x003F7B 00:BF6B: 85 0F     STA ram_000F
C - - - - - 0x003F7D 00:BF6D: 4A        LSR
C - - - - - 0x003F7E 00:BF6E: 4A        LSR
C - - - - - 0x003F7F 00:BF6F: 4A        LSR
C - - - - - 0x003F80 00:BF70: 4A        LSR
C - - - - - 0x003F81 00:BF71: 4A        LSR
C - - - - - 0x003F82 00:BF72: 4A        LSR
C - - - - - 0x003F83 00:BF73: 18        CLC
C - - - - - 0x003F84 00:BF74: 65 2F     ADC ram_002F
C - - - - - 0x003F86 00:BF76: 85 2F     STA ram_002F
C - - - - - 0x003F88 00:BF78: A5 0F     LDA ram_000F
C - - - - - 0x003F8A 00:BF7A: 29 3F     AND #$3F		 ; max index from tilemaps
C - - - - - 0x003F8C 00:BF7C: 0A        ASL
C - - - - - 0x003F8D 00:BF7D: 0A        ASL				 ; index * 4
C - - - - - 0x003F8E 00:BF7E: A8        TAY
C - - - - - 0x003F8F 00:BF7F: B1 2E     LDA (ram_002E),Y ; Load current meta-tile top-left
C - - - - - 0x003F91 00:BF81: 8D 07 20  STA $2007
C - - - - - 0x003F94 00:BF84: C8        INY
C - - - - - 0x003F95 00:BF85: B1 2E     LDA (ram_002E),Y ; Load current meta-tile top-right
C - - - - - 0x003F97 00:BF87: 8D 07 20  STA $2007
C - - - - - 0x003F9A 00:BF8A: C8        INY
C - - - - - 0x003F9B 00:BF8B: A5 0C     LDA ram_000C
C - - - - - 0x003F9D 00:BF8D: 18        CLC
C - - - - - 0x003F9E 00:BF8E: 69 20     ADC #$20		 ; move next row
C - - - - - 0x003FA0 00:BF90: 85 0C     STA ram_000C
C - - - - - 0x003FA2 00:BF92: A5 0D     LDA ram_000D
C - - - - - 0x003FA4 00:BF94: 8D 06 20  STA $2006
C - - - - - 0x003FA7 00:BF97: A5 0C     LDA ram_000C
C - - - - - 0x003FA9 00:BF99: 8D 06 20  STA $2006
C - - - - - 0x003FAC 00:BF9C: B1 2E     LDA (ram_002E),Y ; Load current meta-tile bottom-left
C - - - - - 0x003FAE 00:BF9E: 8D 07 20  STA $2007
C - - - - - 0x003FB1 00:BFA1: C8        INY
C - - - - - 0x003FB2 00:BFA2: B1 2E     LDA (ram_002E),Y ; Load current meta-tile bottom-right
C - - - - - 0x003FB4 00:BFA4: 8D 07 20  STA $2007
C - - - - - 0x003FB7 00:BFA7: A5 0B     LDA ram_000B
C - - - - - 0x003FB9 00:BFA9: 18        CLC
C - - - - - 0x003FBA 00:BFAA: 69 02     ADC #$02		 ; two tiles to the right
C - - - - - 0x003FBC 00:BFAC: 85 0B     STA ram_000B
C - - - - - 0x003FBE 00:BFAE: 85 0C     STA ram_000C
C - - - - - 0x003FC0 00:BFB0: E6 0A     INC ram_000A
C - - - - - 0x003FC2 00:BFB2: A5 0A     LDA ram_000A
C - - - - - 0x003FC4 00:BFB4: C9 10     CMP #$10			; 16 meta-tiles per row
C - - - - - 0x003FC6 00:BFB6: 90 11     BCC bra_BFC9_next_column
C - - - - - 0x003FC8 00:BFB8: A9 00     LDA #$00
C - - - - - 0x003FCA 00:BFBA: 85 0A     STA ram_000A
C - - - - - 0x003FCC 00:BFBC: A5 0B     LDA ram_000B
C - - - - - 0x003FCE 00:BFBE: 18        CLC
C - - - - - 0x003FCF 00:BFBF: 69 20     ADC #$20			; move to next column
C - - - - - 0x003FD1 00:BFC1: 85 0B     STA ram_000B
C - - - - - 0x003FD3 00:BFC3: 85 0C     STA ram_000C
C - - - - - 0x003FD5 00:BFC5: 90 02     BCC bra_BFC9_next_column
C - - - - - 0x003FD7 00:BFC7: E6 0D     INC ram_000D

bra_BFC9_next_column:
C - - - - - 0x003FD9 00:BFC9: A4 0E     LDY ram_000E
C - - - - - 0x003FDB 00:BFCB: C8        INY
C - - - - - 0x003FDC 00:BFCC: C0 F0     CPY #$F0			; total 1 screen 16x15 metatiles
C - - - - - 0x003FDE 00:BFCE: B0 03     BCS bra_BFD3_RTS
C - - - - - 0x003FE0 00:BFD0: 4C 0D BF  JMP loc_BF0D_next_meta_tile

bra_BFD3_RTS:
C - - - - - 0x003FE3 00:BFD3: 60        RTS

sub_BFD4:
C - - - - - 0x003FE4 00:BFD4: A5 14     LDA ram_0014
C - - - - - 0x003FE6 00:BFD6: D0 04     BNE bra_BFDC
C - - - - - 0x003FE8 00:BFD8: A9 23     LDA #$23
C - - - - - 0x003FEA 00:BFDA: D0 02     BNE bra_BFDE

bra_BFDC:
C - - - - - 0x003FEC 00:BFDC: A9 27     LDA #$27

bra_BFDE:
C - - - - - 0x003FEE 00:BFDE: 8D 06 20  STA $2006
C - - - - - 0x003FF1 00:BFE1: A9 C0     LDA #$C0
C - - - - - 0x003FF3 00:BFE3: 8D 06 20  STA $2006
C - - - - - 0x003FF6 00:BFE6: A0 00     LDY #$00

bra_BFE8:
C - - - - - 0x003FF8 00:BFE8: B1 10     LDA (ram_0010),Y
C - - - - - 0x003FFA 00:BFEA: 8D 07 20  STA $2007
C - - - - - 0x003FFD 00:BFED: C8        INY
C - - - - - 0x003FFE 00:BFEE: C0 40     CPY #$40
C - - - - - 0x004000 00:BFF0: D0 F6     BNE bra_BFE8
C - - - - - 0x004002 00:BFF2: 60        RTS

bra_BFF3:
- - - - - - 0x004003 00:BFF3: A5 14     LDA ram_0014
- - - - - - 0x004005 00:BFF5: D0 04     BNE bra_BFFB

sub_BFF7:
C - - - - - 0x004007 00:BFF7: A9 20     LDA #$20
C - - - - - 0x004009 00:BFF9: D0 02     BNE bra_BFFD

bra_BFFB:
- - - - - - 0x00400B 00:BFFB: A9 24     LDA #$24

bra_BFFD:
C - - - - - 0x00400D 00:BFFD: 8D 06 20  STA $2006
C - - - - - 0x004010 01:C000: A9 00     LDA #$00
C - - - - - 0x004012 01:C002: 8D 06 20  STA $2006
C - - - - - 0x004015 01:C005: A0 00     LDY #$00
C - - - - - 0x004017 01:C007: A2 03     LDX #$03
C - - - - - 0x004019 01:C009: A9 FF     LDA #$FF

bra_C00B:
C - - - - - 0x00401B 01:C00B: 8D 07 20  STA $2007
C - - - - - 0x00401E 01:C00E: C8        INY
C - - - - - 0x00401F 01:C00F: D0 FA     BNE bra_C00B
C - - - - - 0x004021 01:C011: CA        DEX
C - - - - - 0x004022 01:C012: 10 F7     BPL bra_C00B
C - - - - - 0x004024 01:C014: 60        RTS

sub_C015:
C - - - - - 0x004025 01:C015: AE 3B 06  LDX ram_063B
C - - - - - 0x004028 01:C018: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x00402B 01:C01B: 0A        ASL
C - - - - - 0x00402C 01:C01C: AA        TAX
C - - - - - 0x00402D 01:C01D: 85 59     STA ram_0059
C - - - - - 0x00402F 01:C01F: BD 37 8D  LDA tbl_8D37_sprites_initial_position_table,X
C - - - - - 0x004032 01:C022: 85 49     STA ram_0049
C - - - - - 0x004034 01:C024: BD 38 8D  LDA tbl_8D37_sprites_initial_position_table+1,X
C - - - - - 0x004037 01:C027: 85 4A     STA ram_004A
C - - - - - 0x004039 01:C029: A5 03     LDA ram_0003
C - - - - - 0x00403B 01:C02B: 0A        ASL
C - - - - - 0x00403C 01:C02C: 85 93     STA ram_0093
C - - - - - 0x00403E 01:C02E: A8        TAY
C - - - - - 0x00403F 01:C02F: B1 49     LDA (ram_0049),Y
C - - - - - 0x004041 01:C031: 85 94     STA ram_0094
C - - - - - 0x004043 01:C033: C8        INY
C - - - - - 0x004044 01:C034: B1 49     LDA (ram_0049),Y
C - - - - - 0x004046 01:C036: 85 95     STA ram_0095
C - - - - - 0x004048 01:C038: A9 00     LDA #$00
C - - - - - 0x00404A 01:C03A: 85 9B     STA ram_009B
C - - - - - 0x00404C 01:C03C: A8        TAY
C - - - - - 0x00404D 01:C03D: B1 94     LDA (ram_0094),Y

bra_C03F:
C - - - - - 0x00404F 01:C03F: 85 24     STA ram_0024
C - - - - - 0x004051 01:C041: C8        INY
C - - - - - 0x004052 01:C042: B1 94     LDA (ram_0094),Y
C - - - - - 0x004054 01:C044: 85 4C     STA ram_004C
C - - - - - 0x004056 01:C046: C8        INY
C - - - - - 0x004057 01:C047: B1 94     LDA (ram_0094),Y
C - - - - - 0x004059 01:C049: 85 4E     STA ram_004E
C - - - - - 0x00405B 01:C04B: C8        INY
C - - - - - 0x00405C 01:C04C: B1 94     LDA (ram_0094),Y
C - - - - - 0x00405E 01:C04E: 85 4D     STA ram_004D
C - - - - - 0x004060 01:C050: 98        TYA
C - - - - - 0x004061 01:C051: 85 4B     STA ram_004B
C - - - - - 0x004063 01:C053: A5 59     LDA ram_0059
C - - - - - 0x004065 01:C055: AA        TAX
C - - - - - 0x004066 01:C056: BD F5 92  LDA tbl_92F5_sprites_table,X
C - - - - - 0x004069 01:C059: 85 43     STA ram_0043
C - - - - - 0x00406B 01:C05B: BD F6 92  LDA tbl_92F5_sprites_table+1,X
C - - - - - 0x00406E 01:C05E: 85 44     STA ram_0044
C - - - - - 0x004070 01:C060: A5 93     LDA ram_0093
C - - - - - 0x004072 01:C062: A8        TAY
C - - - - - 0x004073 01:C063: B1 43     LDA (ram_0043),Y
C - - - - - 0x004075 01:C065: 85 9C     STA ram_009C
C - - - - - 0x004077 01:C067: C8        INY
C - - - - - 0x004078 01:C068: B1 43     LDA (ram_0043),Y
C - - - - - 0x00407A 01:C06A: 85 9D     STA ram_009D
C - - - - - 0x00407C 01:C06C: A4 9B     LDY ram_009B
C - - - - - 0x00407E 01:C06E: B1 9C     LDA (ram_009C),Y
C - - - - - 0x004080 01:C070: 85 45     STA ram_0045
C - - - - - 0x004082 01:C072: C8        INY
C - - - - - 0x004083 01:C073: B1 9C     LDA (ram_009C),Y
C - - - - - 0x004085 01:C075: 85 46     STA ram_0046
C - - - - - 0x004087 01:C077: 20 CE C0  JSR sub_C0CE
C - - - - - 0x00408A 01:C07A: E6 9B     INC ram_009B
C - - - - - 0x00408C 01:C07C: E6 9B     INC ram_009B
C - - - - - 0x00408E 01:C07E: A5 4B     LDA ram_004B
C - - - - - 0x004090 01:C080: A8        TAY
C - - - - - 0x004091 01:C081: C8        INY
C - - - - - 0x004092 01:C082: B1 94     LDA (ram_0094),Y
C - - - - - 0x004094 01:C084: C9 FF     CMP #$FF
C - - - - - 0x004096 01:C086: D0 B7     BNE bra_C03F
C - - - - - 0x004098 01:C088: AD 00 02  LDA ram_0200
C - - - - - 0x00409B 01:C08B: 85 2D     STA con_player_position_y
C - - - - - 0x00409D 01:C08D: AD 03 02  LDA ram_0203
C - - - - - 0x0040A0 01:C090: 85 2C     STA con_player_position_x
C - - - - - 0x0040A2 01:C092: A5 18     LDA ram_0018
C - - - - - 0x0040A4 01:C094: 0D 20 03  ORA ram_0320
C - - - - - 0x0040A7 01:C097: 0D 2F 03  ORA ram_032F
C - - - - - 0x0040AA 01:C09A: D0 2A     BNE bra_C0C6_RTS
C - - - - - 0x0040AC 01:C09C: AD 10 02  LDA ram_0210
C - - - - - 0x0040AF 01:C09F: 85 64     STA ram_0064
C - - - - - 0x0040B1 01:C0A1: AD 13 02  LDA ram_0213
C - - - - - 0x0040B4 01:C0A4: 85 60     STA ram_0060
C - - - - - 0x0040B6 01:C0A6: AD 20 02  LDA ram_0220
C - - - - - 0x0040B9 01:C0A9: 85 65     STA ram_0065
C - - - - - 0x0040BB 01:C0AB: AD 23 02  LDA ram_0223
C - - - - - 0x0040BE 01:C0AE: 85 61     STA ram_0061
C - - - - - 0x0040C0 01:C0B0: AD 30 02  LDA ram_0230
C - - - - - 0x0040C3 01:C0B3: 85 66     STA ram_0066
C - - - - - 0x0040C5 01:C0B5: AD 33 02  LDA ram_0233
C - - - - - 0x0040C8 01:C0B8: 85 62     STA ram_0062
C - - - - - 0x0040CA 01:C0BA: A9 01     LDA #$01
C - - - - - 0x0040CC 01:C0BC: 85 5C     STA ram_005C
C - - - - - 0x0040CE 01:C0BE: A9 02     LDA #$02
C - - - - - 0x0040D0 01:C0C0: 85 5D     STA ram_005D
C - - - - - 0x0040D2 01:C0C2: A9 03     LDA #$03
C - - - - - 0x0040D4 01:C0C4: 85 5E     STA ram_005E

bra_C0C6_RTS:
C - - - - - 0x0040D6 01:C0C6: 60        RTS

sub_C0C7:
C - - - - - 0x0040D7 01:C0C7: A5 2B     LDA ram_002B
C - - - - - 0x0040D9 01:C0C9: D0 03     BNE bra_C0CE
- - - - - - 0x0040DB 01:C0CB: 4C 51 C1  JMP loc_C151

bra_C0CE:
sub_C0CE:
C - - - - - 0x0040DE 01:C0CE: A5 4E     LDA ram_004E
C - - - - - 0x0040E0 01:C0D0: 85 1E     STA ram_001E
C - - - - - 0x0040E2 01:C0D2: A5 4D     LDA ram_004D
C - - - - - 0x0040E4 01:C0D4: 85 1F     STA ram_001F
C - - - - - 0x0040E6 01:C0D6: 85 20     STA ram_0020
C - - - - - 0x0040E8 01:C0D8: A0 00     LDY #$00
C - - - - - 0x0040EA 01:C0DA: B1 45     LDA (ram_0045),Y ; load sprite horizontal size (rows)
C - - - - - 0x0040EC 01:C0DC: 85 21     STA ram_0021
C - - - - - 0x0040EE 01:C0DE: C8        INY
C - - - - - 0x0040EF 01:C0DF: B1 45     LDA (ram_0045),Y ; load sprite vertical size (columns)
C - - - - - 0x0040F1 01:C0E1: 85 22     STA ram_0022
C - - - - - 0x0040F3 01:C0E3: 85 23     STA ram_0023
C - - - - - 0x0040F5 01:C0E5: C8        INY
C - - - - - 0x0040F6 01:C0E6: A5 4C     LDA ram_004C
C - - - - - 0x0040F8 01:C0E8: F0 0A     BEQ bra_C0F4	 ; it's only 2x2 sprite
C - - - - - 0x0040FA 01:C0EA: B1 45     LDA (ram_0045),Y ; ????
C - - - - - 0x0040FC 01:C0EC: 09 40     ORA #$40
C - - - - - 0x0040FE 01:C0EE: 85 25     STA ram_0025
C - - - - - 0x004100 01:C0F0: 84 47     STY ram_0047
C - - - - - 0x004102 01:C0F2: D0 07     BNE bra_C0FB

bra_C0F4:
C - - - - - 0x004104 01:C0F4: B1 45     LDA (ram_0045),Y ; load sprite palette index
C - - - - - 0x004106 01:C0F6: 85 25     STA ram_0025
C - - - - - 0x004108 01:C0F8: 88        DEY
C - - - - - 0x004109 01:C0F9: 84 47     STY ram_0047

bra_C0FB:
C - - - - - 0x00410B 01:C0FB: A5 47     LDA ram_0047
C - - - - - 0x00410D 01:C0FD: A8        TAY
C - - - - - 0x00410E 01:C0FE: A5 24     LDA ram_0024
C - - - - - 0x004110 01:C100: 0A        ASL
C - - - - - 0x004111 01:C101: 0A        ASL
C - - - - - 0x004112 01:C102: AA        TAX

loc_C103:
C D 2 - - - 0x004113 01:C103: A5 1F     LDA ram_001F
C - - - - - 0x004115 01:C105: 9D 00 02  STA ram_0200,X
C - - - - - 0x004118 01:C108: C8        INY
C - - - - - 0x004119 01:C109: C8        INY
C - - - - - 0x00411A 01:C10A: B1 45     LDA (ram_0045),Y
C - - - - - 0x00411C 01:C10C: 9D 01 02  STA ram_0201,X
C - - - - - 0x00411F 01:C10F: A5 25     LDA ram_0025
C - - - - - 0x004121 01:C111: 9D 02 02  STA ram_0202,X
C - - - - - 0x004124 01:C114: A5 1E     LDA ram_001E
C - - - - - 0x004126 01:C116: 9D 03 02  STA ram_0203,X
C - - - - - 0x004129 01:C119: E8        INX
C - - - - - 0x00412A 01:C11A: E8        INX
C - - - - - 0x00412B 01:C11B: E8        INX
C - - - - - 0x00412C 01:C11C: E8        INX
C - - - - - 0x00412D 01:C11D: C6 22     DEC ram_0022
C - - - - - 0x00412F 01:C11F: F0 0A     BEQ bra_C12B
C - - - - - 0x004131 01:C121: A5 1F     LDA ram_001F
C - - - - - 0x004133 01:C123: 18        CLC
C - - - - - 0x004134 01:C124: 69 08     ADC #$08
C - - - - - 0x004136 01:C126: 85 1F     STA ram_001F
C - - - - - 0x004138 01:C128: 4C 03 C1  JMP loc_C103

bra_C12B:
C - - - - - 0x00413B 01:C12B: C6 21     DEC ram_0021
C - - - - - 0x00413D 01:C12D: F0 22     BEQ bra_C151
C - - - - - 0x00413F 01:C12F: A5 4C     LDA ram_004C
C - - - - - 0x004141 01:C131: F0 07     BEQ bra_C13A
C - - - - - 0x004143 01:C133: C6 47     DEC ram_0047
C - - - - - 0x004145 01:C135: A5 47     LDA ram_0047
C - - - - - 0x004147 01:C137: A8        TAY
C - - - - - 0x004148 01:C138: D0 05     BNE bra_C13F

bra_C13A:
C - - - - - 0x00414A 01:C13A: E6 47     INC ram_0047
C - - - - - 0x00414C 01:C13C: A5 47     LDA ram_0047
C - - - - - 0x00414E 01:C13E: A8        TAY

bra_C13F:
C - - - - - 0x00414F 01:C13F: A5 20     LDA ram_0020
C - - - - - 0x004151 01:C141: 85 1F     STA ram_001F
C - - - - - 0x004153 01:C143: A5 23     LDA ram_0023
C - - - - - 0x004155 01:C145: 85 22     STA ram_0022
C - - - - - 0x004157 01:C147: A5 1E     LDA ram_001E
C - - - - - 0x004159 01:C149: 18        CLC
C - - - - - 0x00415A 01:C14A: 69 08     ADC #$08
C - - - - - 0x00415C 01:C14C: 85 1E     STA ram_001E
C - - - - - 0x00415E 01:C14E: 4C 03 C1  JMP loc_C103

bra_C151:
loc_C151:
C - - - - - 0x004161 01:C151: A9 00     LDA #$00
C - - - - - 0x004163 01:C153: 85 2B     STA ram_002B
C - - - - - 0x004165 01:C155: 60        RTS

sub_C156:
C - - - - - 0x004166 01:C156: A5 54     LDA ram_0054
C - - - - - 0x004168 01:C158: F0 14     BEQ bra_C16E_RTS
C - - - - - 0x00416A 01:C15A: A5 51     LDA ram_0051
C - - - - - 0x00416C 01:C15C: 0A        ASL
C - - - - - 0x00416D 01:C15D: A8        TAY
C - - - - - 0x00416E 01:C15E: B1 52     LDA (ram_0052),Y
C - - - - - 0x004170 01:C160: 85 45     STA ram_0045
C - - - - - 0x004172 01:C162: C8        INY
C - - - - - 0x004173 01:C163: B1 52     LDA (ram_0052),Y
C - - - - - 0x004175 01:C165: 85 46     STA ram_0046
C - - - - - 0x004177 01:C167: A9 00     LDA #$00
C - - - - - 0x004179 01:C169: 85 54     STA ram_0054
C - - - - - 0x00417B 01:C16B: 20 CE C0  JSR sub_C0CE

bra_C16E_RTS:
C - - - - - 0x00417E 01:C16E: 60        RTS

sub_C16F:
C - - - - - 0x00417F 01:C16F: A9 01     LDA #$01
C - - - - - 0x004181 01:C171: 85 54     STA ram_0054
C - - - - - 0x004183 01:C173: A5 2C     LDA con_player_position_x
C - - - - - 0x004185 01:C175: 85 4E     STA ram_004E
C - - - - - 0x004187 01:C177: A5 2D     LDA con_player_position_y
C - - - - - 0x004189 01:C179: 85 4D     STA ram_004D
C - - - - - 0x00418B 01:C17B: A9 00     LDA #$00
C - - - - - 0x00418D 01:C17D: 85 24     STA ram_0024
C - - - - - 0x00418F 01:C17F: A5 1C     LDA ram_001C
C - - - - - 0x004191 01:C181: 29 01     AND #$01
C - - - - - 0x004193 01:C183: F0 21     BEQ bra_C1A6
C - - - - - 0x004195 01:C185: A9 E5     LDA #$E5
C - - - - - 0x004197 01:C187: 85 52     STA ram_0052
C - - - - - 0x004199 01:C189: A9 93     LDA #$93
C - - - - - 0x00419B 01:C18B: 85 53     STA ram_0053
C - - - - - 0x00419D 01:C18D: A9 00     LDA #$00
C - - - - - 0x00419F 01:C18F: 85 4C     STA ram_004C
C - - - - - 0x0041A1 01:C191: A5 56     LDA con_player_is_facing_right
C - - - - - 0x0041A3 01:C193: D0 38     BNE bra_C1CD
C - - - - - 0x0041A5 01:C195: A9 01     LDA #$01
C - - - - - 0x0041A7 01:C197: 85 56     STA con_player_is_facing_right
C - - - - - 0x0041A9 01:C199: A9 00     LDA #$00
C - - - - - 0x0041AB 01:C19B: 85 55     STA con_player_is_facing_left
C - - - - - 0x0041AD 01:C19D: 85 57     STA con_player_is_facing_up
C - - - - - 0x0041AF 01:C19F: 85 58     STA con_player_is_facing_down
C - - - - - 0x0041B1 01:C1A1: 85 51     STA ram_0051
C - - - - - 0x0041B3 01:C1A3: 85 50     STA ram_0050
C - - - - - 0x0041B5 01:C1A5: 60        RTS

bra_C1A6:
C - - - - - 0x0041B6 01:C1A6: A5 1C     LDA ram_001C
C - - - - - 0x0041B8 01:C1A8: 29 02     AND #$02
C - - - - - 0x0041BA 01:C1AA: F0 4A     BEQ bra_C1F6
C - - - - - 0x0041BC 01:C1AC: A9 E5     LDA #$E5
C - - - - - 0x0041BE 01:C1AE: 85 52     STA ram_0052
C - - - - - 0x0041C0 01:C1B0: A9 93     LDA #$93
C - - - - - 0x0041C2 01:C1B2: 85 53     STA ram_0053
C - - - - - 0x0041C4 01:C1B4: A9 01     LDA #$01
C - - - - - 0x0041C6 01:C1B6: 85 4C     STA ram_004C
C - - - - - 0x0041C8 01:C1B8: A5 55     LDA con_player_is_facing_left
C - - - - - 0x0041CA 01:C1BA: D0 11     BNE bra_C1CD
C - - - - - 0x0041CC 01:C1BC: A9 01     LDA #$01
C - - - - - 0x0041CE 01:C1BE: 85 55     STA con_player_is_facing_left
C - - - - - 0x0041D0 01:C1C0: A9 00     LDA #$00
C - - - - - 0x0041D2 01:C1C2: 85 56     STA con_player_is_facing_right
C - - - - - 0x0041D4 01:C1C4: 85 57     STA con_player_is_facing_up
C - - - - - 0x0041D6 01:C1C6: 85 58     STA con_player_is_facing_down
C - - - - - 0x0041D8 01:C1C8: 85 51     STA ram_0051
C - - - - - 0x0041DA 01:C1CA: 85 50     STA ram_0050

bra_C1CC_RTS:
C - - - - - 0x0041DC 01:C1CC: 60        RTS

bra_C1CD:
C - - - - - 0x0041DD 01:C1CD: A5 50     LDA ram_0050
C - - - - - 0x0041DF 01:C1CF: C9 05     CMP #$05
C - - - - - 0x0041E1 01:C1D1: D0 06     BNE bra_C1D9
C - - - - - 0x0041E3 01:C1D3: A9 01     LDA #$01
C - - - - - 0x0041E5 01:C1D5: 85 51     STA ram_0051
C - - - - - 0x0041E7 01:C1D7: D0 F3     BNE bra_C1CC_RTS

bra_C1D9:
C - - - - - 0x0041E9 01:C1D9: C9 0A     CMP #$0A
C - - - - - 0x0041EB 01:C1DB: D0 06     BNE bra_C1E3
C - - - - - 0x0041ED 01:C1DD: A9 02     LDA #$02
C - - - - - 0x0041EF 01:C1DF: 85 51     STA ram_0051
C - - - - - 0x0041F1 01:C1E1: D0 E9     BNE bra_C1CC_RTS

bra_C1E3:
C - - - - - 0x0041F3 01:C1E3: C9 0F     CMP #$0F
C - - - - - 0x0041F5 01:C1E5: D0 06     BNE bra_C1ED
C - - - - - 0x0041F7 01:C1E7: A9 01     LDA #$01
C - - - - - 0x0041F9 01:C1E9: 85 51     STA ram_0051
C - - - - - 0x0041FB 01:C1EB: D0 DF     BNE bra_C1CC_RTS

bra_C1ED:
C - - - - - 0x0041FD 01:C1ED: C9 15     CMP #$15
C - - - - - 0x0041FF 01:C1EF: D0 04     BNE bra_C1F5_RTS
C - - - - - 0x004201 01:C1F1: A9 02     LDA #$02
C - - - - - 0x004203 01:C1F3: 85 51     STA ram_0051

bra_C1F5_RTS:
C - - - - - 0x004205 01:C1F5: 60        RTS

bra_C1F6:
C - - - - - 0x004206 01:C1F6: A5 1C     LDA ram_001C
C - - - - - 0x004208 01:C1F8: 29 08     AND #$08
C - - - - - 0x00420A 01:C1FA: F0 21     BEQ bra_C21D
C - - - - - 0x00420C 01:C1FC: A9 EB     LDA #$EB
C - - - - - 0x00420E 01:C1FE: 85 52     STA ram_0052
C - - - - - 0x004210 01:C200: A9 93     LDA #$93
C - - - - - 0x004212 01:C202: 85 53     STA ram_0053
C - - - - - 0x004214 01:C204: A9 00     LDA #$00
C - - - - - 0x004216 01:C206: 85 4C     STA ram_004C
C - - - - - 0x004218 01:C208: A5 57     LDA con_player_is_facing_up
C - - - - - 0x00421A 01:C20A: D0 C1     BNE bra_C1CD
C - - - - - 0x00421C 01:C20C: A9 01     LDA #$01
C - - - - - 0x00421E 01:C20E: 85 57     STA con_player_is_facing_up
C - - - - - 0x004220 01:C210: A9 00     LDA #$00
C - - - - - 0x004222 01:C212: 85 58     STA con_player_is_facing_down
C - - - - - 0x004224 01:C214: 85 56     STA con_player_is_facing_right
C - - - - - 0x004226 01:C216: 85 55     STA con_player_is_facing_left
C - - - - - 0x004228 01:C218: 85 51     STA ram_0051
C - - - - - 0x00422A 01:C21A: 85 50     STA ram_0050
C - - - - - 0x00422C 01:C21C: 60        RTS

bra_C21D:
C - - - - - 0x00422D 01:C21D: A5 1C     LDA ram_001C
C - - - - - 0x00422F 01:C21F: 29 04     AND #$04
C - - - - - 0x004231 01:C221: F0 21     BEQ bra_C244
C - - - - - 0x004233 01:C223: A9 F1     LDA #$F1
C - - - - - 0x004235 01:C225: 85 52     STA ram_0052
C - - - - - 0x004237 01:C227: A9 93     LDA #$93
C - - - - - 0x004239 01:C229: 85 53     STA ram_0053
C - - - - - 0x00423B 01:C22B: A9 00     LDA #$00
C - - - - - 0x00423D 01:C22D: 85 4C     STA ram_004C
C - - - - - 0x00423F 01:C22F: A5 58     LDA con_player_is_facing_down
C - - - - - 0x004241 01:C231: D0 9A     BNE bra_C1CD
C - - - - - 0x004243 01:C233: A9 01     LDA #$01
C - - - - - 0x004245 01:C235: 85 58     STA con_player_is_facing_down
C - - - - - 0x004247 01:C237: A9 00     LDA #$00
C - - - - - 0x004249 01:C239: 85 57     STA con_player_is_facing_up
C - - - - - 0x00424B 01:C23B: 85 56     STA con_player_is_facing_right
C - - - - - 0x00424D 01:C23D: 85 55     STA con_player_is_facing_left
C - - - - - 0x00424F 01:C23F: 85 51     STA ram_0051
C - - - - - 0x004251 01:C241: 85 50     STA ram_0050
C - - - - - 0x004253 01:C243: 60        RTS

bra_C244:
C - - - - - 0x004254 01:C244: A5 55     LDA con_player_is_facing_left
C - - - - - 0x004256 01:C246: D0 08     BNE bra_C250
C - - - - - 0x004258 01:C248: A5 56     LDA con_player_is_facing_right
C - - - - - 0x00425A 01:C24A: F0 15     BEQ bra_C261
C - - - - - 0x00425C 01:C24C: A9 00     LDA #$00
C - - - - - 0x00425E 01:C24E: F0 02     BEQ bra_C252

bra_C250:
C - - - - - 0x004260 01:C250: A9 01     LDA #$01

bra_C252:
C - - - - - 0x004262 01:C252: 85 4C     STA ram_004C
C - - - - - 0x004264 01:C254: A9 E5     LDA #$E5
C - - - - - 0x004266 01:C256: 85 52     STA ram_0052
C - - - - - 0x004268 01:C258: A9 93     LDA #$93
C - - - - - 0x00426A 01:C25A: 85 53     STA ram_0053

bra_C25C:
C - - - - - 0x00426C 01:C25C: A9 00     LDA #$00
C - - - - - 0x00426E 01:C25E: 85 51     STA ram_0051
C - - - - - 0x004270 01:C260: 60        RTS

bra_C261:
C - - - - - 0x004271 01:C261: A9 00     LDA #$00
C - - - - - 0x004273 01:C263: 85 4C     STA ram_004C
C - - - - - 0x004275 01:C265: A5 57     LDA con_player_is_facing_up
C - - - - - 0x004277 01:C267: D0 0A     BNE bra_C273
C - - - - - 0x004279 01:C269: A9 F1     LDA #$F1
C - - - - - 0x00427B 01:C26B: 85 52     STA ram_0052
C - - - - - 0x00427D 01:C26D: A9 93     LDA #$93
C - - - - - 0x00427F 01:C26F: 85 53     STA ram_0053
C - - - - - 0x004281 01:C271: D0 E9     BNE bra_C25C

bra_C273:
C - - - - - 0x004283 01:C273: A9 EB     LDA #$EB
C - - - - - 0x004285 01:C275: 85 52     STA ram_0052
C - - - - - 0x004287 01:C277: A9 93     LDA #$93
C - - - - - 0x004289 01:C279: 85 53     STA ram_0053
C - - - - - 0x00428B 01:C27B: D0 DF     BNE bra_C25C

tbl_C27D_sprite_granma_idle_state:
@start:
- D 2 - - - 0x00428D 01:C27D: B0        .byte $B0,$FF,$41,$C0,$B0,$6C,$41,$C8,$B0,$6E,$41,$D0,$B0,$FF,$41,$D8
- D 2 - - - 0x00429D 01:C28D: B8        .byte $B8,$FF,$41,$C0,$B8,$A7,$41,$C8,$B8,$EB,$41,$D0,$B8,$FF,$41,$D8
- D 2 - - - 0x0042AD 01:C29D: C0        .byte $C0,$FF,$41,$C0,$C0,$ED,$41,$C8,$C0,$EC,$41,$D0,$C0,$EF,$41,$D8
- D 2 - - - 0x0042BD 01:C2AD: C8        .byte $C8,$FF,$41,$C0,$C8,$F1,$41,$C8,$C8,$F0,$41,$D0,$C8,$EE,$41,$D8
@end:
var_C27D = @end - @start

sub_C2BD:
C - - - - - 0x0042CD 01:C2BD: A2 00     LDX #$00

bra_C2BF:
C - - - - - 0x0042CF 01:C2BF: BD 7D C2  LDA tbl_C27D_sprite_granma_idle_state,X
C - - - - - 0x0042D2 01:C2C2: 9D 10 02  STA ram_0210,X
C - - - - - 0x0042D5 01:C2C5: E8        INX
C - - - - - 0x0042D6 01:C2C6: E0 40     CPX #var_C27D
C - - - - - 0x0042D8 01:C2C8: 90 F5     BCC bra_C2BF
C - - - - - 0x0042DA 01:C2CA: 60        RTS

sub_C2CB:
C - - - - - 0x0042DB 01:C2CB: E6 50     INC ram_0050
C - - - - - 0x0042DD 01:C2CD: A5 50     LDA ram_0050
C - - - - - 0x0042DF 01:C2CF: C9 16     CMP #$16
C - - - - - 0x0042E1 01:C2D1: D0 04     BNE bra_C2D7_RTS
C - - - - - 0x0042E3 01:C2D3: A9 00     LDA #$00
C - - - - - 0x0042E5 01:C2D5: 85 50     STA ram_0050

bra_C2D7_RTS:
C - - - - - 0x0042E7 01:C2D7: 60        RTS

sub_C2D8:
C - - - - - 0x0042E8 01:C2D8: AD 38 06  LDA ram_0638
C - - - - - 0x0042EB 01:C2DB: F0 32     BEQ bra_C30F_RTS
C - - - - - 0x0042ED 01:C2DD: AD 42 06  LDA ram_0642
C - - - - - 0x0042F0 01:C2E0: F0 2D     BEQ bra_C30F_RTS
C - - - - - 0x0042F2 01:C2E2: AD 3B 06  LDA ram_063B
C - - - - - 0x0042F5 01:C2E5: D0 0A     BNE bra_C2F1
C - - - - - 0x0042F7 01:C2E7: A9 CE     LDA #>tbl_CE92
C - - - - - 0x0042F9 01:C2E9: 85 07     STA ram_0007
C - - - - - 0x0042FB 01:C2EB: A9 92     LDA #<tbl_CE92
C - - - - - 0x0042FD 01:C2ED: 85 06     STA ram_0006
C - - - - - 0x0042FF 01:C2EF: D0 08     BNE bra_C2F9

bra_C2F1:
C - - - - - 0x004301 01:C2F1: A9 CE     LDA #>tbl_CEA2
C - - - - - 0x004303 01:C2F3: 85 07     STA ram_0007
C - - - - - 0x004305 01:C2F5: A9 A2     LDA #<tbl_CEA2
C - - - - - 0x004307 01:C2F7: 85 06     STA ram_0006

bra_C2F9:
C - - - - - 0x004309 01:C2F9: A0 00     LDY #$00
C - - - - - 0x00430B 01:C2FB: A2 3F     LDX #$3F
C - - - - - 0x00430D 01:C2FD: A9 10     LDA #$10
C - - - - - 0x00430F 01:C2FF: 8E 06 20  STX $2006
C - - - - - 0x004312 01:C302: 8D 06 20  STA $2006

bra_C305:
C - - - - - 0x004315 01:C305: B1 06     LDA (ram_0006),Y
C - - - - - 0x004317 01:C307: 8D 07 20  STA $2007
C - - - - - 0x00431A 01:C30A: C8        INY
C - - - - - 0x00431B 01:C30B: C0 10     CPY #$10
C - - - - - 0x00431D 01:C30D: D0 F6     BNE bra_C305

bra_C30F_RTS:
C - - - - - 0x00431F 01:C30F: 60        RTS

tbl_C310_sound_fx_table:
- D 2 - - - 0x004320 01:C310: 79        .byte $79,$BA,$6F,$20 ; item collect, use baloon, enter sub world
- D 2 - - - 0x004324 01:C314: B9        .byte $B9,$BB,$54,$C8 ; player hit
- D 2 - - - 0x004328 01:C318: 79        .byte $79,$8C,$38,$58 ; jump, use slingshot
- D 2 - - - 0x00432C 01:C31C: 7A        .byte $7A,$93,$51,$48 ; player death animation
- D 2 - - - 0x004330 01:C320: 7A        .byte $7A,$A9,$3D,$68 ; item drop by kick rock
- D 2 - - - 0x004334 01:C324: 79        .byte $79,$A2,$B0,$B8 ; invencible potion sound
- D 2 - - - 0x004338 01:C328: 7A        .byte $7A,$A9,$74,$58 ; shop select item, buy item
- D 2 - - - 0x00433C 01:C32C: 1F        .byte $1F,$91,$5C,$79 ; fruit drop

tbl_C330_music_channels_table:
- D 2 - - - 0x004340 01:C330: 77        .byte $77	; pulse channel low
- D 2 - - - 0x004341 01:C331: C5        .byte $C5	; pulse channel high
- D 2 - - - 0x004342 01:C332: 84        .byte $84	; noise channel low
- D 2 - - - 0x004343 01:C333: C6        .byte $C6	; noise channel high

sub_C334:
C - - - - - 0x004344 01:C334: AD 71 C5  LDA tbl_C571_music_header
C - - - - - 0x004347 01:C337: 8D 80 06  STA ram_0680	; tempo
C - - - - - 0x00434A 01:C33A: 8D 81 06  STA ram_0681	; tempo
C - - - - - 0x00434D 01:C33D: A9 00     LDA #$00
C - - - - - 0x00434F 01:C33F: 8D 88 06  STA ram_0688
C - - - - - 0x004352 01:C342: 8D 89 06  STA ram_0689
C - - - - - 0x004355 01:C345: 8D 83 06  STA ram_0683
C - - - - - 0x004358 01:C348: 8D 84 06  STA ram_0684
C - - - - - 0x00435B 01:C34B: 8D 85 06  STA ram_0685
C - - - - - 0x00435E 01:C34E: 8D 86 06  STA ram_0686
C - - - - - 0x004361 01:C351: 8D A0 06  STA ram_06A0
C - - - - - 0x004364 01:C354: 8D 3F 03  STA ram_033F
C - - - - - 0x004367 01:C357: AD 72 C5  LDA tbl_C571_music_header+1
C - - - - - 0x00436A 01:C35A: 8D 82 06  STA ram_0682
C - - - - - 0x00436D 01:C35D: 8D 15 40  STA $4015
C - - - - - 0x004370 01:C360: AD 73 C5  LDA tbl_C571_music_header+2
C - - - - - 0x004373 01:C363: 8D 8B 06  STA ram_068B
C - - - - - 0x004376 01:C366: AD 74 C5  LDA tbl_C571_music_header+3
C - - - - - 0x004379 01:C369: 8D 8C 06  STA ram_068C
C - - - - - 0x00437C 01:C36C: AD 75 C5  LDA tbl_C571_music_header+4
C - - - - - 0x00437F 01:C36F: 8D 8D 06  STA ram_068D
C - - - - - 0x004382 01:C372: AD 76 C5  LDA tbl_C571_music_header+5
C - - - - - 0x004385 01:C375: 8D 8E 06  STA ram_068E
C - - - - - 0x004388 01:C378: 60        RTS

sub_C379:
C - - - - - 0x004389 01:C379: A9 01     LDA #$01
C - - - - - 0x00438B 01:C37B: 2D A1 06  AND ram_06A1
C - - - - - 0x00438E 01:C37E: F0 1B     BEQ bra_C39B_RTS
C - - - - - 0x004390 01:C380: 0D 82 06  ORA ram_0682
C - - - - - 0x004393 01:C383: 8D 15 40  STA $4015
C - - - - - 0x004396 01:C386: A2 00     LDX #$00

bra_C388:
C - - - - - 0x004398 01:C388: BD 91 06  LDA ram_0691,X
C - - - - - 0x00439B 01:C38B: 9D 00 40  STA $4000,X
C - - - - - 0x00439E 01:C38E: E8        INX
C - - - - - 0x00439F 01:C38F: E0 04     CPX #$04
C - - - - - 0x0043A1 01:C391: D0 F5     BNE bra_C388
C - - - - - 0x0043A3 01:C393: A9 FE     LDA #$FE
C - - - - - 0x0043A5 01:C395: 2D A1 06  AND ram_06A1
C - - - - - 0x0043A8 01:C398: 8D A1 06  STA ram_06A1

bra_C39B_RTS:
C - - - - - 0x0043AB 01:C39B: 60        RTS

sub_C39C:
C - - - - - 0x0043AC 01:C39C: 20 36 C5  JSR sub_C536
C - - - - - 0x0043AF 01:C39F: 20 8C C4  JSR sub_C48C
C - - - - - 0x0043B2 01:C3A2: 20 E8 C3  JSR sub_C3E8
C - - - - - 0x0043B5 01:C3A5: CE 81 06  DEC ram_0681
C - - - - - 0x0043B8 01:C3A8: D0 12     BNE bra_C3BC_RTS
C - - - - - 0x0043BA 01:C3AA: CE 83 06  DEC ram_0683
C - - - - - 0x0043BD 01:C3AD: CE 84 06  DEC ram_0684
C - - - - - 0x0043C0 01:C3B0: CE 85 06  DEC ram_0685
C - - - - - 0x0043C3 01:C3B3: CE 86 06  DEC ram_0686
C - - - - - 0x0043C6 01:C3B6: AD 80 06  LDA ram_0680
C - - - - - 0x0043C9 01:C3B9: 8D 81 06  STA ram_0681

bra_C3BC_RTS:
C - - - - - 0x0043CC 01:C3BC: 60        RTS

bra_C3BD:
C - - - - - 0x0043CD 01:C3BD: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x0043CF 01:C3BF: 29 20     AND #$20
C - - - - - 0x0043D1 01:C3C1: F0 4D     BEQ bra_C410
- - - - - - 0x0043D3 01:C3C3: B1 D0     LDA (ram_00D0),Y
- - - - - - 0x0043D5 01:C3C5: 29 0F     AND #$0F
- - - - - - 0x0043D7 01:C3C7: 8D 86 06  STA ram_0686
- - - - - - 0x0043DA 01:C3CA: AD 82 06  LDA ram_0682
- - - - - - 0x0043DD 01:C3CD: 8D 15 40  STA $4015
- - - - - - 0x0043E0 01:C3D0: A9 60     LDA #$60
- - - - - - 0x0043E2 01:C3D2: 8D 0C 40  STA $400C
- - - - - - 0x0043E5 01:C3D5: A9 94     LDA #$94
- - - - - - 0x0043E7 01:C3D7: 8D 0D 40  STA $400D
- - - - - - 0x0043EA 01:C3DA: A9 46     LDA #$46
- - - - - - 0x0043EC 01:C3DC: 8D 0E 40  STA $400E
- - - - - - 0x0043EF 01:C3DF: A9 09     LDA #$09
- - - - - - 0x0043F1 01:C3E1: 8D 0F 40  STA $400F
- - - - - - 0x0043F4 01:C3E4: EE 8A 06  INC ram_068A
- - - - - - 0x0043F7 01:C3E7: 60        RTS

sub_C3E8:
C - - - - - 0x0043F8 01:C3E8: AD 82 06  LDA ram_0682
C - - - - - 0x0043FB 01:C3EB: 29 08     AND #$08
C - - - - - 0x0043FD 01:C3ED: AA        TAX
C - - - - - 0x0043FE 01:C3EE: AD A0 06  LDA ram_06A0
C - - - - - 0x004401 01:C3F1: 29 08     AND #$08
C - - - - - 0x004403 01:C3F3: D0 79     BNE bra_C46E
C - - - - - 0x004405 01:C3F5: 8A        TXA
C - - - - - 0x004406 01:C3F6: D0 01     BNE bra_C3F9
C - - - - - 0x004408 01:C3F8: 60        RTS

bra_C3F9:
C - - - - - 0x004409 01:C3F9: AD 86 06  LDA ram_0686
C - - - - - 0x00440C 01:C3FC: F0 01     BEQ bra_C3FF
C - - - - - 0x00440E 01:C3FE: 60        RTS

bra_C3FF:
loc_C3FF:
C D 2 - - - 0x00440F 01:C3FF: AC 8A 06  LDY ram_068A
C - - - - - 0x004412 01:C402: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x004414 01:C404: C9 FF     CMP #$FF
C - - - - - 0x004416 01:C406: D0 B5     BNE bra_C3BD
C - - - - - 0x004418 01:C408: A9 00     LDA #$00
C - - - - - 0x00441A 01:C40A: 8D 8A 06  STA ram_068A
C - - - - - 0x00441D 01:C40D: 4C FF C3  JMP loc_C3FF

bra_C410:
C - - - - - 0x004420 01:C410: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x004422 01:C412: 29 40     AND #$40
C - - - - - 0x004424 01:C414: F0 20     BEQ bra_C436
C - - - - - 0x004426 01:C416: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x004428 01:C418: 29 0F     AND #$0F
C - - - - - 0x00442A 01:C41A: 8D 86 06  STA ram_0686
C - - - - - 0x00442D 01:C41D: AD 82 06  LDA ram_0682
C - - - - - 0x004430 01:C420: 8D 15 40  STA $4015
C - - - - - 0x004433 01:C423: A9 1C     LDA #$1C
C - - - - - 0x004435 01:C425: 8D 0C 40  STA $400C
C - - - - - 0x004438 01:C428: A9 03     LDA #$03
C - - - - - 0x00443A 01:C42A: 8D 0E 40  STA $400E
C - - - - - 0x00443D 01:C42D: A9 18     LDA #$18
C - - - - - 0x00443F 01:C42F: 8D 0F 40  STA $400F
C - - - - - 0x004442 01:C432: EE 8A 06  INC ram_068A
C - - - - - 0x004445 01:C435: 60        RTS

bra_C436:
C - - - - - 0x004446 01:C436: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x004448 01:C438: 29 80     AND #$80
C - - - - - 0x00444A 01:C43A: F0 20     BEQ bra_C45C
C - - - - - 0x00444C 01:C43C: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x00444E 01:C43E: 29 0F     AND #$0F
C - - - - - 0x004450 01:C440: 8D 86 06  STA ram_0686
C - - - - - 0x004453 01:C443: AD 82 06  LDA ram_0682
C - - - - - 0x004456 01:C446: 8D 15 40  STA $4015
C - - - - - 0x004459 01:C449: A9 1C     LDA #$1C
C - - - - - 0x00445B 01:C44B: 8D 0C 40  STA $400C
C - - - - - 0x00445E 01:C44E: A9 03     LDA #$03
C - - - - - 0x004460 01:C450: 8D 0E 40  STA $400E
C - - - - - 0x004463 01:C453: A9 58     LDA #$58
C - - - - - 0x004465 01:C455: 8D 0F 40  STA $400F
C - - - - - 0x004468 01:C458: EE 8A 06  INC ram_068A
C - - - - - 0x00446B 01:C45B: 60        RTS

bra_C45C:
- - - - - - 0x00446C 01:C45C: B1 D0     LDA (ram_00D0),Y
- - - - - - 0x00446E 01:C45E: 29 0F     AND #$0F
- - - - - - 0x004470 01:C460: 8D 86 06  STA ram_0686
- - - - - - 0x004473 01:C463: AD 82 06  LDA ram_0682
- - - - - - 0x004476 01:C466: 29 F7     AND #$F7
- - - - - - 0x004478 01:C468: 8D 15 40  STA $4015
- - - - - - 0x00447B 01:C46B: EE 8A 06  INC ram_068A

bra_C46E:
- - - - - - 0x00447E 01:C46E: AD 15 40  LDA $4015
- - - - - - 0x004481 01:C471: 29 08     AND #$08
- - - - - - 0x004483 01:C473: D0 09     BNE bra_C47E
- - - - - - 0x004485 01:C475: A9 F7     LDA #$F7
- - - - - - 0x004487 01:C477: 2D A0 06  AND ram_06A0
- - - - - - 0x00448A 01:C47A: 8D A0 06  STA ram_06A0

bra_C47D_RTS:
- - - - - - 0x00448D 01:C47D: 60        RTS

bra_C47E:
- - - - - - 0x00448E 01:C47E: 8A        TXA
- - - - - - 0x00448F 01:C47F: F0 FC     BEQ bra_C47D_RTS
- - - - - - 0x004491 01:C481: B1 D0     LDA (ram_00D0),Y
- - - - - - 0x004493 01:C483: AA        TAX
- - - - - - 0x004494 01:C484: AD 86 06  LDA ram_0686
- - - - - - 0x004497 01:C487: D0 F4     BNE bra_C47D_RTS
- - - - - - 0x004499 01:C489: 4C FF C3  JMP loc_C3FF

sub_C48C:
C - - - - - 0x00449C 01:C48C: AC 88 06  LDY ram_0688
C - - - - - 0x00449F 01:C48F: AD 82 06  LDA ram_0682
C - - - - - 0x0044A2 01:C492: 29 02     AND #$02
C - - - - - 0x0044A4 01:C494: AA        TAX
C - - - - - 0x0044A5 01:C495: AD A0 06  LDA ram_06A0
C - - - - - 0x0044A8 01:C498: 29 02     AND #$02
C - - - - - 0x0044AA 01:C49A: D0 7A     BNE bra_C516
C - - - - - 0x0044AC 01:C49C: 8A        TXA
C - - - - - 0x0044AD 01:C49D: F0 4C     BEQ bra_C4EB
C - - - - - 0x0044AF 01:C49F: AD 84 06  LDA ram_0684
C - - - - - 0x0044B2 01:C4A2: D0 47     BNE bra_C4EB
C - - - - - 0x0044B4 01:C4A4: AD 8C 06  LDA ram_068C
C - - - - - 0x0044B7 01:C4A7: 8D 04 40  STA $4004
C - - - - - 0x0044BA 01:C4AA: A9 00     LDA #$00
C - - - - - 0x0044BC 01:C4AC: 8D 05 40  STA $4005
C - - - - - 0x0044BF 01:C4AF: AD 3F 03  LDA ram_033F
C - - - - - 0x0044C2 01:C4B2: D0 09     BNE bra_C4BD

loc_C4B4:
C D 2 - - - 0x0044C4 01:C4B4: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x0044C6 01:C4B6: AA        TAX
C - - - - - 0x0044C7 01:C4B7: C8        INY
C - - - - - 0x0044C8 01:C4B8: B1 D0     LDA (ram_00D0),Y
C - - - - - 0x0044CA 01:C4BA: 4C C2 C4  JMP loc_C4C2

bra_C4BD:
C - - - - - 0x0044CD 01:C4BD: E6 D1     INC ram_00D1
C - - - - - 0x0044CF 01:C4BF: 4C B4 C4  JMP loc_C4B4

loc_C4C2:
C D 2 - - - 0x0044D2 01:C4C2: 8D 06 40  STA $4006
C - - - - - 0x0044D5 01:C4C5: 8A        TXA
C - - - - - 0x0044D6 01:C4C6: 29 07     AND #$07
C - - - - - 0x0044D8 01:C4C8: 09 08     ORA #$08
C - - - - - 0x0044DA 01:C4CA: 8D 07 40  STA $4007

bra_C4CD:
C - - - - - 0x0044DD 01:C4CD: 8A        TXA
C - - - - - 0x0044DE 01:C4CE: F0 36     BEQ bra_C506
C - - - - - 0x0044E0 01:C4D0: C9 FF     CMP #$FF
C - - - - - 0x0044E2 01:C4D2: F0 27     BEQ bra_C4FB
C - - - - - 0x0044E4 01:C4D4: 29 F8     AND #$F8
C - - - - - 0x0044E6 01:C4D6: 18        CLC
C - - - - - 0x0044E7 01:C4D7: 6A        ROR
C - - - - - 0x0044E8 01:C4D8: 6A        ROR
C - - - - - 0x0044E9 01:C4D9: 6A        ROR
C - - - - - 0x0044EA 01:C4DA: 8D 84 06  STA ram_0684
C - - - - - 0x0044ED 01:C4DD: A9 02     LDA #$02
C - - - - - 0x0044EF 01:C4DF: 18        CLC
C - - - - - 0x0044F0 01:C4E0: 6D 88 06  ADC ram_0688
C - - - - - 0x0044F3 01:C4E3: 8D 88 06  STA ram_0688
C - - - - - 0x0044F6 01:C4E6: 90 03     BCC bra_C4EB
C - - - - - 0x0044F8 01:C4E8: EE 3F 03  INC ram_033F

bra_C4EB:
loc_C4EB:
C D 2 - - - 0x0044FB 01:C4EB: AE 41 03  LDX ram_0341
C - - - - - 0x0044FE 01:C4EE: E8        INX
C - - - - - 0x0044FF 01:C4EF: E8        INX
C - - - - - 0x004500 01:C4F0: BD 30 C3  LDA tbl_C330_music_channels_table,X
C - - - - - 0x004503 01:C4F3: 85 D0     STA ram_00D0
C - - - - - 0x004505 01:C4F5: BD 31 C3  LDA tbl_C330_music_channels_table+1,X
C - - - - - 0x004508 01:C4F8: 85 D1     STA ram_00D1
C - - - - - 0x00450A 01:C4FA: 60        RTS

bra_C4FB:
C - - - - - 0x00450B 01:C4FB: A2 00     LDX #$00
C - - - - - 0x00450D 01:C4FD: 8E 88 06  STX ram_0688
C - - - - - 0x004510 01:C500: 8E 3F 03  STX ram_033F
C - - - - - 0x004513 01:C503: 4C EB C4  JMP loc_C4EB

bra_C506:
- - - - - - 0x004516 01:C506: AD 82 06  LDA ram_0682
- - - - - - 0x004519 01:C509: 29 FD     AND #$FD
- - - - - - 0x00451B 01:C50B: 8D 15 40  STA $4015
- - - - - - 0x00451E 01:C50E: A9 01     LDA #$01
- - - - - - 0x004520 01:C510: 8D 42 03  STA ram_0342
- - - - - - 0x004523 01:C513: 4C EB C4  JMP loc_C4EB

bra_C516:
- - - - - - 0x004526 01:C516: AD 15 40  LDA $4015
- - - - - - 0x004529 01:C519: 29 02     AND #$02
- - - - - - 0x00452B 01:C51B: D0 0B     BNE bra_C528
- - - - - - 0x00452D 01:C51D: A9 FD     LDA #$FD
- - - - - - 0x00452F 01:C51F: 2D A0 06  AND ram_06A0
- - - - - - 0x004532 01:C522: 8D A0 06  STA ram_06A0
- - - - - - 0x004535 01:C525: 4C EB C4  JMP loc_C4EB

bra_C528:
- - - - - - 0x004538 01:C528: 8A        TXA
- - - - - - 0x004539 01:C529: F0 C0     BEQ bra_C4EB
- - - - - - 0x00453B 01:C52B: B1 D0     LDA (ram_00D0),Y
- - - - - - 0x00453D 01:C52D: AA        TAX
- - - - - - 0x00453E 01:C52E: AD 84 06  LDA ram_0684
- - - - - - 0x004541 01:C531: F0 9A     BEQ bra_C4CD
- - - - - - 0x004543 01:C533: 4C EB C4  JMP loc_C4EB

sub_C536:
C - - - - - 0x004546 01:C536: AD 40 03  LDA ram_0340
C - - - - - 0x004549 01:C539: 0A        ASL
C - - - - - 0x00454A 01:C53A: 0A        ASL
C - - - - - 0x00454B 01:C53B: AA        TAX
C - - - - - 0x00454C 01:C53C: 8E 41 03  STX ram_0341
C - - - - - 0x00454F 01:C53F: BD 30 C3  LDA tbl_C330_music_channels_table,X
C - - - - - 0x004552 01:C542: 85 D0     STA ram_00D0
C - - - - - 0x004554 01:C544: BD 31 C3  LDA tbl_C330_music_channels_table+1,X
C - - - - - 0x004557 01:C547: 85 D1     STA ram_00D1
C - - - - - 0x004559 01:C549: 60        RTS

sub_C54A:
C - - - - - 0x00455A 01:C54A: A5 D2     LDA ram_00D2
C - - - - - 0x00455C 01:C54C: 30 22     BMI bra_C570_RTS
C - - - - - 0x00455E 01:C54E: 0A        ASL
C - - - - - 0x00455F 01:C54F: 0A        ASL
C - - - - - 0x004560 01:C550: AA        TAX
C - - - - - 0x004561 01:C551: A0 00     LDY #$00

bra_C553:
C - - - - - 0x004563 01:C553: BD 10 C3  LDA tbl_C310_sound_fx_table,X
C - - - - - 0x004566 01:C556: 99 91 06  STA ram_0691,Y
C - - - - - 0x004569 01:C559: E8        INX
C - - - - - 0x00456A 01:C55A: C8        INY
C - - - - - 0x00456B 01:C55B: C0 04     CPY #$04
C - - - - - 0x00456D 01:C55D: D0 F4     BNE bra_C553
C - - - - - 0x00456F 01:C55F: A5 D2     LDA ram_00D2
C - - - - - 0x004571 01:C561: A9 01     LDA #$01
C - - - - - 0x004573 01:C563: 0D A1 06  ORA ram_06A1
C - - - - - 0x004576 01:C566: 8D A1 06  STA ram_06A1
C - - - - - 0x004579 01:C569: 20 79 C3  JSR sub_C379
C - - - - - 0x00457C 01:C56C: A9 FF     LDA #$FF
C - - - - - 0x00457E 01:C56E: 85 D2     STA ram_00D2

bra_C570_RTS:
C - - - - - 0x004580 01:C570: 60        RTS

tbl_C571_music_header:
- D 2 - - - 0x004581 01:C571: 04        .byte $04,$0F,$B3,$C6,$BF,$BF   ; first byte = tempo

tbl_C577_channel_pulse:
- D 2 - I - 0x004587 01:C577: 21        .byte $21,$AC,$21,$AC,$21,$AC,$21,$7D,$21,$54,$21,$54,$21,$54,$21,$1E ;
- D 2 - I - 0x004597 01:C587: 20        .byte $20,$FE,$10,$D6,$10,$FE,$20,$D6,$20,$FE,$21,$1E,$21,$1E,$21,$1E ;
- D 2 - I - 0x0045A7 01:C597: 21        .byte $21,$AC,$21,$AC,$21,$AC,$21,$7D,$21,$54,$21,$54,$21,$54,$21,$1E ;
- D 2 - I - 0x0045B7 01:C5A7: 11        .byte $11,$7D,$11,$54,$11,$7D,$11,$54,$21,$7D,$21,$7D,$21,$7D,$21,$AC ;
- D 2 - I - 0x0045C7 01:C5B7: 21        .byte $21,$AC,$21,$AC,$21,$7D,$21,$54,$21,$54,$21,$54,$21,$1E,$10,$FE ;
- D 2 - I - 0x0045D7 01:C5C7: 10        .byte $10,$D6,$10,$BE,$10,$BE,$10,$BE,$10,$AA,$20,$BE,$20,$D6,$20,$FE ;
- D 2 - I - 0x0045E7 01:C5D7: 21        .byte $21,$1E,$10,$D6,$10,$FE,$21,$1E,$21,$54,$11,$7D,$11,$54,$21,$1E ;
- D 2 - I - 0x0045F7 01:C5E7: 21        .byte $21,$54,$21,$7D,$11,$7D,$11,$54,$21,$7D,$21,$AC,$21,$AC,$21,$AC ;
- D 2 - I - 0x004607 01:C5F7: 21        .byte $21,$7D,$21,$54,$21,$1E,$20,$D6,$20,$AA,$10,$BE,$10,$BE,$10,$BE ;
- D 2 - I - 0x004617 01:C607: 10        .byte $10,$AA,$20,$BE,$20,$D6,$20,$FE,$21,$1E,$10,$D6,$10,$FE,$21,$1E ;
- D 2 - I - 0x004627 01:C617: 21        .byte $21,$54,$21,$7D,$21,$7D,$21,$7D,$21,$FC,$21,$AC,$11,$AC,$11,$7D ;
- D 2 - I - 0x004637 01:C627: 11        .byte $11,$AC,$11,$7D,$21,$1E,$11,$AC,$11,$7D,$11,$AC,$11,$7D,$20,$FE ;
- D 2 - I - 0x004647 01:C637: 10        .byte $10,$D6,$10,$FE,$10,$D6,$08,$FE,$09,$1E,$21,$54,$10,$FE,$09,$54 ;
- D 2 - I - 0x004657 01:C647: 09        .byte $09,$7D,$11,$1E,$09,$54,$09,$7D,$21,$AC,$11,$AC,$09,$94,$09,$7D ;
- D 2 - I - 0x004667 01:C657: 21        .byte $21,$54,$21,$54,$11,$1E,$09,$0E,$08,$FE,$20,$E2,$20,$E2,$11,$1E ;
- D 2 - I - 0x004677 01:C667: 09        .byte $09,$0E,$08,$FE,$20,$E2,$20,$E2,$10,$D6,$08,$E2,$08,$F0,$11,$0E ;
- D 2 - I - 0x004687 01:C677: 09        .byte $09,$1E,$09,$2E,$11,$54,$09,$68,$09,$7D,$21,$AC,$FF ;

tbl_C684_channel_noise:
- D 2 - I - 0x004694 01:C684: 44        .byte $44,$84,$84,$FF    ; 

sub_C688:
C - - - - - 0x004698 01:C688: EE 57 06  INC ram_0657
C - - - - - 0x00469B 01:C68B: EE 51 06  INC ram_0651
C - - - - - 0x00469E 01:C68E: AD 51 06  LDA ram_0651
C - - - - - 0x0046A1 01:C691: 29 01     AND #$01
C - - - - - 0x0046A3 01:C693: F0 03     BEQ bra_C698
C - - - - - 0x0046A5 01:C695: EE 52 06  INC ram_0652
bra_C698:
C - - - - - 0x0046A8 01:C698: AD 52 06  LDA ram_0652
C - - - - - 0x0046AB 01:C69B: 29 01     AND #$01
C - - - - - 0x0046AD 01:C69D: F0 03     BEQ bra_C6A2_RTS
C - - - - - 0x0046AF 01:C69F: EE 53 06  INC ram_0653

bra_C6A2_RTS:
C - - - - - 0x0046B2 01:C6A2: 60        RTS

sub_C6A3:
C - - - - - 0x0046B3 01:C6A3: A9 00     LDA #$00

bra_C6A5:
C - - - - - 0x0046B5 01:C6A5: 9D 80 06  STA ram_0680,X
C - - - - - 0x0046B8 01:C6A8: E8        INX
C - - - - - 0x0046B9 01:C6A9: E0 08     CPX #$08
C - - - - - 0x0046BB 01:C6AB: 90 F8     BCC bra_C6A5
C - - - - - 0x0046BD 01:C6AD: A2 00     LDX #$00
C - - - - - 0x0046BF 01:C6AF: 8E 50 06  STX ram_0650
C - - - - - 0x0046C2 01:C6B2: 8E 57 06  STX ram_0657
C - - - - - 0x0046C5 01:C6B5: 8E 59 06  STX ram_0659

loc_C6B8:
C D 2 - - - 0x0046C8 01:C6B8: BD 51 06  LDA ram_0651,X
C - - - - - 0x0046CB 01:C6BB: 8D 54 06  STA ram_0654
C - - - - - 0x0046CE 01:C6BE: 20 F9 C6  JSR sub_C6F9
C - - - - - 0x0046D1 01:C6C1: AD 50 06  LDA ram_0650
C - - - - - 0x0046D4 01:C6C4: C9 08     CMP #$08
C - - - - - 0x0046D6 01:C6C6: B0 21     BCS bra_C6E9
C - - - - - 0x0046D8 01:C6C8: AD 57 06  LDA ram_0657
C - - - - - 0x0046DB 01:C6CB: C9 30     CMP #$30
C - - - - - 0x0046DD 01:C6CD: B0 1A     BCS bra_C6E9
C - - - - - 0x0046DF 01:C6CF: E8        INX
C - - - - - 0x0046E0 01:C6D0: E0 03     CPX #$03
C - - - - - 0x0046E2 01:C6D2: 90 02     BCC bra_C6D6
C - - - - - 0x0046E4 01:C6D4: A2 00     LDX #$00

bra_C6D6:
C - - - - - 0x0046E6 01:C6D6: 8A        TXA
C - - - - - 0x0046E7 01:C6D7: 48        PHA
C - - - - - 0x0046E8 01:C6D8: AD 51 06  LDA ram_0651
C - - - - - 0x0046EB 01:C6DB: 29 07     AND #$07
C - - - - - 0x0046ED 01:C6DD: AA        TAX

bra_C6DE:
C - - - - - 0x0046EE 01:C6DE: 20 88 C6  JSR sub_C688
C - - - - - 0x0046F1 01:C6E1: CA        DEX
C - - - - - 0x0046F2 01:C6E2: 10 FA     BPL bra_C6DE
C - - - - - 0x0046F4 01:C6E4: 68        PLA
C - - - - - 0x0046F5 01:C6E5: AA        TAX
C - - - - - 0x0046F6 01:C6E6: 4C B8 C6  JMP loc_C6B8

bra_C6E9:
C - - - - - 0x0046F9 01:C6E9: AD 50 06  LDA ram_0650
C - - - - - 0x0046FC 01:C6EC: C9 08     CMP #$08
C - - - - - 0x0046FE 01:C6EE: 90 02     BCC bra_C6F2
C - - - - - 0x004700 01:C6F0: A9 08     LDA #$08

bra_C6F2:
C - - - - - 0x004702 01:C6F2: 8D 58 06  STA ram_0658
C - - - - - 0x004705 01:C6F5: 20 55 C7  JSR sub_C755
C - - - - - 0x004708 01:C6F8: 60        RTS

sub_C6F9:
C - - - - - 0x004709 01:C6F9: 8A        TXA
C - - - - - 0x00470A 01:C6FA: 48        PHA
C - - - - - 0x00470B 01:C6FB: AD 54 06  LDA ram_0654
C - - - - - 0x00470E 01:C6FE: C9 30     CMP #$30
C - - - - - 0x004710 01:C700: 90 50     BCC bra_C752
C - - - - - 0x004712 01:C702: A0 00     LDY #$00

bra_C704:
C - - - - - 0x004714 01:C704: AD 54 06  LDA ram_0654
C - - - - - 0x004717 01:C707: D9 80 06  CMP ram_0680,Y
C - - - - - 0x00471A 01:C70A: F0 46     BEQ bra_C752
C - - - - - 0x00471C 01:C70C: C0 08     CPY #$08
C - - - - - 0x00471E 01:C70E: 90 0C     BCC bra_C71C
- - - - - - 0x004720 01:C710: AC 59 06  LDY ram_0659
- - - - - - 0x004723 01:C713: 99 80 06  STA ram_0680,Y
- - - - - - 0x004726 01:C716: EE 59 06  INC ram_0659
- - - - - - 0x004729 01:C719: 4C 21 C7  JMP loc_C721

bra_C71C:
C - - - - - 0x00472C 01:C71C: C8        INY
C - - - - - 0x00472D 01:C71D: C0 08     CPY #$08
C - - - - - 0x00472F 01:C71F: 90 E3     BCC bra_C704

loc_C721:
C - - - - - 0x004731 01:C721: AA        TAX
C - - - - - 0x004732 01:C722: 29 01     AND #$01
C - - - - - 0x004734 01:C724: 8D 55 06  STA ram_0655

loc_C727:
C D 2 - - - 0x004737 01:C727: 20 F2 C7  JSR sub_C7F2
C - - - - - 0x00473A 01:C72A: A5 0F     LDA ram_000F
C - - - - - 0x00473C 01:C72C: C9 8C     CMP #$8C
C - - - - - 0x00473E 01:C72E: D0 19     BNE bra_C749
C - - - - - 0x004740 01:C730: AD 50 06  LDA ram_0650
C - - - - - 0x004743 01:C733: 0A        ASL
C - - - - - 0x004744 01:C734: A8        TAY
C - - - - - 0x004745 01:C735: 8A        TXA
C - - - - - 0x004746 01:C736: 29 F0     AND #$F0
C - - - - - 0x004748 01:C738: 99 60 06  STA ram_0660,Y
C - - - - - 0x00474B 01:C73B: C8        INY
C - - - - - 0x00474C 01:C73C: 8A        TXA
C - - - - - 0x00474D 01:C73D: 29 0F     AND #$0F
C - - - - - 0x00474F 01:C73F: 0A        ASL
C - - - - - 0x004750 01:C740: 0A        ASL
C - - - - - 0x004751 01:C741: 0A        ASL
C - - - - - 0x004752 01:C742: 0A        ASL
C - - - - - 0x004753 01:C743: 99 60 06  STA ram_0660,Y
C - - - - - 0x004756 01:C746: EE 50 06  INC ram_0650

bra_C749:
C - - - - - 0x004759 01:C749: CE 55 06  DEC ram_0655
C - - - - - 0x00475C 01:C74C: 30 04     BMI bra_C752
C - - - - - 0x00475E 01:C74E: E8        INX
C - - - - - 0x00475F 01:C74F: 4C 27 C7  JMP loc_C727

bra_C752:
C - - - - - 0x004762 01:C752: 68        PLA
C - - - - - 0x004763 01:C753: AA        TAX
C - - - - - 0x004764 01:C754: 60        RTS

sub_C755:
C - - - - - 0x004765 01:C755: A2 00     LDX #$00
C - - - - - 0x004767 01:C757: 8E 50 06  STX ram_0650
C - - - - - 0x00476A 01:C75A: A9 68     LDA #$68
C - - - - - 0x00476C 01:C75C: 8D 56 06  STA ram_0656

loc_C75F:
C D 2 - - - 0x00476F 01:C75F: AD 50 06  LDA ram_0650
C - - - - - 0x004772 01:C762: 0A        ASL
C - - - - - 0x004773 01:C763: 0A        ASL
C - - - - - 0x004774 01:C764: 0A        ASL
C - - - - - 0x004775 01:C765: 18        CLC
C - - - - - 0x004776 01:C766: 6D 56 06  ADC ram_0656
C - - - - - 0x004779 01:C769: AA        TAX
C - - - - - 0x00477A 01:C76A: AD 50 06  LDA ram_0650
C - - - - - 0x00477D 01:C76D: D0 2E     BNE bra_C79D
C - - - - - 0x00477F 01:C76F: A5 80     LDA ram_0080
C - - - - - 0x004781 01:C771: 29 01     AND #$01
C - - - - - 0x004783 01:C773: F0 0B     BEQ bra_C780

bra_C775:
C - - - - - 0x004785 01:C775: A9 95     LDA #>tbl_9509_spr_item_candy
C - - - - - 0x004787 01:C777: 85 2F     STA ram_002F
C - - - - - 0x004789 01:C779: A9 09     LDA #<tbl_9509_spr_item_candy
C - - - - - 0x00478B 01:C77B: 85 2E     STA ram_002E
C - - - - - 0x00478D 01:C77D: 4C A5 C7  JMP loc_C7A5

bra_C780:
C - - - - - 0x004790 01:C780: AD 30 06  LDA ram_0630
C - - - - - 0x004793 01:C783: D0 F0     BNE bra_C775
C - - - - - 0x004795 01:C785: AD 82 03  LDA ram_0382
C - - - - - 0x004798 01:C788: F0 EB     BEQ bra_C775
C - - - - - 0x00479A 01:C78A: A5 D3     LDA ram_00D3
C - - - - - 0x00479C 01:C78C: D0 E7     BNE bra_C775
C - - - - - 0x00479E 01:C78E: A9 00     LDA #$00
C - - - - - 0x0047A0 01:C790: 85 BB     STA ram_00BB
C - - - - - 0x0047A2 01:C792: A9 C7     LDA #>tbl_C7F0_spr_item_key
C - - - - - 0x0047A4 01:C794: 85 2F     STA ram_002F
C - - - - - 0x0047A6 01:C796: A9 F0     LDA #<tbl_C7F0_spr_item_key
C - - - - - 0x0047A8 01:C798: 85 2E     STA ram_002E
C - - - - - 0x0047AA 01:C79A: 4C A5 C7  JMP loc_C7A5

bra_C79D:
C - - - - - 0x0047AD 01:C79D: A9 94     LDA #$94
C - - - - - 0x0047AF 01:C79F: 85 2F     STA ram_002F
C - - - - - 0x0047B1 01:C7A1: A9 9E     LDA #$9E
C - - - - - 0x0047B3 01:C7A3: 85 2E     STA ram_002E

loc_C7A5:
C D 2 - - - 0x0047B5 01:C7A5: A0 00     LDY #$00
C - - - - - 0x0047B7 01:C7A7: B1 2E     LDA (ram_002E),Y
C - - - - - 0x0047B9 01:C7A9: 9D 01 02  STA ram_0201,X
C - - - - - 0x0047BC 01:C7AC: C8        INY
C - - - - - 0x0047BD 01:C7AD: B1 2E     LDA (ram_002E),Y
C - - - - - 0x0047BF 01:C7AF: 9D 05 02  STA ram_0205,X
C - - - - - 0x0047C2 01:C7B2: AD 50 06  LDA ram_0650
C - - - - - 0x0047C5 01:C7B5: 0A        ASL
C - - - - - 0x0047C6 01:C7B6: A8        TAY
C - - - - - 0x0047C7 01:C7B7: B9 60 06  LDA ram_0660,Y
C - - - - - 0x0047CA 01:C7BA: 9D 00 02  STA ram_0200,X
C - - - - - 0x0047CD 01:C7BD: 9D 04 02  STA ram_0204,X
C - - - - - 0x0047D0 01:C7C0: C8        INY
C - - - - - 0x0047D1 01:C7C1: B9 60 06  LDA ram_0660,Y
C - - - - - 0x0047D4 01:C7C4: 9D 03 02  STA ram_0203,X
C - - - - - 0x0047D7 01:C7C7: 18        CLC
C - - - - - 0x0047D8 01:C7C8: 69 08     ADC #$08
C - - - - - 0x0047DA 01:C7CA: 9D 07 02  STA ram_0207,X
C - - - - - 0x0047DD 01:C7CD: AD 50 06  LDA ram_0650
C - - - - - 0x0047E0 01:C7D0: D0 04     BNE bra_C7D6
C - - - - - 0x0047E2 01:C7D2: A9 00     LDA #$00
C - - - - - 0x0047E4 01:C7D4: F0 02     BEQ bra_C7D8

bra_C7D6:
C - - - - - 0x0047E6 01:C7D6: A9 02     LDA #$02

bra_C7D8:
C - - - - - 0x0047E8 01:C7D8: 9D 02 02  STA ram_0202,X
C - - - - - 0x0047EB 01:C7DB: 9D 06 02  STA ram_0206,X
C - - - - - 0x0047EE 01:C7DE: EE 50 06  INC ram_0650
C - - - - - 0x0047F1 01:C7E1: AD 50 06  LDA ram_0650
C - - - - - 0x0047F4 01:C7E4: CD 58 06  CMP ram_0658
C - - - - - 0x0047F7 01:C7E7: B0 03     BCS bra_C7EC_RTS
C - - - - - 0x0047F9 01:C7E9: 4C 5F C7  JMP loc_C75F

bra_C7EC_RTS:
C - - - - - 0x0047FC 01:C7EC: 60        RTS

; Same as candy probably header used in other case
tbl_C7ED:
- D 2 - I - 0x0047FD 01:C7ED: 02        .byte $02,$01,$02 ; 

tbl_C7F0_spr_item_key:
- D 2 - I - 0x004800 01:C7F0: 02        .byte $C3,$0C ;

sub_C7F2:
C - - - - - 0x004802 01:C7F2: 98        TYA
C - - - - - 0x004803 01:C7F3: 48        PHA
C - - - - - 0x004804 01:C7F4: 8A        TXA
C - - - - - 0x004805 01:C7F5: 48        PHA
C - - - - - 0x004806 01:C7F6: AE 3B 06  LDX ram_063B
C - - - - - 0x004809 01:C7F9: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x00480C 01:C7FC: 0A        ASL
C - - - - - 0x00480D 01:C7FD: AA        TAX
C - - - - - 0x00480E 01:C7FE: BD FC CB  LDA tbl_CBFC_stages_tilemaps_table,X
C - - - - - 0x004811 01:C801: 85 7D     STA ram_007D
C - - - - - 0x004813 01:C803: BD FD CB  LDA tbl_CBFC_stages_tilemaps_table+1,X
C - - - - - 0x004816 01:C806: 85 7E     STA ram_007E
C - - - - - 0x004818 01:C808: A5 9E     LDA ram_009E
C - - - - - 0x00481A 01:C80A: D0 09     BNE bra_C815
C - - - - - 0x00481C 01:C80C: AD 22 03  LDA ram_0322
C - - - - - 0x00481F 01:C80F: F0 04     BEQ bra_C815
C - - - - - 0x004821 01:C811: A9 01     LDA #$01
C - - - - - 0x004823 01:C813: D0 1A     BNE bra_C82F

bra_C815:
C - - - - - 0x004825 01:C815: AD 20 03  LDA ram_0320
C - - - - - 0x004828 01:C818: F0 05     BEQ bra_C81F
C - - - - - 0x00482A 01:C81A: A5 03     LDA ram_0003
C - - - - - 0x00482C 01:C81C: 4C 2F C8  JMP loc_C82F

bra_C81F:
C - - - - - 0x00482F 01:C81F: A5 16     LDA ram_0016
C - - - - - 0x004831 01:C821: C9 80     CMP #$80
C - - - - - 0x004833 01:C823: B0 05     BCS bra_C82A
C - - - - - 0x004835 01:C825: A5 03     LDA ram_0003
C - - - - - 0x004837 01:C827: 4C 2F C8  JMP loc_C82F

bra_C82A:
C - - - - - 0x00483A 01:C82A: A5 03     LDA ram_0003
C - - - - - 0x00483C 01:C82C: 18        CLC
C - - - - - 0x00483D 01:C82D: 69 01     ADC #$01

bra_C82F:
loc_C82F:
C D 2 - - - 0x00483F 01:C82F: 0A        ASL
C - - - - - 0x004840 01:C830: A8        TAY
C - - - - - 0x004841 01:C831: B1 7D     LDA (ram_007D),Y
C - - - - - 0x004843 01:C833: 85 08     STA ram_0008
C - - - - - 0x004845 01:C835: C8        INY
C - - - - - 0x004846 01:C836: B1 7D     LDA (ram_007D),Y
C - - - - - 0x004848 01:C838: 85 09     STA ram_0009
C - - - - - 0x00484A 01:C83A: 68        PLA
C - - - - - 0x00484B 01:C83B: A8        TAY
C - - - - - 0x00484C 01:C83C: 48        PHA
C - - - - - 0x00484D 01:C83D: B1 08     LDA (ram_0008),Y
C - - - - - 0x00484F 01:C83F: 85 0F     STA ram_000F
C - - - - - 0x004851 01:C841: 68        PLA
C - - - - - 0x004852 01:C842: AA        TAX
C - - - - - 0x004853 01:C843: 68        PLA
C - - - - - 0x004854 01:C844: A8        TAY
C - - - - - 0x004855 01:C845: 60        RTS

sub_C846:
C - - - - - 0x004856 01:C846: AE 3B 06  LDX ram_063B
C - - - - - 0x004859 01:C849: BD 3C 06  LDA con_p1_current_level,X
C - - - - - 0x00485C 01:C84C: C9 04     CMP #$04
C - - - - - 0x00485E 01:C84E: 90 22     BCC bra_C872
C - - - - - 0x004860 01:C850: 38        SEC
C - - - - - 0x004861 01:C851: E9 04     SBC #$04
C - - - - - 0x004863 01:C853: 0A        ASL
C - - - - - 0x004864 01:C854: AA        TAX
C - - - - - 0x004865 01:C855: BD 5F C8  LDA tbl_C85E+1,X
C - - - - - 0x004868 01:C858: 48        PHA
C - - - - - 0x004869 01:C859: BD 5E C8  LDA tbl_C85E,X
C - - - - - 0x00486C 01:C85C: 48        PHA
C - - - - - 0x00486D 01:C85D: 60        RTS

;???
tbl_C85E:
- D 2 - - - 0x00486E 01:C85E: 6B C8     .word $C86B
- D 2 - - - 0x004870 01:C860: 76 C8     .word $C876
- D 2 - - - 0x004872 01:C862: 77 C8     .word $C877
- D 2 - - - 0x004874 01:C864: 80 C8     .word $C880
- D 2 - - - 0x004876 01:C866: 87 C8     .word $C887
- D 2 - - - 0x004878 01:C868: 76 C8     .word $C876
- D 2 - - - 0x00487A 01:C86A: 8E C8     .word $C88E

bra_C86C:
C - - - - - 0x00487C 01:C86C: A5 F9     LDA ram_00F9
C - - - - - 0x00487E 01:C86E: C9 05     CMP #$05
C - - - - - 0x004880 01:C870: 90 05     BCC bra_C877_RTS

bra_C872:
C - - - - - 0x004882 01:C872: A9 01     LDA #$01
C - - - - - 0x004884 01:C874: 8D 82 03  STA ram_0382

bra_C877_RTS:
C - - - - - 0x004887 01:C877: 60        RTS
C - - - - - 0x004888 01:C878: AD 83 03  LDA ram_0383
C - - - - - 0x00488B 01:C87B: C9 03     CMP #$03
C - - - - - 0x00488D 01:C87D: B0 F3     BCS bra_C872
C - - - - - 0x00488F 01:C87F: 60        RTS

tbl_C880:
- - - - - - 0x004890 01:C880: 60        RTS ; ???

bra_C881:
C - - - - - 0x004891 01:C881: AD 40 06  LDA ram_0640
C - - - - - 0x004894 01:C884: F0 F1     BEQ bra_C877_RTS
C - - - - - 0x004896 01:C886: D0 EA     BNE bra_C872
C - - - - - 0x004898 01:C888: AD 16 03  LDA ram_0316
C - - - - - 0x00489B 01:C88B: F0 EA     BEQ bra_C877_RTS
C - - - - - 0x00489D 01:C88D: D0 E3     BNE bra_C872
C - - - - - 0x00489F 01:C88F: A5 CE     LDA ram_00CE
C - - - - - 0x0048A1 01:C891: D0 DF     BNE bra_C872
C - - - - - 0x0048A3 01:C893: F0 E2     BEQ bra_C877_RTS

sub_C895:
C - - - - - 0x0048A5 01:C895: AD 8E 03  LDA ram_038E
C - - - - - 0x0048A8 01:C898: F0 01     BEQ bra_C89B

C - - - - - 0x0048AA 01:C89A: 60        RTS
bra_C89B:
C - - - - - 0x0048AB 01:C89B: AD 2C 06  LDA ram_062C
C - - - - - 0x0048AE 01:C89E: F0 16     BEQ bra_C8B6
C - - - - - 0x0048B0 01:C8A0: C9 80     CMP #$80
C - - - - - 0x0048B2 01:C8A2: B0 04     BCS bra_C8A8
C - - - - - 0x0048B4 01:C8A4: EE 2C 06  INC ram_062C
C - - - - - 0x0048B7 01:C8A7: 60        RTS

bra_C8A8:
C - - - - - 0x0048B8 01:C8A8: A9 01     LDA #$01
C - - - - - 0x0048BA 01:C8AA: 8D 8C 03  STA ram_038C
C - - - - - 0x0048BD 01:C8AD: A9 00     LDA #$00
C - - - - - 0x0048BF 01:C8AF: 8D 49 03  STA ram_0349
C - - - - - 0x0048C2 01:C8B2: 8D 2C 06  STA ram_062C
C - - - - - 0x0048C5 01:C8B5: 60        RTS

bra_C8B6:
C - - - - - 0x0048C6 01:C8B6: A5 16     LDA ram_0016
C - - - - - 0x0048C8 01:C8B8: 8D 05 20  STA $2005
C - - - - - 0x0048CB 01:C8BB: A5 17     LDA ram_0017
C - - - - - 0x0048CD 01:C8BD: 8D 05 20  STA $2005
C - - - - - 0x0048D0 01:C8C0: A5 1C     LDA ram_001C
C - - - - - 0x0048D2 01:C8C2: 48        PHA
C - - - - - 0x0048D3 01:C8C3: 20 7A C9  JSR sub_C97A
C - - - - - 0x0048D6 01:C8C6: A5 1C     LDA ram_001C
C - - - - - 0x0048D8 01:C8C8: 29 F3     AND #$F3
C - - - - - 0x0048DA 01:C8CA: 85 1C     STA ram_001C
C - - - - - 0x0048DC 01:C8CC: 20 94 CA  JSR sub_CA94
C - - - - - 0x0048DF 01:C8CF: 20 F5 B6  JSR sub_B6F5
C - - - - - 0x0048E2 01:C8D2: 20 1C B6  JSR sub_B61C
C - - - - - 0x0048E5 01:C8D5: 20 8C B5  JSR sub_B58C
C - - - - - 0x0048E8 01:C8D8: 20 3F B1  JSR sub_B13F
C - - - - - 0x0048EB 01:C8DB: 20 92 9C  JSR sub_9C92
C - - - - - 0x0048EE 01:C8DE: A5 9E     LDA ram_009E
C - - - - - 0x0048F0 01:C8E0: F0 23     BEQ bra_C905
C - - - - - 0x0048F2 01:C8E2: A9 00     LDA #$00
C - - - - - 0x0048F4 01:C8E4: 85 9E     STA ram_009E
C - - - - - 0x0048F6 01:C8E6: A5 2D     LDA con_player_position_y
C - - - - - 0x0048F8 01:C8E8: 38        SEC
C - - - - - 0x0048F9 01:C8E9: E9 0A     SBC #$0A
C - - - - - 0x0048FB 01:C8EB: C9 F0     CMP #$F0
C - - - - - 0x0048FD 01:C8ED: B0 16     BCS bra_C905
C - - - - - 0x0048FF 01:C8EF: 85 2D     STA con_player_position_y
C - - - - - 0x004901 01:C8F1: A9 04     LDA #$04
C - - - - - 0x004903 01:C8F3: 85 1C     STA ram_001C
C - - - - - 0x004905 01:C8F5: 20 F5 B6  JSR sub_B6F5
C - - - - - 0x004908 01:C8F8: A5 38     LDA ram_0038
C - - - - - 0x00490A 01:C8FA: F0 09     BEQ bra_C905
C - - - - - 0x00490C 01:C8FC: A5 2D     LDA con_player_position_y
C - - - - - 0x00490E 01:C8FE: 29 F0     AND #$F0
C - - - - - 0x004910 01:C900: 18        CLC
C - - - - - 0x004911 01:C901: 69 10     ADC #$10
C - - - - - 0x004913 01:C903: 85 2D     STA con_player_position_y

bra_C905:
C - - - - - 0x004915 01:C905: A5 7B     LDA ram_007B
C - - - - - 0x004917 01:C907: 29 01     AND #$01
C - - - - - 0x004919 01:C909: D0 0D     BNE bra_C918
C - - - - - 0x00491B 01:C90B: A9 04     LDA #$04
C - - - - - 0x00491D 01:C90D: 85 1C     STA ram_001C
C - - - - - 0x00491F 01:C90F: 20 F5 B6  JSR sub_B6F5
C - - - - - 0x004922 01:C912: A5 38     LDA ram_0038
C - - - - - 0x004924 01:C914: D0 02     BNE bra_C918
C - - - - - 0x004926 01:C916: E6 2D     INC con_player_position_y

bra_C918:
C - - - - - 0x004928 01:C918: 68        PLA
C - - - - - 0x004929 01:C919: 85 1C     STA ram_001C
C - - - - - 0x00492B 01:C91B: 20 39 C9  JSR sub_C939
C - - - - - 0x00492E 01:C91E: 20 76 CA  JSR sub_CA76
C - - - - - 0x004931 01:C921: 20 7D B3  JSR sub_B37D
C - - - - - 0x004934 01:C924: A9 00     LDA #$00
C - - - - - 0x004936 01:C926: 85 73     STA ram_0073
C - - - - - 0x004938 01:C928: 85 74     STA ram_0074
C - - - - - 0x00493A 01:C92A: 60        RTS

tbl_C92B_sprite_little_hood_swim_1:
- D 2 - I - 0x00493B 01:C92B: 02        .byte $02,$02,$01,$29,$2A,$2D,$2E ; 

tbl_C932_sprite_little_hood_swim_2:
- D 2 - I - 0x004942 01:C932: 02        .byte $02,$02,$01,$29,$2A,$31,$32 ; 

sub_C939:
C - - - - - 0x004949 01:C939: A5 2C     LDA con_player_position_x
C - - - - - 0x00494B 01:C93B: 85 4E     STA ram_004E
C - - - - - 0x00494D 01:C93D: A5 2D     LDA con_player_position_y
C - - - - - 0x00494F 01:C93F: 85 4D     STA ram_004D
C - - - - - 0x004951 01:C941: EE 88 05  INC ram_0588
C - - - - - 0x004954 01:C944: A5 1C     LDA ram_001C
C - - - - - 0x004956 01:C946: 29 01     AND #$01
C - - - - - 0x004958 01:C948: F0 04     BEQ bra_C94E
C - - - - - 0x00495A 01:C94A: A9 00     LDA #$00
C - - - - - 0x00495C 01:C94C: F0 08     BEQ bra_C956

bra_C94E:
C - - - - - 0x00495E 01:C94E: A5 1C     LDA ram_001C
C - - - - - 0x004960 01:C950: 29 02     AND #$02
C - - - - - 0x004962 01:C952: F0 04     BEQ bra_C958
C - - - - - 0x004964 01:C954: A9 01     LDA #$01

bra_C956:
C - - - - - 0x004966 01:C956: 85 4C     STA ram_004C

bra_C958:
C - - - - - 0x004968 01:C958: A9 00     LDA #$00
C - - - - - 0x00496A 01:C95A: 85 24     STA ram_0024
C - - - - - 0x00496C 01:C95C: AD 88 05  LDA ram_0588
C - - - - - 0x00496F 01:C95F: 29 08     AND #$08
C - - - - - 0x004971 01:C961: F0 0B     BEQ bra_C96E
C - - - - - 0x004973 01:C963: A9 C9     LDA #>tbl_C92B_sprite_little_hood_swim_1
C - - - - - 0x004975 01:C965: 85 46     STA ram_0046
C - - - - - 0x004977 01:C967: A9 2B     LDA #<tbl_C92B_sprite_little_hood_swim_1
C - - - - - 0x004979 01:C969: 85 45     STA ram_0045
C - - - - - 0x00497B 01:C96B: 4C 76 C9  JMP loc_C976

bra_C96E:
C - - - - - 0x00497E 01:C96E: A9 C9     LDA #>tbl_C932_sprite_little_hood_swim_2
C - - - - - 0x004980 01:C970: 85 46     STA ram_0046
C - - - - - 0x004982 01:C972: A9 32     LDA #<tbl_C932_sprite_little_hood_swim_2
C - - - - - 0x004984 01:C974: 85 45     STA ram_0045

loc_C976:
C D 2 - - - 0x004986 01:C976: 20 CE C0  JSR sub_C0CE
C - - - - - 0x004989 01:C979: 60        RTS

sub_C97A:
C - - - - - 0x00498A 01:C97A: A5 9A     LDA ram_009A
C - - - - - 0x00498C 01:C97C: 29 0F     AND #$0F
C - - - - - 0x00498E 01:C97E: D0 03     BNE bra_C983
C - - - - - 0x004990 01:C980: 20 17 CA  JSR sub_CA17

bra_C983:
C - - - - - 0x004993 01:C983: A2 70     LDX #$70

bra_C985:
C - - - - - 0x004995 01:C985: BD 00 02  LDA ram_0200,X
C - - - - - 0x004998 01:C988: C9 F1     CMP #$F1
C - - - - - 0x00499A 01:C98A: B0 38     BCS bra_C9C4
C - - - - - 0x00499C 01:C98C: BD 03 02  LDA ram_0203,X
C - - - - - 0x00499F 01:C98F: C9 F1     CMP #$F1
C - - - - - 0x0049A1 01:C991: B0 31     BCS bra_C9C4
C - - - - - 0x0049A3 01:C993: DE 03 02  DEC ram_0203,X
C - - - - - 0x0049A6 01:C996: DE 07 02  DEC ram_0207,X
C - - - - - 0x0049A9 01:C999: DE 0B 02  DEC ram_020B,X
C - - - - - 0x0049AC 01:C99C: DE 0F 02  DEC ram_020F,X
C - - - - - 0x0049AF 01:C99F: AD 52 06  LDA ram_0652
C - - - - - 0x0049B2 01:C9A2: 29 01     AND #$01
C - - - - - 0x0049B4 01:C9A4: F0 0F     BEQ bra_C9B5
C - - - - - 0x0049B6 01:C9A6: DE 00 02  DEC ram_0200,X
C - - - - - 0x0049B9 01:C9A9: DE 04 02  DEC ram_0204,X
C - - - - - 0x0049BC 01:C9AC: DE 08 02  DEC ram_0208,X
C - - - - - 0x0049BF 01:C9AF: DE 0C 02  DEC ram_020C,X
C - - - - - 0x0049C2 01:C9B2: 4C D1 C9  JMP loc_C9D1

bra_C9B5:
C - - - - - 0x0049C5 01:C9B5: FE 00 02  INC ram_0200,X
C - - - - - 0x0049C8 01:C9B8: FE 04 02  INC ram_0204,X
C - - - - - 0x0049CB 01:C9BB: FE 08 02  INC ram_0208,X
C - - - - - 0x0049CE 01:C9BE: FE 0C 02  INC ram_020C,X
C - - - - - 0x0049D1 01:C9C1: 4C D1 C9  JMP loc_C9D1

bra_C9C4:
C - - - - - 0x0049D4 01:C9C4: 20 53 A8  JSR sub_A853

loc_C9C7:
C D 2 - - - 0x0049D7 01:C9C7: 8A        TXA
C - - - - - 0x0049D8 01:C9C8: 18        CLC
C - - - - - 0x0049D9 01:C9C9: 69 10     ADC #$10
C - - - - - 0x0049DB 01:C9CB: AA        TAX
C - - - - - 0x0049DC 01:C9CC: C9 E0     CMP #$E0
C - - - - - 0x0049DE 01:C9CE: 90 B5     BCC bra_C985
C - - - - - 0x0049E0 01:C9D0: 60        RTS

loc_C9D1:
C D 2 - - - 0x0049E1 01:C9D1: A5 7B     LDA ram_007B
C - - - - - 0x0049E3 01:C9D3: 29 0F     AND #$0F
C - - - - - 0x0049E5 01:C9D5: C9 08     CMP #$08
C - - - - - 0x0049E7 01:C9D7: 90 1B     BCC bra_C9F4
C - - - - - 0x0049E9 01:C9D9: AD 0F CA  LDA tbl_CA0F_sprite_fish_swim_1   ; top_left
C - - - - - 0x0049EC 01:C9DC: 9D 01 02  STA ram_0201,X
C - - - - - 0x0049EF 01:C9DF: AD 10 CA  LDA tbl_CA0F_sprite_fish_swim_1+1 ; top_right
C - - - - - 0x0049F2 01:C9E2: 9D 05 02  STA ram_0205,X
C - - - - - 0x0049F5 01:C9E5: AD 11 CA  LDA tbl_CA0F_sprite_fish_swim_1+2 ; bottom_left
C - - - - - 0x0049F8 01:C9E8: 9D 09 02  STA ram_0209,X
C - - - - - 0x0049FB 01:C9EB: AD 12 CA  LDA tbl_CA0F_sprite_fish_swim_1+3 ; bottom_right
C - - - - - 0x0049FE 01:C9EE: 9D 0D 02  STA ram_020D,X
C - - - - - 0x004A01 01:C9F1: 4C C7 C9  JMP loc_C9C7

bra_C9F4:
C - - - - - 0x004A04 01:C9F4: AD 13 CA  LDA tbl_CA13_sprite_fish_swim_2   ; top_left
C - - - - - 0x004A07 01:C9F7: 9D 01 02  STA ram_0201,X
C - - - - - 0x004A0A 01:C9FA: AD 14 CA  LDA tbl_CA13_sprite_fish_swim_2+1 ; top_right
C - - - - - 0x004A0D 01:C9FD: 9D 05 02  STA ram_0205,X
C - - - - - 0x004A10 01:CA00: AD 15 CA  LDA tbl_CA13_sprite_fish_swim_2+2 ; bottom_left
C - - - - - 0x004A13 01:CA03: 9D 09 02  STA ram_0209,X
C - - - - - 0x004A16 01:CA06: AD 16 CA  LDA tbl_CA13_sprite_fish_swim_2+3 ; bottom_right
C - - - - - 0x004A19 01:CA09: 9D 0D 02  STA ram_020D,X
C - - - - - 0x004A1C 01:CA0C: 4C C7 C9  JMP loc_C9C7

tbl_CA0F_sprite_fish_swim_1:
- D 2 - - - 0x004A1F 01:CA0F: 49        .byte $49,$61,$4E,$52 ; 

tbl_CA13_sprite_fish_swim_2:
- D 2 - - - 0x004A23 01:CA13: 49        .byte $49,$4A,$4E,$4D ; 

sub_CA17:
C - - - - - 0x004A27 01:CA17: A0 70     LDY #$70

bra_CA19:
C - - - - - 0x004A29 01:CA19: B9 00 02  LDA ram_0200,Y
C - - - - - 0x004A2C 01:CA1C: C9 F0     CMP #$F0
C - - - - - 0x004A2E 01:CA1E: B0 0B     BCS bra_CA2B
C - - - - - 0x004A30 01:CA20: 98        TYA
C - - - - - 0x004A31 01:CA21: 18        CLC
C - - - - - 0x004A32 01:CA22: 69 10     ADC #$10
C - - - - - 0x004A34 01:CA24: A8        TAY
C - - - - - 0x004A35 01:CA25: C9 E0     CMP #$E0
C - - - - - 0x004A37 01:CA27: B0 4C     BCS bra_CA75_RTS
C - - - - - 0x004A39 01:CA29: 90 EE     BCC bra_CA19

bra_CA2B:
C - - - - - 0x004A3B 01:CA2B: AD 51 06  LDA ram_0651
C - - - - - 0x004A3E 01:CA2E: 29 01     AND #$01
C - - - - - 0x004A40 01:CA30: F0 04     BEQ bra_CA36
C - - - - - 0x004A42 01:CA32: A9 01     LDA #$01
C - - - - - 0x004A44 01:CA34: D0 02     BNE bra_CA38

bra_CA36:
C - - - - - 0x004A46 01:CA36: A9 00     LDA #$00

bra_CA38:
C - - - - - 0x004A48 01:CA38: 99 02 02  STA ram_0202,Y
C - - - - - 0x004A4B 01:CA3B: 99 06 02  STA ram_0206,Y
C - - - - - 0x004A4E 01:CA3E: 99 0A 02  STA ram_020A,Y
C - - - - - 0x004A51 01:CA41: 99 0E 02  STA ram_020E,Y
C - - - - - 0x004A54 01:CA44: A5 80     LDA ram_0080
C - - - - - 0x004A56 01:CA46: 29 03     AND #$03
C - - - - - 0x004A58 01:CA48: AA        TAX
C - - - - - 0x004A59 01:CA49: BD 51 06  LDA ram_0651,X
C - - - - - 0x004A5C 01:CA4C: 29 F0     AND #$F0
C - - - - - 0x004A5E 01:CA4E: C9 E0     CMP #$E0
C - - - - - 0x004A60 01:CA50: B0 23     BCS bra_CA75_RTS
C - - - - - 0x004A62 01:CA52: C9 20     CMP #$20
C - - - - - 0x004A64 01:CA54: 90 1F     BCC bra_CA75_RTS
C - - - - - 0x004A66 01:CA56: 99 00 02  STA ram_0200,Y
C - - - - - 0x004A69 01:CA59: 99 04 02  STA ram_0204,Y
C - - - - - 0x004A6C 01:CA5C: 18        CLC
C - - - - - 0x004A6D 01:CA5D: 69 08     ADC #$08
C - - - - - 0x004A6F 01:CA5F: 99 08 02  STA ram_0208,Y
C - - - - - 0x004A72 01:CA62: 99 0C 02  STA ram_020C,Y
C - - - - - 0x004A75 01:CA65: A9 F0     LDA #$F0
C - - - - - 0x004A77 01:CA67: 99 03 02  STA ram_0203,Y
C - - - - - 0x004A7A 01:CA6A: 99 0B 02  STA ram_020B,Y
C - - - - - 0x004A7D 01:CA6D: A9 F8     LDA #$F8
C - - - - - 0x004A7F 01:CA6F: 99 07 02  STA ram_0207,Y
C - - - - - 0x004A82 01:CA72: 99 0F 02  STA ram_020F,Y

bra_CA75_RTS:
C - - - - - 0x004A85 01:CA75: 60        RTS

sub_CA76:
C - - - - - 0x004A86 01:CA76: A2 06     LDX #$06
C - - - - - 0x004A88 01:CA78: A0 00     LDY #$00

bra_CA7A:
C - - - - - 0x004A8A 01:CA7A: B9 70 02  LDA ram_0270,Y
C - - - - - 0x004A8D 01:CA7D: 85 4D     STA ram_004D
C - - - - - 0x004A8F 01:CA7F: B9 73 02  LDA ram_0273,Y
C - - - - - 0x004A92 01:CA82: 85 4E     STA ram_004E
C - - - - - 0x004A94 01:CA84: 20 55 96  JSR sub_9655
C - - - - - 0x004A97 01:CA87: A5 81     LDA ram_0081
C - - - - - 0x004A99 01:CA89: D0 08     BNE bra_CA93_RTS
C - - - - - 0x004A9B 01:CA8B: 98        TYA
C - - - - - 0x004A9C 01:CA8C: 18        CLC
C - - - - - 0x004A9D 01:CA8D: 69 10     ADC #$10
C - - - - - 0x004A9F 01:CA8F: A8        TAY
C - - - - - 0x004AA0 01:CA90: CA        DEX
C - - - - - 0x004AA1 01:CA91: D0 E7     BNE bra_CA7A

bra_CA93_RTS:
C - - - - - 0x004AA3 01:CA93: 60        RTS

sub_CA94:
C - - - - - 0x004AA4 01:CA94: AD 49 03  LDA ram_0349
C - - - - - 0x004AA7 01:CA97: D0 13     BNE bra_CAAC
C - - - - - 0x004AA9 01:CA99: A5 16     LDA ram_0016
C - - - - - 0x004AAB 01:CA9B: D0 12     BNE bra_CAAF
C - - - - - 0x004AAD 01:CA9D: AD 47 03  LDA ram_0347
C - - - - - 0x004AB0 01:CAA0: D0 0D     BNE bra_CAAF
C - - - - - 0x004AB2 01:CAA2: A0 E0     LDY #$E0
C - - - - - 0x004AB4 01:CAA4: A9 01     LDA #$01
C - - - - - 0x004AB6 01:CAA6: 8D 47 03  STA ram_0347
C - - - - - 0x004AB9 01:CAA9: 20 2E CB  JSR sub_CB2E

bra_CAAC:
C - - - - - 0x004ABC 01:CAAC: 4C C2 CA  JMP loc_CAC2

bra_CAAF:
C - - - - - 0x004ABF 01:CAAF: C9 FF     CMP #$FF
C - - - - - 0x004AC1 01:CAB1: D0 0F     BNE bra_CAC2
C - - - - - 0x004AC3 01:CAB3: AD 48 03  LDA ram_0348
C - - - - - 0x004AC6 01:CAB6: D0 0A     BNE bra_CAC2
C - - - - - 0x004AC8 01:CAB8: A0 F0     LDY #$F0
C - - - - - 0x004ACA 01:CABA: A9 01     LDA #$01
C - - - - - 0x004ACC 01:CABC: 8D 48 03  STA ram_0348
C - - - - - 0x004ACF 01:CABF: 20 2E CB  JSR sub_CB2E

bra_CAC2:
loc_CAC2:
C D 2 - - - 0x004AD2 01:CAC2: 20 3D CB  JSR sub_CB3D
C - - - - - 0x004AD5 01:CAC5: A0 00     LDY #$00
C - - - - - 0x004AD7 01:CAC7: 20 CC CA  JSR sub_CACC
C - - - - - 0x004ADA 01:CACA: A0 10     LDY #$10

sub_CACC:
C - - - - - 0x004ADC 01:CACC: B9 EC 02  LDA ram_02EC,Y
C - - - - - 0x004ADF 01:CACF: 85 4D     STA ram_004D
C - - - - - 0x004AE1 01:CAD1: B9 EF 02  LDA ram_02EF,Y
C - - - - - 0x004AE4 01:CAD4: 85 4E     STA ram_004E
C - - - - - 0x004AE6 01:CAD6: A9 0C     LDA #$0C
C - - - - - 0x004AE8 01:CAD8: 85 0E     STA ram_000E
C - - - - - 0x004AEA 01:CADA: 20 27 A4  JSR sub_A427
C - - - - - 0x004AED 01:CADD: 90 3E     BCC bra_CB1D_RTS
C - - - - - 0x004AEF 01:CADF: C0 00     CPY #$00
C - - - - - 0x004AF1 01:CAE1: D0 09     BNE bra_CAEC
C - - - - - 0x004AF3 01:CAE3: A9 FF     LDA #$FF
C - - - - - 0x004AF5 01:CAE5: 8D 47 03  STA ram_0347
C - - - - - 0x004AF8 01:CAE8: A2 00     LDX #$00
C - - - - - 0x004AFA 01:CAEA: F0 07     BEQ bra_CAF3_spr_collected_pearl

bra_CAEC:
C - - - - - 0x004AFC 01:CAEC: A9 FF     LDA #$FF
C - - - - - 0x004AFE 01:CAEE: 8D 48 03  STA ram_0348
C - - - - - 0x004B01 01:CAF1: A2 10     LDX #$10

bra_CAF3_spr_collected_pearl:
C - - - - - 0x004B03 01:CAF3: A9 00     LDA #$00
C - - - - - 0x004B05 01:CAF5: 85 9A     STA ram_009A
C - - - - - 0x004B07 01:CAF7: A9 BC     LDA #$BC				; spr_collected_pearl_top_left
C - - - - - 0x004B09 01:CAF9: 9D E1 02  STA ram_02E1,X
C - - - - - 0x004B0C 01:CAFC: A9 7E     LDA #$7E				; spr_collected_pearl_top_right
C - - - - - 0x004B0E 01:CAFE: 9D E5 02  STA ram_02E5,X
C - - - - - 0x004B11 01:CB01: A9 97     LDA #$97				; spr_collected_pearl_bottom_left
C - - - - - 0x004B13 01:CB03: 9D E9 02  STA ram_02E9,X
C - - - - - 0x004B16 01:CB06: A9 98     LDA #$98				; spr_collected_pearl_bottom_right
C - - - - - 0x004B18 01:CB08: 9D ED 02  STA ram_02ED,X
C - - - - - 0x004B1B 01:CB0B: AD 47 03  LDA ram_0347
C - - - - - 0x004B1E 01:CB0E: 10 0D     BPL bra_CB1D_RTS
C - - - - - 0x004B20 01:CB10: AD 48 03  LDA ram_0348
C - - - - - 0x004B23 01:CB13: 10 08     BPL bra_CB1D_RTS
C - - - - - 0x004B25 01:CB15: 8D 49 03  STA ram_0349
C - - - - - 0x004B28 01:CB18: A9 01     LDA #$01
C - - - - - 0x004B2A 01:CB1A: 8D 2C 06  STA ram_062C

bra_CB1D_RTS:
C - - - - - 0x004B2D 01:CB1D: 60        RTS

; In world 5 there are two pearls to collect
; but both shells spawn in the exactly same spot
; Spr structure: Y axis, Tile, Palette, X Axis
tbl_CB1E_spr_shell_initial_load:
@start:
- D 2 - - - 0x004B2E 01:CB1E: B0        .byte $B0, $C0, $02, $E0 ; spr_shell_move_02_top_left
- D 2 - - - 0x004B32 01:CB22: B0        .byte $B0, $BF, $02, $E8 ; spr_shell_move_02_top_right
- D 2 - - - 0x004B36 01:CB26: B8        .byte $B8, $C2, $02, $E0 ; spr_shell_move_02_bottom_left
- D 2 - - - 0x004B3A 01:CB2A: B8        .byte $B8, $C1, $02, $E8 ; spr_shell_move_02_bottom_right
@end:
var_CB1E = @end - @start

sub_CB2E:
C - - - - - 0x004B3E 01:CB2E: A2 00     LDX #$00

bra_CB30:
C - - - - - 0x004B40 01:CB30: BD 1E CB  LDA tbl_CB1E_spr_shell_initial_load,X
C - - - - - 0x004B43 01:CB33: 99 00 02  STA ram_0200,Y
C - - - - - 0x004B46 01:CB36: E8        INX
C - - - - - 0x004B47 01:CB37: C8        INY
C - - - - - 0x004B48 01:CB38: E0 10     CPX #var_CB1E
C - - - - - 0x004B4A 01:CB3A: 90 F4     BCC bra_CB30
C - - - - - 0x004B4C 01:CB3C: 60        RTS

sub_CB3D:
C - - - - - 0x004B4D 01:CB3D: AD 47 03  LDA ram_0347
C - - - - - 0x004B50 01:CB40: F0 13     BEQ bra_CB55
C - - - - - 0x004B52 01:CB42: 30 11     BMI bra_CB55
C - - - - - 0x004B54 01:CB44: AD E3 02  LDA ram_02E3
C - - - - - 0x004B57 01:CB47: C9 F1     CMP #$F1
C - - - - - 0x004B59 01:CB49: 90 0A     BCC bra_CB55
- - - - - - 0x004B5B 01:CB4B: A9 00     LDA #$00
- - - - - - 0x004B5D 01:CB4D: 8D 47 03  STA ram_0347
- - - - - - 0x004B60 01:CB50: A2 E0     LDX #$E0
- - - - - - 0x004B62 01:CB52: 20 53 A8  JSR sub_A853

bra_CB55:
C - - - - - 0x004B65 01:CB55: AD 48 03  LDA ram_0348
C - - - - - 0x004B68 01:CB58: F0 13     BEQ bra_CB6D
C - - - - - 0x004B6A 01:CB5A: 30 11     BMI bra_CB6D
C - - - - - 0x004B6C 01:CB5C: AD F3 02  LDA ram_02F3
C - - - - - 0x004B6F 01:CB5F: C9 F1     CMP #$F1
C - - - - - 0x004B71 01:CB61: 90 0A     BCC bra_CB6D
- - - - - - 0x004B73 01:CB63: A9 00     LDA #$00
- - - - - - 0x004B75 01:CB65: 8D 48 03  STA ram_0348
- - - - - - 0x004B78 01:CB68: A2 F0     LDX #$F0
- - - - - - 0x004B7A 01:CB6A: 20 53 A8  JSR sub_A853

bra_CB6D:
C - - - - - 0x004B7D 01:CB6D: AD 47 03  LDA ram_0347
C - - - - - 0x004B80 01:CB70: 30 08     BMI bra_CB7A
C - - - - - 0x004B82 01:CB72: A2 E0     LDX #$E0
C - - - - - 0x004B84 01:CB74: 20 8C CB  JSR sub_CB8C
C - - - - - 0x004B87 01:CB77: 4C 85 CB  JMP loc_CB85

bra_CB7A:
C - - - - - 0x004B8A 01:CB7A: A5 9A     LDA ram_009A
C - - - - - 0x004B8C 01:CB7C: C9 80     CMP #$80
C - - - - - 0x004B8E 01:CB7E: 90 05     BCC bra_CB85
C - - - - - 0x004B90 01:CB80: A2 E0     LDX #$E0
C - - - - - 0x004B92 01:CB82: 20 53 A8  JSR sub_A853

bra_CB85:
loc_CB85:
C D 2 - - - 0x004B95 01:CB85: AD 48 03  LDA ram_0348
C - - - - - 0x004B98 01:CB88: 30 21     BMI bra_CBAB
C - - - - - 0x004B9A 01:CB8A: A2 F0     LDX #$F0

sub_CB8C:
C - - - - - 0x004B9C 01:CB8C: A5 9A     LDA ram_009A
C - - - - - 0x004B9E 01:CB8E: 29 0F     AND #$0F
C - - - - - 0x004BA0 01:CB90: C9 08     CMP #$08
C - - - - - 0x004BA2 01:CB92: 90 02     BCC bra_CB96_spr_shell_move_02
C - - - - - 0x004BA4 01:CB94: B0 21     BCS bra_CBB7_spr_shell_move_01

; Shell open sprite
bra_CB96_spr_shell_move_02:
C - - - - - 0x004BA6 01:CB96: A9 C0     LDA #$C0				; spr_shell_move_02_top_left
C - - - - - 0x004BA8 01:CB98: 9D 01 02  STA ram_0201,X
C - - - - - 0x004BAB 01:CB9B: A9 BF     LDA #$BF				; spr_shell_move_02_top_right
C - - - - - 0x004BAD 01:CB9D: 9D 05 02  STA ram_0205,X
C - - - - - 0x004BB0 01:CBA0: A9 C2     LDA #$C2				; spr_shell_move_02_bottom_left
C - - - - - 0x004BB2 01:CBA2: 9D 09 02  STA ram_0209,X
C - - - - - 0x004BB5 01:CBA5: A9 C1     LDA #$C1				; spr_shell_move_02_bottom_right
C - - - - - 0x004BB7 01:CBA7: 9D 0D 02  STA ram_020D,X
C - - - - - 0x004BBA 01:CBAA: 60        RTS

bra_CBAB:
C - - - - - 0x004BBB 01:CBAB: A5 9A     LDA ram_009A
C - - - - - 0x004BBD 01:CBAD: C9 80     CMP #$80
C - - - - - 0x004BBF 01:CBAF: 90 05     BCC bra_CBB6_RTS
C - - - - - 0x004BC1 01:CBB1: A2 F0     LDX #$F0
C - - - - - 0x004BC3 01:CBB3: 20 53 A8  JSR sub_A853

bra_CBB6_RTS:
C - - - - - 0x004BC6 01:CBB6: 60        RTS

; Shell close sprite
bra_CBB7_spr_shell_move_01:
C - - - - - 0x004BC7 01:CBB7: A9 FF     LDA #$FF				; spr_shell_move_01_top_left
C - - - - - 0x004BC9 01:CBB9: 9D 01 02  STA ram_0201,X
C - - - - - 0x004BCC 01:CBBC: A9 FF     LDA #$FF				; spr_shell_move_01_top_right
C - - - - - 0x004BCE 01:CBBE: 9D 05 02  STA ram_0205,X
C - - - - - 0x004BD1 01:CBC1: A9 BD     LDA #$BD				; spr_shell_move_01_bottom_left
C - - - - - 0x004BD3 01:CBC3: 9D 09 02  STA ram_0209,X	
C - - - - - 0x004BD6 01:CBC6: A9 BE     LDA #$BE				; spr_shell_move_01_bottom_right
C - - - - - 0x004BD8 01:CBC8: 9D 0D 02  STA ram_020D,X
C - - - - - 0x004BDB 01:CBCB: 60        RTS

tbl_CBCC:
- - - - - - 0x004BDC 01:CBCC: FF        .byte $FF,$FF,$FF,$FF   ; Unused

tbl_CBD0_stages_palettes_table:
- D 2 - - - 0x004BE0 01:CBD0: 12 CC     .word tbl_CC12_start_screen_palette
- D 2 - - - 0x004BE2 01:CBD2: 14 CC     .word tbl_CC14_stage_01_palettes
- D 2 - - - 0x004BE4 01:CBD4: 1E CC     .word tbl_CC1E_stage_02_palettes
- D 2 - - - 0x004BE6 01:CBD6: 28 CC     .word tbl_CC28_stage_03_palettes
- D 2 - - - 0x004BE8 01:CBD8: 32 CC     .word tbl_CC32_stage_04_palettes
- D 2 - - - 0x004BEA 01:CBDA: 3C CC     .word tbl_CC3C_stage_05_palettes
- D 2 - - - 0x004BEC 01:CBDC: 40 CC     .word tbl_CC40_stage_06_palettes
- D 2 - - - 0x004BEE 01:CBDE: 4A CC     .word tbl_CC4A_stage_07_palettes
- D 2 - - - 0x004BF0 01:CBE0: 54 CC     .word tbl_CC54_stage_08_palettes
- D 2 - - - 0x004BF2 01:CBE2: 5E CC     .word tbl_CC5E_stage_09_palettes
- D 2 - - - 0x004BF4 01:CBE4: 68 CC     .word tbl_CC68_stage_0A_palettes

tbl_CBE6_stages_tilemaps_attributes_table:
- D 2 - - - 0x004BF6 01:CBE6: 72 CC     .word tbl_CC72_start_screen_tilemap_attributes
- D 2 - - - 0x004BF8 01:CBE8: 74 CC     .word tbl_CC74_stage_01_tilemaps_attributes
- D 2 - - - 0x004BFA 01:CBEA: 7E CC     .word tbl_CC7E_stage_02_tilemaps_attributes
- D 2 - - - 0x004BFC 01:CBEC: 88 CC     .word tbl_CC88_stage_03_tilemaps_attributes
- D 2 - - - 0x004BFE 01:CBEE: 92 CC     .word tbl_CC92_stage_04_tilemaps_attributes
- D 2 - - - 0x004C00 01:CBF0: 9C CC     .word tbl_CC9C_stage_05_tilemaps_attributes
- D 2 - - - 0x004C02 01:CBF2: A0 CC     .word tbl_CCA0_stage_06_tilemaps_attributes
- D 2 - - - 0x004C04 01:CBF4: AA CC     .word tbl_CCAA_stage_07_tilemaps_attributes
- D 2 - - - 0x004C06 01:CBF6: B4 CC     .word tbl_CCB4_stage_08_tilemaps_attributes
- D 2 - - - 0x004C08 01:CBF8: BE CC     .word tbl_CCBE_stage_09_tilemaps_attributes
- D 2 - - - 0x004C0A 01:CBFA: C8 CC     .word tbl_CCC8_stage_0A_tilemaps_attributes

tbl_CBFC_stages_tilemaps_table:
- D 2 - - - 0x004C0C 01:CBFC: D2 CC     .word tbl_CCD2_start_screen_tilemap
- D 2 - - - 0x004C0E 01:CBFE: D4 CC     .word tbl_CCD4_stage_01_tilemaps
- D 2 - - - 0x004C10 01:CC00: DE CC     .word tbl_CCDE_stage_02_tilemaps
- D 2 - - - 0x004C12 01:CC02: E8 CC     .word tbl_CCE8_stage_03_tilemaps
- D 2 - - - 0x004C14 01:CC04: F2 CC     .word tbl_CCF2_stage_04_tilemaps
- D 2 - - - 0x004C16 01:CC06: FC CC     .word tbl_CCFC_stage_05_tilemaps
- D 2 - - - 0x004C18 01:CC08: 00 CD     .word tbl_CD00_stage_06_tilemaps
- D 2 - - - 0x004C1A 01:CC0A: 0A CD     .word tbl_CD0A_stage_07_tilemaps
- D 2 - - - 0x004C1C 01:CC0C: 14 CD     .word tbl_CD14_stage_08_tilemaps
- D 2 - - - 0x004C1E 01:CC0E: 1E CD     .word tbl_CD1E_stage_09_tilemaps
- D 2 - - - 0x004C20 01:CC10: 28 CD     .word tbl_CD28_stage_0A_tilemaps

tbl_CC12_start_screen_palette:
- D 2 - I - 0x004C22 01:CC12: 32 CD     .word tbl_CD32_start_screen_palette

tbl_CC14_stage_01_palettes:
- D 2 - I - 0x004C24 01:CC14: 82 CD     .word tbl_CD82_stage_01_palette
- D 2 - I - 0x004C26 01:CC16: 82 CD     .word tbl_CD82_stage_01_palette
- D 2 - I - 0x004C28 01:CC18: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C2A 01:CC1A: 12 CE     .word tbl_CE12_stage_01_sub_palette
- D 2 - I - 0x004C2C 01:CC1C: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC1E_stage_02_palettes:
- D 2 - I - 0x004C2E 01:CC1E: 92 CD     .word tbl_CD92_stage_02_palette
- D 2 - I - 0x004C30 01:CC20: 92 CD     .word tbl_CD92_stage_02_palette
- D 2 - I - 0x004C32 01:CC22: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C34 01:CC24: 22 CE     .word tbl_CE22_stage_02_sub_palette
- D 2 - I - 0x004C36 01:CC26: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC28_stage_03_palettes:
- D 2 - I - 0x004C38 01:CC28: 72 CD     .word tbl_CD72_stage_03_palette
- D 2 - I - 0x004C3A 01:CC2A: 72 CD     .word tbl_CD72_stage_03_palette
- D 2 - I - 0x004C3C 01:CC2C: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C3E 01:CC2E: 32 CE     .word tbl_CE32_stage_03_sub_palette
- D 2 - I - 0x004C40 01:CC30: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC32_stage_04_palettes:
- D 2 - I - 0x004C42 01:CC32: A2 CD     .word tbl_CDA2_stage_04_palette
- D 2 - I - 0x004C44 01:CC34: A2 CD     .word tbl_CDA2_stage_04_palette
- D 2 - I - 0x004C46 01:CC36: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C48 01:CC38: 82 CE     .word tbl_CE82_stage_04_sub_palette
- - - - - - 0x004C4A 01:CC3A: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC3C_stage_05_palettes:
- D 2 - I - 0x004C4C 01:CC3C: B2 CD     .word tbl_CDB2_stage_05_palette
- D 2 - I - 0x004C4E 01:CC3E: B2 CD     .word tbl_CDB2_stage_05_palette

tbl_CC40_stage_06_palettes:
- D 2 - I - 0x004C50 01:CC40: C2 CD     .word tbl_CDC2_stage_06_palette
- D 2 - I - 0x004C52 01:CC42: C2 CD     .word tbl_CDC2_stage_06_palette
- D 2 - I - 0x004C54 01:CC44: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C56 01:CC46: 42 CE     .word tbl_CE42_stage_06_sub_palette
- D 2 - I - 0x004C58 01:CC48: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC4A_stage_07_palettes:
- D 2 - I - 0x004C5A 01:CC4A: D2 CD     .word tbl_CDD2_stage_07_palette
- D 2 - I - 0x004C5C 01:CC4C: D2 CD     .word tbl_CDD2_stage_07_palette
- D 2 - I - 0x004C5E 01:CC4E: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C60 01:CC50: 52 CE     .word tbl_CE52_stage_07_sub_palette
- - - - - - 0x004C62 01:CC52: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC54_stage_08_palettes:
- D 2 - I - 0x004C64 01:CC54: E2 CD     .word tbl_CDE2_stage_08_palette
- D 2 - I - 0x004C66 01:CC56: E2 CD     .word tbl_CDE2_stage_08_palette
- D 2 - I - 0x004C68 01:CC58: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C6A 01:CC5A: 62 CE     .word tbl_CE62_stage_08_sub_palette
- D 2 - I - 0x004C6C 01:CC5C: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC5E_stage_09_palettes:
- D 2 - I - 0x004C6E 01:CC5E: F2 CD     .word tbl_CDF2_stage_09_palette
- D 2 - I - 0x004C70 01:CC60: F2 CD     .word tbl_CDF2_stage_09_palette
- - - - - - 0x004C72 01:CC62: 42 CD     .word tbl_CD42_shop_palette
- - - - - - 0x004C74 01:CC64: 72 CE     .word tbl_CE72_stage_09_sub_palette
- - - - - - 0x004C76 01:CC66: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC68_stage_0A_palettes:
- D 2 - I - 0x004C78 01:CC68: 02 CE     .word tbl_CE02_stage_0A_palette
- D 2 - I - 0x004C7A 01:CC6A: 02 CE     .word tbl_CE02_stage_0A_palette
- D 2 - I - 0x004C7C 01:CC6C: 42 CD     .word tbl_CD42_shop_palette
- D 2 - I - 0x004C7E 01:CC6E: 72 CE     .word tbl_CE72_stage_09_sub_palette
- D 2 - I - 0x004C80 01:CC70: 52 CD     .word tbl_CD52_sky_bonus_palette

tbl_CC72_start_screen_tilemap_attributes:
- D 2 - I - 0x004C82 01:CC72: A3 F2     .word tbl_F2A3_start_screen_tilemap_attributes

tbl_CC74_stage_01_tilemaps_attributes:
- D 2 - I - 0x004C84 01:CC74: 23 F3     .word tbl_F323_stage_01_a_tilemap_attributes
- D 2 - I - 0x004C86 01:CC76: 63 F3     .word tbl_F363_stage_01_b_tilemap_attributes
- D 2 - I - 0x004C88 01:CC78: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004C8A 01:CC7A: E3 ED     .word tbl_EDE3_stage_01_sub_tilemap_attributes
- D 2 - I - 0x004C8C 01:CC7C: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CC7E_stage_02_tilemaps_attributes:
- D 2 - I - 0x004C8E 01:CC7E: A3 F3     .word tbl_F3A3_stage_02_a_tilemap_attributes
- D 2 - I - 0x004C90 01:CC80: E3 F3     .word tbl_F3E3_stage_02_b_tilemap_attributes
- D 2 - I - 0x004C92 01:CC82: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004C94 01:CC84: 23 EE     .word tbl_EE23_stage_02_sub_tilemap_attributes
- D 2 - I - 0x004C96 01:CC86: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CC88_stage_03_tilemaps_attributes:
- D 2 - I - 0x004C98 01:CC88: 23 F4     .word tbl_F423_stage_03_a_tilemap_attributes
- D 2 - I - 0x004C9A 01:CC8A: 63 F4     .word tbl_F463_stage_03_b_tilemap_attributes
- D 2 - I - 0x004C9C 01:CC8C: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004C9E 01:CC8E: 63 EE     .word tbl_EE63_stage_03_sub_tilemap_attributes
- D 2 - I - 0x004CA0 01:CC90: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CC92_stage_04_tilemaps_attributes:
- D 2 - I - 0x004CA2 01:CC92: A3 F4     .word tbl_F4A3_stage_04_a_tilemap_attributes
- D 2 - I - 0x004CA4 01:CC94: E3 F4     .word tbl_F4E3_stage_04_b_tilemap_attributes
- D 2 - I - 0x004CA6 01:CC96: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004CA8 01:CC98: E3 EF     .word tbl_EFE3_stage_04_sub_tilemap_attributes
- - - - - - 0x004CAA 01:CC9A: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CC9C_stage_05_tilemaps_attributes:
- D 2 - I - 0x004CAC 01:CC9C: 23 F5     .word tbl_F523_stage_05_a_tilemap_attributes
- D 2 - I - 0x004CAE 01:CC9E: 63 F5     .word tbl_F563_stage_05_b_tilemap_attributes

tbl_CCA0_stage_06_tilemaps_attributes:
- D 2 - I - 0x004CB0 01:CCA0: A3 F5     .word tbl_F5A3_stage_06_a_tilemap_attributes
- D 2 - I - 0x004CB2 01:CCA2: E3 F5     .word tbl_F5E3_stage_06_b_tilemap_attributes
- D 2 - I - 0x004CB4 01:CCA4: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004CB6 01:CCA6: A3 EE     .word tbl_EEA3_stage_06_sub_tilemap_attributes
- D 2 - I - 0x004CB8 01:CCA8: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CCAA_stage_07_tilemaps_attributes:
- D 2 - I - 0x004CBA 01:CCAA: 23 F0     .word tbl_F023_stage_07_a_tilemap_attributes
- D 2 - I - 0x004CBC 01:CCAC: 63 F0     .word tbl_F063_stage_07_b_tilemap_attributes
- D 2 - I - 0x004CBE 01:CCAE: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004CC0 01:CCB0: E3 EE     .word tbl_EEE3_stage_07_sub_tilemap_attributes
- - - - - - 0x004CC2 01:CCB2: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CCB4_stage_08_tilemaps_attributes:
- D 2 - I - 0x004CC4 01:CCB4: A3 F0     .word tbl_F0A3_stage_08_a_tilemap_attributes
- D 2 - I - 0x004CC6 01:CCB6: E3 F0     .word tbl_F0E3_stage_08_b_tilemap_attributes
- D 2 - I - 0x004CC8 01:CCB8: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004CCA 01:CCBA: 23 EF     .word tbl_EF23_stage_08_sub_tilemap_attributes
- D 2 - I - 0x004CCC 01:CCBC: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CCBE_stage_09_tilemaps_attributes:
- D 2 - I - 0x004CCE 01:CCBE: 23 F1     .word tbl_F123_stage_09_a_tilemap_attributes
- D 2 - I - 0x004CD0 01:CCC0: 63 F1     .word tbl_F163_stage_09_b_tilemap_attributes
- - - - - - 0x004CD2 01:CCC2: 63 F2     .word tbl_F263_shop_tilemap_attributes
- - - - - - 0x004CD4 01:CCC4: 63 EF     .word tbl_EF63_stage_09_sub_tilemap_attributes
- - - - - - 0x004CD6 01:CCC6: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CCC8_stage_0A_tilemaps_attributes:
- D 2 - I - 0x004CD8 01:CCC8: A3 F1     .word tbl_F1A3_stage_0A_a_tilemap_attributes
- D 2 - I - 0x004CDA 01:CCCA: E3 F1     .word tbl_F1E3_stage_0A_b_tilemap_attributes
- D 2 - I - 0x004CDC 01:CCCC: 63 F2     .word tbl_F263_shop_tilemap_attributes
- D 2 - I - 0x004CDE 01:CCCE: A3 EF     .word tbl_EFA3_stage_0A_sub_tilemap_attributes
- D 2 - I - 0x004CE0 01:CCD0: 23 F2     .word tbl_F223_sky_bonus_tilemap_attributes

tbl_CCD2_start_screen_tilemap:
- D 2 - I - 0x004CE2 01:CCD2: 93 E3     .word tbl_E393_start_screen_tilemap

tbl_CCD4_stage_01_tilemaps:
- D 2 - I - 0x004CE4 01:CCD4: F3 CE     .word tbl_CEF3_stage_01_a_tilemap
- D 2 - I - 0x004CE6 01:CCD6: E3 CF     .word tbl_CFE3_stage_01_b_tilemap
- D 2 - I - 0x004CE8 01:CCD8: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004CEA 01:CCDA: 73 E5     .word tbl_E573_stage_01_sub_tilemap
- D 2 - I - 0x004CEC 01:CCDC: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CCDE_stage_02_tilemaps:
- D 2 - I - 0x004CEE 01:CCDE: D3 D0     .word tbl_D0D3_stage_02_a_tilemap
- D 2 - I - 0x004CF0 01:CCE0: C3 D1     .word tbl_D1C3_stage_02_b_tilemap
- D 2 - I - 0x004CF2 01:CCE2: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004CF4 01:CCE4: 63 E6     .word tbl_E663_stage_02_sub_tilemap
- D 2 - I - 0x004CF6 01:CCE6: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CCE8_stage_03_tilemaps:
- D 2 - I - 0x004CF8 01:CCE8: B3 D2     .word tbl_D2B3_stage_03_a_tilemap
- D 2 - I - 0x004CFA 01:CCEA: A3 D3     .word tbl_D3A3_stage_03_b_tilemap
- D 2 - I - 0x004CFC 01:CCEC: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004CFE 01:CCEE: 53 E7     .word tbl_E753_stage_03_sub_tilemap
- D 2 - I - 0x004D00 01:CCF0: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CCF2_stage_04_tilemaps:
- D 2 - I - 0x004D02 01:CCF2: 93 D4     .word tbl_D493_stage_04_a_tilemap
- D 2 - I - 0x004D04 01:CCF4: 83 D5     .word tbl_D583_stage_04_b_tilemap
- D 2 - I - 0x004D06 01:CCF6: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004D08 01:CCF8: F3 EC     .word tbl_ECF3_stage_04_sub_tilemap
- - - - - - 0x004D0A 01:CCFA: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CCFC_stage_05_tilemaps:
- D 2 - I - 0x004D0C 01:CCFC: 73 D6     .word tbl_D673_stage_05_a_tilemap
- D 2 - I - 0x004D0E 01:CCFE: 63 D7     .word tbl_D763_stage_05_b_tilemap

tbl_CD00_stage_06_tilemaps:
- D 2 - I - 0x004D10 01:CD00: 53 D8     .word tbl_D853_stage_06_a_tilemap
- D 2 - I - 0x004D12 01:CD02: 43 D9     .word tbl_D943_stage_06_b_tilemap
- D 2 - I - 0x004D14 01:CD04: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004D16 01:CD06: 43 E8     .word tbl_E843_stage_06_sub_tilemap
- D 2 - I - 0x004D18 01:CD08: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CD0A_stage_07_tilemaps:
- D 2 - I - 0x004D1A 01:CD0A: 33 DA     .word tbl_DA33_stage_07_a_tilemap
- D 2 - I - 0x004D1C 01:CD0C: 23 DB     .word tbl_DB23_stage_07_b_tilemap
- D 2 - I - 0x004D1E 01:CD0E: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004D20 01:CD10: 33 E9     .word tbl_E933_stage_07_sub_tilemap
- - - - - - 0x004D22 01:CD12: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CD14_stage_08_tilemaps:
- D 2 - I - 0x004D24 01:CD14: 13 DC     .word tbl_DC13_stage_08_a_tilemap
- D 2 - I - 0x004D26 01:CD16: 03 DD     .word tbl_DD03_stage_08_b_tilemap
- D 2 - I - 0x004D28 01:CD18: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004D2A 01:CD1A: 23 EA     .word tbl_EA23_stage_08_sub_tilemap
- D 2 - I - 0x004D2C 01:CD1C: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CD1E_stage_09_tilemaps:
- D 2 - I - 0x004D2E 01:CD1E: F3 DD     .word tbl_DDF3_stage_09_a_tilemap
- D 2 - I - 0x004D30 01:CD20: E3 DE     .word tbl_DEE3_stage_09_b_tilemap
- - - - - - 0x004D32 01:CD22: A3 E2     .word tbl_E2A3_shop_tilemap
- - - - - - 0x004D34 01:CD24: 13 EB     .word tbl_EB13_stage_09_sub_tilemap
- - - - - - 0x004D36 01:CD26: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CD28_stage_0A_tilemaps:
- D 2 - I - 0x004D38 01:CD28: D3 DF     .word tbl_DFD3_stage_0A_a_tilemap
- D 2 - I - 0x004D3A 01:CD2A: C3 E0     .word tbl_E0C3_stage_0A_b_tilemap
- D 2 - I - 0x004D3C 01:CD2C: A3 E2     .word tbl_E2A3_shop_tilemap
- D 2 - I - 0x004D3E 01:CD2E: 03 EC     .word tbl_EC03_stage_0A_sub_tilemap
- D 2 - I - 0x004D40 01:CD30: B3 E1     .word tbl_E1B3_sky_bonus_tilemap

tbl_CD32_start_screen_palette:
- D 2 - I - 0x004D42 01:CD32: 2E        .byte $2E,$20,$25,$15,$2E,$2B,$2E,$3B,$2E,$00,$00,$00,$2E,$2B,$20,$25

tbl_CD42_shop_palette:
- D 2 - I - 0x004D52 01:CD42: 37        .byte $37,$2E,$18,$28,$37,$2E,$00,$18,$37,$13,$2E,$2E,$37,$2E,$00,$07

tbl_CD52_sky_bonus_palette:
- D 2 - I - 0x004D62 01:CD52: 21        .byte $21,$2E,$2A,$17,$21,$2E,$11,$20,$21,$00,$00,$00,$21,$00,$00,$00

tbl_CD62_change_level_screen_palette:
- D 2 - I - 0x004D72 01:CD62: 0C        .byte $0C,$2E,$2A,$17,$0C,$20,$20,$23,$0C,$2E,$29,$20,$2C,$00,$00,$00

tbl_CD72_stage_03_palette:
- D 2 - I - 0x004D82 01:CD72: 3D        .byte $3D,$2E,$2A,$16,$3D,$3E,$27,$2B,$3D,$2E,$17,$27,$3D,$20,$2C,$00

tbl_CD82_stage_01_palette:
- D 2 - I - 0x004D92 01:CD82: 28        .byte $28,$2E,$2A,$16,$28,$2E,$17,$37,$28,$2D,$2C,$20,$28,$00,$00,$00

tbl_CD92_stage_02_palette:
- D 2 - I - 0x004DA2 01:CD92: 0C        .byte $0C,$2E,$2A,$16,$0C,$2E,$2D,$28,$0C,$00,$2E,$2E,$0C,$00,$00,$00

tbl_CDA2_stage_04_palette:
- D 2 - I - 0x004DB2 01:CDA2: 2D        .byte $2D,$2E,$2A,$17,$2D,$2E,$2A,$2B,$2D,$2E,$27,$37,$2D,$1C,$2C,$3C

tbl_CDB2_stage_05_palette:
- D 2 - I - 0x004DC2 01:CDB2: 22        .byte $22,$2E,$29,$17,$22,$2E,$3D,$20,$22,$00,$35,$00,$22,$00,$00,$00

tbl_CDC2_stage_06_palette:
- D 2 - I - 0x004DD2 01:CDC2: 01        .byte $01,$2E,$2A,$17,$01,$2E,$20,$2B,$01,$2E,$20,$28,$01,$00,$00,$00

tbl_CDD2_stage_07_palette:
- D 2 - I - 0x004DE2 01:CDD2: 0B        .byte $0B,$2E,$1A,$17,$0B,$2E,$17,$37,$0B,$2E,$27,$17,$0B,$2E,$00,$27

tbl_CDE2_stage_08_palette:
- D 2 - I - 0x004DF2 01:CDE2: 18        .byte $18,$2E,$01,$20,$18,$2E,$21,$33,$18,$2E,$16,$37,$18,$00,$00,$00

tbl_CDF2_stage_09_palette:
- D 2 - I - 0x004E02 01:CDF2: 28        .byte $28,$2E,$1A,$17,$28,$2E,$2E,$20,$28,$2E,$2D,$10,$28,$2D,$20,$2E

tbl_CE02_stage_0A_palette:
- D 2 - I - 0x004E12 01:CE02: 10        .byte $10,$2E,$2A,$17,$10,$2E,$17,$37,$10,$2E,$27,$07,$10,$2E,$2C,$2B

tbl_CE12_stage_01_sub_palette:
- D 2 - I - 0x004E22 01:CE12: 1C        .byte $1C,$2E,$2A,$17,$1C,$2E,$30,$2D,$1C,$00,$00,$2E,$1C,$00,$00,$00

tbl_CE22_stage_02_sub_palette:
- D 2 - I - 0x004E32 01:CE22: 19        .byte $19,$2E,$2A,$17,$19,$2E,$17,$37,$19,$2E,$2D,$20,$19,$20,$2C,$1C

tbl_CE32_stage_03_sub_palette:
- D 2 - I - 0x004E42 01:CE32: 03        .byte $03,$2E,$22,$20,$03,$20,$17,$26,$03,$2E,$27,$07,$03,$2E,$20,$2B

tbl_CE42_stage_06_sub_palette:
- D 2 - I - 0x004E52 01:CE42: 39        .byte $39,$2E,$2A,$17,$39,$2E,$3D,$30,$39,$2E,$27,$37,$00,$00,$00,$00

tbl_CE52_stage_07_sub_palette:
- D 2 - I - 0x004E62 01:CE52: 39        .byte $39,$2E,$2A,$17,$39,$2E,$17,$37,$39,$2E,$13,$3C,$39,$2E,$19,$39

tbl_CE62_stage_08_sub_palette:
- D 2 - I - 0x004E72 01:CE62: 32        .byte $32,$2D,$3D,$20,$32,$2E,$2A,$26,$32,$2E,$27,$37,$00,$00,$00,$00

tbl_CE72_stage_09_sub_palette:
- D 2 - I - 0x004E82 01:CE72: 28        .byte $28,$2E,$2A,$17,$28,$2E,$27,$23,$28,$2C,$2D,$20,$28,$1C,$2C,$3C

tbl_CE82_stage_04_sub_palette:
- D 2 - I - 0x004E92 01:CE82: 36        .byte $36,$2E,$2A,$17,$36,$2E,$3D,$20,$36,$20,$2C,$1C,$36,$1C,$2C,$3C

tbl_CE92:
- D 2 - I - 0x004EA2 01:CE92: 3D        .byte $3D,$2E,$20,$24,$3D,$2E,$37,$16,$3D,$20,$28,$2D,$3D,$2E,$20,$1A

tbl_CEA2:
- D 2 - I - 0x004EB2 01:CEA2: 00        .byte $00,$2E,$36,$24,$00,$2E,$36,$25,$00,$20,$28,$2D,$00,$2E,$20,$1A

tbl_CEB2_waypoints_table:
- - - - - - 0x004EC2 01:CEB2: C8 CE     .word tbl_CEC8_start_screen_waypoint
- D 2 - - - 0x004EC4 01:CEB4: CE CE     .word tbl_CECE_stage_01_waypoints
- D 2 - - - 0x004EC6 01:CEB6: D3 CE     .word tbl_CED3_stage_02_waypoints
- D 2 - - - 0x004EC8 01:CEB8: C9 CE     .word tbl_CEC9_stage_03_waypoints
- D 2 - - - 0x004ECA 01:CEBA: D8 CE     .word tbl_CED8_stage_04_waypoints
- - - - - - 0x004ECC 01:CEBC: DB CE     .word tbl_CEDB_stage_05_waypoints
- D 2 - - - 0x004ECE 01:CEBE: DC CE     .word tbl_CEDC_stage_06_waypoints
- D 2 - - - 0x004ED0 01:CEC0: E1 CE     .word tbl_CEE1_stage_07_waypoints
- D 2 - - - 0x004ED2 01:CEC2: E6 CE     .word tbl_CEE6_stage_08_waypoints
- D 2 - - - 0x004ED4 01:CEC4: EB CE     .word tbl_CEEB_stage_09_waypoints
- D 2 - - - 0x004ED6 01:CEC6: EE CE     .word tbl_CEEE_stage_0A_waypoints

tbl_CEC8_start_screen_waypoint:
- - - - - - 0x004ED8 01:CEC8: FF        .byte $FF   ; Main_screen not have waypoint

tbl_CEC9_stage_03_waypoints:
- D 2 - I - 0x004ED9 01:CEC9: B0        .byte $B0   ; 
- D 2 - I - 0x004EDA 01:CECA: 38        .byte $38   ; 
- D 2 - I - 0x004EDB 01:CECB: B0        .byte $B0   ; 
- D 2 - I - 0x004EDC 01:CECC: 48        .byte $48   ; 
- D 2 - I - 0x004EDD 01:CECD: FF        .byte $FF   ; 

tbl_CECE_stage_01_waypoints:
- D 2 - I - 0x004EDE 01:CECE: 60        .byte $60   ; 
- D 2 - I - 0x004EDF 01:CECF: 48        .byte $48   ; 
- D 2 - I - 0x004EE0 01:CED0: 60        .byte $60   ; 
- D 2 - I - 0x004EE1 01:CED1: 48        .byte $48   ; 
- D 2 - I - 0x004EE2 01:CED2: FF        .byte $FF   ; 

tbl_CED3_stage_02_waypoints:
- D 2 - I - 0x004EE3 01:CED3: 60        .byte $60   ; 
- D 2 - I - 0x004EE4 01:CED4: 28        .byte $28   ; 
- D 2 - I - 0x004EE5 01:CED5: 90        .byte $90   ; 
- D 2 - I - 0x004EE6 01:CED6: 28        .byte $28   ; 
- D 2 - I - 0x004EE7 01:CED7: FF        .byte $FF   ; 

tbl_CED8_stage_04_waypoints:
- D 2 - I - 0x004EE8 01:CED8: 90        .byte $90   ; 
- D 2 - I - 0x004EE9 01:CED9: 28        .byte $28   ; 
- D 2 - I - 0x004EEA 01:CEDA: FF        .byte $FF   ; 

tbl_CEDB_stage_05_waypoints:
- - - - - - 0x004EEB 01:CEDB: FF        .byte $FF   ; Stage 5 not have shop

tbl_CEDC_stage_06_waypoints:
- D 2 - I - 0x004EEC 01:CEDC: 80        .byte $80   ; 
- D 2 - I - 0x004EED 01:CEDD: 18        .byte $18   ; 
- D 2 - I - 0x004EEE 01:CEDE: 40        .byte $40   ; 
- D 2 - I - 0x004EEF 01:CEDF: 18        .byte $18   ; 
- D 2 - I - 0x004EF0 01:CEE0: FF        .byte $FF   ; 

tbl_CEE1_stage_07_waypoints:
- D 2 - I - 0x004EF1 01:CEE1: C0        .byte $C0   ; 
- D 2 - I - 0x004EF2 01:CEE2: 28        .byte $28   ; 
- D 2 - I - 0x004EF3 01:CEE3: 70        .byte $70   ; 
- D 2 - I - 0x004EF4 01:CEE4: 28        .byte $28   ; 
- D 2 - I - 0x004EF5 01:CEE5: FF        .byte $FF   ; 

tbl_CEE6_stage_08_waypoints:
- D 2 - I - 0x004EF6 01:CEE6: B0        .byte $B0   ; 
- D 2 - I - 0x004EF7 01:CEE7: 18        .byte $18   ; 
- D 2 - I - 0x004EF8 01:CEE8: A8        .byte $A8   ; 
- D 2 - I - 0x004EF9 01:CEE9: 18        .byte $18   ; 
- D 2 - I - 0x004EFA 01:CEEA: FF        .byte $FF   ; 

tbl_CEEB_stage_09_waypoints:
- D 2 - I - 0x004EFB 01:CEEB: B0        .byte $B0   ; 
- D 2 - I - 0x004EFC 01:CEEC: 18        .byte $18   ; 
- D 2 - I - 0x004EFD 01:CEED: FF        .byte $FF   ; 

tbl_CEEE_stage_0A_waypoints:
- D 2 - I - 0x004EFE 01:CEEE: 60        .byte $60   ; 
- D 2 - I - 0x004EFF 01:CEEF: 28        .byte $28   ; 
- D 2 - I - 0x004F00 01:CEF0: E0        .byte $E0   ; 
- D 2 - I - 0x004F01 01:CEF1: 28        .byte $28   ; 
- D 2 - I - 0x004F02 01:CEF2: FF        .byte $FF   ; 

tbl_CEF3_stage_01_a_tilemap:
    .incbin "incbin/stages/stage_01_a.bin"

tbl_CFE3_stage_01_b_tilemap:
    .incbin "incbin/stages/stage_01_b.bin"

tbl_D0D3_stage_02_a_tilemap:
    .incbin "incbin/stages/stage_02_a.bin"

tbl_D1C3_stage_02_b_tilemap:
    .incbin "incbin/stages/stage_02_b.bin"

tbl_D2B3_stage_03_a_tilemap:
    .incbin "incbin/stages/stage_03_a.bin"

tbl_D3A3_stage_03_b_tilemap:
    .incbin "incbin/stages/stage_03_b.bin"

tbl_D493_stage_04_a_tilemap:
    .incbin "incbin/stages/stage_04_a.bin"

tbl_D583_stage_04_b_tilemap:
    .incbin "incbin/stages/stage_04_b.bin"

tbl_D673_stage_05_a_tilemap:
    .incbin "incbin/stages/stage_05_a.bin"

tbl_D763_stage_05_b_tilemap:
    .incbin "incbin/stages/stage_05_b.bin"

tbl_D853_stage_06_a_tilemap:
    .incbin "incbin/stages/stage_06_a.bin"

tbl_D943_stage_06_b_tilemap:
    .incbin "incbin/stages/stage_06_b.bin"

tbl_DA33_stage_07_a_tilemap:
    .incbin "incbin/stages/stage_07_a.bin"

tbl_DB23_stage_07_b_tilemap:
	.incbin "incbin/stages/stage_07_b.bin"

tbl_DC13_stage_08_a_tilemap:
	.incbin "incbin/stages/stage_08_a.bin"

tbl_DD03_stage_08_b_tilemap:
	.incbin "incbin/stages/stage_08_b.bin"

tbl_DDF3_stage_09_a_tilemap:
	.incbin "incbin/stages/stage_09_a.bin"

tbl_DEE3_stage_09_b_tilemap:
	.incbin "incbin/stages/stage_09_b.bin"

tbl_DFD3_stage_0A_a_tilemap:
	.incbin "incbin/stages/stage_0A_a.bin"

tbl_E0C3_stage_0A_b_tilemap:
	.incbin "incbin/stages/stage_0A_b.bin"

tbl_E1B3_sky_bonus_tilemap:
    .incbin "incbin/stages/sky_bonus.bin"

tbl_E2A3_shop_tilemap:
    .incbin "incbin/stages/shop.bin"

tbl_E393_start_screen_tilemap:
	.incbin "incbin/stages/main_screen.bin"

tbl_E483_change_level_screen_tilemap:
	.incbin "incbin/stages/change_level_screen.bin" 		; include ending secuence

tbl_E573_stage_01_sub_tilemap:
	.incbin "incbin/stages/stage_01_sub.bin" 

tbl_E663_stage_02_sub_tilemap:
	.incbin "incbin/stages/stage_02_sub.bin"

tbl_E753_stage_03_sub_tilemap:
	.incbin "incbin/stages/stage_03_sub.bin"

tbl_E843_stage_06_sub_tilemap:
	.incbin "incbin/stages/stage_06_sub.bin"

tbl_E933_stage_07_sub_tilemap:
	.incbin "incbin/stages/stage_07_sub.bin"

tbl_EA23_stage_08_sub_tilemap:
	.incbin "incbin/stages/stage_08_sub.bin"

tbl_EB13_stage_09_sub_tilemap:
	.incbin "incbin/stages/stage_09_sub.bin"

tbl_EC03_stage_0A_sub_tilemap:
	.incbin "incbin/stages/stage_0A_sub.bin"

tbl_ECF3_stage_04_sub_tilemap:
	.incbin "incbin/stages/stage_04_sub.bin"

tbl_EDE3_stage_01_sub_tilemap_attributes:
- D 3 - I - 0x006DF3 01:EDE3: 40        .byte $40,$11,$00,$00,$00,$00,$00,$00,$44,$01,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x006E03 01:EDF3: 05        .byte $05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x006E13 01:EE03: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$11,$00,$00,$00,$44,$10 ; 
- D 3 - I - 0x006E23 01:EE13: 00        .byte $00,$00,$40,$00,$00,$40,$54,$15,$00,$00,$00,$00,$00,$40,$05,$00 ; 

tbl_EE23_stage_02_sub_tilemap_attributes:
- D 3 - I - 0x006E33 01:EE23: 54        .byte $54,$55,$55,$05,$05,$05,$05,$45,$15,$05,$05,$00,$00,$94,$00,$44   ;
- D 3 - I - 0x006E43 01:EE33: FA        .byte $FA,$FA,$BA,$44,$51,$99,$00,$44,$11,$FC,$BA,$04,$05,$C9,$00,$44   ;
- D 3 - I - 0x006E53 01:EE43: F1        .byte $F1,$BB,$0A,$80,$20,$98,$00,$44,$DA,$0A,$00,$08,$46,$19,$00,$44   ;
- D 3 - I - 0x006E63 01:EE53: 11        .byte $11,$00,$44,$11,$00,$00,$00,$66,$05,$05,$05,$05,$05,$05,$05,$05   ;

tbl_EE63_stage_03_sub_tilemap_attributes:
- D 3 - I - 0x006E73 01:EE63: EA        .byte $EA,$FA,$FA,$FA,$FA,$FA,$FA,$BA,$EE,$3F,$AF,$0F,$0F,$0F,$0F,$8B   ;
- D 3 - I - 0x006E83 01:EE73: EE        .byte $EE,$33,$0A,$0A,$0A,$00,$08,$8A,$EE,$33,$8A,$0A,$8A,$00,$00,$88   ;
- D 3 - I - 0x006E93 01:EE83: EE        .byte $EE,$33,$00,$00,$00,$00,$00,$88,$EE,$33,$00,$00,$00,$00,$00,$88   ;
- D 3 - I - 0x006EA3 01:EE93: EE        .byte $EE,$B3,$A0,$00,$20,$00,$80,$A8,$3E,$83,$50,$00,$00,$00,$40,$18   ;

tbl_EEA3_stage_06_sub_tilemap_attributes:
- D 3 - I - 0x006EB3 01:EEA3: 6A        .byte $6A,$5A,$1A,$0A,$0A,$4A,$9A,$AA,$26,$05,$01,$00,$00,$00,$00,$88   ;
- D 3 - I - 0x006EC3 01:EEB3: 22        .byte $22,$88,$A0,$20,$00,$00,$44,$99,$22,$00,$AA,$01,$44,$55,$55,$99   ;
- D 3 - I - 0x006ED3 01:EEC3: 22        .byte $22,$00,$5A,$01,$00,$44,$11,$88,$22,$00,$55,$01,$00,$00,$00,$88   ;
- D 3 - I - 0x006EE3 01:EED3: 22        .byte $22,$00,$05,$55,$11,$44,$55,$99,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA   ;

tbl_EEE3_stage_07_sub_tilemap_attributes:
- D 3 - I - 0x006EF3 01:EEE3: 40        .byte $40,$50,$00,$00,$00,$00,$00,$00,$04,$06,$C0,$20,$00,$00,$00,$00   ;
- D 3 - I - 0x006F03 01:EEF3: 00        .byte $00,$00,$00,$40,$00,$00,$00,$00,$04,$05,$01,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x006F13 01:EF03: 04        .byte $04,$01,$00,$00,$00,$B5,$00,$00,$00,$00,$00,$50,$50,$00,$00,$00   ;
- D 3 - I - 0x006F23 01:EF13: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;

tbl_EF23_stage_08_sub_tilemap_attributes:
- D 3 - I - 0x006F33 01:EF23: 40        .byte $40,$00,$00,$00,$00,$00,$40,$10,$44,$50,$10,$40,$50,$50,$54,$11   ;
- D 3 - I - 0x006F43 01:EF33: 44        .byte $44,$51,$00,$04,$05,$05,$45,$11,$00,$00,$98,$AA,$AA,$00,$55,$11   ;
- D 3 - I - 0x006F53 01:EF43: 44        .byte $44,$55,$08,$A6,$A9,$00,$05,$01,$00,$00,$88,$5A,$62,$50,$00,$00   ;
- D 3 - I - 0x006F63 01:EF53: 44        .byte $44,$59,$42,$50,$14,$55,$55,$11,$00,$00,$00,$00,$00,$00,$00,$00   ;

tbl_EF63_stage_09_sub_tilemap_attributes:
- - - - - - 0x006F73 01:EF63: 15        .byte $15,$09,$4A,$1A,$5A,$5A,$1A,$45,$11,$00,$00,$00,$00,$00,$00,$44   ;
- - - - - - 0x006F83 01:EF73: 22        .byte $22,$00,$00,$00,$00,$00,$00,$44,$22,$00,$A0,$A0,$A0,$A0,$A0,$64   ;
- - - - - - 0x006F93 01:EF83: 22        .byte $22,$00,$22,$00,$00,$00,$00,$44,$22,$00,$02,$00,$00,$00,$00,$88   ;
- - - - - - 0x006FA3 01:EF93: 11        .byte $11,$00,$00,$00,$00,$00,$00,$48,$05,$05,$05,$09,$0A,$09,$0A,$05   ;

tbl_EFA3_stage_0A_sub_tilemap_attributes:
- D 3 - I - 0x006FB3 01:EFA3: FF        .byte $FF,$00,$00,$20,$80,$00,$00,$FF,$0F,$0F,$0F,$02,$08,$0F,$0F,$0F   ;
- D 3 - I - 0x006FC3 01:EFB3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x006FD3 01:EFC3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$88,$00,$00,$00,$00,$00,$00,$00,$88   ;
- D 3 - I - 0x006FE3 01:EFD3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$00,$00   ;

tbl_EFE3_stage_04_sub_tilemap_attributes:
- D 3 - I - 0x006FF3 01:EFE3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x007003 01:EFF3: 00        .byte $00,$00,$00,$50,$00,$00,$00,$00,$00,$44,$A5,$61,$00,$00,$00,$00   ;
- D 3 - I - 0x007013 01:F003: 40        .byte $40,$94,$5A,$66,$00,$00,$00,$00,$00,$04,$05,$05,$05,$00,$00,$00   ;
- D 3 - I - 0x007023 01:F013: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF   ;

tbl_F023_stage_07_a_tilemap_attributes:
- D 3 - I - 0x007033 01:F023: AA        .byte $AA,$AA,$AA,$AA,$AA,$6A,$56,$99,$0A,$0A,$0A,$0A,$0A,$06,$45,$09   ;
- D 3 - I - 0x007043 01:F033: 00        .byte $00,$00,$00,$00,$00,$00,$55,$11,$00,$00,$00,$00,$00,$00,$55,$11   ;
- D 3 - I - 0x007053 01:F043: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x007063 01:F053: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$8A   ;

tbl_F063_stage_07_b_tilemap_attributes:
- D 3 - I - 0x007073 01:F063: AA        .byte $AA,$AA,$AA,$04,$AA,$AA,$AA,$AA,$0A,$0A,$0A,$04,$0A,$0A,$0A,$0A   ;
- D 3 - I - 0x007083 01:F073: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x007093 01:F083: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x0070A3 01:F093: 00        .byte $00,$00,$80,$20,$00,$00,$00,$00,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA   ;

tbl_F0A3_stage_08_a_tilemap_attributes:
- D 3 - I - 0x0070B3 01:F0A3: 00        .byte $00,$00,$00,$00,$00,$2A,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x0070C3 01:F0B3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x0070D3 01:F0C3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x0070E3 01:F0D3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;

tbl_F0E3_stage_08_b_tilemap_attributes:
- D 3 - I - 0x0070F3 01:F0E3: 00        .byte $00,$00,$00,$00,$00,$82,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00   ;
- D 3 - I - 0x007103 01:F0F3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x007113 01:F103: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x007123 01:F113: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0,$00   ;

tbl_F123_stage_09_a_tilemap_attributes:
- D 3 - I - 0x007133 01:F123: 00        .byte $00,$00,$00,$00,$00,$9A,$22,$00,$11,$00,$00,$00,$01,$04,$02,$40   ;
- D 3 - I - 0x007143 01:F133: 11        .byte $11,$00,$A0,$A0,$20,$48,$22,$44,$11,$EA,$22,$00,$02,$00,$00,$44   ;
- D 3 - I - 0x007153 01:F143: 01        .byte $01,$00,$9A,$08,$00,$00,$00,$00,$10,$00,$A2,$A0,$A0,$A0,$20,$44   ;
- D 3 - I - 0x007163 01:F153: 01        .byte $01,$00,$00,$00,$00,$00,$00,$44,$50,$50,$50,$50,$50,$50,$50,$50   ;

tbl_F163_stage_09_b_tilemap_attributes:
- D 3 - I - 0x007173 01:F163: 00        .byte $00,$00,$00,$00,$88,$66,$99,$A6,$11,$00,$00,$00,$08,$46,$99,$0A   ;
- D 3 - I - 0x007183 01:F173: 01        .byte $01,$00,$A0,$20,$20,$48,$22,$40,$00,$EA,$22,$00,$02,$00,$00,$44   ;
- D 3 - I - 0x007193 01:F183: 00        .byte $00,$00,$9A,$08,$00,$00,$00,$00,$10,$00,$A2,$A0,$A0,$A0,$20,$44   ;
- D 3 - I - 0x0071A3 01:F193: 01        .byte $01,$00,$00,$00,$00,$00,$00,$44,$50,$50,$50,$50,$50,$50,$50,$50   ;

tbl_F1A3_stage_0A_a_tilemap_attributes:
- D 3 - I - 0x0071B3 01:F1A3: 55        .byte $55,$55,$55,$55,$55,$55,$55,$55,$05,$05,$45,$1F,$15,$25,$05,$05   ;
- D 3 - I - 0x0071C3 01:F1B3: 10        .byte $10,$00,$15,$00,$45,$50,$10,$00,$01,$00,$00,$00,$00,$05,$01,$00   ;
- D 3 - I - 0x0071D3 01:F1C3: 54        .byte $54,$11,$00,$A0,$AA,$2A,$0A,$00,$11,$00,$40,$00,$00,$00,$00,$00   ;
- D 3 - I - 0x0071E3 01:F1D3: 51        .byte $51,$50,$54,$50,$50,$50,$50,$50,$05,$05,$05,$05,$05,$05,$05,$05   ;

tbl_F1E3_stage_0A_b_tilemap_attributes:
- D 3 - I - 0x0071F3 01:F1E3: 55        .byte $55,$55,$55,$55,$55,$55,$55,$55,$05,$05,$A5,$25,$05,$45,$15,$45   ;
- D 3 - I - 0x007203 01:F1F3: 00        .byte $00,$40,$11,$00,$55,$55,$01,$44,$00,$44,$00,$00,$00,$00,$00,$54   ;
- D 3 - I - 0x007213 01:F203: 55        .byte $55,$15,$00,$00,$00,$11,$44,$55,$00,$00,$00,$00,$00,$55,$44,$15   ;
- D 3 - I - 0x007223 01:F213: 50        .byte $50,$50,$50,$50,$50,$50,$50,$50,$05,$05,$05,$05,$05,$05,$05,$05   ;

tbl_F223_sky_bonus_tilemap_attributes:
- D 3 - I - 0x007233 01:F223: 55        .byte $55,$55,$55,$01,$00,$44,$55,$51,$05,$05,$05,$00,$00,$44,$15,$00   ;
- D 3 - I - 0x007243 01:F233: 04        .byte $04,$00,$00,$44,$55,$55,$11,$10,$00,$44,$55,$11,$00,$00,$00,$00   ;
- D 3 - I - 0x007253 01:F243: 00        .byte $00,$00,$00,$00,$40,$50,$50,$50,$50,$50,$10,$00,$04,$05,$05,$05   ;
- D 3 - I - 0x007263 01:F253: 05        .byte $05,$05,$01,$00,$00,$00,$00,$50,$00,$00,$00,$00,$00,$00,$00,$05   ;

tbl_F263_shop_tilemap_attributes:
- D 3 - I - 0x007273 01:F263: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$F5,$F5,$05,$00,$04,$05,$F5,$F5   ; 
- D 3 - I - 0x007283 01:F273: FF        .byte $FF,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$88,$22,$00,$00,$FF,$FF   ; 
- D 3 - I - 0x007293 01:F283: FF        .byte $FF,$FF,$5B,$5E,$5F,$5F,$FF,$FF,$FF,$33,$00,$00,$00,$00,$CC,$FF   ; 
- D 3 - I - 0x0072A3 01:F293: FF        .byte $FF,$77,$55,$55,$55,$55,$5D,$FF,$0F,$05,$05,$05,$05,$05,$05,$CD   ; 

tbl_F2A3_start_screen_tilemap_attributes:
- D 3 - I - 0x0072B3 01:F2A3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 
- D 3 - I - 0x0072C3 01:F2B3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00,$00,$00,$00,$00   ; 
- D 3 - I - 0x0072D3 01:F2C3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$C0,$40,$10,$00,$00,$00,$55,$10   ;
- D 3 - I - 0x0072E3 01:F2D3: A7        .byte $A7,$45,$59,$56,$59,$51,$5B,$6D,$D6,$05,$65,$65,$C5,$D5,$F5,$FA   ; 

tbl_F2E3_change_level_screen_tilemap_attributes:
- D 3 - I - 0x0072F3 01:F2E3: 44        .byte $44,$55,$55,$55,$55,$55,$55,$55,$44,$15,$55,$55,$51,$10,$00,$44   ; 
- D 3 - I - 0x007303 01:F2F3: 55        .byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$50,$55,$50,$50,$50,$55   ; 
- D 3 - I - 0x007313 01:F303: 10        .byte $10,$00,$45,$55,$05,$05,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00   ; 
- D 3 - I - 0x007323 01:F313: A0        .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA   ; 

tbl_F323_stage_01_a_tilemap_attributes:
- D 3 - I - 0x007333 01:F323: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$A0,$00,$00,$00,$00  ; 
- D 3 - I - 0x007343 01:F333: 00        .byte $00,$00,$08,$0A,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; 
- D 3 - I - 0x007353 01:F343: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; 
- D 3 - I - 0x007363 01:F353: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$51,$50,$50,$50,$40,$40,$50,$50  ; 

tbl_F363_stage_01_b_tilemap_attributes:
- D 3 - I - 0x007373 01:F363: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$50,$00,$00,$00,$00  ; 
- D 3 - I - 0x007383 01:F373: 00        .byte $00,$00,$04,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; 
- D 3 - I - 0x007393 01:F383: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; 
- D 3 - I - 0x0073A3 01:F393: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$50,$50,$50,$50,$50,$50,$50,$50  ; 

tbl_F3A3_stage_02_a_tilemap_attributes:
- D 3 - I - 0x0073B3 01:F3A3: 00        .byte $00,$00,$00,$00,$80,$20,$00,$00,$00,$00,$00,$11,$08,$42,$50,$00 ; 
- D 3 - I - 0x0073C3 01:F3B3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0073D3 01:F3C3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0073E3 01:F3D3: 00        .byte $00,$00,$00,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ;

tbl_F3E3_stage_02_b_tilemap_attributes:
- D 3 - I - 0x0073F3 01:F3E3: 00        .byte $00,$00,$04,$05,$54,$55,$A5,$55,$00,$50,$80,$00,$04,$05,$0A,$05 ; 
- D 3 - I - 0x007403 01:F3F3: 00        .byte $00,$01,$40,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007413 01:F403: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007423 01:F413: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ;

tbl_F423_stage_03_a_tilemap_attributes:
- D 3 - I - 0x007433 01:F423: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$4A,$00,$00 ; 
- D 3 - I - 0x007443 01:F433: 0A        .byte $0A,$0A,$0A,$0A,$0A,$00,$08,$0A,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007453 01:F443: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007463 01:F453: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$0A,$0A,$5A,$5A,$1A,$0A,$0A,$FA ;

tbl_F463_stage_03_b_tilemap_attributes:
- D 3 - I - 0x007473 01:F463: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$CC,$30,$00,$00,$00,$A0,$20,$00 ; 
- D 3 - I - 0x007483 01:F473: EC        .byte $EC,$3B,$0A,$0A,$0A,$06,$0A,$0A,$FF,$33,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007493 01:F483: FF        .byte $FF,$33,$00,$00,$00,$00,$00,$00,$FF,$33,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0074A3 01:F493: FF        .byte $FF,$B3,$A0,$A0,$20,$00,$80,$A0,$3F,$83,$50,$00,$00,$00,$40,$10 ;

tbl_F4A3_stage_04_a_tilemap_attributes:
- D 3 - I - 0x0074B3 01:F4A3: 00        .byte $00,$00,$00,$00,$54,$10,$00,$00,$0A,$0A,$0A,$0A,$06,$0A,$0A,$0A ; 
- D 3 - I - 0x0074C3 01:F4B3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0074D3 01:F4C3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0074E3 01:F4D3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$FA ;

tbl_F4E3_stage_04_b_tilemap_attributes:
- D 3 - I - 0x0074F3 01:F4E3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$FF,$02,$00,$00,$00,$00,$00,$00,$FF ; 
- D 3 - I - 0x007503 01:F4F3: 00        .byte $00,$00,$00,$00,$00,$00,$CC,$FF,$00,$00,$00,$00,$00,$00,$CC,$FF ; 
- D 3 - I - 0x007513 01:F503: 00        .byte $00,$00,$00,$00,$00,$00,$CC,$FF,$00,$00,$00,$00,$00,$00,$CC,$FF ; 
- D 3 - I - 0x007523 01:F513: 00        .byte $00,$00,$00,$00,$00,$00,$FC,$FF,$00,$00,$00,$00,$00,$0C,$0F,$7F ;

tbl_F523_stage_05_a_tilemap_attributes:
- D 3 - I - 0x007533 01:F523: 44        .byte $44,$55,$00,$00,$00,$00,$22,$00,$04,$01,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007543 01:F533: 00        .byte $00,$CF,$40,$00,$00,$00,$00,$00,$00,$40,$50,$50,$00,$00,$00,$00 ; 
- D 3 - I - 0x007553 01:F543: E0        .byte $E0,$E1,$01,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$50,$EF ; 
- D 3 - I - 0x007563 01:F553: 10        .byte $10,$90,$56,$44,$54,$54,$55,$51,$75,$F5,$05,$04,$09,$05,$05,$05 ;

tbl_F563_stage_05_b_tilemap_attributes:
- D 3 - I - 0x007573 01:F563: 00        .byte $00,$55,$88,$02,$08,$00,$88,$00,$04,$01,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007583 01:F573: 00        .byte $00,$00,$40,$00,$00,$00,$00,$00,$00,$40,$55,$55,$01,$00,$00,$00 ; 
- D 3 - I - 0x007593 01:F583: 00        .byte $00,$04,$41,$00,$00,$00,$00,$00,$00,$00,$44,$EA,$EC,$00,$50,$00 ; 
- D 3 - I - 0x0075A3 01:F593: 50        .byte $50,$51,$54,$66,$55,$55,$55,$55,$05,$05,$A5,$26,$09,$05,$05,$F5 ;

tbl_F5A3_stage_06_a_tilemap_attributes:
- D 3 - I - 0x0075B3 01:F5A3: 00        .byte $00,$00,$00,$44,$65,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0075C3 01:F5B3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0075D3 01:F5C3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x0075E3 01:F5D3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ;

tbl_F5E3_stage_06_b_tilemap_attributes:
- D 3 - I - 0x0075F3 01:F5E3: 40        .byte $40,$44,$65,$00,$00,$00,$00,$00,$04,$55,$00,$55,$00,$00,$00,$00 ; 
- D 3 - I - 0x007603 01:F5F3: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007613 01:F503: 01        .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 
- D 3 - I - 0x007623 01:F513: 00        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ;

;=============
; Meta-tiles
;=============

tbl_F623_meta_tiles_table_01:
- D 3 - I - 0x007633 01:F623: 00        .byte $00,$21,$39,$22 ; 
- D 3 - I - 0x007637 01:F627: 00        .byte $00,$03,$4C,$4C ;
- D 3 - I - 0x00763B 01:F62B: 00        .byte $00,$00,$00,$00 ;
- D 3 - I - 0x00763F 01:F62F: 00        .byte $00,$02,$01,$02 ;
- D 3 - I - 0x007643 01:F633: 01        .byte $01,$02,$01,$02 ;
- D 3 - I - 0x007647 01:F637: 01        .byte $01,$02,$04,$04 ;
- D 3 - I - 0x00764B 01:F63B: 01        .byte $01,$07,$04,$0E ;
- D 3 - I - 0x00764F 01:F63F: 01        .byte $01,$02,$04,$03 ;
- D 3 - I - 0x007653 01:F643: 01        .byte $01,$03,$03,$03 ;
- D 3 - I - 0x007657 01:F647: 01        .byte $01,$0C,$04,$07 ;
- D 3 - I - 0x00765B 01:F64B: 01        .byte $01,$02,$42,$03 ;
- D 3 - I - 0x00765F 01:F64F: 01        .byte $01,$02,$01,$03 ;
- D 3 - I - 0x007663 01:F653: 01        .byte $01,$04,$04,$04 ;
- D 3 - I - 0x007667 01:F657: 01        .byte $01,$01,$01,$01 ;
- D 3 - I - 0x00766B 01:F65B: 01        .byte $01,$04,$01,$04 ;
- D 3 - I - 0x00766F 01:F65F: 01        .byte $01,$02,$03,$04 ;
- D 3 - I - 0x007673 01:F663: 01        .byte $01,$02,$04,$02 ;
- D 3 - I - 0x007677 01:F667: 01        .byte $01,$02,$03,$03 ;
- D 3 - I - 0x00767B 01:F66B: 01        .byte $01,$02,$07,$08 ;
- D 3 - I - 0x00767F 01:F66F: 01        .byte $01,$02,$01,$0C ;
- D 3 - I - 0x007683 01:F673: 02        .byte $02,$03,$03,$03 ;
- D 3 - I - 0x007687 01:F677: 02        .byte $02,$02,$08,$01 ;
- D 3 - I - 0x00768B 01:F67B: 02        .byte $02,$02,$02,$02 ;
- D 3 - I - 0x00768F 01:F67F: 02        .byte $02,$03,$04,$03 ;
- D 3 - I - 0x007693 01:F683: 03        .byte $03,$03,$03,$03 ;
- D 3 - I - 0x007697 01:F687: 03        .byte $03,$03,$4C,$4C ;
- D 3 - I - 0x00769B 01:F68B: 03        .byte $03,$03,$44,$05 ;
- D 3 - I - 0x00769F 01:F68F: 03        .byte $03,$04,$05,$43 ;
- D 3 - I - 0x0076A3 01:F693: 03        .byte $03,$03,$05,$05 ;
- D 3 - I - 0x0076A7 01:F697: 03        .byte $03,$02,$03,$04 ;
- D 3 - I - 0x0076AB 01:F69B: 03        .byte $03,$04,$03,$04 ;
- D 3 - I - 0x0076AF 01:F69F: 04        .byte $04,$07,$04,$0E ;
- D 3 - I - 0x0076B3 01:F6A3: 04        .byte $04,$25,$05,$39 ;
- D 3 - I - 0x0076B7 01:F6A7: 04        .byte $04,$03,$05,$03 ;
- D 3 - I - 0x0076BB 01:F6AB: 04        .byte $04,$03,$05,$05 ;
- D 3 - I - 0x0076BF 01:F6AF: 04        .byte $04,$0E,$05,$0E ;
- D 3 - I - 0x0076C3 01:F6B3: 04        .byte $04,$03,$04,$03 ;
- D 3 - I - 0x0076C7 01:F6B7: 04        .byte $04,$05,$04,$05 ;
- D 3 - I - 0x0076CB 01:F6BB: 04        .byte $04,$02,$04,$03 ;
- D 3 - I - 0x0076CF 01:F6BF: 04        .byte $04,$0E,$04,$0E ;
- D 3 - I - 0x0076D3 01:F6C3: 04        .byte $04,$04,$04,$04 ;
- D 3 - I - 0x0076D7 01:F6C7: 04        .byte $04,$02,$04,$04 ;
- D 3 - I - 0x0076DB 01:F6CB: 05        .byte $05,$05,$05,$05 ;
- D 3 - I - 0x0076DF 01:F6CF: 05        .byte $05,$06,$06,$14 ;
- D 3 - I - 0x0076E3 01:F6D3: 05        .byte $05,$05,$06,$15 ;
- D 3 - I - 0x0076E7 01:F6D7: 05        .byte $05,$06,$14,$14 ;
- D 3 - I - 0x0076EB 01:F6DB: 05        .byte $05,$04,$05,$05 ;
- D 3 - I - 0x0076EF 01:F6DF: 05        .byte $05,$25,$05,$05 ;
- D 3 - I - 0x0076F3 01:F6E3: 05        .byte $05,$16,$16,$16 ;
- D 3 - I - 0x0076F7 01:F6E7: 05        .byte $05,$28,$05,$05 ;
- D 3 - I - 0x0076FB 01:F6EB: 05        .byte $05,$28,$05,$28 ;
- D 3 - I - 0x0076FF 01:F6EF: 05        .byte $05,$05,$16,$16 ;
- D 3 - I - 0x007703 01:F6F3: 06        .byte $06,$15,$14,$15 ;
- D 3 - I - 0x007707 01:F6F7: 06        .byte $06,$05,$14,$15 ;
- D 3 - I - 0x00770B 01:F6FB: 06        .byte $06,$0E,$14,$0E ;
- D 3 - I - 0x00770F 01:F6FF: 06        .byte $06,$06,$16,$16 ;
- D 3 - I - 0x007713 01:F703: 06        .byte $06,$06,$14,$14 ;
- D 3 - I - 0x007717 01:F707: 07        .byte $07,$08,$0B,$0A ;
- D 3 - I - 0x00771B 01:F70B: 08        .byte $08,$25,$09,$25 ;
- D 3 - I - 0x00771F 01:F70F: 08        .byte $08,$4F,$09,$04 ;
- D 3 - I - 0x007723 01:F713: 08        .byte $08,$02,$09,$04 ;
- D 3 - I - 0x007727 01:F717: 08        .byte $08,$01,$09,$01 ;
- D 3 - I - 0x00772B 01:F71B: 09        .byte $09,$28,$09,$28 ;
- D 3 - I - 0x00772F 01:F71F: 09        .byte $09,$06,$09,$14 ;
- D 3 - I - 0x007733 01:F723: 09        .byte $09,$04,$09,$04 ;
- D 3 - I - 0x007737 01:F727: 09        .byte $09,$05,$09,$16 ;
- D 3 - I - 0x00773B 01:F72B: 09        .byte $09,$25,$09,$05 ;
- D 3 - I - 0x00773F 01:F72F: 09        .byte $09,$05,$09,$05 ;
- D 3 - I - 0x007743 01:F733: 0A        .byte $0A,$0A,$13,$13 ;
- D 3 - I - 0x007747 01:F737: 0B        .byte $0B,$0A,$13,$13 ;
- D 3 - I - 0x00774B 01:F73B: 12        .byte $12,$11,$0F,$10 ;
- D 3 - I - 0x00774F 01:F73F: 13        .byte $13,$13,$0D,$0D ;
- D 3 - I - 0x007753 01:F743: 15        .byte $15,$06,$15,$14 ;
- D 3 - I - 0x007757 01:F747: 16        .byte $16,$16,$16,$16 ;
- D 3 - I - 0x00775B 01:F74B: 16        .byte $16,$31,$36,$34 ;
- D 3 - I - 0x00775F 01:F74F: 16        .byte $16,$30,$16,$33 ;
- D 3 - I - 0x007763 01:F753: 16        .byte $16,$05,$16,$16 ;
- D 3 - I - 0x007767 01:F757: 1D        .byte $1D,$1E,$1D,$1E ;
- D 3 - I - 0x00776B 01:F75B: 1D        .byte $1D,$1E,$29,$37 ;
- D 3 - I - 0x00776F 01:F75F: 1D        .byte $1D,$1E,$29,$28 ;
- D 3 - I - 0x007773 01:F763: 1D        .byte $1D,$23,$20,$24 ;
- D 3 - I - 0x007777 01:F767: 1D        .byte $1D,$23,$20,$39 ;
- D 3 - I - 0x00777B 01:F76B: 1D        .byte $1D,$1E,$07,$08 ;
- D 3 - I - 0x00777F 01:F76F: 1D        .byte $1D,$1E,$20,$0C ;
- D 3 - I - 0x007783 01:F773: 1D        .byte $1D,$1E,$20,$3A ;
- D 3 - I - 0x007787 01:F777: 1D        .byte $1D,$1E,$26,$26 ;
- D 3 - I - 0x00778B 01:F77B: 1D        .byte $1D,$1E,$20,$1F ;
- D 3 - I - 0x00778F 01:F77F: 1D        .byte $1D,$1E,$23,$21 ;
- D 3 - I - 0x007793 01:F783: 1E        .byte $1E,$23,$1D,$1E ;
- D 3 - I - 0x007797 01:F787: 1E        .byte $1E,$25,$1F,$25 ;
- D 3 - I - 0x00779B 01:F78B: 1E        .byte $1E,$21,$1F,$22 ;
- D 3 - I - 0x00779F 01:F78F: 1E        .byte $1E,$23,$1F,$24 ;
- D 3 - I - 0x0077A3 01:F793: 1E        .byte $1E,$23,$1E,$24 ;
- D 3 - I - 0x0077A7 01:F797: 1E        .byte $1E,$23,$23,$21 ;
- D 3 - I - 0x0077AB 01:F79B: 1E        .byte $1E,$28,$1F,$28 ;
- D 3 - I - 0x0077AF 01:F79F: 1F        .byte $1F,$28,$29,$28 ;
- D 3 - I - 0x0077B3 01:F7A3: 1F        .byte $1F,$23,$1F,$24 ;
- D 3 - I - 0x0077B7 01:F7A7: 20        .byte $20,$1F,$24,$22 ;
- D 3 - I - 0x0077BB 01:F7AB: 20        .byte $20,$3A,$29,$28 ;
- D 3 - I - 0x0077BF 01:F7AF: 20        .byte $20,$3A,$20,$3A ;
- D 3 - I - 0x0077C3 01:F7B3: 20        .byte $20,$3A,$38,$28 ;
- D 3 - I - 0x0077C7 01:F7B7: 20        .byte $20,$1F,$20,$28 ;
- D 3 - I - 0x0077CB 01:F7BB: 20        .byte $20,$1F,$29,$05 ;
- D 3 - I - 0x0077CF 01:F7BF: 20        .byte $20,$1F,$22,$20 ;
- D 3 - I - 0x0077D3 01:F7C3: 20        .byte $20,$1F,$1F,$28 ;
- D 3 - I - 0x0077D7 01:F7C7: 20        .byte $20,$1F,$26,$24 ;
- D 3 - I - 0x0077DB 01:F7CB: 20        .byte $20,$1F,$29,$28 ;
- D 3 - I - 0x0077DF 01:F7CF: 20        .byte $20,$1F,$1E,$22 ;
- D 3 - I - 0x0077E3 01:F7D3: 21        .byte $21,$1D,$22,$20 ;
- D 3 - I - 0x0077E7 01:F7D7: 21        .byte $21,$1D,$1D,$1E ;
- D 3 - I - 0x0077EB 01:F7DB: 22        .byte $22,$20,$29,$28 ;
- D 3 - I - 0x0077EF 01:F7DF: 22        .byte $22,$20,$37,$38 ;
- D 3 - I - 0x0077F3 01:F7E3: 23        .byte $23,$21,$23,$21 ;
- D 3 - I - 0x0077F7 01:F7E7: 23        .byte $23,$21,$29,$28 ;
- D 3 - I - 0x0077FB 01:F7EB: 23        .byte $23,$21,$22,$22 ;
- D 3 - I - 0x0077FF 01:F7EF: 23        .byte $23,$21,$07,$08 ;
- D 3 - I - 0x007803 01:F7F3: 23        .byte $23,$21,$39,$22 ;
- D 3 - I - 0x007807 01:F7F7: 23        .byte $23,$21,$26,$25 ;
- D 3 - I - 0x00780B 01:F7FB: 23        .byte $23,$21,$24,$22 ;
- D 3 - I - 0x00780F 01:F7FF: 23        .byte $23,$21,$1D,$1E ;
- D 3 - I - 0x007813 01:F803: 24        .byte $24,$22,$26,$21 ;
- D 3 - I - 0x007817 01:F807: 24        .byte $24,$21,$23,$21 ;
- D 3 - I - 0x00781B 01:F80B: 24        .byte $24,$22,$08,$28 ;
- D 3 - I - 0x00781F 01:F80F: 24        .byte $24,$22,$26,$28 ;
- D 3 - I - 0x007823 01:F813: 24        .byte $24,$22,$29,$24 ;
- D 3 - I - 0x007827 01:F817: 24        .byte $24,$22,$22,$20 ;
- D 3 - I - 0x00782B 01:F81B: 24        .byte $24,$22,$29,$28 ;
- D 3 - I - 0x00782F 01:F81F: 24        .byte $24,$22,$20,$1F ;
- D 3 - I - 0x007833 01:F823: 25        .byte $25,$26,$39,$3A ;
- D 3 - I - 0x007837 01:F827: 26        .byte $26,$28,$26,$28 ;
- D 3 - I - 0x00783B 01:F82B: 26        .byte $26,$0E,$3A,$0E ;
- D 3 - I - 0x00783F 01:F82F: 26        .byte $26,$FF,$06,$06 ;
- D 3 - I - 0x007843 01:F833: 26        .byte $26,$55,$3A,$55 ;
- D 3 - I - 0x007847 01:F837: 26        .byte $26,$25,$05,$39 ;
- D 3 - I - 0x00784B 01:F83B: 26        .byte $26,$25,$3A,$05 ;
- D 3 - I - 0x00784F 01:F83F: 26        .byte $26,$05,$05,$05 ;
- D 3 - I - 0x007853 01:F843: 26        .byte $26,$FF,$3A,$FF ;
- D 3 - I - 0x007857 01:F847: 26        .byte $26,$FF,$3A,$3A ;
- D 3 - I - 0x00785B 01:F84B: 26        .byte $26,$0E,$05,$0E ;
- D 3 - I - 0x00785F 01:F84F: 26        .byte $26,$25,$05,$05 ;
- D 3 - I - 0x007863 01:F853: 26        .byte $26,$1D,$26,$20 ;
- D 3 - I - 0x007867 01:F857: 26        .byte $26,$07,$26,$0E ;
- D 3 - I - 0x00786B 01:F85B: 26        .byte $26,$25,$29,$25 ;
- D 3 - I - 0x00786F 01:F85F: 26        .byte $26,$25,$26,$25 ;
- D 3 - I - 0x007873 01:F863: 26        .byte $26,$26,$26,$26 ;
- D 3 - I - 0x007877 01:F867: 26        .byte $26,$25,$3A,$39 ;
- D 3 - I - 0x00787B 01:F86B: 26        .byte $26,$FF,$3A,$05 ;
- D 3 - I - 0x00787F 01:F86F: 26        .byte $26,$FF,$3A,$39 ;
- D 3 - I - 0x007883 01:F873: 26        .byte $26,$28,$05,$05 ;
- D 3 - I - 0x007887 01:F877: 28        .byte $28,$29,$29,$29 ;
- D 3 - I - 0x00788B 01:F87B: 28        .byte $28,$05,$05,$05 ;
- D 3 - I - 0x00788F 01:F87F: 28        .byte $28,$29,$28,$29 ;
- D 3 - I - 0x007893 01:F883: 29        .byte $29,$24,$29,$28 ;
- D 3 - I - 0x007897 01:F887: 29        .byte $29,$25,$05,$05 ;
- D 3 - I - 0x00789B 01:F88B: 29        .byte $29,$25,$29,$25 ;
- D 3 - I - 0x00789F 01:F88F: 29        .byte $29,$05,$29,$05 ;
- D 3 - I - 0x0078A3 01:F893: 29        .byte $29,$28,$1D,$1E ;
- D 3 - I - 0x0078A7 01:F897: 29        .byte $29,$28,$23,$21 ;
- D 3 - I - 0x0078AB 01:F89B: 29        .byte $29,$05,$05,$05 ;
- D 3 - I - 0x0078AF 01:F89F: 29        .byte $29,$0E,$05,$0E ;
- D 3 - I - 0x0078B3 01:F8A3: 29        .byte $29,$28,$05,$05 ;
- D 3 - I - 0x0078B7 01:F8A7: 29        .byte $29,$0E,$29,$0E ;
- D 3 - I - 0x0078BB 01:F8AB: 29        .byte $29,$23,$29,$24 ;
- D 3 - I - 0x0078BF 01:F8AF: 29        .byte $29,$28,$29,$28 ;
- D 3 - I - 0x0078C3 01:F8B3: 29        .byte $29,$0C,$29,$07 ;
- D 3 - I - 0x0078C7 01:F8B7: 2F        .byte $2F,$30,$32,$33 ;
- D 3 - I - 0x0078CB 01:F8BB: 2F        .byte $2F,$32,$32,$33 ;
- D 3 - I - 0x0078CF 01:F8BF: 30        .byte $30,$35,$33,$36 ;
- D 3 - I - 0x0078D3 01:F8C3: 31        .byte $31,$2F,$34,$32 ;
- D 3 - I - 0x0078D7 01:F8C7: 33        .byte $33,$36,$36,$34 ;
- D 3 - I - 0x0078DB 01:F8CB: 35        .byte $35,$31,$36,$34 ;
- D 3 - I - 0x0078DF 01:F8CF: 35        .byte $35,$31,$30,$35 ;
- D 3 - I - 0x0078E3 01:F8D3: 38        .byte $38,$39,$28,$39 ;
- D 3 - I - 0x0078E7 01:F8D7: 39        .byte $39,$22,$29,$37 ;
- D 3 - I - 0x0078EB 01:F8DB: 39        .byte $39,$39,$29,$29 ;
- D 3 - I - 0x0078EF 01:F8DF: 3A        .byte $3A,$25,$29,$28 ;
- D 3 - I - 0x0078F3 01:F8E3: 3A        .byte $3A,$3A,$37,$38 ;
- D 3 - I - 0x0078F7 01:F8E7: 3B        .byte $3B,$3C,$3F,$3C ;
- D 3 - I - 0x0078FB 01:F8EB: 3B        .byte $3B,$3C,$3D,$3C ;
- D 3 - I - 0x0078FF 01:F8EF: 3C        .byte $3C,$3D,$40,$3E ;
- D 3 - I - 0x007903 01:F8F3: 3E        .byte $3E,$41,$44,$43 ;
- D 3 - I - 0x007907 01:F8F7: 41        .byte $41,$41,$43,$43 ;
- D 3 - I - 0x00790B 01:F8FB: 41        .byte $41,$42,$43,$44 ;
- D 3 - I - 0x00790F 01:F8FF: 42        .byte $42,$41,$44,$43 ;
- D 3 - I - 0x007913 01:F903: 42        .byte $42,$FF,$44,$43 ;
- D 3 - I - 0x007917 01:F907: 42        .byte $42,$FF,$44,$05 ;
- D 3 - I - 0x00791B 01:F90B: 42        .byte $42,$FF,$44,$FF ;
- D 3 - I - 0x00791F 01:F90F: 42        .byte $42,$03,$42,$03 ;
- D 3 - I - 0x007923 01:F913: 42        .byte $42,$3E,$44,$44 ;
- D 3 - I - 0x007927 01:F917: 42        .byte $42,$40,$44,$43 ;
- D 3 - I - 0x00792B 01:F91B: 42        .byte $42,$42,$44,$44 ;
- D 3 - I - 0x00792F 01:F91F: 43        .byte $43,$44,$05,$05 ;
- D 3 - I - 0x007933 01:F923: 46        .byte $46,$47,$48,$49 ;
- D 3 - I - 0x007937 01:F927: 48        .byte $48,$49,$48,$49 ;
- D 3 - I - 0x00793B 01:F92B: 48        .byte $48,$13,$4A,$4B ;
- D 3 - I - 0x00793F 01:F92F: 48        .byte $48,$49,$4A,$4B ;
- D 3 - I - 0x007943 01:F933: 4C        .byte $4C,$4D,$53,$52 ;
- D 3 - I - 0x007947 01:F937: 4E        .byte $4E,$4F,$51,$50 ;
- D 3 - I - 0x00794B 01:F93B: 4E        .byte $4E,$07,$51,$0E ;
- D 3 - I - 0x00794F 01:F93F: 4E        .byte $4E,$54,$51,$55 ;
- D 3 - I - 0x007953 01:F943: 54        .byte $54,$04,$55,$04 ;
- D 3 - I - 0x007957 01:F947: 55        .byte $55,$04,$55,$04 ;
- D 3 - I - 0x00795B 01:F94B: 58        .byte $58,$21,$23,$21 ;
- D 3 - I - 0x00795F 01:F94F: 58        .byte $58,$4D,$53,$52 ;
- D 3 - I - 0x007963 01:F953: 58        .byte $58,$21,$39,$22 ;
- D 3 - I - 0x007967 01:F957: 76        .byte $76,$41,$75,$43 ;
- D 3 - I - 0x00796B 01:F95B: FF        .byte $FF,$FF,$FF,$FF ;
- D 3 - I - 0x00796F 01:F95F: FF        .byte $FF,$FF,$56,$57 ;
- D 3 - I - 0x007973 01:F963: FF        .byte $FF,$49,$48,$49 ;
- D 3 - I - 0x007977 01:F967: FF        .byte $FF,$41,$44,$43 ;
- D 3 - I - 0x00797B 01:F96B: FF        .byte $FF,$41,$FF,$43 ;
- D 3 - I - 0x00797F 01:F96F: FF        .byte $FF,$41,$05,$43 ;
- D 3 - I - 0x007983 01:F973: FF        .byte $FF,$25,$39,$39 ;
- D 3 - I - 0x007987 01:F977: FF        .byte $FF,$25,$FF,$39 ;
- D 3 - I - 0x00798B 01:F97B: FF        .byte $FF,$25,$3A,$39 ;
- D 3 - I - 0x00798F 01:F97F: FF        .byte $FF,$25,$05,$39 ;

tbl_F983_meta_tiles_table_02:
- D 3 - I - 0x007993 01:F983: 02        .byte $02,$77,$84,$7A ;
- D 3 - I - 0x007997 01:F987: 03        .byte $03,$6A,$69,$FF ;
- D 3 - I - 0x00799B 01:F98B: 03        .byte $03,$6B,$69,$6A ;
- D 3 - I - 0x00799F 01:F98F: 03        .byte $03,$03,$03,$F1 ;
- D 3 - I - 0x0079A3 01:F993: 03        .byte $03,$04,$03,$04 ;
- D 3 - I - 0x0079A7 01:F997: 03        .byte $03,$03,$03,$03 ;
- D 3 - I - 0x0079AB 01:F99B: 03        .byte $03,$03,$69,$6A ;
- D 3 - I - 0x0079AF 01:F99F: 03        .byte $03,$6A,$6A,$FF ;
- D 3 - I - 0x0079B3 01:F9A3: 03        .byte $03,$03,$6A,$69 ;
- D 3 - I - 0x0079B7 01:F9A7: 04        .byte $04,$04,$04,$04 ;
- D 3 - I - 0x0079BB 01:F9AB: 04        .byte $04,$1B,$1B,$1A ;
- D 3 - I - 0x0079BF 01:F9AF: 04        .byte $04,$41,$04,$43 ;
- D 3 - I - 0x0079C3 01:F9B3: 05        .byte $05,$05,$05,$05 ;
- D 3 - I - 0x0079C7 01:F9B7: 05        .byte $05,$05,$FF,$FF ;
- D 3 - I - 0x0079CB 01:F9BB: 05        .byte $05,$16,$16,$16 ;
- D 3 - I - 0x0079CF 01:F9BF: 07        .byte $07,$08,$0B,$0A ;
- D 3 - I - 0x0079D3 01:F9C3: 08        .byte $08,$3B,$0A,$3F ;
- D 3 - I - 0x0079D7 01:F9C7: 08        .byte $08,$78,$13,$04 ;
- D 3 - I - 0x0079DB 01:F9CB: 08        .byte $08,$78,$07,$07 ;
- D 3 - I - 0x0079DF 01:F9CF: 09        .byte $09,$3B,$09,$3F ;
- D 3 - I - 0x0079E3 01:F9D3: 09        .byte $09,$04,$09,$04 ;
- D 3 - I - 0x0079E7 01:F9D7: 09        .byte $09,$41,$09,$43 ;
- D 3 - I - 0x0079EB 01:F9DB: 0B        .byte $0B,$0B,$13,$13 ;
- D 3 - I - 0x0079EF 01:F9DF: 0E        .byte $0E,$13,$0E,$0D ;
- D 3 - I - 0x0079F3 01:F9E3: 0E        .byte $0E,$12,$0E,$0F ;
- D 3 - I - 0x0079F7 01:F9E7: 11        .byte $11,$55,$10,$55 ;
- D 3 - I - 0x0079FB 01:F9EB: 11        .byte $11,$09,$10,$09 ;
- D 3 - I - 0x0079FF 01:F9EF: 12        .byte $12,$11,$0F,$10 ;
- D 3 - I - 0x007A03 01:F9F3: 13        .byte $13,$13,$0D,$0D ;
- D 3 - I - 0x007A07 01:F9F7: 13        .byte $13,$09,$0D,$09 ;
- D 3 - I - 0x007A0B 01:F9FB: 14        .byte $14,$14,$14,$14 ;
- D 3 - I - 0x007A0F 01:F9FF: 16        .byte $16,$05,$16,$16 ;
- D 3 - I - 0x007A13 01:FA03: 16        .byte $16,$CF,$16,$16 ;
- D 3 - I - 0x007A17 01:FA07: 16        .byte $16,$16,$16,$16 ;
- D 3 - I - 0x007A1B 01:FA0B: 1A        .byte $1A,$04,$1A,$04 ;
- D 3 - I - 0x007A1F 01:FA0F: 1A        .byte $1A,$F3,$04,$F3 ;
- D 3 - I - 0x007A23 01:FA13: 1A        .byte $1A,$04,$03,$04 ;
- D 3 - I - 0x007A27 01:FA17: 1A        .byte $1A,$1A,$1A,$03 ;
- D 3 - I - 0x007A2B 01:FA1B: 1B        .byte $1B,$1B,$1B,$1B ;
- D 3 - I - 0x007A2F 01:FA1F: 1B        .byte $1B,$F3,$1B,$F3 ;
- D 3 - I - 0x007A33 01:FA23: 1B        .byte $1B,$1B,$1B,$04 ;
- D 3 - I - 0x007A37 01:FA27: 2F        .byte $2F,$30,$32,$33 ;
- D 3 - I - 0x007A3B 01:FA2B: 35        .byte $35,$31,$36,$34 ;
- D 3 - I - 0x007A3F 01:FA2F: 35        .byte $35,$31,$35,$34 ;
- D 3 - I - 0x007A43 01:FA33: 3B        .byte $3B,$3C,$3F,$3E ;
- D 3 - I - 0x007A47 01:FA37: 3B        .byte $3B,$3B,$3F,$3F ;
- D 3 - I - 0x007A4B 01:FA3B: 3B        .byte $3B,$0E,$3D,$0E ;
- D 3 - I - 0x007A4F 01:FA3F: 3B        .byte $3B,$3C,$3D,$3C ;
- D 3 - I - 0x007A53 01:FA43: 3B        .byte $3B,$3C,$3F,$3C ;
- D 3 - I - 0x007A57 01:FA47: 3B        .byte $3B,$3D,$3F,$FF ;
- D 3 - I - 0x007A5B 01:FA4B: 3C        .byte $3C,$3C,$3C,$40 ;
- D 3 - I - 0x007A5F 01:FA4F: 3C        .byte $3C,$1A,$1A,$1A ;
- D 3 - I - 0x007A63 01:FA53: 3C        .byte $3C,$1A,$1A,$04 ;
- D 3 - I - 0x007A67 01:FA57: 3C        .byte $3C,$0C,$40,$07 ;
- D 3 - I - 0x007A6B 01:FA5B: 3C        .byte $3C,$3B,$3C,$3F ;
- D 3 - I - 0x007A6F 01:FA5F: 3C        .byte $3C,$3D,$3C,$3E ;
- D 3 - I - 0x007A73 01:FA63: 3C        .byte $3C,$54,$3C,$55 ;
- D 3 - I - 0x007A77 01:FA67: 3C        .byte $3C,$3C,$40,$40 ;
- D 3 - I - 0x007A7B 01:FA6B: 3C        .byte $3C,$3C,$3E,$3C ;
- D 3 - I - 0x007A7F 01:FA6F: 3C        .byte $3C,$3B,$40,$3F ;
- D 3 - I - 0x007A83 01:FA73: 3C        .byte $3C,$3C,$3C,$3C ;
- D 3 - I - 0x007A87 01:FA77: 3C        .byte $3C,$3D,$40,$3E ;
- D 3 - I - 0x007A8B 01:FA7B: 3D        .byte $3D,$3B,$3E,$3D ;
- D 3 - I - 0x007A8F 01:FA7F: 3D        .byte $3D,$3B,$3E,$3F ;
- D 3 - I - 0x007A93 01:FA83: 3D        .byte $3D,$FF,$3E,$FF ;
- D 3 - I - 0x007A97 01:FA87: 3E        .byte $3E,$41,$44,$43 ;
- D 3 - I - 0x007A9B 01:FA8B: 3E        .byte $3E,$0E,$44,$0E ;
- D 3 - I - 0x007A9F 01:FA8F: 40        .byte $40,$3E,$43,$44 ;
- D 3 - I - 0x007AA3 01:FA93: 40        .byte $40,$41,$44,$43 ;
- D 3 - I - 0x007AA7 01:FA97: 41        .byte $41,$55,$43,$55 ;
- D 3 - I - 0x007AAB 01:FA9B: 41        .byte $41,$42,$43,$44 ;
- D 3 - I - 0x007AAF 01:FA9F: 42        .byte $42,$41,$44,$43 ;
- D 3 - I - 0x007AB3 01:FAA3: 42        .byte $42,$FF,$44,$FF ;
- D 3 - I - 0x007AB7 01:FAA7: 42        .byte $42,$3E,$44,$44 ;
- D 3 - I - 0x007ABB 01:FAAB: 42        .byte $42,$FF,$44,$05 ;
- D 3 - I - 0x007ABF 01:FAAF: 42        .byte $42,$42,$44,$44 ;
- D 3 - I - 0x007AC3 01:FAB3: 42        .byte $42,$40,$44,$43 ;
- D 3 - I - 0x007AC7 01:FAB7: 54        .byte $54,$54,$56,$57 ;
- D 3 - I - 0x007ACB 01:FABB: 54        .byte $54,$04,$57,$04 ;
- D 3 - I - 0x007ACF 01:FABF: 54        .byte $54,$54,$55,$56 ;
- D 3 - I - 0x007AD3 01:FAC3: 54        .byte $54,$55,$55,$56 ;
- D 3 - I - 0x007AD7 01:FAC7: 54        .byte $54,$54,$55,$55 ;
- D 3 - I - 0x007ADB 01:FACB: 55        .byte $55,$55,$55,$55 ;
- D 3 - I - 0x007ADF 01:FACF: 55        .byte $55,$04,$55,$04 ;
- D 3 - I - 0x007AE3 01:FAD3: 55        .byte $55,$12,$55,$0F ;
- D 3 - I - 0x007AE7 01:FAD7: 55        .byte $55,$54,$57,$55 ;
- D 3 - I - 0x007AEB 01:FADB: 66        .byte $66,$67,$68,$03 ;
- D 3 - I - 0x007AEF 01:FADF: 66        .byte $66,$6B,$69,$6A ;
- D 3 - I - 0x007AF3 01:FAE3: 66        .byte $66,$67,$66,$03 ;
- D 3 - I - 0x007AF7 01:FAE7: 66        .byte $66,$67,$03,$03 ;
- D 3 - I - 0x007AFB 01:FAEB: 67        .byte $67,$6B,$03,$66 ;
- D 3 - I - 0x007AFF 01:FAEF: 67        .byte $67,$66,$03,$03 ;
- D 3 - I - 0x007B03 01:FAF3: 67        .byte $67,$6B,$03,$6A ;
- D 3 - I - 0x007B07 01:FAF7: 68        .byte $68,$03,$FF,$69 ;
- D 3 - I - 0x007B0B 01:FAFB: 68        .byte $68,$03,$FF,$FF ;
- D 3 - I - 0x007B0F 01:FAFF: 68        .byte $68,$03,$6A,$69 ;
- D 3 - I - 0x007B13 01:FB03: 68        .byte $68,$03,$69,$69 ;
- D 3 - I - 0x007B17 01:FB07: 68        .byte $68,$03,$69,$6A ;
- D 3 - I - 0x007B1B 01:FB0B: 69        .byte $69,$6A,$FF,$FF ;
- D 3 - I - 0x007B1F 01:FB0F: 69        .byte $69,$FF,$FF,$FF ;
- D 3 - I - 0x007B23 01:FB13: 6A        .byte $6A,$03,$FF,$69 ;
- D 3 - I - 0x007B27 01:FB17: 6A        .byte $6A,$FF,$FF,$FF ;
- D 3 - I - 0x007B2B 01:FB1B: 6A        .byte $6A,$69,$FF,$FF ;
- D 3 - I - 0x007B2F 01:FB1F: 6A        .byte $6A,$FF,$FF,$6B ;
- D 3 - I - 0x007B33 01:FB23: 6A        .byte $6A,$03,$69,$6A ;
- D 3 - I - 0x007B37 01:FB27: 6B        .byte $6B,$66,$66,$68 ;
- D 3 - I - 0x007B3B 01:FB2B: 6B        .byte $6B,$6C,$03,$03 ;
- D 3 - I - 0x007B3F 01:FB2F: 6B        .byte $6B,$FF,$66,$67 ;
- D 3 - I - 0x007B43 01:FB33: 6B        .byte $6B,$67,$03,$03 ;
- D 3 - I - 0x007B47 01:FB37: 6B        .byte $6B,$FF,$6B,$67 ;
- D 3 - I - 0x007B4B 01:FB3B: 6B        .byte $6B,$66,$6A,$68 ;
- D 3 - I - 0x007B4F 01:FB3F: 6C        .byte $6C,$FF,$66,$67 ;
- D 3 - I - 0x007B53 01:FB43: 6C        .byte $6C,$FF,$03,$6B ;
- D 3 - I - 0x007B57 01:FB47: 6D        .byte $6D,$6E,$70,$6F ;
- D 3 - I - 0x007B5B 01:FB4B: 6D        .byte $6D,$71,$70,$73 ;
- D 3 - I - 0x007B5F 01:FB4F: 6D        .byte $6D,$6D,$70,$70 ;
- D 3 - I - 0x007B63 01:FB53: 6E        .byte $6E,$6D,$6F,$70 ;
- D 3 - I - 0x007B67 01:FB57: 6E        .byte $6E,$6F,$6F,$72 ;
- D 3 - I - 0x007B6B 01:FB5B: 6E        .byte $6E,$71,$6F,$73 ;
- D 3 - I - 0x007B6F 01:FB5F: 6E        .byte $6E,$FF,$6F,$FF ;
- D 3 - I - 0x007B73 01:FB63: 70        .byte $70,$72,$73,$74 ;
- D 3 - I - 0x007B77 01:FB67: 70        .byte $70,$6F,$70,$72 ;
- D 3 - I - 0x007B7B 01:FB6B: 70        .byte $70,$6F,$71,$72 ;
- D 3 - I - 0x007B7F 01:FB6F: 71        .byte $71,$72,$73,$74 ;
- D 3 - I - 0x007B83 01:FB73: 72        .byte $72,$70,$74,$73 ;
- D 3 - I - 0x007B87 01:FB77: 72        .byte $72,$71,$74,$73 ;
- D 3 - I - 0x007B8B 01:FB7B: 72        .byte $72,$6D,$74,$70 ;
- D 3 - I - 0x007B8F 01:FB7F: 73        .byte $73,$74,$FF,$FF ;
- D 3 - I - 0x007B93 01:FB83: 75        .byte $75,$75,$FF,$FF ;
- D 3 - I - 0x007B97 01:FB87: 76        .byte $76,$76,$75,$75 ;
- D 3 - I - 0x007B9B 01:FB8B: 76        .byte $76,$76,$16,$16 ;
- D 3 - I - 0x007B9F 01:FB8F: 77        .byte $77,$78,$7A,$79 ;
- D 3 - I - 0x007BA3 01:FB93: 77        .byte $77,$07,$7A,$0E ;
- D 3 - I - 0x007BA7 01:FB97: 77        .byte $77,$77,$78,$7A ;
- D 3 - I - 0x007BAB 01:FB9B: 77        .byte $77,$78,$79,$79 ;
- D 3 - I - 0x007BAF 01:FB9F: 77        .byte $77,$77,$7A,$7A ;
- D 3 - I - 0x007BB3 01:FBA3: 77        .byte $77,$54,$7A,$55 ;
- D 3 - I - 0x007BB7 01:FBA7: 78        .byte $78,$78,$7A,$79 ;
- D 3 - I - 0x007BBB 01:FBAB: 78        .byte $78,$78,$79,$79 ;
- D 3 - I - 0x007BBF 01:FBAF: 7A        .byte $7A,$79,$7B,$7C ;
- D 3 - I - 0x007BC3 01:FBB3: 7B        .byte $7B,$7C,$73,$74 ;
- D 3 - I - 0x007BC7 01:FBB7: 7B        .byte $7B,$0E,$73,$0E ;
- D 3 - I - 0x007BCB 01:FBBB: 7B        .byte $7B,$7B,$73,$73 ;
- D 3 - I - 0x007BCF 01:FBBF: 7B        .byte $7B,$7C,$76,$74 ;
- D 3 - I - 0x007BD3 01:FBC3: 7B        .byte $7B,$55,$73,$55 ;
- D 3 - I - 0x007BD7 01:FBC7: 7B        .byte $7B,$7C,$77,$78 ;
- D 3 - I - 0x007BDB 01:FBCB: 7C        .byte $7C,$7C,$74,$74 ;
- D 3 - I - 0x007BDF 01:FBCF: 84        .byte $84,$8D,$86,$87 ;
- D 3 - I - 0x007BE3 01:FBD3: 88        .byte $88,$7B,$88,$73 ;
- D 3 - I - 0x007BE7 01:FBD7: 8A        .byte $8A,$89,$91,$92 ;
- D 3 - I - 0x007BEB 01:FBDB: 8C        .byte $8C,$8B,$8C,$83 ;
- D 3 - I - 0x007BEF 01:FBDF: 90        .byte $90,$8F,$8E,$85 ;
- D 3 - I - 0x007BF3 01:FBE3: FF        .byte $FF,$FF,$AE,$AB ;
- D 3 - I - 0x007BF7 01:FBE7: FF        .byte $FF,$FF,$FF,$B2 ;
- D 3 - I - 0x007BFB 01:FBEB: FF        .byte $FF,$AC,$BF,$AD ;
- D 3 - I - 0x007BFF 01:FBEF: FF        .byte $FF,$AC,$FF,$AF ;
- D 3 - I - 0x007C03 01:FBF3: FF        .byte $FF,$FF,$FF,$AB ;
- D 3 - I - 0x007C07 01:FBF7: FF        .byte $FF,$FF,$AE,$B2 ;
- D 3 - I - 0x007C0B 01:FBFB: FF        .byte $FF,$AC,$FF,$AD ;
- D 3 - I - 0x007C0F 01:FBFF: FF        .byte $FF,$FF,$AE,$B0 ;
- D 3 - I - 0x007C13 01:FC03: FF        .byte $FF,$FF,$BB,$BD ;
- D 3 - I - 0x007C17 01:FC07: FF        .byte $FF,$AC,$FF,$AC ;
- D 3 - I - 0x007C1B 01:FC0B: FF        .byte $FF,$FF,$AE,$FF ;
- D 3 - I - 0x007C1F 01:FC0F: FF        .byte $FF,$FF,$AB,$BB ;
- D 3 - I - 0x007C23 01:FC13: FF        .byte $FF,$FF,$B3,$B2 ;
- D 3 - I - 0x007C27 01:FC17: FF        .byte $FF,$FF,$AB,$FF ;
- D 3 - I - 0x007C2B 01:FC1B: FF        .byte $FF,$AC,$AE,$AD ;
- D 3 - I - 0x007C2F 01:FC1F: AC        .byte $AC,$FF,$AC,$AE ;
- D 3 - I - 0x007C33 01:FC23: FF        .byte $FF,$AC,$AE,$AF ;
- - - - - - 0x007C37 01:FC27: C1        .byte $C1,$C1,$FF,$FF ;
- D 3 - I - 0x007C3B 01:FC2B: FF        .byte $FF,$FF,$BD,$B3 ;
- D 3 - I - 0x007C3F 01:FC2F: FF        .byte $FF,$FF,$B2,$AE ;
- D 3 - I - 0x007C43 01:FC33: D1        .byte $D1,$FF,$FF,$FF ;
- D 3 - I - 0x007C47 01:FC37: D9        .byte $D9,$D8,$FF,$FF ;
- D 3 - I - 0x007C4B 01:FC3B: D9        .byte $D9,$FF,$FF,$FF ;
- D 3 - I - 0x007C4F 01:FC3F: DA        .byte $DA,$F2,$FF,$FF ;
- D 3 - I - 0x007C53 01:FC43: DC        .byte $DC,$E8,$FF,$FF ;
- D 3 - I - 0x007C57 01:FC47: DE        .byte $DE,$FF,$FF,$FF ;
- D 3 - I - 0x007C5B 01:FC4B: DE        .byte $DE,$EB,$FF,$FF ;
- D 3 - I - 0x007C5F 01:FC4F: E0        .byte $E0,$E1,$FF,$FF ;
- D 3 - I - 0x007C63 01:FC53: E5        .byte $E5,$DC,$FF,$FF ;
- D 3 - I - 0x007C67 01:FC57: E8        .byte $E8,$E7,$FF,$FF ;
- D 3 - I - 0x007C6B 01:FC5B: E8        .byte $E8,$E6,$FF,$FF ;
- D 3 - I - 0x007C6F 01:FC5F: E9        .byte $E9,$E5,$FF,$FF ;
- D 3 - I - 0x007C73 01:FC63: E9        .byte $E9,$F2,$FF,$FF ;
- D 3 - I - 0x007C77 01:FC67: EA        .byte $EA,$DE,$FF,$FF ;
- D 3 - I - 0x007C7B 01:FC6B: EB        .byte $EB,$E2,$FF,$FF ;
- D 3 - I - 0x007C7F 01:FC6F: ED        .byte $ED,$FF,$FF,$FF ;
- D 3 - I - 0x007C83 01:FC73: ED        .byte $ED,$E8,$FF,$FF ;
- D 3 - I - 0x007C87 01:FC77: A7        .byte $A7,$F3,$FF,$A7 ;
- D 3 - I - 0x007C8B 01:FC7B: A7        .byte $A7,$F3,$1A,$F0 ;
- D 3 - I - 0x007C8F 01:FC7F: EF        .byte $EF,$F3,$1B,$EF ;
- D 3 - I - 0x007C93 01:FC83: F0        .byte $F0,$3C,$3C,$3C ;
- D 3 - I - 0x007C97 01:FC87: F3        .byte $F3,$F3,$F3,$F3 ;
- D 3 - I - 0x007C9B 01:FC8B: F3        .byte $F3,$F1,$F1,$FF ;
- D 3 - I - 0x007C9F 01:FC8F: F3        .byte $F3,$CE,$F3,$F3 ;
- D 3 - I - 0x007CA3 01:FC93: F3        .byte $F3,$F3,$D1,$D0 ;
- D 3 - I - 0x007CA7 01:FC97: F3        .byte $F3,$F3,$D2,$D0 ;
- D 3 - I - 0x007CAB 01:FC9B: F3        .byte $F3,$F3,$D0,$D0 ;
- D 3 - I - 0x007CAF 01:FC9F: F3        .byte $F3,$F3,$D1,$D5 ;
- D 3 - I - 0x007CB3 01:FCA3: F3        .byte $F3,$F3,$F3,$CF ;
- D 3 - I - 0x007CB7 01:FCA7: F3        .byte $F3,$F0,$F0,$1B ;
- D 3 - I - 0x007CBB 01:FCAB: F3        .byte $F3,$F3,$F3,$F0 ;
- D 3 - I - 0x007CBF 01:FCAF: F3        .byte $F3,$F3,$1B,$F3 ;
- D 3 - I - 0x007CC3 01:FCB3: F3        .byte $F3,$F3,$1B,$1B ;
- D 3 - I - 0x007CC7 01:FCB7: F5        .byte $F5,$F6,$F8,$F9 ;
- D 3 - I - 0x007CCB 01:FCBB: FB        .byte $FB,$FC,$FF,$FF ;
- D 3 - I - 0x007CCF 01:FCBF: FD        .byte $FD,$FA,$FF,$FF ;
- D 3 - I - 0x007CD3 01:FCC3: FF        .byte $FF,$FF,$FF,$FF ;
- D 3 - I - 0x007CD7 01:FCC7: FF        .byte $FF,$FF,$D1,$FF ;
- D 3 - I - 0x007CDB 01:FCCB: FF        .byte $FF,$FF,$DD,$FF ;
- D 3 - I - 0x007CDF 01:FCCF: FF        .byte $FF,$FF,$EB,$E5 ;
- D 3 - I - 0x007CE3 01:FCD3: FF        .byte $FF,$FF,$EA,$E8 ;
- D 3 - I - 0x007CE7 01:FCD7: FF        .byte $FF,$66,$FF,$69 ;
- D 3 - I - 0x007CEB 01:FCDB: FF        .byte $FF,$66,$FF,$68 ;
- D 3 - I - 0x007CEF 01:FCDF: FF        .byte $FF,$68,$FF,$FF ;
- D 3 - I - 0x007CF3 01:FCE3: FF        .byte $FF,$69,$FF,$FF ;
- D 3 - I - 0x007CF7 01:FCE7: FF        .byte $FF,$FF,$67,$FF ;
- D 3 - I - 0x007CFB 01:FCEB: FF        .byte $FF,$FF,$67,$66 ;
- D 3 - I - 0x007CFF 01:FCEF: FF        .byte $FF,$FF,$6B,$FF ;
- D 3 - I - 0x007D03 01:FCF3: FF        .byte $FF,$FF,$6B,$66 ;
- D 3 - I - 0x007D07 01:FCF7: FF        .byte $FF,$FF,$FF,$66 ;
- D 3 - I - 0x007D0B 01:FCFB: FF        .byte $FF,$D1,$FF,$FF ;
- D 3 - I - 0x007D0F 01:FCFF: FF        .byte $FF,$CC,$FF,$FF ;
- D 3 - I - 0x007D13 01:FD03: FF        .byte $FF,$F4,$FF,$F7 ;
- D 3 - I - 0x007D17 01:FD07: FF        .byte $FF,$FF,$EC,$FF ;
- D 3 - I - 0x007D1B 01:FD0B: FF        .byte $FF,$FF,$DE,$EB ;
- D 3 - I - 0x007D1F 01:FD0F: FF        .byte $FF,$FF,$DA,$F2 ;
- D 3 - I - 0x007D23 01:FD13: FF        .byte $FF,$FF,$E9,$E5 ;
- D 3 - I - 0x007D27 01:FD17: FF        .byte $FF,$FF,$E8,$FF ;
- D 3 - I - 0x007D2B 01:FD1B: FF        .byte $FF,$FF,$ED,$EA ;
- D 3 - I - 0x007D2F 01:FD1F: FF        .byte $FF,$FF,$D2,$FF ;
- D 3 - I - 0x007D33 01:FD23: AC        .byte $AC,$AC,$AC,$AC ;
- D 3 - I - 0x007D37 01:FD27: FF        .byte $FF,$FF,$BA,$B3 ;
- D 3 - I - 0x007D3B 01:FD2B: AC        .byte $AC,$AC,$AF,$AD ;
- D 3 - I - 0x007D3F 01:FD2F: FF        .byte $FF,$AC,$AE,$AC ;
- D 3 - I - 0x007D43 01:FD33: AC        .byte $AC,$FF,$AC,$FF ;
- D 3 - I - 0x007D47 01:FD37: FF        .byte $FF,$FF,$B1,$B0 ;
- D 3 - I - 0x007D4B 01:FD3B: AC        .byte $AC,$AC,$B4,$AC ;
- D 3 - I - 0x007D4F 01:FD3F: FF        .byte $FF,$6B,$6B,$FF ;
- D 3 - I - 0x007D53 01:FD43: FF        .byte $FF,$6B,$66,$67 ;
- D 3 - I - 0x007D57 01:FD47: FF        .byte $FF,$FF,$FF,$6B ;
- D 3 - I - 0x007D5B 01:FD4B: FF        .byte $FF,$FF,$6B,$67 ;
- D 3 - I - 0x007D5F 01:FD4F: FF        .byte $FF,$FF,$66,$67 ;
- D 3 - I - 0x007D63 01:FD53: FF        .byte $FF,$FF,$67,$6B ;
- D 3 - I - 0x007D67 01:FD57: FF        .byte $FF,$6D,$FF,$70 ;
- D 3 - I - 0x007D6B 01:FD5B: FF        .byte $FF,$FF,$76,$76 ;
- D 3 - I - 0x007D6F 01:FD5F: FF        .byte $FF,$FF,$6D,$6E ;
- D 3 - I - 0x007D73 01:FD63: FF        .byte $FF,$41,$FF,$43 ;
- D 3 - I - 0x007D77 01:FD67: FF        .byte $FF,$FF,$05,$FF ;
- D 3 - I - 0x007D7B 01:FD6B: FF        .byte $FF,$41,$05,$43 ;
- D 3 - I - 0x007D7F 01:FD6F: FF        .byte $FF,$AC,$AE,$B4 ;
- D 3 - I - 0x007D83 01:FD73: AC        .byte $AC,$FF,$AF,$FF ;
- D 3 - I - 0x007D87 01:FD77: AC        .byte $AC,$AC,$AF,$BC ;
- D 3 - I - 0x007D8B 01:FD7B: AC        .byte $AC,$FF,$BC,$AE ;
- D 3 - I - 0x007D8F 01:FD7F: AC        .byte $AC,$AC,$B4,$AD ;

; max index $9B = 155
tbl_FD83_meta_tiles_table_03:
- D 3 - I - 0x007D93 01:FD83: 00        .byte $00,$00,$00,$00 ;
- - - - - - 0x007D97 01:FD87: 00        .byte $00,$00,$96,$00 ;
- D 3 - I - 0x007D9B 01:FD8B: 03        .byte $03,$27,$03,$27 ;
- D 3 - I - 0x007D9F 01:FD8F: 05        .byte $05,$05,$05,$05 ;
- D 3 - I - 0x007DA3 01:FD93: 05        .byte $05,$0E,$05,$0E ;
- - - - - - 0x007DA7 01:FD97: 05        .byte $05,$41,$05,$43 ;
- D 3 - I - 0x007DAB 01:FD9B: 05        .byte $05,$06,$05,$06 ;
- D 3 - I - 0x007DAF 01:FD9F: 05        .byte $05,$FF,$33,$FF ;
- D 3 - I - 0x007DB3 01:FDA3: 05        .byte $05,$05,$06,$15 ;
- D 3 - I - 0x007DB7 01:FDA7: 05        .byte $05,$05,$2B,$2B ;
- D 3 - I - 0x007DBB 01:FDAB: 05        .byte $05,$27,$2B,$5E ;
- D 3 - I - 0x007DBF 01:FDAF: 05        .byte $05,$05,$05,$60 ;
- D 3 - I - 0x007DC3 01:FDB3: 05        .byte $05,$27,$05,$27 ;
- D 3 - I - 0x007DC7 01:FDB7: 06        .byte $06,$06,$06,$15 ;
- - - - - - 0x007DCB 01:FDBB: 06        .byte $06,$06,$14,$06 ;
- - - - - - 0x007DCF 01:FDBF: 06        .byte $06,$14,$14,$06 ;
- - - - - - 0x007DD3 01:FDC3: 06        .byte $06,$14,$14,$15 ;
- D 3 - I - 0x007DD7 01:FDC7: 06        .byte $06,$FF,$14,$15 ;
- D 3 - I - 0x007DDB 01:FDCB: 06        .byte $06,$05,$06,$05 ;
- D 3 - I - 0x007DDF 01:FDCF: 06        .byte $06,$06,$06,$14 ;
- D 3 - I - 0x007DE3 01:FDD3: 06        .byte $06,$05,$14,$15 ;
- D 3 - I - 0x007DE7 01:FDD7: 06        .byte $06,$06,$14,$14 ;
- D 3 - I - 0x007DEB 01:FDDB: 06        .byte $06,$15,$14,$15 ;
- D 3 - I - 0x007DEF 01:FDDF: 09        .byte $09,$05,$09,$05 ;
- D 3 - I - 0x007DF3 01:FDE3: 12        .byte $12,$11,$0F,$10 ;
- D 3 - I - 0x007DF7 01:FDE7: 14        .byte $14,$15,$06,$15 ;
- - - - - - 0x007DFB 01:FDEB: 14        .byte $14,$14,$14,$06 ;
- - - - - - 0x007DFF 01:FDEF: 14        .byte $14,$14,$06,$06 ;
- - - - - - 0x007E03 01:FDF3: 14        .byte $14,$14,$16,$16 ;
- - - - - - 0x007E07 01:FDF7: 14        .byte $14,$14,$14,$14 ;
- - - - - - 0x007E0B 01:FDFB: 14        .byte $14,$14,$06,$14 ;
- D 3 - I - 0x007E0F 01:FDFF: 14        .byte $14,$15,$FF,$FF ;
- D 3 - I - 0x007E13 01:FE03: 15        .byte $15,$06,$15,$14 ;
- - - - - - 0x007E17 01:FE07: 15        .byte $15,$14,$15,$14 ;
- - - - - - 0x007E1B 01:FE0B: 15        .byte $15,$16,$15,$16 ;
- D 3 - I - 0x007E1F 01:FE0F: 15        .byte $15,$14,$FF,$FF ;
- D 3 - I - 0x007E23 01:FE13: 15        .byte $15,$14,$15,$06 ;
- D 3 - I - 0x007E27 01:FE17: 15        .byte $15,$15,$15,$15 ;
- D 3 - I - 0x007E2B 01:FE1B: 16        .byte $16,$16,$16,$16 ;
- - - - - - 0x007E2F 01:FE1F: 16        .byte $16,$06,$16,$14 ;
- - - - - - 0x007E33 01:FE23: 16        .byte $16,$16,$06,$06 ;
- - - - - - 0x007E37 01:FE27: 16        .byte $16,$14,$14,$14 ;
- - - - - - 0x007E3B 01:FE2B: 16        .byte $16,$06,$06,$14 ;
- D 3 - I - 0x007E3F 01:FE2F: 16        .byte $16,$16,$05,$05 ;
- D 3 - I - 0x007E43 01:FE33: 1D        .byte $1D,$1E,$20,$1F ;
- D 3 - I - 0x007E47 01:FE37: 23        .byte $23,$21,$24,$22 ;
- D 3 - I - 0x007E4B 01:FE3B: 26        .byte $26,$FF,$3A,$39 ;
- D 3 - I - 0x007E4F 01:FE3F: 26        .byte $26,$25,$3A,$39 ;
- D 3 - I - 0x007E53 01:FE43: 26        .byte $26,$FF,$3A,$3A ;
- D 3 - I - 0x007E57 01:FE47: 27        .byte $27,$03,$27,$03 ;
- D 3 - I - 0x007E5B 01:FE4B: 2B        .byte $2B,$2B,$05,$05 ;
- D 3 - I - 0x007E5F 01:FE4F: 2F        .byte $2F,$30,$32,$33 ;
- D 3 - I - 0x007E63 01:FE53: 2F        .byte $2F,$30,$35,$31 ;
- D 3 - I - 0x007E67 01:FE57: 2F        .byte $2F,$32,$32,$33 ;
- D 3 - I - 0x007E6B 01:FE5B: 2F        .byte $2F,$30,$30,$33 ;
- D 3 - I - 0x007E6F 01:FE5F: 2F        .byte $2F,$32,$35,$31 ;
- D 3 - I - 0x007E73 01:FE63: 2F        .byte $2F,$35,$30,$36 ;
- D 3 - I - 0x007E77 01:FE67: 31        .byte $31,$2F,$2F,$30 ;
- D 3 - I - 0x007E7B 01:FE6B: 31        .byte $31,$FF,$05,$FF ;
- D 3 - I - 0x007E7F 01:FE6F: 32        .byte $32,$33,$31,$36 ;
- D 3 - I - 0x007E83 01:FE73: 33        .byte $33,$2F,$36,$35 ;
- D 3 - I - 0x007E87 01:FE77: 33        .byte $33,$31,$36,$34 ;
- D 3 - I - 0x007E8B 01:FE7B: 35        .byte $35,$31,$36,$34 ;
- D 3 - I - 0x007E8F 01:FE7F: 35        .byte $35,$31,$36,$2F ;
- D 3 - I - 0x007E93 01:FE83: 36        .byte $36,$34,$30,$33 ;
- D 3 - I - 0x007E97 01:FE87: 36        .byte $36,$31,$35,$34 ;
- D 3 - I - 0x007E9B 01:FE8B: 3B        .byte $3B,$3C,$3F,$3C ;
- D 3 - I - 0x007E9F 01:FE8F: 3C        .byte $3C,$3C,$3C,$3C ;
- - - - - - 0x007EA3 01:FE93: 3C        .byte $3C,$3C,$3C,$40 ;
- D 3 - I - 0x007EA7 01:FE97: 3C        .byte $3C,$3D,$40,$3E ;
- - - - - - 0x007EAB 01:FE9B: 3D        .byte $3D,$FF,$3E,$FF ;
- - - - - - 0x007EAF 01:FE9F: 3D        .byte $3D,$3D,$3E,$3E ;
- D 3 - I - 0x007EB3 01:FEA3: 41        .byte $41,$42,$43,$44 ;
- D 3 - I - 0x007EB7 01:FEA7: 42        .byte $42,$FF,$44,$05 ;
- - - - - - 0x007EBB 01:FEAB: 42        .byte $42,$FF,$44,$76 ;
- D 3 - I - 0x007EBF 01:FEAF: 42        .byte $42,$35,$44,$36 ;
- D 3 - I - 0x007EC3 01:FEB3: 42        .byte $42,$3B,$44,$FF ;
- D 3 - I - 0x007EC7 01:FEB7: 42        .byte $42,$FF,$44,$0F ;
- D 3 - I - 0x007ECB 01:FEBB: 42        .byte $42,$3B,$44,$3F ;
- D 3 - I - 0x007ECF 01:FEBF: 42        .byte $42,$FF,$44,$43 ;
- D 3 - I - 0x007ED3 01:FEC3: 42        .byte $42,$FF,$44,$FF ;
- D 3 - I - 0x007ED7 01:FEC7: 42        .byte $42,$FF,$44,$44 ;
- - - - - - 0x007EDB 01:FECB: 42        .byte $42,$76,$44,$05 ;
- D 3 - I - 0x007EDF 01:FECF: 42        .byte $42,$42,$44,$44 ;
- D 3 - I - 0x007EE3 01:FED3: 42        .byte $42,$41,$44,$43 ;
- - - - - - 0x007EE7 01:FED7: 43        .byte $43,$44,$05,$05 ;
- - - - - - 0x007EEB 01:FEDB: 54        .byte $54,$54,$56,$57 ;
- - - - - - 0x007EEF 01:FEDF: 54        .byte $54,$77,$55,$7A ;
- - - - - - 0x007EF3 01:FEE3: 55        .byte $55,$80,$55,$80 ;
- D 3 - I - 0x007EF7 01:FEE7: 58        .byte $58,$05,$05,$05 ;
- D 3 - I - 0x007EFB 01:FEEB: 58        .byte $58,$3C,$3F,$3C ;
- D 3 - I - 0x007EFF 01:FEEF: 58        .byte $58,$59,$5B,$5A ;
- D 3 - I - 0x007F03 01:FEF3: 5E        .byte $5E,$05,$05,$05 ;
- D 3 - I - 0x007F07 01:FEF7: 60        .byte $60,$2B,$27,$05 ;
- - - - - - 0x007F0B 01:FEFB: 62        .byte $62,$63,$65,$64 ;
- D 3 - I - 0x007F0F 01:FEFF: 6D        .byte $6D,$79,$93,$93 ;
- D 3 - I - 0x007F13 01:FF03: 70        .byte $70,$3C,$70,$70 ;
- D 3 - I - 0x007F17 01:FF07: 70        .byte $70,$70,$70,$70 ;
- D 3 - I - 0x007F1B 01:FF0B: 73        .byte $73,$74,$FF,$FF ;
- D 3 - I - 0x007F1F 01:FF0F: 76        .byte $76,$76,$16,$16 ;
- - - - - - 0x007F23 01:FF13: 76        .byte $76,$76,$75,$75 ;
- - - - - - 0x007F27 01:FF17: 76        .byte $76,$41,$05,$43 ;
- D 3 - I - 0x007F2B 01:FF1B: 77        .byte $77,$78,$7A,$79 ;
- D 3 - I - 0x007F2F 01:FF1F: 77        .byte $77,$77,$7A,$7A ;
- D 3 - I - 0x007F33 01:FF23: 77        .byte $77,$05,$7A,$79 ;
- D 3 - I - 0x007F37 01:FF27: 78        .byte $78,$77,$79,$7A ;
- - - - - - 0x007F3B 01:FF2B: 78        .byte $78,$54,$79,$55 ;
- D 3 - I - 0x007F3F 01:FF2F: 78        .byte $78,$78,$79,$79 ;
- D 3 - I - 0x007F43 01:FF33: 7A        .byte $7A,$79,$7B,$7C ;
- D 3 - I - 0x007F47 01:FF37: 7B        .byte $7B,$7C,$73,$74 ;
- - - - - - 0x007F4B 01:FF3B: 7B        .byte $7B,$7B,$73,$73 ;
- D 3 - I - 0x007F4F 01:FF3F: 7C        .byte $7C,$7B,$74,$73 ;
- D 3 - I - 0x007F53 01:FF43: 7C        .byte $7C,$7C,$74,$74 ;
- - - - - - 0x007F57 01:FF47: 80        .byte $80,$80,$80,$96 ;
- - - - - - 0x007F5B 01:FF4B: 80        .byte $80,$96,$96,$80 ;
- - - - - - 0x007F5F 01:FF4F: 80        .byte $80,$96,$FF,$FF ;
- - - - - - 0x007F63 01:FF53: 80        .byte $80,$96,$80,$80 ;
- - - - - - 0x007F67 01:FF57: 80        .byte $80,$96,$80,$96 ;
- - - - - - 0x007F6B 01:FF5B: 80        .byte $80,$80,$96,$80 ;
- - - - - - 0x007F6F 01:FF5F: 80        .byte $80,$96,$96,$96 ;
- - - - - - 0x007F73 01:FF63: 80        .byte $80,$80,$80,$80 ;
- D 3 - I - 0x007F77 01:FF67: 93        .byte $93,$93,$93,$93 ;
- D 3 - I - 0x007F7B 01:FF6B: 93        .byte $93,$FF,$93,$93 ;
- D 3 - I - 0x007F7F 01:FF6F: 94        .byte $94,$94,$94,$95 ;
- D 3 - I - 0x007F83 01:FF73: 94        .byte $94,$7B,$94,$73 ;
- D 3 - I - 0x007F87 01:FF77: 94        .byte $94,$77,$95,$7A ;
- D 3 - I - 0x007F8B 01:FF7B: 94        .byte $94,$94,$95,$94 ;
- D 3 - I - 0x007F8F 01:FF7F: 94        .byte $94,$95,$95,$94 ;
- D 3 - I - 0x007F93 01:FF83: 94        .byte $94,$95,$94,$95 ;
- D 3 - I - 0x007F97 01:FF87: 95        .byte $95,$94,$95,$94 ;
- D 3 - I - 0x007F9B 01:FF8B: 95        .byte $95,$FF,$94,$FF ;
- - - - - - 0x007F9F 01:FF8F: 96        .byte $96,$96,$96,$80 ;
- - - - - - 0x007FA3 01:FF93: 96        .byte $96,$80,$96,$80 ;
- - - - - - 0x007FA7 01:FF97: 96        .byte $96,$96,$96,$96 ;
- - - - - - 0x007FAB 01:FF9B: 96        .byte $96,$96,$80,$96 ;
- - - - - - 0x007FAF 01:FF9F: 96        .byte $96,$80,$80,$96 ;
- - - - - - 0x007FB3 01:FFA3: 96        .byte $96,$FF,$80,$FF ;
- - - - - - 0x007FB7 01:FFA7: 96        .byte $96,$FF,$96,$FF ;
- - - - - - 0x007FBB 01:FFAB: 96        .byte $96,$80,$80,$80 ;
- - - - - - 0x007FBF 01:FFAF: 96        .byte $96,$55,$80,$55 ;
- D 3 - I - 0x007FC3 01:FFB3: FF        .byte $FF,$FF,$FF,$FF ;
- - - - - - 0x007FC7 01:FFB7: FF        .byte $FF,$41,$76,$43 ;
- D 3 - I - 0x007FCB 01:FFBB: FF        .byte $FF,$41,$44,$43 ;
- D 3 - I - 0x007FCF 01:FFBF: FF        .byte $FF,$41,$FF,$43 ;
- D 3 - I - 0x007FD3 01:FFC3: FF        .byte $FF,$41,$05,$43 ;
- D 3 - I - 0x007FD7 01:FFC7: FF        .byte $FF,$25,$3A,$39 ;
- D 3 - I - 0x007FDB 01:FFCB: FF        .byte $FF,$25,$39,$39 ;
- D 3 - I - 0x007FDF 01:FFCF: FF        .byte $FF,$25,$FF,$39 ;
- D 3 - I - 0x007FE3 01:FFD3: FF        .byte $FF,$25,$05,$39 ;
- D 3 - I - 0x007FE7 01:FFD7: FF        .byte $FF,$FF,$05,$05 ;
- - - - - - 0x007FEB 01:FFDB: FF        .byte $FF,$80,$FF,$80 ;
- D 3 - I - 0x007FEF 01:FFDF: FF        .byte $FF,$7B,$FF,$73 ;
- D 3 - I - 0x007FF3 01:FFE3: FF        .byte $FF,$77,$FF,$7A ;
- D 3 - I - 0x007FF7 01:FFE7: FF        .byte $FF,$FF,$93,$93 ;
- D 3 - I - 0x007FFB 01:FFEB: FF        .byte $FF,$93,$93,$93 ;
- D 3 - I - 0x007FFF 01:FFEF: FF        .byte $FF,$FF,$77,$78 ;

; bzk garbage
- - - - - - 0x008003 01:FFF3: FF        .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF ; 


.out .sprintf("Free bytes in bank FF: 0x%04X [%d]", ($FFFA - *), ($FFFA - *))


.segment "VECTORS"
- D 3 - - - 0x00800A 01:FFFA: E8 81     .word vec_81E8_NMI
- D 3 - - - 0x00800C 01:FFFC: 0B 80     .word vec_800B_RESET
- - - - - - 0x00800E 01:FFFE: 0B 80     .word $800B ; this game doesn't use IRQ



