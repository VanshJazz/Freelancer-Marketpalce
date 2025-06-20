package com.javaproject.dto;

import com.javaproject.model.Message;

public class ConversationSummary {
    private Message firstMessage;
    private Message lastMessage;

    public ConversationSummary(Message firstMessage, Message lastMessage) {
        this.firstMessage = firstMessage;
        this.lastMessage = lastMessage;
    }

    public Message getFirstMessage() {
        return firstMessage;
    }

    public void setFirstMessage(Message firstMessage) {
        this.firstMessage = firstMessage;
    }

    public Message getLastMessage() {
        return lastMessage;
    }

    public void setLastMessage(Message lastMessage) {
        this.lastMessage = lastMessage;
    }
}
