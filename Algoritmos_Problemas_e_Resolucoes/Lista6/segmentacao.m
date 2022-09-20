function nimg = segmentacao()
    
    t = imread ("C:\Users\halli\Desktop\7Periodo\PDI\Listas\Lista6\coins.png");
    t = rgb2gray(t) ; %transforma para escala de cinza
    
    [row , col] = size (t);
    [x , y]= meshgrid ( 1 : row , 1 : col ) ;
    
    t2 = double(t) .* ((x+y)/2+64)+x+y ;
    t3 = uint8 (255 * mat2gray (t2)) ;
    
    figure; imshow(t3);
    
    T = thresholdingGlobal(t3, 10);
    
    t3(t3> T) = 255;
    t3(t3 <= T) = 0;
     
    nimg = t3;
    
    
    figure;imshow(nimg);
    
end


