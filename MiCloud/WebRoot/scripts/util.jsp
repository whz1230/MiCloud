<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/page.tld" prefix="page"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//清缓存  
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/css/jquery-ui-1.11.2.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.11.2.js"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/css/validate.css" />
<script type="text/javascript" src="<%=path%>/js/valid.js"></script>
<script type="text/javascript" src="<%=path%>/js/select.js"></script>
<script type="text/javascript" src="<%=path%>/js/util.js"></script>
<script type="text/javascript" src="<%=path%>/js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="<%=path%>/css/skin.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery.bgiframe.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.multiselect.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.multiselect.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.lightbox-0.5.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.lightbox-0.5.css" media="screen" />
<script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.progressbar.js"></script>
<script type="text/javascript" src="<%=path%>/js/number.js"></script>
<script type="text/javascript">

 $(function(){     
 //保留查询分页条件
 if(document.forms[0]!=undefined&& $("[name='bean.pageSize']").length==0  &&document.forms[0].action.indexOf("bean.pageSize=")<0&&"${bean.pageSize}"!=""){
 	var pageSize =$("<input type='hidden' id='pageSize' name='bean.pageSize' value='${bean.pageSize}'/>");
 	  $("#form1").append(pageSize);  
 }
	// $("#divwidth").css("border","1px solid #a8c7ce");
 //判断SESSION是否失效
 	if("${session.userInfo}"==""){
 		//alert("连接超时，请重新登陆"); 
		if(navigator.userAgent.indexOf("MSIE") != -1){  
			if(window.dialogArguments!=undefined){
				window.dialogArguments.window.top.location = "<%=path%>/jsp/error.jsp"; 
				window.close();	
			}else{
				top.location = "<%=path%>/jsp/error.jsp"; 
			}     
		}else{//判断浏览器是IE之外的其他浏览器  
			if(window.opener!=undefined){
				window.opener.top.location = "<%=path%>/jsp/error.jsp"; 
				window.close();	
			}else{
				top.location = "<%=path%>/jsp/error.jsp"; 
			}
		}
 	}
    //行列样式
 	FixTable("table1");//固定行列
	getwidth("table1"); //伸缩行列
	 
 	$(window).resize(function(){getwidth("table1");});//随页面变化伸缩行列
	$(document.body).resize();	
 	//判断是否有信息传入
 	 	if(decodeURI("${requestScope.message}")!=""){
 	 		 showMessage(decodeURI("${requestScope.message}"));
 		//alert(decodeURI("${requestScope.message}"));
 	}
 	//文本框默认数字字母自动换行，滚动条自动隐藏
 	$("textarea").css({"overflow-y":"auto","word-wrap":"break-word","word-break":"break-all"});
 	//只读框变淡
 	$("textarea[readonly=true]").css('opacity',0.7).focus(function(){this.blur();});
	 $("input[readonly=true]").css('opacity',0.7).focus(function(){this.blur();});
	 
	 $("#table1 tr").each(function(index){
			$(this).mouseover(function(){
				if(index>0) {
					var chk = $("#table1 tr:eq("+index+")").attr("chk");//取选中的值
					if(chk==undefined||chk.indexOf("2")<0){
						$("#table1 tr:eq("+index+")").css("background","#d3eaef");
						$("#table1 tr:eq("+index+")").attr("chk","1");//选中
					}
				}
				});
			$(this).mouseout(function(){
				if(index>0)
					var chk = $("#table1 tr:eq("+index+")").attr("chk");//取选中的值
					if(chk!=undefined&&chk.indexOf("1")>=0){
						$("#table1 tr:eq("+index+")").css("background","#ffffff");
						$("#table1 tr:eq("+index+")").attr("chk","0");//未选中
					}
				});
			$(this).click(function(){
				if(index>0){
					var chk = $("#table1 tr:eq("+index+")").attr("chk");
					if(chk!=undefined&&chk.indexOf("1")>=0){
						 $("#table1 tr").each(function(index1){
							 if(index1>0){
							 $("#table1 tr:eq("+index1+")").css("background","#ffffff");
							 $("#table1 tr:eq("+index1+")").attr("chk","0");//未选中
							 }
						 });
						$("#table1 tr:eq("+index+")").css("background","#9ee5fe");
						$("#table1 tr:eq("+index+")").attr("chk","2");//选定
					}else if(chk!=undefined&&chk.indexOf("2")>=0){
						$("#table1 tr:eq("+index+")").css("background","#d3eaef");
						$("#table1 tr:eq("+index+")").attr("chk","1");//选中
					}
				}
			});
		});
		
	 });  
 function checkAll(box){  //全选或全不选
		form1.checkbox.checked = box.checked;
	  	if(form1.idcheckbox == null)
	  		return;
	  	var numRow = form1.idcheckbox.length;
	  	if(numRow == null) {
	  		form1.idcheckbox.checked = box.checked;	
	  		return;
	  	}
	  	if(box.checked) {
			for (var i = 0; i < numRow; i++) {
				form1.idcheckbox[i].checked = true;
			}
		} else {
			for (var i = 0; i < numRow; i++) {
				form1.idcheckbox[i].checked = false;
			}
		}
	  }
  function checkOne(){  //选一个时全选或全不选
  	
  	if(form1.idcheckbox == null)
  		return;
  	var numRow = form1.idcheckbox.length;
  	if(numRow == null) {
		form1.checkbox.checked = form1.idcheckbox.checked;
		return;
  	}
  	var numBox =0;
	for (var i = 0; i < numRow; i++) {
		if(form1.idcheckbox[i].checked){
			numBox++;
		}
	}
	if(numBox==numRow){
		form1.checkbox.checked = true;
	}else {
		form1.checkbox.checked = false;
	}
  }
  //下载导入模板
  function downloadTemp(name){
  		document.form1.action="<%=path%>/login!downloadTemp?id="+name;
		document.form1.submit();
  }
  //导入Excel
  function importExcel(name,pathname,Width,Height){
  	if(Height==undefined)
	{
		Height = '300px';
	}
	if(Width==undefined)
	{
		Width = '400px';
	}
	 
	var path="<%=path%>/jsp/fileUpload.jsp?pathname="+name;
	  
  	var returnValue = window.showModalDialog(path,obj,'dialogHeight:'+Height+';dialogWidth:'+Width+';center:yes;help:no;resizable:yes;status:no;scroll:auto;location:no;');
  	if(returnValue==undefined){
  	return false;
  	}
  	if(returnValue!=true){
  		alert("导入文件失败！");
  	}else{
  		window.location = window.location ;
  	}
  }
  //导出Excel
  //function exportExcel(path){
 // 		document.form1.action="<%=path%>/"+path+"!exportExcel";
//		document.form1.submit();
 // }
    //导出Excel
  var exportRate = 0;//初始进度
  var inter; 
  //显示进度条
  function exportExcel(path){ 
	  
	  //生成文件进度条
		exportVisible(true);
		$("#fileMes").append("文件读取进度："); 
		$("#progress1").progressBar(exportRate,  {
			callback: function(data) { 
				if (data.running_value == 100) { 
					exportVisible(false);
					exportRate=0;
					clearInterval(inter);
					initRate();    
				}
			}
		}); 
		inter = setInterval(exportShowRate,500); 
		//生成导出文件
	  
		var $form =$("<form id='exportForm' name='exportForm' method='post' ><input type='hidden' name='name' id='name' value=''/></form>");
 
	  if($("#exportForm").size()<1 ){
		  $("body").append($form);
	  }     
	  if(path!=""&&path.indexOf("!")<0){
		  path=path+"!exportExcel";
	  }
			  $("#form1").ajaxSubmit({  
					type:"post",
					async:true,
					url:"<%=path%>/"+path,
					success:function(data){  
						if(data!=null&&data!=""){
							$("#progress1").progressBar(100);  
							$("#name").val(data); 
							setTimeout(function(){//导出文件
								document.exportForm.action="<%=path%>/tree!download?del=0";  
								document.exportForm.submit();
								exportVisible(false);},1000);
							
						}else{
							alert("导出失败,数据异常！");
							exportVisible(false);
						}
						
						
					} ,
					error:function(){   
						alert("导出失败,服务器异常！");
						exportVisible(false);
					}
				});   
			 
  }
  

  function exportExcelday(path){ 
	  
	  //生成文件进度条
		exportVisible(true);
		$("#fileMes").append("文件读取进度："); 
		$("#progress1").progressBar(exportRate,  {
			callback: function(data) { 
				if (data.running_value == 100) { 
					exportVisible(false);
					exportRate=0;
					clearInterval(inter);
					initRate();    
				}
			}
		}); 
		inter = setInterval(exportShowRate,500); 
		//生成导出文件
	  
		var $form =$("<form id='exportForm' name='exportForm' method='post' ><input type='hidden' name='name' id='name' value=''/></form>");
 
	  if($("#exportForm").size()<1 ){
		  $("body").append($form);
	  }     
	  if(path!=""&&path.indexOf("!")<0){
		  path=path+"!exportExcelday";
	  } 
			  $("#form1").ajaxSubmit({  
					type:"post",
					async:true,
					url:"<%=path%>/"+path,
					success:function(data){  
						if(data!=null&&data!=""){
							$("#progress1").progressBar(100);  
							$("#name").val(data); 
							setTimeout(function(){//导出文件
								document.exportForm.action="<%=path%>/tree!download?del=0";  
								document.exportForm.submit();
								exportVisible(false);},1000);
							
						}else{
							alert("导出失败！");
							exportVisible(false);
						}
						
						
					} ,
					error:function(){   
						alert("导出失败,服务器异常！");
						exportVisible(false);
					}
				});   
			 
  }
 //显示进度
  function exportShowRate(){    
	  $.ajax({	
			type:'post',
			dataType:'html',
			async:true,//定义同步，或者异步方式
			url:'<%=path%>/tree!showRate',
			success:function(data){ 
				exportRate =  data;
				$("#progress1").progressBar(exportRate);  
			},
			error:function (data,textStatus,errorThrown) {
<%--				alert("生成用户失败！");--%>
<%--				alert(textStatus);// 通常情况下textStatus和errorThown只有其中一个有值   --%>
<%--				document.write(textStatus); // the options for this ajax request  --%>
			}
		  });
	  
	   
	} 
  //初始化进度条
  function initRate(){    
	  $.ajax({	
			type:'post',
			dataType:'html',
			async:true,//定义同步，或者异步方式
			url:'<%=path%>/tree!initRate',
			success:function(data){  
			},
			error:function (data,textStatus,errorThrown) { 
			}
		  }); 
	} 
 
  
function resetDiv(){
		document.forms[0].reset();
		$("[valid],[url]:([urlmsg])").each(function(){
			$("p#vtip").remove();
			change_error_style($(this),"remove");
			$(this).removeAttr("show");
    		change_tip($(this),null,"remove");
		});
}


