
# Visualización 3 - Heatmap por proporción global: tipo de variante vs impacto clínico


library(readxl)
library(dplyr)
library(ggplot2)

# Leer Excel: 
# df <- read_excel("C:/Users/iizas/OneDrive/Escritorio/Master Ciencia de datos/Visualizacion de datos/PR1/PR1_dataset.xlsx")
df <- read_excel("PR1_dataset.xlsx") #path relativo

# Leer columnas relevantes
df$type <- as.factor(df$type)
df$Clinical <- df$`VariantOnGenome/ClinicalClassification`

# Filtrar valores validos
df_plot <- df %>%
  filter(!is.na(type)) %>%
  filter(!is.na(Clinical))

# Contar combinaciones
count_df <- df_plot %>%
  group_by(type, Clinical) %>%
  summarise(n = n(), .groups = "drop")

# Calcular proporción sobre TODO el dataset
total_variants <- sum(count_df$n)

count_df <- count_df %>%
  mutate(prop_global = n / total_variants)

# Heatmap por proporción global
ggplot(count_df, aes(x = type, y = Clinical, fill = prop_global)) +
  geom_tile(color = "white") +
  scale_fill_viridis_c(name = "Proporción del total") +
  labs(
    x = "Tipo de variante",
    y = "Clasificación clínica",
    title = "Proporción global de impacto clínico según tipo de variante en COL1A2"
  ) +
  theme_minimal()


