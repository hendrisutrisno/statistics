2. Sampling Dist III: Chi-Square, t, and F
====================================

2.0 Notation Table
------------------

.. list-table::
   :header-rows: 1
   :widths: 26 74

   * - Notation
     - Meaning
   * - :math:`n`
     - Sample size in a random sample
   * - :math:`X_1,\ldots,X_n`
     - Sample observations
   * - :math:`\mu,\ \sigma^2`
     - Population mean and variance (parameters)
   * - :math:`\bar{X}`
     - Sample mean :math:`\bar{X}=\frac{1}{n}\sum_{i=1}^n X_i`
   * - :math:`S^2`
     - Sample variance :math:`S^2=\frac{1}{n-1}\sum_{i=1}^n (X_i-\bar{X})^2`
   * - :math:`\chi^2_\nu`
     - Chi-square distribution with :math:`\nu` degrees of freedom
   * - :math:`t_\nu`
     - t distribution with :math:`\nu` degrees of freedom
   * - :math:`F_{\nu_1,\nu_2}`
     - F distribution with numerator and denominator degrees of freedom
   * - :math:`T`
     - t-statistic :math:`T=\frac{\bar{X}-\mu}{S/\sqrt{n}}`
   * - :math:`F`
     - Variance ratio statistic (ratio of two sample variances)

2.1 Introduction
----------------

In the previous sampling distribution sessions, we emphasized the sampling distribution of :math:`\bar{X}` and the role of the Central Limit Theorem for large :math:`n`.
In this session, the focus shifts to *finite-sample* distributions that become exact under a normal population model.

These distributions are central for inference when :math:`\sigma` is unknown and must be estimated from the same sample.
Because the exact results rely on normality, we also introduce quantile and probability plots as practical diagnostics for checking whether the normal model is reasonable.

2.2 Learning Outcomes
---------------------

After this section, you should be able to:

- State the chi-square sampling distribution associated with :math:`S^2` under normal sampling
- Explain degrees of freedom and why :math:`n-1` appears for sample variance
- Use the t distribution to standardize :math:`\bar{X}` when :math:`\sigma` is unknown
- Interpret the F distribution as a ratio of (scaled) sample variances
- Use quantile plots and normal Q–Q plots to diagnose departures from normality

2.3 Main Concepts
-----------------

2.3.1 Sampling Distribution of :math:`S^2` and the :math:`\chi^2` Distribution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When sampling from a normal population, the variability statistic :math:`S^2` has a tractable sampling distribution.
The key random variable is the scaled sum of squared deviations from the sample mean.

If :math:`X_1,\ldots,X_n` are a random sample from :math:`N(\mu,\sigma^2)`, then

.. math::

   \chi^2 = \frac{(n-1)S^2}{\sigma^2} \sim \chi^2_{n-1}

This result links a *sample statistic* (:math:`S^2`) to a *parameter* (:math:`\sigma^2`) through a known reference distribution.
The degrees of freedom :math:`n-1` reflects that one linear constraint is introduced when :math:`\bar{X}` is estimated from the same data.

