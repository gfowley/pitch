
RSpec.describe Iqeo::Pitch::Detector do

  RESULTS = {
    detect1: {
      silent:           0.0,
      silent_beginning: 223.406982421875,
      full:             440.0848388671875,
      imperfect:        438.739013671875
    },
    detect2: {
      silent:           0.0,
      silent_beginning: 439.96009432251043,
      full:             439.97429305912596,
      imperfect:        439.9846508058327
    },
    detect3: {
      silent:           0.0,
      silent_beginning: 440.01330350123965,
      full:             440.0012242149721,
      imperfect:        440.0116661038283
    }
  }

  context '#detect1' do

    it "detects #{RESULTS[:detect1][:silent]} for silent samples" do
      samples = YAML.load_file "samples/osc_sine_440/0.yaml"
      expect( Iqeo::Pitch::Detector.detect1 samples ).to eq RESULTS[:detect1][:silent]
    end

    it "detects #{RESULTS[:detect1][:silent_beginning]} (error: #{RESULTS[:detect1][:silent_beginning]-440}) for 440Hz samples with silent beginning" do
      samples = YAML.load_file "samples/osc_sine_440/20.yaml"
      expect( Iqeo::Pitch::Detector.detect1 samples ).to eq RESULTS[:detect1][:silent_beginning]
    end

    it "detects #{RESULTS[:detect1][:full]} (error: #{RESULTS[:detect1][:full]-440}) for full 440Hz samples" do
      samples = YAML.load_file "samples/osc_sine_440/100.yaml"
      expect( Iqeo::Pitch::Detector.detect1 samples ).to eq RESULTS[:detect1][:full]
    end

    it "detects #{RESULTS[:detect1][:imperfect]} (error: #{RESULTS[:detect1][:imperfect]-440}) for imperfect 440Hz samples " do
      samples = YAML.load_file "samples/osc_sine_440/112.yaml"
      expect( Iqeo::Pitch::Detector.detect1 samples ).to eq RESULTS[:detect1][:imperfect]
    end

  end

  context '#detect2' do

    it "detects #{RESULTS[:detect2][:silent]} for silent samples" do
      samples = YAML.load_file "samples/osc_sine_440/0.yaml"
      expect( Iqeo::Pitch::Detector.detect2 samples ).to eq RESULTS[:detect2][:silent]
    end

    it "detects #{RESULTS[:detect2][:silent_beginning]} (error: #{RESULTS[:detect2][:silent_beginning]-440}) for 440Hz samples with silent beginning" do
      samples = YAML.load_file "samples/osc_sine_440/20.yaml"
      expect( Iqeo::Pitch::Detector.detect2 samples ).to eq RESULTS[:detect2][:silent_beginning]
    end

    it "detects #{RESULTS[:detect2][:full]} (error: #{RESULTS[:detect2][:full]-440}) for full 440Hz samples" do
      samples = YAML.load_file "samples/osc_sine_440/100.yaml"
      expect( Iqeo::Pitch::Detector.detect2 samples ).to eq RESULTS[:detect2][:full]
    end

    it "detects #{RESULTS[:detect2][:imperfect]} (error: #{RESULTS[:detect2][:imperfect]-440}) for imperfect 440Hz samples " do
      samples = YAML.load_file "samples/osc_sine_440/112.yaml"
      expect( Iqeo::Pitch::Detector.detect2 samples ).to eq RESULTS[:detect2][:imperfect]
    end

  end

  context '#detect3' do

    it "detects #{RESULTS[:detect3][:silent]} for silent samples" do
      samples = YAML.load_file "samples/osc_sine_440/0.yaml"
      expect( Iqeo::Pitch::Detector.detect3 samples ).to eq RESULTS[:detect3][:silent]
    end

    it "detects #{RESULTS[:detect3][:silent_beginning]} (error: #{RESULTS[:detect3][:silent_beginning]-440}) for 440Hz samples with silent beginning" do
      samples = YAML.load_file "samples/osc_sine_440/20.yaml"
      expect( Iqeo::Pitch::Detector.detect3 samples ).to eq RESULTS[:detect3][:silent_beginning]
    end

    it "detects #{RESULTS[:detect3][:full]} (error: #{RESULTS[:detect3][:full]-440}) for full 440Hz samples" do
      samples = YAML.load_file "samples/osc_sine_440/100.yaml"
      expect( Iqeo::Pitch::Detector.detect3 samples ).to eq RESULTS[:detect3][:full]
    end

    it "detects #{RESULTS[:detect3][:imperfect]} (error: #{RESULTS[:detect3][:imperfect]-440}) for imperfect 440Hz samples " do
      samples = YAML.load_file "samples/osc_sine_440/112.yaml"
      expect( Iqeo::Pitch::Detector.detect3 samples ).to eq RESULTS[:detect3][:imperfect]
    end

  end

end
