6. Linear Functions and Sampling Basics
=======================================

Introduction
------------

In the previous session, we used **covariance** and **correlation** to describe how two variables move together.
That was useful, but it did not yet tell us what happens to the **mean** and **variance** when we *combine* variables.

In real operations, we often combine measurements.
We add times, add costs, or average sensor readings.
So we need rules for the mean and variance of **linear functions** (weighted sums).

Learning Outcomes
-----------------

After this session, you should be able to:

- Compute :math:`E(aX + bY + c)` using means of :math:`X` and :math:`Y`.
- Compute :math:`V(aX + bY + c)` using variances and :math:`\mathrm{cov}(X,Y)`.
- Explain why independence matters for variance of a sum.
- Recognize a **Statistic (Calculated Sample Value)** as a function of sample random variables.

Purpose and Use Cases
---------------------

You use linear combinations in many common settings:

- **Cycle time**: total time is waiting time plus processing time.
- **Quality**: final dimension is a sum of layer thicknesses.
- **Operations cost**: total cost is material cost plus labor cost.
- **Sensor fusion**: one estimate is a weighted average of two sensors.
- **Sampling**: the sample mean is an average of repeated measurements.

Core Concept and Notation
-------------------------

Random variables
~~~~~~~~~~~~~~~

- :math:`X`, :math:`Y`: two random variables (e.g., two sensor readings).
- :math:`\mu_X = E(X)`, :math:`\mu_Y = E(Y)`: means.
- :math:`\sigma_X^2 = V(X)`, :math:`\sigma_Y^2 = V(Y)`: variances.
- :math:`\sigma_X`, :math:`\sigma_Y`: standard deviations.

Revisit: Covariance and Independence
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- :math:`\mathrm{cov}(X,Y)` measures joint variation.
- If :math:`X` and :math:`Y` are **independent**, then :math:`\mathrm{cov}(X,Y)=0`.
- If :math:`\mathrm{cov}(X,Y)=0`, independence is *not guaranteed* (but it is still useful for variance rules).

Definition and Interpretation
----------------------------

Linear function
~~~~~~~~~~~~~~~

A **linear function** of :math:`X` and :math:`Y` is

.. math::

   W = c_0 + c_1 X + c_2 Y

Mean of a linear function
~~~~~~~~~~~~~~~~~~~~~~~~~

.. math::

   E(W) = c_0 + c_1 E(X) + c_2 E(Y)
        = c_0 + c_1 \mu_X + c_2 \mu_Y

(Note: the mean is an average level, so weights pass through the expectation.)

Variance of a linear function
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. math::

   V(W) = c_1^2 V(X) + c_2^2 V(Y) + 2c_1c_2\,\mathrm{cov}(X,Y)
        = c_1^2 \sigma_X^2 + c_2^2 \sigma_Y^2 + 2c_1c_2\,\mathrm{cov}(X,Y)

(Note: variance tracks spread, so squared weights appear, and dependence adds the cross term.)

Special case: sum
~~~~~~~~~~~~~~~~~

Let :math:`S = X + Y`.

.. math::

   E(S) = \mu_X + \mu_Y

.. math::

   V(S) = \sigma_X^2 + \sigma_Y^2 + 2\,\mathrm{cov}(X,Y)

If :math:`X` and :math:`Y` are independent:

.. math::

   V(S) = \sigma_X^2 + \sigma_Y^2

Special case: average (sampling link)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let :math:`\bar{X} = \dfrac{X_1 + \cdots + X_n}{n}` where the :math:`X_i` are independent and have
the same mean :math:`\mu` and variance :math:`\sigma^2`.

.. math::

   E(\bar{X}) = \mu

.. math::

   V(\bar{X}) = \frac{\sigma^2}{n}

(Note: averaging keeps the center the same, but reduces spread by a factor of :math:`n`.)

Connection to Previous Ideas
----------------------------

Why independence matters
~~~~~~~~~~~~~~~~~~~~~~~~

Variance is about uncertainty.
If two quantities move together, their uncertainties can **reinforce** or **cancel**.

