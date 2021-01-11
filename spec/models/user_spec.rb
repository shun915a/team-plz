require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録成功時' do
      it 'nickname, email, password, password_confirtmation, birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end

    context 'エラー発生時' do
      # nickname
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'nicknameは3文字以下では登録できない' do
        @user.nickname = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname must be 4 - 25 characters.')
      end

      it 'nicknameは26文字以上では登録できない' do
        @user.nickname = '123456789012345678901234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname must be 4 - 25 characters.')
      end

      # gender
      it 'gender_idは1-3以外では登録できない' do
        @user.gender_id = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Gender must be 1 - 3.')
      end

      # email
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複していると登録できない' do
        first_user = FactoryBot.create(:user)
        @user.email = first_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含む必要がある' do
        @user.email = 'emailemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      # password
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '999zxc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは英字だけでは登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Password must includes letter and number.')
      end

      it 'passwordは数字だけでは登録できない' do
        @user.password = '123456  '
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Password must includes letter and number.')
      end

      it 'passwordは全角文字を使用して登録できない' do
        @user.password = 'abc123パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Password must includes letter and number.')
      end

      it 'passwordとpassword_confirmationは一致しなければ登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # twitter
      it 'twitter_nameは半角英数字でなければ登録できない' do
        @user.twitter_name = 'ツイッター'
        @user.valid?
        expect(@user.errors.full_messages).to include('Twitter name must be half-width characters.')
      end

      it 'twitter_nameは3文字以下では登録できない' do
        @user.twitter_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Twitter name must be 4 - 15 characters.')
      end

      it 'twitter_nameは26文字以上では登録できない' do
        @user.twitter_name = '12345678901234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Twitter name must be 4 - 15 characters.')
      end

      # twitch
      it 'twitch_nameは半角英数字でなければ登録できない' do
        @user.twitch_name = 'ツイッター'
        @user.valid?
        expect(@user.errors.full_messages).to include('Twitch name must be half-width characters.')
      end

      it 'twitch_nameは3文字以下では登録できない' do
        @user.twitch_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Twitch name must be 4 - 25 characters.')
      end

      it 'twitch_nameは26文字以上では登録できない' do
        @user.twitch_name = '123456789012345678901234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Twitch name must be 4 - 25 characters.')
      end

      # mildom
      it 'mildom_nameは半角数字でなければ登録できない' do
        @user.mildom_name = 'ツイッター'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mildom name must be half-width numbers.')
      end
    end
  end
end
