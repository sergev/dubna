      PROGRAM C350 B
C
      DP=.1E-7
      PRINT 12,DP
      PRINT 11
C
      AIZ=0.
      AIEIZ=0.
      DO 1 I=1,4
      AIMZ=(I-1)*2.
      REZ=.25
      DO 2 J=1,5
      REZ=2*REZ
      CALL EXPEIZ(REZ,AIMZ,DP,RIZ,AIZ)
      REEIZ=RIZ
      AIEIZ=AIZ
      IF(REZ.LE.2..AND.AIMZ.EQ.0.) GO TO 5
      EX=EXP(-REZ)
      CO=COS(AIMZ)
      SI=SIN(AIMZ)
      RE=REZ*RIZ-AIMZ*AIZ
      AI=REZ*AIZ+AIMZ*RIZ
      REEIZ=EX*(CO*RE+SI*AI)
      AIEIZ=EX*(CO*AI-SI*RE)
 5    CONTINUE
      PRINT 10,I,J,REZ,AIMZ,REEIZ,AIEIZ
 2    CONTINUE
 1    CONTINUE
C
 11   FORMAT(2X,'I',2X,'J',3X,'REZ',2X,'AIMZ',10X,'REEIZ',12X,'AIEIZ')
 10   FORMAT(1X,2I3,2F5.2,2(2X,2E18.10))
 12   FORMAT(1X,'DP=',E10.2)
      END
*EXECUTE
*
*
