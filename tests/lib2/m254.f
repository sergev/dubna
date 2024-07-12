      PROGRAM M254
      DATA (A=1775400000000000B), (B=6002377777777777B) ,
     1  (C=2004522000000000B),
     2    (D=5773255777777777B), (E=0000000000000125B),
     3  (F=7777777777777652B)
      DATA (TXT1=6162636465666770B), (TXT2=2365222363646301B)
COMMENT  A=0.125 , B=-0.125 , C=10.5625 , D=-10.5625 , E=85 , F=-85
       TXT1=54.10
      A1=RBESM(A)  $ B1=RBESM(B) $ C1=RBESM(C)
       D1=RBESM(D)
        I=IBESM(E)  $  K=IBESM(F)
       PRINT 10, A,B,C,D,E,F,A1,A1,B1,B1,C1,C1,D1,D1,I,I,K,K
      TXTA=CRBESM(TXT1)  $  TXTB=CRBESM(TXT2)
      PRINT 20,TXT1,TXTA,TXTA
       PRINT 20, TXT2,TXTB,TXTB
 10     FORMAT(10X,'NUMBER CDC IN OCTAL' /15X,3O20,/15X,3O20,/10X,
     *  'IN BESM-6' ,2(/15X,2(O20,F15.6))/ 2(O20,I5))
 20      FORMAT(//3X,O20,10X,A6,O20)
        END
*CALL PTIME
*EXECUTE
*
*
