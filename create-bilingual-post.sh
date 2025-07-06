#!/bin/bash
#chmod +x create-bilingual-post.sh
#./create-bilingual-post.sh delo-2

# Проверка аргументов
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "❌ Укажи два URL-slug-а: ./create-bilingual-post.sh ru-slug uk-slug"
  exit 1
fi

RU_SLUG=$1
UK_SLUG=$2

RU_PATH="site/content/ru/post/$RU_SLUG"
UK_PATH="site/content/uk/post/$UK_SLUG"

DATE=$(date +"%Y-%m-%dT%H:%M:%S%:z")

# Создание директорий
mkdir -p "$UK_PATH"
mkdir -p "$RU_PATH"

# Frontmatter
FRONTMATTER_UK="---
title: \"$UK_SLUG\"
translationKey: \"$RU_SLUG\"
date: \"$DATE\"
description: 
image: 
---"

FRONTMATTER_RU="---
title: \"$RU_SLUG\"
translationKey: \"$RU_SLUG\"
date: \"$DATE\"
description: 
image: 
---"

# Запись файлов
echo "$FRONTMATTER_UK" > "$UK_PATH/index.md"
echo "$FRONTMATTER_RU" > "$RU_PATH/index.md"

echo "✅ Статьи '$RU_SLUG' и '$UK_SLUG' созданы в папках ru и uk"