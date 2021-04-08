#!/bin/bash

./_travis/install_plantuml.sh
gem install bundler
bundle update
gem install jgd -v 1.11
