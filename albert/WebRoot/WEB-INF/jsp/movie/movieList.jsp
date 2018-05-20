<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ include file="/include/head.jsp"%>
<%@ taglib uri="/WEB-INF/tld/pager.tld" prefix="pager" %> 


    <title><s:message code='movie.list'/></title>
	
  <style type="text/css">

    .article{
      
       font-size: 20px;
       letter-spacing: 0.1em;
       line-height: 2em;
    }
   
</style>
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
	background:url(/images/listCon.png) no-repeat;
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


    a#release{
      display: block;
      width:100px;
      margin-top: -30px;
      margin-left:550px;
      float: left;
      padding:5px 9px;
     /* background-color:rgba(248,201,207,1);*/
      background-color:rgba(241,132,151,1);
      border-radius: 3px;
      color:#666;
    }
    a#release:hover{
      color:#FFF;
    }
    
    .right{
      width: 100%;
      font-size: small;
      text-align: right;
    }
    
    
  /*about*/
.aboutCont{
	width:1200px;
	margin:0 auto 30px;
	padding:0 0 20px;
	border:3px solid #fe6867;
	border-left:none;
	border-right:none;
	background:#fff;
}
.aboutCont .title{
	background:url(../imgNew/about.jpg);
	height:35px;
	line-height:35px;
	font-size:18px;
	color:#fff;
	padding-left:1.5em;
	vertical-align:middle;
}
.aboutCont ul{
	width:900px;
	margin:35px auto;
}
.aboutCont ul li{
	height:50px;
	line-height:50px;
	border-bottom:1px solid #c3c3c3;
}
.aboutCont ul.aboutContDH li{
	padding:10px 0;
	height:199px;
	color:#838383;
}
.aboutCont ul.aboutContDH li h4{
	font-size:16px;
	height:32px;
	line-height:32px;
	color:#696969;
}
.aboutCont ul.aboutContDH li h4 b{
	float:right;
	margin-right:5px;
}
.aboutCont ul.aboutContDH li p{
	width:560px;
	font-size:15px;
	line-height:24px;
	float:left;
}
.aboutCont ul.aboutContDH li img{
	float:left;
	margin-right:20px;
}
.share{
	width:220px;
	height:30px;
	line-height:23px;
	float:right;
}
.share span{
	display:inline-block;
	padding:0.2em 1.5em 0.2em 1.2em;
	border-radius:20px;
	margin-right:10px;
	float:left;
	overflow:hidden;
}
.share span.border{
	margin-right:15px;
	border:1px solid #999;
}
.share span b{
	width:22px;
	height:22px;
	background:url(../imgNew/about1.png);
	background-position:-12px -11px;
	display:inline-block;
	cursor:pointer;
	vertical-align:middle;
	margin-right:5px;
}
.share span b.last{
	background-position:-89px -11px;
}
.share span b:hover{
	background-position:-45px -11px;
}
.share span b.hover{
	background-position:-45px -11px;
}
.share span b.last:hover{
	background-position:-122px -11px;
}
.share span b.lasthover{
	background-position:-122px -11px;
}
.share img{
	float:none;
	margin-right:5px;
	cursor:pointer;
}
.aboutCont ul li a{
	color:#6a6a6a;
}
.aboutCont ul li.onC a{
	color:#fe6965;
}
.aboutCont .aboutContD{
	margin:15px;
	color:#666666
}
.aboutCont .aboutContD h3,.aboutCont .aboutContD h4,.aboutCont .aboutContD p{
	padding-left:15px;
}
.aboutCont .aboutContD h3{
	height:60px;
	line-height:60px;
	background:#f0f0f0;
	font-size:20px;
	font-weight:normal;
	margin-top:15px;
	cursor:pointer;
}
.aboutCont .aboutContD h3 a{
	display:inline-block;
	float:right;
	width:18px;
	height:10px;
	background:url(../imgNew/about.png) no-repeat;
	margin:25px 35px 0;
	background-position:-24px 0px;
	cursor:pointer;
}
.aboutCont .aboutContD h3 a.onC{
	background-position:0 0;
}
.aboutCont .aboutContD h4{
	line-height:45px;
}
.aboutCont .aboutContD p{
	font-size:16px;
	line-height:24px;
}
.aboutContDCon{
	display:none;
	border:1px solid #f0f0f0;
	padding-bottom:20px;
}
.aboutContDCon pre{
	padding:0 15px;
	font-size:16px;
	line-height:24px;
	color:#666;
}
.aboutContDConh{
	border-top:1px solid #f0f0f0;
	margin-top:15px;
}
.aboutCont .aboutContD h3.aboutContDTit{
	height:40px;
	background:#fff;
	font-size:20px;
	font-weight:bold;
	color:#666;
	margin:0;
}

