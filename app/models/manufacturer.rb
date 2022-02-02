class Manufacturer < ApplicationRecord
  has_many :widgets
# START:edit:3
  belongs_to :address
# END:edit:3
end
