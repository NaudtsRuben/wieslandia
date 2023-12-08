path='~/Downloads/sso/Sonatina Symphonic Orchestra/Samples/'

voices=[['1st Violins piz','1st Violins','1st-violins-piz-rr1-',1,:g3,:b6],\
        ['1st Violins sus','1st Violins','1st-violins-sus-',1,:g3,:b6],\
        ['1st Violins stc','1st Violins','1st-violins-stc-rr1-',1,:g3,:b6],\
        ['2nd Violins piz','2nd Violins','2nd-violins-piz-rr1-',1,:g3,:b6],\
        ['2nd Violins sus','2nd Violins','2nd-violins-sus-',1,:g3,:b6],\
        ['2nd Violins stc','2nd Violins','2nd-violins-stc-rr1-',1,:g3,:b6],\
        ['Alto Flute','Alto Flute','alto_flute-',1,:g3,:g6],\
        ['Bass Clarinet','Bass Clarinet','bass_clarinet-',2,:d2,:d5],\
        ['Bass Trombone','Bass Trombone','bass_trombone-',1,:e1,:g4],\
        ['Basses piz','Basses','basses-piz-rr1-',0,:c1,:c4],\
        ['Basses sus','Basses','basses-sus-',0,:c1,:c4],\
        ['Basses stc','Basses','basses-stc-rr1-',0,:c1,:c4],\
        ['Bassoon','Bassoon','bassoon-',1,:as1,:d5],\
        ['Bassoons','Bassoons','bassoons-sus-',1,:as1,:d5],\
        ['Celli piz','Celli','celli-piz-rr1-',0,:a2,:bb5],\
        ['Celli sus','Celli','celli-sus-',0,:a2,:bb5],\
        ['Celli stc','Celli','celli-stc-rr1-',0,:a2,:bb5],\
        ['Cello','Cello','cello-',0,:a2,:bb5],\
        ['Chorus female','Chorus','chorus-female-',3,:as4,:gs5],\
        ['Chorus male','Chorus','chorus-male-',3,:as2,:gs3],\
        ['Clarinet','Clarinet','clarinet-',2,:d3,:d6],\
        ['Clarinets','Clarinets','clarinets-sus-',2,:d3,:d6],\
        ['Contrabassoon','Contrabassoon','contrabassoon-',1,:as0,:as3],\
        ['Cor Anglais','Cor Anglais','cor_anglais-',2,:f3,:f5],\
        ['Flute','Flute','flute-',0,:b3,:a4],\
        ['Flutes sus','Flutes','flutes-sus-',0,:c3,:bb5],\
        ['Flutes stc','Flutes','flutes-stc-rr1-',0,:c3,:bb5],\
        ['Grand Piano p','Grand Piano','piano-p-',0,:b0,:cs8],\
        ['Grand Piano f','Grand Piano','piano-f-',0,:b0,:cs8],\
        ['Harp','Harp','harp-',0,:c2,:c7],\
        ['Horn','Horn','horn-',1,:e2,:e5],\
        ['Horns stc','Horns','horns-stc-rr1-',1,:e2,:e5],\
        ['Horns sus','Horns','horns-sus-',1,:e2,:e5],\
        ['Oboe','Oboe','oboe-',1,:as3,:c6],\
        ['Oboes','Oboes','oboes-sus-',1,:as3,:c6],\
        ['Xylophone','Percussion','xylophone-',1,:a2,:b5],\
        ['Piccolo','Piccolo','piccolo-',0,:b3,:g6],\
        ['Tenor Trombone','Tenor Trombone','tenor_trombone-',1,:ds2,:b4],\
        ['Trombones sus','Trombones','trombones-sus-',1,:ds2,:b4],\
        ['Trombones stc','Trombones','trombones-stc-rr1-',1,:ds2,:b4],\
        ['Trumpet','Trumpet','trumpet-',1,:e3,:f6],\
        ['Trumpets sus','Trumpets','trumpets-sus-',1,:e3,:f6],\
        ['Trumpets stc','Trumpets','trumpets-stc-rr1-',1,:e3,:f6],\
        ['Tuba sus','Tuba','tuba-sus-',1,:e1,:d4],\
        ['Tuba stc','Tuba','tuba-stc-rr1-',1,:e1,:d4],\
        ['Violas piz','Violas','violas-piz-rr1-',0,:c3,:c6],\
        ['Violas sus','Violas','violas-sus-',0,:c3,:c6],\
        ['Violin','Violin','violin-',1,:g3,:d7],\
        ['Timpani roll','Percussion','timpani-roll-',0,:c1,:c2],\
        ['Timpani roll cresc','Percussion','timpani-roll-crsc-',0,:c1,:c2],\
        ['Glockenspiel','Percussion','glockenspiel-',0,:c3,:c6],\
        ['Timpani f lh','Percussion','timpani-f-lh-',0,:c1,:c2],\
        ['Timpani f rh','Percussion','timpani-f-rh-',0,:c1,:c2],\
        ['Timpani p lh','Percussion','timpani-p-lh-',0,:c1,:c2],\
        ['Timpani p rh','Percussion','timpani-p-rh-',0,:c1,:c2]]



