      PROGRAM E404
      DIMENSION COEFF(50),EPSOUT(1)
      COMMON /PDATA/IN,IP
      EXTERNAL FUNC
      A=0.
       B=1.
      EPSIN=1.E-10
       MIN=35
      PRINT 10
      CALL CHCOF1(A,B,EPSIN,MIN,COEFF,MOUT,EPSOUT,FUNC)
      PRINT 1,(COEFF(I),I=1,MOUT)
      PRINT 2,MOUT,EPSOUT
      STOP
   1  FORMAT((10X,5E20.11))
   2  FORMAT(10X,5HMOUT=,I2,10X,7HEPSOUT=,E17.11)
  10  FORMAT(///50X,9HTEST E404//30X,14HFUNC=1./(1.+X),10X,4HA=0.,5X,4HB
     1=1./30X,6HMIN=35,10X,12HEPSIN=1.E-10//50X,12HCOEFFICIENTS//)
      END
      FUNCTION FUNC(X)
      COMMON /PDATA/IN,IP
       FUNC=1./(1.+X)
      RETURN
      END
*EXECUTE
*
*
