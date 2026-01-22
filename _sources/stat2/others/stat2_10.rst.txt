10. Single-Sample Intervals When Variability Is Unknown
=======================================================

Introduction
------------

In the previous session, we built confidence intervals for a population mean using :math:`z`.
That method is clean, but it has a weak point.
It assumes we know the population spread :math:`\sigma`, or that the sample is large enough that using :math:`s` makes little difference.

Today we move to the realistic case.
In most quality and operations work, :math:`\sigma` is unknown.
We estimate it from the same sample that we use to estimate :math:`\mu`.
This adds uncertainty.
The key idea of the session is simple: when spread is unknown, our interval must become more cautious.

Learning Outcomes
-----------------

After this session, you should be able to:

- Explain why estimating :math:`\sigma` changes the sampling distribution of the standardized mean.
- Use the t-distribution to build a confidence interval for :math:`\mu` (single sample).
- Use the chi-square distribution to build a confidence interval for :math:`\sigma^2` and :math:`\sigma` (Normal model).
- Recognize where the F-distribution comes from and what question it helps answer.
- Choose between confidence, prediction, and tolerance intervals for practical questions.

Purpose and Use Cases
---------------------

These methods support decisions in settings such as:

- Estimating a process mean from a small audit sample (fill volume, cycle time, service time).
- Reporting uncertainty for process variability when doing stability or capability discussions.
- Estimating a defect rate from inspection data as a proportion.
- Communicating uncertainty to managers using a range, not a single number.
- Matching the interval type to the question (parameter, next unit, or population coverage).

Core Concept and Notation
-------------------------

We have one sample:

- :math:`X_1, X_2, \ldots, X_n` are i.i.d. observations from one stable process.
- :math:`\mu` is the population mean (unknown).
- :math:`\sigma` is the population standard deviation (unknown).
- :math:`\bar{X}` is the sample mean.
- :math:`s` is the sample standard deviation.
- :math:`\alpha` is the risk level, so confidence level is :math:`1-\alpha`.

A useful mental reminder:

- :math:`\bar{X}` estimates location (center).
- :math:`s` estimates spread (variability).
- If both are estimated from the same small sample, the final uncertainty increases.

Key Distributions Behind Single-Sample Intervals
------------------------------------------------

Why we need a “distribution toolkit”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Intervals are built from sampling distributions.
A sampling distribution describes how a statistic changes from sample to sample.
This matters because interval endpoints are computed from statistics like :math:`\bar{X}` and :math:`s`.
If the sampling distribution changes, the correct critical value changes.

Sampling distribution of the sample variance :math:`S^2`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When the population is Normal, the sample variance has a clean distribution.
It is not symmetric, especially when :math:`n` is small.
The key result is:

.. math::

   \frac{(n-1)S^2}{\sigma^2} \sim \chi^2_{n-1}

This one line explains why variance intervals use chi-square cutoffs.
It also explains why variance intervals often look “uneven” around :math:`s^2`.
The figure below shows a chi-square density and highlights the two tail regions.
It is generated data.
The goal is to see how skewness creates different left and right tail cutoffs.
Read it as: the two tails define rare outcomes, and the remaining probability defines the accepted middle region.

.. raw:: html

   <iframe src="../_static/09_03_chi_square_critical_regions.html"
   scrolling="no"
   style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

From “unknown :math:`\sigma`” to the t-distribution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If :math:`\sigma` were known, we would standardize the mean as:

.. math::

   Z = \frac{\bar{X}-\mu}{\sigma/\sqrt{n}}

But when :math:`\sigma` is unknown, we replace it with :math:`s`.
That replacement injects randomness into the denominator.
The correct standardized statistic becomes:

.. math::

   T = \frac{\bar{X}-\mu}{s/\sqrt{n}}

Under a Normal model, :math:`T` follows a **t-distribution** with :math:`n-1` degrees of freedom.

The next figure compares t curves to the standard Normal curve.
It is generated data.
The purpose is to show what “extra uncertainty” looks like.
Read it as: smaller degrees of freedom means heavier tails.
Heavier tails mean we need a larger cutoff for the same confidence.

