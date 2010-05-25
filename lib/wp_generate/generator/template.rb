class WpGenerate::Generator::Template < WpGenerate::Generator
  def initialize args, options
    @options = options
    name = args.shift
    if name.nil? or name.empty?
      STDERR.puts 'Usage: wp-generate template [name]'
      STDERR.puts 'Example: cd wp-content/themes/mytheme && wp-generate template home'
      exit 1
    end

    @templates = {"template.php" => "#{name}.php", "helper.php" => "helpers/#{name}.php", "style.sass" => "sass/#{name}.sass"}
    @vars = {:name => name}
  end
end