function input_trim() {
		var isSubmit = true;
		var fv = new FormValid($("[valid],[url]:([urlmsg])"));
		$("input").each(function(){
			if($(this).attr("type")=="text"&&$(this).attr("value")!=undefined){
				$(this).attr("value", $(this).attr("value").trim());
			}
		});
	}
	
function isnum(obj){
	 if(!isNaN(obj.value+String.fromCharCode(event.keyCode))){
		 return true;
	 }else{
		 event.keyCode=0;
		 return false;
	 }
}

function showMessage(message){
	$(document.body).append(" <div id='_message_' style='margin: -20px 0px 0px -137.5px; padding: 10px 20px; border: 1px solid rgb(51, 153, 255); background-color: rgb(204, 255, 255); display: block; visibility: visible; position: absolute; z-index: 9999; left: 50%; top: 50%; ' role='dialog' tabindex='-1'><img src='<%=path%>/images/!.gif'><span style='margin-left:5px;font-size:12px;display:inline-table;vertical-align:middle;color:222222;'>"+message+"</span></div>"); 
 	window.setTimeout("$('#_message_').remove();", 2000);
 
}
function showMessageDiv(message){
	window.scrollTo(0,0);
 	$(document.body).append(" <div id='PopupDiv' style=' width:100%;height:100%;position:absolute;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5; top:0px; left:0px; padding:0px;   background-color:#ffffff;   z-index:100;  '></div>"); 
	$(document.body).append(" <div id='_message_' style='margin: -20px 0px 0px -137.5px; padding: 10px 20px; border: 1px solid rgb(51, 153, 255); background-color: rgb(204, 255, 255); display: block; visibility: visible; position: absolute; z-index: 9999; left: 50%; top: 50%; ' role='dialog' tabindex='-1'><img src='<%=path%>/images/!.gif'><span style='margin-left:5px;font-size:12px;display:inline-table;vertical-align:middle;color:222222;'>"+message+"</span></div>"); 
 	window.setTimeout("$('#PopupDiv').remove();", 2000);
 	window.setTimeout("$('#_message_').remove();", 2000);
} 

function DivSetVisible(state){
	if(state){
		window.scrollTo(0,0);
	 	$(document.body).append(" <div id='PopupDiv' style=' width:100%;height:100%;position:absolute;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5; top:0px; left:0px; padding:0px;   background-color:#ffffff;   z-index:1000;  '></div>"); 
	 	$(document.body).append(" <div id='_PopupMsg_' style='margin: -20px 0px 0px -137.5px; padding: 10px 20px; border: 1px solid rgb(51, 153, 255); background-color: rgb(204, 255, 255);   visibility: visible;  position: absolute; z-index: 9999; left: 50%; top: 50%; ' role='dialog' tabindex='-1'><img src='<%=path%>/images/load1.gif'><span style='margin-left:5px;font-size:12px;display:inline-table;vertical-align:middle;color:222222;'>请稍后，数据正在提交中，请勿刷新页面...</span></div>"); 
	}else{
		$('#PopupDiv').remove();
	 	$('#_PopupMsg_').remove(); 
	}
}
//导出进度条
function exportVisible(state){
	if(state){
		window.scrollTo(0,0);
	 	$(document.body).append(" <div id='PopupDiv' style=' width:100%;height:100%;position:absolute;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5; top:0px; left:0px; padding:0px;   background-color:#ffffff;   z-index:100;  '></div>"); 
	 	$(document.body).append(" <div id='_PopupMsg_' style='margin: -20px 0px 0px -137.5px; padding: 10px 20px; border: 1px solid rgb(51, 153, 255); background-color: rgb(204, 255, 255);   visibility: visible;  position: absolute; z-index: 9999; left: 50%; top: 50%; ' role='dialog' tabindex='-1'> <span style='font-weight: bold;' id='fileMes'> </span><span style='margin-left:5px;font-size:12px;display:inline-table;vertical-align:middle;color:222222;' id='progress1'>请稍后，数据正在提交中，请勿刷新页面...</span></div>"); 
	}else{
		$('#PopupDiv').remove();
	 	$('#_PopupMsg_').remove(); 
	}
}
function closeW(){  
   // if (event.clientX > document.body.clientWidth && event.clientY < 0 || event.altKey) {
  //      return;
  //  }
  //  else {
    	DivSetVisible(true);
   // }
}
function hideW(){
	DivSetVisible(false);
}
 
//点击查看图片
function watchImg(obj){
	var imgPath = $(obj).attr("src");
	//alert(imgPath);
	//document.form1.action="/houseEquip!watchImg?imgPath="+imgPath;
	//document.form1.submit();
	$("#form1").ajaxSubmit({
		type:"post",
		async:false,
		url:"<%=path%>/houseEquip!watchImg?imgPath="+imgPath,
		success:function(data){ 
		
		},
		error:function(){
		}
	});
}

/**
 * 返回跳转带查询条件
 */
function form1Submit(){   
	 
	if("${bean.totalResults}"!="0"&&"${bean.totalResults}"!=""){//查询页面
		var currentPage =$("<input type='hidden' id='currentPage' name='currentPage' value='${bean.currentPage}'/>");
// 		var page =$("<input type='hidden' id='page' name='page' value='${bean.currentPage}'/>");
		var pageSize =$("<input  type='hidden' name='pageSize' value='${bean.pageSize}''/>");
// 		if($("#page").val()==undefined &&$("#form1").attr("action").indexOf("page=")<0){
// 			 $("#form1").append(page);
// 		}
		if($("#pageSize").val()==undefined &&$("#form1").attr("action").indexOf("pageSize=")<0){
			 $("#form1").append(pageSize);
		}
		if($("#currentPage").val()==undefined){
			 $("#form1").append(currentPage);
		} 
	}else{//其他页面
		var page =$("<input type='hidden' id='page' name='page' value='${currentPage}'/>");
		if("${bean}"==""){ 
			var pageSize =$("<input type='hidden' id='pageSize' name='bean.pageSize' value='${pageSize}'/>");
		}
		var searchA =$("<input type='hidden' id='searchA' name='form.searchA' value='<s:property value="form.searchA" />'/>");
		var searchB =$("<input type='hidden' id='searchB' name='form.searchB' value='<s:property value="form.searchB" />'/>");
		var searchC =$("<input type='hidden' id='searchC' name='form.searchC' value='<s:property value="form.searchC" />'/>");
		var searchD =$("<input type='hidden' id='searchD' name='form.searchD' value='<s:property value="form.searchD" />'/>");
		var searchE =$("<input type='hidden' id='searchE' name='form.searchE' value='<s:property value="form.searchE" />'/>");
		var searchF =$("<input type='hidden' id='searchF' name='form.searchF' value='<s:property value="form.searchF" />'/>");
		var searchG =$("<input type='hidden' id='searchG' name='form.searchG' value='<s:property value="form.searchG" />'/>");
		var searchH =$("<input type='hidden' id='searchH' name='form.searchH' value='<s:property value="form.searchH" />'/>");
		var searchI =$("<input type='hidden' id='searchI' name='form.searchI' value='<s:property value="form.searchI" />'/>");
		var searchJ =$("<input type='hidden' id='searchJ' name='form.searchJ' value='<s:property value="form.searchJ" />'/>");
		var searchK =$("<input type='hidden' id='searchK' name='form.searchK' value='<s:property value="form.searchK" />'/>");
		var searchL =$("<input type='hidden' id='searchL' name='form.searchL' value='<s:property value="form.searchL" />'/>");
		var searchM =$("<input type='hidden' id='searchM' name='form.searchM' value='<s:property value="form.searchM" />'/>");
		var searchN =$("<input type='hidden' id='searchN' name='form.searchN' value='<s:property value="form.searchN" />'/>");
		var searchO =$("<input type='hidden' id='searchO' name='form.searchO' value='<s:property value="form.searchO" />'/>");
		var searchP =$("<input type='hidden' id='searchP' name='form.searchP' value='<s:property value="form.searchP" />'/>");
		var searchQ =$("<input type='hidden' id='searchQ' name='form.searchQ' value='<s:property value="form.searchQ" />'/>");
		var searchR =$("<input type='hidden' id='searchR' name='form.searchR' value='<s:property value="form.searchR" />'/>");
		var searchS =$("<input type='hidden' id='searchS' name='form.searchS' value='<s:property value="form.searchS" />'/>");
		var searchT =$("<input type='hidden' id='searchT' name='form.searchT' value='<s:property value="form.searchT" />'/>");
		var searchU =$("<input type='hidden' id='searchU' name='form.searchU' value='<s:property value="form.searchU" />'/>");
		var searchV =$("<input type='hidden' id='searchV' name='form.searchV' value='<s:property value="form.searchV" />'/>");
		var searchW =$("<input type='hidden' id='searchW' name='form.searchW' value='<s:property value="form.searchW" />'/>");
		var searchX =$("<input type='hidden' id='searchX' name='form.searchX' value='<s:property value="form.searchX" />'/>");
		var searchY =$("<input type='hidden' id='searchY' name='form.searchY' value='<s:property value="form.searchY" />'/>");
		var searchZ =$("<input type='hidden' id='searchZ' name='form.searchZ' value='<s:property value="form.searchZ" />'/>");
		if($("#page").val()==undefined &&$("#form1").attr("action").indexOf("page=")<0){
			 $("#form1").append(page);
		}  
		if($("#pageSize").val()==undefined &&$("#form1").attr("action").indexOf("pageSize=")<0){
			 $("#form1").append(pageSize);
		}
		if(document.getElementsByName("form.searchA")[0]==undefined)$("#form1").append(searchA); 
		if(document.getElementsByName("form.searchB")[0]==undefined)$("#form1").append(searchB);
		if(document.getElementsByName("form.searchC")[0]==undefined)$("#form1").append(searchC); 
		if(document.getElementsByName("form.searchD")[0]==undefined)$("#form1").append(searchD); 
		if(document.getElementsByName("form.searchE")[0]==undefined)$("#form1").append(searchE); 
		if(document.getElementsByName("form.searchF")[0]==undefined)$("#form1").append(searchF); 
		if(document.getElementsByName("form.searchG")[0]==undefined)$("#form1").append(searchG);
		if(document.getElementsByName("form.searchH")[0]==undefined)$("#form1").append(searchH); 
		if(document.getElementsByName("form.searchI")[0]==undefined)$("#form1").append(searchI); 
		if(document.getElementsByName("form.searchJ")[0]==undefined)$("#form1").append(searchJ); 
		if(document.getElementsByName("form.searchK")[0]==undefined)$("#form1").append(searchK); 
		if(document.getElementsByName("form.searchL")[0]==undefined)$("#form1").append(searchL);
		if(document.getElementsByName("form.searchM")[0]==undefined)$("#form1").append(searchM); 
		if(document.getElementsByName("form.searchN")[0]==undefined)$("#form1").append(searchN); 
		if(document.getElementsByName("form.searchO")[0]==undefined)$("#form1").append(searchO); 
		if(document.getElementsByName("form.searchP")[0]==undefined)$("#form1").append(searchP); 
		if(document.getElementsByName("form.searchQ")[0]==undefined)$("#form1").append(searchQ);
		if(document.getElementsByName("form.searchR")[0]==undefined)$("#form1").append(searchR); 
		if(document.getElementsByName("form.searchS")[0]==undefined)$("#form1").append(searchS); 
		if(document.getElementsByName("form.searchT")[0]==undefined)$("#form1").append(searchT); 
		if(document.getElementsByName("form.searchU")[0]==undefined)$("#form1").append(searchU); 
		if(document.getElementsByName("form.searchV")[0]==undefined)$("#form1").append(searchV);
		if(document.getElementsByName("form.searchW")[0]==undefined)$("#form1").append(searchW); 
		if(document.getElementsByName("form.searchX")[0]==undefined)$("#form1").append(searchX); 
		if(document.getElementsByName("form.searchY")[0]==undefined)$("#form1").append(searchY); 
		if(document.getElementsByName("form.searchZ")[0]==undefined)$("#form1").append(searchZ); 
	}
	$("#form1").submit();
	if($("#form1").attr("action").indexOf("!download")<0){
		DivSetVisible(true);
	}
	
}

