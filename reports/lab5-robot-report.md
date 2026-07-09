# Lab 5 - Robot Framework Report

## Repository URL
https://github.com/Khalid0306/tsd-2026-team-very-organized

## Test cases
| ID | Description | Type | Result |
|---|---|---|---|
| TC-001 | Login with valid credentials should succeed | Positive | PASS |
| TC-NEG-001 | Login with wrong password should show an error | Negative | PASS |

## Custom keywords (>= 2)
- `Open Browser To Login Page` — opens Chrome on `/login` and checks the page title.
- `Submit Login Form` — parameterised keyword: types email + password and clicks "Log in".

## Variables used
`${BASE_URL}`, `${BROWSER}`, `${EMAIL}`, `${PASSWORD}`, `${VALID_SEARCH}`.

## HTML report / log
`reports/report.html` and `reports/log.html` (regenerated on the last run).

## Results
2 tests, 2 passed, 0 failed.

## Problems encountered
The positive login test requires the shared account (`docs/test-plan.md`, section 6) to
be registered on Demo Web Shop; before that, it failed with "Page should have contained
'Log out' but did not". After registering the account and re-running, both tests pass.
The negative test needs no account.

## How to run
`robot --outputdir reports automation/robot/`
