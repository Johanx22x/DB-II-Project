import pandas as pd

train_data = pd.read_csv('application_train.csv')
test_data = pd.read_csv('application_test.csv')

merged_data = pd.concat([train_data, test_data], axis=0)

merged_data.to_csv('application.csv', index=False)
