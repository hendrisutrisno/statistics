2. Sampling Distributions II: The Central Limit Theorem
======================================================

.. list-table:: Notations used in this module
   :class: compact-notation
   :widths: 65 35
   :header-rows: 1

   * - Meaning
     - Notation
   * - One observation (measurement)
     - :math:`X`
   * - Sample size (number of observations)
     - :math:`n`
   * - Sample mean (average of the sample)
     - :math:`\bar{X}`
   * - Population mean (true long-run average)
     - :math:`\mu`
   * - Population standard deviation
     - :math:`\sigma`
   * - Standard error of the sample mean
     - :math:`\sigma_{\bar{X}}=\sigma/\sqrt{n}`
   * - Standardized value (Z score)
     - :math:`Z=(\bar{X}-\mu)/(\sigma/\sqrt{n})`

2.1 Introduction
----------------

In Module 1, we introduced random sampling and the idea that statistics are random variables.
We used the standard error to describe the typical sampling-to-sampling variation of common statistics, especially the sample mean.
In this module, we move from “how variable is :math:`\bar{X}`?” to “what is the shape of the distribution of :math:`\bar{X}`?”, because shape is what we need for probability calculations.

We use a convenience-store counter to motivate the setting.
A single counter may handle checkout plus additional services such as coffee orders, bill payment, document printing, meal heating, or kiosk confirmation.
Most transactions are short, but some are much longer, so completion time is often right-skewed.

One observation is one customer transaction.
Let :math:`X` be the transaction completion time (minutes), defined by a fixed measurement rule:

- Start time: when the customer becomes the next person to be served at the counter
- End time: when payment is confirmed and the customer leaves the counter

This definition should be used consistently across shifts and observers.
If the measurement rule changes, then the recorded values do not represent the same variable, and comparisons across days become unreliable.

2.2 Learning Outcomes
---------------------

After this session, we should be able to:

- Define the sampling distribution of the sample mean
- State what the CLT guarantees, and what it does not guarantee
- Use the standard error :math:`\sigma/\sqrt{n}` to quantify typical variation of :math:`\bar{X}`
- Standardize the sample mean using a :math:`Z`-statistic
- Apply the CLT to approximate probabilities about averages
- Explain when a Normal approximation is reasonable in applied work

2.3 Main Concepts
-----------------

2.3.1 Sampling Distribution of the Sample Mean
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let :math:`X_1, X_2, \ldots, X_n` be a random sample from a population with mean :math:`\mu` and standard deviation :math:`\sigma`.
The sample mean is the statistic

.. math::

   \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i

The sampling distribution of :math:`\bar{X}` describes how :math:`\bar{X}` varies across repeated samples of the same size :math:`n`.
Its center and spread follow two key results:

.. math::

   E(\bar{X}) = \mu

.. math::

   \mathrm{Var}(\bar{X}) = \frac{\sigma^2}{n}

Therefore, the standard deviation of :math:`\bar{X}` is

.. math::

   \sigma_{\bar{X}} = \frac{\sigma}{\sqrt{n}}

We call :math:`\sigma_{\bar{X}}` the standard error of the sample mean.
It measures typical sampling-to-sampling variation of :math:`\bar{X}` under repeated sampling.
As :math:`n` increases, :math:`\sigma_{\bar{X}}` decreases, so averages become more stable.

In the convenience-store case, a manager may monitor the average transaction time during a lunch period.
That reported average is one realized value of :math:`\bar{X}`, based on a sample of transactions from that period.
The sampling distribution describes how that average would vary if we repeated the same sampling plan on many comparable days.

2.3.2 Exact Normal Case (a special baseline)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the population distribution of :math:`X` is Normal, then the sample mean is Normal for any sample size.
This result is exact:

.. math::

   X \sim \mathcal{N}(\mu, \sigma^2)
   \quad \Longrightarrow \quad
   \bar{X} \sim \mathcal{N}\!\left(\mu, \frac{\sigma^2}{n}\right)

This baseline is important because it provides a clean reference case where Normal probability calculations for :math:`\bar{X}` are always correct.
However, operational time variables (service times, transaction times, repair times) are often not Normal and are frequently right-skewed.
This motivates the need for an approximation result.

2.3.3 Central Limit Theorem (approximate Normality)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Central Limit Theorem (CLT) explains why the sampling distribution of :math:`\bar{X}` is often close to Normal even when the population is not Normal.
A practical version uses these assumptions:

