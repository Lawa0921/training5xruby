require 'rails_helper'

RSpec.describe "Mission", type: :model do
  describe "Mission model validation" do
    let(:user) { create(:user) }
    context "可正常建立" do
      it "when 正常填入" do 
        expect(user).to be_valid 
      end
    end
    context "建立失敗" do
      context "name 欄位" do
        it "when name 未填" do
          user.name = nil
          expect(user).not_to be_valid
        end
        it "when name 重複 " do
          u2 = build(:user, name: user.name)
          u2.save
          expect(u2).not_to be_valid
        end
        it "when name 過長" do
          user.name ="0123456789012345678901234567890123456789"
          expect(user).not_to be_valid
        end
      end
      context "email 欄位" do
        it "when email 未填" do
          user.email = nil
          expect(user).not_to be_valid
        end
        it "when email 重複" do
          u2 = build(:user, email: user.email)
          u2.save
          expect(u2).not_to be_valid
        end
        it "when email 格式不符" do
          user.email ="hahaha"
          expect(user).not_to be_valid
          user.email = "hahaha@"
          expect(user).not_to be_valid
          user.email = "@gmail.com"
          expect(user).not_to be_valid
        end
      end
      context "password 欄位" do
        it "when password 過短" do
          user.password = "123"
          expect(user).not_to be_valid
        end
        it "when password 未填" do
          user.password = nil
          expect(user).not_to be_valid
        end
      end
    end
  end
end
