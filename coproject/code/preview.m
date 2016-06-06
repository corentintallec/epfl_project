close all;
clear all;

images = loadMNISTImages('data/train-images-idx3-ubyte');
labels = loadMNISTLabels('data/train-labels-idx1-ubyte');

figure()
rnd = randi(length(labels),15);
for i=1:15
    subplot(3,5,i)
    imshow(reshape(images(:,rnd(i)),[28,28]))
    title(['label: ', num2str(labels(rnd(i)))])
end