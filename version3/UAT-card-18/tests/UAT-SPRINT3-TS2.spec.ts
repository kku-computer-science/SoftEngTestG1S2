import {test, expect} from '@playwright/test';
import {
    openLoginPage, 
    login, 
    goToResearchGroup, 
    goToResearchGroupAsUser,
    editResearchGroupPage,
    editGroupName,
    editGroupDescription,
    editGroupDetail,
} from './utility';

require('dotenv').config();


test.describe.serial('UAT-SPRINT3-TS1', () => {
    const prevGroupNameEn = 'MLIS';
    const prevGroupNameTh = 'MLIS';

    const email = process.env.AUTHORIZED_RESEARCHER_EMAIL;
    const password = process.env.AUTHORIZED_RESEARCHER_PASSWORD;
    
    test('TS2 : แก้ไขข้อมูลแลป', async ({page}) => {
        
        let curPage;

        await test.step('Login as authorized researcher', async () => {
            curPage = await openLoginPage(page);
            await page.close();
            await expect(curPage).toHaveTitle('Login');
            await login(curPage, email, password);
            await expect(curPage).toHaveTitle('Dashboard');
        });

        await test.step('เข้าสูู่หน้าจัดการกลุ่มวิจัย', async () => {
            await goToResearchGroup(curPage);
            await curPage.getByRole('heading', { name: 'กลุ่มวิจัย' }).isVisible(); 
        });
        
        await test.step('แก้ไขกลุ่มวิจัย', async () => {
            await editResearchGroupPage(curPage, prevGroupNameTh);
            
            await curPage.waitForTimeout(2000);

            await editGroupName(curPage, "ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)", "Intelligent Systems and Machine Learning Research Laboratory (MLIS)");
            await editGroupDescription(curPage, "วัตถุประสงค์หลักของโครงการนี้คือการทำวิจัยและสร้างความรู้ใหม่เกี่ยวกับการเรียนรู้ของเครื่องและระบบอัจฉริยะตลอดจนการใช้งาน", "The main purpose of this project is to conduct research and build new knowledge concerning machine learning and intelligent systems as well as their applications.");
            await editGroupDetail(curPage, "วัตถุประสงค์หลักของโครงการนี้คือการทำวิจัยและสร้างความรู้ใหม่เกี่ยวกับการเรียนรู้ของเครื่องและระบบอัจฉริยะตลอดจนการใช้งาน", "The main purpose of this project is to conduct research and build new knowledge concerning machine learning and intelligent systems as well as their applications.");
            
            await curPage.waitForTimeout(2000);
            
            await curPage.getByRole('button', { name: 'Submit' }).click();
            await expect(curPage).toHaveURL(`${process.env.APP_URL}/researchGroups`);
            await expect(curPage.getByText('MLIS')).toBeVisible();
        });
        
    });
    
    test('TS2 : เช็คข้อมูลกลุ่มวิจัยที่ถูกแก้ไข', async ({page}) => {
        await goToResearchGroupAsUser(page, "MLIS");
        await page.getByRole('heading', { name: "MLIS" }).isVisible();
        await page.waitForTimeout(4000);
        await page.close();
    });
});
