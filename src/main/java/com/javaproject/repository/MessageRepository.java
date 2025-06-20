package com.javaproject.repository;

import com.javaproject.model.Message;
import com.javaproject.model.User;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {

    List<Message> findByReceiver_EmailOrderByTimestampDesc(String receiverEmail);

    List<Message> findBySender_EmailAndReceiver_EmailOrderByTimestampAsc(String senderEmail, String receiverEmail);

    List<Message> findByReceiver_EmailAndSender_EmailOrderByTimestampAsc(String receiverEmail, String senderEmail);
    
    @Query("SELECT m FROM Message m WHERE m.receiver.email = :email ORDER BY m.timestamp DESC")
    List<Message> findByReceiverEmailOrderByTimestampDesc(@Param("email") String receiverEmail);
    
    @Query("SELECT m FROM Message m WHERE " +
            "(m.sender.email = :userEmail1 AND m.receiver.email = :userEmail2) OR " +
            "(m.sender.email = :userEmail2 AND m.receiver.email = :userEmail1) " +
            "ORDER BY m.timestamp ASC")
     List<Message> findConversationBetweenUsers(@Param("userEmail1") String userEmail1,
                                                @Param("userEmail2") String userEmail2);
    @Modifying
    @Transactional
    @Query("DELETE FROM Message m WHERE m.sender = :user OR m.receiver = :user")
    void deleteAllMessagesForUser(@Param("user") User user);

    List<Message> findByReceiverEmailOrderByTimestampAsc(String receiverEmail);

}