- If :math:`\mathrm{cov}(X,Y) > 0`, then large values of :math:`X` tend to come with large values of :math:`Y`.
  The sum becomes more variable.
- If :math:`\mathrm{cov}(X,Y) < 0`, then large values of :math:`X` tend to come with small values of :math:`Y`.
  The sum becomes less variable.
- If :math:`X` and :math:`Y` are independent, there is no reinforcement pattern, and the cross term is zero.

Worked Example
--------------

Context
~~~~~~~

A production line uses two sensors to estimate a deviation from a target thickness.

- :math:`X`: sensor A deviation (micrometers).
- :math:`Y`: sensor B deviation (micrometers).

Assume:

- :math:`\mu_X = 0.20`, :math:`\sigma_X = 0.50`  (so :math:`\sigma_X^2 = 0.25`)
- :math:`\mu_Y = -0.10`, :math:`\sigma_Y = 0.40` (so :math:`\sigma_Y^2 = 0.16`)
- Correlation :math:`\rho = 0.60`, so :math:`\mathrm{cov}(X,Y) = \rho\sigma_X\sigma_Y = 0.60(0.50)(0.40)=0.12`

We define the combined estimate as a sum:

.. math::

   S = X + Y

Step 1 — Mean of the sum
~~~~~~~~~~~~~~~~~~~~~~~~

.. math::

   E(S) = \mu_X + \mu_Y = 0.20 + (-0.10) = 0.10.

(Note: the average deviation adds, so positive and negative shifts can offset.)

Step 2 — Variance of the sum (dependent case)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. math::

   V(S) = \sigma_X^2 + \sigma_Y^2 + 2\,\mathrm{cov}(X,Y)
        = 0.25 + 0.16 + 2(0.12)
        = 0.65

So the standard deviation is:

.. math::

   \sigma_S = \sqrt{0.65} \approx 0.806

(Note: positive covariance increases total variability through the cross term.)

Step 3 — Compare to the independent case
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the sensors were independent, then :math:`\mathrm{cov}(X,Y)=0` and

.. math::

   V(S) = 0.25 + 0.16 = 0.41,
   \quad \sigma_S = \sqrt{0.41} \approx 0.640

(Note: independence removes the reinforcement effect, so the sum is less spread out.)

Step 4 — Sampling link: a Statistic (Calculated Sample Value)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now suppose we take :math:`n=5` parts and record sensor A each time:

.. math::

   X_1, X_2, X_3, X_4, X_5

The **sample mean** is

.. math::

   \bar{X} = \frac{X_1+X_2+X_3+X_4+X_5}{5}

This is a **Statistic (Calculated Sample Value)**.
It is a rule that takes the sample values and returns one number.

If the :math:`X_i` are independent with mean :math:`\mu_X` and variance :math:`\sigma_X^2`, then:

.. math::

   E(\bar{X}) = \mu_X = 0.20

.. math::

   V(\bar{X}) = \frac{\sigma_X^2}{5} = \frac{0.25}{5} = 0.05

So:

.. math::

   \sigma_{\bar{X}} = \sqrt{0.05} \approx 0.224

(Note: averaging reduces noise, so the sample mean is more stable than a single reading.)

Intuition / Visual Intuition
----------------------------

Visual 1: How covariance changes the spread of a sum
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Figure 1, we simulate two measurements from the same system, such as two sensor readings taken on the same part.
We set both means to 0 and both standard deviations to 1, so the only difference is how strongly the variables move together.
We change the correlation :math:`\rho` (and therefore the covariance) to create three cases: negative, zero, and positive dependence.
Each time, we form the sum :math:`S=X+Y` and plot its distribution.
Keep the scale the same and compare the width of the curves.
A positive covariance makes the sum more variable, and a negative covariance can reduce variability.


Focus on how the distribution of :math:`S=X+Y` becomes wider when covariance is positive.
Also notice how it becomes tighter when covariance is negative.

