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

## Bonus

Since pattern matching is faster, can we find a more convenient way to write it?

We can do some macro magic to generate all patterns from a hash at compile time. See `WithPatternsAndMacros` for a contrived example where the list of planets and their factors are read from a file at compile-time and used to generate the patterns.

Below are the results, there is no significant difference between the hand-typed patterns and the generated ones (measurement errors caused by the benchmarked code being very fast)

```
$ mix run -e HashVsPatterns.benchmark
...
Name                               ips        average  deviation         median
With patterns and macros        1.99 M        0.50 μs   ±641.88%        0.50 μs
With patterns                   1.95 M        0.51 μs   ±647.71%        0.50 μs
With hash                       1.19 M        0.84 μs   ±348.51%        0.80 μs

Comparison:
With patterns and macros        1.99 M
With patterns                   1.95 M - 1.02x slower
With hash                       1.19 M - 1.67x slower
```
