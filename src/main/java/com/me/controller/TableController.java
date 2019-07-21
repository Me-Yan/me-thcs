package com.me.controller;

import com.me.common.ResponseData;
import com.me.constant.Constants;
import com.me.entity.Order;
import com.me.entity.Table;
import com.me.entity.Type;
import com.me.service.TableService;
import com.me.service.TypeService;
import org.apache.commons.lang3.StringUtils;
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
@RequestMapping("/table")
public class TableController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(TableController.class);

    @Autowired
    private TableService tableService;
    @Autowired
    private TypeService typeService;

    @RequestMapping("listTable")
    public ModelAndView listTable(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listTable...");

        if (StringUtils.isNotBlank(message)) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("listTable");
    }

    @RequestMapping("listTableData")
    @ResponseBody
    public List<Table> listTableData() {
        logger.debug("Execute Method listTableData...");

        return tableService.listTableData();
    }

    @RequestMapping("addTable")
    public ModelAndView addTable(@ModelAttribute("tableForm") Table tableForm, Model model) {
        logger.debug("Execute Method addTable...");

        List<Type> typeList = typeService.listTypeData();
        model.addAttribute("typeList", typeList);

        return new ModelAndView("addTable");
    }

    @RequestMapping("confirmTable")
    public ModelAndView confirmTable(@ModelAttribute("tableForm") Table tableForm, RedirectAttributes attributes) {
        logger.debug("Execute Method confirmTable...");

        tableService.saveTable(tableForm);

        attributes.addFlashAttribute("message", "添加成功。");

        return new ModelAndView("redirect:listTable");
    }

    @RequestMapping("deleteTable")
    @ResponseBody
    public ResponseData deleteTable(@RequestParam("tableId") Integer tableId) {
        logger.debug("Execute Method deleteTable...");

        return tableService.deleteByTableId(tableId);
    }

    @RequestMapping("checkTable")
    @ResponseBody
    public int checkTable(@RequestParam("name") String name) {
        logger.debug("Execute Method checkTable...");

        return tableService.countByName(name);
    }

    @RequestMapping("changeTable/{tableId}")
    public ModelAndView changeTable(@PathVariable("tableId") Integer tableId, Model model) {
        logger.debug("Execute Method changeTable...");

        List<Table> tableList = tableService.listTableInStatus(tableId, Constants.TableStatus.VACANCY);
        model.addAttribute("tableList", tableList);

        Order orderForm = new Order();
        orderForm.setFromId(tableId);
        model.addAttribute("orderForm", orderForm);

        return new ModelAndView("changeTable");
    }

    @RequestMapping("confirmChange")
    public ModelAndView confirmChange(@ModelAttribute("orderForm") Order orderForm, RedirectAttributes attributes) {
        logger.debug("Execute Method confirmChange...");

        Table table = tableService.confirmChange(orderForm);

        attributes.addFlashAttribute("message", "已切换到" + table.getName() + "(<span style='color:red'>"+ table.getTypeName() +"</span>)");

        return new ModelAndView("redirect:/main/index");
    }

    @RequestMapping("checkIsVacancyTable")
    @ResponseBody
    public int checkIsVacancyTable(@RequestParam("tableId") Integer tableId) {
        logger.debug("Execute Method checkIsVacancyTable...");

        return tableService.countTableInStatus(tableId, Constants.TableStatus.VACANCY);
    }
}
