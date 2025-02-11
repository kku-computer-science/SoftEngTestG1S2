import { test, expect } from '@playwright/test';
import dotenv from 'dotenv';

dotenv.config();

test('Open home page', async ({ page }) => {
    const url = 'https://cs0165.cpkkuhost.com/';
    await page.goto(url);
    await expect(page).toHaveURL(url);
});

test('Open login page', async ({ page }) => {
    const url = 'https://cs0165.cpkkuhost.com';
    await page.goto(url);
    await expect(page).toHaveURL(url);

    
    const goToLoginButton = await page.getByRole('link', { name: 'Login'});
    await goToLoginButton.click();
    const newTab = await page.waitForEvent('popup');
    await expect(newTab).not.toBeNull();
    await expect(newTab).toHaveURL(url + '/login');

});

test ('Login with correct credentials', async ({ page }) => {
    const url = 'https://cs0165.cpkkuhost.com/login';
    await page.goto(url);
    await expect(page).toHaveURL(url);

    const username = process.env.VALID_USERNAME ?? '';
    const password = process.env.VALID_PASSWORD ?? '';

    await page.fill('input[name="username"]', username);
    await page.fill('input[name="password"]', password);
    await page.click('button[type="submit"]');

    await expect(page).toHaveURL('https://cs0165.cpkkuhost.com/dashboard');
});

test ('Go to publication management page', async ({ page }) => {
    // login
    const url = 'https://cs0165.cpkkuhost.com/login';
    await page.goto(url);
    await expect(page).toHaveURL(url);

    const username = process.env.VALID_USERNAME ?? '';
    const password = process.env.VALID_PASSWORD ?? '';

    await page.fill('input[name="username"]', username);
    await page.fill('input[name="password"]', password);
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL('https://cs0165.cpkkuhost.com/dashboard');

    // go to publication management page
    const goToPublicationManagementButton = await page.getByRole('link', { name: ' Manage Publications ' });
    await goToPublicationManagementButton.click();
    await page.getByRole('link', { name: 'Published research' }).click();

    await expect(page).toHaveURL('https://cs0165.cpkkuhost.com/papers');
    
});

test ('Call paper button', async ({ page }) => {
    // login
    const url = 'https://cs0165.cpkkuhost.com/login';
    await page.goto(url);
    await expect(page).toHaveURL(url);

    const username = process.env.VALID_USERNAME ?? '';
    const password = process.env.VALID_PASSWORD ?? '';

    await page.fill('input[name="username"]', username);
    await page.fill('input[name="password"]', password);
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL('https://cs0165.cpkkuhost.com/dashboard');

    // go to publication management page
    const goToPublicationManagementButton = await page.getByRole('link', { name: ' Manage Publications ' });
    await goToPublicationManagementButton.click();
    await page.getByRole('link', { name: 'Published research' }).click();

    await expect(page).toHaveURL('https://cs0165.cpkkuhost.com/papers');

    // call paper button
    await page.getByRole('link', { name: ' Call Paper' }).click();
    // await page.waitForTimeout(10000);

    const paper2024 = page.getByRole('cell', { name: '2024' });

    await expect(paper2024).toBeVisible();
});