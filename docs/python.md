# Питон - это интерпретируемый язык

```python
name, surname = 'alex', 'vere'
```

## print()

```python
print('Hello, World !')
print() # пустая строка
print('Hello','World !')
```
### Параметр sep
```python
print('a', 'b', sep='+') # a+b
```

### Параметр end
```python
print('a', end='+')
print('b') # a+b
```

## input()
```python
print('Привет,', input())
```

Сначала будет произведён вызов функции `input()` а уже затем будет выполнен вывод на экран "Привет, Вася"