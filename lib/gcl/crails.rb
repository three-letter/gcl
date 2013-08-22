require File.expand_path("../util", __FILE__)

module Gcl
	class Crails 
		include Gcl::Util	

		def initialize(options)
			@options = options
		end

		def statistics
			own = self_code
			gem = gem_code
			lv = (gem / (owm + gem).to_f).round(4)
			[own, gem, "#{lv * 100}/100"]	
		end

		def self_code
			["*.rb", "*.erb", "*.js", "*.css"].inject(0) do |lines, regex|
				@options[:regex] = regex
				lines += code_line(@options[:file], regex)
			end
		end

		def gem_code
			list_gems.inject(0) do |lines, gem_path|
				lines += code_line(gem_path, "*.rb") 
			end
		end
	end
end
