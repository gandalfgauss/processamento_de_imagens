function nimg = preenchimento(img)    
    [lin, col, ~] = size(img);
    
    xk = zeros(lin, col);
    
    imgc = imcomplement(img); % complemento da imagem
    
    se = strel('diamond', 1); % elemento estruturante
    
    dl = find(imgc == 0);
    
    x = xk;
    
    xk(dl(1)) = 1; % ligar 1 pixel
    
    while xk ~= x % enquanto x da iteracao atual for diferente do x da iteracao anterior
        
        x = xk
        
        aux = imdilate(xk, se); % dilatacao utilizando o elemento estruturante
        
        xk = min(aux, imgc); % intersecção
    end
    
    nimg = max(img, xk); % uniao com a imagem original
end
