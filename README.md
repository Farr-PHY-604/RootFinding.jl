A Julia package with our live-coded bisection and secant method solver.  The
live code is in the notebook; I've extracted the code into the RootFinding
package and made a test suite for it.  You can install and use it in your own
Julia packages by activating them (or, if you want it in the default Julia
environment, activating no package).  Then enter package mode (press `]`), and
issue

```julia
(v1.2) pkg> add https://github.com/Farr-PHY-604/RootFinding.jl.git
```

Now it is installed in the current package's environment, and you can use it via

```julia
using RootFinding

sqrt_2 = bisect_root(x -> x*x-2, 1, 4)  # For example
```