function showColumn(){
	if($("#table1").size()>0){
		$.ajax({	
			type:'post',
			dataType:'json',
			async:false,//定义同步方式
			url:'<%=path%>/tree!showColumn',//查询列显示
			success:function(data){   
				if(data.showList!=undefined&&data.showList!=null){ 
					readFixTable("table1");
					var begin = 0 ;//从第几列显示
					var show = 0;
					var blShow = true;
					$("#table1 tr").each(function(index){
						if(index==0){ 
							$(this).children("td").each(function(index1){
								//取最里层列名
								var valindex = $(this).html();
								if($(this).children().length>0){
									valindex = $(this).children().eq(0).html();
									if($(this).children().eq(0).children().length>0){
										valindex = $(this).children().eq(0).children().eq(0).html();  
									}
								}
								if(valindex.indexOf("序")>-1){
									begin = index1; 
								}
							});
						}
						$(this).children("td").each(function(index1){ 
							if(index1>begin && (index1-begin-1)<data.showList.length && data.showList[index1-begin-1]==1){ 
								$(this).css("display","none");
							}else{
								$(this).css("display","");
								show = index1;  
								 
								if($("#table1 tr").eq(0).children("td").eq(index1).attr("width")==''||
										$("#table1 tr").eq(0).children("td").eq(index1).attr("width")==null||
										$("#table1 tr").eq(0).children("td").eq(index1).attr("width")==undefined){ //判断是否去掉最后一列固定宽度
									blShow = false; 
								}
							}
							
						});  
					}); 
					if(blShow)$("#table1 tr").eq(0).children("td").eq(show).removeAttr("width");//去掉最后一列固定宽度
					reloadFixTable("table1");
		 			getwidth("table1");
				}
			},
			error:function (data,textStatus,errorThrown) {  
			}
		  }); 
		
	}
		
}

function setShowColumn(type){
	var val = new  Array();
	var i=0;
	obj = $("#table1_tableFix").length>0?"table1_tableFix":"table1";
	$("#"+obj+" tr").each(function(index){
		if(index==0){
			var flag = false;
			$(this).children("td").each(function(index1){
				//取最里层列名
				var valindex = $(this).html();
				if($(this).children().length>0){
					valindex = $(this).children().eq(0).html();
					if($(this).children().eq(0).children().length>0){
						valindex = $(this).children().eq(0).children().eq(0).html();  
					}
				}
				if(flag){
					val[i++]  = valindex;
				}
				if(valindex.indexOf("序")>-1){
					flag = true;
				}
				
				
			});
		}
		
	});
	var arguemnts = new Object();
	arguemnts.window = window;
	arguemnts.val = val; 
	arguemnts.type = type;
	var returnValue = window.showModalDialog("<%=path%>/showColumn.jsp",arguemnts,'dialogHeight:350px;dialogWidth:250px;center:yes;help:no;resizable:no;status:no;scroll:no;location:no;');
}
/**
 * 查询json的长度
 */
function getJsonLength(jsonData){
	var jsonLength = 0; 
	for(var item in jsonData){
		jsonLength++;
	} 
	return jsonLength;
}
/**
 * 查询json第几个的value
 */
function getJsonValue(jsonData,i){
	var jsonLength = 0; 
	for(var item in jsonData){
		if(jsonLength++==i){
			return jsonData[item];
		} 
	} 
	return "";
}
/**
 * 查询json第几个的name
 */
function getJsonName(jsonData,i){
	var jsonLength = 0; 
	for(var item in jsonData){
		if(jsonLength++==i){
			return item;
		} 
	} 
	return "";
}

/**
 *	自动填写下拉框
 *	@param id 显示框ID
 *	@param table 查询数据表方法
 *	@param ids 选择后返回值填充到ID组的JSON {"输出参数1":"位置ID1","输出参数2":"位置ID2"}
 *	@param values 选择前要传的条件数组  {"输入参数1":"输入值1","输入参数2":"输入值2"}
 *	@param hasMore 是否显示更多选项，默认true
 *	@param mustMatch 是否限制输入的有效性，默认true
 *	@param size 最大显示条数，默认10
 */
function autocomplete(id,table,ids,values,hasMore,mustMatch,size ){
	//判断是否有输出位置 
	if(getJsonLength(ids)==0){return;};
	if(size==""||size==null||size==undefined){
		size=10;
	}
	
	$( "#"+id ).autocomplete({
		//appendTo:"body",// 自动填充的下拉列表放到哪个元素内部
		autoFocus:true,//自动将第一个值填写,默认为false
		//delay: 300, // 停止输入到自动填充被激活的延迟时间，默认为300 
		minLength: 0, // 自动填充被激活前需要输入的最小字符数，默认为1
		//position: {my: "left top", at: "left bottom"}, // 下拉列表相对于文本框的位置
		source: function(request, response) {
				var dataJson = {  
			    	autocomplete:true,
			    	name: request.term  ,
			        pageSize:size,
			        "form.auto_table":table
			    };
				dataJson["form."+getJsonName(ids,0)] = request.term;
				dataJson["form.auto_like"] = getJsonName(ids,0);//设置自动填写所筛选的参数
				for(var j in values){
					dataJson["form."+j] = values[j];//设置查询条件
			 	} 
		            $.ajax({  
		                url: "<%=path%>/tree!auto",  
		                type: 'POST',
		                data:dataJson,  
		                dataType: "json",  
		                success: function(data, textStatus, jqXHR) {  
		                	result  = $.map(data.treeList, function(item, index) {
		                		jsonString = {label:item[getJsonName(ids,0)],name:item[getJsonName(ids,0)] };  
		                			$.each(item, function(i, v) { 
		                				jsonString[i]=v;         
	                		 		}); 
		                        return jsonString;  
		                    });
		                		if(hasMore!=false){
		                			result.push({label:"<span style='color:red;font:font-weight: bold;' >更多...</span>",value:"[MORE]",id:"[MORE]"});
		                		}
		                    response(result);  
		                },
		                error:function(e,e1,e2){
		                	result = [];
		                	if(hasMore!=false){
	                			result.push({label:"<span style='color:red;font:font-weight: bold;' >更多...</span>",value:"[MORE]",id:"[MORE]"});
	                		}
		                    response(result); 
		                }
		            });  
		        }, // 自动填充的备选数据
		close: function(event, ui) {
			 if(mustMatch!=false){
				 $( "#"+id ).css("color","");//验证后去掉颜色
			 }
		}, // 下拉列表隐藏时被触发
		search: function(event, ui) {
			 	if(mustMatch!=false){
			 		$( "#"+id ).css("color","#999999");//必须验证时，未验证文字为浅色
			 		//保存搜索前的原始值
			  		if($("#"+id+"_new").val()==undefined){
				 		$("body").append("<input type='hidden' id='"+id+"_new'  >");
			  		} 
			  		$( "#"+id+"_new" ).val($( "#"+id+"_old" ).val()); 
			 	}
			}, // 在搜索执行前满足minLength 和 delay 后触发，自动填充数据请求开始之前被触发 
		change: function( event, ui ) {
			 if(mustMatch!=false){
				 $( "#"+id ).css("color","");//验证后去掉颜色
			 }
			$( "#"+id ).val($( "#"+id ).val().trim());
			//填充ID组
			 if(ui.item!=null&&ui.item.id!="[MORE]"){
				 jsonLength = 0;
				 for(var j in ids){
						if(jsonLength++>0){
							   $("#"+ids[j]).val(ui.item[j]);
						} 
				 } 
			 }else{
				
				 if( $( "#"+id ).val()==""){//如果输入为空，则全部清空
					 jsonLength = 0;
					 for(var j in ids){
							if(jsonLength++>0){
								   $("#"+ids[j]).val("");
							} 
					 } 
				 }else if(mustMatch!=false){
					 $( "#"+id ).val($( "#"+id+"_new" ).val());  
				 }
			 }
			},//如果输入域的值改变则触发该事件
		create: function( event, ui ) {},//当创建 autocomplete 时触发
		 focus: function(event, ui) {
			 if(ui.item.id=="[MORE]"){
				 ui.item.value="";
				 return false;
			 	}
			 }, // 下拉列表项被聚焦时触发，ui.item对应被聚焦的列表项 
		 open: function(event, ui) {}, // 下拉列表打开时被触发
		 response: function( event, ui ) {},//在搜索完成后菜单显示前触发
		 select: function( event, ui ) { 
			 if(mustMatch!=false)$( "#"+id ).css("color","");//验证后去掉颜色
			 //填充ID组
			 if(ui.item!=null&&ui.item.id!="[MORE]"){  
				 jsonLength = 0;
				 for(var j in ids){
						if(jsonLength++>0){
							   $("#"+ids[j]).val(ui.item[j]);
						} 
				 } 
				 $("#"+id).blur();//选中后失焦，以便下次改变
			 }else{
				  if(mustMatch!=false){
					 $( "#"+id ).val($( "#"+id+"_new" ).val());  
				 }
			 } 
			 if(ui.item.id=="[MORE]"){
				 ui.item.value=""; 
				 auto_more(table,ids,values);//弹出放大镜
				 return false;
				 }
			 }//当从菜单中选择条目时触发。默认的动作是把文本域中的值替换为被选中的条目的值。 
	}); 
	if(mustMatch!=false){//如果验证，保存旧名称以便还原
		$("body").append("<input type='hidden' id='"+id+"_old' value='"+$( "#"+id ).val()+"'>");
		$( "#"+id ).focus(function(){
				$( "#"+id+"_old" ).val($( "#"+id ).val());
		});
	}
}
 /**
  *	点更多弹出查询框
  *	@param table 查询数据表方法
  *	@param ids 选择后返回值填充到ID组的JSON {"输出参数1":"位置ID1","输出参数2":"位置ID2"}
  *	@param values 选择前要传的条件数组  {"输入参数1":"输入值1","输入参数2":"输入值2"}
  */
 function auto_more(table,ids,values){
	 var arguemnts = new Object();
		arguemnts.window = window;
		arguemnts.table = table;
		arguemnts.ids = ids; 
		arguemnts.values = values;
	var returnValue = window.showModalDialog('<%=path%>/jsp/tree/auto_table.jsp',arguemnts,'dialogHeight:500px;dialogWidth:750px;center:yes;help:no;resizable:yes;status:no;scroll:auto;location:no;');
 }
  
