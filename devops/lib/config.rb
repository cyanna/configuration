def application
  'edX'
end

def environment
  'Stage'
end

def elasticsearch_domain
  [application, environment].join('-').downcase
end
