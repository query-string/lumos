# Lumos

[![Build Status](https://travis-ci.org/query-string/lumos.svg)](https://travis-ci.org/query-string/lumos)
[![Code Climate](https://codeclimate.com/github/query-string/lumos/badges/gpa.svg)](https://codeclimate.com/github/query-string/lumos)
[![Test Coverage](https://codeclimate.com/github/query-string/lumos/badges/coverage.svg)](https://codeclimate.com/github/query-string/lumos)

<pre>
☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢
☢                            ☢
☢                            ☢
☢  Objects wrapping library  ☢
☢                            ☢
☢                            ☢
☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢
</pre>

Have you ever tried to highlight your Ruby objects from your controllers/models/whatever in the Rails log? I bet you have ). I usually do something like that ` p "###"; p %w(foo bar baz ); p "###"` and in general it works fine, until you have to repeat this construction again and again, with different objects, in different places. I have a good news – `lumos` can easily wrap and make any object perceptible amongs common Rails log mess.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lumos'
```

And call inside your controller/model/whatever
 ```ruby
class My::MoviesController < ApplicationController
  def checked
    lumos params
    @movie = Movie.find(params[:movie_id])
    current_user.send(params[:scope]) << @movie
    #redirect_to root_path
  end
end
 ```

## Usage

Depend on passed parameters, `lumos` can act as a **divider** or as a **wrapper**.

### Divider

For example, simple call of `lumos` without params will print a `###` message in your log. Of course you're able to change a divider sign (`lumos :>, "☭"` will print a `☭☭☭` message) and number of repetitions – `lumos :>, "☢", 10`.

```ruby
lumos
print "###"

lumos :>, "☭"
print "☭☭☭"

lumos :>, "☢", 10
print "☢☢☢☢☢☢☢☢☢☢"
```

### Wrapper

But main reason of `lumos` existence is necessity of objects highlighting besides ambient noise. So, initial array might be highlighted with `lumos %w(foo bar baz)` that will give us such output:

<pre>
#########################
#                       #
# ["foo", "bar", "baz"] #
#                       #
#########################
</pre>

Wrapping method also takes few options such as:

#### position:

`:surround` (by default), `:top`, `:bottom`, `:left`, `:right`, `:horizontal`, `:vertical`

```ruby
domains = {ru: "Russia", th: "Thailand", "com.au" => "Australia", ph: "Philippines", la: "Laos"}
lumos domains, {position: :horizontal}
```

<pre>
######################################################################
{:ru=>"Russia", :th=>"Thailand", "com.au"=>"Australia", :ph=>"Philippi
nes", :la=>"Laos"}
######################################################################
</pre>

#### delimiter:

```ruby
lumos domains, {position: :horizontal, delimiter: "❤★"}
```

<pre>
{:ru=>"Russia", :th=>"Thailand", "com.au"=>"Australia", :ph=>"Philippi
nes", :la=>"Laos"}
❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★❤★
</pre>

And as you know – everything is better with emoji, so lumos supports emoji delimiters as well!

```ruby
lumos domains, {position: :vertical, delimiter: ":coffee:"}
```

Coffee smells like freshly ground heaven

:coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee::coffee:

#### padding:

```ruby
lumos domains, {delimiter: "❄", padding: 2}
```

<pre>
❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄
❄                                                                            ❄
❄                                                                            ❄
❄                                                                            ❄
❄   {:ru=>"Russia", :th=>"Thailand", "com.au"=>"Australia", :ph=>"Philippi   ❄
❄   nes", :la=>"Laos"}                                                       ❄
❄                                                                            ❄
❄                                                                            ❄
❄                                                                            ❄
❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄❄
</pre>

#### length:

```ruby
lumos domains, {position: :horizontal, delimiter: "->", length: 140}
```

<pre>
->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
{:ru=>"Russia", :th=>"Thailand", "com.au"=>"Australia", :ph=>"Philippines", :la=>"Laos"}
->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
</pre>
