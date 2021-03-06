#!/usr/bin/env bash

# This script is designed to create a markdown file that
# generates a formatted Jekyll header. It prompts the user
# for a phrase and that phrase is utilized in the name of
# the markdown file that is created.

# To run, copy this file to your desired directory.
# Change to the directory where you just copied this file.
# In a terminal prompt, type:. jekyll_header.sh

# Set variables
post_date=$(date '+%Y-%m-%d')
md_line="---"
layout="layout: post"
title="title: "
date_line="date: "
comments="comments: true"
tags="tags: "
categories="categories: "

# Ask user for input
echo "Enter post title (use no punctuation):"
read post_title

echo "Enter tags (space separated)"
read -a tag_array

echo "Enter categories (space separated)"
read -a categories_array

# remove spaces from post-title and replace with hyphens
formatted_title=$(echo -ne "${post_title}" | tr [:space:] '-')

# save new filename using post_date and formatted_phrase variables.
new_md_file="$(echo -n "${post_date}"-"${formatted_title}")".md


# prints formatted jekyll header utilizing post_date and user-entered post title and tags/categories.
# Tags and categories are formatted as Jekyll array - needed for Basically Basic theme.
# writes contents to new_md_file
printf "%s\n" "${md_line}" "${layout}" "${title}${post_title}" "${date_line}'${post_date}'" "${tags}" >> "${new_md_file}"
printf "  - %s\n" "${tag_array[@]}" >> "${new_md_file}"
printf "%s\n" "${categories}" >> "${new_md_file}"
printf "  - %s\n" "${categories_array[@]}" >> "${new_md_file}"
printf "%s\n" "${md_line}" >> "${new_md_file}"
