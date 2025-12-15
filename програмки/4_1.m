%% Исходные данные
a = -1;
b = 10;
f = @(x) x.^2 - 4*x;

%% Количество разбиений (можно менять)
n = 20;

%% Метод прямоугольников
h = (b - a) / (n -1);
x = a:h:b;               % n+1 точка
y = f(x);
integral_rect = sum(y(2:end)) * h;

%% Вывод результата
fprintf('Аналитическое значение: %f\n', 407/3);
fprintf('Численное значение (n=%d): %f\n', n, integral_rect);

%% График функции и прямоугольников
figure;
hold on;
x_fine = linspace(a, b, 1000);
plot(x_fine, f(x_fine), 'b-', 'LineWidth', 2);
for i = 1:n
    x_rect = [x(i), x(i+1), x(i+1), x(i), x(i)];
    y_rect = [0, 0, f(x(i+1)), f(x(i+1)), 0];
    fill(x_rect, y_rect, 'c', 'EdgeColor', 'b', 'FaceAlpha', 0.3);
end
title('График функции и метод прямоугольников (n=%d)', n);
xlabel('x');
ylabel('y');
grid on;
hold off;