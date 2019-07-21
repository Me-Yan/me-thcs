package com.me.controller;

import com.google.common.collect.Lists;
import com.me.common.ResponseData;
import com.me.constant.Constants;
import com.me.entity.Cashier;
import com.me.entity.Order;
import com.me.entity.Table;
import com.me.service.CashierService;
import com.me.service.OrderService;
import com.me.service.TableService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;
    @Autowired
    private CashierService cashierService;
    @Autowired
    private TableService tableService;

    @RequestMapping("listOrder")
    public ModelAndView listOrder(Model model) {
        logger.debug("Execute Method listOrder...");

        List<String> statusList = Lists.newArrayList(Constants.OrderStatus.IN_PROGRESS, Constants.OrderStatus.OVER, Constants.OrderStatus.CANCEL);
        model.addAttribute("statusList", statusList);

        return new ModelAndView("listOrder");
    }

    @RequestMapping("listOrderData")
    @ResponseBody
    public List<Order> listOrderData(@RequestParam("status") String status) {
        logger.debug("Execute Method listOrderData...");

        return orderService.listOrderData(status);
    }

    @RequestMapping("generateOrder/{tableId}")
    public ModelAndView generateOrder(@PathVariable("tableId") Integer tableId, RedirectAttributes attributes) {
        logger.debug("Execute Method generateOrder...");

        Order order = orderService.generateOrder(tableId);

        attributes.addFlashAttribute("message", "订单已生成，开始时间为：<span style='color:red'>"+ order.getStartDateStr() +"</span>");

        return new ModelAndView("redirect:/main/index");
    }

    @RequestMapping("cancelOrder/{tableId}")
    public ModelAndView cancelOrder(@PathVariable("tableId") Integer tableId, RedirectAttributes attributes) {
        logger.debug("Execute Method cancelOrder...");

        orderService.cancelOrder(tableId);

        attributes.addFlashAttribute("message", "订单已取消。");

        return new ModelAndView("redirect:/main/index");
    }

    @RequestMapping("overOrder/{orderId}")
    public ModelAndView overOrder(@PathVariable("orderId") Integer orderId, Model model) {
        logger.debug("Execute Method overOrder...");

        Order order = orderService.overOrder(orderId);
        model.addAttribute("orderForm", order);

        List<Cashier> cashierList = cashierService.listCashierData();
        model.addAttribute("cashierList", cashierList);

        Table table = tableService.getByTableId(order.getFromId());
        model.addAttribute("table", table);

        return new ModelAndView("overOrder");
    }

    @RequestMapping("confirmOver")
    public ModelAndView confirmOver(@ModelAttribute("orderForm") Order orderForm, RedirectAttributes attributes) {
        logger.debug("Execute Method overOrder...");

        orderService.confirmOver(orderForm);

        attributes.addFlashAttribute("message", "结算完毕。");

        return new ModelAndView("redirect:/main/index");
    }

    @RequestMapping("detail/{orderId}")
    public ModelAndView detail(@PathVariable("orderId") Integer orderId, Model model) {
        logger.debug("Execute Method detail...");

        Order order = orderService.getByOrderId(orderId);
        model.addAttribute("order", order);

        Table table = tableService.getByTableId(order.getFromId());
        model.addAttribute("table", table);

        return new ModelAndView("detail");
    }
}
