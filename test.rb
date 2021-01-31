class Array
  def has?(n)   
    res = false
     if args.empty? then res = false else self.each{ |e| args.each{ |r| (res = true) if (e == r) } } 
      res 
    end
end