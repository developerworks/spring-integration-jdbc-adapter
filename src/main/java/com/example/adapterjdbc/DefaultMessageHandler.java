package com.example.adapterjdbc;

import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHandler;
import org.springframework.messaging.MessagingException;

@Slf4j
public class DefaultMessageHandler implements MessageHandler {
    private String name;

    public DefaultMessageHandler(String name) {
        this.name = name;
    }

    @Override
    public void handleMessage(Message<?> message) throws MessagingException {
        log.info("订阅者 {} 消息: {}", this.name, message.getPayload());
    }
}
