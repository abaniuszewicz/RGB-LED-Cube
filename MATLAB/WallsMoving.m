function WallsMoving(serial, figure, plotOn)
%WallsMoving Makes WallsMoving animation
    
    size = 8;
    DiscreteCubeRGB = zeros(size, size, size, 3);
    RED = 1; GREEN = 2; BLUE = 3;   %color indexes in three dimensional matrixes
    
    %front-back RED
    for iter = 1 : 8
        DiscreteCubeRGB(:,:,:,:) = 0;
        DiscreteCubeRGB(iter,:,:,RED) = 1;
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        end
        SendCubeData(serial, CubeData);
        
        %if plot is disabled, wait for some time
        if (~plotOn)
            pause(0.1);
        end
    end
   
    %back-front GREEN
    for iter = 8 : -1 : 1
        DiscreteCubeRGB(:,:,:,:) = 0;
        DiscreteCubeRGB(iter,:,:,GREEN) = 1;
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        end
        SendCubeData(serial, CubeData);
        
        %if plot is disabled, wait for some time
        if (~plotOn)
            pause(0.1);
        end
    end
    
    %left-right BLUE
    for iter = 8 : -1 : 1
        DiscreteCubeRGB(:,:,:,:) = 0;
        DiscreteCubeRGB(:,iter,:,BLUE) = 1;
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        end
        SendCubeData(serial, CubeData);
        
        %if plot is disabled, wait for some time
        if (~plotOn)
            pause(0.1);
        end
    end
    
    %right-left WHITE
    for iter = 1 : 8
        DiscreteCubeRGB(:,:,:,:) = 0;
        DiscreteCubeRGB(:,iter,:,RED) = 1;
        DiscreteCubeRGB(:,iter,:,GREEN) = 1;
        DiscreteCubeRGB(:,iter,:,BLUE) = 1;
        CubeData = DiscreteCubeRGB_To_CubeData(DiscreteCubeRGB);
        
        %if plot is enabled, plot data
        if (plotOn)
            PlotCubeData(CubeData, figure);
        end
        SendCubeData(serial, CubeData);
        
        %if plot is disabled, wait for some time
        if (~plotOn)
            pause(0.1);
        end
    end
end

