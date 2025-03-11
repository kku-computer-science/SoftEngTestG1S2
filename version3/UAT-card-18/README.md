# User Manual to Run Playwright

## Prerequisites
1. Node.js installed on your machine. You can download it from [nodejs.org](https://nodejs.org/).
2. Visual Studio Code with [playwright](https://marketplace.visualstudio.com/items?itemName=ms-playwright.playwright).
3. Node.js v22
4. npm 10.7
5. playwright 1.52

## Installation
1. Open your terminal in the project directory.
2. Install Playwright:
    ```sh
    npm install
    ```
2. Install Playwright chromium:
    ```sh
    npx playwright install chromium
    ```

## Running Playwright Tests
1. Open your terminal in the project directory.
2. Run the test:
    ```sh
    npx playwright test --headed --project=chromium
    ```


## Additional Resources
- [Playwright Documentation](https://playwright.dev/docs/intro)
- [Playwright GitHub Repository](https://github.com/microsoft/playwright)
