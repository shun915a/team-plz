require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe '#create' do
    before do
      @friend = FactoryBot.build(:friend)
    end

    context '投稿成功' do
      it 'friend_title, friend_game_id, firend_textがあれば登録できる' do
        expect(@friend).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'user_idが空では登録できない' do
        @friend.user_id = nil
        @friend.valid?
        expect(@friend.errors.full_messages).to include('User must exist')
      end

      it 'friend_titleが空では登録できない' do
        @friend.friend_title = nil
        @friend.valid?
        expect(@friend.errors.full_messages).to include("Friend title can't be blank")
      end

      it 'friend_game_idが空では登録できない' do
        @friend.friend_game_id = nil
        @friend.valid?
        expect(@friend.errors.full_messages).to include("Friend game can't be blank")
      end

      it 'friend_textが空では登録できない' do
        @friend.friend_text = nil
        @friend.valid?
        expect(@friend.errors.full_messages).to include("Friend text can't be blank")
      end
    end
  end
end
