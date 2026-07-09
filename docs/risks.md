# Risk Register

| # | Risk | Impact | Mitigation |
|---|---|---|---|
| 1 | App changes or goes offline | High | Check availability before each run; note app version tested |
| 2 | Dynamic elements break locators | Medium | Prefer stable ids/names; avoid positional XPath |
| 3 | No public REST API | Medium | Postman targets JSONPlaceholder sandbox |
| 4 | Login required for key flows | Low | One shared account, credentials in test-plan.md |
| 5 | Member unavailable | Medium | Folder ownership + up-to-date docs so anyone can continue |
