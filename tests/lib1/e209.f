        PROGRAM E209
        COMMON/SPAPPR/SECD1,SECDN,VOFINT,IERR,NXY
          DIMENSION X(5),Y(5),DERIV(6,2),Z(8),FDERIV(9,2),FVALUE(8)
        DATA(X=0.1,0.13,0.17,0.21,0.28)
        DATA(Y=1.1052,1.1388,1.1853,1.2337,1.3231)
        DATA(Z=0.12,0.15,0.165,0.175,0.18,0.2,0.23,0.25)
        N=5
        NC=6
        M=8
        MC=9
       SECD1=0.0
        SECDN=0.0
      PRINT 10,N,X,Y,Z
        IOP=0
      PRINT 20
      DO 1 I=1,N
        CALL SPLIN3(X,Y,DERIV,N,NC,Z,FVALUE,FDERIV,M,MC,IOP)
  1   PRINT 2,DERIV(I,1),DERIV(I,2)
      PRINT 3
      DO 5 I=1,M
  5   PRINT 4,Z(I),FVALUE(I),FDERIV(I,1),FDERIV(I,2)
      PRINT 6,VOFINT,IERR
      X(2)=0.2
      PRINT 10,N,X,Y,Z
      CALL SPLIN3(X,Y,DERIV,N,NC,Z,FVALUE,FDERIV,M,MC,IOP)
      X(2)=0.13
      Z(1)=0.01
      PRINT 10,N,X,Y,Z
      CALL SPLIN3(X,Y,DERIV,N,NC,Z,FVALUE,FDERIV,M,MC,IOP)
      Z(1)=0.12
      Z(8)=0.3
      PRINT 10,N,X,Y,Z
      CALL SPLIN3(X,Y,DERIV,N,NC,Z,FVALUE,FDERIV,M,MC,IOP)
      Z(8)=0.25
      N=3
      PRINT 10,N,X,Y,Z
      CALL SPLIN3(X,Y,DERIV,N,NC,Z,FVALUE,FDERIV,M,MC,IOP)
  2   FORMAT(2X,2F30.18)
  3   FORMAT(10X,1HZ,15X,6HFVALUE,24X,11HFDERIV(M,1),19X,11HFDERIV(M,2))
   4  FORMAT(8X,F5.3,3(F30.18))
  6   FORMAT(20X,7HVOFINT=,F30.18,10X,5HIERR=,I1)
  10  FORMAT(//50X,9HTEST E209///20X,2HN=,I1/20X,2HX=,5(F6.4,1H,)/
     120X,2HY=,5(F6.4,1H,)/20X,2HZ=,8(F6.4,1H,))
  20  FORMAT(//20X,10HDERIV(N,1),10X,10HDERIV(N,2))
        END
*EXECUTE
*
*