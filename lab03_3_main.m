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
[h,f] = freqz(b,a,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(f/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(f/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b);
y = poly(a);
disp('��� �� ������ ��� r = 0.6:')
disp(x)
disp(y)

% ����� ���� �� ������ �������
figure()
zplane(b), title('����� ���� �� ������ ��������� ������� 2-�� �������, r = 0.6'); 

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
subplot(2, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b1);
y = poly(a1);
disp('��� �� ������ ��� r = 0.7:')
disp(x)
disp(y)

% ����� ���� �� ������ �������
figure()
zplane(b), title('����� ���� �� ������ ��������� ������� 2-�� �������, r = 0.7'); 

% r = 0.9
r = 0.9; 
b2 = [1 0 -1];                   % ��������� C� 
a2 = [1 -2*r*cos(phi) r^2];  	% ���������
n = 512;  % ������� �����, �� ��������������
figure()
[h,w] = freqz(b2,a2,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b2);
y = poly(a2);
disp('��� �� ������ ��� r = 0.9:')
disp(x)
disp(y)

% ����� ���� �� ������ �������
figure()
zplane(b), title('����� ���� �� ������ ��������� ������� 2-�� �������, r = 0.9'); 

%=== �������� #1.4 ===
% ���������� ���������� ������� ������� 
f1 = 1 
f2 = 1 

Q=fc/(f2-f1)

%=== �������� #1.5 ===
%�������� ������� ���������� �������
n = 10;
figure()
[h,t] = stepz(b, a, n, fs);
subplot(3, 1, 1), plot (t, h), title('������ ���������� �������, r = 0.6')
[h,t] = stepz(b1, a1, n, fs);
subplot(3, 1, 2), plot (t, h), title('������ ���������� �������, r = 0.7')
[h,t] = stepz(b2, a2, n, fs);
subplot(3, 1, 3), plot (t, h), title('������ ���������� �������, r = 0.9')

%=== �������� #2.1 ===
% Գ�������� ��� ��� r = 0.6
fs = 200;
ecg105 = load('ecg105.txt'); % ������ ���
ecg = ecg105;
ecgf = filter(b, a, ecg);
t = (0:length(ecg) - 1)/fs;
figure()
subplot(2, 2, 1), plot(t, ecg), title('������ ���'), grid on, xlim([1.1 2.3]),ylabel('A, ���')
subplot(2, 2, 2), plot(t, ecgf), title('Գ���������� ������ ���, r = 0.6'), grid on, xlim([1.1 2.3]),
xlabel('t, ��')
ylabel('A, ���')

%=== �������� #2.2 ===
% Գ�������� ��� ��� r = 0.7 �� r = 0.9
% r = 0.7
ecgf = filter(b1, a1, ecg);
subplot(2, 2, 3), plot(t, ecgf), title('Գ���������� ������ ���, r = 0.7'), grid on, xlim([1.1 2.3])
xlabel('t, ��')
ylabel('A, ���')
% r = 0.9
ecgf = filter(b2, a2, ecg);
subplot(2, 2, 4), plot(t, ecgf), title('Գ���������� ������ ���, r = 0.9'), grid on, xlim([1.1 2.3])
xlabel('t, ��')
ylabel('A, ���')

%=== �������� #3.1 ===
% ���������� ������������ ������������ Ͳ�-�������
fs = 200;
r =  0.8;
phi1 = 110*pi/180;
phi2 = 130*pi/180;
a1 = [1 - 2 * r * cos(phi1) r^2];  
a2 = [1 - 2 * r * cos(phi2) r^2];
a = conv(a1, a2);
b = [1 1 1]/3;
H =  filt(b, a)% ������������ �������

%=== �������� #3.2 ===
% ��� �� ��� ��������� ������������ Ͳ�-�������
n = 512;  % ������� �����, �� ��������������
figure()
[h,w] = freqz(b, a, n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('���'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('���'),
xlabel('Frequency'), ylabel('Phase')
% ���������� ���� �������
x = roots(b);
% ����� ���� �� ������ �������
figure()
zplane(x); 

%=== �������� #3.3 ===
% ��������� ��� � ��� ����������� Ͳ� � Ѳ�-�������
 figure()
[h,w] = freqz(b, a, n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 2, 1); plot(w/(2*pi)*fs,mag), grid on, title('��� Ͳ� - �������'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 2, 3), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('��� Ͳ� - �������'),
xlabel('Frequency'), ylabel('Phase')
br = [1 0.618 1];   % ����������� ���������� ������� 
ar = 1;
[h, f] = freqz(br, ar, n, fs);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 2, 2); plot(f, mag), grid on, title('��� Ѳ� - �������'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 2, 4), plot(f, unwrap(phase)), grid on, title('��� Ѳ� - �������'),
xlabel('Frequency'), ylabel('Phase'),

%=== �������� #3.4 ===
% Գ�������� ������� ���(���� ecg2x60.dat) ����������� ��������
fs = 200;
ecg2x60 = load('ecg2x60.dat'); % ������ ���
ecg = ecg2x60;
ecgf = filter(b, a, ecg);
t = (0:length(ecg) - 1)/fs;
figure()
plot(t, ecg), title('������ ���'), grid on, hold on, xlim([0.8 2.3]),ylabel('A, ���')
plot(t, ecgf), title('Գ���������� ������ ���'), hold off, grid on,  legend('������ ���', 'Գ���������� ������ ���')

%=== �������� #4.1 ===
% ��� � ��� �������� �����������
% ������������ ������� ������������ 
fs = 200;           % ������� �������������
T = 1/fs;
b = [T, T];          % ��������� ��
a = [1, -1];      % ��������� ��
n = 512;  % ������� �����, �� ��������������
figure()
[h,w] = freqz(b, a, n);
mag1 = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 2, 1); plot(w/(2*pi)*fs,mag1), grid on, title('��� ��������.'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 2, 2); plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('��� ��������.'),
xlabel('Frequency'), ylabel('Phase')
% ������������ ������� ��������.
b1 = [1, 1]*T/2;
a1 = [1 -1];
[h,w] = freqz(b1, a1, n);
mag2 = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 2, 3); plot(w/(2*pi)*fs,mag2), grid on, title('��� ����.'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 2, 4), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('��� ����.'),
xlabel('Frequency'), ylabel('Phase')
% ������������ ������� ������� (ѳ������)
b2 = [1 4 1]*T/3;
a2 = [1 0 -1];
[h,w] = freqz(b2, a2, n);
mag3 = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 2, 5); plot(w/(2*pi)*fs,mag3), grid on, title('��� �����.'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 2, 6), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('��� �����.'),
xlabel('Frequency'), ylabel('Phase')

