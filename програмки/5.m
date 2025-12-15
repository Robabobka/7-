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

% Отмечаем корни
root1 = -sqrt(3);
root2 = sqrt(3);
plot(root1, 0, 'ro', 'MarkerSize', 3, 'MarkerFaceColor', 'r');
plot(root2, 0, 'ro', 'MarkerSize', 3, 'MarkerFaceColor', 'r');
text(root1, -0.5, sprintf('x = -%.3f', root1), 'FontSize', 10, 'HorizontalAlignment', 'center');
text(root2, -0.5, sprintf('x = %.3f', root2), 'FontSize', 10, 'HorizontalAlignment', 'center');
hold off;

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
