-- Logistic Regression — authored, human-reviewed master.
-- statistics/regression-and-modeling/logistic-regression @ research/advanced/read.
-- Heavy KaTeX ($…$ inline, $$…$$ display). {{image}} markers resolve to
-- Wikipedia at read time (see Reader.tsx). Curated quiz at the bottom. Applied
-- by db-migrate after seed.sql; idempotent upsert.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'statistics/regression-and-modeling/logistic-regression',
    'research',
    'advanced',
    'read',
    $lr_master$## I. The Problem With a Straight Line

Vast tracts of empirical science ask questions with two-valued answers. Does the patient survive? Does the loan default? Does the voter turn out, the email spam filter fire, the O-ring fail at launch temperature? In each case we observe a binary outcome $Y \in \{0, 1\}$ together with covariates $\mathbf{x} = (x_1, \ldots, x_p)$, and the scientific question is not "what is $Y$?" — for a single case, $Y$ is simply whatever happens — but "how does the probability of $Y = 1$ depend on $\mathbf{x}$?" Logistic regression is the canonical answer, and it is worth understanding deeply, because it sits at a crossroads: it is simultaneously a workhorse of applied statistics, the simplest generalized linear model beyond ordinary least squares, the maximum-entropy classifier of machine learning, and the final layer of essentially every neural network that outputs a probability.

The naive approach — regress $Y$ on $\mathbf{x}$ by ordinary least squares, the so-called linear probability model — fails instructively. Writing $P(Y=1 \mid \mathbf{x}) = \beta_0 + \boldsymbol{\beta}^\top \mathbf{x}$ has three defects. First, the right-hand side ranges over all of $\mathbb{R}$ while the left-hand side must live in $[0,1]$; fit the model to data with a wide covariate range and it will cheerfully predict probabilities of $-0.3$ or $1.7$. Second, the errors cannot be homoskedastic: a Bernoulli variable with mean $p$ has variance $p(1-p)$, which changes with $\mathbf{x}$, so the OLS standard-error machinery is wrong by construction. Third, and most substantively, a straight line asserts that a unit change in $x$ shifts the probability by the same amount everywhere — that a risk factor moves a patient from 50% to 60% mortality as easily as from 98% to 108%. Nature rarely behaves this way; effects on probabilities compress near the boundaries. What we want is a model that is linear where linearity is plausible — in some transformed scale of the probability — and respects the $[0,1]$ constraint automatically.

## II. Odds, Log-Odds, and the Logistic Function

The transformation that accomplishes this is the logit. For a probability $p$, define the odds $p/(1-p)$ — the ratio familiar from gambling, running from $0$ to $\infty$ as $p$ runs from $0$ to $1$ — and then the log-odds, or logit,

$$ \operatorname{logit}(p) = \ln \frac{p}{1-p}, $$

which maps $(0,1)$ smoothly onto the entire real line, with $p = 1/2$ corresponding to logit $0$. Logistic regression is the assertion that the log-odds are linear in the covariates:

$$ \ln \frac{P(Y = 1 \mid \mathbf{x})}{1 - P(Y=1 \mid \mathbf{x})} = \beta_0 + \beta_1 x_1 + \cdots + \beta_p x_p \equiv \eta(\mathbf{x}). $$

Inverting gives the probability directly:

$$ P(Y=1 \mid \mathbf{x}) = \frac{e^{\eta}}{1 + e^{\eta}} = \frac{1}{1 + e^{-\eta}} \equiv \sigma(\eta), $$

where $\sigma(\cdot)$ is the logistic (sigmoid) function: an S-shaped curve, strictly increasing, asymptoting to $0$ and $1$, symmetric about its midpoint ($\sigma(-\eta) = 1 - \sigma(\eta)$), and satisfying the pleasant derivative identity $\sigma'(\eta) = \sigma(\eta)\,(1 - \sigma(\eta))$ that will grease every calculation below.

