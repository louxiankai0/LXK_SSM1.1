package com.service.before;

import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface CartService {
    String focus(Model model, Integer id, HttpSession session);

    String putCart(Model model, Integer shoppingnum, Integer id, HttpSession session);

    String selectCart(Model model, HttpSession session);

    String deleteAgoods(Integer id, HttpSession session);

    String clear(HttpSession session);

    String orderConfirm(Model model, HttpSession session);
}
