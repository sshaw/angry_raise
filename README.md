# AngryRaise

`raise` exceptions, with emotion and intensity

[![Build Status](https://travis-ci.org/sshaw/angry_raise.svg?branch=master)](https://travis-ci.org/sshaw/angry_raise)

## Usage

```rb
require "angry_raise"

raise! "an error occured"               # "RuntimeError: an error occured!"
raise! MyError, "an error occured"      # "MyError: an error occured!"
raise! MyError.new("an error occured")  # "MyError: an error occured!"

raise!! "an error occured"              # "RuntimeError: An error occured!!"
raise!! MyError, "an error occured"     # "MyError: An error occured!!"
raise!! MyError.new("an error occured") # "MyError: an error occured!!"

raise!!! "an error occured"               # "RuntimeError: An Error Occured!!!"
raise!!! MyError, "an error occured"      # "MyError: An Error Occured!!!"
raise!!! MyError.new("an error occured")  # "MyError: An Error Occured!!!"

raise!!!! "an error occured"              # "RuntimeError: AN ERROR OCCURED!!!!"
raise!!!!  MyError, "an error occured"    # "MyError: AN ERROR OCCURED!!!!"
raise!!!! MyError.new("an error occured") # "MyError: AN ERROR OCCURED!!!!"
```

Feel free to [capture the mood of each caller](https://www.youtube.com/watch?v=unz1CGoFVMU):

```rb
raise!!!!!!!!!!!!!! "an error occured"  # RuntimeError: AN ERROR OCCURED!!!!!!!!!!!!!!
```

You can add a backtrace too, because sometimes, it's appropriate:

```rb
raise! MyError, "an error occured", %w[frame1 frame2 frame3]
```

## See Also

* [Acme::Crap](https://metacpan.org/pod/Acme::Crap) - The Perl module that served as inspiration
* [Table flipper](https://github.com/iridakos/table_flipper) - Prepends the table flipper on Exception messages
* [class2](https://github.com/sshaw/class2) - DSL for creating class hierarchies
* [YYMMDD](https://github.com/sshaw/yymmdd) - Tiny DSL for idiomatic date parsing and formatting
