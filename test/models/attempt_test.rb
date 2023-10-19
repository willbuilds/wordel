# == Schema Information
#
# Table name: attempts
#
#  id         :integer          not null, primary key
#  answer     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  wordle_id  :integer          not null
#
# Indexes
#
#  index_attempts_on_wordle_id  (wordle_id)
#
# Foreign Keys
#
#  wordle_id  (wordle_id => wordles.id)
#
require "test_helper"

class AttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
