---
id:
title: Getting Started in CLI
desc: Writing Dendron notes with vim and cli
updated:
created: 
---

# Getting Started

So you want to write notes in dendron without installing [[Visual Studio Code]]?
Me too! I love [[vim]], so I wanted to be able to use dendron from there. Here's
how I did it with [[node]] from the [[command line]].

## Prerequisites

 - patience
 - node.js and npm
 - vim (or your preferred editor.)

## tl;dr

    mkdir workspace
    dendron workspace init --wsRoot workspace/
    cd workspace
    mkdir vault
    dendron vault create --vaultPath vault
    cd vault
    dendron note lookup --query title   # produces title.md you can edit

## Installing

  1. I can't install patience for you, try working with [[Windows]] for years.
  2. Assuming you have a recent version of node/npm installed, get dendron:

          npm install -g @dendronhq/dendron-cli

  3. Once the software is in place, we can get going.

## Workspace Setup

  1. Create an empty workspace directory, e.g. `notes`.

          mkdir notes

  2. Run the `workspace init` command, specifying the path to `wsRoot`.

          dendron workspace init --wsRoot notes/
     
     The CLI will create the necessary configuration files in `notes`:

          $ ls -la notes/
          total 344
          drwxrwxr-x  2 user user   4096 Nov 20 11:08 .
          drwx------ 85 user user 307200 Nov 20 11:08 ..
          -rw-rw-r--  1 user user      5 Nov 20 11:08 .dendron.port
          -rw-rw-r--  1 user user     57 Nov 20 11:08 .dendron.ws
          -rw-rw-r--  1 user user   1905 Nov 20 11:08 dendron.yml

     `.dendron.port` contains what seems to be a port number.

     `.dendron.ws` contains a JSON object with API version and timestamp.

     `dendron.yml` contains lots of configuration details, we'll skip that
     for now.

     At this point, we are ready to create a vault that stores our notes.

## Vault Setup

Dendron stores notes in vaults, so you will have to create one yourself.

  1. Create an empty vault directory inside the workspace, e.g. `topic`.

          cd notes
          mkdir topic

  2. Run the `vault create` command, specifying the path to `wsRoot`.

          dendron vault create --vaultPath topic

     The CLI will create the necessary configuration files in `topic`:

          $ ls -la topic/
          total 32
          drwxrwxr-x 2 user user 4096 Nov 20 13:45 .
          drwxrwxr-x 3 user user 4096 Nov 20 13:44 ..
          -rw-rw-r-- 1 user user  318 Nov 20 13:45 root.md
          -rw-rw-r-- 1 user user   95 Nov 20 13:45 root.schema.yml

     Here we can start writing notes. About time!

## Creating a Note

Within a vault, e.g. `notes/topic/`, you should see a `root.md` as above.
Now you just need to create a note and ...

  1. Inside a vault, create the note.

          cd topic
          dendron note lookup --query ${note_title}

     **NOTE (heh):** the first time you do this from command line, it is
     hella spammy. Be prepared to see lots of JSON, as it shows you full
     context of where the note is, and tries to find a workspace file in
     the current directory.

  2. Once it's done, you can edit the note in your favourite editor:

          vim $(note_title}.md

     When you next call `dendron note lookup --query ${note_title}`, the
     updated note content is shown in a JSON object.

