#!/bin/bash

[ -d .config ] && rg -i --files --no-ignore-vcs -g '!{node_modules,google-chrome,chromium,discord}' .config
rg -i --files --no-ignore-vcs -g '!node_modules'

