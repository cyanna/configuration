#!/usr/bin/env ruby

require 'aws-idempotency', '>= 0.0.1'

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'config'

require 'pp'


begin

  es = ElasticSearch.ensure(elasticsearch_domain)


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
