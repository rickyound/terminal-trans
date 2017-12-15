# terminal-transalte

===

# 终端英汉词典

本工具是可在终端直接查询英文单词或短语的中文意思。

其中，如若为单词，还附有音标展示。

## 运行环境

运行环境为bash。

## 安装

因为脚本编写，安装如下：

1. 使用Git克隆本工程：`git clone https://github.com/rickyound/terminal-transalte.git`
2. 创建软链接：`sudo ln -s ${CLONE_PATH}/terminal-transalte/fy.sh /usr/bin/fy`

## 使用

然后可直接使用命令`fy`来使用本工具，示例如下：

查询单词可用

```bash
$ fy test

    test [test]

    试; 测验; 灰炼锅; 灰皿; 探试; 验

    ===========================
    You may also need:
    benzidine test, chemical test, crack opening displacement test (COD test), lead corrosion test, thermal aging test, methemoglobin reduction test, consistency test ...
```

查询短语可用

```bash
$ fy "benzidine test"

    benzidine test

    联苯胺试验
```

