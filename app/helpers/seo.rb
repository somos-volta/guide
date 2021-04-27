module Seo

  def site_name
    data.site.title
  end

  def base_url
    "http://www.peoplefirst.cl"
  end

  def blog_url
    "http://www.peoplefirst.cl/insights"
  end

  def current_url
    if current_article
      blog_url
    else
      base_url
    end
  end

  def permalink
    if current_article
      "http://www.peoplefirst.cl" + current_article.url
    else
      "ups"
    end
  end

  def current_title
    if current_article
      current_article.title
    elsif @page_title
      @page_title
    elsif current_page
      current_page.data.title
    else
      data.site.title
    end
  end

  def current_page_title
    separator = ' | '
    if data.site.reverse_title
      current_title + separator + data.site.title
    else
      data.site.title + separator + current_title
    end
  end

  def current_page_description
    if current_article && current_article.summary(100)
      description = current_article.summary(100)
    elsif @page_title
      description = @page_title + ' page of ' + data.site.title
    else
      description = data.site.description
    end
    # remove html tags
    description.gsub(/<("[^"]*"|'[^']*'|[^'">])*>/, '').gsub(/[\r\n]/, ' ')
  end

  def current_page_image
    if current_page.data.image
      "http://www.peoplefirst.cl" + current_page.data.image
    else
      ""
    end
  end

end
