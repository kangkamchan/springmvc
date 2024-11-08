package net.fullstack7.springmvc.service;

import net.fullstack7.springmvc.dto.BbsDTO;
import net.fullstack7.springmvc.dto.PageDTO;
import net.fullstack7.springmvc.dto.PageRequestDTO;
import net.fullstack7.springmvc.dto.PageResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BbsServiceIf {
    public List<BbsDTO> listAll();
    PageResponseDTO<BbsDTO> listWithPage(PageRequestDTO requestDTO);
    public List<BbsDTO> list(PageDTO<BbsDTO> pageDTO);
    public int totalCountAll();
    public int totalCount(PageDTO<BbsDTO> pageDTO);
    public BbsDTO view(int idx);
    public void regist(BbsDTO dto);
    public void modify(BbsDTO dto);
    public void delete(int idx);
}
