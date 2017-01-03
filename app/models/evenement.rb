class Evenement < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  validates :latitude, :presence   =>true
  validates :longitude, :presence  =>true
  validates :datee,     :presence      =>true

  # Note that if you used attr_accessible, and all other fields cannot be assigned through User.new(params[:user[), while if you used attr_protected, only those fields cannot assigned.
  def self.search(search)
    where("address ILIKE ?", "%#{search}%")
    where("ville ILIKE ?", "%#{search}%")
    where("datee ILIKE ?", "%#{search}%")

  end


end
