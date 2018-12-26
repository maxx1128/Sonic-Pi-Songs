define :techno do |beep_rate, beep_max|
  use_synth :tb303
  play 70, release: 0.1, amp: rrand(0.75,1), cutoff: rrand(30, 90)
  if one_in(beep_rate)
    with_fx :reverb do
      sample :sn_dub, amp: rrand(0.1,beep_max), rate: (rrand -0.125, 2.5)
    end
  end
  sleep 0.125
end

live_loop :techno_loop do
  techno 3, 5
end
