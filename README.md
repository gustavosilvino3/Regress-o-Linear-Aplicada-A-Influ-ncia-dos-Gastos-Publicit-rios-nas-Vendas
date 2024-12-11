# Regressão Linear Aplicada: A influência dos gastos publicitários nas vendas.

Este projeto explora a aplicação da regressão linear para analisar o impacto de gastos publicitários em diferentes mídias (TV, rádio e jornal) sobre as vendas de um produto.

Mas o que seria "regressão linear"? 
--------------------------------------------
- De forma simples, a regressão linear é uma ferramenta usada para entender e prever como uma coisa afeta outra. Neste caso por exemplo, você pode descobrir se aumentar os gastos com anúncios aumenta as vendas.

Ferramentas utilizadas para a criação do projeto.
--------------------------------------------------
- Base de dados utilizada disponível em: https://www.kaggle.com/datasets/ashydv/advertising-dataset/data
- Código desenvolvido por meio de linguagem R.
- IDE utilizada: RStudio.

Desenvolvimento por partes do código! 
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

  #1.4 - Ao final, serão apresentadas as análises de regressão e correlação.
              summary(regressao_tv)

```
Ao executar esse bloco do código, vamos obter as seguintes análises:


Coeficiente de correlação "r":
-----------------------------------
![image](https://github.com/user-attachments/assets/7c90116b-2c84-4363-a599-2e9504f75433)

- O coeficiente de correlação se trata de o quanto a variável dependente está relacionada com a variável independente, neste caso, "Sales" e "TV", respectivamente. Como é apresentado, existe um coeficiente de correlação de "0.9", o que indica que existe de fato, uma forte correlação positiva entre as variáveis.

Gráfico de de dispersão e linha de regressão
----------------------------------------------------
 
 ![regressaotv](https://github.com/user-attachments/assets/c07486c5-edd6-4080-b9fb-12c9d32ea2ff)

Com este gráfico de dispersão em conjunto com uma linha de regressão, é possível visualizar os dados de forma clara e objetiva, e é possível destacar dois tópicos: 

- Forte correlação positiva: Os dados indicam que, à medida que os gastos em TV aumentam, as vendas também tendem a aumentar. Isso é representado pela inclinação positiva da linha de regressão.

- Linha de tendência: A linha ajustada captura bem a relação linear entre as variáveis, com poucos desvios significativos.

Análises gerais:
------------------------------------------------
Ao final do bloco, a função "summary" irá apresentar uma análise detalhada de todas as informações presentes na regressão linear.

![image](https://github.com/user-attachments/assets/8693fb94-56ff-43ef-867b-ae577b206ef4)

Sendo essas informações: 

Resíduos (Residuals):
------------------------
Vai nos mostrar o quanto o valor observado/real divergiu do valor esperado pelo modelo de regressão linear.

- Valor mínimo: Foi de aproximadamente **-6,45**, ou seja, em algum ponto do conjunto de dados, o modelo esperou um valor de aproximadamente 6,45 maior do que o valor real.

- Mediana: O resíduo mediano é de 0,0218, um valor bem próximo de 0, o que indica que o modelo está bem equilibrado.

- Valor máximo: Foi de aproximadamente **-5,70**, ou seja, em algum ponto do conjunto de dados, o modelo esperou um valor de aproximadamente 5,70 menor do que o valor real.




    




 


              
              














