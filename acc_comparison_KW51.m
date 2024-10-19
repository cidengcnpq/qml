clear;clc;
% k-means
disp("Euclidean distance")
acc_kmeans_euclidean = reshape(  kmeans_KW51('sqeuclidean')', 1,[]);
disp("Cityblock distance")
acc_kmeans_cityblock = reshape(  kmeans_KW51('cityblock')'  , 1,[]);
disp("Cosine distance")
acc_kmeans_cosine =    reshape(  kmeans_KW51('cosine')'     , 1,[]);

acc_hierarchical_complete =  reshape(hierarchical_clustering_KW51('complete'), 1,[]);
acc_hierarchical_average =  reshape(hierarchical_clustering_KW51('average'), 1,[]);
acc_hierarchical_ward =  reshape(hierarchical_clustering_KW51('ward'), 1,[]);

% QML
acc_qml = [54	56	48	63	50	85	50	77	50	74	50	56	51	85	50	82	86	84;...
           50	50	48	50	58	86	44	57	57	52	60	70	56	57	46	62	84	81;...
           45	59	49	49	46	80	48	73	58	49	85	71	41	52	44	49	67	78];

Acc = [acc_hierarchical_complete; acc_hierarchical_average; acc_hierarchical_ward; acc_kmeans_euclidean;acc_kmeans_cityblock;acc_kmeans_cosine; acc_qml];

subplot(2,2,1)
bar(Acc(:,1:6)')
ylim([40 100])
yline(50,'k--')
xlabel("Sensor")
ylabel("Accuracy (%)")
title ("(a)")
set(gca, 'fontsize', 16, 'fontname', 'times')

subplot(2,2,2)
bar(Acc(:,7:12)')
ylim([40 100])
yline(50,'k--')
xlabel("Sensor")
ylabel("Accuracy (%)")
title ("(b)")
set(gca, 'fontsize', 16, 'fontname', 'times')

subplot(2,2,3)
bar(Acc(:,13:18)')
ylim([40 100])
yline(50,'k--')
legend( "Hierarchical Clustering(complete)","Hierarchical Clustering(average)","Hierarchical Clustering(ward)", "k-means (euclidean)","k-means (cityblock)","k-means (cosine)", "ours (1 Qubit)", "ours (2 Qubits)","ours (3 Qubits)" ,"Random threshold",'fontsize', 11)
xlabel("Sensor")
ylabel("Accuracy (%)")
title ("(c)")
set(gca, 'fontsize', 16, 'fontname', 'times')

newcolors = [
"#33FF66"
"#33FFA5"
"#33FFB2"
"#FF5733"
"#FF6F33"
"#FF8A33"
"#3366FF"
"#3385FF"
"#3399FF"];
colororder(newcolors)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) 1200 , 500]); %<- Set size
