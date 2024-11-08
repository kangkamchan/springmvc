package net.fullstack7.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.springmvc.dto.BbsDTO;
import net.fullstack7.springmvc.dto.PageDTO;
import net.fullstack7.springmvc.dto.PageRequestDTO;
import net.fullstack7.springmvc.service.BbsServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/bbs")
@RequiredArgsConstructor
public class BbsController {
    private final BbsServiceIf bbsService;
    @GetMapping("/list.do")
    public String list(@Valid PageDTO<BbsDTO> pageDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model) {
        log.info(pageDTO);
        if(bindingResult.hasErrors()) {
            pageDTO = PageDTO.<BbsDTO>builder().build();
        }
        pageDTO.initialize();
        pageDTO.setTotalCount(bbsService.totalCount(pageDTO));
        log.info("totalCount : "+ bbsService.totalCount(pageDTO));
        log.info(pageDTO);
        pageDTO.setDtoList(bbsService.list(pageDTO));
        model.addAttribute("pageDTO", pageDTO);
        return "bbs/list";
    }
    @GetMapping("/view.do")
    public String view(@RequestParam int idx, Model model) {
        model.addAttribute("bbs",bbsService.view(idx));
        log.info("=========");
        log.info("view");
        log.info("=========");
        return "bbs/view";
    }
    @GetMapping("/regist.do")
    public String regist(){
        log.info("=========");
        log.info("regist");
        log.info("=========");
        return "bbs/regist";
    }
    @PostMapping("/regist.do")
    public String registPost(@Valid BbsDTO bbsDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){
        if(bindingResult.hasErrors()) {
            log.info("hasErrors");
            log.info(bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/bbs/regist.do";
        }
        bbsService.regist(bbsDTO);
        log.info("=========");
        log.info("regist");
        log.info("=========");
        return "redirect:/bbs/list.do";
    }
    @GetMapping("/modify.do")
    public String modify(int idx, Model model) {
        model.addAttribute("dto",bbsService.view(idx));
        log.info("=========");
        log.info("modify");
        log.info("=========");
        return "bbs/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(@Valid BbsDTO bbsDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){
        if(bindingResult.hasErrors()) {
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dto", bbsDTO);
            return "redirect:/bbs/modify.do?idx="+bbsDTO.getIdx();
        }
        log.info("=========");
        log.info("modify");
        log.info("=========");
        return "redirect:bbs/list";
    }
}
