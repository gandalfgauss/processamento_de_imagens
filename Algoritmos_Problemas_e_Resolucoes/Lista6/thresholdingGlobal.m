function T = thresholdingGlobal(img, precisao)
    
    [lin, col] = size(img);  % pega as dimensoes da imagem
    
    T = img(randi(lin), randi(col));  % estimativa inicial de T aleatória
    
    T_old = 0;
    
    while(T-T_old) > precisao
        G1 = img(img > T);
        
        G2 = img(img <= T);
        
        mu1 = mean(G1);
        
        mu2 = mean(G2);
        T_old = T;
        T = (mu1 + mu2)/2;
        
    end
end
