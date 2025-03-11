import {test, expect} from '@playwright/test';
import {
    openLoginPage, 
    login, 
    goToResearchGroup
} from './utility';

require('dotenv').config();


test.describe.serial('UAT-SPRINT3-TS1', () => {
    const prevGroupNameEn = 'Intelligent Systems and Machine Learning Research Laboratory (MLIS)';
    const prevGroupNameTh = 'ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)';

    const email = process.env.UNAUTHORIZED_RESEARCHER_EMAIL;
    const password = process.env.UNAUTHORIZED_RESEARCHER_PASSWORD;
    
    test('TS3 : แก้ไขข้อมูลแลป', async ({page}) => {
        
        let curPage;

        await test.step('Login as admin', async () => {
            curPage = await openLoginPage(page);
            await page.close();
            await expect(curPage).toHaveTitle('Login');
            await login(curPage, email, password);
            await expect(curPage).toHaveTitle('Dashboard');
        });

        await test.step('เข้าสูู่หน้าจัดการกลุ่มวิจัย', async () => {
            await goToResearchGroup(curPage);
            await curPage.getByRole('heading', { name: 'กลุ่มวิจัย' }).isVisible(); 
            await curPage.waitForTimeout(5000);
            await expect(curPage.getByRole('row', { name: prevGroupNameTh }).getByRole('link')).toHaveCount(1);
            await curPage.close();
        });
        
    });
});
