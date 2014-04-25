require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :nom => "Example User", :email => "user@example.com" }
  end

  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr)
  end

  it "devrait exiger un nom"
end
