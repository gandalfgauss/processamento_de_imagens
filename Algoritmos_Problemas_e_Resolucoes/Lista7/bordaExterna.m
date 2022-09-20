function nimg = bordaExterna(img)
    se = strel('diamond', 1); % elemento estruturante
    dilatacao = imdilate(img, se);
    nimg = dilatacao - img;
    imshow(nimg);
end

