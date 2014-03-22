require 'spec_helper'

describe Address do
  let(:gen){ create :gen }
  describe 'Associations' do
    it{ should belong_to :has_address }
  end
end
