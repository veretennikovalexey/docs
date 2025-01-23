# Гипотеза Эйлера

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
