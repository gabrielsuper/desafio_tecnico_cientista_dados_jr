# DESAFIO TECNICO CIENTISTA DE DADOS JR

Esse é um case técnico para a vaga de Cientista de Dados Jr, foi solicitado algumas etapas para o projeto. No arquivo do Jupyter Notebook tem o processo passo a passo explicado e com muitas informações, desde a obtenção dos dados até a conclusão dos resultados dos modelos de machine learning. Aqui irei passar **alguns overviews** de todo os processos solicitados.

```
1 - Análise exploratória dos dados
2 - Preparação dos dados
3 - Modelagem
4 - Avaliação da performance do modelo
5 - Entrega do modelo
```

## 1 - Análise exploratória dos dados

```
Os dados que usaremos neste projeto foram disponibilizados no Google Drive pela recrutadora. 
O dataset representa valores númericos que variam entre int e float contendo 466 linhas.
Este é um conjunto de dados balanceado, mais a frente iremos verificar a distribuição de classe.
Outro detalhe interessante é que as features são todas numéricas, e foram descaracterizadas (por questões ligados à privacidade e segurança). 
Assim, os nomes das colunas são representados por feature0,feature1,feature2…,target.
Não é possível saber se as variáveis passaram por uma transformação conhecida como Análise de Componentes Principais (Principal Component Analysis - PCA).
```

A variável alvo está representada na coluna target, onde:

* 0: Não ocorreu o evento
* 1: Ocorreu o evento

### Utilizando alguns comandos python para análise de dados:

* Utilizando o metódo describe() podemos verificar que na coluna target possuímos valores de somente 1 ou 0;
* Algumas features possuem outliers mínimos e máximos, entendendo a natureza delas poderíamos entender o motivo;
* Vamos manter o nome das colunas originais para manter o padrão de avaliação dos recrutadores;
* Não será necessário codificar visto que elas não possuem nenhum valor categórico.
* A feature10 possui em seu Q3(75%) 5212.977500 e seu máximo é 237182.780000, claramente temos outliers nesse dataset. É possível perceber outliers também em outras features.
* Usando o comando df.info() tivemos como resposta as 16 variáveis(colunas) e 466 entradas. Essas variáveis são somente númericas.
* Variáveis categóricas: Não existe.
* Variáveis númericas: Todas as features e a target.
* O dataset não possui dados nulos em qualquer váriavel,não precisando realizarmos tratativas de inclusão ou remoção para dados faltantes.

#### Utilizando a matriz de correlação encontramos algumas features que se relacionam muito bem e outras que são mais fracas.

* A Feature 4 e a feature 15 tem correlação de -0.87, significa que podemos remover uma delas do dataset de treino. No caso, vamos remover a feature15 porque ela tem menor relação com o target (-0.09), enquanto a feature4 tem 0.11.

#### Utilizando o gráfico de dispersão encontramos algumas features que se relacionam muito bem e outras que se destoam.

* A feature15 tem praticamente a mesma distribuição para as duas classes, isso significa que ela sozinha não caracteriza tão bem as classes.

* Por outro lado, a feature1 tem distribuições bem diferentes para cada classe. Isso significa que ela tem um poder preditivo maior por segmentar melhor as classes.

#### Analisando outliers com boxplot

* Todas as features tem outliers, como ação vamos retirar esses outliers do dataset e ver como o modelo vai se comportar sem estes outliers no processo de treino.

## 2 - Preparação dos dados

Na segunda etapa foi realizado a preparação dos dados para o processo de modelagem. Os seguintes passos foram realizados.

* Padronizar as feature int para float que está em outro tipo de dados;
* Remover os outliers atráves do cálculo do IQR;
* Dividir entre dados de treino e teste utilizando o train_test_split da biblioteca scikit-learn, foi utilizado dois parâmetros nessa etapa 
   * Onde dividimos em 30% do dataset para os dados de teste;
   * O random_state igual a 1, pois se não especificar o random_state no código, toda vez que você executar (executar) seu código, um novo valor aleatório será gerado e os conjuntos de dados de treinamento e teste terão valores diferentes a cada vez.

## 3 - Modelagem

Na etapa de modelagem foi utilizado os algoritmos XGBoost Classifier e Regressão Logística, a escolha dos algoritmos se deu por ser um problema relacionado a classificação.
Após o treino dos modelos ambos passaram pelo hiper parâmetros utilizando o GridSearchCV.

## 4 - Avaliação da performance do modelo

Utilizando a matriz de confusão foi possível obter alguns valores para quantificar os modelos. Algumas métricas como precisão, recall, f1-score e acurácia.
Outra métrica utilizada foi o AUC, para cálcular a qualidade das especificações do modelo.

Ao testar os modelos obtivemos uma acurácia de **0.6571** e AUC ROC de **0.6594** para o XGBoost, acurácia de **0.6071** para a Regressão Logística e AUC ROC de **0.6142** antes da tratativa dos outlier. Após a remoção dos outliers obtivemos uma acurácia de **0.6549** para o XGBoost e AUC ROC de **0.6307**, acurácia de **0.5752** para a Regressão Logística e AUC ROC de **0.5365**.

## 5 - Execução do Projeto - Entrega

Nas etapas seguintes há um passo a passo para executar o arquivo do Jupyter Notebook em um container Docker. Essa foi uma das sugestões de como criar um ambiente para execução.

## Pré requisitos

Ter o Docker e o Git instalados.

## Para iniciar abra o terminal e execute os comandos abaixo:

```
  Realizar o clone do repositório em algum lugar do seu computador.
  Acesse pelo terminal a pasta do projeto e execute os comandos docker.
```
### Comandos docker

```
  docker-compose build
```

```
  docker-compose up
```

Acesse o [LINK](http://127.0.0.1:8888/lab?token=easy) para acesso a interface do Jupyter Notbook.


## Para execução do modelo
Abra a pasta Src e encontro o arquivo Teste Cientista de Dados Jr.

Acesse o arquivo mencionado interiormente e escolha a opção no cabeçalho Run -> Run All Cels.

Aguarde a execução das células, dependendo do seu hardware a etapa de modelagem do modelo pode durar até 5 minutos para finalizar.