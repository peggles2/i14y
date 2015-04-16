module ElasticMappings
  COMMON = {
    dynamic: :strict,
    _analyzer: { path: "language" },
    properties: {
      language: { type: "string", index: :not_analyzed },
      id: { type: 'string', index: :not_analyzed, include_in_all: false } }
  }.freeze

end
