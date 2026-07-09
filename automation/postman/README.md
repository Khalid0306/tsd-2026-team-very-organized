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
