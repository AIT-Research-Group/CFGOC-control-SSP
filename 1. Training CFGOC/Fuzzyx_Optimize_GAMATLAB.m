% Fuzzy_Optimize
function Fuzzyx_Optimize_GAMATLAB
warning off
tic
rng default

FitnessFunction = @kur_multiobjective; % Function handle to the fitness function
numberOfVariables = 3; % Number of decision variables
lb = 1*ones(-10,-1,-1.6*10^8); % Lower bound
ub = 200*ones(10,1,1.6*10^8); % Upper bound
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
assignin('base', 'Ta_x', [x(1) x(2) x(3)]);

%sim('Fuzzy_PSO',2)
sim('DP_GAx',0.4);
% Step = stepinfo(Sys_Out.Data,Sys_Out.Time);
% fitness=(Step.Peak-1)+Step.Overshoot;
% fitness=max(Sys_Out1.Data);
fitness= 0.0001*max((Sysh_Out1.Data(end)))% + 0.0001*max((Sysh_Out2.Data(end))); %ITAE + IAU
end
