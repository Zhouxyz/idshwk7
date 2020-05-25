key=5; %����
orig_bmp='Gustav II Adolf.bmp';
fina_bmp='test.bmp';
jpg='Gustav II Adolf.jpg';
test_txt='test.txt';
result_txt='result.txt';

%Ƕ����Ϣ����ȡ
input=imread(orig_bmp);
input_double=double(input);
f_msg=fopen(test_txt,'r');
[msg,len_total]=fread(f_msg,'ubit1');
fclose(f_msg);
[m,n]=size(input_double);%mΪ������nΪ����
if len_total>m*n
  error('Ƕ����Ϣ������������ѡ��ͼ��');
end

%����������Ϣ��Ƕ��
[row,col]=randinterval(input_double,len_total,key); %ͨ�����ӻ�ȡ���λ��
for i=1:len_total
    input_double(row(i),col(i))=input_double(row(i),col(i))-mod(input_double(row(i),col(i)),2)+msg(i,1);    
end
output=uint8(input_double);
imwrite(output,fina_bmp);

%��ȡ������Ϣ
get=imread(fina_bmp);
get_double=double(get);
%�ж�Ƕ����Ϣ���Ƿ����
[m_get,n_get]=size(get_double);
if len_total>m_get*n_get
  error('Ƕ����Ϣ������������ѡ��ͼ��');
end
%���ˮӡ�Ľ��
f_write=fopen(result_txt,'a');
for i=1 :len_total
    if bitand(get_double(row(i),col(i)),1)==1
        fwrite(f_write,1,'ubit1');
        result(i,1)=1;
    else
        fwrite(f_write,0,'ubit1');
        result(i,1)=0;
    end
end
fclose(f_write);


function [row,col]=randinterval(matrix,count,key)
%��������λ��
[m,n]=size(matrix);
interval1=floor(m*n/count)+1;
interval2=interval1-2;
if interval2==0
    error('����̫С�����ܽ�˽����Ϣ���ؽ�ȥ');
end
%�����������
rand('seed',key);
a=rand(1,count);
%��ʼ��
row=zeros([1 count]);
col=zeros([1 count]);
%����row,col
r=1;
c=1;
row(1,1)=r;
col(1,1)=c;
for i=2:count
    if a(i)>=0.5
        c=c+interval1;
    else
        c=c+interval2;
    end
    if c>n
        r=r+1;
        if r>m
            error('����̫С������˽����Ϣ���ؽ�ȥ');
        end
        c=mod(c,n);
        if c==0
            c=1;
        end
    end
    row(1,i)=r;
    col(1,i)=c;
end
end