{{image: Logistic function | The logistic (sigmoid) function: an S-shaped curve, strictly increasing and asymptoting to 0 and 1, that maps the log-odds on the whole real line back to a probability in [0,1].}}

The curve was introduced by Pierre-François Verhulst in the 1830s–40s to model population growth saturating at a carrying capacity (he coined *logistique*); its statistical career runs through bioassay in the 1930s–40s, where Joseph Berkson championed the "logit" against the rival "probit," through David Cox's foundational work in the 1950s–60s, to its present ubiquity.

{{image: Pierre François Verhulst | Pierre-François Verhulst, who introduced the logistic curve in the 1830s–40s to model population growth saturating at a carrying capacity — and coined the word "logistique".}}

Two complementary readings of the model coexist and are both worth internalizing. The latent-variable reading: imagine a continuous unobserved propensity $Y^* = \eta(\mathbf{x}) + \varepsilon$, with $Y = 1$ exactly when $Y^*$ crosses zero. If $\varepsilon$ follows the standard logistic distribution (a bell-shaped density with slightly heavier tails than the normal, variance $\pi^2/3$), the observable model is exactly logistic regression; if $\varepsilon$ is standard normal, one gets probit regression instead. The two link functions are nearly proportional over the central range (logit coefficients ≈ 1.6–1.8 × probit coefficients), and in practice they rarely disagree substantively; the logit wins on interpretability, as the next section shows. The direct reading: the model is simply a parametric family for the conditional Bernoulli mean, with no latent story required — the stance of the generalized-linear-model framework we adopt in Section V.

## III. What the Coefficients Mean

The single most important practical skill with logistic regression is reading its coefficients correctly, and the key word is *multiplicative*.

Because the model is linear in log-odds, a one-unit increase in $x_j$, holding other covariates fixed, adds $\beta_j$ to the log-odds — equivalently, multiplies the odds by $e^{\beta_j}$, the odds ratio (OR). A coefficient of $\beta_j = 0.7$ means each unit of $x_j$ multiplies the odds of the outcome by $e^{0.7} \approx 2.0$: a doubling of odds, whether from 1:10 to 2:10 or from 1:1 to 2:1. For a binary covariate (treated vs. control, exposed vs. not), $e^{\beta_j}$ is precisely the classical odds ratio of the associated 2×2 table, adjusted for the other covariates — the bridge that makes logistic regression the lingua franca of epidemiology. The intercept $\beta_0$ is the log-odds when all covariates are zero, meaningful only if zero is a meaningful covariate profile (center your covariates).

Three subtleties temper this clean story. First, odds are not probabilities, and odds ratios exceed risk ratios whenever the outcome is common: an OR of 2 corresponds to a risk ratio of 2 when the baseline risk is 1% but only about 1.3 when the baseline risk is 50%. Reporting an OR of 3 as "three times as likely" is one of the most common quantitative errors in press coverage of medical research; it is approximately true only for rare outcomes (the rare-disease approximation). Second, the effect of $x_j$ on the probability scale is not constant: differentiating, $\partial p / \partial x_j = \beta_j\,p(1-p)$, which is largest at $p = 1/2$ (where it equals $\beta_j / 4$ — the useful "divide by four" rule for a quick upper bound on the probability effect) and vanishes toward the boundaries. Honest applied work therefore often supplements odds ratios with marginal effects — the model-implied change in probability, averaged over the sample or evaluated at representative covariate profiles. Third, odds ratios are non-collapsible: even in the absence of confounding, the OR from a model that omits a covariate related to the outcome is generally attenuated toward 1 relative to the covariate-adjusted OR — marginal and conditional odds ratios differ as a mathematical fact, not a bias. Comparing ORs across models with different covariate sets, or across studies, requires correspondingly more care than comparing linear-regression slopes.

## IV. Estimation: Maximum Likelihood and Its Geometry

