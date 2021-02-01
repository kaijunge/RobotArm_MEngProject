k = 5000;
l = 0.05;
D = 45;
d_0 = 0.01;


x = linspace(0,180,1000);
y = 2*k*l^2*cos(deg2rad(D))*sin(deg2rad(x))+...
    2*(d_0)*l*k*sin(deg2rad(D/2))*sin(deg2rad(x/2));

f = figure;
plot(x, y,'ButtonDownFcn',@lineCallback)


b = uicontrol('Parent',f,'Style','slider','Position',[81,54,419,23],...
              'value',D, 'min',0, 'max',180);
bgcolor = f.Color;
bl1 = uicontrol('Parent',f,'Style','text','Position',[50,54,23,23],...
                'String','0','BackgroundColor',bgcolor);
bl2 = uicontrol('Parent',f,'Style','text','Position',[500,54,23,23],...
                'String','180','BackgroundColor',bgcolor);
bl3 = uicontrol('Parent',f,'Style','text','Position',[240,25,100,23],...
                'String','Damping Ratio','BackgroundColor',bgcolor);
            
b.Callback = @(es,ed) updateSystem(x,y); 