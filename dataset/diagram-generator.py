# This program gets columns names from .csv files 
# and creates a plantuml code to generate a relational diagram
import os
import sys
import pandas as pd

# List of files
current_dir = os.getcwd()
files = os.listdir(current_dir)

# Create plantuml code
plantuml_code = "@startuml\n"
plantuml_code += "skinparam linetype ortho\n"

# Create entities
for file in files:
    if file.endswith('.csv') and not (file == 'HomeCredit_columns_description.csv'):
        plantuml_code += "entity " + file[:-4] + " {\n"
        df = pd.read_csv(file)
        for column in df.columns:
            plantuml_code += "  " + column + "\n"
        plantuml_code += "}\n"

plantuml_code += "@enduml"

# Write plantuml code to file 
with open('diagram.puml', 'w') as f:
    f.write(plantuml_code)

# Create diagram
os.system('plantuml diagram.puml')
