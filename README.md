# rails-decryptor
Decrypt Rails environment using master keys without a working Rails setup

## Usage
Have your master.key and encrypted environment.enc files ready on clipboard.
Then, run:
```ruby
ruby decrypt.rb
```
This will prompt you for the contents of `master.key` , confirm, and then prompt you for the `.enc` file.

## Misc
Cobbled together from [daehee's blog ](https://www.daehee.com/decrypt-ruby-on-rails-credentials/)
