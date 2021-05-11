clear all
[FlNm,FlPath] = uigetfile('*.mov');
addpath( FlPath )
%%
VF = VideoReader( FlNm );
FPS = VF.NumFrames / VF.Duration;
NF = VF.NumFrames;
FPSst = strcat( 'Your video has a playback framing rate of', 32, num2str( FPS ), 'fps');
NFst = strcat( 'Your video has', 32, num2str( NF ), 32, 'frames');
disp( FPSst )
disp( NFst )
%%
ii = 1;
while hasFrame(VF)
    img = readFrame(VF);
    filename = [sprintf('%03d',ii) '.jpg'];
    filename = strcat( 'frame', filename );
    fullname = fullfile(FlPath,filename);
    imwrite(img,fullname)
    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
    ii = ii+1;
end