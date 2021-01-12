require 'rails_helper'

RSpec.describe Scout, type: :model do
  describe '#create' do
    before do
      @scout = FactoryBot.build(:scout)
    end

    context '投稿成功' do
      it 'scout_title, scout_game_id, firend_textがあれば登録できる' do
        expect(@scout).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'scout_titleが空では登録できない' do
        @scout.scout_title = nil
        @scout.valid?
        expect(@scout.errors.full_messages).to include("Scout title can't be blank")
      end

      it 'scout_game_idが空では登録できない' do
        @scout.scout_game_id = nil
        @scout.valid?
        expect(@scout.errors.full_messages).to include("Scout game can't be blank")
      end

      it 'scout_textが空では登録できない' do
        @scout.scout_text = nil
        @scout.valid?
        expect(@scout.errors.full_messages).to include("Scout text can't be blank")
      end
    end
  end
end
