import pandas as pd
import numpy as np


df = pd.read_csv('ventas2.csv')
ventas_por_ciudad = df.groupby('Ciudad')['Ventas'].sum() 
print(ventas_por_ciudad)

