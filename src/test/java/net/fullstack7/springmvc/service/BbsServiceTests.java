package net.fullstack7.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.springmvc.dto.BbsDTO;
import net.fullstack7.springmvc.dto.PageRequestDTO;
import net.fullstack7.springmvc.dto.PageResponseDTO;
import net.fullstack7.springmvc.mapper.BbsMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/config/root-context.xml")
public class BbsServiceTests {

    @Autowired(required = false)
    private BbsServiceIf bbsService;

    @Test
    public void testView(){
        log.info(bbsService.view(543));
        Assertions.assertNotNull(bbsService.view(543));
    }
    @Test
    public void testListWithPage(){
        PageResponseDTO<BbsDTO> resDto = bbsService.listWithPage(PageRequestDTO.builder().pageNo(2).pageSize(10).build());
        log.info(resDto);
        resDto.getDtoList().forEach(dto -> log.info(dto.toString()));
    }
}
