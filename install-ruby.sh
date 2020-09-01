#!/bin/bash

MAKEOPTS='-j7' RUBY_CONFIGURE_OPTS='--disable-install-doc --enable-shared' rbenv install --verbose $1
