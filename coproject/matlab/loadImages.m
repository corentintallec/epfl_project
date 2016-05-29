function images = loadImages(fileName)
% This function is used to load the images given a file

file = fopen(fileName, 'rb');

magicNumber = fread(file, 1, 'int32', 0, 'ieee-be');
assert(magicNumber == 2051, ['Bad magic number in ', fileName, '']);

numImages = fread(file, 1, 'int32', 0, 'ieee-be');
numRows = fread(file, 1, 'int32', 0, 'ieee-be');
numCols = fread(file, 1, 'int32', 0, 'ieee-be');

images = fread(file, inf, 'unsigned char');
images = reshape(images, numCols, numRows, numImages);
images = permute(images,[2 1 3]);

fclose(file);

% Reshape to #pixels x #examples
images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
% Convert to double and rescale to [0,1]
images = double(images) / 255;

end

