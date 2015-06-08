# Lumos

[![Build Status](https://travis-ci.org/query-string/lumos.svg)](https://travis-ci.org/query-string/lumos)
[![Code Climate](https://codeclimate.com/github/query-string/lumos/badges/gpa.svg)](https://codeclimate.com/github/query-string/lumos)
[![Test Coverage](https://codeclimate.com/github/query-string/lumos/badges/coverage.svg)](https://codeclimate.com/github/query-string/lumos)

<pre>
❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄
❄ Strings wrapping library ❄
❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄
</pre>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lumos'
```

Or install it yourself as:

    $ gem install lumos

## Usage as a divider

Description of single usage cases

Single call without params:

```ruby
lumos
```

`###`

Specify delimiter:

```ruby
lumos :>, "☭"
```

`☭☭☭`

Specify number of delimiter repeats:

```ruby
lumos :>, "@", 10
```

`@@@@@@@@@@`

## Usage as a wrapper

```ruby
lumos "String"
```

Available options:

```ruby
lumos "String", {position: :surround, delimiter: "#", padding: 1, length: 140}
```

# Positions:

* @:surround@ – default alignment
* @:left@
* @:right@
* @:top@
* @:bottom@
* @:horizontal@
* @:vertical@

### Delimiter

### Padding

### Length
