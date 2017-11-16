function lab03_3_main
%=== Дисципліна:Основи обробки біомедичної інформації ===
%--- Лабораторна робота #3 ФІЛЬТРАЦІЯ БІОСИГНАЛІВ ФІЛЬТРАМИ З НІХ
%
% Використовуйте файли даних: 
%   ecg105.txt - сигнал ЕКГ
%   ecg2x60.dat - сигнал ЕКГ з мережевою перешкодою частотою 60 Гц
%
%----------------------------------------------------------

clear, clc, close all
disp('Лабораторна робота #3')
disp('ФІЛЬТРАЦІЯ БІОСИГНАЛІВ ФІЛЬТРАМИ З НІХ')
disp('Виконав:Лимар Віталій, група БМ-462, ІІДС')

%=== Завдання #1.1 ===
% Синтезування смугового фільтру 2-го порядку 
fs =  200;
fc =  20;                           % центральна частота
phi = 2*pi*fc/fs;
r = 0.6;
b = [1 0 -1];                     % чисельник CФ 
a = [1 -2*r*cos(phi) r^2];          % знаменник

%=== Завдання #1.2 ===
% АЧХ та ФЧХ смугового фільтру 2-го порядку
n = 512;  % кількість точок, що розраховуються
figure()
[h,f] = freqz(b,a,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(f/(2*pi)*fs,mag), grid on, title('АЧХ'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(f/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ'),
xlabel('Frequency'), ylabel('Phase')
% Обчислення нулів фільтру
x = roots(b);
y = poly(a);
disp('Нулі та полюси при r = 0.6:')
disp(x)
disp(y)

% Карта нулів та полюсів фільтру
figure()
zplane(b), title('Карта нулів та полюсів смугового фільтру 2-го порядку, r = 0.6'); 

%=== Завдання #1.3 ===
% r = 0.7
r = 0.7;
b1 = [1 0 -1];                   % чисельник CФ 
a1 = [1 -2*r*cos(phi) r^2];  	% знаменник
n = 512;  % кількість точок, що розраховуються
figure()
[h,w] = freqz(b1,a1,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('АЧХ'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ'),
xlabel('Frequency'), ylabel('Phase')
% Обчислення нулів фільтру
x = roots(b1);
y = poly(a1);
disp('Нулі та полюси при r = 0.7:')
disp(x)
disp(y)

% Карта нулів та полюсів фільтру
figure()
zplane(b), title('Карта нулів та полюсів смугового фільтру 2-го порядку, r = 0.7'); 

% r = 0.9
r = 0.9; 
b2 = [1 0 -1];                   % чисельник CФ 
a2 = [1 -2*r*cos(phi) r^2];  	% знаменник
n = 512;  % кількість точок, що розраховуються
figure()
[h,w] = freqz(b2,a2,n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('АЧХ'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ'),
xlabel('Frequency'), ylabel('Phase')
% Обчислення нулів фільтру
x = roots(b2);
y = poly(a2);
disp('Нулі та полюси при r = 0.9:')
disp(x)
disp(y)

% Карта нулів та полюсів фільтру
figure()
zplane(b), title('Карта нулів та полюсів смугового фільтру 2-го порядку, r = 0.9'); 

%=== Завдання #1.4 ===
% Визначення добротності заданих фільтрів 
f1 = 1 
f2 = 1 

Q=fc/(f2-f1)

%=== Завдання #1.5 ===
%Побудува графіків перехідних процесів
n = 10;
figure()
[h,t] = stepz(b, a, n, fs);
subplot(3, 1, 1), plot (t, h), title('Графік перехідних процесів, r = 0.6')
[h,t] = stepz(b1, a1, n, fs);
subplot(3, 1, 2), plot (t, h), title('Графік перехідних процесів, r = 0.7')
[h,t] = stepz(b2, a2, n, fs);
subplot(3, 1, 3), plot (t, h), title('Графік перехідних процесів, r = 0.9')

%=== Завдання #2.1 ===
% Фільтрація ЕКГ при r = 0.6
fs = 200;
ecg105 = load('ecg105.txt'); % сигнал ЕКГ
ecg = ecg105;
ecgf = filter(b, a, ecg);
t = (0:length(ecg) - 1)/fs;
figure()
subplot(2, 2, 1), plot(t, ecg), title('Сигнал ЕКГ'), grid on, xlim([1.1 2.3]),ylabel('A, мкВ')
subplot(2, 2, 2), plot(t, ecgf), title('Фільтрований сигнал ЕКГ, r = 0.6'), grid on, xlim([1.1 2.3]),
xlabel('t, мс')
ylabel('A, мкВ')

%=== Завдання #2.2 ===
% Фільтрація ЕКГ при r = 0.7 та r = 0.9
% r = 0.7
ecgf = filter(b1, a1, ecg);
subplot(2, 2, 3), plot(t, ecgf), title('Фільтрований сигнал ЕКГ, r = 0.7'), grid on, xlim([1.1 2.3])
xlabel('t, мс')
ylabel('A, мкВ')
% r = 0.9
ecgf = filter(b2, a2, ecg);
subplot(2, 2, 4), plot(t, ecgf), title('Фільтрований сигнал ЕКГ, r = 0.9'), grid on, xlim([1.1 2.3])
xlabel('t, мс')
ylabel('A, мкВ')

%=== Завдання #3.1 ===
% Дослідження властивостей режекторного НІХ-фільтру
fs = 200;
r =  0.8;
phi1 = 110*pi/180;
phi2 = 130*pi/180;
a1 = [1 - 2 * r * cos(phi1) r^2];  
a2 = [1 - 2 * r * cos(phi2) r^2];
a = conv(a1, a2);
b = [1 1 1]/3;
H =  filt(b, a)% передавальна функція

%=== Завдання #3.2 ===
% АЧХ та ФЧХ смугового режекторного НІХ-фільтру
n = 512;  % кількість точок, що розраховуються
figure()
[h,w] = freqz(b, a, n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 1, 1); plot(w/(2*pi)*fs,mag), grid on, title('АЧХ'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 1, 2), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ'),
xlabel('Frequency'), ylabel('Phase')
% Обчислення нулів фільтру
x = roots(b);
% Карта нулів та полюсів фільтру
figure()
zplane(x); 

%=== Завдання #3.3 ===
% Порівняння АЧХ і ФЧХ режекторних НІХ і СІХ-фильтрів
 figure()
[h,w] = freqz(b, a, n);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 2, 1); plot(w/(2*pi)*fs,mag), grid on, title('АЧХ НІХ - фільтра'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 2, 3), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ НІХ - фільтра'),
xlabel('Frequency'), ylabel('Phase')
br = [1 0.618 1];   % коефіцієнти різницевого рівняння 
ar = 1;
[h, f] = freqz(br, ar, n, fs);
mag = abs(h); 
phase = angle(h)*180/pi;
subplot(2, 2, 2); plot(f, mag), grid on, title('АЧХ СІХ - фільтра'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(2, 2, 4), plot(f, unwrap(phase)), grid on, title('ФЧХ СІХ - фільтра'),
xlabel('Frequency'), ylabel('Phase'),

%=== Завдання #3.4 ===
% Фільтрацію сигналу ЕКГ(файл ecg2x60.dat) режекторним фільтром
fs = 200;
ecg2x60 = load('ecg2x60.dat'); % сигнал ЕКГ
ecg = ecg2x60;
ecgf = filter(b, a, ecg);
t = (0:length(ecg) - 1)/fs;
figure()
plot(t, ecg), title('Сигнал ЕКГ'), grid on, hold on, xlim([0.8 2.3]),ylabel('A, мкВ')
plot(t, ecgf), title('Фільтрований сигнал ЕКГ'), hold off, grid on,  legend('Сигнал ЕКГ', 'Фільтрований сигнал ЕКГ')

%=== Завдання #4.1 ===
% АЧХ і ФЧХ цифрових інтеграторів
% Інтегрування методом прямокутників 
fs = 200;           % частота дискретизації
T = 1/fs;
b = [T, T];          % чисельник ПФ
a = [1, -1];      % знаменник ПФ
n = 512;  % кількість точок, що розраховуються
figure()
[h,w] = freqz(b, a, n);
mag1 = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 2, 1); plot(w/(2*pi)*fs,mag1), grid on, title('АЧХ прямокут.'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 2, 2); plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ прямокут.'),
xlabel('Frequency'), ylabel('Phase')
% Інтегрування методом трапецій.
b1 = [1, 1]*T/2;
a1 = [1 -1];
[h,w] = freqz(b1, a1, n);
mag2 = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 2, 3); plot(w/(2*pi)*fs,mag2), grid on, title('АЧХ трап.'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 2, 4), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ трап.'),
xlabel('Frequency'), ylabel('Phase')
% Інтегрування методом парабол (Сімпсона)
b2 = [1 4 1]*T/3;
a2 = [1 0 -1];
[h,w] = freqz(b2, a2, n);
mag3 = abs(h); 
phase = angle(h)*180/pi;
subplot(3, 2, 5); plot(w/(2*pi)*fs,mag3), grid on, title('АЧХ параб.'),
xlabel('Frequency'), ylabel('Magnitude'),
subplot(3, 2, 6), plot(w/(2*pi) *fs,unwrap(phase)), grid on, title('ФЧХ параб.'),
xlabel('Frequency'), ylabel('Phase')

%=== Завдання #4.2 ===
% Обчислення нулів та полюсів інтеграторів
x = roots(b);
y = roots(b1);
z = roots(b2);
% Карта нулів та полюсів фільтру

% Карта нулів та полюсів фільтру
figure()
zplane(x); 

% Карта нулів та полюсів фільтру
figure()
zplane(y);

% Карта нулів та полюсів фільтру
figure()
zplane(z);

%=== Завдання #4.3 ===
% Обчислення абсолютної похибки АЧХ
mag0 = 1./(2*pi*f);
figure()
loglog(f, mag0, f, mag1), title('АЧХ ідеального інтегратора та реального (метод прямокутників)');% АЧХ ідеального інтегратора
 
err = (mag1 - mag0)*100;
figure()
plot(f, err), title('Абс. пох АЧХ (метод прямокутників)');
loglog(f, mag0, f, mag2), title('АЧХ ідеального інтегратора та реального (метод трапецій)');
err2 = (mag2 - mag0)*100;
figure()
plot(f, err2), title('Абс. пох АЧХ (метод трапецій)');
loglog(f, mag0, f, mag3), title('АЧХ ідеального інтегратора та реального (метод парабол)');
err3 = (mag3 - mag0)*100; 
figure()
plot(f, err3), title('Абс. пох АЧХ (метод парабол)');

%=== Завдання #4.4 ===
% Інтегрування сигналу ЕКГ (файл ecg105.txt) інтеграторами 
ecg = ecg105;


% інтегратор за методом прямокутників
ecgf1 = filter(b, a, ecg);
t = (0:length(ecgf1) - 1)/fs;
figure()
plot(t, ecg), title('Метод прямокутників'), grid on, xlim([1.1 2.3]),ylabel('A, мкВ'), hold on,
plot(t, ecgf1), xlim([1.1 2.3]), hold off,
legend('Сигнал ЕКГ', 'Фільтрований сигнал ЕКГ ')


% інтегратор за методом трапецій
ecgf2 = filter(b1, a1, ecg);
figure()
plot(t, ecg), title('Метод трапецій'), grid on, xlim([1.1 2.3]),ylabel('A, мкВ'), hold on,
plot(t, ecgf2), xlim([1.1 2.3]), hold off,
legend('Сигнал ЕКГ', 'Фільтрований сигнал ЕКГ ')

% інтегратор за методом парабол (Сімпсона)
ecgf3 = filter(b2, a2, ecg);
figure()
plot(t, ecg), title('Метод парабол'), grid on, xlim([1.1 2.3]),ylabel('A, мкВ'), hold on,
plot(t, ecgf3), xlim([1.1 2.3]), hold off,
legend('Сигнал ЕКГ', 'Фільтрований сигнал ЕКГ ')

% Графіки результатів інтегрування
...


