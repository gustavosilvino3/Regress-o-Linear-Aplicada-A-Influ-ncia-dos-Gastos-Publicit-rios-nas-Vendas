
#Importação das bibliotecas utilizadas.
dados <- read.csv("advertising.csv")
library(ggplot2)
library(corrplot)

#########################################################################################

#Regressão linear entre as variáveis "Sales" e "TV"
regressao_tv <- lm(Sales ~ TV, data = dados)
ggplot(data = dados, mapping = aes(x = TV, y = Sales)) +
              geom_point() +
              geom_smooth(method = lm, col = "red") +
              theme_classic() +
              ggtitle("Anúncios em TV x Impacto em Vendas/Sales") +
              labs(x = "Anúncios em TV", y = "Vendas/Sales") 
cor_tv <- cor(dados$Sales, dados$TV)
              print(paste("Correlação entre Anúncios em TV e Impactos em Vendas/Sales:", round(cor_tv, 2)))
summary(regressao_tv)

#########################################################################################

regressao_radio <- lm(Sales ~ Radio, data = dados)
ggplot(data = dados, mapping = aes(x = Radio, y = Sales)) +
            geom_point() +
            geom_smooth(method = lm, col = "red") +
            theme_classic() +
            ggtitle("Anúncios em Rádio x Impacto em Vendas/Sales") +
            labs(x = "Anúncios em Rádio", y = "Vendas/Sales")
cor_radio <- cor(dados$Sales, dados$Radio)
            print(paste("Correlação entre Anúncios em Rádio e Impactos em Vendas/Sales:", round(cor_radio, 2)))
summary(regressao_radio)
#########################################################################################

regressao_newspaper <- lm(Sales ~ Newspaper, data = dados)
ggplot(data = dados, mapping = aes(x = Newspaper, y = Sales)) +
              geom_point() +
              geom_smooth(method = lm, col = "red") +
              theme_classic() +
              ggtitle("Anúncios em Jornais/Newspaper x Impacto em Vendas/Sales") +
              labs(x = "Anúncios em Jornais/Newspaper", y = "Vendas/Sales")
cor_newspaper <- cor(dados$Sales, dados$Newspaper)
              print(paste("Correlação entre Anúncios em Jornais/Newspaper e Impactos em Vendas/Sales:",round(cor_newspaper, 2)))
summary(regressao_newspaper)

