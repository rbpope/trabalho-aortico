df <- cirurgias
head(df)
tabela = table(df$Oxigenador , df$Desfecho)
tabela
summary(tabela)
tabelaB = table(Braile$Oxigenador, Braile$Desfecho)
summary(tabelaB)
