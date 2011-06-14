class PcngoController < ApplicationController
  
  def index
    Pcfocus.refine
  end  
  
end
