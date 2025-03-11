import { expect, test } from '@playwright/test';
import {
    login,
    openLoginPage,
    goToResearchGroupAsUser,
    goToRecruitment,
} from './utility';
require('dotenv').config();

test.describe.serial('UAT-SPRINT3-TS03', async () => {

    const groupNameEn = "Applied Network Technology (ANT)";
    const groupNameTh = "เทคโนโลยีเครือข่ายประยุกต์";

    const email = process.env.HEAD_EMAIL;
    const password = process.env.HEAD_PASSWORD;

    test('Head group remove recruitment', async ({ page }) => {

        let curPage;

        await test.step('Login as Head lab', async () => {

            curPage = await openLoginPage(page);
            await page.close();
            await login(curPage, email, password);
        });

        await test.step('remove recruitment', async () => {
            await goToRecruitment(curPage);
            await curPage.getByTitle('Delete').click();
            await curPage.waitForTimeout(2000);
            await curPage.getByRole('button', { name: 'OK' }).click();
            await curPage.waitForTimeout(500);
            await curPage.getByRole('button', { name: 'OK' }).click();
            await curPage.waitForTimeout(2000);
        });
    });

    test('User won\'t see the recruitment in the list', async ({ page }) => {
        await goToResearchGroupAsUser(page, groupNameEn);
        await page.waitForTimeout(2000);
        await expect(page.getByRole('heading', { name: 'AI in Cloud Computing,' })).toHaveCount(0);
        await expect(page.getByRole('link', { name: 'More Detail' })).toHaveCount(0);
    });
});