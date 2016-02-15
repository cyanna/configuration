def application
  'EDx'
end

def environment
  'Stage'
end

def elasticsearch_domain
  [application, environment].join('-').downcase
end
