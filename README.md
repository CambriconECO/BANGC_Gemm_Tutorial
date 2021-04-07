# 矩阵乘gemm_demo使用

#### 1、介绍

此demo使用BANG语言实现了一系列简单的矩阵乘算子示例。其中使用了不同的方法分步优化程序，可作为BANG的入门教程。

本示例基于 Neuware 1.6.1 版本测试通过。

教程链接：https://developer.cambricon.com/index/curriculum/expdetails/id/8/classid/8.html

#### 2、编译

```shell
bash build.sh
```

#### 3、运行

```shell
bash run.sh
```

#### 4、部分运行结果示例

关键参数说明

time consume: 硬件执行时间

abs diff rate: MLU与CPU计算结果误差

![Image text](https://github.com/CambriconECO/BANGC_Gemm_Tutorial/blob/master/gemm_result.png)
