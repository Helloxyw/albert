<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<%@ taglib uri="/WEB-INF/tld/pager.tld" prefix="pager" %> 

    <title><s:message code='theme.list'/></title>
	
 <style>
 
 /*page*/
#page{
	width:100%;
	height:26px;
	margin:50px 0;
	text-align:center;
}
#page ul{
	display:inline-block;
	margin:0 5px;
}
#page span{
	display:inline-block;
	line-height:20px;
	height:24px;
	border:1px solid #999;
	padding:0 0.5em;
	border-radius:2px;
}
#page span.onC a{
	color:#b8b8b8;
}
#page span i{
	display:inline-block;
	width:5px;
	height:17px;
	margin:0 5px 0 0;
	background:url(<%=path%>/images/listCon.png) no-repeat;
	background-position:-16px -1px;
	vertical-align:middle;
}
#page span.onC i{
	background-position:-6px -1px;
}
#page span.last i{
	background-position:-6px -15px;
	margin:0 0 0 5px;
}
#page span.last i.onC{
	background-position:-16px -15px;
}
#page ul li{
	display:inline-block;
	line-height:20px;
	height:24px;
	border:1px solid #999;
	border-radius:2px;
	margin: 0 2px;
	transition:all 0.5s;
}
#page ul li:hover{
	border:1px solid #3598da;
	background:#3598da;
}
#page ul li.onC{
	border:1px solid #3598da;
	background:#3598da;
}
#page ul li.onC a,#page ul li:hover a{
	color:#fff;
}
#page ul li a{
	display:inline-block;
	line-height:20px;
	padding:0 0.5em;
	border-radius:2px;
}


  </style>
  <body>
  
	

      <div class="content">
      	  <br />
      	  <h2>&nbsp;&nbsp;<s:message code='theme.list'/></h2> 
      	  <h3 style="float:right;color:red"><button type="button" class="btn btn-default" onclick="fabiao()"><b>发布新主题</b></button></h3>
      	  <hr>
      	  <div class="article">
      	  	<form action="<%=path%>/message/getAllTheme" method="post"
				id="listform" name="listform">
				
					<c:forEach items="${pageView.voList}" var="theme">
					 	 <h3>
							<a href="<%=path%>/message/getThemeDetail?id=${theme.id}">${theme.theme}</a>
						  </h3>
						  <hr>
					</c:forEach>
			
			  
				
		       <div id="page">
		      <pager:pager pageSize="${pageView.pageSize}"  currentPageId="currentPage"  pageNo="${pageView.currentPage}"   fromId="listform" recordCount="${pageView.recordCount}"/>
		     </div>
			</form>
      	  	
      </div>
      	


	  </div>
	 <script>
	 function fabiao(){
		 window.location.href="<%=path%>/message/toAddTheme";
	 }
	 
	 </script>
	
<%@ include file="/include/footer.jsp"%>
