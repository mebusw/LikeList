<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String picUrl = request.getParameter("picUrl"); 
  String step = request.getParameter("step"); 
  String defaultPic ="../images/man.GIF";
  
  if("3".equals(step) )
    defaultPic = "../avatar/" + picUrl;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../stylesheet/cutPic.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js" ></script>
    <script type="text/javascript" src="../js/jquery.ui.core.js" ></script>
    <script type="text/javascript" src="../js/jquery.ui.draggable.js" ></script>
    <script type="text/javascript" src="../js/cutPic.js"></script>
    <script src="../js/util.js" type="text/javascript"></script>
    <script src="../js/jquery.form.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        function Step1() {
            $("#Step2Container").hide();           
        }

        function Step2() {
            $("#CurruntPicContainer").hide();
            //location.reload();
        }
        function Step3() {
            $("#Step2Container").hide();  
            self.opener.location.reload();        
        }
        function checkFileSize(input) {
            if (input.files.item(0).size < 1000000) {
                $("#btnUpload").show();
            } else {
                alert("上传图片不能超过1MB");
                $("#btnUpload").hide();
            }
        }
    </script>
</head>
<body>
   

    <div>
     <div class="left">
         <!--当前照片-->
         <div id="CurruntPicContainer">
            <div class="title"><b>当前照片</b></div>
            <div class="photocontainer">
                <img id="imgphoto" src="<%=defaultPic%>" style="border-width:0px;" />
            </div>
         </div>
         <!--Step 2-->
         <div id="Step2Container">
           <div class="title"><b> 裁切头像照片</b></div>
           <div class="uploadtooltip">您可以拖动照片以裁剪满意的头像</div>                              
                   <div id="Canvas" class="uploaddiv">
                   
                            <div id="ImageDragContainer">                               
                               <img id="ImageDrag" class="imagePhoto" src="../attached/<%=picUrl %>" style="border-width:0px;" />                                                        
                            </div>
                            <div id="IconContainer">                               
                               <img id="ImageIcon" class="imagePhoto" src="../attached/<%=picUrl%>" style="border-width:0px;" />                                                        
                            </div>                          
                    </div>
                    <div class="uploaddiv">
                       <table>
                            <tr>
                                <td id="Min">
                                        <img alt="缩小" src="../images/_c.gif" onmouseover="this.src='../images/_c.gif';" onmouseout="this.src='../images/_h.gif';" id="moresmall" class="smallbig" />
                                </td>
                                <td>
                                    <div id="bar">
                                        <div class="child">
                                        </div>
                                    </div>
                                </td>
                                <td id="Max">
                                        <img alt="放大" src="../images/c.gif" onmouseover="this.src='../images/c.gif';" onmouseout="this.src='../images/h.gif';" id="morebig" class="smallbig" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <form action="../action/zoomUserImage.jsp" method="post">
                    <input type="hidden" name="picture" value="<%=picUrl%>"/>
                    <div class="uploaddiv">
                        <input type="submit" value="保存头像" id="btn_Image" />
                    </div>           
                    <div>
                    <br/><br/><br/><br/>
                    图片实际宽度： <input name="txt_width" type="text" readonly="readonly" value="1" id="txt_width" /><br />
                    图片实际高度： <input name="txt_height" type="text" readonly="readonly" value="1" id="txt_height"/><br />
                    距离顶部： <input name="txt_top" type="text" readonly="readonly" value="82" id="txt_top" /><br />
                    距离左边： <input name="txt_left" type="text" readonly="readonly" value="73" id="txt_left" /><br />
                    截取框的宽： <input name="txt_DropWidth" type="text" readonly="readonly" value="120" id="txt_DropWidth" /><br />
                    截取框的高： <input name="txt_DropHeight" type="text" readonly="readonly" value="120" id="txt_DropHeight" /><br />
                    放大倍数： <input name="txt_Zoom" type="text" readonly="readonly" id="txt_Zoom" />
                   </div>  </form>
         </div>
     
     </div>
      <form name="form1" method="post" action="../action/uploadUserImage.jsp" id="form1" enctype="multipart/form-data">
     <div class="right">
         <!--Step 1-->
         <div id="Step1Container">
            <div class="title"><b>更换照片</b></div>
            <div id="uploadcontainer">
                <div class="uploadtooltip">请选择新的照片文件，文件需小于1MB</div>
                <div class="uploaddiv"><input type="file" name="fuPhoto" id="fuPhoto" title="选择照片" onchange="checkFileSize(this)"/></div>
                <div class="uploaddiv"><input type="submit" value="上传" id="btnUpload" name="btnUpload"/></div>
            </div>
         
         </div>
     </div>
     </form>
    </div>
    <% 
      if(null==picUrl || "".equals(picUrl))
      {%>
          <script type='text/javascript'>Step1();</script>
      <%}else if(!"".equals(picUrl)&& "2".equals(step)){
      %>
      <script type='text/javascript'>Step2();</script>
      <%}else if(!"".equals(picUrl)&& "3".equals(step)){
      %>
      <script type='text/javascript'>Step3();</script>
      <%}%>

</body>
</html>