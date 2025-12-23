%% Задача 5: f(x) = 3 - x^2
clear; clc;

% Функция
f = @(x) 3 - x.^2;

% График
x_range = linspace(-3, 3, 400);
figure;
plot(x_range, f(x_range), 'b-', 'LineWidth', 2);
grid on; title('f(x) = 3 - x^2'); xlabel('x'); ylabel('f(x)');
hold on;

% Ввод диапазона для x
disp('--- Ввод диапазона для x ---');
x_start = input('Начало диапазона x: ');
x_end = input('Конец диапазона x: ');
step = input('Шаг для x: ');

x_vals = x_start : step : x_end;
f_vals = f(x_vals);

% 3) Ввод промежутка [A, B] для значений f(x)
disp('Ввод промежутка [A, B] для значений f(x)');
A = input('A = ');
B = input('B = ');

in_range = (f_vals >= A) & (f_vals <= B);
sum_in = sum(f_vals(in_range));

% Вывод результатов
disp('========== РЕЗУЛЬТАТЫ ==========');
disp(['3) Сумма f(x) в [', num2str(A), ', ', num2str(B), ']: ', num2str(sum_in)]);
