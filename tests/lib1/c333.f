      PROGRAM C333
      COMPLEX CLOGAM,Z,A
      PRINT 3
      PRINT 10
      Z=(1.0,0.0)
      DO 1 L=1,10
      A=CLOGAM(Z)
      PRINT 2,Z,A
      Z=Z+(0.1,0.1)
  1   CONTINUE
      Z=(-2.0,0.0)
      A=CLOGAM(Z)
      PRINT 2,Z,A
  3   FORMAT(1H1)
 10   FORMAT(//25X'LOGARITHM OF THE COMPLEX GAMMA FUNCTION'15X'TEST C333
     1'/25X,39(1H*),15X,9(1H*)//15X'Z'33X'CLOGAM')
  2   FORMAT(10X'('F4.1','F4.1')'10X'('F20.15','F20.15')')
      END
*EXECUTE
*
*