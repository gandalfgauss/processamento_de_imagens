function modelo = classificador()

%Le arquivos de imagens do diretorio
%Realiza transformações geometrica, rotacao, escala e insere ruido
%Gera 700 imagens para cada objeto(número)
%Retorna a matriz de dados com os 7 momentos de Hu de cada imagem
%Retorna também a etiqueta desses dados
[dados, etiqueta] = geraImagensECalculaHuMoments();


%Separa o conjunto de dados sendo 75% treino e 25% teste 
%Retorna indices
[treino, teste] = crossvalind('HoldOut', etiqueta, 0.25);

dados_de_treino = dados(treino,:);
rotulos_de_treino = etiqueta(treino);

dados_de_teste = dados(teste,:);
rotulos_de_teste = etiqueta(teste);

%Treina o modelo
modelo = fitcdiscr(dados_de_treino, rotulos_de_treino);

%Testa o modelo
predicao = predict(modelo, dados_de_teste);

%Conferir quanto o modelo acertou no teste
[lin, ~] = size(predicao);

acertos = 0;

for i = 1: lin
    if predicao(i) == rotulos_de_teste(i)
        acertos = acertos + 1;       
    end
end

%Mostra na tela 
disp("Porcentagem de acerto:"); 
disp(acertos/lin);

%Gera Matriz de Confusao e mostra a mesma
matrizConfusao = confusionmat(rotulos_de_teste, predicao)

end

