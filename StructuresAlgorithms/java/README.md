# Java常用数据结构

## 几个常用类的区别：
1. ArrayList: 元素单个，效率高，多用于查询 
2. Vector: 元素单个，线程安全，多用于查询 
3. LinkedList:元素单个，多用于插入和删除 
4. HashMap: 元素成对，元素可为空 
5. HashTable: 元素成对，线程安全，元素不可为空

# Vector、ArrayList和LinkedList
    大多数情况下，从性能上来说ArrayList最好，但是当集合内的元素需要频繁插入、删除时LinkedList会有比较好的表现，但是它们三个性能都比不上数组，另外Vector是线程同步的。所以： 
    如果能用数组的时候(元素类型固定，数组长度固定)，请尽量使用数组来代替List； 
    如果没有频繁的删除插入操作，又不用考虑多线程问题，优先选择ArrayList； 
    如果在多线程条件下使用，可以考虑Vector； 
    如果需要频繁地删除插入，LinkedList就有了用武之地； 
    如果你什么都不知道，用ArrayList没错。

## Collections和Arrays 
    在 Java集合类框架里有两个类叫做Collections（注意，不是Collection！）和Arrays，这是JCF里面功能强大的工具，但初学者往往会忽视。按JCF文档的说法，这两个类提供了封装器实现（Wrapper Implementations）、数据结构算法和数组相关的应用。 
    想必大家不会忘记上面谈到的“折半查找”、“排序”等经典算法吧，Collections类提供了丰富的静态方法帮助我们轻松完成这些在数据结构课上烦人的工作： 
    binarySearch：折半查找。 
    sort：排序，这里是一种类似于快速排序的方法，效率仍然是O(n * log n)，但却是一种稳定的排序方法。 
    reverse：将线性表进行逆序操作，这个可是从前数据结构的经典考题哦！ 
    rotate：以某个元素为轴心将线性表“旋转”。 
    swap：交换一个线性表中两个元素的位置。 
    …… 
    Collections还有一个重要功能就是“封装器”（Wrapper），它提供了一些方法可以把一个集合转换成一个特殊的集合，如下： 
    unmodifiableXXX：转换成只读集合，这里XXX代表六种基本集合接口：Collection、List、Map、Set、SortedMap和SortedSet。如果你对只读集合进行插入删除操作，将会抛出UnsupportedOperationException异常。 
    synchronizedXXX：转换成同步集合。 
    singleton：创建一个仅有一个元素的集合，这里singleton生成的是单元素Set， 
    singletonList和singletonMap分别生成单元素的List和Map。 
    空集：由Collections的静态属性EMPTY_SET、EMPTY_LIST和EMPTY_MAP表示。

