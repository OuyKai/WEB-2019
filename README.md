# WEB-2019
## 主项目从https://github.com/veekxt/hfuu_shop 中fork而来.
## Eclipse 安装
1. 官网下载安装包直接安装;
2. 安装必备插件, `(mac)Help->MarketPlace`. 需要的有`JST Server Adapter, Web Developer Tool, Java EE Developer Tools, Eclipse Web Developer Tools`, **一定要先装插件再运行!!!!**
3. 下载Tomcat, Eclipse只支持到Tomcat 8.0, 所以**根据自己的OS安装Tomcat 8.0**. 我选择的版本是8.0.32. 注意官网直接进去的版本是8.5, 这个版本Eclipse不支持. 我的下载地址在https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.32/bin/.
4. `Import Project`到你下载好的Git包.
5. `File->New->other->server->tomcat 8.0`, 导入Tomcat
6. 右击Project文件夹, `Properties->Java Build Path`, 把jxl包的路径改成`本地路径/DatabaseProject/WebContent/.../jxl.jar`. 其它类似, JRE改成自己PATH里的.
7. 运行, 右击project文件夹, 选择`RunAs->Run on Server`即可运行.

## Gitignore 
请务必在gitignore中加入下列语句(如我的ignore):
```
# Gitignore of wayne-mai, May 16, 2019
.vscode/
**/.settings/**
.classpath
.project
```
## 更新规范
创建自己的branch, 采用`pull-request-merge'的工作流.

## 分工
| 学号       | 姓名  | 初步分工      |
|----------|-----|-----------|
| 16337157 | 刘上华 | 前端        |
| 16337173 | 刘喆  | 前端        |
| 16337179 | 麦金杰 | 设计和文档, 前端 |
| 16337187 | 欧阳凯 | 后台,数据库    |
| 16337205 | 邵鑫  | 后台        |


## Version Beta 1.0
### Task: 登录界面优化
参照中山大学官网, 或者https://skilful-display-212606.appspot.com/ .
风格可以参照下图. 
![](./SourceCode/readmeDisplay/img0.png)

具体要求:
1. 主题是数据科学与计算机学院请假系统, 顶栏和尾栏自行设计, **顶尾栏设计需要在各个页面都使用**;
2. 首页应当有适当的js美化;
3. 可选: 可以加入验证码系统, 有些平台提供了API;
4. 可选: 更换背景图片为中大相关;
5. 原有接口不变, 只需更改样式;
6. 原界面输入框未对齐, 需要做美化;

## Version Beta 2.0
### Task: 登录界面优化 Continued
首页设计的样式和风格应用(copy)到其它界面上.
另外各个页面的背景图也都换成中大风格的(找几张图片就好了), 尽量好看些, 样式可能的话不要继续repeat-y, 挺难看的. 


### Task: 界面风格优化1
![](./SourceCode/readmeDisplay/img1.png)

1. 各字段调整为:
加班类型->请假类型, 分因公请假, 因私请假, 其他三种;
加班日期->请假日期; 
2. 加入两个部分, 请假理由(textarea, 文本编辑), 请假证明等(可选), 请假证明
为文件类型, 需要上传; 请假证明变量名为proof, 文件名为id_proof.*;
3. 风格调整, 将主题色调, 首栏和尾栏调整为中大绿(参考首页);

### Task: 界面风格优化2
![](./SourceCode/readmeDisplay/img2.png)
1. 字段调整, 员工名改为姓名, 加班等改成请假;
2. 加入新字段, 学号, 变量名为id;
3. 加入新一列, 展示同学照片, 即相片栏, 后端传来的变量名为photo, 照片的命名格式为id.jpg, id为学号;
4. 界面设计参考Task: 界面风格优化1, 保持一致即可;
5. 另外顶栏工具申请加班, 申请结果等选项不够美观, 需要进行一定优化;

### Task: 界面风格优化3
![](./SourceCode/readmeDisplay/img4.png)
1. 与Task: 界面风格优化2基本一致, 只是界面不同;
2. 加入在界面风格优化1中上传的下载请假文件部分, 即新增字段: 请假证明, 各栏均有下载按钮,;
3. 加入请假理由字段, 点击弹出窗口, 展示请假理由, 变量名为reason;

### Task: 界面风格优化4
![](./SourceCode/readmeDisplay/img5.png)
1. 与Task: 界面风格优化3基本一致, 只是界面不同;
---
*重要更新*
## Version Beta X  2019/06/23凌晨
### Task: 新增部分


**非常重要提示: Merge过于摧残人性, 而且之前fork过去的repo在向本仓库提交PR时都没有从upstream branch拉取最新的commit, 新的版本改动处比较多, 
因此在本次迭代时直接force push, 舍弃了之前的commit记录. 已经fork
了的仓库如果有需要, 可以尝试`git pull`, 可能需要加上`--allow_unrelated_history`或者强制pull等选项(强制从remote origin更新本地文件).**

更新日志:
---
1. admin部分的前端几个页面的优化基本完成, 其它页面修改了字段;
2. 基于@shaoxin的文件上传, 改正了一些bug, 完成了注册, 显示图片的功能, 进入首页即可看到注册, (由于oyk分支的注册编辑
没有实现文件上传), 暂时还没有merge oyk分支的编辑修改个人信息的部分 
3. 初步merge了@Alex的尾栏顶栏部分;
4. 优化了许多原始jsp文件css, html的设计, 但是原设计比较粗糙(许多语法错误, 重复的id, css, 冗余的代码), 还可以
做许多优化;

可能的下一步工作:
---
1. error page还有bug没做完: 
跳转的时候秒数没有倒计时了

2. 跳转部分还需要再优化一下, 省略一些adminMenu之类的无用
页面, 去掉几个不必要的倒计时页面.

3. 另外请假类型这个问题, 不宜显示数字, 直接显示请假原因最好;

4. 许多页面的`<title>`部分, 改成请假系统对应的部分;

5. 部分中文账号无法显示请假信息, 如欧阳凯; 而且用管理员账号登陆也无法审批欧阳凯的请假信息, 只能在"查看所有请假信息"中看到;

6. 文件组织管理: css ,js ,img分文件夹组织;

7. admin部分的页面已经优化完了, 学生部分的界面百废待兴, 但是参照着admin的来修改会很快;

8. 后台还没有处理请假理由的代码;

9. admin部分的页面还没有分栏显示头像的功能;

10. **相当重要的一点: 我们需要许多个检查错误的js/jsp代码(非常简单但是绝对需要), 包括检查请假日期是否合法,
检查注册时用户名或其他涉及到数据库约束的部分等有无重复.** 


11. 登录要把管理员用户区分开, 登陆界面的前端, 顶栏, 用户头像, 退出按钮这些还没做;
12. 个人资料编辑部分还没有merge;

