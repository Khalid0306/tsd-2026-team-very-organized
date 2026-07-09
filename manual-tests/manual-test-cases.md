# Manual Test Cases — Lab 3 (TeamVeryOrganized)

**Application under test:** Demo Web Shop — https://demowebshop.tricentis.com
**Total:** 12 cases — 3 positive, 3 negative, 2 boundary/equivalence, 2 workflow, +2 extra.
**Design techniques used (6):** Use case testing, Decision table, Error guessing, Equivalence partitioning, Boundary value analysis, State transition.

> The "Automatable" field marks candidates for Lab 4 (Selenium). Expected messages
> are the app's standard responses; record exact wording in the *Actual result*
> column of `manual-test-cases.xlsx` during execution.

## Coverage summary

| Category | Cases | Min required |
|---|---|---|
| Positive | TC-001, TC-002, TC-003 | 3 |
| Negative | TC-004, TC-005, TC-006 | 3 |
| Boundary / equivalence | TC-007, TC-008 | 2 |
| Use case / workflow | TC-009, TC-010 | 2 |
| Extra (equivalence + validation) | TC-011, TC-012 | — |

---

## Positive

### TC-001 — Register a new account with valid data

| Field | Value |
|---|---|
| Feature | Registration |
| Priority | High |
| Type | Positive |
| Design technique | Use case testing |
| Preconditions | On `/register`; the email is not already registered |
| Test data | First: `Team`, Last: `Organized`, Email: `teamveryorganized.tsd2026@example.com`, Password: `Secret123`, Confirm: `Secret123` |
| Steps | 1. Open `/register`  2. (optional) select Gender  3. Enter first name, last name, email  4. Enter password and confirm password  5. Click **Register** |
| Expected result | Confirmation "Your registration completed" is shown; user is authenticated (header shows the email and **Log out**) |
| Automatable | **Yes** — creates the shared account; deterministic, objective assertion |

### TC-002 — Login with valid credentials

| Field | Value |
|---|---|
| Feature | Login |
| Priority | High |
| Type | Positive |
| Design technique | Use case testing |
| Preconditions | Shared account exists (TC-001); on `/login` and logged out |
| Test data | Email + password of the shared account |
| Steps | 1. Open `/login`  2. Enter email  3. Enter password  4. Click **Log in** |
| Expected result | User is logged in; header shows the account email and a **Log out** link |
| Automatable | **Yes** — core, stable, repeatable |

### TC-003 — Search for an existing product by keyword

| Field | Value |
|---|---|
| Feature | Search |
| Priority | High |
| Type | Positive |
| Design technique | Use case testing |
| Preconditions | App reachable (any page) |
| Test data | Keyword: `book` |
| Steps | 1. Type `book` in the header search box  2. Click **Search** |
| Expected result | Search results page lists at least one matching product; result count > 0 |
| Automatable | **Yes** — objective assertion on result count |

---

## Negative

### TC-004 — Login with an incorrect password

| Field | Value |
|---|---|
| Feature | Login |
| Priority | High |
| Type | Negative |
| Design technique | Decision table (valid email × invalid password) |
| Preconditions | Shared account exists; on `/login` |
| Test data | Valid email + wrong password `WrongPass9` |
| Steps | 1. Open `/login`  2. Enter the valid email  3. Enter the wrong password  4. Click **Log in** |
| Expected result | Login rejected; error shown (e.g. "Login was unsuccessful… The credentials provided are incorrect"); user stays on the login page |
| Automatable | **Yes** — deterministic negative path |

### TC-005 — Login with empty email and password

| Field | Value |
|---|---|
| Feature | Login |
| Priority | Medium |
| Type | Negative |
| Design technique | Error guessing |
| Preconditions | On `/login` |
| Test data | *(both fields empty)* |
| Steps | 1. Open `/login`  2. Leave email and password empty  3. Click **Log in** |
| Expected result | Inline validation error (e.g. "Please enter your email"); user is not logged in |
| Automatable | **Yes** — validation assertion |

### TC-006 — Register with mismatched confirm password

| Field | Value |
|---|---|
| Feature | Registration |
| Priority | High |
| Type | Negative |
| Design technique | Equivalence partitioning (matching vs non-matching confirmation) |
| Preconditions | On `/register` |
| Test data | Valid fields; Password `Secret123`, Confirm `Secret124` |
| Steps | 1. Open `/register`  2. Fill name and a new email  3. Enter mismatched password and confirm  4. Click **Register** |
| Expected result | Error "The password and confirmation password do not match."; account not created |
| Automatable | **Yes** — deterministic negative path |

---

## Boundary / equivalence

### TC-007 — Registration password below minimum length

