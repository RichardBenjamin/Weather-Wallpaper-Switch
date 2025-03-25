# **Weather Wallpaper Switch**

This project automatically changes your desktop wallpaper based on real-time weather conditions using the **OpenWeatherMap API**. The wallpaper is updated at regular intervals and can be customized based on different weather conditions such as sunny, rainy, or cloudy.

## **Features**

- **Weather-based Wallpaper**: Changes your desktop wallpaper according to the weather conditions in your location.
- **Automatic Updates**: The wallpaper is updated every specified interval based on the weather condition.
- **Customizable**: Easily configurable to match your location and desired update frequency.
- **Notification**: Receives a notification whenever the wallpaper is changed.

## **Prerequisites**

Before using this project, make sure you have the following installed:

- **Curl**: To fetch weather data from the OpenWeatherMap API.
- **API Key** from OpenWeatherMap.

### **Installing Dependencies**

You can install the required dependencies by running the following commands:
   
	sudo apt update 
	sudo apt install curl
 
## **Setup**

### 1. API Key Setup

You need an API key from OpenWeatherMap. You can obtain it by signing up at [OpenWeatherMap](https://openweathermap.org/).

Once you have your API key, update the `.env` file with your key:

	Api_Key="YOUR_API_KEY"
 
### 2. Configuration

Edit the weather-switch.sh file to specify your desired weather conditions. For example, you can specify the city and units of temperature (Celsius or Fahrenheit).

To change the location, replace Kaduna,NG with your preferred city and country code in the API request URL:

    curl -s "http://api.openweathermap.org/data/2.5/weather?q=Kaduna,NG&appid=YOUR_API_KEY&units=metric"

### 3. Setting Up Wallpapers

Create different folders for different weather conditions. For example:

	/path/to/wallpapers/
    -- sunny/
    -- cloudy/
    -- rainy/
	-- snowy/

### 4. Running the Script

Once everything is set up, you can run the script to automatically change your wallpaper based on the weather:

    ./weather-wallpaper-switch.sh

The script will:

  Fetch the current weather from the OpenWeatherMap API.

  Change the wallpaper based on the weather condition (sunny, rainy, cloudy, etc.).

### 5. Automating with Cron

To automate this process, you can add a cron job to run the script at regular intervals. For example, to run the script every 30 minutes:

    crontab -e
Add the following line to your crontab:

    */30 * * * * /path/to/weather-wallpaper-switch.sh
This will run the script every 30 minutes.

### Troubleshooting

  -  Wallpaper is not changing: Ensure that the paths to your wallpaper folders are correct. Check if the wallpaper filenames are accurate.

  -  API Errors: If you encounter errors related to the OpenWeatherMap API, check the API key and ensure your quota isn't exceeded.

### License

This project is licensed under the MIT License - see the LICENSE file for details.



