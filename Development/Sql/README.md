# Oracle 常用SQL

## 基本
```oracle
新建表：
    create table table1( id varchar(300) primary key, name varchar(200) not null);
插入数据   
    insert into table1 (id,name) values ('aa','bb');
更新数据   
    update table1 set id = 'bb' where id='cc';
删除数据   
    delete from table1 where id ='cc';
删除表    
    drop table table1;
修改表名： 
    alter table table1 rename to table2
表数据复制：
    insert into table1 (select * from table2);
复制表结构： 
    create table table1 select * from table2 where 1>1;
复制表结构和数据：
    create table table1 select * from table2;
复制指定字段： 
    create table table1 as select id, name from table2 where 1>1;
条件查询： 
    select id,name (case gender when 0 then '男' when 1 then ‘女’ end  ) gender from  table1 
```

## 数学函数
```oracle
    绝对值：abs()
       select abs(-2) value from dual;          --(2)
    取整函数（大）：ceil（）
       select ceil(-2.001) value from dual;       --(-2)
    取整函数（小）：floor（）
       select floor(-2.001) value from dual;       --(-3)
    取整函数（截取）：trunc（）
       select trunc(-2.001) value from dual;       -- (-2)
    四舍五入：round（）
       select round(1.234564,4) value from dual;       --(1.2346)
    取平方：Power（m,n）
       select power(4,2) value from dual;       --(16)
    取平方根:SQRT()
       select sqrt(16) value from dual;       --(4)
    取随机数:dbms_random(minvalue,maxvalue)
       select dbms_random.value() from dual;  (默认是0到1之间)
    　select dbms_random.value(2,4) value from dual;  （2-4之间随机数）
    取符号：Sign()
    　　select sign(-3) value from dual; --(-1)
    　　select sign(3) value from dual; --(1)
    取集合的最大值:greatest(value)
       select greatest(-1,3,5,7,9) value from dual;       --(9)
    取集合的最小值:least(value)
       select least(-1,3,5,7,9) value from dual;       --(-1)
    处理Null值：nvl(空值，代替值)
       select  nvl(null,10) value from dual;       --(10)
       select nvl(score,10) score from student;
```

## rownum相关
```oracle
    rownum小于某个数时可以直接作为查询条件（注意oracle不支持select top）
    select * from student where rownum <3;
    查询rownum大于某个数值,需要使用子查询，并且rownum需要有别名
    select * from(select rownum rn ,id,name from student) where rn>2;
    select * from (select rownum rn, student.* from student) where rn >3;
    区间查询
    select * from (select rownum rn, student.* from student) where rn >3 and rn<6;
    排序+前n条
    select * from (select rownum rn, t.* from ( select d.* from DJDRUVER d order  by drivernumber)t )p where p.rn<10;
    排序+区间查询1
    select * from (select rownum rn, t.* from ( select d.* from DJDRIVER d order by DJDRIVER_DRIVERTIMES)t )p where p.rn<9 and p.rn>6;
    排序+区间查询2
    select * from (select rownum rn, t.* from ( select d.* from DJDRIVER d order by DJDRIVER_DRIVERTIMES)t where rownum<9 )p where p.rn>6;--效率远高于方式一
```

## 分页查询
```oracle
    效率低
    select * from (select rownum rn, d.* from DJDRIVER d  )p where p.rn<=20 and p.rn>=10;
    select * from (select rownum rn, d.* from DJDRIVER d  )p where p.rn between 10 and 20;
    效率高 
    select * from (select rownum rn, d.* from DJDRIVER d where rownum<=20 )p where p.rn>=10;
    
    排序+区间查询1（效率低）
    select * from (select rownum rn, t.* from ( select d.* from DJDRIVER d order by DJDRIVER_DRIVERTIMES)t )p where p.rn<=20 and p.rn>=10;
    select * from (select rownum rn, t.* from ( select d.* from DJDRIVER d order by DJDRIVER_DRIVERTIMES)t )p where p.rn between 10 and 20;
    排序+区间查询2（效率高） 
    select * from (select rownum rn, t.* from ( select d.* from DJDRIVER d order by DJDRIVER_DRIVERTIMES)t where rownum<=20 )p where p.rn>=10;
```

## 时间处理
日期
年 yyyy yyy yy year
月 month mm mon month
日+星期  dd ddd(一年中第几天) dy day 
小时  hh hh24 
分 mi
秒 ss
```
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')currenttime, 
           to_char(sysdate,'yyyy') year,
           to_char(sysdate,'mm') month,
           to_char(sysdate,'dd') day,
           to_char(sysdate,'day') week,
           to_char(sysdate,'hh24')hour,
           to_char(sysdate,'mi') minute,
           to_char(sysdate,'ss') second
    from dual;
    
    months_between(to_date('03-31-2014','MM-DD-YYYY'),to_date('12-31-2013','MM-DD-YYYY')) 
    
    next_day(sysdate,6)
```


[oracle基本sql](https://www.cnblogs.com/wishyouhappy/p/3700683.html)

