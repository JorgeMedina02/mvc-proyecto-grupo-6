# Sistema de Alerta Temprana para Orientación Universitaria

**Modelización de Variables Categóricas · TSDS 2025/2026 · Grupo 6**  
**ESIC University · Pregunta D**

---

## Descripción del Proyecto

Este repositorio contiene el análisis completo de la **Pregunta D** del trabajo final de la asignatura de Modelización de Variables Categóricas del Título Superior en Data Science (TSDS) de ESIC University, curso 2025/2026.

El proyecto aborda un caso de negocio real: una startup de EdTech que desarrolla un producto SaaS para universidades, un *Sistema de Alerta Temprana*. El modelo predice qué estudiantes de grado tienen mayor probabilidad de acabar en **jornada parcial o sin empleo** en sus primeros cinco años en el mercado laboral, permitiendo al orientador universitario intervenir antes de la graduación.

El dataset utilizado es la **Encuesta de Inserción Laboral de Universitarios (EILU 2019)** del Instituto Nacional de Estadística: datos reales sobre 31,651 egresados universitarios españoles del curso 2013/2014, encuestados en 2019. No es un dataset de juguete: tiene valores faltantes enmascarados con codificación propia del INE, variables con alta cardinalidad, y decisiones metodológicas sin respuesta única correcta.

---

## Integrantes del Grupo

| Nombre | 
|---|
| Alba Buchó |
| Jorge Medina |
| Helena Molina |
| Mireia Roset |

---

## Principales Hallazgos

- El **modelo ganador** es LightGBM con hiperparámetros optimizados mediante búsqueda aleatoria (150 iteraciones × 5 folds). Alcanza un **ROC-AUC de 0.706** en el test set, con un recall del **67.5%** en la clase de alerta (1,119 de 1,658 alumnos en riesgo detectados).

- La variable más predictiva es la **titulación específica** (TITU, V de Cramér = 0.264), con un rango de variabilidad en la tasa de riesgo de 1.6% a 58.1% entre titulaciones. Le siguen en importancia el ámbito de estudio (AMBITO, V = 0.255) y la rama de conocimiento (RAMA, V = 0.205).

- **No haber trabajado durante los estudios** (HL_E3) es el segundo predictor más importante según SHAP (importancia media = 0.201), con un odds ratio de 1.64 en el modelo logístico: los alumnos que no trabajan durante la carrera tienen 1.64 veces más probabilidades de acabar en precariedad, controlando por el resto de variables.

- El nivel de **competencias digitales** (TIC) es el cuarto predictor más fuerte según SHAP y el único directamente accionable por el orientador antes de la graduación. Cada nivel adicional (básico → intermedio → avanzado) reduce el riesgo un 16% según los odds ratios del modelo base (OR = 0.84, p < 0.001).

- Existe una **brecha de género** de 8.8 puntos porcentuales en la tasa de riesgo real (30.0% mujeres vs 21.2% hombres). El análisis de equidad con el modelo ganador muestra que las mujeres son detectadas con mayor frecuencia cuando están en riesgo (FNR = 0.280 vs 0.412 en hombres), pero reciben más falsas alarmas (FPR = 0.480 vs 0.233). El ROC-AUC es 6.6 puntos inferior para mujeres (0.672 vs 0.738), lo que indica que el modelo discrimina peor dentro de ese grupo.

- El análisis de equidad por rama académica revela un **problema grave de calibración con el umbral global de 0.5**: el modelo no detecta al 89.8% de los estudiantes de Ingeniería en riesgo real (FNR = 0.898), mientras que genera falsas alarmas sobre el 88.4% de los estudiantes de Humanidades sin riesgo real (FPR = 0.884). El umbral diferenciado por rama mejora el recall global de 0.675 a 0.726 y el F1 de 0.497 a 0.502.

