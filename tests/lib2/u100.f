      PROGRAM U100
      DIMENSION K(2),M(41)
      CALL CLEBS(1,1,1,1,1,1,K,M)
      CALL CLEBS(6,3,4,1,2,3,K,M)
      CALL CLEBS(20,14,8,3,3,6,K,M)
      PRINT 1
      PRINT 2,K
      PRINT 3
      PRINT 4,M
      STOP
    1 FORMAT(50H0 FELD K ZAEHLER MIT VORZEICHEN UND NENNER VON C*C )
    3 FORMAT(23H0 FELD M-M(1) BIS M(41))
    2  FORMAT(10X,2F20.5)
    4 FORMAT(8(F10.5,2X))
      END
*EXECUTE
*
*
