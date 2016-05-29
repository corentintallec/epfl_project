function labels = loadLabels(fileName)
% This function is used to load the labels given a file

file = fopen(fileName, 'rb');

magicNumber = fread(file, 1, 'int32', 0, 'ieee-be');
assert(magicNumber == 2049, ['Bad magic number in ', fileName, '']);

numLabels = fread(file, 1, 'int32', 0, 'ieee-be');

labels = fread(file, inf, 'unsigned char');

fclose(file);

end

