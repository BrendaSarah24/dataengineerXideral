import pandas as pd

input_file = "ventas.xlsx" 

output_file = "ventas2.csv"

try:
    # Leer archivo Excel
    data = pd.read_excel(input_file)

    # Convertir a CSV
    data.to_csv(output_file, index=False, encoding='utf-8')

    print(f"Archivo convertido exitosamente a {output_file}")

except Exception as e:
    print(f"Error durante la conversión: {e}")




