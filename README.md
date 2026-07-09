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
| Lab 2 - JUnit | A | `src/main/java/Rating.java`, `src/test/java/RatingTest.java`, `docs/project-selection.md`, `reports/lab2-unit-testing.md` |
| Lab 3 - Test design | B | `docs/test-plan.md`, `manual-tests/manual-test-cases.md` |
| Lab 4 - Selenium | C | `automation/selenium/`, `reports/lab4-selenium-report.md` |
| Lab 5 - Robot | D | `automation/robot/`, `reports/lab5-robot-report.md` |
| Lab 6 - Postman | E | `automation/postman/team-very-organized-apitests.postman_collection.json`, `reports/lab6-api-testing-report.md` |
| Repo + coordination | F | structure, `reports/final-report.md`, presentation |

## Repository structure
```
.
├── docs/               team, charter, selection, test plan, risks
├── src/                Lab 2 - JUnit (Rating + tests)
├── manual-tests/       Lab 3 - manual test cases
├── automation/
│   ├── selenium/       Lab 4
│   ├── robot/          Lab 5
│   └── postman/        Lab 6
└── reports/            reports + execution evidence + final report
```

## How to run
- Java tests (Lab 2 + Selenium): `mvn test` (coverage in `target/site/jacoco/index.html`)
- Robot: `robot automation/robot/`
- Postman: import the collection, run with Collection Runner or `newman run`

## Links
- [Team](docs/team.md) · [Charter](docs/project-charter.md) · [Selection](docs/project-selection.md) · [Test plan](docs/test-plan.md) · [Risks](docs/risks.md)
