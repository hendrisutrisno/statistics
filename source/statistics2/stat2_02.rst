2. Marginal Distributions
=========================

A joint distribution describes how two random variables behave **together**, assigning probabilities to pairs of outcomes observed in the same realization. In many situations, however, interest lies in understanding the behavior of **one variable by itself**, without explicitly tracking the value of the other. A **marginal distribution** provides exactly this perspective.

The term *marginal* reflects the idea of moving from a two-dimensional description to a one-dimensional one by *summing out* the other variable. Although the resulting distribution involves only a single variable, it is still derived entirely from the joint model and therefore remains consistent with the underlying joint structure.


Discrete Case
-------------

Let :math:`X` and :math:`Y` be discrete random variables with joint probability mass function :math:`f_{XY}(x,y)`.

The marginal probability mass function (pmf) of :math:`X` is obtained by summing the joint pmf over **all possible values of** :math:`Y`:

.. math::

   f_X(x) = \sum_y f_{XY}(x,y)

Similarly, the marginal pmf of :math:`Y` is obtained by summing the joint pmf over **all possible values of** :math:`X`:

.. math::

   f_Y(y) = \sum_x f_{XY}(x,y)

In each case, the summation aggregates the probabilities of **all joint outcomes** for which the variable of interest takes a particular value. The other variable is not held fixed; instead, every value it can possibly assume is taken into account.

As a result, a marginal pmf describes how frequently a particular value of :math:`X` (or :math:`Y`) occurs **overall**, regardless of what value the other variable takes.

Conceptually, marginalization answers questions such as:

- How often does :math:`X = x` occur *across all observations*?
- How does :math:`Y` vary when the specific value of :math:`X` is ignored?

Marginal distributions therefore serve as **one-dimensional summaries** of joint behavior. They are useful for describing overall variability of individual variables, but they do not describe how variables interact with one another.


Illustration: Marginal Distributions from a Joint pmf
----------------------------------------------------

We now return to the inspection example introduced earlier. Recall that each inspection produces a **paired outcome** :math:`(X,Y)`, where machine status :math:`X` and inspection result :math:`Y` are observed **together** in the same inspection.

.. list-table::
   :header-rows: 1
   :align: center

   * - Inspection
     - Machine Status :math:`X`
     - Inspection Result :math:`Y`
   * - 1
     - 1
     - 0
   * - 2
     - 2
     - 0
   * - 3
     - 2
     - 1
   * - 4
     - 3
     - 1
   * - 5
     - 1
     - 0
   * - 6
     - 3
     - 1
   * - ⋮
     - ⋮
     - ⋮

The joint pmf :math:`f_{XY}(x,y)` assigns probability to each such pair. It answers questions about **co-occurrence**, such as how often a particular machine status and inspection result appear together.

Marginal distributions address a different type of question. Instead of focusing on pairs, they describe how **one variable behaves on its own**, while still being derived from the joint description.


Marginal Distribution of :math:`X`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The marginal pmf of the machine status :math:`X` is obtained by summing the joint pmf over all possible values of :math:`Y`:

.. math::

   f_X(x) = \sum_y f_{XY}(x,y)

Operationally, this corresponds to adding probabilities **across each row** of the joint pmf table. For each machine status, we collect the probability of observing that status regardless of whether a defect is found.

For example:

- For :math:`X=1` (Normal):

  .. math::

     f_X(1) = f_{XY}(1,0) + f_{XY}(1,1) = 0.30 + 0.10 = 0.40

- For :math:`X=2` (Warning):

  .. math::

     f_X(2) = 0.20 + 0.15 = 0.35

- For :math:`X=3` (Alarm):

  .. math::

     f_X(3) = 0.10 + 0.15 = 0.25

The marginal distribution of :math:`X` therefore summarizes how frequently each machine state occurs **overall**, without distinguishing between defect and non-defect outcomes.

.. raw:: html

   <iframe src="../_static/02_01_marginal_pmf_X_plotly.html"
           width="100%"
           height="450px"
           style="border:none;">
   </iframe>


Marginal Distribution of :math:`Y`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similarly, the marginal pmf of the inspection result :math:`Y` is obtained by summing the joint pmf over all possible values of :math:`X`:

.. math::

   f_Y(y) = \sum_x f_{XY}(x,y)

This corresponds to adding probabilities **down each column** of the joint pmf table.

- For :math:`Y=0` (No defect):

  .. math::

     f_Y(0) = 0.30 + 0.20 + 0.10 = 0.60

- For :math:`Y=1` (Defect):

  .. math::

     f_Y(1) = 0.10 + 0.15 + 0.15 = 0.40

The marginal distribution of :math:`Y` describes how often defects occur **overall**, without regard to the machine status during inspection.

.. raw:: html

   <iframe src="../_static/02_02_marginal_pmf_Y_plotly.html"
           width="100%"
           height="450px"
           style="border:none;">
   </iframe>


What We Can Learn from Marginal Distributions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

From the marginal distributions of :math:`X` and :math:`Y`, we can draw several meaningful and defensible conclusions about the system:

- We can identify which machine states occur most frequently and which are relatively rare.
- We can determine the overall defect rate in the inspection process.
- We can establish baseline, unconditional summaries such as expected values, variances, and long-run proportions.

In the inspection example, marginal analysis shows that non-normal machine states occur regularly and that defects represent a substantial portion of inspection outcomes. These findings describe the **overall operating environment** and provide a reference point for further analysis.


What Marginal Distributions Cannot Tell Us
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Despite their usefulness, marginal distributions have important limitations. By construction, marginalization removes information about how outcomes occur **together**.

As a result, marginal distributions alone cannot answer questions such as:

- Are defects more likely when the machine is in an alarm state?
- Do warning signals increase the probability of a defect?
- Are machine status and inspection outcome statistically related or independent?

Two systems may have identical marginal distributions for :math:`X` and :math:`Y` while exhibiting completely different joint behavior. Marginal analysis cannot distinguish between such cases.

To address questions about association, dependence, or interaction, we must return to the **joint distribution** or move forward to **conditional distributions**, where one variable is examined given specific values of the other. This transition leads naturally to the concept of independence, which will be studied next.
