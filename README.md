# S3Explorer

[![Build Status](https://travis-ci.org/hoshinotsuyoshi/s3_explorer.svg?branch=master)](https://travis-ci.org/hoshinotsuyoshi/s3_explorer)

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
