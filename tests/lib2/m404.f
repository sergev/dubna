      PROGRAM  M404
      INTEGER FROM, TO
      READ 5,FROM
      DO 50 I=1,5
      READ 5,TO
  5   FORMAT(O16)
      READ 10,N1,N2
  10  FORMAT (I3,I3)
      PRINT 30,FROM
      PRINT 30,TO
  30  FORMAT(2X,O16)
      PRINT 40,N1,N2
  40  FORMAT(I3,I3)
      CALL IMBDZA(FROM,N1,N2,TO)
      PRINT 20,FROM
      PRINT 20,TO
  20  FORMAT(2X,O16)
  50  CONTINUE
      END
*EXECUTE
7777771234444444
7777777777777777
  1 47
7777777777777777
  0 46
7777777777777777
  3 11
7777777777777777
 35 47
7777777777777777
 46 47
*
*