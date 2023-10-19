class Wordle < ApplicationRecord
  has_many :attempts
end

# == Schema Information
#
# Table name: wordles
#
#  id         :integer          not null, primary key
#  solution   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
