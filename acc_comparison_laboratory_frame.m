clear;clc;
% k-means
acc_kmeans_euclidean = reshape(  kmeans_laboratory_frame('sqeuclidean')', 1,[])
acc_kmeans_cityblock = reshape(  kmeans_laboratory_frame('cityblock')'  , 1,[]);
acc_kmeans_cosine =    reshape(  kmeans_laboratory_frame('cosine')'     , 1,[]);

% QML
acc_qml = [54	53	47	61	66	75	46	67	57	87	57	55;...
           47	52	47	57	58	64	50	62	80	93	58	65];

Acc = [acc_kmeans_euclidean;acc_kmeans_cityblock;acc_kmeans_cosine; acc_qml];

subplot(2,2,1)
bar(Acc(:,1:4)')
ylim([0 100])
yline(50,'k--')
xlabel("Sensor")
ylabel("Accuracy (%)")
title ("(a)")
set(gca, 'fontsize', 16, 'fontname', 'times')

subplot(2,2,2)
bar(Acc(:,5:8)')
ylim([40 100])
yline(50,'k--')
xlabel("Sensor")
ylabel("Accuracy (%)")
title ("(b)")
set(gca, 'fontsize', 16, 'fontname', 'times')

subplot(2,2,3)
bar(Acc(:,9:12)')
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