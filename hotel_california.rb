use_bpm 60

opening_ring = (ring chord(:a, :minor),
                chord(:e, :major7),
                chord(:g, :major),
                chord(:d, :major),
                chord(:f, :major),
                chord(:c, :major),
                chord(:d, :minor),
                chord(:e, :minor))

chorus_ring = (ring chord(:f, :major),
               chord(:c, :major),
               chord(:e, :major7),
               chord(:a, :minor),
               chord(:f, :major),
               chord(:c, :major),
               chord(:d, :minor),
               chord(:e, :major))

live_loop :opening do
  play opening_ring.tick, attack: 1, sustain: 1, release: 1.50
  sleep 3
end

live_loop :opening_deep do
  play opening_ring.tick.tick, attack: 0.5, release: 1
  sleep 1
end

live_loop :ambience do
  use_synth :hollow
  with_fx :gverb do
    with_fx :flanger do
      play chorus_ring.tick, amp: 0.15, attack: 1, sustain: 3, release: 0
      sleep 3
    end
  end
end

live_loop :disturbance do
  if one_in(3)
    with_fx :octaver do
      sample :glitch_bass_g, amp: 2.25, rate: rrand(-0.1, -0.4), release: 6
    end
  end
  sleep 6
end

live_loop :shout do
  if one_in(5)
    sample :ambi_choir, amp: 1.25, rate: rrand(0.2, 0.5), release: 2
  end
  sleep 3
end
