module Colors

  def swatch(type,name,color)
    if type == "tone"
      color_block = "<div class='color-block bg-#{name}'></div>"
      variables   = "$#{name}-#{type}"
    else
      color_block = "
        <div class='color-block bg-#{name}-light small'></div>
        <div class='color-block bg-#{name}'></div>
        <div class='color-block bg-#{name}-dark small'></div>
      "
      if name == "white"
        variables = "$#{name}-#{type}"
      else
        variables = "
          $#{name}-#{type}
          <div class='hint'>$#{name}-#{type}-light</div>
          <div class='hint'>$#{name}-#{type}-dark</div>
        "
      end
    end
    template = "
      <div class='caption'><b>#{name.capitalize}</b></div>
      #{color_block}
      <div class='caption'>
        #{variables}
        <div class='hint'>#{color}</div>
      </div>
    "
    content_tag(:div, template, class: "color-swatch")
  end

end
