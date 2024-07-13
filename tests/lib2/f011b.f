      PROGRAM F011 B
      DOUBLE PRECISION A(3,3),B(3),Z(3,2),DET
      DATA A/2.D0,1.D0,3.D0,1.D0,-2.D0,2.D0,3.D0,1.D0,2.D0/,
     * B/9.D0,-2.D0,7.D0/,Z/9.D0,-2.D0,7.D0,9.12345D0,-2.1258D0,7.123D0/
      CALL DFACT(3,A,3,R,IF,DET,JF)
      PRINT 1,IF,JF,DET
      CALL DFEQN(3,A,3,R,1,B)
      PRINT 2,B
      CALL DFEQN(3,A,3,R,2,Z)
      PRINT 3,((Z(I,J),J=1,2),I=1,3)
      CALL DFINV(3,A,3,R)
      PRINT 4,((A(I,J),J=1,3),I=1,3)
 1    FORMAT(1H1,1X,'DFACT'/5X,'IFAIL=',I1,5X,'JFAIL=',I1,
     *       5X,'DET=',D26.16/)
 2    FORMAT(/1X,'DFEQN',5X,'B=',3D26.16)
 3    FORMAT(/1X,'DFEQN',5X,'Z'/(5X,2D26.16)/)
 4    FORMAT(/1X,'DFINV',5X,'A'/(5X,3D26.16)/)
      CALL EXIT
      END
*CALL PTIME
*EXECUTE