# Test Case Template

Copy this block for every new manual test case. Keep it simple — the goal is
repeatability, not paperwork. Rule: if another team member cannot execute the
case from this description alone, it is not written well enough.

| Field | Description |
|---|---|
| Test Case ID | Unique identifier, e.g. TC-001 |
| Title | Short descriptive name |
| Feature | Tested functionality (Login, Search, Cart, Checkout, …) |
| Priority | High / Medium / Low |
| Type | Positive / Negative / Boundary / Workflow |
| Design technique | Equivalence partitioning / Boundary value / Decision table / State transition / Use case / Error guessing |
| Preconditions | What must be true before execution |
| Test data | Inputs, accounts, product names, IDs |
| Steps | Numbered actions to perform |
| Expected result | Observable expected behaviour |
| Actual result | Filled during execution |
| Status | Not Run / Passed / Failed |
| Automatable | Yes / No (+ short reason) — candidate for Lab 4 automation? |

---

### Example

| Field | Value |
|---|---|
| Test Case ID | TC-000 |
| Title | Login with valid credentials |
| Feature | Login |
| Priority | High |
| Type | Positive |
| Design technique | Use case testing |
| Preconditions | Shared test account exists; user is on the login page |
| Test data | Email: shared account; Password: shared account password |
| Steps | 1. Open /login  2. Enter email  3. Enter password  4. Click "Log in" |
| Expected result | User is logged in; account email and "Log out" are shown in the header |
| Actual result | *(filled during execution)* |
| Status | Not Run |
| Automatable | Yes — stable, repeatable, objective assertion on header state |
