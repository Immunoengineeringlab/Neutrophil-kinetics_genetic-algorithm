function [RMSD] = Error_file(parameters)

%===============================================
% data%===============================================
% %saline mean
tptvals=[33.16 38.18 58.23 46.37 35.96 31.32 20.56 6.67 1.18 1.08;
        3.30 1.16 19.36 29.43 57.98 56.12 45.10 13.78 1.55 2.40;
        1.78 2.27 12.06 11.49 42.42 49.86 35.47 11.53 4.98 1.66];   % mean values of percentage data formatted as [maturation pool data;
                                                                                                                        % blood data;
                                                                                                                        % peritoneum data]

% %saline standard deviations
standard=[8.37 3.95 7.79 4.44 11.06 7.58 7.33 7.70 0.86 0.93;  
        2.69 0.65 18.68 11.59 8.30 3.42 13.55 8.85 1.32 2.96;
        1.52 1.88 7.86 8.07 2.34 4.29 11.76 6.42 3.38 1.04];   % standard deviations of percentage neutrophil data at each time point [maturation pool data;
                                                                                                                                      % blood data;
                                                                                                                                      % peritoneum data]

tpts=[24 36 48 60 72 84 96 120 144 168]; % timepoints at wich the percentage data were collected (in hours)


%get parameters____________________________________________________________
inipar = parameters;
n=floor(inipar(1)); % number of divisions before EDU detection fails
IC=inipar(2); %initial percentage of tagged cells in proliferation pool
U=inipar(3);  %egress rate from blood compartment
R=inipar(4);  % ratio of number of neutrophils in blood to proliferation pool at steady state
R1=inipar(5); % ratio of number of neutrophils in proliferation pool to maturation pool at steady state
s=inipar(6);  % egress rate from maturation pool compartments
h=floor(inipar(7)); %number of maturation compartments
w=inipar(8); %egress rate from peritoneum
inter1=zeros(1,n); 
inter2=zeros(1,h);


%solving DDE_______________________________________________________________
tspan = [0 180];
y0 = [IC inter1 0 inter2 0 0];
[t,y] = ode45(@(t,y) marrowwithdelay(t,y,n,U,R,R1,s,h,w), tspan, y0);



%extracting data___________________________________________________________


mature=y(:,2+n:2+n+h);
y2=sum(mature,2);
y3=y(:,3+n+h);
y4=y(:,4+n+h);


%calculating RMSD__________________________________________________________
p1=interp1(t,y2,tpts);
p2=interp1(t,y3,tpts);
p3=interp1(t,y4,tpts);

RMSD=sum( ((p1-tptvals(1,:))./standard(1,:)).^2     +   ((p2-tptvals(2,:))./standard(2,:)).^2   +     ((p3-tptvals(3,:))./standard(3,:)).^2); % chi square estimation
    
end
