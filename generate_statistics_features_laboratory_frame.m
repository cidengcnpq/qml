%linha é o numero de sinais
%coluna são os pontos com valores de aceleração
clear;clc;
%% Tempo
sr=500 %sampling rate
nvalues=2000;
tempo_LIS = [0:1/sr:(nvalues-1)/sr]; 
save("tempo_LIS","tempo_LIS", '-v7')
%% Generate statistical features
for scenario=0:2
for sens=1:4 %Sensor 1 to 4
for i=1:100
load("M"+int2str(scenario)+"_"+num2str(i,'%03.f')+".mat")
X_processed=X(find(X(:,sens)==max(X(:,sens))):end,sens);
sensor_data(i,:)=X_processed(1:2000);
features_data(i,:)=Feature_generator_function(sensor_data(i,:)',sr);
end
save("sensor"+int2str(sens)+"_d"+int2str(scenario),"sensor_data", '-v7')
features_data=normalize(features_data,"range"); %normalize statistics in scale [0,1]
save("features_sensor"+int2str(sens)+"_d"+int2str(scenario),"features_data", '-v7')
end
end

% Second healthy scenario for reference
for scenario=0
for sens=1:4 %Sensor 1 to 4
for i=1:100
load("M"+int2str(scenario)+"_"+num2str(i+100,'%03.f')+".mat")
X_processed=X(find(X(:,sens)==max(X(:,sens))):end,sens);
sensor_data(i,:)=X_processed(1:2000);
features_data(i,:)=Feature_generator_function(sensor_data(i,:)',sr);
end
save("sensor"+int2str(sens)+"_d"+int2str(scenario)+"_2","sensor_data", '-v7')
features_data=normalize(features_data,"range"); %normalize statistics in scale [0,1]
save("features_sensor"+int2str(sens)+"_d"+int2str(scenario)+"_2","features_data", '-v7')
end
end