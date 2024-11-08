package net.fullstack7.springmvc.sample;

import lombok.ToString;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
@Log4j2
@ToString
@Repository
@Qualifier("normal")
public class SampleDAOImpl implements SampleDAOIf{

}
