require 'sass-globbing'

add_import_path "vendor/scss/foundation"
add_import_path "vendor/scss/fontawesome"
# Require any additional compass plugins here.
project_type = :stand_alone

# Publishing paths
http_path = "/"
http_images_path = "/images"
http_generated_images_path = "/images"
http_fonts_path = "/fonts"
css_dir = "src/assets/css"

# Local development pathsa
sass_dir = "assets/scss"
images_dir = "assets/images"
fonts_dir = "assets/fonts"
line_comments = false
output_style = :compressed

# Suppress Foundation depreceation warnings..
# [TODO] Research a possible fix or find a stable SASS/Compass/Foundation combination. 
disable_warnings = true