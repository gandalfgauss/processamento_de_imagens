function acertos = testeNumber()

%gera o classificador
modelo = classificador();

%ler imagem com varios numeros
imagem_com_numeros = imread("C:\Users\halli\Desktop\7Periodo\PDI\Listas\Lista5\numeros2.jpg");

%Estrai os numeros de forma segmentada da imagem
imagens = BoundingBoxPatches(imagem_com_numeros);

% recebe a quantidade de numeros encontrado na imagem
[lin, ~] = size(imagens); 

dados = zeros(lin, 7); %dados dos 7 momentos de hu

etiqueta = [0; 1; 3; 5; 2; 7]; %olhar visualmente

for i = 1:lin
    dados(i, :) = humoments(imagens{i});
end

predicao = predict(modelo, dados);

acertos = 0;
for i = 1 : lin
    if predicao(i) == etiqueta(i)
        acertos = acertos + 1;
    end
end

%Mostrar resultados
ResultadoPredicao = reshape(predicao, [1,6]);

EtiquetaReal = reshape(etiqueta, [1,6]);

disp(ResultadoPredicao);
disp(EtiquetaReal);
disp(acertos);
end