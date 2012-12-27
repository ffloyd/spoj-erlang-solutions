Benchs
======

bad1.erl
--------
```
> futil:bench(bad1, primes, [999900000, 1000000000]).
19.795306
```

SPOJ result - runtime error (wtf?)

bad2.erl
--------
```
> futil:bench(bad2, primes, [999900000, 1000000000]).
1.759625
```

SPOJ result - time limit. Okay, let's do it more fast...

tested.erl
----------
```
> futil:bench(tested, primes, [999900000, 1000000000]).
0.067898
```

Good!

SPOJ result - time limit. WTF??? I wanna go sleep...