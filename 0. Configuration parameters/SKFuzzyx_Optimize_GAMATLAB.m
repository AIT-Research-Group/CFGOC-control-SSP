% Fuzzy_Optimize
function SKFuzzyx_Optimize_GAMATLAB
warning off
tic
rng default

opts = optimoptions('ga','PlotFcn',{@gaplotbestf,@gaplotstopping,@gaplotdistance},...
                    'CrossoverFraction',0.5,'MutationFcn',{@mutationgaussian,1,.5},...
                    'PopulationSize',45,'MaxStallGenerations',100,'Display','iter');
FitnessFunction = @func; % Function handle to the fitness function
numberOfVariables = 4; % Number of decision variables
lb = 1*ones(1,4); % Lower bound
ub = 2000000000*ones(1,4); % Upper bound
A = []; % No linear inequality constraints
b = []; % No linear inequality constraints
Aeq = []; % No linear equality constraints
beq = []; % No linear equality constraints
%opts.PopulationSize = 1000;
%opts = optimoptions(opts,'MaxGenerations',300,'MaxStallGenerations', 100);
[x,Fval,exitFlag,Output] = gamultiobj(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,opts);
%[x,Fval,exitFlag,Output] = gamultiobj(@func,numberOfVariables,A,b,Aeq,beq,lb,ub,opts);
%[x,fval,exitflag,output] = ga(@func,4,lb,ub,opts);
toc
end
%**************************************************************************
function fitness=func(x)
%only T
assignin('base', 'Ta_x', [x(1) x(2) x(3) x(4)]);

%sim('Fuzzy_GA',2)
sim('DP_GAx',1);
% Step = stepinfo(Sys_Out.Data,Sys_Out.Time); %Adaptation law for GA_processing
% fitness=(Step.Peak-1)+Step.Overshoot;
Tau_robust=(((0.05^2+1)*(Sysh_Out2.Data(end)))/(2*0.05^2)) % Beta chosen 0.5;
fitness=0.01*max((Sysh_Out1.Data(end)))- 0.01*Tau_robust        %ITAE
gaproblem.PlotFcns=@gaplotbestf;
end
