package com.me.controller;

import com.me.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Created by Me on 2019/7/12.
 */
public class BaseController {

    private Logger logger = LoggerFactory.getLogger(BaseController.class);

    @Autowired
    private OrderService orderService;

    @ModelAttribute
    private void todayOutcome(Model model) {
        logger.debug("Execute Method todayOutcome...");

        Float todayTotal = orderService.summaryToday();
        model.addAttribute("todayTotal", todayTotal);
    }
}
