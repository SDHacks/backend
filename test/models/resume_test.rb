# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  hacker_id  :integer
#  resume     :binary(16777215)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
