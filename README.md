# Investigating the Behavior of a Function Near a Singularity

This project studies the behavior of the function

$$
F(h) = \frac{e^{-h^2} - 1}{h^2}
$$

for small, positive values of $h$.  
Although the function is **undefined** at $h = 0$ due to division by zero, its **limit** exists and is meaningful.

The investigation is divided into two main phases:

- **Phase 1:** Numerical exploration  
- **Phase 2:** Analytical verification  

---

## Phase 1 — Numerical Exploration and Limit Estimation

The goal of this phase is to understand the behavior of $F(h)$ **empirically**.

### 1. Computational Implementation

A script computes $F(h)$ for a carefully chosen sequence of decreasing values approaching zero:

$$
h = 10^{-1}, 10^{-2}, 10^{-3}, \dots, 10^{-16}
$$

### 2. Visualization and Trend Analysis

- The computed values are plotted, typically with a **logarithmic scale** on the $h$-axis.
- As $h$ decreases, $F(h)$ **converges toward a finite limit**.
- This provides a **numerical estimate** of the limit:

$$
L = \lim_{h \to 0} F(h)
$$

### 3. Identifying Numerical Instability

For very small $h$ (typically $h < 10^{-8}$), the computation **breaks down** due to **catastrophic cancellation**:

- **Cause**:  
  - The numerator $e^{-h^2} - 1$ subtracts two numbers extremely close to 1.  
  - Finite-precision arithmetic wipes out significant digits, leaving mostly rounding errors.

- **Effect**:  
  - Dividing this tiny numerator by the even smaller denominator $h^2$ **amplifies** rounding errors.  
  - Computed values deviate wildly from the true trend, sometimes returning $0$.

> **Key takeaway:** Numerical computations have **precision limits**, especially near singularities.

---

## Phase 2 — Analytical Solution and Convergence Rate

This phase transitions from numerical approximations to **exact analysis**.

### 1. Analytical Limit Calculation

Using the **Taylor series** expansion for $e^{-h^2}$:

$$
e^{-h^2} = 1 - h^2 + \frac{h^4}{2} - \dots
$$

Substituting into $F(h)$:

$$
\begin{align}
F(h) &= \frac{(1 - h^2 + \frac{h^4}{2} - \dots) - 1}{h^2} \\
&= \frac{-h^2 + \frac{h^4}{2} - \dots}{h^2} \\
&= -1 + \frac{h^2}{2} - \dots
\end{align}
$$

Taking the limit as $h \to 0$:

$$
\boxed{L = \lim_{h \to 0} F(h) = -1}
$$

---

### 2. Error Quantification and Convergence Rate

With the exact value $L = -1$, we measure **how fast** $F(h)$ approaches its limit.

- **Absolute error**:

$$
E(h) = |F(h) - L| = |F(h) + 1|
$$

- From the series expansion:

$$
F(h) = L + \frac{h^2}{2} + O(h^4)
$$

Thus, for small $h$:

$$
E(h) \approx \frac{h^2}{2}
$$

- On a **log-log plot** of $E(h)$ vs. $h$, the slope of the straight-line region gives the **order of convergence** $p$:

$$
E(h) \propto h^p
$$

From the series expansion:

$$
\boxed{p = 2}
$$

---
