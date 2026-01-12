
# Visualización 2 - Violin plot por clasificación clinica con puntos individuales


library(readxl)
library(dplyr)
library(ggplot2)

# Leer Excel: 
df <- read_excel("C:/Users/iizas/OneDrive/Escritorio/Master Ciencia de datos/Visualizacion de datos/PR1/PR1_dataset.xlsx")

# Convertir position_g_start a numérico
df$position_g_start <- as.numeric(gsub("[, ]","", df$position_g_start))

# Filtrar variantes con clasificación clinica y eliminar posiciones 0
df_plot <- df %>%
  filter(!is.na(`VariantOnGenome/ClinicalClassification`)) %>%
  filter(position_g_start != 0)

# Calcular posicion relativa al inicio del gen
gene_start <- min(df_plot$position_g_start, na.rm = TRUE)
df_plot$pos_rel <- df_plot$position_g_start - gene_start

# Violin plot por clasificación clinica con puntos individuales
ggplot(df_plot, aes(x = `VariantOnGenome/ClinicalClassification`, y = pos_rel, fill = `VariantOnGenome/ClinicalClassification`)) +
  geom_violin(alpha = 0.4, color = NA) +                  # violín relleno semitransparente
  geom_jitter(height = 0, width = 0.15, size = 2, alpha = 0.7, color = "black") + # puntos individuales
  labs(
    x = "Clasificación clínica",
    y = "Posición relativa en COL1A2 (bp)",
    title = "Distribución de variantes según posición y clasificación clínica"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  # Eliminamos la leyenda, se sobre entiende
