import pandas as pd
import numpy as np
data = { 

    'Empleado': ['Carlos', 'Marta', 'Luis'], 

    'Salario': [2500, 3000, 2800] 

} 

empleados_df = pd.DataFrame(data) 
print(empleados_df)

media_salario = empleados_df['Salario'].mean() 

print(f"Salario medio: {media_salario}") 

#Ejercicio 2: Filtrar empleados con salario mayor a 2700. 

filtro = empleados_df[empleados_df['Salario'] > 2700] 
#Ejercicio 3: Filtrar empleados con salario menor a 2700
filtro2 = empleados_df[empleados_df['Salario'] < 2700] 

print(filtro) 
print(filtro2)