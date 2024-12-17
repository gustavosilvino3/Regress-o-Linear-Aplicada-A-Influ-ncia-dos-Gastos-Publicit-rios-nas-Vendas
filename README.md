# Regressão Linear Aplicada: A influência dos gastos publicitários nas vendas.

## 1. Introdução  

**Objetivo do projeto:** 
Explorar a aplicação da regressão linear para analisar como o investimento em anúncios publicitários em diferentes meios de comunicação, pode ou não, estimular as vendas de determinado produto.

- Mas o que seria "regressão linear"? A regressão linear é uma técnica estatística utilizada para entender e modelar a relação entre variáveis. Ela permite prever o valor de uma variável dependente com base em uma ou mais variáveis independentes, ajustando uma linha reta aos dados para identificar tendências e padrões.


## 2. Ferramentas utilizadas para a criação do projeto.

- Base de dados utilizada disponível em: https://www.kaggle.com/datasets/ashydv/advertising-dataset/data
- Código desenvolvido por meio de linguagem R.
- IDE utilizada: RStudio.

## 3. Desenvolvimento por partes do código: Variável dependente "Sales" x Variável independente "TV".

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
      
  #1.4 - Ao final, serão apresentadas as análises de regressão e correlação.
              summary(regressao_tv)

```
Ao executar esse bloco do código, vamos obter as seguintes análises:


 **3.1   Gráfico de de dispersão e linha de regressão:**

 
 ![image](https://github.com/user-attachments/assets/5d2f49f2-f7b2-47ef-a40f-aa00574bf382)


Com este gráfico de dispersão em conjunto com uma linha de regressão, é possível visualizar os dados de forma clara e objetiva, e é possível destacar dois tópicos: 

- Forte correlação positiva: Os dados indicam que, à medida que os gastos em TV aumentam, as vendas também tendem a aumentar. Isso é representado pela inclinação positiva da linha de regressão.

- Linha de tendência: A linha ajustada captura bem a relação linear entre as variáveis, com poucos desvios significativos.


**3.2  Coeficiente de correlação "r":**

![image](https://github.com/user-attachments/assets/7c90116b-2c84-4363-a599-2e9504f75433)

- O coeficiente de correlação se trata de o quanto a variável dependente está relacionada com a variável independente, neste caso, "Sales" e "TV", respectivamente. Como é apresentado, existe um coeficiente de correlação de **"0,90"**, o que indica que existe de fato, uma forte correlação positiva entre as variáveis.

**3.3  Análises gerais:**

Ao final do bloco, a função "summary" irá apresentar uma análise detalhada de todas as informações presentes na regressão linear.

![image](https://github.com/user-attachments/assets/8693fb94-56ff-43ef-867b-ae577b206ef4)

Sendo essas informações: 

**3.3.1  Resíduos (Residuals):**

Os resíduos vão nos mostrar o quanto o valor observado/real divergiu do valor esperado pelo modelo de regressão linear.

- Valor mínimo: Foi de aproximadamente **-6,45**, ou seja, em algum ponto do conjunto de dados, o modelo esperou um valor de aproximadamente 6,45 maior do que o valor real.

- Mediana: O resíduo mediano é de 0,0218, um valor bem próximo de 0, o que indica que o modelo está bem equilibrado.

- Valor máximo: Foi de aproximadamente **5,70**, ou seja, em algum ponto do conjunto de dados, o modelo esperou um valor de aproximadamente 5,70 menor do que o valor real.

**3.3.2  Coeficientes (Coefficients):**

Os coeficientes representam a relação entre os gastos em anúncios de TV (TV) e as vendas (Sales).

***Intercepto***
   
- **Estimativa:** O valor **6,974821** representa as vendas esperadas quando não há investimento em anúncios de TV.
- **Erro padrão:** O erro padrão do intercepto é de **0,322553**, ou seja, uma incerteza muito pequena, e isso indica uma maior confiança e maior precisão na estimativa do intercepto.
- **Estatística t / Valor t:** O valor t de **21,62**, indica que a estimativa do intercepto no valor de **6,974821** é **21,62** vezes maior do que o erro padrão de **0,322553**, ou seja, evidencia a alta precisão do intercepto.
- **Significância estatística:** O p-valor (**<2e-16** ou **0,0000000000000002**) mostra que há uma evidência muito forte de que o intercepto é diferente de zero. Isso significa que, mesmo sem gastos em anúncios de TV, o modelo prevê um valor base de vendas (**6,974821 unidades**), o que é estatisticamente significativo.

***TV (Variável independente)***

- **Estimativa:** O valor **0,055465** diz que, para cada unidade adicional de gasto em anúncios de TV, as vendas aumentam, em média, **0,055465** unidades.
- **Erro padrão:** Como o erro padrão de **0,001896** é de fato muito pequeno, isso é um bom indicador de que as estimativas são precisas.
- **Estatística t / Valor t:** Como o valor **29,26** é mais elevado, a influência que a variável independente tem sobre a variável dependente é estatisticamente significativa.
- **P-valor:** Apresenta um valor muito pequeno, **<2e-16** ou **0,0000000000000002**, confirmando que os gastos em TV têm um impacto altamente significativo sobre as vendas.

**3.3.3  Níveis de significância estatística:**

![image](https://github.com/user-attachments/assets/9fe0b697-36d8-445f-836e-db4ba4929814)

Os asteriscos (***) indicam níveis de significância estatística.

- "***": (p<0,001), logo, é extremamente significativo estatisticamente.
- "**": (p<0,01), logo, é muito significativo estatisticamente.
- "*": (p<0,05), logo, é significativo estatisticamente.
- Sem asterisco: Não é significativo estatisticamente.

**3.3.4 Erro padrão Residual (Residual Standard Error):**

- O erro padrão residual tem a função de medir o quanto a variação média prevista das incertezas do modelo estão distantes da variação real.
- Neste caso, o erro médio do modelo ao prever vendas é de aproximadamente **2.296 unidades**.

**3.3.5 Coeficiente de determinação (R²):**

- Diz sobre o quanto do comportamento da variável dependente (Sales), pode ser explicado pela variável independente (TV) no modelo de regressão.
- Dessa forma, o R² equivalente a **0,8122**, significa que 81,22% da variação nas vendas podem ser explicadas pelos investimentos em anúncios de TV.

**3.4 Conclusão obtida pelo modelo de regressão linear (Sales x TV):**



## 4. Desenvolvimento por partes do código: Variável dependente "Sales" x Variável independente "Rádio".
  
  ```r
  
  # 2. Regressão Linear e Correlação entre a variável dependente "Sales" e a variável independente "Rádio" 

              
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


