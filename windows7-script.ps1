#Script for Win7
#Config Variables
$From = "mailer.test@interia.pl"
$To = "mailer.test@interia.pl"
$SMTPServer = "poczta.interia.pl"
$SMTPPort = "587"
$Username = "mailer.test@interia.pl"
$Password = "Passy"
$subject = "This is the subject line"
$body = "This is the message body"
$FolderPath = "D:\Workspaces\GitTest"
$Files = Get-ChildItem -Path $FolderPath -Recurse -Include *file.txt* | Select-Object -ExpandProperty FullName

$message = new-object System.Net.Mail.MailMessage 
$message.From = $From 
$message.To.Add($To)
$message.Subject = $subject 
$attach = new-object Net.Mail.Attachment($Files) 
$message.Attachments.Add($attach)
$message.body = $body 

$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer,$SMTPPort) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)

$SMTPClient.Send($message)