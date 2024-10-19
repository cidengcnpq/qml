function [output] = hierarchical_clustering_KW51(linkage_method)
% Hierarchical Clustering results for KW51 bridge
%   linkage_method = 'single', 'complete', 'average', or 'ward'
% "d1"   : Damage scenario I
% "d2"   : Damage scenario II
disp("Hierarchical Clustering (running...)")
rng(1989) % for reproductibility
scenario = ["d0_2", "d1", "d2"];
for k=1:100
    for j = 1:3 % three compared scenarios
        %disp("Scenario:  "+scenario(j))
        for i=1:6   % sensors
            %disp("     Sensor:  "+int2str(i))
            % Hierarchical Clustering
            load("/MATLAB Drive/features_KW51_sensor"+int2str(i)+"_d0.mat") % reference
            X_train = features_data(1:100,:);
            load("/MATLAB Drive/features_KW51_sensor"+int2str(i)+"_"+scenario(j)+".mat") % compared scenario
            X_train= [X_train;features_data(1:100,:)];
            Y_train = [zeros(100,1);ones(100,1)]; % set reference labels = 0 and compared scenario label = 1
            % 100 samples (reference) + 100 samples (compared)

            % Compute the hierarchical clustering
            Z = linkage(X_train, linkage_method);

            % Cluster assignment
            idx = cluster(Z, 'Maxclust', 2);

            %%  Decide for the labels (Purity)
            if sum(idx(1:100)==1) > sum(idx(101:200)==1) % which dataset was most labeled = 1
                label_healthy = 1;
            else
                label_healthy = 2; %if not, it is most labeled 2, because it is a binary classification (1 or 2)
            end
            %%
            acc_hierarchical(j,i) = (  sum(idx(1:100)==label_healthy) + sum(idx(101:200)~=label_healthy)  )/2;
        end
    end
    mean_acc_hierarchical(:,:,k) = acc_hierarchical;
end
mean_acc_hierarchical = mean(mean_acc_hierarchical,3);
output = mean_acc_hierarchical;
end
