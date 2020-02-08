Pattern_Recognition
=======================================
Gender Classification based on Pattern Recognition. 
---------------------------------------
模式识别（区分男女/性别）
---------------------------------------

Author: Amoiensis

Email: Amoiensis@outlook.com

Data:2020.02.08
***************************************************************
更多资料和信息：

https://github.com/Amoiensis/Pattern_Recognition
***************************************************************

[CONTENT](https://github.com/Amoiensis/Pattern_Recognition)
---------------------------------------
0. [Thresholds---](https://github.com/Amoiensis/Pattern_Recognition/tree/master/Thresholds_Classification)   基于阈值判别

1. [Bayes--------](https://github.com/Amoiensis/Pattern_Recognition/tree/master/Bayes)   贝叶斯判别

2. [Naive_Bayes--](https://github.com/Amoiensis/Pattern_Recognition/tree/master/Naive_Bayes)   朴素贝叶斯判别

3. [Fisher-------](https://github.com/Amoiensis/Pattern_Recognition/tree/master/Fisher)   	Fisher判别法

4. [SVM----------](https://github.com/Amoiensis/Pattern_Recognition/tree/master/SVM)   SVM(支撑向量机)

5. [SVM_QP-------](https://github.com/Amoiensis/Pattern_Recognition/tree/master/SVM_Quadratic_Programming)   基于二次规划的SVM

6. [MLP----------](https://github.com/Amoiensis/Pattern_Recognition/tree/master/MLP)   多层感知器


[Result](https://github.com/Amoiensis/Pattern_Recognition/blob/master/_%E6%A8%A1%E5%BC%8F%E8%AF%86%E5%88%AB_%E6%8A%A5%E5%91%8A.pdf)
---------------------------------------
####（正确率）

| 训练样本数 | 特征数 |   Bayes  |    FLD   | Linear SVM |    MLP   |
|:----------:|:------:|:--------:|:--------:|:----------:|:--------:|
|    10x10   |   10   | 0.112205 | 0.145669 |  0.104331  | 0.122047 |
|            |    2   | 0.094488 | 0.125984 |  0.098425  | 0.104331 |
|  Dataset3  |   10   |  0.09252 | 0.112205 |  0.090551  | 0.094488 |
|            |    2   | 0.094488 | 0.094488 |  0.104331  | 0.090551 |


[Example_SVM](https://github.com/Amoiensis/Pattern_Recognition/blob/master/_%E6%A8%A1%E5%BC%8F%E8%AF%86%E5%88%AB_%E6%8A%A5%E5%91%8A.pdf)
---------------------------------------
### SVM 不同核函数分类情况
<center>
    <img src="https://github.com/Amoiensis/Pattern_Recognition/blob/master/_picture/svm_kernel.png" width="600"/>
</center>

### SVM 分类平面
<center>
	<img src="https://github.com/Amoiensis/Pattern_Recognition/blob/master/_picture/svm_d2.png" width="500"/>    
    <img src="https://github.com/Amoiensis/Pattern_Recognition/blob/master/_picture/svm_d3.png" width="500"/>
</figure>

### SVM原理与证明
<center>
    <img src="https://github.com/Amoiensis/Pattern_Recognition/blob/master/_picture/SVM_%E5%8E%9F%E7%90%86%E4%B8%8E%E8%AF%81%E6%98%8E1.jpg">
    <img src="https://github.com/Amoiensis/Pattern_Recognition/blob/master/_picture/SVM_%E5%8E%9F%E7%90%86%E4%B8%8E%E8%AF%81%E6%98%8E2.jpg">
</center>
