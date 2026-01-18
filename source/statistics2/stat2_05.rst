5. Correlation
==============

Introduction
------------

In the previous section, we learned **covariance**.

Covariance tells us the direction of a straight-line relationship:

- If covariance is positive, large ``X`` values tend to occur with large ``Y`` values.
- If covariance is negative, large ``X`` values tend to occur with small ``Y`` values.

However, covariance has one important limitation.

- Covariance depends on the **units** of measurement.
  For example, seconds and milliseconds will produce different covariance values.

So, covariance is hard to compare across different situations.

Now we learn **correlation**.

Correlation keeps the same direction information as covariance.
But it rescales the result into a standard range.
This makes the value easier to interpret and compare.

Learning Outcomes
-----------------

After this section, you should be able to:

- Explain correlation in plain words.
- Compute correlation from covariance and standard deviations.
- Interpret correlation values using the range from -1 to +1.
- Explain the connection between correlation, covariance, and independence.

Purpose and Use Cases
---------------------

In many real processes, we measure two quantities at the same time.

Examples:

- A signal quality measure and the system response time.
- A vibration measure and the surface roughness of parts.
- Conveyor speed and the number of failed inspections.

We want a number that answers two questions at once:

1. What is the **direction** of the straight-line pattern?
2. How **strong** is the straight-line pattern?

Covariance answers direction well, but its size depends on units.

Correlation solves this by creating a **unit-free** measure.
“Unit-free” means “no seconds, no meters, no kilograms.”
It is just a number.

Core Concept and Notation
-------------------------

Random variables
^^^^^^^^^^^^^^^^

Let:

- ``X`` be one random variable (random/unpredictable quantity). We can consider ``X`` as a condition or input indicator. 
- ``Y`` be another random variable. We can consider ``Y`` as a performance or output indicator.

Means (expected values), Variances and standard deviations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We understand the following notation:

* :math:`\mu_X = E[X]` is the mean (long-run average) of :math:`X`.
* :math:`\mu_Y = E[Y]` is the mean (long-run average) of :math:`Y`.

* :math:`V(X)` is the variance of :math:`X`.
* :math:`V(Y)` is the variance of :math:`Y`.

Variance measures spread (how scattered the values are). Standard deviation is the square root of variance:

* :math:`\sigma_X = \sqrt{V(X)}`
* :math:`\sigma_Y = \sqrt{V(Y)}`

A standard deviation is in the same unit as the variable.
It measures a “typical distance” from the mean.

Revisit Covariance
^^^^^^^^^^^^^^^^^^^

From the previous section:

.. math::

   \operatorname{cov}(X,Y) = E[(X-\mu_X)(Y-\mu_Y)]

Correlation is built from this covariance.

Definition of Correlation
-------------------------

Correlation is defined as:

.. math::

   \rho_{XY}
   = \frac{\operatorname{cov}(X,Y)}{\sqrt{V(X)}\sqrt{V(Y)}}
   = \frac{\operatorname{cov}(X,Y)}{\sigma_X \sigma_Y}

Here, we

1. Start with :math:`\operatorname{cov}(X,Y)` (the “raw” together-change score).
2. Divide by :math:`\sigma_X\sigma_Y` (the typical spread of each variable).
3. The result is a unit-free number.

Covariance and Correlation
^^^^^^^^^^^^^^^^^^^^^

Covariance can become larger or smaller when units change.

But standard deviation changes in a matching way.

When we divide covariance by :math:`\sigma_X\sigma_Y`,
the units cancel out.

So correlation becomes easy to compare across different unit choices.

Sign of correlation
^^^^^^^^^^^^^^^^^^^

Because :math:`\sigma_X>0` and :math:`\sigma_Y>0` (when both variables vary):

- Correlation has the same sign as covariance.

So:

- Positive covariance  -> positive correlation.
- Negative covariance  -> negative correlation.
- Zero covariance -> zero correlation.

Range of correlation
^^^^^^^^^^^^^^^^^^^^

Correlation always satisfies:

.. math::

   -1 \le \rho_{XY} \le 1

This is the most useful feature of correlation.

