      PROGRAM E405
      DOUBLE PRECISION A,B,EPSIN,EPSOUT,COEFF,FUNC,X
       DIMENSION COEFF(65)
      EXTERNAL FUNC
      A=0.D0
      B=1.D0
      EPSIN=1.0D-20
      MIN=35
      PRINT 10
       CALL CHECOF(A,B,EPSIN,MIN,COEFF,MOUT,EPSOUT,FUNC)
      PRINT 1,(COEFF(I),I=1,MOUT)
      PRINT 2,MOUT,EPSOUT
      STOP
   1  FORMAT((10X,2D43.23))
   2  FORMAT(10X,5HMOUT=,I2,10X,7HEPSOUT=,D31.23)
  10  FORMAT(///50X,9HTEST E405//30X,19HFUNCT=1.D0/(1.D0+X),10X,6HA=0.D0
     1,5X,6HB=1.D0/30X,6HMIN=35,10X,13HEPSIN=1.0D-20//50X,
     2   12HCOEFFICIENTS//)
       END
       DOUBLE PRECISION FUNCTION FUNC(X)
      DOUBLE PRECISION A,B,EPSIN,EPSOUT,COEFF,FUNC,X
      FUNC=1.D0/(1.D0+X)
       RETURN
       END
*EXECUTE
*
*