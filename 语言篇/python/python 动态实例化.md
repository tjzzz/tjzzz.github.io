# Python动态实例化：如何动态导入模块中类的字符串名称



https://cloud.tencent.com/developer/ask/41307




```
module = __import__(module_name)
class_ = getattr(module, class_name)
instance = class_()

```

