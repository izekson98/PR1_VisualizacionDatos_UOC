
# Visualización 1 - Rug plot de la Posicion relativa en COL1A2 + densidad + picos en rojo

library(readxl)
library(dplyr)
library(ggplot2)

# Leer Excel: 
# df <- read_excel("C:/Users/iizas/OneDrive/Escritorio/Master Ciencia de datos/Visualizacion de datos/PR1/PR1_dataset.xlsx")
df <- read_excel("PR1_dataset.xlsx") # path relativo
df$position_g_start <- as.numeric(gsub("[, ]","", df$position_g_start))

# Calculamos la posición relativa al inicio del gen
gene_start <- min(df$position_g_start)
df$pos_rel <- df$position_g_start - gene_start

# Eliminamos los outliers en 0: 
df <- df %>% filter(pos_rel != 0)

# Calcular densidad suavizada
dens <- density(df$pos_rel, from = min(df$pos_rel), to = max(df$pos_rel))
dens_df <- data.frame(x = dens$x, y = dens$y * length(df$pos_rel))  # ajustar num de variantes

# Detectar picos de densidad
dens_df$peak <- c(FALSE, (dens_df$y[-c(1,length(dens_df$y))] > 
                            dens_df$y[-c(1,2)] & 
                            dens_df$y[-c(1,length(dens_df$y))] > dens_df$y[-c(length(dens_df$y)-1,length(dens_df$y))]), FALSE)

# Graficar rug plot + densidad + picos en rojo: 
ggplot() +
  geom_rug(data = df, aes(x = pos_rel), sides = "b", color = "steelblue") +          # variantes reales
  geom_area(data = dens_df, aes(x = x, y = y), fill = "orange", alpha = 0.4) +        # relleno bajo la curva
  geom_line(data = dens_df, aes(x = x, y = y), color = "orange", size = 1) +          # Linea de densidad encima
  geom_point(data = dens_df %>% filter(peak), aes(x = x, y = y), color = "red", size = 2) + # hotspots
  scale_x_continuous(limits = c(min(df$pos_rel), max(df$pos_rel))) +              # eje X ajustado al rango real
  labs(
    x = "Posición relativa en COL1A2 (bp)",
    y = "Número aproximado de variantes",
    title = "Distribución de variantes asociadas a Ehlers-Danlos en COL1A2\nHotspots en rojo"
  ) +
  theme_minimal()


