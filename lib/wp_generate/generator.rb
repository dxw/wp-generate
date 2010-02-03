class WpGenerate::Generator
  def generate
    opt_parse

    template_name = self.class.to_s.demodulize.downcase
    @templates.each_pair do |template_path,output|
      input = "#{template_name}/#{template_path}.erb"
      full_path = File.join(File.dirname(__FILE__), 'templates', input)

      raise IOError, "Will not overwrite existing files without global -f option" if File.exist? output and not @options[:force]

      dir = File.dirname(output)
      FileUtils.makedirs dir unless File.directory? dir

      puts "#{input} => #{output}"
      open(output, 'w+') do |f|
        f.write ERB.new(open(full_path).read).result
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
        end
      end
      @options = opt
    end
  end
end
