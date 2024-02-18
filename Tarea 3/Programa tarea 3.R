install.packages("readr")
library(readr)
install.packages("tidyverse")
library(tidyverse)
install.packages("anytime")
library(anytime)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)
install.packages("writexl")
library(writexl)


# 1. Importamos los datos requeridos
# Reservas internacionales

reservas_internacionales<- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/Reservas_internacionales.csv")
# Tasa interbancaria
tasa_interbancaria <- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/Tasa_interbancaria.csv")
# Bono a 10 años en soles
bono_soles <- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/bono_soles.csv")

# Bono a 10 años en dólares
bono_dolares <- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/bono_dolares.csv")
# Tipo de cambio - compra
tc_compra <- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/tc_compra.csv")
# Tipo de cambio - venta
tc_venta <- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/tc_venta.csv")
# Índice bursátil - BVL
indice_bvl <- readr::read_csv("C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/indice_bvl.csv")

# 2. 
# a. 
# Columnas para año, mes y día
reservas_internacionales$Fechas <- dmy(reservas_internacionales$Fechas)
reservas_internacionales$Año <- year(reservas_internacionales$Fechas)
reservas_internacionales$Mes <- month(reservas_internacionales$Fechas, label = TRUE, abbr = TRUE)
reservas_internacionales$Dia <- day(reservas_internacionales$Fechas)

tasa_interbancaria$Fechas <- dmy(tasa_interbancaria$Fechas)
tasa_interbancaria$Año <- year(tasa_interbancaria$Fechas)
tasa_interbancaria$Mes <- month(tasa_interbancaria$Fechas, label = TRUE, abbr = TRUE)
tasa_interbancaria$Dia <- day(tasa_interbancaria$Fechas)

bono_soles$Fechas <- dmy(bono_soles$Fechas)
bono_soles$Año <- year(bono_soles$Fechas)
bono_soles$Mes <- month(bono_soles$Fechas, label = TRUE, abbr = TRUE)
bono_soles$Dia <- day(bono_soles$Fechas)

bono_dolares$Fechas <- dmy(bono_dolares$Fechas)
bono_dolares$Año <- year(bono_dolares$Fechas)
bono_dolares$Mes <- month(bono_dolares$Fechas, label = TRUE, abbr = TRUE)
bono_dolares$Dia <- day(bono_dolares$Fechas)

tc_compra$Fechas <- dmy(tc_compra$Fechas)
tc_compra$Año <- year(tc_compra$Fechas)
tc_compra$Mes <- month(tc_compra$Fechas, label = TRUE, abbr = TRUE)
tc_compra$Dia <- day(tc_compra$Fechas)

tc_venta$Fechas <- dmy(tc_venta$Fechas)
tc_venta$Año <- year(tc_venta$Fechas)
tc_venta$Mes <- month(tc_venta$Fechas, label = TRUE, abbr = TRUE)
tc_venta$Dia <- day(tc_venta$Fechas)

indice_bvl$Fechas <- dmy(indice_bvl$Fechas)
indice_bvl$Año <- year(indice_bvl$Fechas)
indice_bvl$Mes <- month(indice_bvl$Fechas, label = TRUE, abbr = TRUE)
indice_bvl$Dia <- day(indice_bvl$Fechas)

# Para hacer la b. de forma más sencilla y rápida, haremos la e. antes, para renombrar las variables
colnames(reservas_internacionales)[2] <- "Reservas_internacionales"
colnames(tasa_interbancaria)[2] <- "Tasa_interbancaria"
colnames(bono_soles)[2] <- "Bono_soles"
colnames(bono_dolares)[2] <- "Bono_dólares"
colnames(tc_compra)[2] <- "Tipo_de_cambio_compra"
colnames(tc_venta)[2] <- "Tipo_de_cambio_venta"
colnames(indice_bvl)[2] <- "Indice_BVL"

# Asimismo, para tener mayor facilidad también realizaremos antes la c., para borrar los missings values
reservas_internacionales <- reservas_internacionales %>%
  filter(Reservas_internacionales != "n.d.")

tasa_interbancaria <- tasa_interbancaria %>%
  filter(Tasa_interbancaria != "n.d.")

bono_soles <- bono_soles %>%
  filter(Bono_soles != "n.d.")

bono_dolares <- bono_dolares %>%
  filter(Bono_dólares != "n.d.")

