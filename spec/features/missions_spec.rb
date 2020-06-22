require "rails_helper"
RSpec.feature "Missions", type: :feature do
  let (:user) { create(:user)}
  let (:mission) { create(:mission, name: "test")}
  
  describe "Mission CRUD" do

    context "when create" do
      before do
        visit root_path
        click_link I18n.t("missions.new_mission")
        page.fill_in "mission[name]", with: "Example name"
        page.fill_in "mission[description]", with: "Example description"
        page.fill_in "mission[start_at]", with: "#{Time.now}"
        click_button create_button
      end

      it "should be create" do
        expect(page).to have_content 'Example name'
      end

      def create_button
        I18n.t('helpers.submit.create', model: "Mission")
      end
    end

    context "when destroy" do
      before do
        mission
        visit root_path
        click_link I18n.t("delete")
      end

      it "should be delete" do
        expect(page).to have_content I18n.t("missions.delete")
        expect(page).not_to have_content 'test'
      end
    end

    context "when update" do
      before  do
        mission
        visit root_path
        click_link I18n.t("edit")
        page.fill_in "mission[name]", with: "m2"
        page.fill_in "mission[description]", with: "m2"
        click_button update_button
      end
      
      it "should be update" do
        expect(page).not_to have_content 'test'
        expect(page).to have_content 'm2'
      end

      def update_button
        I18n.t('helpers.submit.update', model: "Mission")
      end
    end
  end
end
