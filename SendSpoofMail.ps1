Connect-ExchangeOnline
$smtpServer = "m365x27813413.mail.protection.outlook.com"
$msg = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient($smtpServer,25)
$msg.From = "sender@contoso.com"
$msg.To.Add("admin@M365x27813413.onmicrosoft.com")
$msg.Subject = "Here is the subject"
$msg.Body = "Here is the message"
$smtp.Send($msg)
$msg.Dispose()