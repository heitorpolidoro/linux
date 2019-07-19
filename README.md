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
Execute docker the commands in order. The name is define in the configuration or is the current directory (${Bold}${DK_NAME}${Color_Off})

Commands:

  build [params]    Execute 'docker build -t ${Bold}${DK_NAME}${Color_Off} <params>'.
                        If the file 'docker-compose.yaml or .yml' is present, execute 'docker-compose build'
  run [params]      Execute 'docker run ${Bold}${DK_NAME}${Color_Off} <params>'
  stop [params]     Execute 'docker stop ${Bold}${DK_NAME}${Color_Off} <params>'
  up [params]       Execute 'docker-compose up <params>'
  down [params]     Execute 'docker-compose down <params>'
  exec command      Execute 'docker exec -it ${Bold}${DK_NAME}${Color_Off} <command>'
                        You can omit 'exec' if it is the only command like 'dk bash' is equivalent to 'dk exec bash'
                        If there is no container named ${Bold}${DK_NAME}${Color_Off} running when you execute the exec
                        command, the script will execute 'dk up/run -d' (if there is a 'docker-compose.yaml/yml' present or not),
                        execute the exec command, then execute 'dk down/stop'
  --name=CONTAINER_NAME
                    Replaces ${Bold}${DK_NAME}${Color_Off} with CONTAINER_NAME
  --set-name=CONTAINER_MAIN_NAME
                    Set the default container main name
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
