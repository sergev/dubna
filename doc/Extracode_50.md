# 5.3.1. Вычисление sqrt(x)

    Экстракод 050, Аисп = 0.

Квадратный корень вычисляется только для положительных
значений аргумента. Если x = n**2 (1 <= n <= 20), то
квадратный корень извлекается точно.
Максимальная относительная погрешность равна 1.9е-11.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

Авосты:

 * `КОРЕНЬ(X): X<0` - при задании отрицательного аргумента.

# 5.3.2. Вычисление sin(x)

    Экстракод 050, Аисп = 1.
    Экстракод 051, Аисп = 0.

Аргумент задается в радианах.
Результат вычисления всегда не больше единицы.
Относительная погрешность вычисления на интервале (0;1) не более 3.45е-12.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

Авосты:

 * `ПЕРЕПОЛНЕНИЕ АУ` - промежуточный результат вычисления больше максимального числа, представимого в эвм.

# 5.3.3. Вычисление cos(x)

    Экстракод 050, Аисп = 2.
    Экстракод 052, Аисп = 0.

Аргумент задается в радианах.
Результат вычисления всегда не больше единицы.
Относительная погрешность вычисления на интервале (0;1) не более 3.45е-12.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

Авосты:

 * `ПЕРЕПОЛНЕНИЕ АУ` - промежуточный результат вычисления больше максимального числа, представимого в эвм.

# 5.3.4. Вычисление arctg(x)

    Экстракод 050, Аисп = 3.
    Экстракод 053, Аисп = 0.

Результат вычисления - главное значение арктангенса - имеет
относительную погрешность не более 6.63е-12 на интервале значений аргумента (0;1).

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

# 5.3.5. Вычисление arcsin(x)

    Экстракод 050, Аисп = 4.
    Экстракод 054, Аисп = 0.

Вычисляется главное значение арксинуса для аргумента,
не превосходящего по абсолютной величине единицу.
Максимальная относительная погрешность составляет 9.86е-11.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

Авосты:

 * `АRСSIN(Х) |Х|>1` - при задании аргумента, превышающего по абсолютной величине единицу.

# 5.3.6. Вычисление ln(x)

    Экстракод 050, Аисп = 5.
    Экстракод 055, Аисп = 0.

Логарифм вычисляется для положительных значений аргумента.
На интервале (0.5;2) максимальная относительная погрешность равна 2.15е-9.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

Авосты:

 * `ЛОГАРИФМ(Х) Х<=0` - при задании неположительного аргумента.

# 5.3.7. Вычисление exp(x)

    Экстракод 050, Аисп = 6.
    Экстракод 056, Аисп = 0.

Экспонента вычисляется для аргумента, меньшего 44.
Максимальная относительная погрешность 2.37е-7.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.

Авосты:

 * `ЕХР(Х) Х>=44` - величина результата больше максимального значения, представимого в ЭВМ.

# 5.3.8. Вычисление entier(x)

    Экстракод 050, Аисп = 7.
    Экстракод 057, Аисп = 0.

Результат выполнения экстракода - максимальное целое число, не превосходящее аргумента.

Входная информация:

 * Сумматор: аргумент в виде машинного числа.

Выходная информация:

 * Сумматор: результат в виде нормализованного машинного числа.