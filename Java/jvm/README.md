# JVM性能调优

## 一、JVM内存模型及垃圾收集算法
### 1.根据Java虚拟机规范，JVM将内存划分为：
- New（年轻代)[启动分配堆内存]（-Xmx:3G）
   年轻代用来存放JVM刚分配的Java对象
   - Eden：Eden用来存放JVM刚分配的对象
   - Survivor1
   - Survivro2：两个Survivor空间一样大，当Eden中的对象经过垃圾回收没有被回收掉时，会在两个Survivor之间来回Copy，当满足某个条件，比如Copy次数，就会被Copy到Tenured。显然，Survivor只是增加了对象在年轻代中的逗留时间，增加了被垃圾回收的可能性。
- Tenured（年老代）[启动分配堆内存]（-Xmx:3G）
- 永久代（Perm）[JVM分配内存] （-XX:PermSize -XX:MaxPermSize）

###  2.垃圾回收算法
垃圾回收算法可以分为三类，都基于标记-清除（复制）算法：
- Serial算法（单线程）
- 并行算法
- 并发算法 
    
  
 #### 网站材料
 [内存管理机制][1]
 
 [1]:  https://www.cnblogs.com/KingIceMou/p/6967129.html