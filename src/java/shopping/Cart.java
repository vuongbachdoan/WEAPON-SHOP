/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Nguyen Thi Thuy Dung
 */
public class Cart {

    private Map<String, Weapon> cart;

    public Cart() {
    }

    public Cart(Map<String, Weapon> cart) {
        this.cart = cart;
    }

    public Map<String, Weapon> getCart() {
        return cart;
    }

    public void setCart(Map<String, Weapon> cart) {
        this.cart = cart;
    }

    public boolean add(String id, Weapon weapon) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(weapon.getId())) {
                int currentQuantity = this.cart.get(id).getQuantity();
                weapon.setQuantity(currentQuantity + weapon.getQuantity());
            }
            this.cart.put(id, weapon);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart == null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }

        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, Weapon weapon) {
        boolean check = false;
        try {
            if (this.cart == null) {
                if (this.cart.containsKey(id)) {
                    this.cart.put(id, weapon);
                    check = true;
                }
            }

        } catch (Exception e) {
        }
        return check;
    }
}
