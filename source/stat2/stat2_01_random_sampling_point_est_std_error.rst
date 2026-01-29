.. _sec_01_01_sampling_dist_I_one_sample:

1. Sampling Distributions I: Random Sampling, Point Estimation, and Standard Error
=================================================================================

1.1 Introduction
----------------

Statistical inference uses a sample to learn about a larger population or process.
A single sample result is limited unless we understand how it could change under repetition.

For this reason, common summaries (statistics) are treated as random variables.
They are produced by a sampling procedure, so they can vary even when the population stays stable.

This module links three ideas:

- Population and sample, which separate what we want to learn from what we can observe.
  This distinction is the starting point for all inference.

- Point estimation, which uses a single-number statistic to estimate a parameter.
  The estimate is simple to report, but it does not describe uncertainty by itself.

- Sampling distributions and standard error, which describe repeated-sample variation.
  They provide a formal meaning for “typical fluctuation” due to sampling.

To keep the discussion concrete, we also use a running illustration of transaction completion time at a convenience-store counter.
Some transactions are simple and fast, while others include extra services and take longer.
This mix often produces a right-skewed time distribution.

1.2 Learning Outcomes
---------------------

After this module, we should be able to:

- Define population and sample in a probability model.
  We should also explain how a measurement process can represent a population.

- State the i.i.d. assumptions (identically distributed and independent).
  We should also explain how these assumptions affect sampling distributions.

- Distinguish a parameter from a statistic.
  We should also explain why uncertainty is attached to statistics, not to parameters.

- Define point estimation as a statistic used to estimate a parameter.
  We should also interpret a point estimate as random before sampling.

- Explain the sampling perspective and the meaning of a sampling distribution.
  We should also describe how repeated sampling defines uncertainty.

- Interpret standard error as typical sampling fluctuation.
  We should also explain how standard error depends on sample size :math:`n`.

- Compute standard errors for :math:`\bar{X}` and :math:`\hat{p}` in standard settings.
  We should also interpret these results in applied contexts.

1.3 Population, Sample, and Variables
-------------------------------------

1.3.1 Population and parameter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A population is the full set of outcomes that could occur under a measurement process.
In many applications, a population is not a finite list that can be written down.

Instead, a population represents the long-run behavior of a stable process or the full target group of interest.
A parameter is a numerical description of that population or process.

A parameter is fixed in the model but unknown in practice.
Common parameters include :math:`\mu` (mean), :math:`\sigma` (standard deviation), and :math:`p` (proportion).

Example 1.1: Left-Handedness
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Consider a target group, such as all students in a university system in one academic year.
For each person, define a binary variable :math:`Y` with :math:`Y=1` for left-handed and :math:`Y=0` otherwise.

A study selects a sample and records :math:`Y` for each sampled person.
The goal is to learn about left-handedness in the target group.

**Question:** In this study, what is the population?

The population is the full target group that the study aims to describe.
It is the set of all individuals who could have been selected under the stated sampling rule, using the same definition of left-handedness.

In this setting, a key population parameter is the left-handed proportion

:math:`p = P(Y=1)`

The parameter :math:`p` is fixed in the model but unknown in practice.
Sampling is needed because the population is not fully observed.

1.3.2 Sample and statistic
^^^^^^^^^^^^^^^^^^^^^^^^^^

A sample is the set of observed outcomes collected from the population.
Because only part of the population is observed, we use statistics to summarize what we see.

A statistic is any function of the sample values.
If a different sample were selected, the statistic could change, so it is random before sampling.

Common statistics include :math:`\bar{X}` (sample mean), :math:`S^2` (sample variance), and :math:`\hat{p}` (sample proportion).
These statistics are central objects in later inference procedures.

Example 1.2: Left-Handedness
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Continue Example 1.1.
The population is all students in the university system in one academic year, and :math:`Y` is the left-handed indicator.

In practice, it is not feasible to observe :math:`Y` for every student.
Instead, the study selects a subset and observes :math:`Y` only for that subset.

**Question:** In this study, what is the sample, and what statistic estimates :math:`p`?

The sample is the collection of observed outcomes

