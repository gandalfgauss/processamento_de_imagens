function removeRuido()

 % recebe uma imagem
 
 img = imread("C:\Users\halli\Desktop\7Periodo\PDI\Listas\Lista7\coins.png");
 
 imgbw = im2bw(img, 0.5); % garantir que ela eh binaria
 
 figure; imshow(im2double(img),[]); % mostrar imagem original binaria
 
 
 % inserir ruido
 x = rand(size(imgbw));
 
 d1 = x <= 0.05;
 
 d2 = x>= 0.95;
 
 imgbw(d1) = 0;
 
 imgbw(d2) = 1;
 %------------------
 
 figure; imshow(im2double(imgbw), []);  % mostrar imagem ruidosa
 
 %--------------------
 sp = ones(3); % elemento estruturante 1
 
 abertura = imopen(imgbw, sp); % operacao de abertura
 
 figure; imshow(im2double(abertura), []); % mostrar imagem apos abertura
 
 fecho = imclose(abertura, sp); % operacao de fecho
 
 figure; imshow(im2double(fecho), []); % mostrar imagem apos fecho
 
 %------------------------------------------
 
 %--------------------
 sk = [0 1 0; 1 1 1; 0 1 0]; % elemento estruturante 2
 
 abertura = imopen(imgbw, sk); % operacao de abertura
 
 figure; imshow(im2double(abertura), []); % mostrar imagem apos abertura
 
 fecho = imclose(abertura, sk); % operacao de fecho
 
 figure; imshow(im2double(fecho), []); % mostrar imagem apos fecho
 
 %------------------------------------------
  
end