function [dados, etiqueta] = geraImagensECalculaHuMoments()

%endereco das imagens com os numeros
endereco = 'C:\Users\halli\Desktop\7Periodo\PDI\Listas\Lista5\numbers';

% extensao das imagens a serem lidas
ext = 'jpg' ; 

% procura as imagens com a extensao jpg dentro do diretorio de imagens
arquivos = dir( fullfile ( endereco , [ '*.' ext])) ; %ler as imagens
quant_img = length(arquivos); %quantidade de imagens

%gerar etiquetas e matriz que irah armazenar os dados
dados = zeros(7000,7);
etiqueta = zeros(7000,1);

elemento = 1;
%para cada imagem lida do diretorio
for i = 1 : quant_img
    img = imread (fullfile(endereco , arquivos(i ,1).name));
    %rotacionar imagem 19 vezes de maneira aleatoria entre 1 a 359 graus 
    graus = 0;
    for r = 1: 20
        nimg = imrotate(img, graus);
        graus = randi(359);
        %Para cada imagem rotacionada deve-se alterar a escala
        escala = 0.5;
        for e = 1: 7
            nimg2 = imresize(nimg, escala);
            escala = escala + 0.25; 
            %Para cada imagem reescalada deve inserir um ruido
            ruido = 0.0;
            for r = 1: 5
                nimg3 = imnoise(nimg2,'salt & pepper', ruido);
                seven_moments = humoments(nimg3);
                dados(elemento,:) = seven_moments;
                etiqueta(elemento, 1) = i-1;
                elemento = elemento+1;
                ruido = ruido + 0.01;
            end
        end
    end            
end
end