Example 2.1
"""""""""""

A quality engineer monitors the variance of a filling process.
A sample of :math:`n=12` bottles is taken in one hour, and the sample variance is :math:`s^2=1.44` (in squared units).

**Question:** Is the claim :math:`\sigma^2=1.00` plausible at the 95% level under normal sampling?

Compute the test statistic:

.. math::

   \chi^2 = \frac{(n-1)s^2}{\sigma_0^2}

With :math:`n=12`, :math:`\chi^2 = 11(1.44)=15.84`.
At the 95% reference region, :math:`\chi^2_{0.025,11}\approx 3.816` and :math:`\chi^2_{0.975,11}\approx 21.920`, so :math:`15.84` falls inside the typical range.
Therefore, the observed sample variance is consistent with :math:`\sigma^2=1.00` under the normal model.

**Figure 2.1 — Sampling distribution of :math:`(n-1)S^2/\sigma^2` vs :math:`\chi^2`**

The figure is based on simulated normal data to isolate the theoretical sampling distribution without relying on a specific real dataset.
Here, “repetition” means repeating the same sampling procedure many times and recomputing :math:`S^2` each time to build the empirical distribution.

In this figure, :math:`n` is the sample size used inside each repeated sample.
You should compare the simulated histogram to the reference :math:`\chi^2` curve and observe how the distribution shifts and becomes more symmetric as :math:`n` increases.

.. raw:: html

   <iframe src="../_static/figures/stat2/sd_s2_chisq.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.3.2 The t Distribution for :math:`\bar{X}` When :math:`\sigma` Is Unknown
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When :math:`\sigma` is unknown, the standardization of the sample mean must use :math:`S` instead of :math:`\sigma`.
This replacement introduces additional uncertainty, which is captured by the t distribution rather than the standard normal.

If :math:`X_1,\ldots,X_n` are sampled from :math:`N(\mu,\sigma^2)`, then

.. math::

   T = \frac{\bar{X}-\mu}{S/\sqrt{n}} \sim t_{n-1}

The distribution depends on :math:`n-1` degrees of freedom because :math:`S` is estimated from the same sample.
As :math:`n` increases, the t distribution approaches the standard normal, reflecting that :math:`S` becomes a more stable estimator of :math:`\sigma`.

Example 2.2
"""""""""""

A service operation tracks the average handling time for a standardized request type.
A random sample of :math:`n=16` requests yields :math:`\bar{x}=102.4` seconds and :math:`s=6.8` seconds.

**Question:** What is a 95% confidence interval for :math:`\mu` under a normal sampling model?

Use the t critical value with :math:`n-1=15` degrees of freedom:

.. math::

   \bar{x} \pm t_{0.025,15}\frac{s}{\sqrt{n}}

With :math:`t_{0.025,15}\approx 2.131`, the margin is approximately :math:`2.131(6.8/4)=3.62`.
Therefore, the 95% CI is approximately :math:`(98.78,\ 106.02)` seconds, which quantifies estimation uncertainty when :math:`\sigma` is unknown.

**Figure 2.2 — Sampling distribution of :math:`T` vs the t reference curve**

The figure uses simulated normal samples so that the target distribution is known and controlled.
Here, “repetition” means repeatedly sampling :math:`n` observations, computing :math:`\bar{X}` and :math:`S`, and then forming :math:`T`.

In this figure, :math:`n` is the number of observations per repeated sample.
You should compare the simulated histogram to the t density and also compare the t density to the standard normal density to see the heavier tails at smaller degrees of freedom.

.. raw:: html

   <iframe src="../_static/figures/stat2/t_stat_sampling.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.3.3 The F Distribution and Ratios of Variances
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Many operational decisions require comparing variability across two processes, two machines, or two suppliers.
Under normal sampling, ratios of (scaled) sample variances follow an F distribution, which is the reference distribution for variance comparisons.

If two independent normal samples have sizes :math:`n_1` and :math:`n_2`, then

.. math::

   \frac{S_1^2/\sigma_1^2}{S_2^2/\sigma_2^2} \sim F_{n_1-1,\ n_2-1}

In the special case :math:`\sigma_1^2=\sigma_2^2`, the statistic :math:`S_1^2/S_2^2` itself follows an F distribution.
The order of degrees of freedom matters because the numerator and denominator roles are not symmetric.

