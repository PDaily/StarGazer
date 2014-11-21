[ ![Codeship Status for PDaily/StarGazer](https://codeship.com/projects/5b471250-53fa-0132-107b-42ab35009c21/status)](https://codeship.com/projects/49079)

# StarGazer

This is the base for my own [Jekyll] based personal page. I was looking for a way to quickly get my assets in line while easily knocking down those pesky pagespeed warnings.
This is a major work in progress for me as I learn more about Jekyll.

I decided to name it StarGazer in honor of Foundation 5 by [Zurb]. Thanks guys!

Stargazer includes:

  - [Foundation 5] for responsive, clean design.
  - [Rails-Assets] for grabbing [Bower] based assets.
  - [Jekyll-Assets] for asset deployment!


I was originally using [Octopress], but decided to work from scratch. I do think however, I may pull some things from [Octopress] to make my life easier.

###Version
0.0.1

### Installation

#### Requirements
  - Just Ruby!

```sh
$ git clone https://github.com/PDaily/StarGazer.git stargazer
$ cd stargazer
$ bundle install
$ rake preview
```

### Plugins

As StarGazer is Jekyll at its core, any plugins developed for Jekyll should work out of the box. Plugins are located in the `plugins` directory.

### Development

StarGazer uses Jekyll-Assets for quick SASS/CSS and Javascript management, while easily compressing and gzipping everything into a nice package.
Along with that, Rails-Assets is bundled in to bring in new assets without the need of downloading and organizing them yourself.

Add your custom assets to thier respective folders in the `src/_assets` directory and require them.

And just use `rake preview`!

### Deploying

Out of the box, this is ready to build and deploy to `gh-pages`. I pulled parts of the Rakefile in [Octopress] that will easily set up your pages branch, and push it up.

Currently, I am working on an easy way to push to Heroku and incorporate Amazon S3 hosting for the assets.

To deploy:

```sh
$ rake setup_github_pages
$ rake deploy
```

### Testing
Testing is fairly basic right now, simply using [HTML-Proofer] as a way to make sure all HTML endpoints are working how they should. I'm looking to write test as they become relevant.

To run a test, open a terminal window and use:

```sh
$ rake test
```
### Todo's

 - Write Tests
 - Design more partials
 - Incorporate more Foundation goodness

-------
#Contributing
>If you'd like to contribute to development, please fork and send a pull request! Any contributions are more than welcome and I would love to work with anyone and everyone who is interested!


License
----

MIT

[octopress]:http://octopress.org
[sass]:https://github.com/sass/sass
[Jekyll]:http://jekyllrb.com
[Zurb]:http://zurb.com
[Foundation 5]:http://foundation.zurb.com
[Rails-Assets]:https://rails-assets.org
[Bower]:http://bower.io
[Jekyll-Assets]:https://github.com/ixti/jekyll-assets
[html-proofer]:https://github.com/gjtorikian/html-proofer
