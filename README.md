# HashVsPatterns

After completing the [Space Age exercise](http://exercism.io/submissions/9553eaebde824a14897e8ba0e6ffdf1b)
in two different ways (the "ruby one" with a hash and the "pattern matching" one) I was left
wondering which one would be faster / better.

This repo is for exploring that.

## Results

Pattern matching is much faster than using a hash to lookup the planet factors.

```
$ mix run -e HashVsPatterns.benchmark
...
Name                    ips        average  deviation         median
With patterns        2.01 M        0.50 μs   ±639.56%        0.50 μs
With hash            1.23 M        0.82 μs   ±386.66%        0.80 μs

Comparison:
With patterns        2.01 M
With hash            1.23 M - 1.64x slower
```
