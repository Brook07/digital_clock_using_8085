; Digital Clock with BCD Time
; 4200H = Seconds, 4201H = Minutes, 4202H = Hours

        MVI A, 55H    ; Load 01 into Accumulator (A)
        STA 4200H     ; Store 01 to memory location 4200H (Seconds)
        
        MVI A, 59H    ; Load 00 into A
        STA 4201H     ; Store 00 to 4201H (Minutes)
        
        MVI A, 23H    ; Load 00 into A
        STA 4202H     ; Store 00 to 4202H (Hours)

LOOP:   CALL DELAY

        ; Load and increment seconds
        LDA 4200H         ; Load Seconds into A
        CALL INC_BCD      ; Increment in BCD format
        STA 4200H         ; Store back to 4200H

        CPI 60H           ; Compare A with 60H
        JC SKIP_MINUTE    ; If <60, skip minute increment

        ; Reset seconds and increment minutes
        MVI A, 01H
        STA 4200H         ; Reset Seconds to 00

        LDA 4201H         ; Load Minutes
        CALL INC_BCD
        STA 4201H         ; Increment and store back

        CPI 60H
        JC SKIP_MINUTE

        ; Reset minutes and increment hours
        MVI A, 00H
        STA 4201H

        LDA 4202H
        CALL INC_BCD
        STA 4202H

        CPI 24H
        JC SKIP_MINUTE

        MVI A, 00H
        STA 4202H

SKIP_MINUTE:
        JMP LOOP

; -----------------------------------------------------
; BCD Increment Subroutine
; -----------------------------------------------------
INC_BCD:
        MOV B, A         ; Save value
        ANI 0FH          ; Isolate lower nibble (units digit)
        CPI 09H          ; Check if <9
        JNZ NOT9         ; If not 9, normal increment

        MOV A, B
        ANI 0F0H         ; Isolate tens digit
        ADI 10H          ; Add 10 to move to next BCD
        RET

NOT9:   MOV A, B
        INR A            ; Just increment normally
        RET
        
; -----------------------------------------------------
; Delay subroutine — tuned manually for 1-second delay
; -----------------------------------------------------
DELAY:
        MVI D, 02H       ; Outer loop count
DL1:    LXI B, 0FFFFH    ; Inner loop max value
DL2:    DCX B            ; Decrease B
        MOV A, B
        ORA C            ; Check if B & C both zero
        JNZ DL2          ; Repeat inner loop
        DCR D            ; Decrease outer loop
        JNZ DL1
        RET