%=== �������� #4.2 ===
% ���������� ���� �� ������ �����������
x = roots(b);
y = roots(b1);
z = roots(b2);
% ����� ���� �� ������ �������

% ����� ���� �� ������ �������
figure()
zplane(x); 

% ����� ���� �� ������ �������
figure()
zplane(y);

% ����� ���� �� ������ �������
figure()
zplane(z);

%=== �������� #4.3 ===
% ���������� ��������� ������� ���
mag0 = 1./(2*pi*f);
figure()
loglog(f, mag0, f, mag1), title('��� ���������� ����������� �� ��������� (����� ������������)');% ��� ���������� �����������
 
err = (mag1 - mag0)*100;
figure()
plot(f, err), title('���. ��� ��� (����� ������������)');
loglog(f, mag0, f, mag2), title('��� ���������� ����������� �� ��������� (����� ��������)');
err2 = (mag2 - mag0)*100;
figure()
plot(f, err2), title('���. ��� ��� (����� ��������)');
loglog(f, mag0, f, mag3), title('��� ���������� ����������� �� ��������� (����� �������)');
err3 = (mag3 - mag0)*100; 
figure()
plot(f, err3), title('���. ��� ��� (����� �������)');

%=== �������� #4.4 ===
% ������������ ������� ��� (���� ecg105.txt) ������������� 
ecg = ecg105;


% ���������� �� ������� ������������
ecgf1 = filter(b, a, ecg);
t = (0:length(ecgf1) - 1)/fs;
figure()
plot(t, ecg), title('����� ������������'), grid on, xlim([1.1 2.3]),ylabel('A, ���'), hold on,
plot(t, ecgf1), xlim([1.1 2.3]), hold off,
legend('������ ���', 'Գ���������� ������ ��� ')


% ���������� �� ������� ��������
ecgf2 = filter(b1, a1, ecg);
figure()
plot(t, ecg), title('����� ��������'), grid on, xlim([1.1 2.3]),ylabel('A, ���'), hold on,
plot(t, ecgf2), xlim([1.1 2.3]), hold off,
legend('������ ���', 'Գ���������� ������ ��� ')

% ���������� �� ������� ������� (ѳ������)
ecgf3 = filter(b2, a2, ecg);
figure()
plot(t, ecg), title('����� �������'), grid on, xlim([1.1 2.3]),ylabel('A, ���'), hold on,
plot(t, ecgf3), xlim([1.1 2.3]), hold off,
legend('������ ���', 'Գ���������� ������ ��� ')

% ������� ���������� ������������
...


