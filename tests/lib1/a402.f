      PROGRAM A402
C
C     TEST SUBROUTINE  SAME
C
      A = 0.0
      C = 0.1
      D=0.0
      PRINT 5
      DO 3 I=15,22
      B = A+C**I
      IF(SAME(A,B))  1,2,1
    1 PRINT 10,A,A,B,B
      GO TO 3
    2 PRINT 20,A,A,B,B
  5   FORMAT(1H1,50X,'COMPARE TWO WORD',40X,'TEST A402'/51X,16(1H*),
     140X,9(1H*)//)
 10   FORMAT(10X,'A AND B ARE NOT IDENTICAL',O20,E20.6/35X,O20,E20.6/)
 20   FORMAT(10X,'A AND B ARE IDENTICAL',O20,E20.6/31X,O20,E20.6/)
    3 CONTINUE
      STOP
      END
*EXECUTE
*
*
