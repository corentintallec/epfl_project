%% LOADING DATA

clear all;
close all;
clc;

testSet = loadImages('./data/t10k-images.idx3-ubyte')';
testLabel = strtrim(cellstr(num2str(loadLabels('./data/t10k-labels.idx1-ubyte'))));
testLabelNum = loadLabels('./data/t10k-labels.idx1-ubyte');

% Change the model here
load('SVMModelsLin');
load('times');

classes = unique(testLabel);

%% PREDICT FOR LIN

prediction = zeros(10,10);

for i=1:numel(classes)
    display(['Classify for digit ', num2str(i-1)]);
    
    predictedLabels = predict(SVMModelsLin{i}, testSet);
    for j=1:length(predictedLabels)
        if predictedLabels(j) == 1        
           prediction(i, testLabelNum(j)+1) =  prediction(i,testLabelNum(j)+1) + 1;
        end

    end
    
    nbr = sum(predictedLabels);
    
    prediction(i,:) = prediction(i,:)./nbr*100;
end

prediction








