# Case Study: Joint and Marginal Distributions in Quality Inspection (Discrete Case)


## Description

A production batch contains parts of two types:
- **Conforming**: meet specifications  
- **Nonconforming**: do not meet specifications  

A quality engineer selects a sample to inspect the batch. The sampling is done **randomly without replacement**, meaning that once a part is selected, it is not returned to the batch before the next selection.

Let:
- $X$ be the number of **conforming** parts in the sample.
- $Y$ be the number of **nonconforming** parts in the sample.

A sample of size $n=20$ is selected from a batch of size $N=100$. Suppose the batch contains $K=80$ conforming parts and $N-K=20$ nonconforming parts.

Because every sampled part must be either conforming or nonconforming, the two counts always satisfy

$$
X + Y = 20
$$

---

## Questions

1. Is the joint distribution of $(X,Y)$ multinomial? Explain clearly using the sampling mechanism.  
2. Write the joint probability mass function $f_{XY}(x,y)=P(X=x,Y=y)$, including the valid range of $(x,y)$.  
3. Derive the marginal distribution of $X$, i.e., $f_X(x)=P(X=x)$.  
4. Derive the marginal distribution of $Y$, i.e., $f_Y(y)=P(Y=y)$.  

---

## Solution

### Step 1: Clarify what is observed and what is fixed

The sample size is fixed at 20. This means exactly 20 parts are observed in total.

In each sample:
- $X$ counts how many of the 20 are conforming.
- $Y$ counts how many of the 20 are nonconforming.

Since every sampled part must fall into exactly one of these two categories, the counts must satisfy

$$
X+Y=20
$$

This is not an assumption. It is a direct consequence of counting.

So, once $X$ is known, $Y$ is determined automatically:

$$
Y = 20 - X
$$

This constraint is important when interpreting the “joint” behavior.

---

### Step 2: Decide whether the joint distribution is multinomial

A multinomial model is appropriate when:
- trials are treated as independent (or effectively independent), and
- category probabilities stay constant across trials.

That typically matches **sampling with replacement**, where each draw is made from the same population composition.

In this problem, sampling is done **without replacement**. After each draw, the batch composition changes slightly. For example:
- if a conforming part is drawn, there is one fewer conforming part remaining,
- so the probability that the next draw is conforming changes.

This dependence means multinomial assumptions do not hold.

A second structural reason also rules out a multinomial interpretation for a “free” two-dimensional count vector: the pair $(X,Y)$ must satisfy $X+Y=20$, so the joint pmf has support only on a single line in the $(x,y)$ plane.

Therefore, the joint distribution of $(X,Y)$ is **not multinomial**.

---

### Step 3: Write the joint pmf of $(X,Y)$

Because sampling is without replacement, the probability is computed by counting combinations.

To obtain the event $(X=x, Y=y)$ in a sample of size 20:
- choose $x$ conforming parts from the $80$ available,
- choose $y$ nonconforming parts from the $20$ available,
- and the total number of ways to choose any 20 parts from the 100 is the denominator.

So the joint probability is

$$
P(X=x, Y=y)
=
\frac{\binom{80}{x}\binom{20}{y}}{\binom{100}{20}}
$$

Now specify the valid range. Since the sample size is 20,

$$
x+y=20,
\quad x \in \{0,1,\ldots,20\},
\quad y=20-x
$$

If $x+y \ne 20$, then

$$
P(X=x,Y=y)=0
$$

A common compact form is:

$$
P(X=x, Y=20-x)
=
\frac{\binom{80}{x}\binom{20}{20-x}}{\binom{100}{20}},
\quad x=0,1,\ldots,20
$$

**Visualization**. To visualize the joint probability mass function, it is sometimes helpful to imagine probability as a vertical height above the $(x,y)$ plane. In this representation, each possible pair $(x,y)$ is associated with a vertical bar whose height equals $P(X=x,Y=y)$.

The figure below shows a three-dimensional view of the joint pmf for this example. Each vertical bar represents one feasible outcome. The base of the bar indicates the values of $X$ and $Y$, and the height of the bar represents the joint probability.

```{raw} html
<iframe src="../_static/joint_pmf_3d.html"
        width="100%"
        height="520px"
        style="border:none;">
</iframe>
```

Although this visualization shows probability explicitly as height, it also reveals an important structural feature: probability mass appears only along a single diagonal line. Large regions of the $(x,y)$ plane contain no bars at all because outcomes off the line $x+y=20$ are impossible. This observation motivates the use of lower-dimensional representations and leads naturally to marginal distributions.

---

### Step 4: Derive the marginal distribution of $X$

By definition, the marginal distribution of $X$ is obtained by summing the joint pmf over all possible values of $Y$:

$$
f_X(x)=P(X=x)=\sum_y P(X=x, Y=y)
$$

In this problem, the sample size is fixed at 20. As a result, the two variables are linked by the constraint

$$
X + Y = 20
$$

