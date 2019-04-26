############################
#  Resynthesizes all the sound files in the
#  specified directory to have flat pitch
#  of the specified frequency.  Files are
#  saved in a specified directory.
############################

form Resynthize files to have flat pitch
	text wavFileLoc
	text txtFileLoc
	positive lwPitchBnd
	positive upPitchBnd
	positive curTrial
	positive numTrial
endform

writeFileLine: "'txtFileLoc$'", ""

#A sound file is opened from the listing:
Read from file... 'wavFileLoc$'
sound_one$ = selected$ ("Sound")

start = Get start time
end   = Get end time

To Pitch (ac)... 0.001 lwPitchBnd 15 off 0.03 0.45 0.02 0.35 0.14 upPitchBnd

for i to (end - start)/0.005
    time = start + i * 0.005
    pitch = Get value at time... time Hertz Linear
    appendFileLine: "'txtFileLoc$'", "'time' 'pitch'"
endfor
	
#fappendinfo 'txtFileLoc$'

select all
Remove
#clearinfo

if curTrial = numTrial
Quit
endif