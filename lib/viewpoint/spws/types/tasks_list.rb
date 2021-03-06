=begin
  This file is part of ViewpointSPWS; the Ruby library for Microsoft Sharepoint Web Services.

  Copyright © 2011 Dan Wanek <dan.wanek@gmail.com>

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
=end

# This class represents a Sharepoint List returned from the Lists Web Service with a
# ServerTemplate id of 107 (Tasks).
# @see http://msdn.microsoft.com/en-us/library/ms774810(v=office.12).aspx
class Viewpoint::SPWS::Types::TasksList < Viewpoint::SPWS::Types::List
  include Viewpoint::SPWS::Types

  # Add a Task to this List
  # @param [Hash] opts parameters for this Task
  # @option opts [String] :title The title of this Task
  # @option opts [DateTime] :due_date The date in which this Task is due
  # @option opts [Symbol] :priority The priority of the Task
  #   :high, :normal, :low
  # @option opts [Symbol] :status The status of the Task
  #   :not_started, :in_progress, :completed, :deferred, :waiting
  # @option opts [Fixnum] :percent_complete The percentage of completion.
  #   Must be a number from 0 to 100.
  # @return [Viewpoint::SPWS::Types::ListItem] The newly added Task
  def add_item!(opts)
    raise "Title argument required" unless opts[:title]
    topts = opts.clone
    topts[:priority] = :normal unless topts[:priority]
    topts[:status]   = :not_started unless topts[:status]
    if(topts[:percent_complete] && !(0..100).include?(topts[:percent_complete]))
      raise "Invalid :percent_complete #{topts[:percent_complete]}"
    end

    super(topts)
  end

end
