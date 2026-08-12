# DataLab

这是CSAPP的第一个实验，资料来源于 [https://csapp.cs.cmu.edu/3e/labs.html](https://csapp.cs.cmu.edu/3e/labs.html) 中的 Self-Study Handout 部分。

---

## 项目结构

```
datalab/
├── datalab-handout/          # 解压后的 datalab 文件夹，已被我改动
├── temp/                     # 用于存放进行一些验证及其他工作的临时程序的文件夹
├── datalab-handout.tar       # 从官网上下载来的源压缩包
└── README.md                 # datalab 项目指引
```

---

## 额外问题

我的 datalab 得了 **56 / 62** 分，原因是 `floatPower2` 函数的运行时间超过了 10 秒，准确时间介于 11 ~ 12 秒之间，无法通过测试脚本。但是，`floatPower2` 函数的逻辑完全正确，在命令 `./btest -f floatPower2 -T 60` 下可以得满分 **4 / 4** 分，这可能是由虚拟机CPU处理器分配较少导致的。

---

## 许可证

本项目使用 [MIT License](../../LICENSE) 开源协议。