.. raw:: html

   <iframe src="../_static/09_01_t_vs_normal_dropdown.html"
   scrolling="no"
   style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

Where the F-distribution comes from (and why it matters later)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The F-distribution appears when we compare two estimated variances.
Under Normal models, each scaled sample variance follows chi-square.
A ratio of two independent chi-square quantities (each divided by its degrees of freedom) yields an F distribution.

A practical interpretation:

- Chi-square supports inference on one variance.
- F supports inference on a ratio of two variances.

This becomes important in later topics such as comparing process spreads and analysis of variance (ANOVA).
In this session, the main value is conceptual: variance has its own sampling distribution, and ratios of variances have another.

Building Practical Intervals
----------------------------

Confidence interval for the mean :math:`\mu` when :math:`\sigma` is unknown
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A two-sided :math:`100(1-\alpha)\%` confidence interval for :math:`\mu` is:

.. math::

   \bar{x} \pm t_{\alpha/2,\,n-1}\,\frac{s}{\sqrt{n}}

Meaning:

- :math:`\bar{x}` is the center of the interval.
- :math:`s/\sqrt{n}` is the standard error (typical fluctuation of :math:`\bar{X}`).
- :math:`t_{\alpha/2, n-1}` expands the interval to account for estimating :math:`\sigma`.

Confidence interval for :math:`\sigma^2` and :math:`\sigma` (Normal model)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Using the chi-square result, a :math:`100(1-\alpha)\%` confidence interval for :math:`\sigma^2` is:

.. math::

   \frac{(n-1)s^2}{\chi^2_{1-\alpha/2,\,n-1}}
   \le \sigma^2 \le
   \frac{(n-1)s^2}{\chi^2_{\alpha/2,\,n-1}}

A confidence interval for :math:`\sigma` is obtained by taking square roots of the endpoints.

Important practical note:
This method relies strongly on the Normal assumption.
If the data have strong skewness or heavy tails, the interval can be misleading.

Large-sample confidence interval for a population proportion :math:`p`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If :math:`X` is the number of “successes” in :math:`n` trials, then :math:`\hat{p} = X/n`.
A large-sample approximate :math:`100(1-\alpha)\%` confidence interval for :math:`p` is:

.. math::

   \hat{p} \pm z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}

Use this only when the sample is large enough for the approximation.
A common rule is that both :math:`n\hat{p}` and :math:`n(1-\hat{p})` should not be small.

Beyond “parameter intervals”: prediction and tolerance intervals
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It is common to ask a different question than “what is :math:`\mu`?”
Two important alternatives are:

- “What range will the next unit fall into?”
- “What range contains most of the population output?”

A prediction interval targets a future observation :math:`X_{new}`.
For a Normal model with unknown :math:`\sigma`, a common form is:

.. math::

   \bar{x} \pm t_{\alpha/2,\,n-1}\,s\sqrt{1+\frac{1}{n}}

A tolerance interval targets population coverage.
A common two-sided form is:

.. math::

   \bar{x} \pm k s

Here :math:`k` is chosen to guarantee a stated coverage (for example, 95% of the population) with a stated confidence.
This is not the same as a confidence interval for :math:`\mu`.

Assumption Checks and Simple Diagnostic Plots
---------------------------------------------

Why diagnostics matter
^^^^^^^^^^^^^^^^^^^^^

Interval formulas can be correct and still fail in practice if assumptions are wrong.
For t and chi-square intervals, the Normal model matters most when :math:`n` is small.
So we need a quick way to check whether Normality is plausible.

Quantile and probability plots (Normal Q-Q idea)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A probability plot compares ordered data values to what a Normal model would predict.
If points are close to a straight line, Normality is plausible.
If points bend strongly or show extreme outliers, Normality is questionable.

Use these plots as a decision aid:

- If Normality looks reasonable, t and chi-square intervals are usually fine.
- If Normality looks poor, consider transformations or resampling methods like bootstrap (with careful interpretation).

Worked Example
--------------

