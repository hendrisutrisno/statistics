7. Central Limit Theorem CLT and Standard Error
===============================================

In the previous session, we studied **correlation**.
Correlation helps us describe how two variables move together.

However, many decisions in practice use an **average**.
We average sensor readings.
We average daily output.
We average customer waiting times.

A key gap remains.
Even if the process is stable, the average from a sample will still move.
We need a way to predict how much the average moves.

This is the main idea today.
We study the **Central Limit Theorem (CLT)**.
We also define the **standard error (typical sampling spread)**.

Learning Outcomes
-----------------

After this session, you should be able to:

- Explain why averages often look Normal (bell-shaped).
- Distinguish a population distribution from a sampling distribution.
- Use the CLT to standardize a sample mean into a Z-score.
- Compute probabilities about a sample mean using a Z-table.
- Interpret the standard error as the spread of the average.

Purpose and Use Cases
---------------------

CLT and standard error are used whenever we make decisions from sampled data.
Common examples include:

- Quality control: mean thickness from a small batch of parts.
- Operations: mean picking time from a set of orders.
- Sensors: mean temperature from repeated measurements.
- Service systems: mean waiting time during one shift.
- Management reports: mean daily demand from recent days.

Core Concept and Notation
-------------------------

Revisit: what is random and what is fixed?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- A **random variable (chance-based value)** can change from trial to trial.
- A **parameter (fixed long-run value)** describes the population.

We will use this notation.

- :math:`X` = one process measurement.
  Example: one cycle time from a machine.
- :math:`\mu` = population mean of :math:`X`.
- :math:`\sigma` = population standard deviation of :math:`X`.

Now we take a sample of size :math:`n`.

- :math:`X_1, X_2, \ldots, X_n` = independent measurements from the same process.
- :math:`Y` = the sample mean (average) of the sample.

.. math::

   Y = \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i

Two important distributions
^^^^^^^^^^^^^^^^^^^^^^^^^^^

These two distributions are different.

- **Population distribution**: the distribution of :math:`X`.
  It describes single observations.
- **Sampling distribution (distribution of a statistic)**: the distribution of :math:`Y`.
  It describes the average across repeated samples of size :math:`n`.

Visual: a single measurement can be skewed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In many real processes, single measurements are not bell-shaped.
Look for the long right tail.

A single measurement :math:`X` (for example, one order picking time or one machine cycle time)
often has a hard lower bound but no hard upper bound.
Most cases finish in a normal time window.
But a few cases take much longer because of interruptions, rework, setup delays, or congestion.
This creates a long right tail.
In the figure, focus on the right tail.
Those rare long cases explain why the population distribution of :math:`X` is often not bell-shaped,
even when the process is stable.

.. raw:: html

   <iframe src="../_static/07_01_clt_population_X_skewed.html" width="100%" height="420px" style="border:none;"></iframe>

Definition and Interpretation
-----------------------------

The "Magic of Averages"
^^^^^^^^^^^^^^^^^^^^^^^

A single measurement can be messy.
It can be skewed.
It can have spikes.

But the **average** of many measurements is more stable.
Large positive and negative deviations tend to cancel.
This is why the bell curve appears.

The Central Limit Theorem (CLT)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let :math:`X_1, \ldots, X_n` be independent and identically distributed.
Assume :math:`E(X_i) = \mu` and :math:`SD(X_i) = \sigma`.

Then, for large :math:`n`, the distribution of the sample mean :math:`Y = \bar{X}` is approximately Normal.

.. math::

   Y \approx N\left(\mu,\ \frac{\sigma^2}{n}\right)

This leads to a standard Z-score.

.. math::

   Z = \frac{Y - \mu}{\sigma / \sqrt{n}} \approx N(0, 1)

(Note: we convert the mean into "standard deviation units" so we can use the Z-table.)

What the CLT does *not* say
^^^^^^^^^^^^^^^^^^^^^^^^^^^

- It does **not** say the population :math:`X` must be Normal.
- It does **not** say :math:`n = 2` is always enough.
- It does say that as :math:`n` grows, the distribution of the mean becomes more bell-shaped.

Standard Error
^^^^^^^^^^^^^^

The **standard error (typical sampling spread)** of the sample mean is:

.. math::

   SE(Y) = \frac{\sigma}{\sqrt{n}}

Interpretation:

- :math:`\sigma` is the typical spread of single measurements.
- :math:`SE(Y)` is the typical spread of averages.
- When :math:`n` increases, :math:`SE(Y)` decreases.

Visual: the bell curve emerges for the average
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next figure shows the distribution of :math:`Y` for different sample sizes.
Use the slider.
As :math:`n` increases, the histogram becomes more bell-shaped.

Here, :math:`Y = \bar{X}` is the average of :math:`n` independent measurements.
Each time we take a new sample of size :math:`n`, we get a new value of :math:`Y`.
The histogram shows how :math:`Y` would vary if we repeated sampling many times.
When :math:`n` is small, the distribution of :math:`Y` can still look skewed.
When :math:`n` grows, extreme values in :math:`X` have less influence on the average.
Positive and negative deviations tend to cancel.
This is the key reason the bell curve appears for averages.

