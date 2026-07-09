# Lab 4 - Selenium Automation Report

## Selected test cases
- **TC-001 Login with valid credentials** — automated: core auth flow with stable `id`
  locators and a clear post-login assertion.
- **TC-005 Search product by keyword** — automated: key user journey, reliable selectors.

## Tool used
Selenium WebDriver 4 with Java + JUnit 5 (`src/test/java/DemoWebShopUITest.java`),
run from the repo root with `mvn test`.

## Results
| Test | Assertion | Result |
|---|---|---|
| shouldLoginSuccessfully | header account link contains the account email | PASS |
| shouldSearchProduct | search input `#Q` keeps the value "book" | PASS |

Execution evidence: `reports/lab4-execution-evidence.png`.

## Problems found
The positive login test depends on the shared account being registered on the site
(`docs/test-plan.md`, section 6). Before that account existed, the test failed with the
account link not found. Once the account is registered, the test passes; the search
test has no such dependency.

## What should remain manual
- **TC-011 Checkout (multi-step billing form).** Multi-step, stateful, and the value is
  in judging on-screen validation messages — better verified manually.
