%% 1. Определение функции y(x) = y1(x) + y2(x)
y1 = @(x) x;          % y1(x) = x
y2 = @(x) 1 ./ x;     % y2(x) = 1/x
y = @(x) y1(x) + y2(x);  % y(x) = x + 1/x

%% 2. Первый способ: случайные значения x
x_random = 0.5 + 4 * rand(1, 30);  % случайные значения от 0.5 до 4.5 (избегаем x=0)
y_random = y(x_random);

%% 3. Второй способ: равномерная сетка с шагом
x_step = 0.5:0.1:5;   % от 0.5 до 5 с шагом 0.1
y_step = y(x_step);

%% 4. Построение графиков
figure('Position', [100, 100, 1200, 400]);

% График 1: случайные значения
subplot(1, 2, 1);
plot(x_random, y_random, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
title('График y(x) = x + 1/x (случайные точки)', 'FontSize', 12);
xlabel('x', 'FontSize', 11);
ylabel('y(x)', 'FontSize', 11);
grid on;
axis([0.5, 5, -5, 15]);

% График 2: равномерная сетка
subplot(1, 2, 2);
plot(x_step, y_step, 'r-', 'LineWidth', 2);
title('График y(x) = x + 1/x (равномерная сетка)', 'FontSize', 12);
xlabel('x', 'FontSize', 11);
ylabel('y(x)', 'FontSize', 11);
grid on;
axis([0.5, 5, -5, 15]);

%% 5. Вывод таблицы значений (первые 10 точек)
fprintf('Первые 10 значений (равномерная сетка):\n');
fprintf('   x      y(x)\n');
for i = 1:10
    fprintf('%6.2f   %8.4f\n', x_step(i), y_step(i));
end

%% 6. Поиск экстремума (производная = 0)
syms xs
y_sym = xs + 1/xs;
dy = diff(y_sym, xs);
critical_points = solve(dy == 0, xs);
critical_points_num = double(critical_points);
critical_points_num = critical_points_num(critical_points_num > 0);  % берем положительные x
fprintf('\nКритическая точка (производная = 0):\n');
disp(critical_points_num);

%% 7. Значение функции в критической точке
if ~isempty(critical_points_num)
    y_extr = y(critical_points_num(1));
    fprintf('y(%.4f) = %.4f\n', critical_points_num(1), y_extr);
end