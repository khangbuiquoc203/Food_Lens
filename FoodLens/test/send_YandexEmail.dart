import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/yandex.dart';

Future<bool> sendNewPasswordEmailFromYandex(String email, String newPassword) async {
    final yandexSmtp =
      yandex(dotenv.env["YANDEX_EMAIL"]!, dotenv.env["YANDEX_PASSWORD"]!);

    final message = Message()
      ..from = Address(dotenv.env["YANDEX_EMAIL"]!, 'Confirmation Bot')
      ..recipients.add(email)
      ..subject = "Your New Password (${DateTime.now()})"
      // ..html = '<html><body style="text-align: center; font-family: Tahoma, Geneva, Verdana, sans-serif;">'
      //     '<div style="margin:auto; border-radius: 10px; width: 300px; padding: 10px; box-shadow: 1px 1px 1px 1px rgb(174, 174, 174);">'
      //     '<img style="height: 150px;" src="https://static.vecteezy.com/system/resources/previews/018/930/122/non_2x/email-marketing-campaign-subscription-on-web-and-sending-email-newsletter-for-discount-or-promotion-information-businessmen-standing-next-to-email-envelope-announcing-promotion-through-megaphone-vector.jpg" alt="newsletter">'
      //     '<h2>Thanks for using my application 🙌</h2>'
      //     '<p>Now you will never miss any updates.</p><p>Thanks for your support 😍</p>'
      //     '</div></body></html>'
      ..text = "Your new password is: $newPassword";

    try {
      final sendReport = await send(message, yandexSmtp);
      print('Email sent: ' + sendReport.toString());
      return true; 
    } catch (e) {
      print('Error sending email: $e');
      return false; 
    }
  }

  void main() async {
    
  await dotenv.load(fileName: ".env");
  var email = 'vipthanh05@gmail.com';
  var newPassword = 'ssdsd';
  await sendNewPasswordEmailFromYandex(email, newPassword);
  }