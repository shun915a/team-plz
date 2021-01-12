require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#create' do
    before do
      @team = FactoryBot.create(:team)
    end

    context '投稿成功' do
      it 'team_title, team_game_id, firend_textがあれば登録できる' do
        expect(@team).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'user_idが空では登録できない' do
        @team.user_id = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('User must exist')
      end

      it 'myteam_idが空では登録できない' do
        @team.myteam_id = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('Myteam must exist')
      end

      it 'team_titleが空では登録できない' do
        @team.team_title = nil
        @team.valid?
        expect(@team.errors.full_messages).to include("Team title can't be blank")
      end

      it 'team_game_idが空では登録できない' do
        @team.team_game_id = nil
        @team.valid?
        expect(@team.errors.full_messages).to include("Team game can't be blank")
      end

      it 'team_textが空では登録できない' do
        @team.team_text = nil
        @team.valid?
        expect(@team.errors.full_messages).to include("Team text can't be blank")
      end
    end
  end
end
