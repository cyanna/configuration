#!/usr/bin/env ruby

gem 'aws-idempotency', '>=0.0.1'
require 'aws-idempotency'

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'config'

require 'pp'


begin

  ElasticSearch.ensure(elasticsearch_domain)

  endpoint = ElasticSearch.ensure_endpoint_available(elasticsearch_domain)

  puts endpoint

  puts "Ok"
rescue Aws::AutoScaling::Errors::ServiceError,
  Aws::CloudWatch::Errors::ServiceError,
  Aws::EC2::Errors::ServiceError,
  Aws::ElasticLoadBalancing::Errors::ServiceError,
  Aws::IAM::Errors::ServiceError,
  Aws::ElasticsearchService::Errors::ServiceError => e
    puts "#{e.class}: #{e}"
    abort 'FAILED'
end