/** 
  判断浏览器名称和版本 
  目前只能判断:ie/firefox/chrome/opera/safari 
  浏览器内核UA:UA; 
  浏览器内核名称:NV.name; 
  浏览器内核版本:NV.version; 
  浏览器外壳名称:NV.shell; 
*/  
function checkNavigator(){
	var NV = {};  
	var UA = navigator.userAgent.toLowerCase();  
	try  {  
		NV.name=(UA.indexOf("msie")>0)?'ie':  
  			(UA.indexOf("firefox")>0)?'firefox':  
  			(UA.indexOf("chrome")>0)?'chrome':  
  			window.opera?'opera':  
  			window.openDatabase?'safari':  
  			'unkonw';  
	}catch(e){};  
	try  {  
  		NV.version=(NV.name=='ie')?UA.match(/msie ([\d.]+)/)[1]:  
  			(NV.name=='firefox')?UA.match(/firefox\/([\d.]+)/)[1]:  
  			(NV.name=='chrome')?UA.match(/chrome\/([\d.]+)/)[1]:  
  			(NV.name=='opera')?UA.match(/opera.([\d.]+)/)[1]:  
  			(NV.name=='safari')?UA.match(/version\/([\d.]+)/)[1]:  
  			'0';  
	}catch(e){};  
	try  {  
  		NV.shell=(UA.indexOf('360ee')>-1)?'360极速浏览器':  
  			(UA.indexOf('360se')>-1)?'360安全浏览器':  
  			(UA.indexOf('se')>-1)?'搜狗浏览器':  
  			(UA.indexOf('aoyou')>-1)?'遨游浏览器':  
  			(UA.indexOf('theworld')>-1)?'世界之窗浏览器':  
  			(UA.indexOf('worldchrome')>-1)?'世界之窗极速浏览器':  
  			(UA.indexOf('greenbrowser')>-1)?'绿色浏览器':  
  			(UA.indexOf('qqbrowser')>-1)?'QQ浏览器':  
  			(UA.indexOf('baidu')>-1)?'百度浏览器':  
 			 '未知或无壳';  
	}catch(e){}  
<%--	alert('浏览器UA='+UA+  --%>
<%--		  '\n\n浏览器名称='+NV.name+  --%>
<%--		  '\n\n浏览器版本='+parseInt(NV.version)+  --%>
<%--		  '\n\n浏览器外壳='+NV.shell);  --%>
	return NV;
 
}

/**
 * 重载锁定表头和列（方便页面变化时使用）
 * 变化时使用方式： 
 *				readFixTable(TableID);
 *				按需要构造table
 *              reloadFixTable(TableID,trnumber, FixColumnNumber, width, height);
 *				getwidth(TableID,minHeight,goodHeight);
 */
function reloadFixTable(TableID,trnumber, FixColumnNumber, width, height){
	if ($("#" + TableID + "_input").val() == undefined) { 
		$('<input type="hidden" id="' + TableID + '_input"/>' ).appendTo("body"); 
		$("#" + TableID + "_input").val($("#" + TableID).html());
	} else{
		$("#" + TableID + "_input").val($("#" + TableID).html());
	} 
	FixTable(TableID,trnumber, FixColumnNumber, width, height,true);
}
/**
 * 还原table为重载做准备
 */
function readFixTable(TableID,trnumber,FixColumnNumber){
	if ($("#" + TableID + "_input").val() == undefined) { 
		$('<input type="hidden" id="' + TableID + '_input"/>' ).appendTo("body"); 
		returnRowsTable($("#" + TableID));//跨行跨列的table补充行列
		$("#" + TableID + "_input").val($("#" + TableID).html());
	} else{ 
		var value_input = $("#" + TableID).clone(true);
		value_input.attr("id", TableID + "_value_input");
		value_input.hide();
		value_input.html($("#" + TableID + "_input").val());
		if(trnumber==undefined){
			trnumber = 1;
		}
		if(FixColumnNumber==undefined){
			value_input.children("tbody:eq(0)").children("tr:eq(0)").children("td").each(function(index){  
				if(FixColumnNumber==undefined&& $(this).html().indexOf("序")>-1){
					FixColumnNumber = index+1; 
				} 
			}); 
			if(FixColumnNumber==undefined){
				FixColumnNumber = 0;
			}
		}  
		value_input.children("tbody:eq(0)").children("tr").each(function(index){//还原行列 
			$(this).children("td:lt(" + FixColumnNumber + ")").each(function (index1) { 
				$("#" + TableID).children("tbody:eq(0)").children("tr:eq("+index+")").children("td:eq("+index1+")").html( $(this).html());  
			}); 
			if(index<trnumber){ 
				$(this).children("td").each(function (index1) {  //还原列
					$("#" + TableID).children("tbody:eq(0)").children("tr:eq("+index+")").children("td:eq("+index1+")").html( $(this).html());  
				}); 
			}
			
			
		}); 
		value_input.remove();
	} 
}
/**
 * 跨行跨列的table还原
 */
function  returnRowsTable(obj){
	$("tr",obj).each(function(trindex,tritem){ 
		$(tritem).children("td").each(function(tdindex,tditem){ 
			var rowspanCount=$(tditem).attr("rowspan"); 
			var colspanCount=$(tditem).attr("colspan"); 
			var value=$(tditem).text(); 
			var newtd="<td style='display:none;'></td>"; 
			if(rowspanCount>1){ 
				var parent=$(tditem).parent("tr")[0]; 
				while(rowspanCount-->1){ 
					$(parent).next().prepend(newtd); 
					parent=$(parent).next(); 
				} 
				//$(tditem).attr("rowspan",1); 
			} 
			if(colspanCount>1){ 
				while(colspanCount-->1){ 
					$(tditem).after(newtd); 
				} 
				//$(tditem).attr("colspan",1); 
			} 
		}); 
	}); 
	
}
/**
 * 锁定表头和列
 * TableID: 要锁定的Table的ID
 * trnumber: 要锁定行的个数
 * FixColumnNumber: 要锁定列的个数
 * width： 显示的宽度
 * height： 显示的高度
 */
