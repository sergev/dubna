      PROGRAM W700
C     **************
C
C     ***  CALCULATION OF NORMALIZED ISOSPIN COEFFICIENTS  ***
C
      DIMENSION M(7),ST3(20,20),WEIGHT(20)
      READ 10,TJ1,TM1,TJ2,TM2,DAT1,DAT2
 1000 READ 20,M
      NSP=0
      DO 1 I=1,7
    1 NSP=NSP+M(I)
      IF(NSP.LT.2) GO TO 99
      PRINT 100,DAT1,DAT2,TJ1,TM1,TJ2,TM2,M
      CALL NISCO (TJ1,TM1,TJ2,TM2,M,IZP,ST3,WEIGHT)
      PRINT 200,IZP
      DO 2 I=1,IZP
    2 PRINT 300,I,WEIGHT(I),(ST3(I,K),K=1,NSP)
      PRINT 400
      GO TO 1000
   99 PRINT 500
      STOP
   10 FORMAT (4F10.0/2A6)
   20 FORMAT (7I5)
  100 FORMAT (1H1 ///10X,54HRESULTS OF NORMALIZED ISOSPIN COEFFICIENTS C
     1ALCULATION/10X,54(1H*)//10X,2A6/////10X,24HBEAM   PARTICLE HAS  T
     2=,F4.1,12H   AND  T3 =,F5.1//10X,24HTARGET PARTICLE HAS  T =,F4.1,
     312H   AND  T3 =,F5.1///10X,6HM = ( ,7I2,3H  )/////)
  200 FORMAT (10X,12HNISCO OUTPUT///10X,36HNUMBER OF CHARGE CONFIGURATIO
     1NS IS  ,I3////10X,7HCONFIG.,4X,5HNISCO,5X,30HVALUES OF  T3  FOR SE
     2CONDARIES)
  300 FORMAT(/I14,F13.5,2X,15F6.1)
  400 FORMAT (///40X,40(1H-))
  500 FORMAT (/////10X,17HCALNIC NORMAL END/////)
      END
*EXECUTE
1.        -1.       0.5       0.5
 22.10.1970
    1    0    0    0    2    0    0
    1    0    0    0    3    0    0
    1    0    0    0    4    0    0
    0    0    0    0    0    0    0
*
*
