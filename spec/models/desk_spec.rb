require 'rails_helper'

RSpec.describe Desk, type: :model do
  describe '#create' do
    before do
      @desk = FactoryBot.create(:desk)
    end

    context '投稿成功' do
      it 'image, desk_textがあれば登録できる' do
        expect(@desk).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'user_idが空では登録できない' do
        @desk.user_id = nil
        @desk.valid?
        expect(@desk.errors.full_messages).to include('User must exist')
      end

      it 'desk_textが空では登録できない' do
        @desk.desk_text = nil
        @desk.valid?
        expect(@desk.errors.full_messages).to include("Desk text can't be blank")
      end

      it 'imageが空では登録できない' do
        @desk.image = nil
        @desk.valid?
        expect(@desk.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
