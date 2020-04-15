# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: protocol/cloudstate/entity.proto

require 'google/protobuf'

require 'google/protobuf/any_pb'
require 'google/protobuf/empty_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("protocol/cloudstate/entity.proto", :syntax => :proto3) do
    add_message "cloudstate.Reply" do
      optional :payload, :message, 1, "google.protobuf.Any"
    end
    add_message "cloudstate.Forward" do
      optional :service_name, :string, 1
      optional :command_name, :string, 2
      optional :payload, :message, 3, "google.protobuf.Any"
    end
    add_message "cloudstate.ClientAction" do
      oneof :action do
        optional :reply, :message, 1, "cloudstate.Reply"
        optional :forward, :message, 2, "cloudstate.Forward"
        optional :failure, :message, 3, "cloudstate.Failure"
      end
    end
    add_message "cloudstate.SideEffect" do
      optional :service_name, :string, 1
      optional :command_name, :string, 2
      optional :payload, :message, 3, "google.protobuf.Any"
      optional :synchronous, :bool, 4
    end
    add_message "cloudstate.Command" do
      optional :entity_id, :string, 1
      optional :id, :int64, 2
      optional :name, :string, 3
      optional :payload, :message, 4, "google.protobuf.Any"
      optional :streamed, :bool, 5
    end
    add_message "cloudstate.StreamCancelled" do
      optional :entity_id, :string, 1
      optional :id, :int64, 2
    end
    add_message "cloudstate.Failure" do
      optional :command_id, :int64, 1
      optional :description, :string, 2
    end
    add_message "cloudstate.EntitySpec" do
      optional :proto, :bytes, 1
      repeated :entities, :message, 2, "cloudstate.Entity"
      optional :service_info, :message, 3, "cloudstate.ServiceInfo"
    end
    add_message "cloudstate.ServiceInfo" do
      optional :service_name, :string, 1
      optional :service_version, :string, 2
      optional :service_runtime, :string, 3
      optional :support_library_name, :string, 4
      optional :support_library_version, :string, 5
    end
    add_message "cloudstate.Entity" do
      optional :entity_type, :string, 1
      optional :service_name, :string, 2
      optional :persistence_id, :string, 3
    end
    add_message "cloudstate.UserFunctionError" do
      optional :message, :string, 1
    end
    add_message "cloudstate.ProxyInfo" do
      optional :protocol_major_version, :int32, 1
      optional :protocol_minor_version, :int32, 2
      optional :proxy_name, :string, 3
      optional :proxy_version, :string, 4
      repeated :supported_entity_types, :string, 5
    end
  end
end

module Cloudstate
  Reply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.Reply").msgclass
  Forward = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.Forward").msgclass
  ClientAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.ClientAction").msgclass
  SideEffect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.SideEffect").msgclass
  Command = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.Command").msgclass
  StreamCancelled = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.StreamCancelled").msgclass
  Failure = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.Failure").msgclass
  EntitySpec = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.EntitySpec").msgclass
  ServiceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.ServiceInfo").msgclass
  Entity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.Entity").msgclass
  UserFunctionError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.UserFunctionError").msgclass
  ProxyInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.ProxyInfo").msgclass
end
