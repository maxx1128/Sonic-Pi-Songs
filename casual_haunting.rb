live_loop :background do

  use_synth :hollow
  play [:A1, :A2, :A3, :A4, :A5].choose, amp: rrand(1.5, 2), attack: 1, release: rrand(4, 6)

  sleep 1
end

live_loop :guitar do
  if one_in(2)
    with_fx :echo do
      sample :guit_e_slide, amp: 5, rate: rrand(0.5, 0.75), attack: 4, attack: 4
      sleep 4
    end
  end
  sleep 1
end
