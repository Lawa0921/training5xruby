require "rails_helper"
RSpec.feature "Missions", type: :feature do
  before (:all )do
    create(:user)
  end

  scenario "可新增任務" do
    visit root_path
    click_link 'new mission'

    page.fill_in "mission[name]", with: "Example name"
    page.fill_in "mission[description]", with: "Example description"
    click_button "Create Mission"

    expect(page).to have_content 'Created'
    expect(page).to have_content 'Example name'
  end

  scenario "可以刪除 mission" do
    create(:mission, name: "m1")
    visit root_path
    expect(page).to have_content "m1"
    click_link 'delete'

    expect(page).not_to have_content 'm1'
  end

  scenario "可以編輯 mission" do
    create(:mission, name: "m1")
    visit root_path
    expect(page).to have_content 'm1'
    click_link 'edit'
    page.fill_in "mission[name]", with: "m2"
    page.fill_in "mission[description]", with: "m2"
    click_button 'Update Mission'

    visit root_path

    expect(page).not_to have_content 'm1'
    expect(page).to have_content 'm2'
  end
end
