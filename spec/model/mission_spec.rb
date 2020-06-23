require 'rails_helper'

RSpec.describe "Mission", type: :model do
  describe "Mission model validation" do
    let(:mission) { create(:mission) }
    context "可正常建立" do
      it "when 正常填入" do 
        expect(mission).to be_valid 
      end
    end
    context "建立失敗" do
      context "name 欄位" do
        it "when 未填 name" do
          mission.name = nil
          expect(mission).not_to be_valid
          expect(mission.errors.full_messages).to include "Name #{I18n.t('errors.messages.blank')}"
        end
      end
      context "start_at 欄位" do
        it "when start_at 未填" do
          mission.start_at = nil
          expect(mission).not_to be_valid
          expect(mission.errors.full_messages).to include "Start at #{I18n.t('errors.messages.blank')}"
        end
      end
      context "status 欄位" do
        it "when status 未填" do
          mission.status = nil
          expect(mission).not_to be_valid
          expect(mission.errors.full_messages).to include "Status #{I18n.t('errors.messages.blank')}"
        end
      end
      context "order 欄位" do
        it "when order 未填" do
          mission.order = nil
          expect(mission).not_to be_valid
          expect(mission.errors.full_messages).to include "Order #{I18n.t('errors.messages.blank')}"
        end
      end
    end
  end
end
