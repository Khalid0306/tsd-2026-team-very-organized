#!/usr/bin/env bash
# =============================================================================
# TSD 2026 - Repo scaffold
# Lance ce script UNE FOIS, a la racine du repo clone vide, puis commit + push.
# Usage :
#   git clone https://github.com/Khalid0306/tsd-2026-team-very-organized.git
#   cd tsd-2026-team-very-organized
#   bash scaffold.sh
#   git add . && git commit -m "chore: repo skeleton" && git push
# =============================================================================
set -euo pipefail

echo ">> Creation de l'arborescence..."
mkdir -p docs manual-tests reports
mkdir -p src/main/java src/test/java
mkdir -p automation/selenium automation/robot automation/postman

# ---------------------------------------------------------------------------
# README.md
# ---------------------------------------------------------------------------
cat > README.md << 'EOF'
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
EOF

# ---------------------------------------------------------------------------
# docs/
# ---------------------------------------------------------------------------
cat > docs/team.md << 'EOF'
# Team

Team name: TeamVeryOrganized

| Name | Role | Lab owned | Responsibilities |
|---|---|---|---|
| _____ | Test Manager | Lab 2 (A) | JUnit, project selection, coordination |
| _____ | Test Designer | Lab 3 (B) | Test plan, manual cases, design techniques |
| _____ | Automation Tester | Lab 4 (C) | Selenium UI tests |
| _____ | Automation Tester | Lab 5 (D) | Robot Framework tests |
| _____ | API Tester | Lab 6 (E) | Postman collection |
| _____ | Documentation Lead | Repo (F) | Structure, final report, presentation |

> ACTION: remplacez les _____ par les vrais noms.
EOF

cat > docs/project-charter.md << 'EOF'
# Project Charter

## 1. Tested application
| Field | Value |
|---|---|
| Name | Demo Web Shop |
| URL | https://demowebshop.tricentis.com |
| Description | Public e-commerce sandbox by Tricentis: search, product detail, cart, register/login, checkout. |

## 2. Main users
| Role | Description |
|---|---|
| Visitor | Browses products, uses search |
| Registered user | Adds to cart, checks out |

## 3. Selected features (>= 5)
| Feature | Priority |
|---|---|
| Product search | High |
| Product detail | Medium |
| Shopping cart | High |
| Login / registration | High |
| Checkout form | Medium |

## 4. Out of scope
Real payments, real order fulfilment, admin back-office, performance/load, mobile-native.
EOF

cat > docs/project-selection.md << 'EOF'
# Project Selection (Lab 2)

## Chosen application
Demo Web Shop - https://demowebshop.tricentis.com

## Why this application (criteria check)
- [x] Accessible without complex setup (public hosted app, no install)
- [x] At least 5 testable features (search, detail, cart, login, checkout)
- [x] Forms, search, cart / CRUD present
- [x] Stable public demo
- [x] No real payments or sensitive personal data
- [ ] Public REST API -> NOT available, Postman uses JSONPlaceholder sandbox instead

## Alternatives considered
> Optional: list 1-2 other apps and why they were rejected.
EOF

cat > docs/test-plan.md << 'EOF'
# Test Plan (Lab 3)

## 1. Scope
In scope: search, product detail, cart, login/registration, checkout form.
Out of scope: real payments, admin, performance.

## 2. Environment
- App URL: https://demowebshop.tricentis.com
- Browser: Chrome (version: ____)
- OS: ____

## 3. SHARED TEST ACCOUNT  (a creer en tout premier)
> Selenium (C) et Robot (D) DOIVENT utiliser ce meme compte.
- Email: ____________________
- Password: ________________
- Cree le: ____  par: ____

## 4. Test design techniques used (>= 3)
- [ ] Equivalence partitioning
- [ ] Boundary value analysis
- [ ] Decision table / error guessing / other: ____

## 5. Entry / exit criteria
Entry: app reachable, account created. Exit: all planned cases executed, defects logged.
EOF

cat > docs/risks.md << 'EOF'
# Risk Register

| # | Risk | Impact | Mitigation |
|---|---|---|---|
| 1 | App changes or goes offline | High | Check availability before each run; note app version tested |
| 2 | Dynamic elements break locators | Medium | Prefer stable ids/names; avoid positional XPath |
| 3 | No public REST API | Medium | Postman targets JSONPlaceholder sandbox |
| 4 | Login required for key flows | Low | One shared account, credentials in test-plan.md |
| 5 | Member unavailable | Medium | Folder ownership + up-to-date docs so anyone can continue |
EOF

# ---------------------------------------------------------------------------
# src/  (Lab 2 - JUnit)   -- stub compilable, A complete
# ---------------------------------------------------------------------------
cat > src/main/java/Rating.java << 'EOF'
public class Rating {

