class TeamTagRelation < ApplicationRecord
  belongs_to :team
  belongs_to :team_tag
end
