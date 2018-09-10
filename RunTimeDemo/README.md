# Runtime

### 下载地址
Objective-C Runtime源码是开源的，下载地址为: https://opensource.apple.com/tarballs/objc4/

使用clang命令将OC代码转成C++代码
clang -rewrite-objc main.m

### why
Objective-C 是一门动态语言，它会将一些工作放在代码运行时才会处理而非编译时。也就是说，有一些类和成员变量在我们编译的时候是不知道的。而在运行时，我们所编写的代码会转换成完成的确定的代码运行。
因此，编译器是不够的，我们还需要一个运行时系统（Runtime system）来处理编译后的代码。Runtime基本使用C和汇编写的，由此可见苹果为了动态系统的高效而做出的努力。苹果和 GNU 各自维护一个开源的 Runtime 版本，这两个版本之间都在努力保持一致。
这种动态语言的优势在于：我们写代码时更具灵活性，如我们可以把消息转发给我们想要的对象，或者随意交换一个方法的实现等

### Objc 在三种层面上与 Runtime 系统进行交互
1. 通过 Objective-C 源代码
2. 通过 Foundation 框架的 NSObject 类定义的方法
3. 通过对 Runtime 库函数的直接调用


### self和super的区别：
self是类的一个隐藏参数，指向当前调用方法的这个类的实例，每个方法的实现的第一个参数即为self。
super并不是隐藏参数，它实际上只是一个”编译器标示符”，它负责告诉编译器，当调用方法时，去调用父类的方法，而不是本类中的方法。

在调用[super class]的时候，runtime会去调用**objc_msgSendSuper**方法，而不是**objc_msgSend**

id objc_msgSend(id self, SEL op, ...) - 调用 `[super class]`时，会转化成 `objc_msgSendSuper` 函数. id objc_msgSendSuper(struct objc_super *super, SEL op, ...) 第一个参数是 objc_super 这样一个结构体，其定义如下 struct objc_super { __unsafe_unretained id receiver; __unsafe_unretained Class super_class; }; 第一个成员是 receiver, 类似于上面的 objc_msgSend函数第一个参数self 第二个成员是记录当前类的父类是什么，告诉程序从父类中开始找方法，找到方法后，最后内部是使用 objc_msgSend(objc_super->receiver, @selector(class))去调用， 此时已经和[self class]调用相同了，故上述输出结果仍然返回 Son


###  objc_selector
_cmd在Objective-C的方法中表示当前方法的selector，正如同self表示当前方法调用的对象实例。这里强调当前，_cmd的作用域只在当前方法里，直指当前方法名@selector。

objc_selector是一个映射到方法的C字符串。需要注意的是@selector()选择子只与函数名有关。不同类中相同名字的方法所对应的方法选择器是相同的，即使方法名字相同而变量类型不同也会导致它们具有相同的方法选择器。由于这点特性，也导致了OC不支持函数重载

### Runtime 使用场景
1. 实现多继承 Multiple Inheritance（通过消息转发模拟实现多继承）
2. Method Swizzling *场景：当第三方框架 或者 系统原生方法功能不能满足我们的时候，我们可以在保持系统原有方法功能的基础上，添加额外的功能。*
3. Aspect Oriented Programming （Aspect 库）
4. Isa Swizzling （KVO 原理？？）
5. Associated Object关联对象 （Category 添加成员变量）
6. 动态的增加方法 （消息转发的第一步处理） *场景：在收到一个未实现的方式时，动态增加该方法，防止crash*
7. NSCoding 的自动归档和自动解档 （通过 *class_copyIvarList* 遍历成员变量）
8. 字典和模型户型转化 *（class_copyPropertyList）思路：利用运行时，遍历模型中所有属性，根据模型的属性名，去字典中查找key，取出对应的值，给模型的属性赋值
考虑情况：
1、当字典的key和模型的属性匹配不上。
2、模型中嵌套模型（模型属性是另外一个模型对象）。
3、数组中装着模型（模型的属性是一个数组，数组中是一个个模型对象）*
9. 利用 objc_allocateClassPair、object_setClass 等 API 来实现 KVO Block


