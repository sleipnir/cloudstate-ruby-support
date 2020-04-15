# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: protocol/cloudstate/crdt.proto

require 'google/protobuf'

require 'google/protobuf/any_pb'
require 'protocol/cloudstate/entity_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("protocol/cloudstate/crdt.proto", :syntax => :proto3) do
    add_message "cloudstate.crdt.CrdtStreamIn" do
      oneof :message do
        optional :init, :message, 1, "cloudstate.crdt.CrdtInit"
        optional :state, :message, 2, "cloudstate.crdt.CrdtState"
        optional :changed, :message, 3, "cloudstate.crdt.CrdtDelta"
        optional :deleted, :message, 4, "cloudstate.crdt.CrdtDelete"
        optional :command, :message, 5, "cloudstate.Command"
        optional :stream_cancelled, :message, 6, "cloudstate.StreamCancelled"
      end
    end
    add_message "cloudstate.crdt.CrdtStreamOut" do
      oneof :message do
        optional :reply, :message, 1, "cloudstate.crdt.CrdtReply"
        optional :streamed_message, :message, 2, "cloudstate.crdt.CrdtStreamedMessage"
        optional :stream_cancelled_response, :message, 3, "cloudstate.crdt.CrdtStreamCancelledResponse"
        optional :failure, :message, 4, "cloudstate.Failure"
      end
    end
    add_message "cloudstate.crdt.CrdtState" do
      oneof :state do
        optional :gcounter, :message, 1, "cloudstate.crdt.GCounterState"
        optional :pncounter, :message, 2, "cloudstate.crdt.PNCounterState"
        optional :gset, :message, 3, "cloudstate.crdt.GSetState"
        optional :orset, :message, 4, "cloudstate.crdt.ORSetState"
        optional :lwwregister, :message, 5, "cloudstate.crdt.LWWRegisterState"
        optional :flag, :message, 6, "cloudstate.crdt.FlagState"
        optional :ormap, :message, 7, "cloudstate.crdt.ORMapState"
        optional :vote, :message, 8, "cloudstate.crdt.VoteState"
      end
    end
    add_message "cloudstate.crdt.GCounterState" do
      optional :value, :uint64, 1
    end
    add_message "cloudstate.crdt.PNCounterState" do
      optional :value, :int64, 1
    end
    add_message "cloudstate.crdt.GSetState" do
      repeated :items, :message, 1, "google.protobuf.Any"
    end
    add_message "cloudstate.crdt.ORSetState" do
      repeated :items, :message, 1, "google.protobuf.Any"
    end
    add_message "cloudstate.crdt.LWWRegisterState" do
      optional :value, :message, 1, "google.protobuf.Any"
      optional :clock, :enum, 2, "cloudstate.crdt.CrdtClock"
      optional :custom_clock_value, :int64, 3
    end
    add_message "cloudstate.crdt.FlagState" do
      optional :value, :bool, 1
    end
    add_message "cloudstate.crdt.ORMapState" do
      repeated :entries, :message, 1, "cloudstate.crdt.ORMapEntry"
    end
    add_message "cloudstate.crdt.ORMapEntry" do
      optional :key, :message, 1, "google.protobuf.Any"
      optional :value, :message, 2, "cloudstate.crdt.CrdtState"
    end
    add_message "cloudstate.crdt.VoteState" do
      optional :votes_for, :uint32, 1
      optional :total_voters, :uint32, 2
      optional :self_vote, :bool, 3
    end
    add_message "cloudstate.crdt.CrdtDelta" do
      oneof :delta do
        optional :gcounter, :message, 1, "cloudstate.crdt.GCounterDelta"
        optional :pncounter, :message, 2, "cloudstate.crdt.PNCounterDelta"
        optional :gset, :message, 3, "cloudstate.crdt.GSetDelta"
        optional :orset, :message, 4, "cloudstate.crdt.ORSetDelta"
        optional :lwwregister, :message, 5, "cloudstate.crdt.LWWRegisterDelta"
        optional :flag, :message, 6, "cloudstate.crdt.FlagDelta"
        optional :ormap, :message, 7, "cloudstate.crdt.ORMapDelta"
        optional :vote, :message, 8, "cloudstate.crdt.VoteDelta"
      end
    end
    add_message "cloudstate.crdt.GCounterDelta" do
      optional :increment, :uint64, 1
    end
    add_message "cloudstate.crdt.PNCounterDelta" do
      optional :change, :sint64, 1
    end
    add_message "cloudstate.crdt.GSetDelta" do
      repeated :added, :message, 1, "google.protobuf.Any"
    end
    add_message "cloudstate.crdt.ORSetDelta" do
      optional :cleared, :bool, 1
      repeated :removed, :message, 2, "google.protobuf.Any"
      repeated :added, :message, 3, "google.protobuf.Any"
    end
    add_message "cloudstate.crdt.LWWRegisterDelta" do
      optional :value, :message, 1, "google.protobuf.Any"
      optional :clock, :enum, 2, "cloudstate.crdt.CrdtClock"
      optional :custom_clock_value, :int64, 3
    end
    add_message "cloudstate.crdt.FlagDelta" do
      optional :value, :bool, 1
    end
    add_message "cloudstate.crdt.ORMapDelta" do
      optional :cleared, :bool, 1
      repeated :removed, :message, 2, "google.protobuf.Any"
      repeated :updated, :message, 3, "cloudstate.crdt.ORMapEntryDelta"
      repeated :added, :message, 4, "cloudstate.crdt.ORMapEntry"
    end
    add_message "cloudstate.crdt.ORMapEntryDelta" do
      optional :key, :message, 1, "google.protobuf.Any"
      optional :delta, :message, 2, "cloudstate.crdt.CrdtDelta"
    end
    add_message "cloudstate.crdt.VoteDelta" do
      optional :self_vote, :bool, 1
      optional :votes_for, :int32, 2
      optional :total_voters, :int32, 3
    end
    add_message "cloudstate.crdt.CrdtInit" do
      optional :service_name, :string, 1
      optional :entity_id, :string, 2
      optional :state, :message, 3, "cloudstate.crdt.CrdtState"
    end
    add_message "cloudstate.crdt.CrdtDelete" do
    end
    add_message "cloudstate.crdt.CrdtReply" do
      optional :command_id, :int64, 1
      optional :client_action, :message, 2, "cloudstate.ClientAction"
      repeated :side_effects, :message, 4, "cloudstate.SideEffect"
      optional :state_action, :message, 5, "cloudstate.crdt.CrdtStateAction"
      optional :streamed, :bool, 6
    end
    add_message "cloudstate.crdt.CrdtStateAction" do
      optional :write_consistency, :enum, 8, "cloudstate.crdt.CrdtWriteConsistency"
      oneof :action do
        optional :create, :message, 5, "cloudstate.crdt.CrdtState"
        optional :update, :message, 6, "cloudstate.crdt.CrdtDelta"
        optional :delete, :message, 7, "cloudstate.crdt.CrdtDelete"
      end
    end
    add_message "cloudstate.crdt.CrdtStreamedMessage" do
      optional :command_id, :int64, 1
      optional :client_action, :message, 2, "cloudstate.ClientAction"
      repeated :side_effects, :message, 3, "cloudstate.SideEffect"
      optional :end_stream, :bool, 4
    end
    add_message "cloudstate.crdt.CrdtStreamCancelledResponse" do
      optional :command_id, :int64, 1
      repeated :side_effects, :message, 2, "cloudstate.SideEffect"
      optional :state_action, :message, 3, "cloudstate.crdt.CrdtStateAction"
    end
    add_enum "cloudstate.crdt.CrdtWriteConsistency" do
      value :LOCAL, 0
      value :MAJORITY, 1
      value :ALL, 2
    end
    add_enum "cloudstate.crdt.CrdtClock" do
      value :DEFAULT, 0
      value :REVERSE, 1
      value :CUSTOM, 2
      value :CUSTOM_AUTO_INCREMENT, 3
    end
  end
