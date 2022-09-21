﻿$mailboxes = get-mailbox -resultsize Unlimited | select alias
foreach($i in $mailboxes){Get-MailboxCalendarFolder -Identity ($i.alias+ ":\calendar") | where{$_.publishEnabled -eq "True"} | ft Identity, PublishEnabled}