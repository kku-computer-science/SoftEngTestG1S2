import { expect, test } from '@playwright/test';
import {
    login,
    openLoginPage,
    goToResearchGroupAsUser,
    goToRecruitment,
    recruitmentTitle,
    recruitmentPosition,
    recruitmentSalary,
} from './utility';
require('dotenv').config();

test.describe.serial('UAT-SPRINT3-TS02', async () => {

    const groupNameEn = "Applied Network Technology (ANT)";
    const groupNameTh = "เทคโนโลยีเครือข่ายประยุกต์";

    const email = process.env.HEAD_EMAIL;
    const password = process.env.HEAD_PASSWORD;

    test('Head group edit recruitment', async ({ page }) => {

        let curPage;

        await test.step('Login as Head lab', async () => {

            curPage = await openLoginPage(page);
            await page.close();
            await login(curPage, email, password);
        });

        await test.step('edit recruitment', async () => {
            await goToRecruitment(curPage);
            
            await curPage.getByTitle('Edit').click();

            await curPage.waitForTimeout(2000);
            await recruitmentTitle(curPage, 'AI in Cloud Computing', 'AI in Cloud Computing');
            await recruitmentPosition(curPage, 'นักศึกษาปริญญาเอก (Ph.D. Candidate)');
            
            await curPage.locator('input[name="qualifications\\[0\\]\\[text_th\\]"]').fill('1 วารสาร Q1 (WoS/ISI)');
            await curPage.locator('input[name="qualifications\\[0\\]\\[text_en\\]"]').fill('1 Q1 Journal (WoS/ISI)');
            
            await curPage.waitForTimeout(2000);

            await recruitmentSalary(curPage, '30000');
            
            
            await curPage.getByRole('button', { name: 'Update' }).click();
        });
    });

    test('User can see the recruitment in the list', async ({ page }) => {
        await goToResearchGroupAsUser(page, groupNameEn);
        await page.waitForTimeout(3000);
        await expect(page.getByRole('heading', { name: 'AI in Network Computing,' })).toHaveCount(0);
        await page.getByRole('link', { name: 'More Detail' }).click();
        await page.waitForTimeout(5000);
    });
});