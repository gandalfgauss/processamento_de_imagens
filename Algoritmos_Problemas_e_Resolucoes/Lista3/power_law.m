function nimg = power_law(img, c, lambda)
    doubleimg = im2double(img);
   
    nimg = c .* doubleimg .^ lambda;
    
    %nimg = uint8(timg);
    
    imshow(nimg);

end
