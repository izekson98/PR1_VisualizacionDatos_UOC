# PR1_VisualizacionDatos_UOC
Repositorio del código para realizar los gráficos utilizados en la PR1 de la asignatura M2.859 - Visualización de datos - Universidad Oberta de Catalunya (UOC)

## PR1: Visualización de Datos - Análisis del Gen COL1A2
Este repositorio contiene **el código en R** utilizado para la generación de los 4 gráficos de la Práctica 1 (PR1) de la asignatura Visualización de Datos. El objetivo del proyecto es analizar y visualizar **variantes genéticas del gen COL1A2** para extraer información relevante sobre su impacto clínico y distribución genómica.

## Descripción del Proyecto
El análisis se centra en el estudio de variantes genéticas que afectan al tejido conectivo. Los gráficos desarrollados buscan responder a preguntas críticas para la investigación clínica de enfermedades raras como la Osteogénesis Imperfecta o el síndrome de Ehlers-Danlos.

## Preguntas de Investigación: 

A través de las visualizaciones, se pretende dar respuesta a:

1. ¿Existe alguna región genómica más afectada que otras dentro del gen COL1A2? - _Visualización 1_

2. ¿Hay relación entre la posición de la variante y su clasificación clínica (patogénica, benigna, etc.)? - _Visualización 2_

3. ¿Existen patrones entre el tipo de variante (sustitución, inserción, deleción) y su impacto clínico? - _Visualización 3_

4. ¿Las variantes de novo son más propensas a ser patogénicas que las variantes germinales? - _Visualización 4_

## Datos Utilizados
El dataset original proviene de la **base de datos LOVD (Leiden Open Variation Database)** para el gen COL1A2.Link en: [https://databases.lovd.nl/shared/genes/COL1A2]

Estado de los datos: Creado en 2008 y actualizado en 2025 (Vigente).

Acceso al Dataset: https://docs.google.com/spreadsheets/d/1Lz_fF3PfN2oFlD7NQ8u31OlE_RHbeKSz/edit?usp=sharing&ouid=113807962419584433479&rtpof=true&sd=true (Disponible en la segunda página del archivo).

_**Nota técnica:**_ Aunque no se ha enriquecido el dataset con información externa, sí se ha realizado una transformación del formato original: el dataset se descarga en formato TXT desde la web https://databases.lovd.nl/shared/genes/COL1A2 y se ha convertido a CSV para su análisis. Además, se ha seleccionado una parte específica de la base de datos, relevante para el estudio posterior. Esta información se ha podido identificar mediante los símbolos ## y la descripción asociada en el archivo original.
Posteriormente se han eliminado los caracteres especiales de los nombres de las columnas en el Excel para garantizar una correcta lectura y procesamiento en el entorno R. 

## Contenido del Repositorio
El repositorio incluye 4 scripts independientes en R, cada uno dedicado a una visualización específica:

- Script 1: 

- Script 2: 

- Script 3:

- Script 4:

## Requisitos e Instalación
Para replicar estos gráficos, asegúrate de tener instalado R y disponer de las siguientes librerías:
- library(readxl)
- library(dplyr)
- library(ggplot2)
- library(scales)


