class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex, :current_shelter
end
