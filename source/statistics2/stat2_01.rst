1. Joint probability for discrete variables
===========================================

1.1. Joint Probability Distribution
---------------------------------------------------

Many real systems produce more than one outcome at the same time. These outcomes are observed from the same process, during the same period, and under the same operating conditions. Because they are generated together, the outcomes often influence each other. Analyzing each outcome separately can hide important relationships. Joint analysis focuses on how outcomes occur together.

Consider the following situations.

- A production process operates continuously throughout the day. During each shift, the operating condition of the machine is recorded, along with the number of defective items produced. On some days, the machine runs smoothly and only a few defects appear. On other days, small changes in operating conditions are observed and defects increase noticeably. This is a case of a **joint distribution**, because operating condition and product quality are observed together and may be related.

- A company receives customer orders every day and records the number of units requested. At the same time, it records how long deliveries take to arrive. On certain days, high order volumes are followed by longer delivery times. On other days, orders are fewer and deliveries arrive quickly. This is a case of a **joint distribution**, because demand and delivery time describe the same system behavior and must be studied together.

- Customers arrive at a service facility and wait for assistance. For each customer, the waiting time before service and the time spent being served are recorded. Some customers wait a long time even when service times are short. Other customers experience long waits mainly when service times are long. This is a case of a **joint distribution**, because waiting time and service time are measured for the same customer and may depend on each other.

- A computer system processes user requests throughout the day. For each request, the system records the signal condition and the response time. When the signal is strong, responses are usually fast, but not always. When the signal is weak, delays occur more frequently. This is a case of a **joint distribution**, because signal condition and response time describe the same request and are connected.

In each situation above, it is possible to study only one outcome at a time. For example, delivery time can be analyzed without considering demand, or response time can be examined without considering signal condition. Such an analysis can describe typical behavior, such as an average delay, a usual waiting time, or the overall variability of a single outcome. This information is useful, but it is incomplete.

The limitation becomes clear when we return to the situations described earlier. Suppose long delivery times are observed. Without considering demand, it is not clear whether these delays occur randomly or mainly on days when demand is high. Similarly, suppose a higher number of defects is observed. Without considering operating conditions, it is not clear whether defects increase uniformly or mainly when certain conditions are present. In the service example, knowing the average waiting time does not explain whether long waits occur even when service is fast, or mainly when service itself is slow. In the system example, knowing the overall response time does not explain whether slow responses are equally likely under all signal conditions.

These questions all have the same structure. They ask whether two outcomes tend to occur **together** in the same observation. They ask whether one outcome changes when the other outcome takes a particular value. Answering such questions requires more than studying each outcome separately. It requires a way to describe how pairs of outcomes appear across repeated observations of the same system.

A **joint probability distribution** addresses this limitation by describing how two random variables behave at the same time. Instead of assigning probabilities to individual outcomes, it assigns probabilities to **pairs of outcomes** that occur together in a single observation. For example, it can describe how often high demand occurs together with long delivery time, how often specific operating conditions occur together with high defect counts, or how often weak signal conditions occur together with slow system responses. By organizing probabilities around these pairs, a joint probability distribution provides a complete description of how two sources of uncertainty interact within the same system.


1.2. Joint Probability Mass Function (Discrete Case)
---------------------------------------------------

Let :math:`X` and :math:`Y` be two **discrete random variables**. Each time the system is observed, it produces one value of :math:`X` and one value of :math:`Y` at the same time. Because both values come from the same observation, they must be described together rather than separately.

The **joint probability mass function (joint pmf)** is defined as

.. math::

   f_{XY}(x,y) = P(X = x, Y = y)

This notation should be read carefully. The expression :math:`X = x` means that the random variable :math:`X` takes the specific value :math:`x`. The expression :math:`Y = y` means that the random variable :math:`Y` takes the specific value :math:`y`. The comma indicates that both events occur together in the same observation. The probability operator :math:`P(\cdot)` assigns a probability to this joint event. Therefore, :math:`f_{XY}(x,y)` represents the probability that :math:`X` takes the value :math:`x` and, at the same time, :math:`Y` takes the value :math:`y`.

