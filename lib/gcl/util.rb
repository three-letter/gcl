require File.expand_path("../options", __FILE__)

module Gcl

	module Util
		def code_line(file, regex)
			`find #{file} -name "#{regex}" | xargs cat | wc -l`.to_i
		end

		def gem_root
			rails_path = `bundle show rails`
			rails_path.strip!
			rails_path[0, rails_path.rindex("/")]
		end

		def list_gems
			abort "not found file \"Gemfile.local\"" unless File.exist?("./Gemfile.lock")
			gemfile = File.read("./Gemfile.lock")
			gemfile.scan(/\n\s{4}\w+\s\((.+)\)/).inject([]) do |gems, e|
				gems << "#{gemfile}/#{e[0]}-#{e[1]}"
			end
		end

	end
end
