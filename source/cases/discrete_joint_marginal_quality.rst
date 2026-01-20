Case Study: Joint and Marginal Distributions in Quality Inspection (Discrete Case)
=================================================================================


Description
-----------

A production batch contains parts of two types:

- **Conforming**: meet specifications
- **Nonconforming**: do not meet specifications

A quality engineer selects a sample to inspect the batch. The sampling is done **randomly without replacement**, meaning that once a part is selected, it is not returned to the batch before the next selection.

Let:

- :math:`X` be the number of **conforming** parts in the sample.
- :math:`Y` be the number of **nonconforming** parts in the sample.

A sample of size :math:`n = 20` is selected from a batch of size :math:`N = 100`. Suppose the batch contains :math:`K = 80` conforming parts and :math:`N-K = 20` nonconforming parts.

Because every sampled part must be either conforming or nonconforming, the two counts always satisfy

.. math::

   X + Y = 20


Questions
---------

1. Is the joint distribution of :math:`(X,Y)` multinomial? Explain clearly using the sampling mechanism.
2. Write the joint probability mass function :math:`f_{XY}(x,y)=P(X=x,Y=y)`, including the valid range of :math:`(x,y)`.
3. Derive the marginal distribution of :math:`X`, i.e., :math:`f_X(x)=P(X=x)`.
4. Derive the marginal distribution of :math:`Y`, i.e., :math:`f_Y(y)=P(Y=y)`.

Solution
--------


Question 1: Is the joint distribution of :math:`(X,Y)` multinomial?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The sample size is fixed at 20. This means exactly 20 parts are observed in total.

In each sample:

- :math:`X` counts how many of the 20 are conforming.
- :math:`Y` counts how many of the 20 are nonconforming.

Since every sampled part must fall into exactly one of these two categories, the counts must satisfy

.. math::

   X + Y = 20

This is not an assumption. It is a direct consequence of counting.

So, once :math:`X` is known, :math:`Y` is determined automatically:

.. math::

   Y = 20 - X

A multinomial model is appropriate when:

- trials are independent (or effectively independent), and
- category probabilities remain constant across trials.

That situation corresponds to **sampling with replacement**.

In this problem, sampling is done **without replacement**. After each draw, the composition of the batch changes. For example, if a conforming part is drawn, there is one fewer conforming part remaining, and the probability that the next draw is conforming changes.

This dependence violates the assumptions of a multinomial model.

In addition, the pair :math:`(X,Y)` is constrained by :math:`X+Y=20`, meaning the joint pmf has support only on a single line in the :math:`(x,y)` plane. A multinomial joint distribution would allow variation in both dimensions.

Therefore, the joint distribution of :math:`(X,Y)` is **not multinomial**.


Question 2: Joint probability mass function of :math:`(X,Y)`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Because sampling is without replacement, probabilities are computed using combinations.

To obtain the event :math:`(X=x, Y=y)` in a sample of size 20:

- choose :math:`x` conforming parts from the 80 available,
- choose :math:`y` nonconforming parts from the 20 available,
- divide by the total number of ways to choose any 20 parts from the 100.

Thus,

.. math::

   P(X=x, Y=y)
   =
   \frac{\binom{80}{x}\binom{20}{y}}{\binom{100}{20}}

The valid range is determined by the fixed sample size:

.. math::

   x + y = 20,
   \quad x = 0,1,\ldots,20,
   \quad y = 20 - x

For all other pairs,

.. math::

   P(X=x, Y=y) = 0

A compact representation is

.. math::

   P(X=x, Y=20-x)
   =
   \frac{\binom{80}{x}\binom{20}{20-x}}{\binom{100}{20}},
   \quad x = 0,1,\ldots,20


.. raw:: html

   <iframe src="../_static/joint_pmf_3d.html"
           width="100%"
           height="520px"
           style="border:none;">
   </iframe>

This visualization shows that probability mass exists only along the diagonal line :math:`x+y=20`. Outcomes away from this line are impossible.


Question 3: Marginal distribution of :math:`X`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By definition, the marginal distribution of :math:`X` is obtained by summing the joint pmf over all values of :math:`Y`:

.. math::

   f_X(x) = P(X=x) = \sum_y P(X=x, Y=y)

Because the constraint :math:`X+Y=20` holds, only one value of :math:`Y` is compatible with a given :math:`x`, namely :math:`y=20-x`. All other values have probability zero.

Therefore,

.. math::

   P(X=x) = P(X=x, Y=20-x)

Substituting the joint pmf,

.. math::

   P(X=x)
   =
   \frac{\binom{80}{x}\binom{20}{20-x}}{\binom{100}{20}},
   \quad x = 0,1,\ldots,20

This is the **hypergeometric distribution**, describing the number of conforming parts in a sample drawn without replacement.

.. raw:: html

   <iframe src="../_static/marginal_pmf_X.html"
           width="100%"
           height="520px"
           style="border:none;">
   </iframe>


Question 4: Marginal distribution of :math:`Y`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similarly, the marginal distribution of :math:`Y` is

.. math::

   f_Y(y) = P(Y=y) = \sum_x P(X=x, Y=y)

Using the same constraint,

.. math::

   X + Y = 20

only :math:`x = 20 - y` is possible. Hence,

.. math::

   P(Y=y)
   =
   \frac{\binom{80}{20-y}\binom{20}{y}}{\binom{100}{20}},
   \quad y = 0,1,\ldots,20

.. raw:: html

   <iframe src="../_static/marginal_pmf_Y.html"
           width="100%"
           height="520px"
           style="border:none;">
   </iframe>

Because

.. math::

   Y = 20 - X

the marginal distributions of :math:`X` and :math:`Y` have the same shape. Knowing one variable uniquely determines the other.


Reconnecting Marginals with the Joint Distribution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The marginal distributions summarize one variable at a time, but they do not explicitly show the dependence created by the fixed sample size.

The joint distribution makes this structure visible.

.. raw:: html

   <iframe src="../_static/joint_pmf_diagonal.html"
           width="100%"
           height="520px"
           style="border:none;">
   </iframe>

The joint pmf provides the foundation for **conditional distributions**, which describe how one variable behaves when the value of the other is known.
