
shell scripting disadvantages
--------------------------------
no-Idempotency
no error handling
hard to understand
homogeneous --> means only works for one distro
not scalable
imperative type of programming

Ansible
----------
server should be ready with application

install application runtime
install system packges
install application dependencies
download the code
create users, permissions, directives
create systemctl services

CM tool --> ansible chef

push vs pull
-----------
--> it is a architecture style

if something done forcefully then it is called push
if we do something on own is called pull

The place where ansible is installe is called master
the other servers are called nodes

Adhoc commands:
--------
ansible -i <inventory> -e ansible_user=ec2-user -e ansible_password=password

ansible -i <ip>, all -e ansible_user=username -e ansible_password=password DevOps21 -m ping 

linux we have commands like that in ansible we have modules/collections

ansible -i <ip>, all -e ansbile_user=ec2-user -e ansible_password=DevOps321 -m dnf -a "name=nginx state=installed" -b

-b =become

ansible -i <ip>, all -e ansbile_user=ec2-user -e ansible_password=DevOps321 -m service -a "name=nginx state=started" -b


adhoc commands --> manual way
playbooks --> keep all your modules in a single file with yaml syntax run that file

YAML --> yet another markup language

DTO ---> data transfer objects

```html
<h1>learning yaml</h1>
```

XML --> extensive markup language
```xml
<user><username>charan </username>
<password>chara23</password>
</user>
```

json

```json
{
    "username": "charan"
    "password": "admin323"
    "address": [
        {
            "address1": "dfe-30"
            "city": "bang"
        }
    ]
}
```

yaml

---yaml
name: charan
password: welcome
address:
- add1
- add2
---


```yaml
- name: ping the server
  hosts: web
  tasks: #list of tasks/modules/collections
  - name: pinging the server
    ansible.builtin.ping:

```

inventory :
-----------
- list of hosts

inventory.ini
```
222.2636.
[web]
3133.33.253
156.36326.636

[db]
263.362.636
26.267.262.

[all:children]
web
db
app
```

ansible -i inventory.ini web --list-hosts

ansible-playbook -i inventory.ini -e ansible_user=charan -e ansible_password=monster <filename>

Greencolor ---> success
yellocolor ---> changed and success
red --> error


```yaml
- name: install and run nginx
  hosts: web
  become: yes
  tasks:
  - name: install nginx
    ansible.builtin.dnf:
       name: nginx
       state: latest
  - name: start nginx
    ansible.builtin.service:
       name: nginx
       state: started
       enabled: yes

```

# varialbes
* variables as args
* variables from user prompt

# datatypes

# functions

# loops

# conditions


```multi-play.yml
- name: play-1
  hosts: localhost
  tasks:
  - name: play1 and task1
    ansible.builtin.debug:
       msg: "hello, iam from play1 and task1"
       
  - name: play2
    hosts: localhost
    tasks:     
    - name: play1 and task1
      ansible.builtin.debug:
        msg: "hello, i am from play2 and task1"     
```

## variables at play level
```1.variables.yml

- name: variables
  host: localhost
  vars:
    course: "Ansbile"
    Trainer: "Charan"
    Duration: "120hrs"
  tasks:
  - name: print information
    ansible.builtin.debug:
      msg: "Hi, we are learning {{course}} from Trainer {{Trainer}}, Duration is {{Duration}}"
    
```
## variables at task level

```variable.yml
- name: variables
  host: localhost
  vars:
    course: "Ansbile"
    Trainer: "Charan"
    Duration: "120hrs"
  tasks:
  - name: print information
    vars:
        course: "Terraform"
        Trainer: "naga"
        Duration: "unlimited"
    ansible.builtin.debug:
      msg: "Hi, we are learning {{course}} from Trainer {{Trainer}}, Duration is {{Duration}}"
```

## variables from files

```vars.yml

course: "Devops"
Trainer: "charan"
Duration: "unlimited"
```

