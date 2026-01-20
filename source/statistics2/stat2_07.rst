7. Central Limit Theorem CLT and Standard Error
=================================

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
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- A **random variable (chance-based value)** can change from trial to trial.
- A **parameter (fixed long-run value)** describes the population.

We will use this notation.

- ``X`` = one process measurement.
  Example: one cycle time from a machine.
- ``\mu`` = population mean of ``X``.
- ``\sigma`` = population standard deviation of ``X``.

Now we take a sample of size ``n``.

- ``X_1, X_2, ..., X_n`` = independent measurements from the same process.
- ``Y`` = the sample mean (average) of the sample.

.. math::

   Y = \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i

Two important distributions
^^^^^^^^^^^^^^^^^^^^^^^^^^^

These two distributions are different.

- **Population distribution**: the distribution of ``X``.
  It describes single observations.
- **Sampling distribution (distribution of a statistic)**: the distribution of ``Y``.
  It describes the average across repeated samples of size ``n``.

Visual: a single measurement can be skewed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In many real processes, single measurements are not bell-shaped.
Look for the long right tail.

.. raw:: html

   <iframe src="../_static/clt_population_X_skewed.html" width="100%" height="420px" style="border:none;"></iframe>

Definition and Interpretation
-----------------------------

The "Magic of Averages"
^^^^^^^^^^^^^^^^^^^^^^^^

A single measurement can be messy.
It can be skewed.
It can have spikes.

But the **average** of many measurements is more stable.
Large positive and negative deviations tend to cancel.
This is why the bell curve appears.

The Central Limit Theorem (CLT)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let ``X_1, ..., X_n`` be independent and identically distributed.
Assume ``E(X_i) = \mu`` and ``SD(X_i) = \sigma``.

Then, for large ``n``, the distribution of the sample mean ``Y = \bar{X}`` is approximately Normal.

.. math::

   Y \approx N\left(\mu,\ \frac{\sigma^2}{n}\right)

This leads to a standard Z-score.

.. math::

   Z = \frac{Y - \mu}{\sigma / \sqrt{n}} \approx N(0, 1)

(Note: we convert the mean into "standard deviation units" so we can use the Z-table.)

What the CLT does *not* say
^^^^^^^^^^^^^^^^^^^^^^^^^^^

- It does **not** say the population ``X`` must be Normal.
- It does **not** say ``n = 2`` is always enough.
- It does say that as ``n`` grows, the distribution of the mean becomes more bell-shaped.

Standard Error
^^^^^^^^^^^^^^

The **standard error (typical sampling spread)** of the sample mean is:

.. math::

   SE(Y) = \frac{\sigma}{\sqrt{n}}

Interpretation:

- ``\sigma`` is the typical spread of single measurements.
- ``SE(Y)`` is the typical spread of averages.
- When ``n`` increases, ``SE(Y)`` decreases.

Visual: the bell curve emerges for the average
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next figure shows the distribution of ``Y`` for different sample sizes.
Use the slider.
As ``n`` increases, the histogram becomes more bell-shaped.

.. raw:: html

   <iframe src="../_static/clt_sampling_mean_animation.html" width="100%" height="420px" style="border:none;"></iframe>

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

Scenario
^^^^^^^^

A filling machine dispenses a product.
Each unit has a fill weight ``X`` (in grams).
The process is stable, but ``X`` is not perfectly Normal.

From long-run data, we know:

- ``\mu = 500`` g
- ``\sigma = 12`` g

A supervisor takes a sample of ``n = 36`` units and computes the sample mean ``Y``.

Question
^^^^^^^^

What is the probability that the sample mean is above ``503`` g?

Step 1 — Identify the target random variable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We care about the sample mean:

.. math::

   Y = \bar{X}

(Note: a mean is a statistic, so we use its sampling distribution.)

Step 2 — Use CLT to model the mean
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By the CLT, for ``n = 36`` the distribution of ``Y`` is approximately Normal:

.. math::

   Y \approx N\left(\mu, \frac{\sigma^2}{n}\right)

So the mean and standard deviation of ``Y`` are:

.. math::

   E(Y) = \mu = 500

.. math::

   SD(Y) = SE(Y) = \frac{\sigma}{\sqrt{n}} = \frac{12}{\sqrt{36}} = 2

(Note: the average has less spread than single items.)

Step 3 — Standardize into a Z-score
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute:

.. math::

   Z = \frac{503 - 500}{2} = 1.5

(Note: we measure how many standard errors above the mean we are.)

Step 4 — Use the Z-table
^^^^^^^^^^^^^^^^^^^^^^^^

We want:

.. math::

   P(Y > 503) = P(Z > 1.5)

From the Z-table:

.. math::

   P(Z > 1.5) \approx 0.0668

Final answer:

.. math::

   P(Y > 503) \approx 0.067

(Note: this probability is small because 503 is 1.5 standard errors above the mean.)

Intuition and Visual Intuition
------------------------------

Two mental models
^^^^^^^^^^^^^^^^^

1. **Noise cancels.**
   When you average many noisy readings, high errors and low errors tend to offset.

2. **Averages are less variable.**
   The average is more stable than a single observation.
   The stability improves with ``\sqrt{n}``, not with ``n``.

Visual: standard error shrinks with sample size
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next figure shows ``SE(Y) = \sigma/\sqrt{n}`` as a function of ``n``.
Look for the steep drop early, and the slower improvement later.

.. raw:: html

   <iframe src="../_static/standard_error_vs_n.html" width="100%" height="420px" style="border:none;"></iframe>

Discussion and Common Errors
----------------------------

Common Error 1: Mixing up ``\sigma`` and standard error
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
You use ``\sigma`` when the question is about the mean.
This makes the probability look too extreme.

How to avoid it:
Ask: "Is the random variable a single ``X`` or an average ``Y``?"
If it is an average, use ``SE(Y) = \sigma/\sqrt{n}``.

Common Error 2: Treating the CLT as exact for very small ``n``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
You apply a Normal approximation when ``n`` is too small for a very skewed process.
The tail probabilities can be inaccurate.

How to avoid it:
Check the shape of the population data.
If it is highly skewed, increase ``n`` before using the CLT.

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

- Single measurements ``X`` can be skewed and irregular.
- The sample mean ``Y = \bar{X}`` is an average across ``n`` measurements.
- The CLT explains why the distribution of ``Y`` becomes approximately Normal.
- Under the CLT: ``Y \approx N(\mu, \sigma^2/n)`` for large ``n``.
- The standard error is ``SE(Y) = \sigma/\sqrt{n}``.
- Larger ``n`` makes the average more stable, but with diminishing returns.
- We compute probabilities about ``Y`` by converting to ``Z`` and using the Z-table.
