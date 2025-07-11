function out=TFC_xy(input)
Tay=evalin('base','Ta_y');
warning off;
errory=input(1);
errory_dot=input(2);
tfcy=newfis('tfc','sugeno');        % Sugeno Type FLC 


Sa1y=[3,3];    %Input and Output membership functions are equallt distributed
Sb1y=[1,1];    %Input and Output membership functions are equallt distributed
Sc1y=[50000000];  %Input and Output membership functions are equallt distributed


tfcy = addvar(tfcy,'input','error1',Tay(1)*[-10 10]);
tfcy = addvar(tfcy,'input','error_dot1',Tay(2)*[-10 10]);
tfcy = addvar(tfcy,'output','u1',[-10 10]);

% MF for input1 _ 5 Triangular Membership functions
tfcy = addmf(tfcy,'input',1,'NE','trapmf',Tay(1)*[-20      -10      -6     -Sa1y(2)]);         
tfcy = addmf(tfcy,'input',1,'NS','trimf' ,Tay(1)*[-6       -Sa1y(1)  0]);
tfcy = addmf(tfcy,'input',1,'ZE','trimf' ,Tay(1)*[-Sa1y(1)  0        Sa1y(1)]);
tfcy = addmf(tfcy,'input',1,'PS','trimf' ,Tay(1)*[ 0        Sa1y(1)  6]);
tfcy = addmf(tfcy,'input',1,'PO','trapmf',Tay(1)*[ Sa1y(2)  6        10     20]);

% MF for input2 _ 3 Triangular Membership functions
tfcy = addmf(tfcy,'input',2,'NS','trimf' ,Tay(2)*[-2      -Sb1y(1) 0 ]);
tfcy = addmf(tfcy,'input',2,'ZE','trimf' ,Tay(2)*[-Sb1y(1) 0       Sb1y(2)]);
tfcy = addmf(tfcy,'input',2,'PS','trimf' ,Tay(2)*[ 0       Sb1y(2) 2]);

% MF for output1 _ 7 Triangular Membership functions
tfcy = addmf(tfcy,'output',1,'NE' ,'constant',[-160000000]);                          
tfcy = addmf(tfcy,'output',1,'NSS','constant',[-100000000]);
tfcy = addmf(tfcy,'output',1,'NS' ,'constant',[-Sc1y(1)]);
tfcy = addmf(tfcy,'output',1,'ZE' ,'constant',[0]);
tfcy = addmf(tfcy,'output',1,'PS' ,'constant',[Sc1y(1)]);
tfcy = addmf(tfcy,'output',1,'PSS','constant',[100000000]);
tfcy = addmf(tfcy,'output',1,'PO' ,'constant',[160000000]);



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

tfcy=addrule(tfcy,rule_matrix);
out= evalfis([errory errory_dot],tfcy);