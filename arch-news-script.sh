#!/usr/bin/env bash
set -euo pipefail

NEWS_FILE="${HOME}/.config/arch-news-custom-script/.cache/arch_last_news_id"
mkdir -p "$(dirname "$NEWS_FILE")"

latest_news=$(curl -s https://archlinux.org/news/ | grep -m1 -oP '(?<=<a href="/news/)[^"]+')
latest_id=$(echo "$latest_news" | grep -oP '^[^/]+')
latest_title=$(echo "$latest_news" | cut -d'/' -f2 | tr '-' ' ')

if [[ -z "$latest_id" ]]; then
    echo "Could not fetch latest Arch Linux news."
    exit 1
fi

last_id=$(cat "$NEWS_FILE" 2>/dev/null || echo 0)

if [[ "$latest_id" != "$last_id" ]]; then
    echo "New Arch Linux news detected!"
    echo "Title: $latest_title"
    echo "Link: https://archlinux.org/news/$latest_news"
    echo
    read -p "Have you read it? (y/N): " yn
    if [[ "$yn" =~ ^[Yy]$ ]]; then
        echo "$latest_id" > "$NEWS_FILE"
        echo "Marked as read."
    else
        echo "Please read the news before continuing."
    fi
else
    echo "No new Arch Linux news."
fi
