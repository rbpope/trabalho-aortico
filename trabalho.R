install.packages("ggplot2")
install.packages("purrr")
install.packages("dplyr")

# transforma em dataframe e apresenta as primeiras linhas
df <- cirurgias
colnames(df)

# Dividindo o Dataset em 4

medtronic <- df[df$Oxigenador == "M", ]
Braile <- df[df$Oxigenador  == "B", ]
Nipro <- df[df$Oxigenador  == "N", ]
liva <- df[df$Oxigenador == "LN", ]

# Gerando as Médias para cada uma das colunas dos dois Datasets

RM_mortmeds_mean <- mean(medtronic$Desfecho )
RM_SAtual_mean <- mean(Roupas_Masculinas$data)
RM_SDepois_mean <- mean(Roupas_Masculinas$seguinte)

CH_SAntes_mean <- mean(Chocolates$anterior)
CH_SAtual_mean <- mean(Chocolates$data)
CH_SDepois_mean <- mean(Chocolates$seguinte)

# Printando os resultados das médias

cat ("Medias da cols de Roupas Masculinas (Antes): ",RM_SAntes_mean)
cat ("Medias da cols de Roupas Masculinas (Atual): ",RM_SAtual_mean)
cat ("Medias da cols de Roupas Masculinas (Depois): ",RM_SDepois_mean)
cat ("Medias da cols de Roupas Masculinas (Antes): ",CH_SAntes_mean)
cat ("Medias da cols de Roupas Masculinas (Atual): ",CH_SAtual_mean)
cat ("Medias da cols de Roupas Masculinas (Depois): ",CH_SDepois_mean)

# Gerando Boxplots

boxplot(anterior ~ cat, data=df)
boxplot(data ~ cat, data=df)
boxplot(seguinte ~ cat, data=df)


#1.	Há evidência para afirmar que o Índice de Vendas médio seja diferente entre as categorias Chocolates e Roupas masculinas, antes da promoção?
# Resposta: Observar o se valor-p é diferente de 1.00. 

t.test(anterior ~ cat,data=df, alt="greater")
t.test(anterior ~ cat,data=df, alt="less")
t.test(anterior ~ cat,data=df, alt="two.sided")
# Não há evidência, pois p valor é maior que 5%, o que não nos permite revutar a hipótese nula.

#2.	Há evidência para afirmar que o Índice de Vendas médio da categoria Chocolates tenha aumentado durante a promoção?

t.test(Chocolates$anterior, Chocolates$data, alt="greater", paired = TRUE)
t.test(Chocolates$anterior, Chocolates$data, alt="less", paired = TRUE)
t.test(Chocolates$anterior, Chocolates$data, alt="two.sided", paired = TRUE)

#3.	Há evidência para afirmar que o Índice de Vendas médio da categoria Chocolates seja diferente antes e depois da promoção (efeito residual)?

t.test(Chocolates$anterior, Chocolates$seguinte, alt="less", paired = TRUE)
t.test(Chocolates$anterior, Chocolates$seguinte, alt="greater", paired = TRUE)
t.test(Chocolates$anterior, Chocolates$seguinte, alt="two.sided", paired = TRUE)
#t.test(Chocolates$SEMANA.ANTERIOR.À.PROMOÇÃO, Chocolates$SEMANA.SEGUINTE.À.PROMOÇÃO, alt="?", paired = TRUE, mu = ?)

#4.	Há evidência para afirmar que o Índice de Vendas médio da categoria Roupas Masculinas seja diferente antes e depois da promoção (efeito residual)?

t.test(Roupas_Masculinas$anterior, Roupas_Masculinas$seguinte, alt="less", paired = TRUE)
t.test(Roupas_Masculinas$anterior, Roupas_Masculinas$seguinte, alt="greater", paired = TRUE)
t.test(Roupas_Masculinas$anterior, Roupas_Masculinas$seguinte, alt="two.sided", paired = TRUE)
#t.test(Roupas_Masculinas$SEMANA.ANTERIOR.À.PROMOÇÃO, Roupas_Masculinas$SEMANA.SEGUINTE.À.PROMOÇÃO, alt="?", paired = TRUE, mu = ?)


#5.	   Qual a sua recomendação final, em linguagem de gestor, para os diretores dessa loja?

t.test(Roupas_Masculinas$anterior, Roupas_Masculinas$seguinte, alt="two.sided", paired = TRUE)
t.test(Roupas_Masculinas$anterior, Roupas_Masculinas$data, alt="two.sided", paired = TRUE)


  