# sample :drum_heavy_kick
# :drum_snare_hard
# use_bpm 100
# :drum_cymbal_closed
# :drum_cymbal_pedal
# :drum_snare_hard
# use_bpm 100
# live_loop :drums do
#   sample :drum_heavy_kick
#   sleep 1
#   sample :drum_snare_hard
#   sleep 1
#   sample :drum_heavy_kick
#   sleep 1
#   sample :drum_snare_hard
#   sleep 1
# end

# live_loop :hihat do
#   sample :drum_cymbal_closed
#   sleep 0.25
# end

m = :minor
M = :major
# play (chord :C4, :major).choose, release: 0.125, cutoff: 55,rate:-1
# sample :drum_heavy_kick,rate:-1

# live_loop :effects do
#   with_fx :wobble do
#     with_fx :slicer do
#       with_fx :reverb do
#         play 50
#         sleep 0.5
#         sample :elec_plip
#         sleep 0.5
#         play 62
#       end
#     end
#   end
# end

# live_loop :effects1 do
#   with_fx :reverb, mix: 0.5, room: 0.9 do
#     play 50
#     sleep 0.5
#     sample :elec_plip
#     sleep 0.5
#     play 62
#   end
# end

puts [1, 2, 3, 4].ring #=> (ring 1, 2, 3, 4)
puts (ring 1, 2, 3, 4) #=> (ring 2, 2, 3, 4)
live_loop :arp do
  play [:c, :e, :d, :f].ring.tick, release: 0.1
  sleep 0.125
end

live_loop :keys do
  use_synth :blade
  play [(chord :Ab, :major7), (chord :Db, :major7), (chord :Bb, :minor7), (chord :Eb, "7")].ring.tick, attack: 0.1, release: 1
  sleep 1
end
live_loop :lead do
  use_synth :dsaw
  play (scale :Ab, :major, num_octaves: 3).mirror.tick, attack: 0.05, release: 0.25, cutoff: rrand(80, 110), amp: 0.5
  sleep 0.25
end

live_loop :melody do
  use_synth :blade
  r = [0.25, 0.25, 0.5, 1].choose
  play (chord :c, :minor).choose, attack: 0, release: r
  sleep r
end