      PROGRAM M408
      DIMENSION INT(10)
      N=5
      INT(1)=10 $ INT(2)=9 $ INT(3)=8 $ INT(4)=7
      INT(5)=6 $ INT(6)=5
      IWORD=IPACK(INT,N)
      PRINT 10, IWORD,IWORD
      DO 5 J=1,5
      K=JTH(IWORD,J)
      PRINT 11, K,K
 5    CONTINUE
 10   FORMAT(1H1,3X,9HPACK WORD,5X,O20,I10)
 11   FORMAT(/3X,14HUNPACK NUMBERS,5X,O20,3X,I10)
      END
*EXECUTE
*
*
