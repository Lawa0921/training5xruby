require "rails_helper"
RSpec.feature "Missions Order", type: :feature do
  let(:user) { create(:user) }
  describe "#index" do
    before do
      user_login(user)
    end
    context "Order by created_at" do
      before do
        create(:mission, created_at: Time.now, name: "first", user_id: user.id)
        Timecop.travel(Time.local(2020, 6, 18, 20, 0, 0))
        create(:mission, created_at: Time.now, name: "secord", user_id: user.id)
        Timecop.travel(Time.local(2020, 6, 14, 10, 0, 0))
        create(:mission, created_at: Time.now, name: "last", user_id: user.id)
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
        create(:mission, end_at: Time.local(2020, 6, 23, 0, 0, 0), name: "first", user_id: user.id)
        create(:mission, end_at: Time.local(2020, 6, 24, 0, 0, 0), name: "secord", user_id: user.id)
        create(:mission, end_at: Time.local(2020, 6, 25, 0, 0, 0), name: "last", user_id: user.id)

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
        create(:mission, priority: 0, name: "last", user_id: user.id)
        create(:mission, priority: 1, name: "secord", user_id: user.id)
        create(:mission, priority: 2, name: "first", user_id: user.id)
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

    context "資料取出" do
      before do
        user_login(user)
        create(:mission,name: "find me", user_id: user.id)
        create(:mission,name: "lalala" )
        visit root_path
      end
      it "只能看到自己的 mission" do
        expect(page).to have_content "find me"
        expect(page).not_to have_content "lalala"
      end
    end
  end
end
