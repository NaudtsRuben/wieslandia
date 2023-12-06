use_bpm 100
use_synth_defaults release: 0.5, amp: 0.7, cutoff: 90
use_synth :piano

4.times do
  play_pattern_timed [:r, :f3], 0.5
end

4.times do
  play_pattern_timed [:f2, :f3], 0.5
end


live_loop :clublied_refrein_piano_low do
  
  #STROFE:
  
  2.times do
    
    2.times do
      play_pattern_timed [:f2, :f3, :r, :f3], 0.5
    end
    
    play_chord [:b1,:b2]
    sleep 1
    play_chord [:c2,:c3]
    sleep 1
    sleep 0.5
    play_chord [:f2,:f3]
    sleep 0.5
    play_chord [:f2,:f3]
    sleep 0.5
    sleep 0.5
    
    2.times do
      play_pattern_timed [:f2, :f3, :r, :f3], 0.5
    end
    
    
    play_chord [:c2,:c3]
    sleep 1
    play_chord [:b1,:b2]
    sleep 1
    sleep 0.5
    play_chord [:f2,:f3]
    sleep 0.5
    play_chord [:f2,:f3]
    sleep 0.5
    sleep 0.5
  end
  
  
  
  # REFREIN:
  
  play_chord [:f2, :f3]
  sleep 2
  
  play_chord [:b1,:b2]
  sleep 1
  play_chord [:b1,:b2]
  sleep 2
  play_chord [:b1,:b2]
  sleep 1
  
  play_chord [:f2,:f3]
  sleep 1
  play_chord [:f2,:f3]
  sleep 1
  play_chord [:f2,:f3]
  sleep 0.5
  play_chord [:f2,:f3]
  sleep 0.5
  sleep 1
  
  play_chord [:c2, :c3]
  sleep 2
  play_chord [:c2, :c3]
  sleep 2
  
  play_chord [:f2,:f3]
  sleep 1
  play_chord [:f2,:f3]
  sleep 1
  play_chord [:f2,:f3]
  sleep 0.5
  play_chord [:f2,:f3]
  sleep 0.5
  sleep 1
  
  play_chord [:b1, :b2]
  sleep 2
  play_chord [:b1, :b2]
  sleep 2
  
  play_chord [:f2,:f3]
  sleep 2
  play_chord [:f2,:f3]
  sleep 2
  
  play_chord [:c2, :c3]
  sleep 2
  play_chord [:c2, :c3]
  sleep 2
  
  sleep 0.5
  play_chord [:f2,:f3]
  sleep 0.5
  play_chord [:f2,:f3]
  sleep 0.5
  sleep 1
  play_chord [:c2, :c3]
  sleep 0.5
  play_chord [:c2, :c3]
  sleep 0.5
  sleep 0.5
  
  sleep 1
  play_chord [:f2, :c3, :f3]
  sleep 1
  play_chord [:f2, :c3, :f3]
  sleep 1
  sleep 1
  
end

