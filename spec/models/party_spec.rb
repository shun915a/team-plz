require 'rails_helper'

RSpec.describe Party, type: :model do
  describe '#create' do
    before do
      @party = FactoryBot.create(:party)
    end

    context '投稿成功' do
      it 'party_title, party_game_id, party_textがあれば登録できる' do
        expect(@party).to be_valid
      end

      it 'new_party成功' do
        expect(@party.new_party).not_to be false
      end
    end

    context 'エラー発生時' do
      it 'user_idが空では登録できない' do
        @party.user_id = nil
        @party.valid?
        expect(@party.errors.full_messages).to include('User must exist')
      end

      it 'party_titleが空では登録できない' do
        @party.party_title = nil
        @party.valid?
        expect(@party.errors.full_messages).to include("Party title can't be blank")
      end

      it 'party_game_idが空では登録できない' do
        @party.party_game_id = nil
        @party.valid?
        expect(@party.errors.full_messages).to include("Party game can't be blank")
      end

      it 'party_textが空では登録できない' do
        @party.party_text = nil
        @party.valid?
        expect(@party.errors.full_messages).to include("Party text can't be blank")
      end

      it 'new_party error' do
        @party.user_id = nil
        expect(@party.new_party).to be false
      end
    end
  end
end
