#!/bin/bash

declare -A themes=(
  ["cerulean"]="A calm blue sky"
  ["cosmo"]="An ode to Metro"
  ["cyborg"]="Jet black and electric blue"
  ["darkly"]="Flatly in night mode"
  ["flatly"]="Flat and modern"
  ["journal"]="Crisp like a new sheet of paper"
  ["litera"]="The medium is the message"
  ["lumen"]="Light and shadow"
  ["lux"]="A touch of class"
  ["materia"]="Material is the metaphor"
  ["minty"]="A fresh feel"
  ["morph"]="A neumorphic layer"
  ["pulse"]="A trace of purple"
  ["quartz"]="A glassmorphic layer"
  ["sandstone"]="A touch of warmth"
  ["simplex"]="Mini and minimalist"
  ["sketchy"]="A hand-drawn look for mockups and mirth"
  ["slate"]="Shades of gunmetal gray"
  ["solar"]="A spin on Solarized"
  ["spacelab"]="Silvery and sleek"
  ["superhero"]="The brave and the blue"
  ["united"]="Ubuntu orange and unique font"
  ["vapor"]="A cyberpunk aesthetic"
  ["yeti"]="A friendly foundation"
  ["zephyr"]="Breezy and beautiful"
)

# Print theme menu
echo "Bootswatch CSS Themes:"
index=1
for theme in "${!themes[@]}"; do
  echo "$index. $theme - ${themes[$theme]}"
  index=$((index+1))
done

# Prompt for theme selection
read -p "Enter the number of the theme you want to download: " theme_number

# Get theme name based on user input
index=1
selected_theme=""
for theme in "${!themes[@]}"; do
  if [[ $index -eq $theme_number ]]; then
    selected_theme=$theme
    break
  fi
  index=$((index+1))
done

# Validate selected theme
if [[ -z $selected_theme ]]; then
  echo "Invalid theme selection."
  exit 1
fi

# Set base URL and ending
base_url="https://bootswatch.com/5/"
ending="/bootstrap.min.css"

# Set URL and filename
url="${base_url}${selected_theme}${ending}"
filename="${selected_theme}_bootstrap.css"

# Download the file
wget -O $filename $url
