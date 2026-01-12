
# Visualización 4 - De novo vs Germline — impacto clínico con colores semánticos


library(readxl)
library(dplyr)
library(ggplot2)
library(scales)

# Leer Excel: 
# df <- read_excel("C:/Users/iizas/OneDrive/Escritorio/Master Ciencia de datos/Visualizacion de datos/PR1/PR1_dataset.xlsx")
df <- read_excel("PR1_dataset.xlsx") # path relativo al excel

# Variables relevantes
df$Origin <- df$`VariantOnGenome/Genetic_origin`
df$Clinical <- df$`VariantOnGenome/ClinicalClassification`

# Filtramos por datos validos 
df_plot <- df %>%
  filter(Origin %in% c("De novo", "Germline")) %>%
  filter(!is.na(Clinical)) #Limpiar los NA valores

# Agrupamos por impacto clínico:
df_plot <- df_plot %>%
  mutate(
    Clinical_group = case_when(
      Clinical %in% c("pathogenic", "likely pathogenic") ~ "Patogénica",
      Clinical %in% c("benign", "likely benign") ~ "Benigna",
      TRUE ~ "Incierta"
    )
  )

# Conteo y proporciones
prop_df <- df_plot %>%
  group_by(Origin, Clinical_group) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(Origin) %>%
  mutate(prop = n / sum(n))

# Barplot
ggplot(prop_df, aes(x = Origin, y = prop, fill = Clinical_group)) +
  geom_col() +
  geom_text(
    aes(label = paste0("n=", n)),
    position = position_stack(vjust = 0.5),
    size = 3
  ) +
  scale_fill_manual(
    values = c(
      "Benigna" = "#2ca25f",   # verde
      "Incierta" = "grey70",   # gris
      "Patogénica" = "#f28e2b" # naranja
    ),
    name = "Clasificación clínica"
  ) +
  scale_y_continuous(labels = percent_format()) +
  labs(
    x = "Origen genético de la variante",
    y = "Proporción dentro de cada grupo",
    title = "Relación entre origen genético e impacto clínico de variantes en COL1A2"
  ) +
  theme_minimal()


# Ver la relación entre variantes, valor p (Test Chi-cuadrado)

# Tabla de contingencia
table_test <- table(df_plot$Origin, df_plot$Clinical_group)

table_test

# Test chi-cuadrado
chisq.test(table_test)


