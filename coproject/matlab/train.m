%% LOADING DATA
clear all;
close all;
clc;

trainSet = loadImages('./data/train-images.idx3-ubyte')';
trainLabel = strtrim(cellstr(num2str(loadLabels('./data/train-labels.idx1-ubyte'))));
%testSet = loadImages('./data/t10k-images.idx3-ubyte')';
%testLabel = strtrim(cellstr(num2str(loadLabels('./data/t10k-labels.idx1-ubyte'))));

SVMModelsLin = cell(10,1);
SVMModelsPol = cell(10,1);
SVMModelsRBF = cell(10,1);
classes = unique(trainLabel);

rng(1); % For reproductibility

trainingTimeLin = 0;
trainingTimePol = 0;
trainingTimeRBF = 0;

times = zeros(10,3);

%% TRAINING LIN

display('Start training for Linear Kernel');

for i = 1:numel(classes)
    display(['Start training for digit ', num2str(i-1)]);
    idx = strcmp(trainLabel, classes(i)); % Create binary classes for each classifier
    
    tic;
    SVMModelsLin{i} = fitcsvm(trainSet , idx , 'KernelFunction', 'linear');
    times(i,1) = toc;
    display(['Finished training for digit ', num2str(i-1), '; Time taken: ', num2str(times(i))]);
    trainingTimeLin = trainingTimeLin + times(i,1);
end

save('SVMModelsLin', 'SVMModelsLin','-v7.3');
save('times', 'times');

%% TRAINING POL

display('Start training for Polynomial Kernel');

load('times');
 
for i = 1:numel(classes)
    display(['Start training for digit ', num2str(i-1)]);
    idx = strcmp(trainLabel, classes(i)); % Create binary classes for each classifier
  
    tic;
    SVMModelsPol{i} = fitcsvm(trainSet , idx , 'KernelFunction', 'polynomial', 'PolynomialOrder', 4);
    times(i,2) = toc;
    display(['Finished training for digit ', num2str(i-1), '; Time taken: ', num2str(times(i))]);
    trainingTimePol = trainingTimePol + times(i,2);
end

save('SVMModelsPol', 'SVMModelsPol','-v7.3');
save('times', 'times');

%% TRAINING RBF

display('Start training for RBF Kernel');

load('times');

for i = 1:numel(classes)
    display(['Start training for digit ', num2str(i-1)]);
    idx = strcmp(trainLabel, classes(i)); % Create binary classes for each classifier
    
    tic;
    SVMModelsRBF{i} = fitcsvm(trainSet , idx , 'KernelFunction', 'rbf');
    times(i,3) = toc;
    display(['Finished training for digit ', num2str(i-1), '; Time taken: ', num2str(times(i))]);
    trainingTimeRBF = trainingTimeRBF + times(i,3);    
end

save('SVMModelsRBF', 'SVMModelsRBF','-v7.3');
save('times', 'times');