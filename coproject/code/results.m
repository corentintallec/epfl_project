clear all;
close all;

linear = [968 0 1 1 1 7 1 1 0 0; 0 1124 2 2 0 1 2 1 3 0; 10 2  970 9 6 3 9 8 14 1; ...
    1 0 17 952 0 14 0 12 13 1; 1 0 5 0 942 0 7 2 2 23; 8 4 4 32 5 807 9 1 19 3; ...
    7 2 9 1 3 13 923 0 0 0; 2 5 21 7 7 0 0 966 1 19; 3 5 5 23 7 28 6 5 888 4; ...
    7 5 1 13 29 3 1 15 4 931];

norm_linear = linear*diag(1./sum(linear',1));

result_linear = sum(diag(norm_linear))/10

pol = [970 0 1 0 0 5 1 1 2 0; 0 1123 2 2 1 0 4 0 3 0; 9 6 999 0 2 0 4 8 4 0; ...
    1 5 3 981 0 6 0 6 5 3; 3 2 3 0 960 0 4 1 1 8; 3 2 2 13 1 859 4 1 5 2; ...
    4 6 2 0 4 6 934 0 2 0; 0 14 8 2 1 0 0 997 0 6; 7 2 1 6 5 6 1 2 942 2; ...
    5 8 0 4 12 3 1 2 5 969];

norm_pol = pol*diag(1./sum(pol',1));

result_pol = sum(diag(norm_pol))/10


rbf = [974 0 1 0 0 2 0 1 2 0; 0 1128 3 1 0 1 0 1 1 0; 4 0 1017 0 1 0 0 7 3 0; ...
    0 0 2 997 1 2 0 4 3 1; 0 0 2 0 968 0 4 0 1 7; 2 0 0 5 1 877 3 1 2 1; ...
    3 2 0 0 2 2 948 0 1 0; 0 3 8 1 1 0 0 1007 1 7; 3 0 1 3 1 1 0 2 959 4; ...
    2 3 1 6 6 2 1 5 1 982];

norm_rbf = rbf*diag(1./sum(rbf',1));

result_rbf = sum(diag(norm_rbf))/10

figure()
imagesc(norm_rbf);
colormap(flipud(gray));
textStrings = num2str(rbf(:),'%0.0f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
[x,y] = meshgrid(1:10);
hStrings = text(x(:),y(:),textStrings(:),'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));
textColors = repmat(norm_rbf(:) > midValue,1,3);  
set(hStrings,{'Color'},num2cell(textColors,2));

set(gca,'XTick',1:10,...                         %# Change the axes tick marks
        'XTickLabel',{'0','1','2','3','4','5','6','7','8','9'},...  %#   and tick labels
        'YTick',1:10,...
        'YTickLabel',{'0','1','2','3','4','5','6','7','8','9'},...
        'TickLength',[0 0]);
ylabel('Prediction')
xlabel('Truth')
