/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CapheClass;
import java.io.Serializable;
import java.util.List;
/**
 *
 * @author Admin
 */
public class Cart implements Serializable {
    private int id;
    private List<item> items;
    private int status;

    public Cart() {
        this.status=0;
    }

    public Cart(int id, List<item> items, int status) {
        this.id = id;
        this.items = items;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<item> getItems() {
        return items;
    }

    public void setItems(List<item> items) {
        this.items = items;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
