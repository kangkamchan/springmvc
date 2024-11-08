package net.fullstack7.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.springmvc.domain.BbsVO;
import net.fullstack7.springmvc.dto.BbsDTO;
import net.fullstack7.springmvc.dto.PageDTO;
import net.fullstack7.springmvc.dto.PageRequestDTO;
import net.fullstack7.springmvc.dto.PageResponseDTO;
import net.fullstack7.springmvc.mapper.BbsMapper;
import net.fullstack7.springmvc.util.MapperUtil;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsServiceImpl implements BbsServiceIf {

    private final BbsMapper bbsXmlMapper;
    private final ModelMapper modelMapper;
    @Override
    public List<BbsDTO> listAll() {
        log.info("BbsServiceImpl.list");
        return bbsXmlMapper.listAll().stream().map(vo->modelMapper.map(vo,BbsDTO.class)).collect(Collectors.toList());
    }

    @Override
    public PageResponseDTO<BbsDTO> listWithPage(PageRequestDTO requestDTO) {
        return PageResponseDTO.<BbsDTO>withAll()
                .pageRequestDTO(requestDTO)
                .dtoList(bbsXmlMapper.listWithPage(requestDTO).stream().map(vo->modelMapper.map(vo,BbsDTO.class)).collect(Collectors.toList()))
                .totalCount(bbsXmlMapper.totalCountAll())
                .build();
    }

    @Override
    public List<BbsDTO> list(PageDTO<BbsDTO> pageDTO) {
        return bbsXmlMapper.list(pageDTO).stream().map(vo->modelMapper.map(vo,BbsDTO.class)).collect(Collectors.toList());
    }

    @Override
    public int totalCountAll() {
        log.info("BbsServiceImpl.totalCount");
        return bbsXmlMapper.totalCountAll();
    }

    @Override
    public int totalCount(PageDTO<BbsDTO> pageDTO) {
        return bbsXmlMapper.totalCount(pageDTO);
    }

    @Override
    public BbsDTO view(int idx) {
        log.info("BbsServiceImpl.view");
        return modelMapper.map(bbsXmlMapper.view(idx),BbsDTO.class);
    }

    @Override
    public void regist(BbsDTO dto) {
        log.info("BbsServiceImpl.regist");
        bbsXmlMapper.regist(modelMapper.map(dto,BbsVO.class));
    }

    @Override
    public void modify(BbsDTO dto) {
        log.info("BbsServiceImpl.modify");
        bbsXmlMapper.modify(modelMapper.map(dto,BbsVO.class));
    }

    @Override
    public void delete(int idx) {
        log.info("BbsServiceImpl.delete");
        bbsXmlMapper.delete(idx);
    }
}
