<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 詳細画面を表示する画面 --%>
<%-- <c:import> を使うことで、url 属性に指定したファイルの内容をその位置で読み込むことが可能 --%>
<%-- <fmt:formatDate> タグで作成日時や更新日時を pattern 属性で指定した 年-月-日 時:分:秒 の形式で表示 --%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${message != null}">
                <h2>id : ${message.id} のメッセージ詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${message.title}" /></td>
                        </tr>
                        <tr>
                            <th>メッセージ</th>
                            <td><c:out value="${message.content}" /></td>
                        </tr>
                        <tr>
                            <th>作成日時</th>
                            <%-- <fmt:formatDate> タグで作成日時や更新日時を pattern 属性で指定した 年-月-日 時:分:秒 の形式で表示 --%>
                            <td><fmt:formatDate value="${message.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${message.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="${pageContext.request.contextPath}/index">一覧に戻る</a></p>
                <p><a href="${pageContext.request.contextPath}/edit?id=${message.id}">このメッセージを編集する</a></p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>