.. raw:: html

   <iframe src="../_static/07_02_clt_sampling_mean_animation.html" width="100%" height="420px" style="border:none;"></iframe>

Connection to Previous Ideas
----------------------------

Why independence matters
^^^^^^^^^^^^^^^^^^^^^^^^

The CLT for averages relies on many small contributions adding up.
Independence helps the contributions cancel in a balanced way.

If measurements are strongly dependent (linked), the average may not stabilize as expected.
In practice, dependence can happen when:

- the sensor has drift over time,
- consecutive items are from the same warm-up period,
- a queue builds up and affects several customers in a row.

Worked Example
--------------

Description
^^^^^^^^^^^

A filling machine dispenses a product.
Each unit has a fill weight :math:`X` (in grams).
The process is stable, but :math:`X` is not perfectly Normal.

From long-run data, we know:

- :math:`\mu = 500` g
- :math:`\sigma = 12` g

A supervisor takes a sample of :math:`n = 36` units and computes the sample mean :math:`Y = \bar{X}`.

Question
^^^^^^^^

Find :math:`P(Y > 503)`.

Analysis
^^^^^^^^

Model the sample mean using the CLT:

.. math::

   Y \approx N\left(\mu, \frac{\sigma^2}{n}\right)

So the mean and standard deviation of :math:`Y` are:

.. math::

   E(Y) = \mu = 500

.. math::

   SD(Y) = SE(Y) = \frac{\sigma}{\sqrt{n}} = \frac{12}{\sqrt{36}} = 2

(Note: the average has less spread than single items, so we use the standard error.)

Standardize to a Z-score:

.. math::

   Z = \frac{Y - \mu}{\sigma/\sqrt{n}}

For :math:`Y = 503`:

.. math::

   Z = \frac{503 - 500}{2} = 1.5

(Note: the Z-score measures distance in standard error units.)

Now compute the probability:

.. math::

   P(Y > 503) = P(Z > 1.5)

From the Z-table:

.. math::

   P(Z > 1.5) \approx 0.0668

Final answer:

.. math::

   P(Y > 503) \approx 0.067

(Note: this probability is small because 503 is 1.5 standard errors above the mean.)

Visual Intuition
------------------------------

1. Two mental models
^^^^^^^^^^^^^^^^^

1. **Noise cancels.**
   When you average many noisy readings, high errors and low errors tend to offset.

2. **Averages are less variable.**
   The average is more stable than a single observation.
   The stability improves with :math:`\sqrt{n}`, not with :math:`n`.

2. Standard error shrinks with sample size
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next figure shows :math:`SE(Y) = \sigma/\sqrt{n}` as a function of :math:`n`.
Look for the steep drop early, and the slower improvement later.

The standard error is the typical spread of the sample mean :math:`Y = \bar{X}` across repeated samples.
It follows a square-root rule.
When you increase :math:`n`, the average becomes more stable, but not linearly.
Doubling :math:`n` does not cut the standard error in half.
To reduce :math:`SE(Y)` by a factor of 2, you need about 4 times as many observations.
This explains why early sampling gives large gains, while very large samples give smaller extra gains.

.. raw:: html

   <iframe src="../_static/07_03_standard_error_vs_n.html" width="100%" height="420px" style="border:none;"></iframe>

Discussion and Common Errors
----------------------------

Common Error 1: Mixing up :math:`\sigma` and standard error
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
You use :math:`\sigma` when the question is about the mean.
This makes the probability look too extreme.

How to avoid it:
Ask: "Is the random variable a single :math:`X` or an average :math:`Y`?"
If it is an average, use :math:`SE(Y) = \sigma/\sqrt{n}`.

Common Error 2: Treating the CLT as exact for very small :math:`n`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
You apply a Normal approximation when :math:`n` is too small for a very skewed process.
The tail probabilities can be inaccurate.

How to avoid it:
Check the shape of the population data.
If it is highly skewed, increase :math:`n` before using the CLT.

Common Error 3: Forgetting the sampling distribution is about repeated samples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
You treat the sampling distribution as if it described the sample you already took.
This leads to confused interpretations.

How to avoid it:
Say this sentence out loud:
"If I repeat the sampling many times, how would the mean vary?"
That is the sampling distribution.

Summary
-------

- Single measurements :math:`X` can be skewed and irregular.
- The sample mean :math:`Y = \bar{X}` is an average across :math:`n` measurements.
- The CLT explains why the distribution of :math:`Y` becomes approximately Normal.
- Under the CLT: :math:`Y \approx N(\mu, \sigma^2/n)` for large :math:`n`.
- The standard error is :math:`SE(Y) = \sigma/\sqrt{n}`.
- Larger :math:`n` makes the average more stable, but with diminishing returns.
- We compute probabilities about :math:`Y` by converting to :math:`Z` and using the Z-table.
