raw = VideoReader('nasa.mp4');

n = 0;
empty = ~any(size(dir(['data/raw', '/*.png' ]),1)); % guard against overwriting files
while hasFrame(raw)
    frame = readFrame(raw);
    time = raw.CurrentTime;
    if empty && time > 45 && time < 57
        imwrite(frame, ['data/raw/img' num2str(n) '.png']);
        n = n + 1;
    end
end

raw = VideoReader('nasa.mp4');
numFrames = raw.NumberOfFrames;
frameRate = raw.FrameRate;
dimensions = size(frame);
height = raw.Height;
width = raw.Width;
rgbbits = raw.BitsPerPixel;
