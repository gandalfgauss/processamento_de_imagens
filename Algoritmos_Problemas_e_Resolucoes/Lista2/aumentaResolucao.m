function [nimg] = aumentaResolucao(img)
    [lin, col, ~] = size(img);
    nimg = zeros(2*lin, 2*col);
 
    for i=1: lin
        for j=1 : col
            nimg(2*i-1:2*i,2*j-1:2*j) = img(i,j);      
            
        end
    end
    nimg = uint8(nimg);
    imshow(nimg);

end
