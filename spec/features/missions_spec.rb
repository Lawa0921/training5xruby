require "rails_helper"
RSpec.feature "Missions", type: :feature do
  let (:user) { create(:user)}
  let (:mission) { create(:mission, name: "test")}
  
  describe "Mission CRUD" do

    context "when create" do
      before do
        user
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

  describe "Mission search" do
    context "search with mission name" do
      before do
        create(:mission, name: "find me", status: "pending")
        create(:mission, name: "lalala")
        create(:mission, name: "hahaha")
        visit root_path
      end

      it "可以搜尋到指定的 name" do
        page.fill_in "q[name_cont]", with: "find me"
        click_button I18n.t("ransack.search")
        expect(page).not_to have_content "lalala"
        expect(page).to have_content "find me"
      end
    end

    context "search with mission status" do
      before do
        create(:mission, status: "pending")
        create(:mission, status: "working")
        create(:mission, status: "done")
        visit root_path
      end

      it "可以搜尋到指定的 status" do
        select(I18n.t("mission.statuses.pending"), from: "q[status_eq]").select_option
        click_button I18n.t("ransack.search")
        within 'tbody' do
          expect(page).not_to have_content I18n.t("mission.statuses.working")
          expect(page).to have_content I18n.t("mission.statuses.pending")
        end
      end
    end

    context "search with mission name and status" do
      before do
        create(:mission, status: "pending", name: "find me")
        create(:mission, status: "pending", name: "lalala")
        create(:mission, status: "done", name: "hahaha")
        visit root_path
      end

      it "可以搜尋到指定的 name 及 status 組合" do
        select(I18n.t("mission.statuses.pending"), from: "q[status_eq]").select_option
        page.fill_in "q[name_cont]", with: "find me"
        click_button I18n.t("ransack.search")
        expect(page).to have_content "find me"
        expect(page).not_to have_content "lalala"
      end
    end
  end
end
