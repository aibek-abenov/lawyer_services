  class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :email, as: :gravatar
    field :name, as: :text
    field :email, as: :text
    field :role, as: :belongs_to
    field :password, as: :text
  end
end
