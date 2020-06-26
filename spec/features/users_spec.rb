require "rails_helper"
RSpec.feature "Missions", type: :feature do
  let (:user) { create(:user)}
  let (:mission) { create(:mission, name: "test")}
  before do
    user_login(user)
  end
  describe "Session" do
    context "When create" do
      it "should be successful" do
        expect(page).to have_content I18n.t("logout")
      end
    end
    context "When destroy" do
      it "should be successful" do
        click_link I18n.t("logout")
        expect(page).to have_content I18n.t("notice.user.logout")
      end
    end
  end
  describe "User" do
    context "When create" do
      before do
        visit new_user_path
        fill_in "user[name]", with: "sample"
        fill_in "user[email]", with: "sample@gmail.com"
        fill_in "user[password]", with: "123456"
        fill_in "user[password_confirmation]", with: "123456"
        click_button I18n.t("sign_up")
      end
      it "should be created successfully" do
        expect(page).to have_content I18n.t("notice.user.create_success")
      end
    end
  end
end
