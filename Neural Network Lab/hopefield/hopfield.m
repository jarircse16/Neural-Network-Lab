m=textread('input.txt');

wij=zeros(4,5);
mu=zeros(1000,5);

sum=0;
  for i=1:4
      for j=1:5
          if i==j
              wij(i,j)=0;
          else
          for s=1:4
              sum=sum+m(s,i)*m(s,j);
          end   
          wij(i,j)=sum;
          sum=0;
          end
      end
          
          end
 
  wij;
 mu(1,:)=[-1 1 -1 1 1];
 
 %%
 
 row=1;
 for it=1:6
 for i=1:4
     delta_mu=0;
     for j=1:5
         delta_mu=delta_mu+wij(i,j)*mu(row,j);
     end
     if delta_mu<0
     mu(row+1,i)=-1;
     else if delta_mu>0
         mu(row+1,i)=1;
         else
             mu(row+1,i)=0;
         end
     end
    
 end
  row=row+1;
   
       mu(row,:)
   
 end
     
      iteration=row;
     iteration
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
 