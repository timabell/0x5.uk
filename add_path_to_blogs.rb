#!/usr/bin/env ruby

# Script to add path= to blog post frontmatter if missing
# The path will be constructed from the filename (YYYY-MM-DD-title-slug.md)

blog_dir = File.join(Dir.pwd, "content", "blog")
modified_count = 0

Dir.glob(File.join(blog_dir, "*.md")).each do |file|
	content = File.read(file)

	# Extract date and slug from filename
	if file =~ /(\d{4})-(\d{2})-(\d{2})-(.*?)\.md$/
		year, month, day, slug = $1, $2, $3, $4
		path = "/#{year}/#{month}/#{day}/#{slug}/"

		# Modify the frontmatter
		frontmatter = content.match(/\A\+\+\+\n(.*?)\n\+\+\+/m)[1]

        updated_frontmatter = "path = \"#{path}\"\n" + frontmatter

		updated_content = content.sub(/\A\+\+\+\n.*?\n\+\+\+/m, "+++\n#{updated_frontmatter}\n+++")

		# Write updated content
		File.write(file, updated_content)
		modified_count += 1
		puts "Added path=\"#{path}\" to #{File.basename(file)}"
	else
		puts "Filename doesn't match expected format: #{File.basename(file)}"
	end
end

puts "Modified #{modified_count} files"
