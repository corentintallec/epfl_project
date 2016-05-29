%% LOADING DATA
clear all;
trainSet = loadImages('./data/train-images.idx3-ubyte')';
trainLabel = strtrim(cellstr(num2str(loadLabels('./data/train-labels.idx1-ubyte'))));
%testSet = loadImages('./data/t10k-images.idx3-ubyte')';
%testLabel = strtrim(cellstr(num2str(loadLabels('./data/t10k-labels.idx1-ubyte'))));

SVMModelsLin = cell(9,1);
SVMModelsPol = cell(9,1);
SVMModelsRBF = cell(9,1);
classes = unique(trainLabel);

rng(1); % For reproductibility

trainingTimeLin = 0;
trainingTimePol = 0;
trainingTimeRBF = 0;

times = zeros(10,3);

%% TRAINING

for i = 1:numel(classes)
    display(['Start training for class ', num2str(i-1)]);
    idx = strcmp(trainLabel, classes(i)); % Create binary classes for each classifier
    
    display(['Start Linear Kernel']);
    tic;
    SVMModelsLin{i} = fitcsvm(trainSet , idx , 'KernelFunction', 'linear');
    times(i,1) = toc;
    display(['Finished training for Linear Kernel, Time taken: ', num2str(times(i))]);
    trainingTimeLin = trainingTimeLin + times(i,1);
end

save('SVMModelsLin.mat', SVMModelsLin);
save('trainingTimeLin.mat', trainingTimeLin);
 
for i = 1:numel(classes)
    display(['Start training for class ', num2str(i-1)]);
    idx = strcmp(trainLabel, classes(i)); % Create binary classes for each classifier
       
    display(['Start Polynomial Kernel']);
    tic;
    SVMModelsPol{i} = fitcsvm(trainSet , idx , 'KernelFunction', 'polynomial', 'PolynomialOrder', 4);
    times(i,2) = toc;
    display(['Finished training for Polynomial Kernel, Time taken: ', num2str(times(i))]);
    trainingTimePol = trainingTimePol + times(i,2);
end

save('SVMModelsPol.mat', SVMModelsPol);
save('trainingTimePol.mat', trainingTimePol);

for i = 1:numel(classes)
    display(['Start training for class ', num2str(i-1)]);
    idx = strcmp(trainLabel, classes(i)); % Create binary classes for each classifier
    
    display(['Start RBF Kernel']);
    tic;
    SVMModelsRBF{i} = fitcsvm(trainSet , idx , 'KernelFunction', 'rbf');
    times(i,3) = toc;
    display(['Finished training for RBF Kernel, Time taken: ', num2str(times(i))]);
    trainingTimeRBF = trainingTimeRBF + times(i,3);    
end

save('SVMModelsRBF.mat', SVMModelsRBF);
save('trainingTimeRBF.mat', trainingTimeRBF);
save('times.mat',times);

%% CLASSIFICATION


% classification
%tic;
%[PredictedLabel, accuracy, decisionValues] = svmpredict(testSet, testLabel, model);
%t2 = toc;
%hel
%disp(num2str(t1));
%disp(num2str(t2));
