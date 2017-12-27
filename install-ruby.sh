#!/bin/bash

MAKEOPTS='-j5' RUBY_CONFIGURE_OPTS='--enable-shared' rbenv install --verbose $1
