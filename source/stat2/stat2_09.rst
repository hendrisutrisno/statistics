9. Statistical Intervals for a Single Sample
=====================================

Topic: Confidence Intervals for the Mean (Z-Intervals, and the bridge to t)
-------------------------------------------------------------------------

Introduction
------------

In the previous session, we used the **Central Limit Theorem (CLT)** to describe how
the sample mean :math:`\bar{X}` behaves across repeated samples.
We also used the **Standard Error (typical sampling spread)** to measure that variation.

That creates a practical gap.

A point estimate such as :math:`\bar{x}` is only one number.
It does not tell us how close it is to the true mean :math:`\mu`.
In decision settings, we need a range that is supported by the data.

Today we construct a **confidence interval (plausible range)** for the population mean :math:`\mu`.
We start with the **Z-interval**, which assumes the population standard deviation :math:`\sigma` is known.
Then we show the key idea that explains why the **t-interval** is needed when :math:`\sigma` is unknown. 


Learning Outcomes
-----------------

After this session, you should be able to:

- Explain what “confidence level” means using repeated sampling language.
- Construct a two-sided Z-interval for :math:`\mu` when :math:`\sigma` is known.
- Explain how confidence level and sample size change interval length.
- Choose :math:`n` to meet a target error bound (margin of error).
- Construct one-sided Z confidence bounds for :math:`\mu`.


Purpose and Use Cases
---------------------

You use a confidence interval when you must report an estimate with uncertainty, such as:

- Estimating the mean fill weight of a packaging line from a sample.
- Estimating average response time of a service desk from sampled tickets.
- Estimating mean sensor bias during calibration checks.
- Reporting a mean KPI and its uncertainty to operations management.
- Deciding whether a process mean is safely above or below a target.


Core Concept and Notation
-------------------------

We observe a random sample :math:`X_1, X_2, \dots, X_n`.

- :math:`\mu` = population mean (true long-run average).
- :math:`\sigma` = population standard deviation (true long-run spread).
- :math:`\bar{X}` = sample mean (Statistic (calculated sample value)).
- :math:`\bar{x}` = the observed value of :math:`\bar{X}` from the data.
- :math:`\alpha` = tail probability outside the confidence interval.
- :math:`1-\alpha` = confidence level (for example, 0.95).

.. math::

   \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i

If :math:`\sigma` is known and the population is Normal, then:

.. math::

   \bar{X} \sim \text{Normal}\!\left(\mu,\; \frac{\sigma^2}{n}\right)

Even when the population is not perfectly Normal, the method is often stable for moderate-to-large :math:`n`.
(Note: CLT makes :math:`\bar{X}` close to Normal for many practical cases.) 


Definition and Interpretation
-----------------------------

A key standardization
^^^^^^^^^^^^^^^^^^^^^

Define a standardized variable:

.. math::

   Z = \frac{\bar{X}-\mu}{\sigma/\sqrt{n}}

When the Normal model is appropriate (or :math:`n` is large), :math:`Z` behaves like a standard normal variable.
(Note: this converts “distance from :math:`\mu`” into “number of standard errors”.) 


Two-sided Z confidence interval for :math:`\mu` (variance known)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let :math:`z_{\alpha/2}` be the standard normal cut value that leaves area :math:`\alpha/2` in the upper tail.

A :math:`100(1-\alpha)\%` confidence interval for :math:`\mu` is:

.. math::

   \bar{x} - z_{\alpha/2}\frac{\sigma}{\sqrt{n}}
   \;\le\; \mu \;\le\;
   \bar{x} + z_{\alpha/2}\frac{\sigma}{\sqrt{n}}

Random-interval view (why interpretation is subtle)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before sampling, the endpoints depend on :math:`\bar{X}`, so the interval is random.
After sampling, you observe numbers :math:`l` and :math:`u`.

- The correct meaning is about the **procedure**:
  if you repeat the sampling many times, a fraction :math:`1-\alpha` of the intervals will include the true :math:`\mu`.
- For one computed interval, :math:`\mu` is either inside or outside.
  (Note: the probability statement is about repeated intervals, not about a fixed :math:`\mu`.) 


Margin of error and interval length
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Define the **error bound (margin of error)**:

.. math::

   E = z_{\alpha/2}\frac{\sigma}{\sqrt{n}}

Then the interval is :math:`\bar{x}\pm E`, and its full length is :math:`2E`.

Key implications:

- Higher confidence (smaller :math:`\alpha`) increases :math:`z_{\alpha/2}`, so the interval becomes longer.
- Larger :math:`n` reduces :math:`E` through :math:`1/\sqrt{n}`.
- Larger :math:`\sigma` increases :math:`E` linearly. 


