#!/bin/bash

MAKEOPTS='-j5' RUBY_CONFIGURE_OPTS='--disable-install-doc --enable-shared' rbenv install --verbose $1
