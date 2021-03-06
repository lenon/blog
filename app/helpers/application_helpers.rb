module ApplicationHelpers
  include Rack::Utils

  alias_method :h, :escape_html

  # Returns the current Admin or false if no admin is logged in.
  def current_admin
    if session[:admin_id]
      Admin.find(session[:admin_id])
    else
      false
    end
  end

  # Returns the title (or name) of the current blog.
  def blog_title
    Settings.blog_title
  end

  # Returns the description of current blog.
  def blog_description
    Settings.blog_description
  end

  # Returns the formated title for the current page.
  def page_title
    if @title.present?
      I18n.t('page_title', :page_title => @title, :blog_title => blog_title)
    else
      I18n.t('home_title', :blog_title => blog_title)
    end
  end

  # Converts a string formated in markdown to html.
  def print_markdown(txt)
    Markdown::Processor.instance.render(txt)
  end

  # Returns the asset url for a given file.
  def asset_url(file)
    Assets.compute_path(file)
  end

  # Returns Disqus shortname from settings.
  def disqus_shortname
    h Settings.disqus_shortname
  end

  # Returns the full url to gravatar picture.
  def gravatar_url
    unless defined?(@@gravatar_md5)
      @@gravatar_md5 = Digest::MD5.hexdigest(Settings.gravatar_email.downcase)
    end
    "https://secure.gravatar.com/avatar/#@@gravatar_md5"
  end

  # Returns the author name.
  def author_name
    h Settings.author_name
  end

  # Returns the author bio.
  def author_bio
    h Settings.author_bio
  end

  # Return the Google Analytics UA code.
  def analytics_ua
    h Settings.analytics_ua
  end
end
