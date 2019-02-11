#!/usr/bin/env ruby
# encoding: UTF-8

%w(lib ext test).each do |dir|
  $LOAD_PATH.unshift File.expand_path("../../#{dir}", __FILE__)
end
require 'rails'
require 'oj'

Oj.mimic_JSON

nil.to_json
