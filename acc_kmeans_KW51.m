% "d0_2" : Unseen intact scenario
% "d1"   : Damage scenario I
% "d2"   : Damage scenario II
clear;clc;
rng(1989) % for reproductibility
scenario = [ "d0_2", "d1", "d2"];
for k=1:100
    for j = 1:3 % three compared scenarios
        disp("Scenario:  "+scenario(j))
        for i=1:6   % sensors
            disp("     Sensor:  "+int2str(i))
            % k-means
            load("/MATLAB Drive/features_KW51_sensor"+int2str(i)+"_d0.mat") % reference
            X_train = features_data(1:100,:);
            load("/MATLAB Drive/features_KW51_sensor"+int2str(i)+"_"+scenario(j)+".mat") % compared scenario
            X_train= [X_train;features_data(1:100,:)];
            % 100 samples (reference) + 100 samples (compared)
            % Euclidean distance
            idx = kmeans(X_train,2,'Maxiter',1000,'Distance','sqeuclidean');
            % Cityblock distance
            %idx = kmeans(X_train,2,'Maxiter',1000,'Distance','cityblock');
            % Cosine distance
            %idx = kmeans(X_train,2,'Maxiter',1000,'Distance','cosine');
            %%  Decide for the labels (Purity)

            if sum(idx(1:100)==1) > sum(idx(101:200)==1) % which datased was most labeled = 1
                label_healthy = 1;
            else
                label_healthy = 2; %if not, it is most labeled 2, because it is a binary classification (1 or 2)
            end
            %%
            acc_kmeans(j,i) = (  sum(idx(1:100)==label_healthy) + sum(idx(101:200)~=label_healthy)  )/2;
        end
    end
    mean_acc_kmeans(:,:,k) = acc_kmeans;
end
mean_acc_kmeans = mean(mean_acc_kmeans,3)