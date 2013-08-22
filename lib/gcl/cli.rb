require File.expand_path("../options", __FILE__)
require File.expand_path("../crails", __FILE__)

module Gcl
	class Cli
		def self.start
			opts = Gcl::Options.new.parse! ARGV
			abort "type must be rails!"	unless opts[:type] == "rails"
			crails = Gcl::Crails.new(opts)
			statistics = crails.statistics
			puts "own code: #{statistics[0]}  gem code: #{statistics[1]} ratio: #{statistics[2]}"
		end
	end
end
