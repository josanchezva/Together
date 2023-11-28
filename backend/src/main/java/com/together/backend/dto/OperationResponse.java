package com.together.backend.dto;

public class OperationResponse<T>{
    
    private String message;
    private T entity;

    public OperationResponse() {
    }

    public OperationResponse(String message, T entity) {
        this.message = message;
        this.entity = entity;
    }

    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public T getEntity() {
        return entity;
    }
    public void setEntity(T entity) {
        this.entity = entity;
    }
}
