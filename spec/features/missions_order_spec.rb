require "rails_helper"
RSpec.feature "Missions Order", type: :feature do
  describe "#index" do
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
  end
end
