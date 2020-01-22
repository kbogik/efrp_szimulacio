#########AIC és BIC kritérium összehasonlítása###########

#parameter definialas, idosorhossz-N, szoras-sigmau2, d az AR-, f az MA konstansai
N<-100
sigmau2 <- 1
d <- structure(list(phi=c(0.1),phi2=c(0.1,0.1),phi3=c(0.1,0.1,0.1)));
f<-structure(list(ro=c(0.1),ro2=c(-0.3,0.3),ro3=c(-0.5,0.5,0.5)))
z<-c(1)

#hányszor futtatom
rn<-c(50)

#a kritériumok eredményeinek mátrixainak definiálása:
AICresults<-matrix(nrow=4,ncol=4,dimnames = list(c("q0","q1","q2","q3"), c("p0","p1","p2","p3")))
BICresults<-matrix(nrow=4,ncol=4,dimnames = list(c("q0","q1","q2","q3"), c("p0","p1","p2","p3")))
Results<-matrix(0,nrow=9,ncol=3) 

#####################################

for (pi in 1:3){ 
  for (qj in 1:3) {
    #N hosszus idősor generálása ARMA(1,1)-től ARMA(3,3)-ig
    phi<-d[[pi]]
    psi<-f[[(qj)]]
    
    #futtatás ismételten
    for(running in 1:rn){
      YARMA<-arima.sim(list(order = c(pi,0,qj),ar=phi,ma=psi),N,sd=sigmau2)
      
      #model fitting majd kriterium ertek szamitas
      for (pj in 0:3) {
        for (qi in 0:3) {
          #ARMA(0,0)-ra nem számolok
          if( qi==0 && pj==0){
          }else{
            fit<-arima(YARMA,order=c(pj,0,qi),method="ML")
            BICresults[pj+1,qi+1]<-BIC(fit)
            AICresults[pj+1,qi+1]<-fit[[6]]}
          next
        }
        next
      }
      
      #megadom az adott ARMA folyamatra, hogy hol helyezkedne el a 4p*4q értékű mátrixban
      #majd amennyiben a kritérium megtalálta az eredeti ARMA folyamatot, elhelyezem az eredménymátrixban
      
      parameter<-c(1+4*qj+pi)
      parameter2<-c(10*pi+qj)
      
      Results[z,1]<-c(parameter2)
      if (which.min(AICresults)==c(1+4*qj+pi)){
        Results[z,2]<-Results[z,2]+1/rn
      }
      
      if (which.min(BICresults)==c(1+4*qj+pi)){
        Results[z,3]<-Results[z,3]+1/rn
      }
      
      next
    }
    z<-z+1
    next
  }
  next
}