#  https://soundcloud.com/satzz21/repitch

use_osc :localhost, 12000
interval0 = 0.3
cycle = 32.0

live_loop :loop1 do
  i = 0.0
  rate = 1.0
  
  kick_synth = :c1
  kick_synth_length = 0.2
  kick_synth_amp = 0.5
  pedal_synth = :c3
  pedal_synth_length = 0.35
  pedal_synth_amp = 0.2
  snare_synth = :e1
  snare_synth_length = 0.2
  snare_synth_amp = 0.5
  
  cycle.times do
    
    
    rate = 0.5**(i/cycle)
    interval = interval0 * rate
    norm = 2*rate-1
    
    osc "/interval", interval
    osc "/rate", rate
    
    # 1
    print "#", i, "interval", interval
    
    use_synth :dsaw
    osc "/kick_synth1", 1.0
    play kick_synth, release: kick_synth_length, amp: kick_synth_amp
    
    
    osc "/kick1", 1.0
    sample :bd_808, amp: 3 # , release: 1.0
    
    
    
    sleep interval
    osc "/kick1", 0.0
    
    # 2
    print "#", i, "interval", interval
    
    use_synth :dsaw
    osc "/pedal_synth2",  norm
    play pedal_synth, release: pedal_synth_length , amp: pedal_synth_amp * norm
    
    osc "/pedal2",  norm
    sample :drum_cymbal_pedal, amp: norm
    
    sleep interval
    osc "/pedal2",  0
    
    # 3
    print "#", i, "interval", interval
    
    use_synth :dsaw
    
    with_fx :reverb, amp: 1 do
      osc "/snare_synth3",  norm
      play snare_synth, release: snare_synth_length , amp: snare_synth_amp * norm
      
      osc "/snare3",  norm
      sample :drum_snare_soft, amp: norm
    end
    
    
    osc "/pedal_synth3",  (1-norm)
    play pedal_synth-(cycle-i), release: pedal_synth_length, amp: pedal_synth_amp*(1-norm)
    
    osc "/pedal3",  (1-norm)**3
    sample :drum_cymbal_pedal, amp: (1-norm)**3
    
    sleep interval
    osc "/snare3",  0
    osc "/pedal3",  0
    
    # 4
    print "#", i, "interval", interval
    
    use_synth :dsaw
    
    osc "/pedal_synth4",  norm
    play pedal_synth, release: pedal_synth_length , amp: pedal_synth_amp * norm
    
    osc "/pedal4",  norm
    sample :drum_cymbal_pedal, amp: norm
    
    sleep interval
    osc "/pedal4",  0
    
    # 5
    print "#", i, "interval", interval
    
    use_synth :dsaw
    
    osc "/kick_synth5",  norm
    play kick_synth, release: kick_synth_length , amp: kick_synth_amp * norm
    
    
    osc "/kick5",  norm
    sample :bd_808, amp: 2 * norm
    
    
    use_synth :dsaw
    
    with_fx :reverb, amp: 1 do
      osc "/snare_synth5",  (1-norm)
      play snare_synth -(cycle-i)/2, release: snare_synth_length , amp: snare_synth_amp * (1-norm)

      osc "/snare5",  (1-norm)**3
      sample :drum_snare_soft, amp: (1-norm)**3
    end

    sleep interval
    osc "/snare5",  0
    osc "/kick5",   0

    # 6
      print "#", i, "interval", interval
      
      use_synth :dsaw
      osc "/pedal_synth6",  norm
      play pedal_synth, release: pedal_synth_length , amp: pedal_synth_amp * norm
      
      osc "/pedal6",  norm
      sample :drum_cymbal_pedal, amp: norm
      
      sleep interval
      osc "/pedal6",  0
      
      # 7
      print "#", i, "interval", interval
      
      use_synth :dsaw
      osc "/snare_synth7",  norm
      play snare_synth, release: snare_synth_length , amp: snare_synth_amp * norm
      
      osc "/snare7",  norm**3
      sample :drum_snare_soft, amp: norm**3
      
      use_synth :dsaw
      osc "/pedal_synth7",  (1-norm)
      play pedal_synth-(cycle-i), release: pedal_synth_length , amp: pedal_synth_amp * (1-norm)
      
      osc "/pedal7",  (1-norm)**3
      sample :drum_cymbal_pedal, amp: (1-norm)**3
      
      sleep interval
      osc "/snare7",  0
      osc "/pedal7",  0
      
      # 8
      print "#", i, "interval", interval
      
      use_synth :dsaw
      osc "/pedal_synth8",  norm
      play pedal_synth, release: pedal_synth_length , amp: pedal_synth_amp * norm
      
      osc "/pedal8",  norm
      sample :drum_cymbal_pedal, amp: norm
      
      sleep interval
      osc "/pedal8",  0
      
      i += 1
      
    end
  end
  