Example 2.3
"""""""""""

Two production lines are evaluated for variability in a critical dimension.
Independent samples give :math:`n_1=12`, :math:`s_1^2=2.25` and :math:`n_2=10`, :math:`s_2^2=1.00`.

**Question:** At the 5% level (two-sided), do these data suggest unequal variances under normal sampling?

Form the ratio with the larger sample variance in the numerator:

.. math::

   F = \frac{s_1^2}{s_2^2}

Here, :math:`F=2.25` with degrees of freedom :math:`(11,9)`.
The two-sided 95% reference interval is approximately :math:`(0.279,\ 3.912)`, so :math:`2.25` is not in the extreme tails.
Therefore, the sample evidence does not indicate a statistically unusual variance ratio at the 5% level under the normal model.

**Figure 2.3 — Sampling distribution of a variance ratio vs the F reference curve**

The figure is constructed from simulated normal data to emphasize the reference behavior of the statistic under the modeling assumptions.
In this context, “repetition” means repeatedly drawing two independent samples with the stated :math:`n_1` and :math:`n_2` and recomputing the ratio of sample variances.

In this figure, :math:`n_1` and :math:`n_2` control the numerator and denominator degrees of freedom.
You should compare the simulated histogram to the F density and observe how the distribution becomes less skewed as the degrees of freedom increase.

.. raw:: html

   <iframe src="../_static/figures/stat2/f_ratio_sampling.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.3.4 Quantile and Probability Plots as Diagnostics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The exact :math:`\chi^2`, t, and F results are derived under a normal population model.
For this reason, practice often includes a diagnostic step to check whether normality is a reasonable approximation for the data at hand.

A quantile plot visualizes the empirical cumulative pattern of the sample by plotting ordered values against plotting positions (empirical fractions).
A normal Q–Q plot instead compares ordered values to theoretical normal quantiles, and an approximately straight-line pattern supports the normal model.

Example 2.4
"""""""""""

A logistics analyst models delivery delays using a normal distribution in order to apply a t-based interval for the mean.
A sample of :math:`n=40` delays is available, and the analyst creates a normal Q–Q plot.

**Question:** What plot behavior would raise concern about the normal assumption?

If the points deviate systematically from a straight line, the normal model may be inappropriate.
A common pattern is curvature where the upper tail bends upward, which is consistent with right-skewness and heavier-than-normal upper tails.

**Figure 2.4 — Quantile plot and normal Q–Q plot (normal vs right-skewed data)**

The figure uses simulated data so that the contrast between a normal sample and a right-skewed sample is controlled and easy to interpret.
In this figure, “repetition” is not used; instead, one fixed sample is displayed for each distribution to emphasize diagnostic shape rather than sampling variability.

Here, :math:`n` is the sample size used to form the ordered values and plotting positions.
You should compare the normal case (near-linear Q–Q pattern) to the right-skewed case (systematic curvature), and interpret curvature as evidence against the normal model for exact :math:`\chi^2`, t, and F procedures.

.. raw:: html

   <iframe src="../_static/figures/stat2/quantile_qq_diagnostics.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.4 Discussion and Common Errors
--------------------------------

These sampling distributions are exact only under random sampling from a normal population.
If the data are strongly non-normal, the t procedure for :math:`\mu` is often moderately robust, but chi-square and F procedures for variances can be sensitive, especially for small :math:`n`.

Degrees of freedom must match the statistic being used.
For :math:`S^2`, the standard definition uses :math:`n-1` in the denominator, and the associated chi-square degrees of freedom is also :math:`n-1`.

For F procedures, the numerator and denominator order affects the degrees of freedom and the tail area.
A standard operational practice is to place the larger sample variance in the numerator so that the test is conducted in the right tail and the interpretation is more direct.

For Q–Q plots, random scatter around a line is expected even under normality.
The diagnostic concern is not small noise, but a systematic pattern such as curvature, strong tail departures, or clustering that contradicts the assumed model.

2.5 Summary
-----------

The chi-square, t, and F distributions form a connected family of reference distributions for inference under normal sampling.
They provide exact sampling distributions for :math:`S^2`, for :math:`(\bar{X}-\mu)/(S/\sqrt{n})`, and for ratios of sample variances, respectively.

Quantile and probability plots are practical tools that connect modeling assumptions to observed data behavior.
They should be viewed as part of the workflow when variance-based inference is required and normality is uncertain.
