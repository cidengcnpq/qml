%% script for extracting data and statistic features of KW-51 bridge 
clear;clc;
sr=825.8; %sampling rate
nvalues=2000;
%% Generate statistical features
for scenario=0:2
if scenario == 0 %before retrofitting (healthy)
FileInfo = dir('/MATLAB Drive/Generate_data_KW51/March - 4am');
elseif scenario == 1 %during retrofitting
FileInfo = dir('/MATLAB Drive/Generate_data_KW51/July - 4am');
elseif scenario == 2 %after retrofitting
FileInfo = dir('/MATLAB Drive/Generate_data_KW51/October - 4am');
end
FileInfo([1,2],:)=[];
sensor_name = ["aBD11Az", "aBD17Ay", "aBD17Az", "aBD17Cz", "aBD23Ay", "aBD23Az"];
for sens=1:6 %Sensor 1 to 6: 'aBD11Az', 'aBD17Ay', 'aBD17Az', 'aBD17Cz', 'aBD23Ay', 'aBD23Az'
    disp("extracting sensor: "+sensor_name(sens))
    cont=1;
for i=1:10
    load(strcat(FileInfo(i).folder, '/' , FileInfo(i).name))
    SampleLength = floor(size(predat_a.tdata(:,sens),1)/100); %length of each signal sample
    for j=1:10
sensor_data(cont,:)= predat_a.tdata(1+SampleLength*(j-1):SampleLength*j,sens).*10^3; %raw data is aplified by a factor of 10^3
features_data(cont,:)=Feature_generator_function(sensor_data(cont,:)',sr);
cont=cont+1;
    end
    disp("Signal sample #("+int2str(cont-1)+"/100)")
end
save("KW51_sensor"+int2str(sens)+"_d"+int2str(scenario),"sensor_data", '-v7')
features_data=normalize(features_data,"range"); %normalize statistics in scale [0,1]
save("features_KW51_sensor"+int2str(sens)+"_d"+int2str(scenario),"features_data", '-v7')
end
disp("Completed")
end
disp("KW-51 bridge data - completed")

%% Generate additional intact scenario for reference (d0_2)

FileInfo = dir('/MATLAB Drive/Generate_data_KW51/April - 4am');

FileInfo([1,2],:)=[];
sensor_name = ["aBD11Az", "aBD17Ay", "aBD17Az", "aBD17Cz", "aBD23Ay", "aBD23Az"];
for sens=1:6 %Sensor 1 to 6: 'aBD11Az', 'aBD17Ay', 'aBD17Az', 'aBD17Cz', 'aBD23Ay', 'aBD23Az'
    disp("extracting sensor: "+sensor_name(sens))
    cont=1;
for i=1:10 %day 1st to 10th
    load(strcat(FileInfo(i).folder, '/' , FileInfo(i).name))
    SampleLength = floor(size(predat_a.tdata(:,sens),1)/100); %length of each signal sample
    for j=1:10
sensor_data(cont,:)= predat_a.tdata(1+SampleLength*(j-1):SampleLength*j,sens).*10^3; %raw data is aplified by a factor of 10^3
features_data(cont,:)=Feature_generator_function(sensor_data(cont,:)',sr);
cont=cont+1;
    end
    disp("Signal sample #("+int2str(cont-1)+"/100)")
end
save("KW51_sensor"+int2str(sens)+"_d0_2","sensor_data", '-v7')
features_data=normalize(features_data,"range"); %normalize statistics in scale [0,1]
save("features_KW51_sensor"+int2str(sens)+"_d0_2","features_data", '-v7')
end
disp("Completed")

disp("KW-51 bridge additional intact scenario data - completed")