.. raw:: html

   <iframe src="../_static/06_01_sum_variance_covariance.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Visual 2: Mean shift under a linear function
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Figure 2, we focus on a linear combination that is used for a combined index or a weighted estimate.
We define :math:`W=c_0+c_1X+c_2Y`, where :math:`c_1` and :math:`c_2` are weights chosen by the analyst.
We treat :math:`\mu_X` and :math:`\mu_Y` as fixed process averages, and we change only the weights.
The plot shows the mean of :math:`W` across many values of :math:`c_1` and :math:`c_2`.
Use the surface to see that :math:`E(W)=c_0+c_1\mu_X+c_2\mu_Y` changes smoothly and predictably as the weights change.

Focus on how changing weights :math:`c_1` and :math:`c_2` shifts the center of :math:`W=c_0+c_1X+c_2Y`.
The mean moves in a "predictable way".

- Focus on how the weights :math:`c_1` and :math:`c_2` control the contribution of :math:`X` and :math:`Y` to the linear function :math:`W=c_0+c_1X+c_2Y`.
- As you change these weights, the mean (center) of :math:`W` shifts according to :math:`E(W)=c_0+c_1\mu_X+c_2\mu_Y`, so the surface moves in a smooth, straight-line way.
- If a weight is larger in magnitude, that variable has a stronger pull on the mean. 
- If a weight is negative, it reverses the direction of the shift.

.. raw:: html

   <iframe src="../_static/06_02_linear_mean_shift.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Visual 3: Sampling and the sample mean as a statistic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To study sampling, we simulate repeated measurements from one stable process.
Assume the process mean is :math:`\mu = 0.20` and the process standard deviation is :math:`\sigma = 0.50`.
For each sample size :math:`n \in \{1,2,5,10,30,50\}`, we take :math:`n` measurements and compute the sample mean :math:`\bar{X}`.
We repeat this experiment 15,000 times to see how the distribution of :math:`\bar{X}` changes as :math:`n` increases.
Keep the x-axis fixed and observe how the histogram becomes narrower when :math:`n` is larger.

.. raw:: html

   <iframe src="../_static/06_03_sample_mean_sampling.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Focus on how the sample mean varies less as :math:`n` increases.
The center stays near :math:`\mu`, but the spread shrinks.


Discussion and Common Errors
----------------------------

Common Error 1: Forgetting the covariance term
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

What goes wrong: Students use :math:`V(X+Y)=V(X)+V(Y)` even when :math:`X` and :math:`Y` are dependent.
This underestimates or overestimates uncertainty.

How to avoid it: Always ask, "Do these measurements come from the same machine/line or the same disturbance source?"
If yes, include :math:`2\,\mathrm{cov}(X,Y)`.

Common Error 2: Not squaring the coefficients in variance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

What goes wrong: Students write :math:`V(cX)=cV(X)` instead of :math:`V(cX)=c^2V(X)`.
This gives the wrong scale.

How to avoid it: Remember variance is about squared deviation.
So scaling by :math:`c` scales deviation by :math:`c`, and variance by :math:`c^2`.

Common Error 3: Confusing a statistic with a parameter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

What goes wrong: Students treat :math:`\bar{X}` as a fixed number like :math:`\mu`.
But :math:`\bar{X}` is random because it depends on random sample values.

How to avoid it: Use the language rule: parameters (like :math:`\mu`, :math:`\sigma`) describe the population model.
Statistics (like :math:`\bar{X}`, :math:`S^2`) are computed from the sample.

Summary
-------

- A linear function has the form :math:`W=c_0+c_1X+c_2Y`.
- Means add and pass through constants: :math:`E(W)=c_0+c_1\mu_X+c_2\mu_Y`.
- Variances need squared weights and a covariance term:
  :math:`V(W)=c_1^2\sigma_X^2+c_2^2\sigma_Y^2+2c_1c_2\mathrm{cov}(X,Y)`.
- Independence implies :math:`\mathrm{cov}(X,Y)=0`, which simplifies variance of a sum.
- The sample mean :math:`\bar{X}` is a **Statistic (Calculated Sample Value)**.
- If :math:`X_1,\dots,X_n` are independent with variance :math:`\sigma^2`, then :math:`V(\bar{X})=\sigma^2/n`.
- Averaging reduces spread but does not change the target mean.
