class WpGenerate::Generator::Theme < WpGenerate::Generator
  def initialize args, options
    @options = options
    name = args.shift
    raise ArgumentError, "Provide theme name plox" if name.nil? or name.empty?

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
