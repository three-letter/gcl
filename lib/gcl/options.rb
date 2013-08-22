require File.expand_path("../version", __FILE__)
require 'optparse'

module Gcl
	class Options
		def parse!(args)
			options = {}
			opt_parser = OptionParser.new do |opts|
				opts.banner = "Usage:codeline [type options] [file options] [regex optios] [log options]"

				opts.separator ""
				opts.separator "Gcl options:"

				options[:type] = "rails"
				opts.on("-t TYPE", "--type TYPE", "set the type for statistics,like: rails file.") do |value|
					options[:type] = value
				end

				options[:file] = "."
				opts.on("-f FILEPATH", "--filepath FILEPATH", "set the file path which want to statistic") do |value|
					options[:file] = value
				end

				options[:regex] = ""
				opts.on("-r REGEX", "--regex REGEX", "set the file type which want to statistic,like: *.rb *.html.") do |value|
					options[:regex] = value
				end
				
				options[:log] = false
				opts.on("-l LOG", "--log LOG", "set the log with output,like: false true.") do |value|
					options[:log] = value
				end

				opts.separator ""
				opts.separator "Common options:"

				opts.on_tail("-h", "--help", "Show this message") do
					puts opts
					exit
				end
				opts.on_tail("-v", "--version", "Show this version") do
					puts Gcl::VERSION
					exit
				end
			end

			begin
				opt_parser.parse! args
			rescue OptionParser::InvalidOption => e
				warn e.message
				abort opt_parser.to_s
			end
			options
		end

	end
end
