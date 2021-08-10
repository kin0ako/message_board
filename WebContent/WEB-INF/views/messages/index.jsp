<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:import> を使うことで、url 属性に指定したファイルの内容をその位置で読み込むことが可能 --%>
<c:import url="../layout/app.jsp">
    <%-- <c:param name="content"> と書いたタグの中の記述内容が、app.jsp の ${param.content} のところに当てはまる --%>
    <c:param name="content">
        <h2>メッセージ一覧</h2>
        <ul>
            <c:forEach var="message" items="${messages}">
                <li>
                    <a href="${pageContext.request.contextPath}/show?id=${message.id}">
                        <%-- 固定の文字列じゃないとコンテキストパスの設定を変更してもJSPファイルに修正が必要なくなるため
                        <c:out value="${pageContext.request.contextPath}" />の方がオススメ --%>
                        <c:out value="${message.id}" />
                    </a>
                    ：<c:out value="${message.title}"></c:out> &gt; <c:out value="${message.content}" />
                </li>
            </c:forEach>
        </ul>

        <%-- <a href="<c:url value='/new' />">新規メッセージの投稿</a>でもOK --%>
        <p><a href="${pageContext.request.contextPath}/new">新規メッセージの投稿</a></p>

    </c:param>
</c:import>