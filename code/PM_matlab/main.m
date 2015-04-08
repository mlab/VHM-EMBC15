clear all 
load HM
 load PM_new
 load bug8_in
 t=0;
data=[];
 while t<=10000
     t=t+1;
     [node_table,path_table]=heart_model(node_table,path_table);
    % Sensing
     a_out=node_table{1,7};
     v_out=node_table{3,7};

     pace_param=pacemaker_new(pace_param, a_out, v_out, 1);
     % pacing
     node_table{1,6}=node_table{1,6} || pace_param.a_pace;
     node_table{3,6}=node_table{3,6} || pace_param.v_pace || kept{1,1}.InputSignal(t);


     % PAC
     %node_table{1,7}=1;
     % PVC
     %node_table{3,7}=1;
     
      data=[data,[node_table{1,6};node_table{2,6};node_table{3,6};pace_param.a_pace;pace_param.v_pace;kept{1,1}.InputSignal(t)]];
      
if t==1315
    1
end
 end
 figure
 
for i=1:size(data,1)
     subplot(size(data,1),1,i);
     plot(data(i,:));
end
     
