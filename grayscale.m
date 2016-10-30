empty = ~any(size(dir(['data/gray', '/*.png' ]),1)); % guard against overwriting files

grayArray = cell(341);
for x = 10:350
    rgb = imread(['data/raw/img' num2str(x) '.png']);
    gray = rgb2gray(rgb);
    
    grayArray{x-9} = gray;
    if empty
        imwrite(gray, ['data/gray/img' num2str(x) '.png']);
    end
end

graybits = class(gray);
% April 11, 2014 frame corresponds to index 41 in grayArray
imshow(grayArray{41});
if ~exist('fig/fig1.png', 'file')
    imwrite(grayArray{41}, 'fig/fig1.png');
end
