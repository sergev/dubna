      PROGRAM J509 A
      DIMENSION ARRAY(10,10)
      DO 10 I=1,10
      READ 11,(ARRAY(I,J),J=1,10)
 11   FORMAT(10F8.3)
 10   PRINT 12,(ARRAY(I,J),J=1,10)
 12   FORMAT(1H ,10F8.3)
      CALL CONPRT(ARRAY,10,10,10,10,10,0.,10.)
      CALL EXIT
      END
*EXECUTE
      0.      0.      0.      0.      0.      0.      0.     0.      0.
      0.      3.      3.      3.      3.      3.      3.     3.      3.
      0.      3.      5.      5.      5.      5.      5.     5.      3.
      0.      3.      5.      8.      8.      8.      8.     5.      3.
      0.      3.      5.      8.     10.     10.      8.     5.      3.
      0.      3.      5.      8.     10.     10.      8.     5.      3.
      0.      3.      5.      8.      8.      8.      8.     5.      3.
      0.      3.      5.      5.      5.      5.      5.     5.      3.
      0.      3.      3.      3.      3.      3.      3.     3.      3.
      0.      0.      0.      0.      0.      0.      0.     0.      0.
*
*
