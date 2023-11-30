package com.together.backend.dto;

import java.util.List;


public class OpenAIResponse {

    private List<Choice> choices;

    
    public static class Choice{
        
        private int index;
        private ChatMessage message;
    
        public Choice() {
        }

        public Choice(int index, ChatMessage message) {
            this.index = index;
            this.message = message;
        }

        public int getIndex() {
            return index;
        }
        public void setIndex(int index) {
            this.index = index;
        }
        public ChatMessage getMessage() {
            return message;
        }
        public void setMessage(ChatMessage message) {
            this.message = message;
        }
        
    }

    public OpenAIResponse() {
    }

    public OpenAIResponse(List<Choice> choices) {
        this.choices = choices;
    }

    public List<Choice> getChoices() {
        return choices;
    }

    public void setChoices(List<Choice> choices) {
        this.choices = choices;
    }
   
}
