# Tiny things that may become a proper vim plugin for dendron

Technically we could run the CLI using ! commands and call it a day. But
it would be nice to be able to build note trees, do search, and one day,
even graph previews from within vim.

Today is not that day.

## Ingredients

 - [ ] create a directory, initialize a workspace and a first vault
    - [x] vim function to create directory and initialize a workspace there
    - [ ] create function to set up vault inside a given workspace
 - [ ] lookup notes in a vault
 - [ ] delete notes from a vault
 - [ ] show tree view of vault using netrw, or something?
    - [ ] survey tree view plugins... hope i don't have to code my own

## What's ready

 - `dendron.vim` contains `DendronCreateWorkspace()` which can start a new
   workspace in a given directory if a string is provided. First cut.
