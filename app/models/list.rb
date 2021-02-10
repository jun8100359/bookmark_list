class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks

  validates :list_name, presence: true

end