There is no closed-form estimator; logistic regression is fit by maximum likelihood. Given independent observations $(\mathbf{x}_i, y_i)$, each $y_i$ is Bernoulli with success probability $p_i = \sigma(\eta_i)$, $\eta_i = \beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i$, so the log-likelihood is

$$ \ell(\boldsymbol{\beta}) = \sum_{i=1}^n \Big[ y_i \ln p_i + (1 - y_i) \ln (1 - p_i) \Big] = \sum_{i=1}^n \Big[ y_i \eta_i - \ln\!\big(1 + e^{\eta_i}\big) \Big]. $$

(Machine learning knows the negative of this, averaged, as the cross-entropy loss or log loss; identical object, different community.) Differentiating with the identity $\sigma' = \sigma(1-\sigma)$ yields score equations of striking simplicity:

$$ \frac{\partial \ell}{\partial \boldsymbol{\beta}} = \sum_{i=1}^n (y_i - p_i)\,\mathbf{x}_i = \mathbf{0}. $$

At the maximum, the residuals $y_i - \hat{p}_i$ are orthogonal to every covariate — the exact analogue of the normal equations of least squares, with fitted probabilities in place of fitted values. One immediate consequence: if the model contains an intercept, $\sum_i \hat p_i = \sum_i y_i$ — the average fitted probability equals the observed event rate, so the model is calibrated in the large by construction.

The second derivative reveals why estimation is easy. The Hessian,

$$ \frac{\partial^2 \ell}{\partial \boldsymbol{\beta}\,\partial \boldsymbol{\beta}^\top} = - \sum_{i=1}^n p_i (1 - p_i)\,\mathbf{x}_i \mathbf{x}_i^\top = - \mathbf{X}^\top \mathbf{W} \mathbf{X}, \qquad \mathbf{W} = \operatorname{diag}\!\big(p_i(1-p_i)\big), $$

is negative semidefinite everywhere: the log-likelihood is globally concave, so any interior stationary point is the unique global maximum, and Newton's method converges rapidly from almost any start. Newton's update has a famous interpretation: it is equivalent to solving a weighted least-squares problem on a linearized "working response," iterated to convergence — iteratively reweighted least squares (IRLS), the algorithm inside every serious statistics package. The weights $p_i(1-p_i)$ say something intuitive: observations whose fitted probabilities are near $0$ or $1$ carry little information about the coefficients; the data near the decision boundary do the work. At scale — millions of observations, high-dimensional sparse features — the same objective is minimized instead by (stochastic) gradient methods or quasi-Newton algorithms like L-BFGS, a reminder that "logistic regression" names a model, not an algorithm.

Standard asymptotics then deliver inference: $\hat{\boldsymbol{\beta}}$ is consistent and asymptotically normal with covariance $(\mathbf{X}^\top \mathbf{W} \mathbf{X})^{-1}$ evaluated at the fit, the inverse Fisher information. But the theory is asymptotic, and Section VII confronts the finite-sample ways it can fail.

## V. The GLM View: Why the Logit Is Canonical

Logistic regression is the flagship instance of the generalized linear model (Nelder and Wedderburn, 1972), a framework worth a short detour because it explains features of the model that otherwise look like coincidences. A GLM has three components: a response distribution from the exponential family, a linear predictor $\eta = \mathbf{x}^\top \boldsymbol{\beta}$, and a link function joining the distribution's mean to $\eta$. The Bernoulli distribution, written in exponential-family form,

$$ P(Y = y) = p^y (1-p)^{1-y} = \exp\!\Big( y \ln \tfrac{p}{1-p} + \ln(1 - p) \Big), $$

carries its natural parameter in plain sight: the coefficient of $y$ is exactly $\ln \frac{p}{1-p}$, the logit. Choosing the logit as link — the canonical link — therefore means modeling the natural parameter itself linearly, and canonical links buy concrete benefits: the score equations take the residual form $\sum (y_i - p_i)\mathbf{x}_i = \mathbf{0}$ seen above; $\mathbf{X}^\top \mathbf{y}$ is a sufficient statistic; observed and expected Fisher information coincide; and the log-likelihood is concave. Probit and complementary log-log links define perfectly respectable Bernoulli GLMs — the latter is the natural choice when the binary outcome arises from an underlying count or time-to-event process — but they forfeit these conveniences, which is part of why the logit became the default.

