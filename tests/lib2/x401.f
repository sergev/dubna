      PROGRAM X401
      DIMENSION PINV(10),EM(5),DRR(10)
      DATA PINV/.1,.2,.3,.4,.5,.6,.7,.8,.9,1./,
     *     EM/.938213,.13958,.000511,.4938,1.189/
      PRINT 5
      DO 2 J=1,5
      DO 1 I=1,10
      DRR(I)=STRAG(PINV(I),EM(J))
  1   CONTINUE
      PRINT 10,EM(J),DRR
  2   CONTINUE
  5   FORMAT(50X,9HTEST X401//)
  10  FORMAT(10X,3HEM=,F10.6//2(10X,5E20.11/))
      STOP
      END
*EXECUTE
*
*