- El **techo teórico del problema** está en torno a AUC 0.73-0.76, estimado a partir del V de Cramér máximo disponible (0.264, que implica un 7% de varianza compartida con el target). Cualquier resultado por encima de ese rango en este dataset indica data leakage. El proceso iterativo de purga identificó y eliminó 164 variables post-graduación en cuatro rondas.

---

## Estructura del Repositorio

```
mvc-proyecto-grupo-6/
│
├── data/
│   ├── raw/                         # No incluido en el repo (ver data/README.md)
│   │   └── EILU_GRAD_2019.csv       # Dataset bruto del INE (descargar manualmente)
│   ├── processed/                   # Generado por 01_EDA.ipynb
│   │   ├── X_train.csv              # Features de entrenamiento (25,320 × 27)
│   │   ├── X_test.csv               # Features de test (6,331 × 27)
│   │   ├── y_train.csv              # Target de entrenamiento
│   │   └── y_test.csv               # Target de test
│   └── README.md                    # Instrucciones de descarga del dataset
│
├── notebooks/
│   ├── 01_EDA.ipynb                 # Fase 1: Exploración y Preprocesado
│   ├── 02_modelo_base.ipynb         # Fase 2: Regresión Logística
│   └── 03_modelos_avanzados.ipynb   # Fases 3 y 4: Modelos Avanzados, SHAP y Equidad
│
├── outputs/
│   └── figures/                     # Figuras generadas por los notebooks
│       ├── 01_distribucion_target.png
│       ├── 02_riesgo_sexo.png
│       ├── 03_riesgo_edad.png
│       ├── 04_riesgo_rama.png
│       ├── 05_riesgo_tuniv.png
│       ├── 06_riesgo_titulacion.png
│       ├── 07_idiomas_movilidad.png
│       ├── 08_practicas_tic.png
│       ├── 09_socieconomico.png
│       ├── 10_feature_engineering.png
│       ├── 11_ranking_cramer.png
│       ├── 12_fairness_genero_rama.png
│       ├── 13_confusion_matrix_lr.png
│       ├── 14_roc_pr_threshold_lr.png
│       ├── 15_forest_plot_or.png
│       ├── 16_cv_metrics_lr.png
│       ├── 17_comparativa_modelos_fe.png
│       ├── 17_comparativa_modelos.png
│       ├── 18_confusion_ganador.png
│       ├── 18_confusion_lgb_opt.png
│       ├── 19_curvas_aprendizaje.png
│       ├── 19_shap_beeswarm.png
│       ├── 20_shap_bar.png
│       ├── 20_shap_beeswarm.png
│       ├── 21_shap_bar.png
│       ├── 22_fairness_lgb.png
│       ├── 22_shap_waterfall_vp_fn.png
│       ├── 23_shap_dependence_tic_rama.png
│       ├── 24_fairness_completo.png
│       └── 25_calibracion_umbral.png
│
├── .gitignore
├── README.md                        # Este archivo
└── requirements.txt                 # Dependencias del proyecto
```

---

## Dataset

**Fuente:** Encuesta de Inserción Laboral de Universitarios (EILU 2019), Instituto Nacional de Estadística (INE)

**Licencia:** Open Database License (ODC-DBCL 1.0) — libre uso académico y comercial

**Descarga:** El CSV principal (`EILU_GRAD_2019.csv`) no se incluye en este repositorio. Ver `data/README.md` para las instrucciones de descarga y los parámetros de carga exactos.

**Dimensiones del dataset bruto:** 31,651 registros × 299 columnas

**Variable objetivo:** `JORNADA` binarizada:
- Clase 0 (sin alerta): jornada completa (JORNADA = 2) — 73.8% de los casos
- Clase 1 (alerta): jornada parcial (JORNADA = 1) + desempleados (sin valor) — 26.2%

---

## Descripción de los Notebooks

### 01_EDA.ipynb — Exploración de Datos y Preprocesado

El notebook de EDA es el más extenso y metodológicamente más crítico del proyecto. Sus contribuciones principales son:

