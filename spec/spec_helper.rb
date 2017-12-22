# -*- coding: utf-8 -*-
require 'streak'
require 'rspec/its'

#monkeypatch request methods
module Streak
  @mock_rest_client = nil

  def self.mock_rest_client=(mock_client)
    @mock_rest_client = mock_client
  end

  def self.execute_request(opts)
    get_params = (opts[:headers] || {})[:params]
    post_params = opts[:payload]
    case opts[:method]
    when :get then @mock_rest_client.get opts[:url], get_params, post_params
    when :put then @mock_rest_client.put opts[:url], get_params, post_params
    when :post then @mock_rest_client.post opts[:url], get_params, post_params
    when :delete then @mock_rest_client.delete opts[:url], get_params, post_params
    end
  end
end

def test_response(body, code=200)
  body = MultiJson.dump(body)
  double('Response', :body => body, :code => code)
end

def test_box(params={})
  {
    "pipelineKey" => "agptYWlsZm9vZ2FlcioLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIIV29ya2Zsb3cYPww",
    "creatorKey" => "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEVXNlchgBDA",
    "creationTimestamp" => 1348260320367,
    "lastUpdatedTimestamp" => 1348342557726,
    "name" => "MySampleBox",
    "stageKey" => "5002",
    "fields" => {
      "1003" => 1347451200000
    },
    "followerKeys" => [
      "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEVXNlchgBDA"
    ],
    "followerCount" => 1,
    "commentCount" => 0,
    "reminderCount" => 0,
    "gmailThreadCount" => 1,
    "fileCount" => 0,
    "boxKey" => "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEQ2FzZRhaDA",
    "key" => "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEQ2FzZRhaDA"
  }.merge(params)
end

def test_field(params={})
  {
    "name" => "Assigned To",
    "key" => "1001",
    "type"=> "PERSON"
  }.merge(params)
end

def test_field_value(params={})
  {
    "key" => "1002",
    "value" => "Some string"
  }.merge(params)
end

def test_pipeline(params={})
  {
    "creatorKey" => "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEVXNlchgBDA",
    "name" => "Hiring",
    "description" => "Use this pipeline to manage hiring potential candidates in your organization. Create a box for each candidate.",
    "orgWide" => false,
    "fields" => [
      {
        "name" => "Assigned To",
        "key" => "1001",
        "type" => "PERSON"
      },
      {
        "name" => "Position",
        "key" => "1002",
        "type" => "TEXT_INPUT"
      },
      {
        "name" => "Start Date",
        "key" => "1003",
        "type" => "DATE"
      }
    ],
    "stages" => {
      "5002" => {
        "name" => "Phone Screen",
        "key" => "5002"
      },
      "5001" => {
        "name" => "Resume",
        "key" => "5001"
      },
      "5004" => {
        "name" => "Internal Decision",
        "key" => "5004"
      },
      "5003" => {
        "name" => "Interview",
        "key" => "5003"
      },
      "5007" => {
        "name" => "Passed",
        "key" => "5007"
      },
      "5005" => {
        "name" => "Offer Negotiation",
        "key" => "5005"
      },
      "5006" => {
        "name" => "Hired",
        "key" => "5006"
      }
    },
    "stageOrder" => [
      "5001",
      "5002",
      "5003",
      "5004",
      "5005",
      "5006",
      "5007"
    ],
    "creationTimestamp" => 1347993556572,
    "lastUpdatedTimestamp" => 1348342589349,
    "aclEntries" => [
      {
        "email" => "aleem@streak.com",
        "isOwner" => false
      }
    ],
    "owner" => {
      "email" => "tesla@streak.com",
      "isOwner" => true
    },
    "pipelineKey" => "agptYWlsZm9vZ2FlcioLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIIV29ya2Zsb3cYMww",
    "key" => "agptYWlsZm9vZ2FlcioLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIIV29ya2Zsb3cYMww"
  }.merge(params)
end

def test_stage(params={})
  {
    "name" => "Interview",
    "key" => "5003"
  }
end

def test_user(params={})
  {
    "email" => "tesla@streak.com",
    "lowercaseEmail" => "tesla@streak.com",
    "creationTimestamp" => 1347660765134,
    "lastUpdatedTimestamp" => 1348463195997,
    "lastSeenTimestamp" => 1348470000000,
    "isOauthComplete" => true,
    "userKey" => "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEVXNlchgBDA",
    "displayName" => "tesla@streak.com",
    "key" => "agptYWlsZm9vZ2FlciYLEgxPcmdhbml6YXRpb24iCnN0cmVhay5jb20MCxIEVXNlchgBDA"
  }.merge(params)
end
