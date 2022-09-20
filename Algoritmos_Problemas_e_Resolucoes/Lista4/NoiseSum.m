function [nimg, ruido] = NoiseSum(img, n)
 
    figs = zeros(size(img));
    
    for i = 1 : n
        figs(:,:,i) = imnoise(img);
    end
    
    ruido = figs(:,:,1);
    
    figs = sort(figs, 3); % ordena na terceira dimensao
    
    nimg = uint8(figs(:,:, floor(n/2)));
    
    
end