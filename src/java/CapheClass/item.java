package CapheClass;
import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class item {
    private int id;
    private SanPham sanpham;
    private int soluong;
    private long totalprice;

    public item() {
        super();
    }

    public item(int id, SanPham sanpham, int soluong, long price) {
        this.id = id;
        this.sanpham = sanpham;
        this.soluong = soluong;
        this.totalprice = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(SanPham sanpham) {
        this.sanpham = sanpham;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public long getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(long totalprice) {
        this.totalprice = totalprice;
    }
    
}
