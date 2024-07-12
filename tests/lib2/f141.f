      PROGRAM F141
      DIMENSION X1(3),X2(3),X3(3),X(3),G1(9),G2(9),G3(9),G(9),G12(9),
     MG13(9),G23(9),XN(9),GN(9)
      DATA((G1(I),I=1,9)=1.,5.,6.,5.,2.,7.,6.,7.,3.)
      DATA((G2(J),J=1,9)=3.,8.,9.,8.,2.,6.,9.,6.,1.)
      DATA((G3(K),K=1,9)=5.,1.,3.,1.,6.,2.,3.,2.,7.)
      DATA((X3(I3),I3=1,3)=7.,8.,9.)
       DATA((X2(I2),I2=1,3)=4.,5.,6.)
       DATA((X1(I1),I1=1,3)=1.,2.,3.)
      DATA((G12(I12),I12=1,9)=0.1,0.4,0.5,0.4,0.2,0.7,0.5,0.7,0.3)
      DATA((G13(I13),I13=1,9)=0.2,0.5,0.6,0.5,0.3,0.8,0.6,0.8,0.4)
      DATA((G23(I23),I23=1,9)=0.3,0.1,0.2,0.1,0.4,0.6,0.2,0.6,0.5)
       CALL TRIVEC(X1,X2,X3,X,G1,G2,G3,G12,G13,G23,G)
       PRINT 203
  203  FORMAT(/////,5X,39HTRIVEC(X1,X2,X3,G1,G2,G3,G12,G13,G23,G),///)
      PRINT 101,(X1(I),I=1,3)
      PRINT 102,(X2(I),I=1,3)
      PRINT 103,(X3(I),I=1,3)
      PRINT 104,(X (I),I=1,3)
      PRINT 105,(G1(I),I=1,9)
      PRINT 106,(G2(I),I=1,9)
      PRINT 107,(G3(I),I=1,9)
       PRINT 109,(G12(I),I=1,9)
       PRINT 110,(G13(I),I=1,9)
       PRINT 111,(G23(I),I=1,9)
      PRINT 108,(G (I),I=1,9)
  101 FORMAT(15X,5HX1(I),//,3F10.3,//)
  102 FORMAT(15X,5HX2(I),//,3F10.3,//)
  103 FORMAT(15X,5HX3(I),//,3F10.3,//)
  104 FORMAT(15X,5HX (I),//,3F10.3,//)
  105 FORMAT(15X,5HG1(I),//,3F10.3,//)
  106 FORMAT(15X,5HG2(I),//,3F10.3,//)
  107 FORMAT(15X,5HG3(I),//,3F10.3,//)
  108 FORMAT(15X,5HG (I),//,3F10.3,//)
  109 FORMAT(15X,6HG12(I),//,3F10.3)
  110 FORMAT(15X,6HG13(I),//,3F10.3)
  111 FORMAT(15X,6HG23(I),//,3F10.3)
  112 FORMAT(15X,5HXN(I),//,3F10.3,//)
  113 FORMAT(15X,5HGN(I),//,3F10.3,//)
  114 FORMAT(10X,2HGU,//,5X,F15.5,//)
  115 FORMAT(10X,2H U,//,5X,F15.5,//)
       END
*EXECUTE
*
*
