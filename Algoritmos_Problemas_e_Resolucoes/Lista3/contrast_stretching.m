function nimg = contrast_stretching(img, m, E)
    doubleimg = im2double(img);
   
    nimg = (1) ./ (1 + (m ./ doubleimg) .^ E);
    
    %nimg = uint8(timg);
    
    imshow(nimg);

end

