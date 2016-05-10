require 'rails_helper'

RSpec.describe Idea, type: :model do
  it do
    should validate_inclusion_of(:quality).
    in_array(%w(genius plausible swill))
  end
end
