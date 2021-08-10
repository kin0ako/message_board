package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
//複数のNamedQueryをまとめたもので、NamedQueryをカンマで区切り指定
@NamedQueries({
    //主キー以外の項目などで検索し、複数件の結果を取得したい場合に定義する
    @NamedQuery(
        name = "getAllMessages",
        query = "SELECT m FROM Message AS m ORDER BY m.id DESC"
    )
})
@Table(name = "messages")
//必要なデータを格納するクラス
public class Message {
    @Id
    @Column(name = "id")
    //主キー値を自動採番すること
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // ( ..., nullable = false) で、必須入力が設定
    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Column(name = "content", length = 255, nullable = false)
    private String content;

    //作成日時
    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    //更新日時
    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
