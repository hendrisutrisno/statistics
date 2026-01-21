4. Covariance
=============

Introduction
------------

In the previous reading on **independence**, we learned this key idea:

- If two random variables are **independent**, knowing one variable does **not** help you
  predict the other one.
- Independence is a strong statement about “no linkage” in probability.

Now we learn **covariance**.

Covariance is a number that answers a different question:

- “When one variable is high, does the other variable also tend to be high?”
- “When one variable is high, does the other variable tend to be low?”
- “Or do they not move together in a clear straight-line way?”

Covariance describes how two variables **vary together**.
“Vary” means “change.”
So covariance measures “together-change.”

Learning Outcomes
-----------------

After this section, you should be able to:

- Explain covariance in plain words.
- Compute covariance from a joint probability table.
- Interpret the sign (positive, negative, or near zero).
- Explain the connection between covariance and independence.

Purpose and Use Cases
---------------------

In many real processes, we measure two things at the same time.

Examples:

- A sensor’s signal strength and the system response time.
- A machine’s vibration level and the surface roughness of parts.
- Conveyor speed and the number of units that fail inspection.

We want a tool that can summarize the relationship using **one number**.

Covariance gives that number.

Covariance does not try to describe every kind of relationship.
It mainly describes a **linear** (straight-line) together-pattern:

- One goes up, the other tends to go up  -> positive covariance.
- One goes up, the other tends to go down -> negative covariance.
- No clear straight-line direction -> covariance near zero.

Core Concept and Notation
-------------------------

Random variables
^^^^^^^^^^^^^^^^

Let:

- ``X`` be one random variable (random/unpredictable quantity).
- ``Y`` be another random variable.

In a process setting, you can think of:

- ``X`` as a measurement of a system condition (signal bars, temperature category, load level).
- ``Y`` as a measurement of performance (response time category, defect category, throughput category).

Means (expected values)
^^^^^^^^^^^^^^^^^^^^^^^

We use:

* :math:`\mu_X = E[X]` is the mean (long-run average) of :math:`X`.
* :math:`\mu_Y = E[Y]` is the mean (long-run average) of :math:`Y`.

A mean is the “center” or “typical level.”

Deviations from the mean
^^^^^^^^^^^^^^^^^^^^^^^^

We look at:

- :math:`(X - \mu_X)` = how far ``X`` is above or below its mean.
- :math:`(Y - \mu_Y)` = how far ``Y`` is above or below its mean.

These are called **deviations**.
Deviation means “difference from the average.”

Expected value of a function of two variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sometimes we need the expected value of a function that depends on both ``X`` and ``Y``.
We write:

.. math::

   E[h(X,Y)]

Interpretation:

- ``h(X,Y)`` is a rule that takes a pair ``(X,Y)`` and produces one number.
- The expectation is the long-run average of that output.

If ``X`` and ``Y`` are **discrete**:

.. math::

   E[h(X,Y)] = \sum_x \sum_y h(x,y)\, f_{XY}(x,y)

If ``X`` and ``Y`` are **continuous**:

.. math::

   E[h(X,Y)] = \int \int h(x,y)\, f_{XY}(x,y)\, dx\, dy

In both cases, :math:`f_{XY}(x,y)` is the **joint distribution**.
It tells us how likely each pair ``(x,y)`` is.

Definition of Covariance
------------------------

Covariance is defined as:

.. math::

   \operatorname{cov}(X,Y) = E\big[(X-\mu_X)(Y-\mu_Y)\big]

Read it slowly:

1. Find how far ``X`` is from its mean: :math:`X-\mu_X`.
2. Find how far ``Y`` is from its mean: :math:`Y-\mu_Y`.
3. Multiply them: :math:`(X-\mu_X)(Y-\mu_Y)`.
4. Take the expected value (the long-run average).

Why the multiplication works
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The product :math:`(X-\mu_X)(Y-\mu_Y)` carries direction information.

