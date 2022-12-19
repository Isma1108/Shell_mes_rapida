#Per poder passar les dades a R:
#Primer es mou al directori de treball el ficher dades_finals.xlsx descarregable accedint a l'enllaç que es mostrarà després.
library(readxl)
#dades = read\_excel("dades_finals.xlsx")
#Fent:
print(dades, n = 128)
#Ja podem veure totes les dades a R

attach(dades) #per evitar usar dades$... constantment
  
#Pel boxplot dels temps de cada shell:
boxplot(TEMPS_TOTAL[SHELL=='sh'], TEMPS_TOTAL[SHELL=='ash'], TEMPS_TOTAL[SHELL=='bash'], TEMPS_TOTAL[SHELL=='dash'], TEMPS_TOTAL[SHELL=='ksh'], TEMPS_TOTAL[SHELL=='zsh'], TEMPS_TOTAL[SHELL=='tcsh'], TEMPS_TOTAL[SHELL=='fish'])

#Pel gràfic d'independència de les dades:
plot(rstandard(lm(TEMPS_TOTAL~SHELL=='sh')),type='l',ylab='Residus',main='sh')
plot(rstandard(lm(TEMPS_TOTAL~SHELL=='ash')),type='l',ylab='Residus',main='ash')
#i així amb totes les shells ...

#Per la normalitat:
qqnorm((TEMPS_TOTAL[SHELL=='sh']), main="sh")
qqline((TEMPS_TOTAL[SHELL=='sh']), main="sh")
qqnorm((TEMPS_TOTAL[SHELL=='ash']), main="ash")
qqline((TEMPS_TOTAL[SHELL=='ash']), main="ash")
#i així per totes les shells ...

#Per l'inferència de la mitjana de temps:
lm(formula = TEMPS_TOTAL ~ SHELL)

#Per veure els intervals de confiança de les mitjanes:
confint(lm(TEMPS_TOTAL~0+SHELL))

#I de forma gràfica amb emmeans(cal instal·lar emmeans si no funciona):
emmeans(lm(TEMPS_TOTAL~SHELL),~SHELL)

#Per les 4 premisses del model lineal i múltiple per la relació t_usuari - t_sistema:
par(mfrow=c(2,2))

# QQ-Norm i Standard Residuals vs. Fitted
plot(lm(TEMPS_USUARI[PROGRAMA == 'Sort']~TEMPS_SISTEMA[PROGRAMA == 'Sort']),c(2,1))

# Histograma dels residus estandaritzats
hist(rstandard(lm(TEMPS_USUARI[PROGRAMA == 'Sort']~TEMPS_SISTEMA[PROGRAMA == 'Sort'])), main="Histograma")

#Gràfic d'independència dels residus:
plot (1:64,rstandard(lm(TEMPS_USUARI[PROGRAMA == 'Sort']~TEMPS_SISTEMA[PROGRAMA == 'Sort'])),type="l")

#El mateix seria amb partidaEDA ...

#La comanda lm per l'inferència de la relació entre t_usuari i t_sistema:
summary(lm(formula = TEMPS_USUARI[PROGRAMA == "Sort"] ~ TEMPS_SISTEMA[PROGRAMA == "Sort"]))
summary(lm(formula = TEMPS_USUARI[PROGRAMA == "PartidaEDA"] ~ TEMPS_SISTEMA[PROGRAMA == "PartidaEDA"]))








