class Document
  include Elasticsearch::Persistence::Model
  include AliasedIndex

  settings ElasticSettings::COMMON do
    mappings ElasticMappings::COMMON do
      indexes :bigram, analyzer: 'bigram_analyzer', type: 'string'
    end
  end

  attribute :document_id, String, analyzer: 'keyword'
  validates :document_id, presence: true
  attribute :title, String, mapping: { fields: {
                     title: { type: 'string' },
                     normalized: { type: 'string', analyzer: 'ascii_lower', copy_to: 'bigram',
                     linguistic: { type: 'string', analyzer: 'FROM LANGUAGE FIELD'}
                     } } }
  validates :title, presence: true
  attribute :language, String, analyzer: 'keyword'
  validates :language, presence: true

  after_save { Rails.logger.info "Successfuly saved #{self.class.name.tableize}: #{self}" }

end