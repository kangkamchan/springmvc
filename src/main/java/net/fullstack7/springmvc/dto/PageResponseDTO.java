package net.fullstack7.springmvc.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;
@Getter
@ToString
public class PageResponseDTO<E> {
    private int pageNo;
    private int pageSize;
    private int totalCount;

    private int blockStart;
    private int blockEnd;
    private int totalPage;
    private boolean prev;
    private boolean next;

    private List<E> dtoList;
    @Builder(builderMethodName="withAll")
    public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int totalCount){
        this.pageNo = pageRequestDTO.getPageNo();
        this.pageSize = pageRequestDTO.getPageSize();
        this.totalCount = totalCount;
        this.totalPage = (totalCount-1) / pageSize + 1;
        this.pageNo = pageNo>totalPage?totalPage:pageNo;
        this.dtoList = dtoList;
        this.blockStart = ((pageNo-1) / pageSize)*pageSize + 1;
        this.blockEnd = blockStart + pageSize - 1;
        this.blockEnd = blockEnd>this.totalPage ? this.totalPage:blockEnd;
        this.prev = this.blockStart > 1;
        this.next = this.blockEnd < totalPage ;
    }
}