Connection to Previous Ideas
----------------------------

The Z-interval is a direct continuation of CLT and Standard Error:

- CLT motivates a Normal model for :math:`\bar{X}`.
- Standard Error :math:`\sigma/\sqrt{n}` sets the sampling spread.
- The confidence level selects a central region of the standardized variable :math:`Z`.
- Solving that probability statement for :math:`\mu` produces the interval. 


Worked Example
--------------

Description
^^^^^^^^^^^

A filling process dispenses a product into containers.
Each container has fill weight :math:`X` in grams.

From long-run monitoring, the process standard deviation is stable and known:

- :math:`\sigma = 12` g

A supervisor samples :math:`n = 36` containers.
The observed sample mean is:

- :math:`\bar{x} = 503.2` g

Assume the process is stable and the CLT model for :math:`\bar{X}` is reasonable.

Question
^^^^^^^^

Find a 95% confidence interval for the true mean fill weight :math:`\mu`.

Analysis
^^^^^^^^

Sampling spread of the mean
"""""""""""""""""""""""""""

.. math::

   \text{SE}(\bar{X}) = \frac{\sigma}{\sqrt{n}} = \frac{12}{\sqrt{36}} = 2

(Note: we are estimating a mean, so we use the standard error, not :math:`\sigma`.)

Critical value and margin of error
""""""""""""""""""""""""""""""""""

For 95% confidence, :math:`z_{0.025}=1.96`.

.. math::

   E = 1.96(2)=3.92

(Note: the 1.96 value keeps the middle 95% of a standard normal scale.)

Compute the interval
""""""""""""""""""""

.. math::

   503.2 \pm 3.92

.. math::

   (503.2-3.92,\;503.2+3.92) = (499.28,\;507.12)

Interpretation
""""""""""""""

This interval is a range of values for :math:`\mu` that is consistent with the sampling model.
If the same sampling procedure were repeated many times, about 95% of the constructed intervals would cover :math:`\mu`.
(Note: the confidence is attached to the method, not to :math:`\mu` moving.) 

Visual Intuition
----------------------------

Mental model 1: Confidence level trades precision for reliability
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This plot shows the standard normal scale and the cut value that defines the central region.
Look for how the cut value moves outward as confidence increases.
This matters because the interval half-length is :math:`z_{\alpha/2}\sigma/\sqrt{n}`.

.. raw:: html

   <iframe src="../_static/08_01_z_confidence_level_demo.html"
           scrolling="no"
           style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>


Mental model 2: Sample size has diminishing returns
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This plot shows :math:`E = z_{\alpha/2}\sigma/\sqrt{n}` as :math:`n` increases.
Look for the curve flattening.
This matters because cutting the margin of error in half usually requires about four times the sample size.

.. raw:: html

   <iframe src="../_static/08_02_margin_of_error_vs_n.html"
           scrolling="no"
           style="width:95%; height:520px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>


Coverage idea: Why some intervals miss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This plot simulates repeated samples and displays many intervals.
Look for a small portion that do not include the true :math:`\mu`.
This matters because “95% confidence” does not mean “never wrong.”

.. raw:: html

   <iframe src="../_static/08_03_ci_coverage_clean_highlight_misses.html"
           scrolling="no"
           style="width:95%; height:580px; border:none; overflow:hidden; display:block; margin:0 auto;">
   </iframe>

Choice of Sample Size
---------------------

Why sample size planning matters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Often you decide the maximum error you can tolerate before you collect data.
Then you select :math:`n` to achieve that precision at a chosen confidence level. 

How to choose :math:`n` (known :math:`\sigma`)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Set the desired bound on estimation error to :math:`E`:

.. math::

   E = z_{\alpha/2}\frac{\sigma}{\sqrt{n}}

Solve for :math:`n`:

.. math::

   n = \left(\frac{z_{\alpha/2}\sigma}{E}\right)^2

Practical rule:

- Round up to the next integer.
  (Note: rounding down can make the interval longer than planned.) 


One-Sided Confidence Bounds
---------------------------

Why one-sided bounds are used
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sometimes only one direction matters for a decision.

Examples:

- Underfilling is costly, so you need a lower bound for :math:`\mu`.
- Mean waiting time must not exceed a target, so you need an upper bound for :math:`\mu`. 

Upper and lower one-sided Z bounds (known :math:`\sigma`)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For a :math:`100(1-\alpha)\%` one-sided bound, use :math:`z_{\alpha}` (not :math:`z_{\alpha/2}`).

Upper bound:

