package com.javaproject.controller;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.javaproject.dto.ConversationSummary;
import com.javaproject.model.Message;
import com.javaproject.model.User;
import com.javaproject.repository.MessageRepository;
import com.javaproject.repository.UserRepository;
import com.javaproject.service.MessageService;  // ✅ Added service import

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MessageService messageService;  // ✅ Inject MessageService

    // Show message form
    @GetMapping("/send")
    public String showMessageForm(@RequestParam("receiverEmail") String receiverEmail, Model model) {
        model.addAttribute("receiverEmail", receiverEmail);
        return "messageForm";
    }

    // Handle message submission
    @PostMapping("/send")
    public String sendMessage(
            @RequestParam String receiverEmail,
            @RequestParam String workNeeded,
            @RequestParam String dateRequired,
            @RequestParam String otherDetails,
            HttpSession session,
            Model model) {

        String senderEmail = (String) session.getAttribute("userEmail");
        if (senderEmail == null) {
            model.addAttribute("error", "You must be logged in to send messages.");
            return "login";
        }

        User sender = userRepository.findByEmail(senderEmail);
        User receiver = userRepository.findByEmail(receiverEmail);

        if (receiver == null) {
            model.addAttribute("error", "Receiver not found.");
            return "messageForm";
        }

        Message message = new Message();
        message.setSender(sender);
        message.setReceiver(receiver);
        message.setWorkNeeded(workNeeded);
        message.setDateRequired(dateRequired);
        message.setOtherDetails(otherDetails);
        message.setTimestamp(System.currentTimeMillis());

        messageRepository.save(message);

        return "redirect:/message/inbox";
    }

    // Show inbox
    @GetMapping("/inbox")
    public String showInbox(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }

        
        List<ConversationSummary> conversations = messageService.getConversationSummariesForUser(userEmail);
        model.addAttribute("conversations", conversations);
        return "inbox";
    }


    // Show conversation (Work Details View)
    @GetMapping("/conversation")
    public String viewConversation(
            @RequestParam("withEmail") String withEmail,
            HttpSession session,
            Model model) {

        String loggedInUserEmail = (String) session.getAttribute("userEmail");
        if (loggedInUserEmail == null) {
            return "redirect:/login";
        }

        List<Message> conversation = messageRepository.findConversationBetweenUsers(loggedInUserEmail, withEmail);
        model.addAttribute("conversation", conversation);
        model.addAttribute("withEmail", withEmail);
        return "conversation";
    }

    // Clear all messages
    @PostMapping("/clearAll")
    public String clearAllMessages(HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail != null) {
            messageService.deleteAllMessagesForUser(userEmail);
        }
        return "redirect:/message/inbox";
    }
    @PostMapping("/delete")
    public String deleteMessage(@RequestParam("messageId") Long messageId, HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail != null) {
            messageService.deleteMessageByIdAndUser(messageId, userEmail);
        }
        return "redirect:/message/inbox";
    }
    @GetMapping("/reply")
    public String showReplyForm(@RequestParam("receiverEmail") String receiverEmail, Model model, HttpSession session) {
        // Check user logged in
        if (session.getAttribute("userEmail") == null) {
            return "redirect:/login";
        }
        model.addAttribute("receiverEmail", receiverEmail);
        return "replyForm"; // This is the JSP page name
    }

    @PostMapping("/reply")
    public String sendReply(
            @RequestParam("receiverEmail") String receiverEmail,
            @RequestParam("replyContent") String replyContent,
            HttpSession session,
            Model model) {

        String senderEmail = (String) session.getAttribute("userEmail");
        if (senderEmail == null) {
            model.addAttribute("error", "You must be logged in to send messages.");
            return "login";
        }

        User sender = userRepository.findByEmail(senderEmail);
        User receiver = userRepository.findByEmail(receiverEmail);

        if (receiver == null) {
            model.addAttribute("error", "Receiver not found.");
            return "conversation"; // or appropriate view
        }

        Message reply = new Message();
        reply.setSender(sender);
        reply.setReceiver(receiver);
        reply.setWorkNeeded(replyContent);   // Use this field to store your reply text
        reply.setDateRequired("");           // optional or empty
        reply.setOtherDetails("");           // optional or empty
        reply.setTimestamp(System.currentTimeMillis());

        messageRepository.save(reply);

        return "redirect:/message/conversation?withEmail=" + receiverEmail;
    }

@PostMapping("/sendConversationReply")
public String sendConversationReply(
        @RequestParam String receiverEmail,
        @RequestParam(required = false) String content,
        @RequestParam(value = "file", required = false) MultipartFile file,
        HttpSession session,
        Model model) throws IOException {

    String senderEmail = (String) session.getAttribute("userEmail");
    if (senderEmail == null) {
        model.addAttribute("error", "You must be logged in to send messages.");
        return "login";
    }

    User sender = userRepository.findByEmail(senderEmail);
    User receiver = userRepository.findByEmail(receiverEmail);

    if (receiver == null) {
        model.addAttribute("error", "Receiver not found.");
        return "redirect:/message/inbox";
    }

    Message message = new Message();
    message.setSender(sender);
    message.setReceiver(receiver);
    message.setContent(content != null ? content : "");

    if (file != null && !file.isEmpty()) {
        // Save file to server
        String uploadsDir = "/uploads/"; // relative folder in your server
        String realPathToUploads = session.getServletContext().getRealPath(uploadsDir);
        if (!Files.exists(Paths.get(realPathToUploads))) {
            Files.createDirectories(Paths.get(realPathToUploads));
        }

        String originalFilename = file.getOriginalFilename();
        String filePath = realPathToUploads + originalFilename;
        file.transferTo(Paths.get(filePath));

        // Save file info in message
        message.setFileName(originalFilename);
        message.setFilePath(uploadsDir + originalFilename);  // relative path for web access
    }

    message.setTimestamp(System.currentTimeMillis());

    messageRepository.save(message);

    return "redirect:/message/conversation?withEmail=" + receiverEmail;
}

}
