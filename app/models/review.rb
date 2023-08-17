class Review < ApplicationRecord
  belongs_to :list
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
