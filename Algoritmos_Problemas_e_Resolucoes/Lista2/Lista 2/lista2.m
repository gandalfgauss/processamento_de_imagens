%img2 = transformacaoCinza(1);
img = imread('C:\Users\gabri\Desktop\6 periodo\PDI\Lista 2\lenna.png');
%img2 = minhaRotacao(img, 30);
%img2 = minhaTranslacao(img, 100 ,100);
%img2 = minhaEscala(img,2, 2);
%img2 = meuCisalhamento(img, 0.8);
%imgAux = resolucaoReduzida(img);
%img2 = resolucaoAumentada(imgAux);
%imshow(img2)
%imshow(img2)
%x = testeFuncoes();
img2 = espelhoVertical(img);
img3 = espelhoHorizontal(img2);
imshow(img3)



function img2 = transformacaoCinza(n)
    img = imread('C:\Users\gabri\Desktop\6 periodo\PDI\Lista 2\lennaRGB.tif');
    img = double(img);
    i = 0;
    R = img(:,:, 1);
    G = img(:,:, 2);
    B = img(:,:,3);
    while i <n
        R = R*0.299;
        G = G*0.587;
        B = B*0.114;
        img2 = R + G + B;
        %img2 = cat(3, R ,G, B);
        i = i+1;
     end  
    img2 = uint8(img2);
    imshow(img2)
end


function nimg = minhaRotacao(img, ang)
    [lin, col, ~] = size(img);
    nimg = zeros(lin, col);
    matT1 = [1 0 -lin/2; 0 1 -col/2; 0 0 1];
    matR = [sind(ang) -cosd(ang) 0; cosd(ang) sind(ang) 0; ...
           0 0 1];
    matT2 = [1 0 lin/2; 0 1 col/2; 0 0 1];
    maT = matT2 * matR * matT1;
    for i = 1 : lin
        for j = 1 : col
            ncoord = maT * [i; j; 1];
            ni = floor(ncoord(1));
            nj = floor(ncoord(2));
            if ni > 0 && ni <= lin && nj > 0 && nj <= col
                nimg(ni, nj) = img(i,j);
            end
        end
    end
    nimg = uint8(nimg);
    
end

function nimg = minhaTranslacao(img,dx, dy)
    [lin, col, ~] = size(img);
    nimg = zeros(lin, col);
    maT = [1 0 dx; 0 1 dy; 0 0 1];
    
    for i = 1 : lin
        for j = 1 : col
            ncoord = maT * [i; j; 1];
            ni = floor(ncoord(1));
            nj = floor(ncoord(2));
            if ni > 0 && ni <= lin && nj > 0 && nj <= col
                nimg(ni, nj) = img(i,j);
            end
        end
    end
    nimg = uint8(nimg);
end

function nimg = minhaEscala(img,sx, sy)
    [lin, col, ~] = size(img);
    nimg = zeros(lin, col);
    maT = [sx 0 0; 0 sy 0; 0 0 1];
    
    for i = 1 : lin
        for j = 1 : col
            ncoord = maT * [i; j; 1];
            ni = floor(ncoord(1));
            nj = floor(ncoord(2));
            if ni > 0 && ni <= lin && nj > 0 && nj <= col
                nimg(ni, nj) = img(i,j);
            end
        end
    end
    nimg = uint8(nimg);
end


function nimg = meuCisalhamento(img,shx)
    [lin, col, ~] = size(img);
    nimg = zeros(lin, col);
    maT = [1 shx 0; 0 1 0; 0 0 1];
    
    for i = 1 : lin
        for j = 1 : col
            ncoord = maT * [i; j; 1];
            ni = floor(ncoord(1));
            nj = floor(ncoord(2));
            if ni > 0 && ni <= lin && nj > 0 && nj <= col
                nimg(ni, nj) = img(i,j);
            end
        end
    end
    nimg = uint8(nimg);
end

function nimg = resolucaoReduzida(img)
    [lin, col, ~] = size(img);
    img2 = zeros(lin/2, col/2);
    aux = (1: +2: lin);
    for i = (1 : lin/2)
        for j = (1: lin/2)
            img2(i, j) = mean(mean(img(aux(i):aux(i) + 1, aux(j) : aux(j) +1)));
            
        end
       
    end
    

    nimg = uint8(img2);

end

function nimg = resolucaoAumentada(img)
    [lin, col, ~] = size(img);
    img2 = zeros(lin*2, col*2);
    
    aux = (1: 2: lin*2);
    for i = (1 : lin)
        for j = (1: lin)
            img2((aux(i):aux(i) + 1), (aux(j) : aux(j) +1)) = img(i, j);
            
            
        end
       
    end
    nimg = uint8(img2);
end

function nimg = testeFuncoes()
    img = imread('C:\Users\gabri\Desktop\6 periodo\PDI\Lista 2\lennaRGB.tif');
    nimg = rgb2gray(img);
    imwrite(nimg, 'Cinza.png');
    [nimg2, x] = rgb2ind(img, 32);
    imwrite(nimg2, 'ind.png')
    nimg3 = im2double(img);
    imwrite(nimg3, 'double.png')
    nimg4 = im2bw(img);
    imwrite(nimg4, 'binary.png')
    

end

function nimg = espelhoVertical(img)
     [lin, col, ~] = size(img);
     aux = [col:-1:1];
     img2= zeros(lin, col);
     img2 = img(:, aux);
     imshow(img2);
     nimg = img2;

end

function nimg = espelhoHorizontal(img)
     [lin, col, ~] = size(img);
     aux = [lin:-1:1];
     img2= zeros(lin, col);
     img2 = img(aux, :);
     imshow(img2);
     nimg = img2;

end













