function radius_map = measure_distance(image)
    [A,B,C] = size(image);
    Radius_map = zeros(size(image));

       for ypixel = 1:A
        for xpixel = 1:B
            for zpixel = 1:C
                % If pixel is on unoccupied space
                if image(ypixel,xpixel,zpixel) ~=1
                    solid_check = 0;
                    Radius = 1;
                    %Loop will search around analysed point incrementally increasing search radius
                    %until solid section is found
                    while  solid_check < 1

                        for theta = linspace(0,360,2*pi*Radius*1.2)
                            for phi = linspace(0,180,1*pi*Radius*1.2)


                                if ypixel+round(Radius*sind(theta)*sind(phi)) < A+1 && xpixel+round(Radius*cosd(theta)*sind(phi)) < B+1  && zpixel + round(Radius*cosd(phi)) < C+1 && xpixel+round(Radius*cosd(theta)*sind(phi)) > 0 && ypixel+round(Radius*sind(theta)*sind(phi)) > 0 && zpixel + round(Radius*cosd(phi)) > 0

                                    solid_check = image(ypixel+round(Radius*sind(theta)*sind(phi)),xpixel+round(Radius*cosd(theta)*sind(phi)), zpixel + round(Radius*cosd(phi)));
                                end
                                %Breaks loop if solid section is found
                                if solid_check ==1
                                break
                                end
                            end
                            if solid_check ==1
                                break
                            end
                        end
                        Radius = Radius + 1;
                    end
                    radius_map(ypixel,xpixel,zpixel) = Radius-1;
                end
            end
        end
    end
end