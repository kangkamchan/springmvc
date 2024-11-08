package net.fullstack7.springmvc.mapper;

import net.fullstack7.springmvc.domain.BbsVO;
import net.fullstack7.springmvc.dto.BbsDTO;
import net.fullstack7.springmvc.dto.PageDTO;
import net.fullstack7.springmvc.dto.PageRequestDTO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BbsMapper {
    int totalCountAll();
    List<BbsVO> listAll();
    List<BbsVO> listWithPage(PageRequestDTO pageRequestDTO);
    List<BbsVO> list(PageDTO<BbsDTO> pageDTO);
    int totalCount(PageDTO<BbsDTO> pageDTO);
    BbsVO view(int idx);
    void regist(BbsVO vo);
    void modify(BbsVO vo);
    void delete(int idx);
}