### 消息转发
消息转发提供了许多类似于多继承的特性，但是他们之间有一个很大的不同：
多继承：合并了不同的行为特征在一个单独的对象中，会得到一个重量级多层面的对象。
消息转发：将各个功能分散到不同的对象中，得到的一些轻量级的对象，这些对象通过消息通过消息转发联合起来。

### Method Swizzling
Method Swizzling本质上就是对IMP和SEL进行交换。
在Objective-C中调用一个方法，其实是向一个对象发送消息，查找消息的唯一依据是selector的名字。利用Objective-C的动态特性，可以实现在运行时偷换selector对应的方法实现，达到给方法挂钩的目的
每个类都有一个方法列表，存放着方法的名字和方法实现的映射关系，selector的本质其实就是方法名，IMP有点类似函数指针，指向具体的Method实现，通过selector就可以找到对应的IMP。

这里有一个很容易犯的错误，那就是继承中用了Swizzling。如果不写dispatch_once就会导致Swizzling失效！

### Method Swizzling 的使用场景
1. 实现AOP
2. 埋点统计
3. 数组防crash等异常保护
4. 全局更换控件效果（如不使用继承方式，实现全局替换返回按钮）
5. App异常加载占位图通用类封装（hook reload 事件）
6. 防止按钮重复暴力点击

**Aspects会自动的调用super方法，使用method swizzling起来会更加方便**

### Category
category 不能加实例变量，能加方法的原因，在源码中怎么体现出来
https://www.jianshu.com/p/8aa63f7e98d1
通过结构体 category_t ，我们就可以知道，在 Category 中我们可以增加实例方法、类方法、协议、属性。这里没有 objc_ivar_list 结构体，代表我们不可以在分类中添加实例变量。
因为在运行期，对象的内存布局已经确定，如果添加实例变量就会破坏类的内部布局，这个就是 Category 中不能添加实例变量的根本原因。

但如果我们通过运行时来创建一个类的话，又应该如何给它添加成员变量呢？这时我们就可以使用class_addIvar函数了。不过需要注意的是，这个方法只能在objc_allocateClassPair函数与objc_registerClassPair之间调用。

Extension 跟 Category 是两种实现模式，一个是在编译时期实现的，一个是在运行时期决定的


### 消息机制>>方法调用流程
当消息发送给一个对象时，objc_msgSend通过对象的isa指针获取到类的结构体，然后在方法分发表里面查找方法的selector。如果没有找到selector，则通过objc_msgSend结构体中的指向父类的指针找到其父类，并在父类的分发表里面查找方法的selector。依此，会一直沿着类的继承体系到达NSObject类。一旦定位到selector，函数会就获取到了实现的入口点，并传入相应的参数来执行方法的具体实现。如果最后没有定位到selector，则会走消息转发流程。 为了加速消息的处理，运行时系统缓存使用过的selector及对应的方法的地址

### 消息机制>> 消息转发
当一个对象无法接收某一消息时，就会启动所谓”消息转发(message forwarding)“机制，通过这一机制，我们可以告诉对象如何处理未知的消息。
消息转发机制基本上分为三个步骤：
	1.	动态方法解析
	2.	备用接收者
	3.	完整转发

### *class_copyIvarList*、 *class_copyPropertyList*、*class_copyMethodList*

class_copyIvarList函数，它返回一个指向成员变量信息的数组，数组中每个元素是指向该成员变量信息的objc_ivar结构体的指针。这个数组不包含在父类中声明的变量
class_copyPropertyList 也不包含父类声明的属性
class_copyMethodList函数，返回包含所有实例方法的数组，如果需要获取类方法，则可以使用class_copyMethodList(object_getClass(cls), &count)(一个类的实例方法是定义在元类里面)。该列表不包含父类实现的方法


### *class_replaceMethod*
class_replaceMethod函数，该函数的行为可以分为两种：如果类中不存在name指定的方法，则类似于class_addMethod函数一样会添加方法；如果类中已存在name指定的方法，则类似于method_setImplementation一样替代原方法的实现。