**Decodificación de nulos enmascarados del INE.** El INE no usa `NaN` estándar para valores faltantes: emplea espacios en blanco, el código `9` para NS/NC en variables de un dígito, y `99` para variables de dos dígitos. Sin esta decodificación explícita previa al análisis, pandas reporta cero nulos en todo el dataset, un espejismo que contaminaría cualquier análisis posterior.

**Purga iterativa de data leakage en cuatro rondas.** El dataset contiene variables que describen la situación laboral, el tipo de contrato, las condiciones de empleo o las decisiones tomadas después de graduarse. Incluirlas produciría métricas artificialmente altas (AUC > 0.90) porque el modelo estaría mirando al futuro. La purga se realizó en cuatro rondas usando el ranking de V de Cramér como detector: cada vez que una variable aparecía con asociación sospechosamente alta al target, se consultaba en el diccionario del INE y se eliminaba si correspondía a información post-graduación. En total se eliminaron 164 variables, pasando de 299 columnas en el dataset bruto a 27 variables en el modelo final.

Variables eliminadas por bloque:
- Trabajo actual: prefijos `TR*`, `TRAB*`, `TRBP*`, `TRINAC*`, `TRPARA*` (31 variables)
- Historial de Seguridad Social: prefijos `DIAS*`, `ALSSM*`, `COTIZ*`, `NOTRAB*` (37 variables)
- Cursos del SEPE tras la carrera: `ANHCUR*`, `RESCUR*`, `DURCUR*`, `DENCUR*`
- Motivos de rechazo de ofertas laborales: `RECHA_M*`
- Ramas de másteres cursados tras el grado: `EST_B17_M*`
- Variables de situación en 2019: tipo de hogar, estado civil, estudios en curso, valoraciones retrospectivas de utilidad de la formación para el trabajo

**Análisis bivariante con V de Cramér.** El ranking de fuerza predictiva tras la purga sitúa a TITU (0.264), AMBITO (0.255) y RAMA (0.205) como los tres predictores más fuertes. Ninguna variable supera 0.30, lo que establece el techo teórico del problema en AUC 0.73-0.76.

**Hallazgos contraintuitivos documentados.** Las prácticas remuneradas presentan mayor tasa de alerta (29.4%) que quienes no realizaron prácticas (24.3%) — el confusor es la concentración de prácticas remuneradas en Humanidades y Ciencias Sociales, ramas de mayor riesgo. El nivel de idiomas no muestra la tendencia decreciente esperada en la tasa de riesgo. El nivel educativo familiar no es monotónico respecto al target, lo que lleva a usar One-Hot Encoding en lugar de Ordinal Encoding para ESTUDIOS_PADRE y ESTUDIOS_MADRE.

**Split estratificado 80/20.** Todo el análisis exploratorio se realiza exclusivamente sobre el train set (25,320 observaciones). El test set (6,331 observaciones) se bloquea en este momento y no se toca hasta la evaluación final del modelo ganador.

**Ingeniería de variables.** Se construyen cinco variables compuestas: CAPITAL_CULTURAL, NIVEL_IDIOMA_MAX, MOVILIDAD_INTL, PRACTICAS_CALIDAD y PERFIL_GLOBAL. El análisis univariante confirma que tienen señal débil individualmente (V de Cramér < 0.07), resultado que se documenta con honestidad. Se mantienen en el modelo para que el algoritmo evalúe si son útiles en combinaciones.

---

### 02_modelo_base.ipynb — Regresión Logística

**Pipeline de preprocesado con ColumnTransformer.** La estrategia de encoding varía por tipo de variable:

