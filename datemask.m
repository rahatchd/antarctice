empty = ~any(size(dir(['data/dm', '/*.png' ]),1)); % guard against overwriting files

maskArray = cell(341);
for n = 10:350
    bw = imread(['data/bw/img' num2str(n) '.png']);
    bw(50:90, 90:270) = 0;
    maskArray{n-9} = bw;
    if empty
        imwrite(bw, ['data/dm/img' num2str(n) '.png']);
    end
end

% April 11, 2014 frame corresponds to index 41 in maskArray
imshow(maskArray{41});
if ~exist('fig/fig3.png', 'file')
    imwrite(maskArray{41}, 'fig/fig3.png');
end
