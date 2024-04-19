function helperPopulateScene(scene, groundTruthVehicle)
%HELPERPOPULATESCENE Populate driving scenario and add visualization. This
%   function is only in support of the
%   VisualInertialOdometryUsingSyntheticDataExample. It may change in a
%   future release.

%   Copyright 2018-2019 The MathWorks, Inc.

% Use the same waypoints as the trajectory to specify the road centers,
% with additional values to ensure certain segments will be straight.
roadCenters = [   -20      0 0;
               -19.99      0 0;
               199.99      0 0;
                  200      0 0;
                  200     50 0;
                  200  50.01 0;
                  200 229.99 0;
                  200    230 0;
                  215    245 0;
               215.01    245 0;
               259.99    245 0;
                  260    245 0;
                  290    240 0;
                  310    258 0;
                  290    275 0;
                  260    260 0;
               259.99    260 0;
               -19.99    260 0;
                  -20    260 0];

road(scene, roadCenters, 'Lanes', lanespec([1 2]));

% Populate the scenario with buildings on either side of the road.
% Layout building in increasing Y, then increasing X

buildingColor = [250 235 215] / 255;

actor(scene, ...
    'Length', 50, ...
    'Width', 30, ...
    'Height', 80, ...
    'Position', [25 -30 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 20, ...
    'Width', 30, ...
    'Height', 100, ...
    'Position', [70 -30 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 20, ...
    'Width', 30, ...
    'Height', 180, ...
    'Position', [100 -30 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 60, ...
    'Width', 30, ...
    'Height', 120, ...
    'Position', [153 -30 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 50, ...
    'Width', 85, ...
    'Height', 60, ...
    'Position', [242 -15 0], ...
    'Yaw', 135, ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 30, ...
    'Width', 30, ...
    'Height', 120, ...
    'Position', [5 30 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 50, ...
    'Width', 30, ...
    'Height', 80, ...
    'Position', [60 30 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 90, ...
    'Width', 20, ...
    'Height', 70, ...
    'Position', [145 25 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 30, ...
    'Width', 40, ...
    'Height', 180, ...
    'Position', [235 70 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 50, ...
    'Width', 160, ...
    'Height', 50, ...
    'Position', [160 140 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 30, ...
    'Width', 40, ...
    'Height', 180, ...
    'Position', [235 140 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 30, ...
    'Width', 50, ...
    'Height', 160, ...
    'Position', [235 205 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 30, ...
    'Width', 40, ...
    'Height', 100, ...
    'Position', [10 225 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 80, ...
    'Width', 30, ...
    'Height', 80, ...
    'Position', [80 230 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 20, ...
    'Width', 60, ...
    'Height', 150, ...
    'Position', [335 260 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 85, ...
    'Width', 30, ...
    'Height', 130, ...
    'Position', [60 290 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 15, ...
    'Width', 40, ...
    'Height', 170, ...
    'Position', [125 295 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 15, ...
    'Width', 40, ...
    'Height', 160, ...
    'Position', [155 295 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 15, ...
    'Width', 40, ...
    'Height', 160, ...
    'Position', [190 295 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 50, ...
    'Width', 20, ...
    'Height', 80, ...
    'Position', [235 285 0], ...
    'PlotColor', buildingColor);

actor(scene, ...
    'Length', 18, ...
    'Width', 40, ...
    'Height', 110, ...
    'Position', [300 310 0], ...
    'PlotColor', buildingColor);

% Create the figure. Reuse an existing figure if one with the same tag is
% already open.
figScene = findall(0, 'Type', 'Figure', 'Tag', 'VIODemoDisplay');
if isempty(figScene)
    figScene = figure('Name', 'Driving Scenario', ...
        'Tag', 'VIODemoDisplay', 'Position', [0, 0, 1032, 600]);
    movegui(figScene, [0 -1]);
else
    figure(figScene);
end
clf(figScene);

% Plot the top view of the scene.
hTopViewPanel = uipanel(figScene, 'Position', [0 0 0.5 1], ...
    'Title', 'Bird''s Eye View');
hTopViewAxes = axes(hTopViewPanel);
plot(scene, 'Parent', hTopViewAxes);
xlim(hTopViewAxes,[-20 350])
ylim(hTopViewAxes,[-50 350])
zlim(hTopViewAxes,[0 200])
view(hTopViewAxes,-85,60)
unifyVehicleColors(hTopViewAxes);

% Plot the chase view of the scene from the rear of the vehicle.
hChaseViewPanel = uipanel(figScene, 'Position', [0.5 0 0.5 1], ...
    'Title', 'Chase View');
hChaseViewAxes = axes(hChaseViewPanel);
chasePlot(groundTruthVehicle, 'Parent', hChaseViewAxes);
xlim(hChaseViewAxes,[-20 350])
ylim(hChaseViewAxes,[-50 350])
zlim(hChaseViewAxes,[0 200])
unifyVehicleColors(hChaseViewAxes);

drawnow;

end

function unifyVehicleColors(ax)
%UNIFYVEHICLECOLORS Match all vehicle colors in the input axes.

for i = 1:numel(ax.Children)
    p = ax.Children(i);
    numStr = extractAfter(p.Tag, 'ActorPatch');
    if ~isempty(numStr)
        num = str2double(numStr);
        if (num == 2)
            p.FaceColor = ax.ColorOrder(1,:);
            p.EdgeColor = 0.8*ax.ColorOrder(1,:);
            p.FaceAlpha = 0.3;
            p.EdgeAlpha = 0.3;
        end
    end
end
end
