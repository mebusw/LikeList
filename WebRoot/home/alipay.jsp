
<%
	/*
	 *功能：快速付款入口模板页
	 *版本：3.1
	 *日期：2010-11-01
	 *说明：
	 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.alipay.config.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝即时到帐付款</title>
		<META content="网上购物/网上支付/安全支付/安全购物/购物，安全/支付,安全/支付宝/安全,支付/安全，购物/支付, 
name=description 在线 付款,收款 网上,贸易 网上贸易".>
<META content="网上购物/网上支付/安全支付/安全购物/购物，安全/支付,安全/支付宝/安全,支付/安全，购物/支付, name=keywords 
在线 付款,收款 网上,贸易 网上贸易".>
<LINK href="images/layout.css" type="text/css" rel="stylesheet">

<SCRIPT language=JavaScript>

function CheckForm()
{
	if (document.alipayment.aliorder.value.length == 0) {
		alert("请输入商品名称.");
		document.alipayment.aliorder.focus();
		return false;
	}
	if (document.alipayment.alimoney.value.length == 0) {
		alert("请输入付款金额.");
		document.alipayment.alimoney.focus();
		return false;
	}
	var reg	= new RegExp(/^\d*\.?\d{0,2}$/);
	if (! reg.test(document.alipayment.alimoney.value))
	{
        alert("请正确输入付款金额");
		document.alipayment.alimoney.focus();
		return false;
	}
	if (Number(document.alipayment.alimoney.value) < 0.01) {
		alert("付款金额金额最小是0.01.");
		document.alipayment.alimoney.focus();
		return false;
	}

}
</SCRIPT>
	</head>
<%
	String show_url = AlipayConfig.show_url;
	String mainname = AlipayConfig.mainname;
	int shopId = AttrParser.getParaInt(request, "shopId");
	int grId = AttrParser.getParaInt(request, "grId");
	int price = AttrParser.getParaInt(request, "price");
    String subject = AttrParser.getParaStr(request, "subject");

%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=4>

<CENTER>

<TABLE cellSpacing=0 cellPadding=0 width=760 border=0>
  <TBODY>
  <TR>
    <TD class=title>支付宝即时到帐付款快速通道</TD>
  </TR></TBODY>
</TABLE><BR>
<FORM name=alipayment onSubmit="return CheckForm();" action=alipayto.jsp 
method=post target="_blank">
<table>
 <tr>
   <td>
     <TABLE cellSpacing=0 cellPadding=0 width=740 border=0>
        <TR>
          <TD class=form-left>收款方： </TD>
          <TD class=form-star>* </TD>
          <TD class=form-right><%=mainname%>&nbsp;</TD>
        </TR>
        <TR>
          <TD colspan="3" align="center"><HR width=600 SIZE=2 color="#999999"></TD>
        </TR>
        <TR>
          <TD class=form-left>标题： </TD>
          <TD class=form-star>* </TD>
          <TD class=form-right>
            <INPUT size=30 name=aliorder maxlength="200" value="抢团购 <%=subject %>" readonly="readonly">
            <input type="hidden" id="shopId" name="shopId" value="<%=shopId %>"/>
            <input type="hidden" id="grId" name="grId" value="<%=grId %>"/>
          </TD>
        </TR>
        <TR>
          <TD class=form-left>付款金额： </TD>
          <TD class=form-star>*</TD>
          <TD class=form-right><INPUT maxLength=10 size=30 name=alimoney onfocus="if(Number(this.value)==0){this.value='';}" value="<%=price %>" readonly="readonly"></TD>
        </TR>
        <TR>
          <TD class=form-left>备注：</TD>
          <TD class=form-star></TD>
          <TD class=form-right><TEXTAREA name=alibody rows=2 cols=40 wrap="physical" readonly="readonly">团购 shopId=<%=shopId %> grId=<%=grId %></TEXTAREA><BR>
          （如联系方法，商品要求、数量等。100汉字内）</TD>
        </TR>
        <TR>
          <TD class=form-left>支付方式：</TD>
          <TD class=form-star></TD>
          <TD class=form-right>
               <table>
                 <tr>
                   <td><input type="radio" name="pay_bank" value="directPay" checked="checked"><img src="../images/alipay_1.gif" border="0"/></td>
                 </tr>
                 <!-- 
                 <tr>
                   <td><input type="radio" name="pay_bank" value="ICBCB2C"/><img src="images/ICBC_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="CMB"/><img src="images/CMB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="CCB"/><img src="images/CCB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="BOCB2C"><img src="images/BOC_OUT.gif" border="0"/></td>
                 </tr>
                 <tr>
                   <td><input type="radio" name="pay_bank" value="ABC"/><img src="images/ABC_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="COMM"/><img src="images/COMM_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="SPDB"/><img src="images/SPDB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="GDB"><img src="images/GDB_OUT.gif" border="0"/></td>
                 </tr>
                 <tr>
                   <td><input type="radio" name="pay_bank" value="CITIC"/><img src="images/CITIC_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="CEBBANK"/><img src="images/CEB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="CIB"/><img src="images/CIB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="SDB"><img src="images/SDB_OUT.gif" border="0"/></td>
                 </tr>
                 <tr>
                   <td><input type="radio" name="pay_bank" value="CMBC"/><img src="images/CMBC_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="HZCBB2C"/><img src="images/HZCB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="SHBANK"/><img src="images/SHBANK_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="NBBANK "><img src="images/NBBANK_OUT.gif" border="0"/></td>
                 </tr>
                 <tr>
                   <td><input type="radio" name="pay_bank" value="SPABANK"/><img src="images/SPABANK_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="BJRCB"/><img src="images/BJRCB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="ICBCBTB"/><img src="images/ENV_ICBC_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="CCBBTB"/><img src="images/ENV_CCB_OUT.gif" border="0"/></td>
                 </tr>
                 <tr>
                   <td><input type="radio" name="pay_bank" value="SPDBB2B"/><img src="images/ENV_SPDB_OUT.gif" border="0"/></td>
                   <td><input type="radio" name="pay_bank" value="ABCBTB"/><img src="images/ENV_ABC_OUT.gif" border="0"/></td>
				   <td><input type="radio" name="pay_bank" value="fdb101" /><img src="images/FDB_OUT.gif" border="0" /></td>
				   <td><input type="radio" name="pay_bank" value="PSBC-DEBIT" /><img src="images/PSBC_OUT.gif" border="0" /></td>
                 </tr>
                  -->
               </table>
          </TD>
        </TR>
         <TR>
          <TD class=form-left></TD>
          <TD class=form-star></TD>
          <TD class=form-right><INPUT type=image 
            src="../images/button_sure.gif" value=确认订单 
            name=nextstep></TD>
        </TR>
</TABLE>
   </td>
   <td vAlign=top width=205 style="font-size:12px;font-family:'宋体'">
   <span id="glowtext">小贴士：</span>
   <fieldset>
      <P class=STYLE1>本通道为<a href="<%=show_url%>" target="_blank"><strong><%=mainname%></strong></a>客户专用，采用支付宝付款。请在支付前与本网站达成一致。</P>
      <P class="style2">请务必与<a href="<%=show_url%>" target="_blank"><strong><%=mainname%></strong></a>确认好订单和货款后，再付款。可以在快速付款通道里的“标题”、“订单金额”、“付款方”和备注中填入相应的订单信息。</P>
      <P class="style2 style3">&nbsp;</P>
      </fieldset>
   </td>
 </tr>
</table>

</FORM>

<TABLE cellSpacing=1 width=760 border=0>
  <TR>
    <TD><FONT class=note-help>如果您点击“购买”按钮，即表示您已经接受“支付宝服务协议”，同意向卖家购买此物品。 
      <BR>
      您有责任查阅完整的物品登录资料，包括卖家的说明和接受的付款方式。卖家必须承担物品信息正确登录的责任！ 
  </FONT>
 </TD>
 </TR>
</TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0>
  <TR align=middle>
    <TD class="txt12 lh15"><A href="http://china.alibaba.com/" 
      target=_blank>阿里巴巴旗下公司</A> | 支付宝版权所有 2004-2012</TD>
  </TR>
  <TR align=middle>
    <TD class="txt12 lh15"><images alt="支付宝通过“国际权威安全认证” " 
      src="images/logo_vbvv.gif" border=0><BR>支付宝通过“国际权威安全 
  认证”
    </TD>
  </TR>
</TABLE>
</BODY>
</HTML>