3. Sampling Distributions II: The Central Limit Theorem
=======================================================

3.1 Introduction
----------------

In practice, we often report averages.
Examples include average service time, average defect size, and average daily demand.
These averages are useful because they reduce noise from individual observations.

However, an average computed from a sample is still random.
If we repeat the same sampling plan, the sample mean changes from sample to sample.
So we need a probability model for the sample mean.

This session explains why the sample mean often behaves like a Normal random variable.
This is the role of the Central Limit Theorem (CLT).

3.2 Learning Outcomes
---------------------

After this session, we should be able to:

- Define the sampling distribution of the sample mean.
- State what the CLT guarantees, and what it does not guarantee.
- Use the standard error :math:`\sigma/\sqrt{n}` to quantify typical variation of :math:`\bar{X}`.
- Standardize the sample mean using a :math:`Z`-statistic.
- Apply the CLT to approximate probabilities about averages.
- Explain when a Normal approximation is reasonable in applied work.

3.3 Connection to Previous Ideas
--------------------------------

In the previous session, we treated statistics as random variables.
In particular, the sample mean :math:`\bar{X}` has its own distribution.

We also introduced the standard error as a “typical error” size.
For :math:`\bar{X}`, the standard error is controlled by :math:`n`.
As :math:`n` increases, we expect the sampling distribution of :math:`\bar{X}` to tighten.

3.4 Core Sections
-----------------

3.4.1 Sampling Distribution of the Sample Mean
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let :math:`X_1, X_2, \ldots, X_n` be a random sample from a population with:

- mean :math:`\mu` (parameter (population quantity))
- standard deviation :math:`\sigma`

The sample mean is the statistic

.. math::

   \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i.

Key facts:

- :math:`E(\bar{X}) = \mu`. (Note: the sample mean targets the population mean.)
- :math:`\mathrm{Var}(\bar{X}) = \sigma^2/n`.
- The standard deviation of :math:`\bar{X}` is

.. math::

   \sigma_{\bar{X}} = \frac{\sigma}{\sqrt{n}}.

We call :math:`\sigma/\sqrt{n}` the standard error of the mean.
It describes typical sampling-to-sampling variation in :math:`\bar{X}`.

3.4.2 Exact Normal Case (a special baseline)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the population distribution of :math:`X` is Normal, then :math:`\bar{X}` is Normal for any :math:`n`.

.. math::

   X \sim \mathcal{N}(\mu, \sigma^2)
   \quad \Longrightarrow \quad
   \bar{X} \sim \mathcal{N}\!\left(\mu, \frac{\sigma^2}{n}\right).

This case is important because it gives a clean reference.
But many operational variables (waiting times, repair times, demand bursts) are not Normal.

3.4.3 The Central Limit Theorem (approximate Normality)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The CLT explains why :math:`\bar{X}` is often approximately Normal even when :math:`X` is not Normal.

Assumptions (practical version):

- :math:`X_1, \ldots, X_n` are independent.
- They share the same mean :math:`\mu` and finite variance :math:`\sigma^2`.

Conclusion:

- For large :math:`n`, the distribution of :math:`\bar{X}` is approximately Normal with mean :math:`\mu`
  and variance :math:`\sigma^2/n`.

A key message is “approximately.”
The CLT is a limiting result.
Accuracy improves as :math:`n` grows, and depends on how skewed or heavy-tailed the population is.

Figure 1 shows the main visual logic of the CLT.

Figure 1 narrative:
We model an operational time-to-complete metric :math:`X` (in minutes) using a right-skewed distribution.
This is realistic for service or processing times, where very long delays occur occasionally.
The figure holds the population distribution fixed and changes only the sample size :math:`n`.
The blue histogram shows simulated values of :math:`\bar{X}` from repeated sampling, while the gray curve is a Normal reference with mean :math:`\mu` and standard deviation :math:`\sigma/\sqrt{n}`.
We read the x-axis as the average time and the y-axis as density (relative frequency on a continuous scale).
As :math:`n` increases, the histogram becomes smoother, more symmetric, and closer to the Normal reference.

.. raw:: html

   <iframe src="../_static/figures/stat2/03_01_clt_xbar_convergence.html" scrolling="no" style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;"> </iframe>

3.4.4 Standardization and the Z Statistic
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To use Normal tables or software consistently, we standardize.
For the sample mean, the standardized variable is

.. math::

   Z = \frac{\bar{X} - \mu}{\sigma/\sqrt{n}}.

Interpretation:

- The numerator :math:`\bar{X} - \mu` is the deviation of the sample mean from the target mean.
- The denominator :math:`\sigma/\sqrt{n}` rescales that deviation into “standard error units.”
- Under the CLT, :math:`Z` is approximately :math:`\mathcal{N}(0,1)` for large :math:`n`.

This is the main bridge from a real operational metric (minutes, grams, dollars)
to a standard probability scale.

Figure 2 makes the standardization idea concrete.

Figure 2 narrative:
We use the same underlying right-skewed process as in Figure 1, but we now convert each repeated-sample mean into a standardized value :math:`Z`.
The blue histogram is the sampling distribution of the standardized mean :math:`Z = (\bar{X}-\mu)/(\sigma/\sqrt{n})`.
The smooth gray curve is the standard Normal reference :math:`\mathcal{N}(0,1)`, which is the target shape implied by the CLT.
The dropdown changes :math:`n`, while the x-axis range is held fixed, so we can compare shapes fairly.
When :math:`n` is small, the histogram can be skewed and the tails can differ from the gray curve; when :math:`n` is larger, the blue histogram aligns more closely with the reference curve.

.. raw:: html

   <iframe src="../_static/figures/stat2/03_02_clt_standardized_z.html" scrolling="no" style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;"> </iframe>

