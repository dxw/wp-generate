class WpGenerate::Generator::Template < WpGenerate::Generator
  def initialize args, options
    @options = options
    name = args.shift
    raise ArgumentError, "Provide template name plox" if name.nil? or name.empty?

    @templates = {"template.php" => "#{name}.php", "helper.php" => "helpers/#{name}.php", "style.sass" => "sass/#{name}.sass"}
    @vars = {:name => name}
  end
end
