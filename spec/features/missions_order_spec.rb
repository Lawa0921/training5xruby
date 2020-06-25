require "rails_helper"
RSpec.feature "Missions Order", type: :feature do
  let(:user) { create(:user) }
  describe "#index" do
    before do
      user_login(user)
    end
    context "Order by created_at" do
      before do
        create(:mission, created_at: Time.now, name: "first")
        Timecop.travel(Time.local(2020, 6, 18, 20, 0, 0))
        create(:mission, created_at: Time.now, name: "secord")
        Timecop.travel(Time.local(2020, 6, 14, 10, 0, 0))
        create(:mission, created_at: Time.now, name: "last")
        Timecop.return
        visit root_path
      end
      it "依照創建時間排序" do
        within 'tbody tr:first-child' do
          expect(page).to have_content "first"
        end
        within 'tbody tr:nth-child(2)' do
          expect(page).to have_content "secord"
        end
        within 'tbody tr:nth-child(3)' do
          expect(page).to have_content "last"
        end
      end
    end

    context "Order by end_at" do
      before do
        create(:mission, end_at: Time.local(2020, 6, 23, 0, 0, 0), name: "first")
        create(:mission, end_at: Time.local(2020, 6, 24, 0, 0, 0), name: "secord")
        create(:mission, end_at: Time.local(2020, 6, 25, 0, 0, 0), name: "last")

        visit root_path
        click_link I18n.t("missions.end")
      end
      it "依照結束時間排序" do
        within 'tbody tr:first-child' do
          expect(page).to have_content "first"
        end
        within 'tbody tr:nth-child(2)' do
          expect(page).to have_content "secord"
        end
        within 'tbody tr:nth-child(3)' do
          expect(page).to have_content "last"
        end
      end
    end

    context "Order by priority" do
      before do
        create(:mission, priority: 0, name: "last")
        create(:mission, priority: 1, name: "secord")
        create(:mission, priority: 2, name: "first")
        visit root_path
        click_link I18n.t("missions.priority")
      end

      it "依照優先度排序" do
        within 'tbody tr:first-child' do
          expect(page).to have_content "first"
        end
        within 'tbody tr:nth-child(2)' do
          expect(page).to have_content "secord"
        end
        within 'tbody tr:nth-child(3)' do
          expect(page).to have_content "last"
        end
      end
    end
  end

  private
  def user_login(user)
    visit new_session_path
    fill_in("user[email]", with: "#{user.email}")
    fill_in("user[password]", with: "#{user.password}")
    click_button (I18n.t("users.session_new"))
  end
end
