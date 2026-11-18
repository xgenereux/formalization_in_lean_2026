import Mathlib.Tactic

/- # Homework 3: Induction
Name :

**Important:** Make sure to follow the instructions given in the exercise.

Even if an exercise is directly provable with a lemma from the library, it can't be used.
You must write the proof yourself, using the method the exercise asks for. -/

open Nat

/- ## Exercise 1
Use induction to prove the following examples. -/

example (p q : ℕ) (m : ℕ) : ∃ a b : ℕ, (p + √q) ^ m = a + b * √q := by
  sorry

example {n : ℕ} : ∑ i ∈ Finset.range (n + 1), i ^ 3 = ((n * (n + 1)) ^ 2 / 4) := by
  sorry

/- ## Exercise 2
Use the appropriate induction principle to show the following facts. -/

example {n : ℕ} (h0 : n ≠ 0) : ∑ i ∈ Finset.range n, (2 * i + 1) = n ^ 2 := by
  sorry

example {n : ℕ} (h0 : n ≠ 0) : ∑ i ∈ Finset.range n, (i * i !) = (n !) - 1 := by
  sorry

example {n : ℕ} (h0 : n ≠ 0) : 2 ^ (n - 1) ≤ n ! := by
  sorry

example {n : ℕ} (hle : 4 ≤ n) : 2 ^ n ≤ n ! := by
  sorry

example {n : ℕ} (h0 : n ≠ 0) : n ! ≤ n ^ (n - 1) := by
  sorry

/- ## Bonus
In the last examples, were the `(h0 : n ≠ 0)` necessary? Why? -/

/- ## Exercise 3
In Lean, `Finset` represents the type of finite sets.
As it is defined in terms of `List`, which is an inductive type,
we get a panoply of inductive principles.

Use the appropriate induction lemmas to show the following fact.

Hint: Try to look through the different induction principles in the library.
The key ingredient is to figure out what your induction principle should look like.
You might want to use https://leansearch.net/. -/

open Finset in
example {α : Type*} [LinearOrder α] {s : Finset α} (hs : s.Nonempty) :
    ∃ a ∈ s, ∀ σ ∈ s, σ ≤ a := by
  sorry

/- ## Exercise 4
Use a **proof by recurrence** (recursion) to show the following example. -/

lemma span_four_five (n : ℕ) (hle : 12 ≤ n) : ∃ a b, n = 4 * a + 5 * b := by
  sorry

/- ## Exercise 5
Use the appropriate induction lemmas to show the following.

If the lemma you intend to use has a `[DecidableEq α]`, you can discharge it by starting
your proof with the `classical` tactic.
-/

example {α : Type*} {s : Finset α} (f : α → ℕ) (he : ∀ x ∈ s, Even (f x)) :
    Even (∑ x ∈ s, f x) := by
  sorry

/- ## Exercise 6 (*) (2 points)
In any introduction to number theory, one of the very first results proved
formalises the notion of "dividing with remainder".

Here is a classical presentation on the natural numbers.
Complete the following formal proof.

### Lemma
  If `a` and `b` are integers, with `b ≥ 1`, then there exist unique
  integers `q` and `r`, with `0 ≤ r ≤ b − 1`, such that `a = qb + r`.
  We call `q` the “quotient”, and `r` the “remainder”.

#### Proof by induction.
We begin by proving the existence of `q` and `r`.
For each `b ≥ 1`, we proceed by induction on `a ≥ 0`.
If `a ≤ b−1`, then the result follows with `q = 0` and `r = a`.

Otherwise assume that the result holds for `0,1,2,...,a−1`, where `a ≥ b`.
Then `a − 1 ≥ a − b` so, by the induction hypothesis,
there exist integers `Q` and `r`, with `0 ≤ r ≤ b−1`, for which `a−b = Qb+r`.
Therefore `a = qb+r` with `q = Q + 1`. -/


lemma division_nat (a b : ℕ) (hb : 1 ≤ b) : ∃(q r : ℕ),
    a = q * b + r ∧ r ≤ b - 1 := by
  induction a using Nat.strong_induction_on generalizing b with
  | h a ih =>
  /-
  Try to follow the structure of the paper proof as much as you can.
  Remember that you can use `linarith` and `grind` in the appropriate cases.
  The only theorem that I used is `Nat.sub_eq_iff_eq_add`. -/
    sorry

/- ## Exercise 7 (*)

Finish the above formalisation by proving that the `q` and `r` you obtained
are unique. You can follow this proof:

If `a = qb + r = Qb + R`, then `b` divides `(q − Q)b = R − r`.
However `0 ≤ r`, `R ≤ b − 1` so that `|R − r| ≤ b − 1 `, and `b | R − r`.
However, `b | R − r` implies that `b ≤ R - r` or `R - r = 0`.
Therefore `R − r = 0`, and so `Q − q = 0`.
In other words `q = Q` and `r = R`; that is, the pair `q`,`r` is unique.

You can use `∃!` to represent uniqueness or directly the definition
`∃ (x : α), p x ∧ ∀ (y : α), p y → y = x`.
It might be useful to lift some of your intermediate steps to the integers. -/

-- Hint:
#check Int.natAbs_le_of_dvd_ne_zero

/- # Bonus

Come talk to me for more induction problems and related mathematics projects!
 -/
