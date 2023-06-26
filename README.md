# optimus_grime
A robot named OptimusGrime who cleans a square-meter of the area based on the coordinates provided to it.

Instructions to run the code:
Please go to the root folder of the application and run the command in the following format:

```
  ruby main.rb axb x1,y1 x2,y2
```

where `a` and `b` are the length and breadth of the office. `x` and `y` denote the coordinates to be cleaned in the office. For e.g.,

```
  ruby main.rb 5x5 1,3 4,4
```

You should get the output:
```
  ENNNCEEENC
```

Note: Please keep a space between arguments.

To run the specs:
Run the following command from the root folder to install rspec if its not already installed:
```
  bundle install
```

Then run the following command:
```
  rspec spec
```
