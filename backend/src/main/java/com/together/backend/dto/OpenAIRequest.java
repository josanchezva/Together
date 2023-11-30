package com.together.backend.dto;

import java.util.ArrayList;
import java.util.List;

public class OpenAIRequest {

    private String model;
    private List<ChatMessage> messages;

    public OpenAIRequest(String model, String prompt) {
        this.model = model;
        this.messages = new ArrayList<>();
        this.messages.add(new ChatMessage("user", prompt));
    }

    public String getModel() {
        return model;
    }

    public List<ChatMessage> getMessages() {
        return messages;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setMessages(List<ChatMessage> messages) {
        this.messages = messages;
    }

    @Override
    public String toString() {
        return "OpenAIRequest [model=" + model + ", messages=" + messages + "]";
    }

    

}