#setup global variables
sampledir=''
sampleprefix=''
offsetclass=''
low=''
high=''
paths=''

#setup data for current inst
define :setup do |inst,path|
  sampledir=voices.assoc(inst)[1]
  sampleprefix=voices.assoc(inst)[2]
  offsetclass=voices.assoc(inst)[3]
  low=voices.assoc(inst)[4]
  high=voices.assoc(inst)[5]
  #amend path for instrument sampledir
  paths=path+sampledir+'/'
end

#define routine to play sample
define :pl do |np,d,inst,tp=0,pan=0|
  
  setup(inst,path)
  #check if note in range of supplied samples
  #use lowest/highest sample for out of range
  change=0 #used to give rpitch for coverage outside range
  frac=0
  n=np+tp #note allowing for transposition
  if n.is_a?(Numeric) #allow frac tp or np
    frac=n-n.to_i
    n=n.to_i
  end
  if note(np)+tp<note(low) #calc adjustment for low note
    change=note(np).to_i+tp-note(low)
    n=note(low)
  end
  if note(np).to_i+tp > note(high) #calc adjustment for high note
    change = note(np).to_i+tp-note(high)
    n=note(high)
  end
  if change < -3 or change > 5 #set allowable out of range
    #if outside print messsage
    puts 'inst: '+inst+' note '+np.to_s+' with transpostion '+tp.to_s+' out of sample range'
  else #otherwise calc and play it
    #calculate base note and octave
    base=note(n)%12
    oc = note(n) #do in 2 stages because of alignment bug
    oc=oc/12 -1
    #find first part of sample note
    slookup=['c','c#','d','d#','e','f','f#','g','g#','a','a#','b']
    #lookup sample to use,and rpitch offset, according to offsetclass
    case offsetclass
    when 0
      oc += 1 if base == 11 #adjust if sample needs next octave
      snumber=[0,0,3,3,3,6,6,6,9,9,9,0]
      offset=[ 0,1,-1,0,1,-1,0,1,-1,0,1,-1]
    when 1
      snumber=[1,1,1,4,4,4,7,7,7,10,10,10]
      offset=[-1,0,1,-1,0,1,-1,0,1,-1,0,1]
    when 2
      oc -= 1 if base == 0 #adjust if sample needs previous octave
      snumber=[11,2,2,2,5,5,5,8,8,8,11,11]
      offset=[1,-1,0,1,-1,0,1,-1,0,1,-1,0]
    when 3
      snumber=[0,1,2,3,4,5,6,7,8,9,10,11] #this class has sample for every note
      offset=[0,0,0,0,0,0,0,0,0,0,0,0]
    end
    #generate sample name
    sname=sampleprefix+(slookup[snumber[base]]).to_s+oc.to_s
    #play sample with appropriate rpitch value
    sample paths,sname,rpitch: offset[base]+change+frac,sustain: 0.9*d,release: d,pan: pan
  end
end

define :plarray do |notes,durations,offsetclass,tp=0,pan=0|
  puts offsetclass
  notes.zip(durations).each do |n,d|
    pl(n,d,offsetclass,tp,pan) if ![nil,:r,:rest].include? n#allow for rests
    sleep d
  end
end



# ------------------------------ lied -----------------------------------



use_bpm 100
use_synth_defaults release: 0.5, amp: 0.7, cutoff: 90
use_synth :piano

4.times do
  play_pattern_timed [:r, :f3], 0.5
end

4.times do
  play_pattern_timed [:f2, :f3], 0.5
end

in_thread do
  2.times do
    
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
      play_chord [:b1,:bb2]
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
    
    play_chord [:b1,:bb2]
    sleep 1
    play_chord [:b1,:bb2]
    sleep 2
    play_chord [:b1,:bb2]
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
    
    play_chord [:b1, :bb2]
    sleep 2
    play_chord [:b1, :bb2]
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
end

