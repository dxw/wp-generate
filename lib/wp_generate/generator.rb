class WpGenerate::Generator
  def initialize *args
    raise NotImplementedError, "This class doesn't do anything on its own, subclass it!"
  end

  def generate
    opt_parse

    template_name = self.class.to_s.demodulize.downcase
    @templates.each_pair do |template_path,output|
      output = "#{cwd}/#{output}"
      input = "#{template_name}/#{template_path}"
      full_path = File.join(File.dirname(__FILE__), 'templates', input)
      erb = false
      if not File.exist? full_path
        full_path = "#{full_path}.erb"
        erb = true
      end

      raise IOError, "Will not overwrite existing files without global -f option" if File.exist? output and not @options[:force]

      dir = File.dirname(output)
      FileUtils.makedirs dir unless File.directory? dir

      STDERR.puts "#{input} => #{output}" unless @options[:quiet]
      name = @vars[:name]
      open(output, 'w+') do |f|
        if erb
          f.write ERB.new(open(full_path).read).result(binding)
        else
          f.write open(full_path).read
        end
      end
    end
  end

  def opt_parse
    if @options.is_a? Array
      opt = {}
      @options.each do |o|
        case o
        when '-f'
          opt[:force] = true
        when '-q'
          opt[:quiet] = true
        end
      end
      @options = opt
    end
  end

  def cwd
    ENV['WPGEN_WORK_DIR'] || Dir.pwd
  end
end
