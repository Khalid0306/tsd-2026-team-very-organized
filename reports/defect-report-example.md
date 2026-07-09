# BUG-001 — Checkout accepts an empty "Last name" in the billing address

| Field | Value |
|---|---|
| Defect ID | BUG-001 |
| Title | Checkout continues with an empty required "Last name" field |
| Related test case | TC-012 — Checkout with an empty required billing field |
| Feature | Checkout — billing address |
| Severity | Major |
| Priority | High |
| Status | Open |
| Reported by | TeamVeryOrganized |
| Environment | Demo Web Shop (https://demowebshop.tricentis.com), Google Chrome (fill in version), Windows 11 |

## Steps to reproduce
1. Log in with the shared test account.
2. Add any product to the cart (e.g. `$25 Virtual Gift Card`).
3. Open the shopping cart, accept the terms of service and click **Checkout**.
4. On the **Billing address** step, leave the **Last name** field empty.
5. Fill in every other required field (first name, email, country, city, address, ZIP, phone).
6. Click **Continue**.

## Expected result
The form is blocked and an inline validation message "Last name is required." is displayed. The user cannot advance to the next checkout step until a last name is provided.

## Actual result
The form is accepted with the **Last name** field empty and the checkout advances to the next step, so an order can be placed without a complete billing name.

## Evidence
- Screenshot: `reports/evidence/bug-001-empty-lastname.png` *(attach the screenshot taken during execution)*
- URL at time of failure: `https://demowebshop.tricentis.com/onepagecheckout`

## Notes
- Reproducible: yes, every attempt.
- Impact: incomplete billing data can reach the order; breaks the required-field contract of the checkout form.
- Suggested fix: enforce server-side and client-side "required" validation on the last name field, consistent with the first name field.

> This report is derived from failed test case TC-012. If, on the version you test,
> the field is correctly rejected, record TC-012 as **Passed** and keep this file as
> the team's defect-report template for any real defect you find.
