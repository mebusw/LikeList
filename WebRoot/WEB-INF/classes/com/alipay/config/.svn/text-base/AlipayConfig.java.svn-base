/**
 *功能：设置帐户有关信息及返回路径（基础配置页面）
 *版本：3.1
 *日期：2010-11-01
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
 *提示：如何获取安全校验码和合作身份者ID
 *1.访问支付宝首页(www.alipay.com)，然后用您的签约支付宝账号登陆.
 *2.点击导航栏中的“商家服务”，即可查看
	
 *安全校验码查看时，输入支付密码后，页面呈灰色的现象，怎么办？
 *解决方法：
 *1、检查浏览器配置，不让浏览器做弹框屏蔽设置
 *2、更换浏览器或电脑，重新登录查询。
 */
package com.alipay.config;

public class AlipayConfig {
	// 如何获取安全校验码和合作身份者ID
	// 1.访问支付宝商户服务中心(b.alipay.com)，然后用您的签约支付宝账号登陆.
	// 2.访问“技术服务”→“下载技术集成文档”（https://b.alipay.com/support/helperApply.htm?action=selfIntegration）
	// 3.在“自助集成帮助”中，点击“合作者身份(Partner ID)查询”、“安全校验码(Key)查询”

	// ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	public static String partner = "2088502754681240";

	// 交易安全检验码，由数字和字母组成的32位字符串
	public static String key = "5ykxsw6xmcjdv9w579t9ylbvqjv03f1w";

	// 签约支付宝账号或卖家收款支付宝帐户
	public static String seller_email = "yubao1980@gmail.com ";

	// notify_url 交易过程中服务器通知的页面 要用 http://格式的完整路径，不允许加?id=123这类自定义参数
	public static String notify_url = "http://127.0.0.1:8080/LikeList/biz/notify_url.jsp";

	// 付完款后跳转的页面 要用 http://格式的完整路径，不允许加?id=123这类自定义参数
	//http://localhost:8080/LikeList/alipay/return_url.jsp?body=%E5%88%B7%E5%8D%A1%E4%B8%80%E6%AC%A1&buyer_email=mebusw%40163.com&buyer_id=2088002052685464&exterface=create_direct_pay_by_user&is_success=T&notify_id=RqPnCoPT3K9%252Fvwbh3I%252BFj%252BgieE%252Bf9ctGksLhfFTjrnj5gF838%252B2%252B9T0KxglQd9bgCzdV&notify_time=2011-02-17+15%3A24%3A23&notify_type=trade_status_sync&out_trade_no=4&payment_type=1&seller_email=yubao1980%40gmail.com&seller_id=2088502754681240&subject=ESJ%E9%A5%AD%E8%B4%B9&total_fee=0.01&trade_no=2011021764785346&trade_status=TRADE_SUCCESS&sign=98978937645032e95e3327b224ed16ae&sign_type=MD5
	public static String return_url = "http://127.0.0.1:8080/LikeList/biz/return_url.jsp";

	// 网站商品的展示地址，不允许加?id=123这类自定义参数
	public static String show_url = "http://www.eshunjian.com";

	// 收款方名称，如：公司名称、网站名称、收款人姓名等
	public static String mainname = "杭州闲庭网络科技有限公司";
	// ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "UTF-8";

	// 签名方式 不需修改
	public static String sign_type = "MD5";

	// 访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
	public static String transport = "http";
}
