﻿金碟K3 WISE ERP 账套间同步工具；

1.开启账套的EBDI；API授权，查阅API说明。

2.部分模块无法使用，请安装金蝶的补丁：PT122953、PT122970


代码大致逻辑：
1.根据金蝶提供的demo改写。

2.自动判断并获取新的token。

3.在数据库表增加触发器，保存、修改、删除、禁用操作对应会insert到同步表；
（PS：先期计划在代码前插入至同步表，但是发现金蝶K3WISE不能在序时簿中开发。最多只能做到保存前事件触发）

4.软件内置定时器，每隔一定时间，获取同步表的数据，同步至各个账套的数据中，并产生LOG。