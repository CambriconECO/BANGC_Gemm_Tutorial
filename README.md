# 矩阵乘gemm_demo使用

#### 1、介绍

此demo是使用BANGC重新实现了矩阵乘算子。在其中使用了不同的方法逐次优化程序，可作为BANGC的入门教程。

教程链接：https://developer.cambricon.com/index/curriculum/expdetails/id/8/classid/8.html

#### 2、编译

```shell
bash build.sh
```

#### 3、运行

```shell
bash run.sh
```

#### 4、运行结果部分截图

关键参数说明

time consume: 硬件执行时间

abs diff rate: MLU与CPU计算结果误差

![Image text](https://raw.githubusercontent.com/CambriconECO/BANGC_Gemm_Tutorial/master/gemm_result.png)