A joint pmf assigns a probability to every possible pair :math:`(x,y)` that the two variables can take. Each pair corresponds to one possible outcome of the system. For discrete variables, the joint pmf is often presented as a table, where rows correspond to values of one variable, columns correspond to values of the other variable, and each cell contains the probability of a specific pair. Each cell describes what happens when both variables take particular values together, not separately.

The joint pmf must satisfy two basic properties.

1. **Non-negativity.**

   For all values of :math:`x` and :math:`y`, the joint pmf must satisfy

   .. math::

      f_{XY}(x,y) \ge 0

   This means that probabilities cannot be negative. A value of zero indicates that a particular pair :math:`(x,y)` never occurs, while larger values indicate pairs that occur more frequently in the observed system.

2. **Total probability equals one.**

   The probabilities assigned to all possible pairs of values must add up to one:

   .. math::

      \sum_x \sum_y f_{XY}(x,y) = 1

   The inner sum adds probabilities across all possible values of :math:`Y` for a fixed value of :math:`X`. The outer sum then adds across all possible values of :math:`X`. Together, these sums account for every possible outcome of the system. This reflects the fact that, in each observation, one and only one pair :math:`(x,y)` must occur.

When reading a joint pmf, attention should remain on **joint occurrence**. The value :math:`f_{XY}(x,y)` refers to a specific pair of values observed together in the same outcome. It does not describe how :math:`X` behaves on its own, and it does not describe how :math:`Y` behaves on its own. Each value of the joint pmf answers a localized question: how frequently does this particular combination appear among all observations? Understanding this point is essential before extracting any further information from the joint distribution.

1.3. Illustration
---------------------------------------------------

To make the idea of a joint pmf concrete, consider again the inspection scenario in which two outcomes are recorded at the same time during each inspection.

- :math:`X` denotes the machine status during inspection:

  - :math:`X = 1` for a normal state
  - :math:`X = 2` for a warning signal
  - :math:`X = 3` for an alarm signal

- :math:`Y` denotes the inspection result:

  - :math:`Y = 0` if no defect is found
  - :math:`Y = 1` if a defect is found

Each inspection produces one **paired outcome** :math:`(X,Y)`.

**Observation-level view.**  
Before working with probabilities, it is useful to look at the data at the level of individual inspections. Each row in the table below corresponds to one inspection, and each inspection produces one pair of outcomes.

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

The important point here is that the values of :math:`X` and :math:`Y` in each row are observed **together**. They describe the same inspection and should not be separated.

**Joint pmf table.**  
When the number of inspections is large, the individual observations can be summarized by counting how frequently each possible pair :math:`(x,y)` appears and then converting those counts into probabilities.

.. list-table::
   :header-rows: 1
   :align: center

   * - :math:`X \backslash Y`
     - :math:`Y = 0` (No defect)
     - :math:`Y = 1` (Defect)
   * - :math:`X = 1` (Normal)
     - 0.30
     - 0.10
   * - :math:`X = 2` (Warning)
     - 0.20
     - 0.15
   * - :math:`X = 3` (Alarm)
     - 0.10
     - 0.15

Each entry in this table represents a joint probability. For example, the value 0.15 in the row :math:`X = 2` and column :math:`Y = 1` is :math:`f_{XY}(2,1)`.

**Visual representation of the joint pmf.**  
The same joint pmf can also be represented visually.

.. raw:: html

   <iframe src="../_static/joint_pmf_interactive.html"
           width="100%"
           height="500px"
           style="border:none;">
   </iframe>

Difficulties arise when this visual representation is not treated as a joint description. One common mistake is to focus on only one variable while ignoring the paired structure of the bars. Doing so removes the pairing :math:`(x,y)` that defines each bar, and the interaction between variables is lost.
