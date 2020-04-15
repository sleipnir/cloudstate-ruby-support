# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: protocol/cloudstate/crdt.proto for package 'cloudstate.crdt'
# Original file comments:
# Copyright 2019 Lightbend Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# gRPC interface for Event Sourced Entity user functions.
#

require 'grpc'
require 'protocol/cloudstate/crdt_pb'

module Cloudstate
  module Crdt
    module Crdt
      # CRDT Protocol
      #
      # Note that while this protocol provides support for CRDTs, the data types sent across the protocol are not CRDTs
      # themselves. It is the responsibility of the CloudState proxy to implement the CRDTs, merge functions, vector clocks
      # etc, not the user function. The user function need only hold the current value in memory, and this protocol sends
      # deltas to the user function to update its in memory value as necessary. These deltas have no way of dealing with
      # conflicts, hence it important that the CloudState proxy always know what the state of the user functions in memory
      # value is before sending a delta. If the CloudState proxy is not sure what the value is, eg because it has just sent
      # an operation to the user function may have updated its value as a result, the proxy should wait until it gets the
      # result of the operation back, to ensure its in memory value is in sync with the user function so that it can
      # calculate deltas that won't conflict.
      #
      # The user function is expected to update its value both as the result of receiving deltas from the proxy, as well as
      # when it sends deltas. It must not update its value in any other circumstance, updating the value in response to any
      # other stimuli risks the value becoming out of sync with the CloudState proxy. The user function will not be sent
      # back deltas as a result of its own changes.
      #
      # An invocation of handle is made for each entity being handled. It may be kept alive and used to handle multiple
      # commands, and may subsequently be terminated if that entity becomes idle, or if the entity is deleted. Shutdown is
      # typically done for efficiency reasons, unless the entity is explicitly deleted, a terminated handle stream does not
      # mean the proxy has stopped tracking the state of the entity in its memory.
      #
      # Special care must be taken when working with maps and sets. The keys/values are google.protobuf.Any, which encodes
      # the value as binary protobuf, however, serialized protobufs are not stable, two semantically equal objects could
      # encode to different bytes. It is the responsibility of the user function to ensure that stable encodings are used.
      class Service

        include GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'cloudstate.crdt.Crdt'

        # After invoking handle, the first message sent will always be a CrdtInit message, containing the entity ID, and,
        # if it exists or is available, the current state of the entity. After that, one or more commands may be sent,
        # as well as deltas as they arrive, and the entire state if either the entity is created, or the proxy wishes the
        # user function to replace its entire state.
        #
        # The user function must respond with one reply per command in. They do not necessarily have to be sent in the same
        # order that the commands were sent, the command ID is used to correlate commands to replies.
        rpc :handle, stream(CrdtStreamIn), stream(CrdtStreamOut)
      end

      Stub = Service.rpc_stub_class
    end
  end
end
