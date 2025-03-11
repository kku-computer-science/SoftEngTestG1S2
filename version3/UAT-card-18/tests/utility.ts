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

const goToResearchGroup = async (page) => {
    await page.getByRole('link', { name: 'Research Group' }).click();
    return page;
}

const goToResearchGroupAsUser = async (page, GroupName) => {
    await page.goto(process.env.APP_URL);
    await page.getByRole('link', { name: 'Research Group' }).click();
    await page.getByRole('link', { name: GroupName }).click();
    return page;
}

const editGroupName = async (page, newGroupNameTh, newGroupNameEn) => {
    await page.getByRole('textbox', { name: 'ชื่อกลุ่มวิจัย (ภาษาไทย)' }).fill(newGroupNameTh);
    await page.getByRole('textbox', { name: 'ชื่อกลุ่มวิจัย (English)' }).fill(newGroupNameEn);
}

const editGroupDescription = async (page, newGroupDescTh, newGroupDescEn) => {
    await page.locator('textarea[name="group_desc_th"]').fill(newGroupDescTh);
    await page.locator('textarea[name="group_desc_en"]').fill(newGroupDescEn);
}

const editGroupDetail = async (page, newGroupDetailTh, newGroupDetailEn) => {
    await page.locator('textarea[name="group_detail_th"]').fill(newGroupDetailTh);
    await page.locator('textarea[name="group_detail_en"]').fill(newGroupDetailEn);
}

const editGroupHead = async (page, head) => {
    await page.locator('div:nth-child(10) > .col-sm-8').click();
    await page.getByRole('option', { name: head }).click();
}

const addGroupMember = async (page, member) => {
    await page.locator('#add-btn2').click();
    await page.getByRole('textbox', { name: 'Select User' }).click();
    await page.getByRole('option', { name: member }).click();
}

const addGroupVisitor = async (page, visitor) => {
    await page.locator('#add-author-btn').click();
    await page.getByRole('combobox', { name: 'เลือก Visiting จากรายชื่อ' }).locator('span').nth(1).click();
    await page.getByRole('option', { name: visitor }).click();
}

const editMemberRole = async (page, member, role) => {
    await page.locator(`tr:has-text("${member}") select`).nth(1).selectOption({ label: role });
}

const editMemberPermission = async (page, member, permission) => {
    await page.locator(`tr:has-text("${member}") select`).nth(2).selectOption({ label: permission });
}

const editResearchGroupPage = async ( page, GroupName ) => {
    await page.getByRole('row', { name: GroupName }).getByRole('link').nth(1).click();
}

export {
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
    editMemberRole,
    editMemberPermission
};