module Partial

  def partial(template, options={}, &block)
    if Dir.exists? File.join(config[:source], config[:partials_dir], File.dirname(template))
      template = File.join(config[:partials_dir], template)
    end
    super(template, options, &block)
  end

end
