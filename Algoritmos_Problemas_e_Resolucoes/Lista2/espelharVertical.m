function [nimg] = espelharVertical(img)
    
    nimg = img(:, end:-1:1);
    
    imshow(nimg);
       
end
