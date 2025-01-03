# Regressão Linear Aplicada: A influência dos gastos publicitários nas vendas.

## 1. Introdução  

**Objetivo do projeto:** 
Explorar a aplicação da regressão linear para analisar como o investimento em anúncios publicitários em diferentes meios de comunicação, pode ou não, estimular as vendas de determinado produto.

- Mas o que seria "regressão linear"? A regressão linear é uma técnica estatística utilizada para entender e modelar a relação entre variáveis. Ela permite prever o valor de uma variável dependente com base em uma ou mais variáveis independentes, ajustando uma linha de tendência aos dados para realizar previsões e identificar padrões.


## 2. Ferramentas utilizadas para a criação do projeto.

- Base de dados utilizada disponível em: https://www.kaggle.com/datasets/ashydv/advertising-dataset/data
- Código desenvolvido por meio de linguagem R.
- IDE utilizada: RStudio.
- Livro de referência: JAMES, Gareth; WITTEN, Daniela; HASTIE, Trevor; TIBSHIRANI, Robert. An Introduction to Statistical Learning: With Applications in R. New York: Springer, 2013.



## 3. Desenvolvimento por partes do código: Importar bibliotecas

```r
#O arquivo "advertising.csv" é carregado para a variável "dados", contendo informações sobre os 
#gastos com anúncios em diferentes meios de comunicação (TV, Radio, e Jornais/Newspaper),
#e informações acerca das vendas (Sales).

dados <- read.csv("advertising.csv")

#A biblioteca "ggplot2" irá permitir a criação de gráficos personalizados para a análise.
library(ggplot2)

#A biblioteca "corrplot" irá permitir que o "Coeficiente de Correlação" das variáveis, sejam calculados. 
library(corrplot)

```

## 4. Desenvolvimento por partes do código: Variável dependente "Sales" x Variável independente "TV".

```r

# 1. Regressão Linear e Correlação entre a variável independente "TV" e a variável dependente "Sales"
   
  
  # 1.1 - Criação da variável que irá calcular a regressão linear.
              regressao_tv <- lm(Sales ~ TV, data = dados)
  
  # 1.2 - Criação do gráfico de dispersão com a linha de regressão.
              ggplot(data = dados, mapping = aes(x = TV, y = Sales)) +
              geom_point() +
              geom_smooth(method = lm, col = "red") +
              theme_classic() +
              ggtitle("Anúncios em TV x Impacto em Vendas/Sales") +
              labs(x = "Anúncios em TV", y = "Vendas/Sales")                
  
  # 1.3 - Calcular a correlação entre as variáveis "TV" e "Sales".
              cor_tv <- cor(dados$Sales, dados$TV)
              print(paste("Correlação entre Anúncios em TV e Impactos em Vendas/Sales:", round(cor_tv, 2)))



  # 1.4 - Ao final, serão apresentadas as análise de regressão e correlação.
              summary(regressao_tv)

```
Ao executar esse bloco do código, vamos obter as seguintes análises:


**4.1   Gráfico de dispersão e linha de regressão:**

 
 ![image](https://github.com/user-attachments/assets/5d2f49f2-f7b2-47ef-a40f-aa00574bf382)


Com este gráfico de dispersão em conjunto com uma linha de regressão, é possível visualizar os dados de forma clara e objetiva, e com isso, é possível destacar dois tópicos: 

- Forte correlação positiva: Os dados indicam que, à medida que os gastos em TV aumentam, as vendas também tendem a aumentar. Isso é representado pela inclinação positiva da linha de regressão.

- Linha de tendência: A linha ajustada captura bem a relação linear entre as variáveis, com poucos desvios significativos.


**4.2  Coeficiente de correlação "r":**

![image](https://github.com/user-attachments/assets/7c90116b-2c84-4363-a599-2e9504f75433)

- O coeficiente de correlação se trata de o quanto a variável dependente está relacionada com a variável independente, neste caso, "Sales" e "TV", respectivamente. Como é apresentado, existe um coeficiente de correlação de "0,90", o que indica que existe de fato, uma forte correlação positiva entre as variáveis.

**4.3  Análise exploratória das estatísticas gerais:**

Ao final do bloco, a função "summary" irá apresentar uma análise detalhada de todas as informações presentes na regressão linear.

![image](https://github.com/user-attachments/assets/8693fb94-56ff-43ef-867b-ae577b206ef4)

Sendo essas informações: 

**4.3.1  Resíduos (Residuals):**

Os resíduos vão nos mostrar o quanto o valor observado/real divergiu do valor esperado pelo modelo de regressão linear.

- Valor mínimo: O menor valor encontrado pelo modelo foi -6,4438, ou seja, em algum ponto do conjunto de dados, o modelo esperou um valor de aproximadamente 6,45 maior do que o valor real.
- 1º Quartil: 25% dos erros são menores que -1,4857 unidades.
- Mediana: O resíduo mediano é de 0,0218, um valor bem próximo de 0, o que indica que o modelo está bem equilibrado.
- 3º Quartil: 75% dos erros são menores que 1,5042 unidades.
- Valor máximo: O maior valor encontrado foi de 5,6932, ou seja, em algum ponto do conjunto de dados, o modelo esperou um valor de aproximadamente 5,70 menor do que o valor real.

**4.3.2  Coeficientes (Coefficients):**

Os coeficientes representam a relação entre os gastos em anúncios de TV (TV) e as vendas (Sales).

***Intercepto***
   
- **Estimativa:** O valor 6,974821 representa as vendas esperadas quando não há investimento em anúncios de TV.
- **Erro padrão:** O erro padrão do intercepto é de 0,322553, ou seja, uma incerteza muito pequena, e isso indica uma maior confiança e maior precisão na estimativa do intercepto.
- **Estatística t / Valor t:** O valor t de 21,62, indica que a estimativa do intercepto no valor de 6,974821 é 21,62 vezes maior do que o erro padrão de 0,322553, ou seja, evidencia a alta precisão do intercepto.
- **Significância estatística:** O p-valor (<2e-16 ou 0,0000000000000002) mostra que há uma evidência muito forte de que o intercepto é diferente de zero. Isso significa que, mesmo sem gastos em anúncios de TV, o modelo prevê um valor base de vendas (6,974821 unidades), o que é estatisticamente significativo.

***TV (Variável independente)***

- **Estimativa:** O valor 0,055465 diz que, para cada unidade adicional de gasto em anúncios de TV, as vendas aumentam, em média, 0,055465 unidades.
- **Erro padrão:** Como o erro padrão de 0,001896 é de fato muito pequeno, isso é um bom indicador de que as estimativas são precisas.
- **Estatística t / Valor t:** Como o valor 29,26 é mais elevado, a influência que a variável independente tem sobre a variável dependente é estatisticamente significativa.
- **P-valor:** Apresenta um valor muito pequeno, <2e-16** ou 0,0000000000000002, confirmando que os gastos em TV têm um impacto altamente significativo sobre as vendas.

**4.3.3  Níveis de significância estatística:**

![image](https://github.com/user-attachments/assets/9fe0b697-36d8-445f-836e-db4ba4929814)

Os asteriscos (***) indicam níveis de significância estatística.

- "***": (p<0,001), logo, é extremamente significativo estatisticamente.
- "**": (p<0,01), logo, é muito significativo estatisticamente.
- "*": (p<0,05), logo, é significativo estatisticamente.
- Sem asterisco: Não é significativo estatisticamente.

**4.3.4 Erro padrão Residual (Residual Standard Error):**

- O erro padrão residual tem a função de medir o quanto a variação média prevista das incertezas do modelo estão distantes da variação real.
- Neste caso, o erro médio do modelo ao prever vendas é de aproximadamente 2,296 unidades.

**4.3.5 Coeficiente de determinação (R²):**

- Diz sobre o quanto do comportamento da variável dependente (Sales), pode ser explicado pela variável independente (TV) no modelo de regressão.
- Dessa forma, o R² equivalente a 0,8122, significa que 81,22% da variação nas vendas podem ser explicadas pelos investimentos em anúncios de TV.

**4.4 Conclusão obtida pelo modelo de regressão linear "Sales x TV":**

&nbsp;&nbsp;&nbsp;Os resultados do modelo indicam que os gastos em anúncios de TV têm um impacto significativo e positivo nas vendas. A relação é bem ajustada, com o modelo explicando 81.22% da variação nas vendas (R²), o que demonstra a relevância dos anúncios de TV como fator influente no desempenho das vendas. Cada unidade adicional de investimento em TV resulta em um aumento médio de 0.055465 unidades nas vendas, comprovando a eficácia dessa estratégia.




## 5. Desenvolvimento por partes do código: Variável dependente "Sales" x Variável independente "Radio".
  
  ```r
  
  # 2. Regressão Linear e Correlação entre a variável dependente "Sales" e a variável independente "Radio" 

              
  # 2.1 - Criação da variável que irá calcular a regressão linear.
              regressao_radio <- lm(Sales ~ Radio, data = dados)
              
  # 2.2 - Criação do gráfico de dispersão com a linha de regressão.
              ggplot(data = dados, mapping = aes(x = Radio, y = Sales)) +
              geom_point() +
              geom_smooth(method = lm, col = "red") +
              theme_classic() +
              ggtitle("Anúncios em Rádio x Impacto em Vendas/Sales") +
              labs(x = "Anúncios em Rádio", y = "Vendas/Sales")            
              
  # 2.3 - Calcular a correlação entre as variáveis "Radio" e "Sales".
              cor_radio <- cor(dados$Sales, dados$Radio)
              print(paste("Correlação entre Anúncios em Rádio e Impactos em Vendas/Sales:", round(cor_radio, 2)))

  # 2.4 - Ao final, serão apresentadas as análise de regressão e correlação.
              summary(regressao_radio)
  ```

Na continuação do código, iremos analisar a relação entre a variável dependente "Sales" e a variável independente "Radio"


**5.1 Gráfico de dispersão e linha de regressão**

![image](https://github.com/user-attachments/assets/b65a9b77-d8ab-4b4a-901e-5a9483748418)

Através deste gráfico, é possível perceber que a correlação entre as variavéis, apesar de ser positiva, não é forte como a anterior, devido aos seguintes fatores: 

- Distribuição dos pontos: Existe uma maior dispersão dos pontos, isso pode sugerir que os anúncios em rádio, não possuem alta influência na variável das vendas.

- Linha de têndencia: Como os pontos não estão tão próximos da linha de regressão, o modelo tem uma capacidade moderada de explicar a variação nas vendas.

**5.2 Coeficiente de correlação "r":**

![image](https://github.com/user-attachments/assets/14dfcddb-0a7c-4d59-8804-77107aa15dd3)

- O coeficiente de correlação entre a variável dependente "Sales" e a variável independente "Radio" é de "0,35", que representa uma correlação de fraca a moderada.

**5.3 Análise exploratória das estatísticas gerais:**

![image](https://github.com/user-attachments/assets/1c231095-f4e0-4b61-8100-53eba8ee01a5)

Assim como anteriormente, vamos fazer uma análise geral das informações obtidas por meio desta regressão linear

**5.3.1  Resíduos (Residuals):**

- Valor mínimo: Foi de -15,5632. Em determinado momento, o modelo esperou um valor cerca de 15,57 vezes maior do que o valor que foi calculado de fato. 
- 1º Quartil: 25% dos erros são menores que -3,5293 unidades.
- Resíduo mediano: Continua pequeno, mas quando comparado com o anterior (Resíduo mediano Sales x TV), é nítido o aumento de tamanho, o que indica que o modelo está ligeiramente descentralizado, neste caso.
- 3º Quartil: 75% dos erros são menores que 4,2504 unidades.
- Valor máximo: O valor obtido foi de 8,6796, ou seja, em algum ponto do conjunto de dados, o modelo previa um valor de aproximadamente 8,68 vezes menor do que o valor real.

**5.3.2  Coeficientes (Coefficients):**

Os coeficientes representam a relação entre o investimento em anúncios de Rádio e o total de vendas.

***Intercepto***
   
- **Estimativa:** O valor previsto de vendas quando o investimento em anúncios de rádio são nulos, é de 12,2357.
- **Erro padrão:** O erro padrão do intercepto é de 0,6535, que representa uma incerteza muito baixa, o que sugere que a estimativa é precisa e confiável.
- **Estatística t / Valor t:** O valor t de 18,724, indica que a estimativa do intercepto no valor de 12,2357 é cerca de 18,73 vezes maior do que o erro padrão de 0,6535, o que pode destacar uma alta confiabilidade do intercepto.
- **Significância estatística:** O p-valor (<2e-16 ou 0,0000000000000002) mostra que há uma evidência muito forte de que o intercepto é diferente de zero. Isso significa que, mesmo sem gastos em anúncios de Rádio, o modelo prevê um valor base de vendas (12,2357 unidades), o que é estatisticamente significativo.

***Rádio (Variável independente)***

- **Estimativa:** O valor 0,1244 representa a ideia de que, para cada unidade adicional de gasto em anúncios de Rádio, as vendas aumentam, em média, 0,1244 unidades.
- **Erro padrão:** O erro padrão da variável Radio é de 0,0237, um valor aproximadamente 12,5 vezes maior de incerteza, o que indica uma confiabilidade menor.
- **Estatística t / Valor t:** Se encontra em 5,251, por mais que em comparação com a variável anterior, seu tamanho tenha diminuído, o Valor T ainda permanece longe de zero, o que significa que a variável independente tem influência sobre a variável dependente e é estatisticamente significativa.
- **P-valor:** Apresenta o valor de, 3.88e-07 ou 0,000000388 que é consideravelmente pequeno, confirmando que os gastos em Rádio têm um impacto altamente significativo sobre as vendas do determinado produto.

**5.3.3 Erro padrão Residual (Residual Standard Error):**

- Neste caso, o erro médio do modelo ao prever vendas é de aproximadamente 4,963 unidades, com 198 graus de liberdade.

**5.3.4 Coeficiente de determinação (R²):**

- Diz sobre o quanto do comportamento da variável dependente (Sales), pode ser explicado pela variável independente (Rádio) no modelo de regressão.
- Nesta análise, o R² tem o valor de 0,1222, isso é, 12,22% de variação no total de vendas podem ser explicadas pelos investimentos em anúncios de Rádio.

**5.4 Conclusão obtida pelo modelo de regressão linear "Sales x Rádio":**

&nbsp;&nbsp;&nbsp;O investimento em anúncios de rádio gera um impacto positivo e significativo nas vendas, mas o efeito é relativamente pequeno, já que cada unidade adicional de gasto em rádio faz com que as vendas aumentem, em média, apenas 0,1244 unidades. Ou seja, embora o modelo seja útil para identificar essa relação, ele não é suficientemente preciso para prever as vendas com alta confiabilidade.

## 6. Desenvolvimento por partes do código: Variável dependente "Sales" x Variável independente "Newspaper".

```r

# 3. Regressão Linear e Correlação entre a variável independente "Newspaper" e a variável dependente "Sales"

              
  # 3.1 - Criação da variável que irá calcular a regressão linear.
              regressao_newspaper <- lm(Sales ~ Newspaper, data = dados)
  
  # 3.2 - Criação do gráfico de dispersão com a linha de regressão.
              ggplot(data = dados, mapping = aes(x = Newspaper, y = Sales)) +
              geom_point() +
              geom_smooth(method = lm, col = "red") +
              theme_classic() +
              ggtitle("Anúncios em Jornais/Newspaper x Impacto em Vendas/Sales") +
              labs(x = "Anúncios em Jornais/Newspaper", y = "Vendas/Sales")
  
  # 3.3 - Calcular a correlação entre as variáveis "Newspaper" e "Sales".
              cor_newspaper <- cor(dados$Sales, dados$Newspaper)
              print(paste("Correlação: Anúncios em Jornais X Impactos em Vendas:",round(cor_newspaper, 2)))

  # 3.4 - Ao final, serão apresentadas as análise de regressão e correlação.
              summary(regressao_newspaper)

```
Nesta etapa, será realizada a análise de regressão entre a variável dependente "Sales" e a variável independente "Newspaper". 

**6.1 Gráfico de de dispersão e linha de regressão**              
![image](https://github.com/user-attachments/assets/043cbc4b-7f0f-4966-953c-9f1e237e50b2)

Por meio desta regressão linear, são perceptíveis alguns detalhes:

- Fraca correlação positiva: É destacado pela linha de regressão que apresenta uma leve inclinação positiva. Contudo, a inclinação é quase horizontal, sugerindo que o impacto dos anúncios em jornal nas vendas é muito pequeno.

- Dispersão descentralizada: Os pontos estão bastante dispersos em torno da linha de regressão, o que indica uma relação fraca entre as variáveis.

**6.2  Coeficiente de correlação "r":**

![image](https://github.com/user-attachments/assets/7b803273-2b0a-4155-9995-db7a987d1374)

- O coeficiente de correlação entre a variável dependente "Sales" e a variável independente "Newspaper" é de 0,16, o que indica que o nível de correlação é extremamente baixo.

**6.3 Análise exploratória das estatísticas gerais:**

![image](https://github.com/user-attachments/assets/01e2f33b-6aee-4a22-8ebd-b4648c3d5281)

**6.3.1  Resíduos (Residuals):**

- Valor mínimo: O valor obtido foi -12,6930, que significa que era esperado um valor cerca de 12,70 vezes maior do que o valor que foi obtido através do modelo de fato. 
- 1º Quartil: 25% dos erros são menores que -3,8807 unidades.
- Resíduo mediano: É de 0,6591, o que pode indicar que o modelo está moderadamente descentralizado, o que pode ser visível pela forte dispersão dos pontos.
- 3º Quartil: 75% dos erros são menores que 3,9083 unidades.
- Valor máximo: O valor obtido foi 11,4385, ou seja, o modelo previa um valor aproximadamente 11,44 vezes menor do que o valor real.

**6.3.2  Coeficientes (Coefficients):**

Os coeficientes representam a relação entre os gastos em anúncios de jornal(Newspaper) e as vendas(Sales).

***Intercepto***
   
- **Estimativa:** O valor 13,95955 representa as vendas esperadas quando não há investimento em publicidade por meio de jornais.
- **Erro padrão:** O erro padrão do intercepto é de 0,63829, uma incerteza bem controlada, o que indica uma maior confiança e maior precisão na estimativa do intercepto.
- **Estatística t / Valor t:** O valor é 21,87, e isso significa que, a estimativa do intercepto no valor de 13,95955 é 21,87 vezes maior do que o erro padrão de 0,63829 do intercepto, ou seja, evidencia uma forte precisão.
- **Significância estatística:** O p-valor (<2e-16 ou 0,0000000000000002) mostra que há uma evidência muito forte de que o intercepto é diferente de zero. Isso significa que, mesmo sem gastos em anúncios de jornal, o modelo prevê um valor base nas vendas de 13,95955 unidades, o que é estatisticamente significativo.

***Jornal (Variável independente)***

- **Estimativa:** O valor 0,03832 afirma que, para cada unidade adicional de investimento em anúncios de jornal, as vendas aumentam, em média, 0,03832 unidades.
- **Erro padrão:** Como o erro padrão de 0,01703 é de fato muito pequeno, isso é um bom indicador de que as estimativas são precisas.
- **Estatística t / Valor t:** O valor obtido pelo modelo foi de 2,251. Isso significa que o impacto da variável independente "Newspaper" no modelo é pequeno, contudo, é estatisticamente significativo. 
- **P-valor:** Apresenta o valor 0,0255, confirmando que os gastos em anúncios de jornal são significativos sobre as vendas, embora não seja impactantes no resultado final.

**6.3.3 Erro padrão Residual (Residual Standard Error):**

- Neste caso, o erro médio do modelo ao prever vendas é de aproximadamente 5,231 unidades, com 198 graus de liberdade.

**6.3.4 Coeficiente de determinação (R²):**

- Foi obtido um valor equivalente a 0,02495. Isso significa que somente 2,5% da variação nas vendas podem ser explicadas pelos investimentos em anúncios de jornal.

**6.4  Conclusão obtida pelo modelo de regressão linear "Sales x Newspaper":**

&nbsp;&nbsp;&nbsp;Embora exista uma relação entre o investimento nas propagandas de jornal e o aumento de vendas, o impacto desta variável é praticamente irrelevante quando é analisada de forma isolada, assim como foi feito. A cada unidade adicional de gasto em anúncios de jornal, faz com que ocorra um aumento nas vendas de em média, 0,03832 unidades. Ou seja, embora o modelo seja útil para identificar essa relação, ele não é suficientemente preciso para prever as vendas com alta confiabilidade.

 ## 7. Conclusão final: 
 
&nbsp;&nbsp;&nbsp;A análise realizada neste projeto avaliou o impacto dos gastos publicitários em TV, rádio e jornais sobre as vendas, utilizando modelos de regressão linear. Os resultados mostram que a variável "TV" teve o maior impacto, com um coeficiente positivo significativo (0,055) e explicando 81.22% da variação nas vendas (R²), o que indica uma forte relação entre os investimentos em anúncios de TV e o aumento das vendas. A variável "radio" também apresentou uma relação positiva (0,124), mas com menor poder explicativo (R²=12,22%), sugerindo que, embora significativa, sua influência seja mais limitada. Por outro lado, os anúncios em "jornais/newspaper" tiveram o menor impacto (0,038) e explicaram apenas 2,5% da variação nas vendas, indicando uma relação fraca e pouco relevante.

&nbsp;&nbsp;&nbsp;Embora todas as variáveis sejam estatisticamente significativas, a análise evidencia que o impacto prático varia substancialmente entre as mídias, sendo os anúncios em TV os mais eficazes para impulsionar as vendas, seguidos por rádio, enquanto os anúncios em jornais mostram-se menos relevantes no contexto analisado. Esses resultados reforçam a importância de alocar recursos estrategicamente nas mídias que oferecem maior retorno.
















