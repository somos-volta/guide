  # Directories
set :data_dir,     "app/data"
set :locales_dir,  "app/locales"
set :helpers_dir,  "app/helpers"

# Relative to source
set :layouts_dir,  "layouts"
set :partials_dir, "partials"

# Assets
set :css_dir,      "assets/stylesheets"
set :js_dir,       "assets/javascripts"
set :fonts_dir,    "assets/fonts"
set :images_dir,   "assets/"

activate :i18n, :mount_at_root => :es

activate :external_pipeline,
         name: :brunch,
         command: build? ?  "npm run build" : "npm run start",
         source: ".tmp",
         latency: 1

# External files
set :helpers_filename_glob, "**.rb"
files.watch :source, path: "/Users/cristian/Development/studio/library"
files.watch :source, path: "/Users/cristian/Development/studio/library/partials"
files.watch :source, path: "/Users/cristian/Development/studio/library/helpers"

# Layouts
set :markdown_engine, :redcarpet

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes

# Development-specific configuration
# Reload the browser automatically whenever files change

configure :development do
  activate :livereload
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  ignore 'partials/*.yml'
  ignore 'sections/*'
  ignore 'templates/*'
  ignore 'config/*'
  ignore 'icons/*'

# Enable cache buster (except for images)
  activate :asset_hash, ignore: [/\.jpg\Z/, /\.jpeg\Z/, /\.png\Z/]
# activate :minify_css
# activate :minify_javascript
end