The GLM view also supplies the model's goodness-of-fit currency, the deviance: $D = 2(\ell_{\text{sat}} - \ell_{\text{model}})$, twice the log-likelihood gap to a saturated model. Nested models are compared by deviance differences, which are likelihood-ratio statistics — the subject of the next section. One caution inherited from the Bernoulli likelihood: with ungrouped binary data the residual deviance does not have an asymptotic $\chi^2$ distribution and is useless as an absolute fit test, a trap that snares many first-time users; deviance differences between nested models remain valid.

## VI. Inference: Three Roads Up the Same Mountain

For any hypothesis about coefficients — most often $H_0: \beta_j = 0$ — likelihood theory offers three asymptotically equivalent tests, each measuring, in a different geometry, how far the data sit from the hypothesis.

The Wald test asks how many standard errors $\hat\beta_j$ lies from zero: $z = \hat\beta_j / \widehat{\operatorname{se}}(\hat\beta_j)$, with the standard error drawn from the inverse information matrix. It is what regression tables print, and it requires fitting only the full model. The likelihood-ratio test (LRT) refits without the term and compares fits: $\Lambda = 2(\ell_{\text{full}} - \ell_{\text{reduced}}) \sim \chi^2$ under $H_0$. The score test stands at the null and asks how steeply the likelihood rises toward the alternative, requiring only the reduced model. In large samples with well-behaved data the three agree; when they disagree, trust the LRT. The Wald test in logistic regression has a specific pathology (the Hauck–Donner effect): as an effect grows very large, its estimated standard error inflates faster than the estimate, so the Wald statistic can shrink and lose significance exactly when the evidence is overwhelming. For the same reason, confidence intervals for odds ratios are better obtained by profile likelihood — collecting all values of $\beta_j$ the LRT would not reject — than by exponentiating Wald limits, especially in modest samples; good software offers both.

For overall model comparison and selection, the likelihood also feeds AIC and BIC in the usual way, and out-of-sample log loss or cross-validated performance increasingly serves as the arbiter in predictive applications — a hint of the two-cultures split addressed in Section X.

## VII. Where It Breaks: Separation, Rarity, and Dimensionality

Logistic regression's failure modes are as instructive as its successes, and three deserve permanent residence in the practitioner's mind.

**Complete separation.** If some linear combination of covariates perfectly divides the 1s from the 0s — guaranteed to happen eventually as covariates multiply, and common in small samples — the likelihood has no maximum: it increases forever as $|\boldsymbol{\beta}| \to \infty$, driving fitted probabilities to exactly 0 and 1. Software symptoms are enormous coefficients with absurd standard errors, or convergence warnings. The perverse consequence: the strongest possible predictor produces the least usable output. The standard remedy is penalization: Firth's bias-reduced logistic regression (penalizing by the Jeffreys prior) guarantees finite estimates and has become the default in small-sample biostatistics, while ridge or weakly informative Bayesian priors (e.g., Gelman et al.'s recommendation of heavy-tailed priors on standardized coefficients) accomplish the same stabilization in predictive settings.

**Rare events and small samples.** Maximum likelihood is only asymptotically unbiased, and with few events the finite-sample bias pushes odds ratios away from 1 — models look stronger than they are. The classical sample-size folklore, "at least ten events per variable (EPV)," derives from simulation studies of exactly this degradation; modern work treats ten as a soft floor, not a license. King and Zeng's rare-events corrections and, again, Firth's penalty are the standard tools. Relatedly, case-control sampling — deliberately over-sampling the rare cases, the workhorse design of epidemiology — enjoys a small miracle owed to the logit link specifically: retrospective sampling on the outcome biases only the intercept, leaving all slope coefficients (hence all odds ratios) consistently estimated. No other standard link has this property, and it is a major reason the odds ratio, despite its interpretive awkwardness, rules medical statistics.

