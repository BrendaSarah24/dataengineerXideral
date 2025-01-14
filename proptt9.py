import pandas as pd
data = { 

    'Nombre': ['Ana', 'Juan', 'Luis','Ana','Luis','Juan'], 
    'Materia': ['Historia','Geografia','Espanol','Historia','Espanol','Fisica'],
    'Calificacion': [4,9,10,9,8,10], 
} 

df = pd.DataFrame(data) 
promedioalumnos = df.groupby('Nombre')['Calificacion'].mean() 
print(promedioalumnos)