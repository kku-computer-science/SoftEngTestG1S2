const openLoginPage = async (page) => {
    await page.goto(process.env.APP_URL);
    const page1Promise = page.waitForEvent('popup');
    await page.getByRole('link', { name: 'Login' }).click();
    const page1 = await page1Promise;
    return page1;
};

const login = async (page, email, password) => {
    await page.locator('#username').fill(email);
    await page.locator('#username').press('Tab');
    await page.getByRole('textbox', { name: 'Password' }).fill(password);
    await page.getByRole('button', { name: 'Log In' }).click();
    return page;
}

const goToResearchGroupAsUser = async (page, GroupName) => {
    await page.goto(process.env.APP_URL);
    await page.getByRole('link', { name: 'Research Group' }).click();
    await page.getByRole('link', { name: GroupName }).click();
    return page;
}

const goToRecruitment = async (page) => {
    await page.getByRole('link', { name: 'Recruitments' }).click();
}

const newRecruitment = async (page) => {
    await page.getByRole('link', { name: 'ADD' }).click();
}

const editRecruitment = async (page, recruitmentName, position) => {
}

const recruitmentOfGroup = async (page, GroupName) => {
    await page.getByLabel('กลุ่มวิจัย *').selectOption({label: GroupName});
}

const recruitmentTitle = async (page, titleTh, titleEn) => {
    await page.getByRole('textbox', { name: 'ชื่อประกาศรับสมัคร (ภาษาไทย) *' }).fill(titleTh);
    await page.getByRole('textbox', { name: 'ชื่อประกาศรับสมัคร (English) *' }).fill(titleEn);
}

const recruitmentPosition = async (page, position) => {
    await page.getByLabel('ตำแหน่ง *').selectOption({ label: position });
}

const recruitmentDetail = async (page, detailTh, detailEn) => {
    await page.getByRole('textbox', { name: 'รายละเอียดงาน (ภาษาไทย) *' }).fill(detailTh);
    await page.getByRole('textbox', { name: 'รายละเอียดงาน (English) *' }).fill(detailEn);
}

const recruitmentOtherDetail = async (page, otherDetailTh, otherDetailEn) => {
    await page.getByRole('textbox', { name: 'รายละเอียดเพิ่มเติม (ภาษาไทย)' }).fill(otherDetailTh);
    await page.getByRole('textbox', { name: 'รายละเอียดเพิ่มเติม (English)' }).fill(otherDetailEn);
}

const recruitmentWorkPlace = async (page, workPlaceTh, workPlaceEn) => {
    await page.getByRole('textbox', { name: 'สถานที่ทำงาน (ภาษาไทย) *' }).fill(workPlaceTh);
    await page.getByRole('textbox', { name: 'สถานที่ทำงาน (English) *' }).fill(workPlaceEn);
}

const recruitmentSalary = async (page, salary) => {
    await page.getByRole('spinbutton', { name: 'ค่าตอบแทน' }).fill(salary);
}

const recruitmentApplyChannel = async (page, applyChannelTh, applyChannelEn) => {
    await page.locator('#apply_channel_th').fill(applyChannelTh);
    await page.locator('#apply_channel_en').fill(applyChannelEn);
}

export {
    openLoginPage, 
    login, 
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
};