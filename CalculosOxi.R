install.packages("dplyr")
df <- cirurgias
head(df)
tabela = table(df$Oxigenador , df$Desfecho)
tabela
summary(tabela)
