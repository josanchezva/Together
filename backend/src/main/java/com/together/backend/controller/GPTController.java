package com.together.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.together.backend.dto.OpenAIRequest;
import com.together.backend.dto.OpenAIResponse;

@RestController
@RequestMapping("/gpt")
public class GPTController {

    @Value("${openai.model}")
    private String model;

    @Value("${openai.api.endpoint}")
    private String url;
    
    @Autowired
    private RestTemplate template;

    @GetMapping("/chat")
    public String chat(@RequestParam("prompt") String prompt){
        OpenAIRequest request = null;
        OpenAIResponse response = null;
        String answer = "";
        try {
            request = new OpenAIRequest(model, prompt);
            response = template.postForObject(url, request, OpenAIResponse.class);
            answer = response.getChoices().get(0).getMessage().getContent();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return answer;
    }
    
}
