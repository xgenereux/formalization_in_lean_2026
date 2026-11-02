import Mathlib.Algebra.Order.Ring.Rat
import Mathlib.Tactic

/- # Homework 2: Arithmetic
Name :

Some of the exercises from this sheet are taken from
  - K. Buzzard, Formalising Mathematics

Exercises marked with stars (*) (**) are more difficult.

**Important:** In this sheet you are not allowed to use large-scale automation tactics like
`grind` or `aesop`. Make sure to follow the instructions given in the exercises. -/

/- ## Exercise 1
In this exercise, we build basic API for a custom definition of the absolute value on ℚ. -/

/--
Our custom definition of the absolute value on `ℚ`. -/
def av (a : ℚ) : ℚ := if 0 ≤ a then a else -a

/- Setting the notation `|·|` to refer to our definition. -/
@[inherit_doc av]
macro:max (priority := 1001) atomic("|" noWs) a:term noWs "|" : term => `(av $a)

/-
Show that our absolute value respects these usual basic properties.

You are not allowed to use the theorem that relates to Mathlib's absolute value `abs`.

You can unfold the `if · then · else ·` with `ite_eq_left` and `ite_eq_right`.
You can also use `split` to case split on the condition. -/
lemma av_of_nonneg {a : ℚ} (h : 0 ≤ a) : |a| = a := by
  sorry

lemma av_of_neg {a : ℚ} (h : a < 0) : |a| = -a := by
  sorry

lemma av_nonneg {a : ℚ} : 0 ≤ |a| := by
  sorry

lemma av_pos {a : ℚ} (h : a ≠ 0) : 0 < |a| := by
  sorry

lemma le_av {a : ℚ} : a ≤ |a| ∧ -a ≤ |a| := by
  sorry

lemma av_le_iff {a b : ℚ} : |a| ≤ b ↔ a ≤ b ∧ -a ≤ b := by
  sorry

lemma av_neg (a : ℚ) : |-a| = |a| := by
  sorry

example {a b ε : ℚ} (h : |a - b| ≤ ε) : a - ε ≤ b ∧ b ≤ a + ε := by
  sorry

example {a b ε : ℚ} (h : |a - b| ≤ ε) : b - ε ≤ a ∧ a ≤ b + ε := by
  sorry

/- ## Exercise 2
Show the following relations between the absolute value and `min`/`max`. -/

lemma av_eq_max {a : ℚ} : |a| = max a (-a) := by
  sorry

example {a b : ℚ} : max a b = (a + b + |a - b|) / 2 := by
  sorry

example {a b : ℚ} : min a b = (a + b - |a - b|) / 2 := by
  sorry

/- ## Exercise 3
Show the following lemmas. -/

lemma forall_eps_le {a b : ℚ} (h : ∀ ε > 0, a ≤ b + ε) : a ≤ b := by
  sorry

example {a b : ℚ} : a = b ↔ ∀ ε > 0, |a - b| < ε := by
  sorry

/- ## Exercise 4
Show that the absolute value is multiplicative. -/

lemma av_add (a b : ℚ) : |a + b| ≤ |a| + |b| := by
  sorry

lemma av_mul (a b : ℚ) : |a * b| = |a| * |b| := by
  sorry

/- ## Exercise 5
Use, for example, the Archimedean property `exists_nat_gt` to show the following: -/

example (r : ℚ) : ∃ (n : ℕ), r < n := by
  sorry

example : ¬ ∃ (r : ℚ), 0 < r ∧ ∀ n : ℕ, 0 < n → r < 1 / n := by
  sorry

example (r : ℚ) (hr : 0 < r) : ∃ (n : ℕ), 1 / n < r ∧ r < n := by
  sorry

/- ## Exercise 6
**Convergence**
Using the following definition of convergence, show some basic lemmas. -/

def ConvergesTo (s : ℕ → ℚ) (a : ℚ) := ∀ ε > 0, ∃ N, ∀ n ≥ N, |s n - a| < ε

theorem ConvergesTo_thirtyseven : ConvergesTo (fun _ ↦ 37) 37 := by
  sorry

/-- The limit of the constant sequence with value `c` is `c`. -/
theorem ConvergesTo_const (c : ℚ) : ConvergesTo (fun _ ↦ c) c := by
  sorry

/-- If `a(n)` tends to `t` then `a(n) + c` tends to `t + c`. -/
theorem ConvergesTo_add_const {a : ℕ → ℚ} {t : ℚ} (c : ℚ) (h : ConvergesTo a t) :
    ConvergesTo (fun n ↦ a n + c) (t + c) := by
  sorry

/- ## Exercise 7
Hint: use `calc`. -/

theorem ConvergesTo_sub {s t : ℕ → ℚ} {a b : ℚ} (cs : ConvergesTo s a) (ct : ConvergesTo t b) :
    ConvergesTo (fun n ↦ s n - t n) (a - b) := by
  sorry

/- ## Exercise 8 -/

/-- If `a(n)` tends to `t` then `37 * a(n)` tends to `37 * t`. -/
theorem ConvergesTo_thirtyseven_mul {a : ℕ → ℚ} {t : ℚ} (h : ConvergesTo a t) :
    ConvergesTo (fun n ↦ 37 * a n) (37 * t) := by
  sorry

/-- If `a(n)` tends to `t` and `c` is a positive constant then
`c * a(n)` tends to `c * t`. -/
theorem ConvergesTo_pos_const_mul {a : ℕ → ℚ} {t : ℚ} (h : ConvergesTo a t) {c : ℚ} (hc : 0 < c) :
    ConvergesTo (fun n ↦ c * a n) (c * t) := by
  sorry

/-- If `a(n)` tends to `t` and `c` is a negative constant then
`c * a(n)` tends to `c * t`. -/
theorem ConvergesTo_neg_const_mul {a : ℕ → ℚ} {t : ℚ} (h : ConvergesTo a t) {c : ℚ} (hc : c < 0) :
    ConvergesTo (fun n ↦ c * a n) (c * t) := by
  sorry

/-- If `a(n)` tends to `t` and `c` is a constant then `c * a(n)` tends
to `c * t`. -/
theorem ConvergesTo_const_mul {a : ℕ → ℚ} {t : ℚ} (c : ℚ) (h : ConvergesTo a t) :
    ConvergesTo (fun n ↦ c * a n) (c * t) := by
  sorry

/-- If `a(n)` tends to `t` and `c` is a constant then `a(n) * c` tends
to `t * c`. -/
theorem ConvergesTo_mul_const {a : ℕ → ℚ} {t : ℚ} (c : ℚ) (h : ConvergesTo a t) :
    ConvergesTo (fun n ↦ a n * c) (t * c) := by
  sorry

/- Prove this result using one of the last two. -/
theorem ConvergesTo_neg {a : ℕ → ℚ} {t : ℚ} (ha : ConvergesTo a t) :
    ConvergesTo (fun n ↦ -a n) (-t) := by
  sorry

/- ## Exercise 9 (*)

This exercise is a little bit harder but good practice! -/

/-- A sequence has at most one limit. -/
theorem ConvergesTo_unique {a : ℕ → ℚ} (s t : ℚ) (hs : ConvergesTo a s) (ht : ConvergesTo a t) :
    s = t := by
  sorry