/* 自动搜索样式 */
 		#list{ 
 			position: absolute; 
 			left: 15%; 
 			top:50px; 
			width: 200px; 
 			margin-left: -150px; 
 			height: auto; 
 			background: lightBlue; 
 			display: none; 
 		} 
 		#list ul{ 
 			padding-left: 0px;
 			margin: 0px; 
 		} 
 		#list ul li{ 
 			background: lightGray; 
 			line-height: 30px; 
 			list-style: none; 
 			padding-left: 10px; 
 			margin-top: 0px; 
 			cursor: pointer; 
 			width:1000px;
 		} 
 		#list ul li.on{ 
 			background: lightGreen; 
 		}
  </style>
  <link href="<%=path%>/css/movie/personal.css" rel="stylesheet">
  <script>
  $(function(){
	    var kd = $('#keyWord').val();
	    if(null!=kd&&""!=kd){
	  		$(".content").textSearch(kd,"a");
	  	}
	  	
	  
		$('#keyWord').keyup(function(e){
			var kd = $('#keyWord').val();
			if(null!=kd&&""!=kd){
				querySUG(kd);
			}else{
				document.getElementById('list').innerHTML = '';
			}
			
		});
		
		$("#list").delegate(".searchTip","click",function(){
			var title =$(this).html();
			$("#keyWord").val(title);
			searchZhihu();
		});

		
	});
  
  function searchZhihu(){
	  $("#zhihuSearch").submit();
  }
  
  function querySUG(title){
		document.getElementById('list').innerHTML = '';
		$.ajax({
			url : "<%=path%>/movie/queryKeyWord",
			type : "GET",
			data:{"name":title}, 
			dataType : "json",
			success : function(result) {
				var tag = '<ul>';
				for(var i=0;i<result.list.length;i++){
					tag += '<li class="searchTip">'+result.list[i].name+'</li>';
				}
				tag += '</ul>';
				$('#list').html(tag).show();
				$('#list').find('li').hover(function(){
					$(this).css('background','lightBlue');
				},function(){
					$(this).css('background','lightGray');
				});
			}
		});

	}
  
  </script>
<!-- 	onchange="querySUG(this)" -->
<form id="zhihuSearch"  action="<%=path%>/movie/toMovieList" method="post" >
			<div class="row head">
                <div class="col-lg-12">
                    <div class="input-group">
                        <input type="text" class="form-control" id="keyWord" autocomplete="off" name="name" value="${searchParam.name}" placeholder="搜你想要的">
                        <span class="input-group-btn">
                            <button class="btn btn-info" type="button" onclick="searchZhihu()" ><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                        
                    </div>
                    
                   		<div id="list" class="input-group" align="left">
						</div>
					
                </div>
            </div>
            </br>
            </br>
            </br>
            </br>
            </br>
            <div class="update">
      <div class="section_title">
<!--         <h2>最近更新电影</h2> -->
        <p class="Chinese-p">
          <span>最近更新电影列表</span></p>
        <p class="English-p">RECENTLY UPDATED LIST OF MOVIE</p>
      </div>
      <div class="container">
        <div class="row">
          <div class="waterfall content" id="waterfall">
          
          <c:forEach var="movie" items="${list}">
            
            <div class="col-md-3 col-sm-6 .col-xs-6 updateItem">
              <div class="updateBox">
                <div class="smBox">
                  <a href="<%=path%>/movie/getMovieDetail?id=${movie.id}" target="_blank" class="update-show">
                    <img src="${movie.img}" alt="">
                    <h4>${movie.name}</h4>
                  </a>
<!--                   <a href="#" class="update-hide"> -->
<!--                     <i><img src="http://img.hdwan.net/timthumb.php?src=http://img.hdwan.net/2016/10/p2382076389.jpg&w=189&zc=1" alt=""></i> -->
<!--                     <span>共12张海报</span> -->
<!--                     <h4>大话西游3</h4> -->
<!--                     <p>主演: 韩庚 / 唐嫣 / 吴京 / 莫文蔚 / 张超 / 张瑶 / 王一博 / 钟欣潼 / 谢楠 / 何炅 / 胡静 / 黄征 / 刘镇伟 / 曹承衍 / 周艺轩 / 元奎</p> -->
<!--                   </a> -->
                </div>
              </div>
            </div>

		</c:forEach>
          
          
          </div>
        </div>
      </div>
    </div>
    
			<style>#page ul{width:auto;}
      		</style>  
				
       <div id="page">
      <pager:pager pageSize="${searchParam.s}"  currentPageId="currentPage"  pageNo="${searchParam.i}"   fromId="zhihuSearch" recordCount="${searchParam.totalNum}"/>
    	 </div>
				</form>
      	  	
      	
	<script src="<%=path%>/js/jquery.textSearch.1.0.js"></script>
	<script src="<%=path%>/js/movie/waterfall.js"></script>
<%@ include file="/include/footer.jsp"%>