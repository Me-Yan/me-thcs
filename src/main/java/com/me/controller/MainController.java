package com.me.controller;

import com.me.common.ResponseData;
import com.me.entity.Table;
import com.me.service.OrderService;
import com.me.service.TableService;
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

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
@Controller
@RequestMapping("/main")
public class MainController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private TableService tableService;

    @RequestMapping("/index")
    public ModelAndView index(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method index...");

        if (StringUtils.isNotBlank(message)) {
            model.addAttribute("message", message);
        }

        List<Table> tableList = tableService.listValidData();
        model.addAttribute("tableList", tableList);

        return new ModelAndView("main");
    }

}