.. math::

   Y_1, Y_2, \ldots, Y_n

A common statistic for estimating :math:`p` is the sample proportion

.. math::

   \hat{p} = \frac{1}{n}\sum_{i=1}^{n} Y_i

The statistic :math:`\hat{p}` is the observed fraction of left-handed students in the sample.
The parameter :math:`p` stays fixed, while :math:`\hat{p}` can vary across repeated samples.

1.3.3 Defining the measurement variable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Statistical symbols have meaning only when the measurement is defined.
A good definition states the unit and the measurement rule.

For transaction completion time, one operational definition is:
Start time is when a customer becomes the next person to be served at the counter.
End time is when payment is confirmed and the customer leaves the counter.

If different observers use different rules, the data may not represent the same variable.
This is a measurement reliability issue, and it can affect inference.

1.4 Random Sampling as a Probability Model
------------------------------------------

A random sample is produced by repeating the same measurement under essentially the same conditions.
The key requirement is that outcomes are independent and generated from the same population distribution.

Let :math:`X` represent one measurement from the population.
A random sample of size :math:`n` is written as :math:`X_1, X_2, \ldots, X_n`.

The i.i.d. model states two assumptions:

- Identically distributed: each :math:`X_i` follows the same distribution.
  This means each observation targets the same population.

- Independent: one outcome does not change the distribution of another.
  This means information accumulates cleanly as :math:`n` increases.

Under the i.i.d. model, the joint probability model factors as

.. math::

   f(x_1, x_2, \ldots, x_n) = \prod_{i=1}^{n} f(x_i)

This factorization is the mathematical meaning of random sampling.
It is also the reason many standard error formulas have simple closed forms.

Note on independence
^^^^^^^^^^^^^^^^^^^^

Independence can fail when observations are collected in clusters rather than spread across the target group.
For example, if many sampled students come from the same class, club, or dormitory floor, their outcomes can be more similar.

When dependence is present, the sample contains less effective information than its size suggests.
As a result, the sampling distribution of statistics such as :math:`\hat{p}` can be wider than the i.i.d. model predicts.

1.5 Parameters, Statistics, and Point Estimation
------------------------------------------------

1.5.1 Parameter versus statistic
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Inference uses two types of quantities.
This separation determines how uncertainty is defined.

- A parameter describes the population or process.
  It is fixed in the model but unknown in practice.

- A statistic is computed from a sample.
  It is random before sampling because the sample itself is random.

Uncertainty in inference is not about the parameter changing.
Uncertainty comes from the fact that the statistic would change if sampling were repeated.

Example 1.3: Left-Handed Count and Proportion
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Consider a population of :math:`N` people.
Let :math:`M` be the number of left-handed people in the population, and :math:`M` is fixed at a given time.

A common population parameter is the proportion of left-handed people

.. math::

   p = \frac{M}{N}

Now take a sample of :math:`n=100` people and record handedness.
Let :math:`Y_i=1` if sampled person :math:`i` is left-handed and :math:`Y_i=0` otherwise.

Let :math:`T` be the number of left-handed people observed in the sample

.. math::

   T = \sum_{i=1}^{n} Y_i

The sample proportion is the statistic

.. math::

   \hat{p} = \frac{T}{n} = \frac{1}{n}\sum_{i=1}^{n} Y_i

**Question:** Which quantities are parameters, and which are statistics?

The population quantities :math:`M` and :math:`p` are parameters, so they are fixed for the population at a given time.
The sample quantities :math:`T` and :math:`\hat{p}` are statistics, so they can vary across repeated samples.

1.5.2 Point estimation
^^^^^^^^^^^^^^^^^^^^^^

A point estimate is a single-number estimate of a parameter.
The estimate is a statistic, so it is random before sampling.

Common examples include :math:`\bar{X}` as an estimate of :math:`\mu`, :math:`S^2` as an estimate of :math:`\sigma^2`, and :math:`\hat{p}` as an estimate of :math:`p`.
Point estimates are compact and easy to communicate, but they do not describe uncertainty on their own.

Uncertainty is described by the sampling distribution of the estimator.
Standard error summarizes the typical spread of the estimator under repeated sampling.

