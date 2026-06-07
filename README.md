# robot-framework-automation

![Robot Framework Tests](https://github.com/lizethheredia/robot-framework-automation/actions/workflows/robot-tests.yml/badge.svg)

Test automation portfolio using Robot Framework — Web, API, Database, and File testing.

## Tech Stack

- [Robot Framework 7](https://robotframework.org/)
- [Browser Library](https://robotframework-browser.org/) (Playwright-based)
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests) — API testing
- [DatabaseLibrary](https://github.com/MarketSquare/robotframework-databaselibrary) — DB testing
- [Pabot](https://github.com/MarketSquare/robotframework-pabot) — parallel execution
- Python 3.11

## Project Structure

```
robot-framework-automation/
├── tests/
│   ├── web/          # UI test suites
│   ├── api/          # API test suites
│   ├── database/     # DB test suites
│   └── files/        # File system test suites
├── resources/
│   ├── common/       # Browser wrapper and shared utilities
│   ├── pages/        # Page Objects (locators + low-level actions)
│   └── keywords/     # Business-level keywords
├── libraries/        # Custom Python libraries
├── variables/        # Environment config (dev.yaml, qa.yaml)
├── data/             # Test data (JSON, CSV)
├── config/           # Framework configuration
├── results/          # Test reports and screenshots (git-ignored)
└── requirements.txt
```

## Setup

```bash
# Clone the repo
git clone https://github.com/lizethheredia/robot-framework-automation.git
cd robot-framework-automation

# Create virtual environment
python3.11 -m venv venv
source venv/bin/activate  # Mac/Linux

# Install dependencies
pip install -r requirements.txt

# Initialize Browser Library (installs Chromium, Firefox, WebKit)
rfbrowser init
```

## Environment Variables

Create a `.env` file in the root (never commit this):

```
USERNAME=tomsmith
PASSWORD=SuperSecretPassword!
```

## Running Tests

```bash
# Run ALL tests
robot --outputdir results tests/

# Run by module
robot --outputdir results tests/web/
robot --outputdir results tests/api/
robot --outputdir results tests/database/
robot --outputdir results tests/files/

# Run a specific test file
robot --outputdir results tests/web/login_test.robot

# Run in a specific browser
robot --outputdir results --variable BROWSER:firefox tests/web/

# Run in headless mode
robot --outputdir results --variable HEADLESS:True tests/web/

# Run with a specific tag
robot --outputdir results --include smoke tests/

# Run in parallel (same browser, multiple suites)
pabot --processes 3 --outputdir results tests/web/

# Run cross-browser in parallel (Chromium + Firefox + WebKit simultaneously)
./run_cross_browser.sh
```

## Test Report

After running, open the report:

```bash
open results/report.html
```

Or view the latest CI report on [GitHub Pages](https://lizethheredia.github.io/robot-framework-automation/report.html).

## CI/CD

Tests run automatically on every push to `main` via GitHub Actions. The report is published to GitHub Pages after each run.

To configure secrets in GitHub:
1. Go to Settings → Secrets and variables → Actions
2. Add `RF_USERNAME` and `RF_PASSWORD`

## Test Coverage

### Web (Browser Library + Playwright)
| Test | Description |
|------|-------------|
| login_test | Valid and invalid login |
| logout_test | Logout after successful login |
| alerts_test | JS alert, confirm, and prompt dialogs |
| checkboxes_test | Check and uncheck checkboxes |
| dynamic_content_test | Wait for dynamically loaded content |

### API (RequestsLibrary)
| Test | Description |
|------|-------------|
| users_api_test | GET user, GET all users, POST new post |

### Database (DatabaseLibrary + SQLite)
| Test | Description |
|------|-------------|
| users_db_test | Row count, user existence, role validation, query |

### Files (OperatingSystem)
| Test | Description |
|------|-------------|
| file_operations_test | Create, read, and verify text and CSV files |
