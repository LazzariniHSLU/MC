/**
 *--------------------------------------------------------------------\n
 *          HSLU T&A Hochschule Luzern Technik+Architektur            \n
 *--------------------------------------------------------------------\n
 *
 * \brief         Timer Output Compare (Playing Ring Tones)
 * \file
 * \author        Christian Jost, christian.jost@hslu.ch
 * \date          10.11.2012
 *
 * \b Language:   Ansi-C \n\n
 * \b Target:     MC-Car  \n
 *
 * \par Description:
 *
 * $Id: main.c 255 2012-11-12 12:53:30Z zajost $
 *--------------------------------------------------------------------
 */
#include "platform.h" 	/* include peripheral declarations */
#include "sound.h"		

/**
 * Ring Tone Melody to be played in RTTTL format
 */
const char soundFile[] = "Swiss:d=4,o=5,b=85:8f,16p,16f,f,a#,8a#,16p,16a,a,p,8f,16p,16f,f,c6,8c6,16p,16a#,a#,p,d6,8p,8d6,8c6,8c6,c6,8p,8a#,8a,2g,e,2f";


/**
 * Switch on Rear LEDs on Port D2
 */
void initPorts(void)
{
    PTDDD = 0x04;
    PTDD = 0x04;
}


/**
 * TPM1: Counter running with frequency 1 MHz
 * - No TOF interrupt
 * - Modulo = default
 * - Prescale = 1
 */
void initTimer(void)
{
  TPM1SC = 0x10;
}


/**
 * main program
 */  
void main(void) 
{
  initPorts();            // Port init

  initTimer();            // Timer init

  soundPlay(soundFile);   // Play ring tone melody
  
  EnableInterrupts;       // Interrupts enable
  
  for(;;) {}
}
