require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目の入力が存在すれば登録できること"  do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it "passwordが半角数字のみの時登録できないこと" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it "passwordが半角英語のみの時登録できないこと" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it "passwordが全角英語のみの時登録できないこと" do
        @user.password = "ABCDEF"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it "last_nameがない場合は登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank") 
      end
      it "last_nameが数字の場合は登録できないこと" do
        @user.last_name = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid") 
      end
      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank") 
      end
      it "last_name_kanaがひらがな・漢字の場合は登録できないこと" do
        @user.last_name_kana = "あああ漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid") 
      end
      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it "first_nameが数字場合は登録できないこと" do
        @user.first_name = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid") 
      end
      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank") 
      end
      it "first_name_kanaがひらがな・漢字の場合は登録できないこと" do
        @user.first_name_kana = "あああ漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid") 
      end
      it "birthdayがない場合は登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
