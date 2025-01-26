# Гипотеза Эйлера

Для начала найдём решение для такого уравнения

a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>

для натуральных чисел до 10

```python
n = 10

for c in range(1, n + 1):
    for a in range(1, c + 1):
        for b in range(1, a + 1):
            if a**2 + b**2 == c**2:
                print(a, b, c)
```

Ответ:

4 3 5 ( 16 + 9 = 25 )

8 6 10 ( 64 + 36 = 100 )

# Теорема Ферма 

a<sup>3</sup> + b<sup>3</sup> = c<sup>3</sup>

Согласно теореме, решений не имеет :)


```python
import time

n = 150

for e in range(140, n + 1):
    start = time.perf_counter()
    for a in range(1, e + 1):
        for b in range(1, a + 1):
            for c in range(1, b + 1):
                for d in range(1, c + 1):
                    if a**5 + b**5 + c**5 + d**5 == e**5:
                        print(f"{a} {b} {c} {d} {e}")
    elapsed = time.perf_counter() - start
    print(f"{e} {elapsed:.1f}")
```

---

*Источник* [stepik.org](https://stepik.org/lesson/298795/step/13?unit=280622)
