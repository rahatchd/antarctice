empty = ~any(size(dir(['data/bw', '/*.png' ]),1)); % guard against overwriting files

bwArray = cell(341);
for x = 10:350
    gray = imread(['data/gray/img' num2str(x) '.png']);
    bw = imbinarize(gray);
    
    bwArray{x-9} = bw;
    if empty
        imwrite(bw, ['data/bw/img' num2str(x) '.png']);
    end
end

% April 11, 2014 frame corresponds to index 41 in bwArray
imshow(bwArray{41});
if ~exist('fig/fig2.png', 'file')
    imwrite(bwArray{41}, 'fig/fig2.png');
end
