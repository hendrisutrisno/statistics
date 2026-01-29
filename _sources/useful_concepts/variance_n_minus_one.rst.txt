.. _sec_variance_n_minus_one:

Why the Sample Variance Uses :math:`n-1`
========================================

.. seealso::

   Back to Module 1 (Sample variance subsection): :ref:`sec_01_01_sample_variance`



Purpose
-------

In Module 1, the sample variance is defined as

.. math::

   S^2=\frac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar{X})^2

This page explains why the denominator is :math:`n-1` rather than :math:`n`.
The explanation has two parts.

1) A *degrees of freedom* argument: once the sample mean is fixed, only :math:`n-1` deviations can vary independently.

2) An *unbiasedness* argument: dividing by :math:`n-1` makes :math:`S^2` match the long-run variance level :math:`\sigma^2` under i.i.d. sampling.


Two objects: population variance vs sample variance
---------------------------------------------------

Let :math:`X` represent a population or process measurement.

- The population variance :math:`\sigma^2` is a parameter.
  It describes the long-run spread of the population distribution.

- The sample variance :math:`S^2` is a statistic.
  It is computed from a finite sample and changes from sample to sample.

The sample variance measures spread by using deviations from the sample mean.
For each observation, define the deviation

.. math::

   d_i=X_i-\bar{X}

The quantity :math:`\sum_{i=1}^{n}d_i^2` measures the total squared spread of the sample around its own center :math:`\bar{X}`.
The denominator determines how we scale this total spread into an average-like measure.


Key constraint: deviations must sum to zero
-------------------------------------------

The sample mean is

.. math::

   \bar{X}=\frac{1}{n}\sum_{i=1}^{n}X_i

Now consider the sum of deviations from :math:`\bar{X}`

.. math::

   \sum_{i=1}^{n}(X_i-\bar{X})
   =\sum_{i=1}^{n}X_i-n\bar{X}

Since :math:`n\bar{X}=\sum_{i=1}^{n}X_i`, we obtain

.. math::

   \sum_{i=1}^{n}(X_i-\bar{X})=0

This is not an optional property.
It is automatically true for any dataset once :math:`\bar{X}` is computed.

Interpretation.
The deviations around the sample mean must balance.
If some observations are above :math:`\bar{X}`, then others must be below :math:`\bar{X}` so that the total deviation is exactly zero.


Degrees of freedom: why only :math:`n-1` can vary freely
--------------------------------------------------------

Define the deviations :math:`d_i=X_i-\bar{X}` for :math:`i=1,\dots,n`.
From the previous section,

.. math::

   \sum_{i=1}^{n}d_i=0

This equation is a *linear constraint* that ties all :math:`n` deviations together.

A useful way to see the consequence is to treat the first :math:`n-1` deviations as free choices.
Once :math:`d_1,\dots,d_{n-1}` are fixed, the last deviation must satisfy the constraint, so it is forced to be

.. math::

   d_n=-\sum_{i=1}^{n-1}d_i

Therefore, only :math:`n-1` deviations can vary independently.
The remaining deviation is determined by the requirement that deviations sum to zero.

This is the meaning of “:math:`n-1` degrees of freedom” in this setting:
after estimating the center with :math:`\bar{X}`, the sample contains only :math:`n-1` independent pieces of information about spread.


Example: the last deviation is determined
-----------------------------------------

Suppose :math:`n=3` and the deviations from the sample mean are :math:`d_1,d_2,d_3`.
The constraint is

.. math::

   d_1+d_2+d_3=0

If :math:`d_1=2` and :math:`d_2=-1`, then the last deviation must be

.. math::

   d_3=-(2+(-1))=-1

So the third deviation is not free once the first two are fixed.

What this example shows conceptually is that centering the data at :math:`\bar{X}` removes one dimension of variability.
One degree of freedom is used to locate the center, leaving :math:`n-1` degrees of freedom for spread.


Unbiasedness: why :math:`n-1` gives the correct long-run level
--------------------------------------------------------------

The degrees-of-freedom argument explains why :math:`n-1` appears naturally when measuring spread around the sample mean.
The second argument explains why :math:`n-1` is also the correct scaling if the goal is to estimate :math:`\sigma^2`.

Assume an i.i.d. sample with

- population mean :math:`\mu`
- population variance :math:`\sigma^2`

A standard result is

.. math::

   \mathbb{E}\!\left[\sum_{i=1}^{n}(X_i-\bar{X})^2\right]=(n-1)\sigma^2

Interpretation.
If sampling could be repeated many times, the average value of the total squared deviation around :math:`\bar{X}` would be :math:`(n-1)\sigma^2`, not :math:`n\sigma^2`.
The reason is that using :math:`\bar{X}` rather than :math:`\mu` makes the deviations slightly smaller on average, because :math:`\bar{X}` is chosen from the data to be the best-fitting center for that sample.

Dividing by :math:`n-1` converts this expected total into the variance level

.. math::

   \mathbb{E}[S^2]=\sigma^2

So :math:`S^2` is an unbiased estimator of :math:`\sigma^2` under the i.i.d. model.
In other words, :math:`S^2` has the correct long-run target when the model assumptions hold.


A brief contrast: what if we divide by :math:`n`
------------------------------------------------

Sometimes we also see the alternative quantity

.. math::

   \frac{1}{n}\sum_{i=1}^{n}(X_i-\bar{X})^2

This quantity is the average squared deviation from the sample mean using :math:`n` in the denominator.
Under i.i.d. sampling, its expectation is

.. math::

   \mathbb{E}\!\left[\frac{1}{n}\sum_{i=1}^{n}(X_i-\bar{X})^2\right]=\frac{n-1}{n}\sigma^2

So it tends to underestimate :math:`\sigma^2` on average for finite :math:`n`.

This does not make it useless.
It is often used as a descriptive measure of within-sample spread, and it also appears naturally in some optimization settings.
However, when the goal is inference about :math:`\sigma^2`, the :math:`n-1` version is the standard choice because it removes this systematic downward bias.


Key takeaways
-------------

- Deviations around the sample mean satisfy :math:`\sum_{i=1}^{n}(X_i-\bar{X})=0`
- This constraint means only :math:`n-1` deviations can vary independently
- Estimating the mean uses one degree of freedom, leaving :math:`n-1` degrees of freedom for spread
- Dividing by :math:`n-1` makes :math:`S^2` unbiased for :math:`\sigma^2` under i.i.d. sampling