| Grupo | Variables | Técnica | Justificación |
|---|---|---|---|
| Alta cardinalidad | TITU, AMBITO | Target Encoding (sklearn 1.3+) | 101 y 32 categorías con variabilidad extrema en tasa de alerta |
| Nominales sin orden | SEXO, RAMA, T_UNIV, NACIO, DISCA, MVFUERA, EST_M1, HL_E1, HL_E3, EST_B1, EST_B2_1, EST_B2_4, MOVILIDAD_INTL | One-Hot Encoding | Sin jerarquía natural verificada |
| No monotónicas | ESTUDIOS_PADRE, ESTUDIOS_MADRE, EDAD | One-Hot Encoding | El EDA mostró que la relación con el target no es creciente |
| Ordinales verificadas | TIC, IDIOMAS, NIV_ID1 | Ordinal Encoding | Jerarquía confirmada en el análisis univariante |
| Nulo informativo | NIV_ID2 | Imputación constante 0 | NaN significa "no habla segundo idioma" |
| Numéricas continuas | CAPITAL_CULTURAL, NIVEL_IDIOMA_MAX, PRACTICAS_CALIDAD, PERFIL_GLOBAL, HL_E2 | StandardScaler | Necesario para regularización uniforme en regresión logística |

El Target Encoding se ajusta exclusivamente sobre el fold de entrenamiento en cada iteración de la validación cruzada, garantizando que no introduce leakage en la estimación del rendimiento.

**Baseline dummy.** Un clasificador que siempre predice la clase mayoritaria alcanza 73.8% de accuracy con 0% de recall en la clase de alerta, ilustrando por qué accuracy no es la métrica adecuada para este problema.

**Resultados del modelo base:**
- ROC-AUC en CV k=5: **0.693 ± 0.004**
- Recall clase alerta: **0.658**
- F1 clase alerta: **0.483**
- Gap train-test: **0.010** (sin sobreajuste)

**Interpretación con statsmodels.** Odds ratios con intervalos de confianza al 95% mediante Newton-Raphson. Resultados principales:

| Variable | OR | Interpretación |
|---|---|---|
| HL_E3_2.0 (no trabajó) | 1.64*** | Mayor factor de riesgo del modelo |
| SEXO_2.0 (mujer) | 1.23*** | Efecto de género neto, controlando por rama |
| NIV_ID1 (nivel idioma) | 1.18*** | Contraintuitivo, confusor con RAMA |
| TIC (nivel digital) | 0.84*** | Cada nivel reduce el riesgo un 16% |
| MVFUERA_2.0 (no vivió fuera) | 0.74*** | Paradoja, mismo confusor con RAMA |
| DISCA_2.0 (sin discapacidad) | 0.66** | IC amplio por tamaño pequeño del grupo |

El pseudo R² de McFadden de 0.0883 indica ajuste modesto, coherente con la señal limitada del dataset.

---

### 03_modelos_avanzados.ipynb — Modelos Avanzados, SHAP y Equidad

Este notebook cubre las Fases 3 y 4 del trabajo.

**Ingeniería de features de interacción.** Se construyen cuatro variables compuestas (RAMA_TIC, RAMA_HL_E3, SEXO_RAMA, TITU_FREQ) para verificar si los modelos de boosting mejoran al tener las interacciones explícitas. La comparativa con y sin features confirma que los algoritmos ya capturan esas interacciones internamente — ningún modelo mejora de forma consistente. Resultado legítimo documentado con evidencia.

**Comparativa de modelos.** Cuatro modelos con regularización calibrada, validación cruzada k=5:

| Modelo | ROC-AUC (CV) | F1 alerta | Recall | Gap AUC |
|---|---|---|---|---|
| Árbol de Decisión | 0.681 ± 0.008 | 0.472 | 0.624 | 0.019 |
| Random Forest | 0.697 ± 0.006 | 0.488 | 0.655 | 0.034 |
| XGBoost | 0.699 ± 0.006 | 0.487 | 0.652 | 0.049 |
| LightGBM | 0.699 ± 0.007 | 0.489 | 0.652 | 0.057 |

**Optimización exhaustiva:**
- LightGBM: 150 iteraciones × 5 folds = 750 ajustes (695 segundos). Mejor AUC: 0.7014. Gap reducido de 0.057 a 0.027.
- XGBoost: 100 iteraciones × 5 folds = 500 ajustes (158 segundos). Mejor AUC: 0.7020.

