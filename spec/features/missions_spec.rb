require "rails_helper"
RSpec.feature "Missions", type: :feature do
  let (:user) { create(:user)}
  let (:mission) { create(:mission, name: "test")}
  
  describe "Mission CRUD" do

    context "when create" do
      before do
        visit root_path
        click_link 'new mission'
        page.fill_in "mission[name]", with: "Example name"
        page.fill_in "mission[description]", with: "Example description"
        click_button "Create Mission"
      end

      it "should be create" do
        expect(page).to have_content 'Example name'
      end
    end

    context "when destroy" do
      before do
        mission
        visit root_path
        click_link 'delete'
      end

      it "should be delete" do
        expect(page).to have_content 'Deleted'
        expect(page).not_to have_content 'test'
      end
    end

    context "when update" do
      before  do
        mission
        visit root_path
        click_link 'edit'
        page.fill_in "mission[name]", with: "m2"
        page.fill_in "mission[description]", with: "m2"
        click_button 'Update Mission'
      end
      
      it "should be update" do
        expect(page).not_to have_content 'test'
        expect(page).to have_content 'm2'
      end
    end
  end
end
