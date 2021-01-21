class ScoutTagRelation < ApplicationRecord
  belongs_to :scout
  belongs_to :scout_tag
end
