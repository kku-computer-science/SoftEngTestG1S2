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
    editGroupHead,
    addGroupMember,
    addGroupVisitor,
    editMemberPermission
} from './utility';

require('dotenv').config();


test.describe.serial('UAT-SPRINT3-TS1', () => {
    const prevGroupNameEn = 'Intelligent Systems and Machine Learning Research Laboratory (MLIS)';
    const prevGroupNameTh = 'ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)';

    const adminEmail = process.env.ADMIN_EMAIL;
    const adminPassword = process.env.ADMIN_PASSWORD;
    
    test('TS1 : เข้าเช็คข้อมูลกลุ่มวิจัย', async ({page}) => {
        await goToResearchGroupAsUser(page, prevGroupNameEn);
        await page.getByRole('heading', { name: prevGroupNameEn }).isVisible();
        await page.waitForTimeout(5000);
        await page.close();
    });
    
    test('TS1 : แก้ไขข้อมูลแลป', async ({page}) => {
        
        let curPage;

        await test.step('Login as admin', async () => {
            curPage = await openLoginPage(page);
            await page.close();
            await expect(curPage).toHaveTitle('Login');
            await login(curPage, adminEmail, adminPassword);
            await expect(curPage).toHaveTitle('Dashboard');
        });

        await test.step('เข้าสูู่หน้าจัดการกลุ่มวิจัย', async () => {
            await goToResearchGroup(curPage);
            await curPage.getByRole('heading', { name: 'กลุ่มวิจัย' }).isVisible(); 
        });
        
        await test.step('แก้ไขกลุ่มวิจัย', async () => {
            await editResearchGroupPage(curPage, prevGroupNameTh);

            await curPage.waitForTimeout(2000);

            await editGroupName(curPage, "MLIS", "MLIS");
            await editGroupDescription(curPage, "การเรียนรู้ของเครื่อง, ระบบอัจฉริยะ", "Machine Learning, Intelligent Systems");
            await editGroupDetail(curPage, "การเรียนรู้ของเครื่อง, ระบบอัจฉริยะ", "Machine Learning, Intelligent Systems");

            await curPage.waitForTimeout(2000);
            
            await editGroupHead(curPage, "ปัญญาพล หอระตะ");
            await addGroupMember(curPage, "พุธษดี ศิริแสงตระกูล");
            await editMemberPermission(curPage, "สันติ ทินตะนัย", "Edit");
            await addGroupVisitor(curPage, "Ananya Promkot");

            await curPage.waitForTimeout(2000);
            
            await curPage.getByRole('button', { name: 'Submit' }).click();
            await expect(curPage).toHaveURL(`${process.env.APP_URL}/researchGroups`);
            await expect(curPage.getByText('MLIS')).toBeVisible();
        });
        
    });
    
    test('TS1 : เช็คข้อมูลกลุ่มวิจัยที่ถูกแก้ไข', async ({page}) => {
        await goToResearchGroupAsUser(page, "MLIS");
        await page.getByRole('heading', { name: "MLIS" }).isVisible();
        await page.waitForTimeout(5000);
        await page.close();
    });
});
