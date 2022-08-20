# riflogit
Stata module to fit unconditional logistic regression

`riflogit` fits an unconditional logistic regression by applying least-squares
estimation to the RIF (recentered influence function) of the marginal log odds
of a positive outcome. The exponents of the coefficients have an (approximate)
marginal odds ratio interpretation.

---

Installation from GitHub:

    . net install riflogit, replace from(https://raw.githubusercontent.com/benjann/riflogit/main/)

---

Main changes:

    20aug2022
    - -predict- revised

    15aug2022
    - riflogit released on GitHub
