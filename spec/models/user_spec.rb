require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_kanaとfirst_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it "passwordが英数字混合であり、6文字以上であれば登録できる" do
        @user.password = "aaa123"
        @user.password_confirmation = "aaa123"
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'first_kanaが空では登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end

    it 'last_kanaが空では登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'passwordとpassword_confirmationが5文字以下では登録できない' do
      @user.password = '11aaa'
      @user.password_confirmation = '11aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpasword_contirmationが同じ出なければ登録できない' do
      @user.password = '123aaa'
      @user.password_confirmation = '321bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは英字と数字の両方を含めなけば登録できない(英語のみの場合)' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'passwordが半角英数字混合でなければ登録できない(数字のみの場合)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'first_kanaが全角カタカナでなければ登録できない' do
      @user.first_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana is invalid')
    end

    it 'last_kanaが全角カタカナでなければ登録できない' do
      @user.last_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kana is invalid')
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'hoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    
    it 'passwordが全角英字では登録できない' do
      @user.password = 'ｎｏｐｑｒｕｖ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

   end
  end
end