**4.1 Gráfico de de dispersão e linha de regressão**

![image](https://github.com/user-attachments/assets/b65a9b77-d8ab-4b4a-901e-5a9483748418)

Através deste gráfico, é possível perceber que a correlação entre as variavéis, apesar de ser positiva, não é forte como a anterior, devido aos seguintes fatores: 

- Distribuição dos pontos: Existe uma maior dispersão dos pontos, isso pode sugerir que os anúncios em rádio, não possuam alta influência na variável das vendas.

- Linha de têndencia: Como os pontos não estão tão próximos da linha de regressão, o modelo tem uma capacidade moderada de explicar a variação nas vendas.

**4.2 Coeficiente de correlação "r":**

![image](https://github.com/user-attachments/assets/14dfcddb-0a7c-4d59-8804-77107aa15dd3)

- O coeficiente de correlação entre a variável dependente "Sales" e a variável independente "Rádio" é de **"0,35"**, que representa uma correlação de fraca a moderada.

**4.3 Análise exploratória das estátisticas gerais:**

![image](https://github.com/user-attachments/assets/1c231095-f4e0-4b61-8100-53eba8ee01a5)

Assim como anteriormente, vamos fazer uma análise geral das informações obtidas por meio desta regressão linear

**4.3.1  Resíduos (Residuals):**

- Valor mínimo: Foi de aproximadamente **-15,57**. Em determinado momento, o modelo esperou um valor cerca de 15,57 vezes maior do que o valor que foi calculado de fato. 

- Resíduo mediano: Continua pequeno, mas quando comparado com o anterior (Resíduo mediano Sales x TV), é nítido o aumento de tamanho, o que indica que o modelo está ligeiramente descentralizado, neste caso.

- Valor máximo: O valor obtido foi cerca de **8,68**, ou seja, em algum ponto do conjunto de dados, o modelo previa um valor de aproximadamente 8,68 vezes menor do que o valor real.

**3.3.2  Coeficientes (Coefficients):**

Os coeficientes representam a relação entre os gastos em anúncios de Rádio e as vendas.

***Intercepto***
   
- **Estimativa:** O valor previsto de vendas quando o investimento em anúncios de rádio são nulos, é de **12,2357**.
- **Erro padrão:** O erro padrão do intercepto é de **0,6535**, ou seja, uma incerteza muito pequena, e isso indica uma maior confiança e maior precisão na estimativa do intercepto.
- **Estatística t / Valor t:** O valor t de **21,62**, indica que a estimativa do intercepto no valor de **6,974821** é **21,62** vezes maior do que o erro padrão de **0,322553**, ou seja, evidencia a alta precisão do intercepto.
- **Significância estatística:** O p-valor (**<2e-16** ou **0,0000000000000002**) mostra que há uma evidência muito forte de que o intercepto é diferente de zero. Isso significa que, mesmo sem gastos em anúncios de TV, o modelo prevê um valor base de vendas (**6,974821 unidades**), o que é estatisticamente significativo.

***TV (Variável independente)***

- **Estimativa:** O valor **0,055465** diz que, para cada unidade adicional de gasto em anúncios de TV, as vendas aumentam, em média, **0,055465** unidades.
- **Erro padrão:** Como o erro padrão de **0,001896** é de fato muito pequeno, isso é um bom indicador de que as estimativas são precisas.
- **Estatística t / Valor t:** Como o valor **29,26** é mais elevado, a influência que a variável independente tem sobre a variável dependente é estatisticamente significativa.
- **P-valor:** Apresenta um valor muito pequeno, **<2e-16** ou **0,0000000000000002**, confirmando que os gastos em TV têm um impacto altamente significativo sobre as vendas.

**3.3.3  Níveis de significância estatística:**

![image](https://github.com/user-attachments/assets/9fe0b697-36d8-445f-836e-db4ba4929814)

Os asteriscos (***) indicam níveis de significância estatística.

- "***": (p<0,001), logo, é extremamente significativo estatisticamente.
- "**": (p<0,01), logo, é muito significativo estatisticamente.
- "*": (p<0,05), logo, é significativo estatisticamente.
- Sem asterisco: Não é significativo estatisticamente.

**3.3.4 Erro padrão Residual (Residual Standard Error):**

- O erro padrão residual tem a função de medir o quanto a variação média prevista das incertezas do modelo estão distantes da variação real.
- Neste caso, o erro médio do modelo ao prever vendas é de aproximadamente **2.296 unidades**.

**3.3.5 Coeficiente de determinação (R²):**

- Diz sobre o quanto do comportamento da variável dependente (Sales), pode ser explicado pela variável independente (TV) no modelo de regressão.
- Dessa forma, o R² equivalente a **0,8122**, significa que 81,22% da variação nas vendas podem ser explicadas pelos investimentos em anúncios de TV.




 




    




 

## 5.0
![image](https://github.com/user-attachments/assets/043cbc4b-7f0f-4966-953c-9f1e237e50b2)
              
              














