#!/bin/bash

[ -d .config ] && fd --no-ignore-vcs -t d -E node_modules -E google-chrome -E chromium -E discord . .config
fd --no-ignore-vcs -t d -E node_modules 


