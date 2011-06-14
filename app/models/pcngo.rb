class Pcngo < ActiveRecord::Base
  
  require 'nokogiri'
  require 'open-uri'
  
  def self.crawlpage
    k = 1
    islegit = "yes"
    while islegit == "yes" and k < 378
      paginatedurl = "http://ngo.india.gov.in/ngo_search1_ngo.php?page=#{k}&uniqueid=&ngo_name=&sector_key=0&t_state=WB&t_dist_new3=0&search=search"
      doc2 = Nokogiri::HTML(open(paginatedurl))
      if doc2.css("title").text == "NGO Partnership System " and doc2 != nil
        baseurl = "http://ngo.india.gov.in/view_ngo_details.php?ngo_id="
        doc2.css("#frm_griev .bluelink11px").each do |item|
          url = baseurl + item[:href].partition("('")[2].gsub("')", "").gsub(",'0","").gsub("'","")
          Pcngo.extract(url) 
        end  
      else
        islegit = "no"
      end
      k = k + 1
    end  
  end  
  
  def self.extract(url)
    doc = Nokogiri::HTML(open(url))
    uniqueid = doc.css("#frm_admlog tr:nth-child(2) td:nth-child(4)").text
    pold = Pcngo.find_by_ngo_uid(uniqueid)
    if pold == nil
      pcitem = Pcngo.new
    else
      pcitem = pold
    end    
      pcitem.sourceurl = url
      pcitem.ngo_name = doc.at_css("#frm_admlog td tr:nth-child(1) strong").text.split(":")[1].strip
      if !pcitem.ngo_name.empty?
        i = 2
        while i < 35    
          tagname = ""
          val = ""
            tagname = doc.at_css("#frm_admlog tr:nth-child(#{i}) td:nth-child(2)")
            if tagname != nil
              tagname = tagname.text.strip
            else
              tagname = ""  
            end  
            val = doc.at_css("#frm_admlog tr:nth-child(#{i}) td:nth-child(4)")
            if val == nil or val == " " or val == ""
              val = ""  
            end
            if val != "" and !tagname.empty?
              if tagname == "Chairman" 
                pcitem.ngo_chair = val.text.strip
              elsif tagname == "Address"
                if val != nil        
                  j = 0
                  sstr = ""
                  while j < val.text.split.count
                    sstr = sstr + val.text.split[j] + " "
                    j = j + 1
                  end  
                  pcitem.contact_address = sstr
                end 
              elsif tagname == "Copy of Registration Certificate"  
                valcerticate = doc.at_css("tr:nth-child(#{i}) a")
                if valcerticate!=nil        
                  pcitem.reg_doc_link = valcerticate[:href].partition("('")[2].gsub("')", "")
                end
              elsif tagname == "Chief Functionary"
                pcitem.ngo_chieffunk = val.text.strip
              elsif tagname == "Unique Id of VO/NGO"  
                pcitem.ngo_uid = val.text.strip
              elsif tagname == "Secretary"
                  pcitem.ngo_sec = val.text.strip
              elsif tagname ==  "Treasurer"
                  pcitem.ngo_trea = val.text.strip
              elsif tagname ==  "Umbrella/Parent Organization"
                  pcitem.ngo_parent = val.text.strip
              elsif tagname ==  "Promoter Name 1"
                  pcitem.ngo_promo1 = val.text.strip
              elsif tagname ==  "Promoter Name 2"
                  pcitem.ngo_promo2 = val.text.strip
              elsif tagname ==  "Registred With"
                  pcitem.reg_with = val.text.strip
              elsif tagname ==  "Type of NGO"
                  pcitem.reg_type = val.text.strip
              elsif tagname ==  "Registration No"
                  pcitem.reg_no = val.text.strip
              elsif tagname ==  "Date of Registration"
                  pcitem.reg_date = val.text.strip
              elsif tagname ==  "City of Registration"    
                  pcitem.reg_city = val.text.strip                  
              elsif tagname == "FCRA Registration no."
                  pcitem.reg_fcra = val.text.strip
              elsif tagname ==  "Key Issues"
                  pcitem.focus_issues = val.text.strip
              elsif tagname ==  "Operational Area-States"
                  pcitem.focus_states = val.text.strip
              elsif tagname == "Operational Area-District"   
                  pcitem.focus_district = val.text.strip   
              elsif tagname ==  "City"             
                  pcitem.contact_city = val.text.strip
              elsif tagname ==  "State"
                  pcitem.contact_state = val.text.strip
              elsif tagname ==  "Telephone"
                  pcitem.contact_tel = val.text.strip
              elsif tagname ==  "Mobile No"
                  pcitem.contact_mobile = val.text.strip
              elsif tagname ==  "E-mail"
                  pcitem.contact_email = val.text.strip
              elsif tagname == "Fax"
                  pcitem.contact_fax = val.text.strip
              elsif tagname ==  "Website Url"    
                  pcitem.contact_website = val.text.strip  
              end  
            end    
          i = i + 1  
        end  
      end
      pcitem.save
  end
end