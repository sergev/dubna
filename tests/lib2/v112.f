      PROGRAM V112
      DIMENSION N(10),P(10)
      DATA P/9*0.001,0.991/
      PRINT 3
      CALL CTIME(CT1,RT1)
      DO 100 I=1,100
      CALL MUNOMI(10,50,P,N,IERROR)
  100 CONTINUE
      CALL CTIME(CT2,RT2)
      RT=RT2-RT1
      PRINT 2,P,N,IERROR
      PRINT 1,RT
  1   FORMAT(50X,3HRT=,F7.2,3HSEC)
  2   FORMAT(5X,2HP=,10F10.3//5X,2HN=,10I4//5X,7HIERROR=,I2)
  3   FORMAT(50X,9HTEST V112///)
      STOP
      END
*EXECUTE
*
*
