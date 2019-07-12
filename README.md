# linux
Some useful bash files and scripts.

Run `create_links.sh` to create symbolic links for each file in `home`
and create a symbolic link named **bin** in your home to the `scripts` 
directory


#### .bash_aliases
Some useful aliases

#### .bash_colors
Some useful color names and a method `show_colors` to show all 
possible colors with **tput**
 
#### .bashrc
PS1 with some git information.

#### .gitconfig
Some git alias:

- inject: Inject staged modifications in a commit
- since: Git log since...
- clearLocalBranchs: Remove local branchs with git remote prune 
origin and prompt for merged branchs

#### .inputrc
Some useful input configurations

#### .profile
Nothing different

#### .vimrc
Some useful vim configurations

# scripts

#### dk
```
Usage: dk commands

Execute docker the commands in order. The name is the current directory (<CUR_DIR>)

Commands:

  build         Execute 'docker build -t <CUR_DIR>'. If the file 'docker-compose.yaml or .yml' is present, execute 'docker-compose build'
  run           Execute 'docker run <CUR_DIR>'
  stop          Execute 'docker stop <CUR_DIR>'
  up            Execute 'docker-compose up -d'
  down          Execute 'docker-compose down'
```
#### migrate_db
Execute:
```
Usage: migrate_db [ENV]. If no ENV is passed uses 'test'

rails db:migrate RAILS_ENV=<ENV>
rails seed:migrate RAILS_ENV=<ENV>
```
#### morra
```
Usage: morra <what to kill>
ATTENTION! Will execute kill -9 in ALL matching process
```
#### remover_ponto_orig
Remove all `.orig` files

#### spotify_control
To create media shorcuts when the defaults doesn't work

#### update
Execute:
```
$ sudo apt-get update
$ sudo apt-get -y upgrade
$ sudo apt-get autoremove
$ sudo apt-get autoclean
$ sudo snap refresh
```
