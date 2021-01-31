looptunk "1000111011" do |cur,buf,bfer|
  if cur=="1"
    print cur
  else
    print "\nAh-Oh\n"
  end
  sleep (1..3).to_a.sample/1.5
  break if bfer.size>30
end