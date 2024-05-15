import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleapis/gmail/v1.dart' as gmail;
import 'package:google_sign_in/google_sign_in.dart';

class GmailService {
  static final _googleSignIn = GoogleSignIn(scopes: ['email', 'https://www.googleapis.com/auth/gmail.compose']);

  static Future<void> sendEmail(String recipient, String subject, String body) async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      final googleSignInAuthentication = await googleSignInAccount.authentication;
      final authHeaders = googleSignInAuthentication.headers;
      
      final gmailApi = gmail.GmailApi(_googleSignIn.currentUser.authHeaders['Authorization']);
      
      final message = gmail.Message()
        ..raw = base64Url.encode(utf8.encode(
            'From: ${googleSignInAccount.email}\r\n'
            'To: $recipient\r\n'
            'Subject: $subject\r\n'
            'Content-Type: text/html; charset=utf-8\r\n\r\n'
            '$body'))
            .replaceAll('+', '-')
            .replaceAll('/', '_')
            .replaceAll('=', '');

      await gmailApi.users.messages.send(message, 'me');
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}

// Sử dụng GmailService
GmailService.sendEmail('recipient@example.com', 'Test Email', 'This is a test email.');
