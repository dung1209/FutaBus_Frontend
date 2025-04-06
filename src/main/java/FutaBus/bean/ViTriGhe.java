package FutaBus.bean;

import javax.persistence.*;

@Entity
@Table(name = "ViTriGhe")
public class ViTriGhe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idViTriGhe")
    private int idViTriGhe;

    @Column(name = "tenViTri", nullable = false, length = 3)
    private String tenViTri;

    @Column(name = "trangThai", nullable = false)
    private int trangThai;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idXe", referencedColumnName = "idXe")
    private Xe xe; 

    public Xe getXe() {
        return xe;
    }

    public void setXe(Xe xe) {
        this.xe = xe;
    }

    public int getIdViTriGhe() {
        return idViTriGhe;
    }

    public void setIdViTriGhe(int idViTriGhe) {
        this.idViTriGhe = idViTriGhe;
    }

    public String getTenViTri() {
        return tenViTri;
    }

    public void setTenViTri(String tenViTri) {
        this.tenViTri = tenViTri;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }
}