- :math:`X_1, \ldots, X_n` are independent
- They share the same mean :math:`\mu`
- They have finite variance :math:`\sigma^2`

Under these conditions, the distribution of :math:`\bar{X}` becomes approximately Normal as :math:`n` increases.
The approximation has mean close to :math:`\mu` and variance close to :math:`\sigma^2/n`.
The word “approximately” is essential, because the accuracy depends on :math:`n` and on how skewed or heavy-tailed the population is.

Figure 1 illustrates the CLT using simulated transaction completion times from a right-skewed population.
The population is generated to represent “many short transactions and a few long transactions,” which is common in service operations.
A repetition means drawing a new random sample of size :math:`n` from this fixed population model and computing the sample mean :math:`\bar{X}`.

The dropdown changes :math:`n`, while the population mechanism is held fixed.
We compare the blue histogram (the sampling distribution of :math:`\bar{X}` across repetitions) to the gray Normal reference curve with mean :math:`\mu` and standard error :math:`\sigma/\sqrt{n}`.
As :math:`n` increases, the distribution of :math:`\bar{X}` becomes more symmetric and closer to the Normal reference.



Figure 1 illustrates this idea using simulated transaction-time data from a right-skewed population.
The data are simulated, but the mechanism is designed to represent “many short transactions and a few long transactions.”
A repetition means drawing a new random sample of :math:`n` transactions from the same population and recomputing :math:`\bar{X}`.

The figure holds the population fixed and changes only the sample size :math:`n`.
We compare the blue histogram (the simulated sampling distribution of :math:`\bar{X}`) to the gray Normal reference curve with mean :math:`\mu` and standard error :math:`\sigma/\sqrt{n}`.
The main comparison is across values of :math:`n`: as :math:`n` increases, the histogram becomes more symmetric and aligns more closely with the Normal reference.

.. raw:: html

   <iframe src="../_static/figures/stat2/02_01_clt_xbar_convergence.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.3.4 Standardization and the Z Statistic
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To use a Normal approximation consistently, we standardize the sample mean.
The standardized statistic is

.. math::

   Z = \frac{\bar{X} - \mu}{\sigma/\sqrt{n}}

The numerator :math:`\bar{X}-\mu` is the deviation of the sample mean from the population mean.
The denominator :math:`\sigma/\sqrt{n}` converts that deviation into standard-error units.
Under the CLT, :math:`Z` is approximately :math:`\mathcal{N}(0,1)` when :math:`n` is large enough for the approximation to be accurate.

Figure 2 shows this standardization using the same simulated right-skewed transaction-time process as Figure 1.
Each repetition produces a new sample mean :math:`\bar{X}`, which is then converted into a standardized value :math:`Z`.
The dropdown changes :math:`n`, and the x-axis range is fixed so that comparisons across :math:`n` are fair.

We compare the blue histogram (the sampling distribution of :math:`Z`) to the gray standard Normal reference curve.
For small :math:`n`, the standardized distribution can still show skewness and tail differences.
For larger :math:`n`, the histogram aligns more closely with :math:`\mathcal{N}(0,1)`, which supports the practical use of Normal probability calculations on the :math:`Z` scale.

.. raw:: html

   <iframe src="../_static/figures/stat2/02_02_clt_standardized_z.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.3.5 When Does the CLT Work Well in Practice?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In practice, we use the CLT to approximate probabilities about averages.
A common guideline is that the approximation improves as :math:`n` increases, and it improves faster when the population is not extremely skewed.
When :math:`n` is small and the population is strongly right-skewed, tail probabilities can be noticeably inaccurate.

The sampling mechanism also matters.
The CLT assumes independence, but operational data can violate independence when system conditions persist over time.
In a convenience-store setting, transactions during a rush period can be similar because the queue, cashier, and service mix remain stable for several minutes.
This can increase the true sampling variability of :math:`\bar{X}` beyond what :math:`\sigma/\sqrt{n}` suggests.

Figure 3 focuses on tail-probability accuracy, because many operational decisions are threshold-based.
The data are simulated under two population types with the same :math:`\mu` and :math:`\sigma`: one is strongly right-skewed (service-time-like) and one is Normal (a baseline where the Normal model is exact for :math:`\bar{X}`).
A repetition means drawing a new sample of size :math:`n`, computing :math:`\bar{X}`, and checking whether a threshold event occurs.

