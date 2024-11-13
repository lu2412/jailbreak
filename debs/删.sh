#!/bin/bash

# 遍历当前文件夹中所有 .deb 文件
for file in *.deb; do
    # 检查文件是否存在
    if [[ -f "$file" ]]; then
        # 提取 Author 字段信息
        author=$(dpkg-deb -f "$file" Author)
        
        # 检查 Author 是否为 "Netskao"
        if [[ "$author" != "Netskao" ]]; then
            echo "Deleting $file (Author: $author)"
            rm "$file" # 删除 Author 不是 "Netskao" 的文件
        fi
    fi
done