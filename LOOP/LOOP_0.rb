load 'C:\Users\KARA\Desktop\K-ON\libs.rb'
loop do
  play( 
    60+ctpk(-10,10).wr(2).sample,
    # 60,
    attack: (1...3).wr(0.3,1).sample,
    # sustain: ,
    # decay: ,
    release: (1...3).wr(0.3,1).sample,
    pan: ctbg(-1,1,0).wr(0.05).sample,
    end: :>)
sleep ctbk(0,0.2).wr(0.05,2).rm(0).sample
end


