## Your Task

As a Shakespeare buff, statistics junkie, and unix lover, Ben finds himself wanting a command-line tool for analyzing Macbeth.

Write a command-line program that prints the number of lines spoken by each character in the play.

Sample usage/output (using made-up numbers):

    $ ruby macbeth_analyzer.rb
      543 Macbeth
      345 Banquo
      220 Duncan
      (etc.)

You can find an XML-encoded version of Macbeth here: http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml. Your program should download and parse this file at runtime.

Your solution must be tested, preferably via TDD.


To run it:

```
git clone https://github.com/manfe/shakespeare_analyzer.git manfe_shakespeare_analyzer
cd manfe_shakespeare_analyzer
ruby lib/analyzer.rb 
```