Interpretation of values
^^^^^^^^^^^^^^^^^^^^^^^^

- :math:`\rho_{XY} \approx +1`:
  outcomes fall close to an upward straight line.
  This is a strong positive pattern.

- :math:`\rho_{XY} \approx -1`:
  outcomes fall close to a downward straight line.
  This is a strong negative pattern.

- :math:`\rho_{XY} \approx 0`:
  no strong straight-line pattern is visible.

Connection to independence
^^^^^^^^^^^^^^^^^^^^^^^^^^

If ``X`` and ``Y`` are independent, then:

.. math::

   \operatorname{cov}(X,Y)=0
   \quad\text{and}\quad
   \rho_{XY}=0

However, the reverse is not always true.

- If :math:`\rho_{XY}=0`, we cannot conclude independence.
- Correlation near zero only means “no strong straight-line relationship.”

.. raw:: html

   <iframe src="../_static/05_01_Correlation_Sign_Strength.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Worked Example
--------------

We use the same variables as the covariance example:

- ``X`` = number of signal bars (1, 2, 3).
- ``Y`` = response time in seconds (1, 2, 3, 4).

From the covariance section, we already have:

- :math:`\operatorname{cov}(X,Y) = -0.5815`

We also have the variances:

- :math:`V(X)=0.6275`
- :math:`V(Y)=1.4099`

Goal: compute :math:`\rho_{XY}` and interpret it.

Step 1: Convert variances to standard deviations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. math::

   \sigma_X = \sqrt{V(X)} = \sqrt{0.6275}

(Note: correlation uses standard deviations, so we take the square root of variance.)

.. math::

   \sigma_Y = \sqrt{V(Y)} = \sqrt{1.4099}

(Note: same step for :math:`Y`.)

Step 2: Apply the correlation formula
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. math::

   \rho_{XY}
   = \frac{\operatorname{cov}(X,Y)}{\sigma_X \sigma_Y}
   = \frac{-0.5815}{\sqrt{0.6275}\sqrt{1.4099}}

(Note: divide the covariance by the product of standard deviations to remove units.)

Step 3: Compute the numerical value
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. math::

   \rho_{XY} \approx -0.62

(Note: the result is negative because the covariance is negative.)

Interpretation:

- The correlation is about -0.62.
- This indicates a moderate negative straight-line pattern.
- Larger signal-bar values tend to occur with smaller response times.

Intuition
------------------

Correlation as a “unit-free score” idea
^^^^^^^^^^^^^^^^^^^^^^^^
1. Covariance is a raw score. It depends on how the variables are measured.
2. Correlation is a standardized score. It compares the covariance to the typical spreads :math:`\sigma_X` and :math:`\sigma_Y`. This makes correlation unit-free.

.. raw:: html

   <iframe src="../_static/05_02_Correlation_Unit_Free.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Correlation as a “how close to a line” idea
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
3. Correlation measures how close the outcomes are to a straight line.
- Near +1 means “almost an upward line.”
- Near -1 means “almost a downward line.”
- Near 0 means “not close to any straight line.”

.. raw:: html

   <iframe src="../_static/05_03_Correlation_Linear_Line.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Discussion and Common Errors
----------------------------
1. Correlation versus covariance
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
A common error is treating them as unrelated ideas.

- Covariance and correlation have the same sign.
- Correlation is a scaled version of covariance.
- Correlation is unit-free, so it is easier to compare.
- Always remember: correlation is covariance divided by :math:`\sigma_X\sigma_Y`.

2. Correlation near zero
^^^^^^^^^^^^^^^^^^^^^
- Correlation near zero does not mean “no relationship", but **no strong straight-line relationship**.
- We treat correlation as a linear tool.
- Use a point-cloud picture to judge whether the pattern looks straight-line.
- Independence implies correlation is zero, but correlation zero does not guarantee independence.

3. When correlation is not defined
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If :math:`V(X)=0` or :math:`V(Y)=0`, then :math:`\sigma_X\sigma_Y=0`. It also means that correlation is not defined.

We want to make sure that both ``X`` and ``Y`` has variances. If at least one variable is constant, then correlation is not meaningful.
