class WpGenerate::Generator
  def generate
    template_name = self.class.to_s.demodulize.downcase
    @templates.each_pair do |template_path,output|
      puts "#{template_name}/#{template_path} => #{output}"
    end
  end
end
