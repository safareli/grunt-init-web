/*
 * grunt-init-web
 * http://github.com/Safareli/grunt-init-web
 *
 * Copyright (c) 2014 "Safareli" Irakli Safareli
 * Licensed under the MIT license.
 */

'use strict';

// Basic template description.
exports.description = 'Create a web development skeleton, with cofeescript, stylus, jade and livereload';

// Template-specific notes to be displayed before question prompts.
// exports.notes = '';

// Template-specific notes to be displayed after question prompts.
exports.after = 'You should now install project dependencies with _npm ' +
  'install_. After that, you may execute project tasks with _grunt_. For ' +
  'more information about installing and configuring Grunt, please see ' +
  'the Getting Started guide:' +
  '\n\n' +
  'http://gruntjs.com/getting-started';

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*';

// The actual init template.
exports.template = function(grunt, init, done) {

  init.process({type: 'node'}, [
    // Prompt for these values.
    init.prompt('name'),
    init.prompt('description'),
    init.prompt('version'),
    init.prompt('repository'),
    init.prompt('homepage'),
    init.prompt('bugs'),
    init.prompt('licenses', 'MIT'),
    init.prompt('author_name'),
    init.prompt('author_email'),
    init.prompt('author_url'),
    init.prompt('node_version', '>= 0.8.0'),
    init.prompt('source_dir', 'source'),
    init.prompt('build_dir', 'build'),
    init.prompt('scripts_dir', 'scripts'),
    init.prompt('styles_dir', 'styles'),
    init.prompt('livereload_port', '4000'),
    init.prompt('server_port', '3000'),
    init.prompt('server_hostname', '0.0.0.0')
  ], function(err, props) {
    props.devDependencies = {
      "nib": "~1.0.2",
      "jade": "~1.3.0",
      "grunt": "~0.4.4",
      "stylus": "~0.42.3",
      "grunt-newer": "~0.7.0",
      "grunt-coffeelint": "0.0.8",
      "load-grunt-tasks": "~0.2.1",
      "grunt-contrib-jade": "~0.11.0",
      "grunt-contrib-watch": "~0.6.1",
      "grunt-contrib-stylus": "~0.13.2",
      "grunt-contrib-connect": "~0.7.1",
      "grunt-contrib-coffee": "~0.10.1",
      "grunt-contrib-uglify": "~0.3.2",
      "grunt-contrib-clean": "~0.5.0"
    };
    
    props.keywords = [];
    props.__scripts_dir = props.source_dir + '/' + props.scripts_dir;
    props.__styles_dir = props.source_dir + '/' + props.styles_dir;
    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Add properly-named license files.
    init.addLicenseFiles(files, props.licenses);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // Generate package.json file.
    init.writePackageJSON('package.json', props);

    // All done!
    done();
  });

};