      PROGRAM C326
      DOUBLE PRECISION F,FP,G,GP
      DIMENSION F(101),  FP(101),G(101),GP(101),SIG(101)
      DIMENSION RHOA (6),ETAA(8)
      DATA(RHOA=5.,10.,15.,20.,25.,30.),(ETAA=0.1,1.,5.,10.,15.,20.,25.,
     130.)
      LMAX=20
      NETA=8
      NRHO=6
      LMAX1=LMAX+1
      DO 1 I=1,NETA
      ETA=ETAA(I)
      DO 3 J=1,NRHO
      PRINT 2
  2   FORMAT(1H1)
      RHOMAX=RHOA(J)
      PRINT 4,ETA,RHOMAX,LMAX
   4   FORMAT(40X,17HCOULOMB FUNCTIONS/1X,116(1H-)/
     120X,4HETA=,F5.1,4X,7HRHOMAX=,F5.1,4X,5HLMAX=,I2/1X,116(1H-)/
     28X,1HF,19X,2HFP,18X,1HG,19X,2HGP,18X,3HSIG/1X,116(1H-))
      IF(IFOVFL(1).EQ.1) GOTO 50
      CALL COUL2(F,FP,G,GP,SIG,RHOMAX,ETA,LMAX)
      DO 5 L=1,LMAX1
      PRINT 6,F(L),FP(L),G(L),GP(L),SIG(L)
  6   FORMAT (2X,5D20.5/)
    5 CONTINUE
   50 CONTINUE
      PRINT 7
  7    FORMAT(1X,116(1H-))
    3 CONTINUE
    1 CONTINUE
      END
*EXECUTE
*
*