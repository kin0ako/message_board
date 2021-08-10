package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DBUtil;

/**
 * Servlet implementation class CreateServlet
 */
@WebServlet("/create")
public class CreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        //CSRF対策のチェック（悪意のあるネット利用者が勝手に投稿できないようにするための対策）
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();
            em.getTransaction().begin();

            Message m = new Message();

            String title = request.getParameter("title");
            //フォームから入力された内容をセット
            m.setTitle(title);

            String content = request.getParameter("content");
            //フォームから入力された内容をセット
            m.setContent(content);

            //現在日時の情報を持つ日付型のオブジェクトを取得してセット
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            m.setCreated_at(currentTime);
            m.setUpdated_at(currentTime);

            //データベースにセーブ
            em.persist(m);
            //commit を忘れないように
            em.getTransaction().commit();
            em.close();

            //indexページへリダイレクト（遷移）
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

}
