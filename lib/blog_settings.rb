class BlogSettings
  def initialize(host)
    @host = host
  end

  def title
    settings["title"]
  end

  def description
    settings["description"]
  end

  def domain
    settings["domain"]
  end

  private

  def settings
    @settings ||= (find_blog || Settings.blogs.first)
  end

  def find_blog
    Settings.blogs.reject { |b| b.domain != "#@host".downcase }.first
  end
end