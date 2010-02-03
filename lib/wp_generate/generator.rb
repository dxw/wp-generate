class WpGenerate::Generator
  def generate
    template_name = self.class.to_s.demodulize.downcase
    @templates.each_pair do |template_path,output|
      input = "#{template_name}/#{template_path}.erb"
      full_path = File.join(File.dirname(__FILE__), 'templates', input)

      dir = File.dirname(output)
      FileUtils.makedirs dir unless File.directory? dir

      puts "#{input} => #{output}"
      open(output, 'w+') do |f|
        f.write ERB.new(open(full_path).read).result
      end
    end
  end
end
