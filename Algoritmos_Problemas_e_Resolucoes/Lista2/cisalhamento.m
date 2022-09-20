function [nimg] = cisalhamento(img, sx)
    [lin, col, ~] = size(img);
    nimg = zeros(lin, col);
    
    maT = [1 sx 0; 0 1 0; 0 0 1];
      
    for i=1: lin
        for j=1 : col
            novas_coord= maT*[i;j;1];
            ni = floor(novas_coord(1));
            nj = floor(novas_coord(2));
            
            if ni>0 && ni <=lin && nj>0 &&nj <=col 
                nimg(ni, nj)=img(i,j);
            end
        end
    end
    nimg = uint8(nimg);
    imshow(nimg);

end
