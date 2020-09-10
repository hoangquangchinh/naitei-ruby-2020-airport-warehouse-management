class Flight < ApplicationRecord
  belongs_to :plane

  validates :from, presence: true
  validates :to, presence: true
  validates :title, presence: true
end
