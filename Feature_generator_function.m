function [out] = Feature_generator_function(D,Fs)
% extracts 11 statistic features from a given signal



% Alocação de memória para a matriz de EAOs: 

eao = zeros(length(D)*10,5);
for sens=1:size(D,2)
for i=1
    X=D(:,sens);
    %for j=1:size(X,2)
    %    X(:,j) = X(:,j) - mean(X(:,j));
    %end
    
    % Cálculo dos indicadores:
    % Peak:
    xpeak = max(abs(X));
    % Mean:
    xmean = mean(X);
    % Mean Square:
    xmsq = mean(X.^2);
    % Root Mean Square:
    xrms = sqrt(mean(X.^2));
    %Squared mean root
    xsmr = (mean(abs(X).^(0.5))).^2;
    % Variance:
    xvar = var(X);
    % Standard deviation:
    xstd = std(X);
    % Skewness:
    xskew = skewness(X);
    % Kurtosis:
    xkurt = kurtosis(X);
    % Crest Factor:
    xcf = xpeak./xrms;
    %shape factor
    shapef=xrms/mean(abs(X));

%------------------------------------------------------
    % Cada linha representa uma EAO;
    % Cada coluna se refere a um canal (sensor).
    if i==1
       eao = [xpeak; xmean; xmsq; xrms; xsmr;  xvar; xstd; xskew; xkurt; xcf; shapef];    
    else
    eao=[eao,[xpeak; xmean; xmsq; xrms; xsmr;  xvar; xstd; xskew; xkurt; xcf; shapef]];
    end
end
        allsensors(:,:,sens)=eao;
end
out=allsensors;
end
