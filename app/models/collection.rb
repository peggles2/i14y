class Collection
  include Elasticsearch::Persistence::Model
  include AliasedIndex

  attribute :token, String
  validates :token, presence: true

  after_save { Rails.logger.info "Successfuly saved #{self.class.name.tableize}: #{self}" }

end