live_loop :clublied_refrein_piano_high do
  
  # STROFE:
  
  play_chord [:c, :f, :a]
  sleep 0.5
  play_pattern_timed [:g, :f, :c], 0.5
  play_pattern_timed [:d, :c], 1
  
  play_chord [:d, :f]
  sleep 0.5
  play_chord [:d, :f]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:f, :a]
  sleep 1
  sleep 0.5
  play_pattern_timed [:c, :a, :g, :f, :c], 0.5
  play_pattern_timed [:d],1
  play_pattern_timed [:c, :c], 0.5
  
  
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:c, :f]
  sleep 1
  sleep 0.5
  play_pattern_timed [:c, :a, :g, :f, :c], 0.5
  play_pattern_timed [:d, :c], 1
  
  play_chord [:d, :f]
  sleep 0.5
  play_chord [:d, :f]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:f, :a]
  sleep 1
  sleep 0.5
  play_pattern_timed [:c, :a, :g, :f, :c], 0.5
  play_pattern_timed [:d],1
  play_pattern_timed [:c, :c], 0.5
  
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:c, :f]
  sleep 1
  sleep 1
  
  
  
  
  
  # REFREIN:
  
  sleep 1
  play_pattern_timed [:f, :f], 0.5
  
  play_chord [:f, :b]
  sleep 0.5
  play_chord [:f, :b]
  sleep 0.5
  play_chord [:f, :b]
  sleep 0.25
  play_chord [:f, :b]
  sleep 0.25
  play_chord [:f, :b]
  sleep 1
  play_chord [:f, :b]
  sleep 0.5
  play_chord [:f, :b]
  sleep 0.5
  play_chord [:f, :b]
  sleep 0.5
  
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:c, :f]
  sleep 0.5
  sleep 0.5
  play_chord [:e, :d5]
  sleep 0.5
  play_chord [:e, :d5]
  sleep 0.5
  
  play_chord [:e, :d5]
  sleep 0.5
  play_pattern_timed [:c, :d, :e, :f, :g, :a, :b], 0.5
  
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:e, :g]
  sleep 0.5
  play_chord [:c, :f]
  sleep 0.5
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  play_chord [:f, :a]
  sleep 0.5
  
  play_chord [:f, :b]
  sleep 0.5
  play_chord [:b, :d5]
  sleep 0.5
  play_chord [:b, :d5]
  sleep 0.5
  play_chord [:b, :d5]
  sleep 0.5
  play_chord [:b, :d5]
  sleep 0.25
  play_chord [:b, :d5]
  sleep 0.25
  play_chord [:b, :d5]
  sleep 1
  play_chord [:b, :d5]
  sleep 0.5
  
  play_chord [:a, :c5]
  sleep 0.5
  play_chord [:a, :c5]
  sleep 0.5
  play_chord [:a, :c5]
  sleep 0.5
  play_chord [:g, :b]
  sleep 0.5
  play_chord [:f, :a]
  sleep 1
  play_chord [:e, :c5]
  sleep 0.5
  play_chord [:e, :c5]
  sleep 0.5
  
  play_chord [:e, :c5]
  sleep 0.5
  play_pattern_timed [:c, :d, :e, :f, :g, :a, :b], 0.5
  
  play_chord [:f, :a]
  sleep 1.5
  play_chord [:c, :f]
  sleep 0.5
  play_chord [:b3, :g]
  sleep 1.5
  play_chord [:b3, :e]
  sleep 0.5
  
  play_chord [:c, :f]
  sleep 1
  play_chord [:c, :f]
  sleep 1
  play_chord [:c, :f]
  sleep 1
  sleep 1
end




live_loop :viool do
  use_synth :blade
  use_synth_defaults attack: 0.1, attack_level: 0.1, decay: 0.2, decay_level: 1, sustain: 0.5, sustain_level: 0.8, release: 1.5
  
  strofe_viool_noten = [:a, :g, :f, :c, :d, :c, :f, :f, :g, :g, :a, :r, :c, :a, :g, :f, :c, :d, :c, :c, :g, :g, :a, :g, :f, :r, :c, :a, :g, :f, :c, :d, :c, :f, :f, :g, :g, :a, :r, :c, :a, :g, :f, :c, :d, :c, :c, :g, :g, :a, :g, :f, :r]
  strofe_viool_tempo = [0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1]
  
  # strofe
  play_pattern_timed strofe_viool_noten, strofe_viool_tempo, amp: 0.4
  
  #refrein:
  
  refrein_viool_noten = [:r, :f, :f,
                         :b, :b, :b, :b, :b, :b, :b, :b,
                         :a, :a, :a, :g, :f, :r, :c5, :c5,
                         :c5, :c, :d, :e, :f, :g, :a, :b,
                         :a, :a, :a, :g, :f, :f, :f,
                         :b, :b, :b, :b, :b, :b, :b, :b,
                         :a, :a, :a, :g, :f, :c5, :c5,
                         :c5, :c, :d, :e, :f, :g, :a, :b,
                         :a, :f, :g, :e,
                         :f]
  refrein_viool_tempo = [1, 0.5, 0.5,
                         0.5, 0.5, 0.25, 0.25, 1, 0.5, 0.5, 0.5,
                         0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                         0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                         0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5,
                         0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 1, 0.5,
                         0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5,
                         0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                         1.5, 0.5, 1.5, 0.5,
                         4]
  
  play_pattern_timed refrein_viool_noten, refrein_viool_tempo, amp: 0.4
  
end