in_thread do
  2.times do
    
    # STROFE:
    
    piano_notes_high = [:g, :f, :c, :d, :c,
                        [:d, :f], [:d, :f], [:e, :g], [:e, :g], [:f, :a], :r, :c,
                        :a, :g, :f, :c, :d, :c, :c]
    piano_tempo_high = [0.5, 0.5, 0.5, 1, 1,
                        0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5,
                        0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5]
    
    play_pattern_timed [:c, :f, :a] , [0.05, 0.05, 0.4], sustain: 0.5
    
    play_pattern_timed piano_notes_high, piano_tempo_high
    
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
    
    play_chord [:f, :bb]
    sleep 0.5
    play_chord [:f, :bb]
    sleep 0.5
    play_chord [:f, :bb]
    sleep 0.25
    play_chord [:f, :bb]
    sleep 0.25
    play_chord [:f, :bb]
    sleep 1
    play_chord [:f, :bb]
    sleep 0.5
    play_chord [:f, :bb]
    sleep 0.5
    play_chord [:f, :bb]
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
    play_pattern_timed [:c, :d, :e, :f, :g, :a, :bb], 0.5
    
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
    
    play_chord [:f, :bb]
    sleep 0.5
    play_chord [:bb, :d5]
    sleep 0.5
    play_chord [:bb, :d5]
    sleep 0.5
    play_chord [:bb, :d5]
    sleep 0.5
    play_chord [:bb, :d5]
    sleep 0.25
    play_chord [:bb, :d5]
    sleep 0.25
    play_chord [:bb, :d5]
    sleep 1
    play_chord [:bb, :d5]
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
    play_pattern_timed [:c, :d, :e, :f, :g, :a, :bb], 0.5
    
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
end



# strofe
strofe_viool_noten = [:a, :g, :f, :c, :d, :c, :f, :f, :g, :g, :a, :r, :c, :a, :g, :f, :c, :d, :c, :c, :g, :g, :a, :g, :f, :r, :c, :a, :g, :f, :c, :d, :c, :f, :f, :g, :g, :a, :r, :c, :a, :g, :f, :c, :d, :c, :c, :g, :g, :a, :g, :f, :r]
strofe_viool_tempo = [0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1]

#refrein:
refrein_viool_noten = [:r, :f, :f,
                       :bb, :bb, :bb, :bb, :bb, :bb, :bb, :bb,
                       :a, :a, :a, :g, :f, :r, :c5, :c5,
                       :c5, :c, :d, :e, :f, :g, :a, :bb,
                       :a, :a, :a, :g, :f, :f, :f,
                       :bb, :bb, :bb, :bb, :bb, :bb, :bb, :bb,
                       :a, :a, :a, :g, :f, :c5, :c5,
                       :c5, :c, :d, :e, :f, :g, :a, :bb,
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

#refrein2:
refrein2_viool_noten = [:r, :f, :f,
                        :bb, :bb, :bb, :bb, :bb, :bb, :bb, :bb,
                        :a, :a, :a, :g, :f, :r, :c5, :c5,
                        :c5, :c, :d, :e, :f, :g, :a, :bb,
                        :a, :a, :a, :g, :f, :f, :f,
                        :bb, :bb, :bb, :bb, :bb, :bb, :bb, :bb,
                        :a, :a, :a, :g, :f, :c5, :c5,
                        :c5, :c, :d, :e, :f, :g, :a, :bb,
                        :a, :f, :g, :e,
                        :f, :r, :r, :a, :bb,
                        :a, :f, :g, :e,
                        :f]
refrein2_viool_tempo = [1, 0.5, 0.5,
                        0.5, 0.5, 0.25, 0.25, 1, 0.5, 0.5, 0.5,
                        0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                        0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                        0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5,
                        0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 1, 0.5,
                        0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5,
                        0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                        1.5, 0.5, 1.5, 0.5,
                        1, 1, 1, 0.5, 0.5,
                        1.5, 0.5, 1.5, 0.5,
                        4]


in_thread do
  plarray(strofe_viool_noten,strofe_viool_tempo,'Horn')
  plarray(refrein_viool_noten,refrein_viool_tempo,'Horn')
  plarray(strofe_viool_noten,strofe_viool_tempo,'Horn')
  plarray(refrein2_viool_noten,refrein2_viool_tempo,'Horn')
end

in_thread do
  plarray(strofe_viool_noten,strofe_viool_tempo,'Harp')
  plarray(refrein_viool_noten,refrein_viool_tempo,'Harp')
  plarray(strofe_viool_noten,strofe_viool_tempo,'Harp')
  plarray(refrein2_viool_noten,refrein2_viool_tempo,'Harp')
end

in_thread do
  sleep 32
  plarray(refrein_viool_noten,refrein_viool_tempo,'Clarinet')
  sleep 32
  plarray(refrein2_viool_noten,refrein2_viool_tempo,'Clarinet')
end


in_thread do
  sleep 32
  plarray(refrein_viool_noten,refrein_viool_tempo,'1st Violins stc')
  sleep 32
  plarray(refrein2_viool_noten,refrein2_viool_tempo,'1st Violins stc')
end

in_thread do
  sleep 32
  plarray(refrein_viool_noten,refrein_viool_tempo,'Flutes stc')
  sleep 32
  plarray(refrein2_viool_noten,refrein2_viool_tempo,'Flutes stc')
end

in_thread do
  sleep 32
  plarray(refrein_viool_noten,refrein_viool_tempo,'Flutes sus')
  sleep 32
  plarray(refrein2_viool_noten,refrein2_viool_tempo,'Flutes sus')
end
