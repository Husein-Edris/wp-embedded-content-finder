-- distinct post types 
SELECT DISTINCT post_type
FROM wp_posts
ORDER BY post_type;

-- Final 
SELECT ID, post_title, post_name, guid
FROM wp_posts
WHERE (post_content LIKE '%youtube%'
   OR post_content LIKE '%instagram%'
   OR post_content LIKE '%instagram.com%'
   OR post_content LIKE '%youtube.com/watch%'
   OR post_content LIKE '%Video abspielen%'
   OR post_content LIKE '%class="content-video"%')
-- Search in custom post types
AND post_type IN ('post', 'page', 'stories', 'success_stories', 'jobs', 'advantages')
AND post_status = 'publish'
AND post_type NOT IN ('acf-field', 'revision');

-- Search in elementor
SELECT ID, post_title, post_name, guid
FROM wp_posts
WHERE (post_content LIKE '%[elementor_template%'
   OR post_content LIKE '%[elementor_image%'
   OR post_content LIKE '%[elementor_video%'
   OR post_content LIKE '%youtube%'
   OR post_content LIKE '%instagram%'
   OR post_content LIKE '%youtube.com/watch%'
   OR post_content LIKE '%Video abspielen%'
   OR post_content LIKE '%class="content-video"%')
AND post_type IN ('post', 'page', 'stories', 'success_stories', 'jobs', 'advantages')
AND post_status = 'publish'
AND post_type NOT IN ('acf-field', 'revision');

-- Add Type Column
SELECT post_title, post_name, guid, 
   CASE 
      WHEN post_content LIKE '%youtube.com/watch%' THEN 'YouTube'
      WHEN post_content LIKE '%instagram-feed%' THEN^ 'Instagram'
      WHEN post_content LIKE '%vimeo.com%' THEN 'Vimeo'
      WHEN post_content LIKE '%e.issuu.com/embed.html%' THEN 'Issuu'
      ELSE 'Unknown'
   END AS content_source
FROM wp_posts
WHERE (post_content LIKE '%youtube.com/watch%'
   OR post_content LIKE '%instagram-feed%'
   OR post_content LIKE '%vimeo.com%'
   OR post_content LIKE '%e.issuu.com/embed.html%')
AND post_status = 'publish'
AND post_type NOT IN ('acf-field', 'revision')  

