echo "Script Starting"
echo "Fetching IP Address"
sleep  .75
ipconfig > currentIP.text
echo "IP Address Found, Creating File"
sleep  1
$file = "currentIP.text"
$att = new-object Net.Mail.Attachment($file)
echo "Initializing SMTP Server"
sleep  .75
$smtpServer = "webmail.lhric.org"
$msg = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
echo "Fetching Users"
sleep  1
$msg.From = "email@address.from"
$msg.To.Add("email@address.to")
echo "Generating Email"
sleep  .75
$msg.Subject = "<<Nightly Desktop IP Notice >>"
echo "Attaching File"
sleep  1
$msg.Attachments.Add($att)
echo "Sending Message"
sleep  .5
$smtp.Send($msg)
echo "Message Sent"
sleep  1
$att.Dispose()
echo "Trash Collection Completed"
sleep  .5
echo "Script End, Closing. Goodbye!"
sleep  2