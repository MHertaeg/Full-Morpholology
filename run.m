% Written by Michael Hertaeg

% Custom full morphology function to predict the level
% of infiltration at specified capillary pressure in porous
% media

% See readme file for details

clc
clear
close all

 tic
 radius_sweep = [4,5,9]; % Define sphere radii
 
geometry = load('example_geom.mat');  % load in geometry file - must be binarised image



    image = geometry.example_geom; % Convert struct to matrix
 radius_map = measure_distance(image); % Measure distance to nearest solid phase voxel
 save('radius_map.mat','radius_map')

 %%
for i = 1:length(radius_sweep)
    
   
zones = fill_spheres(image,radius_sweep(i),radius_map);  % Fill spheres of specified radius into void space

save(sprintf('zones R = %i.mat',radius_sweep(i)),'zones')

%% Example 2D slices of this matrix are displayed for each specified radius. Comment out if not required
figure
  imagesc(zones(:,:,20))
 shading interp
 view(0,90)
end

toc
 
 