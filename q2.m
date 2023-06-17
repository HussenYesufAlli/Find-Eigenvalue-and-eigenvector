%##########################################################
%#####     Name: ALLI HUSSEN YESUF
%#####     Student ID: 722106020008
%##########################################################

% Define the matrix B
n = 4;
B = rand(n);

% Set the initial vector
u = ones(n, 1);


A = B + B.' % A = B + BTranspose
max_iterations = 10;
tolerance = 1e-6;

[eigen_value,eigen_vector]=invmi(A,u,tolerance,max_iterations)  % Resukts eigenvalue and eigenvector


function [s,y]=invmi(A,u,e,N) 
 k=1; r=0;  
 y=u./max(abs(u));  
 [L,U,P]=lu(A); % LU decomposition of A with pivoting
 px = P*y; % Apply pivot
 z=L\px; % solve via LU
 x=U\z;
 max_entry=max(x);% find the maximum entry in absolute value 
 s=1/max_entry;         
 if abs(max_entry-r)<eps  
    return
 end
 while abs(max_entry-r)>=e && k<=N % stopping rule
    if k==1
    disp('The system has started')
    end
    r=max_entry;
    y=x./max(abs(x));
    px = P*y;
    z=L\px;
    x=U\z
    max_entry = max(abs(x))  
    fprintf('Just finished iteration #%d\n', k);
    k=k+1;
 end
   [m,index]=max(abs(x)); 
    s=1/x(index); 
end
