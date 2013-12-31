# Cyrus List Processor

by Manuel Neuhauser (manuel.neuhauser@gmail.com)


### Overview

This application takes one or more pipe, comma or space separated files and 
returns the records in one of three sorting orders.

### Examples

Sorted by gender (females before males) then by last name ascending.

``` bash
$ ruby bin/run.rb --pipe=test/data/pipe.txt --comma=test/data/comma.txt --space=test/data/space.txt --output=1

 Hingis Martina F 4/2/1979 Green
 Kelly Sue Female 7/12/1959 Pink
 Kournikova Anna F 6/3/1975 Red
 Seles Monica F 12/2/1973 Black
 Abercrombie Neil Male 2/13/1943 Tan
 Bishop Timothy Male 4/23/1967 Yellow
 Bonk Radek M 6/3/1975 Green
 Bouillon Francis M 6/3/1975 Blue
 Smith Steve M 3/3/1985 Red
```

Sorted by birth date, ascending

``` bash
$ ruby bin/run.rb --pipe=test/data/pipe.txt --comma=test/data/comma.txt --space=test/data/space.txt --output=2

 Abercrombie Neil Male 2/13/1943 Tan
 Kelly Sue Female 7/12/1959 Pink
 Bishop Timothy Male 4/23/1967 Yellow
 Seles Monica F 12/2/1973 Black
 Bouillon Francis M 6/3/1975 Blue
 Bonk Radek M 6/3/1975 Green
 Kournikova Anna F 6/3/1975 Red
 Hingis Martina F 4/2/1979 Green
 Smith Steve M 3/3/1985 Red
```

Sorted by last name, descending

``` bash
$ ruby bin/run.rb --pipe=test/data/pipe.txt --comma=test/data/comma.txt --space=test/data/space.txt --output=3
 Smith Steve M 3/3/1985 Red
 Seles Monica F 12/2/1973 Black
 Kournikova Anna F 6/3/1975 Red
 Kelly Sue Female 7/12/1959 Pink
 Hingis Martina F 4/2/1979 Green
 Bouillon Francis M 6/3/1975 Blue
 Bonk Radek M 6/3/1975 Green
 Bishop Timothy Male 4/23/1967 Yellow
 Abercrombie Neil Male 2/13/1943 Tan
```

### Running Tests

``` bash
$ rake test
```

#### Ruby Version
ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.5.0]

#### Rake Version
rake, version 10.1.1
