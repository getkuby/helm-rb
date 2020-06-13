## helm-rb

The [Helm](https://helm.sh/) executable distributed as a Rubygem.

## Intro

Helm is billed as "the package manager for Kubernetes."

It's wrapped up as a Rubygem here to make it easy to distribute with Ruby apps, and was originally created for the [Kuby](https://github.com/getkuby/kuby-core) project.

## Usage

There is only one method that returns the absolute path to the helm executable:

```ruby
require 'helm-rb'

# /Users/cameron/.rbenv/versions/2.5.6/lib/ruby/gems/2.5.0/gems/helm-rb-0.1.0-x86_64-darwin/vendor/helm
HelmRb.executable
```

The version of Helm can be obtained like so:

```ruby
require 'helm-rb/version'

# "3.1.1"
HelmRb::HELM_VERSION
```

## License

Helm is licensed under the Apache 2 license. The LICENSE file contains a copy.

## Authors

* Cameron C. Dutro: http://github.com/camertron
