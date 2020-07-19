# 【工具】MMlab—mmaction


### mmaction
MMAction is capable of dealing with all of the tasks below.

- action recognition from trimmed videos
- temporal action detection (also known as action localization) in untrimmed videos
- spatial-temporal action detection in untrimmed videos.

<!-- more -->

**modelzoo**
mmaction中自带的model默认都是用Kinetics-400 这个数据训练的。
https://github.com/open-mmlab/mmaction/blob/master/MODEL_ZOO.md

**数据格式**
https://github.com/open-mmlab/mmaction/blob/master/DATASET.md
mmaction支持两种数据格式: raw frames 和video. raw frame较快，占用空间多。video的占用空间少，相对慢一些(可以使用decord进行加速)

**代码结构**
```
|── data_tool   # 数据准备，包含不同数据集的预处理
|── data
|── tools      # train, test
|── configs   # train 构造每个模型的配置文件
|── test_configs   # test 构造每个模型的配置文件
|── modelzoo/   # model
```

数据准备

```shell
# 1. 准备数据
cd data_tools/ucf101/
bash download_annotations.sh
bash download_videos.sh   # 一共6G多，可以中间终端，只取部分

# 提取frames
# 1.rgb的处理是用的mmcv.VideoReader(), 将视频转换为帧序列，所以量会比较大，可以改下间隔
# 2.光流信息调用的dense_flow工具，需要在third_parties中提前安装好
bash extract_frames.sh   ## bash extract_grb_frames.sh

# Run the follow script to generate filelist in the format of rawframes and videos.
bash generate_filelist.sh
```

```shell
# 下载模型
wget -c https://open-mmlab.s3.ap-northeast-2.amazonaws.com/mmaction/models/ucf101/tsn_2d_rgb_bninception_seg3_f1s1_b32_g8-98160339.pth -P ./modelzoo/

bash tools/dist_test_recognizer.sh test_configs/TSN/ucf101/tsn_rgb_bninception.py modelzoo/tsn_2d_rgb_bninception_seg3_f1s1_b32_g8-98160339.pth 8
```

```shell
# 模型训练
./tools/dist_train_xxx.sh $config_file $GPU_Num
# 模型评估
python tools/test_${ARCH}.py ${CONFIG_FILE} ${CHECKPOINT_FILE} [--out ${RESULT_FILE}] 
```


test_recognizer:
* code里面最后默认输出到default.pkl中，每个二级目录都有一个长度101的向量(ucf101数据),向量的每个值就是在各个类别上的得分。最终取np.argmax()就可以认为是对应的类别了.
* 具体每个类别编号的含义可以在`data/ucf101/annotations/clasInd.txt`看到

```python
import pickle
outputs = pickle.load(open('xxx', 'rb'), encoding='utf-8')
```






采坑：
* 其中有很多CUDA, gpu的编译，设置，如果在自己电脑上的话，需要将相关的code注释掉
* 安装的mmcv，在运行mmaction tools/test_recognizer.py的时候总报错，是python版本问题，不支持f语法
* docker hub上有人提供 mlouieunm/mmaction:latest。 实验了下环境还是有问题


使用colab的GPU资源.
下载数据啥的速度是真快。。。
问题：
Q1: RuntimeError: CUDA out of memory
batch_size


mmaction docker:

（1）测试使用 `mlouieunm/mmaction:latest`
注意：这个docker环境中的mmaction并不是最新的，需要git pull下，才会更行到新版，支持其他的数据。。好像还是环境有问题，放弃
（2）docker pull apulistech/mmaction:0.1

NVIDIA-DOCKER   https://github.com/NVIDIA/nvidia-docker