require 'active_support'
require 'erb'
require 'fileutils'

class WpGenerate; end
require 'wp_generate/generator'

String.send :include, ActiveSupport::CoreExtensions::String::Inflections

class WpGenerate
  def self.generate args
    options = []
    while generator = args.shift
      break unless generator.start_with? '-'
      options << generator
    end

    base_path = 'wp_generate/generator'

    if generator.nil?
      STDERR.puts 'Usage: wp-generate [GLOBAL OPT...] [generator] [PATH|OPT]'
      STDERR.puts 'Generators:'
      $:.map{|path|File.join(path,base_path,'*.rb')}.each do |path|
        Dir.glob(path).map{|generator| generator.match(%r&/([^/]+)\.rb$&)[1]}.each do |generator|
          STDERR.puts '  '+generator
        end
      end
      exit 1
    end

    generator_path = File.join(base_path,generator)
    begin
      require generator_path
    rescue LoadError
      true # This is for rcov
    end

    generator_path.camelize.constantize.new(args, options).generate
  end
end
