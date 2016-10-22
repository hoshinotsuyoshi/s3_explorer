# S3Explorer

[![Build Status](https://travis-ci.org/hoshinotsuyoshi/s3_explorer.svg?branch=master)](https://travis-ci.org/hoshinotsuyoshi/s3_explorer)
[![Code Climate](https://codeclimate.com/github/hoshinotsuyoshi/s3_explorer/badges/gpa.svg)](https://codeclimate.com/github/hoshinotsuyoshi/s3_explorer)
[![Test Coverage](https://codeclimate.com/github/hoshinotsuyoshi/s3_explorer/badges/coverage.svg)](https://codeclimate.com/github/hoshinotsuyoshi/s3_explorer/coverage)
[![Issue Count](https://codeclimate.com/github/hoshinotsuyoshi/s3_explorer/badges/issue_count.svg)](https://codeclimate.com/github/hoshinotsuyoshi/s3_explorer)

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

## Deploy to heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/hoshinotsuyoshi/s3_explorer)

## Development

### Setup

```
$ bin/setup
```

### Test

```
$ bin/rake
```

### Lint, Metrics

```
$ bin/rake rubocop               # lint
$ bin/rake rubocop:auto_correct  # lint with auto correct
$ bin/rake rubycritic            # output code metrics
$ bin/rake rails_best_practices  # output rails code metrics
```
