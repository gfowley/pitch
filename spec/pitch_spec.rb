require "pitch"

RSpec.describe Pitch do

  it "has a version number" do
    expect(Pitch::VERSION).to_not be nil
  end

  it "has a Detector class" do
    expect{ Pitch::Detector }.to_not raise_error
  end

  it "has a Note class" do
    expect{ Pitch::Note }.to_not raise_error
  end

end
