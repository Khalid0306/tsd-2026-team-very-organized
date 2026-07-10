# TSD 2026 - Semester Testing Project

## Team
Team name: **TeamVeryOrganized**

## Tested application
| Field | Value |
|---|---|
| Name | Demo Web Shop |
| URL | https://demowebshop.tricentis.com |
| API sandbox (Postman) | https://jsonplaceholder.typicode.com |

## Labs & owners
| Lab | Owner | Deliverable |
|---|---|---|
| Lab 2 - JUnit | Simon | `unit-tests/` (Rating + RatingTest, own pom), `unit-tests/COVERAGE_NOTES.md`, `docs/project-selection.md`, `reports/lab2-unit-testing.md` |
| Lab 3 - Test design | Antoine | `docs/test-plan.md`, `manual-tests/manual-test-cases.md` |
| Lab 4 - Selenium | Louis | `src/test/java/DemoWebShopUITest.java`, `automation/selenium/`, `reports/lab4-selenium-report.md` |
| Lab 5 - Robot | Emilien | `automation/robot/demo_web_shop.robot`, `reports/lab5-robot-report.md` |
| Lab 6 - Postman | Lucca | `automation/postman/team-very-organized-apitests.postman_collection.json`, `reports/lab6-api-testing-report.md` |
| Repo + coordination | Khalid | structure, `reports/final-report.md`, presentation |

## Repository structure
```
.
├── docs/               team, charter, selection, test plan, risks
├── unit-tests/         Lab 2 - JUnit module (Rating + tests, own pom.xml)
├── src/                Lab 4 - Selenium test (Java/JUnit, needs the root pom)
├── manual-tests/       Lab 3 - manual test cases
├── automation/
│   ├── selenium/       Lab 4 - selection + how-to
│   ├── robot/          Lab 5
│   └── postman/        Lab 6
└── reports/            reports + execution evidence + final report
```

## How to run
- **Lab 2 (JUnit + coverage):** `cd unit-tests && mvn test` -> coverage in `unit-tests/target/site/jacoco/index.html`
- **Lab 4 (Selenium):** from the repo root `mvn test` (runs `DemoWebShopUITest`, needs Chrome)
- **Lab 5 (Robot):** `robot --outputdir reports automation/robot/`
- **Lab 6 (Postman):** import the collection, run with Collection Runner or `newman run`

> The positive UI tests (Selenium TC-001, Robot TC-001) log in with the shared
> account documented in `docs/test-plan.md`. That account must be registered on
> Demo Web Shop once, before running the tests.

## Links
- [Team](docs/team.md) · [Charter](docs/project-charter.md) · [Selection](docs/project-selection.md) · [Test plan](docs/test-plan.md) · [Risks](docs/risks.md)
