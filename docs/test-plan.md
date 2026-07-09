# Test Plan — Lab 3 (TeamVeryOrganized)

## 1. Tested application
| Field | Value |
|---|---|
| Name | Demo Web Shop |
| URL | https://demowebshop.tricentis.com |
| Purpose | Public e-commerce sandbox by Tricentis (nopCommerce based): browse, search, product detail, shopping cart, register/login, checkout. Used as the System Under Test (SUT) for the whole semester project. |

## 2. Scope
**In scope**
- User registration and login/logout
- Product search (header search + no-result handling)
- Product detail and add-to-cart
- Shopping cart management (update quantity, remove)
- Checkout with billing address and required-field validation
- Newsletter subscription (email validation)

**Out of scope**
- Real payments and real order fulfilment
- Admin / back-office
- Performance and load testing
- Mobile-native apps
- Public REST API testing (Demo Web Shop exposes no public REST API — API testing in Lab 6 uses the JSONPlaceholder sandbox instead)

## 3. Objectives
- Verify the core user journey (register → login → search → add to cart → checkout) works end to end.
- Verify input validation on registration, login, checkout and newsletter forms.
- Confirm the cart correctly reflects add / update / remove operations (state changes).
- Produce a repeatable manual test suite that feeds automation candidate selection for Lab 4.

## 4. Test types
Manual, functional, UI, negative/validation, and light regression (re-run of core cases after any app change). No performance or security testing in this lab.

## 5. Environment
| Item | Value |
|---|---|
| App URL | https://demowebshop.tricentis.com |
| Browser | Google Chrome (stable channel) — record the exact number from `chrome://version` |
| OS | Windows 11 |
| Tools | Browser DevTools for evidence; screenshots stored with the defect reports |
| Test date | 2026-07-09 |

## 6. Shared test account  (register this first)

Selenium (Lab 4) and Robot (Lab 5) positive tests log in with the **same** account,
so it must be registered on the site once before running them.

| Field | Value |
|---|---|
| Email | emilienhuret@gmail.com |
| Password | fortnite1234 |
| Registered on | Demo Web Shop (/register) |

> Action: open https://demowebshop.tricentis.com/register and create this exact
> account (no email confirmation is required on this demo site), then run the UI
> tests. Without it, the positive login tests fail with "not logged in".


## 7. Test design techniques used (>= 3)
- [x] **Equivalence partitioning** — valid vs invalid email formats (registration, newsletter); existing vs new email.
- [x] **Boundary value analysis** — password minimum length (5 vs 6 characters); cart quantity edges.
- [x] **Decision table** — login outcomes for combinations of valid/invalid email × valid/invalid password.
- [x] **State transition** — cart lifecycle: empty → item added → quantity updated → item removed → empty.
- [x] **Use case testing** — full purchase workflow from search to order confirmation.
- [x] **Error guessing** — empty required fields, whitespace-only inputs.

## 8. Entry / exit criteria
**Entry:** app reachable at the URL above; shared test account created (TC-001 executed); Chrome installed.

**Exit:** all planned manual cases executed with Actual Result + Status recorded in `manual-tests/manual-test-cases.xlsx`; every failed case has a matching defect report in `reports/`; 2–3 automation candidates selected for Lab 4.

## 9. Risks
| # | Risk | Impact | Mitigation |
|---|---|---|---|
| 1 | Demo app changes or goes offline without notice | High | Check availability before each run; record the app version/date tested |
| 2 | Dynamic elements break locators (Lab 4) | Medium | Prefer stable ids/names; avoid positional XPath |
| 3 | No public REST API | Medium | Lab 6 (Postman) targets JSONPlaceholder sandbox |
| 4 | Login required for checkout flow | Low | One shared account (section 6), credentials kept here |
| 5 | Team member unavailable | Medium | Folder ownership + up-to-date docs so anyone can continue |

## 10. Deliverables produced in this lab
- This test plan — `docs/test-plan.md`
- Reusable test case template — `manual-tests/test-case-template.md` and `manual-tests/test-case-template.xlsx`
- 12 manual test cases — `manual-tests/manual-test-cases.md`
- Executed test plan with results — `manual-tests/manual-test-cases.xlsx`
- Defect report — `reports/defect-report-example.md`
- Automation candidates for Lab 4 — marked in the manual test cases (see the "Automatable" column)
