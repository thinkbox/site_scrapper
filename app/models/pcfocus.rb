class Pcfocus < ActiveRecord::Base
  
  def self.refine
    allpcs = Pcngo.all
    allpcs.each do |pc|
      if pc.focus_issues != nil
        pc.focus_issues.split(',').each do |issu|
          savefocus(pc.id, "I", issu.strip)
        end
      end 
      if pc.focus_states != nil
        pc.focus_states.split(',').each do |issu|
          savefocus(pc.id, "S", issu.strip)
        end
      end
      if pc.focus_district != nil
        pc.focus_district.split(',').each do |issu|
          savefocus(pc.id, "D", issu.strip)
        end
      end      
    end
  end
  
  def self.savefocus(idstr, typestr, valstr)
    pf = Pcfocus.new
    pf.pcngo_id = idstr 
    pf.typestr = typestr 
    pf.val = valstr 
    pf.save
  end
    
end
