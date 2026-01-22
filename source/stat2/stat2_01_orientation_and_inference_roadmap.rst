1. Orientation & Inference Roadmap
===============================

Introduction
------------

This session provides an orientation for Statistics 2.
Our purpose is to develop a coherent view of statistical inference.
Inference is a principled workflow that uses sample information to learn about an unknown population or process.

In many operational settings, the full population is not observable.
Instead, we observe a sample of a process output :math:`X` (e.g., fill weight, cycle time, defect size).
We then use probability to describe sampling variability and to support decision-making under uncertainty.

Learning Outcomes
-----------------

After this session, we should be able to:

- Describe a standard inference workflow from research question to conclusion.
- Distinguish a parameter (population quantity) from a statistic (sample quantity).
- Explain the sampling perspective and the role of a sampling distribution.
- State key assumptions that justify common inferential procedures.

Connection to Previous Ideas
----------------------------

Statistics 1 emphasized description and probability modeling.
We learned that variability is a central feature of data.
Statistics 2 builds on this foundation and focuses on inferential statements about unknown parameters.

1. Statistical inference as a workflow
--------------------------------------

Motivation
^^^^^^^^^^

In quality management and operations analysis, decisions are often based on limited information.
A sample provides partial evidence about a larger system.
Inference is the methodology that converts this evidence into a quantified and transparent conclusion.

Workflow overview
^^^^^^^^^^^^^^^^^

A practical inferential workflow includes:

- Formulate the research question in operational terms.
- Specify the population or stochastic process that generates :math:`X`.
- Identify the target parameter (e.g., :math:`\mu`, :math:`\sigma`, or :math:`p`).
- Design a sampling plan that supports representativeness.
- Compute an appropriate statistic (e.g., :math:`\bar{X}`).
- Use a sampling distribution to quantify uncertainty.
- Report conclusions with explicit assumptions and scope.

Figure 1 presents this workflow as a structured roadmap.
The figure is not empirical factory data. It is a conceptual map of the inferential logic.
We use it to locate where each chapter’s methods fit and why the order matters.
With the dropdown, we can highlight estimation or hypothesis testing and see that the upstream logic is shared.

.. raw:: html

   <iframe src="../_static/figures/stat2/01_02_parameter_vs_statistic_sampling.html"
   scrolling="no"
   style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>


2. Parameters and statistics
----------------------------

Motivation
^^^^^^^^^^

A persistent source of confusion is the distinction between population quantities and sample quantities.
In formal terms, parameters are fixed but unknown.
Statistics are random variables because they depend on a random sample.

Definitions
^^^^^^^^^^^

Let :math:`X_1, X_2, \ldots, X_n` denote a sample of observations of the same measurement :math:`X`.

- Parameter: a population or process characteristic, such as :math:`\mu` and :math:`\sigma`.
- Statistic: a sample-derived quantity, such as :math:`\bar{X}` and :math:`S`.

Key formulas
^^^^^^^^^^^^

.. math::

   \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i

.. math::

   S^2 = \frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2

Symbol meanings:

- :math:`n` is the sample size.
- :math:`X_i` is the :math:`i`th observation.
- :math:`\bar{X}` is the sample mean.
- :math:`S^2` is the sample variance.

Sampling distribution and standard error
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A sampling distribution is the probability distribution of a statistic under repeated sampling.
For the sample mean, the spread of this distribution is summarized by the standard error (SE).
The SE quantifies typical sampling-to-sampling fluctuation in :math:`\bar{X}`.

A fundamental relationship is:

.. math::

   \mathrm{SE}(\bar{X}) = \frac{\sigma}{\sqrt{n}}

When :math:`\sigma` is unknown, we use the plug-in estimate:

.. math::

   \widehat{\mathrm{SE}}(\bar{X}) = \frac{s}{\sqrt{n}}

(Note: as :math:`n` increases, the variability of :math:`\bar{X}` decreases due to averaging.)

.. raw:: html

   <iframe src="../_static/figures/stat2/01_02_parameter_vs_statistic_sampling.html"
   scrolling="no"
   style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

Figure 2 above uses simulated process data to make the parameter–statistic distinction observable.
We assume a stable process with a fixed (but unknown in practice) mean :math:`\mu` and standard deviation :math:`\sigma`.
We then generate many repeated samples under the same data-generating mechanism, and we compute the sample mean :math:`\bar{X}` for each sample.

In the figure, the gray histogram represents the distribution of individual observations :math:`X`.
This is the within-process variation that operators typically see day to day.
The blue histogram represents the sampling distribution of :math:`\bar{X}`, formed by repeating the sampling many times.
The blue curve is the theoretical reference distribution for :math:`\bar{X}` under the model assumptions.

We use the dropdown to change :math:`n`.
The x-axis is held fixed, so visual comparisons are meaningful across :math:`n`.
As :math:`n` increases, the blue histogram becomes narrower and concentrates near :math:`\mu`.
This illustrates that :math:`\bar{X}` is a statistic with randomness, but its variability decreases as sample size increases.

3. Assumptions that justify standard inference
----------------------------------------------

Motivation
^^^^^^^^^^

Inferential statements depend on assumptions.
When assumptions fail, reported uncertainty can be misleading.
In applied contexts, the most important practice is to state assumptions and evaluate plausibility.

Assumption A: independence of observations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Independence means that one observation does not systematically influence another.
In production environments, dependence can occur due to drift, batching, or shared operating conditions.
If dependence is present, the standard error computed under independence can be too small.
This leads to intervals that are too narrow and tests that reject too easily.

