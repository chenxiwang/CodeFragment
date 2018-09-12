# init、initWithNibName、自定义初始化方法；不同的加载viewController 的方法 分别的调用次序

## Demo介绍

	FirstViewController 是一个不带xib 的类； SecondViewController 是一个带有 xib 的类；ThirdViewController 是一个 有对应storyBoard文件的类

	三个ViewController 分别用三种不同的初始化方法来创建：1，init；2，initWithNibName；3，initWithName； 然后看各个VC里面方法的调用次序

	VC里面分别重写了 init、initWithNibName、initWithName、initWithCoder、loadView、awakeFromNib、viewDidLoad 方法，对应输出log

## 输出log

	FirstViewController *如果不做任何处理，FirstViewController 会显示为黑屏，这是因为vc自动创建的view，backGroundColor 默认值是nil*

	- init创建的输出次序: initWithNibName -> init -> loadView -> viewDidLoad
	- initWithNibName创建的输出次序: initWithNibName -> loadView -> viewDidLoad
	- initWithName创建的输出次序: initWithNibName -> initWithName -> loadView -> viewDidLoad

	SecondViewController 

	- init创建的输出次序: initWithNibName -> init -> loadView -> viewDidLoad   *如果重写了loadView，那么xib文件就不会加载*
	- initWithNibName创建的输出次序: initWithNibName -> loadView -> viewDidLoad  *不管是否重写loadView，都能加载xib*
	- initWithName创建的输出次序: initWithNibName -> initWithName -> loadView -> viewDidLoad   *如果重写了loadView，那么xib文件就不会加载*

	ThirdViewController

	- init创建的输出次序: initWithNibName -> init -> loadView -> viewDidLoad   *不管是否重写loadView，都不能能加载xib，因为没有xib^_^*
	- initWithNibName创建的输出次序: initWithNibName -> loadView -> viewDidLoad  *不管是否重写loadView，都不能能加载xib，因为没有xib^_^*
	- initWithName创建的输出次序: initWithNibName -> initWithName -> loadView -> viewDidLoad  *不管是否重写loadView，都不能能加载xib，因为没有xib^_^*
    - instantiateViewControllerWithIdentifier创建的输出次序: initWithCoder -> awakeFromNib -> loadView -> viewDidLoad   *不管是否重写loadView，都能加载出文件*
    - 通过storyboard segue 方式 push到 ThirdViewController（可以理解为用sb创建）: initWithCoder -> awakeFromNib -> loadView -> viewDidLoad *不管是否重写loadView，都能加载出文件*

## loadView vs viewDidLoad

   [参考链接](https://medium.com/yay-its-erica/viewdidload-vs-loadview-swift3-47f4ad195602)

   [xib/storyBoard 加载流程图](http://www.wujianjun.org/images/xib_init.png)

   [代码加载流程图](http://www.wujianjun.org/images/code_init.png)

   概括来说，两者都可以用来做view初始化，但习惯性的还是在viewDidLoad里面做初始化



#指定初始化方法、便利初始化方法 

## NS_DESIGNATED_INITIALIZER 和 NS_UNAVAILABLE 宏

	NS_DESIGNATED_INITIALIZER 用来在.h文件中声明初始化方法为 指定初始化方法。与它相对应的是便利初始化方法。 指定初始化方法一般来讲是参数最多的，提供最全面的初始化操作。
	NS_UNAVAILABLE 用来声明该方法不是适合用来做初始化。（一个使用场景是，想限制子类的初始化只能从某个特定方法来初始化（不能使用父类初始化方法创建），那么就把父类的初始化方法标记为NS_UNAVAILABLE，详细见CustomViewOne 对象）
    
    *如果没有使用NS_UNAVAILABLE，也没有降级父类指定初始化方法，编译器就会有报错，比如 Method override for the designated initializer of the superclass '-initWithCoder:' not found
Method override for the designated initializer of the superclass '-initWithFrame:' not found *

## 指定初始化方法的一般规则
 
### 一般性规则

	1. 子类如果有指定初始化函数，那么指定初始化函数实现时必须调用它的直接父类的指定初始化函数。

	2. 如果子类有指定初始化函数，那么便利初始化函数必须调用自己的其它初始化函数(包括指定初始化函数以及其他的便利初始化函数)，不能调用super的初始化函数。

	3. 如果子类提供了指定初始化函数，那么一定要实现所有直接父类的指定初始化函数,这样才能保证整个子类的初始化过程可以覆盖到所有继承链上的成员变量得到合适的初始化.

### 详细规则

	1. 每个类的正确初始化过程应当是按照从子类到父类的顺序，依次调用每个类的 Designated Initializer 

	2. 而且用父类的 Designated Initializer 初始化一个子类对象，也需要遵从这个过程。

	3. 如果子类指定了新的初始化器，那么在这个初始化器内部必须调用父类的 Designated Initializer。并且需要重写父类的 Designated Initializer，将其指向子类新的初始化器。

	4. 可以不自定义 Designated Initializer ，重写父类的 Designated Initializer ，但需要调用直接父类的 Designated Initializer 。

	5. 如果有多个 Secondary initializers (次要初始化器)，它们之间可以任意调用，但最后必须指向 Designated Initializer。在 Secondary initializers 内不能直接调用父类的初始化器。

	6. 如果有多个不同数据源的 Designated Initializer，那么不同数据源下的 Designated Initializer 应该调用相应的 [super (designated initializer)]。

	7. 如果父类没有实现相应的方法，则需要根据实际情况来决定是给父类补充一个新的方法还是调用父类其他数据源的 Designated Initializer。比如 UIView 的 initWithCoder 调用的是 NSObject 的 init 。 


	