- If both are above their means, the product is positive.
- If both are below their means, the product is also positive.
- If one is above and the other is below, the product is negative.

So covariance becomes an average “direction score”:

- Mostly positive products -> positive covariance.
- Mostly negative products -> negative covariance.

A convenient formula
^^^^^^^^^^^^^^^^^^^^

Covariance can also be computed by:

.. math::

   \operatorname{cov}(X,Y) = E[XY] - \mu_X \mu_Y

This form is often easier to compute.

Interpretation of the sign
^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Positive covariance**:
  When ``X`` is higher than usual, ``Y`` tends to be higher than usual.

- **Negative covariance**:
  When ``X`` is higher than usual, ``Y`` tends to be lower than usual.

- **Covariance near zero**:
  No clear straight-line together-pattern is visible.

.. raw:: html

   <iframe src="../_static/04_01_Covariance_Sign.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Connection to independence
^^^^^^^^^^^^^^^^^^^^^^^^^^

Independence is stronger than “zero covariance.”

Key fact:

- If ``X`` and ``Y`` are independent, then :math:`\operatorname{cov}(X,Y)=0`.

Reason:

- Independence implies :math:`E[XY] = E[X]E[Y] = \mu_X\mu_Y`.
- Then :math:`E[XY] - \mu_X\mu_Y = 0`.

Important warning:

- :math:`\operatorname{cov}(X,Y)=0` does not always mean independence.
- It only means the linear (straight-line) together-pattern is not strong.

.. raw:: html

   <iframe src="../_static/04_02_Covariance_Contribution.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Worked Example
--------------

Scenario
^^^^^^^^

A system records two discrete random variables for each task:

- ``X`` = number of signal bars (1, 2, 3).
- ``Y`` = response time in seconds (1, 2, 3, 4).

The joint probability table is:

+-----+------+------+------+------+
|     | Y=1  | Y=2  | Y=3  | Y=4  |
+=====+======+======+======+======+
| X=1 | 0.01 | 0.02 | 0.02 | 0.15 |
+-----+------+------+------+------+
| X=2 | 0.02 | 0.03 | 0.10 | 0.10 |
+-----+------+------+------+------+
| X=3 | 0.25 | 0.20 | 0.05 | 0.05 |
+-----+------+------+------+------+

Goal: compute :math:`\operatorname{cov}(X,Y)` and interpret it.

Step 1: Find the marginal distributions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute :math:`f_X(x)` by summing each row:

.. math::

   f_X(1)=0.01+0.02+0.02+0.15=0.20

.. math::

   f_X(2)=0.02+0.03+0.10+0.10=0.25

.. math::

   f_X(3)=0.25+0.20+0.05+0.05=0.55

Compute :math:`f_Y(y)` by summing each column:

.. math::

   f_Y(1)=0.01+0.02+0.25=0.28

.. math::

   f_Y(2)=0.02+0.03+0.20=0.25

.. math::

   f_Y(3)=0.02+0.10+0.05=0.17

.. math::

   f_Y(4)=0.15+0.10+0.05=0.30

Step 2: Compute the means mu_X and mu_Y
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute :math:`\mu_X = E[X]`:

.. math::

   \mu_X = 1(0.20)+2(0.25)+3(0.55)
        = 0.20+0.50+1.65
        = 2.35

Compute :math:`\mu_Y = E[Y]`:

.. math::

   \mu_Y = 1(0.28)+2(0.25)+3(0.17)+4(0.30)
        = 0.28+0.50+0.51+1.20
        = 2.49

Step 3: Compute E[XY] using the joint distribution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Use:

.. math::

   E[XY] = \sum_x \sum_y (xy)\, f_{XY}(x,y)

Compute each weighted product:

- :math:`(1\cdot 1)(0.01)=0.01`
- :math:`(1\cdot 2)(0.02)=0.04`
- :math:`(1\cdot 3)(0.02)=0.06`
- :math:`(1\cdot 4)(0.15)=0.60`

