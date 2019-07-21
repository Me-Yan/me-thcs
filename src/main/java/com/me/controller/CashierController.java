package com.me.controller;

import com.me.common.ResponseData;
import com.me.entity.Cashier;
import com.me.service.CashierService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
@Controller
@RequestMapping("/cashier")
public class CashierController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(CashierController.class);

    @Autowired
    private CashierService cashierService;

    @RequestMapping("listCashier")
    public ModelAndView listCashier(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listCashier...");

        if (StringUtils.isNotBlank(message)) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("listCashier");
    }

    @RequestMapping("listCashierData")
    @ResponseBody
    public List<Cashier> listCashierData() {
        logger.debug("Execute Method listCashierData...");

        return cashierService.listCashierData();
    }

    @RequestMapping("addCashier")
    public ModelAndView addCashier(@ModelAttribute("cashierForm") Cashier cashierForm) {
        logger.debug("Execute Method addCashier...");

        return new ModelAndView("addCashier");
    }

    @RequestMapping("confirmCashier")
    public ModelAndView confirmCashier(@ModelAttribute("cashierForm") Cashier cashierForm, RedirectAttributes attributes) {
        logger.debug("Execute Method confirmCashier...");

        cashierService.saveCashier(cashierForm);

        attributes.addFlashAttribute("message", "添加成功。");

        return new ModelAndView("redirect:listCashier");
    }

    @RequestMapping("deleteCashier")
    @ResponseBody
    public ResponseData deleteCashier(@RequestParam("cashierId") Integer cashierId) {
        logger.debug("Execute Method deleteCashier...");

        return cashierService.deleteByCashierId(cashierId);
    }

    @RequestMapping("checkCashier")
    @ResponseBody
    public int checkCashier(@RequestParam("name") String name) {
        logger.debug("Execute Method deleteCashier...");

        return cashierService.countByName(name);
    }

}
