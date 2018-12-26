## Tension

use_debug false

define :drum_kick do
  with_fx :wobble do
    sample :drum_heavy_kick, amp: rrand(1, 1.5), rate: rrand(0.3, 0.7)
  end
end

live_loop :lights do
  use_synth :hollow

  play (scale :g5, :minor_pentatonic).tick, amp: 1.5, attack: 0.25, release: 3.75
  sleep 4
end

live_loop :smash, auto_cue: false do

  4.times do
    drum_kick
    sleep 2
  end

  8.times do
    drum_kick
    sleep 0.5
  end
end

live_loop :chatter, auto_cue: false do
  with_fx :gverb do
    sample :drum_cymbal_open, rate: rrand(0.5, 2), amp: 0.04, release: 4
  end
  sleep 0.5
end

live_loop :flashing do
  sleep 8
  with_fx :reverb do
    sample :loop_compus, rate: 0.8, amp: rrand(1, 1.5), attack: 0, sustain: 4, release: 0
  end
end