3.4.5 When does the CLT work well?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We need a practical decision rule.
A common guideline is:

- If :math:`n \ge 30`, the Normal approximation for :math:`\bar{X}` is often good when the population is not extremely skewed.
- If :math:`n < 30`, the approximation may still be good if the population is close to Normal (roughly symmetric and unimodal).

What can break the approximation?

- Strong skewness with small :math:`n` can distort tail probabilities.
- Heavy tails can require larger :math:`n` for stable tail behavior.
- Dependence (non-independent sampling) can invalidate the usual :math:`\sigma/\sqrt{n}` scaling.

Figure 3 focuses on probability error, because many decisions are threshold-based.

Figure 3 narrative:
We compare a skewed population (lognormal-like process time) against a Normal population with the same :math:`\mu` and :math:`\sigma`.
For each sample size :math:`n`, we consider a fixed tail event: :math:`\bar{X} > \mu + 2(\sigma/\sqrt{n})`, which represents an “unusually high average” in standard error units.
The orange trace shows the absolute difference between the simulated tail probability (computed by repeated sampling) and the CLT-based Normal approximation :math:`P(Z>2)`.
The gray trace at (near) zero represents the Normal-population baseline, where the Normal model for :math:`\bar{X}` is exact for every :math:`n`.
We read the x-axis as sample size and the y-axis as approximation error; the main pattern is that error decreases as :math:`n` increases, but it can be non-negligible for small :math:`n` under strong skewness.

.. raw:: html

   <iframe src="../_static/figures/stat2/03_03_clt_approximation_error.html" scrolling="no" style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;"> </iframe>

3.5 Worked Example
------------------

3.5.1 Description
^^^^^^^^^^^^^^^^^

A warehouse tracks the order picking time :math:`X` (minutes) for a specific product category.
Historical monitoring suggests:

- population mean :math:`\mu = 9.8` minutes
- population standard deviation :math:`\sigma = 8.5` minutes

The distribution of individual picking times is right-skewed.
A supervisor samples :math:`n = 36` orders from a shift and computes the sample mean :math:`\bar{X}`.

3.5.2 Question
^^^^^^^^^^^^^^

What is the approximate probability that the shift's average picking time exceeds 12 minutes?

3.5.3 Analysis
^^^^^^^^^^^^^^

We want :math:`P(\bar{X} > 12)`.
By the CLT, :math:`\bar{X}` is approximately Normal with mean :math:`\mu` and standard error :math:`\sigma/\sqrt{n}`.

.. math::

   \sigma_{\bar{X}} = \frac{8.5}{\sqrt{36}} = \frac{8.5}{6} \approx 1.4167.

We standardize the threshold 12:

.. math::

   z = \frac{12 - 9.8}{1.4167} \approx \frac{2.2}{1.4167} \approx 1.55.

So

.. math::

   P(\bar{X} > 12) \approx P(Z > 1.55) \approx 0.061.

(Note: we are measuring “how many standard errors above :math:`\mu`” the observed average is, then using the standard Normal tail area.)

Practical interpretation:
In repeated shifts of the same design (same sampling plan and stable process),
we would expect an average above 12 minutes in about 6% of shifts.
If this event becomes frequent, it can indicate a process change rather than random variation.

3.6 Intuition
-------------

3.6.1 Averaging cancels irregularity
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When we average :math:`n` observations, positive and negative deviations partly offset.
Even if :math:`X` is skewed, the sum of many independent contributions tends to look more symmetric.

The rate of improvement is not linear in :math:`n`.
The standard error shrinks like :math:`1/\sqrt{n}`.
So doubling :math:`n` does not halve uncertainty; it reduces it by a factor of :math:`1/\sqrt{2}`.

3.6.2 Standard error is a “units conversion”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The quantity :math:`\sigma/\sqrt{n}` converts deviations of :math:`\bar{X}` into a comparable scale.
A deviation of 2 standard errors is meaningfully “large” regardless of the original unit (minutes, grams, dollars).
This is why the standardized statistic :math:`Z` is central in inference.

3.7 Discussion and Common Errors
--------------------------------

1) Treating :math:`\bar{X}` as if it had the same spread as :math:`X`.
   What goes wrong: we forget the :math:`\sqrt{n}` in the denominator and overstate variability.
   How to avoid: always write :math:`\sigma_{\bar{X}} = \sigma/\sqrt{n}` before computing probabilities.

2) Applying the CLT without a random sample assumption.
   What goes wrong: dependence or selection bias can distort the sampling distribution and invalidate the Normal approximation.
   How to avoid: check that the data collection mechanism is close to independent sampling from a stable process.

3) Using the CLT in extreme-tail decisions with small :math:`n` and strong skewness.
   What goes wrong: tail probabilities are the last part of the distribution to become well-approximated.
   How to avoid: increase :math:`n`, consider a variance-stabilizing transform, or use simulation to validate the approximation.

3.8 Summary
-----------

- The sampling distribution of :math:`\bar{X}` describes how sample averages vary across repeated samples.
- :math:`E(\bar{X}) = \mu` and :math:`\mathrm{Var}(\bar{X}) = \sigma^2/n`, so the standard error is :math:`\sigma/\sqrt{n}`.
- If the population is Normal, then :math:`\bar{X}` is exactly Normal for any :math:`n`.
- The CLT says :math:`\bar{X}` is approximately Normal for large :math:`n` when the population has finite variance.
- Standardization via :math:`Z = (\bar{X}-\mu)/(\sigma/\sqrt{n})` connects real units to the standard Normal scale.
- Approximation quality improves with :math:`n`, but skewness and tail decisions require extra caution.
