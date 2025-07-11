function out=TFC_xx(input)
Tax=evalin('base','Ta_x');
warning off;
errorx=input(1);
errorx_dot=input(2);
tfcx=newfis('tfc','sugeno');        % Sugeno Type FLC 


Sa1x=[3,3];    %Input and Output membership functions are equallt distributed
Sb1x=[1,1];    %Input and Output membership functions are equallt distributed
Sc1x=[50000000];  %Input and Output membership functions are equallt distributed


tfcx = addvar(tfcx,'input','error1',Tax(1)*[-10 10]);
tfcx = addvar(tfcx,'input','error_dot1',Tax(2)*[-10 10]);
tfcx = addvar(tfcx,'output','u1',[-10 10]);

% MF for input1 _ 5 Triangular Membership functions
tfcx = addmf(tfcx,'input',1,'NE','trapmf',Tax(1)*[-20      -10      -6     -Sa1x(2)]);         
tfcx = addmf(tfcx,'input',1,'NS','trimf' ,Tax(1)*[-6       -Sa1x(1)  0]);
tfcx = addmf(tfcx,'input',1,'ZE','trimf' ,Tax(1)*[-Sa1x(1)  0        Sa1x(1)]);
tfcx = addmf(tfcx,'input',1,'PS','trimf' ,Tax(1)*[ 0        Sa1x(1)  6]);
tfcx = addmf(tfcx,'input',1,'PO','trapmf',Tax(1)*[ Sa1x(2)  6        10     20]);

% MF for input2 _ 3 Triangular Membership functions
tfcx = addmf(tfcx,'input',2,'NS','trimf' ,Tax(2)*[-2      -Sb1x(1) 0 ]);
tfcx = addmf(tfcx,'input',2,'ZE','trimf' ,Tax(2)*[-Sb1x(1) 0       Sb1x(2)]);
tfcx = addmf(tfcx,'input',2,'PS','trimf' ,Tax(2)*[ 0       Sb1x(2) 2]);

% MF for output1 _ 7 Triangular Membership functions
tfcx = addmf(tfcx,'output',1,'NE' ,'constant',[-160000000]);                          
tfcx = addmf(tfcx,'output',1,'NSS','constant',[-100000000]);
tfcx = addmf(tfcx,'output',1,'NS' ,'constant',[-Sc1x(1)]);
tfcx = addmf(tfcx,'output',1,'ZE' ,'constant',[0]);
tfcx = addmf(tfcx,'output',1,'PS' ,'constant',[Sc1x(1)]);
tfcx = addmf(tfcx,'output',1,'PSS','constant',[100000000]);
tfcx = addmf(tfcx,'output',1,'PO' ,'constant',[160000000]);



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

tfcx=addrule(tfcx,rule_matrix);
out= evalfis([errorx errorx_dot],tfcx);

