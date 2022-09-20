function img = transforma2Cinza(n)
    img = imread("C:\Users\halli\Desktop\7Periodo\PDI\Listas\Lista2\lennaRGB.tif");
    
    imagem_double = double(img);
    
    R = imagem_double(:, :, 1);
    G = imagem_double(:, :, 2);
    B = imagem_double(:, :, 3);
    
    for i=1 :n
        R = R*0.299;
        G = G*0.587;
        B = B*0.114;       
    end
    imagem_double = R + G + B;
    img = uint8(imagem_double);
    imshow(img);
    
end
    
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    