| Field | Value |
|---|---|
| Feature | Registration |
| Priority | High |
| Type | Boundary |
| Design technique | Boundary value analysis (password length: 5 invalid / 6 valid) |
| Preconditions | On `/register` |
| Test data | Boundary A: `Sec12` (5 chars) → invalid; Boundary B: `Sec123` (6 chars) → valid |
| Steps | 1. Register with a 5-character password → observe result  2. Retry with a 6-character password → observe result |
| Expected result | 5 chars rejected with "The password should have at least 6 characters."; 6 chars accepted |
| Automatable | **Yes** — clear boundary, two assertions |

### TC-008 — Newsletter subscription with an invalid email format

| Field | Value |
|---|---|
| Feature | Newsletter |
| Priority | Medium |
| Type | Boundary / equivalence |
| Design technique | Equivalence partitioning (valid vs invalid email class) |
| Preconditions | On the home page (footer newsletter box visible) |
| Test data | Invalid: `plainaddress` — for contrast, valid: `news.subscriber@example.com` |
| Steps | 1. Enter `plainaddress` in the footer newsletter field  2. Click **Subscribe** |
| Expected result | "Enter valid email" error; not subscribed. (A valid email instead returns "Thank you for signing up!") |
| Automatable | **Yes** — validation assertion |

---

## Use case / workflow

### TC-009 — End-to-end purchase

| Field | Value |
|---|---|
| Feature | Search → Cart → Checkout |
| Priority | High |
| Type | Workflow |
| Design technique | Use case testing |
| Preconditions | Logged in with the shared account |
| Test data | Product: `$25 Virtual Gift Card` (no shipping attributes); billing address: name, country, city, address, ZIP, phone |
| Steps | 1. Search/open the product  2. **Add to cart**  3. Open the cart, tick "I agree with the terms of service", click **Checkout**  4. Fill the billing address  5. Select shipping (if prompted)  6. Payment method **Check / Money Order**  7. Confirm the order |
| Expected result | "Your order has been successfully processed!" with an order number |
| Automatable | **Yes, but automate later** — long flow, more fragile; automate after the basics are stable |

### TC-010 — Shopping cart state transitions

| Field | Value |
|---|---|
| Feature | Shopping cart |
| Priority | High |
| Type | Workflow |
| Design technique | State transition (empty → added → updated → removed → empty) |
| Preconditions | Cart is empty |
| Test data | Two different products A and B |
| Steps | 1. Add product A → header cart = (1)  2. Add product B → cart = (2)  3. Set A quantity to 3, click **Update shopping cart**  4. Tick **Remove** on B, update  5. Remove A |
| Expected result | Header counter and cart contents update correctly at each step; final state shows "Your Shopping Cart is empty!" |
| Automatable | **Yes** — deterministic state assertions |

---

## Extra

### TC-011 — Search with no matching results

| Field | Value |
|---|---|
| Feature | Search |
| Priority | Medium |
| Type | Negative / equivalence |
| Design technique | Equivalence partitioning (no-result input class) |
| Preconditions | App reachable |
| Test data | Keyword: `zzzznoproductxyz` |
| Steps | 1. Enter the keyword in the header search  2. Click **Search** |
| Expected result | "No products were found that matched your criteria." is shown; zero results |
| Automatable | **Yes** — objective assertion |

### TC-012 — Checkout with an empty required billing field

| Field | Value |
|---|---|
| Feature | Checkout |
| Priority | High |
| Type | Boundary / validation |
| Design technique | Boundary value / error guessing (required field left empty) |
| Preconditions | Logged in; one product in the cart; at the billing address step |
| Test data | Fill all billing fields except **Last name** (left empty) |
| Steps | 1. Go to the cart and start checkout  2. At the billing address, leave **Last name** empty  3. Fill all other required fields  4. Click **Continue** |
| Expected result | Validation error "Last name is required." and checkout is blocked at this step |
| Automatable | **Yes** — validation assertion (**failed case → see BUG-001**) |

---

## Automation candidates for Lab 4 (Selenium)

**Selected (2–3, automate first):**

- **TC-002 — Login** — core journey, stable locators, objective header assertion.
- **TC-003 — Product search** — simple, deterministic, high value for regression.
- **TC-010 — Add / remove from cart** — clear state assertions on the cart counter.

**Automate later:** TC-009 (end-to-end purchase) — high value but longer and more fragile; stabilise the basics first.

**Do NOT automate:** exploratory testing sessions and purely visual/UX judgement checks — their value comes from human observation and learning the product, not from repeatable assertions.

---

## Defect reports

At least one defect report is required. TC-012 is the failed case that produced **BUG-001** — see `reports/defect-report-example.md`.
