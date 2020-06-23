require 'rails_helper'

RSpec.describe "Mission", type: :model do
  let(:tag) { create(:tag)}
  describe "Tag model validation" do
    context "可正常建立" do
      it "when 正常填入" do
        expect(tag).to be_valid
      end
    end
    context "建立失敗" do
      context "name 欄位" do
        it "when name 未填" do
          tag.name = nil
          expect(tag).not_to be_valid
          expect(tag.errors.full_messages).to include "Name #{I18n.t('errors.messages.blank')}"
        end
      end
    end
  end
end