    /**
     * Maps a points value (0..100) to a letter grade.
     * Boundaries: A>=93, B>=85, C>=77, D>=69, E>=61, else FX.
     * ACTION (A): verifier les seuils contre l'enonce du Lab 2.
     */
    public String determineResultGrade(int points) {
        if (points < 0 || points > 100) {
            throw new IllegalArgumentException("points must be between 0 and 100");
        }
        if (points >= 93) return "A";
        if (points >= 85) return "B";
        if (points >= 77) return "C";
        if (points >= 69) return "D";
        if (points >= 61) return "E";
        return "FX";
    }
}
EOF

cat > src/test/java/RatingTest.java << 'EOF'
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

// Lab 2 : ecrire AU MOINS 6 tests, dont limites (boundary) + inputs invalides,
// ET au moins UN test qui echoue expres (pour la preuve), puis run avec coverage.
class RatingTest {

    private final Rating rating = new Rating();

    @Test
    void shouldReturnAForUpperBound() { assertEquals("A", rating.determineResultGrade(100)); }

    @Test
    void shouldReturnAForLowerBoundOfA() { assertEquals("A", rating.determineResultGrade(93)); }

    @Test
    void shouldReturnFXForZero() { assertEquals("FX", rating.determineResultGrade(0)); }

    @Test
    void shouldRejectNegativeInput() {
        assertThrows(IllegalArgumentException.class, () -> rating.determineResultGrade(-1));
    }

    // TODO(A): ajouter au moins 2 tests de plus (autres limites: 60/61, 84/85 ...).

    // TODO(A): le test qui echoue expres. Decommente, capture le rouge pour la preuve,
    //          puis corrige ou documente. Le lab exige "at least one failing test demonstrated".
    // @Test
    // void deliberatelyFailing() { assertEquals("A", rating.determineResultGrade(60)); }
}
EOF

# ---------------------------------------------------------------------------
# pom.xml  (JUnit 5 + Selenium 4 + JaCoCo coverage)
# ---------------------------------------------------------------------------
cat > pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.tsd</groupId>
    <artifactId>tsd-2026-team-very-organized</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter</artifactId>
            <version>5.10.2</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.seleniumhq.selenium</groupId>
            <artifactId>selenium-java</artifactId>
            <version>4.11.0</version>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>3.2.5</version>
            </plugin>
            <!-- Coverage report -> target/site/jacoco/index.html -->
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>0.8.11</version>
                <executions>
                    <execution><goals><goal>prepare-agent</goal></goals></execution>
                    <execution><id>report</id><phase>test</phase><goals><goal>report</goal></goals></execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
EOF

# ---------------------------------------------------------------------------
# manual-tests/  (Lab 3)
# ---------------------------------------------------------------------------
cat > manual-tests/test-case-template.md << 'EOF'
# Test Case Template

| Field | Value |
|---|---|
| Test Case ID | TC-000 |
| Title | ... |
| Precondition | ... |
| Test data | ... |
| Steps | 1. ... 2. ... |
| Expected result | ... |
| Design technique | equivalence / boundary / ... |
| Type | positive / negative / boundary / workflow |
EOF

cat > manual-tests/manual-test-cases.md << 'EOF'
# Manual Test Cases (Lab 3)

Target: 10-15 cases -> 3 positive, 3 negative, 2 boundary, 2 workflow.
Use >= 3 design techniques (equivalence partitioning, boundary value, decision table / error guessing).

## Positive
### TC-001 - ...
| Test Case ID | TC-001 |
|---|---|
| Steps | ... |
| Expected result | ... |
| Technique | ... |

## Negative
### TC-00X - ...

## Boundary
### TC-00X - ...

## Workflow
### TC-00X - ...

---
## Defect report (>= 1)
See `reports/` for the defect report(s) found while executing the cases above.
EOF

# ---------------------------------------------------------------------------
# automation/selenium/  (Lab 4)
# ---------------------------------------------------------------------------
cat > automation/selenium/automation-selection.md << 'EOF'
# Automation Selection (Lab 4)

| TC ID | Title | Automate? | Reason |
|---|---|---|---|
| TC-001 | Login with valid credentials | Yes | Core flow, stable ids, clear assertion |
| TC-005 | Search product by keyword | Yes | Core workflow, reliable selectors |
| TC-011 | Checkout (multi-step form) | No | Complex multi-step, unstable to automate |
EOF

cat > automation/selenium/README.md << 'EOF'
# Selenium (Lab 4)

The Selenium tests are written in Java + JUnit 5 and live in
`src/test/java/DemoWebShopUITest.java` (so Maven can run them).

## Run
```
mvn -Dtest=DemoWebShopUITest test
```

## Checkpoint (a remplir dans reports/lab4-selenium-report.md)
- Repository URL: ...
- Selected automated test cases: TC-001, TC-005
- Number of Selenium tests: 2
- Tool used: Selenium WebDriver (Java, JUnit 5)
- Assertions used: ...
- Execution result: pass/fail (+ screenshot in reports/)
- Main problem during automation: ...

> Login uses the SHARED account from docs/test-plan.md. Do not hardcode a random account.
EOF

# ---------------------------------------------------------------------------
# automation/robot/  (Lab 5)
# ---------------------------------------------------------------------------
cat > automation/robot/README.md << 'EOF'
# Robot Framework (Lab 5)