```vars-file.yaml
- name: variables
  host: localhost
  vars_files:
  - vars.yml
  tasks:
  - name: print information
    ansible.builtin.debug:
      msg: "Hi, we are learning {{course}} from Trainer {{Trainer}}, Duration is {{Duration}}"
```

vars-prompt
```vars-prompt.yml
- name: variables from files
  hosts: localhost
  vars_prompt:
  - name: USERNAME
    prompt: Please enter your username
    private: false
  - name: PASSWORD
    prompt: Please enter your password
    private: true  
  tasks:
  - name: print information
    ansible.builtin.debug:
      msg: "Hi, username: {{USERNAME}}. password is: {{PASSWORD}}"
```
### variables from the inventory

```vars-inventory.yml
- name: variables from files
  hosts: localhost
  tasks:
  - name: print information
    ansible.builtin.debug:
      msg: "Hi, we are learning {{course}} from Trainer {{Trainer}}, Duration is {{Duration}}"
```
```inventory.ini
125.152.636.647
[web]
232.366.363.347

[localhost]
course= "Terraform-Ansible"
Trainer= "charan"
Duration= "336hrs"

[db]
263.636.744

[app]
839.636.377.263

[app:children]
web
app
db
```
## variablles from args

```vars-args.yml
- name: variables from arguments
  hosts: localhost
  tasks:
  - name: get from args
    ansible.buitin.debug:
      msg: "hello, {{PERSON}}

```
- while executing we have to use -e or --extra-vars to give the value to the variables using arguments

ex: ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password="password" -e PERSON=charan -e WISHES=morning

order of variable preference:
--------------------------
1. arguments
2. task level variable
3. variable file
4. prompt
5. play level variable
6. inventory
7. role level

## Datatype

```datatypes-demo.yml
- name: datatypes
  hosts: localhost
  vars: 
    course: Devops with AWS #string
    Tools: #list
    - linux
    - shell
    - git
    - ansible
    Experience: #map or dictionary
      Devops: 3 #number
      AWS: 2
      Docker: 1
    Real Project: true #boolean
  tasks:
  - name: print variable
    ansible.builtin.debug: 
      msg: "course: {{course}}, Tools covered: {{Tools}}, Experience is: {{Experience}}, is real project: {{RealProject}}"
```

## conditions

```conditions.yml
- name: conditions
  become: yes
  hosts: web
  tasks:
  - name: check user exists or not
    ansible.builtin.command: id expense
    register: USER #output is stored into variable
    ignore_errors: true

  - name: print user info
    ansible.builtin.debug:
      msg: "User info: {{USER}}" 

  - name: create user
    ansible.builtin.command: useradd expense
    when: USER.rc != 0  # c

  - name: say Hello
    ansible.builtin.debug:
      msg: "Hello"
```

Quiz:
=====
```
1. what is idempotency in the context of shell scripting ? A: execute multipel with

2.  how do you call shell script from another shell script within shell script ?
   
3.  what is the purpose of set in shell script ?

4. how do you schedule a task to run periodically using crontab ?

5. what command used to check disk usage in shell script ?

6. how do you send an email from a linux server in a shell script ?

7. what does idempotency ensure in shell scripting ?

8. how do you set a parameter in a shell script ?

9. what is the purpose of error handling in shell script ?

10. how do you pass command line arguments to a shell script ?

11. which command is used to download webpages ?

12. which will list the hidden files along with other folders and files

```

## functions or filters

```conditions.yml
- name: check number
  hosts: locahost
  vars_prompt: # prompts are always considered as string
  - name: number
    prompt: please enter number
    private: no
    tasks:
    - name: number is less than 10
      ansible.builtin.debug:
        msg: "Given number {{number}} is less than 10"
      when: number | intt < 10

    - name: number is greater than or equal to 10
      ansible.builtin.debug:
        msg: "Given number {{number}} is greater than or equal to 10"
      when: number | int >= 10        
```

