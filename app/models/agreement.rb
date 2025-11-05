class Agreement < ApplicationRecord
  belongs_to :organization
  has_many_attached :documents, dependent: :delete_all
end

# == Schema Information
#
# Table name: agreements
#
#  id                       :integer          not null, primary key
#  number                   :string
#  client_identification_no :string
#  organization_id          :integer          not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_agreements_on_organization_id  (organization_id)
#
