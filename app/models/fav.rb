class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :show
  enum status: [:favorite, :unfavorite]
end