**Dimensionality and collinearity.** With $p$ comparable to $n$, or with strongly collinear covariates, the information matrix degenerates and estimates destabilize, exactly as in linear regression but with separation lurking as the extreme case. The modern response is regularization: ridge ($\ell_2$) shrinkage for stability, lasso ($\ell_1$) for simultaneous selection and shrinkage, elastic net for both — all fitted by fast coordinate-descent algorithms and tuned by cross-validation. Penalized estimates trade bias for variance and forfeit the classical inferential guarantees (naive post-selection p-values are invalid; honest post-selection inference is an active research area), but for prediction they routinely dominate the unpenalized fit.

## VIII. Judging the Model: Discrimination Is Not Calibration

Assessing a probability model requires separating two virtues that are frequently conflated.

*Discrimination* asks: does the model rank 1s above 0s? Its standard summary is the ROC curve — the trace of true-positive rate against false-positive rate as the classification threshold sweeps from 1 to 0 — and its area, the AUC (equivalently the concordance statistic $c$): the probability that a randomly chosen event receives a higher fitted probability than a randomly chosen non-event. AUC 0.5 is coin-flipping; 1.0 is perfect ranking; real clinical models typically live between 0.7 and 0.9.

{{image: Receiver operating characteristic | An ROC curve traces the true-positive rate against the false-positive rate as the threshold sweeps; its area (AUC) is the probability the model scores a random event above a random non-event.}}

