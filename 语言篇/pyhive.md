# pyhive

##1 Python连接hive
https://github.com/dropbox/PyHive

```
from pyhive import hive
#
host = "xxx"
## 建立连接
conn_hive = hive.Connection(host, username="xxx", database="xxx")
## 建立一个游标
cursor = conn_hive.cursor()
## 执行查询
sql = "select * from your_table limit 10"
cursor.execute(sql)
data = cursor.fetchall()
df = pd.DataFrame(data)
```

| cursor.fetchone()   |  # 获取一行数据 |
| --- | --- |
| cursor.fetchall()  |  #获取所有数据 |
| cursor.next() | 获取查询结果的下一条数据 |
| cursor.fetchmany(size=None) | 返回指定数量的查询结果 |
| cursor.description | 获取结果的meta，字段列表(包括数据类型) |
| cursor.rownumber | 返回当前的行号 |
| cursor.close() | 关闭游标 |
| cursor.fetch_logs() | 获取hive执行的日志 |
| cursor.cancel() | 取消当前执行的sql |

说明：cursor.description

* name,列名
* type_code，数据类型
* display_size，当前版本没有实现，总是NONE
* internal_size，当前版本没有实现，总是NONE
* precision，当前版本没有实现，总是NONE
* scale，当前版本没有实现，总是NONE
* null_ok，，当前版本没有实现，总是True


 
 pyhive执行sql的api有两个

- cursor.execute(sql, parameters=None)
- cursor.executemany(sql, [[]])



## 2.sqlalchemy

```
from sqlalchemy.engine import create_engine
db = create_engine('hive://hive@manage09.aibee.cn:10000/test')
pd.read_sql(sql_cmd, db)
pd.to_sql(表名, db, if_exits)

```
## 参考 
https://zhuanlan.zhihu.com/p/34276555



