class PostImporter

  def self.update_or_create_file(post)
    file_text = "Title: #{post.title}"
    file_text += "\nDate: #{post.publish_time}"
    file_text += "\nLink: #{post.link}" if post.link.present?
    file_text += "\nImg: #{post.header_img}" if post.header_img.present?
    file_text += "\n \n#{post.body}" if post.body.present?

    File.open(post.file_name, 'w+') do |file|
      file.write(file_text)
    end
  end

  def self.update_or_create_post(file)
    
    body = ''

    # Iterate over each file
    File.open(file, 'r').each_line do |line|

      # If there's already a post, use that; if not, create one
      post = Post.find_by_file_name(file) || Post.create(file_name:file)

      # If the line has a ':', check for meta-data
      if line.match(/.*:.*/)
        
        key, value = line.split(":", 2)
        key = key.strip.downcase
        value = value.to_s.strip

        if key == 'title'
          post.title = value
        elsif key == 'date'
          post.publish_time = value
        elsif key == 'link'
          post.link = value
        elsif key == 'img'
          post.header_img = value
        elsif key == 'published'
          if value.strip.downcase == 'false'
            post.published = false
          else
            post.published = true
          end
        elsif key == 'tags'
          # placeholder
        else
          body += line
        end

      elsif line.match(/^[-][-]/)
        # I don't want these lines, so do nothing
      else
        # If the line has gotten this far, add it to the body
        body += line
      end

      post.body = body.strip
      post.save
    end
  end

  def self.import_posts(path)

    Dir.chdir(path)

    # Use Sync Records to check deletion of posts on server or deletion of post files
    # Note that the order these are checked in is important
    if SyncRecord.last.present? # skip if this is the first sync
      
      # Check for deleted posts; if so, then delete file
      posts_deleted = SyncRecord.last.posts_present - Post.pluck(:file_name)
      if posts_deleted.present?
        posts_deleted.each do |deleted_post_filename|
          File.delete(deleted_post_filename) if File.exists?(deleted_post_filename)
        end
      end

      # Check for created posts; if so, then create the file
      posts_added = Post.pluck(:file_name) - SyncRecord.last.posts_present
      if posts_added.present?
        posts_added.each do |added_post_filename|

          post = Post.find_by_file_name(added_post_filename)
          update_or_create_file(post)

        end
      end

      # Check for deleted files; if so, then delete posts
      # Note here that I'm checking local vs. server and resolving in favor of local
      # this is in case there are any odd states in the sync records
      files_deleted = Post.pluck(:file_name) - Dir.glob('*.{markdown,md}')
      if files_deleted.present?
        files_deleted.each do |deleted_filename|
          Post.find_by_file_name(deleted_filename).delete
        end
      end

    end

    # Now let's sync the content of the local files
    # Grab all markdown files
    Dir.glob('*.{markdown,md}').each do |file|

      if SyncRecord.last.present? # skip if this is the first sync

        post = Post.find_by_file_name(file)

        # check if the file or post was updated since the last sync
        if File.mtime(file) > SyncRecord.last.updated_at || post.updated_at > SyncRecord.last.updated_at
          
          # if the file was updated more recently, overwrite the post
          if File.mtime(file) > post.updated_at
            update_or_create_post(file)

          # if the post was updated more recently, overwrite the file
          elsif post.updated_at > File.mtime(file)
            update_or_create_file(post)
          end

        end
      else
        # If this is the first sync, no need to worry about updating the file content
        update_or_create_post(file)
      end
    end

    # Save the current state as a new Sync Record
    record = SyncRecord.new
    record.files_present = Dir.glob('*.{markdown,md}')
    record.posts_present = Post.pluck(:file_name)
    record.save

  end

end