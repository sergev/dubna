      PROGRAM D131 A
C        ПPИMEP B OПИCAHИИ 1985 Г.
      DIMENSION ZERO(50),V(50,2)
      COMPLEX SUM,ERROR,FEX,V
      EXTERNAL CKGAUS,FEX
      DO 1 I=1,50
  1   ZERO(I)=(I-1)*3.14159
      CALL CSUMIR(CKGAUS,0.,100.,0.,FEX,ZERO,20,V,1.E-9,SUM,ERROR,N,K)
      PRINT 2,SUM,ERROR,N,K
  2   FORMAT(1X,'SUM=',2E20.11,2X,'ERROR=',2E20.11,5X,2I3)
      STOP
      END
      COMPLEX FUNCTION FEX(X)
      FEX=(200.,200.)
      IF(X.EQ.0.) RETURN
      FEX=(2.,2.)*SIN(100.*X)/X
      RETURN
      END
*EXECUTE
*
*