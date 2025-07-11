% Fuzzy_Optimize
function Fuzzyp_Optimize_GAMATLAB
warning off
tic
rng default

FitnessFunction = @kur_multiobjective; % Function handle to the fitness function
numberOfVariables = 4; % Number of decision variables
lb = 1*ones(1,4); % Lower bound
ub = 2000000000*ones(1,4); % Upper bound
A = [10 0 0 0]; % No linear inequality constraints
b = 100; % No linear inequality constraints
Aeq = [0 0 0 0]; % No linear equality constraints
beq = 0; % No linear equality constraints
options = optimoptions(@gamultiobj,'PlotFcns',@gaplotpareto);

%[x,Fval,exitFlag,Output] = gamultiobj(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,options);
[x,Fval,exitFlag,Output] = gamultiobj(@func,numberOfVariables,A,b,Aeq,beq,lb,ub,options);
%[x,fval,exitflag,output] = ga(@func,4,lb,ub,opts);
toc
end
%**************************************************************************
function fitness=func(x)
%only T
assignin('base', 'Ta_p', [x(1) x(2) x(3) x(4)]);

%sim('Fuzzy_PSO',2)
sim('DP_GAp',0.4);
% Step = stepinfo(Sys_Out.Data,Sys_Out.Time);
% fitness=(Step.Peak-1)+Step.Overshoot;
% fitness=max(Sys_Out1.Data);
fitness= 0.0001*max((Sysh_Out1.Data(end)))% + 0.0001*max((Sysh_Out2.Data(end))); %ITAE + IAU
end
