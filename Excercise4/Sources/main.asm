;--------------------------------------------------------------------
;          HSLU T&A Hochschule Luzern Technik+Architektur            
;--------------------------------------------------------------------
;
; \brief         Template for HCS08 Assembler
; \file
; \author        J.Wassner/C.Jost/L.Kressebuch
; \date          10.10.2012
;
; \b Language:   Assembler \n\n
; \b Target:     MC-CAR \n
;
; \par Description:
;
; $Id: main.asm 910 2014-09-22 07:41:25Z chj-hslu $
;--------------------------------------------------------------------
                include 'derivative.inc'
                

; Global definierte Symbole sind von aussen sichtbar.
;--------------------------------------------------------------------
                GLOBAL      _Startup    ; Start Hauptprogramm
                GLOBAL      main
                GLOBAL      dummy       ; Dummy Interrupt Service Routine

; EQUATIONS
;--------------------------------------------------------------------
StackSize:      EQU     $60             ; Equation for the stack size
pi:             EQU     31416           ; Example for a constant value

; STACK, VARIABLEN (Datenspeicher) und KONSTANTEN (Festwertspeicher) 
;--------------------------------------------------------------------
DATEN_STACK:    SECTION
TofStack:       DS      StackSize-1     ; definiton of "Top of Stack"
BofStack:       DS      1               ; definition of "Bottom of Stack"

DATEN:          SECTION
Variable1:      DS      1               ; Example of a 1 Byte Variable
Array1:         DS      $20             ; Example of an Array of $20 Bytes

KONSTANTEN:     SECTION
Maske1:         DC.B    %00000001
Parameter1:     DC.B    $3A             ; DC mit Punkt-> Coloring geht nicht!
Parameter2:     DC.W    57100
Reserve_Par:    DS      16              ; nur leerer Bereich reservieren!
STRING1:        DC.B    10,"Hello",$0D

; Programmstart (Initialisierungen)
;--------------------------------------------------------------------
PROGRAMM:       SECTION                 ; Code Segment
_Startup:                               ; Resetvektor zeigt hierhin
Stackinit:      LDHX    #(BofStack+1)
                TXS                     ; TXS dekrementiert, deshalb oben +1     
                LDA     #$00
                STA     SOPT1           ; Disable Watchdog

; Rear-LED ON
				LDA		#$04
				STA		PTDDD
				STA		PTDD 

; Start des Benutzer-Codes
;--------------------------------------------------------------------       
main:          	LDA		#$07			; 
				STA		PTFDD			; Pull-Up Enable PTG
				LDA		#$80
				STA		PTEDD
				
				LDA		#$FF
				STA		PTED
				STA		PTFD
				
				JMP		Aufgabe2
				
Aufgabe1:		LDA		#$A0			; Store 160 in $00c0
				STA		$00C0
				LDA		#$88
				STA		$00C1
				
Loop1:			LDA		$00C0
				ADD		$00C1			; Add content of $00c1
				
				TAX						; Transfer Accumulator to X
				TPA						; Transfer ProcessorStatusByte to Acc
				
				COMA					; Invert Accu
				
				STA		PTED
				STA		PTFD
				BRA		Loop1

;;;;;;;; Aufgabe 4.2 ;;;;;;;
Aufgabe2:		LDA		#$40			; Store 64 in $00c0
				STA		$00C0
				LDA		#$D5			; Store 213 in $00c1
				STA		$00C1
				
Loop2:			LDA		$00C0
				ADD		$00C1			; Add content of $00c1
				
				TAX						; Transfer Accumulator to X
				TPA						; Transfer ProcessorStatusByte to Acc
				
				AND		#$FE			; Set Carry to 0 
				ORA 	#$80			; Set V to 1
				COMA					; Invert Accu
				
				STA		PTED
				STA		PTFD
				BRA		Loop2	

EndLoop:        BRA     *               ; Endlos-Loop (=Programmende falls weiter oben Loop vergessen wurde)
                




;--------------------------------------------------------------------
; dummy - Alle nicht benutzten Interruptvektoren werden hierher
;         geleitet damit kein Absturz passiert, wenn ein unerwarteter
;         Interrupt auftritt. (z.B. loss of lock vom ICG)
;--------------------------------------------------------------------
dummy:          BGND
                BRA     dummy
