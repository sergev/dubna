      PROGRAM F004 B
      DOUBLE PRECISION A(2,3),B(3,4),C(4,4),T(4)
      DATA A/1.5D0,.5D0,.5D0,2.D0,.2D0,.4D0/,
     * B/.5D0 ,.1D0,2.D0,.1D0,1.D0,3.D0,.4D0,.3D0,1.D0,.2D0,.1D0,1.5D0/
C 1)  *****************************************************
      CALL DMMLT(2,3,4,A(1,1),A(1,2),A(2,1),B(1,1),B(1,2),B(2,1),
     *                 C(1,1),C(1,2),C(2,1),T)
      PRINT1,((A(I,J),J=1,3),I=1,2),((B(I,K),K=1,4),I=1,3),
     *       ((C(I,K),K=1,4),I=1,2)
C 2)  *****************************************************
      CALL DMMLT(2,3,2,A(1,1),A(1,2),A(2,1),A(1,1),A(2,1),A(1,2),
     *                 C(1,1),C(1,2),C(2,1),T)
      PRINT 2,((C(I,K),K=1,4),I=1,2)
C 3)  ******************************************************
      CALL DMMLT(4,3,4,B(1,1),B(2,1),B(1,2),B(1,1),B(1,2),B(2,1),
     *     C(1,1),C(1,2),C(2,1),T)
      PRINT 3,((C(I,K),K=1,4),I=1,4)
C 4)  ******************************************************
      CALL DMMLT(2,3,4,A(1,1),A(1,2),A(2,1),B(1,1),B(1,2),B(2,1),
     *     B(1,1),B(1,2),B(2,1),T)
      PRINT 4,((B(I,K),K=1,4),I=1,2)
C 5)  *****************************************************
      CALL DMMLA(2,3,4,A(1,1),A(1,2),A(2,1),B(1,1),B(1,2),B(2,1),
     *                 C(1,1),C(1,2),C(2,1))
      PRINT 5,((C(I,K),K=1,4),I=1,2)
C 6)  *****************************************************
      CALL DMMLS(2,3,4,A(1,1),A(1,2),A(2,1),B(1,1),B(1,2),B(2,1),
     *                 C(1,1),C(1,2),C(2,1))
      PRINT 6,((C(I,K),K=1,4),I=1,2)
C 7)  *****************************************************
      CALL DMNMA(2,3,4,A(1,1),A(1,2),A(2,1),B(1,1),B(1,2),B(2,1),
     *                 C(1,1),C(1,2),C(2,1))
      PRINT 7,((C(I,K),K=1,4),I=1,2)
C 8)  *****************************************************
      CALL DMNMS(2,3,4,A(1,1),A(1,2),A(2,1),B(1,1),B(1,2),B(2,1),
     *                 C(1,1),C(1,2),C(2,1))
      PRINT 8,((C(I,K),K=1,4),I=1,2)
 1    FORMAT(1H1,1X,2H1),20X,1HA/2(3X,3D30.15/)/20X,1HB/3(3X,4D25.15/)/
     *       20X,1HC/2(3X,4D25.15/))
 2    FORMAT(1X,2H2),20X,1HC/2(3X,4D25.15/))
 3    FORMAT(1X,2H3),20X,1HC/4(3X,4D25.15/))
 4    FORMAT(1X,2H4),20X,1HA/2(3X,4D25.15/))
  5   FORMAT(1X,2H5),20X,1HC/2(3X,4D25.15/))
  6   FORMAT(1X,2H6),20X,1HC/2(3X,4D25.15/))
  7   FORMAT(1X,2H7),20X,1HC/2(3X,4D25.15/))
  8   FORMAT(1X,2H8),20X,1HC/2(3X,4D25.15/))
      CALL EXIT
      END
*EXECUTE