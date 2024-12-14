# ruby
## this is for SE course


* THINGS FOR START RAILS<br>
use sources in Gemfile to install dependences<br>
`$ bundle install`<br>
`$ rake db:create`<br>
`$ rake db:migrate`<br>
`$ rake db:seed`<br>
finally run rails to begin the web server<br>
`$ rails server -p 3000`



* THINGS ON RVM<br>
if you want to change ruby version, please make sure run this command first:<br>
`$ source /usr/share/rvm/scripts/rvm` <br>
then you can change ortherwise will come error:<br>
`$ rvm use 2.3.8` <br>
this will set as default:<br>
`$ rvm use 2.3.8 --default` <br>
this command will show ruby version which has been downloaded:<br>
`$ rvm list` <br>
watch this for more information: https://ruby-china.org/wiki/rvm-guide


* login<br>
student1@test.com<br>
teacher1@test.com<br>
admin@test.com<br><br>
密码：`password`



* TO-DO LIST<br>
1.课程查询<br>
“选修课程”界面键入或选择过滤条件<br>
<font color=green>_DONE: all_</font><br>
2.学分统计<br>
已选课程中“公共选修课”、“专业学位课”以及“总学分”的统计信息，了解已获取学分和规定修习学分之间的差距<br>
<font color=green>_DONE: all_</font><br>
3.课表查看<br>
“已选课程”界面，点击“查看课表”按钮，能够看到课表信息<br>
<font color=green>_DONE: all_</font><br>
4.选课冲突处理<br>
“选修课程”界面，点击课程 A 的“加入课程”按钮:<br>
(1)若甲已经选 过 A 课程，则系统给出“请不要重复选课”的提示；<br>
(2)若课程 A 的选课人数超过限选人数，则系统给出“课程 A 选课人数已满”的提示；<br>
(3)若课程 A 的上课时间和甲已经选择的课程 B 上课时间冲突，则系统给出“课程 A 和课程 B 的上课时间冲突”的提示<br>
<font color=yellow>_not begin_</font>
<!--<font color=green>_DONE:</font><br>
<font color=red>UNFINISH:_</font>-->