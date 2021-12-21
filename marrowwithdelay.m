function dy = marrowwithdelay(t,y,n,U,R,R1,s,h,w)

%proliferation pool_______________________________________________

Q = -U*R*y(1)-U*R*y(1); 

A=zeros(n,1);
for i=1:1:n
    A(i)=2*U*R*y(i)-U*R*y(i+1)-U*R*y(i+1);
end

X=sum(y(1:1+n));

%maturation pool__________________________________________________

L = (U*R*R1*X)-(s*y(2+n)); 

B=zeros(h,1);
for i=1:1:h
    B(i)=s*y(1+n+i)-s*y(2+n+i);
end

%blood____________________________________________________________

C = s*(1/(R*R1))*y(2+n+h)- U*y(3+n+h);


%peritoneum______________________________________________________

V = w*y(3+n+h) - w*y(4+n+h);


dy=[Q;A;L;B;C;V];

end

% variables A and B keeps changing in length as the ...
%number of divisions to dilution and number of maturation compartments are varied in parameters.
% for loop is used allowing us to not hardwire the number of equations. 
% Indices in 'y'(the ODE solution vector) are appropriately  accessed to represent the compartment location. ... 
% for example, in line 25 y(2+n+h) represents the ...
% last maturation compartment in bonemarrow and y(3+n+h) represents the blood compartment.