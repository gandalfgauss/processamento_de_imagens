function nimg = rotacao(img, ang)
    [lin, col, ~] = size(img);
    nimg = zeros(lin, col);
    
    maT1 = [1 0 -lin/2; 0 1 -col/2; 0 0 1];
    matR = [sind(ang) -cosd(ang) 0; cosd(ang) sind(ang) 0; 0 0 1];
    maT2 = [1 0 lin/2; 0 1 col/2; 0 0 1];
    
    maT = maT2*matR*maT1;
      
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
                
    
    
    