# Python操作excel


python excel操作的可用的包比较多，常用的有pandas,openpyxl, xlsxwriter



## 1.xlsxwriter

注意： xlsxwriter 只能创建新的sheet，无法修改已经存在的
### write类
- worksheet.writte(row, col, *args) 针对单独一个单元格的写入
- 针对特定格式的写入： write_strings(), write_number(), write_datetime(),....
- worksheet.write_formula(), write_array_formula() 写入计算逻辑
- worksheet.write_row(row, col, data[, cell_format]),worksheet.write_column()
- insert_tetxtbox, insert_image(), insert_button,
- worksheet.conditional_format() 设置条件格式 

### format类
https://xlsxwriter.readthedocs.io/format.html#format

### 修改已经存在的


## 2. openpyxl
https://openpyxl.readthedocs.io/en/stable/







## 保存images 到excel

```python
import xlsxwriter

workbook = xlsxwriter.Workbook('images.xlsx')
worksheet = workbook.add_worksheet()
 
worksheet.set_column('A:A', 40)
for i in range(len(label_data)):
    if i % 100 == 0:
        print(i)
    worksheet.set_row(i+1, 150)
    pid = label_data.iloc[i]['pid_global']
    floor = label_data.iloc[i]['floor']
    pic_name = './label_case/plot/' + str(i) + '_' + pid + '_' + floor + '.jpg'
    worksheet.insert_image('A' + str(i+2), pic_name, {'x_scale': 0.5, 'y_scale': 0.5})

workbook.close()
```