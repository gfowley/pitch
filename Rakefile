require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Detect pitch for a series of samples (see 'samples' dir)"
task :series, [:series_name] do |t,args|
  require 'iqeo/pitch'
  if args.series_name
    expected_pitch = args.series_name.split('_').last.to_f
    puts "Series: #{args.series_name} (expected pitch: #{expected_pitch})"
    FileList["samples/#{args.series_name}/*.yaml"].sort do |a,b|
      ( File.basename(a,'.yaml').to_i - File.basename(b,'.yaml').to_i ) <=> 0
    end.each do |sample_filename|
      number = File.basename(sample_filename,'.yaml')
      pitch = Iqeo::Pitch::Detector.detect(YAML.load_file sample_filename)
      puts "sample: #{number.to_s.ljust(5)} pitch: #{pitch.to_s.ljust(20)} error: #{(pitch-expected_pitch).to_s.ljust(22)}"
    end
  else
    puts "Usage: rake series[series-name]"
    puts "Series..."
    puts FileList["samples/*/"].pathmap("%f")
  end
end

