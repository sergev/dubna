      PROGRAM G101
C         TEST CHISIN G101
      DIMENSION P(6),S(6,33)
      DIMENSION P2(6)
      DIMENSION NB(33),NA(6)
      DATA P/0.95, 0.8, 0.5, 0.2, 0.01, 0.005/
      DO 29 I=1,30
   29 NB(I)=I
      NB(31)=40
      NB(32)=60
      NB(33)=120
C     COMPUTE TABLE VALUES TO TEST CHISIN
      DO 20 I=1,6
      DO 20 NDEX= 1, 33
      N = NB(NDEX)
   20 S(I,NDEX) = CHISIN(P(I),N)
      PRINT 21
   21 FORMAT(1H1,10X,' TEST VALUES FOR CHISIN'//)
   42 CONTINUE
      PRINT 22,(P(I),I=1,6)
      PRINT 94
      DO 23 NDEX= 1, 33
      N = NB(NDEX)
   23 PRINT 24, N,(S(I,NDEX),I=1,6)
      PRINT 95
      PRINT 22,(P(I),I=1,6)
      PRINT 94
      DO 27 NDEX= 1, 33
      N = NB(NDEX)
      DO 26 I= 1, 6
      P2(I) = PROB(S(I,NDEX),N)
   26 CONTINUE
      PRINT 24,N,P2
   27 CONTINUE
   22 FORMAT (7X,6F18.9)
   24 FORMAT (2X,I5,6F18.9)
   94 FORMAT (1H )
   95 FORMAT (40H1  TEST IF INVERSE OF INVERSE IS 1          //)
      END
*EXECUTE
*
*