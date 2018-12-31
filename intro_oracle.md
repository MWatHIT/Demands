### Oracle11g常用数据字典

Oracle数据字典的名称由前缀和后缀组成，使用_连接，含义说明如下：

　　dba_:包含数据库实例的所有对象信息

　　|v$_:当前实例的动态视图，包含系统管理和系统优化等所使用的视图

　   user_:记录用户的对象信息

　　gv_：分布式环境下所有实例的动态视图，包括系统管理和系统优化使用的视图

　　all_:记录用户的对象信息机被授权访问的对象信息  



基本数据字典

　　描述逻辑存储结构和物理存储结构的数据表，还包括描述其他数据对象信息的表：

|数据字典名称　| 	说明　
|:----:|----|
|dba_tablespaces 	|关于表空间的信息|
|dba_ts_quotas 	|所有用户表空间限额|
|dba_free_space 	|所有表空间中的自由分区|
|dba_segments　　 |	描述数据库中所有段的存储空间|
|dba_extents 	|数据库中所有分区的信息|
|dba_tables |	数据库中所有数据表的描述|
|dba_tab_columns 	|所有表、视图以及簇的列|
|dba_views |	数据库中所有视图的信息|
|dba_synonyms |	关于同义词的信息|
|dba_sequences 	|所有用户序列信息|
|dba_constraints 	|所有用户表的约束信息|
|dba_indexs |	数据表中所有索引的描述|
|dba_ind_columns |	所有表及簇上压缩索引的列|
|dba_triggers 	|所有用户的触发器信息|
|dba_source |	所有用户存储过程信息|
|dba_data_files |	查询关于数据库文件的信息|
|dba_tab_grants/privs| 	查询关于对象授权的信息|
|dba_objects |	数据库所有对象|
|dba_users |	关于数据库中所有用户的信息|



常用动态性能视图

　　提供了关于内存和磁盘的运行情况，用户只能进行只读而不能修改它们

|数据字典名称　　| 	说明|
|:----:|----|
|v$database |	描述关于数据库的相关信息|
|v$datafile |	数据库使用的数据文件信息|
|v$log 	|从控制文件中提取有关重做日志组的信息|
|v$logfile |	有关实例重置日志组文件名及其位置的信息|
|v$archived_log |	记录归档日志文件的基本信息|
|v$archived_dest |	记录归档日志文件的路径信息|
|v$controlfile |	描述控制文件的相关信息|
|v$instance 	|记录实例的基本信息|
|v$system_parameter |	显示实例当前有效的参数信息|
|v$sga 	|显示实例的SGA区大小
|v$sgastat 	|统计SGA使用情况的信息|
|v$parameter　　 |	记录初始化参数文件中所有项的值|
|v$lock 	|通过访问数据库会话，设置对象锁的所有信息|
|v$session 	|有个会话的信息|
|v$sql 	|记录SQL语句的详细信息|
|v$sqltext |	记录SQL语句的语句信息|
|v$bgprocess |	显示后台进程信息|
|v$process 	|当前进程的信息|
