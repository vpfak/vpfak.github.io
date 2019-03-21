<!-- #include file="inc/MainClass.asp" -->
<!--#include file="inc/pinyin.asp"-->
<%
'******************************************************************************************
' Software name: Max(马克斯) Content Management System
' Version:4.0
' Web: http://www.maxcms.net
' Author: 石头(maxcms2008@qq.com),yuet,长明,酒瓶
' Copyright (C) 2005-2009 马克斯官方 版权所有
' 法律申明：MaxCMS程序所有代码100%原创、未引入任何网上代码,对一切抄袭行为、坚决严肃追究法律责任
'******************************************************************************************

Const CONFIGPATH	="inc/config.asp"
Const INDEXPATH		="index.asp"
Const INSTALLPATH	="install.asp"
Const PLAYERJSPATH	="js/play.js"

Dim ac,go:ac=getForm("action","both"):go=getForm("go","both")
Dim gConn,gCols(1),timeStr:timeStr=ifthen(databaseType=0,"now()","getdate()")

Select Case ac
	Case "one":One
	Case "two":two
	Case "three":three
	Case "four":four
	Case else:Main
End Select
if isObject(gConn) then Set gConn=nothing

Sub Head(title,tips,step)
Dim cur(4):cur(step)=" class=""cur"""
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>站点安装 - <%=title%></title>
<meta name="robots" content="nofollow" />
<meta name="googlebot" content="nofollow" />
<style type="text/css">
body{text-align:center}p{padding:3px 0;margin:0}
hr,h3{border-bottom:1px solid #C4E1FF;color:#333;margin-top:0}
hr{height:1px}
h3{font-size:18px;font-family:"黑体";font-weight:300;text-indent:25px}

label{display: inline-block}
input{border-width:0}
.inpt{border:1px solid #CCC;height:18px;line-height:15px;width:200px;background:#F9F9F9 none}
textarea{border:1px solid;border-color:#666 #ccc #ccc #666;background:#F9F9F9;color:#333;padding:5px 1px}
#installbox{background-color:white;border:1px solid #1B76B7;margin:0 auto;width:600px;text-align:left;margin-top:2em}
.msgtitle{padding:3px 3px;color:white;font-weight:700;line-height:21px;height:25px;font-size:12px;border-bottom:1px solid #1B76B7; text-indent:3px; background-color:#1B76B7}
#msgbody{font-size:12px;line-height:25px;padding-top:1em;}
#msgbottom{text-align:center;height:20px;line-height:20px;font-size:12px;background-color:#1b76b7;color:#FFF}
.btn{margin:3px 0;padding:2px 5px;*padding:4px 5px 1px;border:1px solid;border-color:#ddd #666 #666 #ddd;background:#DDD;color:#000;cursor:pointer;vertical-align:middle}
.step{width:592px;margin:2px auto}
.step span{display:inline-block;background-color:#eee;width:146px;border:solid 1px #fff;font-size:12px;text-align:center}
.step span b{font-size:18px}
.step span.cur{background-color:#62C0FF;width:146px;color:#fff}
.ac{text-align:center}

.blue{color:blue}.fl{float:left}.fr{float:right}.clear{clear:both}
.hide{display:none}
</style>
<script type="text/javascript">
var $=function (id){return document.getElementById(id)}
</script>
</head>
<body>
<div id='installbox'>
	<div class='msgtitle'>Maxcms4.0安装向导 &gt;&gt; <%=title%></div>
	<div class="step">
		<%
			echo "<span"&cur(1)&"><b>1.</b>基本设置</span><span"&cur(2)&"><b>2.</b>数据库配置</span><span"&cur(3)&"><b>3.</b>数据库升级</span><span"&cur(4)&"><b>4.</b>完成安装</span>"
		%>
	</div>
	<div id='msgbody'>
		<h3 style="clear:both;"><%=tips%></h3>
<%
End Sub

Sub Foot
%>
	</div>
	<div id='msgbottom'>Powered By<%=siteName%></div>
</div>
</body>
</html>
<%
End Sub

Sub Main()
Head "许可协议","马克斯CMS使用许可协议",0
%>
<div class="ac"><textarea style="width:560px;border:4px solid #C8E9FF;font-size:12px;" rows="15" readonly>
&nbsp;&nbsp;&nbsp;&nbsp;在您使用本软件前，请仔细阅读以下信息。除本协议中明确赋予用户的权利、其它权利均保留。如果您不同意以下软件使用许可协议，您不应注册/下载本软件，请停止使用，并将其从您的电脑中删除。

&nbsp;&nbsp;&nbsp;&nbsp;本协议仅针对当前版本《MaxCMS》V4.0软件有效。本软件受中华人民共和国和著作权法及国际著作权条约和其它知识产权法及条约的保护，其所有知识产权归MAXCMS所有。

&nbsp;&nbsp;&nbsp;&nbsp;本软件产品（包括但不限于本软件产品中所含的任何图象、照片、动画、录像、录音、音乐、文字和附加程序(dll、exe等)）、随附的帮助材料、及本软件产品的任何副本的一切所有权和知识产权，均由MAXCMS拥有。用户不得单独复制和修改这些材料。 

&nbsp;&nbsp;&nbsp;&nbsp;用户不得对本软件产品进行反向工程（reverse engineer）、反向编译（decompile）或反汇编（disassemble），违者属于侵权行为，并自行承担由此产生的不利后果。 

&nbsp;&nbsp;&nbsp;&nbsp;本软件产品为免费软件，用户可以非商业性地下载、安装、复制和散发本软件产品。本软件不得用于从事违反中国人民共和国相关法律所禁止的活动，MAXCMS对于用户擅自使用本软件从事违法活动不承担任何责任（包括但不限于刑事责任、行政责任、民事责任）。如果需要进行商业性的销售、复制和散发，例如软件预装和捆绑，必须获得MAXCMS的授权和许可。 

&nbsp;&nbsp;&nbsp;&nbsp;鉴于用户计算机软硬件环境的差异性和复杂性，本软件所提供的各项功能并不能保证在任何情况下都能正常执行或达到用户所期望的结果。用户使用本软件所产生的一切后果，MAXCMS不承担任何责任。 

&nbsp;&nbsp;&nbsp;&nbsp;本软件具有自动升级功能，以便及时为用户提供新功能和修正软件中的BUG。同时MAXCMS保证本软件的升级模块中不含有任何旨在破坏用户计算机的数据和获取用户隐私信息的恶意代码，不含有任何跟踪、监视用户计算机和或操作行为的功能代码，不会监控用户网上、网下的行为或泄漏用户隐私。 

&nbsp;&nbsp;&nbsp;&nbsp;本软件为免费产品。MAXCMS为本软件产品提供Email/Web等形式的产品支持。电子邮件：maxcms.net@gmail.com，欢迎垂询。 

&nbsp;&nbsp;&nbsp;&nbsp;本软件经过详细的测试，但不能保证与所有的软硬件系统完全兼容。如果出现不兼容的情况，用户可通过电子邮件将情况报告MAXCMS，获得技术支持。如果无法解决兼容性问题，用户可以卸载本软件。除本软件自身的明显质量缺陷外，MAXCMS对任何因其他原因在使用本软件时可能对用户造成的损害不负责任，这些损害可能来自于与用户安装使用的其他软件的冲突，或由于不能使用本产品而造成的损害，包括（但不限于）直接或间接的个人损害、商业赢利的丧失、贸易中断、商业信息的丢失或任何其它金钱损失，不论发生何种情况。 

&nbsp;&nbsp;&nbsp;&nbsp;由于本软件产品可以通过网络等途径下载、传播，对于从非MAXCMS指定站点下载的本软件产品以及从非MAXCMS发行的介质上获得的本软件产品，MAXCMS无法保证该软件是否感染计算机病毒、是否隐藏有伪装的特洛伊木马程序或者黑客软件，不承担由此引起的直接和间接损害责任。 

&nbsp;&nbsp;&nbsp;&nbsp;如果用户在安装提示框出现时点击“是”，即表明用户信任MAXCMS，自愿选择安装本软件，并接受本协议所有条款。如果用户不接受本协议，不愿安装本软件，请点击“否”
</textarea>
	<p><input type="checkbox" id="compact" onClick="$('xy').disabled=this.checked ? '' : 'disabled';"><label for="compact">接受许可协议</label></p>
	<p><input id="xy" type="submit" class="btn" style=" width:120px;height:30px;" onclick="if($('compact').checked) location.href='?action=one';" value="开始安装" disabled="disabled"></p>
</div>
<%
Foot
End Sub

Sub One()
Head "基本设置","基本信息",1
if writeRole = false then alertMsg "您当前对网站没有写权限不能完成安装，请修改权限","":exit sub
if go="save" then
	dim rg,text:sitename = getForm("sitename","post"):siteurl=getForm("siteurl","post"):sitepath=getForm("sitepath","post")
	Set rg = mainClassObj.createObject("MainClass.template"):text=loadFile(CONFIGPATH)
	text=rg.regExpReplace(text,"sitePath=""(\S*?)""","sitePath="""&sitepath&"""")
	text=rg.regExpReplace(text,"siteName="".*""","siteName="""&siteName&"""")
	text=rg.regExpReplace(text,"siteUrl="".*""","siteUrl="""&siteUrl&"""")
	Set rg=nothing
	if InstallCreateTextFile(text,CONFIGPATH,"") then alertMsg "","?action=two"
else
	dim x:x=Request.ServerVariables("path_info"):x = split(x,"install.asp")(0):x = mid(x,2,len(x)-1)
	sitePath= x:siteUrl=Request.ServerVariables("HTTP_HOST")
%>
<div style="width:560px;margin:0 auto">
<form action="?action=<%=ac%>&go=save" method="post" enctype="application/x-www-form-urlencoded">
	<input class="inpt" type="hidden" name="sitepath" value="<%=sitePath%>" />
	<p>网站名称：<input type="text" class="inpt" name="sitename" value="<%=siteName%>" /></p>
	<p>网站地址：<input type="text" class="inpt" name="siteurl" value="<%=siteUrl%>" /> <span class="blue">(自动获取,如有误差请修改)</span></p>
	<p class="blue"><br/>注意：安装Maxcms4.0，需要将网站目录设置修改、写入权限。</p>
	<p><input type="button" class="btn fl" value="&lt;&lt;上一步" onclick="location.href='?action=main';"/><input type="submit" class="btn fr" value="下一步&gt;&gt;"/></p>
	<div class="clear"><br/></div>
</form>
</div>
<%
end if
Foot
End Sub

Sub two()
Head "数据库配置","数据库连接配置",2
if go="save" then
	DataBase
else
	Dim x(1),y(1),z:x(databaseType)=" selected":y(databaseType)=" class=""hide"""
	if not isExistFile(accessFilePath) then
		z=split(accessFilePath,"/")
		if ubound(z)>2 then
			z(1)=sitepath
		else
			z(0)="/"&sitepath
		end if
		accessFilePath=replace(join(z,"/"),"//","/")
	end if
%>
<div style="width:560px;margin:0 auto">
<form action="?action=<%=ac%>&go=save" method="post" enctype="application/x-www-form-urlencoded">
	<p>数据库类型：<select name="databasetype" onchange="toogle()">
	<%
		echo "<option value=""0"""&x(0)&">Access</option>"
		echo "<option value=""1"""&x(1)&">MS-SqlServer</option>"
	%>
	</select></p>
	<div id="acc">
		<p>ACCESS路径：<input type="text" class="inpt" name="accessfilepath" value="<%=accessfilepath%>"/></p>
		<p><span class="blue">1.程序安装在根目录下： /inc/datas.asp</span></p>
		<p><span class="blue">2.二级目录下： /二级目录名/inc/datas.asp</span></p>
	</div>
	<div id="sql">
		<p>服务器名称：<input class="inpt" type="text" name="databaseserver" value="<%=databaseServer%>" /> <font color=red>*</font>SQL服务器IP地址或名称</p>
		<p>数据库名称：<input class="inpt" type="text" name="databasename" value="<%=databaseName%>" /></p>
		<p>数据表用户：<input class="inpt" type="text" name="tableuser" value="<%=tableuser%>" /> 可不填,只有迁服务器时还原备份的表才带有表用户</p>
		<p>数据库帐号：<input class="inpt" type="text" name="databaseuser" value="<%=databaseUser%>" /></p>
		<p>数据库密码：<input class="inpt" type="text" name="databasepwd" value="<%=databasePwd%>" /></p>
		<p><span class="blue">(新手建议使用ACCESS数据库；SqlServer适合有一定基础的站长)</span></p>
	</div>
	<p><input type="button" class="btn fl" value="&lt;&lt;上一步" onclick="location.href='?action=one';"/><input type="submit" class="btn fr" value="下一步&gt;&gt;"/></p>
	<div class="clear"><br/></div>
</form>
</div>
<script type="text/javascript">
function toogle(){
	var x=document.getElementsByName('databasetype')[0],id=['acc','sql'];
	for(var i=0;i<id.length;i++){
		$(id[i]).style.display = i!=x.selectedIndex? 'none' : '';
	}
}
toogle();
</script>
<%
end if
Foot
End Sub

Sub three()
Dim i:Head "校验数据库","数据库升级",3
echo "<div style=""width:560px;margin:0 auto""><textarea style=""width:552px;border:4px solid #C8E9FF;font-size:12px;"" rows=""15"" readonly>"

'on error resume next:err.clear
if not isNumeric(go) then
	for i=0 to 2
		Select Case i
			Case 0:CreateTable
			Case 1:CreateField
			Case 2:CreateIndexs
			Case else:exit for
		End Select
		if err then echo "错误：" & err.description:exit for
	next
end if
if go<>"0" then DoUPDATA

echo "</textarea><p><input type=""button"" class=""btn fl"" value=""&lt;&lt;上一步"" onclick=""location.href='?action=two';""/><input type=""button"" class=""btn fr"" value=""下一步&gt;&gt;"" onclick="""&ifthen(err.number<>0,"alert('升级数据库过程中发现错误，请检查');","location.href='?action=four';")&"""/></p><div class=""clear""><br/></div></div>"
if go<>"0" then echo "<script type=""text/javascript"">window.setTimeout(function (){location.href='?action=three&go="&go&"'},1000);</script>"
Foot
End Sub

Sub four()
dim rs:Head "完成安装","完成安装",4
if go="save" then
	Dim un,p1,p2,sitemode,playermode,text,rg:un=getForm("un","post"):p1=getForm("pw1","post"):p2=getForm("pw2","post"):sitemode=getForm("sitemode","post"):playermode=getForm("playermode","post")
	if isNul(sitemode) or isNul(playermode) then alertMsg "请选择网站模式和播放模式","":last:die ""
	if isNul(un) then alertMsg "管理账号不能为空","":last:die ""
	if isNul(p1) then alertMsg "管理密码不能为空","":last:die ""
	if p1<>p2 then alertMsg "两次输入密码不一致","":last:die ""
	set rs=conn.db("SELECT * FROM m_manager WHERE m_username='"&un&"'","records3")
	if rs.eof then
		rs.addnew
		rs("m_username")=un:rs("m_level")=0:rs("m_state")=1
	end if
	rs("m_pwd")=md5(p1,32)
	rs.update
	rs.close:set rs=nothing
	Set rg = mainClassObj.createObject("MainClass.template")
	text=loadFile(CONFIGPATH)
	text=rg.regExpReplace(text,"runMode=""(\S+?)"""&vbcrlf,"runMode="""&sitemode&""""&vbcrlf)
	text=rg.regExpReplace(text,"gbookPwd=""(\S+?)"""&vbcrlf,"gbookPwd="""&replaceStr(p1,"""","")&""""&vbcrlf)
	InstallCreateTextFile text,CONFIGPATH,""

	text=loadFile(PLAYERJSPATH)
	text=rg.regExpReplace(text,"var\sautoPlay=""\d+"";","var autoPlay="""&playermode&""";")
	InstallCreateTextFile text,PLAYERJSPATH,""

	text=loadFile(INDEXPATH)
	text=rg.regExpReplace(text,"<"&"%"&vbcrlf&"alertMsg ""请先安装程序，正在跳转到安装文件""\,""install\.asp""","<"&"%")
	InstallCreateTextFile text,INDEXPATH,""

	text=loadFile(INSTALLPATH)
	text=rg.regExpReplace(text,"-->"&vbcrlf&"<"&"%"&vbcrlf,"-->"&vbcrlf&"<"&"%"&vbcrlf&"die ""暂停安装<br>(*^__^*) ……您已经安装过了，如需要再次安装，请删除该文件的第三行代码即可"""&vbcrlf)
	InstallCreateTextFile text,INSTALLPATH,""
	set rg=nothing
	echo "<div style=""width:300px;height:50px;margin:50px auto""><p><input type=""button"" class=""btn"" style=""width:120px;height:30px;"" value=""进入网站首页""  onclick=""javascript:location.href='index.asp';""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=""button"" class=""btn"" style=""width:120px;height:30px;"" value=""登陆网站后台""  onclick=""javascript:location.href='admin/index.asp';""/></p><br /><br /></div>"
else
	set rs = conn.db("SELECT * FROM m_manager","records1")
%>
<div style="width:560px;margin:0 auto">
<form action="?action=<%=ac%>&go=save" id="form1" method="post" enctype="application/x-www-form-urlencoded">
	<p>网站模式：<input type="radio"  name="sitemode" id="sitemode0" value="dynamic" checked/><label for="sitemode0">动态模式</label> <input type="radio"  name="sitemode" id="sitemode1" value="static"/><label for="sitemode1">静态模式</label> （<font color="blue">详细配置请登陆系统后台站点配置</font>）</p>
	<p>播放模式：<input type="radio"  name="playermode" id="m0"  value="1"/><label for="m0">站内播放器(<font color="blue">可自动播放，可连播</font>)</label> <input type="radio"  name="playermode" id="m1" value="0"/><label for="m1">站外播放器(<font color="blue">指视频站提供引用地址</font>)</label></p>
	<p>1.更多播放器参数请在网站后台的<font color="red">"播放器设置"</font>中修改</p>
	<hr/>
<%
	if not rs.eof then
		echo "<p>选择管理账号：<select name=""un"" id=""un"">"
		do while(not rs.eof)
			echo "<option value="""&rs("m_username")&""">"&rs("m_username")&"</option>"
			rs.movenext
		loop
		echo "</select></p>"
	else
		echo "<p>设置管理账号：<input class=""inpt"" type=""text"" name=""un"" id=""un"" value="""" /></p>"
	end if
	rs.close:set rs=nothing
%>
	<p>设置管理密码：<input class="inpt" type="password" name="pw1" id="pw1" value="" /></p>
	<p>确认管理密码：<input class="inpt" type="password" name="pw2" id="pw2" value="" /></p>
	<p><input type="button" class="btn fl" value="&lt;&lt;上一步" onclick="location.href='?action=three';"/><input type="button" class="btn fr" value="完成安装" onclick="chform()"/></p>
	<div class="clear"><br/></div>
</form>
</div>
<script type="text/javascript">
function chform(){
	var un=$('un'),val=un.nodeName.toUpperCase() == 'SELECT' ? un.options[un.selectedIndex].value: un.value,p1=$('pw1').value,p2=$('pw2').value;
	if(!$('m0').checked && !$('m1').checked){
		$('m1').parentNode.style.backgroundColor='#eee';
		alert('请选择播放模式');
	}else if(val.replace(/(^\s*)|(\s*$)/ig,'')==''){
		alert('管理账号不能为空');
	}else if(p1==''){
		alert('管理密码不能为空');
	}else if(p1!=p2){
		alert('两次输入密码不一致');
	}else{
		$('form1').submit();
	}
}
</script>
<%
end if
Foot
End Sub


Sub DataBase
Dim dt,ap,ip,db,tu,du,dp:dt=getForm("databasetype","post"):ap=getForm("accessfilepath","post"):ip=getForm("databaseserver","post"):db=getForm("databasename","post"):tu=getForm("tableuser","post"):du=getForm("databaseuser","post"):dp=getForm("databasepwd","post")
Dim rg,text:databaseType=Cint(dt)
	Select Case databaseType
		Case 0:
			if isNul(ap) then alertMsg "Access数据库地址不能为空","":last:exit sub
			if not isExistFile(accessFilePath) then accessFilePath=ap
			if accessFilePath<>ap then
				if isExistFile(accessFilePath) AND not isExistFile(ap) then moveFile accessFilePath,ap,"del"
				accessFilePath=ap
			end if
			if not isExistFile(accessFilePath) then CreateDataBase
			Set rg = mainClassObj.createObject("MainClass.template"):text=loadFile(CONFIGPATH)
			text=rg.regExpReplace(text,"databaseType=(\S*\d?)","databaseType="&dt&"")
			text=rg.regExpReplace(text,"accessFilePath=""\S*""","accessFilePath="""& accessFilePath &"""")
			Set rg=nothing
			if InstallCreateTextFile(text,CONFIGPATH,"") then alertMsg "","?action=three"
		Case 1:
			if isNul(ip) then alertMsg "SQL服务器地址不能为空","":last:exit sub
			if isNul(db) then alertMsg "SQL数据库名不能为空","":last:exit sub
			if isNul(du) then alertMsg "SQL数据库用户名不能为空","":last:exit sub
			on error resume next
			Dim CC,e:Set CC=Server.CreateObject(CONN_OBJ_NAME)
			CC.ConnectionTimeout=3:CC.open "Provider=Sqloledb;Data Source="&ip&";Initial Catalog="&db&";User ID="&du&";Password="&dp&";"
			if CC.Errors.count>0 then
				e=CC.Errors(0).NativeError:CC.close:Set CC = nothing
				Select Case e
					Case "17":alertMsg "服务器名称错误","":last
					Case "4060":databaseServer=ip:databaseName=db:databaseUser=du:databasePwd=dp:on error goto 0:CreateDataBase			'alertMsg "数据库名称错误",""
					Case "18456":alertMsg "数据库帐号或密码错误","":last
					Case else:alertMsg "SQL 数据库设置错误","":last
				End Select
			else
				CC.close:Set CC = nothing
			end if
			Set rg = mainClassObj.createObject("MainClass.template"):text=loadFile(CONFIGPATH)
			text=rg.regExpReplace(text,"databaseType=(\S*\d?)","databaseType="&dt&"")
			text=rg.regExpReplace(text,"databaseServer=""\S*""","databaseServer="""& ip &"""")
			text=rg.regExpReplace(text,"databaseName=""\S*""","databaseName="""& db &"""")
			text=rg.regExpReplace(text,"tableUser=""\S*""","tableUser="""& tu &"""")
			text=rg.regExpReplace(text,"databaseUser=""\S*""","databaseUser="""& du &"""")
			text=rg.regExpReplace(text,"databasePwd=""\S*""","databasePwd="""& dp &"""")
			Set rg=nothing
			if InstallCreateTextFile(text,CONFIGPATH,"") then alertMsg "","?action=three"
	End Select
End Sub

Function InstallCreateTextFile(Byval content,Byval fileDir,Byval code)
	dim errid,errdes,fileobj,fileCode : fileDir=replace(fileDir, "\", "/")
	if isNul(code) then fileCode="gbk" else fileCode=code
	call createfolder(fileDir,"filedir")
	on error resume next:err.clear
	set fileobj=objFso.CreateTextFile(server.mappath(fileDir),True)
	if IsObject(fileobj) then fileobj.Write(content):set fileobj=nothing
	if err or not isNul(code) then
		errid=err.number:errdes=err.description:err.clear
		With objStream
			.Charset=fileCode:.Type=2:.Mode=3:.Open:.Position=0
			.WriteText content:.SaveToFile Server.MapPath(fileDir), 2
			.Close
		End With
	end if
	if err Then
		dim h:h=LCase(Hex(err.number)):InstallCreateTextFile=false
		echo "<font face=""宋体"" size=2>"&vbcrlf&_
		"<p>Microsoft VBScript 运行时错误</font> <font face=""宋体"" size=2>错误 '800a"&Left("0000",4-Len(h))&h&"'</font>"&vbcrlf&_
		"<p>"&vbcrlf&_
		"<font face=""宋体"" size=2>FSO:"&errid&" "&errdes&"</font>"&vbcrlf&_
		"<p>"&vbcrlf&_
		"<font face=""宋体"" size=2>STM:"&err.number&" "&err.description&"</font>"&vbcrlf&_
		"<p>"&vbcrlf&_
		"<font face=""宋体"" size=2>解决方法: 检查inc/config.asp文件属性，不能为只读，请设置网站目录的写入权限</font>"&vbcrlf
	else
		InstallCreateTextFile=true
	end if
	err.clear
End Function

'-----------------------------------------
'升级数据库必需函数
'-----------------------------------------

Function getConn()
	if Not isObject(gConn) then
		Dim connStr
		if databaseType=1 then
			connStr="Provider=Sqloledb;Data Source="&databaseServer&";Initial Catalog="&databaseName&";User ID="&databaseUser&";Password="&databasePwd&";"
		elseif databaseType=0 then
			connStr="Provider=Microsoft.Jet.OLEdb.4.0;Data Source="&server.mappath(accessFilePath)
		end if
		set gConn=server.CreateObject(CONN_OBJ_NAME)
		gConn.open connStr
	end if
	SET getConn=gConn
End Function

Function GetAllColumnName(ByVal table)
	if gCols(0)<>table then
		dim rsObj,i,ret:ret=" ,":set rsObj = conn.db("select top 1 * from m_"&table&" where 1=1","records1")
		for i=0 to rsObj.Fields.count-1:ret=ret&rsObj.Fields(i).name&",":next
		rsObj.close:set rsObj = nothing:gCols(1)=ret:gCols(0)=table
	end if
	GetAllColumnName=gCols(1)
End Function

Function isExistTable(tName)
	dim tables:set tables = getConn().OpenSchema(20,array(empty,empty,tName,"table")):isExistTable=tables.eof = false:set tables = nothing
End Function

Function isExistField(ByVal stable,ByVal sCol)
	isExistField=InStr(GetAllColumnName(stable),","&sCol&",")>0
End Function

Function isExistIndex(tName,sIndexName)
	Dim Indexs:SET Indexs=getConn().OpenSchema(12,array(empty,empty,sIndexName,empty,tName)):isExistIndex=Indexs.eof = false:SET Indexs=Nothing
End Function

Sub CreateDataBase
	Dim x
	if databaseType=0 then
		SET x=Server.CreateObject("ADOX.Catalog"):x.Create "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath(accessFilePath):SET x=Nothing
	else
		set x=server.CreateObject(CONN_OBJ_NAME)
		x.ConnectionTimeout=3:x.open "Provider=Sqloledb;Data Source="&databaseServer&";Initial Catalog=;User ID="&databaseUser&";Password="&databasePwd&";"
		x.execute "CREATE DATABASE "&databaseName
		on error resume next
		x.execute "ALTER DATABASE "&databaseName&" MODIFY FILE(NAME = "&databaseName&"_log,MAXSIZE = 100 MB)"
		x.close:SET x=Nothing:err.clear
	end if
End Sub

Sub CreateTable()
	if not isExistTable("m_manager") then
	getConn().execute "create table m_manager(m_id  int identity(1,1) not null  primary key,m_username varchar(20),m_pwd varchar(50),m_state tinyint default 1,m_logintime datetime ,m_loginip varchar(15),m_level tinyint  default 0,m_random varchar(40))"
	echo "创建数据表 m_manager" & vbcrlf
	end if

	if not isExistTable("m_data") then
	getConn().execute "create table m_data(m_id  int identity(1,1) not null primary key,m_name varchar(120),m_type int default 0,m_state int default 0,m_pic varchar(200),m_hit int default 0,m_digg int default 0,m_actor varchar(255),m_note text,m_des text,m_topic int default 0,m_color varchar(10),m_commend tinyint default 0,m_wrong tinyint default 0,m_addtime datetime default "&timeStr&",m_publishyear int default 0,m_publisharea varchar(20),m_playdata text,m_downdata text,m_isunion tinyint default 0,m_letter varchar(1),m_keyword text,m_tread int default 0,m_director varchar(50),m_lang varchar(30),m_dayhit int default 0,m_weekhit int default 0,m_monthhit int default 0,m_enname varchar(120),m_datetime datetime default "&timeStr&",m_recycle tinyint default 0,m_score int default 0)"
	echo "创建数据表 m_data" & vbcrlf
	end if

	if not isExistTable("m_news") then
	getConn().execute "create table m_news(m_id int identity(1,1) not null primary key,m_type int default 0,m_vid int default 0,m_title varchar(255),m_author varchar(80),m_color varchar(20),m_pic varchar(200),m_from varchar(50),m_keyword text,m_outline text,m_content text,m_commend tinyint default 0,m_hit int default 0,m_dayhit int default 0,m_weekhit int default 0,m_monthhit int default 0,m_note tinyint default 0,m_topic int default 0,m_digg int default 0,m_tread int default 0,m_entitle varchar(120),m_letter varchar(1),m_addtime datetime default "&timeStr&",m_datetime datetime default "&timeStr&",m_recycle tinyint default 0,m_score int default 0)"
	echo "创建数据表 m_news" & vbcrlf
	end if

	if not isExistTable("m_type") then
	getConn().execute "create table m_type(m_id int identity(1,1) not null primary key,m_name varchar(60),m_enname varchar(40),m_sort int default 0,m_upid int default 0,m_hide tinyint default 0,m_template varchar(150),m_unionid varchar(255),m_keyword text,m_description text,m_type tinyint default 0,m_subtemplate varchar(150))"
	echo "创建数据表 m_type" & vbcrlf
	end if

	if not isExistTable("m_link") then
	getConn().execute "create table m_link(m_id int identity(1,1) not null primary key,m_type varchar(10),m_name varchar(100),m_pic varchar(200),m_url varchar(200),m_des varchar(255),m_sort int  default 0)"
	echo "创建数据表 m_link" & vbcrlf
	end if

	if not isExistTable("m_selflabel") then
	getConn().execute "create table m_selflabel(m_id int identity(1,1) not null primary key,m_name varchar(40),m_content text,m_des varchar(255),m_addtime datetime default "&timeStr&")"
	getConn().execute "INSERT INTO m_selflabel (m_name,m_content,m_des)VALUES('areasearch','','地区搜索')"
	getConn().execute "INSERT INTO m_selflabel (m_name,m_content,m_des)VALUES('yearsearch','','按发行年份查看电影')"
	getConn().execute "INSERT INTO m_selflabel (m_name,m_content,m_des)VALUES('actorsearch','','演员名字')"
	getConn().execute "INSERT INTO m_selflabel (m_name,m_content,m_des)VALUES('nav_bottom_banner','','导航栏下方通栏广告')"
	echo "创建数据表 m_selflabel" & vbcrlf
	end if

	if not isExistTable("m_topic") then
	getConn().execute "create table m_topic(m_id int identity(1,1) not null primary key,m_name varchar(100),m_sort int default 0,m_template varchar(255),m_enname varchar(60),m_pic varchar(255),m_des text)"
	echo "创建数据表 m_topic" & vbcrlf
	end if

	if not isExistTable("m_ads") then
	getConn().execute "create table m_ads(m_id int identity(1,1) not null primary key,m_name varchar(100),m_enname varchar(60),m_des varchar(255),m_content text,m_addtime datetime default "&timeStr&")"
	echo "创建数据表 m_ads" & vbcrlf
	end if

	if not isExistTable("m_info") then
	getConn().execute "create table m_info(m_id int identity(1,1) not null primary key,m_author varchar(80),m_title varchar(255),m_type varchar(20),m_videoid int default 0,m_content text,m_ip varchar(20),m_addtime datetime default "&timeStr&",m_color varchar(20),m_hit int default 0)"
	echo "创建数据表 m_info" & vbcrlf
	end if

	if not isExistTable("m_review") then
	getConn().execute "create table m_review(m_id int identity(1,1) not null primary key,m_author varchar(80),m_type tinyint default 0,m_videoid int default 0,m_content text,m_ip varchar(20),m_addtime datetime default "&timeStr&",m_reply int default 0,m_agree int default 0,m_anti int default 0,m_pic text,m_vote int default 0,m_check tinyint default 0)"
	echo "创建数据表 m_review" & vbcrlf
	end if

	if not isExistTable("m_leaveword") then
	getConn().execute "create table m_leaveword(m_id int identity(1,1) not null primary key,m_replyid int default 0,m_author varchar(80),m_qq varchar(30),m_mail varchar(50),m_content text,m_ip varchar(20),m_addtime datetime default "&timeStr&")"
	echo "创建数据表 m_leaveword" & vbcrlf
	end if

	if not isExistTable("m_temp") then
	getConn().execute "create table m_temp(m_id int identity(1,1) not null primary key,m_name varchar(120),m_type int default 0,m_state int default 0,m_pic varchar(200),m_actor varchar(255),m_des text,m_addtime datetime default "&timeStr&",m_playdata text,m_publishyear int default 0,m_publisharea varchar(50),m_director varchar(50),m_lang varchar(30))"
	echo "创建数据表 m_temp" & vbcrlf
	end if

	if not isExistTable("nodownload") AND databaseType=0 then
		getConn().execute "create table nodownload(notdown image)"
		getConn().execute "insert into nodownload (notdown) values ('┼氠潯┼')"
		echo "创建数据表 nodownload" & vbcrlf
	end if
End Sub

Sub CreateField
	if isExistField("data","m_keyword")=false then getConn().execute "ALTER TABLE m_data ADD m_keyword text":getConn().execute "UPDATE m_data SET m_keyword=''":echo "新增字段 m_data.m_keyword" & vbcrlf
	if isExistField("data","m_letter")=false then getConn().execute "ALTER TABLE m_data ADD m_letter varchar(1)":getConn().execute "UPDATE m_data SET m_letter=''":echo "新增字段 m_data.m_letter" & vbcrlf
	if isExistField("data","m_enname")=false then getConn().execute "ALTER TABLE m_data ADD m_enname varchar(120)":getConn().execute "UPDATE m_data SET m_enname=''":echo "新增字段 m_data.m_enname" & vbcrlf
	if isExistField("data","m_director")=false then getConn().execute "ALTER TABLE m_data ADD m_director varchar(50)":getConn().execute "UPDATE m_data SET m_director=''":echo "新增字段 m_data.m_director" & vbcrlf
	if isExistField("data","m_lang")=false then getConn().execute "ALTER TABLE m_data ADD m_lang varchar(30)":getConn().execute "UPDATE m_data SET m_lang=''":echo "新增字段 m_data.m_lang" & vbcrlf
	if isExistField("data","m_tread")=false then getConn().execute "ALTER TABLE m_data ADD m_tread int default 0":getConn().execute "UPDATE m_data SET m_tread=0":echo "新增字段 m_data.m_tread" & vbcrlf
	if isExistField("data","m_dayhit")=false then getConn().execute "ALTER TABLE m_data ADD m_dayhit int default 0":getConn().execute "UPDATE m_data SET m_dayhit=0":echo "新增字段 m_data.m_dayhit" & vbcrlf
	if isExistField("data","m_weekhit")=false then getConn().execute "ALTER TABLE m_data ADD m_weekhit int default 0":getConn().execute "UPDATE m_data SET m_weekhit=0":echo "新增字段 m_data.m_weekhit" & vbcrlf
	if isExistField("data","m_monthhit")=false then getConn().execute "ALTER TABLE m_data ADD m_monthhit int default 0":getConn().execute "UPDATE m_data SET m_monthhit=0":echo "新增字段 m_data.m_monthhit" & vbcrlf
	if isExistField("data","m_datetime")=false then getConn().execute "ALTER TABLE m_data ADD m_datetime datetime default "&timeStr&"":getConn().execute "UPDATE m_data SET m_datetime=m_addtime":echo "新增字段 m_data.m_datetime" & vbcrlf
	if isExistField("data","m_recycle")=false then getConn().execute "ALTER TABLE m_data ADD m_recycle tinyint default 0":getConn().execute "UPDATE m_data SET m_recycle=0":echo "新增字段 m_data.m_recycle" & vbcrlf
	if isExistField("data","m_score")=false then getConn().execute "ALTER TABLE m_data ADD m_score int default 0":getConn().execute "UPDATE m_data SET m_score=0":echo "新增字段 m_data.m_score" & vbcrlf

	if isExistField("temp","m_director")=false then getConn().execute "ALTER TABLE m_temp ADD m_director varchar(50)":getConn().execute "UPDATE m_temp SET m_director=''":echo "新增字段 m_temp.m_director" & vbcrlf
	if isExistField("temp","m_lang")=false then getConn().execute "ALTER TABLE m_temp ADD m_lang varchar(30)":getConn().execute "UPDATE m_temp SET m_lang=''":echo "新增字段 m_temp.m_lang" & vbcrlf

	if isExistField("type","m_type")=false then getConn().execute "ALTER TABLE m_type ADD m_type tinyint default 0":getConn().execute "UPDATE m_type SET m_type=0":echo "新增字段 m_type.m_type" & vbcrlf
	if isExistField("type","m_keyword")=false then getConn().execute "ALTER TABLE m_type ADD m_keyword text":echo "新增字段 m_type.m_keyword" & vbcrlf
	if isExistField("type","m_description")=false then getConn().execute "ALTER TABLE m_type ADD m_description text":echo "新增字段 m_type.m_description" & vbcrlf
	if isExistField("type","m_subtemplate")=false then getConn().execute "ALTER TABLE m_type ADD m_subtemplate varchar(150)":getConn().execute "UPDATE m_type SET m_subtemplate='content.html' WHERE m_type=0":getConn().execute "UPDATE m_type SET m_subtemplate='news.html' WHERE m_type=1":echo "新增字段 m_type.m_subtemplate" & vbcrlf

	if isExistField("info","m_hit")=false then getConn().execute "ALTER TABLE m_info ADD m_hit int default 0":getConn().execute "UPDATE m_info SET m_hit =0 where m_type='news'":echo "新增字段 m_info.m_hit" & vbcrlf
End Sub

Sub CreateIndexs
	if Not isExistIndex("m_data","m_type") then getConn().execute "CREATE INDEX m_type ON m_data (m_type)":echo "创建索引 m_data.m_type" & vbcrlf
	if Not isExistIndex("m_data","m_topic") then getConn().execute "CREATE INDEX m_topic ON m_data (m_topic)":echo "创建索引 m_data.m_topic" & vbcrlf
	if Not isExistIndex("m_data","m_commend") then getConn().execute "CREATE INDEX m_commend ON m_data (m_commend)":echo "创建索引 m_data.m_commend" & vbcrlf
	if Not isExistIndex("m_data","m_wrong") then getConn().execute "CREATE INDEX m_wrong ON m_data (m_wrong)":echo "创建索引 m_data.m_wrong" & vbcrlf
	if Not isExistIndex("m_data","m_letter") then getConn().execute "CREATE INDEX m_letter ON m_data (m_letter)":echo "创建索引 m_data.m_letter" & vbcrlf
	if Not isExistIndex("m_data","m_recycle") then getConn().execute "CREATE INDEX m_recycle ON m_data (m_recycle)":echo "创建索引 m_data.m_recycle" & vbcrlf

	if Not isExistIndex("m_news","m_type") then getConn().execute "CREATE INDEX m_type ON m_news (m_type)":echo "创建索引 m_news.m_type" & vbcrlf
	if Not isExistIndex("m_news","m_vid") then getConn().execute "CREATE INDEX m_vid ON m_news (m_vid)":echo "创建索引 m_news.m_vid" & vbcrlf
	if Not isExistIndex("m_news","m_topic") then getConn().execute "CREATE INDEX m_topic ON m_news (m_topic)":echo "创建索引 m_news.m_topic" & vbcrlf
	if Not isExistIndex("m_news","m_commend") then getConn().execute "CREATE INDEX m_commend ON m_news (m_commend)":echo "创建索引 m_news.m_commend" & vbcrlf
	if Not isExistIndex("m_news","m_letter") then getConn().execute "CREATE INDEX m_letter ON m_news (m_letter)":echo "创建索引 m_news.m_letter" & vbcrlf
	if Not isExistIndex("m_news","m_recycle") then getConn().execute "CREATE INDEX m_recycle ON m_news (m_recycle)":echo "创建索引 m_news.m_recycle" & vbcrlf

	if Not isExistIndex("m_review","m_type") then getConn().execute "CREATE INDEX m_type ON m_review (m_type)":echo "创建索引 m_review.m_type" & vbcrlf
	if Not isExistIndex("m_review","m_videoid") then getConn().execute "CREATE INDEX m_videoid ON m_review (m_videoid)":echo "创建索引 m_review.m_videoid" & vbcrlf
	if Not isExistIndex("m_review","m_reply") then getConn().execute "CREATE INDEX m_reply ON m_review (m_reply)":echo "创建索引 m_review.m_reply" & vbcrlf

	if Not isExistIndex("m_info","m_videoid") then getConn().execute "CREATE INDEX m_videoid ON m_info (m_videoid)":echo "创建索引 m_info.m_videoid" & vbcrlf
End Sub

Sub DoUPDATA()
	Dim rs,i,t,ary,conn:SET conn=getConn():SET rs=server.CreateObject(RECORDSET_OBJ_NAME)
	rs.open "SELECT top 1001 m_id,m_name FROM m_data WHERE m_enname='' OR m_letter=''",conn,1,1
	if not rs.eof then ary=rs.getRows()
	rs.close:set rs=nothing
	if isArray(ary) then
		go=UBound(ary,2)
		for i=0 to go
			t=MoviePinYin(ary(1,i)):echo ary(0,i) & "=" & t &vbcrlf
			conn.execute "UPDATE m_data SET m_enname='"&t&"',m_letter='"&left(t,1)&"' WHERE m_id="&ary(0,i)
		next
	else
		echo "....................升级完成...................." & vbcrlf:go=0
	end if
	conn.close
End Sub
%>