<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- データの一覧を表示する画面 --%>
<%-- <c:import> を使うことで、url 属性に指定したファイルの内容をその位置で読み込むことが可能 --%>
<c:import url="../layout/app.jsp">
    <%-- <c:param name="content"> と書いたタグの中の記述内容が、app.jsp の ${param.content} のところに当てはまる --%>
    <c:param name="content">
        <%-- フラッシュメッセージ（「登録が完了しました」のような文言を表示） --%>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
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

        <div id="pagination">
            （全 ${messages_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((messages_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <%-- <a href="<c:url value='/new' />">新規メッセージの投稿</a>でもOK --%>
        <p><a href="${pageContext.request.contextPath}/new">新規メッセージの投稿</a></p>

    </c:param>
</c:import>