## Requirements
- >= 2 test cases (1 positive, 1 negative)
- use variables
- >= 2 custom keywords (refactor repeated steps)
- HTML report / log saved into reports/

## Run
```
robot --outputdir ../../reports automation/robot/
```
Produces report.html and log.html (the required HTML evidence).

## Checkpoint (reports/lab5-robot-report.md)
- Repository URL: ...
- Robot test cases: >= 2 (1 positive, 1 negative)
- Custom keywords: yes (list them)
- HTML report/log: yes (path in reports/)

> Same SHARED account as Selenium (docs/test-plan.md).
EOF

# ---------------------------------------------------------------------------
# automation/postman/  (Lab 6)
# ---------------------------------------------------------------------------
cat > automation/postman/README.md << 'EOF'
# Postman (Lab 6)

Collection name: `TSD 2026 - TeamVeryOrganized - API Tests`
Export to: `automation/postman/team-very-organized-apitests.postman_collection.json`

## Requirements
- >= 4 requests, GET + POST
- positive AND negative cases
- pm.test assertions (status code + response fields)
- run the whole collection, save the runner summary into reports/

## Base API (no public API on Demo Web Shop -> sandbox)
https://jsonplaceholder.typicode.com

Suggested requests:
- GET /users            -> 200, non-empty, first user has email
- GET /users/1          -> 200, id == 1, has name/username/email
- POST /posts           -> 201, echoes title
- GET /users/999999     -> negative case, document actual status

## Run from CLI (optional)
```
newman run team-very-organized-apitests.postman_collection.json
```
EOF

# ---------------------------------------------------------------------------
# reports/
# ---------------------------------------------------------------------------
cat > reports/lab2-unit-testing.md << 'EOF'
# Lab 2 - Unit Testing Report

Class under test: `Rating.java` - `determineResultGrade(int)`

## Test summary (>= 6 tests)
| # | Test name | Expected | Status |
|---|---|---|---|
| 1 | ... | ... | PASS |

## Failing test demonstrated
> Screenshot of the deliberately-failing test (required). Path: reports/...

## Coverage
> Screenshot of coverage (target/site/jacoco/index.html) + 1-2 sentences interpretation.
> Note what coverage does NOT prove.
EOF

cat > reports/lab4-selenium-report.md << 'EOF'
# Lab 4 - Selenium Automation Report

## Selected test cases
- TC-001 Login with valid credentials - why automated: ...
- TC-005 Search product by keyword - why automated: ...

## Tool used
Selenium WebDriver (Java, JUnit 5).

## Results
- TC-001: pass/fail
- TC-005: pass/fail
- Evidence: reports/lab4-execution-evidence.png

## Problems found
...

## What should remain manual
- TC-011 Checkout - reason: ...
EOF

cat > reports/lab5-robot-report.md << 'EOF'
# Lab 5 - Robot Framework Report

## Test cases
- Positive: ...
- Negative: ...

## Custom keywords (>= 2)
- ...
- ...

## Variables used
...

## HTML report
Path: reports/report.html , reports/log.html

## Results
Passed / failed summary + screenshot.
EOF

cat > reports/lab6-api-testing-report.md << 'EOF'
# Lab 6 - API Testing Report

## Collection
Name: TSD 2026 - TeamVeryOrganized - API Tests
File: automation/postman/team-very-organized-apitests.postman_collection.json

## Requests (>= 4, GET + POST, positive + negative)
| # | Method | Endpoint | Type | Assertions |
|---|---|---|---|---|
| 1 | GET | /users | positive | 200, non-empty, has email |
| 2 | GET | /users/1 | positive | 200, id==1, fields |
| 3 | POST | /posts | positive | 201, title echoed |
| 4 | GET | /users/999999 | negative | error status |

## Collection Runner result
> Screenshot of the runner summary (X passed / Y failed).
EOF

cat > reports/final-report.md << 'EOF'
# TSD 2026 - Final Project Report

## 1. Team & application
Team: TeamVeryOrganized. App: Demo Web Shop.

## 2. What we tested and how
- Lab 2 Unit testing (JUnit): ...
- Lab 3 Manual test design: ...
- Lab 4 Selenium: ...
- Lab 5 Robot: ...
- Lab 6 Postman API: ...

## 3. Results summary
| Layer | Tests | Passed | Failed |
|---|---|---|---|
| Unit | | | |
| UI Selenium | | | |
| UI Robot | | | |
| API Postman | | | |

## 4. Defects found
...

## 5. Lessons learned
...
EOF

# ---------------------------------------------------------------------------
# .gitignore  + keep empty dirs
# ---------------------------------------------------------------------------
cat > .gitignore << 'EOF'
target/
.idea/
.vscode/
*.class
*.iml
node_modules/
newman/
EOF

echo ">> Termine. Arborescence creee :"
echo ""
echo ">> Etapes suivantes :"
echo "   git add ."
echo "   git commit -m \"chore: repo skeleton (structure + templates)\""
echo "   git push origin main"