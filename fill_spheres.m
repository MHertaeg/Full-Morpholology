function zones = fill_spheres(image,radius,radius_map)
        [A,B,C] = size(image);
    SizeX = B;
    SizeY = A;
    SizeZ = C;
    [columns rows zstep] = meshgrid(1:SizeX, 1:SizeY, 1:SizeZ);
    combined = zeros(SizeY,SizeX,SizeZ);
    circlePixels = zeros(SizeY,SizeX,SizeZ);
    countpin = 0;
    for i = 1:A 
        for j = 1:B
            for k = 1:C
             if radius_map(i,j,k) >= radius % if distance to nearest solid voxel is less than sphere radius a sphere is placed
                 countpin = countpin+1;
                centerX = j;
                centerY = i;
                centerZ = k;
                circlePixels = (rows - centerY).^2 ...
                + (columns - centerX).^2 + (zstep - centerZ).^2 <= radius_map(i,j,k).^2;
                combined = combined + circlePixels;
             end
            end
        end
    end


    for i = 1:A 
        for j = 1:B
            for k = 1:C
            if combined(i,j,k)>0
                combined(i,j,k) = 1; % Accounts for overlap in sphere placement
            end
        end
        end
    end

    % wetting fluid 0
    % non-wetting fluid 1
    % geometry 2
     zones = combined + image*2;
    % % figure
    for i = 1:A 
        for j = 1:B
            for k = 1:C
            if zones(i,j,k)>2
                zones(i,j,k) = 2; 
            end
        end
        end
    end

end