**Stacking ensemble.** LightGBM optimizado + XGBoost optimizado + Random Forest, con regresión logística como meta-learner. Out-of-fold predictions k=5 para evitar leakage entre niveles. AUC en CV: 0.7019. El empate entre modelos confirma que la señal disponible es la misma para los tres algoritmos.

**Modelo ganador.** LightGBM optimizado seleccionado por mayor F1 en el criterio de desempate. AUC test: **0.706**, recall: **67.5%** (1,119 alumnos detectados de 1,658 en riesgo real). Mejora de +0.013 AUC y +30 alumnos adicionales respecto a la logística base.

**Curvas de aprendizaje.** La curva de validación sube de 0.650 (2,500 obs.) a 0.701 (20,000 obs.) con pendiente positiva pero decreciente. El modelo no ha alcanzado completamente el techo: con el doble de datos el AUC llegaría a 0.71-0.72. El cuello de botella principal son las variables disponibles, no el volumen.

**SHAP con TreeExplainer.** Top variables por importancia media absoluta:

| Variable | Importancia SHAP |
|---|---|
| TITU | 0.299 |
| HL_E3_2.0 (no trabajó) | 0.201 |
| AMBITO | 0.178 |
| SEXO_2.0 (mujer) | 0.098 |
| T_UNIV_1.0 (pública presencial) | 0.057 |
| TIC | 0.051 |

El waterfall del falso negativo revela el punto ciego estructural: estudiantes de Ingeniería con titulación de bajo riesgo histórico cuyo perfil académico acumula suficiente señal protectora para que el modelo no los detecte aunque individualmente estén en riesgo.

**Análisis de equidad y calibración.** Ver tablas completas en la sección siguiente. El umbral diferenciado por rama (Ingeniería: 0.38, Artes: 0.56) mejora el recall de 0.675 a 0.726 sin modificar el AUC.

---

## Tabla de Resultados Completa

| Modelo | ROC-AUC (CV) | F1 alerta (CV) | Recall (CV) | Gap AUC |
|---|---|---|---|---|
| Dummy (most_frequent) | 0.500 | 0.000 | 0.000 | — |
| Regresión Logística | 0.693 ± 0.004 | 0.483 | 0.658 | 0.010 |
| Árbol de Decisión | 0.681 ± 0.008 | 0.472 | 0.624 | 0.019 |
| Random Forest | 0.697 ± 0.006 | 0.488 | 0.655 | 0.034 |
| XGBoost | 0.699 ± 0.006 | 0.487 | 0.652 | 0.049 |
| LightGBM | 0.699 ± 0.007 | 0.489 | 0.652 | 0.057 |
| LightGBM optimizado (150 iter.) | 0.701 ± 0.007 | 0.489 | 0.661 | 0.027 |
| XGBoost optimizado (100 iter.) | 0.702 ± 0.006 | — | — | — |
| Stacking (LGB + XGB + RF) | 0.702 ± 0.007 | 0.488 | 0.664 | 0.026 |
| **LightGBM optimizado (test set)** | **0.706** | **0.497** | **0.675** | — |

---

## Análisis de Equidad

### Por Género (Test Set, umbral global 0.5)

| Grupo | n | Tasa alerta real | FNR | FPR | AUC |
|---|---|---|---|---|---|
| Hombre | 2,668 | 21.2% | 0.412 | 0.233 | 0.738 |
| Mujer | 3,663 | 29.8% | 0.280 | 0.480 | 0.672 |

### Por Rama Académica (Test Set, umbral global 0.5)

| Rama | n | Tasa alerta real | FNR | FPR | AUC | Umbral óptimo |
|---|---|---|---|---|---|---|
| Ingeniería | 1,342 | 13.2% | 0.898 | 0.016 | 0.682 | 0.38 |
| Salud | 935 | 22.7% | 0.425 | 0.007 | 0.674 | 0.49 |
| Ciencias | 537 | 23.3% | 0.448 | 0.321 | 0.595 | 0.44 |
| CC. Sociales | 2,889 | 30.1% | 0.254 | 0.484 | 0.680 | 0.49 |
| Artes y Hum. | 628 | 43.8% | 0.047 | 0.884 | 0.602 | 0.56 |

