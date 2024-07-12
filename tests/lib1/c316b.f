      PROGRAM C316 B
C  REGION OF COMPUTATION
      DIMENSION F(101)
      DOUBLE PRECISION F
      LMAX=20
      N=12
      A=5
      RO=0.00001
  30  IF(1.0-RO) 2,2,1
    1 RO=RO*10.0
      GOTO 90
    2 RO=RO+A
   90 B=10.0
   80 ETA=0.0
   10 ETA=ETA+B
      IF(IFOVFL(1).EQ.1) GOTO 20
      CALL COUL 1 (ETA,RO,LMAX,N,F)
      PRINT 200,ETA,RO,N,F(1)
      IF(ABS(ETA)-43.) 10,10,70
   20 PRINT 200,ETA,RO,N,F(1)
   70 IF(10.-B) 50,40,50
   40 B=-B
      GOTO 80
   50 IF(50.0-RO) 60,30,30
   60 CONTINUE
  200 FORMAT(15X,4HETA=,F6.1,9X,3HRO=,F7.4,9X,2HN=,I2,9X,5HF(1)=,D21.14)
      END
*EXECUTE
*
*
