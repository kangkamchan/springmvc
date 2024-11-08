package net.fullstack7.springmvc.dto;

import lombok.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PageDTO<E> {
    private static final String DEFAULT_SORT_FIELD = "idx";
    private static final String DEFAULT_SORT_ORDER = "desc";
    private static final String EMPTY = "";
    @Builder.Default
    @Min(value=1)
    @Max(value=1000)
    private int pageNo = 1;
    @Builder.Default
    @Min(value=1)
    @Max(value=20)
    private int pageSize = 10;
    private int offset;
    private int totalCount;
    private final int blockSize = 10;
    private int blockStart;
    private int blockEnd;
    private int totalPage;
    private boolean prev;
    private boolean next;
    @Pattern(regexp = "^(title|content|memberId)$", message = "싫은데요")
    private String searchCategory;
    @Size(max=100)
    private String searchWord;
    @Pattern(regexp = "^(idx|title|regDate)$", message = "싫은데요")
    private String sortField;
    @Pattern(regexp = "^(asc|desc)$", message = "싫은데요")
    private String sortOrder;
    private String queryString;
    private List<E> dtoList;
    public void initialize() {
        this.offset = (pageNo - 1) * pageSize;
        this.blockStart = ((pageNo-1) / pageSize)*pageSize + 1;
        this.blockEnd = blockStart + pageSize - 1;
        this.prev = this.blockStart > 1;
        if(this.sortField==null||this.sortField.isEmpty()) this.sortField = DEFAULT_SORT_FIELD;
        if(this.sortOrder==null||this.sortOrder.isEmpty()) this.sortOrder = DEFAULT_SORT_ORDER;
        if(this.searchCategory==null||this.searchCategory.isEmpty()) this.searchCategory = EMPTY;
        if(this.searchWord==null||this.searchWord.isEmpty()) this.searchWord = EMPTY;
        this.queryString = "searchCategory="+this.searchCategory+"&searchWord="+this.searchWord+"&sortField="+this.sortField+"&sortOrder="+this.sortOrder;
    }
    public void setTotalCount(int totalCount){
        this.totalCount = totalCount;
        this.totalPage = (totalCount-1) / pageSize + 1;
        this.pageNo = pageNo>totalPage?totalPage:pageNo;
        this.blockEnd = blockEnd>this.totalPage ? this.totalPage:blockEnd;
        this.next = this.blockEnd < totalPage ;
    }
}
