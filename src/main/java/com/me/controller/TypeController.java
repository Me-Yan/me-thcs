package com.me.controller;

import com.me.common.ResponseData;
import com.me.entity.Type;
import com.me.service.TypeService;
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
@RequestMapping("type")
public class TypeController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(TypeController.class);

    @Autowired
    private TypeService typeService;

    @RequestMapping("listType")
    public ModelAndView listType(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listType...");

        if (StringUtils.isNotBlank(message)) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("listType");
    }

    @RequestMapping("listTypeData")
    @ResponseBody
    public List<Type> listTypeData() {
        logger.debug("Execute Method listTypeData...");

        return typeService.listTypeData();
    }

    @RequestMapping("addType")
    public ModelAndView addType(@ModelAttribute("typeForm") Type typeForm) {
        logger.debug("Execute Method addType...");

        return new ModelAndView("addType");
    }

    @RequestMapping("confirmType")
    public ModelAndView confirmType(@ModelAttribute("typeForm") Type typeForm, RedirectAttributes attributes) {
        logger.debug("Execute Method confirmType...");

        typeService.saveType(typeForm);

        attributes.addFlashAttribute("message", "添加成功。");

        return new ModelAndView("redirect:listType");
    }

    @RequestMapping("deleteType")
    @ResponseBody
    public ResponseData deleteType(@RequestParam("typeId") Integer typeId) {
        logger.debug("Execute Method deleteType...");

        return typeService.deleteByTypeId(typeId);
    }

    @RequestMapping("checkType")
    @ResponseBody
    public int checkType(@RequestParam("typeName") String typeName) {
        logger.debug("Execute Method checkType...");

        return typeService.countByName(typeName);
    }
}
