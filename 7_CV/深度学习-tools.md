# 工具篇

>工欲善其事必先利其器

主流的深度学习框架有


| tool | 公司 | 特性 |
| --- | --- | --- |
| tensorflow | google |  |
| pytorch | facebook |  |
| keras |  |  |
| caffe | 伯克利 |  |
| paddlepaddle | 百度 |  |
| mxnet |  |  |

Keras 是基于tensorflow或者Theano(已不维护)封装的高阶接口，tensorflow2.0中现在已经包含Keras

## 1. Tensorflow
**TF-Slim、TFLearn、Keras和TensorLayer**

TF-Slim、TFLearn、Keras和TensorLayer都是尝试简化TensorFlow/Theano的工具，是对TensorFlow/Theano的高层封装，API实现更加的工程化

tensorflow2.0 已经将这些合并整理了，官方推荐的是keras的api

https://tensorflow.google.cn/tutorials/images/transfer_learning


https://github.com/balancap/SSD-Tensorflow

## 2. tensorhub
官方地址 https://hub.tensorflow.google.cn/ 类似于dockerhub，汇集了各种分享的模型，可供下载使用。
主要包括 tezt embeddings, image classification models and more

安装
```
pip install --upgrade tensorflow-hub
```

比如图像分类相关的 https://hub.tensorflow.google.cn/google/collections/image/1
google后来提取的 EfficientNet, 调整模型的深度，宽度等参数。https://hub.tensorflow.google.cn/google/collections/efficientnet/1


1.对新样本predict

```python
classifier_url ="https://tfhub.dev/google/tf2-preview/mobilenet_v2/classification/2" #@param {type:"string"}

IMAGE_SHAPE = (224, 224)
classifier = tf.keras.Sequential([
    hub.KerasLayer(classifier_url, input_shape=IMAGE_SHAPE+(3,))
])

# 新样本
grace_hopper = tf.keras.utils.get_file('image.jpg','https://storage.googleapis.com/download.tensorflow.org/example_images/grace_hopper.jpg')
grace_hopper = Image.open(grace_hopper).resize(IMAGE_SHAPE)
grace_hopper = np.array(grace_hopper)/255.0

result = classifier.predict(grace_hopper[np.newaxis, ...])
result.shape
```

2.simple迁移学习

```python
image_generator = tf.keras.preprocessing.image.ImageDataGenerator(rescale=1/255)
image_data = image_generator.flow_from_directory(str(data_root), target_size=IMAGE_SHAPE)

## 下载不包含top classification layer的model
feature_extractor_url = "https://tfhub.dev/google/tf2-preview/mobilenet_v2/feature_vector/2" #@param {type:"string"}

feature_extractor_layer = hub.KerasLayer(feature_extractor_url,
                                        trainable= False,
                                        input_shape=(224,224,3))
                                         
model = tf.keras.Sequential([
  feature_extractor_layer,
  layers.Dense(image_data.num_classes)
])

model.summary()
# 剩下的和正常的模型训练过程一样
```


其command line 工具 https://github.com/tensorflow/hub/tree/master/tensorflow_hub/tools/make_image_classifier

```python
make_image_classifier \
  --image_dir my_image_dir \
  --tfhub_module https://tfhub.dev/google/tf2-preview/mobilenet_v2/feature_vector/4 \
  --image_size 224 \
  --saved_model_dir my_dir/new_model \
  --labels_output_file class_labels.txt \
  --tflite_output_file new_mobile_model.tflite
```