Assumption B: measurement reliability (measurement system quality)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Reliable measurement implies repeatability and adequate accuracy for the decision context.
Excess measurement noise increases variability and reduces power.
Systematic measurement bias shifts estimates away from the true parameter.
Both effects undermine valid inference.

A useful habit is to ask two questions before applying a procedure:

- Is the sampling close to independent for the intended analysis?
- Is the measurement system credible for the required precision?

.. raw:: html
   
   <iframe src="../_static/figures/stat2/01_03_independence_effect_on_se.html"
   scrolling="no"
   style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

Figure 3 above illustrates why the independence assumption is not a technical detail but a core inferential requirement.
We again consider a stable process with the same marginal mean :math:`\mu` and marginal standard deviation :math:`\sigma`.
The only feature that changes across settings is dependence between successive observations.
Operationally, this can occur due to drift, batching, or shared machine conditions.

To make this concrete, we generate sequences where neighboring values are similar when dependence is high.
We summarize dependence with a parameter :math:`\rho`, where larger :math:`\rho` means stronger serial association.
For each selected :math:`\rho`, we repeat the sampling many times and compute :math:`\bar{X}` each time.
This produces an empirical sampling distribution of :math:`\bar{X}` under dependence.

In the figure, the red histogram shows the sampling distribution of :math:`\bar{X}` for the chosen :math:`\rho`.
The gray curve is a reference distribution that assumes independence, using :math:`\mathrm{SE}(\bar{X})=\sigma/\sqrt{n}`.
We compare the width of the red histogram to the gray curve.
As :math:`\rho` increases, the red histogram becomes wider than the independence reference.
This indicates that dependence inflates uncertainty in :math:`\bar{X}`.
Therefore, using an independence-based SE can understate uncertainty and produce overconfident conclusions.

4. Course Roadmap
----------------------------

These chapters form a single inferential sequence.

- **Sampling distributions**: develops sampling distributions and the logic of standard errors.
- **Estimation**: uses sampling distributions to build point estimates and confidence intervals.
- **Hypothesis tests**: uses sampling distributions to assess claims and compute p-values (evidence against a claim).
- **ANOVA**: generalizes mean comparison to more than two groups through ANOVA.

Across topics, a common structure repeats:

- Specify a parameter of interest.
- Choose a statistic that targets that parameter.
- Use a sampling distribution to quantify uncertainty.
- Report a conclusion with assumptions and interpretation.

.. Worked Example
.. --------------

.. Description
.. ^^^^^^^^^^^

.. A packaging line fills bottles with liquid.
.. Let :math:`X` denote the fill weight (grams) of one bottle during a stable production window.
.. The target is 500 g.

.. A quality engineer takes a simple random sample of :math:`n = 25` bottles and obtains:

.. - :math:`\bar{x} = 502.1` g
.. - :math:`s = 4.0` g

.. Question
.. ^^^^^^^^

.. Construct a 95% uncertainty interval for the process mean :math:`\mu`.

.. Analysis
.. ^^^^^^^^

.. We first estimate the standard error:

.. .. math::

..    \widehat{\mathrm{SE}}(\bar{X}) = \frac{s}{\sqrt{n}} = \frac{4.0}{\sqrt{25}} = 0.8 \text{ g}

.. A common 95% interval form is:

.. .. math::

..    \bar{x} \pm z^\* \cdot \widehat{\mathrm{SE}}(\bar{X})

.. Using :math:`z^\* \approx 1.96` for 95%:

.. .. math::

..    502.1 \pm 1.96(0.8) = 502.1 \pm 1.568

.. Therefore, an approximate interval is:

.. .. math::

..    [500.53,\ 503.67] \text{ g}

.. Interpretation:

.. - The interval quantifies uncertainty about :math:`\mu`, not the variability of individual bottles. (Note: individuals can vary widely even when :math:`\mu` is precisely estimated.)
.. - Validity depends on independence and measurement reliability. (Note: drift, batching, or sensor bias can invalidate the standard SE.)

.. Intuition
.. ---------

.. Model 1: repeated sampling under stability
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. Consider repeating the same sampling plan many times under the same stable process.
.. Each repetition yields a different :math:`\bar{X}`.
.. The sampling distribution describes this repetition-to-repetition variability.

.. Model 2: signal relative to noise
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. The signal is the difference between an estimate and a benchmark (e.g., a target).
.. The noise is the standard error.
.. Many inferential conclusions depend on whether the signal is large relative to the noise.

Discussion and Common Errors
----------------------------

Error 1: treating :math:`\bar{x}` as the true mean
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong: sampling variability is ignored, so uncertainty is understated.
How to avoid: always report an SE, confidence interval, or test result with :math:`\bar{x}`.

Error 2: assuming independence for time-ordered output
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong: standard errors are too small, so intervals are too narrow.
How to avoid: randomize sampling times or positions, and check for time patterns before inference.

Error 3: ignoring measurement system limitations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong: noise reduces sensitivity, and bias shifts conclusions.
How to avoid: confirm calibration and repeatability before making inferential claims.

Summary
-------

- Statistical inference is a structured workflow that links sample evidence to conclusions about unknown parameters.
- Parameters (e.g., :math:`\mu`) are fixed but unknown; statistics (e.g., :math:`\bar{X}`) vary across samples.
- Sampling distributions describe the behavior of statistics under repeated sampling.
- Standard error quantifies sampling variability; for means it scales as :math:`\sigma/\sqrt{n}` under independence.
- Independence and measurement reliability are central assumptions that support valid uncertainty quantification.