This constraint leads to an important simplification. For any fixed value of $x$, there is only one value of $y$ that can occur, namely $y=20-x$. All other values of $y$ are impossible and have zero probability. Therefore, the summation over $y$ contains only a single nonzero term:

$$
P(X=x)=P(X=x, Y=20-x)
$$

Substituting the joint pmf formula gives

$$
P(X=x)
=
\frac{\binom{80}{x}\binom{20}{20-x}}{\binom{100}{20}},
\quad x=0,1,\ldots,20
$$

This is the **hypergeometric pmf**, which describes the number of conforming parts in a sample of size 20 drawn without replacement from a batch of 100 parts containing 80 conforming items.

The figure below visualizes this marginal distribution. Each bar corresponds to a possible value of $x$, the number of conforming parts in the sample. The height of the bar represents the probability $P(X=x)$. Taller bars indicate values of $x$ that are more likely to occur under this sampling process.  

```{raw} html
<iframe src="../_static/marginal_pmf_X.html"
        width="100%"
        height="520px"
        style="border:none;">
</iframe>
```

Viewed alongside the joint distribution, this plot illustrates how marginalization works in practice. The joint pmf assigns probability only to pairs $(x,y)$ lying on the line $x+y=20$, reflecting the fixed sample size. The marginal distribution of $X$ collapses this joint information into a single dimension by summing over all compatible values of $Y$. In doing so, it preserves the overall variability of $X$ while ignoring the explicit values of $Y$.

---

### Step 5: Derive the marginal distribution of $Y$

Similarly, by definition, the marginal distribution of $Y$ is obtained by summing the joint pmf over all possible values of $X$

$$
f_Y(y)=P(Y=y)=\sum_x P(X=x,Y=y)
$$

As in the previous step, the fixed sample size implies a deterministic relationship between the two variables.

$$
X + Y = 20
$$

For a fixed value of $y$, the only compatible value of $x$ is therefore $x=20-y$. All other values of $x$ are impossible and have zero probability. This reduces the summation to a single nonzero term.

$$
P(Y=y)=P(X=20-y,Y=y)
$$

Substituting the joint pmf gives

$$
P(Y=y)
=
\frac{\binom{80}{20-y}\binom{20}{y}}{\binom{100}{20}},
\quad y=0,1,\ldots,20
$$

This marginal distribution is also hypergeometric and describes the number of nonconforming parts in the sample

```{raw} html
<iframe src="../_static/marginal_pmf_Y.html"
        width="100%"
        height="520px"
        style="border:none;">
</iframe>
```

In this plot above on the marginal pmf of $Y$, each bar corresponds to a possible value of $y$, the number of nonconforming parts in the sample, and the height of the bar represents the probability $P(Y=y)$.

Comparing the marginal pmfs of $X$ and $Y$, we observe that they have the same shape. This is a direct consequence of the fixed sample size, which links the two variables through the relationship.

$$
Y = 20 - X
$$

Because of this deterministic relationship, knowing the value of one variable automatically determines the value of the other. The two marginal distributions therefore contain the same information, expressed on different horizontal axes.

Once this relationship is understood, it is sufficient to focus on the marginal distribution of one variable. In this context, the marginal pmf of $X$ is often emphasized because it directly describes the number of conforming parts in the sample.

---

#### Reconnecting Marginal Views with the Joint Structure

Taken together, the marginal distributions of $X$ and $Y$ provide one-dimensional summaries of the joint behavior. Each marginal describes how a single count varies across repeated samples, without explicitly showing how the two counts are linked in the same observation.

To reconnect these one-dimensional views with the original joint structure, it is helpful to return to a visualization of the joint pmf itself. The joint plot makes explicit which pairs $(x,y)$ are possible and how probability is distributed across those pairs. In particular, it highlights the constraint imposed by the fixed sample size, which underlies the similarity between the two marginal distributions.

The plot below shows that the joint pmf places probability only on the diagonal line $x+y=20$. Marker size increases with probability to show where outcomes are more likely.  

```{raw} html
<iframe src="../_static/joint_pmf_diagonal.html"
        width="100%"
        height="520px"
        style="border:none;">
</iframe>
```

The joint plot also provides a natural starting point for asking more focused questions. Instead of considering all possible outcomes together, attention can be restricted to situations where one variable takes a specific value. For example, one may ask how the number of conforming parts behaves **given** that a certain number of nonconforming parts is observed.

This type of question cannot be answered using marginal distributions alone. Marginal distributions describe overall variability, but they do not distinguish between different operating conditions or observed outcomes. To make such distinctions, the joint distribution must be examined condition by condition.

Graphically, conditioning corresponds to selecting a subset of the joint distribution and renormalizing the probabilities within that subset. In the joint plot above, this can be visualized by fixing a particular value of $Y$ and looking only at the point on the diagonal that is compatible with that value. In more general settings, conditioning corresponds to taking a “slice” of the joint distribution.

This idea leads to the concept of **conditional distributions**, which describe the behavior of one random variable when the value of another is known. Conditional distributions build directly on the joint distribution and provide a way to quantify how information about one variable changes expectations about the other.
