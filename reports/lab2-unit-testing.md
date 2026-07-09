# Lab 2 - Unit Testing Report

**Class under test:** `com.tsd.rating.Rating` (methods `addRating(int)`, `getAverageRating()`)
**Framework:** JUnit 5 · **Build/coverage:** Maven + JaCoCo · **Module:** `unit-tests/`

## Test summary (8 tests)
| # | Test | Technique | Status |
|---|---|---|---|
| 1 | averageOfSeveralValidRatingsIsComputedCorrectly | Positive / nominal | PASS |
| 2 | minimumValidRatingOneIsAccepted | Boundary (lower, 1) | PASS |
| 3 | maximumValidRatingFiveIsAccepted | Boundary (upper, 5) | PASS |
| 4 | ratingOfZeroJustBelowMinimumIsRejected | Boundary (0, invalid) | PASS |
| 5 | ratingOfSixJustAboveMaximumIsRejected | Boundary (6, invalid) | PASS |
| 6 | negativeRatingIsRejected | Invalid input | PASS |
| 7 | computingAverageWithoutAnyRatingThrowsException | Empty-state / error | PASS |
| 8 | averageOfTwoRatingsIsCorrectedToExpectedValue | Formerly failing (fixed) | PASS |

## Failing test demonstrated
Test #8 first expected `5.0` for the average of (2, 4). It failed on purpose (real
average is `3.0`), proving the suite catches a wrong expectation, and was then
corrected to `3.0`. See `unit-tests/COVERAGE_NOTES.md` and the run screenshot in `reports/`.

## Coverage (JaCoCo)
Instructions **94.0%** · Branches **100%** · Lines **92.9%** · Methods **75%**.
The only uncovered part is the secondary accessor `getRatingCount()`; all decision
branches of `addRating` and `getAverageRating` (bounds 1-5, empty list) are covered.

**What coverage shows:** every line and branch of the business logic is exercised at
least once, so the main paths (nominal, bounds, errors) are not dead code.
**What coverage does NOT prove:** it does not guarantee the absence of logic bugs nor
the strength of assertions; 100% coverage can still miss un-imagined cases.

## How to run
`cd unit-tests && mvn test` — report at `unit-tests/target/site/jacoco/index.html`.
