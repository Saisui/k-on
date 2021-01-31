# use_synth(
#   # :prophet
# # :fm
# :saw
# )
# loop do
#   play 60, attack:3, release:1
#   sleep 1
# end

# live_loop :melody do
#   play_pattern_timed [:c4,   :e4,  :f4, :g4,  :f4,  :e4,  :f4,  :g4,  :f4, :e4, :f4],
#                      [0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25]
# end

# live_loop :melody do
#   use_synth :blade
#   r = [0.25, 0.25, 0.5, 1].choose
#   play (chord :c, :minor).choose, attack: 0, release: r
#   sleep r
# end
# live_loop :keys do
#   use_synth :blade
#   play chord(:c, :minor)
#   sleep 1
# end
# live_loop :bass do
#   use_synth :fm
#   n = (chord :c2, :minor).tick
#   3.times do
#     play n
#     sleep 1
#   end
#   play n
#   sleep 0.5
#   play (chord :c2, :minor).tick
#   sleep 0.5
# end

#和弦循环
chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring
c = chords[0] #取环中的第一个和弦并保存到变量中
#这将被用在所有live_loop里面。还会被: bass loop勾选

live_loop :melody do
  use_synth :blade
  r = [0.25, 0.25, 0.5, 1].choose
  play c.choose, attack: 0, release: r
  sleep r
end
live_loop :keys do
  use_synth :blade
  play c
  sleep 1
end
live_loop :bass do
  use_synth :fm
  use_octave -2
  3.times do
    play c[0] #演奏和弦的第一个音符
    sleep 1
  end
  play c[2] #演奏和弦的第三个音符
  sleep 0.5
  play c[1] #演奏和弦的第二个音符
  sleep 0.5
  c = chords.tick
end