1.6 Core Statistics as Random Variables
---------------------------------------

1.6.1 Sample mean
^^^^^^^^^^^^^^^^^

The sample mean is

.. math::

   \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i

The statistic :math:`\bar{X}` estimates the population mean :math:`\mu`.
The difference :math:`\bar{X}-\mu` is sampling fluctuation under repeated sampling.

.. _sec_01_01_sample_variance:

1.6.2 Sample variance
^^^^^^^^^^^^^^^^^^^^^

The sample variance is

.. math::

   S^2 = \frac{1}{n-1}\sum_{i=1}^{n}\left(X_i-\bar{X}\right)^2

The statistic :math:`S^2` estimates the population variance :math:`\sigma^2`.
When :math:`n` is small, :math:`S^2` can vary substantially across repeated samples.

.. seealso::

   Understand more: :ref:`sec_variance_n_minus_one`

1.6.3 Sample proportion
^^^^^^^^^^^^^^^^^^^^^^^

Many inference questions concern an event rate.
For each observation :math:`i`, define an indicator :math:`Y_i` with :math:`Y_i=1` if the event occurs and :math:`Y_i=0` otherwise.

The sample proportion is

.. math::

   \hat{p} = \frac{1}{n}\sum_{i=1}^{n} Y_i

The statistic :math:`\hat{p}` estimates the population proportion :math:`p`.
It is random before sampling because the set of sampled units can change.

1.7 Standard Error
------------------

The standard error of a statistic is the standard deviation of its sampling distribution.
It measures typical sampling fluctuation around the target parameter.

Standard error is defined by the sampling model, even if only one sample is observed.
It is the key quantity for describing precision of point estimates.

It is also important to separate two questions.
A larger sample size :math:`n` makes an estimator more stable within one study, which reduces standard error.
Repeating the same study many times is a conceptual device that defines the sampling distribution and justifies probability statements.

1.7.1 Standard error of the sample mean
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Assume an i.i.d. sample :math:`X_1,\dots,X_n` with mean :math:`\mu` and variance :math:`\sigma^2`

.. math::

   E(\bar{X})=\mu

.. math::

   \mathrm{Var}(\bar{X})=\frac{\sigma^2}{n}

.. math::

   \mathrm{SE}(\bar{X})=\frac{\sigma}{\sqrt{n}}

The standard error decreases as :math:`n` increases, so averages become more stable across repeated samples.
This does not require knowing the full population distribution, but it requires a stable target population and a valid sampling model.

In practice, :math:`\sigma` is often unknown, so it is replaced by the sample standard deviation :math:`s`

.. math::

   \widehat{\mathrm{SE}}(\bar{X})=\frac{s}{\sqrt{n}}

1.7.2 Standard error of the sample proportion
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Assume a Bernoulli outcome :math:`Y` with :math:`P(Y=1)=p` and i.i.d. sampling

.. math::

   E(\hat{p})=p

.. math::

   \mathrm{Var}(\hat{p})=\frac{p(1-p)}{n}

.. math::

   \mathrm{SE}(\hat{p})=\sqrt{\frac{p(1-p)}{n}}

The standard error decreases as :math:`n` increases, so event-rate estimates become more stable across repeated samples.
If :math:`p` is unknown, it is often replaced by :math:`\hat{p}`

.. math::

   \widehat{\mathrm{SE}}(\hat{p})=\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}

1.8 The Sampling Perspective and Sampling Distributions
-------------------------------------------------------

The sampling perspective treats inference as repeatable.
In this view, a statistic is a random variable produced by a sampling procedure.

A sampling distribution is defined by a thought experiment.
We imagine repeating the same study design many times, under the same target population and the same measurement rule.

Across repetitions, only the random sample changes.
The parameter values remain fixed, and the statistic changes because the sample changes.

This thought experiment supports probability statements about statistics.
It also provides a formal definition of standard error as the spread of the statistic across repetitions.

.. rubric:: Figure 1 — Population variability and the sampling distribution of :math:`\bar{X}`

This figure connects a population distribution to repeated-sample behavior of the sample mean.
A manager studies transaction time under stable operation and repeats the sampling plan :math:`R=100` times.

