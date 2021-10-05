import pandas as pd
import orchest

data_source = orchest.get_step_param("data_source")
data = pd.read_excel(data_source)

output_name = orchest.get_step_param("output_name")
orchest.transfer.output_to_disk(data, output_name)