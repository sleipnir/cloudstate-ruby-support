# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: protocol/cloudstate/function.proto

require 'google/protobuf'

require 'google/protobuf/any_pb'
require 'protocol/cloudstate/entity_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("protocol/cloudstate/function.proto", :syntax => :proto3) do
    add_message "cloudstate.function.FunctionCommand" do
      optional :service_name, :string, 2
      optional :name, :string, 3
      optional :payload, :message, 4, "google.protobuf.Any"
    end
    add_message "cloudstate.function.FunctionReply" do
      repeated :side_effects, :message, 4, "cloudstate.SideEffect"
      oneof :response do
        optional :failure, :message, 1, "cloudstate.Failure"
        optional :reply, :message, 2, "cloudstate.Reply"
        optional :forward, :message, 3, "cloudstate.Forward"
      end
    end
  end
end

module Cloudstate
  module Function
    FunctionCommand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.function.FunctionCommand").msgclass
    FunctionReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.function.FunctionReply").msgclass
  end
end
