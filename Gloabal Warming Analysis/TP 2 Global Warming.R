co2.region.a�o <- read.csv("C:/Users/Pedro Vallarino/Desktop/Facultad/Storytelling/annual-co-emissions-by-region.csv")
co2.sector <- read.csv("C:/Users/Pedro Vallarino/Desktop/Facultad/Storytelling/carbon-dioxide-co2-emissions-by-sector-or-source.csv")
co2.a�o <- read.csv("C:/Users/Pedro Vallarino/Desktop/Facultad/Storytelling/annual-share-of-co2-emissions.csv")


library(dplyr)
library(plotly)



temp = 0
p3 = 0

# temp = co2.sector[which(co2.sector$Entity == filtro_nombres[k]),]
# temp = select(temp,-c(2,4,6,7,8))
# Numfil3 = length(temp$Entity)

# filtro_nombres = 0
# filtro_nombres = as.data.frame(slice(co2.sector[which(co2.sector$Electricity.and.heat.production....>75),]))
# filtro_nombres = unique(filtro_nombres$Entity)

paises3 = c("Bahrain","Bosnia and Herzegovina","Brunei","Estonia","Kosovo","Macedonia","Malta","Serbia","Singapore","Trinidad and Tobago")

p3 <- plot_ly(type = 'scatter', mode = 'lines')

for (k in 1:length(paises3)) {
  
  c222 = co2.sector
  c222 = c222[which(co2.sector$Entity == paises3[k]),]
  
  p3 = add_trace(p3,x=c222$Year, y = c222$Electricity.and.heat.production...., color = colours()[k], name = paises3[k]) 
  
}
p3

co2.a�o = select(co2.a�o,-c(2))
co2.a�o = slice(co2.a�o,which(co2.a�o$Share>10))
co2.a�o = slice(co2.a�o,-which(co2.a�o$Entity == "EU-28"))

co2.region.a�o = select(co2.region.a�o,-c(2))
co2.region.a�o = slice(co2.region.a�o,-which(co2.region.a�o$Annual<1000000000))

paises2 = table(co2.region.a�o$Entity)
p2 = 0
Numfil2 = length(table(co2.region.a�o$Entity))


p2 <- plot_ly(type = 'scatter', mode = 'lines')


for (k in 1:Numfil2) {
  
  c22 = co2.region.a�o
  c22 = c22[which(co2.region.a�o$Entity == names(paises2[k])),]
  
  p2 = add_trace(p2,x=c22$Year, y = c22$Annual, color = colours()[k], name = names(paises2[k])) 
  
}
p2


paises = table(co2.a�o$Entity)
p = 0
Numfil = length(table(co2.a�o$Entity))


p <- plot_ly(type = 'scatter', mode = 'lines')

for (i in 1:Numfil) {
    
c2 = co2.a�o
c2 = c2[which(co2.a�o$Entity == names(paises[i])),]

p = add_trace(p,x=c2$Year, y = c2$Share.of.global.CO�...emissions...., color = colours()[i*2], name = names(paises[i])) 

}
  p

remove(c2)
remove(c22)  
remove(c222)  
  