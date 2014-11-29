###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  blog.permalink = "articles/{title}.html"
  blog.sources = "articles/{year}-{month}-{day}-{title}.html"
  blog.tag_template = "tag.html"
  blog.custom_collections = {
    category: {
      link: '/category/{category}.html',
      template: '/category.html'
    }
  }
end

activate :directory_indexes

page "/feed.xml", layout: false
page "articles/*", :layout => "article_layout"


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

helpers do
  def build_categories(articles)
    categories = []
    articles.each do |article|
      category = article.metadata[:page]['category']
      unless categories.include? category
        categories.push(category)
      end
    end
    return categories
  end

end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration

configure :build do
  activate :minify_css
  activate :minify_javascript
end
