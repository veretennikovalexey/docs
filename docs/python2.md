# Строковый тип данных

Для считывания строк используем функцию `input()`

```python
user_name = input("Пожалуйста, введите ваше имя: ")
print(f"Привет, {user_name}! Добро пожаловать!")
```

```python
number1 = input("Введите первое число: ")
number2 = input("Введите второе число: ")
sum_result = float(number1) + float(number2)
print(f"Сумма чисел {number1} и {number2} равна: {sum_result}")
```

Функция `input()` возвращает нам строковый тип данных

Используем `int()` для преобразования строки в целое число 

## Длина строки len()

```python
len()
```

Строки можно складывать и умножать на целое число

## Оператор принадлежности in

С помощью оператора `in` можно определить входит ли одна строка в другую строку

```python
print('alex' in 'alexey') # True
```

```python
s = 'All you need is love'
if 'love' in s:
    print('❤️')
else:
    print('💔')
```

## Индексация строк []

С помощью квадратный скобок можно обратиться и получить символ строки

```python
print("Привет"[2]) # и
```

Индексация начинается с *нуля*

Последний элемент имеет индекс `-1`

```python
print("Привет"[-1]) # т
```

| Индекс | -6 | -5 | -4 | -3 | -2 | -1 | 0 | 1 | 2 | 3 | 4 | 5 |
|--------|----|----|----|----|----|----|---|---|---|---|---|---|
| Символ | П  | р  | и  | в  | е  | т  | П | р | и | в | е | т |

## Итерирование строк range(len(s))

```python
s = 'Привет'
for i in range(len(s)):
    print(s[i])
```

или

```python
for i in 'Привет':
    print(i)
```


---

*Источник* [stepik.org](https://stepik.org/lesson/284101/step/1?unit=265440)
