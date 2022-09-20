function nimg = powerLaw(img, c, l)
    img2 = im2double(img);
    nimg = c .*(img2.^l); 
    
end

