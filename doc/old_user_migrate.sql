-- 未激活或已删除用户(2612)
delete from art_users where status=0 or status = 1;
-- 广东省广州市 联通(560)
delete from art_users where reg_ip like "58.248.192%";
-- 上海市 长城宽带 (77)  
delete from art_users where reg_ip="101.244.24.173";
-- 上海市 世纪互联(56)
delete from art_users where reg_ip="203.166.165.196";
-- 特征码 qq%@qq.com (638)
delete from art_users where email like 'qq%@qq.com';
-- 特征码 %art%@126.com(58)
delete from art_users where email like '%art%@126.com';
-- 错误数据(2)
delete from art_users where email="380745345@qq.com";
-- 邮箱未验证(207)
delete from art_users where isEmailAct=0;
-- 数据转移
insert  into users(id, email, legacy_password_hash, username, created_at, updated_at) select  uid, email, pwd, username, from_unixtime(reg_time), from_unixtime(last_time) from gart360.art_users;