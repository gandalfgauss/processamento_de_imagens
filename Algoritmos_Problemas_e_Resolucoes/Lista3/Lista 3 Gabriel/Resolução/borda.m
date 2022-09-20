function nimg = borda(img)
    [lin, col] = size(img);
    img2 = uint8(zeros(lin, col));
    img2(2:lin, 2: col) = img(1:(lin -1), 1:(col-1));
    nimg = abs(img - img2);
    
    
    
   
   
end