function FixTable(TableID,trnumber, FixColumnNumber, width, height,hasReload) { 
	if ($("#" + TableID).length == 0) {
		 return;
	 }
	
	
	//创建table储存框
		if ($("#" + TableID + "_input").val() == undefined) { 
			$('<input type="hidden" id="' + TableID + '_input"/>' ).appendTo("body"); 
			returnRowsTable($("#" + TableID));//跨行跨列的table补充行列
			$("#" + TableID + "_input").val($("#" + TableID).html());
		} else if(hasReload!=true){   
			 readFixTable(TableID,trnumber,FixColumnNumber);  
			$("#" + TableID + "_input").val($("#" + TableID).html()); 
		}  
	 if(trnumber==undefined){
		trnumber = 1;
	}
	
	if(FixColumnNumber==undefined){ 
		$("#" + TableID+" tr:eq(0)").children("td").each(function(index){  
				if(FixColumnNumber==undefined&& $(this).html().indexOf("序")>-1){
					FixColumnNumber = index+1; 
				} 
		}); 
			
		if(FixColumnNumber==undefined){
				FixColumnNumber = 0;
			}
	}  
	
	$("#" + TableID).attr("cellspacing","0");//过滤table样式 
	if(width==undefined){
		width = 600;
	}
	if(height==undefined){
		height = 300;
	}
	//创建框架  _tableLayout 外框
	if ($("#" + TableID + "_tableLayout").length != 0) { 
		$("#" + TableID + "_tableLayout").before($("#" + TableID)); 
		$("#" + TableID + "_tableLayout").empty(); 
	} else {  
		$("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='border:1px solid #a8c7ce; overflow:hidden;height:" + height + "px; width:" + width + "px;'></div>"); 
	}  
	
	
	//左上角覆盖固定不动的table，命名为tableFix
	//用上部的table覆盖在更上层，命名为tableHead
	//用左边的table覆盖在上层，命名为tableColumn
	//原始table，命名为_tableData
	$('<div id="' + TableID + '_tableFix"></div>' + '<div id="' + TableID + '_tableHead"></div>' + '<div id="' + TableID + '_tableColumn"></div>' + '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout"); 
	
	var oldtable = $("#" + TableID); //原table
	var tableFixClone = oldtable.clone(true); //克隆为左上角覆盖固定不动的table
	tableFixClone.attr("id", TableID + "_tableFixClone");  
	$("#" + TableID + "_tableFix").append(tableFixClone); //左上角_tableFix添加table  
	$("#" + TableID + "_tableFix").children("table:eq(0)").children("tbody:eq(0)").children("tr:gt(" + (trnumber-1) + ")").remove(); //去掉左上角多余的行
		if(trnumber==0){
			$("#" + TableID + "_tableFix").children("table:eq(0)").children("tbody:eq(0)").children("tr").remove();
		}
		  
	$("#" + TableID + "_tableFix").children("table:eq(0)").children("tbody:eq(0)").children("tr").each(function(index){ //去掉左上角多余的列 
		$(this).children("td:gt(" + (FixColumnNumber-1) + ")").html("&nbsp;"); 
		if(FixColumnNumber==0){
			$(this).children("td").html("&nbsp;");
		}
	});

	var tableHeadClone = oldtable.clone(true); 
	tableHeadClone.attr("id", TableID + "_tableHeadClone"); 
	$("#" + TableID + "_tableHead").append(tableHeadClone);//上部_tableHead添加table
	$("#" + TableID + "_tableHead").children("table:eq(0)").children("tbody:eq(0)").children("tr:gt(" + (trnumber-1) + ")").remove(); //去掉上部多余的行
		if(trnumber==0){
			$("#" + TableID + "_tableHead").children("table:eq(0)").children("tbody:eq(0)").children("tr").remove();
		}
		
	$("#" + TableID + "_tableHead").children("table:eq(0)").children("tbody:eq(0)").children("tr").each(function(index){ //去掉上部多余的列 
		$(this).children("td:lt(" + FixColumnNumber + ")").html("&nbsp;");
	});
	
	var tableColumnClone = oldtable.clone(true); 
	tableColumnClone.attr("id", TableID + "_tableColumnClone"); 
	$("#" + TableID + "_tableColumn").append(tableColumnClone);//左边tableColumn添加table
	$("#" + TableID + "_tableColumn").children("table:eq(0)").children("tbody:eq(0)").children("tr:lt(" + trnumber + ")").children("td").html("&nbsp;");//去掉左边多余的行
		 
	$("#" + TableID + "_tableColumn").children("table:eq(0)").children("tbody:eq(0)").children("tr").each(function(index){ //去掉左边多余的列 
		$(this).removeAttr("id");//去掉tr，td的id以便不影响页面控制
		$(this).removeAttr("class");//去掉tr，td的class以便不影响页面控制
		$(this).children("td").removeAttr("id");
		$(this).children("td").removeAttr("class");//去掉tr，td的class以便不影响页面控制
		$(this).children("td:gt(" + (FixColumnNumber-1) + ")").html("&nbsp;"); 
		if(FixColumnNumber==0){
			$(this).children("td").html("&nbsp;"); 
		}
	});  
	
	
	$("#" + TableID + "_tableData").append(oldtable); //右下原始_tableData添加table
	$("#" + TableID + "_tableData").children("table:eq(0)").children("tbody:eq(0)").children("tr:lt(" + trnumber + ")").children("td").html("&nbsp;"); //去掉右下多余的行
		 
	$("#" + TableID + "_tableData").children("table:eq(0)").children("tbody:eq(0)").children("tr").each(function(index){ //去掉右下多余的列
		$(this).children("td:lt(" + FixColumnNumber + ")").html("&nbsp;"); 
		
		$(this).children("td:gt(" + (FixColumnNumber-1) + ")").html(function () {//填充空白td
				 
					return $(this).html().trim()==""?"&nbsp;":$(this).html() ;  
				 
				 
			});  
			 
		if(FixColumnNumber==0){
			$(this).children("td").html(function () {//填充空白td
				 
					return $(this).html().trim()==""?"&nbsp;":$(this).html() ;  
				 
				 
			});
		}
	});  
	$("#" + TableID + "_tableLayout table").css("margin", "0"); //外边距设为0
	 
	//计算tableFix，tableHead的高度
	var HeadHeight = $("#" + TableID + "_tableHead").height()-2; 
	HeadHeight += 2; 
	$("#" + TableID + "_tableHead").css("height", HeadHeight); 
	$("#" + TableID + "_tableFix").css("height", HeadHeight); 
	//计算tableFix，tableColumn的宽度
	var ColumnsWidth = 0; 
	var ColumnsNumber = 0; 
	$("#" + TableID + "_tableColumn tr:first td:lt(" + FixColumnNumber + ")").each(function () { 
		ColumnsWidth += $(this).outerWidth(true); 
		ColumnsNumber++; 
	}); 
	ColumnsWidth += 2; 
	if ($.browser.msie) { 
		switch ($.browser.version) { 
			case "7.0": if (ColumnsNumber >= 3) ColumnsWidth--; 
					break; 
			case "8.0": if (ColumnsNumber >= 2) ColumnsWidth--; 
					break; 
		} 
	}
	$("#" + TableID + "_tableColumn").css("width", ColumnsWidth); 
	$("#" + TableID + "_tableFix").css("width", ColumnsWidth); 
	//为tableHead和tableColumn添加联动的滚动条事件
	$("#" + TableID + "_tableData").scroll(function () { //滚动table时
		$("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft()); //上部滚动条的水平位置和table一致
		$("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop()); //侧边滚动条的水平位置和table一致
	}); 
	$("#" + TableID + "_tableColumn").scroll(function () { //滚动_tableColumn时
		$("#" + TableID + "_tableData").scrollTop($("#" + TableID + "_tableColumn").scrollTop()); //侧边滚动条的水平位置和_tableColumn一致 
	}); 
	$("#" + TableID + "_tableHead").scroll(function () { //滚动_tableHead时
		$("#" + TableID + "_tableData").scrollLeft($("#" + TableID + "_tableHead").scrollLeft()); //上部滚动条的水平位置和_tableHead一致
	}); 
	//为整体添加样式 
	$("#" + TableID + "_tableFix").css({ "overflow": "hidden", "position": "relative", "z-index": "6", "background-color": "#d3eaef" }); 
	$("#" + TableID + "_tableHead").css({ "overflow": "hidden", "width": width - 17, "position": "relative", "z-index": "5", "background-color": "#d3eaef" }); 
	$("#" + TableID + "_tableColumn").css({ "overflow": "hidden", "height": height - 17, "position": "relative", "z-index": "5", "background-color": "#d3eaef" }); 
	$("#" + TableID + "_tableData").css({ "overflow": "auto", "width": width, "height": height, "position": "relative", "z-index": "4"  }); 
	$("#" + TableID + "_tableFix").find("tr").css({  "background-color": "#d3eaef","font-size":"12px","font-weight":"bold" }); 
	$("#" + TableID + "_tableHead").find("tr").css({  "background-color": "#d3eaef","font-size":"12px","font-weight":"bold" }); 
	$("#" + TableID + "_tableColumn").find("tr").css({  "background-color": "#d3eaef" });  
	
	//为较小的table修正样式
	if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableHead table").width()) { 
		$("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableHead table").width()); 
		$("#" + TableID + "_tableData").css("width", $("#" + TableID + "_tableHead table").width() + 17); 
	} 
	if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").height()) { 
		$("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").height()); 
		$("#" + TableID + "_tableData").css("height", $("#" + TableID + "_tableColumn table").height() + 17); 
	}   
	//定位 
	$("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset()); 
	$("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset()); 
	$("#" + TableID + "_tableColumn").offset($("#" + TableID + "_tableLayout").offset()); 
	$("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());
	
	if($("#orderby").val()!=undefined){
	$("#" + TableID + "_tableHead").children("table:eq(0)").children("tbody:eq(0)").children("tr").each(function(index){ //上部列添加排序按钮
		 
			$(this).children("td:gt(" + (FixColumnNumber-1) + ")").each(function () { 
				if($(this).attr("orderby")!=undefined &&$(this).attr("orderby")!=null&&$(this).attr("orderby")!="" ){
					ordername=$(this).attr("orderby");//排序名称，下次正序
					orderimg="ui-icon ui-icon-radio-off";//排序图片
					method = $(this).attr("method")==undefined?"":$(this).attr("method");
					if($(this).attr("orderby")==$("#orderby").val().split(" ")[0]){//如果按当前列排序
						if($("#orderby").val().split(" ").length>1&&$("#orderby").val().split(" ")[1].indexOf("desc")>-1){//如果倒序
							orderimg = "ui-icon ui-icon-triangle-1-n";//倒序图片
							ordername =""; //下次不排序
						}else{
							orderimg = "ui-icon ui-icon-triangle-1-s";//正序图片
							ordername +=" desc"; //下次倒序
						}
					}
					$(this).html("<table width='100%' height='100%' style='font-size:12px;font-weight: bold;'  ><tr ><td style='border:0px;line-height:20px'  >"+$(this).html()+"</td><td  style='cursor:pointer;' class='"+orderimg+"' onclick=\"orderBy('"+ordername+"','"+method+"');\"></td></tr></table>");  
					
				}
			});
			if(FixColumnNumber==0){
				$(this).children("td").each(function (index) {
					if($(this).attr("orderby")!=undefined &&$(this).attr("orderby")!=null&&$(this).attr("orderby")!="" ){
						ordername=$(this).attr("orderby");//排序名称，下次正序
						orderimg="ui-icon ui-icon-radio-off";//排序图片
						method = $(this).attr("method")==undefined?"":$(this).attr("method");
						if($(this).attr("orderby")==$("#orderby").val().split(" ")[0]){//如果按当前列排序
							if($("#orderby").val().split(" ").length>1&&$("#orderby").val().split(" ")[1].indexOf("desc")>-1){//如果倒序
								orderimg = "ui-icon ui-icon-triangle-1-n";//倒序图片
								ordername =""; //下次不排序
							}else{
								orderimg = "ui-icon ui-icon-triangle-1-s";//正序图片
								ordername +=" desc"; //下次倒序
							}
						}
						$(this).html("<table width='100%' height='100%' style='font-size:12px;font-weight: bold;'  ><tr ><td style='border:0px;line-height:20px'  >"+$(this).html()+"</td><td  style='cursor:pointer;' class='"+orderimg+"' onclick=\"orderBy('"+ordername+"','"+method+"');\"></td></tr></table>");  
								
					}
				});
			}
		  
		  
	});

	$("#" + TableID + "_tableFix").children("table:eq(0)").children("tbody:eq(0)").children("tr").each(function(index){ //左上角列添加排序按钮
		$(this).children("td:lt(" + FixColumnNumber + ")").each(function () { 
			if($(this).attr("orderby")!=undefined &&$(this).attr("orderby")!=null&&$(this).attr("orderby")!="" ){
				ordername=$(this).attr("orderby");//排序名称，下次正序
				orderimg="ui-icon ui-icon-radio-off";//排序图片
				method = $(this).attr("method")==undefined?"":$(this).attr("method");
				if($(this).attr("orderby")==$("#orderby").val().split(" ")[0]){//如果按当前列排序
					if($("#orderby").val().split(" ").length>1&&$("#orderby").val().split(" ")[1].indexOf("desc")>-1){//如果倒序
						orderimg = "ui-icon ui-icon-triangle-1-n";//倒序图片
						ordername =""; //下次不排序
					}else{
						orderimg = "ui-icon ui-icon-triangle-1-s";//正序图片
						ordername +=" desc"; //下次倒序
					}
				}
				$(this).html("<table width='100%' height='100%' style='font-size:12px;font-weight: bold;'  ><tr ><td style='border:0px;line-height:20px'  >"+$(this).html()+"</td><td  style='cursor:pointer;' class='"+orderimg+"' onclick=\"orderBy('"+ordername+"','"+method+"');\"></td></tr></table>");  
						
			}
		}); 
		 
	});
	}
}
function orderBy(ordername,method){
	if ($("#orderby").val() == undefined) { 
		return;
	}else{
		$("#orderby").val(ordername);
	} 
	if(method!=undefined &&method!=""){
		document.forms[0].action="<%=path%>
	/" + method;
			document.forms[0].submit();
		}
<%--	if($(obj).attr("class")=="ui-icon ui-icon-radio-off"){--%>
	
<%--		$(obj).attr("class","ui-icon ui-icon-triangle-1-s"); --%>
	
<%--	}else if($(obj).attr("class")=="ui-icon ui-icon-triangle-1-s"){--%>
	
<%--		$(obj).attr("class","ui-icon ui-icon-triangle-1-n");--%>
	
<%--	}else if($(obj).attr("class")=="ui-icon ui-icon-triangle-1-n"){--%>
	
<%--		$(obj).attr("class","ui-icon ui-icon-radio-off");--%>
	
<%--	}--%>
	}

	//获得divwidth的宽度
	//var divwidth =null;
	/**
	 * 表格自动伸缩和锁定表头和列
	 * TableID:要锁定的Table的ID
	 * minHeight：表伸缩的最小高度
	 * goodHeight:最适高度
	 */
	function getwidth(TableID, minHeight, goodHeight) {

		/**
		 * 锁定表头和列
		 * TableID: 要锁定的Table的ID
		 * trnumber: 要锁定行的个数
		 * FixColumnNumber: 要锁定列的个数
		 * width： 显示的宽度
		 * height： 显示的高度
		 */
		//if ($("#" + TableID + "_tableLayout").length == 0) { 
		//	FixTable(TableID,trnumber, FixColumnNumber, width, height);
		//}
		//创建table储存框
		if ($("#" + TableID + "_divwidth").val() == undefined) {
			$('<input type="hidden" id="' + TableID + '_divwidth"/>').appendTo(
					"body");
		}
		if (minHeight == undefined) {
			minHeight = 100;
		}
		if (document.getElementById(TableID + "_tableLayout") != undefined) {//判断是否有可以伸缩的表格
			if ($("#" + TableID + "_divwidth").val() != "") {
				$("#" + TableID + "_tableData").children("table")[0].style.width = $(
						"#" + TableID + "_divwidth").val();//插入table实际宽度
				$("#" + TableID + "_tableHead").children("table")[0].style.width = $(
						"#" + TableID + "_divwidth").val();//插入table实际宽度
			}
			document.getElementById(TableID + "_tableLayout").style.width = 0;
			document.getElementById(TableID + "_tableLayout").style.width = $(
					"#" + TableID + "_tableData").parent().parent()[0].offsetWidth; //调整外边框宽度 
			document.getElementById(TableID + "_tableData").style.width = $(
					"#" + TableID + "_tableData").parent().parent()[0].offsetWidth; //调整外边框宽度 
			$("#" + TableID + "_tableHead")
					.css(
							"width",
							$("#" + TableID + "_tableData").parent().parent()[0].offsetWidth);//调整表头宽度  
			var maxHeight;//可调整最大高度
			if ($("#" + TableID + "_tableData").children("table")[0].offsetWidth > document
					.getElementById(TableID + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
				maxHeight = $("#" + TableID + "_tableData").children("table")[0].offsetHeight + 17;//可调整最大高度
			} else {//如果标签div层比table的实际宽度宽，无下边滚动条
				if ($("#" + TableID + "_divwidth").val() == "")
					$("#" + TableID + "_divwidth")
							.val(
									$("#" + TableID + "_tableData").children(
											"table")[0].offsetWidth);//保留table实际宽度
				$("#" + TableID + "_tableData").children("table")[0].style.width = document
						.getElementById(TableID + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度
				$("#" + TableID + "_tableHead").children("table")[0].style.width = document
						.getElementById(TableID + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度
				//	$("#"+TableID+"_tableHead").css("width",document.getElementById(TableID+"_tableLayout").offsetWidth); 
				maxHeight = $("#" + TableID + "_tableData").children("table")[0].offsetHeight;//可调整最大高度
				minHeight = minHeight - 17; //可调整最小高度 
			}
			if ($("#" + TableID + "_tableData").children("table")[0].offsetHeight > document
					.getElementById(TableID + "_tableData").offsetHeight) {//如果table的实际高度比标签div层高，则出现侧边滚动条
				$("#" + TableID + "_tableHead").css("width",
						$("#" + TableID + "_tableHead").width() - 17);//减小表头宽度
				if ($("#" + TableID + "_divwidth").val() != ""
						&& $("#" + TableID + "_tableData").children("table")[0].scrollWidth - 17 >= $(
								"#" + TableID + "_divwidth").val()) {//如果变化后宽度大于表格最小
					$("#" + TableID + "_tableData").children("table")[0].style.width = $(
							"#" + TableID + "_tableData").children("table")[0].scrollWidth - 17;//表格宽度变小
					$("#" + TableID + "_tableHead").children("table")[0].style.width = $(
							"#" + TableID + "_tableHead").children("table")[0].scrollWidth - 17;//表格宽度变小 
				}

			} else {//如果标签div层比table的实际高度高，无侧边滚动条
				//if(divwidth==null)divwidth = $("#"+TableID+"_tableData").children("table")[0].offsetWidth;
				//	$("#"+TableID+"_tableData").children("table")[0].style.width = document.getElementById(TableID+"_tableLayout").offsetWidth;
				//	$("#"+TableID+"_tableHead").children("table")[0].style.width = document.getElementById(TableID+"_tableLayout").offsetWidth;
				//	$("#"+TableID+"_tableHead").css("width",document.getElementById(TableID+"_tableLayout").offsetWidth); 
				//	  maxHeight = $("#"+TableID+"_tableData").children("table")[0].offsetHeight;//可调整最大高度
				//	  minHeight = minHeight-17; //可调整最小高度 
			}
			if (goodHeight == undefined) {//如果未设置最适高度
				var divheight = document.body.clientHeight;//当前body显示高度

				document.getElementById(TableID + "_tableLayout").style.height = divheight;//撑开标签以便判断应调整高度
				goodHeight = divheight
						- ($(document.body).find("table").eq(0).height()
								- document.body.clientHeight + 10);//最适高度 
			}
			if (maxHeight > minHeight) {//如果表格总高度大于最小高度
				if (goodHeight > maxHeight) {//如果最适高度大于表格总高度，以表格总高度为主 
					if ($("#" + TableID + "_tableData").children("table")[0].offsetWidth > document
							.getElementById(TableID + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
						document.getElementById(TableID + "_tableLayout").style.height = maxHeight;
						document.getElementById(TableID + "_tableColumn").style.height = maxHeight;
						document.getElementById(TableID + "_tableData").style.height = maxHeight;//滚动条出现增加高度
					} else {
						document.getElementById(TableID + "_tableLayout").style.height = maxHeight;
						document.getElementById(TableID + "_tableData").style.height = maxHeight;
						document.getElementById(TableID + "_tableColumn").style.height = maxHeight;
					}
<%--				document.getElementById(TableID+"_tableColumn").style.height=document.getElementById(TableID+"_tableData").offsetHeight;--%>
	
<%--				$("#"+TableID+"_tableColumn").css("height",maxHeight);--%>
	} else if (goodHeight > minHeight) {//如果最适高度大于最小高度
<%--				$("#"+TableID+"_tableLayout").css("height",goodHeight);--%>
	//alert($("#"+TableID+"_tableData").children("table")[0].offsetWidth+"="+document.getElementById(TableID+"_tableData").offsetWidth);
					if ($("#" + TableID + "_tableData").children("table")[0].offsetWidth > document
							.getElementById(TableID + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
						document.getElementById(TableID + "_tableLayout").style.height = goodHeight;
						document.getElementById(TableID + "_tableData").style.height = goodHeight;//滚动条出现增加高度
						document.getElementById(TableID + "_tableColumn").style.height = goodHeight - 17;//滚动条出现增加高度
					} else {
						document.getElementById(TableID + "_tableLayout").style.height = goodHeight;
						document.getElementById(TableID + "_tableData").style.height = goodHeight;
						document.getElementById(TableID + "_tableColumn").style.height = goodHeight;

					}

				} else {
					if ($("#" + TableID + "_tableData").children("table")[0].offsetWidth > document
							.getElementById(TableID + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
						//document.getElementById(TableID+"_tableColumn").style.height=maxHeight;
						document.getElementById(TableID + "_tableLayout").style.height = minHeight + 17;
						document.getElementById(TableID + "_tableData").style.height = minHeight + 17;//滚动条出现增加高度
						document.getElementById(TableID + "_tableColumn").style.height = minHeight;//滚动条出现增加高度
					} else {
						document.getElementById(TableID + "_tableLayout").style.height = minHeight;
						document.getElementById(TableID + "_tableData").style.height = minHeight;
						document.getElementById(TableID + "_tableColumn").style.height = minHeight;

					}
					//	document.getElementById(TableID+"_tableLayout").style.height=minHeight;
<%--				document.getElementById(TableID+"_tableData").style.height=minHeight;--%>
	
<%--				$("#"+TableID+"_tableColumn").css("height",minHeight);--%>
	
<%--document.getElementById(TableID+"_tableColumn").style.height=document.getElementById(TableID+"_tableData").offsetHeight;--%>
	}
			} else {
				if ($("#" + TableID + "_tableData").children("table")[0].offsetWidth > document
						.getElementById(TableID + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
					document.getElementById(TableID + "_tableColumn").style.height = maxHeight;
					document.getElementById(TableID + "_tableLayout").style.height = maxHeight;
					document.getElementById(TableID + "_tableData").style.height = maxHeight;//滚动条出现增加高度 
				} else {
					document.getElementById(TableID + "_tableLayout").style.height = maxHeight;
					document.getElementById(TableID + "_tableData").style.height = maxHeight;
					document.getElementById(TableID + "_tableColumn").style.height = maxHeight;

				}
				//document.getElementById(TableID+"_tableLayout").style.height=maxHeight;
<%--			document.getElementById(TableID+"_tableData").style.height=maxHeight;--%>
	
<%--			$("#"+TableID+"_tableColumn").css("height",maxHeight);--%>
	
<%--document.getElementById(TableID+"_tableColumn").style.height=document.getElementById(TableID+"_tableData").offsetHeight;--%>
	}

			//定好宽度高度后再根据滚动条微调
			if ($("#" + TableID + "_tableData").children("table")[0].offsetWidth > document
					.getElementById(TableID + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
				$("#" + TableID + "_tableColumn")
						.css(
								"height",
								document.getElementById(TableID
										+ "_tableLayout").offsetHeight - 17);
			} else {//如果标签div层比table的实际宽度宽，无下边滚动条

				$("#" + TableID + "_tableData").children("table")[0].style.width = document
						.getElementById(TableID + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度
				$("#" + TableID + "_tableHead").children("table")[0].style.width = document
						.getElementById(TableID + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度

			}

			if ($("#" + TableID + "_tableData").children("table")[0].offsetHeight > document
					.getElementById(TableID + "_tableData").offsetHeight) {//如果table的实际高度比标签div层高，则出现侧边滚动条
				$("#" + TableID + "_tableHead")
						.css(
								"width",
								document.getElementById(TableID
										+ "_tableLayout").offsetWidth - 17);//减小表头宽度
				if ($("#" + TableID + "_divwidth").val() != ""
						&& $("#" + TableID + "_tableData").children("table")[0].scrollWidth - 17 > $(
								"#" + TableID + "_divwidth").val()) {//如果变化后宽度大于表格最小
					$("#" + TableID + "_tableData").children("table")[0].style.width = $(
							"#" + TableID + "_tableData").children("table")[0].scrollWidth - 17;//表格宽度变小
					$("#" + TableID + "_tableHead").children("table")[0].style.width = $(
							"#" + TableID + "_tableHead").children("table")[0].scrollWidth - 17;//表格宽度变小 
				} else {//出现侧边滚动条同时出现下侧滚动条
					$("#" + TableID + "_tableColumn")
							.css(
									"height",
									document.getElementById(TableID
											+ "_tableLayout").offsetHeight - 17);
				}
			} else {//如果标签div层比table的实际高度高，无侧边滚动条
				if (document.getElementById(TableID + "_tableData").scrollHeight > document
						.getElementById(TableID + "_tableData").clientHeight) {//如果侧面出现滚动条
					$("#" + TableID + "_tableHead")
							.css(
									"width",
									document.getElementById(TableID
											+ "_tableLayout").offsetWidth - 17);
				} else {
					$("#" + TableID + "_tableHead")
							.css(
									"width",
									document.getElementById(TableID
											+ "_tableLayout").offsetWidth);
				}
<%--			alert($("#"+TableID+"_tableData").children("table")[0].offsetHeight+"="+document.getElementById(TableID+"_tableData").clientHeight+"="+document.getElementById(TableID+"_tableData").scrollHeight);--%>
	//if(divwidth==null)divwidth = $("#"+TableID+"_tableData").children("table")[0].offsetWidth;
<%--				$("#"+TableID+"_tableData").children("table")[0].style.width = document.getElementById(TableID+"_tableLayout").offsetWidth;--%>
	
<%--				$("#"+TableID+"_tableHead").children("table")[0].style.width = document.getElementById(TableID+"_tableLayout").offsetWidth;--%>
	
<%--				$("#"+TableID+"_tableHead").css("width",document.getElementById(TableID+"_tableLayout").offsetWidth); --%>
	
<%--				if($("#"+TableID+"_tableData").children("table")[0].offsetWidth>document.getElementById(TableID+"_tableData").offsetWidth){//如果table的实际宽度比标签div层宽，则出现下边滚动条--%>
	
<%--					$("#"+TableID+"_tableColumn").css("height",document.getElementById(TableID+"_tableLayout").offsetHeight-17); --%>
	
<%--					$("#"+TableID+"_tableData").css("height",document.getElementById(TableID+"_tableLayout").offsetHeight-17); --%>
	
<%--				}else{//如果标签div层比table的实际宽度宽，无下边滚动条--%>
	
<%--					$("#"+TableID+"_tableColumn").css("height",document.getElementById(TableID+"_tableLayout").offsetHeight);  --%>
	
<%--					$("#"+TableID+"_tableData").css("height",document.getElementById(TableID+"_tableLayout").offsetHeight);  --%>
	
<%--				 --%>
	
<%--				} --%>
	//	  maxHeight = $("#"+TableID+"_tableData").children("table")[0].offsetHeight;//可调整最大高度
				//	  minHeight = minHeight-17; //可调整最小高度 
			}
			$("#" + TableID + "_tableColumn").offset(
					$("#" + TableID + "_tableLayout").offset());
			$("#" + TableID + "_tableData").offset(
					$("#" + TableID + "_tableLayout").offset());
			//如果出现div下边出现滚动条，table1宽度减小
			//	if(document.getElementById(TableID+"_tableLayout").offsetWidth>document.getElementById(TableID+"_tableLayout").clientWidth
			//			&&$("#"+TableID+"_tableData").children("table")[0].offsetWidth<=document.getElementById(TableID+"_tableLayout").offsetWidth){
<%--			$("#"+TableID+"_tableData").children("table")[0].style.width = $("#"+TableID+"_tableData").children("table")[0].offsetWidth-100;--%>
	//	}

			//$("#"+TableID+"_tableLayout").css("width",document.getElementById(TableID+"_tableLayout").offsetWidth);
<%--	$("#"+TableID+"_tableHead").css("width",document.getElementById(TableID+"_tableLayout").offsetWidth-17); --%>
	
<%--	$("#MyTable_tableHead").children("table").css("width",document.getElementById("MyTable_tableLayout").offsetWidth-17); --%>
	//$("#"+TableID+"_tableData").css("width",document.getElementById(TableID+"_tableLayout").offsetWidth); 
			//if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableHead table").width()) { 
			//	$("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableHead table").width()); 
			//	$("#" + TableID + "_tableData").css("width", $("#" + TableID + "_tableHead table").width() + 17); 
			//} 
			//if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").height()) { 
			//	$("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").height()); 
			//	$("#" + TableID + "_tableData").css("height", $("#" + TableID + "_tableColumn table").height() + 17); 
			//}
<%--	$("#MyTable_tableData").children("table").css("width",document.getElementById("MyTable_tableLayout").offsetWidth-17); --%>
	
<%--	document.getElementById("MyTable_tableLayout").style.width= document.body.scrollWidth-37;--%>
	//if($("#"+TableID+"_tableHead").children("table")[0].offsetWidth<document.getElementById(TableID+"_tableHead").offsetWidth){//如果标签div层比table的实际宽度宽 
			//		if(divwidth==null)divwidth = $("#"+TableID+"_tableHead").children("table")[0].offsetWidth;
			//		$("#"+TableID+"_tableHead").children("table")[0].style.width = document.getElementById(TableID+"_tableHead").offsetWidth; 
			//		$("#"+TableID+"_tableData").children("table")[0].style.width = document.getElementById(TableID+"_tableHead").offsetWidth; 
			//}
		}
		//调节横向滚动条
		if (document.body.scrollWidth > document.body.clientWidth + 20) {
			$('body').css('overflow-x', 'auto');
		} else {
			$('body').css('overflow-x', 'hidden');
		}
		//调节body纵向滚动条
		if (document.body.scrollHeight > document.body.clientHeight + 20) {
			$('body').css('overflow-y', 'auto');
		} else {
			$('body').css('overflow-y', 'hidden');
		}
	}

	function getwidth1() {

		if (document.getElementById("table1") != undefined
				&& document.getElementById("divwidth") != undefined
				&& document.getElementById("idwidth") != undefined) {
			if (divwidth != null)
				document.getElementById("table1").style.width = divwidth;
			document.getElementById("divwidth").style.width = document.body.offsetWidth - 50;
			document.getElementById("divwidth").style.width = document
					.getElementById("idwidth").offsetWidth;
			var maxHeight;//可调整最大高度
			var minHeight;//可调整最小高度
			if (document.getElementById("table1").offsetWidth > document
					.getElementById("divwidth").offsetWidth) {//如果table的实际宽度比标签div层宽
				maxHeight = document.getElementById("table1").offsetHeight + 17;//可调整最大高度
				minHeight = 100; //可调整最小高度 
			} else {//如果标签div层比table的实际宽度宽
				if (divwidth == null)
					divwidth = document.getElementById("table1").offsetWidth;
				document.getElementById("table1").style.width = document
						.getElementById("divwidth").offsetWidth;
				maxHeight = document.getElementById("table1").offsetHeight;//可调整最大高度
				minHeight = 82; //可调整最小高度 
			}
			var divheight = document.body.offsetHeight;
			document.getElementById("divwidth").style.height = divheight;//撑开标签以便判断应调整高度
			var goodHeight = divheight
					- ($("table").height() - document.body.offsetHeight + 10);//最适高度
<%--			alert(document.getElementById("table1").offsetWidth+"="+document.getElementById("divwidth").offsetWidth);--%>
	if (maxHeight > minHeight) {
				if (goodHeight > maxHeight) {
					document.getElementById("divwidth").style.height = maxHeight;
				} else if (goodHeight > minHeight) {
					document.getElementById("divwidth").style.height = goodHeight;
				} else {
					document.getElementById("divwidth").style.height = minHeight;
				}
			} else {
				document.getElementById("divwidth").style.height = maxHeight;
			}
			//如果出现div高度出现滚动条，table1宽度减小
			if (document.getElementById("divwidth").offsetWidth > document
					.getElementById("divwidth").clientWidth
					&& document.getElementById("table1").offsetWidth <= document
							.getElementById("divwidth").offsetWidth) {
				document.getElementById("table1").style.width = document
						.getElementById("table1").offsetWidth - 17;
			}
		}
		if (document.getElementById("alltable") != undefined) {
			document.getElementById("alltable").style.height = window.parent.document
					.getElementById('main').height - 50;
		}
		if (document.getElementById("PopupDiv") != undefined) {
			document.getElementById("PopupDiv").style.width = document.body.scrollWidth - 10;
			document.getElementById("PopupDiv").style.height = document.body.scrollHeight;
		}
		//调节横向滚动条
		if (document.body.scrollWidth > document.body.clientWidth + 10) {
			$('body').css('overflow-x', 'auto');
		} else {
			$('body').css('overflow-x', 'hidden');
		}
		//调节body纵向滚动条
		if (document.body.scrollHeight > document.body.clientHeight + 20) {
			$('body').css('overflow-y', 'auto');
		} else {
			$('body').css('overflow-y', 'hidden');
		}
	}

	//getMoreWidth(["table1","table2"],[100,100]);
	/**
	 * 表格自动伸缩和锁定表头和列(多列表)
	 * TableID:要锁定的Table的ID
	 * minHeight：表伸缩的最小高度
	 * goodHeight:最适高度
	 */
	function getMoreWidth(TableID, minHeight, goodHeight) {
		for ( var i = 0; i < TableID.length; i++) {
			//创建table储存框
			if ($("#" + TableID[i] + "_divwidth").val() == undefined) {
				$('<input type="hidden" id="' + TableID[i] + '_divwidth"/>')
						.appendTo("body");
			}
		}
		if (minHeight == undefined) {
			minHeight = [];
			for ( var i = 0; i < TableID.length; i++) {
				minHeight[i] = 100;
			}
		}
		if (document.getElementById(TableID[0] + "_tableLayout") != undefined) {//判断是否有可以伸缩的表格
			for ( var i = 0; i < TableID.length; i++) {
				if ($("#" + TableID[i] + "_divwidth").val() != "") {
					$("#" + TableID[i] + "_tableData").children("table")[0].style.width = $(
							"#" + TableID[i] + "_divwidth").val();//插入table实际宽度
					$("#" + TableID[i] + "_tableHead").children("table")[0].style.width = $(
							"#" + TableID[i] + "_divwidth").val();//插入table实际宽度
				}
			}
			for ( var i = 0; i < TableID.length; i++) {
				document.getElementById(TableID[i] + "_tableLayout").style.width = 0;
			}
			for ( var i = 0; i < TableID.length; i++) {
				document.getElementById(TableID[i] + "_tableLayout").style.width = $(
						"#" + TableID[i] + "_tableData").parent().parent()[0].offsetWidth; //调整外边框宽度 
				document.getElementById(TableID[i] + "_tableData").style.width = $(
						"#" + TableID[i] + "_tableData").parent().parent()[0].offsetWidth; //调整外边框宽度 
				$("#" + TableID[i] + "_tableHead")
						.css(
								"width",
								$("#" + TableID[i] + "_tableData").parent()
										.parent()[0].offsetWidth);//调整表头宽度  
			}
			var maxHeight = [];//可调整最大高度
			for ( var i = 0; i < TableID.length; i++) {

				if ($("#" + TableID[i] + "_tableData").children("table")[0].offsetWidth > document
						.getElementById(TableID[i] + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
					maxHeight[i] = $("#" + TableID[i] + "_tableData").children(
							"table")[0].offsetHeight + 17;//可调整最大高度
				} else {//如果标签div层比table的实际宽度宽，无下边滚动条
					if ($("#" + TableID[i] + "_divwidth").val() == "")
						$("#" + TableID[i] + "_divwidth").val(
								$("#" + TableID[i] + "_tableData").children(
										"table")[0].offsetWidth);//保留table实际宽度
					$("#" + TableID[i] + "_tableData").children("table")[0].style.width = document
							.getElementById(TableID[i] + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度
					$("#" + TableID[i] + "_tableHead").children("table")[0].style.width = document
							.getElementById(TableID[i] + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度
					maxHeight[i] = $("#" + TableID[i] + "_tableData").children(
							"table")[0].offsetHeight;//可调整最大高度
					minHeight[i] = minHeight[i] - 17; //可调整最小高度 
				}
				if ($("#" + TableID[i] + "_tableData").children("table")[0].offsetHeight > document
						.getElementById(TableID[i] + "_tableData").offsetHeight) {//如果table的实际高度比标签div层高，则出现侧边滚动条
					$("#" + TableID[i] + "_tableHead").css("width",
							$("#" + TableID[i] + "_tableHead").width() - 17);//减小表头宽度
					if ($("#" + TableID[i] + "_divwidth").val() != ""
							&& $("#" + TableID[i] + "_tableData").children(
									"table")[0].scrollWidth - 17 >= $(
									"#" + TableID[i] + "_divwidth").val()) {//如果变化后宽度大于表格最小
						$("#" + TableID[i] + "_tableData").children("table")[0].style.width = $(
								"#" + TableID[i] + "_tableData").children(
								"table")[0].scrollWidth - 17;//表格宽度变小
						$("#" + TableID[i] + "_tableHead").children("table")[0].style.width = $(
								"#" + TableID[i] + "_tableHead").children(
								"table")[0].scrollWidth - 17;//表格宽度变小 
					}

				}
			}

			if (goodHeight == undefined) {//如果未设置最适高度
				goodHeight = [];
				for ( var i = 0; i < TableID.length; i++) {
					var divheight = document.body.clientHeight;//当前body显示高度
					document.getElementById(TableID[i] + "_tableLayout").style.height = divheight;//撑开标签以便判断应调整高度
					goodHeight[i] = divheight
							- ($(document.body).find("table").eq(0).height()
									- document.body.clientHeight + 10);//最适高度 
				}
			}
			for ( var i = 0; i < TableID.length; i++) {
				if (maxHeight[i] > minHeight[i]) {//如果表格总高度大于最小高度
					if (goodHeight[i] > maxHeight[i]) {//如果最适高度大于表格总高度，以表格总高度为主 
						if ($("#" + TableID[i] + "_tableData")
								.children("table")[0].offsetWidth > document
								.getElementById(TableID[i] + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
							document
									.getElementById(TableID[i] + "_tableLayout").style.height = maxHeight[i];
							document
									.getElementById(TableID[i] + "_tableColumn").style.height = maxHeight[i];
							document.getElementById(TableID[i] + "_tableData").style.height = maxHeight[i];//滚动条出现增加高度
						} else {
							document
									.getElementById(TableID[i] + "_tableLayout").style.height = maxHeight[i];
							document.getElementById(TableID[i] + "_tableData").style.height = maxHeight[i];
							document
									.getElementById(TableID[i] + "_tableColumn").style.height = maxHeight[i];
						}
					} else if (goodHeight[i] > minHeight[i]) {//如果最适高度大于最小高度
						if ($("#" + TableID[i] + "_tableData")
								.children("table")[0].offsetWidth > document
								.getElementById(TableID[i] + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
							document
									.getElementById(TableID[i] + "_tableLayout").style.height = goodHeight[i];
							document.getElementById(TableID[i] + "_tableData").style.height = goodHeight[i];//滚动条出现增加高度
							document
									.getElementById(TableID[i] + "_tableColumn").style.height = goodHeight[i] - 17;//滚动条出现增加高度
						} else {
							document
									.getElementById(TableID[i] + "_tableLayout").style.height = goodHeight[i];
							document.getElementById(TableID[i] + "_tableData").style.height = goodHeight[i];
							document
									.getElementById(TableID[i] + "_tableColumn").style.height = goodHeight[i];

						}

					} else {
						if ($("#" + TableID[i] + "_tableData")
								.children("table")[0].offsetWidth > document
								.getElementById(TableID[i] + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
							//document.getElementById(TableID+"_tableColumn").style.height=maxHeight;
							document
									.getElementById(TableID[i] + "_tableLayout").style.height = minHeight[i] + 17;
							document.getElementById(TableID[i] + "_tableData").style.height = minHeight[i] + 17;//滚动条出现增加高度
							document
									.getElementById(TableID[i] + "_tableColumn").style.height = minHeight[i];//滚动条出现增加高度
						} else {
							document
									.getElementById(TableID[i] + "_tableLayout").style.height = minHeight[i];
							document.getElementById(TableID[i] + "_tableData").style.height = minHeight[i];
							document
									.getElementById(TableID[i] + "_tableColumn").style.height = minHeight[i];

						}
					}
				} else {
					if ($("#" + TableID[i] + "_tableData").children("table")[0].offsetWidth > document
							.getElementById(TableID[i] + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
						document.getElementById(TableID[i] + "_tableColumn").style.height = maxHeight[i];
						document.getElementById(TableID[i] + "_tableLayout").style.height = maxHeight[i];
						document.getElementById(TableID[i] + "_tableData").style.height = maxHeight[i];//滚动条出现增加高度 
					} else {
						document.getElementById(TableID[i] + "_tableLayout").style.height = maxHeight[i];
						document.getElementById(TableID[i] + "_tableData").style.height = maxHeight[i];
						document.getElementById(TableID[i] + "_tableColumn").style.height = maxHeight[i];

					}
				}

				//定好宽度高度后再根据滚动条微调
				if ($("#" + TableID[i] + "_tableData").children("table")[0].offsetWidth > document
						.getElementById(TableID[i] + "_tableData").offsetWidth) {//如果table的实际宽度比标签div层宽，则出现下边滚动条
					$("#" + TableID[i] + "_tableColumn")
							.css(
									"height",
									document.getElementById(TableID[i]
											+ "_tableLayout").offsetHeight - 17);
				} else {//如果标签div层比table的实际宽度宽，无下边滚动条

					$("#" + TableID[i] + "_tableData").children("table")[0].style.width = document
							.getElementById(TableID[i] + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度
					$("#" + TableID[i] + "_tableHead").children("table")[0].style.width = document
							.getElementById(TableID[i] + "_tableLayout").offsetWidth;//扩大表格宽度为背景宽度

				}

				if ($("#" + TableID[i] + "_tableData").children("table")[0].offsetHeight > document
						.getElementById(TableID[i] + "_tableData").offsetHeight) {//如果table的实际高度比标签div层高，则出现侧边滚动条
					$("#" + TableID[i] + "_tableHead")
							.css(
									"width",
									document.getElementById(TableID[i]
											+ "_tableLayout").offsetWidth - 17);//减小表头宽度
					if ($("#" + TableID[i] + "_divwidth").val() != ""
							&& $("#" + TableID[i] + "_tableData").children(
									"table")[0].scrollWidth - 17 > $(
									"#" + TableID[i] + "_divwidth").val()) {//如果变化后宽度大于表格最小
						$("#" + TableID[i] + "_tableData").children("table")[0].style.width = $(
								"#" + TableID[i] + "_tableData").children(
								"table")[0].scrollWidth - 17;//表格宽度变小
						$("#" + TableID[i] + "_tableHead").children("table")[0].style.width = $(
								"#" + TableID[i] + "_tableHead").children(
								"table")[0].scrollWidth - 17;//表格宽度变小 
					} else {//出现侧边滚动条同时出现下侧滚动条
						$("#" + TableID[i] + "_tableColumn").css(
								"height",
								document.getElementById(TableID[i]
										+ "_tableLayout").offsetHeight - 17);
					}
				} else {//如果标签div层比table的实际高度高，无侧边滚动条
					if (document.getElementById(TableID[i] + "_tableData").scrollHeight > document
							.getElementById(TableID[i] + "_tableData").clientHeight) {//如果侧面出现滚动条
						$("#" + TableID[i] + "_tableHead").css(
								"width",
								document.getElementById(TableID[i]
										+ "_tableLayout").offsetWidth - 17);
					} else {
						$("#" + TableID[i] + "_tableHead").css(
								"width",
								document.getElementById(TableID[i]
										+ "_tableLayout").offsetWidth);
					}
				}
				$("#" + TableID[i] + "_tableColumn").offset(
						$("#" + TableID[i] + "_tableLayout").offset());
				$("#" + TableID[i] + "_tableData").offset(
						$("#" + TableID[i] + "_tableLayout").offset());

			}

		}
		//调节横向滚动条
		if (document.body.scrollWidth > document.body.clientWidth + 20) {
			$('body').css('overflow-x', 'auto');
		} else {
			$('body').css('overflow-x', 'hidden');
		}
		//调节body纵向滚动条
		if (document.body.scrollHeight > document.body.clientHeight + 20) {
			$('body').css('overflow-y', 'auto');
		} else {
			$('body').css('overflow-y', 'hidden');
		}
	}

	
</script>