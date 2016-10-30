empty = ~any(size(dir(['data/filter', '/*.png' ]),1)); % guard against overwriting files

filterArray = cell(341);
N = 10;
h = N^-2*ones(N,N);
for n = 10:350
    frame = imread(['data/dm/img' num2str(n) '.png']);
    for i = 1:3
        frame = imfilter(frame, h);
    end
    filterArray{n-9} = frame;
    if empty
        imwrite(frame, ['data/filter/img' num2str(n) '.png']);
    end
end

% April 11, 2014 frame corresponds to index 41 in filterArray
imshow(filterArray{41});
if ~exist('fig/fig4.png', 'file')
    imwrite(filterArray{41}, 'fig/fig4.png');
end

DFT = fft2(h);
