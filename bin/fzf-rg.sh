#!/bin/bash

[ -d .config ] && rg --files --no-ignore-vcs -g '!{node_modules,google-chrome,chromium,discord}' .config
rg --files --no-ignore-vcs -g '!node_modules'

