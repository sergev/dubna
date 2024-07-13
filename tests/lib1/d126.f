      PROGRAM D126
          DIMENSION XR(30),XI(30),GR(30),GI(30)
          COMMON/C/CR,CI
        EXTERNAL FU1
       PRINT101
        PRINT105
        H=.01
          CR=4.$CI=5.$A=.001$B=6.7$A=.02
       DO1I=1,6$GOTO(3,4,5,6,7,8),I
    3 A=.01$EPS=1.E-4$CR=400. $GOTO10
    4 B=.0$GOTO10
    5 B=4.$H=-.01$GOTO10
    6 A=.0$B=4.$H=.001$CR=30.$GOTO10
    7 B=3.$CR=10.$GOTO10
    8 CR=1.
   10 CONTINUE
        PRINT107,I
       IF(I.GE.5)GOTO11
        PRINT104,A,B,H,EPS,CR
          CALL VPINT(A,B,H,FU1,EPS,RR,NP,XR,GR,EPSR)
        IF(I.LT.5)GOTO1
   11 CONTINUE
          RRT=ALOG(ABS(COS(CR*A)/COS(CR*B)))/CR
        J1=3$K1=3
      DO13J=1,J1$H=.0001*10.**J$DO13K=1,K1$EPS=.00001*10.**K
       PRINT104,A,B,H,EPS,CR
          CALL VPINT(A,B,H,FU1,EPS,RR,NP,XR,GR,EPSR)
      DRR=ABS((RR-RRT)/RRT)
       PRINT103,RR,RRT,DRR
   13 CONTINUE
    1 CONTINUE
        S=1.5708
        PRINT106
       DO12J=1,3$DR=.1/10.**J
        PRINT104,A,B,H,DR,CR
        RR=CAUCHY(FU1,A,B,S,DR)
      DRR=ABS((RR-RRT)/RRT)
       PRINT103,RR,RRT,DRR
   12 CONTINUE
  100 FORMAT(//60X3HDT=E10.3//)
  101 FORMAT(1H1///////40X'THE TEST OF THE SUBROUTINE D126(VPINT)'/////)
  102 FORMAT(60XI2,/(10E13.5))
  103 FORMAT(//40X2HR=E12.5,5X3HRT=E12.5,5X3HDR=E12.5//)
  104 FORMAT(20X2HA=E10.3,5X2HB=E10.3,5X2HH=E10.3,5X4HEPS=E10.3,5X2HC=E1
     *0.3///)
  105 FORMAT(//40X39HTHE INTEGRAND FUNCTION IS F(X)=TAN(C*X)////)
  106 FORMAT(///55X'COMPARE WITH D104(CAUCHY)'//)
  107 FORMAT(1X ////55X9HEXSAMPLE I1///)
          END
          FUNCTION FU1(X)
      COMMON/C/C1,C2
      FU1=TAN(C1*X)
      RETURN
      END
*EXECUTE
*
*