end

module Cloudstate
  module Crdt
    CrdtStreamIn = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtStreamIn").msgclass
    CrdtStreamOut = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtStreamOut").msgclass
    CrdtState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtState").msgclass
    GCounterState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.GCounterState").msgclass
    PNCounterState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.PNCounterState").msgclass
    GSetState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.GSetState").msgclass
    ORSetState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.ORSetState").msgclass
    LWWRegisterState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.LWWRegisterState").msgclass
    FlagState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.FlagState").msgclass
    ORMapState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.ORMapState").msgclass
    ORMapEntry = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.ORMapEntry").msgclass
    VoteState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.VoteState").msgclass
    CrdtDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtDelta").msgclass
    GCounterDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.GCounterDelta").msgclass
    PNCounterDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.PNCounterDelta").msgclass
    GSetDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.GSetDelta").msgclass
    ORSetDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.ORSetDelta").msgclass
    LWWRegisterDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.LWWRegisterDelta").msgclass
    FlagDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.FlagDelta").msgclass
    ORMapDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.ORMapDelta").msgclass
    ORMapEntryDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.ORMapEntryDelta").msgclass
    VoteDelta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.VoteDelta").msgclass
    CrdtInit = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtInit").msgclass
    CrdtDelete = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtDelete").msgclass
    CrdtReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtReply").msgclass
    CrdtStateAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtStateAction").msgclass
    CrdtStreamedMessage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtStreamedMessage").msgclass
    CrdtStreamCancelledResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtStreamCancelledResponse").msgclass
    CrdtWriteConsistency = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtWriteConsistency").enummodule
    CrdtClock = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cloudstate.crdt.CrdtClock").enummodule
  end
end