在图片中嵌入信息
选用matlab进行LSB嵌入，载体是Gustav II Adolf.bmp灰度图像。基本思想是将要嵌入的信息和载体图片转化为二进制串和矩阵，通过定义随机选取函数通过种子选取载体中要隐藏的像素点，将像素点二进制最低位修改为所要嵌入的信息的二进制位。提取时通过相同的种子获取隐藏信息的像素点位置，将这些像素点最低位提取出来再重新编码，就可以提取出嵌入信息。详细的代码请见LSB.m文件。
使用python将图片水印嵌入到载体中，水印为mark.png，载体为ori.png，嵌入的代码为：python encode.py --image ori.png --watermark mark.png --result test2.png，提取代码为：python decode.py --original ori.png --image test2.png --result mark_result.png。嵌入结果为test2.png，提取结果为mark_result.png。
使用python的LSB嵌入信息到载体中，载体为luxun.jpg，嵌入结果为test3.png。嵌入的代码为：LSBSteg.py encode -i luxun.jpg -o test3.png -f test.txt；提取代码为：LSBSteg.py decode -i test3.png -o result.txt。
