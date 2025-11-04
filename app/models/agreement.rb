class Agreement < ApplicationRecord
  belongs_to :organization
  has_many_attached :documents
end
