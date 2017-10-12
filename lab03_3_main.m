function lab03_3_main
%=== ���������:������ ������� ��������� ���������� ===
%--- ����������� ������ #3 Բ�����ֲ� ��������˲� Բ������� � Ͳ�
%
% �������������� ����� �����: 
%   ecg105.txt - ������ ���
%   ecg2x60.dat - ������ ��� � ��������� ���������� �������� 60 ��
%
%----------------------------------------------------------

clear, clc, close all
disp('����������� ������ #3')
disp('Բ�����ֲ� ��������˲� Բ������� � Ͳ�')
disp('�������:����� ³����, ����� ��-462, ����')

%=== �������� #1.1 ===
% ������������ ��������� ������� 2-�� ������� 
fs =  200;
fc =  20;                           % ���������� �������
phi = 2*pi*fc/fs;
r = 0.6;
b = [1 0 -1];                     % ��������� C� 
a = [1 -2*r*cos(phi) r^2];          % ���������

%=== �������� #1.2 ===
% ��� �� ��� ��������� ������� 2-�� �������
n = 512;  % ������� �����, �� ��������������
figure()
[h,w] = freqz(b,a,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b);
% ����� ���� �� ������ �������
subplot(3, 1, 3), zplane(x)

%=== �������� #1.3 ===
% r = 0.7
r = 0.7;
b1 = [1 0 -1];                   % ��������� C� 
a1 = [1 -2*r*cos(phi) r^2];  	% ���������
n = 512;  % ������� �����, �� ��������������
figure()
[h,w] = freqz(b1,a1,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b);
% ����� ���� �� ������ �������
subplot(3, 1, 3), zplane(x)

% r = 0.9
r = 0.9; 
b2 = [1 0 -1];                   % ��������� C� 
a2 = [1 -2*r*cos(phi) r^2];  	% ���������
n = 512;  % ������� �����, �� ��������������
figure()
[h,w] = freqz(b2,a2,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b);
% ����� ���� �� ������ �������
subplot(3, 1, 3), zplane(x)

%=== �������� #1.4 ===
% ���������� ���������� ������� ������� 

%=== �������� #1.5 ===
%�������� ������� ���������� �������
n = 1;
...

