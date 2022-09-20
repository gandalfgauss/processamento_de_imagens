function [nimg] = funcoesDeConversao()

    img = imread("C:\Users\halli\Desktop\7Periodo\PDI\Listas\Lista2\lennaRGB.tif");
    nimg = rgb2gray(img);
    imwrite(nimg, "cinza.png");
    
    [nimg, x] = rgb2ind(img,32); %32 quantidade de cores
    imwrite(nimg, "indexada.png");
    
    nimg = im2double(img);
    imwrite(nimg, "double.png");
    
    nimg = im2bw(img);
    imwrite(nimg, "binary.png");
    
    
end
