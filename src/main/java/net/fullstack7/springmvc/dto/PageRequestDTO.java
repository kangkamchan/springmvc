package net.fullstack7.springmvc.dto;
import lombok.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @Min(value = 1)
    @Positive
    private int pageNo = 1;

    @Builder.Default
    @Min(value = 1)
    @Max(value = 100)
    @Positive
    private int pageSize = 10;

    public int getOffset(){
        return (pageNo - 1) * pageSize;
    }

}
