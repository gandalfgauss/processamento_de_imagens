function nimg = gradienteMorfologico(img)
    se = strel('diamond', 1); % elemento estruturante
    dilatacao = imdilate(img, se);
    erosao = imerode(img, se);
    nimg = dilatacao - erosao;
    imshow(nimg);
end



