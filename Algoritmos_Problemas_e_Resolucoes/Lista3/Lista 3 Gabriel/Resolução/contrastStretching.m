function nimg = contrastStretching(img, m, e)
    img2 = im2double(img);
    nimg = 1 ./(1 + (m./img2).^e);
    %nimg = uint8(nimg);

end

