#!/bin/bash
source "$(dirname "$0")/config.env"

# The API Fetches weather data by cities in Nigeria 
weather_json=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$City_Name&appid=$Api_Key&units=metric")


# Extract weather condition
condition=$(echo "$weather_json" | jq -r '.weather[0].main' | tr '[:upper:]' '[:lower:]')

# Map condition to a category
case "$condition" in
    clear) weather_type="sunny" ;;
    rain | drizzle | thunderstorm) weather_type="rainy" ;;
    clouds) weather_type="cloudy" ;;
    snow) weather_type="snowy" ;;
    *) weather_type="sunny" ;; # fallback
esac

# Select random wallpaper from the right category
wallpaper=$(find "$Wallpaper_Directory/$weather_type" -type f | shuf -n 1)

# Set wallpaper using GNOME settings
gsettings set org.gnome.desktop.background picture-uri-dark "file://$wallpaper"


notify-send "Wallpaper Changed" "The wallpaper has been updated to match the current weather: $condition"
