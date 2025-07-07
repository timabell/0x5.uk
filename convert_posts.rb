#!/usr/bin/env ruby
require 'yaml'
require 'toml'
require 'date'
require 'time'

# Directory containing blog posts
blog_dir = 'content/blog'

# Process all markdown files in the directory
Dir.glob("#{blog_dir}/*.md").each do |file|
  puts "Processing #{file}..."

  # Read the file content
  content = File.read(file)

  # Skip files without frontmatter
  unless content.start_with?('---')
    puts "Skipping #{file} - no Jekyll front matter"
    next
  end

  # Extract the frontmatter and body
  if content =~ /\A---\r?\n(.*?)\r?\n---\r?\n(.*)/m
    yaml_front_matter = $1
    body = $2

    begin
      # Parse YAML frontmatter - treat dates as objects
      data = YAML.safe_load(yaml_front_matter, permitted_classes: [Date, Time]) || {}

      # Create TOML frontmatter
      toml_front_matter = "+++\n"

      # Handle title specially
      if data['title']
        escaped_title = data['title'].to_s.gsub('"', '\\"')
        toml_front_matter += "title = \"#{escaped_title}\"\n"
        data.delete('title')
      end

      if data['date']
        date_val = data['date']
        if date_val.is_a?(Time) || date_val.is_a?(Date)
          # Format the date in ISO 8601 format
          toml_front_matter += "date = \"#{date_val.strftime('%Y-%m-%dT%H:%M:%S%:z')}\"\n"
        elsif date_val.to_s.include?('T')
          # Already in ISO format string
          toml_front_matter += "date = \"#{date_val}\"\n"
        else
          # Simple date string
          toml_front_matter += "date = #{date_val}\n"
        end
        data.delete('date')
      end

      # Handle taxonomies
      taxonomies = {}

      if data['tags']
        tags = data['tags']
        tags = [tags] if tags.is_a?(String)
        taxonomies['tags'] = tags if tags && !tags.empty?
        data.delete('tags')
      end

      if data['categories']
        categories = data['categories']
        categories = [categories] if categories.is_a?(String)
        taxonomies['categories'] = categories if categories && !categories.empty?
        data.delete('categories')
      end

      # Delete other fields we don't need
      data.delete('layout')
      data.delete('author')
      data.delete('meta')

      # All fields already deleted during processing

      # Add remaining fields to [extra] section
      if !data.empty?
        toml_front_matter += "[extra]\n"
        data.each do |key, value|
          if value.is_a?(String)
            escaped_value = value.gsub('"', '\\"')
            toml_front_matter += "#{key} = \"#{escaped_value}\"\n"
          elsif value.is_a?(Numeric) || [true, false].include?(value)
            toml_front_matter += "#{key} = #{value}\n"
          elsif value.is_a?(Array)
            items = value.map do |item|
              if item.is_a?(String)
                escaped_item = item.gsub('"', '\\"')
                "\"#{escaped_item}\""
              else
                item.to_s
              end
            end
            toml_front_matter += "#{key} = [#{items.join(', ')}]\n"
          elsif value.is_a?(Hash)
            # Convert hash to a simpler form for TOML
            if key == "author" && value["display_name"]
              # Special case for author hashes, just use the display name
              toml_front_matter += "#{key} = \"#{value["display_name"]}\"\n"
            else
              # For other hashes, convert to a simplified string
              simple_str = value.inspect.gsub('"', '\\"')
              toml_front_matter += "#{key} = \"#{simple_str}\"\n"
            end
          else
            # For any other types, convert to string safely
            safe_value = value.to_s.gsub('"', '\\"')
            toml_front_matter += "#{key} = \"#{safe_value}\"\n"
          end
        end
      end

      # Add taxonomies section
      if !taxonomies.empty?
        toml_front_matter += "[taxonomies]\n"
        taxonomies.each do |key, values|
          items = values.map do |v|
            escaped_v = v.to_s.gsub('"', '\\"')
            "\"#{escaped_v}\""
          end
          toml_front_matter += "#{key} = [#{items.join(', ')}]\n"
        end
      end

      toml_front_matter += "+++\n"

      # Write the new file with TOML frontmatter
      File.write(file, toml_front_matter + body)
      puts "Converted #{file}"

    rescue => e
      puts "Error processing #{file}: #{e.message}"
    end
  else
    puts "Skipping #{file} - malformed front matter"
  end
end

puts "Conversion complete!"