tc_compra <- tc_compra %>%
  filter(Tipo_de_cambio_compra != "n.d.")

tc_venta <- tc_venta %>%
  filter(Tipo_de_cambio_venta != "n.d.")

indice_bvl <- indice_bvl %>%
  filter(Indice_BVL != "n.d.")


# Ahora, proceremos ha hacer la b., a pasar las variables a datos numéricos
reservas_internacionales$Reservas_internacionales <- as.numeric(reservas_internacionales$Reservas_internacionales)

tasa_interbancaria$Tasa_interbancaria <- as.numeric(tasa_interbancaria$Tasa_interbancaria)

bono_soles$Bono_soles <- as.numeric(bono_soles$Bono_soles)

bono_dolares$Bono_dólares <- as.numeric(bono_dolares$Bono_dólares)

tc_compra$Tipo_de_cambio_compra <- as.numeric(tc_compra$Tipo_de_cambio_compra)

tc_venta$Tipo_de_cambio_venta <- as.numeric(tc_venta$Tipo_de_cambio_venta)

indice_bvl$Indice_BVL <- as.numeric(indice_bvl$Indice_BVL)

# d. Redondear a dos decimales

reservas_internacionales$Reservas_internacionales <- round(reservas_internacionales$Reservas_internacionales, 2)

tasa_interbancaria$Tasa_interbancaria <- round(tasa_interbancaria$Tasa_interbancaria, 2)

bono_soles$Bono_soles <- round(bono_soles$Bono_soles, 2)

bono_dolares$Bono_dólares <- round(bono_dolares$Bono_dólares, 2)

tc_compra$Tipo_de_cambio_compra <- round(tc_compra$Tipo_de_cambio_compra, 2)

tc_venta$Tipo_de_cambio_venta <- round(tc_venta$Tipo_de_cambio_venta, 2)

indice_bvl$Indice_BVL <- round(indice_bvl$Indice_BVL, 2)

# f. 
merge_tc <- merge(tc_compra, tc_venta, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE )
merge_tc <- dplyr::mutate(merge_tc, tc_promedio = (Tipo_de_cambio_compra+Tipo_de_cambio_venta)/2)

#3
# a. Hemos hecho el merge en base también al año, mes y dia porque, si era solo con respecto 
# a la fecha, se duplicaban esas tres variables.
merge1 <- merge(reservas_internacionales, tasa_interbancaria, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE)
merge2 <- merge(merge1, bono_soles, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE)
merge3 <- merge(merge2, bono_dolares, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE)
merge4 <- merge(merge3, tc_compra, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE)
merge5 <- merge(merge4, tc_venta, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE)
merge6 <- merge(merge5, indice_bvl, by = c("Fechas", "Año", "Mes", "Dia"), all = TRUE)


# Calculamos las estadísticas descriptivas por mes para cada serie
summary_stats <- merge6 %>%
  group_by(Año, Mes) %>%
  summarise(
    media = mean(Reservas_internacionales, na.rm = TRUE),
    mediana = median(Reservas_internacionales, na.rm = TRUE),
    minimo = min(Reservas_internacionales, na.rm = TRUE),
    maximo = max(Reservas_internacionales, na.rm = TRUE)
  )

# Imprimimos el resultado
print(summary_stats)

# Exportamos el resultado a un archivo Excel
write_xlsx(summary_stats, "C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/BBDD_DB_financiero.xlsx")

# Creamos un diccionario con el nombre de la variable y su descripción
diccionario <- data.frame(
  Variable = c("Reservas_internacionales", "Tasa_interbancaria", "Bono_soles", "Bono_dólares", "Tipo_de_cambio_compra", "Tipo_de_cambio_venta", "Indice_BVL"),
  Descripcion = c("Reservas internacionales", "Tasa interbancaria", "Bono a 10 años en soles", "Bono a 10 años en dólares", "Tipo de cambio - compra", "Tipo de cambio - venta", "Índice bursátil - BVL")
)

# Exportamos el diccionario a un archivo PDF
write.table(diccionario, "C:/Users/juand/Desktop/Tarea 3 (1)/Tarea 3/(1)diccionario.pdf", sep="\t", row.names=FALSE, col.names=TRUE)

# Finalmente, exportamos el archivo creado en formato Excel con el nombre “BBDD DB financiero”
write_xlsx(diccionario, "BBDD_DB_financiero.xlsx")


