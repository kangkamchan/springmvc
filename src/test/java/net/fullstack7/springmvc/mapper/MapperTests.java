package net.fullstack7.springmvc.mapper;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.springmvc.dto.BbsDTO;
import net.fullstack7.springmvc.dto.PageDTO;
import net.fullstack7.springmvc.dto.PageRequestDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/config/root-context.xml")
public class MapperTests {
    @Autowired(required = false)
    private BbsMapper mapper;
    @Test
    public void testListWithPage(){
        log.info(mapper.listWithPage(PageRequestDTO.builder().pageNo(2).pageSize(10).build()));
    }
    @Test
    public void testList(){
        PageDTO<BbsDTO> pDto = PageDTO.<BbsDTO>builder()
                .pageNo(2)
                .pageSize(10)
                .searchCategory("title")
                .searchWord("3")
                .sortField("")
                .sortOrder("")
                .build();
        pDto.initialize();
        pDto.setTotalCount(mapper.totalCount(pDto));
        log.info(pDto);
    }
}
