require 'rails_helper'

RSpec.describe Myteam, type: :model do
  describe '#create' do
    before do
      @myteam = FactoryBot.create(:myteam)
    end

    context '投稿成功' do
      it 'friend_title, friend_game_id, firend_textがあれば登録できる' do
        expect(@myteam).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'user_idが空では登録できない' do
        @myteam.user_id = nil
        @myteam.valid?
        expect(@myteam.errors.full_messages).to include('User must exist')
      end

      it 'team_nameが空では登録できない' do
        @myteam.team_name = nil
        @myteam.valid?
        expect(@myteam.errors.full_messages).to include("Team name can't be blank")
      end

      it 'friend_game_idが空では登録できない' do
        @myteam.team_profile = nil
        @myteam.valid?
        expect(@myteam.errors.full_messages).to include("Team profile can't be blank")
      end
    end
  end
end
