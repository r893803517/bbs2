<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
		
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.title} | MyBlog</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<!-- 引入本页面的特殊样式 -->
<link type="text/css" rel="stylesheet" href="./css/article.css" />
<link type="text/css" rel="stylesheet" href="./css/comment.css" />

<script src="./js/article.js"></script>

</head>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div class = "container" id = "main">
	<div class = "col-md-7" id="left_content">
	

		<div id="article">

			<div id="a_head ">
				<h2>${article.title}</h2>
				<br />
				<div>
					<h5>
						<span>${article.time}</span> <a href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>
					${article.author}
					</h5>
				</div>
				<!-- <div class="r_div">
					<h5>
						<span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>						
						 <span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span> 
						 <span	class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp; </span>
					</h5>
				</div>
				<div id="tag">
				<c:forEach var="t" items="${article_tags}">
					<a href="/Blog/TagsServlet?get=${t.tag}">${t.tag}&nbsp;</a>
				</c:forEach>
				</div>   -->
			</div>
		</div>
			



			<div id="a_content">
			<!-- 引入 show.jsp 显示文章内容 ${article.content}-->
			<jsp:include page="/page/show.jsp"/>			
			</div>
			
			<div class = "b_div">
				<h5>	
					<span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>						
					 <span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span> 
					 <span	class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp; </span>
				</h5>
				<br>			
				<span class="btn btn-default" style="color:#d9534f;"  onclick="love_article(${article.id})" >点赞</span>
				</div>						
				<br/>

			<div>
				<div class="f_div">
					<span class="glyphicon glyphicon-chevron-left"></span>
					
					
					<c:choose>
						<c:when test="${article_pre!=null}">
							<a href="/Blog/ArticleServlet?id=${article_pre.id}">&nbsp;上一篇:${article_pre.title}</a>
						</c:when>					
						<c:otherwise>
							&nbsp;没有更早的文章了
						</c:otherwise>					
					</c:choose>
					
				</div>				
				<div class="r_div">
				
						<c:choose>
						<c:when test="${article_next!=null}">
							<a href="/Blog/ArticleServlet?id=${article_next.id}">下一篇:&nbsp;${article_next.title}</a>
						</c:when>					
						<c:otherwise>
							&nbsp;没有更多的文章了
						</c:otherwise>					
					</c:choose>
						
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
				
				
			</div>
			<br><br>
			<div class="line"></div>
			
			<!-- 评论 -->					
			<div class="comment"> 
			
			<div class="r_div">
			
			</div>
					
			<!-- 加载文章评论 -->	
			<c:if test="${comment!=null}">
			<c:forEach var="comm" varStatus="status" items="${comment}">
			
			<div class="row" >
			<div class="f_div">		
			<img src="/Blog/img/comment.jpg" height="50" width="50"  class="img-circle"/>
			&nbsp;&nbsp;			
			<span style="color: #428bca"> ${comm.nickname}</span>					
			<span>&nbsp;&nbsp;${comm.time}</span>
			</div>			
			<div  id="c_content" class="c_left">						
			<pre>${comm.content }</pre>			
			</div>			
			<div class="r_div">			
			<a><span class="glyphicon glyphicon-thumbs-up"  onclick="star(this,${comm.id})">${comm.star}</span></a>
			&nbsp;
			<a><span class="glyphicon glyphicon-thumbs-down" onclick="diss(this,${comm.id})">${comm.diss}</span></a>
			&nbsp;	
			<!-- admin here -->
			<c:if test="${sessionScope.user!=null}">	
			<span class="btn btn-default" style="color:red;" onclick="deletecm(this,${comm.id})">删除</span>
			&nbsp;		
			</c:if>		
			</div>			
			<div class="line"></div>
			</div>		
			
			</c:forEach>
			
			</c:if>
			</div>
			<!-- 这里可以扩展子评论 -->			
			
				
			<!-- 写评论 -->
			<div id="comment">
			
			<form action="/Blog/NewCommentServlet?id=${article.id}" method="post">
			<!--  <input  style="width:30%" class="form-control" type="text" name="w_nickname" value="热心网友"  > -->						
			<textarea style="resize:none; width:100%; height:180px;" name="w_content"></textarea>
			<br/>
			<br/>			
			<input  class="btn btn-default"  type="submit"   value="评论" onclick="onclick"/>	
			<br/>						
			</form>			
			</div>
			<!--  -->    			
			<div class="line"></div>
		
		</div>
		
		<div class = "col-md-2" id = "center_content"></div>
		<div class = "col-md-3" id = "right_content">
			<jsp:include page = "usrCol.jsp"></jsp:include>
		</div>
		
	</div>
	<div id="footer">	
	<a href="/Blog/index.jsp">首页&nbsp;&nbsp;</a>|
	<a href="#">&nbsp;&nbsp;返回顶部</a>
	</div>
	<!-- footer -->
</body>
</html>