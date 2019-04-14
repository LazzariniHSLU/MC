#include <hidef.h> /* for EnableInterrupts macro */
#include "derivative.h" /* include peripheral declarations */




/**
* Switch on Rear LEDs on Port D2
*/
void initPorts(void)
{
	PTDDD = 0x04;
}
/**
* TPM1: Counter running with frequency 1 MHz
* - No TOF interrupt
* - Modulo = default
* - Prescale = 1
*/
void initTimer(void)
{
	TPM1SC_TOF = 0;
	TPM1C2SC = 0;
	TPM1C3SC = 0;
	TPM1C2SC_MS2B = 1;  // Edge Aligned Mode
	TPM1C3SC_MS3B = 1;  // Edge Aligned Mode
	TPM1C2SC_ELS2A = 1; // High Pulse
	TPM1C3SC_ELS3A = 1;  // High Pulse
	TPM1SC_PS = 1;		// Prescaler = 1
	TPM1MOD = 100;		//Modulo
	TPM1SC_CLKSx = 2;  // Clock 1Mhz
}

/**
* main program
*/
void main(void)
{	initPorts(); // Port init
	initTimer(); // Timer init
	for(;;)
	{
		TPM1C3V = 25;
		TPM1C2V = 25;
		__RESET_WATCHDOG();
	}
}
