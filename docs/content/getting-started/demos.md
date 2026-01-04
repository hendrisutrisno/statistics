# Demos

This page collects short interactive demos and notebooks.

- Probability experiment simulations (coin flips, dice)
- Bootstrapping examples (resampling)
- Linear regression demos with diagnostics
- Visualizations for distributions and sampling variability

Example commands to include in your page:

```python
# simulate coin flips
import random
trials = 1000
flips = [random.choice([0,1]) for _ in range(trials)]
print(sum(flips)/trials)
