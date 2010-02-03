class WpGenerate::Generator::Template < WpGenerate::Generator
  def initialize args
    name = args.shift
    raise ArgumentError, "Provide template name plox" if name.nil? or name.empty?
    @templates = {"template.php" => "#{name}.php", "style.sass" => "style/#{name}.sass", "helper.php" => "#{name}_helper.php"}
    @vars = {"name" => name}
  end
end
