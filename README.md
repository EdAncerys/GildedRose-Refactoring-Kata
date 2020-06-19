# Gilded Rose Refactoring Kata

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

## How to use this Kata

The simplest way is to just clone the code and start hacking away improving the design. I strongly advise you that you'll also add some extra tests if you want to make sure you don't break the code while you refactor.

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB. (You don't need to implement a command line interface that takes input from STDIN.)
- Data can be kept in memory (it doesn't need to be stored to a database or anything).
- You'll want to look at the ["Gilded Rose Requirements"](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/GildedRoseRequirements.txt) which explains what the code is for.

## Getting Started

To run **Gilded Rose** you will have to fork this repo and clone to your local machine.

Navigate to repository via command line and follow instructions below:

To install gems dependencies used in a project:

```
bundle
```

To run tests with **RSpec**:

```
rspec
```

### Final Product Functionality

As a User able to run app functionality by calling #update_quality() on instance of the class.
As a User you able to manipulate/update item quality and sell_in attributes.
All changes stored in local storage.

### RSpec and test coverage

<div align="center">
  <img alt="bank_tech_test" height="400px" src="./images/Gilded_Rose_01.png">
</div>

## License

The package is available as open source
