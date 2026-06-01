# DataModels



## ¿Qué es?

`DataModels` agrupa los modelos y documentación de machine learning que soportan el análisis de datos clínicos del proyecto.

Incluye:

- modelos supervisados para clasificación y predicción
- modelos no supervisados para clustering y detección de patrones
- soporte de análisis para decisiones clínicas basadas en datos
## Tecnología utilizada

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-F7931E?style=for-the-badge&logo=scikitlearn&logoColor=white)
![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
## Estructura de carpetas

*Carpeta actual:* `DataModels/`

```
Proyecto\
│   README.md
├───DataBases\
├───DataModels\
│   │   README.md   <-- estás aquí
│   │
│   ├───Supervised_LMs\
│   │       README.md
│   │       model_supervisado.pkl
│   │       model_supervisado.h5
│   │
│   └───Unsupervised_LMs\
│           README.md
│           model_no_supervisado.pkl
│           model_no_supervisado.h5
├───Deliverables\
└───Docs\
```

- `DataModels/README.md`: documentación general del repositorio de modelos
- `Supervised_LMs/README.md`: información de modelos supervisados
- `Unsupervised_LMs/README.md`: información de modelos no supervisados

## Equipo de trabajo

| Integrante | Contacto | Rol | Observaciones | 
|---|---|---|---|
| Angel de Jesús Rufino Mendoza | [RufinoAngel](https://github.com/RufinoAngel) | Líder del proyecto y Desarrollo | ✅ Aprobado |
| Abril Guzman Barrera | [abrilgb](https://github.com/Abrilgb) | Líder de FrontEnd  | ✅ Aprobado |
| Karen Lizbeth Negrete Hernandez | [KarenNegrete06](https://github.com/karenNegrete06) | Líder de Documentación | ❌ No revisado |
| Esther Gonzalez Peralta | [Esther-Gonzalez](https://github.com/Esther-Gonzalez04) | Líder de Base de Datos  | ✅ Aprobado |


## Observaciones generales

- Mantener el control de versiones para reproducibilidad.
- Documentar los datos de entrenamiento, las variables y las métricas.
- Actualizar los modelos con los cambios en librerías y dataset clínicos.