filter is denoted with | symbol

```filters.yml
- name: default value
  hosts: localhost
  tasks:
  - name: print default value
    ansible.builtin.debug:
      msg: "Hello {{course | default('Ansible') }}"

  - name: uppercase
    hosts: localhost
    vars: 
      greeting: "Hello, Good Morning"
    tasks:
    - name: convert into uppercase
      ansible.builtin.debug:
        msg: "{{ greetings | upper }}"

  - name: lowercase
    hosts: localhost
    vars: 
      greeting: "Hello, Good Morning"
    tasks:
    - name: convert into lowercase
      ansible.builtin.debug:
        msg: "{{ Greetings | lower }}"  

  - name: remove duplicates
    hosts: localhost
    vars:
      numbers: [1,3,3,5,253,235,1,1,6]
    tasks:
    - name: Remove duplicates
      ansible.builtin.debug:
        msg: "{{ greetings | unique }}" 

   - name: print min and max
    hosts: localhost
    vars: 
      ages: [25, 34, 45, 35]
    tasks:
    - name: print min and max
      ansible.builtin.debug:
        msg: " min age: {{ ages | min }}, max age: {{ ages | max }}" 

# dictionary = map = key/value
   - name: convert dictionary into items/list
    hosts: localhost
    vars: 
      my_dict: # this is called as dictionary/keyvalue pair
        course: Ansible
        Trainer: Charan
        Duration: 130hrs
    tasks:
    - name: before converting
      ansible.builtin.debug:
        msg: "Before convert: {{ my_dict }}"
    - name: after convert
      ansible.builtin.debug:
        msg: "After convert: {{ my_dict | dict2items }}"

    - name: convert items to dictionary
      hosts: localhost
      vars:
        my_list:
        - {'key': 'course', 'value': 'Ansible'}
        - {'key: 'Trainer', 'value: 'charan'}
        - {'key: 'Duration', 'value: '140hr'}
      tasks:
      - name: before convert
        ansible.builtin.debug:
          msg: "Before convert: {{ my_list }}"
      - name: after convert
        ansible.builtin.debug:
          msg: "After convert: {{ my_list | items2dict }}"      
```

## loops

```loops.yml
- name: demo on loops
  hosts: localhost
  tasks:
  - name: print names
    ansible.builtin.debug:
      msg: "Hello {{item}}"
    loop:
    - linux
    - shell
    - ansible  

- name: install package
  hosts: web
  become: yes
  tasks:
  - name: install packages
    ansible.builtin.dnf:
      name: "{{ item }}"
      state: latest
    loop:
    - mysql
    - nginx
    - postfix
```

```loops-advanced.yml
- name: install package
  hosts: web
  become: yes
  tasks:
  - name: install packages
    ansible.builtin.dnf:
      name: "{{ item.name }}"
      state: "{{ item.state }}"
    loop:
    - { name: 'mysql', state: 'latest' }
    - { name: 'nginx', state: 'absent' }
    - { name: 'postfix', state: 'absent' }
```

Expense project execution using ansible

1. install db instance
2. update dns records in route53
3. create one repository withe 'expense-ansible'

```inventory.ini
[db]
<db-server ip>
```
```db.yml
- name: configure DB-Server
  hosts: db
  become: yes
  vars:
    login_host: db.daws78s.online <replace with yours>
  vars_prompt:
  - name: mysql_root_password
    print: please enter your root password
    private: false
  tasks:
  - name: install MySQL server
    ansible.builtin.dnf:
      name: mysql-server
      state: latest

  - name: start and enable MYSQL server
    ansible.builtin.service:
      name: mysqld
      state: started
      enabled: yes

  - name: install python mysql dependencies
    ansible.builtin.pip:
      name: 
      - PyMySQL
      - cryptography
      executable: pip3.9

    # check password is already setup or not
  - name: check DB connection
    community.mysql.mysql_info:
      login_user: root
      login_password: "{{ mysql_root_password }}"
      login_host: "{{ login_host }}"
      filter: version
    ignore_errors: yes
    register: mysql_connection_output #output of one as input to other

  - name: print output
    ansible.builtin.debug:
      msg: "output: {{mysql_connection_output}}"  
        
  - name: setup root password
    ansible.builtin.command: mysql_secure_installation --set-root-pass "{{ mysql_root_password }}"
    when: mysql_connection_output.failed is true

```

