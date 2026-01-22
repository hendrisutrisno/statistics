3. Independence of Random Variables
================================


Overview and Motivation
-----------------------

In earlier sections, we introduced **joint probability distributions** to describe how two random variables
:math:`X` and :math:`Y` behave **together**, and **marginal distributions** to summarize each variable **by itself**.

This section focuses on a key structural property of joint behavior: **independence**.

Independence formalizes the idea that learning the value of one variable does **not** provide information
about the other variable. When independence holds, probabilities involving both variables become much
easier to compute because the joint distribution can be built directly from the marginals.


Definition and Equivalent Characterizations
-------------------------------------------

Let :math:`X` and :math:`Y` be random variables with joint pmf :math:`f_{XY}(x,y)` (discrete case) and
marginal pmfs :math:`f_X(x)` and :math:`f_Y(y)`. Conditional pmfs are denoted by :math:`f_{Y\mid X}(y\mid x)`
and :math:`f_{X\mid Y}(x\mid y)`.

Independence
^^^^^^^^^^^^

For random variables :math:`X` and :math:`Y`, if **any one** of the following properties is true, then the others
are also true, and :math:`X` and :math:`Y` are **independent**.

(1) **Factorization of the joint distribution**

.. math::

   f_{XY}(x,y) = f_X(x)\,f_Y(y)
   \quad \text{for all } x \text{ and } y.

(2) **Conditioning on** :math:`X` **does not change the distribution of** :math:`Y`

.. math::

   f_{Y\mid X}(y\mid x) = f_Y(y)
   \quad \text{for all } x,y \text{ with } f_X(x) > 0.

(3) **Conditioning on** :math:`Y` **does not change the distribution of** :math:`X`

.. math::

   f_{X\mid Y}(x\mid y) = f_X(x)
   \quad \text{for all } x,y \text{ with } f_Y(y) > 0.

(4) **Event-level factorization**

.. math::

   P(X\in A,\, Y\in B) = P(X\in A)\,P(Y\in B)

for any sets :math:`A` and :math:`B` in the ranges of :math:`X` and :math:`Y`.

Each statement expresses the same idea in a different language:

- "1" is the most direct statement in terms of pmfs.
- "2" and "3" state independence as “knowing one does not change the other.”
- "4" states independence using general events (subsets of possible values).


Illustrative Example (Discrete Case)
------------------------------------

In a remote environmental monitoring station, researchers study whether manual data entry issues are related to automated data capture outcomes. Suppose:

- :math:`X` = number of minor recording errors in a quality log during a shift, with :math:`x\in\{0,1,2\}`.
- :math:`Y` = number of sensor snapshots saved during the same shift, with :math:`y\in\{1,2\}`.

The joint pmf :math:`f_{XY}(x,y)` summarizes how the paired outcomes :math:`(X,Y)` occur across shifts:

.. list-table::
   :header-rows: 1
   :align: center

   * - :math:`f_{XY}(x,y)`
     - :math:`x=0`
     - :math:`x=1`
     - :math:`x=2`
   * - :math:`y=1`
     - 0.24
     - 0.08
     - 0.08
   * - :math:`y=2`
     - 0.36
     - 0.12
     - 0.12

The main question is whether these variables are **independent**. In practical terms:

- Do shifts with more recording errors tend to have a different snapshot pattern?
- Or does the snapshot process behave the same regardless of the number of errors?

To answer this, we verify independence using the standard equivalent conditions:

1. Compute the marginal pmfs :math:`f_X(x)` and :math:`f_Y(y)`.
2. Check whether :math:`f_{XY}(x,y)=f_X(x)f_Y(y)` for all :math:`(x,y)`.
3. Check whether :math:`f_{Y\mid X}(y\mid x)=f_Y(y)` whenever :math:`f_X(x)>0`.
4. Check whether :math:`f_{X\mid Y}(x\mid y)=f_X(x)` whenever :math:`f_Y(y)>0`.
5. Illustrate event-level factorization :math:`P(X\in A, Y\in B)=P(X\in A)P(Y\in B)` for selected sets :math:`A` and :math:`B`.


Step 1: Compute the marginal distributions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Marginal pmf of :math:`X` (sum down each column):

.. math::

   f_X(0)=0.24+0.36=0.60,\quad
   f_X(1)=0.08+0.12=0.20,\quad
   f_X(2)=0.08+0.12=0.20.

Marginal pmf of :math:`Y` (sum across each row):

.. math::

   f_Y(1)=0.24+0.08+0.08=0.40,\quad
   f_Y(2)=0.36+0.12+0.12=0.60.


Step 2: Verify condition (1) (factorization)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We test whether :math:`f_{XY}(x,y)=f_X(x)f_Y(y)` for all :math:`(x,y)`.

For :math:`(x=1,y=2)`:

.. math::

   f_{XY}(1,2)=0.12,
   \qquad
   f_X(1)f_Y(2)=0.20\times 0.60=0.12.

For :math:`(x=0,y=1)`:

.. math::

   f_{XY}(0,1)=0.24,
   \qquad
   f_X(0)f_Y(1)=0.60\times 0.40=0.24.

The same equality holds for the remaining cells. Therefore, condition (1) is satisfied and
:math:`X` and :math:`Y` are independent.