Description
^^^^^^^^^^^

A beverage filling process is stable.
Each bottle's fill volume (mL) is approximately Normal.
You take a small sample of :math:`n = 12` bottles from one shift.

Sample results:

- :math:`\bar{x} = 502.4` mL
- :math:`s = 3.6` mL

You want a 95% confidence interval for the true mean fill volume :math:`\mu`.

Question
^^^^^^^^

Construct a 95% confidence interval for :math:`\mu` using the t method.

Analysis
^^^^^^^^

We use the t interval because :math:`\sigma` is unknown and :math:`n` is small.

.. math::

   \bar{x} \pm t_{\alpha/2,\,n-1}\,\frac{s}{\sqrt{n}}

Here:

- :math:`\alpha = 0.05`
- degrees of freedom :math:`n-1 = 11`
- :math:`t_{0.025, 11} \approx 2.201`

Compute the standard error:

.. math::

   \frac{s}{\sqrt{n}} = \frac{3.6}{\sqrt{12}} \approx \frac{3.6}{3.464} \approx 1.039

Margin of error:

.. math::

   2.201 \times 1.039 \approx 2.286

Confidence interval:

.. math::

   502.4 \pm 2.286 \;\Rightarrow\; [500.11,\; 504.69]

(Note: the interval is wider than a z-interval because :math:`s` is estimated from the same small sample.)

Intuition
---------

Mental model 1: “one sample does two jobs”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The sample estimates the center using :math:`\bar{x}`.
The same sample estimates the spread using :math:`s`.
When :math:`n` is small, :math:`s` can fluctuate a lot.
The t critical value adds protection against that extra fluctuation.

Mental model 2: “interval methods control the long-run miss rate”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A confidence interval is produced from random data.
So the interval itself is random across repeated sampling.
A 95% method does not guarantee every interval covers :math:`\mu`.
It guarantees the long-run coverage rate is about 95% when assumptions hold.

The figure below simulates repeated t-intervals from generated Normal data with true :math:`\mu = 0`.
It shows which intervals cover the true mean and which intervals miss.
This helps you see the meaning of the confidence level in repeated use.
Read it as: most intervals cover, but some miss, and the miss rate is controlled.

.. raw:: html

   <iframe src="../_static/09_02_ci_coverage_simulation_t.html"
   scrolling="no"
   style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

Discussion and Common Errors
----------------------------

Error 1: Using a z-interval when :math:`\sigma` is unknown and :math:`n` is small.
What goes wrong: the interval is too narrow, so you overstate certainty.
How to avoid: default to t for single-sample mean intervals unless :math:`\sigma` is truly known.

Error 2: Treating a 95% confidence interval as a 95% probability statement about :math:`\mu`.
What goes wrong: it confuses a long-run frequency with a single-case probability.
How to avoid: say “this method covers :math:`\mu` 95% of the time under repeated sampling.”

Error 3: Using the chi-square variance interval when Normality is not plausible.
What goes wrong: the interval can be badly distorted because the variance distribution depends on Normality.
How to avoid: check the shape using a probability plot and watch for strong outliers.

Error 4: Using the wrong interval type for the business question.
What goes wrong: you report a confidence interval for :math:`\mu` when the decision needs a range for the next unit.
How to avoid: write the target sentence first (parameter vs next observation vs population coverage).

Summary
-------

- When :math:`\sigma` is unknown, estimating spread adds uncertainty, especially for small :math:`n`.
- The standardized mean uses :math:`s` and follows a t distribution with :math:`n-1` degrees of freedom under Normality.
- A t confidence interval for :math:`\mu` is :math:`\bar{x} \pm t_{\alpha/2, n-1}\,s/\sqrt{n}`.
- The sampling distribution of :math:`S^2` leads to chi-square confidence intervals for :math:`\sigma^2` and :math:`\sigma`.
- Proportion intervals use large-sample Normal approximations and need adequate counts.
- F distributions arise from ratios of variances and become central in later comparisons and ANOVA.
- Confidence, prediction, and tolerance intervals answer different questions and should not be mixed.

