clear;clc;
% k-means
disp("Euclidean distance")
acc_kmeans_euclidean = reshape(  kmeans_KW51('sqeuclidean')', 1,[]);
disp("Cityblock distance")
acc_kmeans_cityblock = reshape(  kmeans_KW51('cityblock')'  , 1,[]);
disp("Cosine distance")
acc_kmeans_cosine =    reshape(  kmeans_KW51('cosine')'     , 1,[]);

% QML
acc_qml = [54	56	48	63	50	85	50	77	50	74	50	56	51	85	50	82	86	84;...
           50	50	48	50	58	86	44	57	57	52	60	70	56	57	46	62	84	81];

Acc = [acc_kmeans_euclidean;acc_kmeans_cityblock;acc_kmeans_cosine; acc_qml];

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
legend("k-means (euclidean)","k-means (cityblock)","k-means (cosine)", "ours (1 Qubit)", "ours (2 Qubits)","Random threshold",'fontsize', 14)
xlabel("Sensor")
ylabel("Accuracy (%)")
title ("(c)")
set(gca, 'fontsize', 16, 'fontname', 'times')

newcolors = ["#ff8000"
             "#00ff00"
             "#ffff00"
             "#4a2377"
             "#f55f74"
             "#8cc5e3"
             "#0d7d87"];
colororder(newcolors)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) 1200 , 500]); %<- Set size