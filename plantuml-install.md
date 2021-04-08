---
layout: page
title: PlantUML Installation
---

## Install on macOS

Install [homebrew](/homebrew.html) first if you don't have one.

```
$ brew install plantuml
```

#### Install on Linux

[Java](http://xxd3vin.github.io/java)

[PlantUML](http://plantuml.com/download.html) > PlantUML compiled Jar

```
$ mv ~/Downloads/plantuml.jar ~/opt
```

Test

```
$ java -jar ~/opt/plantuml.jar -v
(0.000 - 176 Mo) 173 Mo - PlantUML Version 8047
(0.006 - 176 Mo) 173 Mo - GraphicsEnvironment.isHeadless() false
```

Create a `/usr/bin/plantuml` with contents:

```
#!/bin/bash

java -jar /home/user/opt/plantuml.jar "$1" "$2"
```

Remember to change the path to `plantuml.jar` file.

Then set executable permission.

```
chmod +x /usr/bin/plantuml
```

Test

```
$ plantuml -v
(0.000 - 176 Mo) 173 Mo - PlantUML Version 8047
(0.003 - 176 Mo) 173 Mo - GraphicsEnvironment.isHeadless() false
```

Without `dot` (graphviz) only sequence diagrams will be generated.

```
sudo apt-get install graphviz
```

Test

```
$ plantuml -testdot
```

## See also

- [PlantUML](/plantuml.html)
