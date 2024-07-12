      PROGRAM M450
      DIMENSION A2(4)
C     SENAS VARIANTAS  SPALIS IR ANKSCIAU.
      DIMENSION  B2(4),C2(4)
      DATA(B1=6HCAPITA),(B=6HMOSKAU)
      DATA(A1=6HACIPAT),(A=6HUAKSOM)
      DATA(A2=24H...KINGNOTYMB IS  WORRNS)
      DATA(B2=24HRNSYMB IS NOT WORKING...)
      DATA(A4=2001B),(A6=6HA15437),
      DATA(A8=6HTAIKAS),(B8=6HKASTAI)
      DATA(A9=6H   421),(B9=6H768765)
      DATA(I22=0B)
      DATA(I21=2001B),(A21=6H001025)
C     B=6H  MOSKAU   B1=6H  CAPITA
C     A=6H  UAKSOM   A1=6H  ACIPAT
      PRINT 5
    5 FORMAT(///,40X,23H1-ST  TEST  SUBP  RSYMB,//)
      DO 1 I=1,6
      J=7-I
      CALL   RSYMB(A,I,C,J)
      K1=(I/2)*2
      IF(I.EQ.K1) K=I-1
      IF(I.NE.K1) K=I+1
      CALL   RSYMB(A1,I,C1,K)
    1 CONTINUE
      IF(B.EQ.C.AND.B1.EQ.C1)  GO TO 10
      PRINT 6,B,B1
    6 FORMAT(2X,12HTRUE TEXT IS,2A6)
      PRINT 7,C,C1
    7 FORMAT(2X,12HREZULT. TEXT,2A6)
   10 CONTINUE
C   INITIAL TEXT   A2(4)=24H...KINGNOTYMB IS  WORRNS
C   REZULT  TEXT   B2(4)=   RNSYMB IS NUT WORKING...
      PRINT 15
   15 FORMAT(///,40X,23H2-ND  TEST  SUBP RNSYMB,//)
      DO 11 I=1,3
      J=I+3
      CALL  RNSYMB(A2,I,C2(4),J,1)
      CALL   RNSYMB(A2(4),J,C2,I,1)
   11 CONTINUE
      CALL   RNSYMB(A2,4,C2(3),6,4)
      CALL   RNSYMB(A2(2),2,C2(2),5,3)
      CALL   RNSYMB(A2(2),5,C2,4,7)
      CALL   RNSYMB(A2(3),6,C2(3),2,4)
      DO  12  I=1,4
      IF(B2(I).EQ.C2(I)) GO TO 12
      GO TO 13
   12 CONTINUE
      GO TO 20
   13 CONTINUE
      PRINT 16,B2
   16 FORMAT(2X,12HTRUE TEXT IS,4A6)
      PRINT 17,C2
   17 FORMAT(2X,12HREZULT. TEXT,4A6)
   20 CONTINUE
C     TEST  FOR  WRINT
      PRINT 25
   25 FORMAT(///,40X,23H3-RD  TEST  SUBP  WRINT,//)
      N11=0
      I4=1
      JAD1=1025
      LAD1=527348
      K=12
      CALL  WRINT(JAD1,C4,J,K,NFL1)
      IF(C4.NE.A4)  N11=N11+1
      CALL  WRINT(LAD1,C5,J,K,NFL2)
      IF(NFL2.EQ.0) N11=N11+1
      J=7
      CALL  WRINT(I4,C6,J,K,NFL3)
      IF(N11.EQ.0)  GO TO 30
      NF1=0
      NF2=-1
      NF3=-2
      PRINT 26,A4,NF1,NF2,NF3
   26 FORMAT(12HTRUE REZULT=,O16,3I12)
      PRINT 27,C4,NFL1,NFL2,NFL3
   27 FORMAT(12HREZULT WAS  ,O16,3I12)
   30 CONTINUE
C     TEST  FOR  RINT
      PRINT  35
   35 FORMAT(///,40X,25H4-TH TEST  FOR  SUBP RINT//)
      I6=15437
      I=2
      N=5
      N1=0
      CALL  RINT(A6,I,N,KADR,NFL1)
      IF(NFL1.NE.0) N1=N1+1
      IF(KADR.NE.I6) N1=N1+1
      I=1
      N=6
      CALL  RINT(A6,I,N,KRDR,NFL2)
      IF(NFL2.EQ.0)  N1=N1+1
      IF(N1.EQ.0) GO TO 40
      NF1=0
      NF2=1
      PRINT 36,I6,NF1,NF2
   36 FORMAT(11HTRUE REZULT,4X,4I12)
      PRINT 37,KADR,NFL1,NFL2
   37 FORMAT(11HREZULT WAS ,4X,4I12)
   40 CONTINUE
      PRINT  55
   55 FORMAT(///,40X,23H5-FTN  TEST  SUBP WRNGR,//)
      NFL7=0
      NF2=-3
      NF3=-1
      N=3
      N1=0
      I=1
      K=4
      LGR=8
      I9=0
      CALL  WRNGR(A8,I,C8,K,N,LGR,NFL1)
      IF(NFL1.NE.0) N1=N1+1
      CALL  WRNGR(A8,K,C8,I,N,LGR,NFL6)
      IF(NFL6.NE.0)   N1=N1+1
      IF(C8.NE.B8)  N1=N1+1
      LGR=7
      CALL  WRNGR(A8,I,C8,K,N,LGR,NFL2)
      IF(NFL2.NE.NF2)  N1=N1+1
      LGR=4
      N=-2
      CALL  WRNGR(A8,I,C8,K,N,LGR,NFL3)
      IF(NFL3.NE.NF3)  N1=N1+1
      N=6
      LGR=-5
      CALL  WRNGR(A8,I,C8,K,N,LGR,NFL4)
      IF(NFL4.NE.NF2) N1=N1+1
      IF(N1.EQ.0) GO TO 60
      PRINT  56,B8,NFL7,NFL7,NF2,NF3,NF2
   56 FORMAT(2X,12HTRUE  REZULT,2X,A6,5I12)
      PRINT  57,C8,NFL1,NFL6,NFL2,NFL3,NFL4
   57 FORMAT(2X,12HREZULT WAS  ,2X,A6,5I12)
   60 CONTINUE
      PRINT 65
   65 FORMAT(///,40X,23H6-TH  TEST  SUBP  RASPI ,//)
      I8=1249
      N=0
      J7=20
      K=20
      CALL  RASPI(I8,J7,K,I6)
      IF(I6.NE.I8)  N=N+1
      IF(N.EQ.0) GO TO  70
      PRINT 66,I8
   66 FORMAT(2X,12HTRUE RESULT ,5I12)
      PRINT 67,I6
   67 FORMAT(2X,12HREZULT WAS   ,5I12)
   70 CONTINUE
C     TEST FOR  SABP  RASPS
      PRINT 75
   75 FORMAT(///,40X,23H7-TH  TEST  SUBP RASPS //)
      I6=421
      LS=6
      N=0
      I1=1
      I7=123768765
      J=40
      K=40
      CALL  RASPS(I6,J,K,C9,I1,LS)
      CALL  RASPS(I7,J,K,D9,I1,LS)
      IF(A9.EQ.C9.AND.B9.EQ.D9)  GO TO 80
      PRINT 76,A9,B9
   76 FORMAT(2X,12HTRUE REZULT ,2A6)
      PRINT 77,C9,D9
   77 FORMAT(2X,12HREZULT WAS  ,2A6)
   80 CONTINUE
      PRINT 85
   85 FORMAT(///,40X,25H8-TH TEST FOR SUBP COPYBI,//)
      J=48
      K=48
      I=48
      I6=1923
      CALL  COPYBI(I6,J,K,I9,I)
      I=24
      K=24
      CALL  COPYBI(I6,J,K,I7,J)
      CALL  COPYBI(I6,I,K,I7,I)
      IF(I6.EQ.I9.AND.I6.EQ.I7)  GO TO 90
      PRINT 86,I6,I6
   86 FORMAT(2X,12HTRUG REZULT ,2I12)
      PRINT 87,I9,I7
   87 FORMAT(2X,12HREZULT  WAS ,2I12)
   90 CONTINUE
C     TEST FOR  SUBP  RCIF
      PRINT 95
   95 FORMAT(///,40X,25H9-TH TEST FOR SUBP  RCIF,//)
      J=12
      K=12
      N1=0
      I=1
      I7=I22
      NF3=-2
      NF4=1
      N=6
      CALL RCIF(A21,1,N,I7,J,K,NFL1,NFL2)
      NF1=0
      NF4=1
      NF2=0
      IF(I7.NE.I21) N1=N1+1
      IF(NFL1.NE.0)  N1=N1+1
      IF(NFL2.NE.0) N1=N1+1
      I=0
      CALL RCIF(A21,I,N,I7,J,K,NFL3,NFL4)
      IF(NFL3.NE.NF3) N1=N1+1
      I=1
      CALL RCIF(A6,I,N,I7,J,K,NFL5,NFL6)
      IF(NFL5.NE.NF4) N1=N1+1
      IF(N1.EQ.0)  GO TO 100
      PRINT  96,A21,I21,NF1,NF1,NF3,NF4
   96 FORMAT(2X,12HTRUE REZULT ,2X,A6,5I12)
      PRINT 97,A21,I7,NFL1,NFL2,NFL3,NFL5
   97 FORMAT(2X,12HREZULT  WAS ,2X,A6,5I12)
  100 CONTINUE
      END
*EXECUTE
*
*
