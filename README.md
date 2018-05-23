# Iqeo::Pitch

Getting opal-rspec to work...

Run specs with rake...

```
$ bunde exec rake
invalid option: --missing-require=ignore
```

opal-rspec lib/opal/rspec/runner.rb
```
83:  # options << '--missing-require=ignore'
99:  puts "### #{@args}"
```

```
$ bundle exec rake
### --arity-check --runner node -ropal/platform -ropal-rspec -Ilib -Inode_modules -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/gems/opal-0.11.0/opal -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/gems/opal-0.11.0/stdlib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/gems/opal-0.11.0/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/gems/ast-2.4.0/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/gems/ast-2.4.0/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/gems/parser-2.3.3.1/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/lib-opal -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/stubs -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/rspec/upstream/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/rspec-core/upstream/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/rspec-expectations/upstream/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/rspec-mocks/upstream/lib -I/home/gerard/.rvm/gems/ruby-2.4.2@iqeo-pitch/bundler/gems/opal-rspec-f3b28c3df1e0/rspec-support/upstream/lib -I./spec-opal -e \;::RSpec::Core::Runner.autorun
Object freezing is not supported by Opal
No examples found.


Finished in 0.004 seconds (files took 0.338 seconds to load)
0 examples, 0 failures

```

Gemfile
```
gem 'opal'      , git: 'https://github.com/opal/opal.git',       ref: 'fcc3f78'
```

```
$ bundle exec rake
Failed to load WithCLexer, using pure Ruby lexer
warning: Removed semicolon ending x-string expression, interpreted as unintentional -- opal/rspec/formatter/document_io.rb:7
Object freezing is not supported by Opal
No examples found.


Finished in 0.004 seconds (files took 0.346 seconds to load)
0 examples, 0 failures
```


