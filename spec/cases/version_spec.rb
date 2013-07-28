require 'spec_helper'

describe NRB::HTTPService do

  it 'responds to version' do
    NRB::HTTPService.should respond_to :version
  end


  it 'gives a version string' do
    NRB::HTTPService.version.should be_a String
  end

end
