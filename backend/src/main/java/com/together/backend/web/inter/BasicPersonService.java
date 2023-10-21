package com.together.backend.web.inter;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.together.backend.dto.BasicPerson;


@RestController
@RequestMapping("/person")
public interface BasicPersonService {
    
    @PostMapping("/create")
    public BasicPerson createBasicPerson(@RequestBody BasicPerson basicPerson) throws Exception;
}
