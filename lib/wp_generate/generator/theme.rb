class WpGenerate::Generator::Theme < WpGenerate::Generator
  def initialize args, options
    @options = options
    name = args.shift
    if name.nil? or name.empty?
      STDERR.puts 'Usage: wp-generate theme [path]'
      STDERR.puts 'Example: cd wp-content/themes && wp-generate theme mytheme'
      exit 1
    end

    templates = %w[
      index.php
      style.css
      helpers/helper.php
      partials/header.php
      partials/footer.php
      sass/sass_output.php
    ]
    @templates = {}
    templates.each do |t|
      @templates[t] = "#{name}/#{t}"
    end
    @vars = {:name => name}
  end
end
