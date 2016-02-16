#!/usr/bin/env ruby

require 'aws-idempotency'

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'config'

require 'pp'


begin

  ElasticSearch.ensure(elasticsearch_domain)

  endpoint = ElasticSearch.ensure_endpoint_available(elasticsearch_domain)

  puts endpoint

  puts "Ok"
rescue Aws::AutoScaling::Errors::ServiceError => e
  puts "#{e.class}: #{e}"
  abort 'FAILED'
rescue Aws::CloudWatch::Errors::ServiceError => e
  puts "#{e.class}: #{e}"
  abort 'FAILED'
rescue Aws::EC2::Errors::ServiceError => e
  puts "#{e.class}: #{e}"
  abort 'FAILED'
rescue Aws::ElasticLoadBalancing::Errors::ServiceError => e
  puts "#{e.class}: #{e}"
  abort 'FAILED'
rescue Aws::IAM::Errors::ServiceError => e
  puts "#{e.class}: #{e}"
  abort 'FAILED'
rescue Aws::ElasticsearchService::Errors::ServiceError => e
  puts "#{e.class}: #{e}"
  abort 'FAILED'
end
