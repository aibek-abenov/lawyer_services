class Avo::Resources::Agreement < Avo::BaseResource
  self.title = :number
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :number, as: :text
    field :client_identification_no, as: :text
    field :organization, as: :belongs_to
    field :documents, as: :files, is_image: false, link_to_resource: true
  end
end
