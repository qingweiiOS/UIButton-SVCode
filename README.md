# UIButton-SVCode

将 UIButton-SVCode.h和UIButton-SVCode.m 拖入项目中

在需要使用的类导入 #import "UIButton+Code.h"

**使用**

```objc
 [sender setCountdown:10];
```



**如果使用下列方法，需要在页面加载完成后，调用检测函数**

```
[sender setCountdown:20 keywords:@"loginCode"];
// 检测函数 检测关于loginCode倒计时，是否存在没有走完的情况
[sender checkCountdown:@"loginCode"];
```





```objc


///设置倒计时
- (void)setCountdown:(NSTimeInterval )timeOut;

/**

 *

 * 设置倒计时和关键词 （例如 注册验证码 登录验证码）

 * 设置后 该页面销毁后，重进入时倒计时不会重新设为0

 */

- (void)setCountdown:(NSTimeInterval )timeOut keywords:(NSString *)keyWord;

/**

 * 需要手动调用检测方法 和setCountdown:keywords:配套使用

 */

- (void)checkCountdown:(NSString *)keyWord;



///手动结束倒计时 当前页面销毁之前，请务必调用

- (void)cancelCountdown;
```

