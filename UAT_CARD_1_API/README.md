# UATTest

## Requirements

Before running Playwright, ensure you have the following installed:

- Node.js 22.2.0
- npm 10.7.0


## Installation

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd TestAPI
    ```

2. Install the dependencies:
    ```sh
    npm install
    ```

## Running Playwright

To run Playwright tests, use the following command:
```sh
npx playwright test
```

## Additional Commands

- To open the Playwright Test Runner UI:
    ```sh
    npx playwright test --ui
    ```
- To run tests with a specific browser (e.g., chromium, firefox, webkit):
    ```sh
    npx playwright test --project=chromium
    ```

For more information, refer to the [Playwright documentation](https://playwright.dev/docs/intro).