      PROGRAM Z005
C     TEST OF DATEZB AND IDATZA
      DIMENSION A(2)
      CALL DATEZB(A)
      PRINT 1,A
      CALL IDATZA(I)
      PRINT 2,I
      STOP
  1   FORMAT(////6H DATA=,A6,A3)
  2   FORMAT(//7H IDATA=,I8)
      END
*EXECUTE
*
*