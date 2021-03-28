A = xlsread('example.xlsx');
M = cell(1, length(4:5:size(A,1))); %Preallocate M for speed
Mag = cell(1,length(4:5:size(A,1))); %Preallocate Mag for speed
costheta = cell(1,length(4:5:size(A,1))); %Preallocate costheta for speed
theta = cell(1,length(4:5:size(A,1))); %Preallocate theta for speed
Mdev = cell(1,length(4:5:size(A,1))); %Preallocate Mdev for speed
j = 1; k = 1; m=1; n=1; p=1;

for i= 4:5:size(A,1) 
    Mrr=A(i,2)*10^A(i,1);
    Mtt=A(i,4)*10^A(i,1);
    Mpp=A(i,6)*10^A(i,1);
    Mrt=A(i,8)*10^A(i,1);
    Mrp=A(i,10)*10^A(i,1);
    Mtp=A(i,12)*10^A(i,1);
%%%build the given full moment tensor%%%
    M{j} = [Mrr Mrt Mrp; Mrt Mtt Mtp; Mrp Mtp Mpp]; 
  j = j + 1;

%give two input parameters M0 of earthquake and C_ratio
    lambda=1; mu=0.7;
    C_eig_ratio=3/2*lambda/mu + 1;

%%%calculating scalar moment%%%
      M0( (i+1)/5 ) = A(i+1,11) * (10^A(i,1)); 
      
%calculate u.n or cos(theta) from the isotropic part of the moment tensor  
     costheta{m}=trace(M{2})/(2*M0( (i+1)/5 )*C_eig_ratio);   
     m=m+1;
    %theta{n}=acosd(costheta{m})
   % n=n+1;
     
%%%determining magnitudes%%%
    Mag{k}=A(i-3,7);
    if Mag{k}>5.1
       fprintf('Magnitude > 5.7 \n');
    end
    k=k+1;
    
%calculate the deviatoric part of the moment tensor from the full tensor
   
    %Mdev{p}= M{j} - (trace(M{j})/3)*eye(3,3);
    %p=p+1;
    %[eigvec_Mdev,eigval_Mdev]=eig(Mdev{p});


end
