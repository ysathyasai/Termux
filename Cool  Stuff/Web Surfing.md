
# Web Surfing Tools Installation and Usage Guide for Termux

## Introduction  
This guide provides detailed steps on how to install and use web surfing tools in Termux. Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux environment on your Android device, including text-based web browsers. These browsers are lightweight, work well on slow networks, and are useful for developers and power users.  

## Prerequisites  
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).  
Alternatively, follow this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md) for installation instructions.  

## Step 1: Update and Upgrade Termux Packages  
First, update and upgrade the Termux packages to ensure that you have the latest package lists:  
```sh
pkg update && pkg upgrade
```  

## Step 2: Install Lynx  
**Lynx** is one of the oldest and most widely used text-based web browsers. It is known for its speed and reliability but does not support images or JavaScript. To install Lynx in Termux, run:  
```sh
pkg install lynx
```  

## Step 3: Using Lynx  
After installation, start Lynx by typing:  
```sh
lynx
```  
To open a specific website:  
```sh
lynx https://www.example.com
```  
Use the arrow keys to navigate. Press `Q` to quit Lynx.  

## Step 4: Install w3m  
**w3m** is a text-based web browser that supports images (with proper setup) and tables. It provides better formatting for modern web pages than Lynx. To install w3m in Termux, run:  
```sh
pkg install w3m
```  

## Step 5: Using w3m  
To start w3m, type:  
```sh
w3m
```  
To open a website:  
```sh
w3m https://www.example.com
```  
Navigate using the arrow keys. Press `Q` to quit.  

## Step 6: Install Links  
**Links** is a text-based browser that supports both graphics (in framebuffer mode) and JavaScript (in `links2`). It provides a more interactive experience. To install Links in Termux, run:  
```sh
pkg install links
```  

## Step 7: Using Links  
To start Links, type:  
```sh
links
```  
To open a specific website:  
```sh
links https://www.example.com
```  
Use the arrow keys for navigation and press `Q` to quit.  

## Step 8: Install ELinks (Optional)  
**ELinks** is an advanced text-based browser with tabbed browsing, mouse support, and scripting capabilities. It is more modern than Lynx but requires additional configuration for full functionality. To install ELinks:  
```sh
pkg install elinks
```  

## Step 9: Using ELinks  
To start ELinks, type:  
```sh
elinks
```  
To open a website:  
```sh
elinks https://www.example.com
```  
Press `Esc` to open the menu, use arrow keys for navigation, and press `Q` to quit.  

## Step 10: Configuring Proxy for Text-Based Browsers  
If you need to configure a proxy for your text-based browsers, set the `http_proxy`, `https_proxy`, and `ftp_proxy` environment variables. Add the following lines to your `~/.profile` file:  
```sh
export http_proxy=http://yourproxy:port
export https_proxy=https://yourproxy:port
export ftp_proxy=ftp://yourproxy:port
```  
Reload the profile:  
```sh
source ~/.profile
```  

## Step 11: Troubleshooting Common Issues  
### Issue: "Command Not Found"  
If you get a `command not found` error after installing a browser, try restarting Termux or running:  
```sh
rehash
```  

### Issue: Browser Not Displaying Pages Correctly  
- Some websites block text-based browsers. Try a different browser (e.g., w3m instead of Lynx).  
- Check if JavaScript-dependent websites work better in Links or ELinks.  
- Some browsers need additional fonts for proper rendering. Install them with:  
  ```sh
  pkg install fontconfig  
  ```  

### Issue: Proxy Not Working  
Ensure the proxy settings are correct by checking:  
```sh
echo $http_proxy
echo $https_proxy
```  

## Conclusion  
You have successfully installed and used various web surfing tools in Termux. These browsers are useful for navigating the web in a lightweight manner, accessing content in slow network conditions, or even scraping data. For advanced customization, refer to the official documentation of each tool.  

Happy web surfing! 🚀