Step 3: Verify condition (2) (conditioning on :math:`X`)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By definition,

.. math::

   f_{Y\mid X}(y\mid x)=\frac{f_{XY}(x,y)}{f_X(x)}
   \quad \text{for } f_X(x)>0.

Compute :math:`f_{Y\mid X}(y\mid 1)`:

.. math::

   f_{Y\mid X}(1\mid 1)=\frac{f_{XY}(1,1)}{f_X(1)}=\frac{0.08}{0.20}=0.40,

.. math::

   f_{Y\mid X}(2\mid 1)=\frac{f_{XY}(1,2)}{f_X(1)}=\frac{0.12}{0.20}=0.60.

These values match :math:`f_Y(1)=0.40` and :math:`f_Y(2)=0.60`. The same match occurs for :math:`X=0`
and :math:`X=2`. Therefore, condition (2) holds.


Step 4: Verify condition (3) (conditioning on :math:`Y`)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute :math:`f_{X\mid Y}(x\mid 1)`:

.. math::

   f_{X\mid Y}(0\mid 1)=\frac{0.24}{0.40}=0.60,\quad
   f_{X\mid Y}(1\mid 1)=\frac{0.08}{0.40}=0.20,\quad
   f_{X\mid Y}(2\mid 1)=\frac{0.08}{0.40}=0.20.

These values match :math:`f_X(0)=0.60`, :math:`f_X(1)=0.20`, and :math:`f_X(2)=0.20`. The same match holds
for :math:`Y=2`. Therefore, condition (3) holds.


Step 5: Verify condition (4) (event-level factorization)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Choose :math:`A=\{1,2\}` and :math:`B=\{2\}`.

First compute the joint event probability:

.. math::

   P(X\in\{1,2\},Y=2)=f_{XY}(1,2)+f_{XY}(2,2)=0.12+0.12=0.24.

Now compute the marginal event probabilities:

.. math::

   P(X\in\{1,2\})=f_X(1)+f_X(2)=0.20+0.20=0.40,

.. math::

   P(Y=2)=f_Y(2)=0.60.

Their product is:

.. math::

   P(X\in\{1,2\})P(Y=2)=0.40\times 0.60=0.24.

The values agree, illustrating condition (4).



Rectangular Range for :math:`(X,Y)`
-----------------------------------

Let :math:`D` denote the set of points :math:`(x,y)` that receive **positive probability** under :math:`f_{XY}(x,y)`.

- If :math:`D` is **not rectangular**, then :math:`X` and :math:`Y` are **not independent**.
- If :math:`D` **is rectangular**, independence is **possible** but not guaranteed. At least one of the
  conditions in the definition must still be checked.

Why non-rectangular support implies dependence
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If :math:`D` is not rectangular, then for some values of :math:`x`, certain values of :math:`y` are impossible.
In that case, knowing :math:`X=x` changes the set of :math:`Y` values that can occur with positive probability.
This means :math:`Y` depends on :math:`X`, so independence cannot hold.

Example (non-rectangular support)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let :math:`X\in\{0,1,2\}` and :math:`Y\in\{0,1,2\}`. Consider the joint support

.. math::

   D = \{(x,y): y \le x\}.

This means:

- If :math:`X=0`, then :math:`Y` must be :math:`0`.
- If :math:`X=1`, then :math:`Y` can be :math:`0` or :math:`1`.
- If :math:`X=2`, then :math:`Y` can be :math:`0,1,2`.

Here, knowing :math:`X` restricts the possible values of :math:`Y`. Therefore, :math:`X` and :math:`Y` cannot
be independent.

.. raw:: html

   <iframe src="../_static/03_01_rectangular_support_nonrect.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>

Example (rectangular support, but independence not guaranteed)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now suppose the support is the full rectangle:

.. math::

   D = \{0,1,2\}\times\{0,1,2\}.

In this case, all pairs are possible, so independence is **possible**. However, independence may still fail if the
probabilities do not factorize.

For instance, if higher probability is concentrated near the diagonal :math:`x=y`, then large values of :math:`X`
tend to occur with large values of :math:`Y`, which indicates dependence even though the support is rectangular.

.. raw:: html

   <iframe src="../_static/03_02_rectangular_support_rect_dependent.html"
           width="100%"
           height="420px"
           style="border:none;">
   </iframe>


Common Errors and How to Avoid Them
-----------------------------------

1. **Checking only one pair** :math:`(x,y)`.  
   Independence requires the defining equality to hold for **all** :math:`x` and :math:`y`.

2. **Assuming marginals imply independence.**  
   Marginal distributions always exist. Independence is a special structure of the **joint** distribution.

3. **Confusing “rectangular support” with independence.**  
   Rectangular support is only a necessary condition. You still must verify one of the independence properties.


Summary: What Independence Allows
---------------------------------

If :math:`X` and :math:`Y` are independent, then:

- The joint distribution can be written as a product of marginals.
- Conditioning on one variable does not change the distribution of the other.
- Probabilities for combined events can be computed using only marginal distributions.

Marginal distributions describe how variables behave **overall**, but independence is a statement about whether
the variables are connected in the joint structure.
