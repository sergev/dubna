      PROGRAM F010 B
      DOUBLE PRECISION A1(3,3),A2(3,3),A3(3,3),B1(3),B2(3),B3(3)
      DIMENSION R(3)
      DATA A1/2.D0,1.D0,3.D0,1.D0,-2.D0,2.D0,3.D0,1.D0,2.D0/,
     *     B1/9.D0,-2.D0,7.D0/
      DO 1 I=1,3
      DO 1 J=1,3
      A2(I,J)=A1(I,J)
 1    A3(I,J)=A1(I,J)
      DO 2 K=1,3
 2    B3(K)=B1(K)
      CALL DEQN(3,A1,3,R,IFAUL,1,B1)
      PRINT 3,B1,IFAUL
      CALL DINV(3,A2,3,R,IFAUL)
      PRINT 4,((A2(I,J),J=1,3),I=1,3)
      CALL DEQINV(3,A3,3,R,IFAUL,1,B3)
      PRINT 5,B3,IFAUL
      PRINT 6,((A3(I,J),J=1,3),I=1,3)
 3    FORMAT(1H1,'DEQN'/1X,2HB=,3D30.15,5X,6HIFAUL=,I3/)
 4    FORMAT(/1X,'DINV',1X,6HA(3,3)/3(10X,3D26.16/))
 5    FORMAT(/1X,'DEQINV'/1X,2HB=,3D30.15,5X,6HIFAUL=,I3/)
 6    FORMAT(/1X,'DEQINV',1X,6HA(3,3)/3(10X,3D30.15/))
      CALL EXIT
      END
*CALL PTIME
*EXECUTE
