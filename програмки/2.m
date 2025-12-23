% p1: 4 монома (степень 3)
p1 = [3, -2, 5, 1];   % 3x^3 - 2x^2 + 5x + 1

% p2: 6 мономов (степень 5)
p2 = [1, -4, 3, 7, -1, 2];  % x^5 - 4x^4 + 3x^3 + 7x^2 - x + 2

disp('Коэффициенты полинома p2:');
disp(p2);
disp('Полином p2 в символьном виде:');
disp(poly2sym(p2));

%% 2. Число мономов (ненулевых коэффициентов)
num_monomials_p1 = nnz(p1);
num_monomials_p2 = nnz(p2);

disp(['Число мономов в p1: ', num2str(num_monomials_p1)]);
disp(['Число мономов в p2: ', num2str(num_monomials_p2)]);

%% 3. Вычисление значения полинома при заданном x
x = 1.5;
value_p1 = polyval(p1, x);
value_p2 = polyval(p2, x);
disp(['Значение p1 при x = ', num2str(x), ': ', num2str(value_p1)]);
disp(['Значение p2 при x = ', num2str(x), ': ', num2str(value_p2)]);

%% 4. Операции с полиномами

% Сложение (нужно уровнять длины векторов)
len_diff = length(p2) - length(p1);
p1_padded = [zeros(1, len_diff), p1];  % дополняем p1 нулями слева до степени p2
p_sum = p1_padded + p2;
disp('Сумма p1 + p2 (коэффициенты, от старшей степени):');
disp(p_sum);
disp('Сумма в символьном виде:');
disp(poly2sym(p_sum));

% Вычитание
p_diff = p1_padded - p2;
disp('Разность p1 - p2 (коэффициенты):');
disp(p_diff);
disp('Разность в символьном виде:');
disp(poly2sym(p_diff));

% Умножение
p_mul = conv(p1, p2);
disp('Произведение p1 * p2 (коэффициенты):');
disp(p_mul);
disp('Произведение в символьном виде:');
disp(poly2sym(p_mul));

% Деление (например, делим произведение на p1)
[quotient, remainder] = deconv(p_mul, p1);
disp('Частное от деления (p1*p2) / p1 (коэффициенты):');
disp(quotient);
disp('Остаток от деления:');
disp(remainder);
