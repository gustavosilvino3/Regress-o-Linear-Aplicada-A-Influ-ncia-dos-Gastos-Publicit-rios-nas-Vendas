# Regressão Linear Aplicada: A influência dos gastos publicitários nas vendas.

Este projeto explora a aplicação da regressão linear para analisar o impacto de gastos publicitários em diferentes mídias (TV, rádio e jornal) sobre as vendas de um produto.

Mas o que seria regressão linear? De forma simples, a regressão linear é uma ferramenta usada para entender e prever como uma coisa afeta outra. Neste caso por exemplo, você pode descobrir se aumentar os gastos com anúncios aumenta as vendas. 

Vamos ao código! 
-----------------------------------------------------------------
```r

#O arquivo "advertising.csv" é carregado para a variável "dados", contendo informações sobre os gastos
#com anúncios em diferentes meios de comunicação (TV, Radio, e Jornais/Newspaper), e como isso é diretamente relacionado com as Vendas (Sales).
dados <- read.csv("advertising.csv")

#A biblioteca "ggplot2" irá permitir a criação de gráficos personalizados para a análise.
library(ggplot2)

#A biblioteca "corrplot" irá permitir que o "Coeficiente de Correlação" das variáveis, sejam calculados. 
library(corrplot)

# 1. Regressão Linear e Correlação entre a variável independente "TV" e a variável dependente "Sales"
   
  
  # 1.1 - Criação da variável que irá calcular a regressão linear.
              regressao_tv <- lm(Sales ~ TV, data = dados)
      
  # 1.2 - Calcular a correlação entre as variáveis "TV" e "Sales".
              cor_tv <- cor(dados$Sales, dados$TV)
              print(paste("Correlação entre Anúncios em TV e Impactos em Vendas/Sales:", round(cor_tv, 2)))
      
  # 1.3 - Criação do gráfico de dispersão com a linha de regressão.
              ggplot(data = dados, mapping = aes(x = TV, y = Sales)) +
              geom_point() +
              geom_smooth(method = lm, col = "red") +
              theme_classic() +
              ggtitle("Anúncios em TV x Impacto em Vendas/Sales") +
              labs(x = "Anúncios em TV", y = "Vendas/Sales")

  #1.4 - Ao final, serão apresentadas as análise de regressão e correlação.
              summary(regressao_tv)

```

              
              










A base de dados que foi utilizada nesse projeto está disponível em: https://www.kaggle.com/datasets/ashydv/advertising-dataset




