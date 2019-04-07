/***********************************
 * Uebung 6.1
 */

#include <hidef.h> /* for EnableInterrupts macro */
#include "derivative.h" /* include peripheral declarations */





void main(void) {
  /* include your code here */
  PTFDD_PTFDD1 = 1;
  PTFDD_PTFDD2 = 1;
  PTFD = 2; 		//init LED
  
  TPM1SC_PS = 16;
  TPM1MOD = 62499; //
  TPM1SC_TOF = 0;
  TPM1SC_CLKSx = 2;

  for(;;) {
	  if(TPM1SC_TOF) {
		  TPM1SC_TOF = 0;
		  PTFD_PTFD1 = !PTFD_PTFD1;
		  PTFD_PTFD2 = !PTFD_PTFD2;
	  }
    __RESET_WATCHDOG();	/* feeds the dog */
  } /* loop forever */
  /* please make sure that you never leave main */
}
