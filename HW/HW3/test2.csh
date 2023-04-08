#!/usr/bin/tcsh

# 宣告一個字串
set str = "101111100011110111110111111001"

# 使用 =~ 運算子尋找連續五個 1
if ($str =~ '1{5}') then
    echo "找到了連續五個 1。"
else
    echo "沒有找到連續五個 1。"
endif