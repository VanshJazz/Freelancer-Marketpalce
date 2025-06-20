package com.javaproject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaproject.dto.ConversationSummary;
import com.javaproject.model.Message;
import com.javaproject.model.User;
import com.javaproject.repository.MessageRepository;
import com.javaproject.repository.UserRepository;
@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserRepository userRepository;

    public List<ConversationSummary> getConversationSummariesForUser(String receiverEmail) {
        List<Message> messages = messageRepository.findByReceiverEmailOrderByTimestampAsc(receiverEmail);

        // Group messages by sender email
        Map<String, List<Message>> groupedBySender = messages.stream()
            .collect(Collectors.groupingBy(m -> m.getSender().getEmail()));

        List<ConversationSummary> summaries = new ArrayList<>();
        for (Map.Entry<String, List<Message>> entry : groupedBySender.entrySet()) {
            List<Message> msgs = entry.getValue();
            if (!msgs.isEmpty()) {
                Message first = msgs.get(0); // ordered ascending by timestamp, so first is oldest
                Message last = msgs.get(msgs.size() - 1);
                summaries.add(new ConversationSummary(first, last));
            }
        }

        // Optional: sort summaries by last message timestamp descending to show recent on top
        summaries.sort((a, b) -> Long.compare(b.getLastMessage().getTimestamp(), a.getLastMessage().getTimestamp()));

        return summaries;
    }
    @Transactional
    public void deleteAllMessagesForUser(String email) {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            messageRepository.deleteAllMessagesForUser(user);
        }
    }
    @Transactional
    public void deleteMessageByIdAndUser(Long messageId, String userEmail) {
        Message message = messageRepository.findById(messageId).orElse(null);
        if (message != null && 
           (message.getSender().getEmail().equals(userEmail) || message.getReceiver().getEmail().equals(userEmail))) {
            messageRepository.deleteById(messageId);
        }
    }

}
