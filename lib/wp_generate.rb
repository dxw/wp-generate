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

    if generator.nil?
      puts "Usage: wp-generate [GLOBAL OPT...] generator [PATH|OPT]"
      exit 1
    end

    generator_path = 'wp_generate/generator/'+generator
    begin
      require generator_path
    rescue LoadError
      true # This is for rcov
    end

    generator_path.camelize.constantize.new(args, options).generate
  end
end
