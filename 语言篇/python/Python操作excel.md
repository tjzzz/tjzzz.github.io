# Python操作excel


python excel操作的可用的包比较多，常用的有pandas,openpyxl, xlsxwriter



## 1.插入图片




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