function [nimg] = reduzResolucao(img)
    [lin, col, ~] = size(img);
    nimg = zeros(lin/2, col/2);
 
    for i=1: lin/2
        for j=1 : col/2
            nimg(i,j) = mean(mean(img(2*i-1:2*i,2*j-1:2*j)));      
            
        end
    end
    nimg = uint8(nimg);
    imshow(nimg);

end
