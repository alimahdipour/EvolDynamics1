

#######################################################
###                Moran model in                   ###
###      4-compartment model (Birth-Death)          ###
###   University of Waterloo, Waterloo,Canada       ###
###            copyright@AliMahdipour               ###
#######################################################

function [XX,YY] = Moran4BDCompSD(Ns,Nd,x,y,r1,r2,rr1,rr2,u1,u2,eta1,eta2)

b1 = rand;
alpha = rand;
d1 = rand;
N=Ns+Nd;
if( b1 <= (r1*(Ns-x))/(r1*(Ns-x)+r2*x + rr1*(Nd-y)+rr2*y) )
   if( alpha<= u1 && d1 > (Nd-y)/Nd )
        y=y-1;
    elseif( alpha > u1 && d1 > (Ns-x)/Ns)
        x=x-1; 
    end   

elseif( (r1*(Ns-x))/(r1*(Ns-x)+r2*x + rr1*(Nd-y)+rr2*y) < b1  &&  b1 <= (r1*(Ns-x)+r2*x)/(r1*(Ns-x)+r2*x + rr1*(Nd-y)+rr2*y) )  
    if( alpha<= u2 && d1 <= (Nd-y)/Nd )
        y=y+1;
    elseif( alpha > u2 && d1 <= (Ns-x)/Ns)
        x=x+1; 
    end
    
    
elseif( (r1*(Ns-x)+r2*x)/(r1*(Ns-x)+r2*x + rr1*(Nd-y)+rr2*y) < b1  &&  b1 <= (r1*(Ns-x)+ r2*x + rr1*(Nd-y))/(r1*(Ns-x)+r2*x + rr1*(Nd-y)+rr2*y) )  
    if( alpha<= eta1 && d1 > (Ns-x)/Ns )
        x=x-1;
    elseif( alpha > eta1 && d1 > (Nd-y)/Nd)
        y=y-1; 
    end
    
elseif( (r1*(Ns-x)+ r2*x + rr1*(Nd-y))/(r1*(Ns-x)+r2*x + rr1*(Nd-y)+rr2*y) < b1 ) 
    if( alpha <= eta2 && d1 <= (Ns-x)/Ns )
        x=x+1;
    elseif( alpha > eta2 && d1 <= (Nd-y)/Nd)
        y=y+1; 
    end
end

XX=x;
YY=y;

end

