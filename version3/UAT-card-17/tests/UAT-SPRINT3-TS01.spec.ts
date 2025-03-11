import { expect, test } from '@playwright/test';
import {
    login,
    openLoginPage,
    goToResearchGroupAsUser,
    goToRecruitment,
    newRecruitment,
    recruitmentOfGroup,
    recruitmentTitle,
    recruitmentPosition,
    recruitmentDetail,
    recruitmentOtherDetail,
    recruitmentWorkPlace,
    recruitmentSalary,
    recruitmentApplyChannel
} from './utility';
require('dotenv').config();

test.describe.serial('UAT-SPRINT3-TS01', async () => {

    const app_url: string = process.env.APP_URL ?? 'http://localhost:8000';

    const groupNameEn = "Applied Network Technology (ANT)";
    const groupNameTh = "เทคโนโลยีเครือข่ายประยุกต์";

    const email = process.env.HEAD_EMAIL;
    const password = process.env.HEAD_PASSWORD;

    test('Head group add recruitment', async ({ page }) => {

        let curPage;

        await test.step('Login as Head lab', async () => {

            curPage = await openLoginPage(page);
            await page.close();
            await login(curPage, email, password);
        });

        await test.step('Add recruitment', async () => {
            await goToRecruitment(curPage);
            await newRecruitment(curPage);
            await recruitmentOfGroup(curPage, groupNameTh);
            await recruitmentTitle(curPage, 'AI in Network Computing', 'AI in Network Computing');
            await recruitmentPosition(curPage, 'นักวิจัยหลังปริญญาเอก (Postdoctoral Researcher)');
            await recruitmentDetail(curPage, 'ดำเนินการวิจัยและพัฒนา AI ในเทคโนโลยีไร้สายและเครือข่ายเคลื่อนที่ เช่น 4G/5G, IoT, เครือข่ายยานยนต์, ดาวเทียม และการสื่อสารแบบอัตโนมัติ พัฒนา AI เพื่อเพิ่มประสิทธิภาพของเครือข่าย รวมถึงการส่งข้อมูลมัลติมีเดีย การบริหารจัดการเครือข่าย และโครงสร้างพื้นฐานของอินเทอร์เน็ตความเร็วสูง วิจัยการใช้ AI ในความปลอดภัยของเครือข่าย เช่น การตรวจจับภัยคุกคามอัจฉริยะ การเฝ้าระวังเครือข่าย การเข้ารหัสข้อมูล และการป้องกันการโจมตีทางไซเบอร์ ศึกษาและพัฒนา AI ในคลาวด์คอมพิวติ้ง สำหรับการประมวลผลแบบขนาน, ระบบกระจายศูนย์ และคอมพิวเตอร์ประสิทธิภาพสูง พัฒนา เทคโนโลยีอัจฉริยะ ที่นำ AI มาประยุกต์ใช้ในอุตสาหกรรมต่าง ๆ เช่น การแพทย์ การเกษตร ยานยนต์ และการผลิต ตีพิมพ์ผลงานวิจัยในวารสารและการประชุมวิชาการระดับนานาชาติ ทำงานร่วมกับทีมวิจัยและสนับสนุนการขอทุนวิจัย','Conduct research and develop AI-driven solutions for mobile, wireless, and cellular technologies, including 4G/5G, IoT, autonomous networks, and satellite communications. Enhance AI efficiency in networking to improve data transmission, multimedia communication, network management, and high-speed routing architectures. Investigate AI applications in network security, including intelligent threat detection, network surveillance, encryption, and cybersecurity in high-speed networks. Apply AI techniques to cloud computing, focusing on parallel processing, distributed systems, and high-performance computing. Develop smart technologies integrating AI into various industries, such as healthcare, agriculture, automotive, and industrial automation. Publish research findings in high-impact journals and present at leading conferences. Collaborate with interdisciplinary teams and contribute to funding proposals.')
            
            
            await recruitmentOtherDetail(curPage, 'เรากำลังมองหานักวิจัยหลังปริญญาเอกที่มีความกระตือรือร้นมาร่วมทีมวิจัยของเราในหัวข้อ ปัญญาประดิษฐ์ในการประมวลผลเครือข่าย (AI in Network Computing) ตำแหน่งนี้มุ่งเน้นการพัฒนาและประยุกต์ใช้ AI ในเครือข่ายไร้สาย การประมวลผลเครือข่าย ความปลอดภัยบนเครือข่าย คลาวด์คอมพิวติ้ง และเทคโนโลยีอัจฉริยะ โดยผู้ที่ได้รับคัดเลือกจะได้ทำงานวิจัยล้ำสมัยและร่วมมือกับผู้เชี่ยวชาญชั้นนำในสาขานี้', 'We are seeking a highly motivated Postdoctoral Researcher to join our research team in AI in Network Computing. This position focuses on advancing artificial intelligence applications in mobile and wireless networks, networking efficiency, security, cloud computing, and smart technology. The successful candidate will contribute to innovative research and collaborate with leading experts in the field.')
            await recruitmentWorkPlace(curPage, 'วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น อาคารวิทยาวิภาส ถนนมิตรภาพ อำเภอเมือง จังหวัดขอนแก่น 40002', 'College of Computing at Khon Kaen University. Vidhayavibaj Building, Mitraparp road, Muang District, Khon Kaen 40002 ');
            await recruitmentSalary(curPage, '40000');
            await recruitmentApplyChannel(curPage, 'Active Recruitment https://activerecruit.kku.ac.th , Graduate Student @KKU https://app.gs.kku.ac.th/gs/en/ , International Student @KKU https://iad.kku.ac.th/', 'Active Recruitment https://activerecruit.kku.ac.th , Graduate Student @KKU https://app.gs.kku.ac.th/gs/en/ , International Student @KKU https://iad.kku.ac.th/');
            
            await curPage.getByRole('textbox', { name: 'ภาษาไทย', exact: true }).click();
            await curPage.getByRole('textbox', { name: 'ภาษาไทย', exact: true }).fill('2-3 วารสาร Tier 1 (WoS/ISI)');
            await curPage.getByRole('textbox', { name: 'ภาษาไทย', exact: true }).press('Tab');
            await curPage.getByRole('textbox', { name: 'English', exact: true }).fill('2-3 Tier 1 Journal (WoS/ISI)');

            await curPage.getByRole('button', { name: '+' }).click();
            await curPage.locator('input[name="qualifications\\[1\\]\\[text_en\\]"]').click();
            await curPage.locator('input[name="qualifications\\[1\\]\\[text_en\\]"]').fill('Emphasis on the application of AI/ML to increase the efficiency of computing and communication of Mobile and Wireless Technology.');
            await curPage.locator('input[name="qualifications\\[1\\]\\[text_th\\]"]').click();
            await curPage.locator('input[name="qualifications\\[1\\]\\[text_th\\]"]').fill('เน้นการประยุกต์ใช้ AI/ML เพื่อเพิ่มประสิทธิภาพการคำนวณและการสื่อสารของเทคโนโลยีมือถือและไร้สาย');

            await curPage.getByRole('button', { name: '+' }).click();
            await curPage.locator('input[name="qualifications\\[2\\]\\[text_th\\]"]').click();
            await curPage.locator('input[name="qualifications\\[2\\]\\[text_th\\]"]').fill('เน้นการประยุกต์ใช้ AI/ML เพื่อเพิ่มประสิทธิภาพการคำนวณและการสื่อสารของเทคโนโลยีเครือข่ายและอินเทอร์เน็ต');
            await curPage.locator('input[name="qualifications\\[2\\]\\[text_en\\]"]').click();
            await curPage.locator('input[name="qualifications\\[2\\]\\[text_en\\]"]').fill('Emphasis on the application of AI/ML to increase the efficiency of computing and communication of Network and Internet Technology.');

            await curPage.getByRole('button', { name: '+' }).click();
            await curPage.locator('input[name="qualifications\\[3\\]\\[text_th\\]"]').click();
            await curPage.locator('input[name="qualifications\\[3\\]\\[text_th\\]"]').fill('เน้นการประยุกต์ใช้ AI/ML เพื่อเพิ่มประสิทธิภาพการคำนวณและการสื่อสารของเทคโนโลยีคลาวด์คอมพิวติ้ง');
            await curPage.locator('input[name="qualifications\\[3\\]\\[text_en\\]"]').click();
            await curPage.locator('input[name="qualifications\\[3\\]\\[text_en\\]"]').fill('Emphasis on the application of AI/ML to increase the efficiency of computing and communication of Cloud Computing Technology.');

            await curPage.getByRole('button', { name: '+' }).click();
            await curPage.locator('input[name="qualifications\\[4\\]\\[text_th\\]"]').click();
            await curPage.locator('input[name="qualifications\\[4\\]\\[text_th\\]"]').fill('เน้นการประยุกต์ใช้ AI/ML เพื่อเพิ่มประสิทธิภาพของเทคโนโลยีความปลอดภัย');
            await curPage.locator('input[name="qualifications\\[4\\]\\[text_en\\]"]').click();
            await curPage.locator('input[name="qualifications\\[4\\]\\[text_en\\]"]').fill('Emphasis on the application of AI/ML to enhance the performance of Security Technology.');

            await curPage.getByRole('button', { name: 'Submit' }).click();
        });
    });

    test('User can see the recruitment in the list', async ({ page }) => {
        await goToResearchGroupAsUser(page, groupNameEn);
        await page.waitForTimeout(3000);
        await page.getByRole('link', { name: 'More Detail' }).click();
        await page.waitForTimeout(5000);
    });
});