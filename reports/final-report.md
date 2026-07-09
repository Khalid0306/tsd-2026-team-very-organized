# TSD 2026 - Final Project Report

## 1. Team & application
Team: **TeamVeryOrganized**. System under test: **Demo Web Shop**
(https://demowebshop.tricentis.com), a public nopCommerce e-commerce sandbox.
API testing uses the **JSONPlaceholder** sandbox (Demo Web Shop has no public API).

## 2. What we tested and how
- **Lab 2 - Unit testing (JUnit + JaCoCo):** the `Rating` class (ratings 1-5, average).
  8 tests covering nominal, boundaries (1/5, 0/6), invalid input, empty state, plus one
  intentionally-failing-then-fixed test. Coverage 94% instructions / 100% branches.
- **Lab 3 - Manual test design:** a test plan, a reusable case template, and 12 manual
  cases (positive, negative, boundary, workflow) using >= 3 design techniques
  (equivalence partitioning, boundary value, decision table, state transition, error guessing).
- **Lab 4 - Selenium (UI):** 2 automated tests — valid login and product search.
- **Lab 5 - Robot Framework (UI):** 2 tests (positive login, negative login) with custom
  keywords, variables, and HTML report/log.
- **Lab 6 - Postman (API):** a 4-request collection (GET + POST, positive + negative) with
  `pm.test` assertions, exported and runnable with Collection Runner / Newman.

## 3. Results summary
| Layer | Tool | Tests | Passed | Failed |
|---|---|---|---|---|
| Unit | JUnit 5 | 8 | 8 | 0 |
| UI | Selenium | 2 | 2 | 0 |
| UI | Robot Framework | 2 | 2 | 0 |
| API | Postman | 4 requests / 9 assertions | all | 0 |

## 4. Defects found
- **BUG-001 (Major, Open):** Checkout accepts an empty required "Last name" in the
  billing address and lets the order proceed. Derived from manual case TC-012.
  Full report: `reports/defect-report-example.md`.

## 5. Lessons learned
- API tests (Postman) are the fastest and most stable; UI tests are the most fragile,
  mostly because of authentication state and locator stability.
- UI automation that logs in needs the account to actually exist: registering the shared
  account before running was the fix for the flaky positive tests.
- Coverage is useful to spot untested code but does not prove the tests are meaningful.
