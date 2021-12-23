clear all
clc
A = []; %set to empty since no linear inequality constraints are applied
b = []; %set to empty since no linear inequality constraints are applied
Aeq = []; %set to empty since no linear equality constraints are applied
beq = []; %set to empty since no linear equality constraints are applied
% ______________setting lower and upper bounds for the parameters in the model____________________________
lb = [2,20,0,0,0,0,1,0];      %lower bound of parameters
ub = [30,90,2,6,2,2,50,2];    %upperbound of the parameters
IntCon = [1,7];               % indices of parameters that takes only integer values
nonlcon = []; %set to empty since non-linear constraints are not applied
options = gaoptimset('UseParallel',true); % set to "false" if parallel evaluations are not desires


tic
current_iteration=0;
k=0;
while k<2500
    current_iteration=current_iteration+1
    
    fun=@(sa) Error_file(sa);
    [x,fvalu] = ga(fun,8,A,b,Aeq,beq,lb,ub,nonlcon,IntCon,options);
    
    if fvalu<25.3 %set f value to filter acceptable parameters that gives optimum fit
        k=k+1
        parameters(k,:)=x; %parameter set x from current optimization is stored in "parameters" matrix
        Fvalue(k,:)=fvalu; %chi squared value corresponding to x parameter set is stored in "Fvalue" vector
    end
    if floor(k/5)==(k/5)
        save('workspace_saline_genetic')  %save workspace every 5 iterations 
    end
end
toc  % evaluate time elapsed


%"parameters [2500X8] matrix" variable stored in workspace should be used to plot distributions. 
%Data is stored as rows=individual optimization runs columns= parameters
 
