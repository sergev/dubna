      PROGRAM D201
      DIMENSION Y(2)
      EXTERNAL ECARD
      PRINT 10
      X=1.
      H=0.21
      Y(1)=1.0
      Y(2)=1.1
      CALL DIFEQ1(1,ECARD,H,X,Y(1),Y(2))
      DO 1 I=1,20
      CALL DIFEQ 1(2,ECARD,H,X,Y(1),Y(2))
      PRINT 2,X,Y
  1   CONTINUE
  2   FORMAT(30X,F5.2,2F20.11)
  10  FORMAT(1H1///50X,9HTEST D201///32X,1HX,12X,2HY1,20X,2HY2//)
      END
      FUNCTION ECARD(X)
      DIMENSION Y(2)
      ECARD=-0.25/(X*X)
      RETURN
      END
*EXECUTE
*
*
