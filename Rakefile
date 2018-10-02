require 'bundler'
Bundler.require

require 'opal/rspec/rake_task'

# GF: setting env breaks opal-rspec: ENV["SPEC_OPTS"] = "--format doc --color"  
Opal::RSpec::RakeTask.new(:default) do |server, task|
  server.append_path "lib"
  server.append_path "node_modules"
  task.runner = :node
  # GF: override defaults of 'spec-opal'
  task.default_path = "spec"
  task.pattern = "spec/**/*_spec.rb"
end

# require 'yaml'

# namespace :samples do

#   desc "Detect pitch for a series of samples (see 'samples' dir)"
#   task :series, [:series_name] do |t,args|
#     require 'iqeo/pitch'
#     if args.series_name
#       expected_pitch = args.series_name.split('_').last.to_f
#       puts "Series: #{args.series_name} (expected pitch: #{expected_pitch})"
#       FileList["samples/#{args.series_name}/*.yaml"].sort do |a,b|
#         ( File.basename(a,'.yaml').to_i - File.basename(b,'.yaml').to_i ) <=> 0
#       end.each do |sample_filename|
#         number = File.basename(sample_filename,'.yaml')
#         pitch = Iqeo::Pitch::Detector.detect(YAML.load_file sample_filename)
#         puts "sample: #{number.to_s.ljust(5)} pitch: #{pitch.to_s.ljust(20)} error: #{(pitch == 0.0 ? 0.0 : pitch - expected_pitch).to_s.ljust(22)}"
#       end
#     else
#       puts "Usage: rake series[series-name]"
#       puts "Series..."
#       puts FileList["samples/*/"].pathmap("%f")
#     end
#   end

#   desc 'Unpack single file series of samples into individual samples'
#   task :unpack, [:file_name] do |t,args|
#     if args.file_name
#       puts "File: #{args.file_name}"
#       dir_name = File.basename(args.file_name,'.yaml')
#       FileUtils::mkdir_p "samples/#{dir_name}" 
#       series = YAML.load_file "samples/#{args.file_name}"
#       series.each_with_index do |ser,i|
#         File.write "samples/#{dir_name}/#{i}.yaml", ser.to_yaml
#       end
#       puts "Series: #{series.count}"
#     else
#       puts "Usage: rake unpack[file-name]"
#       puts "Files..."
#       puts FileList["samples/*.yaml"].pathmap("%f")
#     end
#   end

# end
