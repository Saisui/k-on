module MuScale
    FIVES_DG   = [1, 2, 3, 5, 6]
    DEGREES    = [1, 2, 3, 4, 5, 6, 7]
    # CHURCH SCALE
    DIATONIC   = [0, 2, 4, 5, 7, 9, 11]
    # take *(2..8)
    DORIAN     = [0, 2, 3, 5, 7, 9, 10]
    PHRYGIAN   = [0, 1, 3, 5, 7, 8, 10]
    LYDIAN     = [0, 2, 4, 6, 7, 9, 11]
    MIXOLYDIAN = [0, 2, 4, 5, 7, 9, 10]
    AERION     = [0, 2, 3, 5, 7, 8, 10]
    LOCRIAN    = [0, 1, 3, 5, 6, 8, 10]
    # DIATONIC = ("101011010101"<<"b0").reverse.to_i(2)
    # OTHERS SCALE
end

Fst_pitch_freq = 22.5
Equaly = 12
Base_pitch_freq = 440
Nows = MuScale::DIATONIC ## nowa scale