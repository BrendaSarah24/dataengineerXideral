#Nota es 
import pandas as pd
data = [10, 20, 30, 40]
serie = pd.Series(data, index=['A', 'B', 'C', 'D'])
serie2=data[::-1]
print(serie2)
invertirserie=pd.Series(serie2,index=['A', 'B', 'C', 'D'])
print(invertirserie)