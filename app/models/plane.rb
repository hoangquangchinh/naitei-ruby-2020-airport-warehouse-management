class Plane < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :flights, inverse_of: :plane, dependent: :destroy
  has_many :locations, through: :requests
  enum status: {gara: "in gara", ready: "ready", flying: "flying"}

  accepts_nested_attributes_for :flights, reject_if: :reject_flights, update_only: true

  validates :code, presence: true

  def reject_flights attributes
    attributes["title"].blank?
  end

  def id_initial
    id.to_s
  end
end
