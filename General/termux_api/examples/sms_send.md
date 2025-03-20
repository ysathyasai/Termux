# Comprehensive Guide to Sending SMS with Termux API

This comprehensive guide demonstrates how to effectively utilize Termux:API for sending SMS messages programmatically from your Android device.

## Prerequisites

- Termux application installed from Google Play Store or F-Droid
- Termux:API application installed from the same source as Termux
- `termux-api` package installed (`pkg install termux-api`)
- SMS permissions granted to Termux:API in Android settings
- Basic command-line knowledge

## Installation Steps

1. Install Termux app
2. Install Termux:API app
3. Open Termux and run:
    ```bash
    pkg update && pkg upgrade
    pkg install termux-api
    ```
4. Grant SMS permissions through Android settings

## Usage Syntax

```bash
termux-sms-send [options] -n <phone_number(s)> "message_content"
```

## Examples

### Basic SMS Sending
```bash
termux-sms-send -n "+1234567890" "Hello from Termux!"
```

### Multiple Recipients
```bash
termux-sms-send -n "+1234567890,+9876543210" "Group message from Termux"
```

### Using Specific SIM Card
```bash
termux-sms-send -s 2 -n "+1234567890" "Sending from SIM 2"
```

### Scheduled SMS using cron
```bash
(crontab -l 2>/dev/null; echo "0 8 * * * termux-sms-send -n '+1234567890' 'Good morning!'") | crontab -
```

## Advanced Options

- `-n`: Recipient phone number(s), comma-separated for multiple
- `-s`: SIM slot selection (1 or 2 for dual SIM devices)
- Use with other Termux:API commands for automation

## Best Practices

1. Always include country code in phone numbers
2. Verify permissions before sending
3. Test with your own number first
4. Keep message content properly quoted
5. Monitor SMS delivery status
6. Consider rate limits and carrier restrictions

## Troubleshooting

### Common Issues:
- Permission denied errors
- Invalid phone number format
- SMS delivery failures
- API connection problems
- SIM card not detected

### Solutions:
1. Check Android permissions
2. Verify phone number format
3. Ensure cellular connectivity
4. Reinstall Termux:API if needed
5. Verify SIM card status

## Integration Examples

### Shell Script Integration
```bash
#!/data/data/com.termux/files/usr/bin/bash
# SMS sending wrapper
send_sms() {
     termux-sms-send -n "$1" "$2"
}
```

### Error Handling Implementation
```bash
if ! termux-sms-send -n "$NUMBER" "$MESSAGE"; then
     echo "Failed to send SMS"
     exit 1
fi
```

## Security Considerations

- Protect scripts containing phone numbers
- Avoid storing sensitive messages
- Use secure storage for automation scripts
- Regular permission audits
- Monitor SMS usage

## Additional Resources

- Termux Wiki
- Termux:API documentation
- Android SMS documentation
- Bash scripting guides