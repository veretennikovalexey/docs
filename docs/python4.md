
# Условный оператор

```python
if условие:
    блок кода
```
```python
if условие:
    блок кода
else:
    блок кода
```


| Оператор |                            |
| :------: | -------------------------- |
| =        | **оператор присваивания**  |
| ==       | **условный оператор**      |


Существует 6 операторов сравнения


| Оператор |                            |
| :------: | -------------------------- |
|    >     |        больше          
|    <     |        меньше    
|   >=     |        больше или равно
|   <=     |        меньше или равно
|   ==     |        равно
|   !=     |        не равно


# Цепочки сравнений
```python
if 1 < n < 11:
    блок кода
```
```python
if a == b == c:
    блок кода
```

# Транзитивность

Если `а` равно `б` и `б` равно `в`, значит `а` равно `в`

Если `а` больше `б` и `б` больше `в`, значит `а` больше `в`

Если `а` делится на `б` и `б` делится на `в`, значит `а` делится на `в`

---

Операция неравенства `!=` *не является* транзитивной

# Логические операторы

not and or

## Укороченная схема

Если условие слева от оператора `and` ложно, то условие справа не проверяется

Если условие слева от оператора `or` истина - условие справа не проверяется