package com.itkey.erpdev.member.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.io.UnsupportedEncodingException;
@Slf4j
@Service
@AllArgsConstructor
public class smtpService {
    private JavaMailSender emailSender;

    public void sendSimpleFileMessage(String fileMailSender,String senderNm, String fileMailSubject, String filePath,String fileMailreceiver) throws MessagingException, UnsupportedEncodingException, MessagingException {
        MimeMessage message = emailSender.createMimeMessage();

        log.info("------------------------mail service start----------------");

        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message,true,"UTF-8");

        mimeMessageHelper.setSubject(fileMailSubject);
        mimeMessageHelper.setTo(new InternetAddress(fileMailreceiver,"","UTF-8")); // 받는사람
        mimeMessageHelper.setFrom(new InternetAddress(fileMailSender,senderNm));// 보내는사람 고정
        DataSource dataSource = new FileDataSource(String.valueOf(filePath));
        mimeMessageHelper.addAttachment(MimeUtility.encodeText(dataSource.getName(),"UTF-8","B"), dataSource);
        mimeMessageHelper.setText("", true);

        emailSender.send(message);

        log.info("------------------------mail service end----------------");

    }

    public void sendSimpleMessage(String content,String receiver,String subject,String sender,String senderNm,String receiverName) throws MessagingException, UnsupportedEncodingException {

        MimeMessage message = emailSender.createMimeMessage();
        log.info("------------------------mail service start----------------");

        //message.setFrom(new InternetAddress("mailtest@itkey.co.kr")); // 보내는 사람
        //message.setRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress("mailtest@itkey.co.kr","포크","UTF-8"))); // 받는사람
        //message.setRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress("mailtest@itkey.co.kr",receiverName,"UTF-8"))); // 받는사람
        message.setFrom(new InternetAddress(sender, senderNm)); // 보내는 사람
        message.setRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress(receiver,receiverName,"UTF-8"))); // 받는사람
        message.setText(content,"UTF-8","html");// 메일 내용
        message.setSubject(subject); // 메일 제목
        emailSender.send(message); //메일 발송
        log.info("------------------------mail service end----------------");
    }
}
