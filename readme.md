# grunt-init-web [![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

> Create a web development skeleton with [grunt-init][]. uses cofeescript, stylus, jade and livereload

[grunt-init]: http://gruntjs.com/project-scaffolding

## Installation
If you haven't already done so, install [grunt-init][].

Once grunt-init is installed, place this template in your `~/.grunt-init/` directory. It's recommended that you use git to clone this template into that directory, as follows:

```
git clone https://github.com/Safareli/grunt-init-web.git ~/.grunt-init/web
```

To update this template remove old version from `~/.grunt-init/` directory and clone new one
```
rm -rf ~/.grunt-init/web && git clone https://github.com/Safareli/grunt-init-web.git ~/.grunt-init/web && rm -rf ~/.grunt-init/web/.git
```



_(Windows users, see [the documentation][grunt-init] for the correct destination directory path)_

## Usage

At the command-line, cd into an empty directory, run this command and follow the prompts.

```
grunt-init web
```

_Note that this template will generate files in the current directory, so be sure to change to a new directory first if you don't want to overwrite existing files._


### Uses

 - coffeescript
 - coffeelint
 - jade
 - stylus with nib
 - uglify
 - connect server
 - livereload
 - watch and newer

### Grunt Commands

 - default
   - build
   - dev
 - build
   - clean public folder
   - lint, compile and  uglify scripts
   - compile jade and stylus
 - dev
   - start server
   - use livereload and watch
 - check
   - run only server
