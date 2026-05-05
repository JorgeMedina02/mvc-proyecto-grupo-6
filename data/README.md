# Instrucciones de descarga del Dataset

Los datos brutos del INE no se incluyen en este repositorio por su tamaño y por las
condiciones de redistribución de la licencia ODC-DBCL 1.0.

## Descarga

1. Accede al portal del INE:
   https://www.ine.es/dyngs/INEbase/operacion.htm?c=Estadistica_C&cid=1254736176991&menu=resultados&idp=1254735976597#_tabs-1254736195339

2. Descarga los siguientes ficheros:
   - `EILU_GRAD_2019.csv` — dataset principal (~32.000 egresados, 299 variables, 38 MB)
   - `dr_EILU_GRAD_2019.xlsx` — diccionario de variables (imprescindible para interpretar los códigos)

3. Coloca ambos ficheros en `data/raw/`:
data/raw/EILU_GRAD_2019.csv
data/raw/dr_EILU_GRAD_2019.xlsx

## Parámetros de carga

El CSV usa separador de tabulación y encoding latin-1:

```python
pd.read_csv('data/raw/EILU_GRAD_2019.csv', sep='\t', encoding='latin-1', low_memory=False)
```

## Nota sobre los datos procesados

Los archivos en `data/processed/` (X_train.csv, X_test.csv, y_train.csv, y_test.csv)
son el resultado del notebook `01_EDA.ipynb` y sí están incluidos en el repositorio.
Permiten ejecutar los notebooks 02 y 03 sin necesidad de descargar el CSV bruto.