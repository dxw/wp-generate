class WpGenerate::Generator::Template < WpGenerate::Generator
  def initialize args, options
    @options = options
    name = args.shift
    raise ArgumentError, "Provide template name plox" if name.nil? or name.empty?

    @templates = {"template.php" => "#{name}.php", "helper.php" => "helpers/#{name}_helper.php", "style.sass" => "style/#{name}.sass"}
    @vars = {"name" => name}
  end
end
