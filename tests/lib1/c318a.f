      PROGRAM C318 A
      DIMENSION X(11),AM(11)
      X(1)=1.5
      AM(1)=0.1
      DO 4 J=1,10
      DO 3 I=1,10
      CALL ELFUN (X(J),AM(I),SN,CN,DN)
      PRINT 2,X(J),AM(I),SN,CN,DN
      AM(I+1)=AM(I)+0.1
  3   CONTINUE
      X(J+1)=X(J)+2.
   4  CONTINUE
  2   FORMAT(5X,2HX=,F10.3,5X,3HAM=,F10.3,5X,3HSN=,E20.12,5X,
     * 3HCN=,E20.12,5X,3HDN=,E20.12)
      AM=0.44
      BM=0.47
      AB=AM/BM
      ABQ=SQRT(AB)
      Z=ELLICK(ABQ)
      PRINT 90,Z,AB
  90  FORMAT(5X,2E25.12)
      CALL ELFUN(Z,AB,SN,CN,DN)
      PRINT 100,SN,CN,DN
  100 FORMAT(5X,3E25.12)
      STOP
      END
*EXECUTE
*
*