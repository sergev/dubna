      PROGRAM F500
      DIMENSION A(8,5),IW(8,5)
      DIMENSION V(5,20),W(20,10)
      M=8
      N=5
      MAXV=20
      NV=5
      EPS=1.E-10
      IOUT=1
      MA=8
      A(1,1)=0.799217  $ A(1,2)=0.864099  $ A(1,3)=0.160325
      A(1,4)=0.632229  $ A(1,5)=0.052457
      A(2,1)=0.466098  $ A(2,2)=0.375965  $ A(2,3)=0.596879
      A(2,4)=0.271234  $ A(2,5)=0.072917
      A(3,1)=0.791670  $ A(3,2)=0.887416  $ A(3,3)=0.650871
      A(3,4)=0.039460  $ A(3,5)=0.048344
      A(4,1)=0.367939  $ A(4,2)=0.400156  $ A(4,3)=0.476228
      A(4,4)=0.457051  $ A(4,5)=0.462931
      A(5,1)=0.845622  $ A(5,2)=0.513245  $ A(5,3)=0.942230
      A(5,4)=0.099140  $ A(5,5)=0.553517
      A(6,1)=0.341419  $ A(6,2)=0.891279  $ A(6,3)=0.227223
      A(6,4)=0.340023  $ A(6,5)=0.059538
      A(7,1)=0.800058  $ A(7,2)=0.926708  $ A(7,3)=0.638934
      A(7,4)=0.819688  $ A(7,5)=0.514403
      A(8,1)=0.464460  $ A(8,2)=0.330900  $ A(8,3)=0.811808
      A(8,4)=0.546348  $ A(8,5)=0.262904
      CALL LIHOIN(A,MA,M,N,MAXV,V,NV,NVEC,EPS,IOUT,W,IW)
      END
*EXECUTE
*
*
