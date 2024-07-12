      PROGRAM C400
C             THE EQUATION SYSTEM DEFINED IN FCN HAS AS SOLUTIONS
C             THE PERMUTATIONS OF  1., 2., 3.
C             THIS DRIVER PROGRAM CALLS NEWTON WITH STARTING
C             VALUES IN THE NEIGHBOURHOOD OF THESE SOLUTIONS USING
C             THE LIBRARY ROUTINES  PERMU (V202), AND RNDM (V104)
      COMMON /NEWTON/   HN,FN,IT
      DIMENSION X(3),F(3),DF(3,5)
      DIMENSION A(3),IA(3)
      NDIM1=3
      NDIM2=5
      N=3
C             MAXIT .LT. 0 FOR INTERMADIATE PRINTOUT
      MAXIT=-20
      HNSQ=1.E-12
      FNORM=1.E-12
      IA(1)=0
      A(1)=.5
      A(2)=1.5
      A(3)=2.5
      GO TO 10
    1 M=IA(1)
      Z1=A(M)
      M=IA(2)
      Z2=A(M)
      M=IA(3)
      Z3=A(M)
C             SET UP INITIAL VECTOR
      X(1)=RNDM(-1)+Z1
      X(2)=RNDM(-1)+Z2
      X(3)=RNDM(-1)+Z3
      PRINT 300,(X(I),I=1,3)
  300 FORMAT(20H1 INITIAL X VECTOR     ,3E20.11)
      CALL NEWTON(X,F,N,DF,NDIM1,NDIM2,HNSQ,FNORM,MAXIT,IFAIL)
      PRINT 100,(X(I),I=1,3),(F(I),I=1,3)
  100 FORMAT(/3H X=, 3E20.11,3H F=,3E20.11)
      PRINT 200,HN,FN,IT,IFAIL
  200 FORMAT(/1X,4H HN=,E20.12,4H FN=,E20.11,4H IT=,I3,7H IFAIL=,I2)
   10 CALL PERMU(IA,3)
      IF(IA(1).NE.0) GO TO 1
      STOP
      END
      SUBROUTINE FCN(X,F,N,DF,NDIM1,NDIM2,IFLAG)
      DIMENSION X(N),F(N),DF(NDIM1,NDIM2)
      GO TO (10,20,30) ,IFLAG
   10 IFLAG=0
C             SETTING IFLAG=0 INDICATES NO RESTRICTION ON DOMAIN
      RETURN
   20 F(1)=X(1)*X(2)*X(3) -6.
      F(2)=X(1)*X(2)+X(2)*X(3)+X(3)*X(1)-11.
      F(3)=X(1)**2+X(2)**2+X(3)**2 -14.
      RETURN
   30 DF(1,1)=X(2)*X(3)
      DF(1,2)=X(1)*X(3)
      DF(1,3)=X(1)*X(2)
      DF(2,1)=X(2)+X(3)
      DF(2,2)=X(1)+X(3)
      DF(2,3)=X(1)+X(2)
      DF(3,1)=2.*X(1)
      DF(3,2)=2.*X(2)
      DF(3,3)=2.*X(3)
      GO TO 20
      END
*EXECUTE
*
*
