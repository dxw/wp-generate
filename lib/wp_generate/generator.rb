class WpGenerate::Generator
  def generate
    template_name = self.class.to_s.demodulize.downcase
    @templates.each_pair do |template_path,output|
      input = "#{template_name}/#{template_path}.erb"
      puts "#{input} => #{output}"
      full_path = File.join(File.dirname(__FILE__), 'templates', input)

      puts ERB.new(open(full_path).read).result
      
      puts '----------'
    end
  end
end
