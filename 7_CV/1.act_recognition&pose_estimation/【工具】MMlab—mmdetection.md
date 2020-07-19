# 【工具】MMlab—mmdetection
本来主要是看 mmskelton的，后来发现其依赖mmdetection，于是将这几个都看了下。

### 1. mmdetection

**1 安装**
进行目标检测:
配置要求
Linux or macOS (Windows is not currently officially supported)
Python 3.6+
PyTorch 1.3+
CUDA 9.2+ (If you build PyTorch from source, CUDA 9.0 is also compatible)
GCC 5+
mmcv

<!-- more -->
安装步骤：
```
# 进入自己的conda环境
conda install pytorch torchvision -c pytorch   # 注意版本
git clone https://github.com/open-mmlab/mmdetection.git
cd mmdetection
#
pip install -r requirements/build.txt
pip install "git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI"
pip install -v -e .  # or "python setup.py develop"
```
注意：git commit id将在步骤d中写入版本号，例如0.6.0 + 2e7045c。该版本还将保存在经过训练的模型中。建议您每次从github提取一些更新时都运行步骤d。如果修改了C ++ / CUDA代码，则此步骤为强制性的。
按照上述说明，mmdetection将安装在dev模式下，对代码进行的任何本地修改都将生效，而无需重新安装它（除非您提交了一些提交并希望更新版本号）。
如果要使用opencv-python-headless而不是opencv-python，可以在安装MMCV之前先安装它。


方法二:docker

```
git clone https://github.com/open-mmlab/mmdetection.git
cd mmdetection
sudo docker build -t mmdetection docker/
```
注意:如果没有gpu，需要将Dockerfile中的 Force_cuda改为0


**2.测试demo**
```
- demo/inference_demo.ipynb
```

```python
from mmdet.apis import init_detector, inference_detector, show_result_pyplot
config_file = 'configs/faster_rcnn/faster_rcnn_r50_fpn_1x_coco.py'
checkpoint_file = 'checkpoints/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth'
## checkpoint_file = 'https://open-mmlab.s3.ap-northeast-2.amazonaws.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_1x_coco/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth'
# 这里要注意config_file 和checkpoint_file的匹配
# test a single image
img = 'demo/demo.jpg'
model = init_detector(config_file, checkpoint_file, device='cpu')
result = inference_detector(model, img)
show_result_pyplot(model, img, result)
```
解释：

1. 基本上主要分为这三步吧，init_detector， inference_detector， show_result_pyplot 可以再细看下show_result_pyplot中model的属性，怎么把结果和位置提取出来`mmdet/models/detectors/base.py`
2. 如果本机的环境不好用的话，可以在colab上测试，https://colab.research.google.com/github/open-mmlab/mmdetection/blob/master/demo/mmdet_inference_colab.ipynb#scrollTo=CSDS0SJBWa2l
3. 多数时候运行不成功，应该都是环境或者版本不匹配问题


**3.应用**
code详解
(1) demo里用的是coco的分类
mmdet.models.detectors # 是基础的各种检测方法
mmdet.models.detectors.base.show_result中可以看到三步骤中二的返回结果是怎么解析的

result格式: list[array([xmin, ymax, xmax, ymin, 置信度])]

mmdet.core.evaluation.class_names 中包含不同数据集定义的get_classes具体的类别

(2)替换自己的数据分类


