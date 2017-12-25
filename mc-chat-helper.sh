#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2014 Star Brilliant <m13253@hotmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e
which zenity &>/dev/null || (echo '错误：zenity 程序未安装。' >&2; exit 2)
which xdotool &>/dev/null || (echo '错误：xdotool 程序未安装。' >&2; zenity --error --text '错误：xdotool 程序未安装' --title 'Minecraft 中文聊天辅助工具'; exit 2)
_mcchat_input="$(zenity --entry --text '保持 Minecraft 处于暂停界面并在此输入聊天内容：' --title 'Minecraft 中文聊天辅助工具')"
test -z "$_mcchat_input" && exit 0

WIN_NAME='Minecraft 1.12.2'

WIN=$(xdotool search --name "$WIN_NAME")
xdotool windowfocus $WIN
xdotool key Escape
sleep 0.1
xdotool key t
sleep 0.1
#xdotool key --clearmodifiers Escape
#sleep 0.5 && xdotools key Control+space 
xdotool type --delay 150 "$_mcchat_input"
sleep 0.1
xdotool key Return