`mysql -h db.daws78s.online -u root -pExpenseApp@1`

```inventory.ini

[db]
db.daws78s.online

[backend]
backend.daws78s.online

[frontend]
daws78s.online

```

ansible shell vs ansible module
-----------------------------

shell module uses shell environment (i.e; shell variables, redirections, pipes)

command module --> it will just run the commands, but can't use shell environment like pipes, redirectories, shell environment etc

when to use shell and when to use command module  ?

- if a simple plain command 

```command vs shell.yml
- name: command vs shell
  hosts: localhost
  tasks:
  - name: command module
    ansible.builtin.command: "echo 'Hi, this is from command module' > /tmp/command.txt "

  - name: shell module
    ansible.builtin.shell: "echo 'Hi, this is from command module' > /tmp/command.txt "

    # simple commands  without the need of shell variables, environment and features like redirections, pipes & go for command module.

    # if we need to run complex commands or scripts for shell module
    # whatever work in command module will work in shell module viceversa no guarantee.

```

```backendsetup.yml
- name: configure backend server
  become: yes
  hosts: backend
  vars:
    login_host: db.daws78s.online
    login_password: Expense@App1
  tasks:
  - name: disable default nodejs
    ansible.builtin.command: dnf module disable nodejs -y
    
  - name: enable nodejs:20
    ansible.builtin.command: dnf module enable nodejs:20 -y

  - name: install nodejs
    ansible.builtin.dnf: 
      name: "{{ item }}"
      state: installed
      loop:
      - nodejs
      - mysql

  - name: create expense user
    ansible.builtin.user:
      - name: expense

  - name: create app directory
    ansible.builtin.file:
      path: /app
      state: directory


  - name: download backend code
    ansible.builtin.get_url:
      url: https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend.v2.zip
      dest: /tmp/backend.zip
 
  - name: unzip backend code
    ansible.builtin.unarchive:
      src: /tmp/backend.zip
      dest: /app
      remote_src: yes

  - name: install npm module
    ansible.builtin.command: npm install
    args:
      chdir: /app    

  - name: copy backend service
    ansible.builtin.copy:
      src: backend.service
      dest: /etc/systemd/system/backend.service

  - name: import data into mysql 
    community.mysql.mysql_db:
      login_user: root
      login_password: "{{ mysql_root_password }}"
      login_host: "{{ login_host }}"
      target: /app/schema/backend.sql
      state: import
      name: all

  - name: daemon reload
    ansible.builtin.systemd_service:
      daemon_reload: true

  - name: start and enable backend service
    ansible.builtin.service:
      name: backend
      state: started
      enable: yes    
```

```backend.service
[Unit]
Description: Backend Service

[Service]
User=expense
Environment=DB_HOST="db.daws78s.online"
ExecStart=/bin/node /app/index.js
Syslogidentifier=backend

[Install]
WantedBy=multi-user.target
````

```frontend.yml
- name: configure frontend server
  become: yes
  hosts: frontend
  tasks:
  - name: install nginx server
    ansible.builtin.dnf:
      name: nginx
      state: latest

  - name: start and enable nginx
    ansible.builtin.service:
      name: nginx
      state: started
      enabled: yes

  - name: delete default website 
    ansible.builtin.file:
      path: /usr/share/nginx/html
      state: absent 

  - name: create html directory
    ansible.builtin.file:
      path: /usr/share/nginx/html
      state: directory

  - name: download and extract frontend code
    ansible.builtin.unarchive:
      src: https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend.v2.zip
      dest: /usr/share/nginx/html
      remote_src: yes      

  - name: copy bakend.conf
    ansible.builtin.copy:
      src: expense.conf
      dest: /etc/nginx/default.d/expense.conf

  - name: restart nginx
    ansible.builtin.service:
      name: nginx
      start: restarted

