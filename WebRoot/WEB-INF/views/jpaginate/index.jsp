<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/meta.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<title>xticfc</title>
<script type="text/javascript">
	$(function(){
		
	});
</script>
		<script type="text/javascript">
		var pageSize = '${pageNum}';
		$(function() {
			$("#pagination0").paginate({  
	            count       : pageSize,   //此处要写清本次分页的总页数,不支持动态改变,不可写非int型数.个人建议在进入页面的时候就把页数传过来  
	            start       : 1,            //开始页码,从1开始,一般设置成1  
	            display     : 7,            //在分页条上显示的个数,分页数等于或超过本设置会显示设置的个数,不够的话会显示真实个数,不过就不会出现滚动效果了.  
	            border                  : false,    //是否显示外框  
	            text_color              : '#888',   //文字颜色  
	            background_color        : '#EEE',   //背景颜色  
	            text_hover_color        : 'black',  //鼠标放上去时文字的颜色  
	            background_hover_color  : '#CFCFCF',//鼠标放上去时背景的颜色  
	            rotate                  : true,     //是否滚动  
	            images                  : false,    //  
	            mouse                   : 'press',  //可选值为'press'和'slide',具体差别请自己体验.  
	            onChange                : function(page){//本插件唯一可触发的事件,在点击页数的时候触发,只传过来当前被选中的页数,我想这其实足够了.  
	                                        list(page-1,7);
	                                      }
	            });  
	        list(0,7);  
	        function list(start, size){  
	            $.ajax({  
	                url:"${ctx}/jpaginate/list",  
	                type:"post",  
	                data:{start:start,size:size},  
	                dataType:"json",  
	                timeout: 10000,  
	                error: function(){alert('请求超时，请稍候再试');},  
	                success: function(result){  
	                    var s = new StringBuffer();  
	                    $.each(result,function(index,value){  
	                        s.append("<tr>").append("<td>").append(value.name).append("</td>");  
	                        s.append("<td>").append(value.sxId).append("</td>").append("<td>");  
	                        s.append(value.loginId).append("</td>").append("<td>");  
	                        s.append("<a href='#' onclik=\"javascript:modify('").append(value.ID);  
	                        s.append("')\">修改</a>").append("</td>").append("</tr>");  
	                    });  
	                    $("#mytbody").html(s.toString());  
	                }  
	            });  
	        }  
			$("#demo1").paginate({
				count 		: 100,
				start 		: 1,
				display     : 8,
				border					: true,
				border_color			: '#fff',
				text_color  			: '#fff',
				background_color    	: 'black',	
				border_hover_color		: '#ccc',
				text_hover_color  		: '#000',
				background_hover_color	: '#fff', 
				images					: false,
				mouse					: 'press'
			});
			$("#demo2").paginate({
				count 		: 50,
				start 		: 5,
				display     : 10,
				border					: false,
				text_color  			: '#888',
				background_color    	: '#EEE',	
				text_hover_color  		: 'black',
				background_hover_color	: '#CFCFCF'
			});
			$("#demo3").paginate({
				count 		: 50,
				start 		: 20,
				display     : 12,
				border					: true,
				border_color			: '#BEF8B8',
				text_color  			: '#68BA64',
				background_color    	: '#E3F2E1',	
				border_hover_color		: '#68BA64',
				text_hover_color  		: 'black',
				background_hover_color	: '#CAE6C6', 
				rotate      : false,
				images		: false,
				mouse		: 'press'
			});
			$("#demo4").paginate({
				count 		: 50,
				start 		: 20,
				display     : 12,
				border					: false,
				text_color  			: '#79B5E3',
				background_color    	: 'none',	
				text_hover_color  		: '#2573AF',
				background_hover_color	: 'none', 
				images		: false,
				mouse		: 'press'
			});
			$("#demo5").paginate({
				count 		: 10,
				start 		: 1,
				display     : 7,
				border					: true,
				border_color			: '#fff',
				text_color  			: '#fff',
				background_color    	: 'black',	
				border_hover_color		: '#ccc',
				text_hover_color  		: '#000',
				background_hover_color	: '#fff', 
				images					: false,
				mouse					: 'press',
				onChange     			: function(page){
											$('._current','#paginationdemo').removeClass('_current').hide();
											$('#p'+page).addClass('_current').show();
										  }
			});
		});
		</script>
</head>

<body>

	<div class="header">
		<h1>jPaginate</h1>
	</div>
	<div class="content">
		<table border="1">
			<tr>
				<td>名称</td>
				<td>id</td>
				<td>loginId</td>
			</tr>
			<tbody id="mytbody"></tbody>
		</table>
		<div id="pagination0">                     
              
        </div> 
		<div class="demo">
			<h1>Demo 1</h1>
			<div id="demo1"></div>
		</div>
		<div class="demo">
			<h1>Demo 2</h1>
			<div id="demo2"></div>
		</div>
		<div class="demo">
			<h1>Demo 3</h1>
			<div id="demo3"></div>
		</div>
		<div class="demo">
			<h1>Demo 4</h1>
			<div id="demo4"></div>
		</div>
		<div id="paginationdemo" class="demo">
			<h1>Demo 5</h1>
			<div id="p1" class="pagedemo _current" style="">Page 1</div>
			<div id="p2" class="pagedemo" style="display: none;">Page 2</div>
			<div id="p3" class="pagedemo" style="display: none;">Page 3</div>
			<div id="p4" class="pagedemo" style="display: none;">Page 4</div>
			<div id="p5" class="pagedemo" style="display: none;">Page 5</div>
			<div id="p6" class="pagedemo" style="display: none;">Page 6</div>
			<div id="p7" class="pagedemo" style="display: none;">Page 7</div>
			<div id="p8" class="pagedemo" style="display: none;">Page 8</div>
			<div id="p9" class="pagedemo" style="display: none;">Page 9</div>
			<div id="p10" class="pagedemo" style="display: none;">Page 10</div>
			<div id="demo5"></div>
		</div>
	</div>
	<div class="about">
		<div class="text">
			<h1>Demo 1</h1>
			<p>Hover over the arrows to make the pages move or keep the mouse
				button down in order to move a whole set.</p>
			<p>Clicking a page number will make it move to the center</p>
		</div>
		<div class="text">
			<h1>Demo 2</h1>
			<p>Demo 2 shows how the plugin can be used with arrow images.</p>
		</div>
		<div class="text">
			<h1>Demo 3</h1>
			<p>This is an example without any arrows. The user just sees the
				current page and the surrounding pages.</p>
		</div>
		<div class="text">
			<h1>Demo 4</h1>
			<p>Demo 4 shows how the plugin can be configured in style (no
				borders for the page numbers).</p>
		</div>
		<div class="text">
			<h1>Demo 5</h1>
			<p>This one shows how to integrate the plugin with an onChange
				event.</p>
		</div>
	</div>
		
</body>
</html>