# `rspec-text-order`

[![Build Status][travis-img]][travis]

[travis-img]: https://travis-ci.org/iamvery/rspec-text-order.svg?branch=master
[travis]: https://travis-ci.org/iamvery/rspec-text-order

A set of RSpec matchers for detecting the position of parts of text relative to other parts.

## Installation

Add the gem to your Gemfile:

```ruby
gem 'rspec-text-order', '~> 0.1'
```

## Usage

`include_text`

The simplest matcher is `include_text`.
It is mostly just a duplicate of RSpec's built-in `include` matcher, with the added benefit of additional chainable matchers.

```ruby
RSpec.describe 'text order matchers' do
  it 'asserts subtext position relative to other subtext' do
    actual = 'first middle last'
    expect(actual).to include_text('middle')
    expect(actual).to include_text('middle').before('last')
    expect(actual).to include_text('middle').after('first')
    expect(actual).to include_text('middle').after('first').before('last')
  end
end
```

A common use case for this type of matcher is to ensure text is presented in a certain order in an acceptance test.
For that reason, there are also a couple of shortcut matchers included for convenience.

```
# this is a capybara-enabled acceptance test
RSpec.describe 'name page', type: :feature do
  it 'displays names in alphabetical order' do
    create_person('Charlie')
    create_person('Barbara')
    create_person('Anne')

    visit '/'

    expect('Barbara').to appear_before('Charlie')
    expect('Barbara').to appear_after('Anne')
  end
end
```
