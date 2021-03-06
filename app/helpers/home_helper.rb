module HomeHelper
	
		def clean_tag tag
			["ga:pageTitle=", "Mashup", "Canção Nova", "cobertura online dos eventos da", "—", "Online", "multimídia para a cobertura online dos eventos"].each do |text|
				tag = tag.gsub(text,nil.to_s)	
			end	
			tag = tag.gsub("++","+")
			tag.strip!
			tag = "" if tag.size < 3 unless tag.empty?
			tag 
		end
		
		def image_tag_thumbnail img 			
			unless microblog? img[7] or photo? img[7]
				unless img[6].nil? 
					if video? img[7]
						image_tag( img[6], :class => "avatar", :width => "120", :height => "90" )
					else
						image_tag( img[6], :class => "avatar", :width => "48", :height => "48" )
					end
				else
					image_tag("http://www.artviper.net/screenshots/screener.php?w=70&amp;userID=17709aa3c85c360&amp;hash=5015222eafdaeddd4e2805645a99abb5&amp;url="+img[5], :width=>"70", :height=>"52", :class => "screenshot")
				end
			else
				""
			end
		end

		def photo_scraping html
			/<img src=(.*?)\/>/.match(html)
			"<img src="+$1+"/>"
		end
end

