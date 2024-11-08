package net.fullstack7.springmvc.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsVO {
    private int idx;
    private int refIdx;
    private int levelIdx;
    private int sortOrder;
    private String title;
    private String content;
    private String memberId;
    private int readCnt;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private String displayDate;
    private String fileName;
    private String filePath;
    private String fileExt;
    private int fileSize;
}