El problema de calibración por rama no es un defecto algorítmico: es consecuencia directa de las diferencias de prevalencia entre ramas (43.8% en Artes vs 13.2% en Ingeniería). Con umbral diferenciado el recall global mejora de 0.675 a 0.726.

---

## Decisiones Metodológicas Clave

### Por qué el AUC no llega al 90-95%

El techo teórico del problema está en AUC 0.73-0.76, estimado a partir del V de Cramér máximo disponible (0.264, que implica un 7% de varianza compartida con el target). Las variables que permitirían superar ese techo son datos post-graduación: sueldo actual, tipo de contrato, ocupación, historial de la Seguridad Social. Estas variables fueron identificadas y eliminadas en la purga de leakage — en las primeras iteraciones del ranking, antes de la purga completa, el AUC superaba 0.90. Con las variables limpias, AUC 0.706 es el rendimiento máximo extraíble con las técnicas disponibles y es coherente con la literatura académica sobre predicción de inserción laboral con datos de encuesta (rango reportado: 0.68-0.75).

### Por qué One-Hot Encoding para ESTUDIOS_PADRE/MADRE

El EDA mostró que la relación entre el nivel educativo familiar y la tasa de alerta no es monotónica: el nivel Bachillerato presenta el mayor riesgo, no los niveles más bajos. Aplicar Ordinal Encoding asumiría que a mayor nivel educativo, menor riesgo — un supuesto que los datos refutan. La decisión se tomó sobre evidencia visual y se documenta en el notebook 01.

### Por qué LightGBM optimizado en lugar del stacking

El stacking (AUC = 0.7019) y LightGBM optimizado (AUC = 0.7014) son estadísticamente indistinguibles dado que la desviación estándar entre folds es ~0.007. En el criterio de desempate — F1 de la clase de alerta — LightGBM (0.4885) supera al stacking (0.4877). Se elige el modelo más simple entre los equivalentes.

---

## Instalación y Reproducibilidad

### Requisitos

- Python 3.10 o superior
- Ver `requirements.txt` para las dependencias exactas con versiones verificadas

### Configuración del entorno

```bash
# Clonar el repositorio
git clone https://github.com/[usuario]/mvc-proyecto-grupo-6.git
cd mvc-proyecto-grupo-6

# Crear entorno virtual
python -m venv proyecto_ml
source proyecto_ml/bin/activate          # Linux/Mac
.\proyecto_ml\Scripts\activate           # Windows

# Instalar dependencias
pip install -r requirements.txt
```

### Descarga del dataset

```bash
# Seguir las instrucciones en data/README.md
# Colocar los archivos en:
data/raw/EILU_GRAD_2019.csv
data/raw/dr_EILU_GRAD_2019.xlsx
```

### Ejecución de los notebooks

Los notebooks deben ejecutarse en orden secuencial. El notebook 01 genera los archivos de `data/processed/` que usan los notebooks 02 y 03. Los archivos procesados ya están incluidos en el repositorio, por lo que los notebooks 02 y 03 pueden ejecutarse directamente sin reejecutar el EDA.

```bash
jupyter notebook notebooks/01_EDA.ipynb
jupyter notebook notebooks/02_modelo_base.ipynb
jupyter notebook notebooks/03_modelos_avanzados.ipynb
```

**Tiempos de ejecución aproximados:**

| Notebook | Tiempo estimado | Proceso más lento |
|---|---|---|
| 01_EDA.ipynb | 3-5 min | Cálculo del ranking de V de Cramér |
| 02_modelo_base.ipynb | 4-6 min | Ajuste de statsmodels con Newton-Raphson |
| 03_modelos_avanzados.ipynb | 30-45 min | Búsqueda aleatoria LightGBM (695s) + stacking + SHAP |

