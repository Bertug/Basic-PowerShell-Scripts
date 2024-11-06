# Get all enabled mailboxes
$mailboxes = Get-Mailbox -ResultSize Unlimited 

# Initialize an array to store results
$results = @()

# Loop through each mailbox
foreach ($mailbox in $mailboxes) {
    try {
        # Get the junk email configuration for each mailbox
        $junkEmailConfig = Get-MailboxJunkEmailConfiguration -Identity $mailbox.UserPrincipalName

        # Store the result
        $results += [PSCustomObject]@{
            User                     = $mailbox.UserPrincipalName
            TrustedSendersAndDomains  = $junkEmailConfig.TrustedSendersAndDomains.Count
            BlockedSendersAndDomains  = $junkEmailConfig.BlockedSendersAndDomains.Count
        }
    }
    catch {
        Write-Warning "Error retrieving junk email config for $($mailbox.UserPrincipalName)"
    }
}

# Output results to CSV
$results | Export-Csv -Path "JunkEmailConfigReport.csv" -NoTypeInformation