function nimg = bordas (img)
    [lin col] = size(img);
    
    nimg = uint8(zeros(lin, col));
    
    nimg(2: lin, 2:col)= img(1:(lin-1), 1:(col-1));
    
    nimg = abs(img - nimg);

end