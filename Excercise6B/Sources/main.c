#include <hidef.h> /* for EnableInterrupts macro */
#include "derivative.h" /* include peripheral declarations */



interrupt void toggleLED(void) {
	TPM1SC_TOF = 0;
	PTFD_PTFD1 = !PTFD_PTFD1; //LED R FL
	PTFD_PTFD2 = !PTFD_PTFD2; //LED R FR
}

void main(void) {
  /* include your code here */
  // init Port
  PTFDD_PTFDD1 = 1;
  PTFDD_PTFDD2 = 1;
  PTFD = 2;
  
  TPM1SC_PS = 16;
  TPM1MOD = 62499;
  TPM1SC_TOF = 0;
  TPM1SC_TOIE = 1; // enable Interrupt
  TPM1SC_CLKSx = 2; // Enable Global Interrupt
  
  EnableInterrupts;
  

  for(;;) {
    __RESET_WATCHDOG();	/* feeds the dog */
  } /* loop forever */
  /* please make sure that you never leave main */
}
