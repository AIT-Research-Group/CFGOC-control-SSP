function out=TFC_xp(input)
Tap=evalin('base','Ta_p');
warning off;
errorp=input(1);
errorp_dot=input(2);
tfcp=newfis('tfc','sugeno');        % Sugeno Type FLC 


Sa1p=[3,3];    %Input and Output membership functions are equallt distributed
Sb1p=[1,1];    %Input and Output membership functions are equallt distributed
Sc1p=[500000000000];  %Input and Output membership functions are equallt distributed


tfcp = addvar(tfcp,'input','error1',Tap(1)*[-10 10]);
tfcp = addvar(tfcp,'input','error_dot1',Tap(2)*[-10 10]);
tfcp = addvar(tfcp,'output','u1',[-10 10]);

% MF for input1 _ 5 Triangular Membership functions
tfcp = addmf(tfcp,'input',1,'NE','trapmf',Tap(1)*[-20      -10      -6     -Sa1p(2)]);         
tfcp = addmf(tfcp,'input',1,'NS','trimf' ,Tap(1)*[-6       -Sa1p(1)  0]);
tfcp = addmf(tfcp,'input',1,'ZE','trimf' ,Tap(1)*[-Sa1p(1)  0        Sa1p(1)]);
tfcp = addmf(tfcp,'input',1,'PS','trimf' ,Tap(1)*[ 0        Sa1p(1)  6]);
tfcp = addmf(tfcp,'input',1,'PO','trapmf',Tap(1)*[ Sa1p(2)  6        10     20]);

% MF for input2 _ 3 Triangular Membership functions
tfcp = addmf(tfcp,'input',2,'NS','trimf' ,Tap(2)*[-2      -Sb1p(1) 0 ]);
tfcp = addmf(tfcp,'input',2,'ZE','trimf' ,Tap(2)*[-Sb1p(1) 0       Sb1p(2)]);
tfcp = addmf(tfcp,'input',2,'PS','trimf' ,Tap(2)*[ 0       Sb1p(2) 2]);

% MF for output1 _ 7 Triangular Membership functions
tfcp = addmf(tfcp,'output',1,'NE' ,'constant',[-1600000000000]);                          
tfcp = addmf(tfcp,'output',1,'NSS','constant',[-1000000000000]);
tfcp = addmf(tfcp,'output',1,'NS' ,'constant',[-Sc1p(1)]);
tfcp = addmf(tfcp,'output',1,'ZE' ,'constant',[0]);
tfcp = addmf(tfcp,'output',1,'PS' ,'constant',[Sc1p(1)]);
tfcp = addmf(tfcp,'output',1,'PSS','constant',[1000000000000]);
tfcp = addmf(tfcp,'output',1,'PO' ,'constant',[1600000000000]);



rule_matrix =[   1     1     1     1     1;
                 1     2     2     1     1;
                 1     3     3     1     1;
                 2     1     2     1     1;
                 2     2     3     1     1;
                 2     3     4     1     1;
                 3     1     3     1     1;
                 3     2     4     1     1;
                 3     3     5     1     1;
                 4     1     4     1     1;
                 4     2     5     1     1;
                 4     3     6     1     1;
                 5     1     5     1     1;
                 5     2     6     1     1;
                 5     3     7     1     1;
];

tfcp=addrule(tfcp,rule_matrix);
out= evalfis([errorp errorp_dot],tfcp);

