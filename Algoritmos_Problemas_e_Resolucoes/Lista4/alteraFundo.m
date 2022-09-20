function [nimg] = alteraFundo(img, mascara, cor)
    [n_linhas, n_colunas] = size(img);
    nimg = cat(3, img, img, img);
    
    for i = 1 : n_linhas
        for j = 1 : n_colunas
            if mascara(i,j) == 0
                nimg(i,j,1) = 7*cor; %R
                nimg(i,j,2) = 8*cor; %G
                nimg(i,j,3) = 10*cor; %B
            end
            
        end
    end
end
