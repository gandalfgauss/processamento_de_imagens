function nimg = bordaInterna(img)
    se = strel('diamond', 1); % elemento estruturante
    erosao = imerode(img, se);
    nimg = img - erosao;
    imshow(nimg);
end

