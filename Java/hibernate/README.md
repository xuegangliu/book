## Hibernate 

### 主键生成策略：（各个策略看数据库是否支持）
- 1.assigned 自定义主键值，需要赋值
- 2.increment 获取最大值，加1，在单服务环境可以使用
- 3.hilo 数据库生成1张表进行维护
- 4.seqhilo 数据库序列方式
- 5.sequence 按数据库序列
- 6.identity 自增
- 7.native 自动选择一种方式
- 8.uuid 计算机生成的唯一id
- 9.guid 全球唯一标识
- 10.foreign 设主键为另外表的主键
- 11.select 触发器生成主键机制

### 缓存策略
- 一级缓存：Session缓存（会话级缓存）【evict(),clear() 处理缓存】
- 二级缓存：全局缓存

### cascade：【对象相关联后，操作一个对相关联的影响】
- 1.all 
- 2.none 
- 3.save-update 
- 4.all-delete-orphan
### inverse：【有级联时，一方设置了inverse=false，这方级联生效（保存自己的时候，将会保存级联的对象）】

### session：（一级缓存与快照）
session操作对象是将对象放入一级缓存（数据库执行）、并创建一个对象快照【下次对象改变与快照的对象进行对比，对象不一样session进行更新操作，一级缓存对象不存在的话，不执行】
状态：瞬时状态transient【new出来的对象，还没加到session缓存中】、持久状态persistent【加到session缓存中，数据库中可能执行完，可能还没有执行】、游离状态detached【在session缓存中移除】

### HQL语句
- 有参数的语句时，参数下标从0开始【在jdbc中，setParameter的下标是从1开始的，而hibernate的setParameter的下标是从0开始的。】
参数可以按别名传入【:properties】

- 原生SQL：Session.createSQLQuery()

### 拦截器：实现org.hibernate.Interceptor

### 并发策略
- Transactional
- Read-write
- Nonstrict-read-write
- Read-only

### Hibernate核心接口
- session负责对持久化对象CRUD
- sessionFactory 负责初始化hibernate，创建SessionFactory
- configuration 负责配置并启动hibernate，创建SessionFactory
- Transaction 负责事物相关操作
- Query和Criteria 负责执行各种数据库查询
