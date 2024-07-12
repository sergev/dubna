      PROGRAM E221
      DIMENSION X(40),Y(40),DY(40)
      DATA X/0.,1.,2.,3.,4.,5.,6.,7.,8.,9.,10.,29*0./
      DATA Y/-2.,1.,4.,9.5,8.,14.,15.,18.,18.,23.,25.,29*0./
      DATA DY/40*1.0/
      DO 200 I=2,11
      CALL CHSLIN(X,Y,DY,I,A,B,RESMAX)
      PRINT 1985,I,A,B,RESMAX
 1985 FORMAT(I5,3F12.6,2X,2F12.6,2X,F12.6)
  200 CONTINUE
      STOP
      END
      SUBROUTINE CHSLIN(X,Y,DY,N,A,B,RESMAX)
C             EXAMPLE OF THE USE OF SUBROUTINE CHEB
C             FITS N POINTS (X,Y,DY) TO A STRAIGHT LINE USING
C             TNE CHEBYSHEV OR MINIMAX NORM.RAIGHT LINE USING
C             N MUST BE LESS THAN 49  (.LE. MDIM-2)LINE USING
C                  F. JAMES,SEPT.,1981(.LE. MDIM-2)LINE USING
      DIMENSION X(N),Y(N),DY(N)
      DIMENSION AC(5,50),BC(50),XC(5)
      NC=2
      NDIM=5
      MDIM=50
      MC=N
      DO 10 I=1,N
      BC(I)=Y(I)/DY(I)
      AC(1,I)=X(I)/DY(I)
      AC(2,I)=1.0/DY(I)
  10  CONTINUE
      TOL=1.0E-10
      RELERR=0.
      CALL CHEB (MC,NC,MDIM,NDIM,AC,BC,TOL,RELERR,XC,
     1           IRANK,RESMAX,ITER,ICODE)
      A=XC(1)
      B=XC(2)
      IF (IRANK.LT.2) GO TO 100
      IF (ITER.GT. 10) GO TO 100
      IF (ICODE.EQ.2) GO TO 100
      RETURN
  100 PRINT 1984,IRANK,ITER,ICODE,RESMAX
 1984 FORMAT (42H CHEB HAS TROUBLE  RANK,ITER,CODE,RESMAX=
     1         ,3I5,E12.4)
      RETURN
      END
*EXECUTE
*
*