*Calibration* asks the different question: when the model says 30%, does the event happen about 30% of the time? It is checked by calibration plots (observed event frequency against predicted probability, ideally the identity line), by the calibration slope and intercept, or — with well-known low power and arbitrariness — the Hosmer–Lemeshow grouped test. A model can discriminate superbly while systematically overstating every risk (miscalibrated), or be perfectly calibrated while barely discriminating; which failure matters depends on use. A triage system that only ranks patients needs discrimination; a consent conversation quoting a personal risk needs calibration. The Brier score, mean squared error on probabilities, and out-of-sample log loss are proper scoring rules that reward both virtues at once and cannot be gamed by hedging — the right currency for comparing probabilistic predictors. Pseudo-$R^2$ measures (McFadden's $1 - \ell_{\text{model}}/\ell_{\text{null}}$ and relatives) provide rough effect-size intuition but have no percent-variance interpretation and should be reported, if at all, with that disclaimer. Above all: evaluate on data the model has not seen. In-sample performance flatters, and the flattery grows with model flexibility.

## IX. A Worked Case: The Challenger O-Rings

No dataset teaches logistic regression's stakes better than the one analyzed by Dalal, Fowlkes, and Hoadley (1989) after the Space Shuttle Challenger disaster.

{{image: Space Shuttle Challenger disaster | The Challenger disaster of 28 January 1986. A logistic regression of O-ring distress on temperature, fit to all 23 prior flights, assigned near-certain risk at the launch morning's cold — a warning available before launch.}}

Before the launch of 28 January 1986, engineers debated whether the forecast temperature — about 31 °F, far colder than any previous launch — endangered the solid rocket boosters' O-ring seals. The data available were 23 previous flights, each with the launch temperature and whether any O-ring showed thermal distress. Crucially, part of the pre-launch discussion examined only the seven flights that had incidents, among which no temperature pattern is obvious — conditioning on the outcome and discarding the sixteen clean, mostly warm launches, a textbook selection error.

Fit a logistic regression of any-distress on temperature $t$ (in °F) using all 23 flights and one obtains approximately

$$ \operatorname{logit}\big(\hat p(t)\big) = 15.04 - 0.232\,t. $$

Every element of the preceding sections now does work. The slope: each additional degree Fahrenheit multiplies the odds of O-ring distress by $e^{-0.232} \approx 0.79$ — a 21% odds reduction per degree, or equivalently each 10 °F of warmth cuts the odds to about $e^{-2.32} \approx 0.10$ of their value. The fitted probabilities: at 75 °F, $\hat p = \sigma(15.04 - 17.4) \approx 0.09$; at 65 °F, $\hat p \approx 0.49$; extrapolated to the launch morning's 31 °F, $\hat p = \sigma(7.85) \approx 0.9996$ — near-certain distress. The caveats: 31 °F lies well outside the observed temperature range (53–81 °F), so this is model-based extrapolation with wide profile-likelihood uncertainty, and with only 23 observations and 7 events the sample sits below every EPV guideline of Section VII. The honest statistical statement in January 1986 would not have been "the probability is 0.9996"; it would have been "every defensible model fitted to all the data assigns high and rapidly increasing risk as temperature falls, with uncertainty that widens — in the dangerous direction — outside the observed range." That statement was available, and it was not made with the data assembled this way. The example endures because it compresses the discipline's lessons into one morning: use all the data, respect the fitted scale, quantify uncertainty, and treat extrapolation as a flag, not a forecast.

## X. Two Cultures, One Model

Logistic regression leads a double life. In its statistical life, the coefficients are the point: carefully chosen covariates, odds ratios with confidence intervals, confounding and effect modification, the machinery of Sections VI–VII. In its machine-learning life, the fitted probabilities are the point: the model is the linear classifier obtained by thresholding $\sigma(\mathbf{x}^\top\boldsymbol{\beta})$, its decision boundary the hyperplane $\mathbf{x}^\top\boldsymbol{\beta} = 0$, trained by minimizing cross-entropy, regularized by default, judged by held-out AUC and log loss. The two cultures use identical mathematics with different loyalties, and fluency means switching frames deliberately.

Three connections make the ML frame illuminating rather than merely renaming. First, logistic regression is the maximum-entropy model: among all distributions for $Y$ given $\mathbf{x}$ that match the empirical feature-outcome correlations, the logistic form is the one assuming least beyond the data. Second, its multiclass extension — multinomial (softmax) regression, $P(Y = k \mid \mathbf{x}) \propto e^{\mathbf{x}^\top \boldsymbol{\beta}_k}$ — is exactly the output layer of a modern neural network; a network is, from this angle, logistic regression on features it has learned for itself, and the sigmoid's derivative identity from Section II is what backpropagation differentiates. Third, the contrast with linear discriminant analysis clarifies what logistic regression does *not* assume: LDA models the covariate distribution within each class as Gaussian and derives the (also linear, also logistic-in-form) posterior; logistic regression models the conditional probability directly and makes no claim about how $\mathbf{x}$ is distributed — a discriminative rather than generative strategy, more robust when the covariates are decidedly non-Gaussian, less efficient when the generative assumptions happen to hold. That said, the linear predictor is an assumption too: nothing prevents — and good practice often requires — enriching it with transformations, splines, and interactions, at which point "linear" refers only to linearity in the parameters.

## XI. Extensions and Neighbors

The logistic template generalizes along every axis. Ordinal outcomes (disease stage, survey agreement scales) are handled by the proportional-odds model, which posits one coefficient vector shifting a set of ordered intercepts — an assumption to test, not assume. Nominal multi-category outcomes get multinomial logit; economists build discrete-choice theory on it, following McFadden (Nobel Prize, 2000), whose random-utility derivation shows multinomial logit emerging exactly when latent utilities carry Gumbel-distributed noise — at the price of the independence of irrelevant alternatives property, whose famous red-bus/blue-bus pathology motivates nested and mixed logit repairs. Correlated data — patients within hospitals, repeated measures within subjects — call for random-intercept (mixed-effects) logistic models or GEE marginal models, which answer subtly different questions (subject-specific versus population-averaged effects: non-collapsibility again). Bayesian logistic regression replaces penalties with priors and delivers full posterior uncertainty, computed by MCMC or fast approximations (Pólya-Gamma augmentation being the elegant modern trick). And conditional logistic regression handles matched case-control sets by conditioning nuisance intercepts away entirely. Few models radiate into as many fields while remaining recognizably one idea.

## XII. Coda: The Right Scale for Belief

Step back and logistic regression is one idea executed with unusual thoroughness: find the scale on which probability is willing to be linear. The logit is that scale — unbounded, symmetric, additive in evidence (in Bayesian terms, the posterior log-odds are the prior log-odds plus the log-likelihood ratio, so independent pieces of evidence literally add on the logit scale, which is why the model keeps being rediscovered by every field that reasons under uncertainty). Its coefficients demand multiplicative reading, its estimation is a textbook piece of convex likelihood theory, its failure modes (separation, rarity, extrapolated calibration) are well-charted, and its descendants staff both the epidemiology literature and the output layers of deep networks. Master it and you hold the hinge connecting classical statistical inference to modern predictive machine learning — one model, two cultures, and a single S-shaped curve doing an improbable amount of the modern world's quantitative reasoning.

---

## Further Reading

- **David W. Hosmer, Stanley Lemeshow, and Rodney X. Sturdivant, *Applied Logistic Regression* (3rd ed., 2013).** The standard applied treatment, from model-building to diagnostics.
- **Alan Agresti, *Categorical Data Analysis* (3rd ed., 2013).** The authoritative broader reference for categorical-response models.
- **Peter McCullagh and John Nelder, *Generalized Linear Models* (2nd ed., 1989).** The GLM theory behind Section V, from the source.
- **Trevor Hastie, Robert Tibshirani, and Jerome Friedman, *The Elements of Statistical Learning* (2nd ed., free online), chapter 4.** The predictive-modeling and regularization perspective.
- **Ewout Steyerberg, *Clinical Prediction Models* (2nd ed., 2019).** The essential reference on validation and calibration.
- **David Firth, "Bias reduction of maximum likelihood estimates" (*Biometrika*, 1993).** The origin of the separation remedy in Section VII.
- **Gary King and Langche Zeng, "Logistic regression in rare events data" (*Political Analysis*, 2001).** The standard rare-events corrections.
- **Andrew Gelman, Aleks Jakulin, Maria Grazia Pittau, and Yu-Sung Su, "A weakly informative default prior distribution for logistic and other regression models" (*Annals of Applied Statistics*, 2008).** Default priors that stabilize logistic coefficients.$lr_master$,
    true,
    true
  )
  on conflict (node_id, depth, level, format) do update
    set body = excluded.body, generated = excluded.generated, reviewed = excluded.reviewed
    where content.body is distinct from excluded.body
       or content.generated is distinct from excluded.generated
       or content.reviewed is distinct from excluded.reviewed
  returning node_id
)
delete from content
where node_id in (select node_id from master)
  and not (depth = 'research' and level = 'advanced' and format = 'read');

-- Curated, human-reviewed quiz — same set served at every level.
with q as (
  select $lr_quiz$[
    {"id":"q1","type":"mcq","prompt":"Why is the 'linear probability model' (fitting a binary outcome by ordinary least squares) unsatisfactory?","options":["It cannot include more than one predictor","Its linear predictor can fall outside 0 and 1, its errors are heteroskedastic, and it forces a constant effect on probability everywhere","It requires the outcome to be normally distributed","It has no closed-form estimator"],"answerIndex":1,"explanation":"A straight line ranges over the whole real line while a probability must lie in 0 to 1; a Bernoulli variable's variance p(1-p) changes with the covariates, so OLS standard errors are wrong; and a line assumes the same probability change everywhere, whereas real effects compress near 0 and 1. The logit link fixes all three."},
    {"id":"q2","type":"mcq","prompt":"In logistic regression, a coefficient of beta_j = 0.7 for covariate x_j means that a one-unit increase in x_j (holding others fixed):","options":["Adds 0.7 to the probability of the outcome","Multiplies the ODDS of the outcome by e^0.7, about 2.0 (an odds ratio)","Multiplies the probability by 2.0","Has no interpretable effect"],"answerIndex":1,"explanation":"The model is linear in the log-odds, so a one-unit change adds beta_j to the log-odds and multiplies the ODDS by e^(beta_j) — the odds ratio. It does NOT multiply the probability; the effect on the probability scale is beta_j*p(1-p), largest at p = 1/2 and vanishing near the boundaries."},
    {"id":"q3","type":"mcq","prompt":"Reporting an odds ratio as a risk ratio ('three times as likely') is approximately valid only when:","options":["The sample is large","The outcome is rare","The predictor is binary","The model is well calibrated"],"answerIndex":1,"explanation":"Odds ratios exceed risk ratios whenever the outcome is common; they coincide only in the rare-outcome limit (the rare-disease approximation). An OR of 2 is a risk ratio of ~2 at 1% baseline risk but only ~1.3 at 50% baseline risk — which is why calling an OR 'times as likely' is a frequent reporting error."},
    {"id":"q4","type":"mcq","prompt":"'Complete separation' — a covariate combination that perfectly divides the 1s from the 0s — causes which problem?","options":["The log-likelihood becomes non-concave with many local maxima","The maximum-likelihood estimate does not exist: coefficients diverge toward infinity and fitted probabilities go to exactly 0 and 1","The odds ratios become exactly 1","The model can no longer be fit by Newton's method but works fine with gradient descent"],"answerIndex":1,"explanation":"Under complete separation the likelihood keeps increasing as the coefficient magnitude grows without bound, so there is no maximum — the perverse result that the strongest possible predictor yields unusable estimates. Remedies are penalization: Firth's bias-reduced logistic regression, ridge, or weakly informative priors."},
    {"id":"q5","type":"open","prompt":"Distinguish DISCRIMINATION from CALIBRATION in evaluating a probability model, and give an example use-case where each is the property that matters.","rubric":"Discrimination is whether the model correctly RANKS events above non-events — summarized by the ROC curve and its area (AUC/c-statistic), the probability a random event scores higher than a random non-event. Calibration is whether the predicted probabilities are RIGHT in level — when the model says 30%, the event happens about 30% of the time (checked with calibration plots / slope). They are distinct: a model can rank perfectly yet systematically overstate every risk, or be perfectly calibrated yet barely rank. Example where discrimination matters: a triage system that only needs to order patients by risk. Example where calibration matters: quoting an individual their personal risk in a consent conversation. (Proper scoring rules like the Brier score and log loss reward both at once.)"},
    {"id":"q6","type":"open","prompt":"In the Challenger O-ring analysis, why was examining only the seven flights that had incidents a mistake, and what did a logistic regression fit to all 23 flights show — including the key caveat about the 31 °F launch morning?","rubric":"Looking only at the seven incident flights CONDITIONS ON THE OUTCOME and discards the sixteen clean (mostly warm) launches — a selection error that hides the temperature signal, since among incidents alone no clear temperature pattern appears. Fitting logistic regression of O-ring distress on temperature to ALL 23 flights gives a strong negative slope (about logit = 15.04 - 0.232*t): each degree Fahrenheit multiplies the odds of distress by ~0.79, and the fitted risk rises steeply as it cools (near 0.09 at 75 F, ~0.49 at 65 F). The caveat: the 31 F launch morning lies far OUTSIDE the observed range (53-81 F), so the ~0.9996 figure is extrapolation with wide uncertainty (and only 23 flights / 7 events is a small sample). The honest statement was that every defensible model fit to all the data implied high and rapidly rising risk as temperature fell, with uncertainty widening in the dangerous direction outside the observed range."}
  ]$lr_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'statistics/regression-and-modeling/logistic-regression', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
