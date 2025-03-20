# Comprehensive Battery Status Guide for Termux:API

This guide provides a detailed explanation of how to monitor and analyze battery information using Termux:API, including advanced usage patterns and best practices.

## Prerequisites

- Termux app installed from F-Droid or Google Play Store
- Termux:API app installed from the same source as Termux
- Termux:API package installed (`pkg install termux-api`)
- `jq` package for JSON parsing (`pkg install jq`)

## Script Description

The following script demonstrates various methods to retrieve and display battery information:

```bash
#!/data/data/com.termux/files/usr/bin/bash

# Function to display separator
print_separator() {
    echo "----------------------------------------"
}

# Get complete battery status
echo "📱 Fetching battery information..."
print_separator

echo "Raw Battery Data:"
termux-battery-status
print_separator

# Parse and display specific information
STATUS=$(termux-battery-status | jq -r '.status')
PERCENTAGE=$(termux-battery-status | jq -r '.percentage')
TEMPERATURE=$(termux-battery-status | jq -r '.temperature')
HEALTH=$(termux-battery-status | jq -r '.health')
PLUGGED=$(termux-battery-status | jq -r '.plugged')

echo "Detailed Battery Information:"
echo "🔋 Status: $STATUS"
echo "📊 Charge Level: $PERCENTAGE%"
echo "🌡️ Temperature: $TEMPERATURE°C"
echo "❤️ Health: $HEALTH"
echo "🔌 Power Source: $PLUGGED"
print_separator

# Add battery level warning
if [ $PERCENTAGE -lt 20 ]; then
    echo "⚠️ Warning: Battery level is low!"
fi
```

## Installation and Setup

1. Create the script:
   ```bash
   nano battery_status.sh
   ```

2. Copy the script content above

3. Make it executable:
   ```bash
   chmod +x battery_status.sh
   ```

4. Run the script:
   ```bash
   ./battery_status.sh
   ```

## Sample Output

```
📱 Fetching battery information...
----------------------------------------
Raw Battery Data:
{
    "health": "GOOD",
    "percentage": 85,
    "plugged": "UNPLUGGED",
    "status": "DISCHARGING",
    "temperature": 28.5
}
----------------------------------------
Detailed Battery Information:
🔋 Status: DISCHARGING
📊 Charge Level: 85%
🌡️ Temperature: 28.5°C
❤️ Health: GOOD
🔌 Power Source: UNPLUGGED
----------------------------------------
```

## Advanced Usage

### Automated Monitoring
You can combine this script with `cron` or create a loop for continuous monitoring:

```bash
while true; do
    ./battery_status.sh
    sleep 300  # Check every 5 minutes
done
```

### Integration Ideas
- Send notifications when battery is low
- Log battery statistics over time
- Create battery usage reports
- Trigger actions based on battery status

## Troubleshooting

If you encounter issues:
1. Verify Termux:API app permissions
2. Ensure all required packages are installed
3. Check if Termux:API service is running
4. Verify script permissions

## Related Commands
- `termux-battery-status`: Get battery information
- `termux-notification`: Send notifications
- `termux-toast`: Show quick messages
