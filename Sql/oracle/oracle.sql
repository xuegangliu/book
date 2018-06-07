--###########  生产常用sql
----------------------------------------------------------------------
--锁表查询
SELECT object_name, machine, s.sid, s.serial#
  FROM gv$locked_object l, dba_objects o, gv$session s
 WHERE l.object_id = o.object_id
   AND l.session_id = s.sid;
--验证
SELECT 'ALTER system kill session ''' ||s.sid||','||s.serial#||''''
  FROM gv$locked_object l, dba_objects o, gv$session s
 WHERE l.object_id = o.object_id
   AND l.session_id = s.sid;
--杀掉
ALTER system kill session '2631,41719';
------------------------------------------------------------------------

--有大量数据时，快速删除字段
--alter table xxx set unused column xxxxx;
--alter table xxx drop unused columns;

--存储过程终止
--0.查询正在执行的存储过程
select *
  from v$db_object_cache
 where locks > 0
   and pins > 0
   and type = 'PROCEDURE';
--1. 在V$ACCESS视图中找到要停止进程的SID:
SELECT t.* FROM V$ACCESS t WHERE t.object='LXG_TOWERIDERR';
SELECT SID FROM V$ACCESS WHERE  object='LXG_TOWERIDERR';
--2. 在V$SESSION视图中查找到查出SID和SERIAL#
SELECT SID,SERIAL# FROM V$SESSION WHERE SID='1314';
select * from   V$SESSION;
--3. 杀掉查找出来的进程
--alter system kill session 'SID,SERIAL#'
alter system kill session '1314,63759';

--------------------------------------------------------------------------
--查询当前数据库正在执行的sql
select a.program, b.spid, c.sql_text, c.SQL_ID
  from v$session a, v$process b, v$sqlarea c
 where a.paddr = b.addr
   and a.sql_hash_value = c.hash_value
   and a.username is not null;

select * from t_region  a where a.region_id like '13__00';

------------------------------------------------------------------------------
--查看回收站的当前状态  果返回值为“on”表明回收站是启动的，“off”表明是关闭的
SELECT Value FROM V$parameter WHERE Name = 'recyclebin';
--获取回收站里的内容
SELECT * FROM RECYCLEBIN;
SELECT * FROM USER_RECYCLEBIN a order by a.createtime desc;
SELECT * FROM DBA_RECYCLEBIN a order by a.createtime desc;
--还原被删除的对象
FLASHBACK TABLE xx TO BEFORE DROP RENAME TO new_xx;
--清空回收站
PURGE TABLE xx; --清空一个特定的表
PURGE INDEX xx; --清空一个特定的索引
PURGE RECYCLEBIN; --清空回收站
DROP TABLE table PURGE;--当一个表被删除（drop）时就直接从回收站中清空

---------------------------------------------------------------------------------
--job_queue_process表示oracle能够并发的job的数量，当job_queue_process值为0时表示全部停止oracle的job
select * from v$parameter where name='job_queue_processes';
--修改job_queue_processes
--alter system set job_queue_processes = 10;

--user_jobs表结构
/*
字段（列） 类型 描述
job number 任务的唯一标示号
log_user varchar2(30) 提交任务的用户
priv_user varchar2(30) 赋予任务权限的用户
schema_user varchar2(30) 对任务作语法分析的用户模式
last_date date 最后一次成功运行任务的时间
last_sec varchar2(8) 如hh24:mm:ss格式的last_date日期的小时，分钟和秒
this_date date 正在运行任务的开始时间，如果没有运行任务则为null
this_sec varchar2(8) 如hh24:mm:ss格式的this_date日期的小时，分钟和秒
next_date date 下一次定时运行任务的时间
*/

--创建job,命令执行,返回job号
variable jobno number;--
dbms_job.submit(:jobno, --job号
 'your_procedure;',--执行的存储过程, ';'不能省略
 next_date, --下次执行时间
 'interval' --每次间隔时间，interval以天为单位
);
--1、查看定时任务的job号
select job, next_date, next_sec, failures, broken from user_jobs;
begin
 --dbms_job.run(jobno);--启动job
 --dbms.broken(123,TRUE,sysdate); --停止job–broken为boolean值
 --dbms_job.remove(123);--删除job
 --dbms_job.what(123, what);--修改要执行的操作
 --dbms_job.next_date(123, next_date);--修改间隔时间
 commit;
end;
select TRUNC(sysdate)+14/24+35/24/60 from dual;
-----------------------------------------------------------------
--创建序列
create sequence lxg_sequence
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
select lxg_sequence.currval,lxg_sequence.nextval from dual;
--修改序列
ALTER SEQUENCE lxg_sequence
INCREMENT BY 10
MAXvalue 10000
CYCLE -- 到10000后从头开始
NOCACHE ;

--------------------------------------------------------------------
create table t_lxg (lxg_id number,lxg_name varchar2(20));
create or replace trigger lxg_trigger
  before insert on t_lxg   --S_Depart 是表名
  for each row
declare
  nextid number;
begin
  IF :new.lxg_id IS NULL or :new.lxg_id=0 THEN --lxg_id是列名
    select lxg_sequence.nextval --SEQ_ID正是刚才创建的
    into nextid
    from sys.dual;
    :new.lxg_id:=nextid;
  end if;
end lxg_trigger;

--------------------------------------------------------------------------------
--Oracle约束(Constraint)
alter table t_lxg add constraint lxg_id primary key(id);--主键约束（PRIMARY KEY)
alter table t_lxg add constraint lxg_name unique(code);--唯一性约束（UNIQUE)
alter table emp modify ename not null;--非空约束（NOT NULL)
alter table emp add constraint emp_deptno_fk foreign key(deptno)
references dept (deptno)
on delete cascade;--外键约束（FOREIGN KEY）  on delete set null;
alter table emp add constraint emp_sex_ck check(sex in('男','女'));--检查约束（CHECK)

--创建索引
CREATE [UNIQUE] INDEX index_name ON table_name(column_name[,column_name…]);
--------------------------------------------------------------------------------
--创建目录
create directory lxg as '/opt/oracle/lxg';
--drop directory dump_dir;
select * from dba_directories;
--grant read,write on directory dump_dir to user01;

------------------------------------------------------------
--创建函数
create or replace function get_user return varchar2 is
  Result varchar2(50); --定义变量
begin
  select username into Result from user_users;
  return(Result); --返回值
end get_user;
--sql命令行执行
var v1 varchar2(100);
exec :v1:=get_user;
-------------------------------------------------------------