.. math::

   \mu \le \bar{x} + z_{\alpha}\frac{\sigma}{\sqrt{n}}

Lower bound:

.. math::

   \mu \ge \bar{x} - z_{\alpha}\frac{\sigma}{\sqrt{n}}

(Note: one-sided puts all of :math:`\alpha` into one tail, so the cut value is smaller than the two-sided cut.) 


General Method to Derive a Confidence Interval
----------------------------------------------

Why a general method is useful
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Many confidence intervals come from the same blueprint.
You find a statistic that has a distribution not depending on the unknown parameter.
Then you “invert” a probability statement to isolate the parameter. 

How it looks here (pivotal quantity idea)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Use the standardized form:

.. math::

   g(X_1,\dots,X_n;\mu)=\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}

Choose constants :math:`C_L` and :math:`C_U` so that:

.. math::

   P(C_L \le g \le C_U)=1-\alpha

Then rearrange to obtain:

.. math::

   P(L(X_1,\dots,X_n) \le \mu \le U(X_1,\dots,X_n))=1-\alpha

(Note: the confidence limits are functions of the data.) 

Large-Sample Confidence Interval for :math:`\mu`
------------------------------------------------

Why we need a large-sample version
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The known-:math:`\sigma` case is conceptually clean but often unrealistic.
In many settings, :math:`\sigma` is not truly known.

When :math:`n` is large, replacing :math:`\sigma` with the sample standard deviation :math:`s` is typically acceptable.
However, the substitution adds uncertainty, so a larger :math:`n` is preferred for reliability. 

Large-sample interval (approximate)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When :math:`n` is large, an approximate interval is:

.. math::

   \bar{x} - z_{\alpha/2}\frac{s}{\sqrt{n}}
   \;\le\; \mu \;\le\;
   \bar{x} + z_{\alpha/2}\frac{s}{\sqrt{n}}

Practical guideline:

- Use this when :math:`n` is sufficiently large (a conservative rule is around :math:`n \ge 40`).
  (Note: this reflects both CLT and the extra variability from estimating the spread.) 


Bridge to the Next Subtopic: Variance Unknown and the t Distribution
--------------------------------------------------------------------

Why Z is not enough for small samples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If :math:`\sigma` is unknown and :math:`n` is small, using Z cut values can be too optimistic.
The uncertainty in :math:`s` must be included.

Key result (t statistic)
^^^^^^^^^^^^^^^^^^^^^^^^

For Normal data with unknown :math:`\sigma`, the standardized mean becomes:

.. math::

   T = \frac{\bar{X}-\mu}{S/\sqrt{n}}

This variable follows a **t distribution** with :math:`n-1` degrees of freedom.
The t distribution has heavier tails than the standard normal when degrees of freedom are small.
As degrees of freedom grow, the t distribution approaches the standard normal.

This is why the next session uses :math:`t_{\alpha/2,n-1}` in place of :math:`z_{\alpha/2}`.


Discussion and Common Errors
----------------------------

Error 1: Saying “95% probability that :math:`\mu` is in this interval”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
It assigns probability to a fixed, unknown constant.
That is not the standard frequentist meaning.

How to avoid it:
Use the repeated-sampling statement:
“95% of intervals from this method would cover :math:`\mu`.” 


Error 2: Using :math:`\sigma` instead of :math:`\sigma/\sqrt{n}`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
You use individual-unit variability instead of mean variability.
The interval becomes much wider than needed.

How to avoid it:
Ask “Is this about a mean or a single observation?”
For a mean, the spread is the standard error.


Error 3: Using a Z-interval when :math:`\sigma` is unknown and :math:`n` is small
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What goes wrong:
The interval can be too narrow because it ignores uncertainty in estimating spread.

How to avoid it:
Use the t-based method when the Normal model is reasonable and :math:`n` is small.
Use the large-sample version only when :math:`n` is sufficiently large. 


Summary
-------

- A confidence interval is a data-based range for :math:`\mu` with a stated reliability level.
- With known :math:`\sigma`, the Z-interval is :math:`\bar{x} \pm z_{\alpha/2}\sigma/\sqrt{n}`.
- The margin of error is :math:`E=z_{\alpha/2}\sigma/\sqrt{n}`, and the interval length is :math:`2E`.
- Higher confidence makes intervals longer; larger :math:`n` makes intervals shorter.
- Sample size planning uses :math:`n=\left(z_{\alpha/2}\sigma/E\right)^2` and rounds up.
- One-sided bounds use :math:`z_{\alpha}` and protect only one decision direction.
- When :math:`\sigma` is unknown, large samples can use :math:`s` with Z, but small samples require the t approach. 
