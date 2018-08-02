class LeaderboardSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :score
end
