# 2024autumn SE_course/ruby on rails

this is my homework for se_class, advice is welcomed!

## notes when programming

### start rails

use sources in Gemfile to install dependences. *it will take some time...*
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```
finally run rails to begin the web server
```
$ rails server -p 3000
```

### about rvm

if you want to change ruby version, please make sure this command runs first:

`$ source /usr/share/rvm/scripts/rvm` 

then you can change the version, otherwise it will come error:

`$ rvm use 2.3.8` 

this will set as default:

`$ rvm use 2.3.8 --default` 

this command will show ruby version which has been downloaded:

`$ rvm list` 

more information here: https://ruby-china.org/wiki/rvm-guide

### login the web server

student1@test.com  
teacher1@test.com  
admin@test.com

password：`password`

## completed missions in course

1. 课程查询

“选修课程”界面键入或选择过滤条件

<font color=green>_DONE: all_</font>

2. 学分统计

已选课程中“公共选修课”、“专业学位课”以及“总学分”的统计信息，了解已获取学分和规定修习学分之间的差距

<font color=green>_DONE: all_</font>

3. 课表查看

“已选课程”界面，点击“查看课表”按钮，能够看到课表信息

<font color=green>_DONE: all_</font>

4. 选课冲突处理

“选修课程”界面，点击课程 A 的“加入课程”按钮:

    (1)若甲已经选 过 A 课程，则系统给出“请不要重复选课”的提示；

    (2)若课程 A 的选课人数超过限选人数，则系统给出“课程 A 选课人数已满”的提示；

    (3)若课程 A 的上课时间和甲已经选择的课程 B 上课时间冲突，则系统给出“课程 A 和课程 B 的上课时间冲突”的提示

<font color=green>_DONE:all_</font>
