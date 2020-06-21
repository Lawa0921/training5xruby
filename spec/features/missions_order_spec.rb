require "rails_helper"
RSpec.feature "Missions Order", type: :feature do
  describe "#index" do
    context "Order by created_at" do
      before do
        create(:mission, created_at: 1.day.ago, name: "secord")
        create(:mission, created_at: Time.now, name: "first")
        create(:mission, created_at: 2.days.ago, name: "last")
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
  end
end
