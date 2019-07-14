module Memorable 

  module InstanceMethods 

    def initialize(name = nil, url = nil)
      @name = name
      @url = url
      self.class.all << self 
    end 

  end 

end 