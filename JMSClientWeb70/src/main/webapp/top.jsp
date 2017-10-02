<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
    </head>
    <body>

      <form method="POST" action="/JMSClientWeb70/sample/Sender">
        <p>+++++++++++++++メッセージ送信+++++++++++++++</p>
        <p>メッセージ：<input type="text" name="msg" size="15"></p>
          <p>送信数：<input type="text" name="count" size="6"></p>

            <p>
              ProviderURL：
              <select name="protcol">
                <option>http-remoting://</option>
                <option>remote://</option>
              </select>
              <input type="text" name="port" size="17" value="localhost:8080"></p>
              <p><input type="submit" value="メッセージ送信"/></p>
            </form>
            <form method="POST" action="/JMSClientWeb70/sample/Consumer">
              <p>+++++++++++++++メッセージ受信+++++++++++++++</p>
              <p>
                ProviderURL：
                <select name="protcol">
                  <option>http-remoting://</option>
                  <option>remote://</option>
                </select>
                <input type="text" name="port" size="17" value="localhost:8080"></p>
                <p><input type="submit" value="メッセージ受信"/></p>
              </form>
            </body>
          </html>
