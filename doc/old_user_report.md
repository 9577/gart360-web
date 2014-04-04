##用户数据处理


<b>未激活或已删除用户(2612)</b>

* select uid, username, email from art_users where status = 0 or status = 1;
* delete from art_users where status=0 or status = 1;



<b>非正常注册</b>

ip地址监测

* 114 / 116 (ip段为公司网络，不进行处理)


* select email, reg_ip, count(*) as num  from art_users  group by reg_ip having num>10 order by num desc;

* delete from art_users where reg_ip="";

<table>
	<tr>
		<th>ip地址</th>
		<th>地址</th>
		<th>数量</th>
	</tr>
	
	<tr>
		<td>58.248.192.*</td>
		<td>广东省广州市 联通</td>
		<td>560</td>
	</tr>
	
	<tr>
		<td>101.244.24.173</td>
		<td>上海市 长城宽带</td>
		<td>77</td>
	</tr>
	
	<tr>
		<td>203.166.165.196</td>
		<td>上海市 世纪互联</td>
		<td>56</td>
	</tr>
	
</table>

<b> 特征码 qq%@qq.com (638) </b>



* select uid, username, email from art_users where email like 'qq%@qq.com';
* delete from art_users where email like 'qq%@qq.com';

<b> 特征码 %art%@126.com(58)</b>

* select uid, username, email from art_users where email like '%art%126.com';
* delete from art_users where email like '%art%@126.com';


<b> 内部注册用户(目前不需要处理)</b>

特征码 member%@gart360.com(200)

* select uid, username, email from art_users where email like 'member%@gart360.com';
* delete from art_users where email like 'member%@gart360.com'

特征码 cshop%@gart360.com(100)

* select uid, username, email from art_users where email like 'cshop%@gart360.com';
* delete from art_users where email like 'cshop%@gart360.com'

特征码 actor%@gart360.com (100)

* select uid, username, email from art_users where email like 'actor%@gart360.com';
* delete from art_users where email like 'actor%@gart360.com'

特征码 newsman%@gart360.com (50)

* select uid, username, email from art_users where email like 'newsman%@gart360.com';
* delete from art_users where email like 'newsman%@gart360.com'

特征码 expert%@gart360.com (50)

* select uid, username, email from art_users where email like 'expert%@gart360.com';
* delete from art_users where email like 'expert%@gart360.com'







<b>数据错误用户(2)</b>

* select email, count(*) as num  from art_users  group by email having num >1;
* delete from art_users where email="";

<table>
	<tr>
		<th>邮箱</th>
		<th>数量</th>
	</tr>
	
	<tr>
		<td>380745345@qq.com</td>
		<td>2</td>
	</tr>
	
	
</table>


<b> 邮箱未验证(207)</b>

* select uid,email,username,from_unixtime(last_time) from art_users where isEmailAct=0;
* delete from art_users where isEmailAct=0;

<b>从未登陆得用户(315)</b>

* select uid,username,email, from_unixtime(last_time) from  art_users where last_time = 0;