---

## Tecnologías Utilizadas

| Categoría | Librería | Versión |
|---|---|---|
| Manipulación de datos | pandas | 2.2.3 |
| Computación numérica | numpy | 2.1.3 |
| Visualización | matplotlib | 3.10.0 |
| Visualización | seaborn | — |
| Machine Learning | scikit-learn | 1.6.1 |
| Gradient Boosting | lightgbm | 4.6.0 |
| Gradient Boosting | xgboost | 3.2.0 |
| Interpretabilidad | shap | 0.51.0 |
| Inferencia estadística | statsmodels | 0.14.4 |

---

## Variables del Modelo (27 predictores)

| Variable | Descripción | Encoding |
|---|---|---|
| SEXO | Sexo del egresado | OHE |
| EDAD | Tramo de edad | OHE |
| NACIO | Nacionalidad | OHE |
| DISCA | Discapacidad ≥33% | OHE |
| TITU | Código de titulación (101 cat.) | Target Encoding |
| RAMA | Rama de conocimiento | OHE |
| AMBITO | Ámbito de estudio (32 cat.) | Target Encoding |
| T_UNIV | Tipo de universidad | OHE |
| ESTUDIOS_PADRE | Nivel educativo del padre | OHE (no ordinal) |
| ESTUDIOS_MADRE | Nivel educativo de la madre | OHE (no ordinal) |
| IDIOMAS | Número de idiomas extranjeros | Ordinal |
| NIV_ID1 | Nivel del primer idioma | Ordinal |
| NIV_ID2 | Nivel del segundo idioma | Constante 0 (NA informativo) |
| MVFUERA | Ha vivido en el extranjero | OHE |
| EST_M1 | Movilidad estudiantil (Erasmus) | OHE |
| HL_E1 | Tipo de prácticas universitarias | OHE |
| HL_E2 | Meses de prácticas | StandardScaler |
| HL_E3 | Trabajó durante los estudios | OHE |
| EST_B1 | Disfrutó de beca general | OHE |
| EST_B2_1 | Tipo de beca 1 | OHE |
| EST_B2_4 | Tipo de beca 4 | OHE |
| TIC | Nivel de competencias digitales | Ordinal |
| CAPITAL_CULTURAL | Promedio nivel educativo familiar | StandardScaler |
| NIVEL_IDIOMA_MAX | Nivel máximo de idioma | StandardScaler |
| MOVILIDAD_INTL | Experiencia internacional (binaria) | StandardScaler |
| PRACTICAS_CALIDAD | Score calidad prácticas (0-3) | StandardScaler |
| PERFIL_GLOBAL | Score internacional agregado (0-10) | StandardScaler |

---

## Limitaciones del Análisis

**Datos históricos de 2019.** El modelo aprende de egresados del curso 2013/2014 encuestados cinco años después. Las condiciones del mercado laboral han cambiado desde entonces — la pandemia de 2020 y la posterior recuperación alteraron sustancialmente los patrones de inserción en varias ramas.

**Variables no disponibles.** El rendimiento académico durante la carrera (nota media, ritmo de superación de créditos), la localización geográfica de búsqueda de empleo, y las condiciones del mercado laboral local son factores relevantes para la inserción que no están en la encuesta EILU y que elevarían el techo teórico del modelo.

**Calibración por rama.** Con el umbral global de 0.5, el modelo tiene comportamiento muy dispar entre ramas. El umbral diferenciado mejora la equidad operativa pero requiere una decisión de política sobre la capacidad del servicio de orientación.

**Correlación vs. causalidad.** El modelo identifica asociaciones estadísticas, no relaciones causales. Que los alumnos que no trabajan durante los estudios tengan mayor riesgo (OR = 1.64) no implica necesariamente que trabajar durante la carrera cause menor riesgo — puede haber variables confusoras no observadas.