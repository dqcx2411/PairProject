<%--
  Created by IntelliJ IDEA.
  User: Charley Chen
  Date: 2021/3/25
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<% String path = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getAttribute("paperList2");
%>
<html>
<head>
    <title>paperList测试</title>
</head>
<body>
<form action="PaperServlet" method="post">
    <button>刷新列表</button>
</form>
<form method="post" id="queryForm" action="<%=path%>/SearchServlet">
    <input type="text" name="pTitle" value="${paper.paperTitle}" placeholder="论文标题"/>
    <input type="hidden" name="type" value="0" />
    <input type="hidden" name="pageNum" value="${pageNum}" />
    <input type="hidden" id="changeNum" name="changeNum" value="" />
    <button onclick="changePage(0);">查 询</button>
</form>
<table border="1">
    <tr>
        <td>序号</td>
        <td>论文标题</td>
        <td>论文会议</td>
        <td>论文摘要</td>
        <td>关键词</td>
        <td>论文时间</td>
        <td>论文链接</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${paperList2}" var="l" varStatus="vs">
        <tr>
            <td>${vs.index + 1}</td>
            <td>${l.getPaperTitle()}</td>
            <td>${l.getPaperTypeYear()}</td>
            <td>${l.getPaperAbstract()}</td>
            <td>${l.getPaperKeyword()}</td>
            <td>${l.getPaperReleasetime()}</td>
            <td>${l.getPaperLink()}</td>
            <td>
                <button type="button" onclick="">编 辑</button>
                <button type="button" onclick="">删 除</button>
            </td>
        </tr>
    </c:forEach>
</table>
<button type="button" onclick="changePage(-1)">上一页</button>
<button type="button" onclick="changePage(1)">下一页</button>

第 ${pageNum}页 共${totalPageNum} 页　，共 ${totalNum} 条记录
</body>
</html>

<script>
    function changePage(num) {
        document.getElementById("changeNum").value = num;
        document.getElementById("queryForm").submit();
    }

</script>