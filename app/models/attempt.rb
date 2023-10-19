class Attempt < ApplicationRecord
  belongs_to :wordle
  delegate :solution, to: :wordle, prefix: true
  validates :answer, presence: true, length: 5..5

  before_validation do
    self.answer = [first_letter, second_letter, third_letter, fourth_letter, fifth_letter].join
  end

  def first_letter
    answer[0]
  end

  def second_letter
    answer[1]
  end

  def third_letter
    answer[2]
  end

  def fourth_letter
    answer[3]
  end

  def fifth_letter
    answer[4]
  end

  def correct?
    answer == wordle_solution
  end

  def correct_letters
    # check if each letter is in the solution
    # if it is, return the letter, and reduce the solution by that letter
    # if it isn't, return nil
    temp_solution = wordle_solution.dup
    answer.chars.map do |letter|
      if temp_solution.include?(letter)
        temp_solution.sub!(letter, "")
        letter
      else
        nil
      end
    end.compact
  end

  def correct_positions
    answer.chars.zip(wordle_solution.chars).map do |attempt_letter, solution_letter|
      attempt_letter == solution_letter ? attempt_letter : nil
    end
  end
end

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
