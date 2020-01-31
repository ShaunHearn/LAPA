function [] = Laplace()
%LAPLACE  Finite difference of Laplace equation
%   

% Solution Matrix
nx = 50;
ny = 50;

V = zeros(nx,ny);
copyV = zeros(nx,ny);

% Set boundary conditions
V(:,1) = 1;
V(:,nx) = 1;
V(1,:)= 0;
V(ny,:) =0;

% Set number of iterations and dx dy

dx = 0.02;
dy = 0.02;
numIt = 1000;

% Find solutions

j = 2:nx-1;
i = 2:ny-1;

figure('Name','Laplace Finite Solution')

for k=1:numIt
    copyV= V;
    
    V(i,j) = (dy^2*(copyV(i+1,j)+copyV(i-1,j))+dx^2*(copyV(i,j-1)+copyV(i,j+1)))/(2*(dx^2+dy^2));
    
    V(:,1)=1;
    V(:,nx)=1;
    V(1,:)=0;
    V(ny,:)=0;
    
    surf(V(i,j))
    pause(0.01)
    
    [X,Y] = gradient(V);
    E = sqrt(X.^2+Y.^2);
    
    %figure('Name','Laplace Finite Solution E total')
    %surface(E)
end

figure('Name','Laplace Finite Solution E')
quiver(X,Y)


