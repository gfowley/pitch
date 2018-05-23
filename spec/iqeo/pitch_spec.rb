require "iqeo/pitch"

RSpec.describe Iqeo::Pitch do

  it "has a version number" do
    expect(Iqeo::Pitch::VERSION).to_not be nil
  end

  it "has a Detector class" do
    expect{ Iqeo::Pitch::Detector }.to_not raise_error
  end

  it "has a Note class" do
    expect{ Iqeo::Pitch::Note }.to_not raise_error
  end

end
