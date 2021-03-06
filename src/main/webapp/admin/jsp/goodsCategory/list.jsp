<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.div {
	color: #fff;
	height: 60px;
	line-height: 60px;
	font-size: 20px;
}
.div input{
height:30px;
}
.footer{
margin:0 auto;
font-size:14px;
width:400px;
margin-right: 30%;
}
.footer ul{
list-style: none;
}
.footer ul li{
float: left;
width:28px;
height:28px;
line-height:28px;
font-size:14px;
border:1px solid black;
background-color:#7e422c;
text-align: center;
cursor: pointer;
}
#add{
width:150px;
height:30px;
border-radius: 50%/50%;
font-size:16px;
text-align: center;
}
</style>
</head>
<body>
	<br>
	<table cellSpacing="1" cellPadding="0" width="100%" align="center"
		border="0">
		<tbody>
			<tr>
				<td class="ta_01" align="center"><font>分类列表</font></TD>
			</tr>
			<tr>
				<td class="ta_01" align="right">
					<button type="button" id="add" name="add" value="添加"
						class="button_add" onclick="addCategory()">添加分类信息</button>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center">
					<div class="div">
						请输入要查询的分类信息:&nbsp; 
						<input type="text" name="name" id="name" value="${name}" />
						<button onclick="query()">查询</button>
					</div>
					<table cellspacing="0" cellpadding="1" rules="all"
						border="1" id="DataGrid1"
						style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%;BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse;WORD-WRAP: break-word">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px;">
							<td align="center" width="18%">分类id</td>
							<td align="center" width="17%">分类名称</td>
							<td width="7%" align="center">编辑</td>
							<td width="7%" align="center">删除</td>
						</tr>
						<c:forEach items="${goodsCategoriesList}" var="goodsCategory">
							<tr>
								<td style="height: 22px" align="center" width="18%">${goodsCategory.id}</td>
								<td style="height: 22px" align="center" width="17%">${goodsCategory.name}</td>
								<td align="center" style="height: 22px">
									<a href="javascript:edit(${goodsCategory.id})">
										<img
										src="${pageContext.request.contextPath}/admin/img/userlist/i_edit.gif"
										border="0">
								</a></td>

								<td align="center" style="HEIGHT: 22px">
									<a href="javascript:del(${goodsCategory.id})"> 
									<img src="${pageContext.request.contextPath}/admin/img/userlist/i_del.gif"
										width="16" height="16" border="0">
								</a></td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<!--分页查询  -->
	<c:if test="${name==null}">
	<div class="footer">
		<div style="height:35px;">
		 <c:forEach begin="1" end="${pageCount}" var="i">
				<c:if test="${currentPage==i}">
				<ul><li><font color="red">${i}</font></li></ul>
				</c:if>
				<c:if test="${currentPage!=i}">
					<ul><li onclick="fenye(${i})" style="color:skyblue">${i}</li></ul>
				</c:if>
		</c:forEach> 
		<span style="margin-left: 20px;">
		跳转到： <select onchange="fenye(this.value)" style="height:30px; width:50px;">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<option style="color: black"
						${currentPage==i?"selected='selected'":""} value="${i}">${i}</option>
			</c:forEach>
		</select>
		</span>
		</div>
		共${count}条记录|共${pageCount}页
	</div>
	</c:if>
	<c:if test="${name!=null}">
	<div class="footer">
		<div style="height:35px;">
		 <c:forEach begin="1" end="${pageCount}" var="i">
				<c:if test="${currentPage==i}">
				<ul><li><font color="red">${i}</font></li></ul>
				</c:if>
				<c:if test="${currentPage!=i}">
					<ul><li onclick="queryfenye(${i})" style="color:skyblue">${i}</li></ul>
				</c:if>
		</c:forEach> 
		<span style="margin-left: 20px;">
		跳转到： <select onchange="queryfenye(this.value)" style="height:30px; width:50px;">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<option style="color: black"
						${currentPage==i?"selected='selected'":""} value="${i}">${i}</option>
			</c:forEach>
		</select>
		</span>
		</div>
		共${count}条记录|共${pageCount}页
	</div>
	</c:if>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function del(id) {
		if (confirm("你确认删除吗?")) {
			window.location.href = "${pageContext.request.contextPath}/goodsCategory/deleteGoodsCategory.do?id="
					+ id;
		}
	}
	function edit(id) {
		window.location.href = "${pageContext.request.contextPath}/goodsCategory/showEdit.do?id="
					+ id;
		
	}
	function addCategory() {
		window.location.href = "${pageContext.request.contextPath}/goodsCategory/showAdd.do";
	}
	function queryfenye(curPage) {
		var name=$('#name').val();
		location.href = "${pageContext.request.contextPath}/goodsCategory/showQuery.do?page="+curPage+"&name="+name;
			
	} 
	function query() {
		var name=$('#name').val();
		location.href = "${pageContext.request.contextPath}/goodsCategory/showQuery.do?name="+name;
			
	}  
	function fenye(curPage) {
		location.href = "${pageContext.request.contextPath}/goodsCategory/showgoodsCategory.do?page="
				+ curPage;
	}
</script>
</html>

