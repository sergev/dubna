      PROGRAM E406
      EXTERNAL FUNC
      COMMON /CHEDAT/ A,B,EPSIN,EPSOUT,MIN,MOUT,COEFF(65)  ,
     1POWCOF(65),STORE(65),IARR(12)  ,
     2 INSTOR(20)
      DOUBLE PRECISION A,B,EPSIN,EPSOUT,COEFF,FUNC,X,STORE,POWCOF
      CALL CHECAL (FUNC)
      END
      FUNCTION FUNC(X)
      DOUBLE PRECISION A,B,EPSIN,EPSOUT,MOUT,COEFF,FUNC,X
      FUNC=1.D0/(1.D0+X)
      RETURN
      END
*EXECUTE
COEFFICIENTS
1./(1.+X)
         0.D0                                1.D0
     1.D-18          28
PRINT CHEBYSHEV
 1 1
PUNCH CHEBYSHEV
 1 0
PUNCH CHEBYSHEV
 2 2CHEARGCHECOFNUMCOF1000 INDEXCHESUM
TERMINATE
*
*
