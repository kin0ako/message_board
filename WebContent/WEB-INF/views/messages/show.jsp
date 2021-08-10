<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 詳細画面を表示する画面 --%>
<%-- <c:import> を使うことで、url 属性に指定したファイルの内容をその位置で読み込むことが可能 --%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${message != null}">
                <h2>id : ${message.id} のメッセージ詳細ページ</h2>

                <p>タイトル：<c:out value="${message.title}" /></p>
                <p>メッセージ：<c:out value="${message.content}" /></p>
                <%--　<fmt:formatDate> タグで作成日時や更新日時を pattern 属性で指定した 年-月-日 時:分:秒 の形式で表示 --%>
                <p>作成日時：<fmt:formatDate value="${message.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                <p>更新日時：<fmt:formatDate value="${message.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></p>

                <p><a href="${pageContext.request.contextPath}/index">一覧に戻る</a></p>
                <p><a href="${pageContext.request.contextPath}/edit?id=${message.id}">このメッセージを編集する</a></p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>