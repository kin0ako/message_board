<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<label for="title">タイトル</label><br />
<%-- value~はリクエストスコープの message オブジェクトからデータを参照して、入力内容の初期値として表示するようにしている --%>
<input type="text" name="title" value="${message.title}" />
<br /><br />

<label for="content">メッセージ</label><br />
<input type="text" name="content" value="${message.content}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>