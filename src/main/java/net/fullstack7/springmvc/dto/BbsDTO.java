package net.fullstack7.springmvc.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.checkerframework.checker.index.qual.Positive;

import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BbsDTO {
    @Positive
    private int idx;
    @PositiveOrZero
    private int refIdx;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int levelIdx=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int sortOrder=0;
    @NotBlank
    @Size(max=200)
    private String title;
    @Size(max=2000)
    @NotBlank
    private String content;
    @Size(max=20)
    @NotBlank
    private String memberId;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int readCnt=0;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    @NotBlank
    private String displayDate;
    private String fileName;
    private String filePath;
    private String fileExt;
    private int fileSize;
}
