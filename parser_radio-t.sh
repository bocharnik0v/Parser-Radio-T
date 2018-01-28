#!/bin/bash

#----------------------------------[ Copyright ]----------------------------------------+
#Name: parser_radio-t                                                                   |
#Author: Bocharnikov Sergei                                                             |
#E-mail: bocharnikov@dezigner.ru                                                        |
#Source: https://github.com/bocharnik0v                                                 |
#                                                                                       |
#Files: parser_radio-t.sh                                                               |
#Build: 280118                                                                          |
#Copyright: 2018 Bocharnikov Sergei                                                     |
#--------------------------------[ License: MIT ]---------------------------------------+
#                                                                                       |
#---------------------------------------------------------------------------------------+
#       Permission is hereby granted, free of charge, to any person obtaining a copy    |
#       of this software and associated documentation files (the "Software"), to deal   |
#       in the Software without restriction, including without limitation the rights    |
#       to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       |
#       copies of the Software, and to permit persons to whom the Software is           |
#       furnished to do so, subject to the following conditions:                        |
#       The above copyright notice and this permission notice shall be included in all  |
#       copies or substantial portions of the Software.                                 |
#       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      |
#       IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        |
#       FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     |
#       AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          |
#       LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   |
#       OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   |
#       SOFTWARE.                                                                       |
#---------------------------------------------------------------------------------------+


# Парсер выходного дня.

# v0.1
# DOWNLOAD=`curl -s https://radio-t.com | grep "http://cdn.radio-t.com/" | grep -o "http[^>]*.mp3" | sed 'n;d' | sed '2,$d'`

# v0.2
# DOWNLOAD=`curl -s https://radio-t.com | grep "http://cdn.radio-t.com/" | awk -F\" '{print $2}' | head -n1`

# v0.3
DOWNLOAD=`curl -s https://radio-t.com/site-api/last/1?categories=podcast | python3 -c "import sys, json; print('\n'.join([item['audio_url'] for item in json.load(sys.stdin)]))"`

wget -c -P /mnt16/radio-t/ $DOWNLOAD

# -c докачивание в случае обрыва
# -P путь куда именно скачать

echo -e '\e[32m'"Done!"'\e[39m'

