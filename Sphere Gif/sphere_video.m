clear
loop = 2000;
v = VideoWriter('sphears2000.avi');
h = figure;
v.FrameRate = 60;
v.Quality = 100;
%disp(v)
open(v);

h.Visible = 'off';
for i = 1:loop
    sphere(i);
    axis equal
    title(i)
    %drawnow
    %disp(getframe)
    disp((i/loop) * 100)
    writeVideo(v, getframe(h));
end

h.Visible = 'on';
close(v);