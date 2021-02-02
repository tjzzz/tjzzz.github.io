# superset


https://superset.apache.org/docs/installation/installing-superset-from-scratch


安装

```
pip install apache-superset
## 初始化数据库
superset db upgrade

## Finish installing by running through the following commands:

# Create an admin user (you will be prompted to set a username, first and last name before setting a password)
$ export FLASK_APP=superset
superset fab create-admin

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

# To start a development web server on port 8088, use -p to bind to another port
superset run -p 8088 --with-threads --reload --debugger
```


配置：
默认的配置在 /xxxx/python3.6/site-packages/superset/config.py中，也可以自己建立一个`superset_config.py`的文件，然后将其路径添加到PYTHONPATH中。
比如要修改 ENABLE_SCHEDULED_EMAIL_REPORTS = True
修改配置后 `superset init`


设置例行化查询 https://superset.apache.org/docs/installation/email-reports



导入导出数据
https://superset.apache.org/docs/miscellaneous/importing-exporting-datasources

在官方文档上有对API的说明，其http://127.0.0.1:8088/swagger/v1 可以进行交互式模拟


### log记录

获取所有的chart

```
http://127.0.0.1:8088/api/v1/chart
```
获取某个chart的信息

```
http://127.0.0.1:8088/api/v1/chart/53
```

复制创建一个图trends2

{
  "cache_timeout": 0,
  "datasource_id": 3,
  "datasource_name": "birth_names",
  "datasource_type": "table",
  "description": "string",
  "params": "{\n  \"adhoc_filters\": [],\n  \"annotation_layers\": [],\n  \"bottom_margin\": \"auto\",\n  \"color_scheme\": \"supersetColors\",\n  \"comparison_type\": \"values\",\n  \"datasource\": \"3__table\",\n  \"granularity_sqla\": \"ds\",\n  \"groupby\": [\n    \"name\"\n  ],\n  \"label_colors\": {},\n  \"left_margin\": \"auto\",\n  \"limit\": \"25\",\n  \"line_interpolation\": \"linear\",\n  \"metrics\": [\n    {\n      \"aggregate\": \"SUM\",\n      \"column\": {\n        \"column_name\": \"num\",\n        \"type\": \"BIGINT\"\n      },\n      \"expressionType\": \"SIMPLE\",\n      \"label\": \"Births\",\n      \"optionName\": \"metric_11\"\n    }\n  ],\n  \"order_desc\": true,\n  \"queryFields\": {\n    \"groupby\": \"groupby\",\n    \"metrics\": \"metrics\"\n  },\n  \"rich_tooltip\": true,\n  \"rolling_type\": \"None\",\n  \"row_limit\": 50000,\n  \"show_brush\": \"auto\",\n  \"show_legend\": true,\n  \"time_grain_sqla\": \"P1D\",\n  \"time_range\": \"100 years ago : now\",\n  \"time_range_endpoints\": [\n    \"unknown\",\n    \"inclusive\"\n  ],\n  \"url_params\": {},\n  \"viz_type\": \"line\",\n  \"x_axis_format\": \"smart_date\",\n  \"x_ticks_layout\": \"auto\",\n  \"y_axis_bounds\": [\n    null,\n    null\n  ],\n  \"y_axis_format\": \"SMART_NUMBER\"\n}",
"slice_name": "Trends2",
  "viz_type": "line"
}

```
curl -X POST "http://127.0.0.1:8088/api/v1/chart/" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"cache_timeout\":0,\"datasource_id\":3,\"datasource_name\":\"birth_names\",\"datasource_type\":\"table\",\"description\":\"string\",\"params\":\"{\  \\\"adhoc_filters\\\": [],\  \\\"annotation_layers\\\": [],\  \\\"bottom_margin\\\": \\\"auto\\\",\  \\\"color_scheme\\\": \\\"supersetColors\\\",\  \\\"comparison_type\\\": \\\"values\\\",\  \\\"datasource\\\": \\\"3__table\\\",\  \\\"granularity_sqla\\\": \\\"ds\\\",\  \\\"groupby\\\": [\    \\\"name\\\"\  ],\  \\\"label_colors\\\": {},\  \\\"left_margin\\\": \\\"auto\\\",\  \\\"limit\\\": \\\"25\\\",\  \\\"line_interpolation\\\": \\\"linear\\\",\  \\\"metrics\\\": [\    {\      \\\"aggregate\\\": \\\"SUM\\\",\      \\\"column\\\": {\        \\\"column_name\\\": \\\"num\\\",\        \\\"type\\\": \\\"BIGINT\\\"\      },\      \\\"expressionType\\\": \\\"SIMPLE\\\",\      \\\"label\\\": \\\"Births\\\",\      \\\"optionName\\\": \\\"metric_11\\\"\    }\  ],\  \\\"order_desc\\\": true,\  \\\"queryFields\\\": {\    \\\"groupby\\\": \\\"groupby\\\",\    \\\"metrics\\\": \\\"metrics\\\"\  },\  \\\"rich_tooltip\\\": true,\  \\\"rolling_type\\\": \\\"None\\\",\  \\\"row_limit\\\": 50000,\  \\\"show_brush\\\": \\\"auto\\\",\  \\\"show_legend\\\": true,\  \\\"time_grain_sqla\\\": \\\"P1D\\\",\  \\\"time_range\\\": \\\"100 years ago : now\\\",\  \\\"time_range_endpoints\\\": [\    \\\"unknown\\\",\    \\\"inclusive\\\"\  ],\  \\\"url_params\\\": {},\  \\\"viz_type\\\": \\\"line\\\",\  \\\"x_axis_format\\\": \\\"smart_date\\\",\  \\\"x_ticks_layout\\\": \\\"auto\\\",\  \\\"y_axis_bounds\\\": [\    null,\    null\  ],\  \\\"y_axis_format\\\": \\\"SMART_NUMBER\\\"\}\",\"slice_name\":\"Trends2\",\"viz_type\":\"line\"}"
```



将dashboard下载成图片 
```
"POST /superset/log/?explode=events&dashboard_id=2 HTTP/1.1" 200 -
```

将某个chart下载下来
```
POST /superset/explore_json/?form_data=%7B%22slice_id%22%3A53%7D&samples=true
```


curl -X POST "http://127.0.0.1:8088/superset/explore_json" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"form_data\": \"%7B%22slice_id%22%3A53%7D\"}"


cache
缓存配置 https://blog.csdn.net/tinahanfangyan/article/details/78790067
![](/media/16100985461942.jpg)


参考资料
- https://github.com/apache/superset/issues/4708
- 单独使用superset后端： https://zhuanlan.zhihu.com/p/63281429
- /api/v1/charts/1/cache_screenshot 问题： https://github.com/apache/superset/issues/11929





## tableau

https://www.tableau.com/zh-cn/developer/automation#reveal-162763