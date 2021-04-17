# Browser tests

```
  Designed and Built by

  _    _
 | \  | |
 | \\ | | ___  ___  _  __  ____      _
 | |\\| |/ _ \/ _ \| |/__|/ _  |    | | 
 | | \  |  __/  __/|  /  | |_| | _  | |
 |_|  \_|\___/\___/|_|    \____|| |_| |
                                |_____|  
 
```

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes.

### Prerequisites

To run this Ruby application, you will need to have the following software installed:

#### Browser
Chrome or Firefox browser

#### Ruby
Version 2.6.3 (set in [.ruby-version](.ruby-version))

##### GoRails Installation Guides

Only upto 'Configuring Git' heading.
Dont need Rails or Database.

- [macOS](https://gorails.com/setup/osx)
  (installation via [rbenv](https://github.com/rbenv/rbenv))
- [Windows](https://gorails.com/setup/windows)
- [Ubuntu](https://gorails.com/setup/ubuntu)

#### Bundler

[Bundler](https://bundler.io/) is a tool for managing Ruby dependencies.

Install by running:

```
gem install bundler
```

### Setup

Ensure you have installed all [prerequisites](#prerequisites) above and then:

1. Clone the repository
2. `cd` to project directory
3. Run `bundle install` to install dependencies
4. Run `ruby runner.rb` to open a browser and run tests

#### Environment Variables

This project uses [Figaro](https://github.com/laserlemon/figaro) to manage
environment variables.
Open [`config/application.yml.example`](config/application.yml.example) to see
how to set environment variables.

To set up variables on your machine:

1. Copy and rename `config/application.yml.example` to `config/application.yml`
   (this file is added to gitignore)