For each :math:`n`, we evaluate the event :math:`\bar{X} > \mu + 2(\sigma/\sqrt{n})`, which represents an “unusually high” average in standard-error units.
The orange trace reports the absolute difference between the simulated tail probability and the CLT-based approximation :math:`P(Z>2)`.
The gray baseline stays at zero because, when the population is Normal, the probability statement for :math:`\bar{X}` is exactly the same as :math:`P(Z>2)` for every :math:`n`.
The main comparison is how error changes with :math:`n`: the overall trend decreases, even if small :math:`n` values do not decrease perfectly monotonically.

.. raw:: html

   <iframe src="../_static/figures/stat2/02_03_clt_approximation_error.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

2.3.6 Example 2.1
^^^^^^^^^^^^^^^^^

A convenience store monitors transaction completion time :math:`X` (minutes) during a stable period.
Historical monitoring suggests that :math:`\mu = 1.24` minutes and :math:`\sigma = 0.99` minutes for individual transactions.
A supervisor samples :math:`n = 36` transactions from the lunch period and computes the sample mean :math:`\bar{X}`.

**Question:**
What is the approximate probability that the lunch-period average transaction time exceeds 1.50 minutes?

We want :math:`P(\bar{X} > 1.50)`.
By the CLT, :math:`\bar{X}` is approximately Normal with mean :math:`\mu` and standard error :math:`\sigma/\sqrt{n}`.
We first compute the standard error:

.. math::

   \sigma_{\bar{X}} = \frac{0.99}{\sqrt{36}} = \frac{0.99}{6} = 0.165

We standardize the threshold 1.50:

.. math::

   z = \frac{1.50 - 1.24}{0.165} \approx 1.58

Therefore,

.. math::

   P(\bar{X} > 1.50) \approx P(Z > 1.58) \approx 0.057

This probability is about 5--6\% under the Normal approximation.
In repeated lunch periods with the same stable process and the same sampling plan, an average above 1.50 minutes would be uncommon but not impossible.
If such events become frequent, it suggests a process change rather than random sampling variation.

2.3.7 Example 2.2
^^^^^^^^^^^^^^^^^

A manager wants to estimate the average transaction time during a rush period.
To save time, the manager samples :math:`n = 30` consecutive customers from 12:00 to 12:10 and reports the sample mean.
This procedure is operationally convenient, but it can change the statistical properties of the sampling distribution.

**Question:**
Why can consecutive sampling during a rush increase uncertainty in the sample mean?

During a rush, system conditions can persist.
For several minutes, the same cashier, queue length, and service mix can affect many consecutive customers in a similar way.
This creates dependence, meaning that transaction times can be positively correlated, and the effective information is smaller than :math:`n` independent observations.
As a result, the true sampling variability of :math:`\bar{X}` can be larger than :math:`\sigma/\sqrt{n}`, and probability calculations based on independence can underestimate risk.

2.4 Discussion and Common Errors
--------------------------------

1) Confusing the variability of :math:`X` with the variability of :math:`\bar{X}`.
   Individual transaction times can be highly variable, especially under right-skewness.
   The sample mean is less variable, and its typical variation is measured by :math:`\sigma/\sqrt{n}`.

2) Applying the CLT without stating and checking the sampling mechanism.
   Operational data can be dependent, especially when observations are collected consecutively in time during stable system conditions.
   When dependence is present, :math:`\sigma/\sqrt{n}` can be too small, and CLT-based probability calculations can be too optimistic.

3) Using a Normal approximation for extreme-tail decisions with small :math:`n` under strong skewness.
   Tail probabilities are often the last part of a distribution to be approximated well.
   If tail accuracy is important, larger samples or simulation-based validation should be considered.

2.5 Summary
-----------

- The sampling distribution of :math:`\bar{X}` describes how sample averages vary across repeated samples of size :math:`n`
- :math:`E(\bar{X})=\mu` and :math:`\mathrm{Var}(\bar{X})=\sigma^2/n`, so the standard error is :math:`\sigma/\sqrt{n}`
- If the population is Normal, then :math:`\bar{X}` is exactly Normal for any :math:`n`
- The CLT implies that :math:`\bar{X}` is approximately Normal for large :math:`n` under independence and finite variance
- Standardization via :math:`Z=(\bar{X}-\mu)/(\sigma/\sqrt{n})` supports Normal probability calculations on a common scale
- Skewness, dependence, and tail decisions can reduce approximation accuracy and require caution
