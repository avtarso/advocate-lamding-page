#!/bin/bash
#chmod +x create-bilingual-post.sh
#./create-bilingual-post.sh delo-2

# Проверка аргумента
if [ -z "$1" ]; then
  echo "❌ Укажи имя каталога (slug), например: ./create-bilingual-post.sh delo-2"
  exit 1
fi

SLUG=$1
UK_PATH="site/content/uk/post/$SLUG"
RU_PATH="site/content/ru/post/$SLUG"

# Создание директорий
mkdir -p "$UK_PATH"
mkdir -p "$RU_PATH"

# Общий шаблон frontmatter
FRONTMATTER="---
title: Дело 2
translationKey: \"$SLUG\"
date: 
description: 
image: 
---"

# Создание украинской версии
echo "$FRONTMATTER" > "$UK_PATH/index.md"

# Создание русской версии
echo "$FRONTMATTER" > "$RU_PATH/index.md"

echo "✅ Статья '$SLUG' создана в uk и ru"
