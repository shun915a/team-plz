require 'rails_helper'

RSpec.describe PartyMember, type: :model do
  describe '#create' do
    before do
      @party_member = FactoryBot.create(:party_member)
    end

    context '投稿成功' do
      it 'user_id, party_id, roleがあれば登録できる' do
        expect(@party_member).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'user_idが空では登録できない' do
        @party_member.user_id = nil
        @party_member.valid?
        expect(@party_member.errors.full_messages).to include('User must exist')
      end
      it 'party_idが空では登録できない' do
        @party_member.party_id = nil
        @party_member.valid?
        expect(@party_member.errors.full_messages).to include('Party must exist')
      end
    end
  end
end
