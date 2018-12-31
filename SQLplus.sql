-- 创建dbf及tempdbf
CREATE TABLESPACE  parameters LOGGING DATAFILE '/home/oracle/app/oracle/oradata/emc/parameters.dbf'
SIZE 100M AUTOEXTEND ON NEXT 32M MAXSIZE 1000M EXTENT MANAGEMENT LOCAL;

create temporary tablespace parameters_tmp tempfile '/home/oracle/app/oracle/oradata/emc/parameters_tmp.dbf'
size 100m autoextend on next 32m maxsize 500m extent management local;

CREATE TABLESPACE  emclog LOGGING DATAFILE '/home/oracle/app/oracle/oradata/emc/emclog.dbf'
SIZE 100M AUTOEXTEND ON NEXT 32M MAXSIZE 1000M EXTENT MANAGEMENT LOCAL;

create temporary tablespace emclog_tmp tempfile '/home/oracle/app/oracle/oradata/emc/emclog_tmp.dbf'
size 100m autoextend on next 32m maxsize 500m extent management local;


-- 查询表空间位置:
SELECT FILE_NAME from sys.dba_data_files;
-- 查看当前用户的缺省表空间
select username,default_tablespace from user_users;
-- 查询所有表空间
select tablespace_name from dba_tablespaces;
select tablespace_name from user_tablespaces;
-- 查看表空间的名称及大小
SELECT t.tablespace_name, round(SUM(bytes / (1024 * 1024)), 0) ts_size
FROM dba_tablespaces t, dba_data_files d
WHERE t.tablespace_name = d.tablespace_name
GROUP BY t.tablespace_name;
-- 检查数据库编码
select userenv('language') from dual;
-- 修改编码
shutdown immediate;     //关闭数据库服务器
startup mount;
alter session set sql_trace=true;
alter system enable restricted session;
alter system set job_queue_processes=0;
alter system set aq_tm_processes=0;
alter database open;
alter database character set internal_use utf8;
alter session set sql_trace=false;
shutdown immediate;
startup;
---------------------
作者：Dreamer
来源：CSDN
原文：https://blog.csdn.net/LYN_BIGDREAM/article/details/7473278
版权声明：本文为博主原创文章，转载请附上博文链接！
-- emclog init
CREATE TABLE "KBDBA"."admin_logs" (
"id" INT NOT NULL ,
"adminid" VARCHAR(128) NOT NULL ,
"userid" VARCHAR(128) NOT NULL ,
"datetime" VARCHAR(128) NOT NULL ,
"ip" VARCHAR(128) NOT NULL ,
"type" INT NOT NULL ,
"level" INT NOT NULL ,
"description" VARCHAR2(128) NOT NULL ,
"result" INT NOT NULL ,
PRIMARY KEY ("id")
)
TABLESPACE EMCLOG
;

COMMENT ON COLUMN "KBDBA"."admin_logs"."id" IS '自增id'
COMMENT ON COLUMN "KBDBA"."admin_logs"."adminid" IS '管理员操作id'
COMMENT ON COLUMN "KBDBA"."admin_logs"."userid" IS '被操作的用户id'
COMMENT ON COLUMN "KBDBA"."admin_logs"."datetime" IS '操作发生时间,2018-12-12 21:12:18'
COMMENT ON COLUMN "KBDBA"."admin_logs"."ip" IS '操作端ip地址'
COMMENT ON COLUMN "KBDBA"."admin_logs"."type" IS '操作类型,0:一般行为；1:异常行为；2:违规行为'
COMMENT ON COLUMN "KBDBA"."admin_logs"."level" IS '风险等级,0:紧急；1:报警；2:关键...'
COMMENT ON COLUMN "KBDBA"."admin_logs"."description" IS '操作内容'
COMMENT ON COLUMN "KBDBA"."admin_logs"."result" IS '操作结果,0:失败;1:成功'
-- end init emclog
