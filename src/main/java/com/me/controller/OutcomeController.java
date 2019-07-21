package com.me.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.me.service.OrderService;
import com.me.utils.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by Me on 2019/7/12.
 */
@Controller
@RequestMapping("outcome")
public class OutcomeController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(OutcomeController.class);

    @Autowired
    private OrderService orderService;

    @RequestMapping("summary")
    public ModelAndView summary(Model model) {
        logger.debug("Execute Method summary...");

        Float yesterdayTotal = orderService.summaryYesterday();
        Float lastMonthTotal = orderService.summaryLastMonth();
        Float last30Total = orderService.summaryLast30Days();
        model.addAttribute("yesterdayTotal", yesterdayTotal);
        model.addAttribute("lastMonthTotal", lastMonthTotal);
        model.addAttribute("last30Total", last30Total);

        String lastMonthDateJson = orderService.generateDateLastMonth();
        String lastMonthValeJson = orderService.listLastMonth();
        model.addAttribute("lastMonthDateJson", lastMonthDateJson);
        model.addAttribute("lastMonthValueJson", lastMonthValeJson);

        String last30DateJson = orderService.generateDateLast30();
        String last30ValueJson = orderService.list30Days();
        model.addAttribute("last30DateJson", last30DateJson);
        model.addAttribute("last30ValueJson", last30ValueJson);

        return new ModelAndView("listOutcome");
    }

}