In each repetition, the manager samples :math:`n` customers and computes the sample mean :math:`\bar{X}`.
The dropdown changes :math:`n`, the number of customers per sample.

.. raw:: html

   <iframe src="../_static/figures/stat2/01_01_population_vs_sampling_mean.html"
   scrolling="no"
   style="width:95%; height:600px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

The top panel shows the right-skewed population distribution of transaction time :math:`X` in seconds.
The red vertical line marks the population mean :math:`\mu`, and thin vertical lines mark the 100 realized sample means.

The bottom panel shows the same 100 sample means as repeated outcomes of :math:`\bar{X}`.
The red line marks :math:`\mu`, and the gray band marks :math:`\mu \pm 2\cdot\mathrm{SE}` with :math:`\mathrm{SE}=\sigma/\sqrt{n}`.

As :math:`n` increases, the repeated values of :math:`\bar{X}` concentrate more tightly around :math:`\mu`.
This concentration indicates smaller standard error and higher precision of :math:`\bar{X}` as an estimator of :math:`\mu`.

.. rubric:: Figure 2 — Sampling distribution of :math:`\hat{p}` for a slow-transaction event

This figure applies the same logic to an event rate.
A manager defines an indicator :math:`Y` with :math:`Y=1` for a slow transaction and :math:`Y=0` otherwise.

Here, “slow” is defined by a threshold on time, so the population parameter is :math:`p=P(X>40)`.
For each selected :math:`n`, the manager repeatedly samples :math:`n` transactions and recomputes :math:`\hat{p}`.

.. raw:: html

   <iframe src="../_static/figures/stat2/01_02_sampling_dist_I_sampling_dist_phat.html"
   scrolling="no"
   style="width:95%; height:560px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

The histogram shows the sampling distribution of :math:`\hat{p}` under repetition.
The vertical reference marks :math:`p`, estimated from a large baseline dataset that represents the process.

As :math:`n` increases, the histogram becomes narrower around :math:`p`.
This indicates smaller typical sampling fluctuation, consistent with the standard error :math:`\sqrt{p(1-p)/n}`.

1.9 Discussion and Common Errors
--------------------------------

In many applications, the full population distribution is unknown.
Even so, key parameters such as mean level and event rate can still be estimated from samples.

Increasing :math:`n` improves precision because standard error decreases with :math:`n`.
This explains why we often focus on collecting more data within one study rather than repeating many separate studies.

Later modules introduce results that support inference when the population distribution is not fully specified.
These results require careful attention to sampling assumptions and measurement definitions.

1) Confusing parameters with statistics
   A parameter such as :math:`\mu` or :math:`p` is fixed in the model.
   A statistic such as :math:`\bar{X}` or :math:`\hat{p}` is random before sampling and should be treated as such.

2) Confusing standard deviation and standard error
   The standard deviation :math:`\sigma` describes variability of individual observations.
   The standard error describes variability of a statistic across repeated samples and is typically smaller.

3) Assuming i.i.d. sampling without checking the design
   Clustered or selective sampling can create dependence or bias.
   When this occurs, sampling distributions can be wider or shifted relative to i.i.d. expectations.

1.10 Summary
------------

A population is the target group or stable process that generates outcomes.
A parameter describes the population and is fixed in the model but unknown in practice.

A sample is the set of observed outcomes collected from the population.
A statistic summarizes the sample and is random before sampling because it depends on which units are observed.

Point estimation uses a statistic, such as :math:`\bar{X}` or :math:`\hat{p}`, to estimate a parameter.
Uncertainty is described by the sampling distribution of the estimator, not by the point estimate alone.

Standard error is the standard deviation of the sampling distribution of a statistic.
Under i.i.d. sampling, :math:`\mathrm{SE}(\bar{X})=\sigma/\sqrt{n}` and :math:`\mathrm{SE}(\hat{p})=\sqrt{p(1-p)/n}`.

Larger sample size :math:`n` reduces standard error and improves precision.
A valid interpretation requires a clear measurement rule and a sampling design that supports i.i.d. assumptions.