```

```expense.conf
proxy_http_version 1.1;

location /api/ { proxy_pass http://backend.daws78s.8080/; }

location /health {
  stub_status on;
  access_log off;
}
```

Troubleshoot:
--------------------------

DB
--------
check mysql service is running or not -> `systemctl status mysqld`

check port no 3306 is opened or not -> `netstat -lntp`

check you are able to connect mysql or not -> `mysql -h db.daws78s.online -u root -pExpenseApp@1`

mysql process running or not -> `ps -ef | grep mysql 
`

Backend:
----------
check backend service is running -> systemctl status bakend

check port no 8080 is running or not -> netstat -lntp

check you are able to connect mysql or not -> telnet db.daws78s.online 3306

check mysql data is imported -> mysql -h db.daws78s.online -u root -pExpenseApp@1 
show databases;
use transactions;
show tables;

ps -ef | grep expense 

frontend
----------
systemctl status nginx
netstat -lntp -> port no 80

telnet backend.daws78s.online 8080

```structure of expense-ansible folders
expense-ansible
  - backend.service
  - backend.yml
  - db.yml
  - expense.conf
  - frontend.yml
  - inventory
`
# Ansible roles

what is ansible role ? Role is a proper structure of variable, tasks, templates, handlers etc using roles we can re-use the code

create new repository `expense-ansible-roles` in github

```
- db.yml
- backend.yml
- inventory 
- ansible.conf
> roles
  - bakend
    - tasks
       - main.yml 
    - vars
      - main.yml 
  - db 
    - tasks
      - main.yml  
    - vars 
       - main.yml
    
`

tasks --> all tasks here
handlers --> we will mention all notifiers here
templates --> we will mention all templates here
files --> we will mention all files here
vars --> variables related to roles are here
defaults --> low priority variables are here
meta --> dependencies are here
library --> roles can also include custom modules
module_utils --> roles can also include custom module_utils
lookup_plugins --> or other types of plugins like lookup in these https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend.v2.zip

```db.yml
- name: configure DB server 
  hosts: db
  become: yes
  roles:
  - db

`
```main.yml
 - name: install MySQL server
    ansible.builtin.dnf:
      name: mysql-server
      state: latest

  - name: start and enable MYSQL server
    ansible.builtin.service:
      name: mysqld
      state: started
      enabled: yes

  - name: install python mysql dependencies
    ansible.builtin.pip:
      name: 
      - PyMySQL
      - cryptography
      executable: pip3.9

    # check password is already setup or not
  - name: check DB connection
    community.mysql.mysql_info:
      login_user: root
      login_password: "{{ mysql_root_password }}"
      login_host: "{{ login_host }}"
      filter: version
    ignore_errors: yes
    register: mysql_connection_output #output of one as input to other

  - name: print output
    ansible.builtin.debug:
      msg: "output: {{mysql_connection_output}}"  
        
  - name: setup root password
    ansible.builtin.command: mysql_secure_installation --set-root-pass "{{ mysql_root_password }}"
    when: mysql_connection_output.failed is true

`
```tasks/vars/main.yml
mysql_root_password: ExpenseApp@1 
`

The configuration file  :

# order of preference
ANSIBLE_CONFIG  (environmental variable if set)
ansible.cfg (in the current directory)
~/.ansible.cfg (in the home directory)
/etc/ansible/ansible.cfg 

we can check the location from where it take by using `ansible --version` command 
```ansible.conf
[defaults]


`
```inventory
[db]
db.daws78s.online

[backend]
backend.daws78s.online

[frontend]
daws78s.online

[all:vars]
ansible_password=DevOps321
`
