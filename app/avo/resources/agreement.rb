class Avo::Resources::Agreement < Avo::BaseResource
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
  end
end
