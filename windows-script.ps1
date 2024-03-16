#Config Variables
#Credentials
$User = "mailer.test@interia.pl"
$PWord = ConvertTo-SecureString -String "Passy" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

#Get All files
$FolderPath1 = "C:\Workspaces\testowy1"
$Files1 = Get-ChildItem -Path $FolderPath1 -File -Recurse -Include *.* | Select-Object -ExpandProperty FullName
#$Files = Get-ChildItem -Path $FolderPath -Recurse -Include  *.pdf, *.csv | Select-Object -ExpandProperty FullName

#Get All files
$FolderPath2 = "C:\Workspaces\testowy1 kopia"
$Files2 = Get-ChildItem -Path $FolderPath2 -File -Recurse -Include *.* | Select-Object -ExpandProperty FullName
#$Files = Get-ChildItem -Path $FolderPath -Recurse -Include  *.pdf, *.csv | Select-Object -ExpandProperty FullName

$sendMailMessageSplat = @{
    From = 'User01 <mailer.test@interia.pl>'
    To = 'WindowsMail <mailer.test@interia.pl>'
    Subject = "Nowy mail 3"
    #Body = $Files
    Credential = $Credential
    SmtpServer = 'poczta.interia.pl'
    Attachments = $Files1 + $Files2
    Port = 587
    UseSsl = $true
}
Send-MailMessage @sendMailMessageSplat