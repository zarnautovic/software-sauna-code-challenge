# software-sauna-code-challenge
Code challenge for software sauna

[![License](https://img.shields.io/packagist/l/doctrine/orm.svg)](https://img.shields.io/packagist/l/doctrine/orm.svg)

## Requirements
- ruby -> brew install ruby (https://www.ruby-lang.org/en/documentation/installation/)
- bundler -> gem install bundler (https://bundler.io/)

## How to run
1. Make git clone/pull to your local folder.
2. Run -> bundle install
3. Run -> ruby init.rb maps/ASCII-MAP-3.txt (in maps folder are 1,2,3 maps (ASCII-MAP-3.txt), two other two are for testing invalid input)
4. Run all tests -> bundle exec rspec spec
5. Run test in isolation -> rspec spec/create_map.rb

License
---------

MIT License

Copyright (c) 2019 Zlatan Arnautovic

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.