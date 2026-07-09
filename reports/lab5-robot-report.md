# Lab 5 - Robot Framework Report

## Repository URL
https://github.com/Khalid0306/tsd-2026-team-very-organized

## Test cases

| ID | Description | Type | Résultat |
|---|---|---|---|
| TC-001 | Login with valid credentials should succeed | Positif | PASS / FAIL |
| TC-NEG-001 | Login with wrong password should show error | Négatif | PASS / FAIL |

## Custom keywords (>= 2)
- `Open Browser To Login Page` : ouvre Chrome sur `/login` et vérifie le titre de la page
- `Submit Login Form` : saisit email + password et clique sur "Log in"

## Variables utilisées
- `${BASE_URL}`, `${BROWSER}`, `${EMAIL}`, `${PASSWORD}`, `${VALID_SEARCH}`

## HTML report / log
- `reports/report.html`
- `reports/log.html`

## Résultats
> Colle ici un screenshot du résultat dans le terminal (X tests, X passed, X failed)
> et un screenshot de reports/report.html.

## Problèmes rencontrés
...