- :math:`(2\cdot 1)(0.02)=0.04`
- :math:`(2\cdot 2)(0.03)=0.12`
- :math:`(2\cdot 3)(0.10)=0.60`
- :math:`(2\cdot 4)(0.10)=0.80`

- :math:`(3\cdot 1)(0.25)=0.75`
- :math:`(3\cdot 2)(0.20)=1.20`
- :math:`(3\cdot 3)(0.05)=0.45`
- :math:`(3\cdot 4)(0.05)=0.60`

Add them:

.. math::

   \begin{aligned}
      E[XY] &= (0.01 + 0.04 + 0.06 + 0.60) \\
            &\quad + (0.04 + 0.12 + 0.60 + 0.80) \\
            &\quad + (0.75 + 1.20 + 0.45 + 0.60) \\
            &= 5.27
   \end{aligned}

Before computing the final covariance, it is helpful to see how each outcome pair
adds a positive or negative contribution.

.. raw:: html

   <iframe src="../_static/04_03_Dependence_Heatmap.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Step 4: Compute covariance
^^^^^^^^^^^^^^^^^^^^^^^^^^

Use:

.. math::

   \operatorname{cov}(X,Y) = E[XY] - \mu_X\mu_Y

Substitute values:

.. math::

   \operatorname{cov}(X,Y) = 5.27 - (2.35)(2.49)
                          = 5.27 - 5.8515
                          = -0.5815

Step 5: Interpret the result
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The covariance is negative.

This means:

- When the signal bars are higher than usual, response time tends to be lower than usual.
- When the signal bars are lower than usual, response time tends to be higher than usual.

So signal strength and response time move in opposite directions.

Visual Intuition
----------------

A simple point-cloud picture
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can read covariance from a point cloud:

- An upward trend suggests positive covariance.
- A downward trend suggests negative covariance.
- No clear trend suggests covariance near zero.

This idea is shown in Figure 04_02.

The “above/below average” picture
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Covariance compares values to their means.

- Above-average ``X`` means :math:`X > \mu_X`.
- Below-average ``X`` means :math:`X < \mu_X`.
- Above-average ``Y`` means :math:`Y > \mu_Y`.
- Below-average ``Y`` means :math:`Y < \mu_Y`.

If above-average ``X`` tends to come with below-average ``Y``, then covariance tends to be negative.
If above-average ``X`` tends to come with above-average ``Y``, then covariance tends to be positive.

Discussion and Common Errors
----------------------------

Zero covariance and independence
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- If ``X`` and ``Y`` are independent, covariance is zero.
- But covariance equal to zero does not always imply independence.
  It only tells you there is no strong linear together-pattern.

This is why it is useful to compare :math:`f_{XY}(x,y)` with :math:`f_X(x)f_Y(y)` as in Figure 04_04.

E[XY] versus E[X]E[Y]
^^^^^^^^^^^^^^^^^^^^^

- :math:`E[XY]` uses the **joint distribution**.
- :math:`E[X]E[Y]` uses only the **marginal distributions**.

These are equal when independence holds (or in special cases), but they are not equal in general.

Units and interpretation
^^^^^^^^^^^^^^^^^^^^^^^^

Covariance depends on measurement scale.

Example idea:

- If you change response time from seconds to milliseconds, the covariance magnitude changes.
- The sign still has the same meaning (same direction), but the number becomes larger.

Summary
-------

- Covariance measures how two random variables change together.
- It is defined by:

  .. math::

     \operatorname{cov}(X,Y) = E[(X-\mu_X)(Y-\mu_Y)]

- It can also be computed by:

  .. math::

     \operatorname{cov}(X,Y) = E[XY] - \mu_X\mu_Y

- Positive covariance: both tend to move in the same direction.
- Negative covariance: they tend to move in opposite directions.
- Independence implies zero covariance, but zero covariance does not guarantee independence.
