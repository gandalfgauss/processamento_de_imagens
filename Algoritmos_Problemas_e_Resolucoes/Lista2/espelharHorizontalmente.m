function [nimg] = espelharHorizontalmente(img)
    
    nimg = img(end:-1:1, : );
    
    imshow(nimg);
       
end
